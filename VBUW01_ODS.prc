CREATE OR REPLACE PROCEDURE AMS.VBUW01_ODS(p_tu    date,
                                       p_den   date,
                                       p_macty varchar2,
                                       p_ngay  date default null,
                                       p_user varchar2 default null) IS
  /*
         --chinhlk 30/6/2010: chinh lai cot co ap dung phi phu troi them dieu kien vao de load cho dung
                                            chinh lai cot  chap nhan voi phi chuan de load theo dung yeu cau anh Hieu
           chinhlk 29/10/2010 them code de tinh cho ca tong cong ty
           chinhlk 5/11/2010 sua doi toan bo dung qua bang ams.rp_daily khong dung cac ham outletstructure de tuning bao cao theo huong dan cua Hieu
                                           chinh lai insert cty_id thay cho p_macty de tinh cho ca tong cong ty voi tat ca cac chi tieu
           chinhlk 7/11/2010 sua and  a.effective_date  <=  act.bus_processed_date thanh and trunc(a.effective_date) <= trunc(act.bus_processed_date)
                                           de vi trong he thong ODS a.effective_date duoc lam tron den 12 AM nen phai dung trunc de xu ly cho chinh xac
           chinhlk 15/11/2010 them p_user vao de luu thong tin ve user chay bao cao vao bang rp_chaybc
     */
  v_ngaychay date := nvl(p_ngay, trunc(sysdate));
  v_stt      number := 0;
  err        varchar2(1000);
  --bien test
  test_v_time varchar2(50);
  test_start_time varchar2(50);
  test_finish_time varchar2(50);
BEGIN

     --Khong duoc thuc hien lenh commit den cuoi thu tuc
     --Xac dinh GYC trong ky bao cao
     insert into TMP_BK_BK09_GYC
     (
          CTY_ID          ,
          PHONG_ID        ,
          BAN_ID          ,
          NHOM_ID         ,
          DL_ID          ,
          HD_ID           ,
          SO_YC           ,
          NGAY_YC         ,
          TEN             ,
          LOAINGAYBC      ,
          IS_REVERSED     ,
          ACCOUNT_ID
      )
      select
            dl.company_code as cty_id, --cong ty
            dl.sales_office_code as phong_id, --phong kinh doanh
            dl.sales_agency_code as ban_id, --ban kinh doanh
            dl.sales_unit_code   as nhom_id, --nhom kinh doanh
            dl.outlet_number dl_id,
            acc.account_number hd_id,
            af.application_number so_yc,
            actaf.bus_processed_date ngay_yc,
            clt.name   TEN,
            0 loaingaybc,
            1 is_reversed,
            acc.account_id
       from ods.account acc
           join ods.application_form af on acc.account_id = af.account_id
           -- Xac dinh GYC nhap trong khoang thoi gian bao cao gan voi GYC
           join ods.activity actaf on actaf.account_id = acc.account_id
                                   and actaf.activity_id = af.activity_id
                                   and actaf.status_code = 'PIF'
                                   and trunc(actaf.bus_processed_date) >= trunc(p_tu)
                                   and trunc(actaf.bus_processed_date) <= trunc(p_den)
                                     --GYC dau tien gan voi A000
                                   and actaf.activity_id = (select min(aa.activity_id) from ods.activity aa
                                                             where aa.activity_code = 'A000'
                                                                   and aa.account_id = acc.account_id
                                                                   and aa.status_code ='PIF'
                                                                   -- ACT co ton tai trong App form
                                                                   and exists (select 1 from ods.application_form app
                                                                                      where app.account_id = acc.account_id
                                                                                      and app.activity_id = aa.activity_id)
                                                                   and not exists (select 1 from ods.activity actrv
                                                                                    where actrv.account_id = acc.account_id
                                                                                          and actrv.reversed_acti_id = aa.activity_id
                                                                                          and trunc(actrv.bus_processed_date) <=  trunc(p_den)))
           -- Xac dinh thong tin dai ly chuyen thu
           join ods.account_outlet_relationship aor on acc.account_id = aor.account_id
                                         and aor.relationship_type_code = 'SERV'
                                         and aor.account_outlet_id =(select max (a.account_outlet_id)
                                                                    from ods.account_outlet_relationship a
                                                                    where a.account_id=acc.account_id
                                                                          and trunc(a.effective_date) <= trunc(p_den)
                                                                          and a.relationship_type_code ='SERV')
           join ams.rp_daily dl on dl.outlet_id = aor.outlet_client_id
                            and (
                                (p_macty is null)
                                or
                                (p_macty is not null and dl.company_code = p_macty)
                            )
                            and ((dl.from_date <= trunc(p_den) and trunc(p_den) < nvl(dl.to_date, '01/jan/3000')) )
           join ods.product pro on pro.product_id = acc.product_id
           -- Nguoi tham gia bao hiem
           join ods.client_account_relationship car on car.account_id = acc.account_id
                                                    and car.primary_relationship_flag='Y'
                                                    and car.relationship_type_code = 'OWNR'
           join ods.client clt on clt.client_id = car.client_id
           ;

      --Tinh GYC co OR chi dinh thuoc cac nhom - OR co chua duoc giai quyet
      insert into TMP_BK_BK09_OR
          (ACCOUNT_ID, CT_ID, STATUS)
          select distinct acta.account_id, dm.nhom_id CT_ID , 0 STATUS
                 from ods.requirement rq, ods.activity acta, rp_tct_danhmuc dm
                      where rq.requirement_code  = dm.ma_dm
                            and dm.nhom_id in ('ORTD', 'ORKTSK', 'ORKTSKBS', 'ORBSTTUW')
                            and trunc(rq.raised_date) <= trunc(p_den)
                            and ((rq.completed_date is null and rq.stat_code ='OPEN')
                            or (rq.completed_date is not null and trunc(rq.completed_date) > trunc(p_den)))
                            and nvl(rq.stat_code,'null') <> 'CANC'
                            and rq.activity_id = acta.activity_id
                            -- Loai bo toan bo OR thuoc khoang thoi gian hanh dong va undo hanh dong
                            and not exists (select 1 from ods.activity actb , ods.activity actc
                                           --Hanh dong undo xay ra den ngay chay bao cao
                                           where trunc(actc.bus_processed_date) <= trunc(p_den)
                                           and actb.activity_id = actc.reversed_acti_id
                                           and actb.bus_processed_date <= rq.raised_date
                                           and actc.bus_processed_date >= rq.raised_date
                                           and actb.account_id = acta.account_id
                                           );
      --Tinh GYC co OR chi dinh thuoc cac nhom da duoc giai quyet
      insert into TMP_BK_BK09_OR
          (ACCOUNT_ID, CT_ID, STATUS)
          select distinct acta.account_id, dm.nhom_id CT_ID , 1 STATUS
                 from ods.requirement rq, ods.activity acta, rp_tct_danhmuc dm
                      where rq.requirement_code  = dm.ma_dm
                            and rq.activity_id = acta.activity_id
                            and dm.nhom_id in ('ORTD', 'ORKTSK', 'ORKTSKBS', 'ORBSTTUW')
                            and trunc(rq.raised_date) >= trunc(p_tu)
                            and trunc(rq.raised_date) <= trunc(p_den)
                            and trunc(rq.completed_date) <= trunc(p_den)
                            and rq.stat_code in ('CLOS', 'RESO') -- Da kiem tra suc khoe
                            and rq.stat_code <> 'CANC'
                            -- Lay tat ca cac truong hop
                            -- Loai bo toan bo OR thuoc khoang thoi gian hanh dong va undo hanh dong
                            and not exists (select 1 from ods.activity actb , ods.activity actc
                                            --Hanh dong undo xay ra den het thoi diem bao cao
                                             where trunc(actc.bus_processed_date) <= trunc(p_den)
                                                   and actb.activity_id = actc.reversed_acti_id
                                                   and actb.bus_processed_date <= rq.raised_date
                                                   and actc.bus_processed_date >= rq.raised_date
                                                   and actb.account_id = acta.account_id
                                                   );
  --test voi doan 1
  select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_start_time from dual;
  rp_capnhat_chaybc(p_macty, p_ngay, p_tu, p_den,'Test_VBUW01_1', 1, p_user);

  -- insert cho column tk_sohd_gycps: So giay yeu cau phat sinh
  v_stt := 5;
  insert into nt_giatrictbc
    (ct_id,
     giatri,
     donvi,
     ngaychay,
     tungay,
     denngay,
     cty_id,
     vpdd_id,
     ban_id,
     nhom_id,
     ods_flag)
    (select 'tk_sohd_gycps',
            nvl(count(*), 0) as giatri,
            'cai',
            v_ngaychay,
            p_tu,
            p_den,
            cty_id,
            gyc.phong_id vpdd_id,
            ban_id,
            nhom_id,
            1
     from TMP_BK_BK09_GYC gyc
     group by gyc.cty_id, gyc.phong_id, ban_id, nhom_id);

   select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_finish_time from dual;
   test_v_time :=thoigian(test_start_time,test_finish_time);
   rp_capnhat_chaybc(p_macty, p_ngay, p_tu, p_den, 'Test_VBUW01_1', 0, p_user,  test_start_time, test_finish_time, test_v_time);

   --2
   test_start_time := test_finish_time;
   rp_capnhat_chaybc(p_macty, p_ngay, p_tu, p_den, 'Test_VBUW01_2',  1, p_user);


  -- insert cho column tk_cnbhtd - Giay yeu cau chap nhan bao hiem tu dong
  v_stt:=6;
  insert into nt_giatrictbc
  (ct_id,giatri,donvi,ngaychay,tungay,denngay,cty_id,vpdd_id,ban_id,nhom_id,ods_flag)
  (select
          'tk_cnbhtd' ct_id,
          count(*)    giatri,
          'cai'       donvi,
          v_ngaychay,p_tu,p_den,
          gyc.cty_id, --cong ty
          gyc.phong_id as vpdd_id, --phong kinh doanh
          gyc.ban_id, --ban kinh doanh
          gyc.nhom_id,  --nhom kinh doanh
          1 ods_flag
    from TMP_BK_BK09_GYC gyc
    where
         -- Hop dong da duoc chap nhan
          exists (select 1 from ods.activity a
                  where
                       a.account_id = gyc.account_id
                       and a.activity_code = 'P015' -- Chap nhan bao hiem voi phi chuan(Accept at Ordinary Rates)
                       and trunc(a.bus_processed_date) >= trunc(p_tu)
                       and trunc(a.bus_processed_date) <= trunc(p_den)
                       -- xay ra truoc khi phat hanh hop dong
                       and not exists (select 1 from ods.activity gh
                                       where gh.account_id = gyc.account_id
                                       and gh.activity_code = 'A100'
                                       and gh.activity_id < a.activity_id
                                       -- Khong ton tai giao dich Undo trong ky
                                       and not exists (select 1 from ods.activity gj
                                                      where gj.reversed_acti_id = gh.activity_id
                                                      and gj.account_id = gyc.account_id
                                                      and trunc(gj.bus_processed_date) <= trunc(p_den) ))
                       -- Khong ton tai giao dich Undo trong ky
                       and not exists (select 1 from ods.activity gk
                                      where gk.reversed_acti_id = a.activity_id
                                            and gk.account_id = gyc.account_id
                                            and trunc(gk.bus_processed_date) <= trunc(p_den) )
                     )
          -- GYC ko co OR thuoc kiem tra suc khoe
          and not exists ( select 1 from TMP_BK_BK09_OR ors
                           where ors.account_id = gyc.account_id
                                 and ors.ct_id in ('ORTD', 'ORKTSK', 'ORKTSKBS', 'ORBSTTUW')
                            )
      group by cty_id, gyc.phong_id, ban_id, nhom_id);


   select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_finish_time from dual;
   test_v_time :=thoigian(test_start_time,test_finish_time);
   rp_capnhat_chaybc(p_macty, p_ngay, p_tu, p_den, 'Test_VBUW01_2', 0, p_user,  test_start_time, test_finish_time, test_v_time);

   --2
   test_start_time := test_finish_time;
   rp_capnhat_chaybc(p_macty, p_ngay, p_tu, p_den, 'Test_VBUW01_3',  1, p_user);

  -- insert cho column tk_cnbhtd_tyle - Giay yeu cau chap nhan bao hiem tu dong
  --v_stt:=7;
  -- = (6/5)*100
  -- Tinh toan tren Crystal report

  -- insert cho column tk_dgrr_maunual - Giay yeu cau danh gia rui ro manual
  --v_stt := 8;
  -- = (5 - 6)
  -- Tinh toan tren Crystal report

  -- insert cho column tk_dgrr_maunual_tyle - Giay yeu cau danh gia rui ro manual
  --v_stt:=9;
  -- = (8/5)*100
  -- Tinh toan tren Crystal report

  -- insert cho column gyc_cnbh_phichuan Khong chi dinh kiem tra suc khoe - CNBH voi phi chuan
  v_stt := 10;
  insert into nt_giatrictbc
    (ct_id,
     giatri,
     donvi,
     ngaychay,
     tungay,
     denngay,
     cty_id,
     vpdd_id,
     ban_id,
     nhom_id,
     ods_flag)
     (select
          'gyc_cnbh_phichuan' ct_id,
          count(*)    giatri,
          'cai'       donvi,
          v_ngaychay,p_tu,p_den,
          gyc.cty_id, --cong ty
          gyc.phong_id as vpdd_id, --phong kinh doanh
          gyc.ban_id, --ban kinh doanh
          gyc.nhom_id,  --nhom kinh doanh
          1 ods_flag
    from TMP_BK_BK09_GYC gyc
    where
         -- Hop dong da duoc chap nhan
          exists (select 1 from ods.activity a
                  where
                       a.account_id = gyc.account_id
                       and
                             (
                                 a.activity_code = 'P015' -- Chap nhan bao hiem voi phi chuan(Accept at Ordinary Rates)
                                 or   --chinhlk 30/6/2010 them ca  truong hop
                                      --chap nhan bao hiem co dieu kien co loai tru di truong hop co ap dung phi phu troi
                                      --theo yeu cau anh Hieu
                                 (
                                    a.activity_code = 'P017'
                                    and not exists
                                    (
                                        select 1
                                        from ods.activity_benefit_link abl join ods.benefit ben on abl.benefit_id = ben.benefit_id
                                            join ods.rider rid on rid.benefit_id = ben.benefit_id
                                        where abl.activity_id = a.activity_id --lay ma activity day vao
                                            and rid.total_extra_premium > 0
                                            and rid.status_code <> 'OF'
                                     )
                                 )
                             )
                       and trunc(a.bus_processed_date) >= trunc(p_tu)
                       and trunc(a.bus_processed_date) <= trunc(p_den)
                       -- xay ra truoc khi phat hanh hop dong
                       and not exists (select 1 from ods.activity gh
                                       where gh.account_id = gyc.account_id
                                       and gh.activity_code = 'A100'
                                       and gh.activity_id < a.activity_id
                                       -- Khong ton tai giao dich Undo trong ky
                                       and not exists (select 1 from ods.activity gj
                                                      where gj.reversed_acti_id = gh.activity_id
                                                      and gj.account_id = gyc.account_id
                                                      and trunc(gj.bus_processed_date) <= trunc(p_den) ))
                       -- Khong ton tai giao dich Undo trong ky
                       and not exists (select 1 from ods.activity gk
                                      where gk.reversed_acti_id = a.activity_id
                                            and gk.account_id = gyc.account_id
                                            and trunc(gk.bus_processed_date) <= trunc(p_den) )
                     )
          -- Khong co OS ve kiem tra suc khoe
          and not exists ( select 1 from TMP_BK_BK09_OR ors
                           where ors.account_id = gyc.account_id
                                 and ors.ct_id in ('ORKTSK', 'ORKTSKBS')
                            )
          -- Không thu?c vào CNBH Tu dong = OR thuoc ORTD, ORBSTTUW
          and  exists ( select 1 from TMP_BK_BK09_OR ors
                           where ors.account_id = gyc.account_id
                                 and ors.ct_id in ('ORTD', 'ORBSTTUW')
                            )
      group by cty_id, gyc.phong_id, ban_id, nhom_id);

   select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_finish_time from dual;
   test_v_time :=thoigian(test_start_time,test_finish_time);
   rp_capnhat_chaybc(p_macty, p_ngay, p_tu, p_den, 'Test_VBUW01_3', 0, p_user,  test_start_time, test_finish_time, test_v_time);

   --4
   test_start_time := test_finish_time;
   rp_capnhat_chaybc(p_macty, p_ngay, p_tu, p_den, 'Test_VBUW01_4',  1, p_user);

  -- insert cho column gyc_cnbh_phiphutroi Khong chi dinh kiem tra suc khoe - CNBH voi phi phu troi
  v_stt := 11;
  insert into nt_giatrictbc
    (ct_id,
     giatri,
     donvi,
     ngaychay,
     tungay,
     denngay,
     cty_id,
     vpdd_id,
     ban_id,
     nhom_id,
     ods_flag)
     (select
          'gyc_cnbh_phiphutroi' ct_id,
          count(*)    giatri,
          'cai'       donvi,
          v_ngaychay,p_tu,p_den,
          gyc.cty_id, --cong ty
          gyc.phong_id as vpdd_id, --phong kinh doanh
          gyc.ban_id, --ban kinh doanh
          gyc.nhom_id,  --nhom kinh doanh
          1 ods_flag
    from TMP_BK_BK09_GYC gyc
    where
         -- Hop dong da duoc chap nhan
          exists (select 1 from ods.activity a
                  where
                       a.account_id = gyc.account_id
                       and a.activity_code = 'P017'
                       and trunc(a.bus_processed_date) >= trunc(p_tu)
                       and trunc(a.bus_processed_date) <= trunc(p_den)
                       --Gia tri phu troi >0
                       and exists
                             (
                                  select 1
                                  from ods.activity_benefit_link abl join ods.benefit ben on abl.benefit_id = ben.benefit_id
                                      join ods.rider rid on rid.benefit_id = ben.benefit_id
                                  where abl.activity_id = a.activity_id --lay ma activity day vao
                                      and rid.total_extra_premium > 0
                                      and rid.status_code <> 'OF'
                             )
                       -- xay ra truoc khi phat hanh hop dong
                       and not exists (select 1 from ods.activity gh
                                       where gh.account_id = gyc.account_id
                                       and gh.activity_code = 'A100'
                                       and gh.activity_id < a.activity_id
                                       -- Khong ton tai giao dich Undo trong ky
                                       and not exists (select 1 from ods.activity gj
                                                      where gj.reversed_acti_id = gh.activity_id
                                                      and gj.account_id = gyc.account_id
                                                      and trunc(gj.bus_processed_date) <= trunc(p_den) ))
                       -- Khong ton tai giao dich Undo trong ky
                       and not exists (select 1 from ods.activity gk
                                      where gk.reversed_acti_id = a.activity_id
                                            and gk.account_id = gyc.account_id
                                            and trunc(gk.bus_processed_date) <= trunc(p_den) )
                     )
            -- GYC ko co OR thuoc kiem tra suc khoe
            and not exists ( select 1 from TMP_BK_BK09_OR ors
                             where ors.account_id = gyc.account_id
                                   and ors.ct_id in ('ORKTSK', 'ORKTSKBS')
                              )
      group by cty_id, gyc.phong_id, ban_id, nhom_id);


   select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_finish_time from dual;
   test_v_time :=thoigian(test_start_time,test_finish_time);
   rp_capnhat_chaybc(p_macty, p_ngay, p_tu, p_den, 'Test_VBUW01_4', 0, p_user,  test_start_time, test_finish_time, test_v_time);

   --5
   test_start_time := test_finish_time;
   rp_capnhat_chaybc(p_macty, p_ngay, p_tu, p_den, 'Test_VBUW01_5',  1, p_user);


  -- insert cho column gyc_kcnbh Khong chi dinh kiem tra suc khoe - Khong CNBH
  v_stt := 12;
  insert into nt_giatrictbc
    (ct_id,
     giatri,
     donvi,
     ngaychay,
     tungay,
     denngay,
     cty_id,
     vpdd_id,
     ban_id,
     nhom_id,
     ods_flag)
     (select
          'gyc_kcnbh' ct_id,
          count(*)    giatri,
          'cai'       donvi,
          v_ngaychay,p_tu,p_den,
          gyc.cty_id, --cong ty
          gyc.phong_id as vpdd_id, --phong kinh doanh
          gyc.ban_id, --ban kinh doanh
          gyc.nhom_id,  --nhom kinh doanh
          1 ods_flag
    from TMP_BK_BK09_GYC gyc
    where
         -- Hop dong khong chap nhan BH
          exists (select 1 from ods.activity a
                  where
                       a.account_id = gyc.account_id
                       and a.activity_code in ('P020', --T? ch?i ch?p nh?n b?o hi?m vì lý do s?c kh?e
                                                         'P018',--T? ch?i ch?p nh?n b?o hi?m vì lý do tài chính
                                                         'P021',--T? ch?i ch?p nh?n b?o hi?m vì lý do ngh? nghi?p
                                                         'P022',--T? ch?i ch?p nh?n b?o hi?m vì lý do khác
                                                         'P023',--Trì hoãn ch?p nh?n b?o hi?m vì lý do s?c kh?e
                                                         'P024') --Trì hoãn ch?p nh?n b?o hi?m vì lý do khác
                                --and a.activity_code in ('P011', -- Khong chap nhan bao hiem (Decline Benefit)
                                --                           'P012', -- Tri hoan (Defer Cover)
                                --                           'NTU5', -- Tri hoan (X mnths Occup)
                                --                           'NTU3', -- Tri hoan (X mnths Medical)
                                --                           'NTU4') -- Tri hoan (Defer Medically)*/
                       and trunc(a.bus_processed_date) >= trunc(p_tu)
                       and trunc(a.bus_processed_date) <= trunc(p_den)
                       and a.status_code  =  'OF'
                       -- xay ra truoc khi phat hanh hop dong
                       and not exists (select 1 from ods.activity gh
                                       where gh.account_id = gyc.account_id
                                       and gh.activity_code = 'A100'
                                       and gh.activity_id < a.activity_id
                                       -- Khong ton tai giao dich Undo trong ky
                                       and not exists (select 1 from ods.activity gj
                                                      where gj.reversed_acti_id = gh.activity_id
                                                      and gj.account_id = gyc.account_id
                                                      and trunc(gj.bus_processed_date) <= trunc(p_den) ))
                       -- Khong ton tai giao dich Undo trong ky
                       and not exists (select 1 from ods.activity gk
                                      where gk.reversed_acti_id = a.activity_id
                                            and gk.account_id = gyc.account_id
                                            and trunc(gk.bus_processed_date) <= trunc(p_den) )
                     )
            -- GYC ko co OR thuoc kiem tra suc khoe
            and not exists ( select 1 from TMP_BK_BK09_OR ors
                             where ors.account_id = gyc.account_id
                                   and ors.ct_id in  ('ORKTSK', 'ORKTSKBS')
                              )
      group by cty_id, gyc.phong_id, ban_id, nhom_id);


   select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_finish_time from dual;
   test_v_time :=thoigian(test_start_time,test_finish_time);
   rp_capnhat_chaybc(p_macty, p_ngay, p_tu, p_den, 'Test_VBUW01_5', 0, p_user,  test_start_time, test_finish_time, test_v_time);

   --6
   test_start_time := test_finish_time;
   rp_capnhat_chaybc(p_macty, p_ngay, p_tu, p_den, 'Test_VBUW01_6',  1, p_user);

  -- insert cho column tong_gyc_kcdktsk Khong chi dinh kiem tra suc khoe - Tong giay yeu cau khong chi dinh kiem tra suc khoe
  -- v_stt:=13;
  -- = 10+ 11 + 12
  -- Tinh toan tren cau lenh select ra ngoai Crystal report

  -- insert cho column tong_gyc_kcdktsk_tyle Khong chi dinh kiem tra suc khoe - Tong giay yeu cau khong chi dinh kiem tra suc khoe
  --v_stt:=14;
  -- = (13/5)*100
  -- Tinh toan tren Crystal report

  -- insert cho column tong_gyc_cdktsk Co chi dinh kiem tra suc khoe - Tong giay yeu cau chi dinh kiem tra suc khoe
  v_stt := 15;
  insert into nt_giatrictbc
    (ct_id,
     giatri,
     donvi,
     ngaychay,
     tungay,
     denngay,
     cty_id,
     vpdd_id,
     ban_id,
     nhom_id,
     ods_flag)
      (select
          'tong_gyc_cdktsk' ct_id,
          count(*)    giatri,
          'cai'       donvi,
          v_ngaychay,p_tu,p_den,
          gyc.cty_id, --cong ty
          gyc.phong_id as vpdd_id, --phong kinh doanh
          gyc.ban_id, --ban kinh doanh
          gyc.nhom_id,  --nhom kinh doanh
          1 ods_flag
    from TMP_BK_BK09_GYC gyc
    where
            -- GYC co OR thuoc kiem tra suc khoe
            exists ( select 1 from TMP_BK_BK09_OR ors
                     where ors.account_id = gyc.account_id
                           and ors.ct_id in  ('ORKTSK', 'ORKTSKBS')
                      )
      group by cty_id, gyc.phong_id, ban_id, nhom_id);

   select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_finish_time from dual;
   test_v_time :=thoigian(test_start_time,test_finish_time);
   rp_capnhat_chaybc(p_macty, p_ngay, p_tu, p_den, 'Test_VBUW01_6', 0, p_user,  test_start_time, test_finish_time, test_v_time);

   --7
   test_start_time := test_finish_time;
   rp_capnhat_chaybc(p_macty, p_ngay, p_tu, p_den, 'Test_VBUW01_7',  1, p_user);

  -- insert cho column tong_gyc_cdktsk_tyle Co chi dinh kiem tra suc khoe - Tong giay yeu cau chi dinh kiem tra suc khoe
  --v_stt:=16;
  -- = (15/5)*100
  -- Tinh toan tren Crystal report

  -- insert cho column tong_gyc_daktsk Co chi dinh kiem tra suc khoe - Tong so kiem tra suc khoe
  v_stt := 17;
  insert into nt_giatrictbc
    (ct_id,
     giatri,
     donvi,
     ngaychay,
     tungay,
     denngay,
     cty_id,
     vpdd_id,
     ban_id,
     nhom_id,
     ods_flag)
   (select
          'tong_gyc_daktsk' ct_id,
          count(*)    giatri,
          'cai'       donvi,
          v_ngaychay,p_tu,p_den,
          gyc.cty_id, --cong ty
          gyc.phong_id as vpdd_id, --phong kinh doanh
          gyc.ban_id, --ban kinh doanh
          gyc.nhom_id,  --nhom kinh doanh
          1 ods_flag
    from TMP_BK_BK09_GYC gyc
    where
            -- GYC co OR thuoc kiem tra suc khoe va da duoc giai quyet
            exists ( select 1 from TMP_BK_BK09_OR ors
                     where ors.account_id = gyc.account_id
                           and ors.ct_id in  ('ORKTSK', 'ORKTSKBS')
                           and ors.status = 1
                      )
      group by cty_id, gyc.phong_id, ban_id, nhom_id);


   select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_finish_time from dual;
   test_v_time :=thoigian(test_start_time,test_finish_time);
   rp_capnhat_chaybc(p_macty, p_ngay, p_tu, p_den, 'Test_VBUW01_7', 0, p_user,  test_start_time, test_finish_time, test_v_time);

   --8
   test_start_time := test_finish_time;
   rp_capnhat_chaybc(p_macty, p_ngay, p_tu, p_den, 'Test_VBUW01_8',  1, p_user);

  -- insert cho column tong_gyc_daktsk_tyle Co chi dinh kiem tra suc khoe - Tong so kiem tra suc khoe
  --v_stt:=18;
  -- = (17/5)*100
  -- Tinh toan tren Crystal report

  -- insert cho column gyc_cnbh_phichuan_cktsk Co chi dinh kiem tra suc khoe - Chap nhan bao hiem voi phi chuan
  v_stt := 19;
  insert into nt_giatrictbc
    (ct_id,
     giatri,
     donvi,
     ngaychay,
     tungay,
     denngay,
     cty_id,
     vpdd_id,
     ban_id,
     nhom_id,
     ods_flag)
    (select
          'gyc_cnbh_phichuan_cktsk' ct_id,
          count(*)    giatri,
          'cai'       donvi,
          v_ngaychay,p_tu,p_den,
          gyc.cty_id, --cong ty
          gyc.phong_id as vpdd_id, --phong kinh doanh
          gyc.ban_id, --ban kinh doanh
          gyc.nhom_id,  --nhom kinh doanh
          1 ods_flag
    from TMP_BK_BK09_GYC gyc
    where
         -- Hop dong da duoc chap nhan phi chuan
          exists (select 1 from ods.activity a
                  where
                       a.account_id = gyc.account_id
                       and
                             (
                                 a.activity_code = 'P015' -- Chap nhan bao hiem voi phi chuan(Accept at Ordinary Rates)
                                 or   --Ghi nhan them CNBH Phu troi = 0
                                 (
                                    a.activity_code = 'P017'
                                    and not exists
                                    (
                                        select 1
                                        from ods.activity_benefit_link abl join ods.benefit ben on abl.benefit_id = ben.benefit_id
                                            join ods.rider rid on rid.benefit_id = ben.benefit_id
                                        where abl.activity_id = a.activity_id --lay ma activity day vao
                                            and rid.total_extra_premium > 0
                                            and rid.status_code <> 'OF'
                                     )
                                 )
                             )
                       and trunc(a.bus_processed_date) >= trunc(p_tu)
                       and trunc(a.bus_processed_date) <= trunc(p_den)
                       -- xay ra truoc khi phat hanh hop dong
                       and not exists (select 1 from ods.activity gh
                                       where gh.account_id = gyc.account_id
                                       and gh.activity_code = 'A100'
                                       and gh.activity_id < a.activity_id
                                       -- Khong ton tai giao dich Undo trong ky
                                       and not exists (select 1 from ods.activity gj
                                                      where gj.reversed_acti_id = gh.activity_id
                                                      and gj.account_id = gyc.account_id
                                                      and trunc(gj.bus_processed_date) <= trunc(p_den) ))
                       -- Khong ton tai giao dich Undo trong ky
                       and not exists (select 1 from ods.activity gk
                                      where gk.reversed_acti_id = a.activity_id
                                            and gk.account_id = gyc.account_id
                                            and trunc(gk.bus_processed_date) <= trunc(p_den) )
                     )
            -- GYC co OR thuoc kiem tra suc khoe va da duoc giai quyet
           and exists ( select 1 from TMP_BK_BK09_OR ors
                     where ors.account_id = gyc.account_id
                           and ors.ct_id in  ('ORKTSK', 'ORKTSKBS')
                           and ors.status = 1
                      )
      group by cty_id, gyc.phong_id, ban_id, nhom_id);


   select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_finish_time from dual;
   test_v_time :=thoigian(test_start_time,test_finish_time);
   rp_capnhat_chaybc(p_macty, p_ngay, p_tu, p_den, 'Test_VBUW01_8', 0, p_user,  test_start_time, test_finish_time, test_v_time);

   --9
   test_start_time := test_finish_time;
   rp_capnhat_chaybc(p_macty, p_ngay, p_tu, p_den, 'Test_VBUW01_9',  1, p_user);

  -- insert cho column gyc_cnbh_phichuan_cktsk_tyle Co chi dinh kiem tra suc khoe - Chap nhan bao hiem voi phi chuan
  --v_stt:=20;
  -- = (19/5)*100
  -- Tinh toan tren Crystal report

  -- insert cho column gyc_cnbh_phiphutroi_cktsk Co chi dinh kiem tra suc khoe - Chap nhan bao hiem voi phi phu troi
  v_stt := 21;
  insert into nt_giatrictbc
    (ct_id,
     giatri,
     donvi,
     ngaychay,
     tungay,
     denngay,
     cty_id,
     vpdd_id,
     ban_id,
     nhom_id,
     ods_flag)
    (select
          'gyc_cnbh_phiphutroi_cktsk' ct_id,
          count(*)    giatri,
          'cai'       donvi,
          v_ngaychay,p_tu,p_den,
          gyc.cty_id, --cong ty
          gyc.phong_id as vpdd_id, --phong kinh doanh
          gyc.ban_id, --ban kinh doanh
          gyc.nhom_id,  --nhom kinh doanh
          1 ods_flag
    from TMP_BK_BK09_GYC gyc
    where
         -- Hop dong da duoc chap nhan phi phu troi
          exists (select 1 from ods.activity a
                  where
                       a.account_id = gyc.account_id
                       and a.activity_code = 'P017'
                       and exists
                          (
                              select 1
                              from ods.activity_benefit_link abl join ods.benefit ben on abl.benefit_id = ben.benefit_id
                                  join ods.rider rid on rid.benefit_id = ben.benefit_id
                              where abl.activity_id = a.activity_id --lay ma activity day vao
                                  and rid.total_extra_premium > 0
                                  and rid.status_code <> 'OF'
                           )
                       and trunc(a.bus_processed_date) >= trunc(p_tu)
                       and trunc(a.bus_processed_date) <= trunc(p_den)
                       -- xay ra truoc khi phat hanh hop dong
                       and not exists (select 1 from ods.activity gh
                                       where gh.account_id = gyc.account_id
                                       and gh.activity_code = 'A100'
                                       and gh.activity_id < a.activity_id
                                       -- Khong ton tai giao dich Undo trong ky
                                       and not exists (select 1 from ods.activity gj
                                                      where gj.reversed_acti_id = gh.activity_id
                                                      and gj.account_id = gyc.account_id
                                                      and trunc(gj.bus_processed_date) <= trunc(p_den) ))
                       -- Khong ton tai giao dich Undo trong ky
                       and not exists (select 1 from ods.activity gk
                                      where gk.reversed_acti_id = a.activity_id
                                            and gk.account_id = gyc.account_id
                                            and trunc(gk.bus_processed_date) <= trunc(p_den) )
                     )
            -- GYC co OR thuoc kiem tra suc khoe va da duoc giai quyet
            and exists ( select 1 from TMP_BK_BK09_OR ors
                     where ors.account_id = gyc.account_id
                           and ors.ct_id in  ('ORKTSK', 'ORKTSKBS')
                           and ors.status = 1
                      )
      group by cty_id, gyc.phong_id, ban_id, nhom_id);



   select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_finish_time from dual;
   test_v_time :=thoigian(test_start_time,test_finish_time);
   rp_capnhat_chaybc(p_macty, p_ngay, p_tu, p_den, 'Test_VBUW01_9', 0, p_user,  test_start_time, test_finish_time, test_v_time);

   --10
   test_start_time := test_finish_time;
   rp_capnhat_chaybc(p_macty, p_ngay, p_tu, p_den, 'Test_VBUW01_10',  1, p_user);

  -- insert cho column gyc_cnbh_phiphutroi_cktsk_tyle Co chi dinh kiem tra suc khoe - Chap nhan bao hiem voi phi phu troi
  --v_stt:=22;
  -- = (21/5)*100
  -- Tinh toan tren Crystal report

  -- insert cho column gyc_kcnbh_cktsk Co chi dinh kiem tra suc khoe - Khong chap nhan bao hiem
  v_stt := 23;
  insert into nt_giatrictbc
    (ct_id,
     giatri,
     donvi,
     ngaychay,
     tungay,
     denngay,
     cty_id,
     vpdd_id,
     ban_id,
     nhom_id,
     ods_flag)
     (select
          'gyc_kcnbh_cktsk' ct_id,
          count(*)    giatri,
          'cai'       donvi,
          v_ngaychay,p_tu,p_den,
          gyc.cty_id, --cong ty
          gyc.phong_id as vpdd_id, --phong kinh doanh
          gyc.ban_id, --ban kinh doanh
          gyc.nhom_id,  --nhom kinh doanh
          1 ods_flag
    from TMP_BK_BK09_GYC gyc
    where
         -- Hop dong khong chap nhan BH
          exists (select 1 from ods.activity a
                  where
                       a.account_id = gyc.account_id
                       and a.activity_code in ('P020', --T? ch?i ch?p nh?n b?o hi?m vì lý do s?c kh?e
                                                         'P018',--T? ch?i ch?p nh?n b?o hi?m vì lý do tài chính
                                                         'P021',--T? ch?i ch?p nh?n b?o hi?m vì lý do ngh? nghi?p
                                                         'P022',--T? ch?i ch?p nh?n b?o hi?m vì lý do khác
                                                         'P023',--Trì hoãn ch?p nh?n b?o hi?m vì lý do s?c kh?e
                                                         'P024') --Trì hoãn ch?p nh?n b?o hi?m vì lý do khác
                                --and a.activity_code in ('P011', -- Khong chap nhan bao hiem (Decline Benefit)
                                --                           'P012', -- Tri hoan (Defer Cover)
                                --                           'NTU5', -- Tri hoan (X mnths Occup)
                                --                           'NTU3', -- Tri hoan (X mnths Medical)
                                --                           'NTU4') -- Tri hoan (Defer Medically)*/
                       and trunc(a.bus_processed_date) >= trunc(p_tu)
                       and trunc(a.bus_processed_date) <= trunc(p_den)
                       and a.status_code  =  'OF'
                       -- xay ra truoc khi phat hanh hop dong
                       and not exists (select 1 from ods.activity gh
                                       where gh.account_id = gyc.account_id
                                       and gh.activity_code = 'A100'
                                       and gh.activity_id < a.activity_id
                                       -- Khong ton tai giao dich Undo trong ky
                                       and not exists (select 1 from ods.activity gj
                                                      where gj.reversed_acti_id = gh.activity_id
                                                      and gj.account_id = gyc.account_id
                                                      and trunc(gj.bus_processed_date) <= trunc(p_den) ))
                       -- Khong ton tai giao dich Undo trong ky
                       and not exists (select 1 from ods.activity gk
                                      where gk.reversed_acti_id = a.activity_id
                                            and gk.account_id = gyc.account_id
                                            and trunc(gk.bus_processed_date) <= trunc(p_den) )
                     )
            -- GYC  co OR thuoc kiem tra suc khoe
            and  exists ( select 1 from TMP_BK_BK09_OR ors
                             where ors.account_id = gyc.account_id
                                   and ors.ct_id in  ('ORKTSK', 'ORKTSKBS')
                              )
      group by cty_id, gyc.phong_id, ban_id, nhom_id);


   select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_finish_time from dual;
   test_v_time :=thoigian(test_start_time,test_finish_time);
   rp_capnhat_chaybc(p_macty, p_ngay, p_tu, p_den, 'Test_VBUW01_10', 0, p_user,   test_start_time, test_finish_time, test_v_time);

  -- insert cho column gyc_kcnbh_cktsk_tyle Co chi dinh kiem tra suc khoe - Khong chap nhan bao hiem
  --v_stt:=24;
  -- = (23/5)*100
  -- Tinh toan tren Crystal report

  -- insert cho column gyc_cnbh_phichuan_dgrr Danh gia rui ro - Chap nhan bao hiem voi phi chuan
  --  v_stt:=25;
  -- = 6 + 10 + 19
  -- Tinh toan tren cau lenh select ra ngoai Crystal report

  -- insert cho column gyc_cnbh_phichuan_dgrr_tyle Danh gia rui ro - Chap nhan bao hiem voi phi chuan
  --  v_stt:=27;
  -- = ((6 + 10 + 19)/5)*100
  -- Tinh toan o tren Crystal report

  -- insert cho column gyc_cnbh_phiphutroi_dgrr Danh gia rui ro - Chap nhan bao hiem voi phi phu troi
  --  v_stt:=27;
  -- = 11 + 21
  -- Tinh toan tren cau lenh select ra ngoai Crystal report

  -- insert cho column gyc_cnbh_phiphutroi_dgrr_tyle Danh gia rui ro - Chap nhan bao hiem voi phi phu troi
  --  v_stt:=28;
  -- = ((11 + 21)/5)*100
  -- Tinh toan o tren Crystal report

  -- insert cho column gyc_kcnbh_phiphutroi_dgrr Danh gia rui ro - Khong chap nhan bao hiem voi phi phu troi
  --  v_stt:=29;
  -- = 12 + 23
  -- Tinh toan tren cau lenh select ra ngoai Crystal report

  -- insert cho column gyc_kcnbh_phiphutroi_dgrr_tyle Danh gia rui ro - Khong chap nhan bao hiem voi phi phu troi
  --  v_stt:=30;
  -- = ((12 + 23)/5)*100
  -- Tinh toan o tren Crystal report

  commit;

exception
  when others then
    rollback;
    err := SQLERRM;
    insert into rp_loibc
      (stt, noidung, maubaocao, ngaychay, tungay, denngay,cty_id,ods_flag)
    values
      (v_stt, err, 'VBUW01', v_ngaychay, p_tu, p_den,p_macty,1);
    commit;
END;
/
