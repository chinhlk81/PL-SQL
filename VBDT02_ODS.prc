CREATE OR REPLACE PROCEDURE AMS.VBDT02_ODS(p_tu DATE,p_den DATE,p_macty VARCHAR2,p_ngay DATE DEFAULT NULL, p_user varchar2 default null ) IS
  v_ngaychay DATE := nvl(p_ngay,trunc(SYSDATE));
  v_stt NUMBER:=0;
  v_ngaydaunam DATE:= to_date(to_char(p_tu,'yyyy') ||  '0101','yyyymmdd');  --lay ra ngay dau nam
  v_truoc_ptu DATE:=  p_tu-1;
  err VARCHAR2(1000);
  --bien test
  test_v_time varchar2(50);
  test_start_time varchar2(50);
  test_finish_time varchar2(50);
  /* 
  17/11/2010 chinhlk su dung view cho tat ca moi cai va boc tach toan bo khong su dung union nua
                         them and ac.account_id= a.account_id cho chi tieu cuoi cung
  18/11/2010 chinhlk comment lai cac chi tieu cho ro rang hon
  18/11/2010 chinhlk them p_user vao de luu thong tin ve user chay bao cao vao bang rp_chaybc
  18/11/2010 chinhlk chinh sua and act2.account_id= act.account_id cho chi tieu cuoi cung de chay nhanh hon
  9/12/2010   chinhlk tach chi  tieu dk_dtpstudnam  cac loai phi chia le ra de chay nhanh hon
                      chia thanh 4 cau lenh insert tieng biet : phi ban dau, phi quan ly hop dong, phi phan bo va cac loai phi con lai
                      tach chi  tieu phidkytt_ktmnam  cac loai phi chia le ra de chay nhanh hon
   
  */
BEGIN

  --test voi doan 1
   select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_start_time from dual;
   rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_1',1, p_user);

 --Doanh thu tu dau nam den ki bao cao

v_stt:=5;
 /*Insert cho chi tieu dk_dtpstudnam : Doanh thu tu dau nam den ki bao cao
   truong hop: Doanh thu cua San pham truyen thong
*/
  insert into nt_giatrictbc
  (ct_id,giatri,donvi,ngaychay,tungay,denngay,manv, cty_id, vpdd_id, ban_id, nhom_id, loaibh,ods_flag)
  (select 'dk_dtpstudnam',nvl(sum(doanhthu),0) AS giatri,'dong',v_ngaychay,p_tu,p_den, manv,
          cty_id, vpdd_id, ban_id, nhom_id, loaibh,1
   from
   (

      -- Phai tinh dua tren cac cot tu 6 den 16 cho tat cac cac truong hop thuc thu
      --8+9
      --1. San pham truyen thong
      select decode(trim(atr.transaction_type_code),'PFSR', 1,'RRPS',-1)*prt.amount as doanhthu,
             --ods_lay_masp(rid.benefit_id) as manv,
             case  when ((bent.avail_as_main_benefit = 'Y') or instr(bent.short_name, '_I', -1) > 0) then
                      pro.product_code
                   else
                      bent.short_name
             end as manv,
             dl.company_code      as cty_id, --cong ty
             dl.sales_office_code as vpdd_id, --phong kinh doanh
             dl.sales_agency_code as ban_id, --ban kinh doanh
             dl.sales_unit_code   as nhom_id, --nhom kinh doanh
             '' as loaibh
      from ods.premium_transaction prt
           join ods.rider rid on prt.rider_id = rid.rider_id
           join ods.benefit ben on rid.benefit_id = ben.benefit_id
           join ods.benefit_template bent on bent.benefit_template_id = ben.benefit_template_id
           join ods.product pro on pro.product_id = bent.product_id
           join ods.account_transaction atr on prt.account_trans_id = atr.account_transaction_id
                                            and atr.transaction_type_code in ('PFSR','RRPS')
                                            and trunc(atr.financial_acct_period) >= trunc(v_ngaydaunam)
                                            and trunc(atr.financial_acct_period) <= trunc(v_truoc_ptu)
           join ods.account_outlet_relationship aor on atr.account_id = aor.account_id
                                                    and aor.relationship_type_code = 'SERV' -- Dai ly phuc vu
                                                    and aor.account_outlet_id  =(select max(a.account_outlet_id) from ods.account_outlet_relationship  a
                                                                                 where a.account_id=atr.account_id
                                                                                  and  trunc(a.effective_date)  <= trunc(atr.financial_acct_period)
                                                                                  and a.relationship_type_code='SERV'
                                                                               )
           join ams.rp_daily dl on dl.outlet_id = aor.outlet_client_id
                            and (
                                 (p_macty is null )
                                 or
                                  (p_macty is not null and dl.company_code = p_macty)
                                 )
                            and ((dl.from_date <= trunc(atr.financial_acct_period)  and trunc(atr.financial_acct_period) < nvl(dl.to_date, '01/jan/3000')) )

          -- Releae 3.0.0 Phi SPBT khuyen mai
          -- khong xac dinh dc quan he de lay chinh xac DKR: NA31-NR12/2011 cua BV-NA31/2013 nen phai fixed cung
          union all
          select decode(atr.transaction_type_code,'RCOI', -1, 1) * atr.gross_amount  as doanhthu,
                 N'NA31-NR12/2011' manv,
                 dl.company_code as cty_id, --cong ty
                 dl.sales_office_code as vpdd_id, --phong kinh doanh
                 dl.sales_agency_code as ban_id, --ban kinh doanh
                 dl.sales_unit_code as nhom_id, --nhom kinh doanh
                 '' as loaibh
         from ods.account acc
             join ods.product pro on pro.product_id = acc.product_id
                                  and pro.product_code = 'BV-NA31/2013'
             join ods.account_transaction atr on atr.account_id = acc.account_id
                                              and trunc(atr.financial_acct_period) >= trunc(v_ngaydaunam)
                                              and trunc(atr.financial_acct_period) <= trunc(v_truoc_ptu)
                                              and atr.transaction_type_code  in ('COI', 'RCOI')
             join ods.account_outlet_relationship aor on aor.account_id = acc.account_id
                                              and aor.relationship_type_code = 'SERV' -- Dai ly phuc vu
                                              and aor.account_outlet_id =(select max(a.account_outlet_id) from
                                                                                  ods.account_outlet_relationship  a
                                                                                  where a.account_id=atr.account_id
                                                                                  and trunc(a.effective_date)  <= trunc(atr.financial_acct_period)
                                                                                  and a.relationship_type_code = 'SERV')
             join ams.rp_daily dl  on dl.outlet_id = aor.outlet_client_id
                               and ((dl.from_date <= trunc(atr.financial_acct_period)  and trunc(atr.financial_acct_period) < nvl(dl.to_date, '01/jan/3000')) )
         )
      group by manv,cty_id, vpdd_id, ban_id, nhom_id,loaibh);

   select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_finish_time from dual;
   test_v_time :=thoigian(test_start_time,test_finish_time);
   rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_1',0, p_user, test_start_time,test_finish_time, test_v_time);

   select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_start_time from dual;
   rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_100',1, p_user);

  /* chinhlk 9/12/2010 tach chi  tieu dk_dtpstudnam  cac loai phi chia le ra de chay nhanh hon
                                     chia thanh 4 cau lenh insert tieng biet : phi ban dau, phi quan ly hop dong, phi phan bo va cac loai phi con lai*/
  /*Insert cho chi tieu dk_dtpstudnam : Doanh thu tu dau nam den ki bao cao
   truong hop: Doanh thu cua San pham UVL : Phi ban dau
  */
  v_stt:=51;
    insert into nt_giatrictbc(ct_id,giatri,donvi,ngaychay,tungay,denngay,manv, cty_id, vpdd_id, ban_id, nhom_id, loaibh,ods_flag)
    (select 'dk_dtpstudnam',nvl(sum(doanhthu),0) as giatri,'dong',v_ngaychay,p_tu,p_den, manv,
            cty_id, vpdd_id, ban_id, nhom_id, loaibh,1
     from
        (
          --2. San pham UVL
          -- Phi ban dau
          select     --chu y la o day thi chi dua va cai transaction type code de co the tinh doi voi revert con expense type code thi
                 decode(trim(ft.transaction_type_code),'IWOP', 1, 'RIWP', -1, 'PFSI',1,'RIPS',-1,'LS',1,'RLS',-1, --phi ban dau, phi phan bo
                                                                                  0) *ft.effective_amount as doanhthu ,
                  case
                  when (trim(ft.transaction_type_code) in ('PFSI','RIPS','LS','RLS','IWOP', 'RIWP')    --ma xac dinh phi phan bo voi ft.expense_type_code is null
                        and ft.expense_type_code is null)
                    then f.fund_short_name
                  else
                    pro.product_code
                end as manv,
                 dl.company_code      as cty_id, --cong ty
                 dl.sales_office_code as vpdd_id, --phong kinh doanh
                 dl.sales_agency_code as ban_id, --ban kinh doanh
                 dl.sales_unit_code   as nhom_id, --nhom kinh doanh
                 case
                  when (trim(ft.transaction_type_code) in ('PFSI','RIPS','LS','RLS','IWOP', 'RIWP')    --ma xac dinh phi phan bo voi ft.expense_type_code is null
                        and ft.expense_type_code is null)
                    then 'QDT'
                  else ''
                end as loaibh
          from   ods.fund_transaction ft
                 join ods.account_transaction actr on actr.account_transaction_id = ft.account_transaction_id
                 join ods.account_outlet_relationship aor on aor.account_id = actr.account_id
                 join ods.account acc on acc.account_id = actr.account_id
                 join ods.product pro on acc.product_id = pro.product_id
                 join ams.rp_daily dl on dl.outlet_id = aor.outlet_client_id
                 left join ods.fund f on f.fund_id = ft.fund_id
          where   -- ma xac dinh phi ban dau
                      (ft.transaction_type_code in ('PFSI','RIPS','LS','RLS','IWOP', 'RIWP')  -- LS chi cho phi dinh ky
                       and exists (select 1 from rp_tct_danhmuc dm
                                            where dm.ma_dm = ft.expense_type_code
                                                  and dm.nhom_id  in ('PBD_DK','PBD_DT')
                                                  )

                      )
               and (
                   (p_macty is null )
                   or
                    (p_macty is not null and dl.company_code = p_macty)
                   )
                and ((dl.from_date <= trunc(actr.financial_acct_period)  and trunc(actr.financial_acct_period) < nvl(dl.to_date, '01/jan/3000')) )

                and trunc(actr.financial_acct_period) >= trunc(v_ngaydaunam)
                and trunc(actr.financial_acct_period) <= trunc(v_truoc_ptu)
                and aor.relationship_type_code = 'SERV'
                and aor.account_outlet_id  =(select max(a.account_outlet_id) from ods.account_outlet_relationship  a
                                             where a.account_id=actr.account_id
                                              and  trunc(a.effective_date ) <=  trunc(actr.financial_acct_period)
                                              and a.relationship_type_code='SERV'
                                           )
             )
          group by manv,cty_id, vpdd_id, ban_id, nhom_id,loaibh);

    select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_finish_time from dual;
    test_v_time :=thoigian(test_start_time,test_finish_time);
    rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_100',0, p_user, test_start_time, test_finish_time, test_v_time);


   select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_start_time from dual;
   rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_100.1',1, p_user);
v_stt:=52;
  /*Insert cho chi tieu dk_dtpstudnam : Doanh thu tu dau nam den ki bao cao
   truong hop: Doanh thu cua San pham UVL : Phi quan ly hop dong
  */
    insert into nt_giatrictbc(ct_id,giatri,donvi,ngaychay,tungay,denngay,manv, cty_id, vpdd_id, ban_id, nhom_id, loaibh,ods_flag)
    (select 'dk_dtpstudnam',nvl(sum(doanhthu),0) as giatri,'dong',v_ngaychay,p_tu,p_den, manv,
            cty_id, vpdd_id, ban_id, nhom_id, loaibh,1
     from
        (
          --2. San pham UVL
          -- Phi ban dau, phi quan ly hop dong, phi phan bo
          select     --chu y la o day thi chi dua va cai transaction type code de co the tinh doi voi revert con expense type code thi
                 decode(trim(ft.transaction_type_code), 'FCO',1,'RFCO',-1,    --chi phi quan ly hop dong
                                                                                  0)*ft.effective_amount as doanhthu ,
                  case
                  when (trim(ft.transaction_type_code) in ('PFSI','RIPS','LS','RLS','IWOP', 'RIWP')    --ma xac dinh phi phan bo voi ft.expense_type_code is null
                        and ft.expense_type_code is null)
                    then f.fund_short_name
                  else
                     pro.product_code
                end as manv,
                 dl.company_code      as cty_id, --cong ty
                 dl.sales_office_code as vpdd_id, --phong kinh doanh
                 dl.sales_agency_code as ban_id, --ban kinh doanh
                 dl.sales_unit_code   as nhom_id, --nhom kinh doanh
                 case
                  when (trim(ft.transaction_type_code) in ('PFSI','RIPS','LS','RLS','IWOP', 'RIWP')    --ma xac dinh phi phan bo voi ft.expense_type_code is null
                        and ft.expense_type_code is null)
                    then 'QDT'
                  else ''
                end as loaibh
          from   ods.fund_transaction ft
                 join ods.account_transaction actr on actr.account_transaction_id = ft.account_transaction_id
                 join ods.account_outlet_relationship aor on aor.account_id = actr.account_id
                 join ods.account acc on  acc.account_id = actr.account_id
                 join ods.product pro on acc.product_id = pro.product_id
                 join ams.rp_daily dl on dl.outlet_id = aor.outlet_client_id
                 left join ods.fund f on f.fund_id  = ft.fund_id
          where    -- ma xac dinh phi quan ly hop dong
                (ft.transaction_type_code in ('FCO','RFCO')
                 and ft.expense_type_code in ('ADMD','RADD')
                )
               and (
                   (p_macty is null )
                   or
                    (p_macty is not null and dl.company_code = p_macty)
                   )
                and ((dl.from_date <= trunc(actr.financial_acct_period)  and trunc(actr.financial_acct_period) < nvl(dl.to_date, '01/jan/3000')) )

                and trunc(actr.financial_acct_period) >= trunc(v_ngaydaunam)
                and trunc(actr.financial_acct_period) <= trunc(v_truoc_ptu)
                and aor.relationship_type_code = 'SERV'
                and aor.account_outlet_id  =(select max(a.account_outlet_id) from ods.account_outlet_relationship  a
                                             where a.account_id=actr.account_id
                                              and  trunc(a.effective_date ) <=  trunc(actr.financial_acct_period)
                                              and a.relationship_type_code='SERV'
                                           )
             )
          group by manv,cty_id, vpdd_id, ban_id, nhom_id,loaibh);

    select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_finish_time from dual;
    test_v_time :=thoigian(test_start_time,test_finish_time);
    rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_100.1',0, p_user, test_start_time, test_finish_time, test_v_time);

   select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_start_time from dual;
   rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_100.2',1, p_user);
v_stt:=53;
  /*Insert cho chi tieu dk_dtpstudnam : Doanh thu tu dau nam den ki bao cao
   truong hop: Doanh thu cua San pham UVL : phi phan bo
  */
    insert into nt_giatrictbc(ct_id,giatri,donvi,ngaychay,tungay,denngay,manv, cty_id, vpdd_id, ban_id, nhom_id, loaibh,ods_flag)
    (select 'dk_dtpstudnam',nvl(sum(doanhthu),0) as giatri,'dong',v_ngaychay,p_tu,p_den, manv,
            cty_id, vpdd_id, ban_id, nhom_id, loaibh,1
     from
        (
          --2. San pham UVL
          -- Phi ban dau, phi quan ly hop dong, phi phan bo
          select     --chu y la o day thi chi dua va cai transaction type code de co the tinh doi voi revert con expense type code thi
                 decode(trim(ft.transaction_type_code),'IWOP',1, 'RIWP',-1,'PFSI',1,'RIPS',-1,'LS',1,'RLS',-1, --phi phan bo
                                                 0)
                 *ft.effective_amount as doanhthu ,
                  case
                  when (trim(ft.transaction_type_code) in ('PFSI','RIPS','LS','RLS','IWOP', 'RIWP')    --ma xac dinh phi phan bo voi ft.expense_type_code is null
                        and ft.expense_type_code is null)
                    then f.fund_short_name
                  else
                    pro.product_code
                end as manv,
                 dl.company_code      as cty_id, --cong ty
                 dl.sales_office_code as vpdd_id, --phong kinh doanh
                 dl.sales_agency_code as ban_id, --ban kinh doanh
                 dl.sales_unit_code   as nhom_id, --nhom kinh doanh
                 case
                  when (trim(ft.transaction_type_code) in ('PFSI','RIPS','LS','RLS','IWOP', 'RIWP')    --ma xac dinh phi phan bo voi ft.expense_type_code is null
                        and (ft.expense_type_code is null )
                        )
                    then 'QDT'
                  else ''
                end as loaibh
          from   ods.fund_transaction ft
                 join ods.account_transaction actr on actr.account_transaction_id = ft.account_transaction_id

                 join ods.account_outlet_relationship aor on aor.account_id = actr.account_id
                 join ods.account acc on  acc.account_id = actr.account_id
                 join ods.product pro on acc.product_id = pro.product_id
                 join ams.rp_daily dl on dl.outlet_id = aor.outlet_client_id
                 left join ods.fund f on f.fund_id  = ft.fund_id
          where    -- Ma xac dinh phi phan bo
                (--phi bao hiem phan bo chinh la phi dua vao cho quy dau tu
                    ft.transaction_type_code in ('PFSI','RIPS','LS','RLS','IWOP', 'RIWP')    --ma xac dinh phi phan bo voi ft.expense_type_code is null
                    and (ft.expense_type_code is null
                        )
                )
               and (
                   (p_macty is null )
                   or
                    (p_macty is not null and dl.company_code = p_macty)
                   )
                and ((dl.from_date <= trunc(actr.financial_acct_period)  and trunc(actr.financial_acct_period) < nvl(dl.to_date, '01/jan/3000')) )

                and trunc(actr.financial_acct_period) >= trunc(v_ngaydaunam)
                and trunc(actr.financial_acct_period) <= trunc(v_truoc_ptu)
                and aor.relationship_type_code = 'SERV'
                and aor.account_outlet_id  =(select max(a.account_outlet_id) from ods.account_outlet_relationship  a
                                             where a.account_id=actr.account_id
                                              and  trunc(a.effective_date ) <=  trunc(actr.financial_acct_period)
                                              and a.relationship_type_code='SERV'
                                           )
             )
          group by manv,cty_id, vpdd_id, ban_id, nhom_id,loaibh);

    select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_finish_time from dual;
    test_v_time :=thoigian(test_start_time,test_finish_time);
    rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_100.2',0, p_user, test_start_time, test_finish_time, test_v_time);

v_stt:=54;
   select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_start_time from dual;
   rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_100.3',1, p_user);

  /*Insert cho chi tieu dk_dtpstudnam : Doanh thu tu dau nam den ki bao cao
   truong hop: Doanh thu cua San pham UVL : Cac loai phi con lai: Phi Rut 1 phan gia tri tai khoan,Rut toan bo GTTK,Phi huy bo,huy bo do Lapse,phi dich vu
  */
    insert into nt_giatrictbc(ct_id,giatri,donvi,ngaychay,tungay,denngay,manv, cty_id, vpdd_id, ban_id, nhom_id, loaibh,ods_flag)
    (select 'dk_dtpstudnam',nvl(sum(doanhthu),0) as giatri,'dong',v_ngaychay,p_tu,p_den, manv,
            cty_id, vpdd_id, ban_id, nhom_id, loaibh,1
     from
        (
          --2. San pham UVL : Cac loai phi con lai
          select     --chu y la o day thi chi dua va cai transaction type code de co the tinh doi voi revert con expense type code thi
                 decode(trim(ft.transaction_type_code),
                                                 'WTH',1,'RWTH',-1,    --Rut 1 phan gia tri tai khoan
                                                 'FWTH',1,'RFWT',-1,   --Rut toan bo GTTK
                                                 'FSSC',1,'RFSS',-1,   --Phi huy bo
                                                 'WOSC',1,'RWOS',-1,   --Phi huy bo do Lapse
                                                 'WTH',1,'RWTH',-1,0     --Phi dich vu
                                                 )
                                                 *ft.effective_amount as doanhthu ,
                  case
                  when (trim(ft.transaction_type_code) in ('PFSI','RIPS','LS','RLS','IWOP', 'RIWP')    --ma xac dinh phi phan bo voi ft.expense_type_code is null
                        and ft.expense_type_code is null)
                    then f.fund_short_name
                  else
                    pro.product_code
                end as manv,
                 dl.company_code      as cty_id, --cong ty
                 dl.sales_office_code as vpdd_id, --phong kinh doanh
                 dl.sales_agency_code as ban_id, --ban kinh doanh
                 dl.sales_unit_code   as nhom_id, --nhom kinh doanh
                 case
                  when (trim(ft.transaction_type_code) in ('PFSI','RIPS','LS','RLS','IWOP', 'RIWP')    --ma xac dinh phi phan bo voi ft.expense_type_code is null
                        and ft.expense_type_code is null)
                    then 'QDT'
                  else ''
                end as loaibh
          from  ods.fund_transaction ft
                 join ods.account_transaction actr on actr.account_transaction_id = ft.account_transaction_id

                 join ods.account_outlet_relationship aor on aor.account_id = actr.account_id
                 join ods.account acc on  acc.account_id = actr.account_id
                 join ods.product pro on acc.product_id = pro.product_id
                 join ams.rp_daily dl on dl.outlet_id = aor.outlet_client_id
                 left join ods.fund f on f.fund_id  = ft.fund_id
          where
                (
                     (--Rut 1 phan gia tri tai khoan
                        ft.transaction_type_code in ('WTH','RWTH')
                         and  ft.expense_type_code in ('WFEE','RWFE')
                      )
                      or --Rut toan bo GTTK
                      ( ft.transaction_type_code in ('FWTH','RFWT')
                        and  ft.expense_type_code in ('SURC','RSUR')
                      )
                      or --Phi huy bo
                      (
                       ft.transaction_type_code  in ('FSSC','RFSS')
                       and  ft.expense_type_code in ('SURC','RSUR')
                      )
                      or --huy bo do Lapse
                      (
                       ft.transaction_type_code  in ('WOSC','RWOS')
                       and  ft.expense_type_code in ('SURC','RSUR')
                      )
                      or --phi dich vu
                      (
                       ft.transaction_type_code in ('WTH','RWTH')
                       and  ft.expense_type_code in ('WFES','RWFS')
                      )
                )
                and
                (
                   (p_macty is null )
                   or
                    (p_macty is not null and dl.company_code = p_macty)
                )
                and ((dl.from_date <= trunc(actr.financial_acct_period)  and trunc(actr.financial_acct_period) < nvl(dl.to_date, '01/jan/3000')) )

                and trunc(actr.financial_acct_period) >= trunc(v_ngaydaunam)
                and trunc(actr.financial_acct_period) <= trunc(v_truoc_ptu)
                and aor.relationship_type_code = 'SERV'
                and aor.account_outlet_id  =(select max(a.account_outlet_id) from ods.account_outlet_relationship  a
                                             where a.account_id=actr.account_id
                                              and  trunc(a.effective_date ) <=  trunc(actr.financial_acct_period)
                                              and a.relationship_type_code='SERV'
                                           )
             )
          group by manv,cty_id, vpdd_id, ban_id, nhom_id,loaibh);

    select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_finish_time from dual;
    test_v_time :=thoigian(test_start_time,test_finish_time);
    rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_100.3',0, p_user, test_start_time, test_finish_time, test_v_time);


   select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_start_time from dual;
   rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_101',1, p_user);
v_stt:=55;
    /*Insert cho chi tieu dk_dtpstudnam : Doanh thu tu dau nam den ki bao cao
     truong hop: Doanh thu cua San pham UVL : Phi rui ro, phi phu troi
    */
    -- Phi rui ro, phi phu troi
    insert into nt_giatrictbc(ct_id,giatri,donvi,ngaychay,tungay,denngay,manv, cty_id, vpdd_id, ban_id, nhom_id, loaibh,ods_flag)
    (select 'dk_dtpstudnam',nvl(sum(doanhthu),0) as giatri,'dong',v_ngaychay,p_tu,p_den, manv,
            cty_id, vpdd_id, ban_id, nhom_id, loaibh,1
     from
        (
          select decode(trim(atr.transaction_type_code),'FCO',1,'RFCO',-1,
                                                 'FCL',1,'RFCL',-1,0)
                                                 *ptr.amount as doanhthu,
                case  when ((bent.avail_as_main_benefit = 'Y') or instr(bent.short_name, '_I', -1) > 0) then
                          pro.product_code
                       else
                          bent.short_name
                 end as manv,
                 dl.company_code      as cty_id, --cong ty
                 dl.sales_office_code as vpdd_id, --phong kinh doanh
                 dl.sales_agency_code as ban_id, --ban kinh doanh
                 dl.sales_unit_code   as nhom_id, --nhom kinh doanh
                 '' as loaibh
          from  ods.premium_transaction ptr,
                ods.account_transaction atr,
               /* ods.account acc,*/
                ods.rider rid,
                ods.benefit ben,
                ods.account_outlet_relationship aor,
              /*  ods.outlet ol,*/
                ods.product pro,
                ams.rp_daily dl,
                ods.benefit_template bent
          where -- Cac dieu kien lien ket bang
                ptr.account_trans_id = atr.account_transaction_id
                /*and atr.account_id = acc.account_id*/
                and rid.rider_id = ptr.rider_id
                and ben.benefit_id = rid.benefit_id
                and bent.benefit_template_id = ben.benefit_template_id
                and aor.account_id = atr.account_id
                /*and ol.outlet_client_id = aor.outlet_client_id*/
                and (dl.outlet_id = aor.outlet_client_id)
                and bent.product_id = pro.product_id
                and pro.product_type_code = 'UNIV'  -- san pham UVL
                and atr.transaction_type_code in ('FCO','RFCO',  --phi rui ro
                                                  'FCL','RFCL')   --phi phu troi
                and aor.relationship_type_code = 'SERV'
                and (
                   (p_macty is null )
                   or
                    (p_macty is not null and dl.company_code = p_macty)
                   )
                and ((dl.from_date <= trunc(atr.financial_acct_period)  and trunc(atr.financial_acct_period) < nvl(dl.to_date, '01/jan/3000')) )

                and aor.account_outlet_id  =(select max(a.account_outlet_id) from ods.account_outlet_relationship  a
                                             where a.account_id=atr.account_id
                                              and trunc(a.effective_date) <= trunc(atr.financial_acct_period)
                                              and a.relationship_type_code='SERV'
                                )
                and trunc(atr.financial_acct_period) >= trunc(v_ngaydaunam)
                and trunc(atr.financial_acct_period) <= trunc(v_truoc_ptu)
       )
    group by manv,cty_id, vpdd_id, ban_id, nhom_id,loaibh);

    select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_finish_time from dual;
    test_v_time :=thoigian(test_start_time,test_finish_time);
    rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_101',0, p_user, test_start_time, test_finish_time, test_v_time);

   select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_start_time from dual;
   rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_102',1, p_user);

  --10 (chua co)
  --12 Truy thu do khoi phuc hieu luc hop dong
  -- Phan nay chua viet ro talisman bi loi chua xac dinh duoc gia tri can lay

  --13: Truy thu do giai quyet quyen loi bao hiem
  -- Phi huy bo hop dong (Gia doan 2)


  --Truy thu phi giai quyet quyen loi(da giai thich them o tren)

  /*Insert cho chi tieu dk_dtpstudnam : Doanh thu tu dau nam den ki bao cao
   truong hop: Truy thu phi giai quyet quyen loi(da giai thich them o tren)
  */
  v_stt:=56;
  insert into nt_giatrictbc(ct_id,giatri,donvi,ngaychay,tungay,denngay,manv, cty_id, vpdd_id, ban_id, nhom_id, loaibh,ods_flag)
  (select 'dk_dtpstudnam',nvl(sum(doanhthu),0) as giatri,'dong',v_ngaychay,p_tu,p_den, manv,
          cty_id, vpdd_id, ban_id, nhom_id, loaibh,1
   from
      (
           select  chiso*doanhthu as doanhthu,
                  manv,
                  cty_id,
                  vpdd_id,
                  ban_id,
                  nhom_id,
                   '' as loaibh
            from
            (
                    select
                           cca.transaction_event_id,
                           SUM(cca.amount) as doanhthu,
                           case  when ((bent.avail_as_main_benefit = 'Y') or instr(bent.short_name, '_I', -1) > 0) then
                                  pro.product_code
                               else
                                  bent.short_name
                           end as manv,
                           dl.company_code      as cty_id, --cong ty
                           dl.sales_office_code as vpdd_id, --phong kinh doanh
                           dl.sales_agency_code as ban_id, --ban kinh doanh
                           dl.sales_unit_code   as nhom_id, --nhom kinh doanh
                           '' as loaibh
                     from  (
                                          select * from ods.claim_decision_history cdh1
                                                      where   cdh1.claim_decision_history_id=
                                                (
                                                     select   min(
                                                                       case when length(a.claim_decision_history_id)=9  then a.claim_decision_history_id
                                                                          else (         select max(b.claim_decision_history_id)
                                                                                             from ods.claim_decision_history b
                                                                                             where  b.decision_id=cdh1.decision_id --theo yeu cau moi em Thuy thi khong can ngay gioi han o day nua vi chi can lay quyet dinh cuoi cung
                                                                                             group by b.decision_id
                                                                                   )
                                                                           end
                                                                    )
                                                      from ods.claim_decision_history a
                                                      where  a.decision_id=cdh1.decision_id
                                              )
                                     ) cdh
                                join ods.claim clm on cdh.claim_id = clm.claim_id
                                join (
                                        select *
                                        from ods.claim_rider_link crl1
                                        where   crl1.claim_rider_link_id in
                                        (
                                             select max(crl_temp.claim_rider_link_id)
                                             from ods.claim_rider_link crl_temp
                                                 join ods.rider ridt on ridt.rider_id = crl_temp.rider_id
                                             where crl_temp.claim_decision_control_id = crl1.claim_decision_control_id
                                             group by ridt.entity_id
                                         )
                                      ) crl on cdh.decision_id = crl.claim_decision_control_id and crl.claim_status_code = cdh.status_code
                                join ods.claim_component cc on cc.decision_id=cdh.decision_id
                                                         and cc.component_type_code = 'OSP'

                                join --them dieu kien nay de khi giai quyet quyen loi bao hiem la 0 thi no se lay ra cai quyet dinh moi nhat cua no
                                (             --va moi truong hop deu se lay ra quyet dinh moi nhat cua no
                                        select *
                                        from ods.claim_component_actual cca1
                                        where   cca1.claim_component_actual_id =
                                        (
                                             select max(cca_temp.claim_component_actual_id)
                                             from ods.claim_component_actual  cca_temp
                                             where cca_temp.claim_component_id = cca1.claim_component_id
                                         )
                                ) cca on cca.claim_component_id = cc.claim_component_id
                                inner join ods.rider rid  on (rid.rider_id= crl.rider_id)
                                inner join ods.rider_template rit on rit.rider_template_id=rid.rider_template_id   --de dung cho san pham A23 no co the hien len
                                inner join ods.benefit ben on (ben.benefit_id=rid.benefit_id)
                                inner join ods.benefit_template bent on (bent.benefit_template_id=ben.benefit_template_id)
                                inner join ods.application_form af on af.application_form_id=ben.application_form_id      --lay ra so hop dong cua no
                                join ods.account acc on acc.account_id = af.account_id
                                inner join ods.product pro on (pro.product_id = acc.product_id)
                                inner join ods.account_outlet_relationship aor on aor.account_id= acc.account_id
                                inner join ams.rp_daily dl on dl.outlet_id = aor.outlet_client_id
                          where cdh.status_code  in ('ACCO','ACCP','DECL','DECO', 'VOID')
                                --and trunc(cdh.prior_updated) >= trunc(v_ngaydaunam)
                                -- and trunc(cdh.prior_updated) <= trunc(v_truoc_ptu)
                                and
                                (
                                    (p_macty is null)
                                    or
                                    (p_macty is not null and dl.company_code = p_macty)
                                )
                                and ((dl.from_date <= trunc(cdh.prior_updated) and trunc(cdh.prior_updated) < nvl(dl.to_date, '01/jan/3000')) )
                                and aor.account_outlet_id  =(select max(b.account_outlet_id) from ods.account_outlet_relationship  b
                                                               where b.account_id = acc.account_id
                                                                   and b.effective_date <=  cdh.date_of_decision
                                                                   and b.relationship_type_code = 'SERV'--bay gio lay ra theo dai ly khai thac
                                                  )
                         group by
                                 cca.transaction_event_id,
                                 case  when ((bent.avail_as_main_benefit = 'Y') or instr(bent.short_name, '_I', -1) > 0) then
                                        pro.product_code
                                     else
                                        bent.short_name
                                 end  ,
                                 dl.company_code  , --cong ty
                                 dl.sales_office_code, --phong kinh doanh
                                 dl.sales_agency_code, --ban kinh doanh
                                 dl.sales_unit_code--nhom kinh doanh

            ) slta
            inner join
            --ChinhLK 31/5/2010 xac dinh dk ngay thang thong quan bang Financial_transaction
            (
                select  paym.transaction_event_id,
                    ft_coa.chiso
                from ods.payment paym,
                (

                             select (ftr1.table_row_id + 990000000000) as payment, ftr1.account_period business_date,
                                    dmcs.chi_so chiso,
                                    ftr1.financial_transaction_id
                             from ods.financial_transaction ftr1
                                  ,ods.chart_of_accounts coa1, rp_dmcs_dinhkhoan dmcs
                             where ftr1.source_table = 'Cheq Trans'
                                 and coa1.chart_of_accounts_id = ftr1.account_number_id
                                 and dmcs.no_code  = coa1.account_numbers
                                 and ftr1.debit_credit_indctr = dmcs.no
                                 and dmcs.co_code is null
                                 and trunc(ftr1.account_period) >= trunc(v_ngaydaunam)
                                 and trunc(ftr1.account_period)<=  trunc(v_truoc_ptu)
                                 and ftr1.effective_amount >0

                 ) ft_coa
                 where  ft_coa.payment  = paym.payment_id
            ) sltb on slta.transaction_event_id = sltb.transaction_event_id
       )
    group by manv,cty_id, vpdd_id, ban_id, nhom_id,loaibh);
    select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_finish_time from dual;
    test_v_time :=thoigian(test_start_time,test_finish_time);
    rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_102',0, p_user, test_start_time, test_finish_time, test_v_time);

v_stt:=57;
    select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_start_time from dual;
    rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_103',1, p_user);

    --14: Thu phi khac(Chua biet cach tinh)
    --Cot 15: Hoan phi (do hoan phi nen la phai nhan voi -1 ):  -1*phibh*nvl(case when phitt>0 then 1 else 0 end,0) as doanhthu,

  /*Insert cho chi tieu dk_dtpstudnam : Doanh thu tu dau nam den ki bao cao
                        -- Liqu date Ghi nhap vao Quy dau tu
   truong hop: Hoan phi   (do hoan phi nen la phai nhan voi -1 ):  -1*phibh*nvl(case when phitt>0 then 1 else 0 end,0) as doanhthu,
                       -- SPTT huy DKC
                       -- SPUVL , SPTT Huy DKR
                       va Giao dich hoan phi khong toan tai trong bang Payment hoac so tien  = 0
  */
  insert into nt_giatrictbc(ct_id,giatri,donvi,ngaychay,tungay,denngay,manv, cty_id, vpdd_id, ban_id, nhom_id, loaibh,ods_flag)
  (select 'dk_dtpstudnam',nvl(sum(doanhthu),0) as giatri,'dong',v_ngaychay,p_tu,p_den, manv,
          cty_id, vpdd_id, ban_id, nhom_id, loaibh,1
   from
      (
              -- Giao dich hoan phi khong toan tai trong bang Payment hoac so tien  = 0
              -- San pham TT va Huy DKR
               select -1*decode(atr.transaction_type_code,'RREF',1,'RRRE',-1,  'LIQU',1, 'RLIQ', -1)*COALESCE(prt.amount, ft.effective_amount, atr.gross_amount ) as doanhthu,
                      case when atr.transaction_type_code in ('LIQU','RLIQ') then
                                f.fund_short_name
                           else
                               case  when bent.avail_as_main_benefit is null or (bent.avail_as_main_benefit = 'Y'  or instr(bent.short_name, '_I', -1) > 0) then
                                        pro.product_code
                                     else
                                        bent.short_name
                                     end
                           end as manv,
                   dl.company_code      as cty_id, --cong ty
                   dl.sales_office_code as vpdd_id, --phong kinh doanh
                   dl.sales_agency_code as ban_id, --ban kinh doanh
                   dl.sales_unit_code   as nhom_id, --nhom kinh doanh
                   decode(atr.transaction_type_code,'LIQU', 'QDT','RLIQ','QDT', '' ) as loaibh
                from ods.account acc
                     join ods.account_transaction atr on atr.account_id = acc.account_id
                                                      and atr.transaction_type_code in ('RREF','RRRE', 'LIQU', 'RLIQ')
                                                      and trunc(atr.financial_acct_period) >=  trunc(v_ngaydaunam)
                                                      and trunc(atr.financial_acct_period) <=  trunc(v_truoc_ptu)
                                                      -- Giao dich sinh ra boi hanh dong huy 14 ngay
                                                      and exists (select 1 from ods.activity act
                                                                      join ods.account_transaction atr1 on atr1.activity_id = act.activity_id
                                                                                                        and atr1.transaction_type_code in ('LIQU', 'RREF')
                                                                                                        and act.activity_code in ('P107','P199')
                                                                    where   act.account_id = acc.account_id
                                                                            and atr1.transaction_event_id = atr.transaction_event_id
                                                                            )
                                                      -- Thuc thanh toan = 0, lay khoan tien da doi tru
                                                      and
                                                          (
                                                              not exists --khong ton tai giao dich trong bang payment tuc la no chua thanh toan
                                                              (
                                                                  select   1
                                                                  from  ods.payment paym
                                                                  where  paym.transaction_event_id = atr.transaction_event_id
                                                              )
                                                              or exists --co ton tai giao dich nhung so tien = 0
                                                              (
                                                                  select 1
                                                                  from ods.payment paym
                                                                  where paym.transaction_event_id = atr.transaction_event_id
                                                                      and paym.amount = 0
                                                              )
                                                          )
                     left join ods.fund_transaction ft on ft.account_transaction_id = atr.account_transaction_id
                                                       and ft.expense_type_code is null
                     left join ods.fund f on ft.fund_id = f.fund_id
                     join ods.product pro on pro.product_id  = acc.product_id
                     join ods.account_outlet_relationship aor on acc.account_id = aor.account_id
                                                              and aor.account_outlet_id =(select max(a.account_outlet_id)
                                                                    from ods.account_outlet_relationship  a
                                                                    where a.account_id=atr.account_id
                                                                        and trunc(a.effective_date) <= trunc(atr.financial_acct_period)
                                                                        and a.relationship_type_code = 'SERV'
                                                                   )
                     join ams.rp_daily dl on dl.outlet_id = aor.outlet_client_id
                                      and (
                                           (p_macty is null )
                                           or
                                            (p_macty is not null and dl.company_code = p_macty)
                                           )
                                      and ((dl.from_date <= trunc(atr.financial_acct_period)  and trunc(atr.financial_acct_period) < nvl(dl.to_date, '01/jan/3000')) )
                     left join ods.premium_transaction prt on prt.account_trans_id = atr.account_transaction_id
                     left join ods.rider rid on prt.rider_id = rid.rider_id
                     left join ods.benefit ben on ben.benefit_id = rid.benefit_id
                     left join ods.benefit_template bent on ben.benefit_template_id = bent.benefit_template_id
       )
    group by manv,cty_id, vpdd_id, ban_id, nhom_id,loaibh);
    select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_finish_time from dual;
    test_v_time :=thoigian(test_start_time,test_finish_time);
    rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_103',0, p_user, test_start_time,test_finish_time, test_v_time);


   select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_start_time from dual;
   rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_104',1, p_user);
v_stt:=58;
  /*Insert cho chi tieu dk_dtpstudnam : Doanh thu tu dau nam den ki bao cao
                   -- Liqu date Ghi nhap vao Quy dau tu
   truong hop: Hoan phi   (do hoan phi nen la phai nhan voi -1 ):
                       -- SPTT huy DKC
                       -- SPUVL , SPTT Huy DKR
                       va hoan phi thuc thu da co du lieu trong bang financial_transaction
  */
  insert into nt_giatrictbc(ct_id,giatri,donvi,ngaychay,tungay,denngay,manv, cty_id, vpdd_id, ban_id, nhom_id, loaibh,ods_flag)
  (select 'dk_dtpstudnam',nvl(sum(doanhthu),0) as giatri,'dong',v_ngaychay,p_tu,p_den, manv,
          cty_id, vpdd_id, ban_id, nhom_id, loaibh,1
   from
      (
                    select  -1*doanhthu*chiso  as doanhthu,
                         manv,
                         cty_id,
                         vpdd_id, --phong kinh doanh
                         ban_id, --ban kinh doanh
                         nhom_id, --nhom kinh doanh
                         loaibh
                    from
                    (
                       select COALESCE(prt.amount, ft.effective_amount, atr.gross_amount ) as doanhthu,
                        case when atr.transaction_type_code in ('LIQU','RLIQ') then
                                f.fund_short_name
                           else
                               case  when bent.avail_as_main_benefit is null or (bent.avail_as_main_benefit = 'Y'  or instr(bent.short_name, '_I', -1) > 0) then
                                    pro.product_code
                                 else
                                    bent.short_name
                                end
                           end as manv,
                       dl.company_code      as cty_id, --cong ty
                       dl.sales_office_code as vpdd_id, --phong kinh doanh
                       dl.sales_agency_code as ban_id, --ban kinh doanh
                       dl.sales_unit_code   as nhom_id, --nhom kinh doanh
                       atr.transaction_event_id,
                       decode(atr.transaction_type_code,'LIQU', 'QDT','RLIQ','QDT', '' ) as loaibh
                    from ods.account acc
                         join ods.account_transaction atr on acc.account_id = atr.account_id
                                                          and atr.transaction_type_code in ('RREF', 'LIQU')   --ma khong co revert
                                                          -- Giao dich sinh ra boi hanh dong huy 14 ngay
                                                          and exists (select 1 from ods.activity act
                                                                          join ods.account_transaction atr1 on atr1.activity_id = act.activity_id
                                                                                                            and atr1.transaction_type_code in ('LIQU', 'RREF')
                                                                                                            and act.activity_code in ('P107','P199')
                                                                        where   act.account_id = acc.account_id
                                                                                and atr1.transaction_event_id = atr.transaction_event_id
                                                                                )
                         left join ods.fund_transaction ft on ft.account_transaction_id = atr.account_transaction_id
                                                           and ft.expense_type_code is null
                         left join ods.fund f on f.fund_id  = ft.fund_id
                         join ods.product pro on pro.product_id = acc.product_id
                         join ods.account_outlet_relationship aor on  acc.account_id = aor.account_id
                                                                  and aor.account_outlet_id =(select max(a.account_outlet_id)
                                                                                              from ods.account_outlet_relationship  a
                                                                                              where a.account_id=atr.account_id
                                                                                                  and trunc(a.effective_date) <= trunc(atr.financial_acct_period)
                                                                                                  and a.relationship_type_code = 'SERV'
                                                                                             )
                         join ams.rp_daily dl on dl.outlet_id = aor.outlet_client_id
                                           and (
                                               (p_macty is null )
                                               or
                                                (p_macty is not null and dl.company_code = p_macty)
                                               )
                                           and ((dl.from_date <= trunc(atr.financial_acct_period)  and trunc(atr.financial_acct_period) < nvl(dl.to_date, '01/jan/3000')) )

                         left join ods.premium_transaction prt on prt.account_trans_id = atr.account_transaction_id
                         left join ods.rider rid on prt.rider_id = rid.rider_id
                         left join ods.benefit ben on rid.benefit_id = ben.benefit_id
                         left join ods.benefit_template bent on ben.benefit_template_id = bent.benefit_template_id
                    ) slta
                  inner join
                  --ChinhLK 31/5/2010 xac dinh dk ngay thang thong quan bang Financial_transaction
                  (
                      select  paym.transaction_event_id,
                          ft_coa.chiso
                      from ods.payment paym,
                      (
                             select (ftr1.table_row_id + 990000000000) as payment, ftr1.account_period business_date,
                                    dmcs.chi_so chiso,
                                    ftr1.financial_transaction_id
                             from ods.financial_transaction ftr1
                                  ,ods.chart_of_accounts coa1, rp_dmcs_dinhkhoan dmcs
                             where ftr1.source_table = 'Cheq Trans'
                                 and coa1.chart_of_accounts_id = ftr1.account_number_id
                                 and dmcs.no_code  = coa1.account_numbers
                                 and ftr1.debit_credit_indctr = dmcs.no
                                 and dmcs.co_code is null
                                 and trunc(ftr1.account_period) >= trunc(v_ngaydaunam)
                                 and trunc(ftr1.account_period)<=  trunc(v_truoc_ptu)
                                 and ftr1.effective_amount >0

                   ) ft_coa
                   where  ft_coa.payment  = paym.payment_id
                  ) sltb on slta.transaction_event_id = sltb.transaction_event_id
               -- San pham UVL - Huy DKC
               -- Refund Premium = Phi RR + phu troi --> Ghi nhan vao DKC

       )
    group by manv,cty_id, vpdd_id, ban_id, nhom_id,loaibh);

    select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_finish_time from dual;
    test_v_time :=thoigian(test_start_time,test_finish_time);
    rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_104',0, p_user, test_start_time, test_finish_time, test_v_time);



 --2
 test_start_time := test_finish_time;
 rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_2',1, p_user);

  --Phi dau tien nop hop dong dong phi 1 lan
 v_stt:=6;
  insert into nt_giatrictbc
  (ct_id,giatri,donvi,ngaychay,tungay,denngay, manv, cty_id, vpdd_id, ban_id, nhom_id,loaibh,ods_flag)
  (select 'phidt_1lan',sum(nvl(phidt1lan,0)) AS giatri,'dong',v_ngaychay,p_tu,p_den, manv,
           cty_id, vpdd_id, ban_id, nhom_id,loaibh,1
   from
         (
          --1. San pham truyen thong
         select decode(trim(atr.transaction_type_code),'PFSR', 1,'RRPS',-1,0)*ptr.amount as phidt1lan,
               case  when (bent.avail_as_main_benefit = 'Y'  or instr(bent.short_name, '_I', -1) > 0) then
                            pro.product_code
                         else
                            bent.short_name
               end as manv,
               dl.company_code      as cty_id, --cong ty
               dl.sales_office_code as vpdd_id, --phong kinh doanh
               dl.sales_agency_code as ban_id, --ban kinh doanh
               dl.sales_unit_code   as nhom_id, --nhom kinh doanh
                '' as loaibh
          from ods.premium_transaction ptr
               join ods.account_transaction atr on ptr.account_trans_id = atr.account_transaction_id
                                                and atr.transaction_type_code in ('PFSR','RRPS')
                                                and trunc(atr.financial_acct_period) >=  trunc(p_tu)
                                                and trunc(atr.financial_acct_period) <=  trunc(p_den)
               join ods.rider rid on ptr.rider_id = rid.rider_id
               join ods.benefit ben on rid.benefit_id = ben.benefit_id
               join ods.benefit_template bent on ben.benefit_template_id = bent.benefit_template_id
               join ods.product pro on bent.product_id  = pro.product_id
               join ods.account_outlet_relationship aor on aor.account_id = atr.account_id
                                                        and aor.account_outlet_id =(select max (a.account_outlet_id)
                                                                                    from ods.account_outlet_relationship  a
                                                                                    where a.account_id=atr.account_id
                                                                                           and trunc(a.effective_date)  <=  trunc(atr.financial_acct_period)
                                                                                           and a.relationship_type_code = 'SERV')
               join ams.rp_daily dl on dl.outlet_id = aor.outlet_client_id
                                and (
                                     (p_macty is null )
                                     or
                                      (p_macty is not null and dl.company_code = p_macty)
                                     )
                                 and ((dl.from_date <= trunc(atr.financial_acct_period)  and trunc(atr.financial_acct_period) < nvl(dl.to_date, '01/jan/3000')) )

          where
                --and act.payment_frequency_code = 'SING' Khong xay ra truong hop nay.
                --Vi account_transaction ko di voi activity
                --Xac dinh hop dong dong phi 1 lan
                exists
                    (select max(a.activity_id) from ods.activity a
                     where a.payment_frequency_code  = 'SING'
                           and a.is_reversed = 'N'
                           and a.account_id = atr.account_id
                           and trunc(a.bus_processed_date) <= trunc(p_den)
                     )
         -- Releae 3.0.0 Phi SPBT khuyen mai
          -- khong xac dinh dc quan he de lay chinh xac DKR: NA31-NR12/2011 cua BV-NA31/2013 nen phai fixed cung
          union all
          select decode(atr.transaction_type_code, 'RCOI', -1, 1)* atr.gross_amount  as doanhthu,
                 N'NA31-NR12/2011' manv,
                 dl.company_code as cty_id, --cong ty
                 dl.sales_office_code as vpdd_id, --phong kinh doanh
                 dl.sales_agency_code as ban_id, --ban kinh doanh
                 dl.sales_unit_code as nhom_id, --nhom kinh doanh
                 '' as loaibh
         from ods.account acc
             join ods.product pro on pro.product_id = acc.product_id
                                  and pro.product_code = 'BV-NA31/2013'
             join ods.account_transaction atr on atr.account_id = acc.account_id
                                              and trunc(atr.financial_acct_period) >=  trunc(p_tu)
                                              and trunc(atr.financial_acct_period) <=  trunc(p_den)
                                              and atr.transaction_type_code  in ('COI' , 'RCOI')
             join ods.account_outlet_relationship aor on aor.account_id = acc.account_id
                                              and aor.relationship_type_code = 'SERV' -- Dai ly phuc vu
                                              and aor.account_outlet_id =(select max(a.account_outlet_id) from
                                                                                  ods.account_outlet_relationship  a
                                                                                  where a.account_id=atr.account_id
                                                                                  and trunc(a.effective_date)  <= trunc(atr.financial_acct_period)
                                                                                  and a.relationship_type_code = 'SERV')
             join ams.rp_daily dl  on dl.outlet_id = aor.outlet_client_id
                               and ((dl.from_date <= trunc(atr.financial_acct_period)  and trunc(atr.financial_acct_period) < nvl(dl.to_date, '01/jan/3000')) )

         )
      group by  manv,cty_id, vpdd_id, ban_id, nhom_id,loaibh
  );

    --test time
    select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_finish_time from dual;
    test_v_time :=thoigian(test_start_time,test_finish_time);
    rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_2',0, p_user, test_start_time, test_finish_time, test_v_time);

      --3
     test_start_time := test_finish_time;
     rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_3',1, p_user);
     --end test time


  /*Insert cho chi tieu phidt_dky : Phi dau tien nop hop dong dong phi dinh ky
   truong hop: San pham truyen thong
  */
 /*v_stt:=7;
  insert into nt_giatrictbc
  (ct_id,giatri,donvi,ngaychay,tungay,denngay, manv,cty_id, vpdd_id, ban_id, nhom_id,loaibh,ods_flag)
  (select 'phidt_dky',sum(phidky) AS giatri,'dong',v_ngaychay,p_tu,p_den, manv,
           cty_id, vpdd_id, ban_id, nhom_id,loaibh,1
   from
         (

         --1. San pham truyen thong


       \*   Phi dau tien khong co  --2. San pham UVL
       *\
     )
  group by manv,cty_id, vpdd_id, ban_id, nhom_id,loaibh
  ) ;*/

  --test time
  select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_finish_time from dual;
  test_v_time :=thoigian(test_start_time,test_finish_time);
  rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_3',0, p_user, test_start_time, test_finish_time, test_v_time);

   --4
   test_start_time := test_finish_time;
   rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_4',1, p_user);
   --end test time

--Phi thuc thu theo hoa don
  /*Insert cho chi tieu phidky_tttheohdon : Phi thuc thu theo hoa don
   truong hop: San pham truyen thong
  */
 /*v_stt:=9;
 insert into nt_giatrictbc
  (ct_id,giatri,donvi,ngaychay,tungay,denngay,manv, cty_id, vpdd_id, ban_id, nhom_id,loaibh,ods_flag)
  (select 'phidky_tttheohdon',sum(doanhthu) as giatri,'dong',v_ngaychay,p_tu,p_den,manv,cty_id, vpdd_id, ban_id, nhom_id,loaibh,1
  from
       (
          --1. San pham truyen thong
          select decode(trim(atr.transaction_type_code),'PFSR', 1,'RRPS',-1)*prt.amount as doanhthu,
                case  when (bent.avail_as_main_benefit = 'Y'  or instr(bent.short_name, '_I', -1) > 0) then
                            pro.product_code
                         else
                            bent.short_name
                 end as manv,
                 dl.company_code      as cty_id, --cong ty
                 dl.sales_office_code as vpdd_id, --phong kinh doanh
                 dl.sales_agency_code as ban_id, --ban kinh doanh
                 dl.sales_unit_code   as nhom_id, --nhom kinh doanh
                '' as loaibh
          from ods.premium_transaction prt,
               ods.rider rid,
               ods.benefit ben,
               ods.benefit_template bent,
               ods.product pro,
               ods.account_transaction atr,
               ods.account_outlet_relationship aor,
               ams.rp_daily dl
          where --Cac dieu kien lien ket bang
                prt.rider_id = rid.rider_id
                and rid.benefit_id = ben.benefit_id
                and ben.benefit_template_id  = bent.benefit_template_id
                and bent.product_id  = pro.product_id
                and prt.account_trans_id = atr.account_transaction_id
                and atr.account_id = aor.account_id
                and dl.outlet_id  = aor.outlet_client_id
                --Cac dieu kien nghiep vu
                and atr.transaction_type_code in ('PFSR','RRPS')  -- Billing
                and trunc(atr.financial_acct_period) >= trunc(p_tu)
                and trunc(atr.financial_acct_period) <= trunc(p_den)
                and (
                   (p_macty is null )
                   or
                    (p_macty is not null and dl.company_code = p_macty)
                   )
                and ((dl.from_date <= trunc(atr.financial_acct_period)  and trunc(atr.financial_acct_period) < nvl(dl.to_date, '01/jan/3000')) )
                and atr.account_transaction_id not in ( -- Xac dinh giao dich thu 2 tro di
                    select a.account_transaction_id from ods.account_transaction a
                    where
                      trunc(a.processed_date)>= trunc(p_tu)
                      and trunc(a.processed_date)<=trunc(p_den)
                      and not exists (select 1 from ods.account_transaction b
                                                         where b.account_id = a.account_id
                                                         and b.transaction_type_code = 'PFSR'
                                                         and b.processed_date < a.processed_date
                                                         and not exists (select 1 from ods.account_transaction c
                                                                          where c.transaction_type_code = 'RRPS'
                                                                          and c.transaction_event_id = b.transaction_event_id
                                                                          and c.processed_date<=a.processed_date
                                                                        )
                                     )
                )
                and aor.relationship_type_code = 'SERV' -- Dai ly phuc vu
                --and act.payment_frequency_code <> 'SING'
                -- Lay cac truong hop dong phi dinh ky
                and exists
                    (select max(a.activity_id) from ods.activity a
                     where a.payment_frequency_code  <> 'SING'
                           and a.is_reversed = 'N'
                           and a.account_id = atr.account_id
                           and trunc(a.bus_processed_date) >= trunc(p_tu)
                           and trunc(a.bus_processed_date) <= trunc(p_den)
                     )
                and aor.account_outlet_id =(select max(a.account_outlet_id) from
                                          ods.account_outlet_relationship  a
                                          where a.account_id = atr.account_id
                                          and trunc(a.effective_date)  <= trunc(atr.financial_acct_period)
                                          and a.relationship_type_code = 'SERV')
          -- Releae 3.0.0 Phi SPBT khuyen mai
          -- khong xac dinh dc quan he de lay chinh xac DKR: NA31-NR12/2011 cua BV-NA31/2013 nen phai fixed cung
          union all
          select atr.gross_amount  as doanhthu,
                 N'NA31-NR12/2011' manv,
                 dl.company_code as cty_id, --cong ty
                 dl.sales_office_code as vpdd_id, --phong kinh doanh
                 dl.sales_agency_code as ban_id, --ban kinh doanh
                 dl.sales_unit_code as nhom_id, --nhom kinh doanh
                 '' as loaibh
         from ods.account acc
             join ods.product pro on pro.product_id = acc.product_id
                                  and pro.product_code = 'BV-NA31/2013'
             join ods.account_transaction atr on atr.account_id = acc.account_id
                                              and trunc(atr.financial_acct_period) >= trunc(p_tu)
                                              and trunc(atr.financial_acct_period) <= trunc(p_den)
                                              and atr.transaction_type_code  = 'COI'
             join ods.account_outlet_relationship aor on aor.account_id = acc.account_id
                                              and aor.relationship_type_code = 'SERV' -- Dai ly phuc vu
                                              and aor.account_outlet_id =(select max(a.account_outlet_id) from
                                                                                  ods.account_outlet_relationship  a
                                                                                  where a.account_id=atr.account_id
                                                                                  and trunc(a.effective_date)  <= trunc(atr.financial_acct_period)
                                                                                  and a.relationship_type_code = 'SERV')
             join ams.rp_daily dl  on dl.outlet_id = aor.outlet_client_id
                               and ((dl.from_date <= trunc(atr.financial_acct_period)  and trunc(atr.financial_acct_period) < nvl(dl.to_date, '01/jan/3000')) )

       )
    group by manv,cty_id, vpdd_id, ban_id, nhom_id,loaibh);

    --test time
    select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_finish_time from dual;
    test_v_time :=thoigian(test_start_time,test_finish_time);
    rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_4',0, p_user, test_start_time, test_finish_time, test_v_time);
*/

   select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_start_time from dual;
   rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_110',1, p_user);

 v_stt:=91;
  /*Insert cho chi tieu phidky_tttheohdon : Phi thuc thu theo hoa don
   truong hop: San pham UVL
                        Phi ban dau, phi quan ly hop dong, phi phan bo
  */
   --2. San pham UVL
   -- Phi ban dau, phi quan ly hop dong, phi phan bo
   insert into nt_giatrictbc
  (ct_id,giatri,donvi,ngaychay,tungay,denngay,manv, cty_id, vpdd_id, ban_id, nhom_id,loaibh,ods_flag)
  (select ct_id,sum(doanhthu) as giatri,'dong',v_ngaychay,p_tu,p_den,manv,cty_id, vpdd_id, ban_id, nhom_id,loaibh,1
  from
       (
          select
                 case when ft.transaction_type_code in ( 'IWOP', 'RIWP', 'ADJC','RAJC', 'ADJD', 'RADJ') then
                           'phitruythu_khac'
                      else
                           'phidky_tttheohdon'
                      end as ct_id,
                 decode(trim(ft.transaction_type_code),'IWOP',1, 'RIWP',-1,'PFSI',1,'RIPS',-1,'LS',1,'RLS',-1, --phi ban dau, phi phan bo
                                                 'FCO',1,'RFCO',-1,    --chi phi quan ly hop dong
                                                 'WTH',1,'RWTH',-1,    --Rut 1 phan gia tri tai khoan
                                                 'FWTH',1,'RFWT',-1,   --Rut toan bo GTTK
                                                 'FSSC',1,'RFSS',-1,   --Phi huy bo
                                                 'WOSC',1,'RWOS',-1,   --Phi huy bo do Lapse
                                                 'WTH',1,'RWTH',-1,     --Phi dich vu
                                                 'ADJC',1,'RAJC', -1, -- Tang PAV
                                                 'ADJD',1,'RADJ', -1, 0 -- Giam PAV
                         )
                         *ft.effective_amount as doanhthu ,
                 case
                  when (trim(ft.transaction_type_code) in ('PFSI','RIPS','LS','RLS','IWOP', 'RIWP', 'ADJC', 'RAJC')    --ma xac dinh phi phan bo voi ft.expense_type_code is null
                        and (ft.expense_type_code is null )
                        )
                  then   f.fund_short_name
                  else
                         pro.product_code--ODS_LAYMASP_HDID(actr.account_id)
                end  as manv,
                 dl.company_code      as cty_id, --cong ty
                 dl.sales_office_code as vpdd_id, --phong kinh doanh
                 dl.sales_agency_code as ban_id, --ban kinh doanh
                 dl.sales_unit_code   as nhom_id, --nhom kinh doanh
                 case
                  when (trim(ft.transaction_type_code) in ('PFSI','RIPS','LS','RLS','IWOP', 'RIWP', 'ADJC', 'RAJC')    --ma xac dinh phi phan bo voi ft.expense_type_code is null
                        and (ft.expense_type_code is null ))
                    then 'QDT'
                  else ''
                end as loaibh
          from   ods.fund_transaction ft
                 join ods.account_transaction actr on actr.account_transaction_id = ft.account_transaction_id
                 join ods.account acc on acc.account_id  = actr.account_id
                 join ods.product pro on acc.product_id = pro.product_id
                 join ods.account_outlet_relationship aor on aor.account_id = actr.account_id
                 join ams.rp_daily dl on dl.outlet_id  = aor.outlet_client_id
                 left join ods.fund f on f.fund_id = ft.fund_id
          where -- Cac dieu kien lien ket bang

                 ( -- ma xac dinh phi ban dau
                      (ft.transaction_type_code in ('PFSI','RIPS','LS','RLS','IWOP', 'RIWP')
                       and (
                             exists (select 1 from rp_tct_danhmuc dm  -- Phi ban dau
                                              where dm.ma_dm = ft.expense_type_code
                                                    and dm.nhom_id in ('PBD_DK','PBD_DT')
                                                    )
                           )
                      )
                      or -- ma xac dinh phi quan ly hop dong
                      (ft.transaction_type_code in ('FCO','RFCO')
                       and ft.expense_type_code in ('ADMD','RADD')
                      )
                      or --phi bao hiem phan bo chinh la phi dua vao cho quy dau tu
                      (
                          ft.transaction_type_code in ('PFSI','RIPS','LS','RLS','IWOP', 'RIWP', 'ADJC', 'RAJC', 'ADJD', 'RADJ')    --ma xac dinh phi phan bo/tang pav/giam PAV voi ft.expense_type_code is null
                          and ft.expense_type_code is null
                      )
                       or --Rut 1 phan gia tri tai khoan
                      (
                        ft.transaction_type_code in ('WTH','RWTH')
                         and  ft.expense_type_code in ('WFEE','RWFE')
                      )
                      or --Rut toan bo GTTK
                      ( ft.transaction_type_code in ('FWTH','RFWT')
                        and  ft.expense_type_code in ('SURC','RSUR')
                      )
                      or --Phi huy bo
                      (
                       ft.transaction_type_code  in ('FSSC','RFSS')
                       and  ft.expense_type_code in ('SURC','RSUR')
                      )
                      or --huy bo do Lapse
                      (
                       ft.transaction_type_code  in ('WOSC','RWOS')
                       and  ft.expense_type_code in ('SURC','RSUR')
                      )
                      or --phi dich vu
                      (
                       ft.transaction_type_code in ('WTH','RWTH')
                       and  ft.expense_type_code in ('WFES','RWFS')
                      )
                    )
               and (
                   (p_macty is null )
                   or
                    (p_macty is not null and dl.company_code = p_macty)
                   )
               and ((dl.from_date <= trunc(actr.financial_acct_period)  and trunc(actr.financial_acct_period) < nvl(dl.to_date, '01/jan/3000')) )
               and trunc(actr.financial_acct_period) >= trunc(p_tu)
               and trunc(actr.financial_acct_period) <= trunc(p_den)
               and aor.relationship_type_code = 'SERV'
               and aor.account_outlet_id  =(select max(a.account_outlet_id) from ods.account_outlet_relationship  a
                                             where a.account_id=actr.account_id
                                              and  trunc(a.effective_date)  <= trunc(actr.financial_acct_period)
                                              and a.relationship_type_code='SERV'
                                           )
       )
    group by manv,cty_id, vpdd_id, ban_id, nhom_id,loaibh, ct_id);

    select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_finish_time from dual;
    test_v_time :=thoigian(test_start_time,test_finish_time);
    rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_110',0, p_user, test_start_time, test_finish_time, test_v_time);
 v_stt:=92;

   select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_start_time from dual;
   rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_111',1, p_user);


  /*Insert cho chi tieu phidky_tttheohdon : Phi thuc thu theo hoa don
   truong hop: San pham UVL
                        Phi rui ro, phi phu troi
  */
  insert into nt_giatrictbc
  (ct_id,giatri,donvi,ngaychay,tungay,denngay,manv, cty_id, vpdd_id, ban_id, nhom_id,loaibh,ods_flag)
  (select 'phidky_tttheohdon',sum(doanhthu) as giatri,'dong',v_ngaychay,p_tu,p_den,manv,cty_id, vpdd_id, ban_id, nhom_id,loaibh,1
  from
       (  --Phi rui ro, phi phu troi
          select decode(trim(atr.transaction_type_code),'FCO',1,'RFCO',-1,
                                                 'FCL',1,'RFCL',-1,0)
                                                 *ptr.amount as doanhthu,
                 case  when (bent.avail_as_main_benefit = 'Y'  or instr(bent.short_name, '_I', -1) > 0) then
                            pro.product_code
                         else
                            bent.short_name
                 end as manv,
                 dl.company_code      as cty_id, --cong ty
                 dl.sales_office_code as vpdd_id, --phong kinh doanh
                 dl.sales_agency_code as ban_id, --ban kinh doanh
                 dl.sales_unit_code   as nhom_id, --nhom kinh doanh
                 '' as loaibh
          from  ods.premium_transaction ptr,
                ods.account_transaction atr,
                ods.rider rid,
                ods.benefit ben,
                ods.benefit_template bent,
                ods.account_outlet_relationship aor,
                ods.product pro,
                ams.rp_daily dl
          where -- Cac dieu kien lien ket bang
                ptr.account_trans_id = atr.account_transaction_id
                and rid.rider_id = ptr.rider_id
                and ben.benefit_id = rid.benefit_id
                and ben.benefit_template_id = bent.benefit_template_id
                and aor.account_id = atr.account_id
                and dl.outlet_id = aor.outlet_client_id
                and bent.product_id = pro.product_id
                and pro.product_type_code = 'UNIV'  -- san pham UVL
                and atr.transaction_type_code in ('FCO','RFCO',  --phi rui ro
                                                        'FCL','RFCL')   --phi phu troi
                and aor.relationship_type_code = 'SERV'
                and (
                   (p_macty is null )
                   or
                    (p_macty is not null and dl.company_code = p_macty)
                   )
                and ((dl.from_date <= trunc(atr.financial_acct_period)  and trunc(atr.financial_acct_period) < nvl(dl.to_date, '01/jan/3000')) )
                and aor.account_outlet_id  =(select max(a.account_outlet_id) from ods.account_outlet_relationship  a
                                             where a.account_id=atr.account_id
                                              and  trunc(a.effective_date) <= trunc(atr.financial_acct_period)
                                              and a.relationship_type_code='SERV'
                                )
                and trunc(atr.financial_acct_period) >= trunc(p_tu)
                and trunc(atr.financial_acct_period) <= trunc(p_den)

       )
    group by manv,cty_id,vpdd_id, ban_id, nhom_id,loaibh);

    select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_finish_time from dual;
    test_v_time :=thoigian(test_start_time,test_finish_time);
    rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_111',0, p_user, test_start_time, test_finish_time, test_v_time);


     --5
     test_start_time := test_finish_time;
     rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_5',1, p_user);
     --end test time

 -- Truy thu phi do khoi phuc hieu luc hop dong
 -- Luu y truong hop undo hanh dong IS02 se sinh ra activity_code nao? cai nay chua test duoc?
 v_stt:=12;
 -- Chua tinh duoc cot nay do talisman bi loi

--Truy thu phi no khi huy HD, GQQL
  /*Insert cho chi tieu phitruythu_huy : Truy thu phi no khi huy HD, GQQL
    truong hop:  Truy thu phi giai quyet quyen loi
  */
  insert into nt_giatrictbc(ct_id,giatri,donvi,ngaychay,tungay,denngay, manv, cty_id, vpdd_id, ban_id, nhom_id, loaibh,ods_flag)
  (select 'phitruythu_huy',nvl(sum(doanhthu),0) AS giatri,'dong',v_ngaychay,p_tu,p_den, manv,
           cty_id, vpdd_id, ban_id, nhom_id, loaibh, 1
   from
     (
           select  chiso*doanhthu as doanhthu,
                  manv,
                  cty_id,
                  vpdd_id,
                  ban_id,
                  nhom_id,
                   '' as loaibh
            from
            (
                    select
                           cca.transaction_event_id,
                           SUM(cca.amount) as doanhthu,
                           case  when ((bent.avail_as_main_benefit = 'Y') or instr(bent.short_name, '_I', -1) > 0) then
                                  pro.product_code
                               else
                                  bent.short_name
                           end as manv,
                           dl.company_code      as cty_id, --cong ty
                           dl.sales_office_code as vpdd_id, --phong kinh doanh
                           dl.sales_agency_code as ban_id, --ban kinh doanh
                           dl.sales_unit_code   as nhom_id, --nhom kinh doanh
                           '' as loaibh
                     from  (
                                          select * from ods.claim_decision_history cdh1
                                                      where   cdh1.claim_decision_history_id=
                                                (
                                                     select   min(
                                                                       case when length(a.claim_decision_history_id)=9  then a.claim_decision_history_id
                                                                          else (         select max(b.claim_decision_history_id)
                                                                                             from ods.claim_decision_history b
                                                                                             where  b.decision_id=cdh1.decision_id --theo yeu cau moi em Thuy thi khong can ngay gioi han o day nua vi chi can lay quyet dinh cuoi cung
                                                                                             group by b.decision_id
                                                                                   )
                                                                           end
                                                                    )
                                                      from ods.claim_decision_history a
                                                      where  a.decision_id=cdh1.decision_id
                                              )
                                     ) cdh
                                join ods.claim clm on cdh.claim_id = clm.claim_id
                                join (
                                        select *
                                        from ods.claim_rider_link crl1
                                        where   crl1.claim_rider_link_id in
                                        (
                                             select max(crl_temp.claim_rider_link_id)
                                             from ods.claim_rider_link crl_temp
                                                 join ods.rider ridt on ridt.rider_id = crl_temp.rider_id
                                             where crl_temp.claim_decision_control_id = crl1.claim_decision_control_id
                                             group by ridt.entity_id
                                         )
                                      ) crl on cdh.decision_id = crl.claim_decision_control_id and crl.claim_status_code = cdh.status_code
                                join ods.claim_component cc on cc.decision_id=cdh.decision_id
                                                         and cc.component_type_code = 'OSP'

                                join --them dieu kien nay de khi giai quyet quyen loi bao hiem la 0 thi no se lay ra cai quyet dinh moi nhat cua no
                                (             --va moi truong hop deu se lay ra quyet dinh moi nhat cua no
                                        select *
                                        from ods.claim_component_actual cca1
                                        where   cca1.claim_component_actual_id =
                                        (
                                             select max(cca_temp.claim_component_actual_id)
                                             from ods.claim_component_actual  cca_temp
                                             where cca_temp.claim_component_id = cca1.claim_component_id
                                         )
                                ) cca on cca.claim_component_id = cc.claim_component_id
                                inner join ods.rider rid  on (rid.rider_id= crl.rider_id)
                                inner join ods.rider_template rit on rit.rider_template_id=rid.rider_template_id   --de dung cho san pham A23 no co the hien len
                                inner join ods.benefit ben on (ben.benefit_id=rid.benefit_id)
                                inner join ods.benefit_template bent on (bent.benefit_template_id=ben.benefit_template_id)
                                inner join ods.application_form af on af.application_form_id=ben.application_form_id      --lay ra so hop dong cua no
                                join ods.account acc on acc.account_id = af.account_id
                                inner join ods.product pro on (pro.product_id = acc.product_id)
                                inner join ods.account_outlet_relationship aor on aor.account_id= acc.account_id
                                inner join ams.rp_daily dl on dl.outlet_id = aor.outlet_client_id
                          where cdh.status_code  in ('ACCO','ACCP','DECL','DECO', 'VOID')
                                --and trunc(cdh.prior_updated) >= trunc(v_ngaydaunam)
                                -- and trunc(cdh.prior_updated) <= trunc(v_truoc_ptu)
                                and
                                (
                                    (p_macty is null)
                                    or
                                    (p_macty is not null and dl.company_code = p_macty)
                                )
                                and ((dl.from_date <= trunc(cdh.prior_updated) and trunc(cdh.prior_updated) < nvl(dl.to_date, '01/jan/3000')) )
                                and aor.account_outlet_id  =(select max(b.account_outlet_id) from ods.account_outlet_relationship  b
                                                               where b.account_id = acc.account_id
                                                                   and b.effective_date <=  cdh.date_of_decision
                                                                   and b.relationship_type_code = 'SERV'--bay gio lay ra theo dai ly khai thac
                                                  )
                         group by
                                 cca.transaction_event_id,
                                 case  when ((bent.avail_as_main_benefit = 'Y') or instr(bent.short_name, '_I', -1) > 0) then
                                        pro.product_code
                                     else
                                        bent.short_name
                                 end  ,
                                 dl.company_code  , --cong ty
                                 dl.sales_office_code, --phong kinh doanh
                                 dl.sales_agency_code, --ban kinh doanh
                                 dl.sales_unit_code--nhom kinh doanh

            ) slta
            inner join
            --ChinhLK 31/5/2010 xac dinh dk ngay thang thong quan bang Financial_transaction
            (
                select  paym.transaction_event_id,
                    ft_coa.chiso
                from ods.payment paym,
                (

                             select (ftr1.table_row_id + 990000000000) as payment, ftr1.account_period business_date,
                                    dmcs.chi_so chiso,
                                    ftr1.financial_transaction_id
                             from ods.financial_transaction ftr1
                                  ,ods.chart_of_accounts coa1, rp_dmcs_dinhkhoan dmcs
                             where ftr1.source_table = 'Cheq Trans'
                                 and coa1.chart_of_accounts_id = ftr1.account_number_id
                                 and dmcs.no_code  = coa1.account_numbers
                                 and ftr1.debit_credit_indctr = dmcs.no
                                 and dmcs.co_code is null
                                 and trunc(ftr1.account_period) >= trunc(p_tu)
                                 and trunc(ftr1.account_period)<=  trunc(p_den)
                                 and ftr1.effective_amount >0

                 ) ft_coa
                 where  ft_coa.payment  = paym.payment_id
            ) sltb on slta.transaction_event_id = sltb.transaction_event_id
     )
     group by manv,cty_id, vpdd_id, ban_id, nhom_id,loaibh
    ) ;

    --test time
    select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_finish_time from dual;
    test_v_time :=thoigian(test_start_time,test_finish_time);
    rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_5',0, p_user, test_start_time, test_finish_time, test_v_time);

     --5
     test_start_time := test_finish_time;
     rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_6',1, p_user);
     --end test time

-- Cac truong hop thu phi khac(Chua biet cach tinh)
 v_stt:=14;

   --Hoan phi
  /*Insert cho chi tieu hoanphi_14ngay : Hoan phi trong ky tuc la hoan phi 14 ngay hien tai dang ap dung
    truong hop:  San pham TT va Huy DKR
  */
 v_stt:=15;
 insert into nt_giatrictbc
  (ct_id,giatri,donvi,ngaychay,tungay,denngay,manv,cty_id,vpdd_id,ban_id,nhom_id,loaibh,ods_flag)
  (select 'hoanphi_14ngay',sum(doanhthu) as giatri,'dong',v_ngaychay,p_tu,p_den,manv,cty_id,vpdd_id,ban_id,nhom_id,loaibh,1
  from
       (
               -- Giao dich hoan phi khong toan tai trong bang Payment hoac so tien  = 0
               -- San pham TT va Huy DKR
               select decode(atr.transaction_type_code,'RREF',1,'LIQU',1, -1)*COALESCE(prt.amount, ft.effective_amount, atr.gross_amount ) as doanhthu,
               case when atr.transaction_type_code in ('LIQU','RLIQ') then
                         f.fund_short_name
                   else
                         case  when bent.avail_as_main_benefit is null or (bent.avail_as_main_benefit = 'Y'  or instr(bent.short_name, '_I', -1) > 0) then
                                  pro.product_code
                               else
                                  bent.short_name
                         end
                   end  as manv,
                   dl.company_code      as cty_id, --cong ty
                   dl.sales_office_code as vpdd_id, --phong kinh doanh
                   dl.sales_agency_code as ban_id, --ban kinh doanh
                   dl.sales_unit_code   as nhom_id, --nhom kinh doanh
                   decode(atr.transaction_type_code,'LIQU', 'QDT','RLIQ','QDT', '' ) as loaibh
                from ods.account acc
                     join ods.account_transaction atr on atr.account_id = acc.account_id
                                                      and atr.transaction_type_code in ('RREF','RRRE', 'LIQU', 'RLIQ')
                                                      and trunc(atr.financial_acct_period) >= trunc(p_tu)
                                                      and trunc(atr.financial_acct_period) <= trunc(p_den)
                                                      --Xac dinh giao dich co lien quan de huy 14 ngay - truong hop Reversed khong co quan he voi Acitivity huy 14 ngay
                                                      and exists (select 1 from ods.activity act
                                                                                join ods.account_transaction atr1 on atr1.activity_id = act.activity_id
                                                                                                                  and atr1.transaction_type_code in ('LIQU', 'RREF')
                                                                                                                  and act.activity_code in ('P107','P199')
                                                                              where   act.account_id = atr.account_id
                                                                                      and atr1.transaction_event_id = atr.transaction_event_id
                                                                                      )
                                                      and
                                                          (
                                                              not exists --khong ton tai giao dich trong bang payment tuc la no chua thanh toan
                                                              (
                                                                  select   1
                                                                  from  ods.payment paym
                                                                  where  paym.transaction_event_id = atr.transaction_event_id
                                                              )
                                                              or exists --co ton tai giao dich nhung so tien = 0
                                                              (
                                                                  select 1
                                                                  from ods.payment paym
                                                                  where paym.transaction_event_id = atr.transaction_event_id
                                                                      and paym.amount = 0
                                                              )
                                                          )
                     join ods.product pro on pro.product_id  = acc.product_id
                     join ods.account_outlet_relationship aor on acc.account_id = aor.account_id
                                                              and aor.account_outlet_id =(select max(a.account_outlet_id)
                                                                      from ods.account_outlet_relationship  a
                                                                      where a.account_id=atr.account_id
                                                                          and trunc(a.effective_date) <= trunc(atr.financial_acct_period)
                                                                          and a.relationship_type_code = 'SERV'
                                                                     )
                     join ams.rp_daily dl on dl.outlet_id  = aor.outlet_client_id
                                      and (
                                         (p_macty is null )
                                         or
                                          (p_macty is not null and dl.company_code = p_macty)
                                         )
                                      and ((dl.from_date <= trunc(atr.financial_acct_period)  and trunc(atr.financial_acct_period) < nvl(dl.to_date, '01/jan/3000')) )
                     left join ods.premium_transaction prt on prt.account_trans_id = atr.account_transaction_id
                     left join ods.fund_transaction ft on ft.account_transaction_id = atr.account_transaction_id
                                                       and ft.expense_type_code is null
                     left join ods.fund f on f.fund_id = ft.fund_id
                     left join ods.rider rid on prt.rider_id = rid.rider_id
                     left join ods.benefit ben on ben.benefit_id = rid.benefit_id
                     left join ods.benefit_template bent on ben.benefit_template_id = bent.benefit_template_id
               )
            group by manv,cty_id,vpdd_id, ban_id, nhom_id,loaibh);

    --test time
    select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_finish_time from dual;
    test_v_time :=thoigian(test_start_time,test_finish_time);
    rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_6',0, p_user, test_start_time, test_finish_time, test_v_time);

   select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_start_time from dual;
   rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_113',1, p_user);
 v_stt:=151;
   --Hoan phi
  /*Insert cho chi tieu hoanphi_14ngay : Hoan phi trong ky tuc la hoan phi 14 ngay hien tai dang ap dung
    truong hop: San pham TT  huy DKC va SPUVL , SPTT Huy DKR
                        voi hoan phi thuc thu da co du lieu trong bang financial_transaction
  */
   insert into nt_giatrictbc
    (ct_id,giatri,donvi,ngaychay,tungay,denngay,manv,cty_id,vpdd_id,ban_id,nhom_id,loaibh,ods_flag)
    (select 'hoanphi_14ngay',sum(doanhthu) as giatri,'dong',v_ngaychay,p_tu,p_den,manv,cty_id,vpdd_id,ban_id,nhom_id,loaibh,1
    from
         (
            --hoan phi thuc thu da co du lieu trong bang financial_transaction
                select  doanhthu*chiso  as doanhthu,
                     manv,
                     cty_id,
                     vpdd_id, --phong kinh doanh
                     ban_id, --ban kinh doanh
                     nhom_id, --nhom kinh doanh
                     loaibh
                from
                (
                   select COALESCE(prt.amount, ft.effective_amount, atr.gross_amount ) as doanhthu,
                   case when atr.transaction_type_code in ('LIQU','RLIQ') then
                          f.fund_short_name
                       else
                           case  when bent.avail_as_main_benefit is null or (bent.avail_as_main_benefit = 'Y'  or instr(bent.short_name, '_I', -1) > 0) then
                                pro.product_code
                             else
                                bent.short_name
                             end
                       end as manv,
                   dl.company_code      as cty_id, --cong ty
                   dl.sales_office_code as vpdd_id, --phong kinh doanh
                   dl.sales_agency_code as ban_id, --ban kinh doanh
                   dl.sales_unit_code   as nhom_id, --nhom kinh doanh
                   atr.transaction_event_id,
                   decode(atr.transaction_type_code,'LIQU', 'QDT','RLIQ','QDT', '' ) as loaibh
                from ods.account acc
                     join ods.account_transaction atr on acc.account_id = atr.account_id
                                                      and atr.transaction_type_code in ('RREF', 'LIQU')
                                                       --Xac dinh giao dich co lien quan de huy 14 ngay - truong hop Reversed khong co quan he voi Acitivity huy 14 ngay
                                                      and exists (select 1 from ods.activity act
                                                                                join ods.account_transaction atr1 on atr1.activity_id = act.activity_id
                                                                                                                  and atr1.transaction_type_code in ('LIQU', 'RREF')
                                                                                                                  and act.activity_code in ('P107','P199')
                                                                              where   act.account_id = atr.account_id
                                                                                      and atr1.transaction_event_id = atr.transaction_event_id
                                                                                      )
                     left join ods.fund_transaction ft on ft.account_transaction_id = atr.account_transaction_id
                                                       and ft.expense_type_code is null
                     left join ods.fund f on f.fund_id = ft.fund_id
                     join ods.product pro on pro.product_id = acc.product_id
                     join ods.account_outlet_relationship aor on acc.account_id = aor.account_id
                                                               and aor.account_outlet_id =(select max(a.account_outlet_id)
                                                                      from ods.account_outlet_relationship  a
                                                                      where a.account_id=atr.account_id
                                                                          and trunc(a.effective_date) <= trunc(atr.financial_acct_period)
                                                                          and a.relationship_type_code = 'SERV'
                                                                     )
                     join ams.rp_daily dl on dl.outlet_id  = aor.outlet_client_id
                                      and (
                                         (p_macty is null )
                                         or
                                          (p_macty is not null and dl.company_code = p_macty)
                                         )
                                      and ((dl.from_date <= trunc(atr.financial_acct_period)  and trunc(atr.financial_acct_period) < nvl(dl.to_date, '01/jan/3000')) )

                     left join ods.premium_transaction prt on prt.account_trans_id = atr.account_transaction_id
                     left join ods.rider rid on prt.rider_id = rid.rider_id
                     left join ods.benefit ben on ben.benefit_id = rid.benefit_id
                     left join ods.benefit_template bent on ben.benefit_template_id = bent.benefit_template_id
               ) slta
                    inner join
                    --ChinhLK 31/5/2010 xac dinh dk ngay thang thong quan bang Financial_transaction
                    (
                        select  paym.transaction_event_id,
                            ft_coa.chiso
                        from ods.payment paym,
                        (

                                 select (ftr1.table_row_id + 990000000000) as payment, ftr1.account_period business_date,
                                        dmcs.chi_so chiso,
                                        ftr1.financial_transaction_id
                                 from ods.financial_transaction ftr1
                                      ,ods.chart_of_accounts coa1, rp_dmcs_dinhkhoan dmcs
                                 where ftr1.source_table = 'Cheq Trans'
                                     and coa1.chart_of_accounts_id = ftr1.account_number_id
                                     and dmcs.no_code  = coa1.account_numbers
                                     and ftr1.debit_credit_indctr = dmcs.no
                                     and dmcs.co_code is null
                                     and trunc(ftr1.account_period) >= trunc(p_tu)
                                     and trunc(ftr1.account_period)<=  trunc(p_den)
                                     and ftr1.effective_amount >0

                     ) ft_coa
                     where  ft_coa.payment  = paym.payment_id
                    ) sltb on slta.transaction_event_id = sltb.transaction_event_id
   )
group by manv,cty_id,vpdd_id, ban_id, nhom_id,loaibh);

    select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_finish_time from dual;
    test_v_time :=thoigian(test_start_time,test_finish_time);
    rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_113',0, p_user, test_start_time, test_finish_time, test_v_time);

     --6
     test_start_time := test_finish_time;
     rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_7',1, p_user);
     --end test time

--Tong doanh thu phi bao hiem thuc thu trong ky bao cao
 v_stt:=16;
-- = cot 8+9+10+11+12+13+14-15

--Phi dinh ky thuc thu cua cac hop dong KTM trong nam
 v_stt:=18;
   /* chinhlk 9/12/2010 tach chi  tieu phidkytt_ktmnam  cac loai phi chia le ra de chay nhanh hon
                                     chia thanh cac cau lenh insert tieng biet : Khong dung union nua
                                     - Phi dinh ky thuc thu cua SP Truyen thong
                                     -Phi ban dau, phi quan ly hop dong, phi phan bo cua SP UVL: Chia thanh cac cau query nho hon
                                     -Phi rui ro, phi phu troi
                                     */
  /*Insert cho chi tieu phidkytt_ktmnam : Phi dinh ky thuc thu cua cac hop dong khai thac moi trong nam
   truong hop: Doanh thu cua San pham truyen thong : Phi dinh ky thuc thu cua SP Truyen thong
  */
  insert into nt_giatrictbc
  (ct_id,giatri,donvi,ngaychay,tungay,denngay, manv, cty_id,vpdd_id,ban_id,nhom_id,loaibh,ods_flag)
  (select 'phidkytt_ktmnam',nvl(sum(doanhthu),0) AS giatri,'dong',v_ngaychay,p_tu,p_den, manv,
          cty_id,vpdd_id,ban_id,nhom_id,loaibh,1
   from
       (  -- Phai tinh dua tren cac cot tu 6 den 16 cho tat cac cac truong hop thuc thu
          --8+9
          --1. San pham truyen thong
          select decode(trim(atr.transaction_type_code),'PFSR', 1,'RRPS',-1)*prt.amount as doanhthu,
                 --ods_lay_masp(rid.benefit_id) as manv,
                 case  when (bent.avail_as_main_benefit = 'Y'  or instr(bent.short_name, '_I', -1) > 0) then
                      pro.product_code
                   else
                      bent.short_name
                 end as manv,
                 dl.company_code      as cty_id, --cong ty
                 dl.sales_office_code as vpdd_id, --phong kinh doanh
                 dl.sales_agency_code as ban_id, --ban kinh doanh
                 dl.sales_unit_code   as nhom_id, --nhom kinh doanh
                 '' as loaibh
          from ods.premium_transaction prt,
               ods.rider rid,
               ods.benefit ben,
               ods.benefit_template bent,
               ods.product pro,
               ods.account_transaction atr,
               ods.account_outlet_relationship aor,
       /*        ods.outlet oul,*/
               ams.rp_daily dl
          where --Cac dieu kien lien ket bang
                prt.rider_id = rid.rider_id
                and rid.benefit_id  = ben.benefit_id
                and ben.benefit_template_id= bent.benefit_template_id
                and bent.product_id = pro.product_id
                and prt.account_trans_id = atr.account_transaction_id
                and atr.account_id = aor.account_id
                /*and aor.outlet_client_id = oul.outlet_client_id*/
                and dl.outlet_id = aor.outlet_client_id
                --Cac dieu kien nghiep vu
                and atr.transaction_type_code in ('PFSR','RRPS')  -- Billing
                and trunc(atr.financial_acct_period) >= trunc(v_ngaydaunam)
                and trunc(atr.financial_acct_period) <= trunc(p_den)
                and (
                   (p_macty is null )
                   or
                    (p_macty is not null and dl.company_code = p_macty)
                   )
                and ((dl.from_date <= trunc(atr.financial_acct_period)  and trunc(atr.financial_acct_period) < nvl(dl.to_date, '01/jan/3000')) )

                and aor.relationship_type_code = 'SERV' -- Dai ly phuc vu
                and aor.account_outlet_id  =(select max(a.account_outlet_id) from ods.account_outlet_relationship  a
                                             where a.account_id=atr.account_id
                                              and  trunc(a.effective_date) <=  trunc(atr.financial_acct_period)
                                              and a.relationship_type_code='SERV'
                                           )
                and exists -- Cac hop dong khai thac moi trong nam
                    (select 1 from ods.activity a
                     where a.activity_code in ('A100','R100')
                           and a.account_id = atr.account_id
                           and trunc(a.bus_processed_date) >= trunc(v_ngaydaunam)
                           and trunc(a.bus_processed_date) <= trunc(p_den)
                     )
           )
      group by manv,cty_id, vpdd_id, ban_id, nhom_id,loaibh
   ) ;

  test_start_time := test_finish_time;
  rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_7',1, p_user);
 v_stt:=181;
  test_start_time := test_finish_time;
  rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_7.1',1, p_user);
  /*Insert cho chi tieu phidkytt_ktmnam : Phi dinh ky thuc thu cua cac hop dong khai thac moi trong nam
   truong hop: Doanh thu cua San pham UVL : Phi ban dau, phi quan ly hop dong, phi phan bo
  */
  insert into nt_giatrictbc
  (ct_id,giatri,donvi,ngaychay,tungay,denngay, manv, cty_id,vpdd_id,ban_id,nhom_id,loaibh,ods_flag)
  (select 'phidkytt_ktmnam',nvl(sum(doanhthu),0) AS giatri,'dong',v_ngaychay,p_tu,p_den, manv,
          cty_id,vpdd_id,ban_id,nhom_id,loaibh,1
   from
       (
           --2. San pham UVL
          --union all
          -- Phi ban dau, phi quan ly hop dong, phi phan bo
          select     --chu y la o day thi chi dua va cai transaction type code de co the tinh doi voi revert con expense type code thi
                         --
                 decode(trim(ft.transaction_type_code),'IWOP',1, 'RIWP',-1,'PFSI',1,'RIPS',-1,'LS',1,'RLS',-1, --phi ban dau, phi phan bo
                                                 'FCO',1,'RFCO',-1,0)    --chi phi quan ly hop dong
                                                 *ft.effective_amount as doanhthu ,
                 case
                  when (trim(ft.transaction_type_code) in ('PFSI','RIPS','LS','RLS','IWOP', 'RIWP')    --ma xac dinh phi phan bo voi ft.expense_type_code is null
                        and ft.expense_type_code is null)
                  then f.fund_short_name
                  else
                        pro.product_code-- ODS_LAYMASP_HDID(actr.account_id)
                end  as manv,
                 dl.company_code      as cty_id, --cong ty
                 dl.sales_office_code as vpdd_id, --phong kinh doanh
                 dl.sales_agency_code as ban_id, --ban kinh doanh
                 dl.sales_unit_code   as nhom_id, --nhom kinh doanh
                 case
                  when (trim(ft.transaction_type_code) in ('PFSI','RIPS','LS','RLS','IWOP', 'RIWP')    --ma xac dinh phi phan bo voi ft.expense_type_code is null
                        and (ft.expense_type_code is null ))
                    then 'QDT'
                  else ''
                end as loaibh
          from   ods.fund_transaction ft
                 join ods.account_transaction actr on actr.account_transaction_id = ft.account_transaction_id
                 join ods.account_outlet_relationship aor on aor.account_id = actr.account_id
                 join ods.account acc on actr.account_id = acc.account_id
                 join ods.product pro on acc.product_id = pro.product_id
                 join ams.rp_daily dl on dl.outlet_id  = aor.outlet_client_id
                 left join ods.fund f on f.fund_id= ft.fund_id
          where  ( -- ma xac dinh phi ban dau
                      (ft.transaction_type_code in ('PFSI','RIPS','LS','RLS','IWOP', 'RIWP')
                       and (  exists (select 1 from rp_tct_danhmuc dm
                                                  where dm.ma_dm = ft.expense_type_code
                                                        and dm.nhom_id in ('PBD_DK','PBD_DT')))

                      )
                      or -- ma xac dinh phi quan ly hop dong
                      (ft.transaction_type_code in ('FCO','RFCO')
                       and ft.expense_type_code in ('ADMD','RADD')
                      )
                      or --phi bao hiem phan bo chinh la phi dua vao cho quy dau tu
                      (
                          ft.transaction_type_code in ('PFSI','RIPS','LS','RLS','IWOP', 'RIWP')    --ma xac dinh phi phan bo voi ft.expense_type_code is null
                          and ft.expense_type_code is null
                      )
                    )
               and (
                   (p_macty is null )
                   or
                    (p_macty is not null and dl.company_code = p_macty)
                   )
                and ((dl.from_date <= trunc(actr.financial_acct_period)  and trunc(actr.financial_acct_period) < nvl(dl.to_date, '01/jan/3000')) )

               and trunc(actr.financial_acct_period) >= trunc(v_ngaydaunam)
               and trunc(actr.financial_acct_period) <= trunc(p_den)
               and aor.relationship_type_code = 'SERV'
               and aor.account_outlet_id  =(select max(a.account_outlet_id) from ods.account_outlet_relationship  a
                                             where a.account_id=actr.account_id
                                              and trunc(a.effective_date)  <= trunc(actr.financial_acct_period)
                                              and a.relationship_type_code='SERV'
                                           )
               and exists -- Cac hop dong khai thac moi trong nam
                    (select 1 from ods.activity a
                     where a.activity_code in ('A100','R100')
                           and a.account_id = actr.account_id
                           and trunc(a.bus_processed_date) >= trunc(v_ngaydaunam)
                           and trunc(a.bus_processed_date) <= trunc(p_den)
                     )
       )
  group by manv,cty_id, vpdd_id, ban_id, nhom_id,loaibh
  ) ;
  select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_finish_time from dual;
  test_v_time :=thoigian(test_start_time,test_finish_time);
  rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_7.1',0, p_user, test_start_time, test_finish_time, test_v_time);

 v_stt:=182;
  test_start_time := test_finish_time;
  rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_7.2',1, p_user);
  /*Insert cho chi tieu phidkytt_ktmnam : Phi dinh ky thuc thu cua cac hop dong khai thac moi trong nam
   truong hop: Doanh thu cua San pham UVL : Phi rui ro, phi phu troi
  */
  insert into nt_giatrictbc
  (ct_id,giatri,donvi,ngaychay,tungay,denngay, manv, cty_id,vpdd_id,ban_id,nhom_id,loaibh,ods_flag)
  (select 'phidkytt_ktmnam',nvl(sum(doanhthu),0) AS giatri,'dong',v_ngaychay,p_tu,p_den, manv,
          cty_id,vpdd_id,ban_id,nhom_id,loaibh,1
   from
       (
          -- Phi rui ro, phi phu troi
          --union all
          select decode(trim(atr.transaction_type_code),'FCO',1,'RFCO',-1,
                                                 'FCL',1,'RFCL',-1,0)
                                                 *ptr.amount as doanhthu,
                -- ods_lay_masp(ben.benefit_id, 0) as manv,
                 case  when (bent.avail_as_main_benefit = 'Y'  or instr(bent.short_name, '_I', -1) > 0) then
                      pro.product_code
                   else
                      bent.short_name
                 end as manv,
                 dl.company_code      as cty_id, --cong ty
                 dl.sales_office_code as vpdd_id, --phong kinh doanh
                 dl.sales_agency_code as ban_id, --ban kinh doanh
                 dl.sales_unit_code   as nhom_id, --nhom kinh doanh
                 '' as loaibh
          from  ods.premium_transaction ptr,
                ods.account_transaction atr,
              /*  ods.account acc,*/
                ods.rider rid,
                ods.benefit ben,
                ods.benefit_template bent,
                ods.account_outlet_relationship aor,
              /*  ods.outlet ol,*/
                ods.product pro,
                ams.rp_daily dl
          where -- Cac dieu kien lien ket bang
                ptr.account_trans_id = atr.account_transaction_id
                /*and atr.account_id = acc.account_id*/
                and rid.rider_id = ptr.rider_id
                and ben.benefit_id = rid.benefit_id
                and bent.benefit_template_id = ben.benefit_template_id
                and aor.account_id = atr.account_id
                /*and ol.outlet_client_id = aor.outlet_client_id*/
                and dl.outlet_id  = aor.outlet_client_id
                and bent.product_id = pro.product_id
                and pro.product_type_code = 'UNIV'  -- san pham UVL
                and atr.transaction_type_code in ('FCO','RFCO',  --phi rui ro
                                                        'FCL','RFCL')   --phi phu troi
                and aor.relationship_type_code = 'SERV'
                and (
                   (p_macty is null )
                   or
                    (p_macty is not null and dl.company_code = p_macty)
                   )
                and ((dl.from_date <= trunc(atr.financial_acct_period)  and trunc(atr.financial_acct_period) < nvl(dl.to_date, '01/jan/3000')) )

                and aor.account_outlet_id  =(select max(a.account_outlet_id) from ods.account_outlet_relationship  a
                                             where a.account_id=atr.account_id
                                              and trunc(a.effective_date)  <=  trunc(atr.financial_acct_period)
                                              and a.relationship_type_code='SERV'
                                )
                and trunc(atr.financial_acct_period) >= trunc(v_ngaydaunam)
                and trunc(atr.financial_acct_period) <= trunc(p_den)
                and exists -- Cac hop dong khai thac moi trong nam
                    (select 1 from ods.activity a
                     where a.activity_code in ('A100','R100')
                           and a.account_id = atr.account_id
                           and trunc(a.bus_processed_date) >= trunc(v_ngaydaunam)
                           and trunc(a.bus_processed_date) <= trunc(p_den)
                     )
          --group by ods_lay_masp(ben.benefit_id, 0)

        )
      group by manv,cty_id, vpdd_id, ban_id, nhom_id,loaibh
  ) ;

    --test time
    select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_finish_time from dual;
    test_v_time :=thoigian(test_start_time,test_finish_time);
    rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_7.2',0, p_user, test_start_time, test_finish_time, test_v_time);

     --7
     test_start_time := test_finish_time;
     rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_8',1, p_user);
     --end test time

  /*Insert cho chi tieu phinam_qdoi : Phi qui nam cua cac hop dong KTM tu dau nam den cuoi ky bao cao
  */
  v_stt:=19;
  insert into nt_giatrictbc
  (ct_id,giatri,donvi,ngaychay,tungay,denngay, manv, cty_id, vpdd_id, ban_id, nhom_id,loaibh,ods_flag)
  (select 'phinam_qdoi',sum(nvl(phinam_qdoi,0)) AS giatri,'dong',v_ngaychay,p_tu,p_den, manv,
           cty_id, vpdd_id, ban_id, nhom_id, loaibh,1
   from

       (select
              --ben.annual_prem
              case when pro.product_type_code = 'TRLF' then
                            nvl(dky.chiso, decode(act.payment_frequency_code, 'SING', 0.1, act.freq_per_annum) ) * ben.instalment_prem
                       else -- UNIV
                            nvl(dky.chiso, decode(act.payment_frequency_code, 'SING', 0.1, act.freq_per_annum)) * ben.regular_premium

              end  AS phinam_qdoi,
              -- ods_lay_masp(ben.benefit_id,0) as manv,
              case  when ((bent.avail_as_main_benefit = 'Y') or instr(bent.short_name, '_I', -1) > 0) then
                        pro.product_code
                     else
                        bent.short_name
               end as manv,
               dl.company_code      as cty_id, --cong ty
               dl.sales_office_code as vpdd_id, --phong kinh doanh
               dl.sales_agency_code as ban_id, --ban kinh doanh
               dl.sales_unit_code   as nhom_id, --nhom kinh doanh
               '' as loaibh
        from ods.activity act

             join ods.account_outlet_relationship aor on aor.account_id = act.account_id and
                                                            aor.relationship_type_code = 'SERV'

             join ods.activity_benefit_link abl on act.activity_id = abl.activity_id
             join ods.benefit ben on abl.benefit_id = ben.benefit_id
             join ods.benefit_template  bent on bent.benefit_template_id= ben.benefit_template_id
             join ods.product pro on pro.product_id = bent.product_id
             LEFT JOIN rp_tct_danhmuc dky on dky.ten_dm = act.payment_frequency_code
                                             and dky.nhom_id = 'SING_1'
                                             and dky.ma_dm = pro.product_code
             join ams.rp_daily dl on (dl.outlet_id = aor.outlet_client_id)
        where 1=1
                and trunc(act.bus_processed_date) >=  trunc(v_ngaydaunam)
                and trunc(act.bus_processed_date) <= trunc(p_den)
                and (
                   (p_macty is null )
                   or
                    (p_macty is not null and dl.company_code = p_macty)
                   )
                and ((dl.from_date <= trunc(act.bus_processed_date)  and trunc(act.bus_processed_date) < nvl(dl.to_date, '01/jan/3000')) )

                and aor.account_outlet_id =(select max (a.account_outlet_id)
                                            from ods.account_outlet_relationship  a
                                            where a.account_id=act.account_id
                                                   and trunc(a.effective_date)  <= trunc(act.bus_processed_date)
                                                   and a.relationship_type_code = 'SERV')
              and exists
                  (select 1 from ods.activity a
                   where a.activity_code in ('A100')
                         and a.account_id = act.account_id
                         and trunc(a.bus_processed_date) >= trunc(v_ngaydaunam)
                         and trunc(a.bus_processed_date) <= trunc(p_den)
                         and not exists (select 1 from ods.activity ac
                                         where ac.reversed_acti_id = a.activity_id
                                         --chinhlk them
                                         and ac.account_id= a.account_id
                                         and ac.bus_processed_date <=trunc(p_den) )
                   )
              and act.activity_id  = -- bctk_function.GET_LAST_ACTIVITY(act.account_id,v_ngaydaunam,p_den)
                                    ( select max(act1.activity_id) from ods.activity act1
                                      where trunc(act1.bus_processed_date) <= trunc(p_den)
                                      and act.account_id = act1.account_id
                                      and act1.is_reversed is not null
                                      and not exists (select 1 from ods.activity act2
                                                               where act2.reversed_acti_id = act1.activity_id
                                                                    --and act2.account_id= act1.account_id
                                                                     and act2.account_id= act.account_id
                                                                     and trunc(act2.bus_processed_date) <= trunc(p_den)

                                                     )
                                    )

          -- 7.5.2010: ChinhLK bo sung
              and ben.status_code not in  ('OF', 'PA', 'PIF')
              )
          -- 7.5.2010: ChinhLK bo sung
          group by manv,cty_id, vpdd_id, ban_id, nhom_id, loaibh

  );

    --test time
    select to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') into  test_finish_time from dual;
    test_v_time :=thoigian(test_start_time,test_finish_time);
    rp_capnhat_chaybc(p_macty, p_ngay,p_tu,p_den,'Test_VBDT02_8',0, p_user, test_start_time, test_finish_time, test_v_time);


  commit;
  EXCEPTION
   when others then
      rollback;
      err :=sqlerrm;
    insert into rp_loibc
      (stt, noidung, maubaocao, ngaychay, tungay, denngay,cty_id,ods_flag)
    values
      (v_stt, err, 'VBHD03_02', v_ngaychay, p_tu, p_den,p_macty,1);
    commit;
END ;
/
