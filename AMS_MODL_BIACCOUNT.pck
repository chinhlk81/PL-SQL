create or replace package ams.AMS_MODL_BIACCOUNT is

    -----------------------------------------------------------------
    /* BEGIN VARIABLE*/
    -----------------------------------------------------------------
    -----------------------------------------------------------------
    /* END VARIABLE*/
    -----------------------------------------------------------------

    procedure main;

    -----------------------------------------------------------------
    /* BEGIN PROCEDURE*/
    -----------------------------------------------------------------
    /*
        Creater: Nguyen Vu Quynh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure get_tbonus(pr_records out sys_refcursor);


    /*
        Creater: Nguyen Vu Quynh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure main_get_biaccounts(pv_user varchar2,
        pr_records out sys_refcursor);

    /*
        Creater: Nguyen Vu Quynh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure main_save_biaccounts(pv_user varchar2,
        pv_bistore_id varchar2);

    /*
        Creater: Nguyen Vu Quynh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure load_main_biaccounts(pv_user varchar2,
        pv_bistore_id varchar2);

    /*
        Creater: Nguyen Vu Quynh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure tmp_get_info_biaccounts(pv_user varchar2,
        pv_bistore_id varchar2,
        pr_records out sys_refcursor);

    /*
        Creater: Nguyen Vu Quynh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure tmp_get_time_biaccounts(pv_user varchar2,
        pv_bistore_id varchar2,
        pv_time_code varchar2,
        pr_records out sys_refcursor);

    /*
        Creater: Nguyen Vu Quynh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure tmp_run_biaccounts(pv_user varchar2,
        pv_bistore_id varchar2,
        pv_group_id varchar2);

    /*
        Creater: Nguyen Vu Quynh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure tmp_calc_biaccounts(pv_user varchar2,
        pv_bistore_id varchar2);

    /*
        Creater: Nguyen Vu Quynh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure tmp_bsave_biaccounts(pv_user varchar2,
        pv_analyze_id varchar2,
        pv_bistore_id varchar2,
        pn_mmoney number default 0,
        pn_tmoney number default 0);
    -----------------------------------------------------------------
    /* END PROCEDURE*/
    -----------------------------------------------------------------

    -----------------------------------------------------------------
    /* BEGIN FUNCTION*/
    -----------------------------------------------------------------
    -----------------------------------------------------------------
    /* END FUNCTION*/
    -----------------------------------------------------------------

end AMS_MODL_BIACCOUNT;
/
create or replace package body ams.AMS_MODL_BIACCOUNT is

    procedure main
    is
    begin
        -- Ket thuc thuc hien
        <<procedure_end>>
            null;
    end;

    -----------------------------------------------------------------
    /* BEGIN PROCEDURE*/
    -----------------------------------------------------------------
    /*
        Creater: Le Khac Chinh
        Date Create: 04/06/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure get_tbonus(pr_records out sys_refcursor)
    is
    begin
        open pr_records for
        select
            tb.rety_type_id,
            tb.rety_type_name
        from ams_ept_dm_reward_type tb
        order by tb.rety_type_id;

        -- Ket thuc xu ly
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
    procedure main_get_biaccounts(pv_user varchar2,
        pr_records out sys_refcursor)
    is
    begin
        -- Buoc 01: Kiem tra du lieu
        if (
            pv_user is null
        ) then
            goto procedure_end;
        end if;

        open pr_records for
        select
            anal.anal_store_id,
            anal.anal_doc_no anal_store_no,
            anal.anal_name anal_store_name
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
           select /*+ CARDINALITY(eas, 10) */
              *
           from ams_ept_analyze_store eas
        ) anal
            on anal.anal_group_id = main.data_group_id;

        -- Ket thuc thuc hien
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
    procedure main_save_biaccounts(pv_user varchar2,
        pv_bistore_id varchar2)
    is
    begin
        -- Buoc 01: Kiem tra du lieu
        if (
            pv_user is null
            or
            pv_bistore_id is null
        ) then
            goto procedure_end;
        end if;

        -- Buoc 02: Luu thong tin phan tich du lieu
        begin
            merge
                into ams_ept_analyze_store anal
            using
            (
                select *
                from ams_ept_analyze_store_tmp tmp
                where tmp.anal_user_id = pv_user
                    and tmp.anal_store_id = to_number(pv_bistore_id)
            ) upd
                on
                (
                    to_number(pv_bistore_id) = anal.anal_store_id
                )
            when matched then
                update
                set
                    anal.anal_group_id = upd.anal_group_id,
                    anal.anal_name = upd.anal_name,
                    anal.anal_doc_no = upd.anal_doc_no,
                    anal.anal_module_type_id = upd.anal_module_type_id,
                    anal.anal_program_id = upd.anal_program_id,
                    anal.anal_update_user = pv_user,
                    anal.anal_update_datetime = sysdate
            when not matched then
                insert (
                    anal_store_id,
                    anal_group_id,
                    anal_name,
                    anal_doc_no,
                    anal_module_type_id,
                    anal_program_id,
                    anal_create_user,
                    anal_update_user,
                    anal_create_datetime,
                    anal_update_datetime
                )
                values (
                    upd.anal_store_id,
                    upd.anal_group_id,
                    upd.anal_name,
                    upd.anal_doc_no,
                    upd.anal_module_type_id,
                    upd.anal_program_id,
                    pv_user,
                    pv_user,
                    sysdate,
                    sysdate
                );
            commit;
        end;

        -- Buoc 03: Luu thong tin cau hinh du lieu
        begin
            delete ams_ept_condition c
            where c.cond_store_id = to_number(pv_bistore_id);
            commit;

            insert into ams_ept_condition (
                cond_condition_id,
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
            select
                tmp.cond_condition_id,
                tmp.cond_store_id,
                tmp.cond_group_id,
                tmp.cond_index_id,
                tmp.cond_index_code,
                tmp.cond_date1_from,
                tmp.cond_date1_to,
                tmp.cond_date2_from,
                tmp.cond_date2_to,
                pv_user,
                pv_user,
                sysdate,
                sysdate
            from ams_ept_condition_tmp tmp
            where tmp.cond_user_id = pv_user
                and tmp.cond_store_id = to_number(pv_bistore_id);
            commit;
        end;

        -- Buoc 03a: Luu thong tin cau hinh du lieu he so du phong va huy 14 ngay
        begin
            delete ams_ept_condition_ext c
            where c.cond_store_id = to_number(pv_bistore_id);
            commit;

            insert into ams_ept_condition_ext (
                cond_condition_id,
                cond_store_id,
                cond_group_id,
                cond_index_id,
                cond_index_code,
                cond_num_from,
                cond_num_to,
                cond_create_user,
                cond_update_user,
                cond_create_datetime,
                cond_update_datetime
            )
            select
                tmp.cond_condition_id,
                tmp.cond_store_id,
                tmp.cond_group_id,
                tmp.cond_index_id,
                tmp.cond_index_code,
                tmp.cond_num_from,
                tmp.cond_num_to,
                pv_user,
                pv_user,
                sysdate,
                sysdate
            from ams_ept_condition_ext_tmp tmp
            where tmp.cond_user_id = pv_user
                and tmp.cond_store_id = to_number(pv_bistore_id);
            commit;
        end;

        -- Buoc 04: Luu thong tin tong hop du lieu
        begin
            delete ams_ept_condition_result cr
            where cr.core_store_id = to_number(pv_bistore_id);
            commit;

            insert into ams_ept_condition_result nologging (
                core_store_id,
                core_group_id,
                core_condition_id,
                core_policy_qty,
                core_ip,
                core_afyp,
                core_fyp,
                core_active,
                core_create_user,
                core_update_user,
                core_create_datetime,
                core_update_datetime
            )
            select
                tmp.core_store_id,
                tmp.core_group_id,
                tmp.core_condition_id,
                tmp.core_policy_qty,
                tmp.core_ip,
                tmp.core_afyp,
                tmp.core_fyp,
                tmp.core_active,
                pv_user,
                pv_user,
                sysdate,
                sysdate
            from ams_ept_condition_result_tmp tmp
            where tmp.core_user_id = pv_user
                and tmp.core_store_id = to_number(pv_bistore_id);
            commit;
        end;

        -- Buoc 05: Luu thong tin chi tiet du lieu
        begin
            -- Chua thuc hien (dam phan lai)
            null;
        end;

        -- Buoc 06: Luu phan tich du lieu
        begin
            delete ams_ept_analyze a
            where a.anal_store_id = to_number(pv_bistore_id);
            commit;

            insert into ams_ept_analyze nologging (
                anal_analyze_id,
                anal_store_id,
                anal_group_id,
                anal_data_code,
                anal_data_num,
                anal_class_id,
                anal_ip_from,
                anal_ip_to,
                anal_afyp_from,
                anal_afyp_to,
                anal_fyp_from,
                anal_fyp_to,
                anal_reward_type_id,
                anal_reward_value,
                anal_active,
                anal_policy_qty,
                anal_ip,
                anal_afyp,
                anal_fyp,
                anal_policy_total,
                anal_ip_total,
                anal_afyp_total,
                anal_fyp_total,
                anal_policy_prc,
                anal_ip_prc,
                anal_afyp_prc,
                anal_fyp_prc,
                anal_est_policy_qty,
                anal_est_ip,
                anal_est_afyp,
                anal_est_fyp,
                anal_est_money,
                anal_coefficient,
                anal_real_policy_qty,
                anal_real_ip,
                anal_real_afyp,
                anal_real_fyp,
                anal_real_policy_total,
                anal_real_ip_total,
                anal_real_afyp_total,
                anal_real_fyp_total,
                anal_real_policy_prc,
                anal_real_ip_prc,
                anal_real_afyp_prc,
                anal_real_fyp_prc,
                anal_real_money,
                anal_create_user,
                anal_update_user,
                anal_create_datetime,
                anal_update_datetime
            )
            select
                tmp.anal_analyze_id,
                tmp.anal_store_id,
                tmp.anal_group_id,
                tmp.anal_data_code,
                tmp.anal_data_num,
                tmp.anal_class_id,
                tmp.anal_ip_from,
                tmp.anal_ip_to,
                tmp.anal_afyp_from,
                tmp.anal_afyp_to,
                tmp.anal_fyp_from,
                tmp.anal_fyp_to,
                tmp.anal_reward_type_id,
                tmp.anal_reward_value,
                tmp.anal_active,
                tmp.anal_policy_qty,
                tmp.anal_ip,
                tmp.anal_afyp,
                tmp.anal_fyp,
                tmp.anal_policy_total,
                tmp.anal_ip_total,
                tmp.anal_afyp_total,
                tmp.anal_fyp_total,
                tmp.anal_policy_prc,
                tmp.anal_ip_prc,
                tmp.anal_afyp_prc,
                tmp.anal_fyp_prc,
                tmp.anal_est_policy_qty,
                tmp.anal_est_ip,
                tmp.anal_est_afyp,
                tmp.anal_est_fyp,
                tmp.anal_est_money,
                tmp.anal_coefficient,
                tmp.anal_real_policy_qty,
                tmp.anal_real_ip,
                tmp.anal_real_afyp,
                tmp.anal_real_fyp,
                tmp.anal_real_policy_total,
                tmp.anal_real_ip_total,
                tmp.anal_real_afyp_total,
                tmp.anal_real_fyp_total,
                tmp.anal_real_policy_prc,
                tmp.anal_real_ip_prc,
                tmp.anal_real_afyp_prc,
                tmp.anal_real_fyp_prc,
                tmp.anal_real_money,
                pv_user,
                pv_user,
                sysdate,
                sysdate
            from ams_ept_analyze_tmp tmp
            where tmp.anal_user_id = pv_user
                and tmp.anal_store_id = to_number(pv_bistore_id);
            commit;
        end;

        -- Ket thuc thuc hien
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
    procedure load_main_biaccounts(pv_user varchar2,
        pv_bistore_id varchar2)
    is
    begin
        -- Buoc 01: Kiem tra du lieu
        if (
            pv_user is null
            or
            pv_bistore_id is null
        ) then
            goto procedure_end;
        end if;

        -- Buoc 02: Tai thong tin phan tich du lieu
        begin
            delete ams_ept_analyze_store_tmp del
            where del.anal_user_id = pv_user
                and del.anal_store_id = to_number(pv_bistore_id);
            commit;

            insert into ams_ept_analyze_store_tmp(
                anal_user_id,
                anal_store_id,
                anal_group_id,
                anal_company_ams_id,
                anal_name,
                anal_doc_no,
                anal_module_type_id,
                anal_program_id,
                anal_code,
                anal_create_user,
                anal_update_user,
                anal_create_datetime,
                anal_update_datetime)
            select
                pv_user,
                anal.anal_store_id,
                anal.anal_group_id,
                anal.anal_company_ams_id,
                anal.anal_name,
                anal.anal_doc_no,
                anal.anal_module_type_id,
                anal.anal_program_id,
                anal.anal_code,
                anal.anal_create_user,
                pv_user,
                anal.anal_create_datetime,
                sysdate
            from ams_ept_analyze_store anal
            where anal.anal_store_id = to_number(pv_bistore_id);
            commit;
        end;

        -- Buoc 03: Tai thong tin cau hinh du lieu
        begin
            delete ams_ept_condition_tmp del
            where del.cond_user_id = pv_user
                and del.cond_store_id = to_number(pv_bistore_id);
            commit;

            insert into ams_ept_condition_tmp (
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
            select
                c.cond_condition_id,
                pv_user,
                c.cond_store_id,
                c.cond_group_id,
                c.cond_index_id,
                c.cond_index_code,
                c.cond_date1_from,
                c.cond_date1_to,
                c.cond_date2_from,
                c.cond_date2_to,
                c.cond_create_user,
                pv_user,
                c.cond_create_datetime,
                sysdate
            from ams_ept_condition c
            where c.cond_store_id = to_number(pv_bistore_id);
            commit;
        end;


        -- Buoc 03a: Tai thong tin cau hinh du lieu( he so du phong va huy 14 ngay
        begin
            delete ams_ept_condition_ext_tmp del
            where del.cond_user_id = pv_user
                and del.cond_store_id = to_number(pv_bistore_id);
            commit;

            insert into ams_ept_condition_ext_tmp (
                cond_condition_id,
                cond_user_id,
                cond_store_id,
                cond_group_id,
                cond_index_id,
                cond_index_code,
                cond_num_from,
                cond_num_to,
                cond_create_user,
                cond_update_user,
                cond_create_datetime,
                cond_update_datetime
            )
            select
                c.cond_condition_id,
                pv_user,
                c.cond_store_id,
                c.cond_group_id,
                c.cond_index_id,
                c.cond_index_code,
                c.cond_num_from,
                c.cond_num_to,
                c.cond_create_user,
                pv_user,
                c.cond_create_datetime,
                sysdate
            from ams_ept_condition_ext c
            where c.cond_store_id = to_number(pv_bistore_id);
            commit;
        end;

        -- Buoc 04: Tai thong tin tong hop du lieu
        begin
            delete ams_ept_condition_result_tmp del
            where del.core_user_id = pv_user
                and del.core_store_id = to_number(pv_bistore_id);
            commit;

            insert into ams_ept_condition_result_tmp nologging (
                core_user_id,
                core_store_id,
                core_group_id,
                core_condition_id,
                core_policy_qty,
                core_ip,
                core_afyp,
                core_fyp,
                core_active,
                core_create_user,
                core_update_user,
                core_create_datetime,
                core_update_datetime
            )
            select
                pv_user,
                cr.core_store_id,
                cr.core_group_id,
                cr.core_condition_id,
                cr.core_policy_qty,
                cr.core_ip,
                cr.core_afyp,
                cr.core_fyp,
                cr.core_active,
                cr.core_create_user,
                pv_user,
                cr.core_create_datetime,
                sysdate
            from ams_ept_condition_result cr
            where cr.core_store_id = to_number(pv_bistore_id);
            commit;
        end;

        -- Buoc 05: Tai thong tin chi tiet du lieu
        begin
            -- Chua thuc hien (dam phan lai)
            null;
        end;

        -- Buoc 06: Tai phan tich du lieu
        begin
            delete ams_ept_analyze_tmp del
            where del.anal_user_id = pv_user
                and del.anal_store_id = to_number(pv_bistore_id);
            commit;

            insert into ams_ept_analyze_tmp nologging (
                anal_analyze_id,
                anal_user_id,
                anal_store_id,
                anal_group_id,
                anal_data_code,
                anal_data_num,
                anal_class_id,
                anal_ip_from,
                anal_ip_to,
                anal_afyp_from,
                anal_afyp_to,
                anal_fyp_from,
                anal_fyp_to,
                anal_reward_type_id,
                anal_reward_value,
                anal_active,
                anal_policy_qty,
                anal_ip,
                anal_afyp,
                anal_fyp,
                anal_policy_total,
                anal_ip_total,
                anal_afyp_total,
                anal_fyp_total,
                anal_policy_prc,
                anal_ip_prc,
                anal_afyp_prc,
                anal_fyp_prc,
                anal_est_policy_qty,
                anal_est_ip,
                anal_est_afyp,
                anal_est_fyp,
                anal_est_money,
                anal_coefficient,
                anal_real_policy_qty,
                anal_real_ip,
                anal_real_afyp,
                anal_real_fyp,
                anal_real_policy_total,
                anal_real_ip_total,
                anal_real_afyp_total,
                anal_real_fyp_total,
                anal_real_policy_prc,
                anal_real_ip_prc,
                anal_real_afyp_prc,
                anal_real_fyp_prc,
                anal_real_money,
                anal_create_user,
                anal_update_user,
                anal_create_datetime,
                anal_update_datetime
            )
            select
                anal.anal_analyze_id,
                pv_user,
                anal.anal_store_id,
                anal.anal_group_id,
                anal.anal_data_code,
                anal.anal_data_num,
                anal.anal_class_id,
                anal.anal_ip_from,
                anal.anal_ip_to,
                anal.anal_afyp_from,
                anal.anal_afyp_to,
                anal.anal_fyp_from,
                anal.anal_fyp_to,
                anal.anal_reward_type_id,
                anal.anal_reward_value,
                anal.anal_active,
                anal.anal_policy_qty,
                anal.anal_ip,
                anal.anal_afyp,
                anal.anal_fyp,
                anal.anal_policy_total,
                anal.anal_ip_total,
                anal.anal_afyp_total,
                anal.anal_fyp_total,
                anal.anal_policy_prc,
                anal.anal_ip_prc,
                anal.anal_afyp_prc,
                anal.anal_fyp_prc,
                anal.anal_est_policy_qty,
                anal.anal_est_ip,
                anal.anal_est_afyp,
                anal.anal_est_fyp,
                anal.anal_est_money,
                anal.anal_coefficient,
                anal.anal_real_policy_qty,
                anal.anal_real_ip,
                anal.anal_real_afyp,
                anal.anal_real_fyp,
                anal.anal_real_policy_total,
                anal.anal_real_ip_total,
                anal.anal_real_afyp_total,
                anal.anal_real_fyp_total,
                anal.anal_real_policy_prc,
                anal.anal_real_ip_prc,
                anal.anal_real_afyp_prc,
                anal.anal_real_fyp_prc,
                anal.anal_real_money,
                anal.anal_create_user,
                pv_user,
                anal.anal_create_datetime,
                sysdate
            from ams_ept_analyze anal
            where anal.anal_store_id = to_number(pv_bistore_id);
            commit;
        end;

        -- Ket thuc thuc hien
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
    procedure tmp_get_info_biaccounts(pv_user varchar2,
        pv_bistore_id varchar2,
        pr_records out sys_refcursor)
    is
    begin
        -- Buoc 01: Kiem tra du lieu
        if (
            pv_user is null
        ) then
            goto procedure_end;
        end if;

        open pr_records for
        select
            a. *,
            b.program_name
        from
        (
            select *
            from ams_ept_analyze_store_tmp tmp
            where tmp.anal_user_id = pv_user
                and tmp.anal_store_id = to_number(pv_bistore_id)
        ) a
        left join
        (
            select
                a.prog_program_id,
                a.prog_program_name program_name
            from  ep_program a
        ) b
            on a.anal_program_id = b.prog_program_id;

        -- Ket thuc thuc hien
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
    procedure tmp_get_time_biaccounts(pv_user varchar2,
        pv_bistore_id varchar2,
        pv_time_code varchar2,
        pr_records out sys_refcursor)
    is
    begin
        -- Buoc 01: Kiem tra du lieu
        if (
            pv_user is null
            or
            pv_bistore_id is null
        ) then
            goto procedure_end;
        end if;

        open pr_records for
        select *
        from ams_ept_condition_tmp tmp
        where tmp.cond_user_id = pv_user
            and tmp.cond_store_id = to_number(pv_bistore_id)
            and tmp.cond_index_code = pv_time_code;

        -- Ket thuc thuc hien
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
    procedure tmp_run_biaccounts(pv_user varchar2,
        pv_bistore_id varchar2,
        pv_group_id varchar2)
    is
        cursor cur is
        select
             a.anal_analyze_id,
             a.anal_user_id,
             nvl(a.anal_ip_from, 0) ip_from,
             nvl(a.anal_ip_to, 1000000000000) ip_to,
             nvl(a.anal_afyp_from, 0) afyp_from,
             nvl(a.anal_afyp_to, 1000000000000) afyp_to
         from ams_ept_analyze_tmp a
         where a.anal_user_id = pv_user
             and a.anal_store_id = to_number(pv_bistore_id)
             and a.anal_group_id = to_number(pv_group_id)
             and a.anal_data_code = 'DETAIL';

        var_cestm_id number := null;
        var_cpriod_id number := null;

        var_real_policy_total number;
        var_real_ip_total number;
        var_real_afyp_total number;


        var_hsduphong number := 100;
    begin
        -- Buoc 01.A: Ghi nhan dieu kien tham khao
        begin
            select
                c.cond_condition_id
                    into
                        var_cestm_id
            from ams_ept_condition_tmp c
            where c.cond_user_id = pv_user
                and c.cond_store_id = to_number(pv_bistore_id)
                and c.cond_index_code in ('ANA_DATE');
        exception
            when others then
                var_cestm_id := null;
        end;

        -- Buoc 01.B: Ghi nhan dieu kien cung ky
        begin
            select
                nvl(cr.core_condition_id, 0)
                    into
                        var_cpriod_id
            from ams_ept_condition_result_tmp cr
            where cr.core_user_id = pv_user
                and cr.core_store_id = to_number(pv_bistore_id)
                and cr.core_active = 1;
        exception
            when others then
                var_cpriod_id := null;
        end;

        -- Buoc 02: Ghi nhan du lieu tham khao
        begin
            for c in cur
            loop
                merge
                  into ams_ept_analyze_tmp anal
                using
                   (
                       select
                           count(*) sum_accounts,
                           sum(t.ip) sum_ip,
                           sum(t.afyp) sum_afyp
                       from ams_ept_prc_detail_tmp t
                       where t.prc_user_id = pv_user
                           and t.prc_store_id = to_number(pv_bistore_id)
                           and t.prc_group_id = to_number(pv_group_id)
                           and t.prc_condition_id = var_cestm_id
                           and t.ip >= c.ip_from
                           and t.ip < c.ip_to
                           and t.afyp >= c.afyp_from
                           and t.afyp < c.afyp_to
                   ) upd
                on(
                   anal.anal_analyze_id = c.anal_analyze_id
                )
                when matched then
                   update
                       set
                           anal.anal_policy_qty = upd.sum_accounts,
                           anal.anal_ip = upd.sum_ip,
                           anal.anal_afyp = upd.sum_afyp,
                           anal.anal_update_user = pv_user,
                           anal.anal_update_datetime = sysdate;
                commit;
            end loop;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_BIACCOUNT.tmp_run_biaccounts] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 03: Xac dinh du lieu tham khao
        begin
            merge
               into ams_ept_analyze_tmp des
            using
               (
                   select
                       count(*) sum_accounts,
                       sum(t.ip) sum_ip,
                       sum(t.afyp) sum_afyp
                   from ams_ept_prc_detail_tmp t
                   where t.prc_user_id = pv_user
                       and t.prc_store_id = to_number(pv_bistore_id)
                       and t.prc_group_id = to_number(pv_group_id)
                       and t.prc_condition_id = var_cestm_id
               ) upd
            on (
               des.anal_user_id = pv_user
               and
               des.anal_store_id = to_number(pv_bistore_id)
               and
               des.anal_data_code = 'S1'
            )
            when matched then
               update
                   set
                       des.anal_policy_qty = upd.sum_accounts,
                       des.anal_ip = upd.sum_ip,
                       des.anal_afyp = upd.sum_afyp,
                       des.anal_policy_prc = 100,
                       des.anal_ip_prc = 100,
                       des.anal_afyp_prc = 100,
                       des.anal_update_user = pv_user,
                       des.anal_update_datetime = sysdate;
            commit;

            for c in cur
            loop
                merge
                  into ams_ept_analyze_tmp anal
                using
                   (
                       select
                           d.anal_analyze_id,
                           case
                               when nvl(t.anal_policy_qty, 0) <> 0 then
                                   round(nvl(d.anal_policy_qty, 0) / nvl(t.anal_policy_qty, 0) * 100, 2)
                               else
                                   null
                               end prc_accounts,
                           case
                               when nvl(t.anal_ip, 0) <> 0 then
                                   round(nvl(d.anal_ip, 0) / nvl(t.anal_ip, 0) * 100, 2)
                               else
                                   null
                               end prc_ip,
                           case
                               when nvl(t.anal_afyp, 0) <> 0 then
                                   round(nvl(d.anal_afyp, 0) / nvl(t.anal_afyp, 0) * 100, 2)
                               else
                                   null
                               end prc_afyp
                       from
                       (
                           select *
                           from ams_ept_analyze_tmp tmp
                           where tmp.anal_analyze_id = c.anal_analyze_id
                       ) d
                       left join
                       (
                           select *
                           from ams_ept_analyze_tmp tmp
                           where tmp.anal_user_id = pv_user
                               and tmp.anal_store_id = to_number(pv_bistore_id)
                               and tmp.anal_data_code = 'S1'
                       ) t
                           on t.anal_store_id = d.anal_store_id
                   ) upd
                on(
                   anal.anal_analyze_id = upd.anal_analyze_id
                   and
                   anal.anal_user_id = pv_user
                   and
                   anal.anal_store_id = to_number(pv_bistore_id)
                )
                when matched then
                   update
                       set
                           anal.anal_policy_prc = upd.prc_accounts,
                           anal.anal_ip_prc = upd.prc_ip,
                           anal.anal_afyp_prc = upd.prc_afyp,
                           anal.anal_update_user = pv_user,
                           anal.anal_update_datetime = sysdate;
                commit;
            end loop;

            -- Buoc 03.C: Ty trong
            merge
               into ams_ept_analyze_tmp anal
            using
               (
                   select
                       sum(tmp.anal_policy_prc) prc_accounts,
                       sum(tmp.anal_ip_prc) prc_ip,
                       sum(tmp.anal_afyp_prc) prc_afyp
                   from ams_ept_analyze_tmp tmp
                   where tmp.anal_user_id = pv_user
                       and tmp.anal_store_id = to_number(pv_bistore_id)
                       and tmp.anal_group_id = to_number(pv_group_id)
                       and tmp.anal_data_code = 'DETAIL'
                       and tmp.anal_active = 1
               ) upd
            on (
               anal.anal_user_id = pv_user
               and
               anal.anal_store_id = to_number(pv_bistore_id)
               and
               anal.anal_data_code = 'S2'
            )
            when matched then
               update
                   set
                       anal.anal_policy_prc = upd.prc_accounts,
                       anal.anal_ip_prc = upd.prc_ip,
                       anal.anal_afyp_prc = upd.prc_afyp,
                       anal.anal_update_user = pv_user,
                       anal.anal_update_datetime = sysdate;
            commit;
        end;

        -- Buoc 04: Xac dinh du lieu du doan
        begin
            merge
               into ams_ept_analyze_tmp des
            using
               (
                    select /*+ CARDINALITY(tmp, 10) */
                        tmp.core_store_id anal_store_id,
                        tmp.core_policy_qty sum_accounts,
                        tmp.core_ip sum_ip,
                        tmp.core_afyp sum_afyp
                    from ams_ept_condition_result_tmp tmp
                    where tmp.core_user_id = pv_user
                        and tmp.core_store_id = to_number(pv_bistore_id)
                        and tmp.core_condition_id = var_cpriod_id
                        and tmp.core_active = 1
               ) upd
            on (
               des.anal_user_id = pv_user
               and
               des.anal_store_id = upd.anal_store_id
               and
               des.anal_data_code = 'S1'
            )
            when matched then
               update
                   set
                       des.anal_est_policy_qty = upd.sum_accounts,
                       des.anal_est_ip = upd.sum_ip,
                       des.anal_est_afyp = upd.sum_afyp,
                       des.anal_update_user = pv_user,
                       des.anal_update_datetime = sysdate;
            commit;

            for c in cur
            loop
                merge
                  into ams_ept_analyze_tmp anal
                using
                   (
                       select
                           d.anal_analyze_id,
                           round(nvl(d.anal_policy_prc, 0) * nvl(t.anal_est_policy_qty, 0) / 100) estm_accounts,
                           round(nvl(d.anal_ip_prc, 0) * nvl(t.anal_est_ip, 0) / 100) estm_ip,
                           round(nvl(d.anal_afyp_prc, 0) * nvl(t.anal_est_afyp, 0) / 100) estm_afyp
                       from
                       (
                           select *
                           from ams_ept_analyze_tmp tmp
                           where tmp.anal_analyze_id = c.anal_analyze_id
                       ) d
                       left join
                       (
                           select *
                           from ams_ept_analyze_tmp tmp
                           where tmp.anal_user_id = pv_user
                               and tmp.anal_store_id = to_number(pv_bistore_id)
                               and tmp.anal_data_code = 'S1'
                       ) t
                           on t.anal_store_id = d.anal_store_id
                   ) upd
                on(
                   anal.anal_analyze_id = upd.anal_analyze_id
                   and
                   anal.anal_user_id = pv_user
                   and
                   anal.anal_store_id = to_number(pv_bistore_id)
                )
                when matched then
                   update
                       set
                           anal.anal_est_policy_qty = upd.estm_accounts,
                           anal.anal_est_ip = upd.estm_ip,
                           anal.anal_est_afyp = upd.estm_afyp,
                           anal.anal_update_user = pv_user,
                           anal.anal_update_datetime = sysdate;
                commit;
            end loop;
        end;

        -- Buoc 05: Xac dinh cac dieu kien con lai
        begin
            merge
               into ams_ept_analyze_tmp des
            using
               (
                   select
                       sum(g.sum_accounts) sum_accounts,
                       sum(g.sum_ip) sum_ip,
                       sum(g.sum_afyp) sum_afyp,
                       sum(g.per_accounts) per_accounts,
                       sum(g.per_ip) per_ip,
                       sum(g.per_afyp) per_afyp
                   from
                   (
                       select
                           t.anal_policy_qty sum_accounts,
                           t.anal_ip sum_ip,
                           t.anal_afyp sum_afyp,
                           t.anal_policy_prc per_accounts,
                           t.anal_ip_prc per_ip,
                           t.anal_afyp_prc per_afyp
                       from ams_ept_analyze_tmp t
                       where t.anal_user_id = pv_user
                           and t.anal_store_id = to_number(pv_bistore_id)
                           and t.anal_data_code = 'S1'
                       union all
                       select
                           -t.anal_policy_qty sum_accounts,
                           -t.anal_ip sum_ip,
                           -t.anal_afyp sum_afyp,
                           -t.anal_policy_prc per_accounts,
                           -t.anal_ip_prc per_ip,
                           -t.anal_afyp_prc per_afyp
                       from ams_ept_analyze_tmp t
                       where t.anal_user_id = pv_user
                           and t.anal_store_id = to_number(pv_bistore_id)
                           and t.anal_data_code = 'DETAIL'
                   ) g
               ) upd
            on (
               des.anal_user_id = pv_user
               and
               des.anal_store_id = to_number(pv_bistore_id)
               and
               des.anal_data_code = 'S0'
            )
            when matched then
               update
                   set
                       des.anal_policy_qty = upd.sum_accounts,
                       des.anal_ip = upd.sum_ip,
                       des.anal_afyp = upd.sum_afyp,
                       des.anal_policy_prc = upd.per_accounts,
                       des.anal_ip_prc = upd.per_ip,
                       des.anal_afyp_prc = upd.per_afyp,
                       des.anal_update_user = pv_user,
                       des.anal_update_datetime = sysdate;
            commit;
        end;

        -- Ket thuc thuc hien
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
    procedure tmp_calc_biaccounts(pv_user varchar2,
        pv_bistore_id varchar2)
    is
        cursor cur is
        select
             a.anal_analyze_id,
             a.anal_user_id,
             nvl(a.anal_ip_from, 0) ip_from,
             nvl(a.anal_ip_to, 1000000000000) ip_to,
             nvl(a.anal_afyp_from, 0) afyp_from,
             nvl(a.anal_afyp_to, 1000000000000) afyp_to
         from ams_ept_analyze_tmp a
         where a.anal_user_id = pv_user
             and a.anal_store_id = to_number(pv_bistore_id)
             and a.anal_data_code = 'DETAIL';

        var_creal_id number := null;
        var_hsduphong number := 100;
    begin
        -- Buoc 01: Kiem tra du lieu
        if (
            pv_user is null
            or
            pv_bistore_id is null
        ) then
            goto procedure_end;
        end if;

        -- Buoc 01.A: Ghi nhan dieu kien thuc te
        begin
            select
                c.cond_condition_id
                    into
                        var_creal_id
            from ams_ept_condition_tmp c
            where c.cond_user_id = pv_user
                and c.cond_store_id = to_number(pv_bistore_id)
                and c.cond_index_code in ('ANA_DATE0');
        exception
            when others then
                var_creal_id := null;
        end;

        -- Buoc 02: Tinh thuong theo cung ky
        begin
            update ams_ept_analyze_tmp anal
            set
                anal.anal_est_money =
                    case
                        when anal.anal_reward_type_id in (1) then
                            round(nvl(anal.anal_reward_value, 0) * nvl(anal.anal_est_policy_qty, 0))
                        when anal.anal_reward_type_id in (2) then
                            round(nvl(anal.anal_reward_value, 0) * nvl(anal.anal_est_ip, 0) / 100)
                        when anal.anal_reward_type_id in (3) then
                            round(nvl(anal.anal_reward_value, 0) * nvl(anal.anal_est_afyp, 0) / 100)
                        else
                            0
                        end,
                anal.anal_update_user = pv_user,
                anal.anal_update_datetime = sysdate
            where anal.anal_user_id = pv_user
                and anal.anal_store_id = to_number(pv_bistore_id)
                and anal.anal_data_code in ('DETAIL')
                and nvl(anal.anal_active, 0) = 1;
            commit;
        end;


        -- Buoc 03:
        begin
            for c in cur
            loop
                merge
                  into ams_ept_analyze_tmp anal
                using
                   (
                       select
                           t.prc_user_id,
                           t.prc_store_id,
                           t.prc_group_id,
                           count(*) sum_accounts,
                           sum(t.ip) sum_ip,
                           sum(t.afyp) sum_afyp
                       from ams_ept_prc_detail_tmp t
                       where t.prc_user_id = pv_user
                           and t.prc_store_id = to_number(pv_bistore_id)
                           --and t.prc_group_id = to_number(pv_group_id)
                           and t.prc_condition_id = var_creal_id
                           and t.ip >= c.ip_from
                           and t.ip < c.ip_to
                           and t.afyp >= c.afyp_from
                           and t.afyp < c.afyp_to
                       group by
                           t.prc_user_id,
                           t.prc_store_id,
                           t.prc_group_id
                   ) upd
                on(
                   anal.anal_user_id = upd.prc_user_id
                   and
                   anal.anal_store_id = upd.prc_store_id
                   and
                   anal.anal_group_id = upd.prc_group_id
                   and
                   anal.anal_analyze_id = c.anal_analyze_id
                )
                when matched then
                   update
                       set
                           anal.anal_real_policy_qty = upd.sum_accounts,
                           anal.anal_real_ip = upd.sum_ip,
                           anal.anal_real_afyp = upd.sum_afyp,
                           anal.anal_update_user = pv_user,
                           anal.anal_update_datetime = sysdate;
                commit;
            end loop;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_BIACCOUNT.tmp_run_biaccounts] ' || SQLERRM);
                goto procedure_end;
        end;

        begin
            merge
               into ams_ept_analyze_tmp des
            using
               (
                    select /*+ CARDINALITY(tmp, 10) */
                        sum(nvl(tmp.anal_real_policy_qty, 0 )) sum_accounts,
                        sum(nvl(tmp.anal_real_ip, 0 )) sum_ip,
                        sum(nvl(tmp.anal_real_afyp, 0 )) sum_afyp
                    from ams_ept_analyze_tmp tmp
                    where tmp.anal_user_id = pv_user
                        and tmp.anal_store_id = to_number(pv_bistore_id)
                        and tmp.anal_data_code = 'DETAIL'
               ) upd
            on (
               des.anal_user_id = pv_user
               and
               des.anal_store_id = to_number(pv_bistore_id)
               and
               des.anal_data_code = 'S1'
            )
            when matched then
               update
                   set
                       des.anal_real_policy_qty = upd.sum_accounts,
                       des.anal_real_ip = upd.sum_ip,
                       des.anal_real_afyp = upd.sum_afyp,
                       des.anal_real_policy_prc = 100,
                       des.anal_real_ip_prc = 100,
                       des.anal_real_afyp_prc = 100,
                       des.anal_update_user = pv_user,
                       des.anal_update_datetime = sysdate;
            commit;

            for c in cur
            loop
                merge
                  into ams_ept_analyze_tmp anal
                using
                   (
                       select
                           d.anal_analyze_id,
                           case
                               when nvl(t.anal_real_policy_qty, 0) <> 0 then
                                   round(nvl(d.anal_real_policy_qty, 0) / nvl(t.anal_real_policy_qty, 0) * 100, 2)
                               else
                                   null
                               end prc_accounts,
                           case
                               when nvl(t.anal_real_ip, 0) <> 0 then
                                   round(nvl(d.anal_real_ip, 0) / nvl(t.anal_real_ip, 0) * 100, 2)
                               else
                                   null
                               end prc_ip,
                           case
                               when nvl(t.anal_real_afyp, 0) <> 0 then
                                   round(nvl(d.anal_real_afyp, 0) / nvl(t.anal_real_afyp, 0) * 100, 2)
                               else
                                   null
                               end prc_afyp
                       from
                       (
                           select *
                           from ams_ept_analyze_tmp tmp
                           where tmp.anal_analyze_id = c.anal_analyze_id
                       ) d
                       left join
                       (
                           select *
                           from ams_ept_analyze_tmp tmp
                           where tmp.anal_user_id = pv_user
                               and tmp.anal_store_id = to_number(pv_bistore_id)
                               and tmp.anal_data_code = 'S1'
                       ) t
                           on t.anal_store_id = d.anal_store_id
                   ) upd
                on(
                   anal.anal_analyze_id = upd.anal_analyze_id
                   and
                   anal.anal_user_id = pv_user
                   and
                   anal.anal_store_id = to_number(pv_bistore_id)
                )
                when matched then
                   update
                       set
                           anal.anal_real_policy_prc = upd.prc_accounts,
                           anal.anal_real_ip_prc = upd.prc_ip,
                           anal.anal_real_afyp_prc = upd.prc_afyp,
                           anal.anal_update_user = pv_user,
                           anal.anal_update_datetime = sysdate;
                commit;
            end loop;
        end;

        begin
            merge
               into ams_ept_analyze_tmp des
            using
               (
                    select /*+ CARDINALITY(tmp, 10) */
                        tmp.anal_store_id anal_store_id,
                        sum(tmp.anal_real_policy_prc) sum_accounts,
                        sum(tmp.anal_real_ip_prc) sum_ip,
                        sum(tmp.anal_real_afyp_prc) sum_afyp
                    from ams_ept_analyze_tmp tmp
                    where tmp.anal_user_id = pv_user
                        and tmp.anal_store_id = to_number(pv_bistore_id)
                        and tmp.anal_active = 1
                    group by tmp.anal_store_id
               ) upd
            on (
               des.anal_user_id = pv_user
               and
               des.anal_store_id = upd.anal_store_id
               and
               des.anal_data_code = 'S2'
            )
            when matched then
               update
                   set
                       des.anal_real_policy_prc = upd.sum_accounts,
                       des.anal_real_ip_prc = upd.sum_ip,
                       des.anal_real_afyp_prc = upd.sum_afyp,
                       des.anal_update_user = pv_user,
                       des.anal_update_datetime = sysdate;
            commit;
        end;

         --  Lay he so du phong roi nhan voi he so du phong
         begin
             select nvl(tmp.cond_num_from, 100)
                 into var_hsduphong
             from ams_ept_condition_ext_tmp tmp
             where tmp.cond_store_id =  to_number(pv_bistore_id)
                 and tmp.cond_user_id = pv_user
                 and tmp.cond_index_code = 'HESODUPHONG';
         exception when no_data_found then
               var_hsduphong := 100;
         end;

        begin
            update ams_ept_analyze_tmp anal
            set
                anal.anal_real_money =
                    case
                        when anal.anal_reward_type_id in (1) then
                            round(nvl(anal.anal_reward_value, 0) * nvl(anal.anal_real_policy_qty, 0) * (nvl(var_hsduphong, 100) / 100))
                        when anal.anal_reward_type_id in (2) then
                            round(nvl(anal.anal_reward_value, 0) * nvl(anal.anal_real_ip, 0) / 100 * (nvl(var_hsduphong, 100) / 100) )
                        when anal.anal_reward_type_id in (3) then
                            round(nvl(anal.anal_reward_value, 0) * nvl(anal.anal_real_afyp, 0) / 100 * (nvl(var_hsduphong, 100) / 100))
                        else
                            0
                        end,
                anal.anal_update_user = pv_user,
                anal.anal_update_datetime = sysdate
            where anal.anal_user_id = pv_user
                and anal.anal_store_id = to_number(pv_bistore_id)
                and anal.anal_data_code in ('DETAIL');
            commit;

            merge
              into ams_ept_analyze_tmp anal
            using
               (
                   select
                       tmp.anal_store_id,
                       sum(tmp.anal_est_money) esum_money,
                       sum(tmp.anal_real_money) rsum_money
                   from ams_ept_analyze_tmp tmp
                   where tmp.anal_user_id = pv_user
                       and tmp.anal_store_id = to_number(pv_bistore_id)
                       and tmp.anal_data_code in ('DETAIL')
                   group by tmp.anal_store_id
               ) upd
            on(
               anal.anal_user_id = pv_user
               and
               anal.anal_store_id = upd.anal_store_id
               and
               anal.anal_data_code = 'S1'
            )
            when matched then
               update
                   set
                       anal.anal_est_money = upd.esum_money,
                       anal.anal_real_money = upd.rsum_money,
                       anal.anal_update_user = pv_user,
                       anal.anal_update_datetime = sysdate;
            commit;
        end;

        -- Ket thuc thuc hien
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
    procedure tmp_bsave_biaccounts(pv_user varchar2,
        pv_analyze_id varchar2,
        pv_bistore_id varchar2,
        pn_mmoney number default 0,
        pn_tmoney number default 0)
    is
    begin
        -- Buoc 01: Kiem tra du lieu
        if (pv_user is null) then
            goto procedure_end;
        end if;

        begin
            update ams_ept_analyze_tmp anal
            set
                anal.anal_reward_value = pn_mmoney,
                anal.anal_reward_type_id = pn_tmoney,
                anal.anal_update_user = pv_user,
                anal.anal_update_datetime = sysdate
            where anal.anal_user_id = pv_user
                and anal.anal_analyze_id = to_number(pv_analyze_id)
                and anal.anal_store_id = to_number(pv_bistore_id);
            commit;
        end;

        -- Ket thuc thuc hien
        <<procedure_end>>
            null;
    end;
    -----------------------------------------------------------------
    /* END PROCEDURE*/
    -----------------------------------------------------------------

    -----------------------------------------------------------------
    /* BEGIN FUNCTION*/
    -----------------------------------------------------------------
    -----------------------------------------------------------------
    /* END FUNCTION*/
    -----------------------------------------------------------------

end AMS_MODL_BIACCOUNT;
/
