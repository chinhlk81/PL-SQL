create or replace package ams.AMS_MODL_DATA_POLICY is

    PACK_DATE date := to_date('09-jul-2011');
    TALISMAN_GOLIVE date := to_date('28-feb-2011');

    MODULE_CODE_MAIN VARCHAR2(16) := 'MAIN';
    MODULE_CODE_COMP VARCHAR2(16) := 'COMP';

    POLICY_ISSUED constant  number(1) := 1; --hop dong da phat hanh roi
    POLICY_NOT_ISSUED constant  number(1) := 0;  --hop dong chua phat hanh van lay phi tam thu cho no
    SYSTEM_USER varchar2(16) := 'SYSTEM';
    THEME_LANGUAGE VARCHAR2(16) := 'VN';

    OUTLET_INFO_TYPE_POSI VARCHAR2(16) := 'POSI';

    DATE_MAX_VALUE date := to_date('31-dec-9999');
    DATE_MIN_VALUE date := to_date('1-jan-1900');
    APP_STATUS_DISPLAY VARCHAR2(16) := 'SAPP';

    STATUS_TERM varchar2(32) := 'TERM';
    STATUS_CURR varchar2(32) := 'CURR';

    POLYC_CODE_INIT VARCHAR2(16) := 'INIT';
    POLYC_CODE_EFFE VARCHAR2(16) := 'EFFE';
    POLYC_CODE_PROC VARCHAR2(16) := 'PROC';
    POLYC_CODE_CANC VARCHAR2(16) := 'CANC';
    POLYC_CODE_TERM VARCHAR2(16) := 'TERM';
    POLYC_CODE_REIS VARCHAR2(16) := 'REIS';
    POLYC_CODE_EXIT VARCHAR2(16) := 'EXIT';


    TRANS_CODE_INIT VARCHAR2(16) := 'INIT';
    TRANS_CODE_CANC VARCHAR2(16) := 'CANC';
    TRANS_CODE_FREQ VARCHAR2(16) := 'FREQ';
    TRANS_CODE_LUMS VARCHAR2(16) := 'LUMS';
    TRANS_CODE_LOAN VARCHAR2(16) := 'LOAN';
    TRANS_CODE_EXTR VARCHAR2(16) := 'EXTR';

    APPS_CODE_UNAP VARCHAR2(16) := 'UNAP';
    APPS_CODE_CANC VARCHAR2(16) := 'CANC';
    APPS_CODE_APPL VARCHAR2(16) := 'APPL';
    APPS_CODE_RFND VARCHAR2(16) := 'RFND';
    APPS_CODE_ERRO VARCHAR2(16) := 'ERRO';

    SYSTEM_REFER_AMS varchar2(16) := 'AMS';
    SYSTEM_REFER_TALISMAN varchar2(16) := 'TAL';
    SYSTEM_REFER_BVLIFE varchar2(16) := 'BVL';

    OBJECT_STATUS_ACTIVE VARCHAR2(16) := 'ACTI';
    OBJECT_STATUS_INACTIVE VARCHAR2(16) := 'INAT';
    OBJECT_STATUS_FREEZE VARCHAR2(16) := 'FRZE';

    RECORD_MAX_DELETE number(10) := 50000;

    BE_PAID_YES VARCHAR2(1) := 'Y';
    BE_PAID_NO VARCHAR2(1) := 'N';
    BE_PAID_DTL VARCHAR2(1) := 'D';
    BE_PAID_SPC VARCHAR2(1) := 'S';
    BE_PAID_TERM VARCHAR2(1) := 'T';

    BE_EXECUTING_YES VARCHAR2(1) := 'Y';
    BE_EXECUTING_NO VARCHAR2(1) := 'N';
    BE_EXECUTING_DEL VARCHAR2(1) := 'D';
    procedure daily_policy;
    procedure main(valRecordDate date := null);

    procedure main_uat(valRecordDate date := null,
        valCompanyID number := null,
        row_records out sys_refcursor);

    procedure main_uat_period(valFromDate date := null,
        valToDate date := null,
        valCompanyID number := null,
        row_records out sys_refcursor);

    procedure get_policy_tal(valRecordDate date := null,
        valTypeOfData varchar2 := null,
        valCompanyID number := null);

end AMS_MODL_DATA_POLICY;
/
create or replace package body ams.AMS_MODL_DATA_POLICY is
    --chinhlk 10/10/2012 sua lai RECORD_MAX_DELETE cho dung
    --bo di cac dieu kien rang buoc ve phi tam thu khi chua phat hanh hop dong
    /*thu tuc de goi cho no va hang ngay chay cho no */
    procedure daily_policy
    is
    begin
        if AMS_CORE_MODULE.is_active('REPORT_POL_JOB', (trunc(sysdate, 'DD') - 1))
                = AMS_CORE_MODULE.IS_YES then
            --chay du lieu tu dau thang cho no luon cho no nhanh
            ams.AMS_MODL_DATA_POLICY.main(trunc((trunc(sysdate, 'DD') - 1), 'MM'));
        end if;
    end;

    procedure main(valRecordDate date := null)
    is
        var_run_from_time date := sysdate;
        var_run_to_time date := sysdate;
    begin
        var_run_from_time := sysdate;
        /* POLICY*/
        ams.AMS_MODL_DATA_POLICY.get_policy_tal(trunc(valRecordDate, 'MM'),
            ams.AMS_MODL_DATA_POLICY.MODULE_CODE_MAIN);
        var_run_to_time := sysdate;
        ams.life_agency_log.time_log(0, 'Tat ca cac cong ty', var_run_from_time, var_run_to_time);
    exception
        when others then
            rollback;
    end;

    procedure main_uat(valRecordDate date := null,
        valCompanyID number := null,
        row_records out sys_refcursor)
    is
        var_run_from_time date := sysdate;
        var_run_to_time date := sysdate;
    begin
        /* POLICY*/
        var_run_from_time := sysdate;
        ams.AMS_MODL_DATA_POLICY.get_policy_tal(trunc(valRecordDate, 'MM'),
            ams.AMS_MODL_DATA_POLICY.MODULE_CODE_MAIN,
            valCompanyID);
        var_run_to_time := sysdate;
        ams.life_agency_log.time_log(0, 'Tat ca cac cong ty', var_run_from_time, var_run_to_time);

        open row_records for
            select '1' flag from dual;
    exception
        when others then
            rollback;
        open row_records for
            select '0' flag from dual;
    end;

    procedure main_uat_period(valFromDate date := null,
        valToDate date := null,
        valCompanyID number := null,
        row_records out sys_refcursor)
    is
        var_run_from_time date := sysdate;
        var_run_to_time date := sysdate;
        var_int_month_qty number(3) := 0;
    begin
        /* POLICY*/
        var_run_from_time := sysdate;
        var_int_month_qty := months_between(valToDate, valFromDate);
        for i in 0..var_int_month_qty
        loop
            ams.AMS_MODL_DATA_POLICY.get_policy_tal(trunc(add_months(valToDate, -i), 'MM'),
                ams.AMS_MODL_DATA_POLICY.MODULE_CODE_MAIN,
                valCompanyID);
        end loop;
        var_run_to_time := sysdate;
        ams.life_agency_log.time_log(0, 'Tat ca cac cong ty', var_run_from_time, var_run_to_time);

        open row_records for
            select '1' flag from dual;
    exception
        when others then
            rollback;
        open row_records for
            select '0' flag from dual;
    end;

    procedure get_policy_tal(valRecordDate date := null,
        valTypeOfData varchar2 := null,
        valCompanyID number := null)
    is
        var_branch_id_string varchar2(10) := nvl(to_char(valCompanyID), '%');
        --lay du lieu trong vong 3 thang
        --dau thang la ngay dau 3 thang truoc
        --lay du lieu cho 2 thang de chay cho no nhanh nhe
/*        var_from_issue_date date := trunc(to_date(nvl(add_months(valRecordDate, -1), '1-jan-1900')), 'MM');
        --cuoi thang la cuoi thang nay luon cho no de tinh
        var_to_issue_date date := add_months(trunc(to_date(nvl(valRecordDate, '1-jan-2080')), 'MM'), 1) - 1;
*/
        var_from_issue_date date := trunc(nvl(add_months(valRecordDate, -1), '1-jan-1900'), 'MM');
        --cuoi thang la cuoi thang nay luon cho no de tinh
        var_to_issue_date date := add_months(trunc(nvl(valRecordDate, '1-jan-2080'), 'MM'), 1) - 1;


        --lay cay nay de lay so lieu tu bang mod_data_policy cho no chinh xac
        --cai nay la cai chinh  de lay truong record_date cho no
        var_to_issue_record_date date := trunc(var_to_issue_date, 'MM');

        --cai nay la lay theo ngay thang moi nhat cua no de chay du lieu cho dun
        var_to_issue_pol_record_date date := trunc(var_to_issue_date, 'MM');

        var_from_effective_date date := add_months(var_from_issue_date, -3);
        var_to_effective_date date := var_to_issue_date;

        var_from_payment_receive_date date := add_months(var_from_issue_date, -2);

        var_to_issue_revert_date date := add_months(var_to_issue_date, 4);
/*        var_branch_id_string varchar2(10) := nvl(to_char(valCompanyID), '%');
        var_branch_id number(10) := nvl(valCompanyID, 0);
        var_beg_date date := valFromIssueDate;
        var_end_date date := valToIssueDate;
 */
        var_error_pos  number(8, 2) := null;

/*        var_from_date date := add_months(nvl(valFromIssueDate, '1-jan-1900'), -4);
        var_to_date date := add_months(nvl(valToIssueDate, '1-jan-2080'), 2);*/

        var_run_from_time date := sysdate;
        var_run_to_time date := sysdate;

        var_session_id number(14) := 0;
        var_version_date date := trunc(sysdate, 'DD');
        var_record_date date := sysdate;

        var_run_begin_time date := sysdate;
        var_run_end_time date := sysdate;

        var_month_qty number(3) := 12; --so thang chay
    begin
        /* Xoa du lieu FYP trong bang ams.la_report_policy
        trong 3 thang di da*/
        var_run_from_time := sysdate;
        var_run_begin_time := sysdate;
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        loop
            delete ams.la_report_policy del
            where del.record_date
                between var_from_issue_date
                    and var_to_issue_record_date
                and del.type_code = valTypeOfData
                and del.source_of_data = ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN
                and rownum < ams.AMS_MODL_DATA_POLICY.RECORD_MAX_DELETE;
            exit when SQL%rowcount < ams.AMS_MODL_DATA_POLICY.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'AMS_MODL_DATA_POLICY', ' xoa dl lan chay thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));

        begin
            --lay cai nay de co the lay ra thang ma no co so lieu o serv_data_va FYP va policy
            --de lay so lieu ra cho dung
            select /*+ CARDINALITY(res, 100)*/
                res.record_date
                    into var_to_issue_pol_record_date
            from
            (
                select  /*+ CARDINALITY(tmp, 100)*/
                    tmp.record_date,
                    row_number() over (order by tmp.record_date desc)  as rowno
                from ams.mod_data_fyp tmp
                where tmp.record_date <= trunc(var_to_issue_date, 'MM')
                    and tmp.type_of_data = ams.AMS_MODL_DATA_POLICY.MODULE_CODE_MAIN
                    and tmp.status_code = ams.AMS_MODL_DATA_POLICY.OBJECT_STATUS_ACTIVE
                    and tmp.source_of_data = ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN
                    and tmp.policy_number is not null
                    and tmp.outlet_ams_id is not null
            ) res
            where res.rowno = 1;
        exception
             when others then
                 var_to_issue_record_date := trunc(var_to_issue_date, 'MM');
                life_agency_log.write_log(1,
                    'life_agency_policy: loi lay var_to_issue_record_date ' || to_char(var_from_issue_date) || '  ' || to_char(var_to_issue_date),
                    sqlerrm,
                    sqlcode);
        end;


        var_session_id := dbms_random.value(1,1000000000);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'AMS_MODL_DATA_POLICY', 'lay so lieu thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 1;

        /*xoa du lieu cua bang tam truoc khi dua vao*/
        execute immediate 'truncate table ams.la_report_outlet_temp';
        execute immediate 'truncate table ams.la_report_account_tmp';
        execute immediate 'truncate table ams.la_report_policy_tmp';
        execute immediate 'truncate table ams.la_report_account_ext_tmp';
        execute immediate 'truncate table ams.la_report_activity_benefit_tmp';
        execute immediate 'truncate table ams.la_report_payment_received_tmp';
        execute immediate 'truncate table ams.la_report_payment_result_tmp';
        execute immediate 'truncate table ams.la_report_cash_receipt_tmp';
        execute immediate 'truncate table ams.la_report_act_ben_link_tmp';

        execute immediate 'truncate table ams.la_report_pol_cancel_tmp';
        execute immediate 'truncate table ams.la_report_pol_exit_tmp';
        execute immediate 'truncate table ams.la_report_pol_reinst_tmp';
        execute immediate 'truncate table ams.la_report_pol_reinst_mon_tmp';
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'AMS_MODL_DATA_POLICY', 'truncate cac bang tam thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 2;

        /*lay danh sach cac hop dong cua dai ly de chay dem cho no tot hon*/
        insert /*+ APPEND */ into ams.la_report_policy_tmp nologging
        select /*+ CARDINALITY(outl, 100)
                         CARDINALITY(issu, 100)*/
            issu.policy_number,
            trunc(issu.changes_date, 'MM'), --record_date la thang da tinh cho no
            ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN,
            issu.init_ams_id,
            null, --application_number,
            null, --receipt_number,
            null, --receipt_entered_date,
            null, --receipt_premium,
            trunc(issu.freq_date, 'DD'),--effective_date           date,
            trunc(issu.changes_date, 'DD'), --res.ngay_phat_hanh,,--issue_date         date,
            issu.freq_per_annum,--freq_per_annum number(1),
            issu.freq_premium,--regular_premium                  number(18,2),
            issu.freq_premium,--ip                  number(18,2),
            (issu.freq_premium * issu.freq_per_annum),--afyp    number(18,2),
            null, --is_cancel
            null, --cancel_date
            null,--is_exit
            null,--exit_date
            null,--is_reinst
            null, -- reinst_date
            null, --account_id           number(10),
            null, --outlet_id               number(10),
            null, --activity_id            number(10),
            null, --isrc_premium      number(18,2),
            null, --holder_name       nvarchar2(164),
            null, --insured_person_name nvarchar2(255),
            null, --holder_address nvarchar2(255),
            var_session_id,
            ams.AMS_MODL_DATA_POLICY.SYSTEM_USER,
            ams.AMS_MODL_DATA_POLICY.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            select  /*+ CARDINALITY(tmp, 100)*/
                tmp.init_ams_id,
                tmp.policy_number,
                tmp.freq_date,
                tmp.changes_date,
                tmp.freq_premium,
                tmp.freq_per_annum,
                tmp.isrc_premium
            from ams.mod_data_policy tmp
            --dung theo cai moi nhat nay cua no da co
            where tmp.record_date = var_to_issue_pol_record_date
                and tmp.type_of_data = ams.AMS_MODL_DATA_POLICY.MODULE_CODE_MAIN
                and tmp.source_of_data = ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN
                and tmp.changes_code = ams.AMS_MODL_DATA_POLICY.POLYC_CODE_PROC
                and tmp.changes_date
                    between var_from_issue_date
                    and var_to_issue_date
                and tmp.freq_date
                    between var_from_effective_date
                    and var_to_effective_date
                and tmp.init_ams_id is not null
        ) issu;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'AMS_MODL_DATA_POLICY', 'do danh sach cac hop dong vao thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 3;
        /*cap nhat phi tam thu giay yeu cau
        cac thong so thi co the lay duoc tu cai cua Quynh luon cho tien*/
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_report_policy_tmp o
        using
            (
                select /*+ CARDINALITY(pol, 100)  */
                    pol.policy_number,
                    pol.receipt_number,
                    pol.receipt_entered_date,
                    pol.receipt_premium,
                    pol.application_number
                from
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.policy_number,
                        max(tmp.receipt_number) receipt_number,
                        min(tmp.entered_date) receipt_entered_date,
                        sum(tmp.premium) receipt_premium,
                        max(tmp.application_number) application_number
                    from ams.mod_data_apps tmp
                    --dung theo cai moi nhat nay cua no da co
                    --do app la lay du lieu cho 12 thang nen phai dung cai nay cua no
                    where tmp.record_date = var_to_issue_record_date
                        and tmp.type_of_data = ams.AMS_MODL_DATA_POLICY.MODULE_CODE_MAIN
                        and tmp.source_of_data = ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN
                        and tmp.application_code in (
                            ams.AMS_MODL_DATA_POLICY.APPS_CODE_APPL,
                            ams.AMS_MODL_DATA_POLICY.APPS_CODE_RFND
                        )
                        --chi lay so lieu cua cac hop dong trong vong may thang tro ve truoc thoi
                        --dung cai nay la duoc roi day nhe boi vi chi can lay theo cac hop dong nay thoi
                        --phi tam thu cua cac hop dong nay day nhe
                        --cho nay k biet dung hay sai day?
                        and tmp.processed_date
                            between var_from_effective_date
                            and var_to_issue_date
                        and tmp.policy_number is not null
                    group by tmp.policy_number
                ) pol
            ) upd
        on (
            var_session_id = o.session_id
            and
            ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN = o.source_of_data
            and
            upd.policy_number = o.policy_number
        )
        when matched then
            update
                set
                    o.application_number = upd.application_number,
                    o.receipt_premium = upd.receipt_premium,
                    o.receipt_number = upd.receipt_number,
                    o.receipt_entered_date = upd.receipt_entered_date,
                    o.update_datetime = sysdate;
        commit;
        dbms_stats.gather_table_stats(null, 'la_report_policy_tmp', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'AMS_MODL_DATA_POLICY', 'lay so lieu phi tam thu thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 4;

        --sau do tu 2 bang da co do de lay do lieu vao cho bang  la_report_account_tmp
        --lay luon tu bang nay de do vao luon
        --doan nay da test OK ve toc do
        insert /*+ APPEND */ into ams.la_report_account_tmp nologging
            select /*+ CARDINALITY(pol, 100) */
                pol.account_id,
                null, --account_number
                null, --tmp.outlet_id,
                pol.activity_id,
                var_session_id,
                ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN,
                ams.AMS_MODL_DATA_POLICY.SYSTEM_USER,
                ams.AMS_MODL_DATA_POLICY.SYSTEM_USER,
                sysdate,
                sysdate
            from
            (
                select /*+ CARDINALITY(tmp, 100) */
                    tmp.activity_id,
                    tmp.account_id
                from ods.activity tmp
                where trunc(tmp.bus_processed_date, 'DD')  <= var_to_issue_date
                    and tmp.activity_code = 'A100'
                minus
                select /*+ CARDINALITY(tmp, 100) */
                    tmp.reversed_acti_id activity_id,
                    tmp.account_id
                from ods.activity tmp
                where trunc(tmp.bus_processed_date, 'DD') <= var_to_issue_date
                    and tmp.activity_code = 'R100'
            ) pol;
        commit;
        dbms_stats.gather_table_stats(null, 'la_report_account_tmp', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'AMS_MODL_DATA_POLICY', 'lay so lieu activity xong thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 5;

        insert /*+ APPEND */ into ams.la_report_account_ext_tmp nologging
        select /*+ CARDINALITY(pol, 100) */
            pol.account_id,
            pol.policy_number,
            var_session_id,
            ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN,
            ams.AMS_MODL_DATA_POLICY.SYSTEM_USER,
            ams.AMS_MODL_DATA_POLICY.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            select /*+ CARDINALITY(acc, 100) */
                acc.account_id,
                acc.account_number policy_number
            from ods.account acc
            where acc.commence_date <= var_to_issue_date
        ) pol;
        commit;
        dbms_stats.gather_table_stats(null, 'la_report_account_ext_tmp', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'AMS_MODL_DATA_POLICY', 'lay so lieu activity  thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 6;

        /*lay ra account number de lam cho nhanh*/
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_report_account_tmp o
        using
            (
                select  /*+ CARDINALITY(tmp, 100) */
                    tmp.account_id,
                    tmp.policy_number
                from ams.la_report_account_ext_tmp tmp
                where tmp.session_id = var_session_id
                    and tmp.source_of_data = ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN
            ) upd
        on (
            var_session_id = o.session_id
            and
            ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN = o.source_of_data
            and
            upd.account_id = o.account_id
        )
        when matched then
            update
                set
                    o.policy_number = upd.policy_number,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'AMS_MODL_DATA_POLICY', 'lay so lieu so hop dong acc_number thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 7;

        /*lay ra account number de lam cho nhanh*/
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_report_policy_tmp o
        using
            (
                select /*+ CARDINALITY(tmp, 100) */
                    tmp.policy_number,
                    tmp.account_id,
                    tmp.outlet_id,
                    tmp.activity_id
                from ams.la_report_account_tmp tmp
                where tmp.session_id = var_session_id
                    and tmp.source_of_data = ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN
                    and tmp.policy_number is not null
                    --lay cac hop dong khong bi null
            ) upd
        on (
            var_session_id = o.session_id
            and
            ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN = o.source_of_data
            and
            upd.policy_number = o.policy_number
        )
        when matched then
            update
                set
                    o.account_id = upd.account_id,
                    --o.outlet_id = upd.outlet_id,
                    o.activity_id = upd.activity_id,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'AMS_MODL_DATA_POLICY', 'cap nhat so lieu hop dong  thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 8;

        /*lay ra ten nguoi tham gia*/
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_report_policy_tmp o
        using
            (
                select  /*+
                                  CARDINALITY(car_nguoithamgia, 100)
                                 CARDINALITY(cln_nguoithamgia, 100)*/
                    car_nguoithamgia.account_id,
                    max(cln_nguoithamgia.name) holder_name
                from
                (
                    select  /*+ CARDINALITY(tmp, 100)*/
                        tmp.account_id,
                        tmp.client_id
                    from ods.client_account_relationship tmp
                    where tmp.relationship_type_code = 'OWNR'
                        and tmp.primary_relationship_flag = 'Y'
                        /*and exists
                            (
                                select  \*+ CARDINALITY(pol_tmp, 100) *\
                                    1
                                from ams.la_report_policy_tmp pol_tmp
                                where pol_tmp.session_id = var_session_id
                                    and pol_tmp.source_of_data = ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN
                                    and pol_tmp.account_id = tmp.account_id
                            )*/
                ) car_nguoithamgia
                left join
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.name,
                        tmp.client_id
                    from ods.client tmp
                ) cln_nguoithamgia
                   on cln_nguoithamgia.client_id = car_nguoithamgia.client_id
                group by car_nguoithamgia.account_id
            ) upd
        on (
            var_session_id = o.session_id
            and
            ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN = o.source_of_data
            and
            upd.account_id = o.account_id
        )
        when matched then
            update
                set
                    o.holder_name = upd.holder_name,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'AMS_MODL_DATA_POLICY', 'lay so lieu ten nguoi tham gia thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 9;

        /*lay ra ten nguoi duoc bao hiem*/
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_report_policy_tmp o
        using
            (
                select  /*+
                     CARDINALITY(car_nguoiduocbaohiem, 100)
                     CARDINALITY(cln_nguoiduocbaohiem, 100)*/
                    car_nguoiduocbaohiem.account_id,
                    max(cln_nguoiduocbaohiem.name) insured_person_name
                from
                (
                    select  /*+ CARDINALITY(tmp, 100)*/
                        tmp.account_id,
                        tmp.client_id
                    from ods.client_account_relationship tmp
                    where tmp.relationship_type_code = 'LIFE'
                        and tmp.primary_relationship_flag = 'Y'
                        /*and exists
                            (
                                select  \*+ CARDINALITY(pol_tmp, 100) *\
                                    1
                                from ams.la_report_policy_tmp pol_tmp
                                where pol_tmp.session_id = var_session_id
                                    and pol_tmp.source_of_data = ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN
                                    and pol_tmp.account_id = tmp.account_id
                            )*/
                ) car_nguoiduocbaohiem
                left join
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.name,
                        tmp.client_id
                    from ods.client tmp
                ) cln_nguoiduocbaohiem
                  on cln_nguoiduocbaohiem.client_id = car_nguoiduocbaohiem.client_id
                group by car_nguoiduocbaohiem.account_id
            ) upd
        on (
            var_session_id = o.session_id
            and
            ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN = o.source_of_data
            and
            upd.account_id = o.account_id
        )
        when matched then
            update
                set
                    o.insured_person_name = upd.insured_person_name,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'AMS_MODL_DATA_POLICY', 'lay so lieu ten nguoi duoc BH  thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 10;

        /*lay ra dia chi*/
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_report_policy_tmp o
        using
            (
                select  /*+ CARDINALITY(res, 100) */
                    res.account_id,
                    max(res.address_line_1   || ' ' || res.suburb  || ' ' || res.city  || ' ' || res.state_description) holder_address
                from
                (
                    select  /*+
                          CARDINALITY(car_nguoithamgia, 100)
                         CARDINALITY(addr, 100)*/
                        car_nguoithamgia.account_id,
                        addr.address_line_1,
                        addr.suburb,
                        addr.city,
                        addr.state_description
                    from
                    (
                        select  /*+ CARDINALITY(tmp, 100)*/
                            tmp.account_id,
                            tmp.client_id
                        from ods.client_account_relationship tmp
                        where tmp.relationship_type_code = 'OWNR'
                            and tmp.primary_relationship_flag = 'Y'
                            /*and exists
                                (
                                    select  \*+ CARDINALITY(pol_tmp, 100) *\
                                        1
                                    from ams.la_report_policy_tmp pol_tmp
                                    where pol_tmp.session_id = var_session_id
                                        and pol_tmp.source_of_data = ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN
                                        and pol_tmp.account_id = tmp.account_id
                                )*/
                    ) car_nguoithamgia
                    left join
                    (
                        select /*+ CARDINALITY(tmp, 100)*/
                            tmp.client_id,
                            tmp.address_line_1,
                            tmp.suburb,
                            tmp.city,
                            tmp.state_description
                        from ods.address tmp
                        where tmp.primary_address_flag = 'Y'
                    ) addr
                       on addr.client_id = car_nguoithamgia.client_id
                ) res
                group by res.account_id
            ) upd
        on (
            var_session_id = o.session_id
            and
            ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN = o.source_of_data
            and
            upd.account_id = o.account_id
        )
        when matched then
            update
                set
                    o.holder_address = upd.holder_address,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'AMS_MODL_DATA_POLICY', 'lay so lieu dia chi thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 11;

        /*lay ra cac benefit */

        insert /*+ APPEND */ into ams.la_report_act_ben_link_tmp nologging
        select /*+ CARDINALITY(res, 100) */
            res.benefit_id,
            res.activity_id,
            var_session_id,
            ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN,
            ams.AMS_MODL_DATA_POLICY.SYSTEM_USER,
            ams.AMS_MODL_DATA_POLICY.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            select /*+ CARDINALITY(tmp, 100) */
                tmp.benefit_id,
                tmp.activity_id
            from ods.activity_benefit_link tmp
        ) res;
        commit;
        dbms_stats.gather_table_stats(null, 'la_report_act_ben_link_tmp', cascade => true);


        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'AMS_MODL_DATA_POLICY', 'lay so lieu benefit link thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 12;

        insert /*+ APPEND */ into ams.la_report_activity_benefit_tmp nologging
        select /*+ CARDINALITY(pol, 100) */
            pol.activity_id,
            pol.benefit_id,
            var_session_id,
            ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN,
            ams.AMS_MODL_DATA_POLICY.SYSTEM_USER,
            ams.AMS_MODL_DATA_POLICY.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            select /*+ CARDINALITY(tmp, 100) */
                tmp.benefit_id,
                tmp.activity_id
            from ams.la_report_act_ben_link_tmp tmp
            where tmp.session_id = var_session_id
                and tmp.source_of_data = ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN
                and tmp.activity_id in
                (
                    select  /*+ CARDINALITY(pol_temp, 100) */
                        pol_temp.activity_id
                    from ams.la_report_policy_tmp pol_temp
                    where pol_temp.session_id = var_session_id
                        and pol_temp.source_of_data = ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN
                )
        ) pol;
        commit;
        dbms_stats.gather_table_stats(null, 'la_report_activity_benefit_tmp', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'AMS_MODL_DATA_POLICY', 'do so lieu benefit vao la_report_activity_benefit_tmp ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 13;

        /*lay ra STBH*/
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_report_policy_tmp o
        using
            (
                select /*+ CARDINALITY(hopdong, 100)
                    CARDINALITY(abl, 100)
                    CARDINALITY(b, 100)*/
                    abl.activity_id,
                    sum(nvl(ben.death_sum_insured, 0)) isrc_premium
                from
                (
                    select /*+ CARDINALITY(tmp, 100) */
                        tmp.activity_id,
                        tmp.benefit_id
                    from ams.la_report_activity_benefit_tmp tmp
                    where tmp.session_id = var_session_id
                        and tmp.source_of_data = ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN
                ) abl
                left join
                (
                    select /*+ CARDINALITY(tmp, 100) */
                        tmp.benefit_id,
                        tmp.death_sum_insured
                    from ods.benefit tmp
                ) ben
                    on ben.benefit_id = abl.benefit_id
                group by abl.activity_id
            ) upd
        on (
            var_session_id = o.session_id
            and
            ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN = o.source_of_data
            and
            upd.activity_id = o.activity_id
        )
        when matched then
            update
                set
                    o.isrc_premium = upd.isrc_premium,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'AMS_MODL_DATA_POLICY', 'lay so lieu STBH thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 14;


        /*lay du lieu ve cash receipt cua 4 thang gan nhat*/
        insert /*+ APPEND */ into ams.la_report_cash_receipt_tmp nologging
        select /*+ CARDINALITY(res, 100) */
            res.cash_receipt_id,
            res.receipt_number,
            res.location_id,
            res.collection_agent_id,
            var_session_id,
            ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN,
            ams.AMS_MODL_DATA_POLICY.SYSTEM_USER,
            ams.AMS_MODL_DATA_POLICY.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
             select /*+ CARDINALITY(tmp, 100)  */
                 tmp.cash_receipt_id,
                 tmp.receipt_number,
                 tmp.collection_agent_id,
                 tmp.location_id
             from ods.cash_receipt tmp
             where trunc(tmp.date_entered, 'DD')
                 between var_from_payment_receive_date
                 and var_to_issue_date
        ) res;
        commit;
        dbms_stats.gather_table_stats(null, 'la_report_cash_receipt_tmp', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'AMS_MODL_DATA_POLICY', 'lay cash receipt thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 15;

        /*do vao cho tat ca cac cong ty ve cac hop dong chua phat hanh hay noi chung truoc
        lay truc tiep tu ODS luon*/
        insert /*+ APPEND */ into ams.la_report_policy nologging
        select /*+ CARDINALITY(outl, 100)
                         CARDINALITY(issu, 100)*/
            res.outlet_id, --res.outlet_id,
            valTypeOfData,--type_code
            trunc(res.receipt_entered_date, 'MM'), --record_date la thang da tinh cho nos
            var_version_date,
            ams.AMS_MODL_DATA_POLICY.OBJECT_STATUS_ACTIVE,
            ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN,
            null,--outl.outlet_ams_id, --res.outlet_ams_id,
            null,--outl.outlet_bvlife_id, --outlet_bvlife_id
            null,--outl.outlet_name, -- res.ten_dai_ly,
            null,--outl.position_code,
            null,--position_name
            null,--outl.position_date,
            null,--outl.effective_date, --res.ngay_ky_hd, --work_begin_date
            null,--outl.terminative_date,  --work_end_date
            null,--outl.company_id, --res.ma_congty,
            null,--outl.company_ams_id, --res.ma_congty,
            null,--outl.company_name, --res.ten_congty ,
            null,--outl.office_id,    --moi them cot nay nua   office_id
            null,--outl.office_ams_id, -- moi them
            null,--outl.office_name, --moi them
            null,--outl.agency_id,    --moi them cot nay nua   sales_agency_id
            null,--outl.agency_ams_id, --res.ma_ban,
            null,--outl.agency_name, --res.ten_ban,
            null,--outl.unit_id, --res.ma_nhom, sales_unit_id
            null,--outl.unit_ams_id, --res.ma_nhom,
            null,--outl.unit_name, --res.ten_nhom,
            res.application_number,--application_number varchar2(124),
            res.receipt_number,
            res.receipt_entered_date,
            res.receipt_premium,
            res.receipt_status_code,
            null,--receipt_status_name nvarchar2(32),
            null, --policy_number
            null,--account_id       number(10),
            null,--trunc(issu.freq_date, 'DD'),--effective_date           date,
            null,--trunc(issu.changes_date, 'DD'), --res.ngay_phat_hanh,,--issue_date         date,
            null,--is_cancel                varchar2(1),
            null,--cancel_date         date,
            null,--is_exit                varchar2(1),
            null,--exit_date          date,
            null,--is_reinst              varchar2(1),
            null,--reinst_date          date,
            null,--issu.freq_per_annum,--freq_per_annum number(1),
            null,--freq_per_annum_name nvarchar2(32),
            null,--isrc_premium number(18,2),
            null,--fyp                  number(18,2),
            null,--ls_premium             number(18,2),
            null,--issu.freq_premium,--regular_premium number(18,2),
            null,--issu.freq_premium,--ip                  number(18,2),
            null,--(issu.freq_premium * issu.freq_per_annum),--afyp    number(18,2),
            null,--holder_name nvarchar2(164),
            null,--insured_person_name nvarchar2(255),
            null,--holder_address nvarchar2(255),
            null,--activity_id            number(10),
            null,--benefit_id            number(10),
            ams.AMS_MODL_DATA_POLICY.policy_not_issued, --data_type
            var_session_id,
            ams.AMS_MODL_DATA_POLICY.SYSTEM_USER,
            ams.AMS_MODL_DATA_POLICY.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            --danh sach chua phat hanh hop dong mot chut gi ca
            --trong cong ty da xac dinh nhu truoc da co roi
            --lay du lieu cua thang cuoi cua no
            select /*+ CARDINALITY(rcpt, 100)  */
                nvl(rcpt.collection_agent_id, rcpt.location_id) outlet_id,
                rcpt.application_form_number application_number,
                rcpt.receipt_number receipt_number,
                rcpt.status_code receipt_status_code,
                cast(trunc(rcpt.money_received_date, 'DD') as date) receipt_entered_date,
                nvl(rcpt.amount, 0) receipt_premium
            from
            (
                select /*+ CARDINALITY(pr, 100)
                       CARDINALITY(cr, 100) */
                    pr.cash_receipt_id,
                    cr.receipt_number,
                    pr.money_received_date,
                    pr.amount,
                    pr.status_code,
                    pr.application_form_number,
                    pr.account_id,
                    cr.collection_agent_id,
                    cr.location_id
                from
                (
                    select  /*+ CARDINALITY(tmp, 100)  */
                        tmp.cash_receipt_id,
                        tmp.money_received_date,
                        tmp.amount,
                        tmp.status_code,
                        tmp.application_form_number,
                        tmp.account_id
                    from ods.payment_received tmp
                    where tmp.status_code not in ('SPLT', 'REVS')
                        /*duoc thu trong khoang thoi gian day */
                        and trunc(tmp.money_received_date, 'DD')
                            between var_from_issue_date
                            and var_to_issue_date
                        and tmp.application_form_number is not null
                        --chua phat hanh gi ca
                        and tmp.account_id is null
                    ) pr
                     join
                     (
                         select
                             /*+ CARDINALITY(tmp, 100)  */
                             tmp.cash_receipt_id,
                             tmp.receipt_number,
                             tmp.collection_agent_id,
                             tmp.location_id
                         from ams.la_report_cash_receipt_tmp tmp
                         where tmp.session_id = var_session_id
                             and tmp.source_of_data = ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN
                     ) cr
                        on cr.cash_receipt_id = pr.cash_receipt_id
                ) rcpt
        ) res;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'AMS_MODL_DATA_POLICY', 'lay so lieu phi tam thu khi acc is null  thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 16;
        /*lay phi tam thu cua hop dong chua cac hop dong chua duoc phat hanh*/
        /*lay ra cac payment receipt cho no */
        insert /*+ APPEND */ into ams.la_report_payment_received_tmp nologging
        select /*+ CARDINALITY(res, 100) */
            trunc(res.receipt_entered_date, 'MM'),
            res.cash_receipt_id,
            res.account_id,
            res.application_number,
            trunc(res.receipt_entered_date, 'DD'),
            res.receipt_status_code,
            res.receipt_premium,
            var_session_id,
            ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN,
            ams.AMS_MODL_DATA_POLICY.SYSTEM_USER,
            ams.AMS_MODL_DATA_POLICY.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            select  /*+ CARDINALITY(tmp, 100)  */
                tmp.cash_receipt_id,
                tmp.account_id,
                tmp.application_form_number application_number,
                tmp.money_received_date receipt_entered_date,
                tmp.status_code receipt_status_code,
                tmp.amount receipt_premium
            from ods.payment_received tmp
            where tmp.status_code not in ('SPLT', 'REVS')
                /*duoc thu trong khoang thoi gian day */
                and trunc(tmp.money_received_date, 'DD')
                    between var_from_issue_date
                    and var_to_issue_date
                and tmp.application_form_number is not null
                --giay yeu cau cua hop dong co account_id nay roi nhung van chua duoc phat hanh
                and tmp.account_id is not null
        ) res;
        commit;
        dbms_stats.gather_table_stats(null, 'la_report_payment_received_tmp', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'AMS_MODL_DATA_POLICY', 'do so lieu payment receipt vao ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 17;

        /*lay ra cac payment receipt cho no  do vao bang la_report_payment_result_tmp
        chi cac hop dong chua phat hanh vao mot bang khac cho no
        de lay cho no*/
        insert /*+ APPEND */ into ams.la_report_payment_result_tmp nologging
        select /*+ CARDINALITY(res, 100) */
            res.record_date,
            res.cash_receipt_id,
            res.account_id,
            res.application_number,
            res.receipt_entered_date,
            res.receipt_status_code,
            res.receipt_premium,
            var_session_id,
            ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN,
            ams.AMS_MODL_DATA_POLICY.SYSTEM_USER,
            ams.AMS_MODL_DATA_POLICY.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            select /*+ CARDINALITY(res, 100) */
                pre.record_date,
                pre.cash_receipt_id,
                pre.account_id,
                pre.application_number,
                pre.receipt_entered_date,
                pre.receipt_status_code,
                pre.receipt_premium
            from
            (
                --danh sach chua phat hanh hop dong mot chut gi ca
                --trong cong ty da xac dinh nhu truoc da co roi
                --lay du lieu cua thang cuoi cua no
                select /*+ CARDINALITY(tmp, 100) */
                    tmp.account_id
                from ams.la_report_payment_received_tmp tmp
                where tmp.session_id = var_session_id
                    and tmp.source_of_data = ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN
                minus
                --tru di nhung hop dong da phat hanh tinh cho den cuoi thang nhu the nay thi chay se rat nhanh cho no
                select  /*+ CARDINALITY(tmp, 100)*/
                    tmp.account_id
                from ams.la_report_account_tmp tmp
                where tmp.session_id = var_session_id
                    and tmp.source_of_data = ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN
            ) acc
            inner join --chi lay o cac hop dong ma co ngay nhap trong ky thoi
            (
                --danh sach cac hop dong da phat hanh va co ngay nhap trong ky
                --trong cong ty da xac dinh nhu truoc da co roi
                --lay du lieu cua thang cuoi cua no
                select /*+ CARDINALITY(tmp, 100) */
                    tmp.record_date,
                    tmp.cash_receipt_id,
                    tmp.account_id,
                    tmp.application_number,
                    tmp.receipt_entered_date,
                    tmp.receipt_status_code,
                    tmp.receipt_premium
                from ams.la_report_payment_received_tmp tmp
                where tmp.session_id = var_session_id
                    and tmp.source_of_data = ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN
            ) pre
                on pre.account_id = acc.account_id
        ) res;
        commit;
        dbms_stats.gather_table_stats(null, 'la_report_payment_result_tmp', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'AMS_MODL_DATA_POLICY', 'do so lieu payment recept rut gon vao ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 18;

        --tuc la tru di tat ca cac hop dong da phat hanh roi o phia tren la duoc roi
        insert /*+ APPEND */ into ams.la_report_policy nologging
        select /*+ CARDINALITY(outl, 100)
                         CARDINALITY(issu, 100)*/
            nvl(rcpt.collection_agent_id, rcpt.location_id) outlet_id, --res.outlet_id,
            valTypeOfData,--type_code
            pre.record_date, --record_date la thang da tinh cho no
            var_version_date,
            ams.AMS_MODL_DATA_POLICY.OBJECT_STATUS_ACTIVE,
            ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN,
            null,--outl.outlet_ams_id, --res.outlet_ams_id,
            null,--outl.outlet_bvlife_id, --outlet_bvlife_id
            null,--outl.outlet_name, -- res.ten_dai_ly,
            null,--outl.position_code,
            null,--position_name
            null,--outl.position_date,
            null,--outl.effective_date, --res.ngay_ky_hd, --work_begin_date
            null,--outl.terminative_date,  --work_end_date
            null,--outl.company_id, --res.ma_congty,
            null,--outl.company_ams_id, --res.ma_congty,
            null,--outl.company_name, --res.ten_congty ,
            null,--outl.office_id,    --moi them cot nay nua   office_id
            null,--outl.office_ams_id, -- moi them
            null,--outl.office_name, --moi them
            null,--outl.agency_id,    --moi them cot nay nua   sales_agency_id
            null,--outl.agency_ams_id, --res.ma_ban,
            null,--outl.agency_name, --res.ten_ban,
            null,--outl.unit_id, --res.ma_nhom, sales_unit_id
            null,--outl.unit_ams_id, --res.ma_nhom,
            null,--outl.unit_name, --res.ten_nhom,
            pre.application_number,--application_number varchar2(124),
            rcpt.receipt_number,
            pre.receipt_entered_date,
            pre.receipt_premium,
            pre.receipt_status_code,
            null,--receipt_status_name nvarchar2(32),
            null,--issu.policy_number,
            pre.account_id,
            null,--trunc(issu.freq_date, 'DD'),--effective_date           date,
            null,--trunc(issu.changes_date, 'DD'), --res.ngay_phat_hanh,,--issue_date         date,
            null,--is_cancel                varchar2(1),
            null,--cancel_date         date,
            null,--is_exit                varchar2(1),
            null,--exit_date          date,
            null,--is_reinst              varchar2(1),
            null,--reinst_date          date,
            null,--issu.freq_per_annum,--freq_per_annum number(1),
            null,--freq_per_annum_name nvarchar2(32),
            null,--isrc_premium number(18,2),
            null,--fyp                  number(18,2),
            null,--ls_premium             number(18,2),
            null,--issu.freq_premium,--regular_premium number(18,2),
            null,--issu.freq_premium,--ip                  number(18,2),
            null,--(issu.freq_premium * issu.freq_per_annum),--afyp    number(18,2),
            null,--holder_name nvarchar2(164),
            null,--insured_person_name nvarchar2(255),
            null,--holder_address nvarchar2(255),
            null,--activity_id            number(10),
            null,--benefit_id            number(10),
            ams.AMS_MODL_DATA_POLICY.policy_not_issued, --data_type
            var_session_id,
            ams.AMS_MODL_DATA_POLICY.SYSTEM_USER,
            ams.AMS_MODL_DATA_POLICY.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (  --lay tu bang la_report_payment_result_tmp
            --lay tu bang result o tren da co
            --danh sach cac hop dong da phat hanh va co ngay nhap trong ky
            --trong cong ty da xac dinh nhu truoc da co roi
            --lay du lieu cua thang cuoi cua no
            select /*+ CARDINALITY(tmp, 100) */
                tmp.record_date,
                tmp.cash_receipt_id,
                tmp.account_id,
                tmp.application_number,
                tmp.receipt_entered_date,
                tmp.receipt_status_code,
                tmp.receipt_premium
            from ams.la_report_payment_result_tmp tmp
            where tmp.session_id = var_session_id
                and tmp.source_of_data = ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN
        ) pre
         inner join
         (
             select
                 /*+ CARDINALITY(tmp, 100)  */
                 tmp.cash_receipt_id,
                 tmp.receipt_number,
                 tmp.collection_agent_id,
                 tmp.location_id
             from ams.la_report_cash_receipt_tmp tmp
             where tmp.session_id = var_session_id
                 and tmp.source_of_data = ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN
         ) rcpt
            on rcpt.cash_receipt_id = pre.cash_receipt_id;
        commit;

        --lay cho nay cho no
        --can phai lay chi tiet ten cua dai ly vao day cho no de chay

        --sau khi da co cai day thi se lam nhu sau
        --danh dau cho so thu tu cua nhung dai ly ma chuyen sang cong ty cho no
        --la  OBJECT_STATUS_FREEZE cho no
        --de edit cho no de lay ten chinh xac cua cac dai ly cho no vao
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_report_policy o
        using
            (
                select /*+ CARDINALITY(a, 100) */
                    a.location_id company_id,
                    a.location_name company_name
                from ods.location a
                where a.location_type_code = 'CTTV'
            ) upd
        on (
            var_session_id = o.session_id
            and
            ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN = o.source_of_data
            and  --phai co dieu kien la chua phat hanh vao cho no moi dung
            ams.AMS_MODL_DATA_POLICY.policy_not_issued = o.data_type
            --trong truong hop khong the lay duoc ten cong ty ra
            --thi tuc la no cho ve mot cong ty da co chinh la truong outlet_id
            --outlet_id is not null = company_id va company_id la null
            --thi update lai ten cong ty va ma cong ty chinh la outlet_id cho no
            and --neu ma trung ma cua no thi se update cho no
            --trang thai cho no
            upd.company_id = o.outlet_id
            and
            o.account_id is not null
        )
        when matched then
            update
                set
                    o.status_code = ams.AMS_MODL_DATA_POLICY.OBJECT_STATUS_FREEZE,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'AMS_MODL_DATA_POLICY', 'set OBJECT_STATUS_FREEZE cho BLTT' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 18.1;

        --sau do thi se cap nhat cho no lai  ma dai ly vao cho no vao day
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_report_policy o
        using
            (
                select  /*+ CARDINALITY(pol, 100)
                    CARDINALITY(outl, 100) */
                    pol.account_id,
                    max(outl.outlet_client_id) outlet_id
                from
                (
                    select  /*+ CARDINALITY(tmp, 100) */
                        tmp.account_id
                    from ams.la_report_policy tmp
                    where tmp.session_id = var_session_id
                        and tmp.source_of_data = ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN
                        and tmp.data_type = ams.AMS_MODL_DATA_POLICY.policy_not_issued
                        --chi lay cac hop dong bi danh dau phia tren
                        and tmp.status_code = ams.AMS_MODL_DATA_POLICY.OBJECT_STATUS_FREEZE
                        and tmp.account_id is not null
                    group by tmp.account_id
                ) pol
                inner join
                (
                    select  /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_client_id,
                        tmp.account_id,
                        max(tmp.account_outlet_id)
                    from ods.account_outlet_relationship tmp
                    --chi lay trong vong 3 thang tro lai thoi
                    where trunc(tmp.effective_date, 'DD')
                        between var_from_effective_date
                            and var_to_effective_date
                        and tmp.relationship_type_code = 'INIT'
                    group by tmp.outlet_client_id,
                        tmp.account_id
                ) outl
                    on outl.account_id = pol.account_id
                group by pol.account_id
            ) upd
        on (
            var_session_id = o.session_id
            and
            ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN = o.source_of_data
            and  --phai co dieu kien la chua phat hanh vao cho no moi dung
            ams.AMS_MODL_DATA_POLICY.policy_not_issued = o.data_type
            and --chi cap nhat voi cac ma trang thai o phia tren thi moi xu ly cho no
            ams.AMS_MODL_DATA_POLICY.OBJECT_STATUS_FREEZE = o.status_code
            --trong truong hop khong the lay duoc ten cong ty ra
            --thi tuc la no cho ve mot cong ty da co chinh la truong outlet_id
            --outlet_id is not null = company_id va company_id la null
            --thi update lai ten cong ty va ma cong ty chinh la outlet_id cho no
            and --neu trung ma hop dong
            upd.account_id = o.account_id
        )
        when matched then
            update
                set
                    o.outlet_id = upd.outlet_id,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'AMS_MODL_DATA_POLICY', 'cap nhat ma dai ly OBJECT_STATUS_FREEZE cho BLTT' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 18.2;

        --sau do thi cap nhat nguoc tro lai nhung ma OBJECT_STATUS_FREEZE thang ACTI

        update ams.la_report_policy tmp
        set tmp.status_code = ams.AMS_MODL_DATA_POLICY.OBJECT_STATUS_ACTIVE,
            tmp.update_datetime = sysdate
        where tmp.session_id = var_session_id
            and tmp.source_of_data = ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN
            and tmp.data_type = ams.AMS_MODL_DATA_POLICY.policy_not_issued
            --chi lay cac hop dong bi danh dau phia tren
            and tmp.status_code = ams.AMS_MODL_DATA_POLICY.OBJECT_STATUS_FREEZE;
        commit;

        --sau do thi lay ten cac dai ly va cac thong tin cho dai ly vao nhu binh thuong
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'AMS_MODL_DATA_POLICY', 'cap nhat lai OBJECT_STATUS_ACTIVE cho BLTT' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 19;

        --lay them cac thong tin ve hop dong cho no nua
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_report_policy o
        using
            (
                select  /*+ CARDINALITY(tmp, 100) */
                    tmp.account_id,
                    tmp.policy_number
                from ams.la_report_account_tmp tmp
                where tmp.session_id = var_session_id
                    and tmp.source_of_data = ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN
                    and tmp.policy_number is not null
                    and exists
                        (
                            select  /*+ CARDINALITY(tmp, 100) */
                                1
                            from ams.la_report_policy pol_tmp
                            where pol_tmp.session_id = var_session_id
                                and pol_tmp.source_of_data = ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN
                                and pol_tmp.data_type = ams.AMS_MODL_DATA_POLICY.policy_not_issued
                                and pol_tmp.account_id = tmp.account_id
                        )
            ) upd
        on (
            var_session_id = o.session_id
            and
            ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN = o.source_of_data
            and  --phai co dieu kien la chua phat hanh vao cho no moi dung
            ams.AMS_MODL_DATA_POLICY.policy_not_issued = o.data_type
            and
            upd.account_id = o.account_id
        )
        when matched then
            update
                set
                    o.policy_number = upd.policy_number,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'AMS_MODL_DATA_POLICY', 'cap nhat so hop dong cho danh sach chua PH thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 20;
        /*ten trang thai bien lai tam thu*/
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_report_policy o
        using
            (
                select  /*+ CARDINALITY(code, 100)*/
                    code.code_code receipt_status_code,
                    code.code_value receipt_status_name
                from ams.cla_codes code
                where code.code_language = ams.AMS_MODL_DATA_POLICY.THEME_LANGUAGE
                    and code.code_group = ams.AMS_MODL_DATA_POLICY.APP_STATUS_DISPLAY
                    and trunc(sysdate, 'DD')
                        between nvl(code.from_date, ams.AMS_MODL_DATA_POLICY.DATE_MIN_VALUE)
                        and nvl(code.to_date, ams.AMS_MODL_DATA_POLICY.DATE_MAX_VALUE)
            ) upd
        on (
            var_session_id = o.session_id
            and
            ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN = o.source_of_data
            and  --phai co dieu kien la chua phat hanh vao cho no moi dung
            ams.AMS_MODL_DATA_POLICY.policy_not_issued = o.data_type
            and
            upd.receipt_status_code = o.receipt_status_code
        )
        when matched then
            update
                set
                    o.receipt_status_name = upd.receipt_status_name,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'AMS_MODL_DATA_POLICY', 'lay so lieu trang thai BLTT thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri  lay ten trang thai:');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        var_error_pos := 21;

        /*do danh sach cac dai ly can lam len truoc de lam cho no nhanh hon
        tu do co the lay so lieu cho cac hoa don tam thu cho no*/
        for v_cty in (
            select
                ldl.database_no,
                to_char(ldl.database_no) company_code,
                ldl.database_name,
                ldl.database_schema username_id,
                ldl.database_link server_id
            from  ams.la_database_link ldl
            where ldl.database_status = 1
                and nvl(to_char(ldl.database_no), '%') like var_branch_id_string
        ) loop

            var_run_from_time  := sysdate;
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 21.1;
            loop
                delete ams.la_report_outlet_temp o
                where o.session_id = var_session_id
                    and o.company_id = v_cty.database_no
                    and rownum < ams.AMS_MODL_DATA_POLICY.RECORD_MAX_DELETE;
                exit when SQL%rowcount < ams.AMS_MODL_DATA_POLICY.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(v_cty.database_no, 'AMS_MODL_DATA_POLICY', 'xoa du lieu cu outlet thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;

            insert /*+ APPEND */ into ams.la_report_outlet_temp nologging
            select /*+ CARDINALITY(outl, 100)*/
                var_session_id,
                outl.outlet_id,
                var_version_date,
                ams.AMS_MODL_DATA_POLICY.STATUS_CURR,
                outl.outlet_ams_id,
                outl.outlet_ams_id,
                substr(outl.outlet_ams_id, 2) outlet_bvl_id,
                outl.outlet_name,
                outl.position_code,
                outl.position_date,
                outl.effective_date,
                outl.terminative_date,
                outl.company_id,
                outl.company_ams_id,
                outl.company_name,
                outl.office_id,
                outl.office_ams_id,
                outl.office_name,
                outl.agency_id,
                outl.agency_ams_id,
                outl.agency_name,
                outl.unit_id,
                outl.unit_ams_id,
                outl.unit_name,
                ams.AMS_MODL_DATA_POLICY.SYSTEM_USER,
                ams.AMS_MODL_DATA_POLICY.SYSTEM_USER,
                sysdate,
                sysdate
            from ams.serv_outlet_data outl
            where outl.record_date = var_to_issue_record_date
                and outl.type_code = ams.AMS_MODL_DATA_POLICY.MODULE_CODE_MAIN
                and outl.status_code = ams.AMS_MODL_DATA_POLICY.OBJECT_STATUS_ACTIVE
                and outl.company_id = v_cty.database_no;
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(v_cty.database_no, 'AMS_MODL_DATA_POLICY', 'lay so lieu outlet dang lam thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 21.2;

            insert /*+ APPEND */ into ams.la_report_outlet_temp nologging
            select /*+ CARDINALITY(outl, 100)  */
                var_session_id,
                outl.outlet_id,
                var_version_date,
                ams.AMS_MODL_DATA_POLICY.STATUS_TERM,
                outl.outlet_ams_id,
                outl.outlet_ams_id,
                substr(outl.outlet_ams_id, 2) outlet_bvl_id,
                outl.outlet_name,
                outl.position_code,
                outl.position_date,
                outl.effective_date,
                outl.terminative_date,
                outl.company_id,
                outl.company_ams_id,
                outl.company_name,
                outl.office_id,
                outl.office_ams_id,
                outl.office_name,
                outl.agency_id,
                outl.agency_ams_id,
                outl.agency_name,
                outl.unit_id,
                outl.unit_ams_id,
                outl.unit_name,
                ams.AMS_MODL_DATA_POLICY.SYSTEM_USER,
                ams.AMS_MODL_DATA_POLICY.SYSTEM_USER,
                sysdate,
                sysdate
            from ams.serv_outlet_data outl
            where outl.record_date
                    between var_from_issue_date
                    and add_months(var_to_issue_record_date, -1)
                and outl.type_code = ams.AMS_MODL_DATA_POLICY.MODULE_CODE_MAIN
                and outl.status_code = ams.AMS_MODL_DATA_POLICY.OBJECT_STATUS_ACTIVE
                and outl.terminative_date is not null
                and outl.company_id = nvl(v_cty.database_no, 0);
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(v_cty.database_no, 'AMS_MODL_DATA_POLICY', 'lay so lieu outlet da nghi  thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));

            --phan lay cac BLTT thi se de o phia duoi cho no de no chay luon
            var_run_to_time := sysdate;
            ams.life_agency_log.time_log(v_cty.database_no, 'cty ' || to_char(v_cty.database_no) || ' thang '  || to_char(valRecordDate, 'dd/mm/yyyy') || ' mat ' , var_run_from_time, var_run_to_time);
        end loop;


        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'AMS_MODL_DATA_POLICY', 'lay ten cong ty vao BLTT thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri  lay ten trang thai:');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 22;

        var_run_from_time  := sysdate;
        /*cap nhat cac thong tin ve dai ly cho cac dai ly co HD ma chua phat hanh*/
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_report_policy o
        using
            (
                select  /*+ CARDINALITY(o, 100)*/
                    o.outlet_ams_id,
                    o.outlet_bvlife_id,
                    o.outlet_id,
                    o.outlet_name,
                    o.outlet_number,
                    o.company_id,
                    o.company_ams_id,
                    o.company_name,
                    o.office_id,
                    o.office_ams_id,
                    o.office_name,
                    o.agency_id,
                    o.agency_ams_id,
                    o.agency_name,
                    o.unit_id,
                    o.unit_ams_id,
                    o.unit_name,
                    o.position_code,
                    o.effective_date,
                    o.terminative_date
                from ams.la_report_outlet_temp o
                where o.session_id = var_session_id
            ) upd
        on (
            var_session_id = o.session_id
            and
            ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN = o.source_of_data
            and  --phai co dieu kien la chua phat hanh vao cho no moi dung
            ams.AMS_MODL_DATA_POLICY.policy_not_issued = o.data_type
            and
            upd.outlet_id = o.outlet_id
        )
        when matched then
            update
                set
                    o.company_name = upd.company_name,
                    o.company_ams_id = upd.company_ams_id,
                    o.company_id = upd.company_id,
                    o.outlet_ams_id = upd.outlet_ams_id,
                    o.outlet_bvlife_id = upd.outlet_bvlife_id,
                    o.outlet_name = upd.outlet_name,
                    o.office_id = upd.office_id,
                    o.office_ams_id = upd.office_ams_id,
                    o.office_name = upd.office_name,
                    o.agency_id = upd.agency_id,
                    o.agency_ams_id = upd.agency_ams_id,
                    o.agency_name = upd.agency_name,
                    o.unit_id = upd.unit_id,
                    o.unit_ams_id = upd.unit_ams_id,
                    o.unit_name = upd.unit_name,
                    o.effective_date  = upd.effective_date,
                    o.terminative_date  = upd.terminative_date,
                    o.position_code  = upd.position_code,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'AMS_MODL_DATA_POLICY', 'lay ten dai ly  vao BLTT thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri  lay ten trang thai:');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 24;

        /*lay ra account number  luon cho BLTT*/
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_report_policy o
        using
            (
                select  /*+ CARDINALITY(tmp, 100) */
                    tmp.account_id,
                    tmp.policy_number
                from ams.la_report_account_ext_tmp tmp
                where tmp.session_id = var_session_id
                    and tmp.source_of_data = ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN
            ) upd
        on (
            var_session_id = o.session_id
            and
            ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN = o.source_of_data
            and  --phai co dieu kien la chua phat hanh vao cho no moi dung
            ams.AMS_MODL_DATA_POLICY.policy_not_issued = o.data_type
            and
            upd.account_id = o.account_id
        )
        when matched then
            update
                set
                    o.policy_number = upd.policy_number,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'AMS_MODL_DATA_POLICY', 'merge so hoa don BLTT ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
         var_error_pos := 25;

        /*cac BTTT khi chua phat hanh hop dong
        lay ten cong ty vao*/
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_report_policy o
        using
            (
                select /*+ CARDINALITY(a, 100) */
                    a.location_id company_id,
                    a.location_name company_name
                from ods.location a
                where a.location_type_code = 'CTTV'
            ) upd
        on (
            var_session_id = o.session_id
            and
            ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN = o.source_of_data
            and  --phai co dieu kien la chua phat hanh vao cho no moi dung
            ams.AMS_MODL_DATA_POLICY.policy_not_issued = o.data_type
            --trong truong hop khong the lay duoc ten cong ty ra
            --thi tuc la no cho ve mot cong ty da co chinh la truong outlet_id
            --outlet_id is not null = company_id va company_id la null
            --thi update lai ten cong ty va ma cong ty chinh la outlet_id cho no
            and
            o.outlet_id is not null
        )
        when matched then
            update
                set
                    o.company_id = o.outlet_id,
                    o.company_name = upd.company_name,
                    o.update_datetime = sysdate
            where o.company_id is null
                and upd.company_id = o.outlet_id;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'AMS_MODL_DATA_POLICY', 'mergeten cong ty vao cac cai chi co cong ty ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
         var_error_pos := 25.1;

        /*sau do thi moi do du lieu thong tin ve hop dong da phat hanh cua tung cong ty vi join len qua lon nen khong lam duoc*/
        for v_cty in (
            select
                ldl.database_no,
                to_char(ldl.database_no) company_code,
                ldl.database_name,
                ldl.database_schema username_id,
                ldl.database_link server_id
            from  ams.la_database_link ldl
            where ldl.database_status = 1
                and nvl(to_char(ldl.database_no), '%') like var_branch_id_string
        ) loop

            var_run_from_time  := sysdate;
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;

            /*lay danh sach cac hop dong cua cac dai ly */
            insert /*+ APPEND */ into ams.la_report_policy nologging
            select /*+ CARDINALITY(outl, 100)
                             CARDINALITY(issu, 100)*/
                outl.outlet_id, --res.outlet_id,
                valTypeOfData,--type_code
                issu.record_date, --record_date la thang da tinh cho nos
                var_version_date,
                ams.AMS_MODL_DATA_POLICY.OBJECT_STATUS_ACTIVE,
                ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN,
                outl.outlet_ams_id, --res.outlet_ams_id,
                outl.outlet_bvlife_id, --outlet_bvlife_id
                outl.outlet_name, -- res.ten_dai_ly,
                outl.position_code,
                null,--position_name
                outl.position_date,
                outl.effective_date, --res.ngay_ky_hd, --work_begin_date
                outl.terminative_date,  --work_end_date
                outl.company_id, --res.ma_congty,
                outl.company_ams_id, --res.ma_congty,
                outl.company_name, --res.ten_congty ,
                outl.office_id,    --moi them cot nay nua   office_id
                outl.office_ams_id, -- moi them
                outl.office_name, --moi them
                outl.agency_id,    --moi them cot nay nua   sales_agency_id
                outl.agency_ams_id, --res.ma_ban,
                outl.agency_name, --res.ten_ban,
                outl.unit_id, --res.ma_nhom, sales_unit_id
                outl.unit_ams_id, --res.ma_nhom,
                outl.unit_name, --res.ten_nhom,
                issu.application_number,-- varchar2(124),
                issu.receipt_number,-- varchar2(124),
                issu.receipt_entered_date,--       date,
                issu.receipt_premium,--      number(18,2),
                null,--receipt_status_code varchar2(16),
                null,--receipt_status_name nvarchar2(32),
                issu.policy_number, --res.sohopdong,,--policy_number        varchar2(32),
                issu.account_id,--       number(10),
                issu.pol_effective_date,--
                issu.pol_issue_date,--
                issu.is_cancel,--                varchar2(1),
                issu.cancel_date,--         date,
                issu.is_exit,--                varchar2(1),
                issu.exit_date,--          date,
                issu.is_reinst,--              varchar2(1),
                issu.reinst_date,--          date,
                issu.freq_per_annum,--freq_per_annum number(1),
                null,--freq_per_annum_name nvarchar2(32),
                issu.isrc_premium,-- number(18,2),
                null,--fyp                  number(18,2),
                null,--ls_premium             number(18,2),
                issu.regular_premium,--regular_premium number(18,2),
                issu.ip,--ip                  number(18,2),
                issu.afyp,--afyp    number(18,2),
                issu.holder_name,-- nvarchar2(164),
                issu.insured_person_name,-- nvarchar2(255),
                issu.holder_address,-- nvarchar2(255),
                issu.activity_id,--            number(10),
                null,--benefit_id            number(10),
                ams.AMS_MODL_DATA_POLICY.policy_issued, --data_type
                var_session_id,
                ams.AMS_MODL_DATA_POLICY.SYSTEM_USER,
                ams.AMS_MODL_DATA_POLICY.SYSTEM_USER,
                sysdate,
                sysdate
            from
              (
                  select  /*+ CARDINALITY(o, 100)*/
                      o.outlet_number,
                      o.outlet_ams_id,
                      o.outlet_bvlife_id,
                      o.outlet_id,
                      o.outlet_name,
                      o.company_id,
                      o.company_ams_id,
                      o.company_name,
                      o.office_id,
                      o.office_ams_id,
                      o.office_name,
                      o.agency_id,
                      o.agency_ams_id,
                      o.agency_name,
                      o.unit_id,
                      o.unit_ams_id,
                      o.unit_name,
                      o.position_code,
                      o.position_date,
                      o.effective_date,
                      o.terminative_date
                  from ams.la_report_outlet_temp o
                  where o.session_id = var_session_id
                      and o.company_id = v_cty.database_no
              ) outl
              inner join
              (
                select  /*+ CARDINALITY(tmp, 100)*/
                    tmp.record_date,
                    tmp.policy_number,
                    tmp.init_ams_id,
                    tmp.application_number,
                    tmp.receipt_number,
                    tmp.receipt_entered_date,
                    tmp.receipt_premium,
                    tmp.pol_effective_date,
                    tmp.pol_issue_date,
                    tmp.freq_per_annum,
                    tmp.regular_premium,
                    tmp.ip,
                    tmp.afyp,
                    tmp.is_cancel,
                    tmp.cancel_date,
                    tmp.is_exit,
                    tmp.exit_date,
                    tmp.is_reinst,
                    tmp.reinst_date,
                    tmp.account_id,
                    tmp.outlet_id,
                    tmp.activity_id,
                    tmp.isrc_premium,
                    tmp.holder_name,
                    tmp.insured_person_name,
                    tmp.holder_address
                from ams.la_report_policy_tmp tmp
                where tmp.session_id = var_session_id
                    and tmp.source_of_data = ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN
            ) issu
                on issu.init_ams_id = outl.outlet_ams_id;
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(v_cty.database_no, 'AMS_MODL_DATA_POLICY', 'lay so lieu hop dong chi tiet thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            --phan lay cac BLTT thi se de o phia duoi cho no de no chay luon
            var_run_to_time := sysdate;
            ams.life_agency_log.time_log(v_cty.database_no, 'cty ' || to_char(v_cty.database_no) || ' thang '  || to_char(valRecordDate, 'dd/mm/yyyy') || ' mat ' , var_run_from_time, var_run_to_time);
        end loop;

          /*ten chuc vu cua dai ly cap nhat vao day*/
         merge  /*+ CARDINALITY(o, 100)
                    CARDINALITY(upd, 100)
                    LEADING(o upd) */
              into ams.la_report_policy o
          using
              (
                  select  /*+ CARDINALITY(code, 100)*/
                      code.code_code position_code,
                      code.code_value position_name
                  from ams.cla_codes code
                  where code.code_language = ams.AMS_MODL_DATA_POLICY.THEME_LANGUAGE
                      and code.code_group = ams.AMS_MODL_DATA_POLICY.OUTLET_INFO_TYPE_POSI
                      and trunc(sysdate, 'DD')
                          between nvl(code.from_date, ams.AMS_MODL_DATA_POLICY.DATE_MIN_VALUE)
                          and nvl(code.to_date, ams.AMS_MODL_DATA_POLICY.DATE_MAX_VALUE)
              ) upd
          on (
              var_session_id = o.session_id
              and
              ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN = o.source_of_data
              and
              upd.position_code = o.position_code
          )
          when matched then
              update
                  set
                      o.position_name = upd.position_name,
                      o.update_datetime = sysdate;
         commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(1000, 'AMS_MODL_DATA_POLICY', 'lay so lieu chuc vu thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri  lay ten chuc vu:');
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;
          var_error_pos := 26;
          /*cap nhat dinh ky thu phi cho cac hop dong*/
          merge  /*+ CARDINALITY(o, 100)
                    CARDINALITY(upd, 100)
                    LEADING(o upd) */
              into ams.la_report_policy o
          using
              (
                  select  /*+ CARDINALITY(code, 100)*/
                      code.code_code freq_code,
                      code.code_value freq_name
                  from ams.cla_codes code
                  where code.code_language = ams.AMS_MODL_DATA_POLICY.THEME_LANGUAGE
                      and code.code_group = 'FREQ'
                      and trunc(sysdate, 'DD')
                          between nvl(code.from_date, ams.AMS_MODL_DATA_POLICY.DATE_MIN_VALUE)
                          and nvl(code.to_date, ams.AMS_MODL_DATA_POLICY.DATE_MAX_VALUE)
              ) upd
          on (
              var_session_id = o.session_id
              and
              ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN = o.source_of_data
              and
              upd.freq_code = o.freq_per_annum
          )
          when matched then
              update
                  set
                      o.freq_per_annum_name = upd.freq_name,
                      o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'AMS_MODL_DATA_POLICY', 'lay so lieu dinh ky dong phi thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri  lay dinh ky thu phi:');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 27;

        --sau do thi quay nguoc tro lai 12 thang de lay so lieu cac hop dong bi huy cho no dung
        --do so lieu vao truoc da
        --cac hop dong huy 14 ngay
        insert /*+ APPEND */ into ams.la_report_pol_cancel_tmp nologging
        select /*+ CARDINALITY(res, 100) */
            res.policy_number,
            res.cancel_date,
            res.is_cancel,
            var_session_id,
            ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN,
            ams.AMS_MODL_DATA_POLICY.SYSTEM_USER,
            ams.AMS_MODL_DATA_POLICY.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            select /*+ CARDINALITY(pol, 100)*/
                pol.policy_number,
                max(trunc(pol.changes_date, 'DD')) cancel_date,
                'X' is_cancel
            from
            (
                select  /*+ CARDINALITY(tmp, 100) */
                    tmp.policy_number,
                    tmp.changes_date
                from ams.mod_data_policy tmp
                --chi lay du lieu cua thang day thoi va quay nguoc lai
                where tmp.record_date = var_to_issue_record_date
                    and tmp.type_of_data = ams.AMS_MODL_DATA_POLICY.MODULE_CODE_MAIN
                    and tmp.source_of_data = ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN
                    and tmp.changes_code = ams.AMS_MODL_DATA_POLICY.POLYC_CODE_CANC
                    and tmp.policy_number is not null
           ) pol
           group by pol.policy_number
        ) res;
        commit;
        dbms_stats.gather_table_stats(null, 'la_report_pol_cancel_tmp', cascade => true);

       /*lay ca thong tin ve  huy sau 14 ngay vao*/
        insert /*+ APPEND */ into ams.la_report_pol_exit_tmp nologging
        select /*+ CARDINALITY(res, 100) */
            res.policy_number,
            res.exit_date,
            res.is_exit,
            var_session_id,
            ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN,
            ams.AMS_MODL_DATA_POLICY.SYSTEM_USER,
            ams.AMS_MODL_DATA_POLICY.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            select /*+ CARDINALITY(pol, 100)*/
                pol.policy_number,
                max(trunc(pol.changes_date, 'DD')) exit_date,
                'X' is_exit
            from
            (
                select  /*+ CARDINALITY(tmp, 100) */
                    tmp.policy_number,
                    tmp.changes_date
                from ams.mod_data_policy tmp
                where tmp.record_date = var_to_issue_record_date
                    and tmp.type_of_data = ams.AMS_MODL_DATA_POLICY.MODULE_CODE_MAIN
                    and tmp.source_of_data = ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN
                    and tmp.changes_code = ams.AMS_MODL_DATA_POLICY.POLYC_CODE_TERM
                    and tmp.status_code = ams.AMS_MODL_DATA_POLICY.OBJECT_STATUS_ACTIVE
                    and tmp.policy_number is not null
            ) pol
            group by pol.policy_number
        ) res;
        commit;
        dbms_stats.gather_table_stats(null, 'la_report_pol_exit_tmp', cascade => true);

        /*Sau do se lay ra ngay bi khoi phuc va lay ra ngay lon nhat cho no*/
        /*lay ca thong tin ve  huy sau 14 ngay vao*/
        insert /*+ APPEND */ into ams.la_report_pol_reinst_tmp nologging
        select /*+ CARDINALITY(res, 100) */
            res.policy_number,
            res.action_date,
            res.is_action,
            var_session_id,
            ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN,
            ams.AMS_MODL_DATA_POLICY.SYSTEM_USER,
            ams.AMS_MODL_DATA_POLICY.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            select /*+ CARDINALITY(pol, 100)*/
                pol.policy_number,
                max(trunc(pol.changes_date, 'DD')) action_date,
                'X' is_action
            from
            (
                select  /*+ CARDINALITY(tmp, 100) */
                    tmp.policy_number,
                    tmp.changes_date
                from ams.mod_data_policy tmp
                where tmp.record_date = var_to_issue_record_date
                    and tmp.type_of_data = ams.AMS_MODL_DATA_POLICY.MODULE_CODE_MAIN
                    and tmp.source_of_data = ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN
                    and tmp.changes_code = ams.AMS_MODL_DATA_POLICY.POLYC_CODE_REIS
                    and tmp.status_code = ams.AMS_MODL_DATA_POLICY.OBJECT_STATUS_ACTIVE
                    and tmp.policy_number is not null
            ) pol
            group by pol.policy_number
        ) res;
        commit;
        dbms_stats.gather_table_stats(null, 'la_report_pol_reinst_tmp', cascade => true);

        var_month_qty := 12;
        --neu ma chay vao ngay giua thang thi se chay vong lai 24 thang
        --con cac thang khac thi chi vong lai 12 thang
       --if trunc(sysdate, 'DD') =
        if (to_char(sysdate, 'DD') in ('10', '15', '20')) then
            var_month_qty := 24;
        end if;

        for i in 0..var_month_qty
        loop
            var_record_date := add_months(var_to_issue_record_date, -i);
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 28.1;

            /*lay ca thong tin ve bi huy 14 ngay vao*/
            merge  /*+ CARDINALITY(o, 100)
                      CARDINALITY(upd, 100)
                      LEADING(o upd) */
                into ams.la_report_policy o
            using
                (
                    select  /*+ CARDINALITY(tmp, 100) */
                        tmp.policy_number,
                        max(tmp.cancel_date) cancel_date,
                        max(tmp.is_cancel) is_cancel
                    from ams.la_report_pol_cancel_tmp tmp
                    where tmp.session_id = var_session_id
                        and tmp.source_of_data = ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN
                    group by tmp.policy_number
                ) upd
            on (
                var_record_date = o.record_date
                and
                ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN = o.source_of_data
                and
                upd.policy_number = o.policy_number
            )
            when matched then
                update
                    set
                        o.is_cancel = upd.is_cancel,
                        o.cancel_date = upd.cancel_date,
                        o.update_datetime = sysdate;
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'AMS_MODL_DATA_POLICY', 'cap nhat so lieu huy  14 ngay trong thang ' || to_char(var_record_date, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 28.2;

            merge  /*+ CARDINALITY(o, 100)
                      CARDINALITY(upd, 100)
                      LEADING(o upd) */
                into ams.la_report_policy o
            using
                (
                    select  /*+ CARDINALITY(tmp, 100) */
                        tmp.policy_number,
                        max(tmp.exit_date) exit_date,
                        max(tmp.is_exit) is_exit
                    from ams.la_report_pol_exit_tmp tmp
                    where tmp.session_id = var_session_id
                        and tmp.source_of_data = ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN
                    group by tmp.policy_number
                ) upd
            on (
                var_record_date = o.record_date
                and
                ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN = o.source_of_data
                and
                upd.policy_number = o.policy_number
            )
            when matched then
                update
                    set
                        o.is_exit = upd.is_exit,
                        o.exit_date = upd.exit_date,
                        o.update_datetime = sysdate;
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'AMS_MODL_DATA_POLICY', 'cap nhat so lieu huy sau 14 ngay trong thang ' || to_char(var_record_date, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 28.3;


            merge  /*+ CARDINALITY(o, 100)
                      CARDINALITY(upd, 100)
                      LEADING(o upd) */
                into ams.la_report_policy o
            using
                (
                    select  /*+ CARDINALITY(tmp, 100) */
                        tmp.policy_number,
                        max(tmp.reinst_date) reinst_date,
                        max(tmp.is_reinst) is_reinst
                    from ams.la_report_pol_reinst_tmp tmp
                    where tmp.session_id = var_session_id
                        and tmp.source_of_data = ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN
                    group by tmp.policy_number
                ) upd
            on (
                var_record_date = o.record_date
                and
                ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN = o.source_of_data
                and
                upd.policy_number = o.policy_number
            )
            when matched then
                update
                    set
                        o.is_reinst = upd.is_reinst,
                        o.reinst_date = upd.reinst_date,
                        o.update_datetime = sysdate;
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'AMS_MODL_DATA_POLICY', 'cap nhat so lieu khoi phuc trong thang thang ' || to_char(var_record_date, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 28.4;
            /*cho nay se xu ly cho no neu ma co khoi phuc
            va ngay khoi phuc o sau ngay huy tu dong thi se
            cap nhat cho truong huy va ngay huy cua no  bang null
            nhu the thi se ra dung he thong*/
            /*Sau do se lay ra ngay bi khoi phuc va lay ra ngay lon nhat cho no*/

            execute immediate 'truncate table ams.la_report_pol_reinst_mon_tmp';
            insert /*+ APPEND */ into ams.la_report_pol_reinst_mon_tmp nologging
            select /*+ CARDINALITY(res, 100) */
                res.policy_number,
                res.action_date,
                null, --is_action,
                var_session_id,
                ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN,
                ams.AMS_MODL_DATA_POLICY.SYSTEM_USER,
                ams.AMS_MODL_DATA_POLICY.SYSTEM_USER,
                sysdate,
                sysdate
            from
            (
                select  /*+ CARDINALITY(tmp, 100) */
                    tmp.policy_number,
                    tmp.reinst_date action_date
                from ams.la_report_policy tmp
                where tmp.record_date = var_record_date
                    and tmp.source_of_data = ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN
                    and tmp.is_reinst is not null  --duoc khoi phuc
            ) res;
            commit;
            dbms_stats.gather_table_stats(null, 'la_report_pol_reinst_mon_tmp', cascade => true);

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'AMS_MODL_DATA_POLICY', 'cap nhat so lieu khoi phuc trong thang thang ' || to_char(var_record_date, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 28.5;

            merge  /*+ CARDINALITY(o, 100)
                      CARDINALITY(upd, 100)
                      LEADING(o upd) */
                into ams.la_report_policy o
            using
                (   /*lay danh sach cac hop dong duoc khoi phuc ra
                      lay du lieu cua tung thang ra*/
                    select  /*+ CARDINALITY(tmp, 100) */
                        tmp.policy_number,
                        max(tmp.reinst_date) reinst_date
                    from ams.la_report_pol_reinst_mon_tmp tmp
                    where tmp.session_id = var_session_id
                        and tmp.source_of_data = ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN
                    group by tmp.policy_number
                ) upd
            on (
                var_record_date = o.record_date
                and
                ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN = o.source_of_data
                and
                upd.policy_number = o.policy_number
            )
            when matched then
                update
                    set
                        o.is_exit = null,
                        o.exit_date = null,
                        o.update_datetime = sysdate
                where
                    o.is_exit = 'X'
                    and--co ngay khoi phuc sau ngay huy tuc la da duoc khoi phuc lai
                    o.reinst_date >= o.exit_date;
            commit;

/*            merge  \*+ CARDINALITY(o, 100)
                      CARDINALITY(upd, 100)
                      LEADING(o upd) *\
                into ams.la_report_policy o
            using
                (   \*lay danh sach cac hop dong duoc khoi phuc ra
                lay du lieu cua tung thang ra*\
                    select  \*+ CARDINALITY(tmp, 100) *\
                        tmp.policy_number,
                        tmp.reinst_date
                    from ams.la_report_policy tmp
                    where tmp.record_date = var_record_date
                        and tmp.source_of_data = ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN
                        and tmp.is_reinst is not null  --duoc khoi phuc
                ) upd
            on (
                var_record_date = o.record_date
                and
                ams.AMS_MODL_DATA_POLICY.SYSTEM_REFER_TALISMAN = o.source_of_data
                and
                upd.policy_number = o.policy_number
            )
            when matched then
                update
                    set
                        o.is_exit = null,
                        o.exit_date = null,
                        o.update_datetime = sysdate
                where
                    o.is_exit = 'X'
                    and--co ngay khoi phuc sau ngay huy tuc la da duoc khoi phuc lai
                    o.reinst_date >= o.exit_date;
            commit;*/
            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'AMS_MODL_DATA_POLICY', 'cap nhat so lieu huy that su trong thang ' || to_char(var_record_date, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        end loop;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'AMS_MODL_DATA_POLICY', 'tong thoi gian cap nhat so lieu huy trong 12 thang ' || to_char(var_record_date, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));

        var_run_to_time := sysdate;
        ams.life_agency_log.time_log(1000, 'chay huy cho cac cty', var_run_from_time, var_run_to_time);


        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        dbms_stats.gather_table_stats(null, 'la_report_policy', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'AMS_MODL_DATA_POLICY', 'gather lai bang');

        var_run_end_time := sysdate;
        ams.life_agency_log.time_log(1001, 'Thoi gian chay', var_run_begin_time, var_run_end_time);
        exception
            when others then
                rollback;
                life_agency_log.write_log(1000,
                    'get_policy_tal: loi thu tuc chay so lieu bao cao dong ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                    sqlerrm,
                    sqlcode);
    end;

end AMS_MODL_DATA_POLICY;
/
