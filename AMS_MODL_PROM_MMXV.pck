create or replace package ams.AMS_MODL_PROM_MMXV is

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
        Creater: Vu Duc Thong
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_prepare(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_prepare_open(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_prepare_data(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_prepare_pack(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_prepare_close(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 06/11/2014
        Version: 1.0
        Description: Thang tien TVV -> TTN
        Parameter:
        Update:
    */
    procedure mmxv_modl_agep(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_agep_open(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_agep_data(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_agep_cond(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_agep_comp(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_agep_close(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 06/11/2014
        Version: 1.0
        Description: Thang tien TTN -> TN
        Parameter:
        Update:
    */
    procedure mmxv_modl_umnp(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_umnp_open(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_umnp_data(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_umnp_cond(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_umnp_comp(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_umnp_close(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 02/04/2015
        Version: 1.0
        Description: Duy tri TN
        Parameter:
        Update:
    */
    procedure mmxv_modl_umnm(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 02/04/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_umnm_open(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 02/04/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_umnm_data(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 02/04/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_umnm_cond(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 02/04/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_umnm_comp(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 02/04/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_umnm_close(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 08/04/2015
        Version: 1.0
        Description: Thang tien TN -> TN
        Parameter:
        Update:
    */
    procedure mmxv_modl_amnp(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 08/04/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_amnp_open(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 08/04/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_amnp_data(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 08/04/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_amnp_cond(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 08/04/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_amnp_comp(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 08/04/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_amnp_close(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 08/04/2015
        Version: 1.0
        Description: Duy tri TB
        Parameter:
        Update:
    */
    procedure mmxv_modl_amnm(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 08/04/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_amnm_open(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 08/04/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_amnm_data(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 08/04/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_amnm_cond(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 08/04/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_amnm_comp(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 08/04/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_amnm_close(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 06/11/2014
        Version: 1.0
        Description: Thang tien TVV -> TVV thanh cong
        Parameter:
        Update:
    */
    procedure mmxv_modl_succ(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_succ_open(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_succ_data(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_succ_cond(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_succ_comp(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_succ_close(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 01/12/2015
        Version: 1.0
        Description: Thang tien TVV -> TVV chu luc
        Parameter:
        Update:
    */
    procedure mmxv_modl_okey(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_okey_open(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_okey_data(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_okey_cond(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_okey_comp(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_okey_close(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Vu Duc Thong
        Date Create: 11/12/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_clean(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

end AMS_MODL_PROM_MMXV;
/
create or replace package body ams.AMS_MODL_PROM_MMXV is

    procedure main
    is
    begin
        null;
    end;

    -----------------------------------------------------------------
    /* BEGIN PROCEDURE*/
    -----------------------------------------------------------------
    /*
        Creater: Le Khac Chinh
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_prepare(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
    begin
        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_prepare_open(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
        var_record_date date := trunc(pd_realize_date, 'MM');
        var_cur_date date := trunc(sysdate, 'MM');

        var_cond_date date := least(var_record_date, var_cur_date);
        var_dbegin date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/PROM/P2015/INFO/BDATE');
        var_dend date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/PROM/P2015/INFO/EDATE');
    begin
        -- Buoc 01: Xoa du lieu neu da ton tai
        begin
            loop
                delete /*+ NOLOGGING */ ams_prc_outlets del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_prc_blocks del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_prc_c015_employments del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_prc_c015_accounts del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_prepare_open] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 02: Ghi nhan du lieu duoc xu ly
        begin
            for i in -12..0
            loop
                if (add_months(var_record_date, i) <= var_cond_date) then
                    insert /*+ APPEND */ into ams_prc_outlets nologging (
                        session_id,
                        record_date,
                        outlet_ams_id,
                        branch_ams_id,
                        sub_branch_ams_id,
                        agency_ams_id,
                        unit_ams_id,
                        location_ams_id,
                        employment_ams_id,
                        referral_ams_id,
                        regency_code,
                        regency_date,
                        effe_date,
                        term_date,
                        create_user,
                        update_user,
                        create_datetime,
                        update_datetime
                    )
                    select /*+ CARDINALITY(dbw, 100)*/
                        pn_session_id,
                        cast(add_months(var_record_date, i) as date),
                        dbw.outlet_ams_id,
                        dbw.branch_ams_id,
                        dbw.sub_branch_ams_id,
                        dbw.agency_ams_id,
                        dbw.unit_ams_id,
                        nvl(dbw.unit_ams_id, dbw.agency_ams_id),
                        dbw.empl_ams_id,
                        dbw.refl_ams_id,
                        dbw.regency_code,
                        dbw.regency_date,
                        dbw.effective_date,
                        dbw.terminal_date,
                        pv_user,
                        pv_user,
                        sysdate,
                        sysdate
                    from dbw_outl_informations dbw
                    where dbw.dbw_code = 'MAIN'
                        and dbw.dbw_time = 'MONT'
                        and dbw.outlet_type = 'OUTL'
                        and dbw.branch_ams_id = pv_outlet_ams_id
                        and dbw.record_date = add_months(var_record_date, i);
                    commit;
                end if;
            end loop;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_prepare_open] ' || SQLERRM);
                goto procedure_end;
        end;

        begin
            insert /*+ APPEND */ into ams_prc_blocks nologging (
                session_id,
                record_date,
                module_code,
                branch_ams_id,
                outlet_ams_id,
                data_code,
                data_value,
                from_date,
                to_date,
                create_user,
                update_user,
                create_datetime,
                update_datetime
            )
            select /*+ CARDINALITY(tc, 100)*/
                pn_session_id,
                var_record_date,
                'PROM',
                null,
                outl.outlet_ams_id,
                'SUCC',
                AMS_CORE_CODE.VALUE_YES,
                slzd.from_date,
                slzd.to_date,
                pv_user,
                pv_user,
                sysdate,
                sysdate
            from
            (
                select *
                from dbw_outl_informations dbw
                where dbw.dbw_code = 'MAIN'
                    and dbw.dbw_time = 'MONT'
                    and dbw.outlet_type = 'OUTL'
                    and dbw.branch_ams_id = pv_outlet_ams_id
                    and dbw.record_date = var_cond_date
            ) outl
            join
            (
                select *
                from cla_outlet_information i
                where i.type_code = 'SLZD'
                    and i.outlet_value = 'SL01'
            ) slzd
                on slzd.outlet_id = outl.outlet_id;
            commit;

            -- Buoc 03.02: Du lieu chung chi dai ly
            insert /*+ APPEND */ into ams_prc_blocks nologging (
                session_id,
                record_date,
                module_code,
                branch_ams_id,
                outlet_ams_id,
                data_code,
                data_value,
                from_date,
                to_date,
                create_user,
                update_user,
                create_datetime,
                update_datetime
            )
            select /*+ CARDINALITY(outl, 100)
                       CARDINALITY(bdh, 100)*/
                pn_session_id,
                var_record_date,
                'PROM',
                pv_outlet_ams_id,
                outl.outlet_ams_id,
                case
                    when bdh.type_code in ('LOAIDT_BDH') then
                        'BDH'
                    when bdh.type_code in ('LOAIDT_BTC1') then
                        'BTC1'
                    when bdh.type_code in ('LOAIDT_BTC2') then
                        'BTC2'
                    when bdh.type_code in ('LOAIDT_BTC3') then
                        'BTC3'
                    when bdh.type_code in ('LOAIDT_BTC4') then
                        'BTC4'
                    else
                        'LOAIDT'
                    end,
                AMS_CORE_CODE.VALUE_YES,
                bdh.from_date,
                bdh.to_date,
                pv_user,
                pv_user,
                sysdate,
                sysdate
            from
            (
                select *
                from dbw_outl_informations dbw
                where dbw.dbw_code = 'MAIN'
                    and dbw.dbw_time = 'MONT'
                    and dbw.outlet_type = 'OUTL'
                    and dbw.branch_ams_id = pv_outlet_ams_id
                    and dbw.record_date = var_cond_date
            ) outl
            join
            (
                select *
                from cla_outlet_information i
                where i.type_code in
                    (
                        'LOAIDT_BDH',
                        'LOAIDT_BTC1',
                        'LOAIDT_BTC2',
                        'LOAIDT_BTC3',
                        'LOAIDT_BTC4'
                    )
            ) bdh
                on bdh.outlet_id = outl.outlet_id;
            commit;

            -- Buoc 03.03: Du lieu ho tro dai ly PA
            insert /*+ APPEND */ into ams_prc_blocks nologging (
                session_id,
                record_date,
                module_code,
                branch_ams_id,
                outlet_ams_id,
                data_code,
                data_value,
                from_date,
                to_date,
                create_user,
                update_user,
                create_datetime,
                update_datetime
            )
            select /*+ CARDINALITY(tc, 100)*/
                pn_session_id,
                var_record_date,
                'PROM',
                null,
                outl.outlet_ams_id,
                supp.type_code,
                supp.outlet_value,
                supp.from_date,
                supp.to_date,
                pv_user,
                pv_user,
                sysdate,
                sysdate
            from
            (
                select *
                from dbw_outl_informations dbw
                where dbw.dbw_code = 'MAIN'
                    and dbw.dbw_time = 'MONT'
                    and dbw.outlet_type = 'OUTL'
                    and dbw.branch_ams_id = pv_outlet_ams_id
                    and dbw.record_date = var_cond_date
            ) outl
            join
            (
                select *
                from cla_outlet_information i
                where i.type_code = 'SUPP'
            ) supp
                on supp.outlet_id = outl.outlet_id;
            commit;

            -- Buoc 03.04: Du lieu dai ly co quyen tuyen dung
            insert /*+ APPEND */ into ams_prc_blocks nologging (
                session_id,
                record_date,
                module_code,
                branch_ams_id,
                outlet_ams_id,
                data_code,
                data_value,
                from_date,
                to_date,
                create_user,
                update_user,
                create_datetime,
                update_datetime
            )
            select /*+ CARDINALITY(tc, 100)*/
                pn_session_id,
                var_record_date,
                'PROM',
                null,
                outl.outlet_ams_id,
                'TD',
                aemp.outlet_value,
                aemp.from_date,
                aemp.to_date,
                pv_user,
                pv_user,
                sysdate,
                sysdate
            from
            (
                select *
                from dbw_outl_informations dbw
                where dbw.dbw_code = 'MAIN'
                    and dbw.dbw_time = 'MONT'
                    and dbw.outlet_type = 'OUTL'
                    and dbw.branch_ams_id = pv_outlet_ams_id
                    and dbw.record_date = var_cond_date
            ) outl
            join
            (
                select *
                from cla_outlet_information i
                where i.type_code = 'AEMP'
                    and i.outlet_value = 'Y'
            ) aemp
                on aemp.outlet_id = outl.outlet_id;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_INCOME.mmxv_modl_prepare_open] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 04: Du lieu dai ly tai thoi diem tuyen dung
        -- Tu truoc 3 thang khi bat dau chinh sach
        begin
            for i in -(months_between(var_cond_date, add_months(trunc(var_dbegin, 'MM'), -3)))..0
            loop
                insert /*+ APPEND */ into ams_prc_c015_employments nologging (
                    session_id,
                    record_date,
                    outlet_ams_id,
                    branch_ams_id,
                    root_agency_ams_id,
                    root_unit_ams_id,
                    root_empl_ams_id,
                    effe_date,
                    term_date
                )
                select /*+ CARDINALITY(o, 10)*/
                    pn_session_id,
                    var_record_date,
                    o.outlet_ams_id,
                    o.branch_ams_id,
                    a.pr_outlet_ams_id,
                    u.pr_outlet_ams_id,
                    o.empl_ams_id,
                    o.effective_date,
                    o.terminal_date
                from
                (
                    select *
                    from dbw_outl_informations dbw
                    where dbw.dbw_code = 'MAIN'
                        and dbw.dbw_time = 'MONT'
                        and dbw.outlet_type = 'OUTL'
                        and dbw.branch_ams_id = pv_outlet_ams_id
                        and dbw.record_date = add_months(var_cond_date, i)
                        and dbw.effective_date
                            between add_months(var_cond_date, i)
                            and last_day(add_months(var_cond_date, i))
                ) o
                left join
                (
                    select
                        l.outlet_ams_id,
                        l.pr_outlet_ams_id,
                        l.from_date,
                        l.to_date
                    from cla_outlet_location l
                    where l.outlet_type_code = 'OUTL'
                        and l.pr_outlet_type_code = 'NHOM'
                ) u
                    on
                    (
                        u.outlet_ams_id = o.outlet_ams_id
                        and
                        o.effective_date
                           between u.from_date
                           and u.to_date
                    )
                left join
                (
                    select
                        l.outlet_ams_id,
                        l.pr_outlet_ams_id,
                        l.from_date,
                        l.to_date
                    from cla_outlet_location l
                    where l.pr_outlet_type_code = 'BAN'
                ) a
                    on
                    (
                        nvl(u.pr_outlet_ams_id, o.outlet_ams_id) = a.outlet_ams_id
                        and
                        o.effective_date
                             between a.from_date
                             and a.to_date
                    );
                commit;

                merge /*+ CARDINALITY(empl, 100)
                          CARDINALITY(upd, 100)
                          LEADING(empl)
                          */
                    into ams_prc_c015_employments empl
                using
                    (
                        select
                            dbw.outlet_ams_id,
                            dbw.terminal_date term_date
                        from dbw_outl_informations dbw
                        where dbw.dbw_code = 'MAIN'
                            and dbw.dbw_time = 'MONT'
                            and dbw.outlet_type = 'OUTL'
                            and dbw.branch_ams_id = pv_outlet_ams_id
                            and dbw.record_date = add_months(var_cond_date, i)
                            and dbw.terminal_date is not null
                    ) upd
                on (
                    pn_session_id = empl.session_id
                    and
                    upd.outlet_ams_id = empl.outlet_ams_id
                )
                when matched then
                    update /*+ NOLOGGING */
                        set
                            empl.term_date = upd.term_date;
                commit;
            end loop;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_prepare_open] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 05: Du lieu phat hanh hop dong moi trong nam
        -- Tu truoc 3 thang khi bat dau chinh sach
        -- Den 1 thang sau thang tra
        begin
            for i in -(months_between(var_cond_date, add_months(trunc(var_dbegin, 'MM'), -3)))..1
            loop
                insert /*+ APPEND */ into ams_prc_c015_accounts nologging (
                    session_id,
                    record_date,
                    account_id,
                    outlet_ams_id,
                    branch_ams_id,
                    edate,
                    idate,
                    cdate,
                    tdate
                )
                select /*+ CARDINALITY(o, 10)*/
                    pn_session_id,
                    var_record_date,
                    i.account_id,
                    o.outlet_ams_id,
                    o.branch_ams_id,
                    e.edate,
                    i.idate,
                    c.cdate,
                    t.tdate
                from
                (
                    select *
                    from dbw_outl_informations dbw
                    where dbw.dbw_code = 'MAIN'
                        and dbw.dbw_time = 'MONT'
                        and dbw.outlet_type = 'OUTL'
                        and dbw.branch_ams_id = pv_outlet_ams_id
                        and dbw.record_date = add_months(var_cond_date, i)
                ) o
                join
                (
                    select /*+ CARDINALITY(ad, 100)*/
                        ad.account_id,
                        ad.outlet_ams_id,
                        ad.dbw_date idate
                    from dbw_acc_dates ad
                    where ad.dbw_date
                            between add_months(var_cond_date, i)
                            and last_day(add_months(var_cond_date, i))
                        and greatest(last_day(var_cond_date), last_day(add_months(var_cond_date, i)))
                            between ad.acc_fdate
                            and ad.acc_tdate
                        and ad.dbw_code = 'ISSU'
                ) i
                    on i.outlet_ams_id = o.outlet_ams_id
                join
                (
                    select /*+ CARDINALITY(ad, 100)*/
                        ad.account_id,
                        ad.acc_date edate
                    from dbw_acc_dates ad
                    where ad.dbw_date
                            between add_months(var_cond_date, i)
                            and last_day(add_months(var_cond_date, i))
                        and greatest(last_day(var_cond_date), last_day(add_months(var_cond_date, i)))
                            between ad.acc_fdate
                            and ad.acc_tdate
                        and ad.dbw_code = 'EFFE'
                ) e
                    on e.account_id = i.account_id
                left join
                (
                    select /*+ CARDINALITY(ad, 100)*/
                        ad.account_id,
                        ad.acc_date cdate
                    from dbw_acc_dates ad
                    where ad.dbw_date
                            between add_months(var_cond_date, i)
                            and last_day(add_months(var_cond_date, i))
                        and greatest(last_day(var_cond_date), last_day(add_months(var_cond_date, i)))
                            between ad.acc_fdate
                            and ad.acc_tdate
                        and ad.dbw_code = 'COF'
                ) c
                    on c.account_id = i.account_id
                left join
                (
                    select /*+ CARDINALITY(ad, 100)*/
                        ad.account_id,
                        ad.acc_date tdate
                    from dbw_acc_dates ad
                    where ad.dbw_date
                            between add_months(var_cond_date, i)
                            and last_day(add_months(var_cond_date, i))
                        and greatest(last_day(var_cond_date), last_day(add_months(var_cond_date, i)))
                            between ad.acc_fdate
                            and ad.acc_tdate
                        and ad.dbw_code = 'TOF'
                ) t
                    on t.account_id = i.account_id;
                commit;
            end loop;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_prepare_open] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_prepare_data(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
        var_record_date date := trunc(pd_realize_date, 'MM');
        var_cur_date date := trunc(sysdate, 'MM');

        var_cond_date date := least(var_record_date, var_cur_date);
        var_dbegin date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/PROM/P2015/INFO/BDATE');
        var_dend date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/PROM/P2015/INFO/EDATE');
        var_ncom_drev number(3) := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/COMP/C2015/INFO/DREV');
    begin
        -- Buoc 01: Xoa du lieu neu da ton tai
        begin
            loop
                delete /*+ NOLOGGING */ ams_prc_data del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_prepare_data] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 02: Xu ly du lieu tinh toan
        begin
            for i in -12..0
            loop
                if (add_months(var_record_date, i) <= var_cond_date) then
                    -- Buoc 02.01: Tong hop chi tieu ISAP tung dai ly
                    insert /*+ APPEND */ into ams_prc_data nologging (
                        session_id,
                        record_date,
                        module_code,
                        branch_ams_id,
                        outlet_ams_id,
                        data_code,
                        data_value,
                        create_user,
                        update_user,
                        create_datetime,
                        update_datetime
                    )
                    select /*+ CARDINALITY(d, 100)*/
                        pn_session_id,
                        cast(add_months(var_record_date, i) as date),
                        'PROM',
                        d.branch_ams_id,
                        d.outlet_ams_id,
                        'ISAP',
                        d.data_value,
                        pv_user,
                        pv_user,
                        sysdate,
                        sysdate
                    from mod_data d
                    where d.module_code = 'INDS'
                        and d.data_code = 'ISAP'
                        and d.branch_ams_id = pv_outlet_ams_id
                        and d.record_date = add_months(var_record_date, i);
                    commit;

                    -- Buoc 02.01: Tong hop chi tieu IFAP tung dai ly
                    insert /*+ APPEND */ into ams_prc_data nologging (
                        session_id,
                        record_date,
                        module_code,
                        branch_ams_id,
                        outlet_ams_id,
                        data_code,
                        data_value,
                        create_user,
                        update_user,
                        create_datetime,
                        update_datetime
                    )
                    select /*+ CARDINALITY(d, 100)*/
                        pn_session_id,
                        cast(add_months(var_record_date, i) as date),
                        'PROM',
                        d.branch_ams_id,
                        d.outlet_ams_id,
                        'IFAP',
                        d.data_value,
                        pv_user,
                        pv_user,
                        sysdate,
                        sysdate
                    from mod_data d
                    where d.module_code = 'INDS'
                        and d.data_code = 'IFAP'
                        and d.branch_ams_id = pv_outlet_ams_id
                        and d.record_date = add_months(var_record_date, i);
                    commit;

                    -- Buoc 02.01: Tong hop chi tieu PR36 tung dai ly
                    insert /*+ APPEND */ into ams_prc_data nologging (
                        session_id,
                        record_date,
                        module_code,
                        branch_ams_id,
                        outlet_ams_id,
                        data_code,
                        data_value,
                        create_user,
                        update_user,
                        create_datetime,
                        update_datetime
                    )
                    select /*+ CARDINALITY(d, 100)*/
                        pn_session_id,
                        cast(add_months(var_record_date, i) as date),
                        'PROM',
                        d.branch_ams_id,
                        d.outlet_ams_id,
                        'PR36',
                        d.data_value,
                        pv_user,
                        pv_user,
                        sysdate,
                        sysdate
                    from mod_data d
                    where d.module_code = 'INDS'
                        and d.data_code = 'PR36'
                        and d.branch_ams_id = pv_outlet_ams_id
                        and d.record_date = add_months(var_record_date, i);
                    commit;

                    -- Buoc 02.01: Tong hop chi tieu IP tung dai ly
                    insert /*+ APPEND */ into ams_prc_data nologging (
                        session_id,
                        record_date,
                        module_code,
                        branch_ams_id,
                        outlet_ams_id,
                        data_code,
                        data_value,
                        create_user,
                        update_user,
                        create_datetime,
                        update_datetime
                    )
                    select /*+ CARDINALITY(d, 100)*/
                        pn_session_id,
                        cast(add_months(var_record_date, i) as date),
                        'PROM',
                        d.branch_ams_id,
                        d.outlet_ams_id,
                        'IP',
                        d.data_value,
                        pv_user,
                        pv_user,
                        sysdate,
                        sysdate
                    from mod_data d
                    where d.module_code = 'INDS'
                        and d.data_code = 'RIP'
                        and d.branch_ams_id = pv_outlet_ams_id
                        and d.record_date = add_months(var_record_date, i);
                    commit;

                    -- Buoc 02.01: Tong hop chi tieu TKHM tung dai ly
                    insert /*+ APPEND */ into ams_prc_data nologging (
                        session_id,
                        record_date,
                        module_code,
                        branch_ams_id,
                        outlet_ams_id,
                        data_code,
                        data_value,
                        create_user,
                        update_user,
                        create_datetime,
                        update_datetime
                    )
                    select /*+ CARDINALITY(d, 100)*/
                        pn_session_id,
                        cast(add_months(var_record_date, i) as date),
                        'PROM',
                        pv_outlet_ams_id,
                        data.outlet_ams_id,
                        'EFAC',
                        sum(data.accounts_amount),
                        pv_user,
                        pv_user,
                        sysdate,
                        sysdate
                    from
                    (
                        select
                            d.outlet_ams_id,
                            nvl(d.data_value, 0) accounts_amount
                        from mod_data d
                        where d.module_code = 'INDS'
                            and d.data_code = 'IFAC'
                            and d.branch_ams_id = pv_outlet_ams_id
                            and d.record_date = add_months(var_record_date, i)
                        union all
                        select
                            d.outlet_ams_id,
                            -nvl(d.data_value, 0) accounts_amount
                        from mod_data d
                        where d.module_code = 'INDS'
                            and d.data_code = 'CFAC'
                            and d.branch_ams_id = pv_outlet_ams_id
                            and d.record_date = add_months(var_record_date, i)
                        union all
                        select
                            d.outlet_ams_id,
                            -nvl(d.data_value, 0) accounts_amount
                        from mod_data d
                        where d.module_code = 'INDS'
                            and d.data_code = 'OYAC'
                            and d.branch_ams_id = pv_outlet_ams_id
                            and d.record_date = add_months(var_record_date, i)
                    ) data
                    group by data.outlet_ams_id;
                    commit;

                    -- Buoc 02.01: Tong hop chi tieu phi phai thu tung dai ly
                    insert /*+ APPEND */ into ams_prc_data nologging (
                        session_id,
                        record_date,
                        module_code,
                        branch_ams_id,
                        outlet_ams_id,
                        data_code,
                        data_value,
                        create_user,
                        update_user,
                        create_datetime,
                        update_datetime
                    )
                    select /*+ CARDINALITY(d, 100)*/
                        pn_session_id,
                        cast(add_months(var_record_date, i) as date),
                        'PROM',
                        d.branch_ams_id,
                        d.outlet_ams_id,
                        'BILL',
                        d.data_value,
                        pv_user,
                        pv_user,
                        sysdate,
                        sysdate
                    from mod_data d
                    where d.module_code = 'INDS'
                        and d.data_code = 'BILL'
                        and d.branch_ams_id = pv_outlet_ams_id
                        and d.record_date = add_months(var_record_date, i);
                    commit;

                    -- Buoc 02.01: Tong hop chi tieu phi thuc thu tung dai ly
                    insert /*+ APPEND */ into ams_prc_data nologging (
                        session_id,
                        record_date,
                        module_code,
                        branch_ams_id,
                        outlet_ams_id,
                        data_code,
                        data_value,
                        create_user,
                        update_user,
                        create_datetime,
                        update_datetime
                    )
                    select /*+ CARDINALITY(d, 100)*/
                        pn_session_id,
                        cast(add_months(var_record_date, i) as date),
                        'PROM',
                        d.branch_ams_id,
                        d.outlet_ams_id,
                        'PAYS',
                        d.data_value,
                        pv_user,
                        pv_user,
                        sysdate,
                        sysdate
                    from mod_data d
                    where d.module_code = 'INDS'
                        and d.data_code = 'PAYS'
                        and d.branch_ams_id = pv_outlet_ams_id
                        and d.record_date = add_months(var_record_date, i);
                    commit;

                    -- Ap dung ty le thu phi UVL tu 1/07/2014
                    if (add_months(var_record_date, i) >= '1-jul-2014') then
                        -- Buoc 02.01: Tong hop chi tieu phi phai thu tung dai ly
                        insert /*+ APPEND */ into ams_prc_data nologging (
                            session_id,
                            record_date,
                            module_code,
                            branch_ams_id,
                            outlet_ams_id,
                            data_code,
                            data_value,
                            create_user,
                            update_user,
                            create_datetime,
                            update_datetime
                        )
                        select /*+ CARDINALITY(d, 100)*/
                            pn_session_id,
                            cast(add_months(var_record_date, i) as date),
                            'PROM',
                            d.branch_ams_id,
                            d.outlet_ams_id,
                            'UBILL',
                            d.data_value,
                            pv_user,
                            pv_user,
                            sysdate,
                            sysdate
                        from mod_data d
                        where d.module_code = 'INDS'
                            and d.data_code = 'UBILL'
                            and d.branch_ams_id = pv_outlet_ams_id
                            and d.record_date = add_months(var_record_date, i);
                        commit;

                        -- Buoc 02.01: Tong hop chi tieu phi thuc thu tung dai ly
                        insert /*+ APPEND */ into ams_prc_data nologging (
                            session_id,
                            record_date,
                            module_code,
                            branch_ams_id,
                            outlet_ams_id,
                            data_code,
                            data_value,
                            create_user,
                            update_user,
                            create_datetime,
                            update_datetime
                        )
                        select /*+ CARDINALITY(d, 100)*/
                            pn_session_id,
                            cast(add_months(var_record_date, i) as date),
                            'PROM',
                            d.branch_ams_id,
                            d.outlet_ams_id,
                            'UPAYS',
                            d.data_value,
                            pv_user,
                            pv_user,
                            sysdate,
                            sysdate
                        from mod_data d
                        where d.module_code = 'INDS'
                            and d.data_code = 'UPAYS'
                            and d.branch_ams_id = pv_outlet_ams_id
                            and d.record_date = add_months(var_record_date, i);
                        commit;
                    end if;

                    -- Buoc 02.01: Tong hop chi tieu ty le thu phi tung dai ly
                    insert /*+ APPEND */ into ams_prc_data nologging (
                        session_id,
                        record_date,
                        module_code,
                        branch_ams_id,
                        outlet_ams_id,
                        data_code,
                        data_value,
                        create_user,
                        update_user,
                        create_datetime,
                        update_datetime
                    )
                    select /*+ CARDINALITY(d, 100)*/
                        pn_session_id,
                        cast(add_months(var_record_date, i) as date),
                        'PROM',
                        d.branch_ams_id,
                        d.outlet_ams_id,
                        'CRAT',
                        d.data_value,
                        pv_user,
                        pv_user,
                        sysdate,
                        sysdate
                    from mod_data d
                    where d.module_code = 'INDS'
                        and d.data_code = 'CRAT'
                        and d.branch_ams_id = pv_outlet_ams_id
                        and d.record_date = add_months(var_record_date, i);
                    commit;

                    -- Buoc 02.01: Tong hop chi tieu RFYP tung dai ly
                    if (add_months(var_record_date, i) between var_dbegin and var_dend) then
                        insert /*+ APPEND */ into ams_prc_data nologging (
                            session_id,
                            record_date,
                            module_code,
                            branch_ams_id,
                            outlet_ams_id,
                            data_code,
                            data_value,
                            create_user,
                            update_user,
                            create_datetime,
                            update_datetime
                        )
                        select /*+ CARDINALITY(d, 100)*/
                            pn_session_id,
                            cast(add_months(var_record_date, i) as date),
                            'PROM',
                            d.branch_ams_id,
                            d.outlet_ams_id,
                            'RFYP',
                            d.data_value,
                            pv_user,
                            pv_user,
                            sysdate,
                            sysdate
                        from mod_data d
                        where d.module_code = 'INDS'
                            and d.data_code = 'UFYP'
                            and d.branch_ams_id = pv_outlet_ams_id
                            and d.record_date = add_months(var_record_date, i);
                        commit;
                    else
                        insert /*+ APPEND */ into ams_prc_data nologging (
                            session_id,
                            record_date,
                            module_code,
                            branch_ams_id,
                            outlet_ams_id,
                            data_code,
                            data_value,
                            create_user,
                            update_user,
                            create_datetime,
                            update_datetime
                        )
                        select /*+ CARDINALITY(d, 100)*/
                            pn_session_id,
                            cast(add_months(var_record_date, i) as date),
                            'PROM',
                            d.branch_ams_id,
                            d.outlet_ams_id,
                            'RFYP',
                            d.data_value,
                            pv_user,
                            pv_user,
                            sysdate,
                            sysdate
                        from mod_data d
                        where d.module_code = 'INDS'
                            and d.data_code = 'RFYP'
                            and d.branch_ams_id = pv_outlet_ams_id
                            and d.record_date = add_months(var_record_date, i);
                        commit;
                    end if;

                    -- Buoc 02.15: Tong hop chi tieu 90 ngay hoat dong tung dai ly
                    insert /*+ APPEND */ into ams_prc_data nologging (
                        session_id,
                        record_date,
                        module_code,
                        branch_ams_id,
                        outlet_ams_id,
                        data_code,
                        data_value,
                        create_user,
                        update_user,
                        create_datetime,
                        update_datetime
                    )
                    select /*+ CARDINALITY(d, 100)*/
                        pn_session_id,
                        cast(add_months(var_record_date, i) as date),
                        'PROM',
                        pv_outlet_ams_id,
                        oacti.outlet_ams_id,
                        'NACTI',
                        1,
                        pv_user,
                        pv_user,
                        sysdate,
                        sysdate
                    from
                    (
                        select
                            outl.outlet_ams_id,
                            min(
                                case
                                    when
                                    (
                                        trunc(acc.edate, 'MM') = add_months(trunc(acc.idate, 'MM'), -1)
                                        and acc.edate between var_dbegin and var_dend
                                        and acc.idate
                                            between trunc(acc.idate, 'MM')
                                            and (trunc(acc.idate, 'MM') + var_ncom_drev - 1)
                                    )
                                    then
                                        acc.edate
                                    else
                                        acc.idate
                                    end
                            ) idate
                        from
                        (
                            select *
                            from ams_prc_c015_employments e
                            where e.session_id = pn_session_id
                                and e.record_date = var_record_date
                                and e.branch_ams_id = pv_outlet_ams_id
                                and wm_overlaps
                                    (
                                        wm_period
                                        (
                                            e.effe_date,
                                            (e.effe_date + 89)
                                        ),
                                        wm_period
                                        (
                                            add_months(var_record_date, i),
                                            last_day(add_months(var_record_date, i))
                                        )
                                    ) = 1
                        ) outl
                        join
                        (
                            select
                                a.outlet_ams_id,
                                a.edate,
                                a.idate
                            from ams_prc_c015_accounts a
                            where a.session_id = pn_session_id
                                and a.record_date = var_record_date
                                and a.branch_ams_id = pv_outlet_ams_id
                        ) acc
                            on acc.outlet_ams_id = outl.outlet_ams_id
                        where acc.idate
                                between outl.effe_date
                                and (outl.effe_date + 89)
                        group by outl.outlet_ams_id
                    ) oacti
                    where oacti.idate
                            between add_months(var_record_date, i)
                            and last_day(add_months(var_record_date, i));
                    commit;
                end if;
            end loop;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_prepare_data] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_prepare_pack(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
        var_record_date date := trunc(pd_realize_date, 'MM');
    begin
        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_prepare_close(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
        var_record_date date := trunc(pd_realize_date, 'MM');
    begin
        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 06/11/2014
        Version: 1.0
        Description: Thang tien TVV -> TTN
        Parameter:
        Update:
    */
    procedure mmxv_modl_agep(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
    begin
        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update: Chinhlk
        Date Update: 14/07/2015
                     1.1: Mở rộng điều kiện TVV tuyển dụng từ 1/1/2013 (theo ID178275)
    */

    procedure mmxv_modl_agep_open(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
        var_record_date date := trunc(pd_realize_date, 'MM');
        var_cur_date date := trunc(sysdate, 'MM');

        var_cond_date date := least(var_record_date, var_cur_date);
        var_cond_regency varchar2(255);
    begin
        -- Buoc 01: Xoa du lieu neu da ton tai
        begin
            loop
                delete /*+ NOLOGGING */ ams_prc_p015_agep del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_prc_p015_agep_data del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_agep_open] ' || SQLERRM);
                goto procedure_end;
        end;

        --Buoc 02: Lay thong tin cau hinh
        begin
            var_cond_regency := AMS_MODL_VARIABLE.get_tvar_by_code('/GLOBAL/PROM/P2015/PPUM/CREG');
        end;

        -- Buoc 03: Ghi nhan du lieu duoc xu ly
        begin
            -- 03.A: Ghi nhan du lieu duoc xu ly
            insert /*+ APPEND */ into ams_prc_p015_agep nologging (
                session_id,
                record_date,
                outlet_ams_id,
                branch_ams_id,
                effe_date,
                term_date,
                seniority,
                period_fyp,
                pile_pis,
                status,
                succ_date,
                outl_new,
                agep_asmt,
                new_regency_date,
                new_regency_code,
                status_empl
             )
            select /*+ CARDINALITY(outl, 100)*/
                pn_session_id,
                var_record_date,
                outl.outlet_ams_id,
                outl.branch_ams_id,
                outl.effe_date,
                outl.term_date,
                months_between(
                    var_record_date,
                    trunc(outl.effe_date, 'MM')
                ) + 1,
                0,
                0,
                'UNSUCC',
                null,
                0,
                null,
                null,
                null,
                -- Fix 1.1
                AMS_CORE_CODE.VALUE_NO
                -- End fix
            from ams_prc_outlets outl
            where outl.session_id = pn_session_id
              and outl.record_date = var_cond_date
              and outl.branch_ams_id = pv_outlet_ams_id
              and outl.term_date is null
              and outl.regency_code in
                  (
                      select regexp_substr(var_cond_regency,'[^,]+', 1, level) regency_code
                      from dual
                      connect by regexp_substr(var_cond_regency, '[^,]+', 1, level) is not null
                  );
            commit;

            -- 03.A: Ghi nhan du lieu chi tiet
            for i in -5..0
            loop
                insert /*+ APPEND */ into ams_prc_p015_agep_data nologging(
                    session_id,
                    record_date,
                    outlet_ams_id,
                    branch_ams_id,
                    effe_date,
                    term_date,
                    seniority,
                    period_fyp,
                    pile_pis
                 )
                select /*+ CARDINALITY(age, 100)
                           CARDINALITY(outl, 100)*/
                  pn_session_id,
                  add_months(var_record_date, i),
                  outl.outlet_ams_id,
                  outl.branch_ams_id,
                  outl.effe_date,
                  outl.term_date,
                  months_between(
                      add_months(var_record_date, i),
                      trunc(outl.effe_date, 'MM')
                  ) + 1,
                  0,
                  0
                from
                (
                   select
                       agep.outlet_ams_id
                   from ams_prc_p015_agep agep
                   where agep.session_id = pn_session_id
                       and agep.record_date = var_record_date
                       and agep.branch_ams_id = pv_outlet_ams_id
                ) age
                join
                (
                   select
                       outls.outlet_ams_id,
                       outls.branch_ams_id,
                       outls.agency_ams_id,
                       outls.unit_ams_id,
                       outls.regency_code,
                       outls.regency_date,
                       outls.effe_date,
                       outls.term_date
                   from ams_prc_outlets outls
                   where outls.session_id = pn_session_id
                       and outls.record_date = add_months(var_record_date, i)
                       and outls.branch_ams_id = pv_outlet_ams_id
                       and add_months(var_record_date, i) <= var_cond_date
                ) outl
                  on age.outlet_ams_id = outl.outlet_ams_id;
                commit;
            end loop;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_agep_open] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update: Chinhlk
        Date Update: 14/07/2015
                     1.1: Mở rộng điều kiện TVV tuyển dụng từ 1/1/2013 (theo ID178275)

    */
    procedure mmxv_modl_agep_data(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
        var_record_date date := trunc(pd_realize_date, 'MM');
        var_cur_date date := trunc(sysdate, 'MM');

        var_cond_date date := least(var_record_date, var_cur_date);
    begin
        -- Buoc 01: Ghi nhan du lieu chi tiet
        begin
            for i in -5..0
            loop
                if (add_months(var_record_date, i) <= var_cond_date) then
                    merge /*+ CARDINALITY(agep, 10)
                              CARDINALITY(upd, 10)*/
                        into ams_prc_p015_agep_data agep
                    using
                        (
                            select /*+ CARDINALITY(outl, 100)
                                       CARDINALITY(rfyp, 100)
                                       CARDINALITY(rissue, 100)
                                       LEADING(outl)
                                       NO_MERGE(rfyp)
                                       NO_MERGE(rissue)
                                       */
                                outl.outlet_ams_id,
                                outl.record_date,
                                rfyp.data_value data_rfyp,
                                rissue.data_value data_rissue
                            from
                            (
                                select /*+ CARDINALITY(tmp, 100)*/
                                    tmp.record_date,
                                    tmp.outlet_ams_id
                                from ams_prc_p015_agep_data tmp
                                where tmp.session_id = pn_session_id
                                    and tmp.record_date = add_months(var_record_date, i)
                                    and tmp.branch_ams_id = pv_outlet_ams_id
                            ) outl
                            left join
                            (
                                select /*+ CARDINALITY(tmp, 100)*/
                                    tmp.outlet_ams_id,
                                    tmp.data_value
                                from ams_prc_data tmp
                                where tmp.session_id = pn_session_id
                                  and tmp.record_date = add_months(var_record_date, i)
                                  and tmp.branch_ams_id = pv_outlet_ams_id
                                  and tmp.module_code = 'PROM'
                                  and tmp.data_code = 'RFYP'
                            ) rfyp
                                on rfyp.outlet_ams_id = outl.outlet_ams_id
                            left join
                            (
                                select /*+ CARDINALITY(tmp, 100)*/
                                    tmp.outlet_ams_id,
                                    tmp.data_value
                                from ams_prc_data tmp
                                where tmp.session_id = pn_session_id
                                  and tmp.record_date = add_months(var_record_date, i)
                                  and tmp.branch_ams_id = pv_outlet_ams_id
                                  and tmp.module_code = 'PROM'
                                  and tmp.data_code = 'EFAC'
                            ) rissue
                                on rissue.outlet_ams_id = outl.outlet_ams_id
                        ) upd
                    on (
                        pn_session_id = agep.session_id
                        and
                        upd.record_date = agep.record_date
                        and
                        upd.outlet_ams_id = agep.outlet_ams_id
                    )
                    when matched then
                        update /*+ NOLOGGING */
                            set
                                agep.period_fyp = nvl(upd.data_rfyp, 0),
                                agep.pile_pis = nvl(upd.data_rissue, 0);
                    commit;
                end if;
            end loop;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_agep_data] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 01: Tong hop du lieu
        begin
            merge /*+ CARDINALITY(agep, 10)
                      CARDINALITY(upd, 10)*/
                into ams_prc_p015_agep agep
            using
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_ams_id,
                        sum(tmp.period_fyp) period_fyp,
                        sum(tmp.pile_pis) pile_pis
                    from ams_prc_p015_agep_data tmp
                    where tmp.session_id = pn_session_id
                        and tmp.record_date <= var_cond_date
                        and tmp.branch_ams_id = pv_outlet_ams_id
                    group by tmp.outlet_ams_id
                ) upd
            on (
                pn_session_id = agep.session_id
                and
                var_record_date = agep.record_date
                and
                upd.outlet_ams_id = agep.outlet_ams_id
            )
            when matched then
                update /*+ NOLOGGING */
                    set
                        agep.period_fyp = nvl(upd.period_fyp, 0),
                        agep.pile_pis = nvl(upd.pile_pis, 0);
            commit;

            --Fix 1.1
            --Xet TVV co quyen tuyen dung
            merge /*+ CARDINALITY(agep, 10)
                      CARDINALITY(upd, 10)*/
                into ams_prc_p015_agep agep
            using
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_ams_id
                    from ams_prc_blocks tmp
                    where tmp.session_id = pn_session_id
                        and tmp.record_date = var_record_date
                        and tmp.module_code = 'PROM'
                        and tmp.data_code = 'TD'
                        and var_record_date
                            between tmp.from_date
                            and tmp.to_date
                     group by tmp.outlet_ams_id
                ) upd
            on (
                pn_session_id = agep.session_id
                and
                var_record_date = agep.record_date
                and
                upd.outlet_ams_id = agep.outlet_ams_id
            )
            when matched then
                update /*+ NOLOGGING */
                    set
                        agep.status_empl = AMS_CORE_CODE.VALUE_YES;
            commit;
            --End fix

            merge /*+ CARDINALITY(agep, 10)
                      CARDINALITY(upd, 10)*/
                into ams_prc_p015_agep agep
            using
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_ams_id,
                        max(tmp.from_date) from_date
                    from ams_prc_blocks tmp
                    where tmp.session_id = pn_session_id
                        and tmp.record_date = var_record_date
                        and tmp.module_code = 'PROM'
                        and tmp.data_code = 'SUCC'
                        and tmp.from_date <= last_day(var_record_date)
                     group by tmp.outlet_ams_id
                ) upd
            on (
                pn_session_id = agep.session_id
                and
                var_record_date = agep.record_date
                and
                upd.outlet_ams_id = agep.outlet_ams_id
            )
            when matched then
                update /*+ NOLOGGING */
                    set
                        agep.succ_date = upd.from_date,
                        agep.status = 'SUCC';
            commit;

            merge /*+ CARDINALITY(agep, 10)
                      CARDINALITY(upd, 10)*/
                into ams_prc_p015_agep agep
            using
                (
                    select
                        onew.refl_ams_id outlet_ams_id,
                        count(*) outl_new
                    from
                    (
                        select /*+ CARDINALITY(agep, 10)
                                   CARDINALITY(outl, 10)*/
                            outl.outlet_ams_id,
                            outl.effe_date,
                            agep.outlet_ams_id refl_ams_id
                        from
                        (
                            select /*+ CARDINALITY(tmp, 100)*/
                                *
                            from ams_prc_p015_agep tmp
                            where tmp.session_id = pn_session_id
                                and tmp.record_date = var_record_date
                                and tmp.branch_ams_id = pv_outlet_ams_id
                        ) agep
                        join
                        (
                            select /*+ CARDINALITY(o, 100)*/
                                *
                            from ams_prc_outlets o
                            where o.session_id = pn_session_id
                                and o.record_date = var_cond_date
                                and o.branch_ams_id = pv_outlet_ams_id
                                and o.term_date is null
                                and o.effe_date
                                    between to_date('01-mar-2015') -- fix 1.1
                                    and (add_months(var_record_date, 1) -1)
                        ) outl
                            on agep.outlet_ams_id = outl.employment_ams_id
                        where AMS_MODL_OFUNCTIONS.get_informations(
                                agep.outlet_ams_id,
                                'CVDL',
                                outl.effe_date) in ('CV05')
                    ) onew
                    group by onew.refl_ams_id
                ) upd
            on (
                pn_session_id = agep.session_id
                and
                var_record_date = agep.record_date
                and
                upd.outlet_ams_id = agep.outlet_ams_id
            )
            when matched then
                update /*+ NOLOGGING */
                    set
                        agep.outl_new = upd.outl_new;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_agep_data] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_agep_cond(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
        var_record_date date := trunc(pd_realize_date, 'MM');
        var_cur_date date := trunc(sysdate, 'MM');

        var_cond_date date := least(var_record_date, var_cur_date);
        var_cond_preg varchar2(16);
        var_cond_cmon number(3);
        var_cond_cfyp number(16,2);
        var_cond_ciss number(5);
        var_cond_csuc varchar2(16);
        var_cond_cemp number(5);
    begin
        --Buoc 01: Lay thong tin cau hinh
        begin
            var_cond_preg := AMS_MODL_VARIABLE.get_tvar_by_code('/GLOBAL/PROM/P2015/PPUM/PREG');
            var_cond_cmon := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/PPUM/CMON');
            var_cond_cfyp := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/PPUM/CFYP');
            var_cond_ciss := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/PPUM/CISS');
            var_cond_csuc := AMS_MODL_VARIABLE.get_tvar_by_code('/GLOBAL/PROM/P2015/PPUM/CSUC');
            var_cond_cemp := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/PPUM/CEMP');
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_agep_cond] ' || SQLERRM);
                goto procedure_end;
        end;

        --Buoc 02: Xu ly dieu kien thang tien
        begin
            update /*+ NOLOGGING */ ams_prc_p015_agep agep
               set agep.agep_asmt = 'P',
                   agep.new_regency_code = var_cond_preg,
                   agep.new_regency_date = add_months(var_record_date, 1)
            where agep.session_id = pn_session_id
                and agep.record_date = var_record_date
                and agep.branch_ams_id = pv_outlet_ams_id
                -- fix 1.1
                and
                (
                    agep.period_fyp >= var_cond_cfyp
                    and
                    agep.pile_pis >= var_cond_ciss
                    and
                    (
                       nvl(agep.status_empl, AMS_CORE_CODE.VALUE_NO) = AMS_CORE_CODE.VALUE_YES
                       or
                       (
                           agep.outl_new >= var_cond_cemp
                           and
                           decode(agep.status,
                               'SUCC', 'Y',
                               'N')
                           in ('Y', var_cond_csuc)
                       )

                    )
                );
                -- end fix
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_agep_cond] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_agep_comp(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
        var_record_date date := trunc(pd_realize_date, 'MM');
    begin
       -- Buoc 01: Xoa du lieu neu da ton tai
        begin
            loop
                delete /*+ NOLOGGING */ ams_con_p015_agep del
                where del.record_date = var_record_date
                    and del.branch_ams_id = pv_outlet_ams_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_con_p015_agep_data del
                where del.record_date = var_record_date
                    and del.branch_ams_id = pv_outlet_ams_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_agep_comp] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 02: Di chuyen du lieu
        begin
            insert /*+ APPEND */ into ams_con_p015_agep nologging (
                record_date,
                outlet_ams_id,
                branch_ams_id,
                effe_date,
                term_date,
                seniority,
                period_fyp,
                pile_pis,
                status,
                succ_date,
                outl_new,
                agep_asmt,
                new_regency_date,
                new_regency_code,
                create_user,
                update_user,
                create_datetime,
                update_datetime,
                status_empl
            )
            select /*+ CARDINALITY(prc, 100)*/
                prc.record_date,
                prc.outlet_ams_id,
                prc.branch_ams_id,
                prc.effe_date,
                prc.term_date,
                prc.seniority,
                prc.period_fyp,
                prc.pile_pis,
                prc.status,
                prc.succ_date,
                prc.outl_new,
                prc.agep_asmt,
                prc.new_regency_date,
                prc.new_regency_code,
                pv_user,
                pv_user,
                sysdate,
                sysdate,
                status_empl
            from ams_prc_p015_agep prc
            where prc.session_id = pn_session_id
                and prc.record_date = var_record_date
                and prc.branch_ams_id = pv_outlet_ams_id;
            commit;

            insert /*+ APPEND */ into ams_con_p015_agep_data nologging (
                record_date,
                outlet_ams_id,
                branch_ams_id,
                effe_date,
                term_date,
                seniority,
                period_fyp,
                pile_pis,
                create_user,
                update_user,
                create_datetime,
                update_datetime
            )
            select /*+ CARDINALITY(prc, 100)*/
                var_record_date,
                prc.outlet_ams_id,
                prc.branch_ams_id,
                prc.effe_date,
                prc.term_date,
                prc.seniority,
                prc.period_fyp,
                prc.pile_pis,
                pv_user,
                pv_user,
                sysdate,
                sysdate
            from ams_prc_p015_agep_data prc
            where prc.session_id = pn_session_id
                and prc.branch_ams_id = pv_outlet_ams_id;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_agep_comp] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_agep_close(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
    begin
        -- Buoc 01: Xoa du lieu neu da ton tai
        begin
            loop
                delete /*+ NOLOGGING */ ams_prc_p015_agep del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_prc_p015_agep_data del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_agep_close] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 06/11/2014
        Version: 1.0
        Description: Thang tien TTN -> TN
        Parameter:
        Update:
    */
    procedure mmxv_modl_umnp(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
    begin
        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update: Chinhlk
        Date Update: 25/08/2015
                     1.1: Mở rộng điều kiện TVV tuyển dụng từ 1/1/2013 (theo ID192804)
    */
    procedure mmxv_modl_umnp_open(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
        var_record_date date := trunc(pd_realize_date, 'MM');
        var_cur_date date := trunc(sysdate, 'MM');

        var_cond_date date := least(var_record_date, var_cur_date);
        var_cond_regency varchar2(255);
    begin
        -- Buoc 01: Xoa du lieu neu da ton tai
        begin
            loop
                delete /*+ NOLOGGING */ ams_prc_p015_umnp del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_prc_p015_umnp_data del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_prc_p015_umnp_succ del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_umnp_open] ' || SQLERRM);
                goto procedure_end;
        end;

        --Buoc 02: Lay thong tin cau hinh
        begin
            var_cond_regency := AMS_MODL_VARIABLE.get_tvar_by_code('/GLOBAL/PROM/P2015/PUM/INFO/CREG');
        end;

        -- Buoc 03: Ghi nhan du lieu duoc xu ly
        begin
            -- 03.01: Du lieu TTN
            insert /*+ APPEND */ into ams_prc_p015_umnp nologging (
                session_id,
                record_date,
                outlet_ams_id,
                branch_ams_id,
                sub_branch_ams_id,
                agency_ams_id,
                unit_ams_id,
                effe_date,
                term_date,
                regency_code,
                regency_date,
                cycle_date,
                numb_asmt,
                period_fyp,
                period_afif,
                period_afis,
                period_pr36,
                period_acti,
                period_empl,
                umnp_asmt,
                new_regency_code,
                new_regency_date,
                is_certificate
             )
            select /*+ CARDINALITY(outl, 100)*/
                pn_session_id,
                var_record_date,
                outl.outlet_ams_id,
                outl.branch_ams_id,
                outl.sub_branch_ams_id,
                outl.agency_ams_id,
                outl.unit_ams_id,
                outl.effe_date,
                outl.term_date,
                outl.regency_code,
                outl.regency_date,
                trunc(outl.regency_date, 'MM'),
                round(
                    months_between(
                        var_record_date,
                        trunc(outl.regency_date, 'MM')
                    ) / 3
                ),
                0,
                0,
                0,
                0,
                0,
                0,
                'M',
                null,
                null,
                case
                when (bloc.outlet_ams_id is not null)
                     then 'Y'
                end is_certificate
            from
            (
                select *
                from ams_prc_outlets o
                where o.session_id = pn_session_id
                  and o.record_date = var_cond_date
                  and o.branch_ams_id = pv_outlet_ams_id
                  and o.term_date is null
                  and o.regency_code = 'CV01'
            ) outl
            left join
            (
                select
                    b.outlet_ams_id
                from ams_prc_blocks b
                where b.session_id = pn_session_id
                    and b.record_date = var_record_date
                    and b.module_code = 'PROM'
                    and b.data_code = 'BDH'
                    and last_day(var_record_date)
                        between b.from_date
                        and b.to_date
                    group by b.outlet_ams_id
            ) bloc
                on outl.outlet_ams_id = bloc.outlet_ams_id ;
            commit;

            -- 03.02: Du lieu TNDD
            insert /*+ APPEND */ into ams_prc_p015_umnp nologging (
                session_id,
                record_date,
                outlet_ams_id,
                branch_ams_id,
                sub_branch_ams_id,
                agency_ams_id,
                unit_ams_id,
                effe_date,
                term_date,
                regency_code,
                regency_date,
                numb_asmt,
                period_fyp,
                period_afif,
                period_afis,
                period_pr36,
                period_acti,
                period_empl,
                umnp_asmt,
                new_regency_code,
                new_regency_date,
                is_certificate
             )
            select /*+ CARDINALITY(outl, 100)*/
                pn_session_id,
                var_record_date,
                outl.outlet_ams_id,
                outl.branch_ams_id,
                outl.sub_branch_ams_id,
                outl.agency_ams_id,
                outl.unit_ams_id,
                outl.effe_date,
                outl.term_date,
                outl.regency_code,
                outl.regency_date,
                decode(
                    mod(
                        ceil(
                            (months_between(
                                var_record_date,
                                trunc(outl.regency_date, 'MM')
                            ) + 1) / 3
                        ),
                        3
                    ),
                    0, 3,
                    mod(
                        ceil(
                            (months_between(
                                var_record_date,
                                trunc(outl.regency_date, 'MM')
                            ) + 1) / 3
                        ),
                        3
                    )
                ),
                0,
                0,
                0,
                0,
                0,
                0,
                'M',
                null,
                null,
                case
                when (bloc.outlet_ams_id is not null)
                     then 'Y'
                end is_certificate
            from
            (
                select *
                from ams_prc_outlets o
                where o.session_id = pn_session_id
                  and o.record_date = var_cond_date
                  and o.branch_ams_id = pv_outlet_ams_id
                  and o.term_date is null
                  and o.regency_code = 'CV06'
                  and o.regency_date <= var_record_date
            ) outl
            left join
            (
                select
                    b.outlet_ams_id
                from ams_prc_blocks b
                where b.session_id = pn_session_id
                    and b.record_date = var_record_date
                    and b.module_code = 'PROM'
                    and b.data_code = 'BDH'
                    and var_record_date
                        between b.from_date
                        and b.to_date
                    group by b.outlet_ams_id
            ) bloc
                on outl.outlet_ams_id = bloc.outlet_ams_id;
            commit;

            -- 03.03: Cap nhat chu ky thang tien TNDD
            update ams_prc_p015_umnp umnp
            set
                umnp.cycle_date =
                    greatest(
                        trunc(umnp.regency_date, 'MM'),
                        add_months(var_record_date, 1 - umnp.numb_asmt * 3)
                    )
            where umnp.session_id = pn_session_id
                and umnp.record_date = var_record_date
                and umnp.regency_code in ('CV06');
            commit;

            -- 03.03: Do du lieu dai ly do TTN khi la TVV thanh cong gioi thieu
            insert /*+ APPEND */ into ams_prc_p015_umnp_succ nologging (
                session_id,
                record_date,
                outlet_ams_id,
                branch_ams_id,
                sub_branch_ams_id,
                agency_ams_id,
                unit_ams_id,
                effe_date,
                term_date,
                regency_code,
                regency_date,
                employment_ams_id,
                referral_ams_id,
                referral_fromdate,
                referral_todate
            )
            select /*+ CARDINALITY(succ, 100)
                       CARDINALITY(outl, 100)*/
                pn_session_id,
                var_record_date,
                outl.outlet_ams_id,
                outl.branch_ams_id,
                outl.sub_branch_ams_id,
                outl.agency_ams_id,
                outl.unit_ams_id,
                outl.effe_date,
                outl.term_date,
                outl.regency_code,
                outl.regency_date,
                outl.employment_ams_id,
                outl.employment_ams_id,
                succ.from_date,
                succ.to_date
            from
            (
                select /*+ CARDINALITY(o, 100)*/
                     o.outlet_ams_id,
                     o.from_date,
                     o.to_date
                from ams_prc_blocks o
                where o.session_id = pn_session_id
                    and o.record_date = var_record_date
                    and o.module_code = 'PROM'
                    and o.data_code = 'SUCC'
            ) succ
            join
            (
                 select /*+ CARDINALITY(p, 100)*/
                     p.outlet_ams_id,
                     p.branch_ams_id,
                     p.sub_branch_ams_id,
                     p.agency_ams_id,
                     p.unit_ams_id,
                     p.employment_ams_id,
                     p.referral_ams_id,
                     p.regency_code,
                     p.regency_date,
                     p.effe_date,
                     p.term_date
                from ams_prc_outlets p
                where p.session_id = pn_session_id
                  and p.record_date = var_cond_date
            ) outl
                on
                (
                    succ.outlet_ams_id = outl.employment_ams_id
                    and outl.effe_date
                        between succ.from_date
                        and succ.to_date
                );
            commit;

            -- 03.04: Du lieu chi tiet dai ly trong nhom
            for i in -9..0
            loop
                if (add_months(var_record_date, i) <= var_cond_date) then
                    -- 03.04.01: Ban than TTN/TNDD
                    insert /*+ APPEND */ into ams_prc_p015_umnp_data nologging (
                        session_id,
                        record_date,
                        outlet_ams_id,
                        data_code,
                        data_date,
                        branch_ams_id,
                        effe_date,
                        term_date,
                        regency_code,
                        empl_ams_id,
                        cycle_date,
                        numb_asmt,
                        period_fyp,
                        period_afif,
                        period_afis,
                        period_pr36,
                        period_empl,
                        period_issu,
                        period_acti
                    )
                    select
                        pn_session_id,
                        var_record_date,
                        outl.outlet_ams_id,
                        'SELF',
                        add_months(var_record_date, i),
                        outl.branch_ams_id,
                        outl.effe_date,
                        outl.term_date,
                        outl.regency_code,
                        outl.outlet_ams_id,
                        umnp.cycle_date,
                        umnp.numb_asmt,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0
                    from
                    (
                        select /*+ CARDINALITY(u, 100)*/
                            *
                        from ams_prc_p015_umnp u
                        where u.session_id = pn_session_id
                            and u.record_date = var_record_date
                            and u.branch_ams_id = pv_outlet_ams_id
                    ) umnp
                    join
                    (
                        select /*+ CARDINALITY(o, 100)*/
                            *
                        from ams_prc_outlets o
                        where o.session_id = pn_session_id
                            and o.record_date = add_months(var_record_date, i)
                            and o.branch_ams_id = pv_outlet_ams_id
                    ) outl
                        on umnp.outlet_ams_id = outl.outlet_ams_id;
                    commit;

                    -- 03.04.02: TVV do TTN/TNDD tuyen
                    insert /*+ APPEND */ into ams_prc_p015_umnp_data nologging (
                        session_id,
                        record_date,
                        outlet_ams_id,
                        data_code,
                        data_date,
                        branch_ams_id,
                        effe_date,
                        term_date,
                        regency_code,
                        empl_ams_id,
                        cycle_date,
                        numb_asmt,
                        period_fyp,
                        period_afif,
                        period_afis,
                        period_pr36,
                        period_empl,
                        period_issu,
                        period_acti
                    )
                    select
                        pn_session_id,
                        var_record_date,
                        outl.outlet_ams_id,
                        'EMPL',
                        add_months(var_record_date, i),
                        outl.branch_ams_id,
                        outl.effe_date,
                        outl.term_date,
                        outl.regency_code,
                        outl.employment_ams_id,
                        umnp.cycle_date,
                        umnp.numb_asmt,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0
                    from
                    (
                        select /*+ CARDINALITY(u, 100)*/
                            *
                        from ams_prc_p015_umnp u
                        where u.session_id = pn_session_id
                            and u.record_date = var_record_date
                            and u.branch_ams_id = pv_outlet_ams_id
                            and u.regency_code in ('CV01', 'CV06')
                    ) umnp
                    join
                    (
                        select /*+ CARDINALITY(o, 100)*/
                            *
                        from ams_prc_outlets o
                        where o.session_id = pn_session_id
                            and o.record_date = add_months(var_record_date, i)
                            and o.branch_ams_id = pv_outlet_ams_id
                    ) outl
                        on umnp.outlet_ams_id = outl.employment_ams_id
                    where outl.effe_date >= umnp.regency_date;
                    commit;

                    -- 03.04.03: TVV do TTN gioi thieu khi la TVV thanh cong, TVV co quyen tuyen dung
                    insert /*+ APPEND */ into ams_prc_p015_umnp_data nologging (
                        session_id,
                        record_date,
                        outlet_ams_id,
                        data_code,
                        data_date,
                        branch_ams_id,
                        effe_date,
                        term_date,
                        regency_code,
                        empl_ams_id,
                        cycle_date,
                        numb_asmt,
                        period_fyp,
                        period_afif,
                        period_afis,
                        period_pr36,
                        period_empl,
                        period_issu,
                        period_acti
                    )
                    select
                        pn_session_id,
                        var_record_date,
                        outl.outlet_ams_id,
                        'RELR',
                        add_months(var_record_date, i),
                        outl.branch_ams_id,
                        outl.effe_date,
                        outl.term_date,
                        outl.regency_code,
                        outl.referral_ams_id,
                        outl.cycle_date,
                        outl.numb_asmt,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0
                    from
                    (
                        select /*+ CARDINALITY(umnp, 100)
                                  CARDINALITY(outl, 100)
                                  CARDINALITY(succ, 100)*/
                            outl.outlet_ams_id,
                            outl.branch_ams_id,
                            outl.effe_date,
                            outl.term_date,
                            outl.regency_code,
                            succ.referral_ams_id,
                            umnp.cycle_date,
                            umnp.numb_asmt
                        from
                        (
                            select /*+ CARDINALITY(u, 100)*/
                                *
                            from ams_prc_p015_umnp u
                            where u.session_id = pn_session_id
                                and u.record_date = var_record_date
                                and u.branch_ams_id = pv_outlet_ams_id
                                and u.regency_code in ('CV01')
                        ) umnp
                        join
                        (
                            select /*+ CARDINALITY(s, 100)*/
                                 s.outlet_ams_id,
                                 s.referral_ams_id,
                                 s.effe_date
                            from ams_prc_p015_umnp_succ s
                            where s.session_id = pn_session_id
                                and s.record_date = var_record_date
                        ) succ
                            on succ.referral_ams_id = umnp.outlet_ams_id
                        join
                        (
                            select /*+ CARDINALITY(o, 100)*/
                                *
                            from ams_prc_outlets o
                            where o.session_id = pn_session_id
                                and o.record_date = add_months(var_record_date, i)
                                and o.branch_ams_id = pv_outlet_ams_id
                        ) outl
                            on succ.outlet_ams_id = outl.outlet_ams_id
                        where outl.effe_date between add_months(umnp.regency_date, -12)
                                and umnp.regency_date - 1

                        -- Fix 1.1
                        union

                        select /*+ CARDINALITY(umnp, 100)
                                  CARDINALITY(bloc, 100)
                                  CARDINALITY(outl, 100)*/
                            outl.outlet_ams_id,
                            outl.branch_ams_id,
                            outl.effe_date,
                            outl.term_date,
                            outl.regency_code,
                            outl.employment_ams_id referral_ams_id,
                            umnp.cycle_date,
                            umnp.numb_asmt
                        from
                        (
                            select /*+ CARDINALITY(u, 100)*/
                                *
                            from ams_prc_p015_umnp u
                            where u.session_id = pn_session_id
                                and u.record_date = var_record_date
                                and u.branch_ams_id = pv_outlet_ams_id
                                and u.regency_code in ('CV01')
                        ) umnp
                        join
                        (
                            select /*+ CARDINALITY(b, 100)*/
                                 b.outlet_ams_id,
                                 b.from_date,
                                 b.to_date
                            from ams_prc_blocks b
                            where b.session_id = pn_session_id
                                and b.record_date = var_record_date
                                and b.module_code = 'PROM'
                                and b.data_code = 'TD'
                        ) bloc
                            on bloc.outlet_ams_id = umnp.outlet_ams_id
                        join
                        (
                            select /*+ CARDINALITY(o, 100)*/
                                *
                            from ams_prc_outlets o
                            where o.session_id = pn_session_id
                                and o.record_date = add_months(var_record_date, i)
                                and o.branch_ams_id = pv_outlet_ams_id
                        ) outl
                            on bloc.outlet_ams_id = outl.employment_ams_id
                        where outl.effe_date between bloc.from_date and bloc.to_date
                            and outl.effe_date
                                between add_months(umnp.regency_date, -12)
                                and umnp.regency_date - 1
                        -- End fix
                    ) outl;
                    commit;

                    -- 03.04.04: TVV PA do TTN ho tro hd tro lai
                    insert /*+ APPEND */ into ams_prc_p015_umnp_data nologging (
                        session_id,
                        record_date,
                        outlet_ams_id,
                        data_code,
                        data_date,
                        branch_ams_id,
                        effe_date,
                        term_date,
                        regency_code,
                        empl_ams_id,
                        cycle_date,
                        numb_asmt,
                        period_fyp,
                        period_afif,
                        period_afis,
                        period_pr36,
                        period_empl,
                        period_issu,
                        period_acti
                    )
                    select /*+ CARDINALITY(umnp, 100)
                              CARDINALITY(bloc, 100)
                              CARDINALITY(outl, 100)*/
                        pn_session_id,
                        var_record_date,
                        outl.outlet_ams_id,
                        'SUPP',
                        add_months(var_record_date, i),
                        outl.branch_ams_id,
                        outl.effe_date,
                        outl.term_date,
                        outl.regency_code,
                        bloc.supp_ams_id,
                        umnp.cycle_date,
                        umnp.numb_asmt,
                        0,
                        0,
                        0,
                        0,
                        case
                            when (add_months(var_record_date, i) = var_cond_date) then
                                1
                            else
                                0
                            end,
                        0,
                        0
                    from
                    (
                        select /*+ CARDINALITY(u, 100)*/
                            *
                        from ams_prc_p015_umnp u
                        where u.session_id = pn_session_id
                            and u.record_date = var_record_date
                            and u.branch_ams_id = pv_outlet_ams_id
                            and u.regency_code in ('CV01')
                    ) umnp
                    join
                    (
                        select /*+ CARDINALITY(b, 100)*/
                             b.outlet_ams_id,
                             b.data_value supp_ams_id,
                             b.from_date
                        from ams_prc_blocks b
                        where b.session_id = pn_session_id
                          and b.record_date = var_record_date
                          and b.module_code = 'PROM'
                          and b.data_code = 'SUPP'
                          and last_day(add_months(var_record_date, i))
                              between b.from_date
                              and b.to_date

                    ) bloc
                        on bloc.supp_ams_id = umnp.outlet_ams_id
                    join
                    (
                        select /*+ CARDINALITY(o, 100)*/
                            *
                        from ams_prc_outlets o
                        where o.session_id = pn_session_id
                            and o.record_date = add_months(var_record_date, i)
                            and o.branch_ams_id = pv_outlet_ams_id
                    ) outl
                        on bloc.outlet_ams_id = outl.outlet_ams_id
                    where bloc.from_date
                            between umnp.cycle_date
                            and last_day(var_record_date)
                        and nvl(
                            AMS_MODL_OFUNCTIONS.get_informations(
                                AMS_MODL_OFUNCTIONS.get_outlet_id(
                                    nvl(outl.unit_ams_id, outl.agency_ams_id)
                                ),
                                'TYPE',
                                last_day(add_months(var_record_date, i)))
                            , 'NR') not in ('PA');
                    commit;

                    -- 03.04.05: TVV PA do TNDD ho tro hd tro lai
                    insert /*+ APPEND */ into ams_prc_p015_umnp_data nologging (
                        session_id,
                        record_date,
                        outlet_ams_id,
                        data_code,
                        data_date,
                        branch_ams_id,
                        effe_date,
                        term_date,
                        regency_code,
                        empl_ams_id,
                        cycle_date,
                        numb_asmt,
                        period_fyp,
                        period_afif,
                        period_afis,
                        period_pr36,
                        period_empl,
                        period_issu,
                        period_acti
                    )
                    select /*+ CARDINALITY(umnp, 100)
                              CARDINALITY(bloc, 100)
                              CARDINALITY(outl, 100)*/
                        pn_session_id,
                        var_record_date,
                        outl.outlet_ams_id,
                        'SUPP',
                        add_months(var_record_date, i),
                        outl.branch_ams_id,
                        outl.effe_date,
                        outl.term_date,
                        outl.regency_code,
                        bloc.supp_ams_id,
                        umnp.cycle_date,
                        umnp.numb_asmt,
                        0,
                        0,
                        0,
                        0,
                        case
                            when (add_months(var_record_date, i) = var_cond_date) then
                                1
                            else
                                0
                            end,
                        0,
                        0
                    from
                    (
                        select /*+ CARDINALITY(u, 100)*/
                            *
                        from ams_prc_p015_umnp u
                        where u.session_id = pn_session_id
                            and u.record_date = var_record_date
                            and u.branch_ams_id = pv_outlet_ams_id
                            and u.regency_code in ('CV06')
                    ) umnp
                    join
                    (
                        select /*+ CARDINALITY(b, 100)*/
                             b.outlet_ams_id,
                             b.data_value supp_ams_id,
                             b.from_date
                        from ams_prc_blocks b
                        where b.session_id = pn_session_id
                          and b.record_date = var_record_date
                          and b.module_code = 'PROM'
                          and b.data_code = 'SUPP'
                          and last_day(add_months(var_record_date, i))
                              between b.from_date
                              and b.to_date

                    ) bloc
                        on bloc.supp_ams_id = umnp.outlet_ams_id
                    join
                    (
                        select /*+ CARDINALITY(o, 100)*/
                            *
                        from ams_prc_outlets o
                        where o.session_id = pn_session_id
                            and o.record_date = add_months(var_record_date, i)
                            and o.branch_ams_id = pv_outlet_ams_id
                    ) outl
                        on bloc.outlet_ams_id = outl.outlet_ams_id
                    where bloc.from_date
                            between umnp.cycle_date
                            and last_day(var_record_date)
                        and nvl(
                            AMS_MODL_OFUNCTIONS.get_informations(
                                AMS_MODL_OFUNCTIONS.get_outlet_id(
                                    nvl(outl.unit_ams_id, outl.agency_ams_id)
                                ),
                                'TYPE',
                                last_day(add_months(var_record_date, i)))
                            , 'NR') not in ('PA');
                    commit;
                end if;
            end loop;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_umnp_open] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_umnp_data(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
        var_record_date date := trunc(pd_realize_date, 'MM');
        var_cur_date date := trunc(sysdate, 'MM');

        var_cond_date date := least(var_record_date, var_cur_date);
    begin
        -- Buoc 01: Chi tiet du lieu
        begin
           -- Buoc 01.01: Ghi nhan du lieu [RFYP]
           for i in -9..0
           loop
               if (add_months(var_record_date, i) <= var_cond_date) then
                   -- Buoc 01.01.01: RFYP
                   merge /*+ CARDINALITY(umnp, 10)
                             CARDINALITY(upd, 10)*/
                       into ams_prc_p015_umnp_data umnp
                   using
                        (
                            select /*+ CARDINALITY(outl, 100)
                                       CARDINALITY(rfyp, 100)
                                       CARDINALITY(rissue, 100)
                                       LEADING(outl)
                                       NO_MERGE(rfyp)
                                       NO_MERGE(rissue)
                                       */
                                outl.record_date,
                                outl.outlet_ams_id,
                                outl.data_code,
                                outl.data_date,
                                rfyp.data_value data_rfyp,
                                rissue.data_value data_rissue
                            from
                            (
                                select /*+ CARDINALITY(tmp, 100)*/
                                    tmp.record_date,
                                    tmp.outlet_ams_id,
                                    tmp.data_code,
                                    tmp.data_date
                                from ams_prc_p015_umnp_data tmp
                                where tmp.session_id = pn_session_id
                                    and tmp.record_date = var_record_date
                                    and tmp.data_date = add_months(var_record_date, i)
                                    and tmp.branch_ams_id = pv_outlet_ams_id
                            ) outl
                            left join
                            (
                                select /*+ CARDINALITY(tmp, 100)*/
                                    tmp.outlet_ams_id,
                                    tmp.data_value
                                from ams_prc_data tmp
                                where tmp.session_id = pn_session_id
                                  and tmp.record_date = add_months(var_record_date, i)
                                  and tmp.branch_ams_id = pv_outlet_ams_id
                                  and tmp.module_code = 'PROM'
                                  and tmp.data_code = 'RFYP'
                            ) rfyp
                                on rfyp.outlet_ams_id = outl.outlet_ams_id
                            left join
                            (
                                select /*+ CARDINALITY(tmp, 100)*/
                                    tmp.outlet_ams_id,
                                    tmp.data_value
                                from ams_prc_data tmp
                                where tmp.session_id = pn_session_id
                                  and tmp.record_date = add_months(var_record_date, i)
                                  and tmp.branch_ams_id = pv_outlet_ams_id
                                  and tmp.module_code = 'PROM'
                                  and tmp.data_code = 'EFAC'
                            ) rissue
                                on rissue.outlet_ams_id = outl.outlet_ams_id
                        ) upd
                   on (
                        pn_session_id = umnp.session_id
                        and
                        upd.record_date = umnp.record_date
                        and
                        upd.outlet_ams_id = umnp.outlet_ams_id
                        and
                        upd.data_code = umnp.data_code
                        and
                        upd.data_date = umnp.data_date
                   )
                   when matched then
                      update /*+ NOLOGGING */
                          set
                              umnp.period_fyp = nvl(upd.data_rfyp, 0),
                              umnp.period_issu = nvl(upd.data_rissue, 0);
                   commit;
               end if;
           end loop;

           -- Buoc 01.02: Dai ly hoat dong trong tung thang
           update /*+ NOLOGGING */ ams_prc_p015_umnp_data umnp
               set umnp.period_acti = 1
           where umnp.session_id = pn_session_id
               and umnp.record_date = var_record_date
               and umnp.branch_ams_id = pv_outlet_ams_id
               and nvl(umnp.period_issu, 0) > 0;
           commit;

           -- Buoc 01.03: Ghi nhan du lieu [RAFIF, AFIS]
           merge /*+ CARDINALITY(umnp, 10)
                     CARDINALITY(upd, 10)*/
               into ams_prc_p015_umnp_data umnp
           using
                (
                    select /*+ CARDINALITY(outl, 100)
                               CARDINALITY(rafif, 100)
                               CARDINALITY(rafis, 100)
                               LEADING(outl)
                               NO_MERGE(rafif)
                               NO_MERGE(rafis)
                               */
                        outl.outlet_ams_id,
                        outl.record_date,
                        outl.data_code,
                        outl.data_date,
                        rafif.data_value data_rafif,
                        rafis.data_value data_rafis
                    from
                    (
                        select /*+ CARDINALITY(tmp, 100)*/
                            tmp.record_date,
                            tmp.outlet_ams_id,
                            tmp.data_code,
                            tmp.data_date
                        from ams_prc_p015_umnp_data tmp
                        where tmp.session_id = pn_session_id
                            and tmp.record_date = var_record_date
                            and tmp.data_date = var_cond_date
                            and tmp.branch_ams_id = pv_outlet_ams_id
                    ) outl
                    left join
                    (
                        select /*+ CARDINALITY(tmp, 100)*/
                            tmp.outlet_ams_id,
                            tmp.data_value
                        from ams_prc_data tmp
                        where tmp.session_id = pn_session_id
                          and tmp.record_date = var_cond_date
                          and tmp.branch_ams_id = pv_outlet_ams_id
                          and tmp.module_code = 'PROM'
                          and tmp.data_code = 'IFAP'
                    ) rafif
                        on rafif.outlet_ams_id = outl.outlet_ams_id
                    left join
                    (
                        select /*+ CARDINALITY(tmp, 100)*/
                            tmp.outlet_ams_id,
                            tmp.data_value
                        from ams_prc_data tmp
                        where tmp.session_id = pn_session_id
                          and tmp.record_date = var_cond_date
                          and tmp.branch_ams_id = pv_outlet_ams_id
                          and tmp.module_code = 'PROM'
                          and tmp.data_code = 'ISAP'
                    ) rafis
                        on rafis.outlet_ams_id = outl.outlet_ams_id
                ) upd
           on (
                pn_session_id = umnp.session_id
                and
                upd.record_date = umnp.record_date
                and
                upd.outlet_ams_id = umnp.outlet_ams_id
                and
                upd.data_code = umnp.data_code
                and
                upd.data_date = umnp.data_date
           )
           when matched then
              update /*+ NOLOGGING */
                  set
                      umnp.period_afif = nvl(upd.data_rafif, 0),
                      umnp.period_afis = nvl(upd.data_rafis, 0);
           commit;

           -- Buoc 01.04: Ghi nhan du lieu tuyen dung thuan
           update /*+ NOLOGGING */ ams_prc_p015_umnp_data umnp
               set umnp.period_empl = 1
           where umnp.session_id = pn_session_id
               and umnp.record_date = var_record_date
               and umnp.data_date = var_cond_date
               and umnp.branch_ams_id = pv_outlet_ams_id
               and umnp.outlet_ams_id <> umnp.empl_ams_id
               and umnp.data_code = 'EMPL'
               and umnp.effe_date
                   between umnp.cycle_date
                   and last_day(var_record_date)
               and umnp.term_date is null;
           commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_umnp_data] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 02: Tong hop du lieu
        begin
            -- Buoc 02.01: Tong hop FYP
            merge /*+ CARDINALITY(umnp, 10)
                      CARDINALITY(upd, 10)*/
                into ams_prc_p015_umnp umnp
            using
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.empl_ams_id outlet_ams_id,
                        sum(tmp.period_fyp) period_fyp
                    from ams_prc_p015_umnp_data tmp
                    where tmp.session_id = pn_session_id
                        and tmp.record_date = var_record_date
                        and tmp.data_date
                            between tmp.cycle_date
                            and last_day(var_record_date)
                        and tmp.branch_ams_id = pv_outlet_ams_id
                        and tmp.outlet_ams_id <> tmp.empl_ams_id
                    group by tmp.empl_ams_id
                ) upd
            on (
                pn_session_id = umnp.session_id
                and
                var_record_date = umnp.record_date
                and
                pv_outlet_ams_id = umnp.branch_ams_id
                and
                upd.outlet_ams_id = umnp.outlet_ams_id
            )
            when matched then
                update /*+ NOLOGGING */
                    set
                        umnp.period_fyp = nvl(upd.period_fyp, 0);
            commit;

            -- Buoc 02.02: Tuyen dung thuan
            merge /*+ CARDINALITY(umnp, 10)
                      CARDINALITY(upd, 10)*/
                into ams_prc_p015_umnp umnp
            using
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.empl_ams_id outlet_ams_id,
                        sum(tmp.period_empl) period_empl
                    from ams_prc_p015_umnp_data tmp
                    where tmp.session_id = pn_session_id
                        and tmp.record_date = var_record_date
                        and tmp.data_date = var_cond_date
                        and tmp.branch_ams_id = pv_outlet_ams_id
                        and tmp.outlet_ams_id <> tmp.empl_ams_id
                    group by tmp.empl_ams_id
                ) upd
            on (
                pn_session_id = umnp.session_id
                and
                var_record_date = umnp.record_date
                and
                pv_outlet_ams_id = umnp.branch_ams_id
                and
                upd.outlet_ams_id = umnp.outlet_ams_id
            )
            when matched then
                update /*+ NOLOGGING */
                    set
                        umnp.period_empl = nvl(upd.period_empl, 0);
            commit;

            -- Buoc 02.03: Tong hop AFIF va AFIS
            merge /*+ CARDINALITY(umnp, 100)
                      CARDINALITY(upd, 100)*/
                into ams_prc_p015_umnp umnp
            using
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.empl_ams_id outlet_ams_id,
                        sum(tmp.period_afif) period_afif,
                        sum(tmp.period_afis) period_afis
                    from ams_prc_p015_umnp_data tmp
                    where tmp.session_id = pn_session_id
                        and tmp.record_date = var_record_date
                        and tmp.data_date = var_cond_date
                        and tmp.branch_ams_id = pv_outlet_ams_id
                    group by tmp.empl_ams_id
                ) upd
            on (
                pn_session_id = umnp.session_id
                and
                var_record_date = umnp.record_date
                and
                pv_outlet_ams_id = umnp.branch_ams_id
                and
                upd.outlet_ams_id = umnp.outlet_ams_id
            )
            when matched then
                update /*+ NOLOGGING */
                    set
                        umnp.period_afif = nvl(upd.period_afif, 0),
                        umnp.period_afis = nvl(upd.period_afis, 0);
            commit;

            -- Buoc 02.04: Ti le duy tri 36 thang
            update ams_prc_p015_umnp umnp
            set
                umnp.period_pr36 =
                    decode(nvl(umnp.period_afis, 0),
                        0, 100,
                        round(
                            nvl(umnp.period_afif, 0) / nvl(umnp.period_afis, 0) * 100,
                            2
                        )
                    )
            where umnp.session_id = pn_session_id
                and umnp.record_date = var_record_date
                and umnp.branch_ams_id = pv_outlet_ams_id;
            commit;

            -- Buoc 02.05: Ty le hoat dong nhom cua TN
            merge /*+ CARDINALITY(umnp, 10)
                      CARDINALITY(upd, 10)*/
                into ams_prc_p015_umnp umnp
            using
                (
                    select /*+ CARDINALITY(gro, 100)*/
                        gro.empl_ams_id outlet_ams_id,
                        decode(count(*),
                            0, 100,
                            round(
                                sum(nvl(gro.month_acti, 0)) / count(*),
                                2
                            )
                        ) period_acti
                    from
                    (
                        select
                            dumnp.empl_ams_id,
                            dumnp.data_date,
                            decode(count(*),
                                0, 100,
                                round(
                                    sum(nvl(dumnp.period_acti, 0)) / count(*) * 100,
                                    2
                                )
                            ) month_acti
                        from ams_prc_p015_umnp_data dumnp
                        where dumnp.session_id = pn_session_id
                            and dumnp.record_date = var_record_date
                            and dumnp.branch_ams_id = pv_outlet_ams_id
                            and dumnp.term_date is null
                            and dumnp.data_date >= dumnp.cycle_date
                        group by
                            dumnp.empl_ams_id,
                            dumnp.data_date
                    ) gro
                    group by
                        gro.empl_ams_id
                ) upd
            on (
                pn_session_id = umnp.session_id
                and
                var_record_date = umnp.record_date
                and
                pv_outlet_ams_id = umnp.branch_ams_id
                and
                upd.outlet_ams_id = umnp.outlet_ams_id
            )
            when matched then
                update /*+ NOLOGGING */
                    set
                        umnp.period_acti = nvl(upd.period_acti, 0);
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_umnp_data] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_umnp_cond(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
        var_record_date date := trunc(pd_realize_date, 'MM');
        var_cur_date date := trunc(sysdate, 'MM');

        var_cond_date date := least(var_record_date, var_cur_date);
        type umnp_cond is varray(3) of number(16, 2);
        var_umnp_cond_fyp umnp_cond;
        var_umnp_cond_empl umnp_cond;
        var_umnp_cond_pr36 umnp_cond;
        var_umnp_cond_acti umnp_cond;

        var_prom_preg varchar2(16);
        var_prom_cerf varchar2(16);

        var_main_creg varchar2(16);
        var_main_dreg varchar2(16);
        var_main_asmt number(3);
    begin
        --Buoc 01: Lay thong tin cau hinh
        begin
            var_umnp_cond_fyp := umnp_cond(
                AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/PUM/P1/FYP'),
                AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/PUM/P2/FYP'),
                AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/PUM/P3/FYP')
            );
            var_umnp_cond_empl := umnp_cond(
                AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/PUM/P1/EMPL'),
                AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/PUM/P2/EMPL'),
                AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/PUM/P3/EMPL')
            );
            var_umnp_cond_pr36 := umnp_cond(
                AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/PUM/P1/PR36'),
                AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/PUM/P2/PR36'),
                AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/PUM/P3/PR36')
            );
            var_umnp_cond_acti := umnp_cond(
                AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/PUM/P1/ACTI'),
                AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/PUM/P2/ACTI'),
                AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/PUM/P3/ACTI')
            );

            var_prom_preg := AMS_MODL_VARIABLE.get_tvar_by_code('/GLOBAL/PROM/P2015/PUM/INFO/PREG');
            var_prom_cerf := AMS_MODL_VARIABLE.get_tvar_by_code('/GLOBAL/PROM/P2015/PUM/INFO/CERF');

            var_main_creg := AMS_MODL_VARIABLE.get_tvar_by_code('/GLOBAL/PROM/P2015/PUM/DESP/CREG');
            var_main_dreg := AMS_MODL_VARIABLE.get_tvar_by_code('/GLOBAL/PROM/P2015/PUM/DESP/DREG');
            var_main_asmt := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/PUM/DESP/PRDP');
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_umnp_cond] ' || SQLERRM);
                goto procedure_end;
        end;

        begin
            -- Buoc 01: Xet duy tri
            update /*+ NOLOGGING */ ams_prc_p015_umnp umnp
              set
                umnp.umnp_asmt = 'D',
                umnp.new_regency_code = var_main_dreg,
                umnp.new_regency_date = add_months(var_record_date, 1)
            where umnp.session_id = pn_session_id
                and umnp.record_date = var_record_date
                and umnp.branch_ams_id = pv_outlet_ams_id
                and umnp.regency_code in
                (
                    select regexp_substr(var_main_creg, '[^,]+', 1, level) regency_code
                    from dual
                    connect by regexp_substr(var_main_creg, '[^,]+', 1, level) is not null
                )
                and umnp.numb_asmt >= var_main_asmt;
            commit;

            -- Buoc 02: Xet thang tien
            for i in 1..3
            loop
                update /*+ NOLOGGING */ ams_prc_p015_umnp umnp
                   set umnp.umnp_asmt = 'P',
                       umnp.new_regency_code = trim(var_prom_preg),
                       umnp.new_regency_date = add_months(var_record_date, 1)
                where umnp.session_id = pn_session_id
                    and umnp.record_date = var_record_date
                    and umnp.branch_ams_id = pv_outlet_ams_id
                    and umnp.numb_asmt = i
                    and umnp.period_fyp >= var_umnp_cond_fyp(i)
                    and umnp.period_empl >= var_umnp_cond_empl(i)
                    and umnp.period_pr36 >= var_umnp_cond_pr36(i)
                    and umnp.period_acti>= var_umnp_cond_acti(i);
                commit;
            end loop;

            -- Buoc 03: Co xet toi chung chi hay khong?
            update ams_prc_p015_umnp umnp
                set umnp.umnp_asmt = 'M',
                    umnp.new_regency_code = null,
                    umnp.new_regency_date = null
                where umnp.session_id = pn_session_id
                    and umnp.record_date = var_record_date
                    and umnp.branch_ams_id = pv_outlet_ams_id
                    and umnp.umnp_asmt = 'P'
                    and nvl(umnp.is_certificate, AMS_CORE_CODE.VALUE_NO) <> AMS_CORE_CODE.VALUE_YES
                    and (var_prom_cerf = AMS_CORE_CODE.VALUE_YES);
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_umnp_cond] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_umnp_comp(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
        var_record_date date := trunc(pd_realize_date, 'MM');
        var_cur_date date := trunc(sysdate, 'MM');

        var_cond_date date := least(var_record_date, var_cur_date);
    begin
       -- Buoc 01: Xoa du lieu neu da ton tai
        begin
            loop
                delete /*+ NOLOGGING */ ams_con_p015_umnp del
                where del.record_date = var_record_date
                    and del.branch_ams_id = pv_outlet_ams_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_con_p015_umnp_data del
                where del.record_date = var_record_date
                    and del.branch_ams_id = pv_outlet_ams_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_rep_rp1502 del
                where del.record_date = var_record_date
                    and del.branch_ams_id = pv_outlet_ams_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_umnp_comp] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 02: Di chuyen du lieu
        begin
            insert /*+ APPEND */ into ams_con_p015_umnp nologging (
                record_date,
                outlet_ams_id,
                branch_ams_id,
                sub_branch_ams_id,
                agency_ams_id,
                unit_ams_id,
                effe_date,
                term_date,
                regency_code,
                regency_date,
                cycle_date,
                numb_asmt,
                period_fyp,
                period_afif,
                period_afis,
                period_pr36,
                period_acti,
                period_empl,
                is_certificate,
                umnp_asmt,
                new_regency_code,
                new_regency_date,
                create_user,
                update_user,
                create_datetime,
                update_datetime
            )
            select /*+ CARDINALITY(prc, 100)*/
                var_record_date,
                prc.outlet_ams_id,
                prc.branch_ams_id,
                prc.sub_branch_ams_id,
                prc.agency_ams_id,
                prc.unit_ams_id,
                prc.effe_date,
                prc.term_date,
                prc.regency_code,
                prc.regency_date,
                prc.cycle_date,
                prc.numb_asmt,
                prc.period_fyp,
                prc.period_afif,
                prc.period_afis,
                prc.period_pr36,
                prc.period_acti,
                prc.period_empl,
                prc.is_certificate,
                prc.umnp_asmt,
                prc.new_regency_code,
                prc.new_regency_date,
                pv_user,
                pv_user,
                sysdate,
                sysdate
            from ams_prc_p015_umnp prc
            where prc.session_id = pn_session_id
                and prc.record_date = var_record_date
                and prc.branch_ams_id = pv_outlet_ams_id;
            commit;

            insert /*+ APPEND */ into ams_con_p015_umnp_data nologging (
                record_date,
                outlet_ams_id,
                data_code,
                data_date,
                branch_ams_id,
                effe_date,
                term_date,
                regency_code,
                empl_ams_id,
                cycle_date,
                numb_asmt,
                period_fyp,
                period_afif,
                period_afis,
                period_pr36,
                period_empl,
                period_issu,
                period_acti,
                create_user,
                update_user,
                create_datetime,
                update_datetime
            )
            select /*+ CARDINALITY(prc, 100)*/
                var_record_date,
                prc.outlet_ams_id,
                prc.data_code,
                prc.data_date,
                prc.branch_ams_id,
                prc.effe_date,
                prc.term_date,
                prc.regency_code,
                prc.empl_ams_id,
                prc.cycle_date,
                prc.numb_asmt,
                prc.period_fyp,
                prc.period_afif,
                prc.period_afis,
                prc.period_pr36,
                prc.period_empl,
                prc.period_issu,
                prc.period_acti,
                pv_user,
                pv_user,
                sysdate,
                sysdate
            from ams_prc_p015_umnp_data prc
            where prc.session_id = pn_session_id
                and prc.branch_ams_id = pv_outlet_ams_id;
            commit;

            insert /*+ APPEND */ into ams_rep_rp1502 nologging (
                record_date,
                sort_data,
                sort_branch_name,
                sort_agency_name,
                sort_unit_name,
                sort_outlet_name,
                sort_outlet_ams_id,
                branch_ams_id,
                branch_name,
                agency_ams_id,
                agency_name,
                unit_ams_id,
                unit_name,
                outlet_ams_id,
                outlet_name,
                effe_date,
                term_date,
                regency_code,
                regency_date,
                empl_outlet_ams_id,
                empl_outlet_name,
                empl_effe_date,
                empl_term_date,
                empl_pa,
                rp_masm,
                rp_empl,
                rp_fyp,
                rp_afif,
                rp_afis,
                rp_pr36,
                rp_acti,
                rp_cerf,
                rp_pasmt,
                rp_pdate,
                maintain_user,
                maintain_datetime
            )
            select /*+ CARDINALITY(prc, 100)*/
                var_record_date,
                'A01',
                outl.branch_name,
                outl.agency_name,
                outl.unit_name,
                outl.outlet_name,
                outl.outlet_ams_id,
                outl.branch_ams_id,
                outl.branch_name,
                outl.agency_ams_id,
                outl.agency_name,
                outl.unit_ams_id,
                outl.unit_name,
                outl.outlet_ams_id,
                outl.outlet_name,
                outl.effective_date,
                outl.terminal_date,
                outl.regency_code,
                outl.regency_date,
                null,
                null,
                null,
                null,
                null,
                (months_between(var_record_date, trunc(umnp.cycle_date, 'MM')) + 1),
                umnp.period_empl,
                umnp.period_fyp,
                umnp.period_afif,
                umnp.period_afis,
                umnp.period_pr36,
                umnp.period_acti,
                umnp.is_certificate,
                umnp.umnp_asmt,
                umnp.new_regency_date,
                pv_user,
                sysdate
            from
            (
                select *
                from ams_con_p015_umnp tmp
                where tmp.record_date = var_record_date
                    and tmp.branch_ams_id = pv_outlet_ams_id
            ) umnp
            join
            (
                select *
                from dbw_outl_informations i
                where i.record_date = var_cond_date
                    and i.dbw_code = 'MAIN'
                    and i.dbw_time = 'MONT'
                    and i.outlet_type = 'OUTL'
                    and i.branch_ams_id = pv_outlet_ams_id
            ) outl
                on outl.outlet_ams_id = umnp.outlet_ams_id;
            commit;

            insert /*+ APPEND */ into ams_rep_rp1502 nologging (
                record_date,
                sort_data,
                sort_branch_name,
                sort_agency_name,
                sort_unit_name,
                sort_outlet_name,
                sort_outlet_ams_id,
                branch_ams_id,
                branch_name,
                agency_ams_id,
                agency_name,
                unit_ams_id,
                unit_name,
                outlet_ams_id,
                outlet_name,
                effe_date,
                term_date,
                regency_code,
                regency_date,
                empl_outlet_ams_id,
                empl_outlet_name,
                empl_effe_date,
                empl_term_date,
                empl_pa,
                rp_masm,
                rp_empl,
                rp_fyp,
                rp_afif,
                rp_afis,
                rp_pr36,
                rp_acti,
                rp_cerf,
                rp_pasmt,
                rp_pdate,
                maintain_user,
                maintain_datetime
            )
            select /*+ CARDINALITY(prc, 100)*/
                var_record_date,
                'A02',
                outl.branch_name,
                outl.agency_name,
                outl.unit_name,
                outl.outlet_name,
                outl.outlet_ams_id,
                eoutl.branch_ams_id,
                eoutl.branch_name,
                eoutl.agency_ams_id,
                eoutl.agency_name,
                eoutl.unit_ams_id,
                eoutl.unit_name,
                null,
                null,
                null,
                null,
                null,
                null,
                empl.outlet_ams_id,
                eoutl.outlet_name,
                eoutl.effective_date,
                eoutl.terminal_date,
                empl.empl_pa,
                null,
                empl.period_empl,
                empl.period_fyp,
                empl.period_afif,
                empl.period_afis,
                null,
                null,
                null,
                null,
                null,
                pv_user,
                sysdate
            from
            (
                select *
                from ams_con_p015_umnp tmp
                where tmp.record_date = var_record_date
                    and tmp.branch_ams_id = pv_outlet_ams_id
            ) umnp
            join
            (
                select *
                from dbw_outl_informations i
                where i.record_date = var_cond_date
                    and i.dbw_code = 'MAIN'
                    and i.dbw_time = 'MONT'
                    and i.outlet_type = 'OUTL'
                    and i.branch_ams_id = pv_outlet_ams_id
            ) outl
                on outl.outlet_ams_id = umnp.outlet_ams_id
            join
            (
                select
                    d.outlet_ams_id,
                    d.empl_ams_id,
                    max(
                        case
                            when d.data_code in ('SUPP') then
                                'X'
                            else
                                ''
                            end
                    ) empl_pa,
                    sum(
                        case
                            when d.data_date between d.cycle_date and var_cond_date then
                                nvl(d.period_fyp, 0)
                            else
                                0
                            end
                    ) period_fyp,
                    sum(
                        case
                            when d.data_date = var_cond_date then
                                nvl(d.period_afif, 0)
                            else
                                0
                            end
                    ) period_afif,
                    sum(
                        case
                            when d.data_date = var_cond_date then
                                nvl(d.period_afis, 0)
                            else
                                0
                            end
                    ) period_afis,
                    sum(nvl(d.period_empl, 0)) period_empl
                from ams_con_p015_umnp_data d
                where d.record_date = var_record_date
                group by d.outlet_ams_id,
                    d.empl_ams_id
            ) empl
                on empl.empl_ams_id = umnp.outlet_ams_id
            join
            (
                select *
                from dbw_outl_informations i
                where i.record_date = var_cond_date
                    and i.dbw_code = 'MAIN'
                    and i.dbw_time = 'MONT'
                    and i.outlet_type = 'OUTL'
                    and i.branch_ams_id = pv_outlet_ams_id
                union all
                select *
                from dbw_outl_informations i
                where i.record_date
                    between add_months(var_record_date, -9)
                    and add_months(var_cond_date, -1)
                    and i.dbw_code = 'MAIN'
                    and i.dbw_time = 'MONT'
                    and i.outlet_type = 'OUTL'
                    and i.branch_ams_id = pv_outlet_ams_id
                    and i.terminal_date is not null
            ) eoutl
                on eoutl.outlet_ams_id = empl.outlet_ams_id;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_umnp_comp] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_umnp_close(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
    begin
        -- Buoc 01: Xoa du lieu neu da ton tai
        begin
            loop
                delete /*+ NOLOGGING */ ams_prc_p015_umnp del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_prc_p015_umnp_data del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;

            loop
                delete /*+ NOLOGGING */ ams_prc_p015_umnp_succ del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;

            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_umnp_close] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 02/04/2015
        Version: 1.0
        Description: Duy tri TN
        Parameter:
        Update:
    */
    procedure mmxv_modl_umnm(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
    begin
        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 02/04/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_umnm_open(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
        var_record_date date := trunc(pd_realize_date, 'MM');
        var_cur_date date := trunc(sysdate, 'MM');

        var_cond_date date := least(var_record_date, var_cur_date);
    begin
        -- Buoc 01: Xoa du lieu neu da ton tai
        begin
            loop
                delete /*+ NOLOGGING */ ams_prc_p015_umnm del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_prc_p015_umnm_data del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_prc_p015_umnm_code del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_prc_p015_umnm_empl del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_umnm_open] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 02: Ghi nhan du lieu duoc xu ly
        begin
            -- Buoc 02.A: Ghi nhan danh sach truong nhom
            insert /*+ APPEND */ into ams_prc_p015_umnm nologging (
                session_id,
                record_date,
                outlet_ams_id,
                branch_ams_id,
                sub_branch_ams_id,
                agency_ams_id,
                unit_ams_id,
                effe_date,
                term_date,
                regency_code,
                regency_date,
                seniority,
                umnm_agts,
                period_fyp,
                period_acti,
                period_empl,
                umnm_asmt
             )
            select /*+ CARDINALITY(outl, 100)*/
                pn_session_id,
                var_record_date,
                outl.outlet_ams_id,
                outl.branch_ams_id,
                outl.sub_branch_ams_id,
                outl.agency_ams_id,
                outl.unit_ams_id,
                outl.effe_date,
                outl.term_date,
                outl.regency_code,
                outl.regency_date,
                months_between(
                    add_months(var_record_date, 1),
                    trunc(outl.regency_date, 'MM')
                ),
                0,
                0,
                0,
                0,
                'M'
            from
            (
                select *
                from ams_prc_outlets o
                where o.session_id = pn_session_id
                    and o.record_date = var_cond_date
                    and o.branch_ams_id = pv_outlet_ams_id
                    and o.term_date is null
                    and o.regency_code in ('CV02')
            ) outl;
            commit;

            -- Buoc 02.B: Ghi nhan danh sach truong nhom moi tach 6 thang
            insert /*+ APPEND */ into ams_prc_p015_umnm_code nologging (
                session_id,
                record_date,
                outlet_ams_id,
                branch_ams_id,
                sub_branch_ams_id,
                agency_ams_id,
                unit_ams_id,
                effe_date,
                term_date,
                regency_code,
                regency_date,
                seniority,
                umnm_outlet_ams_id,
                umnm_unit_ams_id
             )
            select /*+ CARDINALITY(outl, 100)*/
                pn_session_id,
                var_record_date,
                outl.outlet_ams_id,
                outl.branch_ams_id,
                outl.sub_branch_ams_id,
                outl.agency_ams_id,
                outl.unit_ams_id,
                outl.effe_date,
                outl.term_date,
                outl.regency_code,
                outl.regency_date,
                months_between(
                    add_months(var_record_date, 1),
                    trunc(outl.regency_date, 'MM')
                ),
                AMS_MODL_OFUNCTIONS.dbwg_dev_units(outl.outlet_ams_id,
                    outl.regency_date),
                AMS_MODL_OFUNCTIONS.dbwg_unit_ams_id(outl.outlet_ams_id,
                    outl.regency_date - 1)
            from ams_prc_outlets outl
            where outl.session_id = pn_session_id
              and outl.record_date = var_cond_date
              and outl.branch_ams_id = pv_outlet_ams_id
              and outl.term_date is null
              and outl.regency_code in ('CV02')
              and outl.regency_date
                  between add_months(var_record_date, -5)
                  and var_record_date;
            commit;

            -- Buoc 02.C: Ghi nhan danh sach dai ly
            for i in -5..0
            loop
                if (var_cond_date >= add_months(var_record_date, i)) then
                    insert /*+ APPEND */ into ams_prc_p015_umnm_data nologging (
                         session_id,
                         record_date,
                         outlet_ams_id,
                         branch_ams_id,
                         sub_branch_ams_id,
                         agency_ams_id,
                         unit_ams_id,
                         effe_date,
                         term_date,
                         regency_code,
                         empl_ams_id,
                         umnm_outlet_ams_id,
                         umnm_unit_ams_id,
                         period_fyp,
                         period_empl,
                         period_issu,
                         period_acti
                    )
                    select /*+ CARDINALITY(umnm, 100)
                               CARDINALITY(outl, 100)*/
                         pn_session_id,
                         add_months(var_record_date, i),
                         outl.outlet_ams_id,
                         outl.branch_ams_id,
                         outl.sub_branch_ams_id,
                         outl.agency_ams_id,
                         outl.unit_ams_id,
                         outl.effe_date,
                         outl.term_date,
                         outl.regency_code,
                         outl.employment_ams_id,
                         null,
                         null,
                         0,
                         0,
                         0,
                         0
                    from
                    (
                       select /*+ CARDINALITY(o, 100)*/
                           o.outlet_ams_id,
                           o.branch_ams_id,
                           o.sub_branch_ams_id,
                           o.agency_ams_id,
                           o.unit_ams_id,
                           o.effe_date,
                           o.term_date,
                           o.regency_code,
                           o.employment_ams_id
                       from ams_prc_outlets o
                       where o.session_id = pn_session_id
                         and o.record_date = add_months(var_record_date, i)
                         and o.branch_ams_id = pv_outlet_ams_id
                    ) outl;
                    commit;
                end if;
            end loop;

            -- Buoc 02.D: Ghi nhan dai ly duoc tuyen dung trong vòng 6 thang
            insert /*+ APPEND */ into ams_prc_p015_umnm_empl nologging (
                 session_id,
                 record_date,
                 outlet_ams_id,
                 branch_ams_id,
                 agency_ams_id,
                 unit_ams_id,
                 effe_date,
                 term_date,
                 empl_outlet_ams_id,
                 empl_unit_ams_id,
                 period_empl
            )
            select /*+ CARDINALITY(empl, 100)*/
                 pn_session_id,
                 var_record_date,
                 empl.outlet_ams_id,
                 empl.branch_ams_id,
                 empl.root_agency_ams_id,
                 empl.root_unit_ams_id,
                 empl.effe_date,
                 empl.term_date,
                 empl.root_empl_ams_id,
                 empl.root_unit_ams_id,
                 0
            from ams_prc_c015_employments empl
            where empl.session_id = pn_session_id
                and empl.record_date = var_record_date
                and empl.branch_ams_id = pv_outlet_ams_id;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_umnm_open] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 02/04/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_umnm_data(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
        var_record_date date := trunc(pd_realize_date, 'MM');
        var_cur_date date := trunc(sysdate, 'MM');

        var_cond_date date := least(var_record_date, var_cur_date);
    begin
        -- Buoc 01: Ghi nhan du lieu chi tiet
        begin
            -- Buoc 01.A: [RFYP, RISSUE]
            for i in -5..0
            loop
                merge /*+ CARDINALITY(dumnm, 10)
                          CARDINALITY(upd, 10)*/
                    into ams_prc_p015_umnm_data dumnm
                using
                    (
                        select /*+ CARDINALITY(outl, 100)
                                   CARDINALITY(rfyp, 100)
                                   CARDINALITY(rissue, 100)
                                   LEADING(outl)
                                   NO_MERGE(rfyp)
                                   NO_MERGE(rissue)
                                   */
                            outl.outlet_ams_id,
                            outl.record_date,
                            rfyp.data_value data_rfyp,
                            rissue.data_value data_rissue,
                            case
                                when nvl(rissue.data_value, 0) > 0 then
                                    1
                                else
                                    0
                                end data_acti
                        from
                        (
                            select /*+ CARDINALITY(tmp, 100)*/
                                tmp.record_date,
                                tmp.outlet_ams_id
                            from ams_prc_p015_umnm_data tmp
                            where tmp.session_id = pn_session_id
                                and tmp.record_date = add_months(var_record_date, i)
                                and tmp.branch_ams_id = pv_outlet_ams_id
                        ) outl
                        left join
                        (
                            select /*+ CARDINALITY(tmp, 100)*/
                                tmp.outlet_ams_id,
                                tmp.data_value
                            from ams_prc_data tmp
                            where tmp.session_id = pn_session_id
                              and tmp.module_code = 'PROM'
                              and tmp.record_date = add_months(var_record_date, i)
                              and tmp.branch_ams_id = pv_outlet_ams_id
                              and tmp.data_code = 'RFYP'
                        ) rfyp
                            on rfyp.outlet_ams_id = outl.outlet_ams_id
                        left join
                        (
                            select /*+ CARDINALITY(tmp, 100)*/
                                tmp.outlet_ams_id,
                                tmp.data_value
                            from ams_prc_data tmp
                            where tmp.session_id = pn_session_id
                              and tmp.module_code = 'PROM'
                              and tmp.record_date = add_months(var_record_date, i)
                              and tmp.branch_ams_id = pv_outlet_ams_id
                              and tmp.data_code = 'EFAC'
                        ) rissue
                            on rissue.outlet_ams_id = outl.outlet_ams_id

                    ) upd
                on (
                    pn_session_id = dumnm.session_id
                    and
                    upd.record_date = dumnm.record_date
                    and
                    upd.outlet_ams_id = dumnm.outlet_ams_id
                )
                when matched then
                    update /*+ NOLOGGING */
                        set
                            dumnm.period_fyp = nvl(upd.data_rfyp, 0),
                            dumnm.period_issu= nvl(upd.data_rissue, 0),
                            dumnm.period_acti = nvl(upd.data_acti, 0);
                commit;
            end loop;

            -- Buoc 01.B: So luong tvv 90 ngay tuoi hoat dong
            merge /*+ CARDINALITY(uempl, 10)
                      CARDINALITY(upd, 10)*/
                into ams_prc_p015_umnm_empl uempl
            using
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_ams_id,
                        sum(nvl(tmp.data_value, 0)) period_empl
                    from ams_prc_data tmp
                    where tmp.session_id = pn_session_id
                        and tmp.module_code = 'PROM'
                        and tmp.record_date
                            between add_months(var_record_date, -5)
                            and var_record_date
                        and tmp.branch_ams_id = pv_outlet_ams_id
                        and tmp.data_code = 'NACTI'
                    group by tmp.outlet_ams_id
                ) upd
            on (
                pn_session_id = uempl.session_id
                and
                var_record_date = uempl.record_date
                and
                upd.outlet_ams_id = uempl.outlet_ams_id
            )
            when matched then
                update /*+ NOLOGGING */
                    set
                        uempl.period_empl = 1;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_umnm_data] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 02: Tong hop du lieu
        begin
            -- Buoc 02.A: Xet quy mo nhom
            merge /*+ CARDINALITY(umnm, 100)
                     CARDINALITY(upd, 100)*/
                into ams_prc_p015_umnm umnm
            using
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.unit_ams_id,
                        nvl(count(*), 0) agts
                    from ams_prc_p015_umnm_data tmp
                    where tmp.session_id = pn_session_id
                        and tmp.record_date = var_cond_date
                        and tmp.branch_ams_id = pv_outlet_ams_id
                        and tmp.term_date is null
                        and tmp.unit_ams_id is not null
                    group by tmp.unit_ams_id
                ) upd
            on (
                pn_session_id = umnm.session_id
                and
                var_record_date = umnm.record_date
                and
                upd.unit_ams_id = umnm.unit_ams_id
            )
            when matched then
                update /*+ NOLOGGING */
                    set
                        umnm.umnm_agts = nvl(upd.agts, 0);
            commit;

            -- Buoc 02.B: FYP, luot dai ly hoat dong
            merge /*+ CARDINALITY(umnm, 100)
                     CARDINALITY(upd, 100)*/
                into ams_prc_p015_umnm umnm
            using
                (
                    select
                        o.outlet_ams_id,
                        sum(nvl(d.period_fyp, 0)) period_fyp
                    from
                    (
                        select *
                        from ams_prc_p015_umnm tmp
                        where tmp.session_id = pn_session_id
                            and tmp.branch_ams_id = pv_outlet_ams_id
                    ) o
                    join
                    (
                        select /*+ CARDINALITY(tmp, 100)*/
                            tmp.outlet_ams_id,
                            tmp.unit_ams_id,
                            tmp.period_fyp period_fyp,
                            tmp.period_acti period_acti
                        from ams_prc_p015_umnm_data tmp
                        where tmp.session_id = pn_session_id
                            and tmp.record_date
                                between add_months(var_record_date, -5)
                                and var_record_date
                            and tmp.branch_ams_id = pv_outlet_ams_id
                    ) d
                        on d.unit_ams_id = o.unit_ams_id
                    where d.outlet_ams_id <> o.outlet_ams_id
                    group by o.outlet_ams_id
                ) upd
            on (
                pn_session_id = umnm.session_id
                and
                var_record_date = umnm.record_date
                and
                upd.outlet_ams_id = umnm.outlet_ams_id
            )
            when matched then
                update /*+ NOLOGGING */
                    set
                        umnm.period_fyp = nvl(upd.period_fyp, 0);
            commit;

            merge /*+ CARDINALITY(umnm, 100)
                     CARDINALITY(upd, 100)*/
                into ams_prc_p015_umnm umnm
            using
                (
                    select
                        o.outlet_ams_id,
                        sum(nvl(d.period_acti, 0)) period_acti
                    from
                    (
                        select *
                        from ams_prc_p015_umnm tmp
                        where tmp.session_id = pn_session_id
                            and tmp.branch_ams_id = pv_outlet_ams_id
                    ) o
                    join
                    (
                        select /*+ CARDINALITY(tmp, 100)*/
                            tmp.outlet_ams_id,
                            tmp.unit_ams_id,
                            tmp.period_fyp period_fyp,
                            tmp.period_acti period_acti
                        from ams_prc_p015_umnm_data tmp
                        where tmp.session_id = pn_session_id
                            and tmp.record_date
                                between add_months(var_record_date, -5)
                                and var_record_date
                            and tmp.branch_ams_id = pv_outlet_ams_id
                    ) d
                        on d.unit_ams_id = o.unit_ams_id
                    group by o.outlet_ams_id
                ) upd
            on (
                pn_session_id = umnm.session_id
                and
                var_record_date = umnm.record_date
                and
                upd.outlet_ams_id = umnm.outlet_ams_id
            )
            when matched then
                update /*+ NOLOGGING */
                    set
                        umnm.period_acti = nvl(upd.period_acti, 0);
            commit;

            -- Buoc 02.C: So luong TVV 90 ngay tuoi hoat dong
            merge /*+ CARDINALITY(umnm, 100)
                      CARDINALITY(upd, 100)*/
                into ams_prc_p015_umnm umnm
            using
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.empl_unit_ams_id unit_ams_id,
                        sum(tmp.period_empl) period_empl
                    from ams_prc_p015_umnm_empl tmp
                    where tmp.session_id = pn_session_id
                        and tmp.record_date = var_record_date
                        and tmp.branch_ams_id = pv_outlet_ams_id
                    group by tmp.empl_unit_ams_id
                ) upd
            on (
                pn_session_id = umnm.session_id
                and
                var_record_date = umnm.record_date
                and
                upd.unit_ams_id = umnm.unit_ams_id
            )
            when matched then
                update /*+ NOLOGGING */
                    set
                        umnm.period_empl = nvl(upd.period_empl, 0);
            commit;

            -- Buoc 02.D: Ghi nhan chung chi
            merge /*+CARDINALITY(umnm, 100)
                     CARDINALITY(upd, 100)*/
                into ams_prc_p015_umnm umnm
            using
                (
                    select
                        cerf.outlet_ams_id
                    from
                    (
                        select b.outlet_ams_id
                        from ams.ams_prc_blocks b
                        where b.session_id = pn_session_id
                            and b.record_date = var_record_date
                            and b.module_code = 'PROM'
                            and b.data_code = 'BTC1' -- Chung chi Bao Viet tam cao 1
                            and b.from_date <= last_day(var_record_date)
                        intersect
                        select b.outlet_ams_id
                        from ams.ams_prc_blocks b
                        where b.session_id = pn_session_id
                            and b.record_date = var_record_date
                            and b.module_code = 'PROM'
                            and b.data_code = 'BTC2' -- Chung chi Bao Viet tam cao 2
                            and b.from_date <= last_day(var_record_date)
                    ) cerf
                ) upd
            on (
                pn_session_id = umnm.session_id
                and
                var_record_date = umnm.record_date
                and
                upd.outlet_ams_id = umnm.outlet_ams_id
            )
            when matched then
                update /*+ NOLOGGING */
                    set
                        umnm.is_certificate = AMS_CORE_CODE.VALUE_YES;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_umnm_data] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 02/04/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_umnm_cond(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
        var_record_date date := trunc(pd_realize_date, 'MM');
        var_cur_date date := trunc(sysdate, 'MM');

        var_cond_date date := least(var_record_date, var_cur_date);

        var_cond_mont number(5);
        var_cond_agen number(5);
        var_cond_onew number(5);
        var_cond_fyp number(16,2);
        var_cond_acti number(5);
        var_cond_cerf varchar2(16);
        var_cond_desm varchar2(16);
    begin
        -- Buoc 01: Lay thong tin cau hinh
        begin
            var_cond_mont := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/UMMN/MONT');
            var_cond_agen := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/UMMN/AGEN');
            var_cond_onew := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/UMMN/ONEW');
            var_cond_fyp := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/UMMN/FYP');
            var_cond_acti := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/UMMN/ACTI');
            var_cond_cerf := AMS_MODL_VARIABLE.get_tvar_by_code('/GLOBAL/PROM/P2015/UMMN/CERF');
            var_cond_desm := AMS_MODL_VARIABLE.get_tvar_by_code('/GLOBAL/PROM/P2015/UMMN/DESM');
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_umnm_cond] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 02: Xu ly dieu kien duy tri
        begin
            -- Buoc 02.A: Xu ly trong truong hop khong du dieu kien duy tri
            update /*+ NOLOGGING */ ams_prc_p015_umnm umnm
              set
                umnm.umnm_asmt = 'D',
                umnm.new_regency_code = var_cond_desm,
                umnm.new_regency_date = add_months(var_record_date, 1)
            where umnm.session_id = pn_session_id
                and umnm.record_date = var_record_date
                and umnm.branch_ams_id = pv_outlet_ams_id
                and umnm.seniority >= nvl(var_cond_mont, 0)
                and
                (
                  umnm.umnm_agts < nvl(var_cond_agen, 0)
                  or
                  umnm.period_empl < nvl(var_cond_onew, 0)
                  or
                  umnm.period_fyp < nvl(var_cond_fyp, 0)
                  or
                  umnm.period_acti < nvl(var_cond_acti, 0)
                  or
                  nvl(umnm.is_certificate, 'N') not in
                      (
                          nvl(var_cond_cerf, 'N'),
                          'Y'
                      )
                );
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_umnm_cond] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 02/04/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_umnm_comp(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
        var_record_date date := trunc(pd_realize_date, 'MM');
        var_cur_date date := trunc(sysdate, 'MM');

        var_cond_date date := least(var_record_date, var_cur_date);
    begin
       -- Buoc 01: Xoa du lieu neu da ton tai
        begin
            loop
                delete /*+ NOLOGGING */ ams_con_p015_umnm del
                where del.record_date = var_record_date
                    and del.branch_ams_id = pv_outlet_ams_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_con_p015_umnm_data del
                where del.record_date = var_record_date
                    and del.branch_ams_id = pv_outlet_ams_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_rep_rp1503 del
                where del.record_date = var_record_date
                    and del.branch_ams_id = pv_outlet_ams_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_umnm_comp] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 02: Di chuyen du lieu
        begin
            insert /*+ APPEND */ into ams_con_p015_umnm nologging (
                record_date,
                outlet_ams_id,
                branch_ams_id,
                sub_branch_ams_id,
                agency_ams_id,
                unit_ams_id,
                effe_date,
                term_date,
                regency_code,
                regency_date,
                seniority,
                umnm_agts,
                period_fyp,
                period_acti,
                period_empl,
                umnm_asmt,
                new_regency_code,
                new_regency_date,
                create_user,
                update_user,
                create_datetime,
                update_datetime,
                is_certificate
            )
            select /*+ CARDINALITY(prc, 100)*/
                var_record_date,
                prc.outlet_ams_id,
                prc.branch_ams_id,
                prc.sub_branch_ams_id,
                prc.agency_ams_id,
                prc.unit_ams_id,
                prc.effe_date,
                prc.term_date,
                prc.regency_code,
                prc.regency_date,
                prc.seniority,
                prc.umnm_agts,
                prc.period_fyp,
                prc.period_acti,
                prc.period_empl,
                prc.umnm_asmt,
                prc.new_regency_code,
                prc.new_regency_date,
                pv_user,
                pv_user,
                sysdate,
                sysdate,
                prc.is_certificate
            from ams_prc_p015_umnm prc
            where prc.session_id = pn_session_id
                and prc.record_date = var_record_date
                and prc.branch_ams_id = pv_outlet_ams_id;
            commit;

            insert /*+ APPEND */ into ams_con_p015_umnm_data nologging (
                record_date,
                outlet_ams_id,
                branch_ams_id,
                sub_branch_ams_id,
                agency_ams_id,
                unit_ams_id,
                effe_date,
                term_date,
                regency_code,
                empl_ams_id,
                umnm_outlet_ams_id,
                umnm_unit_ams_id,
                period_fyp,
                period_empl,
                period_issu,
                period_acti,
                create_user,
                update_user,
                create_datetime,
                update_datetime
            )
            select /*+ CARDINALITY(prc, 100)*/
                var_record_date,
                prc.outlet_ams_id,
                prc.branch_ams_id,
                prc.sub_branch_ams_id,
                prc.agency_ams_id,
                prc.unit_ams_id,
                prc.effe_date,
                prc.term_date,
                prc.regency_code,
                prc.empl_ams_id,
                prc.umnm_outlet_ams_id,
                prc.umnm_unit_ams_id,
                prc.period_fyp,
                prc.period_empl,
                prc.period_issu,
                prc.period_acti,
                pv_user,
                pv_user,
                sysdate,
                sysdate
            from ams_prc_p015_umnm_data prc
            where prc.session_id = pn_session_id
                and prc.branch_ams_id = pv_outlet_ams_id;
            commit;

            -- Buoc 02.C: Du lieu truong nhom
            insert /*+ APPEND */ into ams_rep_rp1503 nologging (
                record_date,
                sort_data,
                sort_branch_name,
                sort_agency_name,
                sort_unit_name,
                sort_outlet_name,
                sort_outlet_ams_id,
                branch_ams_id,
                branch_name,
                agency_ams_id,
                agency_name,
                unit_ams_id,
                unit_name,
                outlet_ams_id,
                outlet_name,
                regency_code,
                regency_date,
                effe_date,
                term_date,
                empl_unit_ams_id,
                empl_unit_name,
                empl_outlet_ams_id,
                empl_outlet_name,
                empl_effe_date,
                empl_term_date,
                rp_agts,
                rp_empl,
                rp_fyp,
                rp_acti,
                rp_certificate,
                rp_result,
                rp_date,
                rp_regency_code,
                maintain_user,
                maintain_time
            )
            select /*+ CARDINALITY(umnm, 10)
                       CARDINALITY(outl, 10)*/
                var_record_date,
                'M11',
                outl.branch_name,
                outl.agency_name,
                outl.unit_name,
                outl.outlet_name,
                outl.outlet_ams_id,
                outl.branch_ams_id,
                outl.branch_name,
                outl.agency_ams_id,
                outl.agency_name,
                outl.unit_ams_id,
                outl.unit_name,
                outl.outlet_ams_id,
                outl.outlet_name,
                outl.regency_code,
                outl.regency_date,
                outl.effective_date,
                outl.terminal_date,
                null,
                null,
                null,
                null,
                null,
                null,
                umnm.umnm_agts,
                umnm.period_empl,
                umnm.period_fyp,
                umnm.period_acti,
                umnm.is_certificate,
                umnm.umnm_asmt,
                umnm.new_regency_date,
                umnm.new_regency_code,
                pv_user,
                sysdate
            from
            (
                select *
                from ams_prc_p015_umnm prc
                where prc.session_id = pn_session_id
                    and prc.record_date = var_record_date
                    and prc.branch_ams_id = pv_outlet_ams_id
            ) umnm
            join
            (
                select *
                from dbw_outl_informations dbw
                where dbw.dbw_code = 'MAIN'
                    and dbw.dbw_time = 'MONT'
                    and dbw.outlet_type = 'OUTL'
                    and dbw.record_date = var_cond_date
                    and dbw.branch_ams_id = pv_outlet_ams_id
            ) outl
                on umnm.outlet_ams_id = outl.outlet_ams_id;
            commit;

            -- Buoc 02.D: Du lieu dai ly trong nhom
            insert /*+ APPEND */ into ams_rep_rp1503 nologging (
                record_date,
                sort_data,
                sort_branch_name,
                sort_agency_name,
                sort_unit_name,
                sort_outlet_name,
                sort_outlet_ams_id,
                branch_ams_id,
                branch_name,
                agency_ams_id,
                agency_name,
                unit_ams_id,
                unit_name,
                outlet_ams_id,
                outlet_name,
                regency_code,
                regency_date,
                effe_date,
                term_date,
                empl_unit_ams_id,
                empl_unit_name,
                empl_outlet_ams_id,
                empl_outlet_name,
                empl_effe_date,
                empl_term_date,
                rp_agts,
                rp_empl,
                rp_fyp,
                rp_acti,
                rp_certificate,
                rp_result,
                rp_date,
                rp_regency_code,
                maintain_user,
                maintain_time
            )
            select /*+ CARDINALITY(umnm, 10)
                       CARDINALITY(outl, 10)*/
                var_record_date,
                'M12',
                outl.branch_name,
                outl.agency_name,
                outl.unit_name,
                outl.outlet_name,
                outl.outlet_ams_id,
                outl_info.branch_ams_id,
                null,
                outl_info.agency_ams_id,
                null,
                outl_info.unit_ams_id,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                outl_info.unit_ams_id,
                outl_info.unit_name,
                outl_info.outlet_ams_id,
                outl_info.outlet_name,
                outl_info.effective_date,
                outl_info.terminal_date,
                null,
                empl.period_empl,
                dumnm.period_fyp,
                dumnm.period_acti,
                null,
                null,
                null,
                null,
                pv_user,
                sysdate
            from
            (
                select *
                from ams_prc_p015_umnm prc
                where prc.session_id = pn_session_id
                    and prc.record_date = var_record_date
                    and prc.branch_ams_id = pv_outlet_ams_id
            ) umnm
            join
            (
                select
                    dt.unit_ams_id,
                    dt.outlet_ams_id,
                    sum(dt.period_fyp) period_fyp,
                    sum(dt.period_empl) period_empl,
                    sum(dt.period_acti) period_acti
                from ams_prc_p015_umnm_data dt
                where dt.session_id = pn_session_id
                    and dt.record_date <= var_record_date
                    and dt.branch_ams_id = pv_outlet_ams_id
                group by
                    dt.unit_ams_id,
                    dt.outlet_ams_id
            ) dumnm
                on dumnm.unit_ams_id = umnm.unit_ams_id
            left join
            (
                select
                    e.outlet_ams_id,
                    e.empl_unit_ams_id,
                    e.empl_outlet_ams_id,
                    e.period_empl
                from ams_prc_p015_umnm_empl e
                where e.session_id = pn_session_id
                    and e.record_date = var_record_date
                    and e.branch_ams_id = pv_outlet_ams_id
            ) empl
                on (
                    empl.outlet_ams_id = dumnm.outlet_ams_id
                    and
                    empl.empl_unit_ams_id = umnm.unit_ams_id
                )
            join
            (
                select *
                from dbw_outl_informations dbw
                where dbw.dbw_code = 'MAIN'
                    and dbw.dbw_time = 'MONT'
                    and dbw.outlet_type = 'OUTL'
                    and dbw.record_date = var_cond_date
                    and dbw.branch_ams_id = pv_outlet_ams_id
            ) outl
                on umnm.outlet_ams_id = outl.outlet_ams_id
            join
            (
                select /*+ CARDINALITY(i, 100)*/
                     *
                from dbw_outl_informations i
                where i.dbw_code = 'MAIN'
                    and i.dbw_time = 'MONT'
                    and i.outlet_type = 'OUTL'
                    and i.record_date = var_cond_date
                    and i.branch_ams_id = pv_outlet_ams_id

                union all

                select /*+ CARDINALITY(i, 100)*/
                     *
                from dbw_outl_informations i
                where i.dbw_code = 'MAIN'
                    and i.dbw_time = 'MONT'
                    and i.outlet_type = 'OUTL'
                    and i.terminal_date is not null
                    and i.record_date
                        between add_months(var_record_date, -5)
                        and add_months(var_record_date, -1)
                    and i.branch_ams_id = pv_outlet_ams_id
            ) outl_info
                on dumnm.outlet_ams_id = outl_info.outlet_ams_id;
            commit;

            -- Buoc 02.E: Du lieu tuyen dung
            insert /*+ APPEND */ into ams_rep_rp1503 nologging (
                record_date,
                sort_data,
                sort_branch_name,
                sort_agency_name,
                sort_unit_name,
                sort_outlet_name,
                sort_outlet_ams_id,
                branch_ams_id,
                branch_name,
                agency_ams_id,
                agency_name,
                unit_ams_id,
                unit_name,
                outlet_ams_id,
                outlet_name,
                regency_code,
                regency_date,
                effe_date,
                term_date,
                empl_unit_ams_id,
                empl_unit_name,
                empl_outlet_ams_id,
                empl_outlet_name,
                empl_effe_date,
                empl_term_date,
                rp_agts,
                rp_empl,
                rp_fyp,
                rp_acti,
                rp_certificate,
                rp_result,
                rp_date,
                rp_regency_code,
                maintain_user,
                maintain_time
            )
            select /*+ CARDINALITY(umnm, 10)
                       CARDINALITY(outl, 10)*/
                var_record_date,
                'M13',
                outl.branch_name,
                outl.agency_name,
                outl.unit_name,
                outl.outlet_name,
                outl.outlet_ams_id,
                outl_info.branch_ams_id,
                null,
                outl_info.agency_ams_id,
                null,
                outl_info.unit_ams_id,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                outl_info.unit_ams_id,
                outl_info.unit_name,
                outl_info.outlet_ams_id,
                outl_info.outlet_name,
                outl_info.effective_date,
                outl_info.terminal_date,
                null,
                empl.period_empl,
                0,
                0,
                null,
                null,
                null,
                null,
                pv_user,
                sysdate
            from
            (
                select *
                from ams_prc_p015_umnm prc
                where prc.session_id = pn_session_id
                    and prc.record_date = var_record_date
                    and prc.branch_ams_id = pv_outlet_ams_id
            ) umnm
            join
            (
                select
                    ou.unit_ams_id,
                    oe.outlet_ams_id,
                    oe.empl_unit_ams_id,
                    oe.empl_outlet_ams_id,
                    oe.period_empl
                from
                (
                    select
                        e.outlet_ams_id,
                        e.empl_unit_ams_id,
                        e.empl_outlet_ams_id,
                        e.period_empl
                    from ams_prc_p015_umnm_empl e
                    where e.session_id = pn_session_id
                        and e.record_date = var_record_date
                        and e.branch_ams_id = pv_outlet_ams_id
                ) oe
                join
                (
                    select
                        dt.unit_ams_id,
                        dt.outlet_ams_id
                    from ams_prc_p015_umnm_data dt
                    where dt.session_id = pn_session_id
                        and dt.record_date <= var_record_date
                        and dt.branch_ams_id = pv_outlet_ams_id
                    group by
                        dt.unit_ams_id,
                        dt.outlet_ams_id
                ) ou
                    on ou.outlet_ams_id = oe.outlet_ams_id
            ) empl
                on (
                    empl.empl_unit_ams_id = umnm.unit_ams_id
                    and
                    empl.unit_ams_id <> umnm.unit_ams_id
                )
            join
            (
                select *
                from dbw_outl_informations dbw
                where dbw.dbw_code = 'MAIN'
                    and dbw.dbw_time = 'MONT'
                    and dbw.outlet_type = 'OUTL'
                    and dbw.record_date = var_cond_date
                    and dbw.branch_ams_id = pv_outlet_ams_id
            ) outl
                on umnm.outlet_ams_id = outl.outlet_ams_id
            join
            (
                select /*+ CARDINALITY(i, 100)*/
                     *
                from dbw_outl_informations i
                where i.dbw_code = 'MAIN'
                    and i.dbw_time = 'MONT'
                    and i.outlet_type = 'OUTL'
                    and i.record_date = var_cond_date
                    and i.branch_ams_id = pv_outlet_ams_id

                union all

                select /*+ CARDINALITY(i, 100)*/
                     *
                from dbw_outl_informations i
                where i.dbw_code = 'MAIN'
                    and i.dbw_time = 'MONT'
                    and i.outlet_type = 'OUTL'
                    and i.terminal_date is not null
                    and i.record_date
                        between add_months(var_record_date, -5)
                        and add_months(var_record_date, -1)
                    and i.branch_ams_id = pv_outlet_ams_id
            ) outl_info
                on empl.outlet_ams_id = outl_info.outlet_ams_id;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_umnm_comp] ' || SQLERRM);
                goto procedure_end;
        end;
        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 02/04/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_umnm_close(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
    begin
        -- Buoc 01: Xoa du lieu neu da ton tai
        begin
            loop
                delete /*+ NOLOGGING */ ams_prc_p015_umnm del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_prc_p015_umnm_data del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_prc_p015_umnm_code del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_prc_p015_umnm_empl del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_umnm_close] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 08/04/2014
        Version: 1.0
        Description: Thang tien TN -> TB
        Parameter:
        Update:
    */
    procedure mmxv_modl_amnp(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
    begin
        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 08/04/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_amnp_open(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
        var_record_date date := trunc(pd_realize_date, 'MM');
        var_cur_date date := trunc(sysdate, 'MM');

        var_cond_date date := least(var_record_date, var_cur_date);
    begin
        -- Buoc 01: Xoa du lieu neu da ton tai
        begin
            loop
                delete /*+ NOLOGGING */ ams_prc_p015_amnp del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_prc_p015_amnp_data del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_prc_p015_amnp_umdv del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_amnp_open] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 02: Ghi nhan du lieu duoc xu ly
        begin
            -- Buoc 02.A: Ghi nhan du lieu truong nhom duoc xu ly
            insert /*+ APPEND */ into ams_prc_p015_amnp nologging (
                session_id,
                record_date,
                outlet_ams_id,
                branch_ams_id,
                unit_ams_id,
                effe_date,
                term_date,
                regency_code,
                regency_date,
                seniority,
                period_fyp,
                period_afif,
                period_afis,
                period_pr36,
                period_acti,
                numb_dev_unit,
                amnp_asmt
             )
            select /*+ CARDINALITY(outl, 100)*/
                pn_session_id,
                var_record_date,
                outl.outlet_ams_id,
                outl.branch_ams_id,
                outl.unit_ams_id,
                outl.effe_date,
                outl.term_date,
                outl.regency_code,
                outl.regency_date,
                round(
                    months_between(
                       add_months(var_record_date, 1),
                       trunc(outl.regency_date, 'MM')
                    )
                ),
                0,
                0,
                0,
                0,
                0,
                0,
                'M'
            from
            (
                select *
                from ams_prc_outlets o
                where o.session_id = pn_session_id
                    and o.record_date = var_cond_date
                    and o.branch_ams_id = pv_outlet_ams_id
                    and o.term_date is null
                    and o.regency_code in ('CV02')
            )outl;
            commit;

            -- Buoc 02.B: Cac truong nhom duoc phat trien trong vong 24 thang
            insert /*+ APPEND */ into ams_prc_p015_amnp_umdv nologging (
                session_id,
                record_date,
                outlet_ams_id,
                branch_ams_id,
                unit_ams_id,
                effe_date,
                term_date,
                regency_code,
                regency_date,
                amnp_outlet_ams_id,
                amnp_unit_ams_id
            )
            select
                pn_session_id,
                var_record_date,
                outl.outlet_ams_id,
                outl.branch_ams_id,
                outl.unit_ams_id,
                outl.effe_date,
                outl.term_date,
                outl.regency_code,
                outl.regency_date,
                AMS_MODL_OFUNCTIONS.dbwg_dev_units(outl.outlet_ams_id,
                    outl.regency_date),
                AMS_MODL_OFUNCTIONS.dbwg_unit_ams_id(outl.outlet_ams_id,
                    outl.regency_date -1)
            from ams_prc_outlets outl
            where outl.session_id = pn_session_id
                and outl.record_date = var_cond_date
                and outl.branch_ams_id = pv_outlet_ams_id
                and outl.regency_code in ('CV02')
                and outl.regency_date >= add_months(var_record_date, -23);
            commit;

            -- Buoc 02.C: Cac dai ly truc tiep lam viec trong tung thang
            for i in -11..0
            loop
                if (var_cond_date >= add_months(var_record_date, i)) then
                    -- Buoc 02.C.01: Thuoc nhom truc tiep
                    insert /*+ APPEND */ into ams_prc_p015_amnp_data (
                       session_id,
                       record_date,
                       data_date,
                       data_type,
                       outlet_ams_id,
                       branch_ams_id,
                       agency_ams_id,
                       unit_ams_id,
                       effe_date,
                       term_date,
                       regency_code,
                       amnp_outlet_ams_id,
                       amnp_unit_ams_id,
                       period_fyp,
                       period_afif,
                       period_afis,
                       period_issu,
                       period_acti
                    )
                    select /*+CARDINALITY(amnp, 100)
                              CARDINALITY(outl, 100)*/
                       pn_session_id,
                       var_record_date,
                       add_months(var_record_date, i),
                       'DIRE',
                       outl.outlet_ams_id,
                       outl.branch_ams_id,
                       outl.agency_ams_id,
                       outl.unit_ams_id,
                       outl.effe_date,
                       outl.term_date,
                       outl.regency_code,
                       amnp.outlet_ams_id,
                       amnp.unit_ams_id,
                       0,
                       0,
                       0,
                       0,
                       0
                    from
                    (
                        select /*+ CARDINALITY(a, 100)*/
                            *
                        from ams_prc_p015_amnp a
                        where a.session_id = pn_session_id
                            and a.record_date = var_record_date
                            and a.branch_ams_id = pv_outlet_ams_id
                    ) amnp
                    join
                    (
                        select /*+ CARDINALITY(o, 100)*/
                            *
                        from ams_prc_outlets o
                        where o.session_id = pn_session_id
                            and o.record_date = add_months(var_record_date, i)
                            and o.branch_ams_id = pv_outlet_ams_id
                    ) outl
                       on amnp.unit_ams_id = outl.unit_ams_id;
                    commit;

                    -- Buoc 02.C.02: Thuoc nhom duoc phat trien
                    insert /*+ APPEND */ into ams_prc_p015_amnp_data (
                       session_id,
                       record_date,
                       data_date,
                       data_type,
                       outlet_ams_id,
                       branch_ams_id,
                       agency_ams_id,
                       unit_ams_id,
                       effe_date,
                       term_date,
                       regency_code,
                       amnp_outlet_ams_id,
                       amnp_unit_ams_id,
                       period_fyp,
                       period_afif,
                       period_afis,
                       period_issu,
                       period_acti
                    )
                    select /*+CARDINALITY(amnp, 100)
                              CARDINALITY(umdv, 100)
                              CARDINALITY(outl, 100)*/
                       pn_session_id,
                       var_record_date,
                       add_months(var_record_date, i),
                       'INDI',
                       outl.outlet_ams_id,
                       outl.branch_ams_id,
                       outl.agency_ams_id,
                       outl.unit_ams_id,
                       outl.effe_date,
                       outl.term_date,
                       outl.regency_code,
                       amnp.outlet_ams_id,
                       amnp.unit_ams_id,
                       0,
                       0,
                       0,
                       0,
                       0
                    from
                    (
                       select /*+ CARDINALITY(a, 100)*/
                           *
                       from ams_prc_p015_amnp a
                       where a.session_id = pn_session_id
                           and a.record_date = var_record_date
                           and a.branch_ams_id = pv_outlet_ams_id
                    ) amnp
                    join
                    (
                       select /*+ CARDINALITY(u, 100)*/
                           *
                       from ams_prc_p015_amnp_umdv u
                       where u.session_id = pn_session_id
                           and u.record_date = var_record_date
                           and u.branch_ams_id = pv_outlet_ams_id
                           and u.amnp_outlet_ams_id is not null
                           and u.amnp_unit_ams_id is not null
                    ) umdv
                        on amnp.outlet_ams_id = umdv.amnp_outlet_ams_id
                    join
                    (
                       select /*+ CARDINALITY(o, 100)*/
                           *
                       from ams_prc_outlets o
                       where o.session_id = pn_session_id
                           and o.record_date = add_months(var_record_date, i)
                           and o.branch_ams_id = pv_outlet_ams_id
                    ) outl
                        on outl.unit_ams_id = umdv.unit_ams_id
                    where add_months(var_record_date, i) >= umdv.regency_date;
                    commit;
                end if;
            end loop;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_amnp_open] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 08/04/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_amnp_data(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
        var_record_date date := trunc(pd_realize_date, 'MM');
        var_cur_date date := trunc(sysdate, 'MM');

        var_cond_date date := least(var_record_date, var_cur_date);
    begin
        -- Buoc 01: Chi tiet du lieu
        begin
           -- Buoc 01.A: Ghi nhan du lieu [RFYP]
           merge /*+CARDINALITY(amnp, 100)
                    CARDINALITY(upd, 100)*/
               into ams_prc_p015_amnp_data amnp
           using
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_ams_id,
                        tmp.record_date,
                        tmp.data_value
                    from ams_prc_data tmp
                    where tmp.session_id = pn_session_id
                        and tmp.module_code = 'PROM'
                        and tmp.branch_ams_id = pv_outlet_ams_id
                        and tmp.record_date
                            between add_months(var_record_date, -11)
                            and var_cond_date
                        and tmp.data_code = 'RFYP'
                ) upd
           on (
                pn_session_id = amnp.session_id
                and
                var_record_date = amnp.record_date
                and
                upd.record_date = amnp.data_date
                and
                upd.outlet_ams_id = amnp.outlet_ams_id
           )
           when matched then
              update /*+ NOLOGGING */
                  set
                      amnp.period_fyp = nvl(upd.data_value, 0);
           commit;

           -- Buoc 01.B: Ghi nhan du lieu [ISSU]
           merge /*+CARDINALITY(amnp, 100)
                    CARDINALITY(upd, 100)*/
               into ams_prc_p015_amnp_data amnp
           using
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_ams_id,
                        tmp.record_date,
                        tmp.data_value period_issu,
                        case
                            when nvl(tmp.data_value, 0) > 0 then
                                1
                            else
                                0
                            end period_acti
                    from ams_prc_data tmp
                    where tmp.session_id = pn_session_id
                        and tmp.module_code = 'PROM'
                        and tmp.record_date
                            between add_months(var_record_date, -11)
                            and var_cond_date
                        and tmp.branch_ams_id = pv_outlet_ams_id
                        and tmp.data_code = 'EFAC'
                ) upd
           on (
                pn_session_id = amnp.session_id
                and
                var_record_date = amnp.record_date
                and
                upd.record_date = amnp.data_date
                and
                'DIRE' = amnp.data_type
                and
                upd.outlet_ams_id = amnp.outlet_ams_id
           )
           when matched then
              update /*+ NOLOGGING */
                  set
                      amnp.period_issu = nvl(upd.period_issu, 0),
                      amnp.period_acti = nvl(upd.period_acti, 0);
           commit;

           -- Buoc 02.C: Ghi nhan du lieu [RAFIF, AFIS]
           merge /*+CARDINALITY(amnp, 100)
                    CARDINALITY(upd, 100)*/
               into ams_prc_p015_amnp_data amnp
           using
                (
                    select /*+ CARDINALITY(outl, 100)
                               CARDINALITY(rafif, 100)
                               CARDINALITY(rafis, 100)*/
                        outl.outlet_ams_id,
                        rafif.data_value data_rafif,
                        rafis.data_value data_rafis
                    from
                    (
                        select /*+ CARDINALITY(tmp, 100)*/
                            tmp.record_date,
                            tmp.outlet_ams_id
                        from ams_prc_p015_amnp_data tmp
                        where tmp.session_id = pn_session_id
                            and tmp.record_date = var_record_date
                            and tmp.data_date = var_cond_date
                            and tmp.branch_ams_id = pv_outlet_ams_id
                            and tmp.data_type = 'DIRE'
                    ) outl
                    left join
                    (
                        select /*+ CARDINALITY(tmp, 100)*/
                            tmp.outlet_ams_id,
                            tmp.data_value
                        from ams_prc_data tmp
                        where tmp.session_id = pn_session_id
                          and tmp.record_date = var_cond_date
                          and tmp.branch_ams_id = pv_outlet_ams_id
                          and tmp.module_code = 'PROM'
                          and tmp.data_code = 'IFAP'
                    ) rafif
                        on rafif.outlet_ams_id = outl.outlet_ams_id
                    left join
                    (
                        select /*+ CARDINALITY(tmp, 100)*/
                            tmp.outlet_ams_id,
                            tmp.data_value
                        from ams_prc_data tmp
                        where tmp.session_id = pn_session_id
                          and tmp.record_date = var_cond_date
                          and tmp.branch_ams_id = pv_outlet_ams_id
                          and tmp.module_code = 'PROM'
                          and tmp.data_code = 'ISAP'
                    ) rafis
                        on rafis.outlet_ams_id = outl.outlet_ams_id
                ) upd
           on (
                pn_session_id = amnp.session_id
                and
                var_record_date = amnp.record_date
                and
                var_cond_date = amnp.data_date
                and
                upd.outlet_ams_id = amnp.outlet_ams_id
           )
           when matched then
              update /*+ NOLOGGING */
                  set
                      amnp.period_afif = nvl(upd.data_rafif, 0),
                      amnp.period_afis = nvl(upd.data_rafis, 0);
           commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_amnp_data] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 02: Tong hop du lieu
        begin
            -- Buoc 02.A: Tong hop FYP
            merge/*+CARDINALITY(amnp, 100)
                    CARDINALITY(upd, 100)*/
                into ams_prc_p015_amnp amnp
            using
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.amnp_outlet_ams_id outlet_ams_id,
                        tmp.amnp_unit_ams_id,
                        sum(tmp.period_fyp) period_fyp
                    from ams_prc_p015_amnp_data tmp
                    where tmp.session_id = pn_session_id
                        and tmp.record_date = var_record_date
                        and tmp.branch_ams_id = pv_outlet_ams_id
                        and tmp.outlet_ams_id <> tmp.amnp_outlet_ams_id
                        and tmp.data_date
                            between add_months(var_record_date, -11)
                            and var_cond_date
                        and tmp.amnp_outlet_ams_id is not null
                        and tmp.amnp_unit_ams_id is not null
                    group by
                        tmp.amnp_outlet_ams_id,
                        tmp.amnp_unit_ams_id
                ) upd
            on (
                pn_session_id = amnp.session_id
                and
                var_record_date = amnp.record_date
                and
                upd.outlet_ams_id = amnp.outlet_ams_id
            )
            when matched then
                update /*+ NOLOGGING */
                    set
                        amnp.period_fyp = nvl(upd.period_fyp, 0);
            commit;

            -- Buoc 02.B: Tong hop AFIS, AFIS
            merge/*+CARDINALITY(amnp, 100)
                    CARDINALITY(upd, 100)*/
                into ams_prc_p015_amnp amnp
            using
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.amnp_outlet_ams_id outlet_ams_id,
                        tmp.amnp_unit_ams_id,
                        sum(nvl(tmp.period_afif, 0)) period_afif,
                        sum(nvl(tmp.period_afis, 0)) period_afis
                    from ams_prc_p015_amnp_data tmp
                    where tmp.session_id = pn_session_id
                        and tmp.record_date = var_record_date
                        and tmp.branch_ams_id = pv_outlet_ams_id
                        and tmp.data_date = var_cond_date
                        and tmp.data_type = 'DIRE'
                    group by
                        tmp.amnp_outlet_ams_id,
                        tmp.amnp_unit_ams_id
                ) upd
            on (
                pn_session_id = amnp.session_id
                and
                var_record_date = amnp.record_date
                and
                upd.outlet_ams_id = amnp.outlet_ams_id
            )
            when matched then
                update /*+ NOLOGGING */
                    set
                        amnp.period_afif = nvl(upd.period_afif, 0),
                        amnp.period_afis = nvl(upd.period_afis, 0),
                        amnp.period_pr36 =
                            decode(nvl(upd.period_afis, 0),
                                0, 100,
                                round(
                                    nvl(upd.period_afif, 0) / nvl(upd.period_afis, 0) * 100,
                                    2
                                )
                            );
            commit;

            -- Buoc 02.C: So luot hoat dong
            merge /*+CARDINALITY(amnp, 100)
                     CARDINALITY(upd, 100)*/
                into ams_prc_p015_amnp amnp
            using
                (
                    select
                        am.amnp_outlet_ams_id outlet_ams_id,
                        nvl(count(*), 0) period_acti
                    from ams_prc_p015_amnp_data am
                    where am.session_id = pn_session_id
                        and am.record_date = var_record_date
                        and am.branch_ams_id = pv_outlet_ams_id
                        and am.data_type = 'DIRE'
                        and am.data_date
                            between add_months(var_record_date, -11)
                            and var_cond_date
                        and nvl(am.period_acti, 0) > 0
                    group by
                        am.amnp_outlet_ams_id
                ) upd
            on (
                pn_session_id = amnp.session_id
                and
                var_record_date = amnp.record_date
                and
                upd.outlet_ams_id = amnp.outlet_ams_id
            )
            when matched then
                update /*+ NOLOGGING */
                    set
                        amnp.period_acti = nvl(upd.period_acti, 0);
            commit;

            -- Buoc 02.D: So nhom gian tiep
            merge /*+CARDINALITY(amnp, 100)
                     CARDINALITY(upd, 100)*/
                 into ams_prc_p015_amnp amnp
            using
                 (
                    select /*+ CARDINALITY(s, 100)*/
                        s.amnp_unit_ams_id,
                        nvl(sum(s.units), 0) numb_dev_unit
                    from
                    (
                        select /*+ CARDINALITY(umdv, 100)*/
                            umdv.amnp_unit_ams_id,
                            nvl(count(*), 0) units
                        from ams_prc_p015_amnp_umdv umdv
                        where umdv.session_id = pn_session_id
                            and umdv.record_date = var_record_date
                            and umdv.branch_ams_id = pv_outlet_ams_id
                            and umdv.amnp_outlet_ams_id is not null
                            and umdv.amnp_unit_ams_id is not null
                        group by umdv.amnp_unit_ams_id

                        union all

                        select /*+ CARDINALITY(umnp, 100)*/
                            umnp.unit_ams_id amnp_unit_ams_id,
                            nvl(count(*), 0) units
                        from ams_con_p015_umnp umnp
                        where umnp.record_date = var_record_date
                            and umnp.branch_ams_id = pv_outlet_ams_id
                            and umnp.umnp_asmt = 'P'
                        group by umnp.unit_ams_id

                        union all

                        select /*+ CARDINALITY(dev, 100)
                                   CARDINALITY(depo, 100)*/
                            dev.amnp_unit_ams_id,
                            -nvl(count(*), 0) units
                        from
                        (
                            select /*+ CARDINALITY(u, 100)*/
                                 u.outlet_ams_id,
                                 u.amnp_unit_ams_id
                            from ams_prc_p015_amnp_umdv u
                            where u.session_id = pn_session_id
                                and u.record_date = var_record_date
                                and u.branch_ams_id = pv_outlet_ams_id
                                and u.amnp_outlet_ams_id is not null
                                and u.amnp_unit_ams_id is not null
                        ) dev
                        join
                        (
                            select /*+ CARDINALITY(umnm, 100)*/
                                 umnm.outlet_ams_id
                            from ams_con_p015_umnm umnm
                            where umnm.record_date = var_record_date
                                and umnm.branch_ams_id = pv_outlet_ams_id
                                and umnm.umnm_asmt = 'D'
                        ) depo
                            on depo.outlet_ams_id = dev.outlet_ams_id
                        group by dev.amnp_unit_ams_id
                    ) s
                    group by s.amnp_unit_ams_id
                 ) upd
            on (
                 pn_session_id = amnp.session_id
                 and
                 var_record_date = amnp.record_date
                 and
                 upd.amnp_unit_ams_id = amnp.unit_ams_id
            )
            when matched then
                 update /*+ NOLOGGING */
                     set
                         amnp.numb_dev_unit = nvl(upd.numb_dev_unit, 0);
            commit;

            -- Buoc 02.F: Ghi nhan chung chi
            merge /*+CARDINALITY(amnp, 100)
                     CARDINALITY(upd, 100)*/
                into ams_prc_p015_amnp amnp
            using
                (
                    select
                        cerf.outlet_ams_id
                    from
                    (
                        select b.outlet_ams_id
                        from ams.ams_prc_blocks b
                        where b.session_id = pn_session_id
                            and b.record_date = var_record_date
                            and b.module_code = 'PROM'
                            and b.data_code = 'BTC1' -- Chung chi Bao Viet tam cao 1
                            and b.from_date <= last_day(var_record_date)
                        intersect
                        select b.outlet_ams_id
                        from ams.ams_prc_blocks b
                        where b.session_id = pn_session_id
                            and b.record_date = var_record_date
                            and b.module_code = 'PROM'
                            and b.data_code = 'BTC2' -- Chung chi Bao Viet tam cao 2
                            and b.from_date <= last_day(var_record_date)
                        intersect
                        select b.outlet_ams_id
                        from ams.ams_prc_blocks b
                        where b.session_id = pn_session_id
                            and b.record_date = var_record_date
                            and b.module_code = 'PROM'
                            and b.data_code = 'BTC3' -- Chung chi Bao Viet tam cao 3
                            and b.from_date <= last_day(var_record_date)
                        intersect
                        select b.outlet_ams_id
                        from ams.ams_prc_blocks b
                        where b.session_id = pn_session_id
                            and b.record_date = var_record_date
                            and b.module_code = 'PROM'
                            and b.data_code = 'BTC4' -- Chung chi Bao Viet tam cao 4
                            and b.from_date <= last_day(var_record_date)
                    ) cerf
                ) upd
            on (
                pn_session_id = amnp.session_id
                and
                var_record_date = amnp.record_date
                and
                upd.outlet_ams_id = amnp.outlet_ams_id
            )
            when matched then
                update /*+ NOLOGGING */
                    set
                        amnp.is_certificate = AMS_CORE_CODE.VALUE_YES;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_amnp_data] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 08/04/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_amnp_cond(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
        var_record_date date := trunc(pd_realize_date, 'MM');
        var_cur_date date := trunc(sysdate, 'MM');

        var_cond_date date := least(var_record_date, var_cur_date);

        var_cond_unit number(5);
        var_cond_fyp number(16,2);
        var_cond_pr36 number(5,2);
        var_cond_acti number(5);
        var_cond_cerf varchar2(16);
        var_cond_prom varchar2(16);
    begin
        -- Buoc 01: Lay thong tin cau hinh
        begin
            var_cond_unit := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/AMNP/UNIT');
            var_cond_fyp := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/AMNP/FYP');
            var_cond_pr36 := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/AMNP/PR36');
            var_cond_acti := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/AMNP/ACTI');
            var_cond_cerf := AMS_MODL_VARIABLE.get_tvar_by_code('/GLOBAL/PROM/P2015/AMNP/CEFT');
            var_cond_prom := AMS_MODL_VARIABLE.get_tvar_by_code('/GLOBAL/PROM/P2015/AMNP/RNEW');
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_amnp_cond] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 02: Xu ly dieu kien thang tien
        begin
            update /*+ NOLOGGING */ ams_prc_p015_amnp amnp
               set amnp.amnp_asmt = 'P',
                   amnp.new_regency_code = var_cond_prom,
                   amnp.new_regency_date = add_months(var_record_date, 1)
            where amnp.session_id = pn_session_id
                and amnp.record_date = var_record_date
                and amnp.branch_ams_id = pv_outlet_ams_id
                and amnp.numb_dev_unit >= var_cond_unit
                and amnp.period_fyp >= var_cond_fyp
                and amnp.period_pr36 >= var_cond_pr36
                and amnp.period_acti>= var_cond_acti
                and nvl(amnp.is_certificate, 'N') in
                    (
                        nvl(var_cond_cerf, 'N'),
                        'Y'
                    );
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_amnp_cond] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 08/04/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_amnp_comp(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
        var_record_date date := trunc(pd_realize_date, 'MM');
        var_cur_date date := trunc(sysdate, 'MM');

        var_cond_date date := least(var_record_date, var_cur_date);
    begin
       -- Buoc 01: Xoa du lieu neu da ton tai
        begin
            loop
                delete /*+ NOLOGGING */ ams_con_p015_amnp del
                where del.record_date = var_record_date
                    and del.branch_ams_id = pv_outlet_ams_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_con_p015_amnp_data del
                where del.record_date = var_record_date
                    and del.branch_ams_id = pv_outlet_ams_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_con_p015_amnp_umdv del
                where del.record_date = var_record_date
                    and del.branch_ams_id = pv_outlet_ams_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_rep_rp1505 del
                where del.record_date = var_record_date
                    and del.branch_ams_id = pv_outlet_ams_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_amnp_comp] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 02: Di chuyen du lieu
        begin
            insert /*+ APPEND */ into ams_con_p015_amnp nologging (
                record_date,
                outlet_ams_id,
                branch_ams_id,
                unit_ams_id,
                effe_date,
                term_date,
                regency_code,
                regency_date,
                seniority,
                period_fyp,
                period_afif,
                period_afis,
                period_pr36,
                period_acti,
                numb_dev_unit,
                amnp_asmt,
                new_regency_code,
                new_regency_date,
                create_user,
                update_user,
                create_datetime,
                update_datetime,
                is_certificate
            )
            select /*+ CARDINALITY(prc, 100)*/
                var_record_date,
                prc.outlet_ams_id,
                prc.branch_ams_id,
                prc.unit_ams_id,
                prc.effe_date,
                prc.term_date,
                prc.regency_code,
                prc.regency_date,
                prc.seniority,
                prc.period_fyp,
                prc.period_afif,
                prc.period_afis,
                prc.period_pr36,
                prc.period_acti,
                prc.numb_dev_unit,
                prc.amnp_asmt,
                prc.new_regency_code,
                prc.new_regency_date,
                pv_user,
                pv_user,
                sysdate,
                sysdate,
                prc.is_certificate
            from ams_prc_p015_amnp prc
            where prc.session_id = pn_session_id
                and prc.record_date = var_record_date
                and prc.branch_ams_id = pv_outlet_ams_id;
            commit;

            insert /*+ APPEND */ into ams_con_p015_amnp_data nologging (
                record_date,
                data_date,
                data_type,
                outlet_ams_id,
                branch_ams_id,
                agency_ams_id,
                unit_ams_id,
                effe_date,
                term_date,
                regency_code,
                amnp_outlet_ams_id,
                amnp_unit_ams_id,
                period_fyp,
                period_afif,
                period_afis,
                period_issu,
                period_acti,
                create_user,
                update_user,
                create_datetime,
                update_datetime
            )
            select /*+ CARDINALITY(prc, 100)*/
                var_record_date,
                prc.data_date,
                prc.data_type,
                prc.outlet_ams_id,
                prc.branch_ams_id,
                prc.agency_ams_id,
                prc.unit_ams_id,
                prc.effe_date,
                prc.term_date,
                prc.regency_code,
                prc.amnp_outlet_ams_id,
                prc.amnp_unit_ams_id,
                prc.period_fyp,
                prc.period_afif,
                prc.period_afis,
                prc.period_issu,
                prc.period_acti,
                pv_user,
                pv_user,
                sysdate,
                sysdate
            from ams_prc_p015_amnp_data prc
            where prc.session_id = pn_session_id
                and prc.branch_ams_id = pv_outlet_ams_id;
            commit;

            insert /*+ APPEND */ into ams_con_p015_amnp_umdv nologging (
                record_date,
                outlet_ams_id,
                branch_ams_id,
                unit_ams_id,
                effe_date,
                term_date,
                regency_code,
                regency_date,
                amnp_outlet_ams_id,
                amnp_unit_ams_id,
                create_user,
                update_user,
                create_datetime,
                update_datetime
            )
            select /*+ CARDINALITY(prc, 100)*/
                var_record_date,
                prc.outlet_ams_id,
                prc.branch_ams_id,
                prc.unit_ams_id,
                prc.effe_date,
                prc.term_date,
                prc.regency_code,
                prc.regency_date,
                prc.amnp_outlet_ams_id,
                prc.amnp_unit_ams_id,
                pv_user,
                pv_user,
                sysdate,
                sysdate
            from ams_prc_p015_amnp_umdv prc
            where prc.session_id = pn_session_id
                and prc.branch_ams_id = pv_outlet_ams_id;
            commit;

            -- Buoc 02.D: Di chuyen du lieu truong nhom
            insert /*+ APPEND */ into ams_rep_rp1505 nologging (
                record_date,
                sort_data,
                sort_branch_name,
                sort_agency_name,
                sort_unit_name,
                sort_outlet_name,
                sort_outlet_ams_id,
                branch_ams_id,
                branch_name,
                agency_ams_id,
                agency_name,
                unit_ams_id,
                unit_name,
                outlet_ams_id,
                outlet_name,
                rege_code,
                rege_date,
                effe_date,
                term_date,
                rp_eunits,
                rp_fyp,
                rp_afis,
                rp_afif,
                rp_pr36,
                rp_oacti,
                rp_cerf,
                rp_code,
                rp_rcode,
                rp_rdate,
                maintain_user,
                maintain_time
            )
            select /*+ CARDINALITY(amnp, 10)
                       CARDINALITY(outl, 10)*/
                var_record_date,
                'P01',
                outl.branch_name,
                outl.agency_name,
                outl.unit_name,
                outl.outlet_name,
                outl.outlet_ams_id,
                outl.branch_ams_id,
                outl.branch_name,
                outl.agency_ams_id,
                outl.agency_name,
                outl.unit_ams_id,
                outl.unit_name,
                outl.outlet_ams_id,
                outl.outlet_name,
                outl.regency_code,
                outl.regency_date,
                outl.effective_date,
                outl.terminal_date,
                amnp.numb_dev_unit,
                amnp.period_fyp,
                amnp.period_afis,
                amnp.period_afif,
                amnp.period_pr36,
                amnp.period_acti,
                amnp.is_certificate,
                amnp.amnp_asmt,
                amnp.new_regency_code,
                amnp.new_regency_date,
                pv_user,
                sysdate
            from
            (
                select *
                from ams_prc_p015_amnp prc
                where prc.session_id = pn_session_id
                    and prc.record_date = var_record_date
                    and prc.branch_ams_id = pv_outlet_ams_id
            ) amnp
            join
            (
                select *
                from dbw_outl_informations dbw
                where dbw.dbw_code = 'MAIN'
                    and dbw.dbw_time = 'MONT'
                    and dbw.outlet_type = 'OUTL'
                    and dbw.record_date = var_cond_date
                    and dbw.branch_ams_id = pv_outlet_ams_id
            ) outl
                on amnp.outlet_ams_id = outl.outlet_ams_id;
            commit;

            -- Buoc 02.E: Di chuyen du lieu phat trien nhom
            insert /*+ APPEND */ into ams_rep_rp1505 nologging (
                record_date,
                sort_data,
                sort_branch_name,
                sort_agency_name,
                sort_unit_name,
                sort_outlet_name,
                sort_outlet_ams_id,
                branch_ams_id,
                agency_ams_id,
                unit_ams_id,
                outlet_ams_id,
                rp_unit_name,
                rp_outlet_ams_id,
                rp_outlet_name,
                rp_rege_code,
                rp_rege_date,
                rp_eunits,
                maintain_user,
                maintain_time
            )
            select /*+ CARDINALITY(amnp, 10)
                       CARDINALITY(outl, 10)*/
                var_record_date,
                'P02',
                amnp_info.branch_name,
                amnp_info.agency_name,
                amnp_info.unit_name,
                amnp_info.outlet_name,
                amnp_info.outlet_ams_id,
                amnp_info.branch_ams_id,
                amnp_info.agency_ams_id,
                amnp_info.unit_ams_id,
                amnp_info.outlet_ams_id,
                unit_info.unit_name,
                unit_info.outlet_ams_id,
                unit_info.outlet_name,
                unit_info.regency_code,
                unit_info.regency_date,
                unit.indx_eunit,
                pv_user,
                sysdate
            from
            (
                select *
                from ams_prc_p015_amnp prc
                where prc.session_id = pn_session_id
                    and prc.record_date = var_record_date
                    and prc.branch_ams_id = pv_outlet_ams_id
            ) amnp
            join
            (
                select *
                from dbw_outl_informations dbw
                where dbw.dbw_code = 'MAIN'
                    and dbw.dbw_time = 'MONT'
                    and dbw.outlet_type = 'OUTL'
                    and dbw.record_date = var_cond_date
                    and dbw.branch_ams_id = pv_outlet_ams_id
            ) amnp_info
                on amnp_info.outlet_ams_id = amnp.outlet_ams_id
            join
            (
                select
                    u.amnp_unit_ams_id,
                    u.outlet_ams_id,
                    case
                        when nvl(pu.umnm_asmt, 'M') in ('D') then
                            0
                        else
                            1
                        end indx_eunit
                from
                (
                    select
                        prc.amnp_unit_ams_id,
                        prc.outlet_ams_id
                    from ams_prc_p015_amnp_umdv prc
                    where prc.session_id = pn_session_id
                        and prc.record_date = var_record_date
                        and prc.branch_ams_id = pv_outlet_ams_id
                        and prc.amnp_outlet_ams_id is not null
                        and prc.amnp_unit_ams_id is not null
                    group by
                        prc.amnp_unit_ams_id,
                        prc.outlet_ams_id
                ) u
                left join
                (
                    select
                         con.outlet_ams_id,
                         con.umnm_asmt
                    from ams_con_p015_umnm con
                    where con.record_date = var_record_date
                        and con.branch_ams_id = pv_outlet_ams_id
                ) pu
                    on pu.outlet_ams_id = u.outlet_ams_id
            ) unit
                on unit.amnp_unit_ams_id = amnp.unit_ams_id
            left join
            (
                select *
                from dbw_outl_informations dbw
                where dbw.dbw_code = 'MAIN'
                    and dbw.dbw_time = 'MONT'
                    and dbw.outlet_type = 'OUTL'
                    and dbw.record_date = var_cond_date
                    and dbw.branch_ams_id = pv_outlet_ams_id
            ) unit_info
                on unit_info.outlet_ams_id = unit.outlet_ams_id;
            commit;

            -- Buoc 02.F: Di chuyen du lieu thang tien truong nhom
            insert /*+ APPEND */ into ams_rep_rp1505 nologging (
                record_date,
                sort_data,
                sort_branch_name,
                sort_agency_name,
                sort_unit_name,
                sort_outlet_name,
                sort_outlet_ams_id,
                branch_ams_id,
                agency_ams_id,
                unit_ams_id,
                outlet_ams_id,
                rp_unit_name,
                rp_outlet_ams_id,
                rp_outlet_name,
                rp_rege_code,
                rp_rege_date,
                rp_eunits,
                maintain_user,
                maintain_time
            )
            select /*+ CARDINALITY(amnp, 10)
                       CARDINALITY(outl, 10)*/
                var_record_date,
                'P03',
                amnp_info.branch_name,
                amnp_info.agency_name,
                amnp_info.unit_name,
                amnp_info.outlet_name,
                amnp_info.outlet_ams_id,
                amnp_info.branch_ams_id,
                amnp_info.agency_ams_id,
                amnp_info.unit_ams_id,
                amnp_info.outlet_ams_id,
                unit_info.unit_name,
                unit_info.outlet_ams_id,
                unit_info.outlet_name,
                unit_info.regency_code,
                unit.new_regency_date,
                unit.indx_eunit,
                pv_user,
                sysdate
            from
            (
                select *
                from ams_prc_p015_amnp prc
                where prc.session_id = pn_session_id
                    and prc.record_date = var_record_date
                    and prc.branch_ams_id = pv_outlet_ams_id
            ) amnp
            join
            (
                select *
                from dbw_outl_informations dbw
                where dbw.dbw_code = 'MAIN'
                    and dbw.dbw_time = 'MONT'
                    and dbw.outlet_type = 'OUTL'
                    and dbw.record_date = var_cond_date
                    and dbw.branch_ams_id = pv_outlet_ams_id
            ) amnp_info
                on amnp_info.outlet_ams_id = amnp.outlet_ams_id
            join
            (
                select
                    con.unit_ams_id,
                    con.outlet_ams_id,
                    1 indx_eunit,
                    con.new_regency_date
                from ams_con_p015_umnp con
                where con.record_date = var_record_date
                    and con.branch_ams_id = pv_outlet_ams_id
                    and con.umnp_asmt = 'P'
            ) unit
                on unit.unit_ams_id = amnp.unit_ams_id
            left join
            (
                select *
                from dbw_outl_informations dbw
                where dbw.dbw_code = 'MAIN'
                    and dbw.dbw_time = 'MONT'
                    and dbw.outlet_type = 'OUTL'
                    and dbw.record_date = var_cond_date
                    and dbw.branch_ams_id = pv_outlet_ams_id
            ) unit_info
                on unit_info.outlet_ams_id = unit.outlet_ams_id;
            commit;

            -- Buoc 02.G: Di chuyen du lieu dai ly truc tiep
            insert /*+ APPEND */ into ams_rep_rp1505 nologging (
                record_date,
                sort_data,
                sort_branch_name,
                sort_agency_name,
                sort_unit_name,
                sort_outlet_name,
                sort_outlet_ams_id,
                branch_ams_id,
                agency_ams_id,
                unit_ams_id,
                outlet_ams_id,
                rp_outlet_ams_id,
                rp_outlet_name,
                rp_rege_code,
                rp_rege_date,
                rp_term_date,
                rp_fyp,
                rp_afis,
                rp_afif,
                rp_oacti,
                maintain_user,
                maintain_time
            )
            select /*+ CARDINALITY(amnp, 10)
                       CARDINALITY(outl, 10)*/
                var_record_date,
                'P04',
                amnp_info.branch_name,
                amnp_info.agency_name,
                amnp_info.unit_name,
                amnp_info.outlet_name,
                amnp_info.outlet_ams_id,
                amnp_info.branch_ams_id,
                amnp_info.agency_ams_id,
                amnp_info.unit_ams_id,
                amnp_info.outlet_ams_id,
                outl_info.outlet_ams_id,
                outl_info.outlet_name,
                outl_info.regency_code,
                outl_info.effective_date,
                outl_info.terminal_date,
                outl.period_fyp,
                outl.period_afis,
                outl.period_afif,
                outl.period_acti,
                pv_user,
                sysdate
            from
            (
                select *
                from ams_prc_p015_amnp prc
                where prc.session_id = pn_session_id
                    and prc.record_date = var_record_date
                    and prc.branch_ams_id = pv_outlet_ams_id
            ) amnp
            join
            (
                select *
                from dbw_outl_informations dbw
                where dbw.dbw_code = 'MAIN'
                    and dbw.dbw_time = 'MONT'
                    and dbw.outlet_type = 'OUTL'
                    and dbw.record_date = var_cond_date
                    and dbw.branch_ams_id = pv_outlet_ams_id
            ) amnp_info
                on amnp_info.outlet_ams_id = amnp.outlet_ams_id
            join
            (
                select
                    prc.unit_ams_id,
                    prc.outlet_ams_id,
                    sum(nvl(prc.period_fyp, 0)) period_fyp,
                    sum(nvl(prc.period_afif, 0)) period_afif,
                    sum(nvl(prc.period_afis, 0)) period_afis,
                    sum(nvl(prc.period_acti, 0)) period_acti
                from ams_prc_p015_amnp_data prc
                where prc.session_id = pn_session_id
                    and prc.record_date = var_record_date
                    and prc.branch_ams_id = pv_outlet_ams_id
                    and prc.data_type = 'DIRE'
                    and prc.data_date
                        between add_months(var_record_date, -11)
                        and var_cond_date
                group by
                    prc.unit_ams_id,
                    prc.outlet_ams_id
            ) outl
                on outl.unit_ams_id = amnp.unit_ams_id
            left join
            (
                select *
                from dbw_outl_informations dbw
                where dbw.dbw_code = 'MAIN'
                    and dbw.dbw_time = 'MONT'
                    and dbw.outlet_type = 'OUTL'
                    and dbw.record_date = var_cond_date
                    and dbw.branch_ams_id = pv_outlet_ams_id
                union all
                select *
                from dbw_outl_informations dbw
                where dbw.dbw_code = 'MAIN'
                    and dbw.dbw_time = 'MONT'
                    and dbw.outlet_type = 'OUTL'
                    and dbw.record_date
                        between add_months(var_record_date, -11)
                        and add_months(var_cond_date, -1)
                    and dbw.branch_ams_id = pv_outlet_ams_id
                    and dbw.terminal_date is not null
            ) outl_info
                on outl_info.outlet_ams_id = outl.outlet_ams_id;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_amnp_comp] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 08/04/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_amnp_close(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
    begin
        -- Buoc 01: Xoa du lieu neu da ton tai
        begin
            loop
                delete /*+ NOLOGGING */ ams_prc_p015_amnp del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_prc_p015_amnp_data del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;

            loop
                delete /*+ NOLOGGING */ ams_prc_p015_amnp_umdv del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;

            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_amnp_close] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 08/04/2015
        Version: 1.0
        Description: Duy tri TB
        Parameter:
        Update: AnhNH- Them dieu kien chung chi
    */
    procedure mmxv_modl_amnm(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
    begin
        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 08/04/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
        Update: Chinhlk
            Date Update: 05/12/2014
            Version: 1.2
            Description: Xet lai tuyen dung thuan cua ban va ca nhan truong ban theo ID 166493
    */
    procedure mmxv_modl_amnm_open(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
        var_record_date date := trunc(pd_realize_date, 'MM');
        var_cur_date date := trunc(sysdate, 'MM');

        var_cond_date date := least(var_record_date, var_cur_date);
    begin
        -- Buoc 01: Xoa du lieu neu da ton tai
        begin
            loop
                delete /*+ NOLOGGING */ ams_prc_p015_amnm del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_prc_p015_amnm_units del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_prc_p015_amnm_outlets del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_prc_p015_amnm_agencies del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_amnm_open] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 02: Ghi nhan du lieu duoc xu ly
        begin
            -- Buoc 02.A: Danh sach truong ban
            insert /*+ APPEND */ into ams_prc_p015_amnm nologging (
                session_id,
                record_date,
                outlet_ams_id,
                branch_ams_id,
                agency_ams_id,
                effe_date,
                reg_code,
                reg_date,
                seni_months,
                amnm_code
             )
            select /*+ CARDINALITY(outl, 100)*/
                pn_session_id,
                var_record_date,
                outl.outlet_ams_id,
                outl.branch_ams_id,
                outl.agency_ams_id,
                outl.effe_date,
                outl.regency_code,
                outl.regency_date,
                round(
                    months_between(
                       add_months(var_record_date, 1),
                       trunc(outl.regency_date, 'MM')
                    )
                ),
                'M'
            from
            (
                select *
                from ams_prc_outlets o
                where o.session_id = pn_session_id
                    and o.record_date = var_cond_date
                    and o.branch_ams_id = pv_outlet_ams_id
                    and o.term_date is null
                    and o.regency_code in ('CV04')
            ) outl;
            commit;

            -- Buoc 02.B: Chi tiet du lieu tung thang
            for i in -11..0
            loop
                if (var_cond_date >= add_months(var_record_date, i)) then
                    -- Buoc 02.B.01: Chi tiet nhom
                    insert /*+ APPEND */ into ams_prc_p015_amnm_units nologging (
                        session_id,
                        record_date,
                        outlet_ams_id,
                        data_code,
                        data_date,
                        branch_ams_id,
                        agency_ams_id,
                        unit_ams_id,
                        ulevel,
                        indx_fyp,
                        amnm_outlet_ams_id,
                        amnm_agency_ams_id
                    )
                    select
                        pn_session_id,
                        var_record_date,
                        ounit.outlet_ams_id,
                        'D',
                        add_months(var_record_date, i),
                        unit.branch_ams_id,
                        unit.agency_ams_id,
                        unit.unit_ams_id,
                        AMS_MODL_UNITS.dbw_cur_level_unit(unit.agency_ams_id,
                            unit.unit_ams_id,
                            add_months(var_record_date, i)),
                        0,
                        amnm.outlet_ams_id,
                        amnm.agency_ams_id
                    from
                    (
                        select *
                        from ams_prc_p015_amnm tmp
                        where tmp.session_id = pn_session_id
                            and tmp.record_date = var_record_date
                            and tmp.branch_ams_id = pv_outlet_ams_id
                    ) amnm
                    join
                    (
                        select *
                        from dbw_outl_informations i
                        where i.dbw_code = 'MAIN'
                            and i.dbw_time = 'MONT'
                            and i.outlet_type = 'NHOM'
                            and i.branch_ams_id = pv_outlet_ams_id
                            and i.record_date = add_months(var_record_date, i)
                    ) unit
                        on unit.agency_ams_id = amnm.agency_ams_id
                    left join
                    (
                        select *
                        from dbw_outl_informations i
                        where i.dbw_code = 'MAIN'
                            and i.dbw_time = 'MONT'
                            and i.outlet_type = 'OUTL'
                            and i.branch_ams_id = pv_outlet_ams_id
                            and i.record_date = add_months(var_record_date, i)
                            and i.regency_code in ('CV02')
                    ) ounit
                        on ounit.unit_ams_id = unit.unit_ams_id;
                    commit;

                    -- Buoc 02.B.02: Chi tiet dai ly
                    insert /*+ APPEND */ into ams_prc_p015_amnm_outlets nologging (
                        session_id,
                        record_date,
                        data_code,
                        data_date,
                        outlet_ams_id,
                        branch_ams_id,
                        agency_ams_id,
                        unit_ams_id,
                        reg_code,
                        effe_date,
                        term_date,
                        empl_ams_id,
                        indx_fyp,
                        indx_onew_acti,
                        indx_issu,
                        indx_acti
                    )
                    select /*+CARDINALITY(outl, 100)*/
                        pn_session_id,
                        var_record_date,
                        'D',
                        add_months(var_record_date, i),
                        outl.outlet_ams_id,
                        outl.branch_ams_id,
                        outl.agency_ams_id,
                        outl.unit_ams_id,
                        outl.regency_code,
                        outl.effe_date,
                        outl.term_date,
                        outl.employment_ams_id,
                        0,
                        0,
                        0,
                        0
                    from
                    (
                        select /*+ CARDINALITY(o, 100)*/
                            *
                        from ams_prc_outlets o
                        where o.session_id = pn_session_id
                            and o.record_date = add_months(var_record_date, i)
                            and o.branch_ams_id = pv_outlet_ams_id
                    ) outl;
                    commit;

                    -- Buoc 02.B.03: Chi tiet tach ban
                    insert /*+ APPEND */ into ams_prc_p015_amnm_agencies nologging (
                        session_id,
                        record_date,
                        data_code,
                        data_date,
                        outlet_ams_id,
                        branch_ams_id,
                        agency_ams_id,
                        indx_fyp,
                        indx_acti,
                        indx_agens,
                        amnm_outlet_ams_id,
                        amnm_agency_ams_id
                    )
                    select
                        pn_session_id,
                        var_record_date,
                        'D',
                        add_months(var_record_date, i),
                        outl.outlet_ams_id,
                        outl.branch_ams_id,
                        outl.agency_ams_id,
                        0,
                        0,
                        0,
                        AMS_MODL_OFUNCTIONS.dbwg_dev_agens(outl.outlet_ams_id,
                            outl.regency_date),
                        AMS_MODL_OFUNCTIONS.dbwg_agency_ams_id(outl.outlet_ams_id,
                            outl.regency_date - 1)
                    from
                    (
                        select *
                        from dbw_outl_informations i
                        where i.dbw_code = 'MAIN'
                            and i.dbw_time = 'MONT'
                            and i.outlet_type = 'OUTL'
                            and i.branch_ams_id = pv_outlet_ams_id
                            and i.record_date = add_months(var_record_date, i)
                            and i.regency_code in ('CV04')
                            and round(
                                months_between(
                                    add_months(var_record_date, 1),
                                    trunc(i.regency_date, 'MM')
                                )
                            ) <= 12
                    ) outl;
                    commit;
                end if;
            end loop;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_amnp_open] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 08/04/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_amnm_data(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
        var_record_date date := trunc(pd_realize_date, 'MM');
        var_cur_date date := trunc(sysdate, 'MM');

        var_cond_date date := least(var_record_date, var_cur_date);
    begin
        -- Buoc 01: Chi tiet du lieu
        begin
           -- Buoc 01.A: Ghi nhan du lieu [RFYP]
           merge /*+CARDINALITY(amnm, 100)
                    CARDINALITY(upd, 100)*/
               into ams_prc_p015_amnm_outlets amnm
           using
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_ams_id,
                        tmp.record_date data_date,
                        tmp.data_value indx_fyp
                    from ams_prc_data tmp
                    where tmp.session_id = pn_session_id
                        and tmp.module_code = 'PROM'
                        and tmp.record_date
                            between add_months(var_record_date, -11)
                            and var_record_date
                        and tmp.branch_ams_id = pv_outlet_ams_id
                        and tmp.data_code = 'RFYP'
                ) upd
           on (
                pn_session_id = amnm.session_id
                and
                var_record_date = amnm.record_date
                and
                upd.data_date = amnm.data_date
                and
                upd.outlet_ams_id = amnm.outlet_ams_id
           )
           when matched then
              update /*+ NOLOGGING */
                  set
                      amnm.indx_fyp = nvl(upd.indx_fyp, 0);
           commit;

           -- Buoc 01.B: Ghi nhan du lieu phat hanh thuan
           merge /*+CARDINALITY(amnm, 100)
                    CARDINALITY(upd, 100)*/
               into ams_prc_p015_amnm_outlets amnm
           using
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_ams_id,
                        tmp.record_date data_date,
                        tmp.data_value indx_issu,
                        case
                            when nvl(tmp.data_value, 0) > 0 then
                                1
                            else
                                0
                            end indx_acti
                    from ams_prc_data tmp
                    where tmp.session_id = pn_session_id
                        and tmp.record_date
                            between add_months(var_record_date, -11)
                            and var_record_date
                        and tmp.branch_ams_id = pv_outlet_ams_id
                        and tmp.module_code = 'PROM'
                        and tmp.data_code = 'EFAC'
                ) upd
           on (
                pn_session_id = amnm.session_id
                and
                var_record_date = amnm.record_date
                and
                upd.data_date = amnm.data_date
                and
                upd.outlet_ams_id = amnm.outlet_ams_id
           )
           when matched then
              update /*+ NOLOGGING */
                  set
                      amnm.indx_issu = nvl(upd.indx_issu, 0),
                      amnm.indx_acti = nvl(upd.indx_acti, 0);
           commit;

           -- Buoc 01.C: Ghi nhan du lieu dai ly 90 ngay tuoi hoat dong
           merge /*+CARDINALITY(amnm, 100)
                    CARDINALITY(upd, 100)*/
               into ams_prc_p015_amnm_outlets amnm
           using
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_ams_id,
                        tmp.record_date data_date,
                        tmp.data_value indx_onew_acti
                    from ams_prc_data tmp
                    where tmp.session_id = pn_session_id
                        and tmp.record_date
                            between add_months(var_record_date, -11)
                            and var_record_date
                        and tmp.branch_ams_id = pv_outlet_ams_id
                        and tmp.module_code = 'PROM'
                        and tmp.data_code = 'NACTI'
                ) upd
           on (
                pn_session_id = amnm.session_id
                and
                var_record_date = amnm.record_date
                and
                upd.data_date = amnm.data_date
                and
                upd.outlet_ams_id = amnm.outlet_ams_id
           )
           when matched then
              update /*+ NOLOGGING */
                  set
                      amnm.indx_onew_acti = nvl(upd.indx_onew_acti, 0);
           commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_amnm_data] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 02: Tong hop du lieu
        begin
            -- Buoc 02.A: Tong hop du lieu nhom
            merge/*+CARDINALITY(amnm, 100)
                    CARDINALITY(upd, 100)*/
                into ams_prc_p015_amnm_units amnm
            using
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.unit_ams_id,
                        tmp.data_date,
                        sum(nvl(tmp.indx_fyp, 0)) indx_fyp,
                        sum(nvl(tmp.indx_acti, 0)) indx_acti,
                        count(*) indx_agens
                    from ams_prc_p015_amnm_outlets tmp
                    where tmp.session_id = pn_session_id
                        and tmp.record_date = var_record_date
                        and tmp.branch_ams_id = pv_outlet_ams_id
                        and tmp.unit_ams_id is not null
                    group by
                        tmp.unit_ams_id,
                        tmp.data_date
                ) upd
            on (
                pn_session_id = amnm.session_id
                and
                var_record_date = amnm.record_date
                and
                upd.data_date = amnm.data_date
                and
                upd.unit_ams_id = amnm.unit_ams_id
            )
            when matched then
                update /*+ NOLOGGING */
                    set
                        amnm.indx_fyp = nvl(upd.indx_fyp, 0),
                        amnm.indx_acti = nvl(upd.indx_acti, 0),
                        amnm.indx_agens = nvl(upd.indx_agens, 0);
            commit;

            -- Buoc 02.B: Tong hop du lieu ban phat trien
            merge/*+CARDINALITY(amnm, 100)
                    CARDINALITY(upd, 100)*/
                into ams_prc_p015_amnm_agencies amnm
            using
                (
                    select
                        g.agency_ams_id,
                        sum(nvl(g.indx_fyp, 0)) indx_fyp,
                        sum(nvl(g.indx_acti, 0)) indx_acti,
                        sum(nvl(g.indx_agens, 0)) indx_agens
                    from
                    (
                        select /*+ CARDINALITY(tmp, 100)*/
                            tmp.agency_ams_id,
                            tmp.indx_fyp,
                            tmp.indx_acti,
                            tmp.indx_agens
                        from ams_prc_p015_amnm_units tmp
                        where tmp.session_id = pn_session_id
                            and tmp.record_date = var_record_date
                            and tmp.branch_ams_id = pv_outlet_ams_id
                        union all
                        select /*+ CARDINALITY(tmp, 100)*/
                            tmp.agency_ams_id,
                            tmp.indx_fyp,
                            tmp.indx_acti,
                            1 indx_agens
                        from ams_prc_p015_amnm_outlets tmp
                        where tmp.session_id = pn_session_id
                            and tmp.record_date = var_record_date
                            and tmp.branch_ams_id = pv_outlet_ams_id
                            and tmp.unit_ams_id is null
                    ) g
                    group by g.agency_ams_id
                ) upd
            on (
                pn_session_id = amnm.session_id
                and
                var_record_date = amnm.record_date
                and
                upd.agency_ams_id = amnm.agency_ams_id
            )
            when matched then
                update /*+ NOLOGGING */
                    set
                        amnm.indx_fyp = nvl(upd.indx_fyp, 0),
                        amnm.indx_acti = nvl(upd.indx_acti, 0),
                        amnm.indx_agens = nvl(upd.indx_agens, 0);
            commit;

            -- Buoc 02.C: Tong hop du lieu ban
            merge/*+CARDINALITY(amnm, 100)
                    CARDINALITY(upd, 100)*/
                into ams_prc_p015_amnm amnm
            using
                (
                    select
                        g.agency_ams_id,
                        sum(nvl(g.indx_fyp, 0)) indx_fyp,
                        sum(nvl(g.indx_acti, 0)) indx_oacti,
                        sum(nvl(g.indx_agens, 0)) indx_osums
                    from
                    (
                        select /*+ CARDINALITY(tmp, 100)*/
                            tmp.amnm_agency_ams_id agency_ams_id,
                            tmp.indx_fyp,
                            tmp.indx_acti,
                            tmp.indx_agens
                        from ams_prc_p015_amnm_agencies tmp
                        where tmp.session_id = pn_session_id
                            and tmp.record_date = var_record_date
                            and tmp.branch_ams_id = pv_outlet_ams_id
                        union all
                        select /*+ CARDINALITY(tmp, 100)*/
                            tmp.agency_ams_id,
                            tmp.indx_fyp,
                            tmp.indx_acti,
                            tmp.indx_agens
                        from ams_prc_p015_amnm_units tmp
                        where tmp.session_id = pn_session_id
                            and tmp.record_date = var_record_date
                            and tmp.branch_ams_id = pv_outlet_ams_id
                            and tmp.ulevel = 1
                        union all
                        select /*+ CARDINALITY(tmp, 100)*/
                            tmp.agency_ams_id,
                            tmp.indx_fyp,
                            tmp.indx_acti,
                            1 indx_agens
                        from ams_prc_p015_amnm_outlets tmp
                        where tmp.session_id = pn_session_id
                            and tmp.record_date = var_record_date
                            and tmp.branch_ams_id = pv_outlet_ams_id
                            and tmp.unit_ams_id is null
                    ) g
                    group by g.agency_ams_id
                ) upd
            on (
                pn_session_id = amnm.session_id
                and
                var_record_date = amnm.record_date
                and
                upd.agency_ams_id = amnm.agency_ams_id
            )
            when matched then
                update /*+ NOLOGGING */
                    set
                        amnm.indx_fyp = nvl(upd.indx_fyp, 0),
                        amnm.indx_oacti = nvl(upd.indx_oacti, 0),
                        amnm.indx_osums = nvl(upd.indx_osums, 0);
            commit;

            -- Buoc 02.D: Tong hop du lieu hoat dong binh quan
            merge/*+CARDINALITY(amnm, 100)
                    CARDINALITY(upd, 100)*/
                into ams_prc_p015_amnm amnm
            using
                (
                    select
                        r.agency_ams_id,
                        decode(nvl(count(*), 0),
                            0, 100,
                            round(
                                sum(nvl(r.indx_racti, 0)) / nvl(count(*), 0),
                                2
                            )
                        ) indx_racti
                    from
                    (
                        select
                            g.agency_ams_id,
                            g.data_date,
                            decode(sum(nvl(g.indx_agens, 0)),
                                0, 100,
                                round(
                                    sum(nvl(g.indx_acti, 0)) / sum(nvl(g.indx_agens, 0)) * 100,
                                    2
                                )
                            ) indx_racti
                        from
                        (
                            select /*+ CARDINALITY(tmp, 100)*/
                                tmp.agency_ams_id,
                                tmp.data_date,
                                tmp.indx_fyp,
                                tmp.indx_acti,
                                tmp.indx_agens
                            from ams_prc_p015_amnm_units tmp
                            where tmp.session_id = pn_session_id
                                and tmp.record_date = var_record_date
                                and tmp.branch_ams_id = pv_outlet_ams_id
                                and tmp.ulevel = 1
                            union all
                            select /*+ CARDINALITY(tmp, 100)*/
                                tmp.agency_ams_id,
                                tmp.data_date,
                                tmp.indx_fyp,
                                tmp.indx_acti,
                                1 indx_agens
                            from ams_prc_p015_amnm_outlets tmp
                            where tmp.session_id = pn_session_id
                                and tmp.record_date = var_record_date
                                and tmp.branch_ams_id = pv_outlet_ams_id
                                and tmp.unit_ams_id is null
                        ) g
                        group by g.agency_ams_id,
                            g.data_date
                    ) r
                    group by r.agency_ams_id
                ) upd
            on (
                pn_session_id = amnm.session_id
                and
                var_record_date = amnm.record_date
                and
                upd.agency_ams_id = amnm.agency_ams_id
            )
            when matched then
                update /*+ NOLOGGING */
                    set
                        amnm.indx_racti = nvl(upd.indx_racti, 0);
            commit;

            -- Buoc 02.E: Quy mo ban
            merge/*+CARDINALITY(amnm, 100)
                    CARDINALITY(upd, 100)*/
                into ams_prc_p015_amnm amnm
            using
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.agency_ams_id,
                        nvl(count(*), 0) indx_cunits
                    from ams_prc_p015_amnm_units tmp
                    where tmp.session_id = pn_session_id
                        and tmp.record_date = var_record_date
                        and tmp.branch_ams_id = pv_outlet_ams_id
                        and tmp.data_date = var_cond_date
                        and tmp.ulevel = 1
                    group by tmp.agency_ams_id
                ) upd
            on (
                pn_session_id = amnm.session_id
                and
                var_record_date = amnm.record_date
                and
                upd.agency_ams_id = amnm.agency_ams_id
            )
            when matched then
                update /*+ NOLOGGING */
                    set
                        amnm.indx_cunits = nvl(upd.indx_cunits, 0);
            commit;

            -- Buoc 02.E: Quy mo ban dau ky
            merge/*+CARDINALITY(amnm, 100)
                    CARDINALITY(upd, 100)*/
                into ams_prc_p015_amnm amnm
            using
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.agency_ams_id,
                        nvl(count(*), 0) indx_bunits
                    from ams_prc_p015_amnm_units tmp
                    where tmp.session_id = pn_session_id
                        and tmp.record_date = var_record_date
                        and tmp.branch_ams_id = pv_outlet_ams_id
                        and tmp.data_date = add_months(var_record_date, -11)
                        and tmp.ulevel in (1, 2)
                    group by tmp.agency_ams_id
                ) upd
            on (
                pn_session_id = amnm.session_id
                and
                var_record_date = amnm.record_date
                and
                upd.agency_ams_id = amnm.agency_ams_id
            )
            when matched then
                update /*+ NOLOGGING */
                    set
                        amnm.indx_bunits = nvl(upd.indx_bunits, 0);
            commit;

            -- Buoc 02.E: Quy mo ban cuoi ky
            merge/*+CARDINALITY(amnm, 100)
                    CARDINALITY(upd, 100)*/
                into ams_prc_p015_amnm amnm
            using
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.agency_ams_id,
                        nvl(count(*), 0) indx_eunits
                    from ams_prc_p015_amnm_units tmp
                    where tmp.session_id = pn_session_id
                        and tmp.record_date = var_record_date
                        and tmp.branch_ams_id = pv_outlet_ams_id
                        and tmp.data_date = var_cond_date
                        and tmp.ulevel in (1, 2)
                    group by tmp.agency_ams_id
                ) upd
            on (
                pn_session_id = amnm.session_id
                and
                var_record_date = amnm.record_date
                and
                upd.agency_ams_id = amnm.agency_ams_id
            )
            when matched then
                update /*+ NOLOGGING */
                    set
                        amnm.indx_eunits = nvl(upd.indx_eunits, 0);
            commit;

            -- Buoc 02.F: So nhom phat trien thuan cua ban
            update /*+ NOLOGGING */ ams_prc_p015_amnm amnm
               set amnm.indx_iunits = nvl(amnm.indx_eunits, 0) - nvl(amnm.indx_bunits, 0)
            where amnm.session_id = pn_session_id
                and amnm.record_date = var_record_date
                and amnm.branch_ams_id = pv_outlet_ams_id;
            commit;

            -- Buoc 02.G: So tu van vien 90 ngay tuoi hoat dong
            merge/*+CARDINALITY(amnm, 100)
                    CARDINALITY(upd, 100)*/
                into ams_prc_p015_amnm amnm
            using
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.empl_ams_id outlet_ams_id,
                        sum(nvl(tmp.indx_onew_acti, 0)) indx_onew_acti
                    from ams_prc_p015_amnm_outlets tmp
                    where tmp.session_id = pn_session_id
                        and tmp.record_date = var_record_date
                        and tmp.branch_ams_id = pv_outlet_ams_id
                    group by tmp.empl_ams_id
                ) upd
            on (
                pn_session_id = amnm.session_id
                and
                var_record_date = amnm.record_date
                and
                upd.outlet_ams_id = amnm.outlet_ams_id
            )
            when matched then
                update /*+ NOLOGGING */
                    set
                        amnm.indx_onew_acti = nvl(upd.indx_onew_acti, 0);
            commit;

            -- Buoc 02.H: Chung chi dao tao
            merge/*+CARDINALITY(amnm, 100)
                    CARDINALITY(upd, 100)*/
                into ams_prc_p015_amnm amnm
            using
                (
                    select
                        cerf.outlet_ams_id
                    from
                    (
                        select b.outlet_ams_id
                        from ams.ams_prc_blocks b
                        where b.session_id = pn_session_id
                            and b.record_date = var_record_date
                            and b.module_code = 'PROM'
                            and b.data_code = 'BTC1' -- Chung chi Bao Viet tam cao 1
                            and b.from_date <= last_day(var_record_date)
                        intersect
                        select b.outlet_ams_id
                        from ams.ams_prc_blocks b
                        where b.session_id = pn_session_id
                            and b.record_date = var_record_date
                            and b.module_code = 'PROM'
                            and b.data_code = 'BTC2' -- Chung chi Bao Viet tam cao 2
                            and b.from_date <= last_day(var_record_date)
                        intersect
                        select b.outlet_ams_id
                        from ams.ams_prc_blocks b
                        where b.session_id = pn_session_id
                            and b.record_date = var_record_date
                            and b.module_code = 'PROM'
                            and b.data_code = 'BTC3' -- Chung chi Bao Viet tam cao 3
                            and b.from_date <= last_day(var_record_date)
                        intersect
                        select b.outlet_ams_id
                        from ams.ams_prc_blocks b
                        where b.session_id = pn_session_id
                            and b.record_date = var_record_date
                            and b.module_code = 'PROM'
                            and b.data_code = 'BTC4' -- Chung chi Bao Viet tam cao 4
                            and b.from_date <= last_day(var_record_date)
                    ) cerf
                ) upd
            on (
                pn_session_id = amnm.session_id
                and
                var_record_date = amnm.record_date
                and
                upd.outlet_ams_id = amnm.outlet_ams_id
            )
            when matched then
                update /*+ NOLOGGING */
                    set
                        amnm.indx_cerf = AMS_CORE_CODE.VALUE_YES;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_amnm_data] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 08/04/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_amnm_cond(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
        var_record_date date := trunc(pd_realize_date, 'MM');
        var_cur_date date := trunc(sysdate, 'MM');

        var_cond_date date := least(var_record_date, var_cur_date);

        var_cond_cmonths number(5);
        var_cond_cunit number(5);
        var_cond_iunit number(5);
        var_cond_onew number(5);
        var_cond_fyp number(16,2);
        var_cond_racti number(5,2);
        var_cond_cerf varchar2(16);
        var_cond_rcode varchar2(16);
    begin
        -- Buoc 01: Lay thong tin cau hinh
        begin
            var_cond_cmonths := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/AMNM/MONT');
            var_cond_cunit := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/AMNM/CUNIT');
            var_cond_iunit := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/AMNM/IUNIT');
            var_cond_onew := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/AMNM/ONEW');
            var_cond_fyp := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/AMNM/FYP');
            var_cond_racti := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/AMNM/ARATE');
            var_cond_cerf := AMS_MODL_VARIABLE.get_tvar_by_code('/GLOBAL/PROM/P2015/AMNM/CERF');
            var_cond_rcode := AMS_MODL_VARIABLE.get_tvar_by_code('/GLOBAL/PROM/P2015/AMNM/RCODE');
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_amnp_cond] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 02: Xu ly dieu kien duy tri
        begin
            -- Xet duy tri TB
            update /*+ NOLOGGING */ ams_prc_p015_amnm amnm
               set amnm.amnm_code = 'D',
                   amnm.new_rcode = var_cond_rcode,
                   amnm.new_rdate = add_months(var_record_date, 1)
            where amnm.session_id = pn_session_id
                and amnm.record_date = var_record_date
                and amnm.branch_ams_id = pv_outlet_ams_id
                and amnm.seni_months >= nvl(var_cond_cmonths, 0)
                and
                    (
                        nvl(amnm.indx_cunits, 0) < nvl(var_cond_cunit, 0)
                        or
                        nvl(amnm.indx_iunits, 0) < nvl(var_cond_iunit, 0)
                        or
                        nvl(amnm.indx_onew_acti, 0) < nvl(var_cond_onew, 0)
                        or
                        nvl(amnm.indx_fyp, 0) < nvl(var_cond_fyp, 0)
                        or
                        nvl(amnm.indx_racti, 100) < nvl(var_cond_racti, 0)
                        or
                        nvl(amnm.indx_cerf, 'N') not in
                            (
                                nvl(var_cond_cerf, 'N'),
                                'Y'
                            )
                    );
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_amnm_cond] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 08/04/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_amnm_comp(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
        var_record_date date := trunc(pd_realize_date, 'MM');
        var_cur_date date := trunc(sysdate, 'MM');

        var_cond_date date := least(var_record_date, var_cur_date);
    begin
       -- Buoc 01: Xoa du lieu neu da ton tai
        begin
            loop
                delete /*+ NOLOGGING */ ams_rep_rp1506 del
                where del.record_date = var_record_date
                    and del.branch_ams_id = pv_outlet_ams_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_amnm_comp] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 02: Di chuyen du lieu
        begin
            -- Buoc 02.A: Du lieu truong ban
            insert /*+ APPEND */ into ams_rep_rp1506 nologging (
                record_date,
                sort_data,
                sort_branch_name,
                sort_agency_name,
                sort_outlet_name,
                sort_outlet_ams_id,
                branch_ams_id,
                branch_name,
                agency_ams_id,
                agency_name,
                outlet_ams_id,
                outlet_name,
                rege_code,
                rege_date,
                effe_date,
                term_date,
                rp_cunits,
                rp_iunits,
                rp_onew,
                rp_fyp,
                rp_racti,
                rp_cerf,
                rp_code,
                rp_rcode,
                rp_rdate,
                maintain_user,
                maintain_time
            )
            select /*+ CARDINALITY(amnm, 10)
                       CARDINALITY(outl, 10)*/
                var_record_date,
                'M11',
                outl.branch_name,
                outl.agency_name,
                outl.outlet_name,
                outl.outlet_ams_id,
                outl.branch_ams_id,
                outl.branch_name,
                outl.agency_ams_id,
                outl.agency_name,
                outl.outlet_ams_id,
                outl.outlet_name,
                outl.regency_code,
                outl.regency_date,
                outl.effective_date,
                outl.terminal_date,
                amnm.indx_cunits,
                amnm.indx_iunits,
                amnm.indx_onew_acti,
                amnm.indx_fyp,
                amnm.indx_racti,
                amnm.indx_cerf,
                amnm.amnm_code,
                amnm.new_rcode,
                amnm.new_rdate,
                pv_user,
                sysdate
            from
            (
                select *
                from ams_prc_p015_amnm prc
                where prc.session_id = pn_session_id
                    and prc.record_date = var_record_date
                    and prc.branch_ams_id = pv_outlet_ams_id
            ) amnm
            join
            (
                select *
                from dbw_outl_informations dbw
                where dbw.dbw_code = 'MAIN'
                    and dbw.dbw_time = 'MONT'
                    and dbw.outlet_type = 'OUTL'
                    and dbw.record_date = var_cond_date
                    and dbw.branch_ams_id = pv_outlet_ams_id
            ) outl
                on amnm.outlet_ams_id = outl.outlet_ams_id;
            commit;

            -- Buoc 02.B: Chi tiet tung thang
            for i in -11..0
            loop
                if (add_months(var_record_date, i) <= var_cond_date) then
                    -- Buoc 02.B.01: Du lieu phat trien ban
                    insert /*+ APPEND */ into ams_rep_rp1506 nologging (
                        record_date,
                        sort_data,
                        sort_branch_name,
                        sort_agency_name,
                        sort_outlet_name,
                        sort_outlet_ams_id,
                        branch_ams_id,
                        agency_ams_id,
                        rp_date,
                        rp_agency_name,
                        rp_outlet_ams_id,
                        rp_outlet_name,
                        rp_rege_code,
                        rp_rege_date,
                        rp_fyp,
                        rp_oacti,
                        rp_osums,
                        maintain_user,
                        maintain_time
                    )
                    select /*+ CARDINALITY(amnm, 10)
                               CARDINALITY(outl, 10)*/
                        var_record_date,
                        'M12',
                        outl.branch_name,
                        outl.agency_name,
                        outl.outlet_name,
                        outl.outlet_ams_id,
                        agen_info.branch_ams_id,
                        agen_info.agency_ams_id,
                        add_months(var_record_date, i),
                        agen_info.agency_name,
                        agen_info.outlet_ams_id,
                        agen_info.outlet_name,
                        agen_info.regency_code,
                        agen_info.regency_date,
                        agen.indx_fyp,
                        agen.indx_acti,
                        agen.indx_agens,
                        pv_user,
                        sysdate
                    from
                    (
                        select *
                        from ams_prc_p015_amnm prc
                        where prc.session_id = pn_session_id
                            and prc.record_date = var_record_date
                            and prc.branch_ams_id = pv_outlet_ams_id
                    ) amnm
                    join
                    (
                        select *
                        from dbw_outl_informations dbw
                        where dbw.dbw_code = 'MAIN'
                            and dbw.dbw_time = 'MONT'
                            and dbw.outlet_type = 'OUTL'
                            and dbw.record_date = var_cond_date
                            and dbw.branch_ams_id = pv_outlet_ams_id
                    ) outl
                        on amnm.outlet_ams_id = outl.outlet_ams_id
                    join
                    (
                        select
                            a.outlet_ams_id,
                            a.amnm_outlet_ams_id,
                            a.amnm_agency_ams_id,
                            a.indx_fyp,
                            a.indx_acti,
                            a.indx_agens
                        from ams_prc_p015_amnm_agencies a
                        where a.session_id = pn_session_id
                            and a.record_date = var_record_date
                            and a.data_date = add_months(var_record_date, i)
                    ) agen
                        on agen.amnm_agency_ams_id = amnm.agency_ams_id
                    join
                    (
                        select
                            *
                        from dbw_outl_informations i
                        where i.dbw_code = 'MAIN'
                            and i.dbw_time = 'MONT'
                            and i.outlet_type = 'OUTL'
                            and i.record_date = add_months(var_record_date, i)
                            and i.regency_code in ('CV04')
                    ) agen_info
                        on agen_info.outlet_ams_id = agen.outlet_ams_id;
                    commit;

                    -- Buoc 02.B.02: Du lieu nhom
                    insert /*+ APPEND */ into ams_rep_rp1506 nologging (
                          record_date,
                          sort_data,
                          sort_branch_name,
                          sort_agency_name,
                          sort_outlet_name,
                          sort_outlet_ams_id,
                          branch_ams_id,
                          agency_ams_id,
                          rp_date,
                          rp_agency_name,
                          rp_unit_name,
                          rp_outlet_ams_id,
                          rp_outlet_name,
                          rp_rege_code,
                          rp_rege_date,
                          rp_ulevel,
                          rp_cunits,
                          rp_iunits,
                          rp_fyp,
                          rp_oacti,
                          rp_osums,
                          maintain_user,
                          maintain_time
                    )
                    select /*+ CARDINALITY(amnm, 10)
                               CARDINALITY(outl, 10)*/
                        var_record_date,
                        'M13',
                        outl.branch_name,
                        outl.agency_name,
                        outl.outlet_name,
                        outl.outlet_ams_id,
                        unit_info.branch_ams_id,
                        unit_info.agency_ams_id,
                        add_months(var_record_date, i),
                        unit_info.agency_name,
                        unit_info.unit_name,
                        ounit_info.outlet_ams_id,
                        ounit_info.outlet_name,
                        ounit_info.regency_code,
                        ounit_info.regency_date,
                        unit.ulevel,
                        null,
                        null,
                        unit.indx_fyp,
                        unit.indx_acti,
                        unit.indx_agens,
                        pv_user,
                        sysdate
                    from
                    (
                        select *
                        from ams_prc_p015_amnm prc
                        where prc.session_id = pn_session_id
                            and prc.record_date = var_record_date
                            and prc.branch_ams_id = pv_outlet_ams_id
                    ) amnm
                    join
                    (
                        select *
                        from dbw_outl_informations dbw
                        where dbw.dbw_code = 'MAIN'
                            and dbw.dbw_time = 'MONT'
                            and dbw.outlet_type = 'OUTL'
                            and dbw.record_date = var_cond_date
                            and dbw.branch_ams_id = pv_outlet_ams_id
                    ) outl
                        on amnm.outlet_ams_id = outl.outlet_ams_id
                    join
                    (
                        select
                            *
                        from ams_prc_p015_amnm_units u
                        where u.session_id = pn_session_id
                            and u.record_date = var_record_date
                            and u.data_date = add_months(var_record_date, i)
                            and u.ulevel in (1)
                    ) unit
                        on unit.amnm_agency_ams_id = amnm.agency_ams_id
                    join
                    (
                        select
                            *
                        from dbw_outl_informations dbw
                        where dbw.dbw_code = 'MAIN'
                            and dbw.dbw_time = 'MONT'
                            and dbw.outlet_type = 'NHOM'
                            and dbw.record_date = add_months(var_record_date, i)
                            and dbw.branch_ams_id = pv_outlet_ams_id
                    ) unit_info
                        on unit_info.unit_ams_id = unit.unit_ams_id
                    left join
                    (
                        select
                            *
                        from dbw_outl_informations dbw
                        where dbw.dbw_code = 'MAIN'
                            and dbw.dbw_time = 'MONT'
                            and dbw.outlet_type = 'OUTL'
                            and dbw.record_date = add_months(var_record_date, i)
                            and dbw.regency_code in ('CV02')
                            and dbw.branch_ams_id = pv_outlet_ams_id
                    ) ounit_info
                        on ounit_info.outlet_ams_id = unit.outlet_ams_id;
                    commit;

                    -- Buoc 02.B.03: Du lieu dai ly
                    insert /*+ APPEND */ into ams_rep_rp1506 nologging (
                        record_date,
                        sort_data,
                        sort_branch_name,
                        sort_agency_name,
                        sort_outlet_name,
                        sort_outlet_ams_id,
                        branch_ams_id,
                        agency_ams_id,
                        rp_date,
                        rp_agency_name,
                        rp_unit_name,
                        rp_outlet_ams_id,
                        rp_outlet_name,
                        rp_rege_code,
                        rp_rege_date,
                        rp_onew,
                        rp_fyp,
                        rp_oacti,
                        rp_osums,
                        maintain_user,
                        maintain_time
                    )
                    select /*+ CARDINALITY(amnm, 10)
                               CARDINALITY(outl, 10)*/
                        var_record_date,
                        'M14',
                        amnm_info.branch_name,
                        amnm_info.agency_name,
                        amnm_info.outlet_name,
                        amnm_info.outlet_ams_id,
                        outl_info.branch_ams_id,
                        outl_info.agency_ams_id,
                        add_months(var_record_date, i),
                        outl_info.agency_name,
                        outl_info.unit_name,
                        outl_info.outlet_ams_id,
                        outl_info.outlet_name,
                        outl_info.regency_code,
                        outl_info.effective_date,
                        outl.indx_onew_acti,
                        outl.indx_fyp,
                        outl.indx_acti,
                        1,
                        pv_user,
                        sysdate
                    from
                    (
                        select *
                        from ams_prc_p015_amnm prc
                        where prc.session_id = pn_session_id
                            and prc.record_date = var_record_date
                            and prc.branch_ams_id = pv_outlet_ams_id
                    ) amnm
                    join
                    (
                        select *
                        from dbw_outl_informations dbw
                        where dbw.dbw_code = 'MAIN'
                            and dbw.dbw_time = 'MONT'
                            and dbw.outlet_type = 'OUTL'
                            and dbw.record_date = var_cond_date
                            and dbw.branch_ams_id = pv_outlet_ams_id
                    ) amnm_info
                        on amnm_info.outlet_ams_id = amnm.outlet_ams_id
                    join
                    (
                        select
                            *
                        from ams_prc_p015_amnm_outlets o
                        where o.session_id = pn_session_id
                            and o.record_date = var_record_date
                            and o.data_date = add_months(var_record_date, i)
                            and o.unit_ams_id is null
                    ) outl
                        on outl.agency_ams_id = amnm.agency_ams_id
                    join
                    (
                        select
                            *
                        from dbw_outl_informations dbw
                        where dbw.dbw_code = 'MAIN'
                            and dbw.dbw_time = 'MONT'
                            and dbw.outlet_type = 'OUTL'
                            and dbw.record_date = add_months(var_record_date, i)
                            and dbw.branch_ams_id = pv_outlet_ams_id
                    ) outl_info
                        on outl_info.outlet_ams_id = outl.outlet_ams_id;
                    commit;
                end if;
            end loop;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_amnm_comp] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 08/04/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_amnm_close(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
    begin
        -- Buoc 01: Xoa du lieu neu da ton tai
        begin
            loop
                delete /*+ NOLOGGING */ ams_prc_p015_amnm del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_prc_p015_amnm_units del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_prc_p015_amnm_outlets del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_prc_p015_amnm_agencies del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_amnm_close] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 06/11/2014
        Version: 1.0
        Description: Thang tien TVV -> TVV thanh cong
        Parameter:
        Update:
    */
    procedure mmxv_modl_succ(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
    begin
        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_succ_open(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
        var_record_date date := trunc(pd_realize_date, 'MM');
        var_cur_date date := trunc(sysdate, 'MM');

        var_cond_date date := least(var_record_date, var_cur_date);
        var_dbegin date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/PROM/P2015/INFO/BDATE');
        var_dend date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/PROM/P2015/INFO/EDATE');
    begin
        -- Buoc 01: Xoa du lieu neu da ton tai
        begin
            loop
                delete /*+ NOLOGGING */ ams_prc_p015_succ del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_prc_p015_succ_data del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_succ_open] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 02: Ghi nhan du lieu duoc xu ly
        begin
            insert /*+ APPEND */ into ams_prc_p015_succ nologging (
                session_id,
                record_date,
                outlet_ams_id,
                branch_ams_id,
                effe_date,
                term_date,
                regency_code,
                eperiod_afif,
                eperiod_afis,
                eperiod_pr36,
                period_coll_etmt,
                period_coll_real,
                period_coll_rate,
                period_ucol_etmt,
                period_ucol_real,
                period_ucol_rate,
                period_fyp,
                months_acti,
                succ_asmt,
                succ_date,
                succ_end_date
             )
            select /*+ CARDINALITY(outl, 100)*/
                pn_session_id,
                var_record_date,
                outl.outlet_ams_id,
                outl.branch_ams_id,
                outl.effe_date,
                outl.term_date,
                outl.regency_code,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                null,
                null,
                null
            from ams_prc_outlets outl
            where outl.session_id = pn_session_id
                and outl.record_date = var_cond_date
                and outl.branch_ams_id = pv_outlet_ams_id
                and outl.term_date is null
                and outl.regency_code in ('CV05', 'CV00')
                and outl.outlet_ams_id not in
                (
                    select prc.outlet_ams_id
                    from ams_prc_outlets prc
                    where prc.session_id = pn_session_id
                        and prc.record_date
                            between var_dbegin
                            and var_cond_date
                        and prc.regency_code in ('CV01')
                        and prc.branch_ams_id = pv_outlet_ams_id
                );
            commit;

            --Du lieu chi tiet
            for i in -2..0
            loop
                if (add_months(var_record_date, i) <= var_cond_date) then
                    insert /*+ APPEND */ into ams_prc_p015_succ_data nologging (
                        session_id,
                        record_date,
                        outlet_ams_id,
                        branch_ams_id,
                        effe_date,
                        term_date,
                        eperiod_afif,
                        eperiod_afis,
                        eperiod_pr36,
                        period_coll_etmt,
                        period_coll_real,
                        period_coll_rate,
                        period_ucol_etmt,
                        period_ucol_real,
                        period_ucol_rate,
                        period_fyp,
                        pile_pis,
                        period_acti
                     )
                    select /*+ CARDINALITY(succ, 100)
                               CARDINALITY(outl, 100)*/
                      pn_session_id,
                      add_months(var_record_date, i),
                      outl.outlet_ams_id,
                      outl.branch_ams_id,
                      outl.effe_date,
                      outl.term_date,
                      0,
                      0,
                      0,
                      0,
                      0,
                      0,
                      0,
                      0,
                      0,
                      0,
                      0,
                      0
                    from
                    (
                        select /*+ CARDINALITY(suc, 100)*/
                            suc.outlet_ams_id
                        from ams_prc_p015_succ suc
                        where suc.session_id = pn_session_id
                            and suc.record_date = var_record_date
                            and suc.branch_ams_id = pv_outlet_ams_id
                    ) succ
                    join
                    (
                        select /*+ CARDINALITY(outls, 100)*/
                            outls.outlet_ams_id,
                            outls.branch_ams_id,
                            outls.agency_ams_id,
                            outls.unit_ams_id,
                            outls.regency_code,
                            outls.regency_date,
                            outls.effe_date,
                            outls.term_date
                        from ams_prc_outlets outls
                        where outls.session_id = pn_session_id
                            and outls.record_date = add_months(var_record_date, i)
                            and outls.branch_ams_id = pv_outlet_ams_id
                    ) outl
                        on succ.outlet_ams_id = outl.outlet_ams_id;
                    commit;
                end if;
            end loop;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_succ_open] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update: Chinhlk
        Date Update: 06/08/2015
                     1.1: Them dk TVV hoan thanh khoa huan luyen Cung thanh cong
    */
    procedure mmxv_modl_succ_data(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
        var_record_date date := trunc(pd_realize_date, 'MM');
        var_cur_date date := trunc(sysdate, 'MM');

        var_cond_date date := least(var_record_date, var_cur_date);
    begin
        -- Buoc 01: Chi tiet du lieu
        begin
           -- Buoc 01.A: Ghi nhan du lieu [RFYP]
            for i in -2..0
            loop
                merge /*+CARDINALITY(succ, 100)
                         CARDINALITY(upd, 100)*/
                    into ams_prc_p015_succ_data succ
                using
                    (
                        select /*+ CARDINALITY(outl, 100)
                                   CARDINALITY(rfyp, 100)
                                   CARDINALITY(retmt, 100)
                                   CARDINALITY(rreal, 100)
                                   CARDINALITY(uetmt, 100)
                                   CARDINALITY(ureal, 100)
                                   CARDINALITY(rissue, 100)*/
                            outl.outlet_ams_id,
                            outl.record_date,
                            rfyp.data_value data_rfyp,
                            retmt.data_value data_retmt,
                            rreal.data_value data_rreal,
                            uetmt.data_value data_uetmt,
                            ureal.data_value data_ureal,
                            rissue.data_value data_rissue,
                            case
                                when nvl(rissue.data_value, 0) > 0 then
                                    1
                                else
                                    0
                                end data_acti
                        from
                        (
                            select /*+ CARDINALITY(tmp, 100)*/
                                tmp.record_date,
                                tmp.outlet_ams_id
                            from ams_prc_p015_succ_data tmp
                            where tmp.session_id = pn_session_id
                                and tmp.record_date = add_months(var_record_date, i)
                                and tmp.branch_ams_id = pv_outlet_ams_id
                        ) outl
                        left join
                        (
                            select /*+ CARDINALITY(tmp, 100)*/
                                tmp.outlet_ams_id,
                                tmp.data_value
                            from ams_prc_data tmp
                            where tmp.session_id = pn_session_id
                              and tmp.module_code = 'PROM'
                              and tmp.record_date = add_months(var_record_date, i)
                              and tmp.branch_ams_id = pv_outlet_ams_id
                              and tmp.data_code = 'RFYP'
                        ) rfyp
                            on rfyp.outlet_ams_id = outl.outlet_ams_id
                        left join
                        (
                            select /*+ CARDINALITY(tmp, 100)*/
                                tmp.outlet_ams_id,
                                tmp.data_value
                            from ams_prc_data tmp
                            where tmp.session_id = pn_session_id
                                and tmp.module_code = 'PROM'
                                and tmp.record_date = add_months(var_record_date, i)
                                and tmp.branch_ams_id = pv_outlet_ams_id
                                and tmp.data_code = 'BILL'
                        ) retmt
                            on retmt.outlet_ams_id = outl.outlet_ams_id
                        left join
                        (
                            select /*+ CARDINALITY(tmp, 100)*/
                                tmp.outlet_ams_id,
                                tmp.data_value
                            from ams_prc_data tmp
                            where tmp.session_id = pn_session_id
                                and tmp.module_code = 'PROM'
                                and tmp.record_date = add_months(var_record_date, i)
                                and tmp.branch_ams_id = pv_outlet_ams_id
                                and tmp.data_code = 'PAYS'
                        ) rreal
                            on rreal.outlet_ams_id = outl.outlet_ams_id
                        left join
                        (
                            select /*+ CARDINALITY(tmp, 100)*/
                                tmp.outlet_ams_id,
                                tmp.data_value
                            from ams_prc_data tmp
                            where tmp.session_id = pn_session_id
                                and tmp.module_code = 'PROM'
                                and tmp.record_date = add_months(var_record_date, i)
                                and tmp.branch_ams_id = pv_outlet_ams_id
                                and tmp.data_code = 'UBILL'
                        ) uetmt
                            on uetmt.outlet_ams_id = outl.outlet_ams_id
                        left join
                        (
                            select /*+ CARDINALITY(tmp, 100)*/
                                tmp.outlet_ams_id,
                                tmp.data_value
                            from ams_prc_data tmp
                            where tmp.session_id = pn_session_id
                                and tmp.module_code = 'PROM'
                                and tmp.record_date = add_months(var_record_date, i)
                                and tmp.branch_ams_id = pv_outlet_ams_id
                                and tmp.data_code = 'UPAYS'
                        ) ureal
                            on ureal.outlet_ams_id = outl.outlet_ams_id
                        left join
                        (
                            select /*+ CARDINALITY(tmp, 100)*/
                                tmp.outlet_ams_id,
                                tmp.data_value
                            from ams_prc_data tmp
                            where tmp.session_id = pn_session_id
                                and tmp.module_code = 'PROM'
                                and tmp.record_date = add_months(var_record_date, i)
                                and tmp.branch_ams_id = pv_outlet_ams_id
                                and tmp.data_code = 'EFAC'
                        ) rissue
                            on rissue.outlet_ams_id = outl.outlet_ams_id
                    ) upd
                on (
                    pn_session_id = succ.session_id
                    and
                    upd.record_date = succ.record_date
                    and
                    upd.outlet_ams_id = succ.outlet_ams_id
                )
                when matched then
                    update
                        set
                            succ.period_fyp = nvl(upd.data_rfyp, 0),
                            succ.period_coll_etmt = nvl(upd.data_retmt, 0),
                            succ.period_coll_real = nvl(upd.data_rreal, 0),
                            succ.period_ucol_etmt = nvl(upd.data_uetmt, 0),
                            succ.period_ucol_real = nvl(upd.data_ureal, 0),
                            succ.pile_pis = nvl(upd.data_rissue, 0),
                            succ.period_acti = nvl(upd.data_acti, 0);
                commit;
            end loop;

            merge /*+CARDINALITY(succ, 100)
                     CARDINALITY(upd, 100)*/
                into ams_prc_p015_succ_data succ
            using
                (
                    select /*+ CARDINALITY(outl, 100)
                               CARDINALITY(rafif, 100)
                               CARDINALITY(rafis, 100)*/
                        outl.outlet_ams_id,
                        outl.record_date,
                        rafif.data_value data_rafif,
                        rafis.data_value data_rafis
                    from
                    (
                        select /*+ CARDINALITY(tmp, 100)*/
                            tmp.record_date,
                            tmp.outlet_ams_id
                        from ams_prc_p015_succ_data tmp
                        where tmp.session_id = pn_session_id
                            and tmp.record_date = var_cond_date
                            and tmp.branch_ams_id = pv_outlet_ams_id
                    ) outl
                    left join
                    (
                        select /*+ CARDINALITY(tmp, 100)*/
                            tmp.outlet_ams_id,
                            tmp.data_value
                        from ams_prc_data tmp
                        where tmp.session_id = pn_session_id
                            and tmp.record_date = var_cond_date
                            and tmp.branch_ams_id = pv_outlet_ams_id
                            and tmp.module_code = 'PROM'
                            and tmp.data_code = 'IFAP'
                    ) rafif
                        on rafif.outlet_ams_id = outl.outlet_ams_id
                    left join
                    (
                        select /*+ CARDINALITY(tmp, 100)*/
                            tmp.outlet_ams_id,
                            tmp.data_value
                        from ams_prc_data tmp
                        where tmp.session_id = pn_session_id
                            and tmp.module_code = 'PROM'
                            and tmp.data_code = 'ISAP'
                            and tmp.record_date = var_cond_date
                            and tmp.branch_ams_id = pv_outlet_ams_id
                    ) rafis
                        on rafis.outlet_ams_id = outl.outlet_ams_id
                ) upd
            on (
                pn_session_id = succ.session_id
                and
                upd.record_date = succ.record_date
                and
                upd.outlet_ams_id = succ.outlet_ams_id
            )
            when matched then
                update
                    set
                        succ.eperiod_afif = nvl(upd.data_rafif, 0),
                        succ.eperiod_afis = nvl(upd.data_rafis, 0);
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_succ_data] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 02: Tong hop du lieu
        begin
            merge/*+CARDINALITY(succ, 100)
                    CARDINALITY(upd, 100)*/
                into ams_prc_p015_succ succ
            using
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_ams_id,
                        sum(tmp.period_fyp) period_fyp,
                        sum(tmp.eperiod_afif) eperiod_afif,
                        sum(tmp.eperiod_afis) eperiod_afis,
                        sum(tmp.period_coll_etmt) period_coll_etmt,
                        sum(tmp.period_coll_real) period_coll_real,
                        sum(tmp.period_acti) period_acti,
                        sum(tmp.period_ucol_etmt) period_ucol_etmt,
                        sum(tmp.period_ucol_real) period_ucol_real
                    from ams_prc_p015_succ_data tmp
                    where tmp.session_id = pn_session_id
                      and tmp.record_date <= var_cond_date
                      and tmp.branch_ams_id = pv_outlet_ams_id
                    group by tmp.outlet_ams_id
                ) upd
            on (
                pn_session_id = succ.session_id
                and
                var_record_date = succ.record_date
                and
                upd.outlet_ams_id = succ.outlet_ams_id
            )
            when matched then
                update
                    set
                        succ.period_fyp = nvl(upd.period_fyp, 0),
                        succ.period_coll_etmt = nvl(upd.period_coll_etmt, 0),
                        succ.period_coll_real = nvl(upd.period_coll_real, 0),
                        succ.eperiod_afif = nvl(upd.eperiod_afif, 0),
                        succ.eperiod_afis = nvl(upd.eperiod_afis, 0),
                        succ.months_acti = nvl(upd.period_acti, 0),
                        succ.period_ucol_etmt = nvl(upd.period_ucol_etmt, 0),
                        succ.period_ucol_real = nvl(upd.period_ucol_real, 0);
            commit;

            update /*+ NOLOGGING */ ams_prc_p015_succ succ
            set
                succ.eperiod_pr36 =
                    round(
                        least(100,
                            case
                                when nvl(succ.eperiod_afis, 0) <= 0 then
                                    100
                                else
                                    nvl(succ.eperiod_afif, 0) / nvl(succ.eperiod_afis, 0) * 100
                                end
                            ),
                        2
                    ),
                succ.period_coll_rate =
                    round(
                        least(100,
                            case
                                when nvl(succ.period_coll_etmt, 0) <= 0 then
                                    100
                                else
                                    nvl(succ.period_coll_real, 0) / nvl(succ.period_coll_etmt, 0) * 100
                                end
                            ),
                        2
                    ),
                succ.period_ucol_rate =
                    round(
                        least(100,
                            case
                                when nvl(succ.period_ucol_etmt, 0) <= 0 then
                                    100
                                else
                                    nvl(succ.period_ucol_real, 0) / nvl(succ.period_ucol_etmt, 0) * 100
                                end
                            ),
                        2
                    )
            where succ.session_id = pn_session_id
                and succ.branch_ams_id = pv_outlet_ams_id
                and succ.record_date = var_record_date;
            commit;

            -- Fix 1.1
            -- Buoc 03: Ghi nhan chung chi
            merge /*+CARDINALITY(succ, 100)
                     CARDINALITY(upd, 100)*/
                into ams_prc_p015_succ succ
            using
                (
                    select
                        cerf.outlet_ams_id
                    from
                    (
                        select b.outlet_ams_id
                        from ams.ams_prc_blocks b
                        where b.session_id = pn_session_id
                            and b.record_date = var_record_date
                            and b.module_code = 'PROM'
                            and b.data_code = 'DCTC' -- khoa huan luyen cung thanh cong
                            and b.from_date <= last_day(var_record_date)
                    ) cerf
                ) upd
            on (
                pn_session_id = succ.session_id
                and
                var_record_date = succ.record_date
                and
                upd.outlet_ams_id = succ.outlet_ams_id
            )
            when matched then
                update /*+ NOLOGGING */
                    set
                        succ.is_certificate = AMS_CORE_CODE.VALUE_YES;
            commit;
            -- end fix
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_succ_data] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update: Chinhlk
        Date Update: 06/08/2015
                     1.1: Them dk TVV hoan thanh khoa huan luyen Cung thanh cong
    */
    procedure mmxv_modl_succ_cond(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
        var_record_date date := trunc(pd_realize_date, 'MM');
        var_cur_date date := trunc(sysdate, 'MM');

        var_cond_date date := least(var_record_date, var_cur_date);

        var_cond_fyp number(16,2);
        var_cond_acti number(5);
        var_cond_pr36 number(5,2);
        var_cond_scol number(5,2);
        var_cond_ucol number(5,2);
        var_cond_cerf varchar2(16);
    begin
        -- Buoc 01: Lay thong tin cau hinh
        begin
            var_cond_fyp := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/OSUS/FYP');
            var_cond_acti := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/OSUS/ACTI');
            var_cond_pr36 := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/OSUS/PR36');
            var_cond_scol := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/OSUS/SCOL');
            var_cond_ucol := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/OSUS/UCOL');
            var_cond_cerf := AMS_MODL_VARIABLE.get_tvar_by_code('/GLOBAL/PROM/P2015/OSUS/CERF');
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_succ_cond] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 02: Xet tu van vien thanh cong
        begin
            update /*+ NOLOGGING */ ams_prc_p015_succ succ
               set succ.succ_asmt = 'SUCC',
                   succ.succ_date = add_months(var_record_date, 1),
                   succ.succ_end_date = add_months(var_record_date, 4) - 1
            where succ.session_id = pn_session_id
                and succ.record_date = var_record_date
                and succ.branch_ams_id = pv_outlet_ams_id
                and succ.period_fyp >= nvl(var_cond_fyp, 0)
                and succ.months_acti >= nvl(var_cond_acti, 0)
                and succ.eperiod_pr36 >= nvl(var_cond_pr36, 0)
                and succ.period_coll_rate >= nvl(var_cond_scol, 0)
                and succ.period_ucol_rate >= nvl(var_cond_ucol, 0);
            commit;

            -- Fix 1.1
            update /*+ NOLOGGING */ ams_prc_p015_succ succ
                set succ.succ_asmt = null,
                    succ.succ_date = null,
                    succ.succ_end_date = null
                where succ.session_id = pn_session_id
                    and succ.record_date = var_record_date
                    and succ.branch_ams_id = pv_outlet_ams_id
                    and succ.succ_asmt = 'SUCC'
                    and nvl(succ.is_certificate, AMS_CORE_CODE.VALUE_NO) <> AMS_CORE_CODE.VALUE_YES;
            commit;
            -- End fix
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_succ_cond] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:

    */
    procedure mmxv_modl_succ_comp(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
        var_record_date date := trunc(pd_realize_date, 'MM');
        var_cur_date date := trunc(sysdate, 'MM');

        var_cond_date date := least(var_record_date, var_cur_date);
        var_dbegin date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/PROM/P2015/INFO/BDATE');
        var_dend date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/PROM/P2015/INFO/EDATE');
    begin
       -- Buoc 01: Xoa du lieu neu da ton tai
        begin
            loop
                delete /*+ NOLOGGING */ ams_con_p015_succ del
                where del.record_date = var_record_date
                    and del.branch_ams_id = pv_outlet_ams_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_con_p015_succ_data del
                where del.record_date = var_record_date
                    and del.branch_ams_id = pv_outlet_ams_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_succ_comp] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 02: Di chuyen du lieu
        begin
            -- Do du lieu TVV thang tien len TVV TC
            insert /*+ APPEND */ into ams_con_p015_succ nologging (
                record_date,
                outlet_ams_id,
                branch_ams_id,
                effe_date,
                term_date,
                regency_code,
                eperiod_afif,
                eperiod_afis,
                eperiod_pr36,
                period_coll_etmt,
                period_coll_real,
                period_coll_rate,
                period_ucol_etmt,
                period_ucol_real,
                period_ucol_rate,
                period_fyp,
                months_acti,
                succ_asmt,
                succ_date,
                succ_end_date,
                create_user,
                update_user,
                create_datetime,
                update_datetime,
                is_certificate
            )
            select /*+ CARDINALITY(prc, 100)*/
                var_record_date,
                prc.outlet_ams_id,
                prc.branch_ams_id,
                prc.effe_date,
                prc.term_date,
                prc.regency_code,
                prc.eperiod_afif,
                prc.eperiod_afis,
                prc.eperiod_pr36,
                prc.period_coll_etmt,
                prc.period_coll_real,
                prc.period_coll_rate,
                prc.period_ucol_etmt,
                prc.period_ucol_real,
                prc.period_ucol_rate,
                prc.period_fyp,
                prc.months_acti,
                prc.succ_asmt,
                prc.succ_date,
                prc.succ_end_date,
                pv_user,
                pv_user,
                sysdate,
                sysdate,
                is_certificate
            from ams_prc_p015_succ prc
            where prc.session_id = pn_session_id
                and prc.record_date = var_record_date
                and prc.branch_ams_id = pv_outlet_ams_id;
            commit;

            -- Do du lieu TTN ha bac xuong TVV TC
            insert /*+ APPEND */ into ams_con_p015_succ nologging (
                record_date,
                outlet_ams_id,
                branch_ams_id,
                effe_date,
                term_date,
                regency_code,
                eperiod_afif,
                eperiod_afis,
                eperiod_pr36,
                period_coll_etmt,
                period_coll_real,
                period_coll_rate,
                period_ucol_etmt,
                period_ucol_real,
                period_ucol_rate,
                period_fyp,
                months_acti,
                succ_asmt,
                succ_date,
                succ_end_date,
                create_user,
                update_user,
                create_datetime,
                update_datetime,
                is_certificate
            )
            select /*+ CARDINALITY(prc, 100)*/
                var_record_date,
                outl.outlet_ams_id,
                outl.branch_ams_id,
                outl.effe_date,
                outl.term_date,
                outl.regency_code,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                'SUCC',
                outl.regency_date,
                null,
                pv_user,
                pv_user,
                sysdate,
                sysdate,
                null
            from ams_prc_outlets outl
            where outl.session_id = pn_session_id
                and outl.record_date = var_cond_date
                and outl.branch_ams_id = pv_outlet_ams_id
                and outl.regency_code in ('CV05', 'CV00')
                and outl.outlet_ams_id in
                    (
                        select prc.outlet_ams_id
                        from ams_prc_outlets prc
                        where prc.session_id = pn_session_id
                            and prc.record_date
                                between var_dbegin
                                and var_cond_date
                            and prc.regency_code in ('CV01')
                            and prc.branch_ams_id = pv_outlet_ams_id
                    );
            commit;

            insert /*+ APPEND */ into ams_con_p015_succ_data nologging (
                record_date,
                outlet_ams_id,
                branch_ams_id,
                effe_date,
                term_date,
                eperiod_afif,
                eperiod_afis,
                eperiod_pr36,
                period_coll_etmt,
                period_coll_real,
                period_coll_rate,
                period_ucol_etmt,
                period_ucol_real,
                period_ucol_rate,
                period_fyp,
                pile_pis,
                period_acti,
                create_user,
                update_user,
                create_datetime,
                update_datetime
            )
            select /*+ CARDINALITY(prc, 100)*/
                var_record_date,
                prc.outlet_ams_id,
                prc.branch_ams_id,
                prc.effe_date,
                prc.term_date,
                prc.eperiod_afif,
                prc.eperiod_afis,
                prc.eperiod_pr36,
                prc.period_coll_etmt,
                prc.period_coll_real,
                prc.period_coll_rate,
                prc.period_ucol_etmt,
                prc.period_ucol_real,
                prc.period_ucol_rate,
                prc.period_fyp,
                prc.pile_pis,
                prc.period_acti,
                pv_user,
                pv_user,
                sysdate,
                sysdate
            from ams_prc_p015_succ_data prc
            where prc.session_id = pn_session_id
                and prc.branch_ams_id = pv_outlet_ams_id;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_succ_comp] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 06/11/2014
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_succ_close(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
    begin
        -- Buoc 01: Xoa du lieu neu da ton tai
        begin
            loop
                delete /*+ NOLOGGING */ ams_prc_p015_succ del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_prc_p015_succ_data del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_succ_close] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 01/12/2015
        Version: 1.0
        Description: Thang tien TVV -> TVV chu luc
        Parameter:
        Update:
    */
    procedure mmxv_modl_okey(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
    begin

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 01/12/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_okey_open(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
        var_record_date date := trunc(pd_realize_date, 'MM');
        var_cur_date date := trunc(sysdate, 'MM');

        var_cond_date date := least(var_record_date, var_cur_date);
        var_dbegin date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/PROM/P2015/INFO/BDATE');
        var_dend date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/PROM/P2015/INFO/EDATE');
    begin
        -- Buoc 01: Xoa du lieu neu da ton tai
        begin
            loop
                delete /*+ NOLOGGING */ ams_prc_p015_okey_quar del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_prc_p015_okey_data del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_prc_p015_okey_year del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_okey_open] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 02: Ghi nhan du lieu duoc xu ly
        begin
            insert /*+ APPEND */ into ams_prc_p015_okey_quar nologging (
                session_id,
                record_date,
                outlet_ams_id,
                branch_ams_id,
                effe_date,
                term_date,
                regency_code,
                from_date,
                to_date,
                quar_first_months_pis,
                quar_second_months_pis,
                quar_third_months_pis,
                quar_first_months_nfyp,
                quar_second_months_nfyp,
                quar_third_months_nfyp,
                quar_first_months_rfyp,
                quar_second_months_rfyp,
                quar_third_months_rfyp,
                quar_eperiod_afif,
                quar_eperiod_afis,
                quar_eperiod_pr36,
                quar_first_months_coll_etmt,
                quar_second_months_coll_etmt,
                quar_third_months_coll_etmt,
                quar_first_months_coll_real,
                quar_second_months_coll_real,
                quar_third_months_coll_real,
                quar_first_months_uvl_etmt,
                quar_second_months_uvl_etmt,
                quar_third_months_uvl_etmt,
                quar_first_months_uvl_real,
                quar_second_months_uvl_real,
                quar_third_months_uvl_real,
                quar_pile_pis,
                quar_period_nfyp,
                quar_period_rfyp,
                quar_coll_etmt,
                quar_coll_real,
                quar_coll_rate,
                months_acti,
                okey_asmt,
                okey_date
             )
            select /*+ CARDINALITY(outl, 100)*/
                pn_session_id,
                var_record_date,
                outl.outlet_ams_id,
                outl.branch_ams_id,
                outl.effe_date,
                outl.term_date,
                outl.regency_code,
                add_months(var_record_date, -2),
                var_record_date,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                null,
                null
            from ams_prc_outlets outl
            where outl.session_id = pn_session_id
                and outl.record_date = var_cond_date
                and outl.branch_ams_id = pv_outlet_ams_id
                and outl.term_date is null;
            commit;

            insert /*+ APPEND */ into ams_prc_p015_okey_year nologging (
                session_id,
                record_date,
                outlet_ams_id,
                branch_ams_id,
                effe_date,
                term_date,
                regency_code,
                regency_date,
                from_date,
                to_date,
                year_first_acti_qty,
                year_first_pis,
                year_first_nfyp,
                year_first_rfyp,
                year_first_pr36,
                year_first_coll_rate,
                year_first_ucol_rate,
                year_first_amst,
                year_second_acti_qty,
                year_second_pis,
                year_second_nfyp,
                year_second_rfyp,
                year_second_pr36,
                year_second_coll_rate,
                year_second_ucol_rate,
                year_second_amst,
                year_third_acti_qty,
                year_third_pis,
                year_third_nfyp,
                year_third_rfyp,
                year_third_pr36,
                year_third_coll_rate,
                year_third_ucol_rate,
                year_third_amst,
                year_fourth_acti_qty,
                year_fourth_pis,
                year_fourth_nfyp,
                year_fourth_rfyp,
                year_fourth_pr36,
                year_fourth_coll_rate,
                year_fourth_ucol_rate,
                year_fourth_amst,
                year_amst
            )
            select /*+ CARDINALITY(outl, 100)*/
                pn_session_id,
                var_dbegin,
                outl.outlet_ams_id,
                outl.branch_ams_id,
                outl.effe_date,
                outl.term_date,
                outl.regency_code,
                outl.regency_date,
                var_dbegin,
                var_dend,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                null,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                null,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                null,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                null,
                null
            from ams_prc_outlets outl
            where outl.session_id = pn_session_id
                and outl.record_date = var_cond_date
                and outl.branch_ams_id = pv_outlet_ams_id
                and outl.term_date is null;
            commit;

            -- Du lieu chi tiet
            for i in -2..0
            loop
                if (add_months(var_record_date, i) <= var_cond_date) then
                    insert /*+ APPEND */ into ams_prc_p015_okey_data nologging (
                        session_id,
                        record_date,
                        outlet_ams_id,
                        branch_ams_id,
                        effe_date,
                        term_date,
                        eperiod_afif,
                        eperiod_afis,
                        eperiod_pr36,
                        period_coll_etmt,
                        period_coll_real,
                        period_coll_rate,
                        period_nfyp,
                        period_rfyp,
                        pile_pis,
                        period_acti
                     )
                    select /*+ CARDINALITY(okey, 100)
                               CARDINALITY(outl, 100)*/
                        pn_session_id,
                        add_months(var_record_date, i),
                        outl.outlet_ams_id,
                        outl.branch_ams_id,
                        outl.effe_date,
                        outl.term_date,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0
                    from
                    (
                        select /*+ CARDINALITY(k, 100)*/
                            k.outlet_ams_id
                        from ams_prc_p015_okey_quar k
                        where k.session_id = pn_session_id
                            and k.record_date = var_record_date
                            and k.branch_ams_id = pv_outlet_ams_id
                    ) okey
                    join
                    (
                        select /*+ CARDINALITY(o, 100)*/
                            o.outlet_ams_id,
                            o.branch_ams_id,
                            o.agency_ams_id,
                            o.unit_ams_id,
                            o.regency_code,
                            o.regency_date,
                            o.effe_date,
                            o.term_date
                        from ams_prc_outlets o
                        where o.session_id = pn_session_id
                            and o.record_date = add_months(var_record_date, i)
                            and o.branch_ams_id = pv_outlet_ams_id
                    ) outl
                        on okey.outlet_ams_id = outl.outlet_ams_id;
                    commit;
                end if;
            end loop;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_okey_open] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 01/12/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_okey_data(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
        var_record_date date := trunc(pd_realize_date, 'MM');
        var_cur_date date := trunc(sysdate, 'MM');

        var_cond_date date := least(var_record_date, var_cur_date);
    begin
        -- Buoc 01: Chi tiet du lieu
        begin
           -- Buoc 01.A: Ghi nhan du lieu [RFYP]
            for i in -2..0
            loop
                merge /*+CARDINALITY(okey, 100)
                         CARDINALITY(upd, 100)*/
                    into ams_prc_p015_okey_data okey
                using
                    (
                        select /*+ CARDINALITY(outl, 100)
                                   CARDINALITY(rfyp, 100)
                                   CARDINALITY(ifyp, 100)
                                   CARDINALITY(retmt, 100)
                                   CARDINALITY(rreal, 100)
                                   CARDINALITY(uetmt, 100)
                                   CARDINALITY(ureal, 100)
                                   CARDINALITY(rissue, 100)*/
                            outl.outlet_ams_id,
                            outl.record_date,
                            rfyp.data_value data_rfyp,
                            ifyp.data_value data_ifyp,
                            retmt.data_value data_retmt,
                            rreal.data_value data_rreal,
                            uetmt.data_value data_uetmt,
                            ureal.data_value data_ureal,
                            rissue.data_value data_rissue,
                            case
                                when nvl(rissue.data_value, 0) > 0 then
                                    1
                                else
                                    0
                                end data_acti
                        from
                        (
                            select /*+ CARDINALITY(tmp, 100)*/
                                tmp.record_date,
                                tmp.outlet_ams_id
                            from ams_prc_p015_okey_data tmp
                            where tmp.session_id = pn_session_id
                                and tmp.record_date = add_months(var_record_date, i)
                                and tmp.branch_ams_id = pv_outlet_ams_id
                        ) outl
                        left join
                        (
                            select /*+ CARDINALITY(tmp, 100)*/
                                tmp.outlet_ams_id,
                                tmp.data_value
                            from ams_prc_data tmp
                            where tmp.session_id = pn_session_id
                              and tmp.record_date = add_months(var_record_date, i)
                              and tmp.branch_ams_id = pv_outlet_ams_id
                              and tmp.module_code = 'PROM'
                              and tmp.data_code = 'RFYP'
                        ) rfyp
                            on rfyp.outlet_ams_id = outl.outlet_ams_id
                        left join
                        (
                            select /*+ CARDINALITY(tmp, 100)*/
                                tmp.outlet_ams_id,
                                tmp.data_value
                            from ams_prc_data tmp
                            where tmp.session_id = pn_session_id
                              and tmp.record_date = add_months(var_record_date, i)
                              and tmp.branch_ams_id = pv_outlet_ams_id
                              and tmp.module_code = 'PROM'
                              and tmp.data_code = 'IFYP'
                        ) ifyp
                            on ifyp.outlet_ams_id = outl.outlet_ams_id
                        left join
                        (
                            select /*+ CARDINALITY(tmp, 100)*/
                                tmp.outlet_ams_id,
                                tmp.data_value
                            from ams_prc_data tmp
                            where tmp.session_id = pn_session_id
                                and tmp.record_date = add_months(var_record_date, i)
                                and tmp.branch_ams_id = pv_outlet_ams_id
                                and tmp.module_code = 'PROM'
                                and tmp.data_code = 'BILL'
                        ) retmt
                            on retmt.outlet_ams_id = outl.outlet_ams_id
                        left join
                        (
                            select /*+ CARDINALITY(tmp, 100)*/
                                tmp.outlet_ams_id,
                                tmp.data_value
                            from ams_prc_data tmp
                            where tmp.session_id = pn_session_id
                                and tmp.record_date = add_months(var_record_date, i)
                                and tmp.branch_ams_id = pv_outlet_ams_id
                                and tmp.module_code = 'PROM'
                                and tmp.data_code = 'PAYS'
                        ) rreal
                            on rreal.outlet_ams_id = outl.outlet_ams_id
                        left join
                        (
                            select /*+ CARDINALITY(tmp, 100)*/
                                tmp.outlet_ams_id,
                                tmp.data_value
                            from ams_prc_data tmp
                            where tmp.session_id = pn_session_id
                                and tmp.record_date = add_months(var_record_date, i)
                                and tmp.branch_ams_id = pv_outlet_ams_id
                                and tmp.module_code = 'PROM'
                                and tmp.data_code = 'UBILL'
                        ) uetmt
                            on uetmt.outlet_ams_id = outl.outlet_ams_id
                        left join
                        (
                            select /*+ CARDINALITY(tmp, 100)*/
                                tmp.outlet_ams_id,
                                tmp.data_value
                            from ams_prc_data tmp
                            where tmp.session_id = pn_session_id
                                and tmp.record_date = add_months(var_record_date, i)
                                and tmp.branch_ams_id = pv_outlet_ams_id
                                and tmp.module_code = 'PROM'
                                and tmp.data_code = 'UPAYS'
                        ) ureal
                            on ureal.outlet_ams_id = outl.outlet_ams_id
                        left join
                        (
                            select /*+ CARDINALITY(tmp, 100)*/
                                tmp.outlet_ams_id,
                                tmp.data_value
                            from ams_prc_data tmp
                            where tmp.session_id = pn_session_id
                                and tmp.record_date = add_months(var_record_date, i)
                                and tmp.branch_ams_id = pv_outlet_ams_id
                                and tmp.module_code = 'PROM'
                                and tmp.data_code = 'EFAC'
                        ) rissue
                            on rissue.outlet_ams_id = outl.outlet_ams_id
                    ) upd
                on (
                    pn_session_id = okey.session_id
                    and
                    upd.record_date = okey.record_date
                    and
                    upd.outlet_ams_id = okey.outlet_ams_id
                )
                when matched then
                    update
                        set
                            okey.period_rfyp = nvl(upd.data_rfyp, 0),
                            okey.period_nfyp = nvl(upd.data_ifyp, 0),
                            okey.period_coll_etmt = nvl(upd.data_retmt, 0),
                            okey.period_coll_real = nvl(upd.data_rreal, 0),
                            okey.period_ucol_etmt = nvl(upd.data_uetmt, 0),
                            okey.period_ucol_real = nvl(upd.data_ureal, 0),
                            okey.pile_pis = nvl(upd.data_rissue, 0),
                            okey.period_acti = nvl(upd.data_acti, 0);
                commit;
            end loop;

            merge /*+CARDINALITY(okey, 100)
                     CARDINALITY(upd, 100)*/
                into ams_prc_p015_okey_data okey
            using
                (
                    select /*+ CARDINALITY(outl, 100)
                               CARDINALITY(rafif, 100)
                               CARDINALITY(rafis, 100)*/
                        outl.outlet_ams_id,
                        outl.record_date,
                        rafif.data_value data_rafif,
                        rafis.data_value data_rafis
                    from
                    (
                        select /*+ CARDINALITY(tmp, 100)*/
                            tmp.record_date,
                            tmp.outlet_ams_id
                        from ams_prc_p015_okey_data tmp
                        where tmp.session_id = pn_session_id
                            and tmp.record_date = var_cond_date
                            and tmp.branch_ams_id = pv_outlet_ams_id
                    ) outl
                    left join
                    (
                        select /*+ CARDINALITY(tmp, 100)*/
                            tmp.outlet_ams_id,
                            tmp.data_value
                        from ams_prc_data tmp
                        where tmp.session_id = pn_session_id
                            and tmp.record_date = var_cond_date
                            and tmp.branch_ams_id = pv_outlet_ams_id
                            and tmp.module_code = 'PROM'
                            and tmp.data_code = 'IFAP'
                    ) rafif
                        on rafif.outlet_ams_id = outl.outlet_ams_id
                    left join
                    (
                        select /*+ CARDINALITY(tmp, 100)*/
                            tmp.outlet_ams_id,
                            tmp.data_value
                        from ams_prc_data tmp
                        where tmp.session_id = pn_session_id
                            and tmp.module_code = 'PROM'
                            and tmp.data_code = 'ISAP'
                            and tmp.record_date = var_cond_date
                            and tmp.branch_ams_id = pv_outlet_ams_id
                    ) rafis
                        on rafis.outlet_ams_id = outl.outlet_ams_id
                ) upd
            on (
                pn_session_id = okey.session_id
                and
                upd.record_date = okey.record_date
                and
                upd.outlet_ams_id = okey.outlet_ams_id
            )
            when matched then
                update
                    set
                        okey.eperiod_afif = nvl(upd.data_rafif, 0),
                        okey.eperiod_afis = nvl(upd.data_rafis, 0);
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_okey_data] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 02: Tong hop du lieu
        begin
            -- Buoc 02.A: Thang dau tien
            merge/*+CARDINALITY(okey, 100)
                    CARDINALITY(upd, 100)*/
                into ams_prc_p015_okey_quar okey
            using
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_ams_id,
                        tmp.period_rfyp,
                        tmp.period_nfyp,
                        tmp.period_coll_etmt,
                        tmp.period_coll_real,
                        tmp.period_ucol_etmt,
                        tmp.period_ucol_real,
                        tmp.pile_pis
                    from ams_prc_p015_okey_data tmp
                    where tmp.session_id = pn_session_id
                      and tmp.record_date = add_months(var_record_date, -2)
                      and tmp.branch_ams_id = pv_outlet_ams_id
                ) upd
            on (
                pn_session_id = okey.session_id
                and
                var_record_date = okey.record_date
                and
                upd.outlet_ams_id = okey.outlet_ams_id
            )
            when matched then
                update
                    set
                        okey.quar_first_months_pis = nvl(upd.pile_pis, 0),
                        okey.quar_first_months_nfyp = nvl(upd.period_nfyp, 0),
                        okey.quar_first_months_rfyp = nvl(upd.period_rfyp, 0),
                        okey.quar_first_months_coll_etmt = nvl(upd.period_coll_etmt, 0),
                        okey.quar_first_months_coll_real = nvl(upd.period_coll_real, 0),
                        okey.quar_first_months_uvl_etmt = nvl(upd.period_ucol_etmt, 0),
                        okey.quar_first_months_uvl_real = nvl(upd.period_ucol_real, 0);
            commit;

            -- Buoc 02.B:Thang thu 2
            merge/*+CARDINALITY(okey, 100)
                    CARDINALITY(upd, 100)*/
                into ams_prc_p015_okey_quar okey
            using
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_ams_id,
                        tmp.period_rfyp,
                        tmp.period_nfyp,
                        tmp.period_coll_etmt,
                        tmp.period_coll_real,
                        tmp.period_ucol_etmt,
                        tmp.period_ucol_real,
                        tmp.pile_pis
                    from ams_prc_p015_okey_data tmp
                    where tmp.session_id = pn_session_id
                      and tmp.record_date = add_months(var_record_date, -1)
                      and tmp.branch_ams_id = pv_outlet_ams_id
                ) upd
            on (
                pn_session_id = okey.session_id
                and
                var_record_date = okey.record_date
                and
                upd.outlet_ams_id = okey.outlet_ams_id
            )
            when matched then
                update
                    set
                        okey.quar_second_months_pis = nvl(upd.pile_pis, 0),
                        okey.quar_second_months_nfyp = nvl(upd.period_nfyp, 0),
                        okey.quar_second_months_rfyp = nvl(upd.period_rfyp, 0),
                        okey.quar_second_months_coll_etmt = nvl(upd.period_coll_etmt, 0),
                        okey.quar_second_months_coll_real = nvl(upd.period_coll_real, 0),
                        okey.quar_second_months_uvl_etmt = nvl(upd.period_ucol_etmt, 0),
                        okey.quar_second_months_uvl_real = nvl(upd.period_ucol_real, 0);
            commit;

            -- Buoc 02.C: Thang thu 3
            merge/*+CARDINALITY(okey, 100)
                    CARDINALITY(upd, 100)*/
                into ams_prc_p015_okey_quar okey
            using
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_ams_id,
                        tmp.period_rfyp,
                        tmp.period_nfyp,
                        tmp.period_coll_etmt,
                        tmp.period_coll_real,
                        tmp.period_ucol_etmt,
                        tmp.period_ucol_real,
                        tmp.pile_pis
                    from ams_prc_p015_okey_data tmp
                    where tmp.session_id = pn_session_id
                      and tmp.record_date = add_months(var_record_date, -0)
                      and tmp.branch_ams_id = pv_outlet_ams_id
                ) upd
            on (
                pn_session_id = okey.session_id
                and
                var_record_date = okey.record_date
                and
                upd.outlet_ams_id = okey.outlet_ams_id
            )
            when matched then
                update
                    set
                        okey.quar_third_months_pis = nvl(upd.pile_pis, 0),
                        okey.quar_third_months_nfyp = nvl(upd.period_nfyp, 0),
                        okey.quar_third_months_rfyp = nvl(upd.period_rfyp, 0),
                        okey.quar_third_months_coll_etmt = nvl(upd.period_coll_etmt, 0),
                        okey.quar_third_months_coll_real = nvl(upd.period_coll_real, 0),
                        okey.quar_third_months_uvl_etmt = nvl(upd.period_ucol_etmt, 0),
                        okey.quar_third_months_uvl_real = nvl(upd.period_ucol_real, 0);
            commit;

            -- Buoc 02.D: Tong hop
            merge/*+CARDINALITY(okey, 100)
                    CARDINALITY(upd, 100)*/
                into ams_prc_p015_okey_quar okey
            using
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_ams_id,
                        sum(tmp.period_rfyp) period_rfyp,
                        sum(tmp.period_nfyp) period_nfyp,
                        sum(tmp.eperiod_afif) eperiod_afif,
                        sum(tmp.eperiod_afis) eperiod_afis,
                        sum(tmp.period_coll_etmt) period_coll_etmt,
                        sum(tmp.period_coll_real) period_coll_real,
                        sum(tmp.period_ucol_etmt) period_ucol_etmt,
                        sum(tmp.period_ucol_real) period_ucol_real,
                        sum(tmp.pile_pis) pile_pis,
                        sum(tmp.period_acti) period_acti
                    from ams_prc_p015_okey_data tmp
                    where tmp.session_id = pn_session_id
                      and tmp.record_date
                          between add_months(var_record_date, -2)
                              and add_months(var_record_date, 0)
                      and tmp.branch_ams_id = pv_outlet_ams_id
                    group by tmp.outlet_ams_id
                ) upd
            on (
                pn_session_id = okey.session_id
                and
                var_record_date = okey.record_date
                and
                upd.outlet_ams_id = okey.outlet_ams_id
            )
            when matched then
                update
                    set
                        okey.quar_pile_pis = nvl(upd.pile_pis, 0),
                        okey.quar_period_nfyp = nvl(upd.period_nfyp, 0),
                        okey.quar_period_rfyp = nvl(upd.period_rfyp, 0),
                        okey.quar_eperiod_afif = nvl(upd.eperiod_afif, 0),
                        okey.quar_eperiod_afis = nvl(upd.eperiod_afis, 0),
                        okey.quar_coll_etmt = nvl(upd.period_coll_etmt, 0),
                        okey.quar_coll_real = nvl(upd.period_coll_real, 0),
                        okey.quar_ucol_etmt = nvl(upd.period_ucol_etmt, 0),
                        okey.quar_ucol_real = nvl(upd.period_ucol_real, 0),
                        okey.months_acti = nvl(upd.period_acti, 0);
            commit;

            update /*+ NOLOGGING */ ams_prc_p015_okey_quar okey
            set
                okey.quar_eperiod_pr36 =
                    round(
                        least(100,
                            case
                                when nvl(okey.quar_eperiod_afis, 0) <= 0 then
                                    100
                                else
                                    nvl(okey.quar_eperiod_afif, 0) / nvl(okey.quar_eperiod_afis, 0) * 100
                                end
                            ),
                        2
                    ),
                okey.quar_coll_rate =
                    round(
                        least(100,
                            case
                                when nvl(okey.quar_coll_etmt, 0) <= 0 then
                                    100
                                else
                                    nvl(okey.quar_coll_real, 0) / nvl(okey.quar_coll_etmt, 0) * 100
                                end
                            ),
                        2
                    ),
                okey.quar_ucol_rate =
                    round(
                        least(100,
                            case
                                when nvl(okey.quar_ucol_etmt, 0) <= 0 then
                                    100
                                else
                                    nvl(okey.quar_ucol_real, 0) / nvl(okey.quar_ucol_etmt, 0) * 100
                                end
                            ),
                        2
                    )
            where okey.session_id = pn_session_id
                and okey.branch_ams_id = pv_outlet_ams_id
                and okey.record_date = var_record_date;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_okey_data] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 01/12/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
        Date Update: 29/10/2014
    */
    procedure mmxv_modl_okey_cond(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
        var_record_date date := trunc(pd_realize_date, 'MM');
        var_cur_date date := trunc(sysdate, 'MM');

        var_cond_date date := least(var_record_date, var_cur_date);
        var_dbegin date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/PROM/P2015/INFO/BDATE');
        var_dend date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/PROM/P2015/INFO/EDATE');

        var_cond_fyp number(16,2);
        var_cond_acti number(5);
        var_cond_pr36 number(5,2);
        var_cond_scol number(5,2);
        var_cond_ucol number(5,2);

        var_ykey_qmont number(5);

        var_skey_1ckey number(5);
        var_skey_2ckey number(5);
        var_skey_2fyp number(16,2);

        var_pkey_1ckey number(5);
        var_pkey_2ckey number(5);
        var_pkey_2fyp number(16,2);
    begin
        -- Buoc 01: Lay thong tin cau hinh
        begin
            var_cond_fyp := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/OKEY/QKEY/FYP');
            var_cond_acti := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/OKEY/QKEY/ACTI');
            var_cond_pr36 := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/OKEY/QKEY/PR36');
            var_cond_scol := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/OKEY/QKEY/SCOL');
            var_cond_ucol := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/OKEY/QKEY/UCOL');

            var_ykey_qmont := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/OKEY/YKEY/QMONT');

            var_skey_1ckey := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/OKEY/SKEY/C1/CKEY');
            var_skey_2ckey := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/OKEY/SKEY/C2/CKEY');
            var_skey_2fyp := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/OKEY/SKEY/C2/FYP');

            var_pkey_1ckey := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/OKEY/PKEY/C1/CKEY');
            var_pkey_2ckey := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/OKEY/PKEY/C2/CKEY');
            var_pkey_2fyp := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/PROM/P2015/OKEY/PKEY/C2/FYP');
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_okey_cond] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 02: Xet chu luc quy
        begin
            update /*+ NOLOGGING */ ams_prc_p015_okey_quar okey
                set okey.okey_asmt = 'OKEY',
                    okey.okey_date = add_months(var_record_date, 1)
            where okey.session_id = pn_session_id
                and okey.record_date = var_record_date
                and okey.branch_ams_id = pv_outlet_ams_id
                and okey.regency_code in ('CV05', 'CV00', 'CV01')
                and okey.quar_period_rfyp >= nvl(var_cond_fyp, 0)
                and okey.months_acti >= nvl(var_cond_acti, 0)
                and okey.quar_eperiod_pr36 >= nvl(var_cond_pr36, 0)
                and okey.quar_coll_rate >= nvl(var_cond_scol, 0)
                and okey.quar_ucol_rate >= nvl(var_cond_ucol, 0);
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_okey_cond] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 03: Ghi nhan thong tin chu luc nam
        begin
            -- Buoc 03.A. Lay chi tieu quy thu nhat trong ky [nam]
            if (add_months(var_dbegin, 2) < var_record_date) then
                merge /*+ CARDINALITY(ytod, 100)
                          CARDINALITY(upd, 100) */
                    into ams_prc_p015_okey_year ytod
                using
                    (
                         select /*+ CARDINALITY(quar, 100)*/
                             *
                         from ams_con_p015_okey_quar quar
                         where quar.record_date = add_months(var_dbegin, 2)
                    ) upd
                on (
                    var_dbegin = ytod.record_date
                    and
                    upd.outlet_ams_id = ytod.outlet_ams_id
                )
                when matched then
                    update
                        set
                            ytod.year_first_acti_qty = nvl(upd.months_acti, 0),
                            ytod.year_first_pis = nvl(upd.quar_pile_pis, 0),
                            ytod.year_first_nfyp = nvl(upd.quar_period_nfyp, 0),
                            ytod.year_first_rfyp = nvl(upd.quar_period_rfyp, 0),
                            ytod.year_first_pr36 = nvl(upd.quar_eperiod_pr36, 0),
                            ytod.year_first_coll_rate = nvl(upd.quar_coll_rate, 0),
                            ytod.year_first_ucol_rate = nvl(upd.quar_ucol_rate, 0),
                            ytod.year_first_amst = upd.okey_asmt;
                commit;
            elsif (add_months(var_dbegin, 2) = var_record_date) then
                merge /*+ CARDINALITY(ytod, 100)
                          CARDINALITY(upd, 100) */
                    into ams_prc_p015_okey_year ytod
                using
                    (
                         select /*+ CARDINALITY(quar, 100)*/
                             *
                         from ams_prc_p015_okey_quar quar
                         where quar.record_date = add_months(var_dbegin, 2)
                    ) upd
                on (
                    var_dbegin = ytod.record_date
                    and
                    upd.outlet_ams_id = ytod.outlet_ams_id
                )
                when matched then
                    update
                        set
                            ytod.year_first_acti_qty = nvl(upd.months_acti, 0),
                            ytod.year_first_pis = nvl(upd.quar_pile_pis, 0),
                            ytod.year_first_nfyp = nvl(upd.quar_period_nfyp, 0),
                            ytod.year_first_rfyp = nvl(upd.quar_period_rfyp, 0),
                            ytod.year_first_pr36 = nvl(upd.quar_eperiod_pr36, 0),
                            ytod.year_first_coll_rate = nvl(upd.quar_coll_rate, 0),
                            ytod.year_first_ucol_rate = nvl(upd.quar_ucol_rate, 0),
                            ytod.year_first_amst = upd.okey_asmt;
                commit;
            end if;

            -- Buoc 03.B. Lay chi tieu quy thu hai trong ky [nam]
            if (add_months(var_dbegin, 5) < var_record_date) then
                merge /*+ CARDINALITY(ytod, 100)
                          CARDINALITY(upd, 100) */
                    into ams_prc_p015_okey_year ytod
                using
                    (
                         select /*+ CARDINALITY(quar, 100)*/
                             *
                         from ams_con_p015_okey_quar quar
                         where quar.record_date = add_months(var_dbegin, 5)
                    ) upd
                on (
                    var_dbegin = ytod.record_date
                    and
                    upd.outlet_ams_id = ytod.outlet_ams_id
                )
                when matched then
                    update
                        set
                            ytod.year_second_acti_qty = nvl(upd.months_acti, 0),
                            ytod.year_second_pis = nvl(upd.quar_pile_pis, 0),
                            ytod.year_second_nfyp = nvl(upd.quar_period_nfyp, 0),
                            ytod.year_second_rfyp = nvl(upd.quar_period_rfyp, 0),
                            ytod.year_second_pr36 = nvl(upd.quar_eperiod_pr36, 0),
                            ytod.year_second_coll_rate = nvl(upd.quar_coll_rate, 0),
                            ytod.year_second_ucol_rate = nvl(upd.quar_ucol_rate, 0),
                            ytod.year_second_amst = upd.okey_asmt;
                commit;
            elsif (add_months(var_dbegin, 5) = var_record_date) then
                merge /*+ CARDINALITY(ytod, 100)
                          CARDINALITY(upd, 100) */
                    into ams_prc_p015_okey_year ytod
                using
                    (
                         select /*+ CARDINALITY(quar, 100)*/
                             *
                         from ams_prc_p015_okey_quar quar
                         where quar.record_date = add_months(var_dbegin, 5)
                    ) upd
                on (
                    var_dbegin = ytod.record_date
                    and
                    upd.outlet_ams_id = ytod.outlet_ams_id
                )
                when matched then
                    update
                        set
                            ytod.year_second_acti_qty = nvl(upd.months_acti, 0),
                            ytod.year_second_pis = nvl(upd.quar_pile_pis, 0),
                            ytod.year_second_nfyp = nvl(upd.quar_period_nfyp, 0),
                            ytod.year_second_rfyp = nvl(upd.quar_period_rfyp, 0),
                            ytod.year_second_pr36 = nvl(upd.quar_eperiod_pr36, 0),
                            ytod.year_second_coll_rate = nvl(upd.quar_coll_rate, 0),
                            ytod.year_second_ucol_rate = nvl(upd.quar_ucol_rate, 0),
                            ytod.year_second_amst = upd.okey_asmt;
                commit;
            end if;

            -- Buoc 03.C. Lay chi tieu quy thu ba trong ky [nam]
            if (add_months(var_dbegin, 8) < var_record_date) then
                merge /*+ CARDINALITY(ytod, 100)
                          CARDINALITY(upd, 100) */
                    into ams_prc_p015_okey_year ytod
                using
                    (
                         select /*+ CARDINALITY(quar, 100)*/
                             *
                         from ams_con_p015_okey_quar quar
                         where quar.record_date = add_months(var_dbegin, 8)
                    ) upd
                on (
                    var_dbegin = ytod.record_date
                    and
                    upd.outlet_ams_id = ytod.outlet_ams_id
                )
                when matched then
                    update
                        set
                            ytod.year_third_acti_qty = nvl(upd.months_acti, 0),
                            ytod.year_third_pis = nvl(upd.quar_pile_pis, 0),
                            ytod.year_third_nfyp = nvl(upd.quar_period_nfyp, 0),
                            ytod.year_third_rfyp = nvl(upd.quar_period_rfyp, 0),
                            ytod.year_third_pr36 = nvl(upd.quar_eperiod_pr36, 0),
                            ytod.year_third_coll_rate = nvl(upd.quar_coll_rate, 0),
                            ytod.year_third_ucol_rate = nvl(upd.quar_ucol_rate, 0),
                            ytod.year_third_amst = upd.okey_asmt;
                commit;
            elsif (add_months(var_dbegin, 8) = var_record_date) then
                merge /*+ CARDINALITY(ytod, 100)
                          CARDINALITY(upd, 100) */
                    into ams_prc_p015_okey_year ytod
                using
                    (
                         select /*+ CARDINALITY(quar, 100)*/
                             *
                         from ams_prc_p015_okey_quar quar
                         where quar.record_date = add_months(var_dbegin, 8)
                    ) upd
                on (
                    var_dbegin = ytod.record_date
                    and
                    upd.outlet_ams_id = ytod.outlet_ams_id
                )
                when matched then
                    update
                        set
                            ytod.year_third_acti_qty = nvl(upd.months_acti, 0),
                            ytod.year_third_pis = nvl(upd.quar_pile_pis, 0),
                            ytod.year_third_nfyp = nvl(upd.quar_period_nfyp, 0),
                            ytod.year_third_rfyp = nvl(upd.quar_period_rfyp, 0),
                            ytod.year_third_pr36 = nvl(upd.quar_eperiod_pr36, 0),
                            ytod.year_third_coll_rate = nvl(upd.quar_coll_rate, 0),
                            ytod.year_third_ucol_rate = nvl(upd.quar_ucol_rate, 0),
                            ytod.year_third_amst = upd.okey_asmt;
                commit;
            end if;

            -- Buoc 03.04. Lay chi tieu quy thu tu trong ky [nam]
            if (add_months(var_dbegin, 11) < var_record_date) then
                merge /*+ CARDINALITY(ytod, 100)
                          CARDINALITY(upd, 100) */
                    into ams_prc_p015_okey_year ytod
                using
                    (
                         select /*+ CARDINALITY(quar, 100)*/
                             *
                         from ams_con_p015_okey_quar quar
                         where quar.record_date = add_months(var_dbegin, 11)
                    ) upd
                on (
                    var_dbegin = ytod.record_date
                    and
                    upd.outlet_ams_id = ytod.outlet_ams_id
                )
                when matched then
                    update
                        set
                            ytod.year_fourth_acti_qty = nvl(upd.months_acti, 0),
                            ytod.year_fourth_pis = nvl(upd.quar_pile_pis, 0),
                            ytod.year_fourth_nfyp = nvl(upd.quar_period_nfyp, 0),
                            ytod.year_fourth_rfyp = nvl(upd.quar_period_rfyp, 0),
                            ytod.year_fourth_pr36 = nvl(upd.quar_eperiod_pr36, 0),
                            ytod.year_fourth_coll_rate = nvl(upd.quar_coll_rate, 0),
                            ytod.year_fourth_ucol_rate = nvl(upd.quar_ucol_rate, 0),
                            ytod.year_fourth_amst = upd.okey_asmt;
                commit;
            elsif (add_months(var_dbegin, 11) = var_record_date) then
                merge /*+ CARDINALITY(ytod, 100)
                          CARDINALITY(upd, 100) */
                    into ams_prc_p015_okey_year ytod
                using
                    (
                         select /*+ CARDINALITY(quar, 100)*/
                             *
                         from ams_prc_p015_okey_quar quar
                         where quar.record_date = add_months(var_dbegin, 11)
                    ) upd
                on (
                    var_dbegin = ytod.record_date
                    and
                    upd.outlet_ams_id = ytod.outlet_ams_id
                )
                when matched then
                    update
                        set
                            ytod.year_fourth_acti_qty = nvl(upd.months_acti, 0),
                            ytod.year_fourth_pis = nvl(upd.quar_pile_pis, 0),
                            ytod.year_fourth_nfyp = nvl(upd.quar_period_nfyp, 0),
                            ytod.year_fourth_rfyp = nvl(upd.quar_period_rfyp, 0),
                            ytod.year_fourth_pr36 = nvl(upd.quar_eperiod_pr36, 0),
                            ytod.year_fourth_coll_rate = nvl(upd.quar_coll_rate, 0),
                            ytod.year_fourth_ucol_rate = nvl(upd.quar_ucol_rate, 0),
                            ytod.year_fourth_amst = upd.okey_asmt;
                commit;
            end if;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_okey_cond] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 04: Xet chu luc nam
        begin
            -- Buoc 04.A: Danh hieu TVV chu luc nam
            update /*+ NOLOGGING */ ams_prc_p015_okey_year okey
                set
                    okey.year_amst = 'OKEY'
            where okey.record_date = var_dbegin
                and okey.branch_ams_id = pv_outlet_ams_id
                and okey.regency_code in ('CV05', 'CV00', 'CV01', 'CV06')
                and
                (
                    (
                        case
                            when okey.year_first_amst in ('OKEY') then
                                1
                            else
                                0
                            end
                    ) +
                    (
                        case
                            when okey.year_second_amst in ('OKEY') then
                                1
                            else
                                0
                            end
                    ) +
                    (
                        case
                            when okey.year_third_amst in ('OKEY') then
                                1
                            else
                                0
                            end
                    ) +
                    (
                        case
                            when okey.year_fourth_amst in ('OKEY') then
                                1
                            else
                                0
                            end
                    )
                ) >= nvl(var_ykey_qmont, 0);
            commit;

            -- Buoc 04.B: Danh hieu TVV cap cao nam
            update /*+ NOLOGGING */ ams_prc_p015_okey_year okey
                set
                    okey.year_amst = 'SENI'
            where okey.record_date = var_dbegin
                and okey.branch_ams_id = pv_outlet_ams_id
                and okey.regency_code in ('CV05', 'CV00', 'CV01', 'CV06')
                and
                (
                    (
                        (
                            (
                                case
                                    when okey.year_first_amst in ('OKEY') then
                                        1
                                    else
                                        0
                                    end
                            ) +
                            (
                                case
                                    when okey.year_second_amst in ('OKEY') then
                                        1
                                    else
                                        0
                                    end
                            ) +
                            (
                                case
                                    when okey.year_third_amst in ('OKEY') then
                                        1
                                    else
                                        0
                                    end
                            ) +
                            (
                                case
                                    when okey.year_fourth_amst in ('OKEY') then
                                        1
                                    else
                                        0
                                    end
                            )
                        ) >= nvl(var_skey_1ckey, 0)
                    )
                    or
                    (
                        (
                            (
                                case
                                    when okey.year_first_amst in ('OKEY') and nvl(okey.year_first_rfyp, 0) >= nvl(var_skey_2fyp, 0) then
                                        1
                                    else
                                        0
                                    end
                            ) +
                            (
                                case
                                    when okey.year_second_amst in ('OKEY') and nvl(okey.year_second_rfyp, 0) >= nvl(var_skey_2fyp, 0) then
                                        1
                                    else
                                        0
                                    end
                            ) +
                            (
                                case
                                    when okey.year_third_amst in ('OKEY') and nvl(okey.year_third_rfyp, 0) >= nvl(var_skey_2fyp, 0) then
                                        1
                                    else
                                        0
                                    end
                            ) +
                            (
                                case
                                    when okey.year_fourth_amst in ('OKEY') and nvl(okey.year_fourth_rfyp, 0) >= nvl(var_skey_2fyp, 0) then
                                        1
                                    else
                                        0
                                    end
                            )
                        ) >= nvl(var_skey_2ckey, 0)
                    )
                );
            commit;

            -- Buoc 04.C: Danh hieu TVV ngoai hang nam
            update /*+ NOLOGGING */ ams_prc_p015_okey_year okey
               set okey.year_amst = 'PRO'
            where okey.record_date = var_dbegin
                and okey.branch_ams_id = pv_outlet_ams_id
                and okey.regency_code in ('CV05', 'CV00', 'CV01', 'CV06')
                and
                (
                    (
                        (
                            (
                                case
                                    when okey.year_first_amst in ('OKEY') then
                                        1
                                    else
                                        0
                                    end
                            ) +
                            (
                                case
                                    when okey.year_second_amst in ('OKEY') then
                                        1
                                    else
                                        0
                                    end
                            ) +
                            (
                                case
                                    when okey.year_third_amst in ('OKEY') then
                                        1
                                    else
                                        0
                                    end
                            ) +
                            (
                                case
                                    when okey.year_fourth_amst in ('OKEY') then
                                        1
                                    else
                                        0
                                    end
                            )
                        ) >= nvl(var_pkey_1ckey, 0)
                    )
                    or
                    (
                        (
                            (
                                case
                                    when okey.year_first_amst in ('OKEY') and nvl(okey.year_first_rfyp, 0) >= nvl(var_pkey_2fyp, 0) then
                                        1
                                    else
                                        0
                                    end
                            ) +
                            (
                                case
                                    when okey.year_second_amst in ('OKEY') and nvl(okey.year_second_rfyp, 0) >= nvl(var_pkey_2fyp, 0) then
                                        1
                                    else
                                        0
                                    end
                            ) +
                            (
                                case
                                    when okey.year_third_amst in ('OKEY') and nvl(okey.year_third_rfyp, 0) >= nvl(var_pkey_2fyp, 0) then
                                        1
                                    else
                                        0
                                    end
                            ) +
                            (
                                case
                                    when okey.year_fourth_amst in ('OKEY') and nvl(okey.year_fourth_rfyp, 0) >= nvl(var_pkey_2fyp, 0) then
                                        1
                                    else
                                        0
                                    end
                            )
                        ) >= nvl(var_pkey_2ckey, 0)
                    )
                );
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_okey_cond] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 01/12/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_okey_comp(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
        var_record_date date := trunc(pd_realize_date, 'MM');
        var_cur_date date := trunc(sysdate, 'MM');

        var_cond_date date := least(var_record_date, var_cur_date);
        var_dbegin date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/PROM/P2015/INFO/BDATE');
        var_dend date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/PROM/P2015/INFO/EDATE');
    begin
       -- Buoc 01: Xoa du lieu neu da ton tai
        begin
            loop
                delete /*+ NOLOGGING */ ams_con_p015_okey_quar del
                where del.record_date = var_record_date
                    and del.branch_ams_id = pv_outlet_ams_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_con_p015_okey_data del
                where del.record_date = var_record_date
                    and del.branch_ams_id = pv_outlet_ams_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_con_p015_okey_year del
                where del.record_date = var_dbegin
                    and del.branch_ams_id = pv_outlet_ams_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_okey_comp] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 02: Di chuyen du lieu
        begin
            insert /*+ APPEND */ into ams_con_p015_okey_quar nologging (
                record_date,
                outlet_ams_id,
                branch_ams_id,
                effe_date,
                term_date,
                regency_code,
                from_date,
                to_date,
                quar_first_months_pis,
                quar_second_months_pis,
                quar_third_months_pis,
                quar_first_months_nfyp,
                quar_second_months_nfyp,
                quar_third_months_nfyp,
                quar_first_months_rfyp,
                quar_second_months_rfyp,
                quar_third_months_rfyp,
                quar_eperiod_afif,
                quar_eperiod_afis,
                quar_eperiod_pr36,
                quar_first_months_coll_etmt,
                quar_second_months_coll_etmt,
                quar_third_months_coll_etmt,
                quar_first_months_coll_real,
                quar_second_months_coll_real,
                quar_third_months_coll_real,
                quar_first_months_uvl_etmt,
                quar_second_months_uvl_etmt,
                quar_third_months_uvl_etmt,
                quar_first_months_uvl_real,
                quar_second_months_uvl_real,
                quar_third_months_uvl_real,
                quar_pile_pis,
                quar_period_nfyp,
                quar_period_rfyp,
                quar_coll_etmt,
                quar_coll_real,
                quar_coll_rate,
                quar_ucol_etmt,
                quar_ucol_real,
                quar_ucol_rate,
                months_acti,
                okey_asmt,
                okey_date,
                create_user,
                update_user,
                create_datetime,
                update_datetime
            )
            select /*+ CARDINALITY(prc, 100)*/
                var_record_date,
                prc.outlet_ams_id,
                prc.branch_ams_id,
                prc.effe_date,
                prc.term_date,
                prc.regency_code,
                prc.from_date,
                prc.to_date,
                prc.quar_first_months_pis,
                prc.quar_second_months_pis,
                prc.quar_third_months_pis,
                prc.quar_first_months_nfyp,
                prc.quar_second_months_nfyp,
                prc.quar_third_months_nfyp,
                prc.quar_first_months_rfyp,
                prc.quar_second_months_rfyp,
                prc.quar_third_months_rfyp,
                prc.quar_eperiod_afif,
                prc.quar_eperiod_afis,
                prc.quar_eperiod_pr36,
                prc.quar_first_months_coll_etmt,
                prc.quar_second_months_coll_etmt,
                prc.quar_third_months_coll_etmt,
                prc.quar_first_months_coll_real,
                prc.quar_second_months_coll_real,
                prc.quar_third_months_coll_real,
                prc.quar_first_months_uvl_etmt,
                prc.quar_second_months_uvl_etmt,
                prc.quar_third_months_uvl_etmt,
                prc.quar_first_months_uvl_real,
                prc.quar_second_months_uvl_real,
                prc.quar_third_months_uvl_real,
                prc.quar_pile_pis,
                prc.quar_period_nfyp,
                prc.quar_period_rfyp,
                prc.quar_coll_etmt,
                prc.quar_coll_real,
                prc.quar_coll_rate,
                prc.quar_ucol_etmt,
                prc.quar_ucol_real,
                prc.quar_ucol_rate,
                prc.months_acti,
                prc.okey_asmt,
                prc.okey_date,
                pv_user,
                pv_user,
                sysdate,
                sysdate
            from ams_prc_p015_okey_quar prc
            where prc.session_id = pn_session_id
                and prc.record_date = var_record_date
                and prc.branch_ams_id = pv_outlet_ams_id;
            commit;

            insert /*+ APPEND */ into ams_con_p015_okey_data nologging (
                record_date,
                outlet_ams_id,
                branch_ams_id,
                effe_date,
                term_date,
                eperiod_afif,
                eperiod_afis,
                eperiod_pr36,
                period_coll_etmt,
                period_coll_real,
                period_coll_rate,
                period_ucol_etmt,
                period_ucol_real,
                period_ucol_rate,
                period_nfyp,
                period_rfyp,
                pile_pis,
                period_acti,
                create_user,
                update_user,
                create_datetime,
                update_datetime
            )
            select /*+ CARDINALITY(prc, 100)*/
                var_record_date,
                prc.outlet_ams_id,
                prc.branch_ams_id,
                prc.effe_date,
                prc.term_date,
                prc.eperiod_afif,
                prc.eperiod_afis,
                prc.eperiod_pr36,
                prc.period_coll_etmt,
                prc.period_coll_real,
                prc.period_coll_rate,
                prc.period_ucol_etmt,
                prc.period_ucol_real,
                prc.period_ucol_rate,
                prc.period_nfyp,
                prc.period_rfyp,
                prc.pile_pis,
                prc.period_acti,
                pv_user,
                pv_user,
                sysdate,
                sysdate
            from ams_prc_p015_okey_data prc
            where prc.session_id = pn_session_id
                and prc.branch_ams_id = pv_outlet_ams_id;
            commit;

            insert /*+ APPEND */ into ams_con_p015_okey_year nologging (
                record_date,
                outlet_ams_id,
                branch_ams_id,
                effe_date,
                term_date,
                regency_code,
                regency_date,
                from_date,
                to_date,
                year_first_acti_qty,
                year_first_pis,
                year_first_nfyp,
                year_first_rfyp,
                year_first_pr36,
                year_first_coll_rate,
                year_first_ucol_rate,
                year_first_amst,
                year_second_acti_qty,
                year_second_pis,
                year_second_nfyp,
                year_second_rfyp,
                year_second_pr36,
                year_second_coll_rate,
                year_second_ucol_rate,
                year_second_amst,
                year_third_acti_qty,
                year_third_pis,
                year_third_nfyp,
                year_third_rfyp,
                year_third_pr36,
                year_third_coll_rate,
                year_third_ucol_rate,
                year_third_amst,
                year_fourth_acti_qty,
                year_fourth_pis,
                year_fourth_nfyp,
                year_fourth_rfyp,
                year_fourth_pr36,
                year_fourth_coll_rate,
                year_fourth_ucol_rate,
                year_fourth_amst,
                year_amst,
                create_user,
                update_user,
                create_datetime,
                update_datetime
            )
            select /*+ CARDINALITY(prc, 100)*/
                cast(trunc(var_record_date, 'YYYY') as date),
                prc.outlet_ams_id,
                prc.branch_ams_id,
                prc.effe_date,
                prc.term_date,
                prc.regency_code,
                prc.regency_date,
                prc.from_date,
                prc.to_date,
                prc.year_first_acti_qty,
                prc.year_first_pis,
                prc.year_first_nfyp,
                prc.year_first_rfyp,
                prc.year_first_pr36,
                prc.year_first_coll_rate,
                prc.year_first_ucol_rate,
                prc.year_first_amst,
                prc.year_second_acti_qty,
                prc.year_second_pis,
                prc.year_second_nfyp,
                prc.year_second_rfyp,
                prc.year_second_pr36,
                prc.year_second_coll_rate,
                prc.year_second_ucol_rate,
                prc.year_second_amst,
                prc.year_third_acti_qty,
                prc.year_third_pis,
                prc.year_third_nfyp,
                prc.year_third_rfyp,
                prc.year_third_pr36,
                prc.year_third_coll_rate,
                prc.year_third_ucol_rate,
                prc.year_third_amst,
                prc.year_fourth_acti_qty,
                prc.year_fourth_pis,
                prc.year_fourth_nfyp,
                prc.year_fourth_rfyp,
                prc.year_fourth_pr36,
                prc.year_fourth_coll_rate,
                prc.year_fourth_ucol_rate,
                prc.year_fourth_amst,
                prc.year_amst,
                pv_user,
                pv_user,
                sysdate,
                sysdate
            from ams_prc_p015_okey_year prc
            where prc.session_id = pn_session_id
                and prc.branch_ams_id = pv_outlet_ams_id;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_okey_comp] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 01/12/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_okey_close(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
    begin
        -- Buoc 01: Xoa du lieu neu da ton tai
        begin
            loop
                delete /*+ NOLOGGING */ ams_prc_p015_okey_quar del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_prc_p015_okey_data del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_prc_p015_okey_year del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_okey_close] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 11/12/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure mmxv_modl_clean(pn_session_id number,
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
    begin
        -- Buoc 01: Xoa du lieu tam thoi
        begin
            loop
                delete /*+ NOLOGGING */ ams_prc_outlets del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_prc_blocks del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_prc_data del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_prc_c015_employments del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            loop
                delete /*+ NOLOGGING */ ams_prc_c015_accounts del
                where del.session_id = pn_session_id
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_PROM_MMXV.mmxv_modl_clean] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
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
end AMS_MODL_PROM_MMXV;
/
