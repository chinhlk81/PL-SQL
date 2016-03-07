create or replace package ams.AMS_MODL_STORES is

    -----------------------------------------------------------------
    /* BEGIN VARIABLE*/
    -----------------------------------------------------------------
    WARE_ROOT CONSTANT VARCHAR2(32) := 'ROOT';
    LINKTAL CONSTANT VARCHAR2(32) := 'DTAL';
    LINKBVL CONSTANT VARCHAR2(32) := 'BVLDB';

    CORE_TALISMAN CONSTANT VARCHAR2(32) := 'TAL';
    CORE_BVLIFE CONSTANT VARCHAR2(32) := 'BVL';
    CORE_DBW CONSTANT VARCHAR2(32) := 'DBW';

    ACTION_IS_PROCESSING CONSTANT VARCHAR2(1) := 'R';
    ACTION_IS_FINISHED CONSTANT VARCHAR2(1) := 'F';

    DBACK CONSTANT NUMBER(5) := -15;
    MBACK CONSTANT NUMBER(5) := -1;
    -----------------------------------------------------------------
    /* END VARIABLE*/
    -----------------------------------------------------------------

    procedure main;

    -----------------------------------------------------------------
    /* BEGIN PROCEDURE*/
    -----------------------------------------------------------------
    procedure bin_daily(pd_realize_date date,
        pv_user varchar2);

    procedure bin_monthly(pd_realize_date date,
        pv_user varchar2);

    procedure bin_range(pd_from_date date,
        pd_to_date date,
        pv_user varchar2);

    /*
        Creater: Nguyen Vu Quynh
        Date Create: 11/10/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure merge_acc_customers(pv_user varchar2);

    /*
        Creater: Nguyen Vu Quynh
        Date Create: 11/10/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure merge_acc_cdbs(pv_user varchar2);

    /*
        Creater: Nguyen Vu Quynh
        Date Create: 11/10/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure merge_acc_outlets(pv_user varchar2);

    /*
        Creater: Nguyen Vu Quynh
        Date Create: 11/10/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure merge_acc_dates(pv_user varchar2);

    /*
        Creater: Nguyen Vu Quynh
        Date Create: 11/10/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure merge_acc_premiums(pv_user varchar2);

    /*
        Creater: Nguyen Vu Quynh
        Date Create: 11/10/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure merge_acc_applications(pd_from_date date,
        pd_to_date date,
        pv_user varchar2);

    /*
        Creater: Nguyen Vu Quynh
        Date Create: 11/10/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure merge_acc_fcashs(pd_from_date date,
        pd_to_date date,
        pv_user varchar2);

    /*
        Creater: Nguyen Vu Quynh
        Date Create: 11/10/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure merge_acc_transactions(pd_from_date date,
        pd_to_date date,
        pv_user varchar2);

    /*
        Creater: Nguyen Vu Quynh
        Date Create: 11/10/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure merge_acc_commissions(pd_from_date date,
        pd_to_date date,
        pv_user varchar2);

    /*
        Creater: Nguyen Vu Quynh
        Date Create: 11/10/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure merge_acc_billings(pd_from_date date,
        pd_to_date date,
        pv_user varchar2);

    /*
        Creater: Nguyen Vu Quynh
        Date Create: 11/10/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure merge_acc_payments(pd_from_date date,
        pd_to_date date,
        pv_user varchar2);

    /*
        Creater: Nguyen Vu Quynh
        Date Create: 11/10/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure merge_acc_transmission(pd_from_date date,
        pd_to_date date,
        pv_user varchar2);

    /*
        Creater: Nguyen Vu Quynh
        Date Create: 11/10/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure merge_otl_accounts(pd_from_date date,
        pd_to_date date,
        pv_user varchar2);

    /*
        Creater: Nguyen Vu Quynh
        Date Create: 11/10/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure merge_otl_initials(pd_from_date date,
        pd_to_date date,
        pv_user varchar2);

    /*
        Creater: Nguyen Vu Quynh
        Date Create: 11/10/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure merge_otl_pannuals(pd_from_date date,
        pd_to_date date,
        pv_user varchar2);

    /*
        Creater: Nguyen Vu Quynh
        Date Create: 11/10/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure merge_otl_transactions(pd_from_date date,
        pd_to_date date,
        pv_user varchar2);

    /*
        Creater: Nguyen Vu Quynh
        Date Create: 11/10/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure merge_otl_commissions(pd_from_date date,
        pd_to_date date,
        pv_user varchar2);

    /*
        Creater: Nguyen Vu Quynh
        Date Create: 11/10/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure merge_otl_billings(pd_from_date date,
        pd_to_date date,
        pv_user varchar2);

    /*
        Creater: Nguyen Vu Quynh
        Date Create: 11/10/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure merge_otl_payments(pd_from_date date,
        pd_to_date date,
        pv_user varchar2);
    -----------------------------------------------------------------
    /* END PROCEDURE*/
    -----------------------------------------------------------------

    -----------------------------------------------------------------
    /* BEGIN FUNCTION*/
    -----------------------------------------------------------------
    -----------------------------------------------------------------
    /* END FUNCTION*/
    -----------------------------------------------------------------

end AMS_MODL_STORES;
/
create or replace package body ams.AMS_MODL_STORES is

    procedure main
    is
    begin
        null;
    end;

    -----------------------------------------------------------------
    /* BEGIN PROCEDURE*/
    -----------------------------------------------------------------
    procedure bin_daily(pd_realize_date date,
        pv_user varchar2)
    is
        var_dbmodule varchar2(16) := 'DALL';

        var_dbtalisman varchar2(16) := 'DTAL';
        var_sotalisman boolean := true;
        var_dbbvlife varchar2(16) := 'DB';
        var_sobvlife boolean := true;
    begin
        -- Buoc 01: Kiem soat du lieu
        if (AMS_CORE_CONTROL.module_is_running(var_dbmodule)) then
            -- Buoc 01: Kiem tra ket noi Talisman
            var_sotalisman := (var_sotalisman and AMS_CORE_CONTROL.module_is_running(var_dbtalisman));

            -- Buoc 01: Kiem tra ket noi Bvlife
            for vars in
            (
                select
                    var_dbbvlife || substr(db.db_no, 3, 2) dbbvlife
                from ams_ctl_dbs db
                where db.db_code = AMS_MODL_STORES.LINKBVL
                    and db.record_code = AMS_CORE_RECORD.RECORD_IS_NORMALIZE
                order by db.db_no
            )
            loop
                var_sobvlife := (var_sobvlife and AMS_CORE_CONTROL.module_is_running(vars.dbbvlife));
            end loop;

            if (var_sotalisman and var_sobvlife) then
                AMS_CORE_CONTROL.maintain_module(var_dbmodule);
            else
                goto procedure_end;
            end if;
        else
            goto procedure_end;
        end if;

        begin
            AMS_MODL_STORES.merge_acc_customers(pv_user);

            AMS_MODL_STORES.merge_acc_cdbs(pv_user);

            AMS_MODL_STORES.merge_acc_outlets(pv_user);

            AMS_MODL_STORES.merge_acc_dates(pv_user);

            AMS_MODL_STORES.merge_acc_premiums(pv_user);

            AMS_MODL_STORES.merge_acc_transactions(
                greatest(
                    trunc(pd_realize_date, 'MM'),
                    (pd_realize_date + AMS_MODL_STORES.DBACK)
                ),
                pd_realize_date,
                pv_user);

            AMS_MODL_STORES.merge_acc_commissions(
                greatest(
                    trunc(pd_realize_date, 'MM'),
                    (pd_realize_date + AMS_MODL_STORES.DBACK)
                ),
                pd_realize_date,
                pv_user);

            AMS_MODL_STORES.merge_otl_accounts(
                greatest(
                    trunc(pd_realize_date, 'MM'),
                    (pd_realize_date + AMS_MODL_STORES.DBACK)
                ),
                pd_realize_date,
                pv_user);

            AMS_MODL_STORES.merge_otl_initials(
                greatest(
                    trunc(pd_realize_date, 'MM'),
                    (pd_realize_date + AMS_MODL_STORES.DBACK)
                ),
                pd_realize_date,
                pv_user);

            AMS_MODL_STORES.merge_otl_pannuals(
                greatest(
                    trunc(pd_realize_date, 'MM'),
                    (pd_realize_date + AMS_MODL_STORES.DBACK)
                ),
                pd_realize_date,
                pv_user);

            AMS_MODL_STORES.merge_otl_transactions(
                greatest(
                    trunc(pd_realize_date, 'MM'),
                    (pd_realize_date + AMS_MODL_STORES.DBACK)
                ),
                pd_realize_date,
                pv_user);

            AMS_MODL_STORES.merge_otl_commissions(
                greatest(
                    trunc(pd_realize_date, 'MM'),
                    (pd_realize_date + AMS_MODL_STORES.DBACK)
                ),
                pd_realize_date,
                pv_user);

            AMS_CORE_CONTROL.run_module(var_dbmodule);
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_STORES.bin_daily] ' || SQLERRM);
                AMS_CORE_CONTROL.fail_module(var_dbmodule);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    procedure bin_monthly(pd_realize_date date,
        pv_user varchar2)
    is
        var_dbmodule varchar2(16) := 'DALL';

        var_dbtalisman varchar2(16) := 'DTAL';
        var_sotalisman boolean := true;
        var_dbbvlife varchar2(16) := 'DB';
        var_sobvlife boolean := true;
    begin
        -- Buoc 01: Kiem soat du lieu
        if (AMS_CORE_CONTROL.module_is_running(var_dbmodule)) then
            -- Buoc 01: Kiem tra ket noi Talisman
            var_sotalisman := (var_sotalisman and AMS_CORE_CONTROL.module_is_running(var_dbtalisman));

            -- Buoc 01: Kiem tra ket noi Bvlife
            for vars in
            (
                select
                    var_dbbvlife || substr(db.db_no, 3, 2) dbbvlife
                from ams_ctl_dbs db
                where db.db_code = 'BVLDB'
                    and db.record_code = AMS_CORE_RECORD.RECORD_IS_NORMALIZE
                order by db.db_no
            )
            loop
                var_sobvlife := (var_sobvlife and AMS_CORE_CONTROL.module_is_running(vars.dbbvlife));
            end loop;

            if (var_sotalisman and var_sobvlife) then
                AMS_CORE_CONTROL.maintain_module(var_dbmodule);
            else
                goto procedure_end;
            end if;
        else
            goto procedure_end;
        end if;

        begin
            AMS_MODL_STORES.merge_acc_customers(pv_user);

            AMS_MODL_STORES.merge_acc_cdbs(pv_user);

            AMS_MODL_STORES.merge_acc_outlets(pv_user);

            AMS_MODL_STORES.merge_acc_dates(pv_user);

            AMS_MODL_STORES.merge_acc_premiums(pv_user);

            AMS_MODL_STORES.merge_acc_transactions(
                add_months(trunc(pd_realize_date, 'MM'), AMS_MODL_STORES.MBACK),
                pd_realize_date,
                pv_user);

            AMS_MODL_STORES.merge_acc_commissions(
                add_months(trunc(pd_realize_date, 'MM'), AMS_MODL_STORES.MBACK),
                pd_realize_date,
                pv_user);

            AMS_MODL_STORES.merge_acc_billings(
                add_months(trunc(pd_realize_date, 'MM'), AMS_MODL_STORES.MBACK),
                pd_realize_date,
                pv_user);

            AMS_MODL_STORES.merge_acc_payments(
                add_months(trunc(pd_realize_date, 'MM'), AMS_MODL_STORES.MBACK),
                pd_realize_date,
                pv_user);

            AMS_MODL_STORES.merge_acc_transmission(
                add_months(trunc(pd_realize_date, 'MM'), AMS_MODL_STORES.MBACK),
                pd_realize_date,
                pv_user);

            AMS_MODL_STORES.merge_otl_accounts(
                add_months(trunc(pd_realize_date, 'MM'), AMS_MODL_STORES.MBACK),
                pd_realize_date,
                pv_user);

            AMS_MODL_STORES.merge_otl_initials(
                add_months(trunc(pd_realize_date, 'MM'), AMS_MODL_STORES.MBACK),
                pd_realize_date,
                pv_user);

            AMS_MODL_STORES.merge_otl_pannuals(
                add_months(trunc(pd_realize_date, 'MM'), AMS_MODL_STORES.MBACK),
                pd_realize_date,
                pv_user);

            AMS_MODL_STORES.merge_otl_transactions(
                add_months(trunc(pd_realize_date, 'MM'), AMS_MODL_STORES.MBACK),
                pd_realize_date,
                pv_user);

            AMS_MODL_STORES.merge_otl_commissions(
                add_months(trunc(pd_realize_date, 'MM'), AMS_MODL_STORES.MBACK),
                pd_realize_date,
                pv_user);

            AMS_MODL_STORES.merge_otl_billings(
                add_months(trunc(pd_realize_date, 'MM'), AMS_MODL_STORES.MBACK),
                pd_realize_date,
                pv_user);

            AMS_MODL_STORES.merge_otl_payments(
                add_months(trunc(pd_realize_date, 'MM'), AMS_MODL_STORES.MBACK),
                pd_realize_date,
                pv_user);

            AMS_CORE_CONTROL.run_module(var_dbmodule);
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_STORES.bin_daily] ' || SQLERRM);
                AMS_CORE_CONTROL.fail_module(var_dbmodule);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    procedure bin_range(pd_from_date date,
        pd_to_date date,
        pv_user varchar2)
    is
        var_dbmodule varchar2(16) := 'DALL';

        var_dbtalisman varchar2(16) := 'DTAL';
        var_sotalisman boolean := true;
        var_dbbvlife varchar2(16) := 'DB';
        var_sobvlife boolean := true;
    begin
        -- Buoc 01: Kiem soat du lieu
        if (AMS_CORE_CONTROL.module_is_running(var_dbmodule)) then
            -- Buoc 01: Kiem tra ket noi Talisman
            var_sotalisman := (var_sotalisman and AMS_CORE_CONTROL.module_is_running(var_dbtalisman));

            -- Buoc 01: Kiem tra ket noi Bvlife
            for vars in
            (
                select
                    var_dbbvlife || substr(db.db_no, 3, 2) dbbvlife
                from ams_ctl_dbs db
                where db.db_code = AMS_MODL_STORES.LINKBVL
                    and db.record_code = AMS_CORE_RECORD.RECORD_IS_NORMALIZE
                order by db.db_no
            )
            loop
                var_sobvlife := (var_sobvlife and AMS_CORE_CONTROL.module_is_running(vars.dbbvlife));
            end loop;

            if (var_sotalisman and var_sobvlife) then
                AMS_CORE_CONTROL.maintain_module(var_dbmodule);
            else
                goto procedure_end;
            end if;
        else
            goto procedure_end;
        end if;

        begin
            AMS_MODL_STORES.merge_acc_customers(pv_user);

            AMS_MODL_STORES.merge_acc_cdbs(pv_user);

            AMS_MODL_STORES.merge_acc_outlets(pv_user);

            AMS_MODL_STORES.merge_acc_dates(pv_user);

            AMS_MODL_STORES.merge_acc_premiums(pv_user);

            AMS_MODL_STORES.merge_acc_applications(
                pd_from_date,
                pd_to_date,
                pv_user);

            AMS_MODL_STORES.merge_acc_fcashs(
                pd_from_date,
                pd_to_date,
                pv_user);

            AMS_MODL_STORES.merge_acc_transactions(
                pd_from_date,
                pd_to_date,
                pv_user);

            AMS_MODL_STORES.merge_acc_commissions(
                pd_from_date,
                pd_to_date,
                pv_user);

            AMS_MODL_STORES.merge_acc_billings(
                pd_from_date,
                pd_to_date,
                pv_user);

            AMS_MODL_STORES.merge_acc_payments(
                pd_from_date,
                pd_to_date,
                pv_user);

            AMS_MODL_STORES.merge_acc_transmission(
                pd_from_date,
                pd_to_date,
                pv_user);

            AMS_MODL_STORES.merge_otl_accounts(
                pd_from_date,
                pd_to_date,
                pv_user);

            AMS_MODL_STORES.merge_otl_initials(
                pd_from_date,
                pd_to_date,
                pv_user);

            AMS_MODL_STORES.merge_otl_pannuals(
                pd_from_date,
                pd_to_date,
                pv_user);

            AMS_MODL_STORES.merge_otl_transactions(
                pd_from_date,
                pd_to_date,
                pv_user);

            AMS_MODL_STORES.merge_otl_commissions(
                pd_from_date,
                pd_to_date,
                pv_user);

            AMS_MODL_STORES.merge_otl_billings(
                pd_from_date,
                pd_to_date,
                pv_user);

            AMS_MODL_STORES.merge_otl_payments(
                pd_from_date,
                pd_to_date,
                pv_user);

            AMS_CORE_CONTROL.run_module(var_dbmodule);
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_STORES.bin_range] ' || SQLERRM);
                AMS_CORE_CONTROL.fail_module(var_dbmodule);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 11/10/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure merge_acc_customers(pv_user varchar2)
    is
    begin
        if (pv_user is not null) then
            -- Buoc 01: Xoa du lieu da ton tai
            begin
                AMS_CORE_TABLE.truncate('dbw_acc_customers');
            exception
                when others then
                    AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                        '[AMS_MODL_STORES.merge_acc_customers] ' || SQLERRM);
                    goto procedure_end;
            end;

            -- Buoc 02: Ghi nhan du lieu tu Bvlife
            begin
                -- Buoc 02.01: Ghi nhan du lieu khach hang tu Bvlife
                insert /*+ APPEND */ into dbw_acc_customers nologging (
                    dbw_core,
                    dbw_code,
                    customer_id,
                    customer_name,
                    birthday,
                    gender,
                    mobile,
                    home_phone,
                    business_phone,
                    address,
                    postcode,
                    identition_id,
                    bank_account,
                    maintain_user,
                    maintain_time
                )
                select /*+ CARDINALITY(bvl, 100) */
                    AMS_MODL_STORES.CORE_BVLIFE,
                    bvl.branch_ams_id,
                    bvl.customer_id,
                    bvl.customer_name,
                    bvl.birthday,
                    bvl.gender,
                    bvl.mobile,
                    bvl.home_phone,
                    bvl.business_phone,
                    bvl.address,
                    bvl.postcode,
                    bvl.identition_id,
                    bvl.bank_account,
                    pv_user,
                    sysdate
                from bvl_dat_customers bvl;
                commit;
            exception
                when others then
                    AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                        '[AMS_MODL_STORES.merge_acc_customers] ' || SQLERRM);
                    goto procedure_end;
            end;

            -- Buoc 03: Ghi nhan du lieu tu Talisman
            begin
                -- Buoc 03.01: Ghi nhan du lieu khach hang tu Talisman
                insert /*+ APPEND */ into dbw_acc_customers nologging (
                    dbw_core,
                    dbw_code,
                    customer_id,
                    customer_name,
                    birthday,
                    gender,
                    mobile,
                    home_phone,
                    business_phone,
                    address,
                    postcode,
                    identition_id,
                    bank_account,
                    maintain_user,
                    maintain_time
                )
                select /*+ CARDINALITY(tal, 100) */
                    AMS_MODL_STORES.CORE_TALISMAN,
                    AMS_MODL_STORES.CORE_TALISMAN,
                    tal.customer_id,
                    tal.customer_name,
                    tal.birthday,
                    tal.gender,
                    tal.mobile,
                    tal.home_phone,
                    tal.business_phone,
                    tal.address,
                    tal.postcode,
                    tal.identition_id,
                    tal.bank_account,
                    pv_user,
                    sysdate
                from tal_dat_customers tal;
                commit;
            exception
                when others then
                    AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                        '[AMS_MODL_STORES.merge_acc_customers] ' || SQLERRM);
                    goto procedure_end;
            end;
        end if;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 11/10/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure merge_acc_cdbs(pv_user varchar2)
    is
    begin
        if (pv_user is not null) then
            -- Buoc 01: Xoa du lieu da ton tai
            begin
                AMS_CORE_TABLE.truncate('dbw_acc_cdbs');
            exception
                when others then
                    AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                        '[AMS_MODL_STORES.merge_acc_cdbs] ' || SQLERRM);
                    goto procedure_end;
            end;

            -- Buoc 02: Ghi nhan du lieu tu Bvlife
            begin
                -- Buoc 02.01: Ghi nhan du lieu khach hang tu Bvlife
                insert /*+ APPEND NOLOGGING */ into dbw_acc_cdbs (
                    dbw_date,
                    dbw_core,
                    dbw_code,
                    account_id,
                    customer_db,
                    customer_id,
                    acc_fdate,
                    acc_tdate,
                    maintain_user,
                    maintain_time
                )
                select /*+ CARDINALITY(bvl, 100) */
                    bvl.acc_fdate,
                    AMS_MODL_STORES.CORE_BVLIFE,
                    'PAYS',
                    bvl.account_id,
                    bvl.branch_ams_id,
                    bvl.acc_pays_id,
                    bvl.acc_fdate,
                    bvl.acc_tdate,
                    pv_user,
                    sysdate
                from bvl_dat_cpays bvl;
                commit;

                insert /*+ APPEND NOLOGGING */ into dbw_acc_cdbs (
                    dbw_date,
                    dbw_core,
                    dbw_code,
                    account_id,
                    customer_db,
                    customer_id,
                    acc_fdate,
                    acc_tdate,
                    maintain_user,
                    maintain_time
                )
                select /*+ CARDINALITY(bvl, 100) */
                    bvl.acc_fdate,
                    AMS_MODL_STORES.CORE_BVLIFE,
                    'LIFE',
                    bvl.account_id,
                    bvl.branch_ams_id,
                    bvl.acc_lifes_id,
                    bvl.acc_fdate,
                    bvl.acc_tdate,
                    pv_user,
                    sysdate
                from bvl_dat_clifes bvl;
                commit;
            exception
                when others then
                    AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                        '[AMS_MODL_STORES.merge_acc_cdbs] ' || SQLERRM);
                    goto procedure_end;
            end;

            -- Buoc 03: Ghi nhan du lieu tu Talisman
            begin
                -- Buoc 03.01: Ghi nhan du lieu khach hang tu Talisman
                insert /*+ APPEND NOLOGGING */ into dbw_acc_cdbs (
                    dbw_date,
                    dbw_core,
                    dbw_code,
                    account_id,
                    customer_db,
                    customer_id,
                    acc_fdate,
                    acc_tdate,
                    maintain_user,
                    maintain_time
                )
                select /*+ CARDINALITY(tal, 100) */
                    tal.acc_fdate,
                    AMS_MODL_STORES.CORE_TALISMAN,
                    'PAYS',
                    tal.account_id,
                    AMS_MODL_STORES.CORE_TALISMAN,
                    tal.acc_pays_id,
                    tal.acc_fdate,
                    tal.acc_tdate,
                    pv_user,
                    sysdate
                from tal_dat_cpays tal;
                commit;

                insert /*+ APPEND NOLOGGING */ into dbw_acc_cdbs (
                    dbw_date,
                    dbw_core,
                    dbw_code,
                    account_id,
                    customer_db,
                    customer_id,
                    acc_fdate,
                    acc_tdate,
                    maintain_user,
                    maintain_time
                )
                select /*+ CARDINALITY(tal, 100) */
                    tal.acc_fdate,
                    AMS_MODL_STORES.CORE_TALISMAN,
                    'LIFE',
                    tal.account_id,
                    AMS_MODL_STORES.CORE_TALISMAN,
                    tal.acc_lifes_id,
                    tal.acc_fdate,
                    tal.acc_tdate,
                    pv_user,
                    sysdate
                from tal_dat_clifes tal;
                commit;
            exception
                when others then
                    AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                        '[AMS_MODL_STORES.merge_acc_cdbs] ' || SQLERRM);
                    goto procedure_end;
            end;
        end if;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 11/10/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure merge_acc_outlets(pv_user varchar2)
    is
    begin
        if (pv_user is not null) then
            -- Buoc 01: Xoa du lieu da ton tai
            begin
                AMS_CORE_TABLE.truncate('dbw_acc_outlets');
            exception
                when others then
                    AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                        '[AMS_MODL_STORES.merge_acc_outlets] ' || SQLERRM);
                    goto procedure_end;
            end;

            -- Buoc 02: Ghi nhan du lieu tu Bvlife
            begin
                -- Buoc 02.01: Ghi nhan du lieu dai ly khai thac tu Bvlife
                insert /*+ APPEND */ into dbw_acc_outlets nologging (
                    dbw_date,
                    dbw_core,
                    dbw_code,
                    account_id,
                    outlet_ams_id,
                    acc_fdate,
                    acc_tdate,
                    maintain_user,
                    maintain_time
                )
                select /*+ CARDINALITY(bvl, 100) */
                    bvl.acc_fdate,
                    AMS_MODL_STORES.CORE_BVLIFE,
                    'IOUT',
                    bvl.account_id,
                    'D' || bvl.acc_outlet_id,
                    bvl.acc_fdate,
                    bvl.acc_tdate,
                    pv_user,
                    sysdate
                from bvl_dat_ioutlets bvl;
                commit;

                -- Buoc 02.01: Ghi nhan du lieu dai ly thu phi tu Bvlife
                insert /*+ APPEND */ into dbw_acc_outlets nologging (
                    dbw_date,
                    dbw_core,
                    dbw_code,
                    account_id,
                    outlet_ams_id,
                    acc_fdate,
                    acc_tdate,
                    maintain_user,
                    maintain_time
                )
                select /*+ CARDINALITY(bvl, 100) */
                    bvl.acc_fdate,
                    AMS_MODL_STORES.CORE_BVLIFE,
                    'SOUT',
                    bvl.account_id,
                    'D' || bvl.acc_outlet_id,
                    bvl.acc_fdate,
                    bvl.acc_tdate,
                    pv_user,
                    sysdate
                from bvl_dat_soutlets bvl;
                commit;
            exception
                when others then
                    AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                        '[AMS_MODL_STORES.merge_acc_outlets] ' || SQLERRM);
                    goto procedure_end;
            end;

            -- Buoc 03: Ghi nhan du lieu tu Talisman
            begin
                -- Buoc 03.01: Ghi nhan du lieu dai ly khai thac tu Talisman
                insert /*+ APPEND */ into dbw_acc_outlets nologging (
                    dbw_date,
                    dbw_core,
                    dbw_code,
                    account_id,
                    outlet_ams_id,
                    acc_fdate,
                    acc_tdate,
                    maintain_user,
                    maintain_time
                )
                select /*+ CARDINALITY(tal, 100) */
                    tal.acc_fdate,
                    AMS_MODL_STORES.CORE_TALISMAN,
                    'IOUT',
                    tal.account_id,
                    tal.acc_outlet_id,
                    tal.acc_fdate,
                    tal.acc_tdate,
                    pv_user,
                    sysdate
                from tal_dat_ioutlets tal;
                commit;

                -- Buoc 03.01: Ghi nhan du lieu dai ly thu phi tu Talisman
                insert /*+ APPEND */ into dbw_acc_outlets nologging (
                    dbw_date,
                    dbw_core,
                    dbw_code,
                    account_id,
                    outlet_ams_id,
                    acc_fdate,
                    acc_tdate,
                    maintain_user,
                    maintain_time
                )
                select /*+ CARDINALITY(tal, 100) */
                    tal.acc_fdate,
                    AMS_MODL_STORES.CORE_TALISMAN,
                    'SOUT',
                    tal.account_id,
                    tal.acc_outlet_id,
                    tal.acc_fdate,
                    tal.acc_tdate,
                    pv_user,
                    sysdate
                from tal_dat_soutlets tal;
                commit;
            exception
                when others then
                    AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                        '[AMS_MODL_STORES.merge_acc_outlets] ' || SQLERRM);
                    goto procedure_end;
            end;
        end if;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 11/10/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure merge_acc_dates(pv_user varchar2)
    is
    begin
        if (pv_user is not null) then
            -- Buoc 01: Xoa du lieu da ton tai
            begin
                AMS_CORE_TABLE.truncate('dbw_acc_dates');
            exception
                when others then
                    AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                        '[AMS_MODL_STORES.merge_acc_dates] ' || SQLERRM);
                    goto procedure_end;
            end;

            -- Buoc 02: Ghi nhan du lieu tu Bvlife
            begin
                -- Buoc 02.01: Ghi nhan ngay phat hanh hop dong tu Bvlife
                insert /*+ APPEND */ into dbw_acc_dates nologging (
                    dbw_date,
                    dbw_core,
                    dbw_code,
                    activity_id,
                    account_id,
                    outlet_ams_id,
                    acc_date,
                    acc_fdate,
                    acc_tdate,
                    maintain_user,
                    maintain_time
                )
                select /*+ CARDINALITY(bvl, 100) */
                    bvl.acc_dbussiness,
                    AMS_MODL_STORES.CORE_BVLIFE,
                    bvl.acc_activity,
                    bvl.activity_id,
                    bvl.account_id,
                    ('D' || bvl.acc_outlet_id),
                    bvl.acc_dbussiness,
                    bvl.acc_fdate,
                    bvl.acc_tdate,
                    pv_user,
                    sysdate
                from bvl_dat_iaccounts bvl;
                commit;

                -- Buoc 02.02: Ghi nhan ngay hieu luc hop dong tu Bvlife
                insert /*+ APPEND */ into dbw_acc_dates nologging (
                    dbw_date,
                    dbw_core,
                    dbw_code,
                    account_id,
                    outlet_ams_id,
                    acc_date,
                    acc_fdate,
                    acc_tdate,
                    maintain_user,
                    maintain_time
                )
                select /*+ CARDINALITY(bvl, 100) */
                    bvl.acc_dbussiness,
                    AMS_MODL_STORES.CORE_BVLIFE,
                    'EFFE',
                    bvl.account_id,
                    ('D' || bvl.acc_outlet_id),
                    bvl.acc_deffective,
                    bvl.acc_fdate,
                    bvl.acc_tdate,
                    pv_user,
                    sysdate
                from bvl_dat_iaccounts bvl;
                commit;

                -- Buoc 02.03: Ghi nhan ngay huy hop dong tu Bvlife
                insert /*+ APPEND */ into dbw_acc_dates nologging (
                    dbw_date,
                    dbw_core,
                    dbw_code,
                    account_id,
                    outlet_ams_id,
                    acc_date,
                    acc_fdate,
                    acc_tdate,
                    maintain_user,
                    maintain_time
                )
                select /*+ CARDINALITY(bvl, 100) */
                    bvl.acc_dbussiness,
                    AMS_MODL_STORES.CORE_BVLIFE,
                    bvl.acc_activity,
                    bvl.account_id,
                    ('D' || bvl.acc_outlet_id),
                    bvl.acc_dbussiness,
                    bvl.acc_fdate,
                    bvl.acc_tdate,
                    pv_user,
                    sysdate
                from bvl_dat_taccounts bvl;
                commit;
            exception
                when others then
                    AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                        '[AMS_MODL_STORES.merge_acc_dates] ' || SQLERRM);
                    goto procedure_end;
            end;

            -- Buoc 03: Ghi nhan du lieu tu Talisman
            begin
                -- Buoc 03.01: Ghi nhan ngay phat hanh hop dong tu Talisman
                insert /*+ APPEND */ into dbw_acc_dates nologging (
                    dbw_date,
                    dbw_core,
                    dbw_code,
                    activity_id,
                    account_id,
                    outlet_ams_id,
                    acc_date,
                    acc_fdate,
                    acc_tdate,
                    maintain_user,
                    maintain_time
                )
                select /*+ CARDINALITY(tal, 100) */
                    tal.acc_dbussiness,
                    AMS_MODL_STORES.CORE_TALISMAN,
                    tal.acc_activity,
                    tal.activity_id,
                    tal.account_id,
                    tal.acc_outlet_id,
                    tal.acc_dbussiness,
                    tal.acc_fdate,
                    tal.acc_tdate,
                    pv_user,
                    sysdate
                from tal_dat_iaccounts tal;
                commit;

                insert /*+ APPEND */ into dbw_acc_dates nologging (
                    dbw_date,
                    dbw_core,
                    dbw_code,
                    account_id,
                    outlet_ams_id,
                    acc_date,
                    acc_fdate,
                    acc_tdate,
                    maintain_user,
                    maintain_time
                )
                select /*+ CARDINALITY(tal, 100) */
                    tal.acc_dbussiness,
                    AMS_MODL_STORES.CORE_TALISMAN,
                    'EFFE',
                    tal.account_id,
                    tal.acc_outlet_id,
                    tal.acc_deffective,
                    tal.acc_fdate,
                    tal.acc_tdate,
                    pv_user,
                    sysdate
                from tal_dat_iaccounts tal;
                commit;

                -- Buoc 03.03: Ghi nhan ngay huy hop dong tu Talisman
                insert /*+ APPEND */ into dbw_acc_dates nologging (
                    dbw_date,
                    dbw_core,
                    dbw_code,
                    account_id,
                    outlet_ams_id,
                    acc_date,
                    acc_fdate,
                    acc_tdate,
                    maintain_user,
                    maintain_time
                )
                select /*+ CARDINALITY(tal, 100) */
                    tal.acc_dbussiness,
                    AMS_MODL_STORES.CORE_TALISMAN,
                    tal.acc_activity,
                    tal.account_id,
                    tal.acc_outlet_id,
                    tal.acc_dbussiness,
                    tal.acc_fdate,
                    tal.acc_tdate,
                    pv_user,
                    sysdate
                from tal_dat_taccounts tal;
                commit;
            exception
                when others then
                    AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                        '[AMS_MODL_STORES.merge_acc_dates] ' || SQLERRM);
                    goto procedure_end;
            end;
        end if;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 11/10/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure merge_acc_premiums(pv_user varchar2)
    is
    begin
        if (pv_user is not null) then
            -- Buoc 01: Xoa du lieu da ton tai
            begin
                AMS_CORE_TABLE.truncate('dbw_acc_premiums');
            exception
                when others then
                    AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                        '[AMS_MODL_STORES.merge_acc_premiums] ' || SQLERRM);
                    goto procedure_end;
            end;

            -- Buoc 02: Ghi nhan du lieu tu Bvlife
            begin
                -- Buoc 02.01: Ghi nhan du lieu phi tu Bvlife
                insert /*+ APPEND */ into dbw_acc_premiums nologging (
                    dbw_date,
                    dbw_core,
                    account_id,
                    acc_outlet_id,
                    acc_freq_premium,
                    acc_freq_per_annum,
                    acc_death_sum_insured,
                    acc_fdate,
                    acc_tdate,
                    maintain_user,
                    maintain_time
                )
                select /*+ CARDINALITY(bvl, 100) */
                    bvl.acc_dbussiness,
                    AMS_MODL_STORES.CORE_BVLIFE,
                    bvl.account_id,
                    'D' || bvl.acc_outlet_id,
                    bvl.acc_freq_premium,
                    bvl.acc_freq_per_annum,
                    bvl.acc_death_sum_insured,
                    bvl.acc_fdate,
                    bvl.acc_tdate,
                    pv_user,
                    sysdate
                from bvl_dat_iaccounts bvl;
                commit;
            exception
                when others then
                    AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                        '[AMS_MODL_STORES.merge_acc_premiums] ' || SQLERRM);
                    goto procedure_end;
            end;

            -- Buoc 03: Ghi nhan du lieu tu Talisman
            begin
                -- Buoc 03.01: Ghi nhan du lieu phi tu Talisman
                insert /*+ APPEND */ into dbw_acc_premiums nologging (
                    dbw_date,
                    dbw_core,
                    account_id,
                    acc_outlet_id,
                    acc_freq_premium,
                    acc_freq_per_annum,
                    acc_death_sum_insured,
                    acc_fdate,
                    acc_tdate,
                    maintain_user,
                    maintain_time
                )
                select /*+ CARDINALITY(tal, 100) */
                    tal.acc_dbussiness,
                    AMS_MODL_STORES.CORE_TALISMAN,
                    tal.account_id,
                    tal.acc_outlet_id,
                    tal.acc_freq_premium,
                    tal.acc_freq_per_annum,
                    tal.acc_death_sum_insured,
                    tal.acc_fdate,
                    tal.acc_tdate,
                    pv_user,
                    sysdate
                from tal_dat_iaccounts tal;
                commit;
            exception
                when others then
                    AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                        '[AMS_MODL_STORES.merge_acc_premiums] ' || SQLERRM);
                    goto procedure_end;
            end;
        end if;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 11/10/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure merge_acc_applications(pd_from_date date,
        pd_to_date date,
        pv_user varchar2)
    is
    begin
        if (pv_user is not null) then
            -- Buoc 01: Xoa du lieu da ton tai
            begin
                -- Buoc 01.01:
                update /*+ NOLOGGING */ dbw_acc_apps upd
                set
                    upd.maintain_code = AMS_MODL_STORES.ACTION_IS_PROCESSING
                where upd.dbw_core = AMS_MODL_STORES.CORE_TALISMAN
                    and wm_overlaps(
                        wm_period(upd.app_fdate, nvl(upd.app_tdate, AMS_CORE_SYSTEM.DATE_MAX_VALUE)),
                        wm_period(pd_from_date - 1, pd_to_date + 1)
                    ) = 1;
                commit;

                loop
                    delete /*+ NOLOGGING */ dbw_acc_apps del
                    where del.dbw_core = AMS_MODL_STORES.CORE_BVLIFE
                        and del.dbw_date
                            between pd_from_date
                            and pd_to_date
                        and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                    exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                    commit;
                end loop;
                commit;

                loop
                    delete /*+ NOLOGGING */ dbw_acc_iriders del
                    where del.dbw_date
                            between pd_from_date
                            and pd_to_date
                        and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                    exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                    commit;
                end loop;
                commit;
            exception
                when others then
                    AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                        '[AMS_MODL_STORES.merge_acc_applications] ' || SQLERRM);
                    goto procedure_end;
            end;

            -- Buoc 02: Ghi nhan du lieu tu Bvlife
            begin
                insert /*+ APPEND */ into dbw_acc_apps nologging (
                    dbw_date,
                    dbw_core,
                    dbw_code,
                    account_id,
                    application_id,
                    application_no,
                    app_main_rider,
                    app_branch,
                    app_outlet_id,
                    app_holder_id,
                    app_insured_id,
                    app_billing_no,
                    app_entered_date,
                    app_reception_date,
                    app_processed_date,
                    app_freq_per_annum,
                    app_fdate,
                    app_tdate,
                    maintain_user,
                    maintain_time
                )
                select /*+ CARDINALITY(bvl, 100) */
                    bvl.ddate,
                    AMS_MODL_STORES.CORE_BVLIFE,
                    bvl.dcode,
                    bvl.account_id,
                    bvl.application_id,
                    bvl.application_id,
                    bvl.benefit_id,
                    bvl.app_branch,
                    'D' || bvl.app_outlet_id,
                    bvl.app_holder_id,
                    bvl.app_insured_id,
                    bvl.app_billing_no,
                    bvl.app_entered_date,
                    bvl.app_reception_date,
                    bvl.app_processed_date,
                    case
                        when bvl.app_frequency = 1 then
                            12
                        when bvl.app_frequency = 3 then
                            4
                        when bvl.app_frequency = 6 then
                            2
                        when bvl.app_frequency = 12 then
                            1
                        when bvl.app_frequency = 0 then
                            0.1
                        else
                            0
                        end freq_per_annum,
                    bvl.ddate,
                    AMS_CORE_SYSTEM.DATE_MAX_VALUE,
                    pv_user,
                    sysdate
                from bvl_dat_applications bvl
                where bvl.ddate
                        between pd_from_date
                        and pd_to_date;
                commit;

                insert /*+ APPEND */ into dbw_acc_iriders nologging (
                    dbw_date,
                    dbw_core,
                    account_id,
                    application_id,
                    rider_id,
                    rider_mcode,
                    rider_pcode,
                    rid_branch,
                    rid_insured_money,
                    rid_freq_premium,
                    rid_freq_per_annum,
                    maintain_user,
                    maintain_time
                )
                select /*+ CARDINALITY(bvl, 100) */
                    bvl.ddate,
                    AMS_MODL_STORES.CORE_BVLIFE,
                    bvl.account_id,
                    bvl.application_id,
                    bvl.benefit_id,
                    bvl.benefit_mcode,
                    bvl.benefit_pcode,
                    bvl.ben_branch,
                    bvl.ben_insured_money,
                    bvl.ben_freq_premium,
                    bvl.ben_freq_per_annum,
                    pv_user,
                    sysdate
                from bvl_dat_ibenefits bvl
                where bvl.ddate
                        between pd_from_date
                        and pd_to_date;
                commit;
            exception
                when others then
                    AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                        '[AMS_MODL_STORES.merge_acc_applications] ' || SQLERRM);
                    goto procedure_end;
            end;

            -- Buoc 02: Ghi nhan du lieu tu Talisman
            begin
                merge /*+ NOLOGGING
                          CARDINALITY(apps, 10)
                          CARDINALITY(upd, 10)
                          LEADING(apps upd) */
                into
                    (
                        select
                            *
                        from dbw_acc_apps a
                        where a.dbw_core = AMS_MODL_STORES.CORE_TALISMAN
                            and a.maintain_code = AMS_MODL_STORES.ACTION_IS_PROCESSING
                    ) apps
                using
                    (
                        select
                            *
                        from tal_dat_applications tmp
                        where
                            wm_overlaps(
                                wm_period(tmp.app_fdate, tmp.app_tdate),
                                wm_period(pd_from_date - 1, pd_to_date + 1)
                            ) = 1
                    ) upd
                on
                    (
                        upd.activity_id = apps.application_id
                    )
                when matched then
                    update
                    set
                        apps.application_no = upd.app_number_id,
                        apps.app_outlet_id = upd.app_outlet_id,
                        apps.app_entered_date = upd.app_dsigned,
                        apps.app_reception_date = upd.app_dreceived,
                        apps.app_processed_date = upd.app_dbussiness,
                        apps.app_freq_per_annum = upd.app_freq_per_annum,
                        apps.app_freq_premium = upd.app_freq_premium,
                        apps.app_fdate = upd.app_fdate,
                        apps.app_tdate = upd.app_tdate,
                        apps.maintain_code = AMS_MODL_STORES.ACTION_IS_FINISHED,
                        apps.maintain_user = pv_user,
                        apps.maintain_time = sysdate
                when not matched then
                    insert (
                        dbw_date,
                        dbw_core,
                        dbw_code,
                        account_id,
                        application_id,
                        application_no,
                        app_outlet_id,
                        app_entered_date,
                        app_reception_date,
                        app_processed_date,
                        app_freq_per_annum,
                        app_freq_premium,
                        app_fdate,
                        app_tdate,
                        maintain_code,
                        maintain_user,
                        maintain_time
                    )
                    values (
                        upd.app_dbussiness,
                        AMS_MODL_STORES.CORE_TALISMAN,
                        upd.app_activity,
                        upd.account_id,
                        upd.activity_id,
                        upd.app_number_id,
                        upd.app_outlet_id,
                        upd.app_dsigned,
                        upd.app_dreceived,
                        upd.app_dbussiness,
                        upd.app_freq_per_annum,
                        upd.app_freq_premium,
                        upd.app_fdate,
                        upd.app_tdate,
                        AMS_MODL_STORES.ACTION_IS_FINISHED,
                        pv_user,
                        sysdate
                    );
                commit;

                delete /*+ NOLOGGING*/ dbw_acc_apps del
                where del.dbw_core = AMS_MODL_STORES.CORE_TALISMAN
                    and del.maintain_code = AMS_MODL_STORES.ACTION_IS_PROCESSING;
                commit;

                insert /*+ APPEND */ into dbw_acc_iriders nologging (
                    dbw_date,
                    dbw_core,
                    account_id,
                    application_id,
                    rider_id,
                    rider_mcode,
                    rider_pcode,
                    rid_branch,
                    rid_insured_money,
                    rid_freq_premium,
                    rid_freq_per_annum,
                    maintain_user,
                    maintain_time
                )
                select /*+ CARDINALITY(tal, 100) */
                    tal.ddate,
                    AMS_MODL_STORES.CORE_TALISMAN,
                    tal.account_id,
                    tal.activity_id,
                    tal.benefit_id,
                    tal.benefit_mcode,
                    tal.benefit_pcode,
                    null,
                    tal.ben_insured_money,
                    tal.ben_freq_premium,
                    tal.ben_freq_per_annum,
                    pv_user,
                    sysdate
                from tal_dat_ibenefits tal
                where tal.ddate
                        between pd_from_date
                        and pd_to_date;
                commit;
            exception
                when others then
                    AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                        '[AMS_MODL_STORES.merge_acc_applications] ' || SQLERRM);
                    goto procedure_end;
            end;
        end if;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 11/10/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure merge_acc_fcashs(pd_from_date date,
        pd_to_date date,
        pv_user varchar2)
    is
    begin
        if (pv_user is not null) then
            -- Buoc 01: Xoa du lieu da ton tai
            begin
                -- Buoc 01.01:
                loop
                    delete /*+ NOLOGGING */ dbw_acc_fcashs del
                    where del.dbw_date
                            between pd_from_date
                            and pd_to_date
                        and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                    exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                    commit;
                end loop;
                commit;
            exception
                when others then
                    AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                        '[AMS_MODL_STORES.merge_acc_fcashs] ' || SQLERRM);
                    goto procedure_end;
            end;

            -- Buoc 02: Ghi nhan du lieu tu Bvlife
            begin
                insert /*+ APPEND */ into dbw_acc_fcashs nologging (
                    dbw_date,
                    dbw_core,
                    dbw_code,
                    treceipt_id,
                    treceipt_no,
                    application_id,
                    application_no,
                    fcsh_branch,
                    fcsh_outlet_id,
                    fcsh_holder_id,
                    fcsh_insured_id,
                    fcsh_entered_date,
                    fcsh_reception_date,
                    fcsh_freq_per_annum,
                    fcsh_freq_premium,
                    fcsh_premium,
                    fcsh_order,
                    maintain_user,
                    maintain_time
                )
                select /*+ CARDINALITY(bvl, 100) */
                    bvl.ddate,
                    AMS_MODL_STORES.CORE_BVLIFE,
                    bvl.dcode,
                    bvl.treceipt_id,
                    bvl.treceipt_id,
                    bvl.application_id,
                    bvl.application_id,
                    bvl.fcsh_branch,
                    'D' || bvl.fcsh_outlet_id,
                    bvl.fcsh_holder_id,
                    bvl.fcsh_insured_id,
                    bvl.fcsh_entered_date,
                    bvl.fcsh_reception_date,
                    bvl.fcsh_frequency,
                    bvl.fcsh_premium,
                    bvl.fcsh_premium,
                    null,
                    pv_user,
                    sysdate
                from bvl_dat_fcashs bvl
                where bvl.ddate
                        between pd_from_date
                        and pd_to_date;
                commit;
            exception
                when others then
                    AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                        '[AMS_MODL_STORES.merge_acc_fcashs] ' || SQLERRM);
                    goto procedure_end;
            end;

            -- Buoc 02: Ghi nhan du lieu tu Talisman
            begin
                insert /*+ APPEND */ into dbw_acc_fcashs nologging (
                    dbw_date,
                    dbw_core,
                    dbw_code,
                    treceipt_id,
                    treceipt_no,
                    application_id,
                    application_no,
                    fcsh_branch,
                    fcsh_outlet_id,
                    fcsh_holder_id,
                    fcsh_insured_id,
                    fcsh_entered_date,
                    fcsh_reception_date,
                    fcsh_freq_per_annum,
                    fcsh_freq_premium,
                    fcsh_premium,
                    fcsh_order,
                    maintain_user,
                    maintain_time
                )
                select /*+ CARDINALITY(bvl, 100) */
                    tal.fcsh_dreceived,
                    AMS_MODL_STORES.CORE_TALISMAN,
                    tal.fcsh_code,
                    tal.fcsh_number_id,
                    tal.fcsh_number_id,
                    tal.activity_id,
                    tal.application_number,
                    null,
                    tal.fcsh_outlet_id,
                    null,
                    null,
                    tal.fcsh_dentered,
                    tal.fcsh_dreceived,
                    null,
                    tal.fcsh_amount,
                    tal.fcsh_amount,
                    null,
                    pv_user,
                    sysdate
                from tal_dat_fcashs tal
                where tal.fcsh_dreceived
                        between pd_from_date
                        and pd_to_date;
                commit;
            exception
                when others then
                    AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                        '[AMS_MODL_STORES.merge_acc_fcashs] ' || SQLERRM);
                    goto procedure_end;
            end;
        end if;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 11/10/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure merge_acc_transactions(pd_from_date date,
        pd_to_date date,
        pv_user varchar2)
    is
        var_recorded_date date := trunc(pd_from_date, 'MM');
        var_query_date date := (add_months(var_recorded_date, 1) - 1);
    begin
        if (pv_user is not null) then
            -- Buoc 01: Xoa du lieu da ton tai
            begin
                -- Buoc 01.01:
                loop
                    delete /*+ NOLOGGING */ dbw_acc_transactions del
                    where del.dbw_date
                            between trunc(pd_from_date, 'MM')
                            and trunc(pd_to_date, 'MM')
                        and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                    exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                    commit;
                end loop;
                commit;
            exception
                when others then
                    AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                        '[AMS_MODL_STORES.merge_acc_transactions] ' || SQLERRM);
                    goto procedure_end;
            end;

            for i in 0..round(months_between(trunc(pd_to_date, 'MM'), trunc(pd_from_date, 'MM')))
            loop
                var_recorded_date := add_months(trunc(pd_from_date, 'MM'), i);
                var_query_date := (add_months(var_recorded_date, 1) - 1);

                -- Buoc 02: Ghi nhan du lieu tu Bvlife
                begin
                    insert /*+ APPEND */ into dbw_acc_transactions nologging (
                        dbw_date,
                        dbw_core,
                        dbw_code,
                        account_id,
                        outlet_ams_id,
                        tran_dpayments,
                        tran_dprocessed,
                        tran_dbussiness,
                        tran_year,
                        tran_premium,
                        tran_fyp,
                        maintain_user,
                        maintain_time
                    )
                    select /*+ CARDINALITY(bvl, 100) */
                        var_recorded_date,
                        AMS_MODL_STORES.CORE_BVLIFE,
                        bvl.tran_code,
                        bvl.account_id,
                        'D' || bvl.tran_outlet_id,
                        bvl.tran_deffective,
                        bvl.tran_dprocessed,
                        bvl.tran_dbussiness,
                        1,
                        nvl(bvl.tran_balance_indicator, 0) * nvl(bvl.tran_amount, 0),
                        bvl.tran_fyp,
                        pv_user,
                        sysdate
                    from bvl_dat_transactions bvl
                    where bvl.tran_dbussiness
                            between var_recorded_date
                            and var_query_date;
                    commit;
                exception
                    when others then
                        AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                            '[AMS_MODL_STORES.merge_acc_transactions] ' || SQLERRM);
                        goto procedure_end;
                end;

                -- Buoc 03: Ghi nhan du lieu tu Talisman
                begin
                    insert /*+ APPEND */ into dbw_acc_transactions nologging (
                        dbw_date,
                        dbw_core,
                        dbw_code,
                        account_id,
                        outlet_ams_id,
                        tran_dpayments,
                        tran_dprocessed,
                        tran_dbussiness,
                        tran_year,
                        tran_premium,
                        tran_fyp,
                        maintain_user,
                        maintain_time
                    )
                    select /*+ CARDINALITY(bvl, 100) */
                        var_recorded_date,
                        AMS_MODL_STORES.CORE_TALISMAN,
                        tal.prem_code,
                        tal.account_id,
                        tal.outlet_id,
                        tal.prem_deffective,
                        tal.prem_dprocessed,
                        tal.prem_dbussiness,
                        tal.account_year,
                        tal.premium,
                        tal.first_year_premium,
                        pv_user,
                        sysdate
                    from tal_dat_tran_premiums tal
                    where tal.prem_dbussiness
                            between var_recorded_date
                            and var_query_date;
                    commit;
                exception
                    when others then
                        AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                            '[AMS_MODL_STORES.merge_acc_transactions] ' || SQLERRM);
                        goto procedure_end;
                end;
            end loop;
        end if;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 11/10/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure merge_acc_commissions(pd_from_date date,
        pd_to_date date,
        pv_user varchar2)
    is
        var_dbw_date date := null;
        var_query_begin date := null;
        var_query_end date := null;
    begin
        -- Buoc 01: Xoa du lieu da ton tai
        begin
            loop
                delete /*+ NOLOGGING */ dbw_acc_commissions del
                where del.dbw_date
                        between trunc(pd_from_date, 'MM')
                        and trunc(pd_to_date, 'MM')
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_STORES.merge_acc_commissions] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 02: Tap trung du lieu
        begin
            for i in 0..round(
                months_between(trunc(pd_to_date, 'MM'),
                trunc(pd_from_date, 'MM'))
            )
            loop
                var_dbw_date := add_months(trunc(pd_from_date, 'MM'), i);
                var_query_begin := add_months(trunc(pd_from_date, 'MM'), i);
                var_query_end := (add_months(var_query_begin, 1) - 1);

                -- Buoc 02.01: Tap trung du lieu tu Bvlife
                begin
                    insert /*+ APPEND */ into dbw_acc_commissions nologging (
                        dbw_date,
                        dbw_core,
                        account_id,
                        outlet_ams_id,
                        comm_dpayments,
                        comm_dprocessed,
                        comm_dbussiness,
                        comm_year,
                        comm_premium,
                        comm_fyc,
                        comm_money,
                        maintain_user,
                        maintain_time
                    )
                    select /*+ CARDINALITY(bvl, 100)*/
                        var_dbw_date,
                        AMS_MODL_STORES.CORE_BVLIFE,
                        bvl.account_id,
                        'D' || bvl.comm_outlet_id,
                        bvl.comm_deffective,
                        bvl.comm_dprocessed,
                        var_query_end,
                        bvl.comm_ayear,
                        sum(nvl(bvl.comm_premium, 0)),
                        sum(nvl(bvl.comm_fyc, 0)),
                        sum(nvl(bvl.comm_money, 0)),
                        pv_user,
                        sysdate
                    from bvl_dat_commissions bvl
                    where bvl.comm_dbussiness
                            between var_query_begin
                            and var_query_end
                    group by
                        bvl.account_id,
                        bvl.comm_outlet_id,
                        bvl.comm_ayear,
                        bvl.comm_deffective,
                        bvl.comm_dprocessed;
                    commit;
                end;

                -- Buoc 02.02: Tap trung du lieu tu Talisman
                begin
                    AMS_CORE_TABLE.truncate('tmp_dat_tran_commissions');
                    AMS_CORE_TABLE.truncate('tmp_dat_tran_premiums');

                    insert /*+ APPEND NOLOGGING*/ into tmp_dat_tran_commissions
                    (
                        transaction_event_id,
                        account_id,
                        outlet_id,
                        account_year,
                        comm_dbussiness,
                        first_year_commission,
                        commission
                    )
                    select /*+ CARDINALITY(c, 100)*/
                        c.transaction_event_id,
                        c.account_id,
                        c.outlet_id,
                        c.account_year,
                        c.comm_dbussiness,
                        sum(nvl(c.first_year_commission, 0)) first_year_commission,
                        sum(nvl(c.commission, 0)) commission
                    from tal_dat_tran_commissions c
                    where c.comm_dbussiness
                            between var_query_begin
                            and var_query_end
                    group by
                        c.transaction_event_id,
                        c.account_id,
                        c.outlet_id,
                        c.account_year,
                        c.comm_dbussiness;
                    commit;

                    insert /*+ APPEND NOLOGGING*/ into tmp_dat_tran_premiums
                    (
                        transaction_event_id,
                        account_id,
                        outlet_id,
                        account_year,
                        prem_dbussiness,
                        premium
                    )
                    select /*+ CARDINALITY(p, 100)*/
                        p.transaction_event_id,
                        p.account_id,
                        p.outlet_id,
                        p.account_year,
                        p.prem_dbussiness,
                        sum(nvl(p.premium, 0)) premium
                    from tal_dat_tran_premiums p
                    where p.prem_dbussiness
                            between var_query_begin
                            and var_query_end
                    group by
                        p.transaction_event_id,
                        p.account_id,
                        p.outlet_id,
                        p.account_year,
                        p.prem_dbussiness;
                    commit;

                    insert /*+ APPEND */ into dbw_acc_commissions nologging (
                        dbw_date,
                        dbw_core,
                        account_id,
                        outlet_ams_id,
                        comm_dpayments,
                        comm_dprocessed,
                        comm_dbussiness,
                        comm_year,
                        comm_premium,
                        comm_fyc,
                        comm_money,
                        maintain_user,
                        maintain_time
                    )
                    select
                        var_dbw_date,
                        AMS_MODL_STORES.CORE_TALISMAN,
                        tal.account_id,
                        tal.outlet_id,
                        tal.comm_dbussiness,
                        tal.comm_dbussiness,
                        tal.comm_dbussiness,
                        tal.account_year,
                        tal.premium,
                        tal.first_year_commission,
                        tal.commission,
                        pv_user,
                        sysdate
                    from
                    (
                        select /*+ CARDINALITY(comm, 10)
                                   CARDINALITY(prem, 10)
                                   LEADING(comm prem)
                                   USE_NL(comm)*/
                            comm.account_id,
                            comm.outlet_id,
                            comm.account_year,
                            comm.comm_dbussiness,
                            nvl(prem.premium, 0) premium,
                            nvl(comm.first_year_commission, 0) first_year_commission,
                            nvl(comm.commission, 0) commission
                        from tmp_dat_tran_commissions comm
                        left join tmp_dat_tran_premiums prem
                            on
                            (
                                prem.transaction_event_id = comm.transaction_event_id
                                and
                                prem.account_year = comm.account_year
                                and
                                prem.prem_dbussiness = comm.comm_dbussiness
                            )
                    ) tal;
                    commit;
                end;
            end loop;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_STORES.merge_acc_commissions] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 03: Ghi nhan ten khach hang
        begin
            merge /*+ NOLOGGING
                      LEADING(acc upd)*/
                into ams.dbw_acc_commissions acc
            using
                (
                    select /*+ CARDINALITY(pays, 10)
                               CARDINALITY(cusm, 10)
                               LEADING(pays cusm)
                               INDEX(cusm dbw_acc_customers_i01)*/
                        pays.account_id,
                        max(cusm.customer_id) customer_id,
                        max(cusm.customer_name) customer_name
                    from
                    (
                        select
                            c.account_id,
                            max(c.dbw_core) KEEP (DENSE_RANK LAST order by c.acc_fdate) dbw_core,
                            max(c.customer_db) KEEP (DENSE_RANK LAST order by c.acc_fdate) customer_db,
                            max(c.customer_id) KEEP (DENSE_RANK LAST order by c.acc_fdate) customer_id
                        from dbw_acc_cdbs c
                        where c.dbw_code = 'PAYS'
                            and pd_to_date
                                between c.acc_fdate
                                and c.acc_tdate
                        group by c.account_id
                    ) pays
                    inner join ams.dbw_acc_customers cusm
                        on
                        (
                            cusm.dbw_core = pays.dbw_core
                            and
                            cusm.dbw_code = pays.customer_db
                            and
                            cusm.customer_id = pays.customer_id
                        )
                    group by pays.account_id
                ) upd
            on (
                upd.account_id = acc.account_id
                and
                acc.dbw_date
                    between trunc(pd_from_date, 'MM')
                    and pd_to_date
                )
            when matched then
                update
                set
                    acc.acc_holder_id = upd.customer_id,
                    acc.acc_holder_name = upd.customer_name;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_STORES.merge_acc_commissions] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 11/10/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure merge_acc_billings(pd_from_date date,
        pd_to_date date,
        pv_user varchar2)
    is
        var_dbw_date date := null;
        var_query_begin date := null;
        var_query_end date := null;
    begin
        -- Buoc 01: Xoa du lieu da ton tai
        begin
            loop
                delete /*+ NOLOGGING */ dbw_acc_billings del
                where del.dbw_date
                        between trunc(pd_from_date, 'MM')
                        and trunc(pd_to_date, 'MM')
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_STORES.merge_acc_billings] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 02: Tap trung du lieu
        begin
            for i in 0..round(
                months_between(trunc(pd_to_date, 'MM'),
                trunc(pd_from_date, 'MM'))
            )
            loop
                var_dbw_date := add_months(trunc(pd_from_date, 'MM'), i);
                var_query_begin := add_months(trunc(pd_from_date, 'MM'), i);
                var_query_end := (add_months(var_query_begin, 1) - 1);

                -- Buoc 02.01: Tap trung du lieu tu Bvlife
                insert /*+ APPEND */ into dbw_acc_billings nologging (
                    dbw_date,
                    dbw_core,
                    account_id,
                    outlet_ams_id,
                    insured_money,
                    bil_invoice,
                    bil_dallocation,
                    bil_dprocessed,
                    bil_dbussiness,
                    bil_fdate,
                    bil_tdate,
                    bil_holder_id,
                    bil_holder_name,
                    bil_freq_per_annum,
                    bil_premium,
                    maintain_user,
                    maintain_time
                )
                select /*+ CARDINALITY(bvl, 100)*/
                    var_dbw_date,
                    AMS_MODL_STORES.CORE_BVLIFE,
                    bvl.account_id,
                    ('D' || bvl.bil_outlet_id),
                    bvl.insured_money,
                    null,
                    null,
                    null,
                    bvl.ddate,
                    bvl.period_from,
                    bvl.period_to,
                    bvl.bil_holder_id,
                    null,
                    case
                        when nvl(bvl.period_frequency, 0) in (0) then
                            0.1
                        else
                            round((12 / bvl.period_frequency), 2)
                        end freq_per_annum,
                    bvl.bil_premium,
                    pv_user,
                    sysdate
                from bvl_dat_billings bvl
                where bvl.ddate
                        between var_query_begin
                        and var_query_end;
                commit;

                -- Update
                -- Le Khac Chinh
                -- Ngay 26/01/2016
                -- Chuyen doi sang lay hoa hon tu RP11
                -- Buoc 02.02: Tap trung du lieu tu Talisman
                /*if (1 <> 1) then
                    insert \*+ APPEND *\ into dbw_acc_billings nologging (
                        dbw_date,
                        dbw_core,
                        account_id,
                        outlet_ams_id,
                        insured_money,
                        bil_invoice,
                        bil_dallocation,
                        bil_dprocessed,
                        bil_dbussiness,
                        bil_fdate,
                        bil_tdate,
                        bil_holder_id,
                        bil_holder_name,
                        bil_freq_per_annum,
                        bil_premium,
                        maintain_user,
                        maintain_time
                    )
                    select \*+ CARDINALITY(acc, 10)
                               CARDINALITY(tal, 10)*\
                        var_dbw_date,
                        AMS_MODL_STORES.CORE_TALISMAN,
                        acc.account_id,
                        tal.bil_outlet_id,
                        null,
                        null,
                        null,
                        null,
                        tal.bil_pdate,
                        tal.bil_fdate,
                        tal.bil_tdate,
                        null,
                        tal.bil_holder_name,
                        null,
                        nvl(tal.bil_premium, 0) bil_premium,
                        pv_user,
                        sysdate
                    from
                    (
                        select \*+ CARDINALITY(ad, 100)*\
                            ad.account_id
                        from dbw_acc_dates ad
                        where ad.dbw_code = 'ISSU'
                            and var_query_end
                                between ad.acc_fdate
                                and ad.acc_tdate
                    ) acc
                    join
                    (
                        select \*+ CARDINALITY(inv, 100)*\
                            *
                        from tal_dat_invoices inv
                        where inv.ddate <= var_query_end
                            and
                            (
                                (
                                    inv.dcode = 'INV'
                                    and
                                    inv.bil_fdate <= var_query_end
                                    and
                                    nvl(inv.pay_pdate, var_query_end) >= var_query_begin
                                )
                                or
                                (
                                    inv.dcode = 'REV'
                                    and
                                    inv.bil_fdate <= var_query_end
                                    and
                                    nvl(inv.pay_pdate, var_query_end + 1) > var_query_end
                                )
                            )
                    ) tal
                        on tal.account_id = acc.account_id;
                    commit;
                end if;*/

                if (1 = 1) then
                    insert /*+ APPEND */ into dbw_acc_billings nologging (
                        dbw_date,
                        dbw_core,
                        account_id,
                        outlet_ams_id,
                        insured_money,
                        bil_invoice,
                        bil_dallocation,
                        bil_dprocessed,
                        bil_dbussiness,
                        bil_fdate,
                        bil_tdate,
                        bil_holder_id,
                        bil_holder_name,
                        bil_freq_per_annum,
                        bil_premium,
                        maintain_user,
                        maintain_time
                    )
                    select /*+ CARDINALITY(inv, 100)*/
                        var_dbw_date,
                        AMS_MODL_STORES.CORE_TALISMAN,
                        inv.account_number,
                        inv.outlet_ams_id,
                        null,
                        inv.invoice_number,
                        null,
                        null,
                        inv.print_date,
                        inv.from_date,
                        inv.to_date,
                        null,
                        inv.holder_name,
                        null,
                        nvl(inv.coll_premium, 0) bil_premium,
                        pv_user,
                        sysdate
                    from la_inv_invoice inv
                    where inv.record_date = var_dbw_date
                        and inv.source_of_data = 'TAL';
                    commit;
                end if;
            end loop;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_STORES.merge_acc_billings] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 11/10/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure merge_acc_payments(pd_from_date date,
        pd_to_date date,
        pv_user varchar2)
    is
        var_dbw_date date := null;
        var_query_begin date := null;
        var_query_end date := null;
    begin
        -- Buoc 01: Xoa du lieu da ton tai
        begin
            loop
                delete /*+ NOLOGGING */ dbw_acc_payments del
                where del.dbw_date
                        between trunc(pd_from_date, 'MM')
                        and trunc(pd_to_date, 'MM')
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_STORES.merge_acc_payments] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 02: Tap trung du lieu
        begin
            for i in 0..round(
                months_between(trunc(pd_to_date, 'MM'),
                trunc(pd_from_date, 'MM'))
            )
            loop
                var_dbw_date := add_months(trunc(pd_from_date, 'MM'), i);
                var_query_begin := add_months(trunc(pd_from_date, 'MM'), i);
                var_query_end := (add_months(var_query_begin, 1) - 1);

                -- Buoc 02.01: Tap trung du lieu tu Bvlife
                insert /*+ APPEND */ into dbw_acc_payments nologging (
                    dbw_date,
                    dbw_core,
                    account_id,
                    outlet_ams_id,
                    insured_money,
                    pay_invoice,
                    pay_dentered,
                    pay_dprocessed,
                    pay_dbussiness,
                    pay_fdate,
                    pay_tdate,
                    pay_holder_id,
                    pay_holder_name,
                    pay_freq_per_annum,
                    pay_premium,
                    maintain_user,
                    maintain_time
                )
                select /*+ CARDINALITY(bvl, 100)*/
                    var_dbw_date,
                    AMS_MODL_STORES.CORE_BVLIFE,
                    bvl.account_id,
                    ('D' || bvl.pay_outlet_id),
                    null,
                    bvl.pay_invoice,
                    bvl.pay_entered,
                    bvl.pay_processed,
                    var_query_end,
                    bvl.period_from,
                    bvl.period_to,
                    bvl.pay_holder_id,
                    null,
                    case
                        when nvl(bvl.period_frequency, 0) in (0) then
                            0.1
                        else
                            round((12 / bvl.period_frequency), 2)
                        end freq_per_annum,
                    bvl.pay_premium,
                    pv_user,
                    sysdate
                from bvl_dat_payments bvl
                where bvl.ddate
                        between var_query_begin
                        and var_query_end;
                commit;

                -- Update
                -- Le Khac Chinh
                -- Ngay 26/01/2016
                -- Chuyen doi sang lay hoa hon tu RP11
                -- Buoc 02.02: Tap trung du lieu tu Talisman
                /*if (1 <> 1) then
                    insert \*+ APPEND *\ into dbw_acc_payments nologging (
                        dbw_date,
                        dbw_core,
                        account_id,
                        outlet_ams_id,
                        insured_money,
                        pay_invoice,
                        pay_dentered,
                        pay_dprocessed,
                        pay_dbussiness,
                        pay_fdate,
                        pay_tdate,
                        pay_holder_id,
                        pay_holder_name,
                        pay_freq_per_annum,
                        pay_premium,
                        maintain_user,
                        maintain_time
                    )
                    select \*+ CARDINALITY(acc, 10)
                               CARDINALITY(tal, 10)*\
                        var_dbw_date,
                        AMS_MODL_STORES.CORE_TALISMAN,
                        acc.account_id,
                        tal.bil_outlet_id,
                        null,
                        null,
                        tal.pay_edate,
                        tal.pay_pdate,
                        tal.pay_pdate,
                        tal.bil_fdate,
                        tal.bil_tdate,
                        null,
                        tal.bil_holder_name,
                        null,
                        nvl(tal.pay_premium, 0) pay_premium,
                        pv_user,
                        sysdate
                    from
                    (
                        select \*+ CARDINALITY(ad, 100)*\
                            ad.account_id
                        from dbw_acc_dates ad
                        where ad.dbw_code = 'ISSU'
                            and var_query_end
                                between ad.acc_fdate
                                and ad.acc_tdate
                    ) acc
                    join
                    (
                        select \*+ CARDINALITY(inv, 100)*\
                            *
                        from tal_dat_invoices inv
                        where inv.ddate <= var_query_end
                            and inv.dcode = 'INV'
                            and inv.pay_pdate
                                between var_query_begin
                                and var_query_end
                    ) tal
                        on tal.account_id = acc.account_id;
                    commit;
                end if;*/

                if (1 = 1) then
                    insert /*+ APPEND */ into dbw_acc_payments nologging (
                        dbw_date,
                        dbw_core,
                        account_id,
                        outlet_ams_id,
                        insured_money,
                        pay_invoice,
                        pay_dentered,
                        pay_dprocessed,
                        pay_dbussiness,
                        pay_fdate,
                        pay_tdate,
                        pay_holder_id,
                        pay_holder_name,
                        pay_freq_per_annum,
                        pay_premium,
                        maintain_user,
                        maintain_time
                    )
                    select /*+ CARDINALITY(inv, 100)*/
                        var_dbw_date,
                        AMS_MODL_STORES.CORE_TALISMAN,
                        inv.account_number,
                        inv.outlet_ams_id,

                        null,
                        null,
                        inv.collected_date,
                        inv.collected_date,
                        inv.collected_date,
                        inv.from_date,
                        inv.to_date,
                        null,
                        inv.holder_name,
                        null,
                        nvl(inv.real_premium, 0) pay_premium,
                        pv_user,
                        sysdate
                    from la_inv_invoice inv
                    where inv.record_date = var_dbw_date
                        and inv.source_of_data = 'TAL';
                    commit;
                end if;
            end loop;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_STORES.merge_acc_payments] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 11/10/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure merge_acc_transmission(pd_from_date date,
        pd_to_date date,
        pv_user varchar2)
    is
        var_dbw_date date := null;
        var_query_begin date := null;
        var_query_end date := null;
    begin
        -- Buoc 01: Xoa du lieu da ton tai
        begin
            loop
                delete /*+ NOLOGGING */ dbw_acc_transmission del
                where del.dbw_date
                        between trunc(pd_from_date, 'MM')
                        and trunc(pd_to_date, 'MM')
                    and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_STORES.merge_acc_transmission] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 02: Tap trung du lieu
        begin
            -- Buoc 02.A: Tap trung du lieu thu phi
            for i in 0..round(
                months_between(trunc(pd_to_date, 'MM'),
                trunc(pd_from_date, 'MM'))
            )
            loop
                var_dbw_date := add_months(trunc(pd_from_date, 'MM'), i);
                var_query_begin := add_months(trunc(pd_from_date, 'MM'), i);
                var_query_end := last_day(var_query_begin);

                insert /*+ APPEND */ into dbw_acc_transmission nologging (
                    dbw_date,
                    dbw_core,
                    dbw_code,
                    account_id,
                    from_ams_id,
                    to_ams_id,
                    trans_date,
                    maintain_user,
                    maintain_time
                )
                select /*+ CARDINALITY(racco, 10)
                           CARDINALITY(lacco, 10)*/
                    var_dbw_date,
                    racco.dbw_core,
                    'SOUT',
                    racco.account_id,
                    lacco.outlet_ams_id,
                    racco.outlet_ams_id,
                    racco.acc_fdate,
                    pv_user,
                    sysdate
                from
                (
                    select /*+ CARDINALITY(ao, 100)*/
                        ao.dbw_date,
                        ao.dbw_core,
                        ao.account_id,
                        ao.outlet_ams_id,
                        ao.acc_fdate
                    from dbw_acc_outlets ao
                    where ao.dbw_code = 'SOUT'
                        and ao.dbw_date
                            between var_query_begin
                            and var_query_end
                        and ao.acc_fdate
                            between var_query_begin
                            and var_query_end
                ) racco
                left join
                (
                    select /*+ CARDINALITY(ao, 100)*/
                        ao.dbw_core,
                        ao.account_id,
                        ao.outlet_ams_id,
                        ao.acc_tdate
                    from dbw_acc_outlets ao
                    where ao.dbw_code = 'SOUT'
                        and ao.acc_tdate
                            between (var_query_begin - 1)
                            and var_query_end
                ) lacco
                    on
                    (
                        racco.account_id = lacco.account_id
                        and
                        racco.acc_fdate - 1 = lacco.acc_tdate
                    )
                where racco.outlet_ams_id <> nvl(lacco.outlet_ams_id, 'D');
                commit;
            end loop;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_STORES.merge_acc_transmission] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 11/10/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure merge_otl_accounts(pd_from_date date,
        pd_to_date date,
        pv_user varchar2)
    is
        var_dbw_date date := null;
        var_query_begin date := null;
        var_query_end date := null;

        var_ncom_dbegin date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/COMP/C2015/INFO/BDATE');
        var_ncom_dend date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/COMP/C2015/INFO/EDATE');
        var_ncom_drev number(3) := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/COMP/C2015/INFO/DREV');
    begin
        if (pv_user is not null) then
            begin
                -- Buoc 01.01: Xoa du lieu
                loop
                    delete /*+ NOLOGGING */ dbw_otl_values del
                    where del.dbw_date
                            between trunc(pd_from_date, 'MM')
                            and trunc(pd_to_date, 'MM')
                        and del.dbw_code in
                        (
                            'IFAC',
                            'CFAC',
                            'OFAC',
                            'OYAC'
                        )
                        and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                    exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                    commit;
                end loop;
                commit;
            exception
                when others then
                    AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                        '[AMS_MODL_STORES.merge_otl_accounts] ' || SQLERRM);
                    goto procedure_end;
            end;

            -- Buoc 02: Ghi nhan du lieu
            begin
                for i in 0..round(
                    months_between(trunc(pd_to_date, 'MM'),
                        trunc(pd_from_date, 'MM')
                    )
                )
                loop
                    var_dbw_date := add_months(trunc(pd_from_date, 'MM'), i);
                    var_query_begin := add_months(trunc(pd_from_date, 'MM'), i);
                    var_query_end := (add_months(var_query_begin, 1) - 1);

                    if (var_dbw_date = var_ncom_dbegin) then
                        -- Buoc 02.01: Ghi nhan du lieu so luong hop dong phat hanh [thang]
                        insert /*+ APPEND */ into dbw_otl_values nologging (
                            dbw_date,
                            dbw_core,
                            dbw_code,
                            outlet_ams_id,
                            ovalue,
                            maintain_user,
                            maintain_time
                        )
                        select
                            var_dbw_date,
                            AMS_MODL_STORES.CORE_DBW,
                            'IFAC',
                            acc.outlet_ams_id,
                            count(*) inforce_account,
                            pv_user,
                            sysdate
                        from
                        (
                            select
                                iacc.account_id,
                                iacc.outlet_ams_id,
                                iacc.issu_date,
                                nvl(eacc.effe_date, add_months(var_query_begin, -2)) effe_date
                            from
                            (
                                select /*+ CARDINALITY(a, 100)*/
                                    a.account_id,
                                    a.outlet_ams_id,
                                    a.dbw_date issu_date
                                from dbw_acc_dates a
                                where a.dbw_date
                                        between var_query_begin
                                        and (var_query_end + var_ncom_drev)
                                    and a.dbw_code = 'ISSU'
                                    and (var_query_end + var_ncom_drev)
                                        between trunc(a.acc_fdate, 'fmdd')
                                        and trunc(a.acc_tdate, 'fmdd')
                            ) iacc
                            left join
                            (
                                select /*+ CARDINALITY(a, 100)*/
                                    a.account_id,
                                    a.outlet_ams_id,
                                    a.acc_date effe_date
                                from dbw_acc_dates a
                                where a.dbw_date
                                        between add_months(var_query_begin, -1)
                                        and (var_query_end + var_ncom_drev)
                                    and a.dbw_code = 'EFFE'
                                    and (var_query_end + var_ncom_drev)
                                        between trunc(a.acc_fdate, 'fmdd')
                                        and trunc(a.acc_tdate, 'fmdd')
                            ) eacc
                                on eacc.account_id = iacc.account_id
                        ) acc
                        where
                        (
                            -- CASE 1:
                            -- Hieu luc truoc thang T-1
                            -- Phat hanh den het thang T
                            (
                                acc.effe_date < add_months(var_query_begin, -1)
                                and
                                acc.issu_date <= var_query_end
                            )

                            -- CASE 2:
                            -- Hieu luc trong thang T-1
                            -- Phat hanh tu 1/T den het thang T
                            or
                            (
                                acc.effe_date
                                    between add_months(var_query_begin, -1)
                                    and last_day(add_months(var_query_begin, -1))
                                and
                                acc.issu_date
                                    between var_query_begin
                                    and var_query_end
                            )

                            -- CASE 3:
                            -- Hieu luc trong thang T
                            -- Phat hanh tu 1/T den 7/T+1
                            or
                            (
                                acc.effe_date
                                    between var_query_begin
                                    and var_query_end
                                and
                                acc.issu_date
                                    between var_query_begin
                                    and (var_query_end + var_ncom_drev)
                            )
                        )
                        group by acc.outlet_ams_id;
                        commit;

                        -- Buoc 02.02: Ghi nhan du lieu so luong hop dong huy
                        -- trong thoi gian cho phep [thang]
                        insert /*+ APPEND */ into dbw_otl_values nologging (
                            dbw_date,
                            dbw_core,
                            dbw_code,
                            outlet_ams_id,
                            ovalue,
                            maintain_user,
                            maintain_time
                        )
                        select
                            var_dbw_date,
                            AMS_MODL_STORES.CORE_DBW,
                            'CFAC',
                            acc.outlet_ams_id,
                            count(*) inforce_account,
                            pv_user,
                            sysdate
                        from
                        (
                            select /*+ CARDINALITY(a, 100)*/
                                a.account_id,
                                a.outlet_ams_id
                            from dbw_acc_dates a
                            where a.dbw_date
                                    between var_query_begin
                                    and var_query_end
                                and a.dbw_code = 'COF'
                                and var_query_end
                                    between trunc(a.acc_fdate, 'fmdd')
                                    and trunc(a.acc_tdate, 'fmdd')
                        ) acc
                        group by acc.outlet_ams_id;
                        commit;

                        -- Buoc 02.03: Ghi nhan du lieu so luong hop dong huy
                        -- sau thoi gian cho phep [thang]
                        insert /*+ APPEND */ into dbw_otl_values nologging (
                            dbw_date,
                            dbw_core,
                            dbw_code,
                            outlet_ams_id,
                            ovalue,
                            maintain_user,
                            maintain_time
                        )
                        select
                            var_dbw_date,
                            AMS_MODL_STORES.CORE_DBW,
                            'OFAC',
                            acc.outlet_ams_id,
                            count(*) inforce_account,
                            pv_user,
                            sysdate
                        from
                        (
                            select /*+ CARDINALITY(a, 100)*/
                                a.account_id,
                                a.outlet_ams_id
                            from dbw_acc_dates a
                            where a.dbw_date
                                    between var_query_begin
                                    and var_query_end
                                and a.dbw_code = 'TOF'
                                and var_query_end
                                    between trunc(a.acc_fdate, 'fmdd')
                                    and trunc(a.acc_tdate, 'fmdd')
                        ) acc
                        group by acc.outlet_ams_id;
                        commit;

                        -- Buoc 02.04: Ghi nhan du lieu so luong hop dong huy
                        -- trong nam dau tien cua hop dong [thang]
                        insert /*+ APPEND */ into dbw_otl_values nologging (
                            dbw_date,
                            dbw_core,
                            dbw_code,
                            outlet_ams_id,
                            ovalue,
                            maintain_user,
                            maintain_time
                        )
                        select /*+ CARDINALITY(acc, 10)
                                   CARDINALITY(issu, 10) */
                            var_dbw_date,
                            AMS_MODL_STORES.CORE_DBW,
                            'OYAC',
                            acc.outlet_ams_id,
                            count(*) inforce_account,
                            pv_user,
                            sysdate
                        from
                        (
                            select /*+ CARDINALITY(a, 100)*/
                                a.account_id,
                                a.outlet_ams_id
                            from dbw_acc_dates a
                            where a.dbw_date
                                    between var_query_begin
                                    and var_query_end
                                and a.dbw_code = 'TOF'
                                and var_query_end
                                    between trunc(a.acc_fdate, 'fmdd')
                                    and trunc(a.acc_tdate, 'fmdd')
                        ) acc
                        join
                        (
                            select /*+ CARDINALITY(a, 100)*/
                                a.account_id,
                                a.outlet_ams_id
                            from dbw_acc_dates a
                            where a.dbw_date
                                    between add_months(var_query_begin, -11)
                                    and var_query_end
                                and a.dbw_code = 'ISSU'
                                and var_query_end
                                    between trunc(a.acc_fdate, 'fmdd')
                                    and trunc(a.acc_tdate, 'fmdd')
                        ) issu
                            on issu.account_id = acc.account_id
                        group by acc.outlet_ams_id;
                        commit;
                    elsif (var_dbw_date between var_ncom_dbegin and var_ncom_dend) then
                        -- Buoc 02.01: Ghi nhan du lieu so luong hop dong phat hanh [thang]
                        insert /*+ APPEND */ into dbw_otl_values nologging (
                            dbw_date,
                            dbw_core,
                            dbw_code,
                            outlet_ams_id,
                            ovalue,
                            maintain_user,
                            maintain_time
                        )
                        select
                            var_dbw_date,
                            AMS_MODL_STORES.CORE_DBW,
                            'IFAC',
                            acc.outlet_ams_id,
                            count(*) inforce_account,
                            pv_user,
                            sysdate
                        from
                        (
                            select
                                iacc.account_id,
                                iacc.outlet_ams_id,
                                iacc.issu_date,
                                nvl(eacc.effe_date, add_months(var_query_begin, -2)) effe_date
                            from
                            (
                                select /*+ CARDINALITY(a, 100)*/
                                    a.account_id,
                                    a.outlet_ams_id,
                                    a.dbw_date issu_date
                                from dbw_acc_dates a
                                where a.dbw_date
                                        between var_query_begin
                                        and (var_query_end + var_ncom_drev)
                                    and a.dbw_code = 'ISSU'
                                    and (var_query_end + var_ncom_drev)
                                        between trunc(a.acc_fdate, 'fmdd')
                                        and trunc(a.acc_tdate, 'fmdd')
                            ) iacc
                            left join
                            (
                                select /*+ CARDINALITY(a, 100)*/
                                    a.account_id,
                                    a.outlet_ams_id,
                                    a.acc_date effe_date
                                from dbw_acc_dates a
                                where a.dbw_date
                                        between add_months(var_query_begin, -1)
                                        and (var_query_end + var_ncom_drev)
                                    and a.dbw_code = 'EFFE'
                                    and (var_query_end + var_ncom_drev)
                                        between trunc(a.acc_fdate, 'fmdd')
                                        and trunc(a.acc_tdate, 'fmdd')
                            ) eacc
                                on eacc.account_id = iacc.account_id
                        ) acc
                        where
                        (
                            -- CASE 1:
                            -- Hieu luc truoc thang T-1
                            -- Phat hanh den het thang T
                            (
                                acc.effe_date < add_months(var_query_begin, -1)
                                and
                                acc.issu_date <= var_query_end
                            )

                            -- CASE 2:
                            -- Hieu luc trong thang T-1
                            -- Phat hanh tu 8/T den het thang T
                            or
                            (
                                acc.effe_date
                                    between add_months(var_query_begin, -1)
                                    and last_day(add_months(var_query_begin, -1))
                                and
                                acc.issu_date
                                    between (var_query_begin + 7)
                                    and var_query_end
                            )

                            -- CASE 3:
                            -- Hieu luc trong thang T
                            -- Phat hanh tu 1/T den 7/T+1
                            or
                            (
                                acc.effe_date
                                    between var_query_begin
                                    and var_query_end
                                and
                                acc.issu_date
                                    between var_query_begin
                                    and (var_query_end + var_ncom_drev)
                            )
                        )
                        group by acc.outlet_ams_id;
                        commit;

                        -- Buoc 02.02: Ghi nhan du lieu so luong hop dong huy
                        -- trong thoi gian cho phep [thang]
                        insert /*+ APPEND */ into dbw_otl_values nologging (
                            dbw_date,
                            dbw_core,
                            dbw_code,
                            outlet_ams_id,
                            ovalue,
                            maintain_user,
                            maintain_time
                        )
                        select
                            var_dbw_date,
                            AMS_MODL_STORES.CORE_DBW,
                            'CFAC',
                            acc.outlet_ams_id,
                            count(*) inforce_account,
                            pv_user,
                            sysdate
                        from
                        (
                            select /*+ CARDINALITY(a, 100)*/
                                a.account_id,
                                a.outlet_ams_id
                            from dbw_acc_dates a
                            where a.dbw_date
                                    between var_query_begin
                                    and var_query_end
                                and a.dbw_code = 'COF'
                                and var_query_end
                                    between trunc(a.acc_fdate, 'fmdd')
                                    and trunc(a.acc_tdate, 'fmdd')
                        ) acc
                        group by acc.outlet_ams_id;
                        commit;

                        -- Buoc 02.03: Ghi nhan du lieu so luong hop dong huy
                        -- sau thoi gian cho phep [thang]
                        insert /*+ APPEND */ into dbw_otl_values nologging (
                            dbw_date,
                            dbw_core,
                            dbw_code,
                            outlet_ams_id,
                            ovalue,
                            maintain_user,
                            maintain_time
                        )
                        select
                            var_dbw_date,
                            AMS_MODL_STORES.CORE_DBW,
                            'OFAC',
                            acc.outlet_ams_id,
                            count(*) inforce_account,
                            pv_user,
                            sysdate
                        from
                        (
                            select /*+ CARDINALITY(a, 100)*/
                                a.account_id,
                                a.outlet_ams_id
                            from dbw_acc_dates a
                            where a.dbw_date
                                    between var_query_begin
                                    and var_query_end
                                and a.dbw_code = 'TOF'
                                and var_query_end
                                    between trunc(a.acc_fdate, 'fmdd')
                                    and trunc(a.acc_tdate, 'fmdd')
                        ) acc
                        group by acc.outlet_ams_id;
                        commit;

                        -- Buoc 02.04: Ghi nhan du lieu so luong hop dong huy
                        -- trong nam dau tien cua hop dong [thang]
                        insert /*+ APPEND */ into dbw_otl_values nologging (
                            dbw_date,
                            dbw_core,
                            dbw_code,
                            outlet_ams_id,
                            ovalue,
                            maintain_user,
                            maintain_time
                        )
                        select /*+ CARDINALITY(acc, 10)
                                   CARDINALITY(issu, 10) */
                            var_dbw_date,
                            AMS_MODL_STORES.CORE_DBW,
                            'OYAC',
                            acc.outlet_ams_id,
                            count(*) inforce_account,
                            pv_user,
                            sysdate
                        from
                        (
                            select /*+ CARDINALITY(a, 100)*/
                                a.account_id,
                                a.outlet_ams_id
                            from dbw_acc_dates a
                            where a.dbw_date
                                    between var_query_begin
                                    and var_query_end
                                and a.dbw_code = 'TOF'
                                and var_query_end
                                    between trunc(a.acc_fdate, 'fmdd')
                                    and trunc(a.acc_tdate, 'fmdd')
                        ) acc
                        join
                        (
                            select /*+ CARDINALITY(a, 100)*/
                                a.account_id,
                                a.outlet_ams_id
                            from dbw_acc_dates a
                            where a.dbw_date
                                    between add_months(var_query_begin, -11)
                                    and var_query_end
                                and a.dbw_code = 'ISSU'
                                and var_query_end
                                    between trunc(a.acc_fdate, 'fmdd')
                                    and trunc(a.acc_tdate, 'fmdd')
                        ) issu
                            on issu.account_id = acc.account_id
                        group by acc.outlet_ams_id;
                        commit;
                    else
                        -- Buoc 02.01: Ghi nhan du lieu so luong hop dong phat hanh [thang]
                        insert /*+ APPEND */ into dbw_otl_values nologging (
                            dbw_date,
                            dbw_core,
                            dbw_code,
                            outlet_ams_id,
                            ovalue,
                            maintain_user,
                            maintain_time
                        )
                        select
                            var_dbw_date,
                            AMS_MODL_STORES.CORE_DBW,
                            'IFAC',
                            acc.outlet_ams_id,
                            count(*) inforce_account,
                            pv_user,
                            sysdate
                        from
                        (
                            select /*+ CARDINALITY(a, 100)*/
                                a.account_id,
                                a.outlet_ams_id
                            from dbw_acc_dates a
                            where a.dbw_date
                                    between var_query_begin
                                    and var_query_end
                                and a.dbw_code = 'ISSU'
                                and var_query_end
                                    between trunc(a.acc_fdate, 'fmdd')
                                    and trunc(a.acc_tdate, 'fmdd')
                        ) acc
                        group by acc.outlet_ams_id;
                        commit;

                        -- Buoc 02.02: Ghi nhan du lieu so luong hop dong huy
                        -- trong thoi gian cho phep [thang]
                        insert /*+ APPEND */ into dbw_otl_values nologging (
                            dbw_date,
                            dbw_core,
                            dbw_code,
                            outlet_ams_id,
                            ovalue,
                            maintain_user,
                            maintain_time
                        )
                        select
                            var_dbw_date,
                            AMS_MODL_STORES.CORE_DBW,
                            'CFAC',
                            acc.outlet_ams_id,
                            count(*) inforce_account,
                            pv_user,
                            sysdate
                        from
                        (
                            select /*+ CARDINALITY(a, 100)*/
                                a.account_id,
                                a.outlet_ams_id
                            from dbw_acc_dates a
                            where a.dbw_date
                                    between var_query_begin
                                    and var_query_end
                                and a.dbw_code = 'COF'
                                and var_query_end
                                    between trunc(a.acc_fdate, 'fmdd')
                                    and trunc(a.acc_tdate, 'fmdd')
                        ) acc
                        group by acc.outlet_ams_id;
                        commit;

                        -- Buoc 02.03: Ghi nhan du lieu so luong hop dong huy
                        -- sau thoi gian cho phep [thang]
                        insert /*+ APPEND */ into dbw_otl_values nologging (
                            dbw_date,
                            dbw_core,
                            dbw_code,
                            outlet_ams_id,
                            ovalue,
                            maintain_user,
                            maintain_time
                        )
                        select
                            var_dbw_date,
                            AMS_MODL_STORES.CORE_DBW,
                            'OFAC',
                            acc.outlet_ams_id,
                            count(*) inforce_account,
                            pv_user,
                            sysdate
                        from
                        (
                            select /*+ CARDINALITY(a, 100)*/
                                a.account_id,
                                a.outlet_ams_id
                            from dbw_acc_dates a
                            where a.dbw_date
                                    between var_query_begin
                                    and var_query_end
                                and a.dbw_code = 'TOF'
                                and var_query_end
                                    between trunc(a.acc_fdate, 'fmdd')
                                    and trunc(a.acc_tdate, 'fmdd')
                        ) acc
                        group by acc.outlet_ams_id;
                        commit;

                        -- Buoc 02.04: Ghi nhan du lieu so luong hop dong huy
                        -- trong nam dau tien cua hop dong [thang]
                        insert /*+ APPEND */ into dbw_otl_values nologging (
                            dbw_date,
                            dbw_core,
                            dbw_code,
                            outlet_ams_id,
                            ovalue,
                            maintain_user,
                            maintain_time
                        )
                        select /*+ CARDINALITY(acc, 10)
                                   CARDINALITY(issu, 10) */
                            var_dbw_date,
                            AMS_MODL_STORES.CORE_DBW,
                            'OYAC',
                            acc.outlet_ams_id,
                            count(*) inforce_account,
                            pv_user,
                            sysdate
                        from
                        (
                            select /*+ CARDINALITY(a, 100)*/
                                a.account_id,
                                a.outlet_ams_id
                            from dbw_acc_dates a
                            where a.dbw_date
                                    between var_query_begin
                                    and var_query_end
                                and a.dbw_code = 'TOF'
                                and var_query_end
                                    between trunc(a.acc_fdate, 'fmdd')
                                    and trunc(a.acc_tdate, 'fmdd')
                        ) acc
                        join
                        (
                            select /*+ CARDINALITY(a, 100)*/
                                a.account_id,
                                a.outlet_ams_id
                            from dbw_acc_dates a
                            where a.dbw_date
                                    between add_months(var_query_begin, -11)
                                    and var_query_end
                                and a.dbw_code = 'ISSU'
                                and var_query_end
                                    between trunc(a.acc_fdate, 'fmdd')
                                    and trunc(a.acc_tdate, 'fmdd')
                        ) issu
                            on issu.account_id = acc.account_id
                        group by acc.outlet_ams_id;
                        commit;
                    end if;
                 end loop;
            exception
                when others then
                    AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                        '[AMS_MODL_STORES.merge_otl_accounts] ' || SQLERRM);
                    goto procedure_end;
            end;
        end if;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 11/10/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure merge_otl_initials(pd_from_date date,
        pd_to_date date,
        pv_user varchar2)
    is
        var_dbw_date date := null;
        var_query_begin date := null;
        var_query_end date := null;
    begin
        if (pv_user is not null) then
            begin
                -- Buoc 01.01: Xoa du lieu
                loop
                    delete /*+ NOLOGGING */ dbw_otl_values del
                    where del.dbw_date
                            between trunc(pd_from_date, 'MM')
                            and trunc(pd_to_date, 'MM')
                        and del.dbw_code in
                        (
                            'IP'
                        )
                        and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                    exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                    commit;
                end loop;
                commit;
            exception
                when others then
                    AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                        '[AMS_MODL_STORES.merge_otl_initials] ' || SQLERRM);
                    goto procedure_end;
            end;

            -- Buoc 02: Ghi nhan du lieu
            begin
                for i in 0..round(
                    months_between(trunc(pd_to_date, 'MM'),
                        trunc(pd_from_date, 'MM')
                    )
                )
                loop
                    var_dbw_date := add_months(trunc(pd_from_date, 'MM'), i);
                    var_query_begin := add_months(trunc(pd_from_date, 'MM'), i);
                    var_query_end := (add_months(var_query_begin, 1) - 1);

                    -- Buoc 02.01: Ghi nhan du lieu so phi dau tien [thang]
                    insert /*+ APPEND */ into dbw_otl_values nologging (
                        dbw_date,
                        dbw_core,
                        dbw_code,
                        outlet_ams_id,
                        ovalue,
                        maintain_user,
                        maintain_time
                    )
                    select /*+ CARDINALITY(acc, 10)
                               CARDINALITY(prem, 10) */
                        var_dbw_date,
                        AMS_MODL_STORES.CORE_DBW,
                        'IP',
                        acc.outlet_ams_id,
                        round(
                            sum(
                                acc.balance_indicator *
                                (
                                    case
                                        when nvl(prem.acc_freq_per_annum, 0) = 0.1 then
                                            0.1 * nvl(prem.acc_freq_premium, 0)
                                        else
                                            nvl(prem.acc_freq_premium, 0)
                                        end
                                )
                            ),
                            2
                        ) initial_premium,
                        pv_user,
                        sysdate
                    from
                    (
                        select
                            ad.account_id,
                            ad.outlet_ams_id,
                            case
                                when ad.dbw_code in ('ISSU') then
                                    1
                                when ad.dbw_code in ('COF') then
                                    -1
                                end balance_indicator
                        from dbw_acc_dates ad
                        where ad.dbw_date
                                between var_query_begin
                                and var_query_end
                            and ad.dbw_code in ('ISSU', 'COF')
                            and var_query_end
                                between ad.acc_fdate
                                and ad.acc_tdate
                    ) acc
                    join
                    (
                        select *
                        from dbw_acc_premiums ap
                        where ap.dbw_date
                                between add_months(var_query_begin, -1)
                                and var_query_end
                            and var_query_end
                                between ap.acc_fdate
                                and ap.acc_tdate
                    ) prem
                        on prem.account_id = acc.account_id
                    group by acc.outlet_ams_id;
                    commit;
                 end loop;
            exception
                when others then
                    AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                        '[AMS_MODL_STORES.merge_otl_initials] ' || SQLERRM);
                    goto procedure_end;
            end;
        end if;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 11/10/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure merge_otl_pannuals(pd_from_date date,
        pd_to_date date,
        pv_user varchar2)
    is
        var_dbw_date date := null;
        var_query_begin date := null;
        var_query_end date := null;
    begin
        if (pv_user is not null) then
            -- Buoc 01: Xoa du lieu da ton tai
            begin
                -- Buoc 01.01: Xoa du lieu
                loop
                    delete /*+ NOLOGGING */ dbw_otl_values del
                    where del.dbw_date
                            between trunc(pd_from_date, 'MM')
                            and trunc(pd_to_date, 'MM')
                        and del.dbw_code in
                        (
                            'ISAP',
                            'IFAP',
                            'PR36'
                        )
                        and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                    exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                    commit;
                end loop;
                commit;
            exception
                when others then
                    AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                        '[AMS_MODL_STORES.merge_otl_pannuals] ' || SQLERRM);
                    goto procedure_end;
            end;

            -- Buoc 02: Ghi nhan du lieu
            begin
                for i in 0..round(
                    months_between(trunc(pd_to_date, 'MM'),
                        trunc(pd_from_date, 'MM')
                    )
                )
                loop
                    var_dbw_date := add_months(trunc(pd_from_date, 'MM'), i);
                    var_query_begin := add_months(trunc(pd_from_date, 'MM'), i);
                    var_query_end := (add_months(var_query_begin, 1) - 1);

                    -- Buoc 02.01: Ghi nhan du lieu AFYP phat hanh [36 thang]
                    insert /*+ APPEND */ into dbw_otl_values nologging (
                        dbw_date,
                        dbw_core,
                        dbw_code,
                        outlet_ams_id,
                        ovalue,
                        maintain_user,
                        maintain_time
                    )
                    select /*+ CARDINALITY(acc, 10)
                               CARDINALITY(prem, 10)
                               LEADING(acc)
                               USE_NL(acc) */
                        var_dbw_date,
                        AMS_MODL_STORES.CORE_DBW,
                        'ISAP',
                        prem.acc_outlet_id,
                        round(
                             sum(nvl(prem.acc_freq_per_annum, 0) * nvl(prem.acc_freq_premium, 0)),
                             2) issured_annual_premium,
                        pv_user,
                        sysdate
                    from
                    (
                        select /*+ CARDINALITY(ad, 10) */
                            ad.account_id
                        from dbw_acc_dates ad
                        where ad.dbw_date
                                between add_months(var_query_begin, -35)
                                and var_query_end
                            and ad.dbw_code in ('ISSU')
                            and var_query_end
                                between ad.acc_fdate
                                and ad.acc_tdate
                        minus
                        select /*+ CARDINALITY(ad, 10) */
                            ad.account_id
                        from dbw_acc_dates ad
                        where ad.dbw_date
                                between add_months(var_query_begin, -35)
                                and var_query_end
                            and ad.dbw_code in ('COF')
                            and var_query_end
                                between ad.acc_fdate
                                and ad.acc_tdate
                    ) acc
                    join
                    (
                        select /*+ CARDINALITY(ap, 10) */
                            *
                        from dbw_acc_premiums ap
                        where ap.dbw_date
                                between add_months(var_query_begin, -35)
                                and var_query_end
                            and var_query_end
                                between ap.acc_fdate
                                and ap.acc_tdate
                    ) prem
                        on prem.account_id = acc.account_id
                    group by prem.acc_outlet_id;
                    commit;

                    -- Buoc 02.02: Ghi nhan du lieu AFYP con hieu luc [36 thang]
                    insert /*+ APPEND */ into dbw_otl_values nologging (
                        dbw_date,
                        dbw_core,
                        dbw_code,
                        outlet_ams_id,
                        ovalue,
                        maintain_user,
                        maintain_time
                    )
                    select /*+ CARDINALITY(acc, 10)
                               CARDINALITY(prem, 10)
                               LEADING(acc)
                               USE_NL(acc) */
                        var_dbw_date,
                        AMS_MODL_STORES.CORE_DBW,
                        'IFAP',
                        prem.acc_outlet_id,
                        round(
                             sum(nvl(prem.acc_freq_per_annum, 0) * nvl(prem.acc_freq_premium, 0)),
                             2) inforce_annual_premium,
                        pv_user,
                        sysdate
                    from
                    (
                        select /*+ CARDINALITY(ad, 10) */
                            ad.account_id
                        from dbw_acc_dates ad
                        where ad.dbw_date
                                between add_months(var_query_begin, -35)
                                and var_query_end
                            and ad.dbw_code in ('ISSU')
                            and var_query_end
                                between ad.acc_fdate
                                and ad.acc_tdate
                        minus
                        select /*+ CARDINALITY(ad, 10) */
                            ad.account_id
                        from dbw_acc_dates ad
                        where ad.dbw_date
                                between add_months(var_query_begin, -35)
                                and var_query_end
                            and ad.dbw_code in ('COF')
                            and var_query_end
                                between ad.acc_fdate
                                and ad.acc_tdate
                        minus
                        select /*+ CARDINALITY(ad, 10) */
                            ad.account_id
                        from dbw_acc_dates ad
                        where ad.dbw_date
                                between add_months(var_query_begin, -35)
                                and var_query_end
                            and ad.dbw_code in ('TOF')
                            and var_query_end
                                between ad.acc_fdate
                                and ad.acc_tdate
                    ) acc
                    join
                    (
                        select /*+ CARDINALITY(ap, 10) */
                            *
                        from dbw_acc_premiums ap
                        where ap.dbw_date
                                between add_months(var_query_begin, -35)
                                and var_query_end
                            and var_query_end
                                between ap.acc_fdate
                                and ap.acc_tdate
                    ) prem
                        on prem.account_id = acc.account_id
                    group by prem.acc_outlet_id;
                    commit;

                    -- Buoc 02.03: Ghi nhan ty le duy tri hop dong [36 thang]
                    insert /*+ APPEND */ into dbw_otl_values nologging (
                        dbw_date,
                        dbw_core,
                        dbw_code,
                        outlet_ams_id,
                        ovalue,
                        maintain_user,
                        maintain_time
                    )
                    select /*+ CARDINALITY(isap, 10)
                               CARDINALITY(ifap, 10)
                               LEADING(isap ifap) */
                        var_dbw_date,
                        AMS_MODL_STORES.CORE_DBW,
                        'PR36',
                        isap.outlet_ams_id,
                        round(
                            least(100,
                                case
                                    when nvl(isap.issured_annual_premium, 0) = 0 then
                                        100
                                    else
                                        nvl(ifap.inforce_annual_premium, 0) / nvl(isap.issured_annual_premium, 0) * 100
                                    end
                                ),
                            2) retention_premium_rate,
                        pv_user,
                        sysdate
                    from
                    (
                        select /*+ CARDINALITY(o, 10) */
                            o.outlet_ams_id,
                            o.ovalue issured_annual_premium
                        from dbw_otl_values o
                        where o.dbw_date = var_dbw_date
                            and o.dbw_code = 'ISAP'
                    ) isap
                    left join
                    (
                        select /*+ CARDINALITY(o, 10) */
                            o.outlet_ams_id,
                            o.ovalue inforce_annual_premium
                        from dbw_otl_values o
                        where o.dbw_date = var_dbw_date
                            and o.dbw_code = 'IFAP'
                    ) ifap
                        on ifap.outlet_ams_id = isap.outlet_ams_id;
                    commit;
                end loop;
            exception
                when others then
                    AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                        '[AMS_MODL_STORES.merge_otl_pannuals] ' || SQLERRM);
                    goto procedure_end;
            end;
        end if;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 11/10/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure merge_otl_transactions(pd_from_date date,
        pd_to_date date,
        pv_user varchar2)
    is
        var_dbw_date date := null;
        var_query_begin date := null;
        var_query_end date := null;

        var_ncom_dbegin date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/COMP/C2015/INFO/BDATE');
        var_ncom_dend date := null;
        var_ncom_drev number(3) := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/COMP/C2015/INFO/DREV');
        var_ncom_ndate date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/COMP/C2015/INFO/NDATE');
        var_ncom_nday number(3) := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/COMP/C2015/INFO/NDAY');
    begin
        if (pv_user is not null) then
            -- Buoc 01: Xoa du lieu da ton tai
            begin
                -- Buoc 01.01: Xoa du lieu
                loop
                    delete /*+ NOLOGGING */ dbw_otl_values del
                    where del.dbw_date
                            between trunc(pd_from_date, 'MM')
                            and trunc(pd_to_date, 'MM')
                        and del.dbw_code in
                        (
                            'FYP',
                            'IFYP',
                            'UFYP',
                            'UIFYP'
                        )
                        and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                    exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                    commit;
                end loop;
                commit;

                loop
                    delete /*+ NOLOGGING */ ams_con_transactions del
                    where del.trans_date
                            between trunc(pd_from_date, 'MM')
                            and trunc(pd_to_date, 'MM')
                        and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                    exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                    commit;
                end loop;
                commit;
            exception
                when others then
                    AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                        '[AMS_MODL_STORES.merge_otl_transactions] ' || SQLERRM);
                    goto procedure_end;
            end;

            -- Buoc 02: Ghi nhan du lieu
            begin
                for i in 0..round(
                    months_between(trunc(pd_to_date, 'MM'),
                        trunc(pd_from_date, 'MM')
                    )
                )
                loop
                    var_dbw_date := add_months(trunc(pd_from_date, 'MM'), i);
                    var_query_begin := add_months(trunc(pd_from_date, 'MM'), i);
                    var_query_end := (add_months(var_query_begin, 1) - 1);

                    -- Buoc 02.01: Ghi nhan du lieu FYP [thang]
                    if (var_dbw_date = var_ncom_dbegin) then
                        insert /*+ APPEND*/ into ams_con_transactions nologging (
                            trans_date,
                            trans_core,
                            trans_code,
                            account_id,
                            missu_date,
                            meffe_date,
                            outlet_ams_id,
                            trans_dpayments,
                            trans_dprocessed,
                            trans_dbussiness,
                            trans_year,
                            trans_premium,
                            trans_fyp,
                            maintain_user,
                            maintain_time)
                        select
                            var_query_begin,
                            trans.dbw_core,
                            trans.dbw_code,
                            trans.account_id,
                            trans.issu_date,
                            trans.effe_date,
                            trans.outlet_ams_id,
                            trans.tran_dpayments,
                            trans.tran_dprocessed,
                            trans.tran_dbussiness,
                            trans.tran_year,
                            trans.tran_premium,
                            trans.tran_fyp,
                            pv_user,
                            sysdate
                        from
                        (
                            select
                                t.dbw_core,
                                t.dbw_code,
                                t.outlet_ams_id,
                                t.account_id,
                                t.tran_dpayments,
                                t.tran_dprocessed,
                                t.tran_dbussiness,
                                t.tran_year,
                                t.tran_premium,
                                t.tran_fyp,
                                nvl(i.issu_date, add_months(var_query_begin, -1)) issu_date,
                                nvl(e.effe_date, add_months(var_query_begin, -2)) effe_date
                            from
                            (
                                select
                                    at.dbw_core,
                                    at.dbw_code,
                                    at.outlet_ams_id,
                                    at.account_id,
                                    at.tran_dpayments,
                                    at.tran_dprocessed,
                                    at.tran_dbussiness,
                                    at.tran_year,
                                    at.tran_premium,
                                    at.tran_fyp
                                from dbw_acc_transactions at
                                where at.dbw_date
                                        between var_query_begin
                                        and (var_query_end + var_ncom_drev)
                                        and at.tran_dbussiness
                                            between var_query_begin
                                            and (var_query_end + var_ncom_drev)
                            ) t
                            left join
                            (
                                select
                                    ad.account_id,
                                    max(ad.dbw_date) issu_date
                                from dbw_acc_dates ad
                                where ad.dbw_date
                                        between var_query_begin
                                        and (var_query_end + var_ncom_drev)
                                    and ad.dbw_code in ('ISSU')
                                    and (var_query_end + var_ncom_drev)
                                        between ad.acc_fdate
                                        and ad.acc_tdate
                                group by account_id
                            ) i
                                on i.account_id = t.account_id
                            left join
                            (
                                select
                                    ad.account_id,
                                    max(ad.acc_date) effe_date
                                from dbw_acc_dates ad
                                where ad.dbw_date
                                        between add_months(var_query_begin, -1)
                                        and (var_query_end + var_ncom_drev)
                                    and ad.dbw_code in ('EFFE')
                                    and (var_query_end + var_ncom_drev)
                                        between ad.acc_fdate
                                        and ad.acc_tdate
                                group by account_id
                            ) e
                                on e.account_id = t.account_id
                        ) trans
                        where
                        (
                            -- CASE 1:
                            -- Hieu luc truoc thang T-1
                            -- Phat hanh den het thang T
                            -- Phat sinh giao dich trong thang T
                            (
                                trans.effe_date < add_months(var_query_begin, -1)
                                and
                                trans.issu_date <= var_query_begin
                                and
                                trans.tran_dbussiness
                                    between var_query_begin
                                    and var_query_end
                            )

                            -- CASE 2.A:
                            -- Hieu luc trong thang T-1
                            -- Phat hanh tu 1/T den 7/T
                            -- Phat sinh giao dich tu 1/T den het thang T
                            or
                            (
                                trans.effe_date
                                    between add_months(var_query_begin, -1)
                                    and last_day(add_months(var_query_begin, -1))
                                and trans.issu_date
                                    between var_query_begin
                                    and (var_query_begin + var_ncom_drev - 1)
                                and
                                trans.tran_dbussiness
                                    between var_query_begin
                                    and var_query_end
                            )

                            -- CASE 2.B:
                            -- Hieu luc trong thang T-1
                            -- Phat hanh khong tu 1/T den 7/T
                            -- Phat sinh giao dich trong thang T
                            or
                            (
                                trans.effe_date
                                    between add_months(var_query_begin, -1)
                                    and last_day(add_months(var_query_begin, -1))
                                and trans.issu_date
                                    not between var_query_begin
                                    and (var_query_begin + var_ncom_drev - 1)
                                and
                                trans.tran_dbussiness
                                    between var_query_begin
                                    and var_query_end
                            )

                            -- CASE 3.A:
                            -- Hieu luc trong thang T
                            -- Phat hanh trong thang T
                            -- Phat sinh giao dich trong thang T
                            or
                            (
                                trans.effe_date
                                    between var_query_begin
                                    and var_query_end
                                and
                                trans.issu_date
                                    between var_query_begin
                                    and var_query_end
                                and
                                trans.tran_dbussiness
                                    between var_query_begin
                                    and var_query_end
                            )

                            -- CASE 3.B:
                            -- Hieu luc trong thang T
                            -- Phat hanh tu 1/T+1 den 7/T+1
                            -- TAL: Phat sinh giao dich tu 1/T den 7/T+1
                            -- BVL: Phat sinh giao dich tu 1/T+1 den 7/T+1
                            or
                            (
                                trans.effe_date
                                    between var_query_begin
                                    and var_query_end
                                and
                                trans.issu_date
                                    between (var_query_end + 1)
                                    and (var_query_end + var_ncom_drev)
                                and
                                trans.tran_dbussiness
                                    between (var_query_end + 1)
                                    and (var_query_end + var_ncom_drev)
                            )
                        );
                        commit;

                        insert /*+ APPEND */ into dbw_otl_values nologging (
                            dbw_date,
                            dbw_core,
                            dbw_code,
                            outlet_ams_id,
                            ovalue,
                            maintain_user,
                            maintain_time
                        )
                        select
                            var_dbw_date,
                            AMS_MODL_STORES.CORE_DBW,
                            'FYP',
                            tran.outlet_ams_id,
                            round(
                                sum(nvl(tran.first_year_premium, 0)),
                                2) first_year_premium,
                            pv_user,
                            sysdate
                        from
                        (
                            select
                                at.outlet_ams_id,
                                nvl(at.tran_fyp, 0) first_year_premium
                            from dbw_acc_transactions at
                            where at.dbw_date
                                    between var_query_begin
                                    and var_query_end
                        ) tran
                        group by tran.outlet_ams_id;
                        commit;

                        insert /*+ APPEND */ into dbw_otl_values nologging (
                            dbw_date,
                            dbw_core,
                            dbw_code,
                            outlet_ams_id,
                            ovalue,
                            maintain_user,
                            maintain_time
                        )
                        select
                            var_dbw_date,
                            AMS_MODL_STORES.CORE_DBW,
                            'UFYP',
                            tran.outlet_ams_id,
                            round(
                                sum(nvl(tran.first_year_premium, 0)),
                                2) first_year_premium,
                            pv_user,
                            sysdate
                        from
                        (
                            select
                                ct.outlet_ams_id,
                                nvl(ct.trans_fyp, 0) first_year_premium
                            from ams_con_transactions ct
                            where ct.trans_date
                                    between var_query_begin
                                    and var_query_end
                        ) tran
                        group by tran.outlet_ams_id;
                        commit;

                        insert /*+ APPEND */ into dbw_otl_values nologging (
                            dbw_date,
                            dbw_core,
                            dbw_code,
                            outlet_ams_id,
                            ovalue,
                            maintain_user,
                            maintain_time
                        )
                        select /*+ CARDINALITY(acc, 10)
                                   CARDINALITY(tran, 10)
                                   LEADING(acc)
                                   USE_NL(acc) */
                            var_dbw_date,
                            AMS_MODL_STORES.CORE_DBW,
                            'UIFYP',
                            acc.outlet_ams_id,
                            round(
                                sum(nvl(tran.first_year_premium, 0)),
                                2) first_year_premium,
                            pv_user,
                            sysdate
                        from
                        (
                            select
                                iacc.account_id,
                                iacc.outlet_ams_id
                            from
                            (
                                select
                                    ad.account_id,
                                    ad.outlet_ams_id,
                                    max(ad.dbw_date) issu_date
                                from dbw_acc_dates ad
                                where ad.dbw_date
                                        between var_query_begin
                                        and (var_query_end + var_ncom_drev)
                                    and ad.dbw_code in ('ISSU')
                                    and (var_query_end + var_ncom_drev)
                                        between ad.acc_fdate
                                        and ad.acc_tdate
                                group by ad.account_id,
                                    ad.outlet_ams_id
                            ) iacc
                            left join
                            (
                                select
                                    ad.account_id,
                                    max(ad.acc_date) effe_date
                                from dbw_acc_dates ad
                                where ad.dbw_date
                                        between add_months(var_query_begin, -1)
                                        and (var_query_end + var_ncom_drev)
                                    and ad.dbw_code in ('EFFE')
                                    and (var_query_end + var_ncom_drev)
                                        between ad.acc_fdate
                                        and ad.acc_tdate
                                group by account_id
                            ) eacc
                                on eacc.account_id = iacc.account_id
                            where
                            (
                                -- CASE 1:
                                -- Hieu luc den thang T
                                -- Phat hanh tu 1/7 den 7/T+1
                                (
                                    nvl(eacc.effe_date, add_months(var_query_begin, -1)) <= var_query_end
                                    and
                                    iacc.issu_date
                                        between var_query_begin
                                        and (var_query_end + var_ncom_drev)
                                )
                            )
                        ) acc
                        join
                        (
                            select
                                ct.account_id,
                                nvl(ct.trans_fyp, 0) first_year_premium
                            from ams_con_transactions ct
                            where ct.trans_date
                                    between var_query_begin
                                    and var_query_end
                        ) tran
                            on tran.account_id = acc.account_id
                        group by acc.outlet_ams_id;
                        commit;
                    elsif (
                        (var_dbw_date >= add_months(var_ncom_dbegin, 1))
                        and
                        (var_dbw_date < var_ncom_ndate)
                    ) then
                        insert /*+ APPEND*/ into ams_con_transactions nologging (
                            trans_date,
                            trans_core,
                            trans_code,
                            account_id,
                            missu_date,
                            meffe_date,
                            outlet_ams_id,
                            trans_dpayments,
                            trans_dprocessed,
                            trans_dbussiness,
                            trans_year,
                            trans_premium,
                            trans_fyp,
                            maintain_user,
                            maintain_time)
                        select
                            var_query_begin,
                            trans.dbw_core,
                            trans.dbw_code,
                            trans.account_id,
                            trans.issu_date,
                            trans.effe_date,
                            trans.outlet_ams_id,
                            trans.tran_dpayments,
                            trans.tran_dprocessed,
                            trans.tran_dbussiness,
                            trans.tran_year,
                            trans.tran_premium,
                            trans.tran_fyp,
                            pv_user,
                            sysdate
                        from
                        (
                            select
                                t.dbw_core,
                                t.dbw_code,
                                t.outlet_ams_id,
                                t.account_id,
                                t.tran_dpayments,
                                t.tran_dprocessed,
                                t.tran_dbussiness,
                                t.tran_year,
                                t.tran_premium,
                                t.tran_fyp,
                                nvl(i.issu_date, add_months(var_query_begin, -1)) issu_date,
                                nvl(e.effe_date, add_months(var_query_begin, -2)) effe_date
                            from
                            (
                                select
                                    at.dbw_core,
                                    at.dbw_code,
                                    at.outlet_ams_id,
                                    at.account_id,
                                    at.tran_dpayments,
                                    at.tran_dprocessed,
                                    at.tran_dbussiness,
                                    at.tran_year,
                                    at.tran_premium,
                                    at.tran_fyp
                                from dbw_acc_transactions at
                                where at.dbw_date
                                        between var_query_begin
                                        and (var_query_end + var_ncom_drev)
                                        and at.tran_dbussiness
                                            between var_query_begin
                                            and (var_query_end + var_ncom_drev)
                            ) t
                            left join
                            (
                                select
                                    ad.account_id,
                                    max(ad.dbw_date) issu_date
                                from dbw_acc_dates ad
                                where ad.dbw_date
                                        between var_query_begin
                                        and (var_query_end + var_ncom_drev)
                                    and ad.dbw_code in ('ISSU')
                                    and (var_query_end + var_ncom_drev)
                                        between ad.acc_fdate
                                        and ad.acc_tdate
                                group by account_id
                            ) i
                                on i.account_id = t.account_id
                            left join
                            (
                                select
                                    ad.account_id,
                                    max(ad.acc_date) effe_date
                                from dbw_acc_dates ad
                                where ad.dbw_date
                                        between add_months(var_query_begin, -1)
                                        and (var_query_end + var_ncom_drev)
                                    and ad.dbw_code in ('EFFE')
                                    and (var_query_end + var_ncom_drev)
                                        between ad.acc_fdate
                                        and ad.acc_tdate
                                group by account_id
                            ) e
                                on e.account_id = t.account_id
                        ) trans
                        where
                        (
                            -- CASE 1:
                            -- Hieu luc truoc thang T-1
                            -- Phat hanh den het thang T
                            -- Phat sinh giao dich trong thang T
                            (
                                trans.effe_date < add_months(var_query_begin, -1)
                                and
                                trans.issu_date <= var_query_end
                                and
                                trans.tran_dbussiness
                                    between var_query_begin
                                    and var_query_end
                            )

                            -- CASE 2.A:
                            -- Hieu luc trong thang T-1
                            -- Phat hanh tu 1/T den 7/T
                            -- Phat sinh giao dich tu 8/T den het thang T
                            or
                            (
                                trans.effe_date
                                    between add_months(var_query_begin, -1)
                                    and last_day(add_months(var_query_begin, -1))
                                and trans.issu_date
                                    between var_query_begin
                                    and (var_query_begin + var_ncom_drev - 1)
                                and
                                trans.tran_dbussiness
                                    between (var_query_begin + var_ncom_drev)
                                    and var_query_end
                            )

                            -- CASE 2.B:
                            -- Hieu luc trong thang T-1
                            -- Phat hanh khong tu 1/T den 7/T
                            -- Phat sinh giao dich trong thang T
                            or
                            (
                                trans.effe_date
                                    between add_months(var_query_begin, -1)
                                    and last_day(add_months(var_query_begin, -1))
                                and trans.issu_date
                                    not between var_query_begin
                                    and (var_query_begin + var_ncom_drev - 1)
                                and
                                trans.tran_dbussiness
                                    between var_query_begin
                                    and var_query_end
                            )

                            -- CASE 3.A:
                            -- Hieu luc trong thang T
                            -- Phat hanh trong thang T
                            -- Phat sinh giao dich trong thang T
                            or
                            (
                                trans.effe_date
                                    between var_query_begin
                                    and var_query_end
                                and
                                trans.issu_date
                                    between var_query_begin
                                    and var_query_end
                                and
                                trans.tran_dbussiness
                                    between var_query_begin
                                    and var_query_end
                            )

                            -- CASE 3.B:
                            -- Hieu luc trong thang T
                            -- Phat hanh tu 1/T+1 den 7/T+1
                            -- TAL: Phat sinh giao dich tu 1/T den 7/T+1
                            -- BVL: Phat sinh giao dich tu 1/T+1 den 7/T+1
                            or
                            (
                                trans.effe_date
                                    between var_query_begin
                                    and var_query_end
                                and
                                trans.issu_date
                                    between (var_query_end + 1)
                                    and (var_query_end + var_ncom_drev)
                                and
                                trans.tran_dbussiness
                                    between (var_query_end + 1)
                                    and (var_query_end + var_ncom_drev)
                            )
                        );
                        commit;

                        insert /*+ APPEND */ into dbw_otl_values nologging (
                            dbw_date,
                            dbw_core,
                            dbw_code,
                            outlet_ams_id,
                            ovalue,
                            maintain_user,
                            maintain_time
                        )
                        select
                            var_dbw_date,
                            AMS_MODL_STORES.CORE_DBW,
                            'FYP',
                            tran.outlet_ams_id,
                            round(
                                sum(nvl(tran.first_year_premium, 0)),
                                2) first_year_premium,
                            pv_user,
                            sysdate
                        from
                        (
                            select
                                at.outlet_ams_id,
                                nvl(at.tran_fyp, 0) first_year_premium
                            from dbw_acc_transactions at
                            where at.dbw_date
                                    between var_query_begin
                                    and var_query_end
                        ) tran
                        group by tran.outlet_ams_id;
                        commit;

                        insert /*+ APPEND */ into dbw_otl_values nologging (
                            dbw_date,
                            dbw_core,
                            dbw_code,
                            outlet_ams_id,
                            ovalue,
                            maintain_user,
                            maintain_time
                        )
                        select
                            var_dbw_date,
                            AMS_MODL_STORES.CORE_DBW,
                            'UFYP',
                            tran.outlet_ams_id,
                            round(
                                sum(nvl(tran.first_year_premium, 0)),
                                2) first_year_premium,
                            pv_user,
                            sysdate
                        from
                        (
                            select
                                ct.outlet_ams_id,
                                nvl(ct.trans_fyp, 0) first_year_premium
                            from ams_con_transactions ct
                            where ct.trans_date
                                    between var_query_begin
                                    and var_query_end
                        ) tran
                        group by tran.outlet_ams_id;
                        commit;

                        insert /*+ APPEND */ into dbw_otl_values nologging (
                            dbw_date,
                            dbw_core,
                            dbw_code,
                            outlet_ams_id,
                            ovalue,
                            maintain_user,
                            maintain_time
                        )
                        select /*+ CARDINALITY(acc, 10)
                                   CARDINALITY(tran, 10)
                                   LEADING(acc)
                                   USE_NL(acc) */
                            var_dbw_date,
                            AMS_MODL_STORES.CORE_DBW,
                            'UIFYP',
                            acc.outlet_ams_id,
                            round(
                                sum(nvl(tran.first_year_premium, 0)),
                                2) first_year_premium,
                            pv_user,
                            sysdate
                        from
                        (
                            select
                                iacc.account_id,
                                iacc.outlet_ams_id
                            from
                            (
                                select
                                    ad.account_id,
                                    ad.outlet_ams_id,
                                    max(ad.dbw_date) issu_date
                                from dbw_acc_dates ad
                                where ad.dbw_date
                                        between var_query_begin
                                        and (var_query_end + var_ncom_drev)
                                    and ad.dbw_code in ('ISSU')
                                    and (var_query_end + var_ncom_drev)
                                        between ad.acc_fdate
                                        and ad.acc_tdate
                                group by ad.account_id,
                                    ad.outlet_ams_id
                            ) iacc
                            left join
                            (
                                select
                                    ad.account_id,
                                    max(ad.acc_date) effe_date
                                from dbw_acc_dates ad
                                where ad.dbw_date
                                        between add_months(var_query_begin, -1)
                                        and (var_query_end + var_ncom_drev)
                                    and ad.dbw_code in ('EFFE')
                                    and (var_query_end + var_ncom_drev)
                                        between ad.acc_fdate
                                        and ad.acc_tdate
                                group by account_id
                            ) eacc
                                on eacc.account_id = iacc.account_id
                            where
                            (
                                -- CASE 1:
                                -- Hieu luc truoc thang T-1
                                -- Phat hanh trong thang T
                                (
                                    nvl(eacc.effe_date, add_months(var_query_begin, -1) - 1) < add_months(var_query_begin, -1)
                                    and
                                    iacc.issu_date
                                        between var_query_begin
                                        and var_query_end
                                )

                                -- CASE 2:
                                -- Hieu luc trong thang T-1
                                -- Phat hanh tu 8/T den het thang T
                                or
                                (
                                    nvl(eacc.effe_date, add_months(var_query_begin, -1) - 1)
                                        between add_months(var_query_begin, -1)
                                        and last_day(add_months(var_query_begin, -1))
                                    and
                                    iacc.issu_date
                                        between (var_query_begin + var_ncom_drev)
                                        and var_query_end
                                )

                                -- CASE 3:
                                -- Hieu luc trong thang T
                                -- Phat hanh tu 1/T den het thang 7/T+1
                                or
                                (
                                    nvl(eacc.effe_date, add_months(var_query_begin, -1) - 1)
                                        between var_query_begin
                                        and last_day(var_query_begin)
                                    and
                                    iacc.issu_date
                                        between var_query_begin
                                        and (var_query_end + var_ncom_drev)
                                )
                            )
                        ) acc
                        join
                        (
                            select
                                ct.account_id,
                                nvl(ct.trans_fyp, 0) first_year_premium
                            from ams_con_transactions ct
                            where ct.trans_date
                                    between var_query_begin
                                    and var_query_end
                        ) tran
                            on tran.account_id = acc.account_id
                        group by acc.outlet_ams_id;
                        commit;
                    elsif (var_dbw_date = var_ncom_ndate) then
                        insert /*+ APPEND*/ into ams_con_transactions nologging (
                            trans_date,
                            trans_core,
                            trans_code,
                            account_id,
                            missu_date,
                            meffe_date,
                            outlet_ams_id,
                            trans_dpayments,
                            trans_dprocessed,
                            trans_dbussiness,
                            trans_year,
                            trans_premium,
                            trans_fyp,
                            maintain_user,
                            maintain_time)
                        select
                            var_query_begin,
                            trans.dbw_core,
                            trans.dbw_code,
                            trans.account_id,
                            trans.issu_date,
                            trans.effe_date,
                            trans.outlet_ams_id,
                            trans.tran_dpayments,
                            trans.tran_dprocessed,
                            trans.tran_dbussiness,
                            trans.tran_year,
                            trans.tran_premium,
                            trans.tran_fyp,
                            pv_user,
                            sysdate
                        from
                        (
                            select
                                t.dbw_core,
                                t.dbw_code,
                                t.outlet_ams_id,
                                t.account_id,
                                t.tran_dpayments,
                                t.tran_dprocessed,
                                t.tran_dbussiness,
                                t.tran_year,
                                t.tran_premium,
                                t.tran_fyp,
                                nvl(i.issu_date, add_months(var_query_begin, -1)) issu_date,
                                nvl(e.effe_date, add_months(var_query_begin, -2)) effe_date
                            from
                            (
                                select
                                    at.dbw_core,
                                    at.dbw_code,
                                    at.outlet_ams_id,
                                    at.account_id,
                                    at.tran_dpayments,
                                    at.tran_dprocessed,
                                    at.tran_dbussiness,
                                    at.tran_year,
                                    at.tran_premium,
                                    at.tran_fyp
                                from dbw_acc_transactions at
                                where at.dbw_date
                                        between var_query_begin
                                        and (var_query_end + var_ncom_drev)
                                        and at.tran_dbussiness
                                            between var_query_begin
                                            and (var_query_end + var_ncom_drev)
                            ) t
                            left join
                            (
                                select
                                    ad.account_id,
                                    max(ad.dbw_date) issu_date
                                from dbw_acc_dates ad
                                where ad.dbw_date
                                        between var_query_begin
                                        and (var_query_end + var_ncom_drev)
                                    and ad.dbw_code in ('ISSU')
                                    and (var_query_end + var_ncom_drev)
                                        between ad.acc_fdate
                                        and ad.acc_tdate
                                group by account_id
                            ) i
                                on i.account_id = t.account_id
                            left join
                            (
                                select
                                    ad.account_id,
                                    max(ad.acc_date) effe_date
                                from dbw_acc_dates ad
                                where ad.dbw_date
                                        between add_months(var_query_begin, -1)
                                        and (var_query_end + var_ncom_drev)
                                    and ad.dbw_code in ('EFFE')
                                    and (var_query_end + var_ncom_drev)
                                        between ad.acc_fdate
                                        and ad.acc_tdate
                                group by account_id
                            ) e
                                on e.account_id = t.account_id
                            left join
                            (
                                select
                                    ad.account_id
                                from dbw_acc_dates ad
                                where ad.dbw_date
                                        between add_months(var_query_begin, -1)
                                        and last_day(add_months(var_query_begin, 1))
                                    and ad.dbw_code in ('COF')
                                    and last_day(add_months(var_query_begin, 1))
                                        between ad.acc_fdate
                                        and ad.acc_tdate
                                group by account_id
                            ) cc
                                on cc.account_id = t.account_id
                            where cc.account_id is null
                        ) trans
                        where
                        (
                            -- CASE 1:
                            -- Hieu luc truoc thang T-1
                            -- Phat hanh den het thang T
                            -- Phat sinh giao dich trong thang T
                            (
                                trans.effe_date < add_months(var_query_begin, -1)
                                and
                                trans.issu_date <= var_query_end
                                and
                                trans.tran_dbussiness
                                    between var_query_begin
                                    and var_query_end
                            )

                            -- CASE 2.A:
                            -- Hieu luc trong thang T-1
                            -- Phat hanh tu 1/T den 7/T
                            -- Phat sinh giao dich tu 8/T den het thang T
                            or
                            (
                                trans.effe_date
                                    between add_months(var_query_begin, -1)
                                    and last_day(add_months(var_query_begin, -1))
                                and trans.issu_date
                                    between var_query_begin
                                    and (var_query_begin + var_ncom_drev - 1)
                                and
                                trans.tran_dbussiness
                                    between (var_query_begin + var_ncom_drev)
                                    and var_query_end
                            )

                            -- CASE 2.B:
                            -- Hieu luc trong thang T-1
                            -- Phat hanh khong tu 1/T den 7/T
                            -- Phat sinh giao dich trong thang T
                            or
                            (
                                trans.effe_date
                                    between add_months(var_query_begin, -1)
                                    and last_day(add_months(var_query_begin, -1))
                                and trans.issu_date
                                    not between var_query_begin
                                    and (var_query_begin + var_ncom_drev - 1)
                                and
                                trans.tran_dbussiness
                                    between var_query_begin
                                    and var_query_end
                            )

                            -- CASE 3.A:
                            -- Hieu luc trong thang T
                            -- Phat hanh trong thang T
                            -- Phat sinh giao dich trong thang T
                            or
                            (
                                trans.effe_date
                                    between var_query_begin
                                    and var_query_end
                                and
                                trans.issu_date
                                    between var_query_begin
                                    and var_query_end
                                and
                                trans.tran_dbussiness
                                    between var_query_begin
                                    and var_query_end
                            )

                            -- CASE 3.B:
                            -- Hieu luc trong thang T
                            -- Phat hanh tu 1/T+1 den 7/T+1
                            -- TAL: Phat sinh giao dich tu 1/T den 7/T+1
                            -- BVL: Phat sinh giao dich tu 1/T+1 den 7/T+1
                            or
                            (
                                trans.effe_date
                                    between var_query_begin
                                    and var_query_end
                                and
                                trans.issu_date
                                    between (var_query_end + 1)
                                    and (var_query_end + var_ncom_drev)
                                and
                                trans.tran_dbussiness
                                    between (var_query_end + 1)
                                    and (var_query_end + var_ncom_drev)
                            )
                        );
                        commit;

                        insert /*+ APPEND */ into dbw_otl_values nologging (
                            dbw_date,
                            dbw_core,
                            dbw_code,
                            outlet_ams_id,
                            ovalue,
                            maintain_user,
                            maintain_time
                        )
                        select
                            var_dbw_date,
                            AMS_MODL_STORES.CORE_DBW,
                            'FYP',
                            tran.outlet_ams_id,
                            round(
                                sum(nvl(tran.first_year_premium, 0)),
                                2) first_year_premium,
                            pv_user,
                            sysdate
                        from
                        (
                            select
                                at.outlet_ams_id,
                                nvl(at.tran_fyp, 0) first_year_premium
                            from dbw_acc_transactions at
                            where at.dbw_date
                                    between var_query_begin
                                    and var_query_end
                        ) tran
                        group by tran.outlet_ams_id;
                        commit;

                        insert /*+ APPEND */ into dbw_otl_values nologging (
                            dbw_date,
                            dbw_core,
                            dbw_code,
                            outlet_ams_id,
                            ovalue,
                            maintain_user,
                            maintain_time
                        )
                        select
                            var_dbw_date,
                            AMS_MODL_STORES.CORE_DBW,
                            'UFYP',
                            tran.outlet_ams_id,
                            round(
                                sum(nvl(tran.first_year_premium, 0)),
                                2) first_year_premium,
                            pv_user,
                            sysdate
                        from
                        (
                            select
                                ct.outlet_ams_id,
                                nvl(ct.trans_fyp, 0) first_year_premium
                            from ams_con_transactions ct
                            where ct.trans_date
                                    between var_query_begin
                                    and var_query_end
                        ) tran
                        group by tran.outlet_ams_id;
                        commit;

                        insert /*+ APPEND */ into dbw_otl_values nologging (
                            dbw_date,
                            dbw_core,
                            dbw_code,
                            outlet_ams_id,
                            ovalue,
                            maintain_user,
                            maintain_time
                        )
                        select /*+ CARDINALITY(acc, 10)
                                   CARDINALITY(tran, 10)
                                   LEADING(acc)
                                   USE_NL(acc) */
                            var_dbw_date,
                            AMS_MODL_STORES.CORE_DBW,
                            'UIFYP',
                            acc.outlet_ams_id,
                            round(
                                sum(nvl(tran.first_year_premium, 0)),
                                2) first_year_premium,
                            pv_user,
                            sysdate
                        from
                        (
                            select
                                iacc.account_id,
                                iacc.outlet_ams_id
                            from
                            (
                                select
                                    ad.account_id,
                                    ad.outlet_ams_id,
                                    max(ad.dbw_date) issu_date
                                from dbw_acc_dates ad
                                where ad.dbw_date
                                        between var_query_begin
                                        and (var_query_end + var_ncom_drev)
                                    and ad.dbw_code in ('ISSU')
                                    and (var_query_end + var_ncom_drev)
                                        between ad.acc_fdate
                                        and ad.acc_tdate
                                group by ad.account_id,
                                    ad.outlet_ams_id
                            ) iacc
                            left join
                            (
                                select
                                    ad.account_id,
                                    max(ad.acc_date) effe_date
                                from dbw_acc_dates ad
                                where ad.dbw_date
                                        between add_months(var_query_begin, -1)
                                        and (var_query_end + var_ncom_drev)
                                    and ad.dbw_code in ('EFFE')
                                    and (var_query_end + var_ncom_drev)
                                        between ad.acc_fdate
                                        and ad.acc_tdate
                                group by account_id
                            ) eacc
                                on eacc.account_id = iacc.account_id
                            where
                            (
                                -- CASE 1:
                                -- Hieu luc truoc thang T-1
                                -- Phat hanh trong thang T
                                (
                                    nvl(eacc.effe_date, add_months(var_query_begin, -1) - 1) < add_months(var_query_begin, -1)
                                    and
                                    iacc.issu_date
                                        between var_query_begin
                                        and var_query_end
                                )

                                -- CASE 2:
                                -- Hieu luc trong thang T-1
                                -- Phat hanh tu 8/T den het thang T
                                or
                                (
                                    nvl(eacc.effe_date, add_months(var_query_begin, -1) - 1)
                                        between add_months(var_query_begin, -1)
                                        and last_day(add_months(var_query_begin, -1))
                                    and
                                    iacc.issu_date
                                        between (var_query_begin + var_ncom_drev)
                                        and var_query_end
                                )

                                -- CASE 3:
                                -- Hieu luc trong thang T
                                -- Phat hanh tu 1/T den het thang 7/T+1
                                or
                                (
                                    nvl(eacc.effe_date, add_months(var_query_begin, -1) - 1)
                                        between var_query_begin
                                        and last_day(var_query_begin)
                                    and
                                    iacc.issu_date
                                        between var_query_begin
                                        and (var_query_end + var_ncom_drev)
                                )
                            )
                        ) acc
                        join
                        (
                            select
                                ct.account_id,
                                nvl(ct.trans_fyp, 0) first_year_premium
                            from ams_con_transactions ct
                            where ct.trans_date
                                    between var_query_begin
                                    and var_query_end
                        ) tran
                            on tran.account_id = acc.account_id
                        group by acc.outlet_ams_id;
                        commit;
                    elsif (var_dbw_date >= add_months(var_ncom_ndate, 1)) then
                        insert /*+ APPEND*/ into ams_con_transactions nologging (
                            trans_date,
                            trans_core,
                            trans_code,
                            account_id,
                            missu_date,
                            meffe_date,
                            outlet_ams_id,
                            trans_dpayments,
                            trans_dprocessed,
                            trans_dbussiness,
                            trans_year,
                            trans_premium,
                            trans_fyp,
                            maintain_user,
                            maintain_time)
                        select
                            var_query_begin,
                            trans.dbw_core,
                            trans.dbw_code,
                            trans.account_id,
                            trans.issu_date,
                            trans.effe_date,
                            trans.outlet_ams_id,
                            trans.tran_dpayments,
                            trans.tran_dprocessed,
                            trans.tran_dbussiness,
                            trans.tran_year,
                            trans.tran_premium,
                            trans.tran_fyp,
                            pv_user,
                            sysdate
                        from
                        (
                            select
                                t.dbw_core,
                                t.dbw_code,
                                t.outlet_ams_id,
                                t.account_id,
                                t.tran_dpayments,
                                t.tran_dprocessed,
                                t.tran_dbussiness,
                                t.tran_year,
                                t.tran_premium,
                                t.tran_fyp,
                                nvl(i.issu_date, add_months(var_query_begin, -1)) issu_date,
                                nvl(e.effe_date, add_months(var_query_begin, -2)) effe_date
                            from
                            (
                                select
                                    at.dbw_core,
                                    at.dbw_code,
                                    at.outlet_ams_id,
                                    at.account_id,
                                    at.tran_dpayments,
                                    at.tran_dprocessed,
                                    at.tran_dbussiness,
                                    at.tran_year,
                                    at.tran_premium,
                                    at.tran_fyp
                                from dbw_acc_transactions at
                                where at.dbw_date
                                        between var_query_begin
                                        and (var_query_end + var_ncom_drev)
                                        and at.tran_dbussiness
                                            between var_query_begin
                                            and (var_query_end + var_ncom_drev)
                            ) t
                            left join
                            (
                                select
                                    ad.account_id,
                                    max(ad.dbw_date) issu_date
                                from dbw_acc_dates ad
                                where ad.dbw_date
                                        between var_query_begin
                                        and (var_query_end + var_ncom_drev)
                                    and ad.dbw_code in ('ISSU')
                                    and (var_query_end + var_ncom_drev)
                                        between ad.acc_fdate
                                        and ad.acc_tdate
                                group by account_id
                            ) i
                                on i.account_id = t.account_id
                            left join
                            (
                                select
                                    ad.account_id,
                                    max(ad.acc_date) effe_date
                                from dbw_acc_dates ad
                                where ad.dbw_date
                                        between add_months(var_query_begin, -1)
                                        and (var_query_end + var_ncom_drev)
                                    and ad.dbw_code in ('EFFE')
                                    and (var_query_end + var_ncom_drev)
                                        between ad.acc_fdate
                                        and ad.acc_tdate
                                group by account_id
                            ) e
                                on e.account_id = t.account_id
                            left join
                            (
                                select
                                    ad.account_id
                                from dbw_acc_dates ad
                                where ad.dbw_date
                                        between add_months(var_query_begin, -1)
                                        and last_day(add_months(var_query_begin, 1))
                                    and ad.dbw_code in ('COF')
                                    and last_day(add_months(var_query_begin, 1))
                                        between ad.acc_fdate
                                        and ad.acc_tdate
                                group by account_id
                            ) cc
                                on cc.account_id = t.account_id
                            where cc.account_id is null
                        ) trans
                        where
                        (
                            -- CASE 1:
                            -- Hieu luc truoc thang T-1
                            -- Phat hanh den het thang T
                            -- Phat sinh giao dich trong thang T
                            (
                                trans.effe_date < add_months(var_query_begin, -1)
                                and
                                trans.issu_date <= var_query_end
                                and
                                trans.tran_dbussiness
                                    between var_query_begin
                                    and var_query_end
                            )

                            -- CASE 2.A:
                            -- Hieu luc trong thang T-1
                            -- Phat hanh tu 1/T den 7/T
                            -- Phat sinh giao dich tu 8/T den het thang T
                            or
                            (
                                trans.effe_date
                                    between add_months(var_query_begin, -1)
                                    and last_day(add_months(var_query_begin, -1))
                                and trans.issu_date
                                    between var_query_begin
                                    and (var_query_begin + var_ncom_drev - 1)
                                and
                                trans.tran_dbussiness
                                    between (var_query_begin + var_ncom_drev)
                                    and var_query_end
                            )

                            -- CASE 2.B:
                            -- Hieu luc trong thang T-1
                            -- Phat hanh khong tu 1/T den 7/T
                            -- Phat sinh giao dich trong thang T
                            or
                            (
                                trans.effe_date
                                    between add_months(var_query_begin, -1)
                                    and last_day(add_months(var_query_begin, -1))
                                and trans.issu_date
                                    not between var_query_begin
                                    and (var_query_begin + var_ncom_drev - 1)
                                and
                                trans.tran_dbussiness
                                    between var_query_begin
                                    and var_query_end
                            )

                            -- CASE 3.A:
                            -- Hieu luc trong thang T
                            -- Phat hanh trong thang T
                            -- Phat sinh giao dich trong thang T
                            or
                            (
                                trans.effe_date
                                    between var_query_begin
                                    and var_query_end
                                and
                                trans.issu_date
                                    between var_query_begin
                                    and var_query_end
                                and
                                trans.tran_dbussiness
                                    between var_query_begin
                                    and var_query_end
                            )

                            -- CASE 3.B:
                            -- Hieu luc trong thang T
                            -- Phat hanh tu 1/T+1 den 7/T+1
                            -- TAL: Phat sinh giao dich tu 1/T den 7/T+1
                            -- BVL: Phat sinh giao dich tu 1/T+1 den 7/T+1
                            or
                            (
                                trans.effe_date
                                    between var_query_begin
                                    and var_query_end
                                and
                                trans.issu_date
                                    between (var_query_end + 1)
                                    and (var_query_end + var_ncom_drev)
                                and
                                trans.tran_dbussiness
                                    between (var_query_end + 1)
                                    and (var_query_end + var_ncom_drev)
                            )
                        );
                        commit;

                        insert /*+ APPEND */ into dbw_otl_values nologging (
                            dbw_date,
                            dbw_core,
                            dbw_code,
                            outlet_ams_id,
                            ovalue,
                            maintain_user,
                            maintain_time
                        )
                        select
                            var_dbw_date,
                            AMS_MODL_STORES.CORE_DBW,
                            'FYP',
                            tran.outlet_ams_id,
                            round(
                                sum(nvl(tran.first_year_premium, 0)),
                                2) first_year_premium,
                            pv_user,
                            sysdate
                        from
                        (
                            select
                                at.outlet_ams_id,
                                nvl(at.tran_fyp, 0) first_year_premium
                            from dbw_acc_transactions at
                            where at.dbw_date
                                    between var_query_begin
                                    and var_query_end
                        ) tran
                        group by tran.outlet_ams_id;
                        commit;

                        insert /*+ APPEND */ into dbw_otl_values nologging (
                            dbw_date,
                            dbw_core,
                            dbw_code,
                            outlet_ams_id,
                            ovalue,
                            maintain_user,
                            maintain_time
                        )
                        select
                            var_dbw_date,
                            AMS_MODL_STORES.CORE_DBW,
                            'UFYP',
                            tran.outlet_ams_id,
                            round(
                                sum(nvl(tran.first_year_premium, 0)),
                                2) first_year_premium,
                            pv_user,
                            sysdate
                        from
                        (
                            select
                                ct.outlet_ams_id,
                                nvl(ct.trans_fyp, 0) first_year_premium
                            from ams_con_transactions ct
                            where ct.trans_date
                                    between var_query_begin
                                    and var_query_end
                        ) tran
                        group by tran.outlet_ams_id;
                        commit;

                        insert /*+ APPEND */ into dbw_otl_values nologging (
                            dbw_date,
                            dbw_core,
                            dbw_code,
                            outlet_ams_id,
                            ovalue,
                            maintain_user,
                            maintain_time
                        )
                        select /*+ CARDINALITY(acc, 10)
                                   CARDINALITY(tran, 10)
                                   LEADING(acc)
                                   USE_NL(acc) */
                            var_dbw_date,
                            AMS_MODL_STORES.CORE_DBW,
                            'UIFYP',
                            acc.outlet_ams_id,
                            round(
                                sum(nvl(tran.first_year_premium, 0)),
                                2) first_year_premium,
                            pv_user,
                            sysdate
                        from
                        (
                            select
                                iacc.account_id,
                                iacc.outlet_ams_id
                            from
                            (
                                select
                                    ad.account_id,
                                    ad.outlet_ams_id,
                                    max(ad.dbw_date) issu_date
                                from dbw_acc_dates ad
                                where ad.dbw_date
                                        between var_query_begin
                                        and (var_query_end + var_ncom_drev)
                                    and ad.dbw_code in ('ISSU')
                                    and (var_query_end + var_ncom_drev)
                                        between ad.acc_fdate
                                        and ad.acc_tdate
                                group by ad.account_id,
                                    ad.outlet_ams_id
                            ) iacc
                            left join
                            (
                                select
                                    ad.account_id,
                                    max(ad.acc_date) effe_date
                                from dbw_acc_dates ad
                                where ad.dbw_date
                                        between add_months(var_query_begin, -1)
                                        and (var_query_end + var_ncom_drev)
                                    and ad.dbw_code in ('EFFE')
                                    and (var_query_end + var_ncom_drev)
                                        between ad.acc_fdate
                                        and ad.acc_tdate
                                group by account_id
                            ) eacc
                                on eacc.account_id = iacc.account_id
                            where
                            (
                                -- CASE 1:
                                -- Hieu luc truoc thang T-1
                                -- Phat hanh trong thang T
                                (
                                    nvl(eacc.effe_date, add_months(var_query_begin, -1) - 1) < add_months(var_query_begin, -1)
                                    and
                                    iacc.issu_date
                                        between var_query_begin
                                        and var_query_end
                                )

                                -- CASE 2:
                                -- Hieu luc trong thang T-1
                                -- Phat hanh tu 8/T den het thang T
                                or
                                (
                                    nvl(eacc.effe_date, add_months(var_query_begin, -1) - 1)
                                        between add_months(var_query_begin, -1)
                                        and last_day(add_months(var_query_begin, -1))
                                    and
                                    iacc.issu_date
                                        between (var_query_begin + var_ncom_drev)
                                        and var_query_end
                                )

                                -- CASE 3:
                                -- Hieu luc trong thang T
                                -- Phat hanh tu 1/T den het thang 7/T+1
                                or
                                (
                                    nvl(eacc.effe_date, add_months(var_query_begin, -1) - 1)
                                        between var_query_begin
                                        and last_day(var_query_begin)
                                    and
                                    iacc.issu_date
                                        between var_query_begin
                                        and (var_query_end + var_ncom_drev)
                                )
                            )
                        ) acc
                        join
                        (
                            select
                                ct.account_id,
                                nvl(ct.trans_fyp, 0) first_year_premium
                            from ams_con_transactions ct
                            where ct.trans_date
                                    between var_query_begin
                                    and var_query_end
                        ) tran
                            on tran.account_id = acc.account_id
                        group by acc.outlet_ams_id;
                        commit;
                    end if;

                    -- Buoc 02.02: Ghi nhan du lieu FYP KTM [thang]
                    insert /*+ APPEND */ into dbw_otl_values nologging (
                        dbw_date,
                        dbw_core,
                        dbw_code,
                        outlet_ams_id,
                        ovalue,
                        maintain_user,
                        maintain_time
                    )
                    select /*+ CARDINALITY(acc, 10)
                               CARDINALITY(tran, 10)
                               LEADING(acc)
                               USE_NL(acc) */
                        var_dbw_date,
                        AMS_MODL_STORES.CORE_DBW,
                        'IFYP',
                        acc.outlet_ams_id,
                        round(
                            sum(nvl(tran.first_year_premium, 0)),
                            2) first_year_premium,
                        pv_user,
                        sysdate
                    from
                    (
                        select
                            *
                        from dbw_acc_dates ad
                        where ad.dbw_date
                                between var_query_begin
                                and var_query_end
                            and ad.dbw_code in ('ISSU')
                            and var_query_end
                                between ad.acc_fdate
                                and ad.acc_tdate
                    ) acc
                    join
                    (
                        select
                            at.account_id,
                            nvl(at.tran_fyp, 0) first_year_premium
                        from dbw_acc_transactions at
                        where at.dbw_date
                                between var_query_begin
                                and var_query_end
                    ) tran
                        on tran.account_id = acc.account_id
                    group by acc.outlet_ams_id;
                    commit;
                end loop;
            exception
                when others then
                    AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                        '[AMS_MODL_STORES.merge_otl_transactions] ' || SQLERRM);
                    goto procedure_end;
            end;
        end if;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 11/10/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure merge_otl_commissions(pd_from_date date,
        pd_to_date date,
        pv_user varchar2)
    is
        var_dbw_date date := null;
        var_query_begin date := null;
        var_query_end date := null;

        var_ncom_dbegin date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/COMP/C2015/INFO/BDATE');
        var_ncom_dend date := null;
        var_ncom_drev number(3) := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/COMP/C2015/INFO/DREV');
        var_ncom_ndate date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/COMP/C2015/INFO/NDATE');
        var_ncom_nday number(3) := AMS_MODL_VARIABLE.get_nvar_by_code('/GLOBAL/COMP/C2015/INFO/NDAY');
    begin
        if (pv_user is not null) then
            begin
                loop
                    delete /*+ NOLOGGING */ dbw_otl_values del
                    where del.dbw_date
                            between trunc(pd_from_date, 'MM')
                            and trunc(pd_to_date, 'MM')
                        and del.dbw_code in
                        (
                            'COMM',
                            'FYC',
                            'UCOM',
                            'UCOM1',
                            'UCOM2',
                            'UFYC'
                        )
                        and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                    exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                    commit;
                end loop;
                commit;

                loop
                    delete /*+ NOLOGGING */ ams_con_commissions del
                    where del.comm_date
                            between trunc(pd_from_date, 'MM')
                            and trunc(pd_to_date, 'MM')
                        and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                    exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                    commit;
                end loop;
                commit;
            exception
                when others then
                    AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                        '[AMS_MODL_STORES.merge_otl_commissions] ' || SQLERRM);
                    goto procedure_end;
            end;

            begin
                for i in 0..round(
                    months_between(trunc(pd_to_date, 'MM'),
                        trunc(pd_from_date, 'MM')
                    )
                )
                loop
                    var_dbw_date := add_months(trunc(pd_from_date, 'MM'), i);
                    var_query_begin := add_months(trunc(pd_from_date, 'MM'), i);
                    var_query_end := (add_months(var_query_begin, 1) - 1);

                    -- Buoc 02.02: Ghi nhan du lieu hoa hong
                    if (var_dbw_date = var_ncom_dbegin) then
                        insert /*+ APPEND*/ into ams_con_commissions nologging (
                            comm_date,
                            comm_core,
                            account_id,
                            missu_date,
                            meffe_date,
                            outlet_ams_id,
                            holder_name,
                            comm_dpayments,
                            comm_dprocessed,
                            comm_dbussiness,
                            comm_year,
                            comm_premium,
                            comm_fyc,
                            comm_money,
                            maintain_user,
                            maintain_time)
                        select
                            var_query_begin,
                            comm.dbw_core,
                            comm.account_id,
                            comm.issu_date,
                            comm.effe_date,
                            comm.outlet_ams_id,
                            cust.customer_name,
                            comm.comm_dpayments,
                            comm.comm_dprocessed,
                            comm.comm_dbussiness,
                            comm.comm_year,
                            comm.comm_premium,
                            comm.comm_fyc,
                            comm.comm_money,
                            pv_user,
                            sysdate
                        from
                        (
                            select
                                c.dbw_core,
                                c.outlet_ams_id,
                                c.account_id,
                                c.comm_dpayments,
                                c.comm_dprocessed,
                                c.comm_dbussiness,
                                c.comm_year,
                                c.comm_premium,
                                c.comm_fyc,
                                c.comm_money,
                                nvl(i.issu_date, add_months(var_query_begin, -1)) issu_date,
                                nvl(e.effe_date, add_months(var_query_begin, -2)) effe_date
                            from
                            (
                                select
                                    ac.dbw_core,
                                    ac.outlet_ams_id,
                                    ac.account_id,
                                    ac.comm_dpayments,
                                    ac.comm_dprocessed,
                                    ac.comm_dbussiness,
                                    ac.comm_year,
                                    ac.comm_premium,
                                    ac.comm_fyc,
                                    ac.comm_money
                                from dbw_acc_commissions ac
                                where ac.dbw_date
                                        between var_query_begin
                                        and (var_query_end + var_ncom_drev)
                            ) c
                            left join
                            (
                                select
                                    ad.account_id,
                                    max(ad.dbw_date) issu_date
                                from dbw_acc_dates ad
                                where ad.dbw_date
                                        between var_query_begin
                                        and (var_query_end + var_ncom_drev)
                                    and ad.dbw_code in ('ISSU')
                                    and (var_query_end + var_ncom_drev)
                                        between ad.acc_fdate
                                        and ad.acc_tdate
                                group by account_id
                            ) i
                                on i.account_id = c.account_id
                            left join
                            (
                                select
                                    ad.account_id,
                                    max(ad.acc_date) effe_date
                                from dbw_acc_dates ad
                                where ad.dbw_date
                                        between add_months(var_query_begin, -1)
                                        and (var_query_end + var_ncom_drev)
                                    and ad.dbw_code in ('EFFE')
                                    and (var_query_end + var_ncom_drev)
                                        between ad.acc_fdate
                                        and ad.acc_tdate
                                group by account_id
                            ) e
                                on e.account_id = c.account_id
                        ) comm
                        left join
                        (
                            select
                                c.account_id,
                                max(c.dbw_core) KEEP (DENSE_RANK LAST order by c.acc_fdate) dbw_core,
                                max(c.customer_db) KEEP (DENSE_RANK LAST order by c.acc_fdate) customer_db,
                                max(c.customer_id) KEEP (DENSE_RANK LAST order by c.acc_fdate) customer_id
                            from dbw_acc_cdbs c
                            where c.dbw_code = 'PAYS'
                                and (var_query_end + var_ncom_drev)
                                    between c.acc_fdate
                                    and c.acc_tdate
                            group by c.account_id
                        ) h
                            on h.account_id = comm.account_id
                        left join dbw_acc_customers cust
                            on
                            (
                                cust.dbw_core = h.dbw_core
                                and
                                cust.dbw_code = h.customer_db
                                and
                                cust.customer_id = h.customer_id
                            )
                        where
                        (
                            -- CASE 1:
                            -- Hieu luc truoc thang T-1
                            -- Phat hanh den het thang T
                            -- Phat sinh hoa hong trong thang T
                            (
                                comm.effe_date < add_months(var_query_begin, -1)
                                and
                                comm.issu_date <= var_query_end
                                and
                                comm.comm_dbussiness
                                    between var_query_begin
                                    and var_query_end
                            )

                            -- CASE 2.A:
                            -- Hieu luc trong thang T-1
                            -- Phat hanh tu 1/T den 7/T
                            -- Phat sinh hoa hong tu 1/T den het thang T
                            or
                            (
                                comm.effe_date
                                    between add_months(var_query_begin, -1)
                                    and last_day(add_months(var_query_begin, -1))
                                and
                                comm.issu_date
                                    between var_query_begin
                                    and (var_query_begin + var_ncom_drev - 1)
                                and
                                comm.comm_dbussiness
                                    between var_query_begin
                                    and var_query_end
                            )

                            -- CASE 2.B:
                            -- Hieu luc trong thang T-1
                            -- Phat hanh khong tu 1/T den 7/T
                            -- Phat sinh hoa hong trong thang T
                            or
                            (
                                comm.effe_date
                                    between add_months(var_query_begin, -1)
                                    and last_day(add_months(var_query_begin, -1))
                                and
                                comm.issu_date
                                    not between var_query_begin
                                    and (var_query_begin + var_ncom_drev - 1)
                                and
                                comm.comm_dbussiness
                                    between var_query_begin
                                    and var_query_end
                            )

                            -- CASE 3.A:
                            -- Hieu luc trong thang T
                            -- Phat hanh trong thang T
                            -- Phat sinh hoa hong trong thang T
                            or
                            (
                                comm.effe_date
                                    between var_query_begin
                                    and var_query_end
                                and
                                comm.issu_date
                                    between var_query_begin
                                    and var_query_end
                                and
                                comm.comm_dbussiness
                                    between var_query_begin
                                    and var_query_end
                            )

                            -- CASE 3.B:
                            -- Hieu luc trong thang T
                            -- Phat hanh tu 1/T+1 den 7/T+1
                            -- TAL: Phat sinh hoa hong tu 1/T den 7/T+1
                            -- BVL: Phat sinh hoa hong tu 1/T+1 den cuoi thang T+1
                            --      Nam hoa hong: 0
                            or
                            (
                                comm.effe_date
                                    between var_query_begin
                                    and var_query_end
                                and
                                comm.issu_date
                                    between (var_query_end + 1)
                                    and (var_query_end + var_ncom_drev)
                                and
                                (
                                    (
                                        comm.dbw_core = 'TAL'
                                        and
                                        comm.comm_dbussiness
                                            between (var_query_end + 1)
                                            and (var_query_end + var_ncom_drev)
                                    )
                                    or
                                    (
                                        comm.dbw_core = 'BVL'
                                        and
                                        comm.comm_dbussiness
                                            between add_months(var_query_begin, 1)
                                            and last_day(add_months(var_query_begin, 1))
                                        and
                                        comm.comm_year = 0
                                    )
                                )
                            )
                        );
                        commit;

                        insert /*+ APPEND NOLOGGING */ all
                            into dbw_otl_values (
                                dbw_date,
                                dbw_core,
                                dbw_code,
                                outlet_ams_id,
                                ovalue,
                                maintain_user,
                                maintain_time
                            )
                            values (
                                var_dbw_date,
                                AMS_MODL_STORES.CORE_DBW,
                                'COMM',
                                outlet_ams_id,
                                commission,
                                pv_user,
                                sysdate
                            )
                            into dbw_otl_values (
                                dbw_date,
                                dbw_core,
                                dbw_code,
                                outlet_ams_id,
                                ovalue,
                                maintain_user,
                                maintain_time
                            )
                            values (
                                var_dbw_date,
                                AMS_MODL_STORES.CORE_DBW,
                                'FYC',
                                outlet_ams_id,
                                first_year_commission,
                                pv_user,
                                sysdate
                            )
                        select
                            comm.outlet_ams_id,
                            round(sum(nvl(comm.first_year_commission, 0)), 2) first_year_commission,
                            round(sum(nvl(comm.commission, 0)), 2) commission
                        from
                        (
                            select
                                ac.outlet_ams_id,
                                ac.comm_fyc first_year_commission,
                                ac.comm_money commission
                            from dbw_acc_commissions ac
                            where ac.dbw_date
                                    between var_query_begin
                                    and var_query_end
                        ) comm
                        group by comm.outlet_ams_id;
                        commit;

                        insert /*+ APPEND */ into dbw_otl_values nologging (
                                dbw_date,
                                dbw_core,
                                dbw_code,
                                outlet_ams_id,
                                ovalue,
                                maintain_user,
                                maintain_time
                            )
                        select
                            var_dbw_date,
                            AMS_MODL_STORES.CORE_DBW,
                            'UCOM1',
                            comm.outlet_ams_id,
                            round(sum(nvl(comm.commission, 0)), 2) commission,
                            pv_user,
                            sysdate
                        from
                        (
                            select
                                cc.outlet_ams_id,
                                cc.comm_money commission
                            from ams_con_commissions cc
                            where cc.comm_date
                                    between var_query_begin
                                    and var_query_end
                                and cc.comm_dprocessed
                                    between var_query_begin
                                    and var_query_end
                        ) comm
                        group by comm.outlet_ams_id;
                        commit;

                        insert /*+ APPEND NOLOGGING */ all
                            into dbw_otl_values (
                                dbw_date,
                                dbw_core,
                                dbw_code,
                                outlet_ams_id,
                                ovalue,
                                maintain_user,
                                maintain_time
                            )
                            values (
                                var_dbw_date,
                                AMS_MODL_STORES.CORE_DBW,
                                'UCOM2',
                                outlet_ams_id,
                                commission,
                                pv_user,
                                sysdate
                            )
                            into dbw_otl_values (
                                dbw_date,
                                dbw_core,
                                dbw_code,
                                outlet_ams_id,
                                ovalue,
                                maintain_user,
                                maintain_time
                            )
                            values (
                                var_dbw_date,
                                AMS_MODL_STORES.CORE_DBW,
                                'UFYC',
                                outlet_ams_id,
                                first_year_commission,
                                pv_user,
                                sysdate
                            )
                        select
                            comm.outlet_ams_id,
                            round(sum(nvl(comm.comm_fyc, 0)), 2) first_year_commission,
                            round(sum(nvl(comm.commission, 0)), 2) commission
                        from
                        (
                            select
                                cc.outlet_ams_id,
                                cc.comm_fyc,
                                cc.comm_money commission
                            from ams_con_commissions cc
                            where cc.comm_date
                                    between var_query_begin
                                    and var_query_end
                        ) comm
                        group by comm.outlet_ams_id;
                        commit;
                    elsif (
                        (var_dbw_date >= add_months(var_ncom_dbegin, 1))
                        and
                        (var_dbw_date < var_ncom_ndate)
                    ) then
                        insert /*+ APPEND*/ into ams_con_commissions nologging (
                            comm_date,
                            comm_core,
                            account_id,
                            missu_date,
                            meffe_date,
                            outlet_ams_id,
                            holder_name,
                            comm_dpayments,
                            comm_dprocessed,
                            comm_dbussiness,
                            comm_year,
                            comm_premium,
                            comm_fyc,
                            comm_money,
                            maintain_user,
                            maintain_time)
                        select
                            var_query_begin,
                            comm.dbw_core,
                            comm.account_id,
                            comm.issu_date,
                            comm.effe_date,
                            comm.outlet_ams_id,
                            cust.customer_name,
                            comm.comm_dpayments,
                            comm.comm_dprocessed,
                            comm.comm_dbussiness,
                            comm.comm_year,
                            comm.comm_premium,
                            comm.comm_fyc,
                            comm.comm_money,
                            pv_user,
                            sysdate
                        from
                        (
                            select
                                c.dbw_core,
                                c.outlet_ams_id,
                                c.account_id,
                                c.comm_dpayments,
                                c.comm_dprocessed,
                                c.comm_dbussiness,
                                c.comm_year,
                                c.comm_premium,
                                c.comm_fyc,
                                c.comm_money,
                                nvl(i.issu_date, add_months(var_query_begin, -1)) issu_date,
                                nvl(e.effe_date, add_months(var_query_begin, -2)) effe_date
                            from
                            (
                                select
                                    ac.dbw_core,
                                    ac.outlet_ams_id,
                                    ac.account_id,
                                    ac.comm_dpayments,
                                    ac.comm_dprocessed,
                                    ac.comm_dbussiness,
                                    ac.comm_year,
                                    ac.comm_premium,
                                    ac.comm_fyc,
                                    ac.comm_money
                                from dbw_acc_commissions ac
                                where ac.dbw_date
                                        between var_query_begin
                                        and (var_query_end + var_ncom_drev)
                            ) c
                            left join
                            (
                                select
                                    ad.account_id,
                                    max(ad.dbw_date) issu_date
                                from dbw_acc_dates ad
                                where ad.dbw_date
                                        between var_query_begin
                                        and (var_query_end + var_ncom_drev)
                                    and ad.dbw_code in ('ISSU')
                                    and (var_query_end + var_ncom_drev)
                                        between ad.acc_fdate
                                        and ad.acc_tdate
                                group by account_id
                            ) i
                                on i.account_id = c.account_id
                            left join
                            (
                                select
                                    ad.account_id,
                                    max(ad.acc_date) effe_date
                                from dbw_acc_dates ad
                                where ad.dbw_date
                                        between add_months(var_query_begin, -1)
                                        and (var_query_end + var_ncom_drev)
                                    and ad.dbw_code in ('EFFE')
                                    and (var_query_end + var_ncom_drev)
                                        between ad.acc_fdate
                                        and ad.acc_tdate
                                group by account_id
                            ) e
                                on e.account_id = c.account_id
                        ) comm
                        left join
                        (
                            select
                                c.account_id,
                                max(c.dbw_core) KEEP (DENSE_RANK LAST order by c.acc_fdate) dbw_core,
                                max(c.customer_db) KEEP (DENSE_RANK LAST order by c.acc_fdate) customer_db,
                                max(c.customer_id) KEEP (DENSE_RANK LAST order by c.acc_fdate) customer_id
                            from dbw_acc_cdbs c
                            where c.dbw_code = 'PAYS'
                                and (var_query_end + var_ncom_drev)
                                    between c.acc_fdate
                                    and c.acc_tdate
                            group by c.account_id
                        ) h
                            on h.account_id = comm.account_id
                        left join dbw_acc_customers cust
                            on
                            (
                                cust.dbw_core = h.dbw_core
                                and
                                cust.dbw_code = h.customer_db
                                and
                                cust.customer_id = h.customer_id
                            )
                        where
                        (
                            -- CASE 1:
                            -- Hieu luc truoc thang T-1
                            -- Phat hanh den thang T
                            -- Phat sinh hoa hong trong thang T
                            (
                                comm.effe_date < add_months(var_query_begin, -1)
                                and
                                comm.issu_date <= var_query_end
                                and
                                comm.comm_dbussiness
                                    between var_query_begin
                                    and var_query_end
                            )

                            -- CASE 2.A:
                            -- Hieu luc trong thang T-1
                            -- Phat hanh tu 1/T den 7/T
                            -- TAL: Phat sinh hoa hong tu 8/T den het thang T
                            -- BVL: Phat sinh hoa hong tu 1/T den het thang T
                            --      Loai bo nam hoa hong khac 0
                            or
                            (
                                comm.effe_date
                                    between add_months(var_query_begin, -1)
                                    and last_day(add_months(var_query_begin, -1))
                                and
                                comm.issu_date
                                    between var_query_begin
                                    and (var_query_begin + var_ncom_drev - 1)
                                and
                                (
                                    (
                                        comm.dbw_core = 'TAL'
                                        and
                                        comm.comm_dbussiness
                                            between (var_query_begin + var_ncom_drev)
                                            and var_query_end
                                    )
                                    or
                                    (
                                        comm.dbw_core = 'BVL'
                                        and
                                        comm.comm_dbussiness
                                            between var_query_begin
                                            and var_query_end
                                        and
                                        comm.comm_year <> 0
                                    )
                                )
                            )

                            -- CASE 2.B:
                            -- Hieu luc trong thang T-1
                            -- Phat hanh khong tu 1/T den 7/T
                            -- Phat sinh hoa hong trong thang T
                            or
                            (
                                comm.effe_date
                                    between add_months(var_query_begin, -1)
                                    and last_day(add_months(var_query_begin, -1))
                                and
                                comm.issu_date
                                    not between var_query_begin
                                    and (var_query_begin + var_ncom_drev - 1)
                                and
                                comm.comm_dbussiness
                                    between var_query_begin
                                    and var_query_end
                            )

                            -- CASE 3.A:
                            -- Hieu luc trong thang T
                            -- Phat hanh trong thang T
                            -- Phat sinh hoa hong trong thang T
                            or
                            (
                                comm.effe_date
                                    between var_query_begin
                                    and var_query_end
                                and
                                comm.issu_date
                                    between var_query_begin
                                    and var_query_end
                                and
                                comm.comm_dbussiness
                                    between var_query_begin
                                    and var_query_end
                            )

                            -- CASE 3.B:
                            -- Hieu luc trong thang T
                            -- Phat hanh tu 1/T+1 den 7/T+1
                            -- TAL: Phat sinh hoa hong tu 1/T den 7/T+1
                            -- BVL: Phat sinh hoa hong tu 1/T+1 den cuoi thang T+1
                            --      Ngay xu ly tu 1/T den 7/T+1
                            --      Nam hoa hong: 0
                            or
                            (
                                comm.effe_date
                                    between var_query_begin
                                    and var_query_end
                                and
                                comm.issu_date
                                    between (var_query_end + 1)
                                    and (var_query_end + var_ncom_drev)
                                and
                                (
                                    (
                                        comm.dbw_core = 'TAL'
                                        and
                                        comm.comm_dbussiness
                                            between (var_query_end + 1)
                                            and (var_query_end + var_ncom_drev)
                                    )
                                    or
                                    (
                                        comm.dbw_core = 'BVL'
                                        and
                                        comm.comm_dbussiness
                                            between add_months(var_query_begin, 1)
                                            and last_day(add_months(var_query_begin, 1))
                                        and
                                        comm.comm_year = 0
                                    )
                                )
                            )
                        );
                        commit;

                        insert /*+ APPEND NOLOGGING */ all
                            into dbw_otl_values (
                                dbw_date,
                                dbw_core,
                                dbw_code,
                                outlet_ams_id,
                                ovalue,
                                maintain_user,
                                maintain_time
                            )
                            values (
                                var_dbw_date,
                                AMS_MODL_STORES.CORE_DBW,
                                'COMM',
                                outlet_ams_id,
                                commission,
                                pv_user,
                                sysdate
                            )
                            into dbw_otl_values (
                                dbw_date,
                                dbw_core,
                                dbw_code,
                                outlet_ams_id,
                                ovalue,
                                maintain_user,
                                maintain_time
                            )
                            values (
                                var_dbw_date,
                                AMS_MODL_STORES.CORE_DBW,
                                'FYC',
                                outlet_ams_id,
                                first_year_commission,
                                pv_user,
                                sysdate
                            )
                        select
                            comm.outlet_ams_id,
                            round(sum(nvl(comm.first_year_commission, 0)), 2) first_year_commission,
                            round(sum(nvl(comm.commission, 0)), 2) commission
                        from
                        (
                            select
                                ac.outlet_ams_id,
                                ac.comm_fyc first_year_commission,
                                ac.comm_money commission
                            from dbw_acc_commissions ac
                            where ac.dbw_date
                                    between var_query_begin
                                    and var_query_end
                        ) comm
                        group by comm.outlet_ams_id;
                        commit;

                        insert /*+ APPEND */ into dbw_otl_values nologging (
                                dbw_date,
                                dbw_core,
                                dbw_code,
                                outlet_ams_id,
                                ovalue,
                                maintain_user,
                                maintain_time
                            )
                        select
                            var_dbw_date,
                            AMS_MODL_STORES.CORE_DBW,
                            'UCOM1',
                            comm.outlet_ams_id,
                            round(sum(nvl(comm.commission, 0)), 2) commission,
                            pv_user,
                            sysdate
                        from
                        (
                            select
                                cc.outlet_ams_id,
                                cc.comm_money commission
                            from ams_con_commissions cc
                            where cc.comm_date
                                    between var_query_begin
                                    and var_query_end
                                and cc.comm_dbussiness <= var_query_end
                        ) comm
                        group by comm.outlet_ams_id;
                        commit;

                        insert /*+ APPEND NOLOGGING */ all
                            into dbw_otl_values (
                                dbw_date,
                                dbw_core,
                                dbw_code,
                                outlet_ams_id,
                                ovalue,
                                maintain_user,
                                maintain_time
                            )
                            values (
                                var_dbw_date,
                                AMS_MODL_STORES.CORE_DBW,
                                'UCOM2',
                                outlet_ams_id,
                                commission,
                                pv_user,
                                sysdate
                            )
                            into dbw_otl_values (
                                dbw_date,
                                dbw_core,
                                dbw_code,
                                outlet_ams_id,
                                ovalue,
                                maintain_user,
                                maintain_time
                            )
                            values (
                                var_dbw_date,
                                AMS_MODL_STORES.CORE_DBW,
                                'UFYC',
                                outlet_ams_id,
                                first_year_commission,
                                pv_user,
                                sysdate
                            )
                        select
                            comm.outlet_ams_id,
                            round(sum(nvl(comm.comm_fyc, 0)), 2) first_year_commission,
                            round(sum(nvl(comm.commission, 0)), 2) commission
                        from
                        (
                            select
                                cc.outlet_ams_id,
                                cc.comm_fyc,
                                cc.comm_money commission
                            from ams_con_commissions cc
                            where cc.comm_date
                                    between var_query_begin
                                    and var_query_end
                        ) comm
                        group by comm.outlet_ams_id;
                        commit;
                    elsif (var_dbw_date = var_ncom_ndate) then
                        insert /*+ APPEND*/ into ams_con_commissions nologging (
                            comm_date,
                            comm_core,
                            account_id,
                            missu_date,
                            meffe_date,
                            outlet_ams_id,
                            holder_name,
                            comm_dpayments,
                            comm_dprocessed,
                            comm_dbussiness,
                            comm_year,
                            comm_premium,
                            comm_fyc,
                            comm_money,
                            maintain_user,
                            maintain_time)
                        select
                            var_query_begin,
                            comm.dbw_core,
                            comm.account_id,
                            comm.issu_date,
                            comm.effe_date,
                            comm.outlet_ams_id,
                            cust.customer_name,
                            comm.comm_dpayments,
                            comm.comm_dprocessed,
                            comm.comm_dbussiness,
                            comm.comm_year,
                            comm.comm_premium,
                            comm.comm_fyc,
                            comm.comm_money,
                            pv_user,
                            sysdate
                        from
                        (
                            select
                                c.dbw_core,
                                c.outlet_ams_id,
                                c.account_id,
                                c.comm_dpayments,
                                c.comm_dprocessed,
                                c.comm_dbussiness,
                                c.comm_year,
                                c.comm_premium,
                                c.comm_fyc,
                                c.comm_money,
                                nvl(i.issu_date, add_months(var_query_begin, -1)) issu_date,
                                nvl(e.effe_date, add_months(var_query_begin, -2)) effe_date
                            from
                            (
                                select
                                    ac.dbw_core,
                                    ac.outlet_ams_id,
                                    ac.account_id,
                                    ac.comm_dpayments,
                                    ac.comm_dprocessed,
                                    ac.comm_dbussiness,
                                    ac.comm_year,
                                    ac.comm_premium,
                                    ac.comm_fyc,
                                    ac.comm_money
                                from dbw_acc_commissions ac
                                where ac.dbw_date
                                        between add_months(var_query_begin, -1)
                                        and (var_query_end + var_ncom_drev)
                            ) c
                            left join
                            (
                                select
                                    ad.account_id,
                                    max(ad.dbw_date) issu_date
                                from dbw_acc_dates ad
                                where ad.dbw_date
                                        between add_months(var_query_begin, -1)
                                        and (var_query_end + var_ncom_drev)
                                    and ad.dbw_code in ('ISSU')
                                    and (var_query_end + var_ncom_drev)
                                        between ad.acc_fdate
                                        and ad.acc_tdate
                                group by account_id
                            ) i
                                on i.account_id = c.account_id
                            left join
                            (
                                select
                                    ad.account_id,
                                    max(ad.acc_date) effe_date
                                from dbw_acc_dates ad
                                where ad.dbw_date
                                        between add_months(var_query_begin, -1)
                                        and (var_query_end + var_ncom_drev)
                                    and ad.dbw_code in ('EFFE')
                                    and (var_query_end + var_ncom_drev)
                                        between ad.acc_fdate
                                        and ad.acc_tdate
                                group by account_id
                            ) e
                                on e.account_id = c.account_id
                            left join
                            (
                                select
                                    ad.account_id
                                from dbw_acc_dates ad
                                where ad.dbw_date
                                        between add_months(var_query_begin, -1)
                                        and last_day(add_months(var_query_begin, 1))
                                    and ad.dbw_code in ('COF')
                                    and last_day(add_months(var_query_begin, 1))
                                        between ad.acc_fdate
                                        and ad.acc_tdate
                                group by account_id
                            ) cc
                                on cc.account_id = c.account_id
                            where cc.account_id is null
                        ) comm
                        left join
                        (
                            select
                                c.account_id,
                                max(c.dbw_core) KEEP (DENSE_RANK LAST order by c.acc_fdate) dbw_core,
                                max(c.customer_db) KEEP (DENSE_RANK LAST order by c.acc_fdate) customer_db,
                                max(c.customer_id) KEEP (DENSE_RANK LAST order by c.acc_fdate) customer_id
                            from dbw_acc_cdbs c
                            where c.dbw_code = 'PAYS'
                                and (var_query_end + var_ncom_drev)
                                    between c.acc_fdate
                                    and c.acc_tdate
                            group by c.account_id
                        ) h
                            on h.account_id = comm.account_id
                        left join dbw_acc_customers cust
                            on
                            (
                                cust.dbw_core = h.dbw_core
                                and
                                cust.dbw_code = h.customer_db
                                and
                                cust.customer_id = h.customer_id
                            );
                        commit;

                        insert /*+ APPEND NOLOGGING */ all
                            into dbw_otl_values (
                                dbw_date,
                                dbw_core,
                                dbw_code,
                                outlet_ams_id,
                                ovalue,
                                maintain_user,
                                maintain_time
                            )
                            values (
                                var_dbw_date,
                                AMS_MODL_STORES.CORE_DBW,
                                'COMM',
                                outlet_ams_id,
                                commission,
                                pv_user,
                                sysdate
                            )
                            into dbw_otl_values (
                                dbw_date,
                                dbw_core,
                                dbw_code,
                                outlet_ams_id,
                                ovalue,
                                maintain_user,
                                maintain_time
                            )
                            values (
                                var_dbw_date,
                                AMS_MODL_STORES.CORE_DBW,
                                'FYC',
                                outlet_ams_id,
                                first_year_commission,
                                pv_user,
                                sysdate
                            )
                        select
                            comm.outlet_ams_id,
                            round(sum(nvl(comm.first_year_commission, 0)), 2) first_year_commission,
                            round(sum(nvl(comm.commission, 0)), 2) commission
                        from
                        (
                            select
                                ac.outlet_ams_id,
                                ac.comm_fyc first_year_commission,
                                ac.comm_money commission
                            from dbw_acc_commissions ac
                            where ac.dbw_date
                                    between var_query_begin
                                    and var_query_end
                        ) comm
                        group by comm.outlet_ams_id;
                        commit;

                        insert /*+ APPEND */ into dbw_otl_values nologging (
                                dbw_date,
                                dbw_core,
                                dbw_code,
                                outlet_ams_id,
                                ovalue,
                                maintain_user,
                                maintain_time
                            )
                        select
                            var_dbw_date,
                            AMS_MODL_STORES.CORE_DBW,
                            'UCOM',
                            comm.outlet_ams_id,
                            round(sum(nvl(comm.commission, 0)), 2) commission,
                            pv_user,
                            sysdate
                        from
                        (
                            select
                                cc.outlet_ams_id,
                                cc.comm_money commission
                            from ams_con_commissions cc
                            where cc.comm_date
                                    between var_query_begin
                                    and var_query_end
                                and
                                (
                                    -- Case: 1
                                    -- Phat hanh tu 1/T den 25/T
                                    -- Phat sinh hoa hong tu 1/T den het thang T
                                    -- Va khong
                                    --    Phat hanh tu 1/T den 7/T
                                    --    Hieu luc trong thang T-1
                                    --    TAL: Giao dich tu 1/T den 7/T
                                    --    BVL: Giao dich tu 1/T den het thang/T va nam hoa hong = 0
                                    (
                                        cc.missu_date
                                            between var_query_begin
                                            and var_query_begin + var_ncom_nday
                                        and
                                        cc.comm_dbussiness
                                            between var_query_begin
                                            and var_query_end
                                        and not
                                        (
                                            cc.missu_date
                                                between var_query_begin
                                                and (var_query_begin + var_ncom_drev - 1)
                                            and
                                            cc.meffe_date
                                                between add_months(var_query_begin, -1)
                                                and last_day(add_months(var_query_begin, -1))
                                            and
                                            (
                                                (
                                                    cc.comm_core = 'TAL'
                                                    and
                                                    cc.comm_dbussiness
                                                        between var_query_begin
                                                        and (var_query_begin + var_ncom_drev - 1)
                                                )
                                                or
                                                (
                                                    cc.comm_core = 'BVL'
                                                    and
                                                    cc.comm_dbussiness
                                                        between var_query_begin
                                                        and var_query_end
                                                    and
                                                    cc.comm_year = 0
                                                )
                                            )
                                        )
                                    )
                                    or
                                    -- Case: 2
                                    -- Phat hanh tu truoc 1/T
                                    -- Phat sinh hoa hong tu den het thang T
                                    (
                                        cc.missu_date < var_query_begin
                                        and
                                        cc.comm_dbussiness
                                            between var_query_begin
                                            and var_query_end
                                    )
                                )
                        ) comm
                        group by comm.outlet_ams_id;
                        commit;

                        insert /*+ APPEND */ into dbw_otl_values nologging (
                                dbw_date,
                                dbw_core,
                                dbw_code,
                                outlet_ams_id,
                                ovalue,
                                maintain_user,
                                maintain_time
                            )
                        select
                            var_dbw_date,
                            AMS_MODL_STORES.CORE_DBW,
                            'UFYC',
                            comm.outlet_ams_id,
                            round(sum(nvl(comm.comm_fyc, 0)), 2),
                            pv_user,
                            sysdate
                        from
                        (
                            select
                                cc.outlet_ams_id,
                                cc.comm_fyc,
                                cc.comm_money commission
                            from ams_con_commissions cc
                            where cc.comm_date
                                    between var_query_begin
                                    and var_query_end
                                and
                                (
                                    -- CASE 1:
                                    -- Hieu luc truoc thang T-1
                                    -- Phat hanh den thang T
                                    -- Phat sinh hoa hong trong thang T
                                    (
                                        cc.meffe_date < add_months(var_query_begin, -1)
                                        and
                                        cc.missu_date <= var_query_end
                                        and
                                        cc.comm_dbussiness
                                            between var_query_begin
                                            and var_query_end
                                    )

                                    -- CASE 2.A:
                                    -- Hieu luc trong thang T-1
                                    -- Phat hanh tu 1/T den 7/T
                                    -- TAL: Phat sinh hoa hong tu 8/T den het thang T
                                    -- BVL: Phat sinh hoa hong tu 1/T den het thang T
                                    --      Loai bo nam hoa hong khac 0
                                    or
                                    (
                                        cc.meffe_date
                                            between add_months(var_query_begin, -1)
                                            and last_day(add_months(var_query_begin, -1))
                                        and
                                        cc.missu_date
                                            between var_query_begin
                                            and (var_query_begin + var_ncom_drev - 1)
                                        and
                                        (
                                            (
                                                cc.comm_core = 'TAL'
                                                and
                                                cc.comm_dbussiness
                                                    between (var_query_begin + var_ncom_drev)
                                                    and var_query_end
                                            )
                                            or
                                            (
                                                cc.comm_core = 'BVL'
                                                and
                                                cc.comm_dbussiness
                                                    between var_query_begin
                                                    and var_query_end
                                                and
                                                cc.comm_year <> 0
                                            )
                                        )
                                    )

                                    -- CASE 2.B:
                                    -- Hieu luc trong thang T-1
                                    -- Phat hanh khong tu 1/T den 7/T
                                    -- Phat sinh hoa hong trong thang T
                                    or
                                    (
                                        cc.meffe_date
                                            between add_months(var_query_begin, -1)
                                            and last_day(add_months(var_query_begin, -1))
                                        and
                                        cc.missu_date
                                            not between var_query_begin
                                            and (var_query_begin + var_ncom_drev - 1)
                                        and
                                        cc.comm_dbussiness
                                            between var_query_begin
                                            and var_query_end
                                    )

                                    -- CASE 3.A:
                                    -- Hieu luc trong thang T
                                    -- Phat hanh trong thang T
                                    -- Phat sinh hoa hong trong thang T
                                    or
                                    (
                                        cc.meffe_date
                                            between var_query_begin
                                            and var_query_end
                                        and
                                        cc.missu_date
                                            between var_query_begin
                                            and var_query_end
                                        and
                                        cc.comm_dbussiness
                                            between var_query_begin
                                            and var_query_end
                                    )

                                    -- CASE 3.B:
                                    -- Hieu luc trong thang T
                                    -- Phat hanh tu 1/T+1 den 7/T+1
                                    -- TAL: Phat sinh hoa hong tu 1/T den 7/T+1
                                    -- BVL: Phat sinh hoa hong tu 1/T+1 den cuoi thang T+1
                                    --      Ngay xu ly tu 1/T den 7/T+1
                                    --      Nam hoa hong: 0
                                    or
                                    (
                                        cc.meffe_date
                                            between var_query_begin
                                            and var_query_end
                                        and
                                        cc.missu_date
                                            between (var_query_end + 1)
                                            and (var_query_end + var_ncom_drev)
                                        and
                                        (
                                            (
                                                cc.comm_core = 'TAL'
                                                and
                                                cc.comm_dbussiness
                                                    between (var_query_end + 1)
                                                    and (var_query_end + var_ncom_drev)
                                            )
                                            or
                                            (
                                                cc.comm_core = 'BVL'
                                                and
                                                cc.comm_dbussiness
                                                    between add_months(var_query_begin, 1)
                                                    and last_day(add_months(var_query_begin, 1))
                                                and
                                                cc.comm_year = 0
                                            )
                                        )
                                    )
                                )
                        ) comm
                        group by comm.outlet_ams_id;
                        commit;
                    elsif (var_dbw_date >= add_months(var_ncom_ndate, 1)) then
                        insert /*+ APPEND*/ into ams_con_commissions nologging (
                            comm_date,
                            comm_core,
                            account_id,
                            missu_date,
                            meffe_date,
                            outlet_ams_id,
                            holder_name,
                            comm_dpayments,
                            comm_dprocessed,
                            comm_dbussiness,
                            comm_year,
                            comm_premium,
                            comm_fyc,
                            comm_money,
                            maintain_user,
                            maintain_time)
                        select
                            var_query_begin,
                            comm.dbw_core,
                            comm.account_id,
                            comm.issu_date,
                            comm.effe_date,
                            comm.outlet_ams_id,
                            cust.customer_name,
                            comm.comm_dpayments,
                            comm.comm_dprocessed,
                            comm.comm_dbussiness,
                            comm.comm_year,
                            comm.comm_premium,
                            comm.comm_fyc,
                            comm.comm_money,
                            pv_user,
                            sysdate
                        from
                        (
                            select
                                c.dbw_core,
                                c.outlet_ams_id,
                                c.account_id,
                                c.comm_dpayments,
                                c.comm_dprocessed,
                                c.comm_dbussiness,
                                c.comm_year,
                                c.comm_premium,
                                c.comm_fyc,
                                c.comm_money,
                                nvl(i.issu_date, add_months(var_query_begin, -1)) issu_date,
                                nvl(e.effe_date, add_months(var_query_begin, -2)) effe_date
                            from
                            (
                                select
                                    ac.dbw_core,
                                    ac.outlet_ams_id,
                                    ac.account_id,
                                    ac.comm_dpayments,
                                    ac.comm_dprocessed,
                                    ac.comm_dbussiness,
                                    ac.comm_year,
                                    ac.comm_premium,
                                    ac.comm_fyc,
                                    ac.comm_money
                                from dbw_acc_commissions ac
                                where ac.dbw_date
                                        between add_months(var_query_begin, -1)
                                        and (var_query_end + var_ncom_drev)
                            ) c
                            left join
                            (
                                select
                                    ad.account_id,
                                    max(ad.dbw_date) issu_date
                                from dbw_acc_dates ad
                                where ad.dbw_date
                                        between add_months(var_query_begin, -1)
                                        and (var_query_end + var_ncom_drev)
                                    and ad.dbw_code in ('ISSU')
                                    and (var_query_end + var_ncom_drev)
                                        between ad.acc_fdate
                                        and ad.acc_tdate
                                group by account_id
                            ) i
                                on i.account_id = c.account_id
                            left join
                            (
                                select
                                    ad.account_id,
                                    max(ad.acc_date) effe_date
                                from dbw_acc_dates ad
                                where ad.dbw_date
                                        between add_months(var_query_begin, -1)
                                        and (var_query_end + var_ncom_drev)
                                    and ad.dbw_code in ('EFFE')
                                    and (var_query_end + var_ncom_drev)
                                        between ad.acc_fdate
                                        and ad.acc_tdate
                                group by account_id
                            ) e
                                on e.account_id = c.account_id
                            left join
                            (
                                select
                                    ad.account_id
                                from dbw_acc_dates ad
                                where ad.dbw_date
                                        between add_months(var_query_begin, -1)
                                        and last_day(add_months(var_query_begin, 1))
                                    and ad.dbw_code in ('COF')
                                    and last_day(add_months(var_query_begin, 1))
                                        between ad.acc_fdate
                                        and ad.acc_tdate
                                group by account_id
                            ) cc
                                on cc.account_id = c.account_id
                            where cc.account_id is null
                        ) comm
                        left join
                        (
                            select
                                c.account_id,
                                max(c.dbw_core) KEEP (DENSE_RANK LAST order by c.acc_fdate) dbw_core,
                                max(c.customer_db) KEEP (DENSE_RANK LAST order by c.acc_fdate) customer_db,
                                max(c.customer_id) KEEP (DENSE_RANK LAST order by c.acc_fdate) customer_id
                            from dbw_acc_cdbs c
                            where c.dbw_code = 'PAYS'
                                and (var_query_end + var_ncom_drev)
                                    between c.acc_fdate
                                    and c.acc_tdate
                            group by c.account_id
                        ) h
                            on h.account_id = comm.account_id
                        left join dbw_acc_customers cust
                            on
                            (
                                cust.dbw_core = h.dbw_core
                                and
                                cust.dbw_code = h.customer_db
                                and
                                cust.customer_id = h.customer_id
                            );
                        commit;

                        insert /*+ APPEND NOLOGGING */ all
                            into dbw_otl_values (
                                dbw_date,
                                dbw_core,
                                dbw_code,
                                outlet_ams_id,
                                ovalue,
                                maintain_user,
                                maintain_time
                            )
                            values (
                                var_dbw_date,
                                AMS_MODL_STORES.CORE_DBW,
                                'COMM',
                                outlet_ams_id,
                                commission,
                                pv_user,
                                sysdate
                            )
                            into dbw_otl_values (
                                dbw_date,
                                dbw_core,
                                dbw_code,
                                outlet_ams_id,
                                ovalue,
                                maintain_user,
                                maintain_time
                            )
                            values (
                                var_dbw_date,
                                AMS_MODL_STORES.CORE_DBW,
                                'FYC',
                                outlet_ams_id,
                                first_year_commission,
                                pv_user,
                                sysdate
                            )
                        select
                            comm.outlet_ams_id,
                            round(sum(nvl(comm.first_year_commission, 0)), 2) first_year_commission,
                            round(sum(nvl(comm.commission, 0)), 2) commission
                        from
                        (
                            select
                                ac.outlet_ams_id,
                                ac.comm_fyc first_year_commission,
                                ac.comm_money commission
                            from dbw_acc_commissions ac
                            where ac.dbw_date
                                    between var_query_begin
                                    and var_query_end
                        ) comm
                        group by comm.outlet_ams_id;
                        commit;

                        insert /*+ APPEND */ into dbw_otl_values nologging (
                                dbw_date,
                                dbw_core,
                                dbw_code,
                                outlet_ams_id,
                                ovalue,
                                maintain_user,
                                maintain_time
                            )
                        select
                            var_dbw_date,
                            AMS_MODL_STORES.CORE_DBW,
                            'UCOM',
                            comm.outlet_ams_id,
                            round(sum(nvl(comm.commission, 0)), 2) commission,
                            pv_user,
                            sysdate
                        from
                        (
                            select
                                cc.outlet_ams_id,
                                cc.comm_money commission
                            from ams_con_commissions cc
                            where cc.comm_date
                                    between var_query_begin
                                    and var_query_end
                                and
                                (
                                    -- Case: 1
                                    -- Phat hanh tu 26/T-1 den 25/T
                                    -- Phat sinh hoa hong tu 26/T-1 den het thang T
                                    (
                                        cc.missu_date
                                            between add_months(var_query_begin, -1) + var_ncom_nday + 1
                                            and var_query_begin + var_ncom_nday
                                        and
                                        cc.comm_dbussiness
                                            between add_months(var_query_begin, -1) + var_ncom_nday + 1
                                            and var_query_end
                                    )
                                    or
                                    -- Case: 2
                                    -- Phat hanh tu truoc 25/T
                                    -- Phat sinh hoa hong trong thang T
                                    (
                                        cc.missu_date <= var_query_begin + var_ncom_nday
                                        and
                                        cc.comm_dbussiness
                                            between var_query_begin
                                            and var_query_end
                                    )
                                )
                        ) comm
                        group by comm.outlet_ams_id;
                        commit;

                        insert /*+ APPEND */ into dbw_otl_values nologging (
                                dbw_date,
                                dbw_core,
                                dbw_code,
                                outlet_ams_id,
                                ovalue,
                                maintain_user,
                                maintain_time
                            )
                        select
                            var_dbw_date,
                            AMS_MODL_STORES.CORE_DBW,
                            'UFYC',
                            comm.outlet_ams_id,
                            round(sum(nvl(comm.comm_fyc, 0)), 2),
                            pv_user,
                            sysdate
                        from
                        (
                            select
                                cc.outlet_ams_id,
                                cc.comm_fyc,
                                cc.comm_money commission
                            from ams_con_commissions cc
                            where cc.comm_date
                                    between var_query_begin
                                    and var_query_end
                                and
                                (
                                    -- CASE 1:
                                    -- Hieu luc truoc thang T-1
                                    -- Phat hanh den thang T
                                    -- Phat sinh hoa hong trong thang T
                                    (
                                        cc.meffe_date < add_months(var_query_begin, -1)
                                        and
                                        cc.missu_date <= var_query_end
                                        and
                                        cc.comm_dbussiness
                                            between var_query_begin
                                            and var_query_end
                                    )

                                    -- CASE 2.A:
                                    -- Hieu luc trong thang T-1
                                    -- Phat hanh tu 1/T den 7/T
                                    -- TAL: Phat sinh hoa hong tu 8/T den het thang T
                                    -- BVL: Phat sinh hoa hong tu 1/T den het thang T
                                    --      Loai bo nam hoa hong khac 0
                                    or
                                    (
                                        cc.meffe_date
                                            between add_months(var_query_begin, -1)
                                            and last_day(add_months(var_query_begin, -1))
                                        and
                                        cc.missu_date
                                            between var_query_begin
                                            and (var_query_begin + var_ncom_drev - 1)
                                        and
                                        (
                                            (
                                                cc.comm_core = 'TAL'
                                                and
                                                cc.comm_dbussiness
                                                    between (var_query_begin + var_ncom_drev)
                                                    and var_query_end
                                            )
                                            or
                                            (
                                                cc.comm_core = 'BVL'
                                                and
                                                cc.comm_dbussiness
                                                    between var_query_begin
                                                    and var_query_end
                                                and
                                                cc.comm_year <> 0
                                            )
                                        )
                                    )

                                    -- CASE 2.B:
                                    -- Hieu luc trong thang T-1
                                    -- Phat hanh khong tu 1/T den 7/T
                                    -- Phat sinh hoa hong trong thang T
                                    or
                                    (
                                        cc.meffe_date
                                            between add_months(var_query_begin, -1)
                                            and last_day(add_months(var_query_begin, -1))
                                        and
                                        cc.missu_date
                                            not between var_query_begin
                                            and (var_query_begin + var_ncom_drev - 1)
                                        and
                                        cc.comm_dbussiness
                                            between var_query_begin
                                            and var_query_end
                                    )

                                    -- CASE 3.A:
                                    -- Hieu luc trong thang T
                                    -- Phat hanh trong thang T
                                    -- Phat sinh hoa hong trong thang T
                                    or
                                    (
                                        cc.meffe_date
                                            between var_query_begin
                                            and var_query_end
                                        and
                                        cc.missu_date
                                            between var_query_begin
                                            and var_query_end
                                        and
                                        cc.comm_dbussiness
                                            between var_query_begin
                                            and var_query_end
                                    )

                                    -- CASE 3.B:
                                    -- Hieu luc trong thang T
                                    -- Phat hanh tu 1/T+1 den 7/T+1
                                    -- TAL: Phat sinh hoa hong tu 1/T den 7/T+1
                                    -- BVL: Phat sinh hoa hong tu 1/T+1 den cuoi thang T+1
                                    --      Ngay xu ly tu 1/T den 7/T+1
                                    --      Nam hoa hong: 0
                                    or
                                    (
                                        cc.meffe_date
                                            between var_query_begin
                                            and var_query_end
                                        and
                                        cc.missu_date
                                            between (var_query_end + 1)
                                            and (var_query_end + var_ncom_drev)
                                        and
                                        (
                                            (
                                                cc.comm_core = 'TAL'
                                                and
                                                cc.comm_dbussiness
                                                    between (var_query_end + 1)
                                                    and (var_query_end + var_ncom_drev)
                                            )
                                            or
                                            (
                                                cc.comm_core = 'BVL'
                                                and
                                                cc.comm_dbussiness
                                                    between add_months(var_query_begin, 1)
                                                    and last_day(add_months(var_query_begin, 1))
                                                and
                                                cc.comm_year = 0
                                            )
                                        )
                                    )
                                )
                        ) comm
                        group by comm.outlet_ams_id;
                        commit;
                    end if;
                end loop;
            exception
                when others then
                    AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                        '[AMS_MODL_STORES.merge_otl_commissions] ' || SQLERRM);
                    goto procedure_end;
            end;
        end if;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 11/10/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure merge_otl_billings(pd_from_date date,
        pd_to_date date,
        pv_user varchar2)
    is
        var_dbw_date date := null;
        var_query_begin date := null;
        var_query_end date := null;
    begin
        if (pv_user is not null) then
            begin
                loop
                    delete /*+ NOLOGGING */ dbw_otl_values del
                    where del.dbw_date
                            between trunc(pd_from_date, 'MM')
                            and trunc(pd_to_date, 'MM')
                        and del.dbw_code in
                        (
                            'BILL',
                            'UBILL'
                        )
                        and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                    exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                    commit;
                end loop;
                commit;
            exception
                when others then
                    AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                        '[AMS_MODL_STORES.merge_otl_billings] ' || SQLERRM);
                    goto procedure_end;
            end;

            -- Buoc 02: Ghi nhan du lieu tu Bvlife
            begin
                for i in 0..round(
                    months_between(trunc(pd_to_date, 'MM'),
                        trunc(pd_from_date, 'MM')
                    )
                )
                loop
                    var_dbw_date := add_months(trunc(pd_from_date, 'MM'), i);
                    var_query_begin := add_months(trunc(pd_from_date, 'MM'), i);
                    var_query_end := (add_months(var_query_begin, 1) - 1);

                    -- Buoc 02.01: Ghi nhan du lieu phi phai thu (Bvlife)
                    insert /*+ APPEND */ into dbw_otl_values nologging (
                        dbw_date,
                        dbw_core,
                        dbw_code,
                        outlet_ams_id,
                        ovalue,
                        maintain_user,
                        maintain_time
                    )
                    select
                        var_dbw_date,
                        AMS_MODL_STORES.CORE_DBW,
                        'BILL',
                        bill.outlet_ams_id,
                        round(
                            sum(bill.billing_premium),
                            2) billing_premium,
                        pv_user,
                        sysdate
                    from
                    (
                        select
                            acc.outlet_ams_id,
                            nvl(acc.bil_premium, 0) billing_premium
                        from
                        (
                            select
                                ab.outlet_ams_id,
                                ab.account_id,
                                ab.bil_premium
                            from dbw_acc_billings ab
                            where ab.dbw_date
                                    between var_query_begin
                                    and var_query_end
                                and ab.dbw_core = AMS_MODL_STORES.CORE_BVLIFE
                        ) acc
                        left join
                        (
                            select
                                at.account_id
                            from dbw_acc_transmission at
                            where at.dbw_date
                                    between var_query_begin
                                    and var_query_end
                                and at.dbw_code = 'SOUT'
                            group by at.account_id
                        ) sout
                            on sout.account_id = acc.account_id
                        where sout.account_id is null
                    ) bill
                    group by bill.outlet_ams_id;
                    commit;

                    -- Buoc 02.02: Ghi nhan du lieu phi phai thu (Talisman)
                    insert /*+ APPEND */ into dbw_otl_values nologging (
                        dbw_date,
                        dbw_core,
                        dbw_code,
                        outlet_ams_id,
                        ovalue,
                        maintain_user,
                        maintain_time
                    )
                    select
                        var_dbw_date,
                        AMS_MODL_STORES.CORE_DBW,
                        'UBILL',
                        bill.outlet_ams_id,
                        round(
                            sum(bill.billing_premium),
                            2) billing_premium,
                        pv_user,
                        sysdate
                    from
                    (
                        select
                            acc.outlet_ams_id,
                            nvl(acc.bil_premium, 0) billing_premium
                        from
                        (
                            select
                                ab.outlet_ams_id,
                                ab.account_id,
                                ab.bil_premium
                            from dbw_acc_billings ab
                            where ab.dbw_date
                                    between var_query_begin
                                    and var_query_end
                                and ab.dbw_core = AMS_MODL_STORES.CORE_TALISMAN
                        ) acc
                        left join
                        (
                            select
                                at.account_id
                            from dbw_acc_transmission at
                            where at.dbw_date
                                    between var_query_begin
                                    and var_query_end
                                and at.dbw_code = 'SOUT'
                            group by at.account_id
                        ) sout
                            on sout.account_id = acc.account_id
                        where sout.account_id is null
                    ) bill
                    group by bill.outlet_ams_id;
                    commit;
                end loop;
            exception
                when others then
                    AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                        '[AMS_MODL_STORES.merge_otl_billings] ' || SQLERRM);
                    goto procedure_end;
            end;
        end if;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 11/10/2013
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure merge_otl_payments(pd_from_date date,
        pd_to_date date,
        pv_user varchar2)
    is
        var_dbw_date date := null;
        var_query_begin date := null;
        var_query_end date := null;

        var_recorded_date date := trunc(pd_from_date, 'MM');
        var_query_date date := (add_months(var_recorded_date, 1) - 1);
    begin
        if (pv_user is not null) then
            begin
                loop
                    delete /*+ NOLOGGING */ dbw_otl_values del
                    where del.dbw_date
                            between trunc(pd_from_date, 'MM')
                            and trunc(pd_to_date, 'MM')
                        and del.dbw_code in
                        (
                            'PAYS',
                            'UPAYS'
                        )
                        and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                    exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                    commit;
                end loop;
                commit;
            exception
                when others then
                    AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                        '[AMS_MODL_STORES.merge_otl_payments] ' || SQLERRM);
                    goto procedure_end;
            end;

            -- Buoc 02: Ghi nhan du lieu tu Bvlife
            begin
                for i in 0..round(
                    months_between(trunc(pd_to_date, 'MM'),
                        trunc(pd_from_date, 'MM')
                    )
                )
                loop
                    var_dbw_date := add_months(trunc(pd_from_date, 'MM'), i);
                    var_query_begin := add_months(trunc(pd_from_date, 'MM'), i);
                    var_query_end := (add_months(var_query_begin, 1) - 1);

                    -- Buoc 02.01: Ghi nhan du lieu phi thuc thu (Bvlife)
                    insert /*+ APPEND */ into dbw_otl_values nologging (
                        dbw_date,
                        dbw_core,
                        dbw_code,
                        outlet_ams_id,
                        ovalue,
                        maintain_user,
                        maintain_time
                    )

                    select
                        var_dbw_date,
                        AMS_MODL_STORES.CORE_DBW,
                        'PAYS',
                        pays.outlet_ams_id,
                        round(
                            sum(pays.payment_premium),
                            2) payment_premium,
                        pv_user,
                        sysdate
                    from
                    (
                        select
                            acc.outlet_ams_id,
                            nvl(acc.pay_premium, 0) payment_premium
                        from
                        (
                            select
                                ap.outlet_ams_id,
                                ap.account_id,
                                ap.pay_premium
                            from dbw_acc_payments ap
                            where ap.dbw_date
                                    between var_query_begin
                                    and var_query_end
                                and ap.dbw_core = AMS_MODL_STORES.CORE_BVLIFE
                        ) acc
                        left join
                        (
                            select
                                at.account_id
                            from dbw_acc_transmission at
                            where at.dbw_date
                                    between var_query_begin
                                    and var_query_end
                                and at.dbw_code = 'SOUT'
                            group by at.account_id
                        ) sout
                            on sout.account_id = acc.account_id
                        where sout.account_id is null
                    ) pays
                    group by pays.outlet_ams_id;
                    commit;

                    -- Buoc 02.02: Ghi nhan du lieu phi thuc thu (Talisman)
                    insert /*+ APPEND */ into dbw_otl_values nologging (
                        dbw_date,
                        dbw_core,
                        dbw_code,
                        outlet_ams_id,
                        ovalue,
                        maintain_user,
                        maintain_time
                    )

                    select
                        var_dbw_date,
                        AMS_MODL_STORES.CORE_DBW,
                        'UPAYS',
                        pays.outlet_ams_id,
                        round(
                            sum(pays.payment_premium),
                            2) payment_premium,
                        pv_user,
                        sysdate
                    from
                    (
                        select
                            acc.outlet_ams_id,
                            nvl(acc.pay_premium, 0) payment_premium
                        from
                        (
                            select
                                ap.outlet_ams_id,
                                ap.account_id,
                                ap.pay_premium
                            from dbw_acc_payments ap
                            where ap.dbw_date
                                    between var_query_begin
                                    and var_query_end
                                and ap.dbw_core = AMS_MODL_STORES.CORE_TALISMAN
                        ) acc
                        left join
                        (
                            select
                                at.account_id
                            from dbw_acc_transmission at
                            where at.dbw_date
                                    between var_query_begin
                                    and var_query_end
                                and at.dbw_code = 'SOUT'
                            group by at.account_id
                        ) sout
                            on sout.account_id = acc.account_id
                        where sout.account_id is null
                    ) pays
                    group by pays.outlet_ams_id;
                    commit;
                end loop;
            exception
                when others then
                    AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                        '[AMS_MODL_STORES.merge_otl_payments] ' || SQLERRM);
                    goto procedure_end;
            end;
        end if;

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

end AMS_MODL_STORES;
/
