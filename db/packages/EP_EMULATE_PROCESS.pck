create or replace package EP_EMULATE_PROCESS is

procedure ep_log_view(
    pr_class_name    varchar2,
    pr_function_name varchar2,
    pr_message       varchar2,
    pr_create_user  varchar2);

  procedure program_add(
    pr_program_id  in out number,
    pr_company_ams_id varchar2,
    pr_doc_no  varchar2,
    pr_doc_date  date,
    pr_program_name  varchar2,
    pr_from_date  date,
    pr_to_date  date,
    pr_emule_role  number,
    pr_emule_period_id  number,
    pr_emulate_type_arr varchar2,
    pr_emulate_obj_arr varchar2,
    pr_target_obj_arr varchar2,
    pr_emule_object_name  varchar2,
    pr_target_object_name  varchar2,
    pr_target_company_ams_id varchar2,
    pr_month_arr varchar2,
    pr_quarter_arr varchar2,
    pr_user  varchar2);

  procedure program_update(
    pr_program_id  number,
    pr_company_ams_id varchar2,
    pr_doc_no  varchar2,
    pr_doc_date  date,
    pr_program_name  varchar2,
    pr_from_date  date,
    pr_to_date  date,
    pr_emule_role  number,
    pr_emule_period_id  number,
    pr_emulate_type_arr varchar2,
    pr_emulate_obj_arr varchar2,
    pr_target_obj_arr varchar2,
    pr_emule_object_name  varchar2,
    pr_target_object_name  varchar2,
    pr_target_company_ams_id varchar2,
    pr_month_arr varchar2,
    pr_quarter_arr varchar2,
    pr_status  number,
    pr_user  varchar2);

  procedure program_delete(
      pr_program_id  number);

  procedure program_update_status(
    pr_program_id  number,
    pr_status  number,
    pr_user  varchar2);
  procedure program_update_company_cac(
    pr_program_id  number,
    pr_cac_company_ams_id varchar2,
    pr_user  varchar2);
  procedure program_cost_add(
      pr_program_cost_id  in out number,
      pr_company_ams_id  varchar2,
      pr_emule_type_id   number,
      pr_program_id number,
      pr_type    number,
      pr_month_1 number,
      pr_month_2 number,
      pr_month_3 number,
      pr_month_4 number,
      pr_month_5 number,
      pr_month_6 number,
      pr_month_7 number,
      pr_month_8 number,
      pr_month_9 number,
      pr_month_10 number,
      pr_month_11 number,
      pr_month_12 number,
      pr_month_13 number,
      pr_month_all number,
      pr_record_date  varchar2,--dau vao cho no la loai gi neu ma theo nam thi se ghi la nam bao nhieu cho no
      pr_user varchar2);

  procedure program_cost_update(
      pr_program_cost_id  number,
      pr_company_ams_id  varchar2,
      pr_emule_type_id   number,
      pr_program_id number,
      pr_type    number,
      pr_month_1 number,
      pr_month_2 number,
      pr_month_3 number,
      pr_month_4 number,
      pr_month_5 number,
      pr_month_6 number,
      pr_month_7 number,
      pr_month_8 number,
      pr_month_9 number,
      pr_month_10 number,
      pr_month_11 number,
      pr_month_12 number,
      pr_month_13 number,
      pr_month_all number,
      pr_record_date  varchar2,--dau vao cho no la loai gi neu ma theo nam thi se ghi la nam bao nhieu cho no
      pr_user varchar2);
  procedure program_cost_update_year(
      pr_company_ams_id  varchar2,
      pr_month_1 number,
      pr_month_2 number,
      pr_month_3 number,
      pr_month_4 number,
      pr_month_5 number,
      pr_month_6 number,
      pr_month_7 number,
      pr_month_8 number,
      pr_month_9 number,
      pr_month_10 number,
      pr_month_11 number,
      pr_month_12 number,
      pr_month_13 number,
      pr_record_date  varchar2,--dau vao cho no la loai gi neu ma theo nam thi se ghi la nam bao nhieu cho no
      pr_user varchar2);      
  procedure program_cost_delete(
      pr_program_cost_id  number);
  procedure file_attach_add(
      pr_file_attach_id  in out number,
      pr_program_id	number,
      pr_file_name	varchar2,
      pr_type	number,
      pr_url	varchar2,
      pr_file_size number,
      pr_user varchar2);
  procedure file_attach_update(
      pr_file_attach_id number,
      pr_program_id	number,
      pr_file_name	varchar2,
      pr_url	varchar2,
      pr_user varchar2);
  procedure file_attach_delete(
      pr_file_attach_id  number);
  procedure file_attach_update_poster(
      pr_file_attach_id number,
      pr_user varchar2);
  procedure program_result_add(
      pr_program_result_id  in out number,
      pr_program_id number,
      pr_company_account_id  varchar2,
      pr_outlet_ams_id    varchar2,
      pr_outlet_name    varchar2,
      pr_company_name   varchar2,
      pr_money number,
      pr_user varchar2);
  procedure program_result_add_batch(
      pr_program_result_id  in out number,
      pr_program_id number,
      pr_company_account_id  varchar2,
      pr_outlet_ams_id    varchar2,
      pr_outlet_name    varchar2,
      pr_company_name   varchar2,
      pr_money varchar2,
      pr_user varchar2);
  procedure program_result_update(
      pr_program_result_id number,
      pr_outlet_ams_id varchar2,
      pr_outlet_name  varchar2,
      pr_company_name   varchar2,
      pr_money number,
      pr_user varchar2);
  procedure program_result_delete(
      pr_program_result_id  number);
  procedure program_result_delete_all(
      pr_program_id  number);
  procedure program_plan_add(
      pr_program_plan_id  in out number,
      pr_company_ams_id  varchar2,
      pr_month_1 number,
      pr_month_2 number,
      pr_month_3 number,
      pr_month_4 number,
      pr_month_5 number,
      pr_month_6 number,
      pr_month_7 number,
      pr_month_8 number,
      pr_month_9 number,
      pr_month_10 number,
      pr_month_11 number,
      pr_month_12 number,
      pr_month_13 number,
      pr_record_date  varchar2,--dau vao cho no la loai gi neu ma theo nam thi se ghi la nam bao nhieu cho no
      pr_user varchar2);
  procedure program_plan_update(
      pr_program_plan_id  in out number,
      pr_month_1 number,
      pr_month_2 number,
      pr_month_3 number,
      pr_month_4 number,
      pr_month_5 number,
      pr_month_6 number,
      pr_month_7 number,
      pr_month_8 number,
      pr_month_9 number,
      pr_month_10 number,
      pr_month_11 number,
      pr_month_12 number,
      pr_month_13 number,
      pr_user varchar2);
end EP_EMULATE_PROCESS;
/
create or replace package body EP_EMULATE_PROCESS is

procedure ep_log_view(
    pr_class_name    varchar2,
    pr_function_name varchar2,
    pr_message       varchar2,
    pr_create_user  varchar2)
is
begin
    insert /*+ APPEND */ into ep_log nologging
    (
        class_name,
        function_name,
        message,
        create_user,
        create_datetime
    )
    values
    (
        pr_class_name,
        pr_function_name,
        pr_message,
        pr_create_user,
        sysdate
    );
    commit;
end;

  procedure program_add(
    pr_program_id  in out number,
    pr_company_ams_id varchar2,
    pr_doc_no  varchar2,
    pr_doc_date  date,
    pr_program_name  varchar2,
    pr_from_date  date,
    pr_to_date  date,
    pr_emule_role  number,
    pr_emule_period_id  number,
    pr_emulate_type_arr varchar2,
    pr_emulate_obj_arr varchar2,
    pr_target_obj_arr varchar2,
    pr_emule_object_name  varchar2,
    pr_target_object_name  varchar2,
    pr_target_company_ams_id varchar2,
    pr_month_arr varchar2,
    pr_quarter_arr varchar2,
    pr_user  varchar2)
  is
      var_error_pos  number(8, 2) := 0;
  begin
/*      if  pr_user is not null
      then*/
          pr_program_id := ep_program_seq.nextval;
          insert /*+ APPEND */ into ep_program nologging (
              prog_program_id,
              prog_company_ams_id,
              prog_record_date,
              prog_doc_no,
              prog_doc_date,
              prog_program_name,
              prog_program_desc,
              prog_from_date,
              prog_to_date,
              prog_emule_role,
              prog_emule_period_id,
              prog_emule_object_name,
              prog_target_object_name,
              prog_status,
              prog_month_arr,
              prog_quarter_arr,
              prog_create_user,
              prog_update_user,
              prog_create_datetime,
              prog_update_datetime)
          values
          (
              pr_program_id,
              pr_company_ams_id ,
              trunc(pr_doc_date, 'MM'),
              pr_doc_no,
              trunc(pr_doc_date, 'DD'),
              pr_program_name,
              pr_program_name,
              trunc(pr_from_date, 'DD'),
              trunc(pr_to_date, 'DD'),
              pr_emule_role,
              pr_emule_period_id ,
              pr_emule_object_name,
              pr_target_object_name,
              1,
              pr_month_arr,
              pr_quarter_arr,
              pr_user,
              pr_user,
              sysdate,
              sysdate
              );
           commit;

          --dua vao bang luu lich su cho no
          insert /*+ APPEND */ into ep_program_status nologging (
              prst_program_id,
              prst_add_date,
              prst_add_user,
              prst_create_user,
              prst_update_user,
              prst_create_datetime,
              prst_update_datetime)
          values
          (
              pr_program_id,
              sysdate,
              pr_user,
              pr_user,
              pr_user,
              sysdate,
              sysdate
           );
           commit;

          var_error_pos := 2;

          --do vao danh sach cac cong ty ap dung cho no
          insert /*+ APPEND */ into ep_program_company nologging (
              prco_program_id,
              prco_company_ams_id,
              prco_create_user,
              prco_update_user,
              prco_create_datetime,
              prco_update_datetime
          )
          select
            pr_program_id,
            column_value company_ams_id,
            pr_user,
            pr_user,
            sysdate,
            sysdate
          from table(ams_core_common.f_split_to_varchar(pr_target_company_ams_id))
          group by  column_value;
          commit;

          --do vao danh sach loai thi dua tuong ung voi chuong trinh thi dua do
          insert /*+ APPEND */ into ep_program_emule_type nologging (
              pret_program_id,
              pret_emule_type_id,
              pret_create_user,
              pret_update_user,
              pret_create_datetime,
              pret_update_datetime)
          select
              pr_program_id,
              a.emty_type_id emule_type_id,
              pr_user,
              pr_user,
              sysdate,
              sysdate
           from ep_dm_emule_type a
           where a.emty_type_id in--loai thi dua
           (select * from table(ams_core_common.f_split_to_number(pr_emulate_type_arr)))
           group by
              a.emty_type_id;
          commit;

          var_error_pos := 3;
          --do vao danh sach doi tuong thi dua tuong ung voi chuong trinh thi dua do
          insert /*+ APPEND */ into ep_program_outlet_type nologging (
              prot_program_id,
              prot_outlet_type_id,
              prot_type,
              prot_create_user,
              prot_update_user,
              prot_create_datetime,
              prot_update_datetime)
          select
              pr_program_id,
              a.outy_outlet_type_id outlet_type_id,
              1,--doi tuong thi dua
              pr_user,
              pr_user,
              sysdate,
              sysdate
           from ep_dm_outlet_type a
           where a.outy_outlet_type_id in--loai dai ly tham gia
           (select * from table(ams_core_common.f_split_to_number(pr_emulate_obj_arr)))
           group by
              a.outy_outlet_type_id;
          commit;

          var_error_pos := 4;

          --do vao danh sach doi tuong nham toi tuong ung voi chuong trinh thi dua do
          insert /*+ APPEND */ into ep_program_outlet_type nologging (
              prot_program_id,
              prot_outlet_type_id,
              prot_type,
              prot_create_user,
              prot_update_user,
              prot_create_datetime,
              prot_update_datetime)
          select
              pr_program_id,
              a.outy_outlet_type_id outlet_type_id,
              2,--doi tuong nham toi
              pr_user,
              pr_user,
              sysdate,
              sysdate
           from ep_dm_outlet_type a
           where a.outy_outlet_type_id in--loai dai ly tham gia
           (select * from table(ams_core_common.f_split_to_number(pr_target_obj_arr)))
           group by
              a.outy_outlet_type_id;
          commit;
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'EP_EMULATE_PROCESS.program_add: loi thu tuc: cong ty ' || pr_company_ams_id || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
  end;

  procedure program_update(
    pr_program_id  number,
    pr_company_ams_id varchar2,
    pr_doc_no  varchar2,
    pr_doc_date  date,
    pr_program_name  varchar2,
    pr_from_date  date,
    pr_to_date  date,
    pr_emule_role  number,
    pr_emule_period_id  number,
    pr_emulate_type_arr varchar2,
    pr_emulate_obj_arr varchar2,
    pr_target_obj_arr varchar2,
    pr_emule_object_name  varchar2,
    pr_target_object_name  varchar2,
    pr_target_company_ams_id varchar2,
    pr_month_arr varchar2,
    pr_quarter_arr varchar2,
    pr_status  number,
    pr_user  varchar2)
  is
      pn_exist number(1);
      var_error_pos  number(8, 2) := 0;
  begin
        select  /*+ CARDINALITY(a, 10) */
          count(*)
          into pn_exist
         from ep_program a
         where a.prog_program_id = pr_program_id;
         if pn_exist > 0
         then
/*            begin
                select  \*+ result_cache *\
                    a.prog_status
                    into var_status
                from ep_program a
                where a.prog_program_id  = pr_program_id;
            exception
                when others then
                      var_status := 1;
            end;*/
/*            --neu ma cap nhat lai thanh trang thai la 3 thi se lam nhu sau:
            --neu khong thi se van la trang thai cu cua no
            if var_status <> 3 and pr_status = 3 then
                var_status := 3;
            end if;*/

            update  /*+ NOLOGGING */  ep_program a
            set
                a.prog_record_date = trunc(pr_doc_date, 'MM'),
                a.prog_doc_no =  pr_doc_no,
                a.prog_doc_date = trunc(pr_doc_date, 'DD'),
                a.prog_program_name = pr_program_name,
                a.prog_program_desc =  pr_program_name,
                a.prog_from_date = trunc(pr_from_date, 'DD'),
                a.prog_to_date = trunc(pr_to_date, 'DD'),
                a.prog_emule_period_id =  pr_emule_period_id,
                a.prog_emule_object_name = pr_emule_object_name,
                a.prog_target_object_name = pr_target_object_name,
                --a.prog_status = var_status,--cap nhat trang thai vao day cho no cap nhat o phia sau cho no
                a.prog_month_arr = pr_month_arr,
                a.prog_quarter_arr = pr_quarter_arr,
                a.prog_update_user = pr_user,
                a.prog_update_datetime = sysdate
            where a.prog_program_id  = pr_program_id;
           commit;
           var_error_pos := 1;


           --xoa ep_program_company  truoc roi do vao sau
           delete
           from ep_program_company a
           where a.prco_program_id = pr_program_id;
           commit;
           var_error_pos := 2;
          --do vao danh sach cac cong ty ap dung cho no
          insert /*+ APPEND */ into ep_program_company nologging (
              prco_program_id,
              prco_company_ams_id,
              prco_create_user,
              prco_update_user,
              prco_create_datetime,
              prco_update_datetime
          )
          select
            pr_program_id,
            column_value company_ams_id,
            pr_user,
            pr_user,
            sysdate,
            sysdate
          from table(ams_core_common.f_split_to_varchar(pr_target_company_ams_id))
          group by  column_value;
          commit;
           var_error_pos := 3;


           --xoa di truoc roi do vao sau
           delete
           from ep_program_emule_type a
           where a.pret_program_id = pr_program_id;
           commit;
           var_error_pos := 4;
            --do vao danh sach loai thi dua tuong ung voi chuong trinh thi dua do
            insert /*+ APPEND */ into ep_program_emule_type nologging (
                pret_program_id,
                pret_emule_type_id,
                pret_create_user,
                pret_update_user,
                pret_create_datetime,
                pret_update_datetime)
            select
              pr_program_id,
              column_value pret_emule_type_id,
              pr_user,
              pr_user,
              sysdate,
              sysdate
            from table(ams_core_common.f_split_to_number(pr_emulate_type_arr))
            group by  column_value;
            commit;

           var_error_pos := 5;
           --xoa di truoc roi do vao sau  doi tuong thi dua
           delete
           from ep_program_outlet_type a
           where a.prot_program_id = pr_program_id;
           commit;
           var_error_pos := 6;
            --do vao danh sach doi tuong thi dua tuong ung voi chuong trinh thi dua do
            insert /*+ APPEND */ into ep_program_outlet_type nologging (
                prot_program_id,
                prot_outlet_type_id,
                prot_type,
                prot_create_user,
                prot_update_user,
                prot_create_datetime,
                prot_update_datetime)
            select
                pr_program_id,
                a.outy_outlet_type_id outlet_type_id,
                1,--doi tuong thi dua
                pr_user,
                pr_user,
                sysdate,
                sysdate
             from ep_dm_outlet_type a
             where a.outy_outlet_type_id in--loai dai ly tham gia
             (select * from table(ams_core_common.f_split_to_number(pr_emulate_obj_arr)))
             group by
                a.outy_outlet_type_id;
            commit;

            var_error_pos := 7;
            --do vao danh sach doi tuong nham toi tuong ung voi chuong trinh thi dua do
            insert /*+ APPEND */ into ep_program_outlet_type nologging (
                prot_program_id,
                prot_outlet_type_id,
                prot_type,
                prot_create_user,
                prot_update_user,
                prot_create_datetime,
                prot_update_datetime)
            select
                pr_program_id,
                a.outy_outlet_type_id outlet_type_id,
                2,--doi tuong nham toi
                pr_user,
                pr_user,
                sysdate,
                sysdate
             from ep_dm_outlet_type a
             where a.outy_outlet_type_id in--loai dai ly tham gia
             (select * from table(ams_core_common.f_split_to_number(pr_target_obj_arr)))
             group by
                a.outy_outlet_type_id;
            commit;
         end if;
      exception
          when others then
              rollback;
              life_agency_log.write_log(1000,
                  'EP_EMULATE_PROCESS.program_update: loi thu tuc: cong ty ' || pr_company_ams_id || ' vi tri: ' || to_char(var_error_pos),
                  sqlerrm,
                  sqlcode);
  end;

  procedure program_delete(
      pr_program_id  number)
  is
      var_error_pos  number(8, 2) := 0;
  begin
     delete ep_program_result a
     where a.resu_program_id = pr_program_id;
     commit;

     delete ep_file_attach a
     where a.fiat_program_id = pr_program_id;
     commit;

     delete ep_program_cost a
     where a.prco_program_id = pr_program_id;
     commit;

      delete ep_program_status a
      where a.prst_program_id = pr_program_id;
      commit;

     delete ep_program_company a
     where a.prco_program_id = pr_program_id;
     commit;

     delete ep_program_company_payment a
     where a.prcp_program_id = pr_program_id;
     commit;

      delete ep_program_emule_type a
      where a.pret_program_id = pr_program_id;
      commit;

      delete   ep_program_outlet_type a
      where a.prot_program_id = pr_program_id;
      commit;

      delete ep_program a
      where a.prog_program_id = pr_program_id;
      commit;
  exception
      when others then
          rollback;
          life_agency_log.write_log(1000,
              'EP_EMULATE_PROCESS.program_delete: loi thu tuc: id ' || to_char(pr_program_id) || ' vi tri: ' || to_char(var_error_pos),
              sqlerrm,
              sqlcode);
  end;

  --khi cong ty thanh vien ho nhap vao cho trang thai da chi thuong thi se xu ly cho ho nhu sau
  procedure program_update_status(
    pr_program_id  number,
    pr_status  number,
    pr_user  varchar2)
  is
      pn_exist number(1);
      var_status number(1);
      var_status_value number(1) := pr_status;
      var_error_pos  number(8, 2) := 0;
  begin
/*      if  pr_user is not null
      then*/
        --neu la null thi cho bang null luon
        if nvl(pr_status, -99) = -99 then
            return;
        end if;

        select  /*+ CARDINALITY(a, 10) */
          count(*)
          into pn_exist
         from ep_program a
         where a.prog_program_id = pr_program_id;
         if pn_exist > 0
         then
           --lay trang thai hien tai cua no
            begin
                select  /*+ CARDINALITY(a, 10) */
                    a.prog_status
                    into var_status
                from ep_program a
                where a.prog_program_id  = pr_program_id;
            exception
                when others then
                      var_status := 1;
                      life_agency_log.write_log(1000,
                          'EP_EMULATE_PROCESS.program_update_status: loi thu tuc: thi dua so ' || to_char(pr_program_id) || ' vi tri: ' || to_char(var_error_pos),
                          sqlerrm,
                          sqlcode);
            end;
            --neu trang thai hien tai la da tinh toan hay da chuyen
            --nguoi ta cap nhat len thanh trang thai da chi tien thi moi cho cap nhat
            if var_status in (2, 3) and pr_status = 4 then
                var_status_value := 4;
                --cap nhat trang thai cho no luon
                update  /*+ NOLOGGING */  ep_program_status a
                set
                    a.prst_cac_verify_date = sysdate,--cap nhat ngay chi tien
                    a.prst_cac_verify_user = pr_user,
                    a.prst_update_user  = pr_user,
                    a.prst_update_datetime  = sysdate
                where a.prst_program_id  = pr_program_id;
               commit;
            end if;

            --neu trang thai hien tai la chua tinh thuong hay da da tinh thuong
            --nguoi ta cap nhat len thanh trang thai da chuyen thi moi cho cap nhat
            if var_status in (1, 2)  and pr_status = 3 then
                var_status_value := 3;
                --cap nhat trang thai cho no luon
                update  /*+ NOLOGGING */  ep_program_status a
                set
                    a.prst_transfer_date = sysdate,--cap nhat ngay chuyen
                    a.prst_transfer_user = pr_user,
                    a.prst_update_user  = pr_user,
                    a.prst_update_datetime  = sysdate
                where a.prst_program_id  = pr_program_id;
               commit;
            end if;

            --neu ma hien tai la chua tinh thuong va muon cap nhat len la da tinh thuong
            if var_status = 1  and pr_status = 2 then
                var_status_value := 2;
                --cap nhat trang thai cho no luon
                update  /*+ NOLOGGING */  ep_program_status a
                set
                    a.prst_calculate_date = sysdate,--cap nhat ngay chuyen
                    a.prst_calculate_user = pr_user,
                    a.prst_update_user  = pr_user,
                    a.prst_update_datetime  = sysdate
                where a.prst_program_id  = pr_program_id;
               commit;
            end if;

            --neu hien tai la da tinh thuong muon quay tro ve la chua tinh thuong
            --thi cap nhat lai nhu the nay
            if var_status = 2  and pr_status = 1 then
                var_status_value := 1;
                --cap nhat trang thai cho no luon
                update  /*+ NOLOGGING */  ep_program_status a
                set
                    a.prst_calculate_date = null,--cap nhat ngay chuyen
                    a.prst_calculate_user = null,
                    a.prst_update_user  = pr_user,
                    a.prst_update_datetime  = sysdate
                where a.prst_program_id  = pr_program_id;
               commit;
            end if;


            --neu la da chuyen va muon cap nhat la da chuyen thi k lam gi ca
            if var_status = 3 and pr_status = 3 then --khong lam gi ca
                return;
            end if;

            --neu la da chuyen va muon cap nhat ve trang thai thap hon
            --nhu da tinh toan hay chua tinh toan thi cung  OK
            if var_status = 3 and pr_status < 3 then
                var_status_value := pr_status;
                --neu trang thai tro ve la da tinh thuong thi cap nhat o truong da tinh thuong
                if  (pr_status = 2) then
                    update  /*+ NOLOGGING */  ep_program_status a
                    set
                        a.prst_calculate_date = sysdate,--cap nhat ngay tinh thuong
                        a.prst_calculate_user = pr_user, --nguoi tinh thuong
                        a.prst_transfer_date = null,--cap nhat ngay chuyen la null lai
                        a.prst_transfer_user = null,
                        a.prst_update_user  = pr_user,
                        a.prst_update_datetime  = sysdate
                    where a.prst_program_id  = pr_program_id;
                    commit;
               end if;
               --neu quay ve trang thai ban dau thi phai xoa het du lieu cu di
                if  (pr_status = 1) then
                    update  /*+ NOLOGGING */   ep_program_status a
                    set
                        a.prst_calculate_date = null,--cap nhat ngay vao day cho no
                        a.prst_calculate_user = null,
                        a.prst_transfer_date = null,--cap nhat ngay vao day cho no
                        a.prst_transfer_user = null,
                        a.prst_add_date  = sysdate,
                        a.prst_add_user  = pr_user,--cap nhat lai cho no la cai nay luon di
                        a.prst_update_user  = pr_user,
                        a.prst_update_datetime  = sysdate
                    where a.prst_program_id  = pr_program_id;
                    commit;
               end if;

            end if;

            --neu la chi tien va muon cap nhat ve trang thai thap hon thi k lam gi ca
            if var_status = 4 and pr_status < 3 then --khong lam gi ca
                return;
            end if;

            --neu la chi tien va muon cap nhat ve trang thai thap hon thi k lam gi ca
            if var_status = 4 and pr_status = 3  then --khong lam gi ca
                    update  /*+ NOLOGGING */  ep_program_status a
                    set
                        a.prst_cac_verify_date = null,--cap nhat ngay vao day cho no
                        a.prst_cac_verify_user = null,
                        a.prst_transfer_date = sysdate,--cap nhat ngay chi tien
                        a.prst_transfer_user = pr_user,
                        a.prst_update_user  = pr_user,
                        a.prst_update_datetime  = sysdate
                    where a.prst_program_id  = pr_program_id;
                    commit;
            end if;

            --cap nhat trang thai cho bang do
            update /*+ NOLOGGING */   ep_program a
            set
                a.prog_status = var_status_value,--cap nhat trang thai vao day cho no
                a.prog_update_user = pr_user,
                a.prog_update_datetime = sysdate
            where a.prog_program_id  = pr_program_id;
           commit;
         end if;
      exception
          when others then
              rollback;
              life_agency_log.write_log(1000,
                  'EP_EMULATE_PROCESS.program_update_status: loi thu tuc: thi dua so ' || to_char(pr_program_id) || ' vi tri: ' || to_char(var_error_pos),
                  sqlerrm,
                  sqlcode);
  end;

  procedure program_update_company_cac(
    pr_program_id  number,
    pr_cac_company_ams_id varchar2,
    pr_user  varchar2)
  is
      pn_exist number(1);
      var_status number(1);
      var_error_pos  number(8, 2) := 0;
  begin
        select  /*+ CARDINALITY(a, 10) */
          count(*)
          into pn_exist
         from ep_program a
         where a.prog_program_id = pr_program_id;
         if pn_exist > 0
         then
             delete
             from ep_program_company_payment a
             where a.prcp_program_id = pr_program_id;
             commit;
            --do vao danh sach cac cong ty ap dung cho no
            insert /*+ APPEND */ into ep_program_company_payment nologging (
                prcp_program_id,
                prcp_company_ams_id,
                prcp_create_user,
                prcp_update_user,
                prcp_create_datetime,
                prcp_update_datetime
            )
            select
              pr_program_id,
              column_value company_ams_id,
              pr_user,
              pr_user,
              sysdate,
              sysdate
            from table(ams_core_common.f_split_to_varchar(pr_cac_company_ams_id))
            group by  column_value;
            commit;
         end if;
      exception
          when others then
              rollback;
              life_agency_log.write_log(1000,
                  'EP_EMULATE_PROCESS.program_update_company_cac vi tri: ' || to_char(var_error_pos),
                  sqlerrm,
                  sqlcode);
  end;


  procedure program_cost_add(
      pr_program_cost_id  in out number,
      pr_company_ams_id  varchar2,
      pr_emule_type_id   number,
      pr_program_id number,
      pr_type    number,
      pr_month_1 number,
      pr_month_2 number,
      pr_month_3 number,
      pr_month_4 number,
      pr_month_5 number,
      pr_month_6 number,
      pr_month_7 number,
      pr_month_8 number,
      pr_month_9 number,
      pr_month_10 number,
      pr_month_11 number,
      pr_month_12 number,
      pr_month_13 number,
      pr_month_all number,
      pr_record_date  varchar2,--dau vao cho no la loai gi neu ma theo nam thi se ghi la nam bao nhieu cho no
      pr_user varchar2)
  is
      var_error_pos  number(8, 2) := 0;
      var_record_date date := trunc(sysdate, 'YYYY');
      var_company_ams_id varchar(100):= pr_company_ams_id;
  begin
/*      if  pr_user is not null
      then*/
          begin
              if nvl(pr_program_id, 0) <> 0 then
                  select   /*+ CARDINALITY(a, 10) */
                      trunc(a.prog_record_date, 'YYYY')
                      into var_record_date
                  from ep_program a
                  where a.prog_program_id = pr_program_id;
              end if;
              if pr_program_id is null then
                  select
                      to_date('1-jan-'||pr_record_date)
                      into var_record_date
                  from dual;
              end if;
          exception
              when others then
                  var_record_date := trunc(sysdate, 'YYYY');
                  life_agency_log.write_log(1000,
                      'EP_EMULATE_PROCESS.program_cost_add: loi thu tuc: cong ty ' || pr_company_ams_id || ' vi tri: ' || to_char(var_error_pos),
                      sqlerrm,
                      sqlcode);
          end;

          --neu ma no khac null thi se lam nhu the nay
          --lay ma cong ty cua no de dua vao cho no
          if nvl(pr_program_id, -99) <> -99 then
             --lay ma cong ty ra
              begin
                 select   /*+ CARDINALITY(a, 10) */
                    a.prog_company_ams_id
                    into var_company_ams_id
                 from ep_program a
                 where prog_program_id = pr_program_id;
              exception
                  when others then
                  var_company_ams_id := pr_company_ams_id;
                  life_agency_log.write_log(1000,
                      'EP_EMULATE_PROCESS.program_cost_add: loi thu tuc: cong ty ' || pr_company_ams_id || ' vi tri: ' || to_char(var_error_pos),
                      sqlerrm,
                      sqlcode);
              end;
         end if;

          pr_program_cost_id := ep_cost_seq.nextval;
          insert /*+ APPEND */ into ep_program_cost nologging (
              prco_program_cost_id,
              prco_record_date,--nam bao nhieu thi ghi vao day cho no
              prco_company_ams_id,
              prco_emule_type_id,
              prco_program_id,--neu ma la ca nam thi cho bang null o day
              prco_type, --1 du tinh
              prco_month_1,
              prco_month_2,
              prco_month_3,
              prco_month_4,
              prco_month_5,
              prco_month_6,
              prco_month_7,
              prco_month_8,
              prco_month_9,
              prco_month_10,
              prco_month_11,
              prco_month_12,
              prco_month_13,
              prco_month_all,
              prco_create_user,
              prco_update_user,
              prco_create_datetime,
              prco_update_datetime)
          values
          (
              pr_program_cost_id,
              var_record_date,
              pr_company_ams_id,
              pr_emule_type_id,
              pr_program_id,
              pr_type,
              pr_month_1,
              pr_month_2,
              pr_month_3,
              pr_month_4,
              pr_month_5,
              pr_month_6,
              pr_month_7,
              pr_month_8,
              pr_month_9,
              pr_month_10,
              pr_month_11,
              pr_month_12,
              pr_month_13,
              pr_month_all,
              pr_user,
              pr_user,
              sysdate,
              sysdate
              );
           commit;
/*      end if;*/
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'EP_EMULATE_PROCESS.program_cost_add: loi thu tuc: cong ty ' || pr_company_ams_id || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
  end;

  procedure program_cost_update(
      pr_program_cost_id  number,
      pr_company_ams_id  varchar2,
      pr_emule_type_id   number,
      pr_program_id number,
      pr_type    number,
      pr_month_1 number,
      pr_month_2 number,
      pr_month_3 number,
      pr_month_4 number,
      pr_month_5 number,
      pr_month_6 number,
      pr_month_7 number,
      pr_month_8 number,
      pr_month_9 number,
      pr_month_10 number,
      pr_month_11 number,
      pr_month_12 number,
      pr_month_13 number,
      pr_month_all number,
      pr_record_date  varchar2,--dau vao cho no la loai gi neu ma theo nam thi se ghi la nam bao nhieu cho no
      pr_user varchar2)
  is
      pn_exist number(1);
      var_error_pos  number(8, 2) := 0;
      var_record_date date := trunc(sysdate, 'YYYY');
  begin
/*      if  pr_user is not null
      then*/
          select  /*+ CARDINALITY(a, 10) */
              count(*)
              into pn_exist
          from ep_program_cost a
          where a.prco_program_cost_id = pr_program_cost_id;
          life_agency_log.write_log(1000,
              'EP_EMULATE_PROCESS.program_cost_update123:  1 : cong ty ' || pr_company_ams_id || ' vi tri: ' || to_char(var_error_pos),
              sqlerrm,
              sqlcode);
          if pn_exist > 0
          then

            --lay record date ra
            begin
                if nvl(pr_program_id, 0) <> 0 then
                    select   /*+ CARDINALITY(a, 10) */
                        trunc(a.prog_record_date, 'YYYY')
                        into var_record_date
                    from ep_program a
                    where a.prog_program_id = pr_program_id;
                end if;
                if pr_program_id is null then
                    select
                        to_date('1-jan-'||pr_record_date)
                        into var_record_date
                    from dual;
                end if;
            exception
                when others then
                    var_record_date := trunc(sysdate, 'YYYY');
            end;

            update ep_program_cost a
            set --cho sua het cac thong tin Bach bao roi
                a.prco_company_ams_id =  pr_company_ams_id,
                a.prco_record_date = var_record_date,--cap nhat thang ghi nhan vao cho no luon neu can
                a.prco_emule_type_id =  pr_emule_type_id,
                a.prco_program_id =  pr_program_id,
                a.prco_type =  pr_type,
                a.prco_month_1 = pr_month_1,
                a.prco_month_2 = pr_month_2,
                a.prco_month_3 = pr_month_3,
                a.prco_month_4 = pr_month_4,
                a.prco_month_5 = pr_month_5,
                a.prco_month_6 = pr_month_6,
                a.prco_month_7 = pr_month_7,
                a.prco_month_8 = pr_month_8,
                a.prco_month_9 = pr_month_9,
                a.prco_month_10 = pr_month_10,
                a.prco_month_11 = pr_month_11,
                a.prco_month_12 = pr_month_12,
                a.prco_month_13 = pr_month_13,
                a.prco_month_all = pr_month_all,
                a.prco_update_user = pr_user,
                a.prco_update_datetime = sysdate
            where a.prco_program_cost_id  = pr_program_cost_id;
            commit;
         end if;
      exception
          when others then
              rollback;
              life_agency_log.write_log(1000,
                  'EP_EMULATE_PROCESS.program_cost_update: loi thu tuc: cong ty ' || pr_company_ams_id || ' id = ' || to_char(pr_program_cost_id) || ' vi tri: ' || to_char(var_error_pos),
                  sqlerrm,
                  sqlcode);
  end;

  --cap nhat neu ma tich vao khong phat dong thi cho ca nam no = 0 doi voi ke hoach luon doi voi thang do
  procedure program_cost_update_year(
      pr_company_ams_id  varchar2,
      pr_month_1 number,
      pr_month_2 number,
      pr_month_3 number,
      pr_month_4 number,
      pr_month_5 number,
      pr_month_6 number,
      pr_month_7 number,
      pr_month_8 number,
      pr_month_9 number,
      pr_month_10 number,
      pr_month_11 number,
      pr_month_12 number,
      pr_month_13 number,
      pr_record_date  varchar2,--dau vao cho no la loai gi neu ma theo nam thi se ghi la nam bao nhieu cho no
      pr_user varchar2)
  is
      pn_exist number(1);
      var_error_pos  number(8, 2) := 0;
      var_record_date date := trunc(sysdate, 'YYYY');
  begin 
            --lay record date ra
            begin  
                select
                    to_date('1-jan-'||pr_record_date)
                    into var_record_date
                from dual; 
            exception
                when others then
                    var_record_date := trunc(sysdate, 'YYYY');
            end; 

            update ep_program_cost a
            set --cho sua het cac thong tin Bach bao roi
                --cap nhat thang ghi nhan vao cho no luon neu can
                a.prco_month_1 = case when pr_month_1 = 1 then 0 else a.prco_month_1 end,
                a.prco_month_2 = case when pr_month_2 = 1 then 0 else a.prco_month_2 end,
                a.prco_month_3 = case when pr_month_3 = 1 then 0 else a.prco_month_3 end,
                a.prco_month_4 = case when pr_month_4 = 1 then 0 else a.prco_month_4 end,
                a.prco_month_5 = case when pr_month_5 = 1 then 0 else a.prco_month_5 end,
                a.prco_month_6 = case when pr_month_6 = 1 then 0 else a.prco_month_6 end,
                a.prco_month_7 = case when pr_month_7 = 1 then 0 else a.prco_month_7 end,
                a.prco_month_8 = case when pr_month_8 = 1 then 0 else a.prco_month_8 end,
                a.prco_month_9 = case when pr_month_9 = 1 then 0 else a.prco_month_9 end,
                a.prco_month_10 = case when pr_month_10 = 1 then 0 else a.prco_month_10 end,
                a.prco_month_11 = case when pr_month_11 = 1 then 0 else a.prco_month_11 end,
                a.prco_month_12 = case when pr_month_12 = 1 then 0 else a.prco_month_12 end,
                a.prco_month_13 = case when pr_month_13 = 1 then 0 else a.prco_month_13 end,  
                a.prco_update_user = pr_user,
                a.prco_update_datetime = sysdate
            where a.prco_company_ams_id =  pr_company_ams_id
                and a.prco_record_date = var_record_date
                and (a.prco_program_id is null or  a.prco_program_id = 0) --la khai bai ke hoach
                and a.prco_type = 1; --ke hoach dau nam
            commit;  
            --cap nhat lai ke hoach tong cua ca nam
            update ep_program_cost a
            set a.prco_month_all =
                nvl(a.prco_month_1, 0) +
                nvl(a.prco_month_2, 0) +
                nvl(a.prco_month_3, 0) +
                nvl(a.prco_month_4, 0) +
                nvl(a.prco_month_5, 0) +
                nvl(a.prco_month_6, 0) +
                nvl(a.prco_month_7, 0) +
                nvl(a.prco_month_8, 0) +
                nvl(a.prco_month_9, 0) +
                nvl(a.prco_month_10, 0) +
                nvl(a.prco_month_11, 0) +
                nvl(a.prco_month_12, 0) +
                nvl(a.prco_month_13, 0),  
                a.prco_update_user = pr_user,
                a.prco_update_datetime = sysdate
            where a.prco_company_ams_id =  pr_company_ams_id
                and a.prco_record_date = var_record_date
                and (a.prco_program_id is null or  a.prco_program_id = 0) --la khai bai ke hoach
                and a.prco_type = 1; --ke hoach dau nam
            commit;             
      exception
          when others then
              rollback;
              life_agency_log.write_log(1000,
                  'EP_EMULATE_PROCESS.program_cost_update: loi thu tuc: cong ty ' || pr_company_ams_id || '  vi tri: ' || to_char(var_error_pos),
                  sqlerrm,
                  sqlcode);
  end;
  
  procedure program_cost_delete(
      pr_program_cost_id  number)
  is
      var_error_pos  number(8, 2) := 0;
  begin
      delete
      from ep_program_cost a
      where a.prco_program_cost_id = pr_program_cost_id;
      commit;
  exception
      when others then
          rollback;
          life_agency_log.write_log(1000,
              'EP_EMULATE_PROCESS.program_cost_delete: loi thu tuc: id = ' || to_char(pr_program_cost_id) || ' vi tri: ' || to_char(var_error_pos),
              sqlerrm,
              sqlcode);
  end;

  procedure file_attach_add(
      pr_file_attach_id  in out number,
      pr_program_id	number,
      pr_file_name	varchar2,
      pr_type	number,
      pr_url	varchar2,
      pr_file_size number,
      pr_user varchar2)
  is
      var_error_pos  number(8, 2) := 0;
  begin
/*      if  pr_user is not null
      then*/
          pr_file_attach_id := ep_file_attach_seq.nextval;
          insert /*+ APPEND */ into ep_file_attach nologging (
              fiat_attach_id,
              fiat_program_id,
              fiat_file_name,
              fiat_file_desc,
              fiat_type,
              fiat_url,
              fiat_file_size,
              fiat_create_user,
              fiat_update_user,
              fiat_create_datetime,
              fiat_update_datetime)
          values
          (
              pr_file_attach_id,
              pr_program_id,
              pr_file_name,
              pr_file_name,
              pr_type,
              pr_url,
              pr_file_size,
              pr_user,
              pr_user,
              sysdate,
              sysdate
              );
           commit;
/*      end if;*/
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'EP_EMULATE_PROCESS.file_attach_add: loi thu tuc: ma chuong trinh ' || to_number(pr_program_id) || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
  end;

  procedure file_attach_update(
      pr_file_attach_id number,
      pr_program_id	number,
      pr_file_name	varchar2,
      pr_url	varchar2,
      pr_user varchar2)
  is
      pn_exist number(1);
      var_error_pos  number(8, 2) := 0;
  begin
/*      if  pr_user is not null
      then*/
          select  /*+ CARDINALITY(a, 10) */
              count(*)
              into pn_exist
          from ep_file_attach a
          where a.fiat_attach_id  = pr_file_attach_id;
          if pn_exist > 0
          then
            update ep_file_attach a
            set
                a.fiat_program_id =  pr_program_id,
                a.fiat_file_name =  pr_file_name,
                a.fiat_url =  pr_url,
                a.fiat_update_user = pr_user,
                a.fiat_update_datetime = sysdate
            where a.fiat_attach_id  = pr_file_attach_id;
            commit;
         end if;
/*      end if;*/
      exception
          when others then
              rollback;
              life_agency_log.write_log(1000,
                  'EP_EMULATE_PROCESS.file_attach_update: loi thu tuc:   id = ' || to_char(pr_file_attach_id) || ' vi tri: ' || to_char(var_error_pos),
                  sqlerrm,
                  sqlcode);
  end;

  procedure file_attach_delete(
      pr_file_attach_id  number)
  is
      var_error_pos  number(8, 2) := 0;
  begin
      delete
      from ep_file_attach a
      where a.fiat_attach_id  = pr_file_attach_id;
      commit;
  exception
      when others then
          rollback;
          life_agency_log.write_log(1000,
              'EP_EMULATE_PROCESS.program_cost_delete: loi thu tuc: id = ' || to_char(pr_file_attach_id) || ' vi tri: ' || to_char(var_error_pos),
              sqlerrm,
              sqlcode);
  end;

  procedure file_attach_update_poster(
      pr_file_attach_id number,
      pr_user varchar2)
  is
      var_type number(1) := 1;
      var_error_pos  number(8, 2) := 0;
  begin
/*      if  pr_user is not null
      then*/
            begin
                select a.fiat_type
                    into var_type
                from ep_file_attach a
                where a.fiat_attach_id = pr_file_attach_id;
            exception
                when others then
                var_type := 1;
            end;
            --cap nhat lai cac cai khac cho la thanh inacti de cho dung len
            update ep_file_attach a
            set
                a.fiat_acti = 0,
                a.fiat_update_user = pr_user,
                a.fiat_update_datetime = sysdate
            where a.fiat_type = var_type--chi cap nhat doi voi chieu ngang thoi, con cac cai khac mac dinh cho no cap nhat len
               and a.fiat_program_id is null;
            commit;
            --cao nhat cho file do hien len trang chu
            update ep_file_attach a
            set
                a.fiat_acti = 1,
                a.fiat_update_user = pr_user,
                a.fiat_update_datetime = sysdate
            where a.fiat_attach_id = pr_file_attach_id;
            commit;
/*      end if;*/
      exception
          when others then
              rollback;
              life_agency_log.write_log(1000,
                  'EP_EMULATE_PROCESS.file_attach_update_poster: loi thu tuc:   id = ' || to_char(pr_file_attach_id) || ' vi tri: ' || to_char(var_error_pos),
                  sqlerrm,
                  sqlcode);
  end;

  procedure program_result_add(
      pr_program_result_id  in out number,
      pr_program_id number,
      pr_company_account_id  varchar2,
      pr_outlet_ams_id    varchar2,
      pr_outlet_name    varchar2,
      pr_company_name   varchar2,
      pr_money number,
      pr_user varchar2)
  is
      var_error_pos  number(8, 2) := 0;
  begin
          pr_program_result_id := ep_program_result_seq.nextval;
          --xoa truoc di da
          delete ep_program_result a
          where a.resu_program_id = pr_program_id
              and a.resu_company_account_id = pr_company_account_id
              and a.resu_outlet_ams_id = pr_outlet_ams_id;
          commit;

          insert /*+ APPEND */ into ep_program_result nologging (
              resu_program_result_id,
              resu_program_id,
              resu_company_ams_id,
              resu_company_account_id,
              resu_outlet_ams_id,
              resu_outlet_name,
              resu_company_name,
              resu_money,
              resu_create_user,
              resu_update_user,
              resu_create_datetime,
              resu_update_datetime
              )
          values
          (
              pr_program_result_id,
              pr_program_id,  
              (
                  select /*+ CARDINALITY(a, 10) */
                       a.dmcm_company_ams_id
                  from ep_dm_company a
                  where a.dmcm_company_account = pr_company_account_id
              ),
              pr_company_account_id,
              pr_outlet_ams_id,
              pr_outlet_name,
              pr_company_name,
              pr_money,
              pr_user,
              pr_user,
              sysdate,
              sysdate
              );
           commit;
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'EP_EMULATE_PROCESS.program_cost_add: loi thu tuc: cong ty ' || pr_company_account_id || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
  end;

  procedure program_result_add_batch(
      pr_program_result_id  in out number,
      pr_program_id number,
      pr_company_account_id  varchar2,
      pr_outlet_ams_id    varchar2,
      pr_outlet_name    varchar2,
      pr_company_name   varchar2,
      pr_money varchar2,
      pr_user varchar2)
    is
        v_outlet_ams_id varchar2(200);
        v_outlet_name varchar2(200);
        v_position_name varchar2(200);
        v_company_name varchar2(512);
        v_company_account_id varchar2(512);
        v_money varchar2(200);
        var_program_result_id  number(18,2):=0;
        var_money number(18,2) := 0;
        start_pos_outlet_ams_id number := 1; --vi tri bat dau tim kiem la tu vi tri thu nhat
        end_pos_outlet_ams_id number := 0;
        start_pos_outlet_name number := 1; --vi tri bat dau tim kiem la tu vi tri thu nhat
        end_pos_outlet_name number := 0;
        start_pos_company_account_id number := 1; --vi tri bat dau tim kiem la tu vi tri thu nhat
        end_pos_company_account_id number := 0;
        start_pos_company_name number := 1; --vi tri bat dau tim kiem la tu vi tri thu nhat
        end_pos_company_name number := 0;
        start_pos_money number := 1; --vi tri bat dau tim kiem la tu vi tri thu nhat
        end_pos_money number := 0;
        varqty number := 0;
        ch char := '^'; --ky tu phan cach la dau ,
    begin
        begin
            loop
                end_pos_outlet_ams_id := instr(pr_outlet_ams_id, ch, start_pos_outlet_ams_id);
                if end_pos_outlet_ams_id = 0 then
                    v_outlet_ams_id := trim(substr(pr_outlet_ams_id, start_pos_outlet_ams_id));
                else
                    v_outlet_ams_id := trim(substr(pr_outlet_ams_id, start_pos_outlet_ams_id, end_pos_outlet_ams_id - start_pos_outlet_ams_id));
                end if;

                end_pos_outlet_name := instr(pr_outlet_name, ch, start_pos_outlet_name);
                if end_pos_outlet_name = 0 then
                    v_outlet_name := trim(substr(pr_outlet_name, start_pos_outlet_name));
                else
                    v_outlet_name := trim(substr(pr_outlet_name, start_pos_outlet_name, end_pos_outlet_name - start_pos_outlet_name));
                end if;

                end_pos_company_account_id := instr(pr_company_account_id, ch, start_pos_company_account_id);
                if end_pos_company_account_id = 0 then
                    v_company_account_id := trim(substr(pr_company_account_id, start_pos_company_account_id));
                else
                    v_company_account_id := trim(substr(pr_company_account_id, start_pos_company_account_id, end_pos_company_account_id - start_pos_company_account_id));
                end if;
                
                end_pos_company_name := instr(pr_company_name, ch, start_pos_company_name);
                if end_pos_company_name = 0 then
                    v_company_name := trim(substr(pr_company_name, start_pos_company_name));
                else
                    v_company_name := trim(substr(pr_company_name, start_pos_company_name, end_pos_company_name - start_pos_company_name));
                end if; 

                end_pos_money := instr(pr_money, ch, start_pos_money);
                if end_pos_money = 0 then
                    v_money := trim(substr(pr_money, start_pos_money));
                else
                    v_money := trim(substr(pr_money, start_pos_money, end_pos_money - start_pos_money));
                end if;

                var_money := to_number(v_money);

                --xoa di thi tot hon vi co the no khong co du lieu
                --xoa truoc di da
                delete /*+ NOLOGGING */
                from ep_program_result a
                where a.resu_program_id = pr_program_id
                    and a.resu_company_account_id = pr_company_account_id
                    and a.resu_outlet_ams_id = v_outlet_ams_id;
                commit;

                var_program_result_id := ep_program_result_seq.nextval;
                insert /*+ APPEND */ into ep_program_result nologging (
                    resu_program_result_id,
                    resu_program_id,
                    resu_company_ams_id,
                    resu_company_account_id,
                    resu_outlet_ams_id,
                    resu_outlet_name,
                    resu_company_name,
                    resu_money,
                    resu_create_user,
                    resu_update_user,
                    resu_create_datetime,
                    resu_update_datetime
                    )
                values
                (
                    var_program_result_id,
                    pr_program_id,
                    (
                        select /*+ CARDINALITY(a, 10) */
                             a.dmcm_company_ams_id
                        from ep_dm_company a
                        where a.dmcm_company_account = v_company_account_id
                    ),
                    v_company_account_id,
                    v_outlet_ams_id,
                    v_outlet_name,
                    v_company_name,
                    var_money,
                    pr_user,
                    pr_user,
                    sysdate,
                    sysdate
                    );
                 commit;

                exit when end_pos_outlet_ams_id = 0;
                start_pos_outlet_ams_id := end_pos_outlet_ams_id + 1;
                start_pos_outlet_name := end_pos_outlet_name + 1;
                start_pos_company_account_id := end_pos_company_account_id + 1;
                start_pos_company_name := end_pos_company_name + 1;
                start_pos_money := end_pos_money + 1;
            end loop;
            commit;
            pr_program_result_id := 1;
        exception
            when others then
                rollback;
                pr_program_result_id := 0;
              life_agency_log.write_log(1000,
                  'EP_EMULATE_PROCESS.program_result_add_batch: loi thu tuc:  pr_program_id  id = ' || to_char(pr_program_id),
                  sqlerrm,
                  sqlcode);
        end;
    end;

  procedure program_result_update(
      pr_program_result_id number,
      pr_outlet_ams_id varchar2,
      pr_outlet_name  varchar2,
      pr_company_name   varchar2,
      pr_money number,
      pr_user varchar2)
  is
      var_error_pos  number(8, 2) := 0;
  begin
      update ep_program_result a
      set
          --a.resu_outlet_ams_id =  pr_outlet_ams_id,
          a.resu_outlet_name =  pr_outlet_name,
          a.resu_company_name =  pr_company_name,
          a.resu_money =  pr_money,
          a.resu_update_user = pr_user,
          a.resu_update_datetime = sysdate
      where a.resu_program_result_id  = pr_program_result_id;
       commit;
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'EP_EMULATE_PROCESS.program_result_update: loi thu tuc: ' || to_char(pr_program_result_id) || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
  end;

  procedure program_result_delete(
      pr_program_result_id  number)
  is
      var_error_pos  number(8, 2) := 0;
  begin
      delete
      from ep_program_result a
      where a.resu_program_result_id  = pr_program_result_id;
      commit;
  exception
      when others then
          rollback;
          life_agency_log.write_log(1000,
              'EP_EMULATE_PROCESS.program_result_delete: loi thu tuc: ' || to_char(pr_program_result_id) || ' vi tri: ' || to_char(var_error_pos),
              sqlerrm,
              sqlcode);
  end;

  procedure program_result_delete_all(
      pr_program_id  number)
  is
      var_error_pos  number(8, 2) := 0;
  begin
      delete
      from ep_program_result a
      where a.resu_program_id  = pr_program_id;
      commit;
  exception
      when others then
          rollback;
          life_agency_log.write_log(1000,
              'EP_EMULATE_PROCESS.program_result_delete_all: loi thu tuc: ' || to_char(pr_program_id) || ' vi tri: ' || to_char(var_error_pos),
              sqlerrm,
              sqlcode);
  end;

  --ke hoach thi dua
  procedure program_plan_add(
      pr_program_plan_id  in out number,
      pr_company_ams_id  varchar2,
      pr_month_1 number,
      pr_month_2 number,
      pr_month_3 number,
      pr_month_4 number,
      pr_month_5 number,
      pr_month_6 number,
      pr_month_7 number,
      pr_month_8 number,
      pr_month_9 number,
      pr_month_10 number,
      pr_month_11 number,
      pr_month_12 number,
      pr_month_13 number,
      pr_record_date  varchar2,--dau vao cho no la loai gi neu ma theo nam thi se ghi la nam bao nhieu cho no
      pr_user varchar2)
  is
      var_error_pos  number(8, 2) := 0;
      var_record_date date := to_date('1-jan-'||pr_record_date);
      var_program_plan_id number(18) := 0;
      var_qty number(10) := 0;
  begin
/*      if  pr_user is not null
      then*/
          begin
              select   /*+ CARDINALITY(a, 10) */
                  count(*)
                  into var_qty
              from ep_program_plan a
              where a.prpp_company_ams_id = pr_company_ams_id
                  and a.prpp_record_date = var_record_date;
          exception
              when others then
                  var_qty := 0;
          end;

          --neu chua co thi insert vao
          if nvl(var_qty, 0) = 0 then
              var_program_plan_id := ep_program_plan_seq.nextval;
              insert /*+ APPEND */ into ep_program_plan nologging (
                  prpp_program_plan_id,
                  prpp_record_date,
                  prpp_company_ams_id,
                  prpp_month_1,
                  prpp_month_2,
                  prpp_month_3,
                  prpp_month_4,
                  prpp_month_5,
                  prpp_month_6,
                  prpp_month_7,
                  prpp_month_8,
                  prpp_month_9,
                  prpp_month_10,
                  prpp_month_11,
                  prpp_month_12,
                  prpp_month_13,
                  prpp_create_user,
                  prpp_update_user,
                  prpp_create_datetime,
                  prpp_update_datetime)
              values
              (
                  var_program_plan_id,
                  var_record_date,
                  pr_company_ams_id,
                  pr_month_1,
                  pr_month_2,
                  pr_month_3,
                  pr_month_4,
                  pr_month_5,
                  pr_month_6,
                  pr_month_7,
                  pr_month_8,
                  pr_month_9,
                  pr_month_10,
                  pr_month_11,
                  pr_month_12,
                  pr_month_13,
                  pr_user,
                  pr_user,
                  sysdate,
                  sysdate
                  );
               commit;
               pr_program_plan_id := var_program_plan_id;
          end if;
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'EP_EMULATE_PROCESS.program_plan_add: loi thu tuc: cong ty ' || pr_company_ams_id || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
  end;

  procedure program_plan_update(
      pr_program_plan_id  in out number,
      pr_month_1 number,
      pr_month_2 number,
      pr_month_3 number,
      pr_month_4 number,
      pr_month_5 number,
      pr_month_6 number,
      pr_month_7 number,
      pr_month_8 number,
      pr_month_9 number,
      pr_month_10 number,
      pr_month_11 number,
      pr_month_12 number,
      pr_month_13 number,
      pr_user varchar2)
  is
      var_error_pos  number(8, 2) := 0;
      var_program_plan_id number(18) := 0;
  begin
      update ep_program_plan a
      set
          a.prpp_month_1 = pr_month_1,
          a.prpp_month_2 = pr_month_2,
          a.prpp_month_3 = pr_month_3,
          a.prpp_month_4 = pr_month_4,
          a.prpp_month_5 = pr_month_5,
          a.prpp_month_6 = pr_month_6,
          a.prpp_month_7 = pr_month_7,
          a.prpp_month_8 = pr_month_8,
          a.prpp_month_9 = pr_month_9,
          a.prpp_month_10 = pr_month_10,
          a.prpp_month_11 = pr_month_11,
          a.prpp_month_12 = pr_month_12,
          a.prpp_month_13 = pr_month_13,
          a.prpp_update_user = pr_user,
          a.prpp_update_datetime = sysdate
      where a.prpp_program_plan_id  = pr_program_plan_id;
      commit;
  exception
      when others then
          rollback;
          life_agency_log.write_log(1000,
              'EP_EMULATE_PROCESS.program_plan_update: loi thu tuc vi tri: ' || to_char(var_error_pos),
              sqlerrm,
              sqlcode);
  end;
end EP_EMULATE_PROCESS;
/
