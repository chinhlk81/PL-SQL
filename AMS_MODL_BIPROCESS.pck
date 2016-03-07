create or replace package ams.AMS_MODL_BIPROCESS is

    /*
        Creater: Nguyen Vu Quynh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure add_bistores(pv_bistore_id in out varchar2,
        pv_bistore_code varchar2,
        pv_bistore_name varchar2,
        pv_user varchar2);

    /*
        Creater: Nguyen Vu Quynh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure add_times(pv_bistore_id varchar2,
        pv_group_id varchar2,
        pv_time_code varchar2,
        pv_user varchar2,
        pd_if_date date default null,
        pd_it_date date default null,
        pd_ef_date date default null,
        pd_et_date date default null);
    /*
        Creater: Le Khac Chinh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */

    procedure add_ext(pv_bistore_id varchar2,
        pv_group_id varchar2,
        pv_ext_code varchar2,
        pv_user varchar2,
        pn_value number default null);

    /*
        Creater: Nguyen Vu Quynh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure save_times(pv_bistore_id varchar2,
        pv_time_code varchar2,
        pv_user varchar2,
        pd_if_date date default null,
        pd_it_date date default null,
        pd_ef_date date default null,
        pd_et_date date default null);

    /*
        Creater: Nguyen Vu Quynh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure saves_conditions_time(pv_bistore_id varchar2,
        pv_time_code varchar2,
        pv_user varchar2,
        pd_if_date date default null,
        pd_it_date date default null,
        pd_ef_date date default null,
        pd_et_date date default null);
    /*
        Creater: Le Khac Chinh
        Date Create: 04/06/2015
        Version: 1.0
        Description: Chay khi ma bam nut tong hop du lieu, chay du lieu tham khao va cac cung ky
        Parameter:
        Update:
    */
    procedure saves_run_times(pv_bistore_id varchar2,
        pv_time_code varchar2,
        pv_user varchar2,
        pd_if_date date default null,
        pd_it_date date default null,
        pd_ef_date date default null,
        pd_et_date date default null);
    /*
        Creater: Le Khac Chinh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure save_ext(pv_bistore_id varchar2,
        pv_ext_code varchar2,
        pv_user varchar2,
        pn_value number default null);

    /*
        Creater: Nguyen Vu Quynh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure save_bilocations(pv_bistore_id varchar2,
        pv_group_id varchar2,
        pv_program_id varchar2,
        pv_user varchar2);

    /*
        Creater: Le Khac Chinh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure save_bilocations_group_info(pv_bistore_id varchar2,
        pv_bistore_code varchar2,
        pv_bistore_name varchar2,
        pv_group_id varchar2,
        pv_program_id varchar2,
        pv_user varchar2);

    /*
        Creater: Le Khac Chinh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure save_bilocations_group_cond(pv_bistore_id varchar2,
        pv_bistore_code varchar2,
        pv_bistore_name varchar2,
        pv_group_id varchar2,
        pv_program_id varchar2,
        pv_user varchar2);
    /*
        Creater: Nguyen Vu Quynh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure save_program(pv_bistore_id varchar2,
        pv_program_id varchar2,
        pv_user varchar2);
    /*
        Creater: Nguyen Vu Quynh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure get_bilocations(pv_user varchar2,
        pr_records out sys_refcursor);
    /*
        Creater: Nguyen Vu Quynh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure get_bisessions(pv_bistore_id varchar2,
        pv_user varchar2,
        pr_records out sys_refcursor);

    /*
        Creater: Nguyen Vu Quynh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure choose_bisessions(pv_bistore_id varchar2,
        pv_bicondition_id varchar2,
        pv_biactive varchar2,
        pv_user varchar2);

    /*
        Creater: Nguyen Vu Quynh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure del_biaccounts(pv_bistore_id varchar2,
        pv_user varchar2);
    /*
        Creater: Le Khac Chinh
        Date Create: 04/11/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure del_biaccounts_store(pv_bistore_id varchar2,
        pv_user varchar2);
    /*
        Creater: Nguyen Vu Quynh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure save_biaccounts(pv_analyze_id varchar2,
        pv_bistore_id varchar2,
        pv_user varchar2,
        pn_class_id varchar2,
        pv_active number,
        pn_ip_from number default 0,
        pn_ip_to number default 0,
        pn_afyp_from number default 0,
        pn_afyp_to number default 0,
        pn_mmoney number default 0,
        pn_tmoney number default 0);

    /*
        Creater: Nguyen Vu Quynh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mirg_biaccounts(pv_bistore_id varchar2,
        pv_user varchar2);

    /*
        Creater: Nguyen Vu Quynh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure run_biaccounts(pv_bistore_id varchar2,
        pv_user varchar2,
        pv_data_code varchar2);

    /*
        Creater: Nguyen Vu Quynh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure get_biaccounts(pv_bistore_id varchar2,
        pv_user varchar2,
        pr_records out sys_refcursor);

end AMS_MODL_BIPROCESS;
/
create or replace package body ams.AMS_MODL_BIPROCESS is

    /*
        Creater: Le Khac Chinh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure add_bistores(pv_bistore_id in out varchar2,
        pv_bistore_code varchar2,
        pv_bistore_name varchar2,
        pv_user varchar2)
    is
        var_bistore_id number(16) := null;
    begin
        -- Buoc 01: Kiem tra du lieu
        if (pv_user is null) then
            goto procedure_end;
        end if;

        -- Buoc 02: Chuan bi du lieu
        begin
            var_bistore_id := ept_store_id_seq.nextval;

            delete ams_ept_analyze_store_tmp del
            where del.anal_store_id = var_bistore_id
                and del.anal_user_id = pv_user;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[X.add_bistores] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 03: Ghi nhan du lieu
        begin
            insert into  ams_ept_analyze_store_tmp (
                anal_user_id,
                anal_store_id,
                anal_doc_no,
                anal_name,
                anal_code,
                anal_module_type_id,
                anal_create_user,
                anal_update_user,
                anal_create_datetime,
                anal_update_datetime)
            values (
                pv_user,
                var_bistore_id,
                pv_bistore_code,
                pv_bistore_name,
                'ADD',
                1,
                pv_user,
                pv_user,
                sysdate,
                sysdate);
            commit;

            pv_bistore_id := to_char(var_bistore_id);
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[X.add_bistores] ' || SQLERRM);
                goto procedure_end;
        end;

        return;
        -- Xay ra loi khong mong muon
        <<procedure_end>>
            pv_bistore_id := null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure add_times(pv_bistore_id varchar2,
        pv_group_id varchar2,
        pv_time_code varchar2,
        pv_user varchar2,
        pd_if_date date default null,
        pd_it_date date default null,
        pd_ef_date date default null,
        pd_et_date date default null)
    is
    begin
        -- Buoc 01: Kiem tra du lieu
        if (pv_user is null) then
            goto procedure_end;
        end if;

        -- Buoc 02: Xoa du lieu neu da ton tai
        begin
            delete ams_ept_condition_tmp del
            where del.cond_user_id = pv_user
                and del.cond_store_id = to_number(pv_bistore_id)
                and del.cond_index_code = pv_time_code;
            commit;
        end;

        -- Buoc 03: Ghi nhan du lieu
        begin
            insert into ams_ept_condition_tmp(
                cond_condition_id,
                cond_user_id,
                cond_store_id,
                cond_group_id,
                cond_index_id,
                cond_index_code,
                cond_date1_from,
                cond_date1_to,
                cond_date2_from,
                cond_date2_to,
                cond_create_user,
                cond_update_user,
                cond_create_datetime,
                cond_update_datetime
            )
            values (
                ept_condition_seq.nextval,
                pv_user,
                to_number(pv_bistore_id),
                to_number(pv_group_id),
                null,
                pv_time_code,
                pd_if_date,
                pd_it_date,
                pd_ef_date,
                pd_et_date,
                pv_user,
                pv_user,
                sysdate,
                sysdate
            );
            commit;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */

    procedure add_ext(pv_bistore_id varchar2,
        pv_group_id varchar2,
        pv_ext_code varchar2,
        pv_user varchar2,
        pn_value number default null)
    is
    begin
        -- Buoc 01: Kiem tra du lieu
        if (pv_user is null) then
            goto procedure_end;
        end if;

        -- Buoc 02: Xoa du lieu neu da ton tai
        begin
            delete ams_ept_condition_ext_tmp del
            where del.cond_user_id = pv_user
                and del.cond_store_id = to_number(pv_bistore_id)
                and del.cond_index_code = pv_ext_code;
            commit;
        end;

        -- Buoc 03: Ghi nhan du lieu
        begin
            insert into ams_ept_condition_ext_tmp(
                cond_condition_id,
                cond_user_id,
                cond_store_id,
                cond_group_id,
                cond_index_id,
                cond_index_code,
                cond_num_from,
                cond_create_user,
                cond_update_user,
                cond_create_datetime,
                cond_update_datetime
            )
            values (
                ept_condition_seq.nextval,
                pv_user,
                to_number(pv_bistore_id),
                to_number(pv_group_id),
                (
                    select  /*+ CARDINALITY(a, 10) */
                        nvl(a.inde_index_id, 0)
                    from ams.ams_ept_index a
                    where a.inde_index_code = pv_ext_code
                    group by a.inde_index_id
                ),
                pv_ext_code,
                pn_value,
                pv_user,
                pv_user,
                sysdate,
                sysdate
            );
            commit;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure save_times(pv_bistore_id varchar2,
        pv_time_code varchar2,
        pv_user varchar2,
        pd_if_date date default null,
        pd_it_date date default null,
        pd_ef_date date default null,
        pd_et_date date default null)
    is
        var_condition_id number(16) := null;
        var_group_id number(16) := null;
    begin
        -- Buoc 01: Kiem tra du lieu
        if (pv_user is null) then
            goto procedure_end;
        end if;

        begin
            update ams_ept_condition_tmp c
            set
                c.cond_date1_from = pd_if_date,
                c.cond_date1_to = pd_it_date,
                c.cond_date2_from = pd_ef_date,
                c.cond_date2_to = pd_et_date,
                c.cond_update_user = pv_user,
                c.cond_update_datetime = sysdate
            where c.cond_user_id = pv_user
                and c.cond_store_id = to_number(pv_bistore_id)
                and c.cond_index_code = pv_time_code;
            commit;
        end;

        begin
            select
                c.cond_condition_id,
                c.cond_group_id
                    into
                        var_condition_id,
                        var_group_id
            from ams_ept_condition_tmp c
            where c.cond_user_id = pv_user
                and c.cond_store_id = to_number(pv_bistore_id)
                and c.cond_index_code = pv_time_code;

            AMS_EPT_DATA_PROCESS_DETAIL.get_data_detail(to_number(pv_bistore_id),
                var_group_id,
                var_condition_id,
                pv_user);

            if (
                pv_time_code in (
                    'ANA_DATE',  --chay thoi gian tham khao
                    'ANA_DATE0',  --chay thoi gian thuc te
                    'ANA_DATE1',
                    'ANA_DATE2',
                    'ANA_DATE3',
                    'ANA_DATE4',
                    'ANA_DATE5',
                    'ANA_DATE6'
                )
            ) then
                AMS_EPT_DATA_PROCESS_DETAIL.ept_condition_result_process(to_number(pv_bistore_id),
                    var_group_id,
                    var_condition_id,
                    pv_user);
            end if;

            /*ANHNH_TEST2.ept_condition_result_process(to_number(pv_bistore_id),
                var_group_id,
                var_condition_id,
                pv_user);*/
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 04/06/2015
        Version: 1.0
        Description: Luu du lieu  tham khao va cac cung ky
        Parameter:
        Update:
    */
    procedure saves_conditions_time(pv_bistore_id varchar2,
        pv_time_code varchar2,
        pv_user varchar2,
        pd_if_date date default null,
        pd_it_date date default null,
        pd_ef_date date default null,
        pd_et_date date default null)
    is
        var_condition_id number(16) := null;
        var_group_id number(16) := null;
    begin
        -- Buoc 01: Kiem tra du lieu
        if (pv_user is null) then
            goto procedure_end;
        end if;

        begin
            update ams_ept_condition_tmp c
            set
                c.cond_date1_from = pd_if_date,
                c.cond_date1_to = pd_it_date,
                c.cond_date2_from = pd_ef_date,
                c.cond_date2_to = pd_et_date,
                c.cond_update_user = pv_user,
                c.cond_update_datetime = sysdate
            where c.cond_user_id = pv_user
                and c.cond_store_id = to_number(pv_bistore_id)
                and c.cond_index_code = pv_time_code;
            commit;
        end;
        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;


    /*
        Creater: Le Khac Chinh
        Date Create: 04/06/2015
        Version: 1.0
        Description: Chay khi ma bam nut tong hop du lieu, chay du lieu tham khao va cac cung ky
        Parameter:
        Update:
    */
    procedure saves_run_times(pv_bistore_id varchar2,
        pv_time_code varchar2,
        pv_user varchar2,
        pd_if_date date default null,
        pd_it_date date default null,
        pd_ef_date date default null,
        pd_et_date date default null)
    is
        var_condition_id number(16) := null;
        var_group_id number(16) := null;
    begin
        -- Buoc 01: Kiem tra du lieu
        if (pv_user is null) then
            goto procedure_end;
        end if;

        begin
            select
                c.cond_condition_id,
                c.cond_group_id
                    into
                        var_condition_id,
                        var_group_id
            from ams_ept_condition_tmp c
            where c.cond_user_id = pv_user
                and c.cond_store_id = to_number(pv_bistore_id)
                and c.cond_index_code = pv_time_code;

            AMS_EPT_DATA_PROCESS_DETAIL.get_data_detail(to_number(pv_bistore_id),
                var_group_id,
                var_condition_id,
                pv_user);

            if (
                pv_time_code in (
                    'ANA_DATE',  --chay thoi gian tham khao
                    'ANA_DATE0',  --chay thoi gian thuc te
                    'ANA_DATE1',
                    'ANA_DATE2',
                    'ANA_DATE3',
                    'ANA_DATE4',
                    'ANA_DATE5',
                    'ANA_DATE6'
                )
            ) then
                AMS_EPT_DATA_PROCESS_DETAIL.ept_condition_result_process(to_number(pv_bistore_id),
                    var_group_id,
                    var_condition_id,
                    pv_user);
            end if;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;


    /*
        Creater: Le Khac Chinh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
      procedure save_ext(pv_bistore_id varchar2,
          pv_ext_code varchar2,
          pv_user varchar2,
          pn_value number default null)
    is
        var_condition_id number(16) := null;
        var_group_id number(16) := null;
    begin
        -- Buoc 01: Kiem tra du lieu
        if (pv_user is null) then
            goto procedure_end;
        end if;

        begin
            update ams_ept_condition_ext_tmp c
            set
                c.cond_num_from = pn_value,
                c.cond_update_user = pv_user,
                c.cond_update_datetime = sysdate
            where c.cond_user_id = pv_user
                and c.cond_store_id = to_number(pv_bistore_id)
                and c.cond_index_code = pv_ext_code;
            commit;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure save_bilocations(pv_bistore_id varchar2,
        pv_group_id varchar2,
        pv_program_id varchar2,
        pv_user varchar2)
    is
    begin
        -- Buoc 01: Kiem tra du lieu
        if (pv_user is null) then
            goto procedure_end;
        end if;

        begin
            update ams_ept_analyze_store_tmp anal
            set
                anal.anal_group_id = to_number(pv_group_id),
                anal.anal_program_id = to_number(pv_program_id)
            where anal.anal_user_id = pv_user
                and anal.anal_store_id = to_number(pv_bistore_id);
            commit;
        end;

        begin
            AMS_MODL_BIPROCESS.add_times(pv_bistore_id,
                pv_group_id,
                'ANA_DATE',
                pv_user);
            AMS_MODL_BIPROCESS.add_times(pv_bistore_id,
                pv_group_id,
                'ANA_DATE0',
                pv_user);
            AMS_MODL_BIPROCESS.add_times(pv_bistore_id,
                pv_group_id,
                'ANA_DATE1',
                pv_user);
            AMS_MODL_BIPROCESS.add_times(pv_bistore_id,
                pv_group_id,
                'ANA_DATE2',
                pv_user);
            AMS_MODL_BIPROCESS.add_times(pv_bistore_id,
                pv_group_id,
                'ANA_DATE3',
                pv_user);
            AMS_MODL_BIPROCESS.add_times(pv_bistore_id,
                pv_group_id,
                'ANA_DATE4',
                pv_user);
            AMS_MODL_BIPROCESS.add_times(pv_bistore_id,
                pv_group_id,
                'ANA_DATE5',
                pv_user);
            AMS_MODL_BIPROCESS.add_times(pv_bistore_id,
                pv_group_id,
                'ANA_DATE6',
                pv_user);
            AMS_MODL_BIPROCESS.add_ext(pv_bistore_id,
                pv_group_id,
                'HESODUPHONG',
                pv_user);
            AMS_MODL_BIPROCESS.add_ext(pv_bistore_id,
                pv_group_id,
                'NOTGETCANCEL',
                pv_user);
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;


        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_BIPROCESS.save_bilocations] ' || '  ' ||  SQLERRM);

    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 04/06/2015
        Version: 1.0
        Description: Cap nhat ma nhom neu thay doi nhom cho store
        Parameter:
        Update:
    */
    procedure save_bilocations_group_info(pv_bistore_id varchar2,
        pv_bistore_code varchar2,
        pv_bistore_name varchar2,
        pv_group_id varchar2,
        pv_program_id varchar2,
        pv_user varchar2)
    is
    begin
        -- Buoc 01: Kiem tra du lieu
        if (pv_user is null) then
            goto procedure_end;
        end if;

        begin
            update ams_ept_analyze_store_tmp anal
            set
                anal.anal_doc_no = pv_bistore_code,
                anal.anal_name = pv_bistore_name,
                anal.anal_group_id = to_number(pv_group_id),
                anal.anal_program_id = to_number(pv_program_id),
                anal.anal_update_user = pv_user,
                anal.anal_update_datetime =sysdate
            where anal.anal_user_id = pv_user
                and anal.anal_store_id = to_number(pv_bistore_id);
            commit;

        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_BIPROCESS.save_bilocations_group_info] ' || '  ' ||  SQLERRM);

        end;
        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 04/06/2015
        Version: 1.0
        Description:Cap nhat ma nhom cho cac dieu kien chay neu thay doi nhom
        Parameter:
        Update:
    */
    procedure save_bilocations_group_cond(pv_bistore_id varchar2,
        pv_bistore_code varchar2,
        pv_bistore_name varchar2,
        pv_group_id varchar2,
        pv_program_id varchar2,
        pv_user varchar2)
    is
    begin
        -- Buoc 01: Kiem tra du lieu
        if (pv_user is null) then
            goto procedure_end;
        end if;

        begin
            update ams_ept_condition_tmp c
            set c.cond_group_id = to_number(pv_group_id)
            where c.cond_user_id = pv_user
                and c.cond_store_id = to_number(pv_bistore_id);
            commit;

            update ams_ept_condition_ext_tmp c
            set c.cond_group_id = to_number(pv_group_id),
                c.cond_update_user = pv_user,
                c.cond_update_datetime = sysdate
            where c.cond_user_id = pv_user
                and c.cond_store_id = to_number(pv_bistore_id);
            commit;

        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_BIPROCESS.save_bilocations_group_cond] ' || '  ' ||  SQLERRM);

        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;


    /*
        Creater: Le Khac Chinh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure save_program(pv_bistore_id varchar2,
        pv_program_id varchar2,
        pv_user varchar2)
    is
    begin
        -- Buoc 01: Kiem tra du lieu
        if (pv_user is null) then
            goto procedure_end;
        end if;

        begin
            update ams_ept_analyze_store_tmp anal
            set
                anal.anal_program_id = to_number(pv_program_id)
            where anal.anal_user_id = pv_user
                and anal.anal_store_id = to_number(pv_bistore_id);
            commit;
        end;
        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;


        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_BIPROCESS.save_ext] ' || '  ' ||  SQLERRM);

    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure get_bilocations(pv_user varchar2,
        pr_records out sys_refcursor)
    is
    begin
        -- Buoc 01: Kiem tra du lieu
        if (pv_user is null) then
            goto procedure_end;
        end if;
        open pr_records for
        select  /*+ CARDINALITY(main, 10)  CARDINALITY(grop, 10) */
            1 data_group_id,
            grop.group_id  dlocation_id,
            grop.grou_name  dlocation_name,
            1 is_read,
            1 is_write,
            1 is_execute
        from
        (
            select /*+ CARDINALITY(us, 10) CARDINALITY(lper, 10) */
                lper.data_group_id
            from
            (
                select /*+ CARDINALITY(up, 10) */
                    *
                from cla_user_permission up
                where up.user_name = pv_user
            ) us
            join
            (
                select   /*+ CARDINALITY(lp, 10) */
                    *
                from ams_ept_lpermission lp
                where lp.code_permission like '1__'
            ) lper
                on lper.user_group_id = us.group_id
           group by lper.data_group_id
        ) main
        join
        (
           select /*+ CARDINALITY(a, 10) */
              eg.grou_group_id group_id,
              eg.grou_name grou_name
           from ams.ams_ept_group eg
           where eg.grou_status = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
        ) grop
          on grop.group_id = main.data_group_id
        order by
          nlssort( grop.grou_name, 'nls_sort=Vietnamese') nulls first;

        /*open pr_records for
        select
            p.data_group_id,
            sl.grou_group_id dlocation_id,
            sl.grou_name dlocation_name,
            p.is_read,
            p.is_write,
            p.is_execute
        from
        (
            select
                lperm.data_group_id,
                max(lperm.is_read) is_read,
                max(lperm.is_write) is_write,
                max(lperm.is_execute) is_execute
            from
            (
                select *
                from cla_user_permission up
                where up.user_name = pv_user
            ) uperm
            join ams_ept_lpermission lperm
                on lperm.user_group_id = uperm.group_id
            group by lperm.data_group_id
        ) p
        join ams_ept_group sl
            on sl.grou_group_id = p.data_group_id;*/

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure get_bisessions(pv_bistore_id varchar2,
        pv_user varchar2,
        pr_records out sys_refcursor)
    is
    begin
        -- Buoc 01: Kiem tra du lieu
        if (pv_user is null) then
            goto procedure_end;
        end if;

        open pr_records for
        select
            s.core_condition_id condition_id,
            e.inde_index_name condition_name,
            s.core_active row_active,
            s.core_policy_qty sum_accounts,
            s.core_ip ip,
            s.core_afyp afyp,
            s.core_fyp fyp
        from
        (
            select *
            from ams_ept_condition_result_tmp tmp
            where tmp.core_user_id = pv_user
                and tmp.core_store_id = to_number(pv_bistore_id)
        ) s
        join
        (
            select *
            from ams_ept_condition_tmp tmp
            where tmp.cond_user_id = pv_user
                and tmp.cond_store_id = to_number(pv_bistore_id)
        ) c
            on c.cond_condition_id = s.core_condition_id
        left join ams_ept_index e
            on e.inde_index_code = c.cond_index_code
        order by c.cond_index_code;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure choose_bisessions(pv_bistore_id varchar2,
        pv_bicondition_id varchar2,
        pv_biactive varchar2,
        pv_user varchar2)
    is
    begin
        begin
            update ams_ept_condition_result_tmp cr
            set
                cr.core_active = 0
            where cr.core_user_id = pv_user
                and cr.core_store_id = pv_bistore_id;
            commit;

            update ams_ept_condition_result_tmp cr
            set
                cr.core_active = pv_biactive
            where cr.core_user_id = pv_user
                and cr.core_store_id = pv_bistore_id
                and cr.core_condition_id = pv_bicondition_id;
            commit;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure del_biaccounts(pv_bistore_id varchar2,
        pv_user varchar2)
    is
    begin
        -- Buoc 01: Kiem tra du lieu
        if (pv_user is null) then
            goto procedure_end;
        end if;

        begin
            delete ams_ept_analyze_tmp anal
            where anal.anal_user_id = pv_user
                and anal.anal_store_id = to_number(pv_bistore_id);
            commit;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 04/11/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure del_biaccounts_store(pv_bistore_id varchar2,
        pv_user varchar2)
    is
    begin
        -- Buoc 01: Kiem tra du lieu
        if (pv_user is null) then
            goto procedure_end;
        end if;

        begin
            delete ams_ept_analyze_tmp anal
            where anal.anal_user_id = pv_user
                and anal.anal_store_id = to_number(pv_bistore_id);
            commit;
            delete ams_ept_analyze_store a
            where a.anal_store_id =  to_number(pv_bistore_id)
                and a.anal_create_user  = pv_user;
            commit;
            delete ams_ept_condition_tmp a
            where a.cond_store_id =  to_number(pv_bistore_id)
                and a.cond_user_id =  pv_user;
            commit;
            delete ams_ept_condition a
            where a.cond_store_id =  to_number(pv_bistore_id)
                and a.cond_create_user =  pv_user;
            commit;
            delete ams_ept_condition_ext_tmp a
            where a.cond_store_id =  to_number(pv_bistore_id)
                and a.cond_user_id =  pv_user;
            commit;
            delete ams_ept_condition_ext a
            where a.cond_store_id =  to_number(pv_bistore_id)
                and a.cond_create_user =  pv_user;
            commit;
            delete ams_ept_condition_result_tmp a
            where a.core_store_id = to_number(pv_bistore_id);
            commit;
            delete ams_ept_condition_result a
            where a.core_store_id = to_number(pv_bistore_id);
            commit;
        end;
        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure save_biaccounts(pv_analyze_id varchar2,
        pv_bistore_id varchar2,
        pv_user varchar2,
        pn_class_id varchar2,
        pv_active number,
        pn_ip_from number default 0,
        pn_ip_to number default 0,
        pn_afyp_from number default 0,
        pn_afyp_to number default 0,
        pn_mmoney number default 0,
        pn_tmoney number default 0)
    is
        var_analyze_id number(16) := null;
        var_group_id number(16) := null;
    begin
        -- Buoc 01: Kiem tra du lieu
        if (pv_user is null) then
            goto procedure_end;
        end if;

        begin
            select
                s.anal_group_id
                    into
                        var_group_id
            from ams_ept_analyze_store_tmp s
            where s.anal_user_id = pv_user
                and s.anal_store_id = to_number(pv_bistore_id);
        end;

        -- Buoc 02: Cap nhat thong tin
        begin
            if (pv_analyze_id = -1) then
                update ams_ept_analyze_tmp anal
                set
                    anal.anal_class_id = to_number(pn_class_id),
                    anal.anal_active = pv_active,
                    anal.anal_group_id = var_group_id,
                    anal.anal_ip_from = pn_ip_from,
                    anal.anal_afyp_from = pn_afyp_from,
                    anal.anal_reward_value = pn_mmoney,
                    anal.anal_reward_type_id = pn_tmoney,
                    anal.anal_update_user = pv_user,
                    anal.anal_update_datetime = sysdate
                where anal.anal_user_id = pv_user
                    and anal.anal_analyze_id = to_number(pv_analyze_id);
                commit;
            else
                merge
                    into ams_ept_analyze_tmp anal
                using dual
                    on
                    (
                        dual.dummy is not null
                        and
                        pv_user = anal.anal_user_id
                        and
                        to_number(pv_bistore_id) = anal.anal_store_id
                        and
                        to_number(pn_class_id) = anal.anal_class_id
                    )
                when matched then
                    update
                    set
                        anal.anal_data_code = 'DETAIL',
                        anal.anal_group_id = var_group_id,
                        anal.anal_active = pv_active,
                        anal.anal_ip_from = pn_ip_from,
                        anal.anal_ip_to = pn_ip_to,
                        anal.anal_afyp_from = pn_afyp_from,
                        anal.anal_afyp_to = pn_afyp_to,
                        anal.anal_reward_value = pn_mmoney,
                        anal.anal_reward_type_id = pn_tmoney,
                        anal.anal_update_user = pv_user,
                        anal.anal_update_datetime = sysdate
                when not matched then
                    insert (
                        anal_analyze_id,
                        anal_user_id,
                        anal_store_id,
                        anal_group_id,
                        anal_data_code,
                        anal_class_id,
                        anal_active,
                        anal_ip_from,
                        anal_ip_to,
                        anal_afyp_from,
                        anal_afyp_to,
                        anal_reward_value,
                        anal_reward_type_id,
                        anal_create_user,
                        anal_update_user,
                        anal_create_datetime,
                        anal_update_datetime
                    )
                    values (
                        ept_analyze_seq.nextval,
                        pv_user,
                        to_number(pv_bistore_id),
                        var_group_id,
                        'DETAIL',
                        to_number(pn_class_id),
                        pv_active,
                        pn_ip_from,
                        pn_ip_to,
                        pn_afyp_from,
                        pn_afyp_to,
                        pn_mmoney,
                        pn_tmoney,
                        pv_user,
                        pv_user,
                        sysdate,
                        sysdate
                    );
                commit;
            end if;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mirg_biaccounts(pv_bistore_id varchar2,
        pv_user varchar2)
    is
        var_group_id number(16) := null;
    begin
        -- Buoc 01: Kiem tra du lieu
        if (pv_user is null) then
            goto procedure_end;
        end if;

        begin
            select
                s.anal_group_id
                    into
                        var_group_id
            from ams_ept_analyze_store_tmp s
            where s.anal_user_id = pv_user
                and s.anal_store_id = to_number(pv_bistore_id);
        end;

        begin
            merge
                into ams_ept_analyze_tmp anal
            using
            (
                select
                    l.anal_analyze_id,
                    r.anal_ip_from anal_ip_to,
                    r.anal_afyp_from anal_afyp_to
                from
                (
                    select
                        tmp.anal_analyze_id,
                        tmp.anal_ip_from,
                        tmp.anal_ip_to,
                        tmp.anal_afyp_from,
                        tmp.anal_afyp_to,
                        rank() over(order by tmp.anal_class_id asc) anal_rank
                    from ams_ept_analyze_tmp tmp
                    where tmp.anal_user_id = pv_user
                        and tmp.anal_store_id = to_number(pv_bistore_id)
                        and tmp.anal_data_code = 'DETAIL'
                        and tmp.anal_class_id is not null
                    order by tmp.anal_class_id
                ) l
                left join
                (
                    select
                        tmp.anal_analyze_id,
                        tmp.anal_ip_from,
                        tmp.anal_ip_to,
                        tmp.anal_afyp_from,
                        tmp.anal_afyp_to,
                        rank() over(order by tmp.anal_class_id asc) anal_rank
                    from ams_ept_analyze_tmp tmp
                    where tmp.anal_user_id = pv_user
                        and tmp.anal_store_id = to_number(pv_bistore_id)
                        and tmp.anal_data_code = 'DETAIL'
                        and tmp.anal_class_id is not null
                    order by tmp.anal_class_id
                ) r
                    on (r.anal_rank - 1) = l.anal_rank
            ) upd
                on
                (
                    pv_user = anal.anal_user_id
                    and
                    to_number(pv_bistore_id) = anal.anal_store_id
                    and
                    upd.anal_analyze_id = anal.anal_analyze_id
                )
            when matched then
                update
                set
                    anal.anal_ip_to = upd.anal_ip_to,
                    anal.anal_afyp_to = upd.anal_afyp_to,
                    anal.anal_update_user = pv_user,
                    anal.anal_update_datetime = sysdate;
            commit;

            -- Auto Fix
            update ams_ept_analyze_tmp anal
            set
                anal.anal_afyp_from = 0,
                anal.anal_afyp_to = 1000000000000
            where anal.anal_user_id = pv_user
                and anal.anal_store_id = to_number(pv_bistore_id)
                and anal.anal_data_code in ('DETAIL')
                and nvl(anal.anal_afyp_from, 0) = 0
                and nvl(anal.anal_afyp_to, 0) = 0;
            commit;

            update ams_ept_analyze_tmp anal
            set
                anal.anal_ip_from = 0,
                anal.anal_ip_to = 1000000000000
            where anal.anal_user_id = pv_user
                and anal.anal_store_id = to_number(pv_bistore_id)
                and anal.anal_data_code in ('DETAIL')
                and nvl(anal.anal_ip_from, 0) = 0
                and nvl(anal.anal_ip_to, 0) = 0;
            commit;
        end;

        begin
            delete ams_ept_analyze_tmp anal
            where anal.anal_user_id = pv_user
                and anal.anal_store_id = to_number(pv_bistore_id)
                and anal.anal_data_code in ('S0', 'S1', 'S2');
            commit;

            insert into ams_ept_analyze_tmp(
                anal_analyze_id,
                anal_user_id,
                anal_store_id,
                anal_group_id,
                anal_data_code,
                anal_create_user,
                anal_update_user,
                anal_create_datetime,
                anal_update_datetime)
            values (
                ept_analyze_seq.nextval,
                pv_user,
                to_number(pv_bistore_id),
                var_group_id,
                'S0',
                pv_user,
                pv_user,
                sysdate,
                sysdate
            );

            insert into ams_ept_analyze_tmp(
                anal_analyze_id,
                anal_user_id,
                anal_store_id,
                anal_group_id,
                anal_data_code,
                anal_create_user,
                anal_update_user,
                anal_create_datetime,
                anal_update_datetime)
            values (
                ept_analyze_seq.nextval,
                pv_user,
                to_number(pv_bistore_id),
                var_group_id,
                'S1',
                pv_user,
                pv_user,
                sysdate,
                sysdate
            );

            insert into ams_ept_analyze_tmp(
                anal_analyze_id,
                anal_user_id,
                anal_store_id,
                anal_group_id,
                anal_data_code,
                anal_create_user,
                anal_update_user,
                anal_create_datetime,
                anal_update_datetime)
            values (
                ept_analyze_seq.nextval,
                pv_user,
                to_number(pv_bistore_id),
                var_group_id,
                'S2',
                pv_user,
                pv_user,
                sysdate,
                sysdate
            );
            commit;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure run_biaccounts(pv_bistore_id varchar2,
        pv_user varchar2,
        pv_data_code varchar2)
    is
        var_group_id number(16) := null;
        var_condition_id number(16) := null;
    begin
        -- Buoc 01: Kiem tra du lieu
        if (pv_user is null) then
            goto procedure_end;
        end if;

        begin
            select
                s.anal_group_id
                    into
                        var_group_id
            from ams_ept_analyze_store_tmp s
            where s.anal_user_id = pv_user
                and s.anal_store_id = to_number(pv_bistore_id);

            select
                c.cond_condition_id
                    into
                        var_condition_id
            from ams_ept_condition_tmp c
            where c.cond_user_id = pv_user
                and c.cond_store_id = to_number(pv_bistore_id)
                and c.cond_index_code = pv_data_code;
        end;

        begin
            AMS_MODL_BIACCOUNT.tmp_run_biaccounts(pv_user,
                pv_bistore_id,
                var_group_id);

            /*AMS_EPT_DATA_PROCESS_DETAIL.ept_est_data_process(to_number(pv_bistore_id),
                var_group_id,
                var_condition_id,
                pv_user);*/
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure get_biaccounts(pv_bistore_id varchar2,
        pv_user varchar2,
        pr_records out sys_refcursor)
    is
    begin
        -- Buoc 01: Kiem tra du lieu
        if (pv_user is null) then
            goto procedure_end;
        end if;

        open pr_records for
        select
            case
                when anal.anal_data_code in ('DETAIL') then
                    'D'
                else
                    'T'
                end anal_data,
            anal.anal_analyze_id,
            anal.anal_store_id,
            anal.anal_data_code,
            case
                when anal.anal_data_code in ('DETAIL') then
                    'Chi tiết'
                when anal.anal_data_code in ('S0') then
                    'Điều kiện khác'
                when anal.anal_data_code in ('S1') then
                    'Tổng cộng'
                when anal.anal_data_code in ('S2') then
                    'Tỷ trọng'
                end anal_data_name,
            anal.anal_class_id,
            anal.anal_active,
            anal.anal_ip_from,
            anal.anal_ip_to,
            anal.anal_afyp_from,
            anal.anal_afyp_to,

            anal.anal_policy_qty anal_sum_accounts,
            anal.anal_ip anal_sum_ip,
            anal.anal_afyp anal_sum_afyp,
            anal.anal_policy_prc anal_per_accounts,
            anal.anal_ip_prc anal_per_ip,
            anal.anal_afyp_prc anal_per_afyp,
            anal.anal_est_policy_qty anal_est_accounts,
            anal.anal_est_ip anal_est_ip,
            anal.anal_est_afyp anal_est_afyp,
            anal.anal_reward_value anal_mmoney,
            anal.anal_reward_type_id anal_tmoney,
            anal.anal_est_money anal_smoney,

            anal.anal_real_policy_qty anal_rsum_accounts,
            anal.anal_real_ip anal_rsum_ip,
            anal.anal_real_afyp anal_rsum_afyp,
            anal.anal_real_policy_prc anal_rper_accounts,
            anal.anal_real_ip_prc anal_rper_ip,
            anal.anal_real_afyp_prc anal_rper_afyp,
            anal.anal_real_money anal_rsmoney,

            '' mon
        from ams_ept_analyze_tmp anal
        where anal.anal_user_id = pv_user
            and anal.anal_store_id = to_number(pv_bistore_id)
        order by anal.anal_class_id nulls last,
            anal.anal_data_code;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;


end AMS_MODL_BIPROCESS;
/
