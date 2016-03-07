create or replace package ams.LIFE_AGENCY_MANA_POLICY_REPORT is
    PACK_DATE date := to_date('09-jul-2011');
    TALISMAN_GOLIVE date := to_date('28-feb-2011');

    var_delete_from_date date := trunc(sysdate - 7, 'DD');
    var_current_date date := trunc(sysdate, 'DD');

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

    SYSTEM_VALUE_YES varchar2(1) := 'Y';
    SYSTEM_VALUE_NO varchar2(1) := 'N';

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

    CANCEL_BEFORE_CURRENT NUMBER(1) := 1; --huy truoc thang tinh day
    CANCEL_AFTER_CURRENT NUMBER(1) := 0; --xoa trong thang tinh day
    MAX_DELETE_NUMBER number(10) := 50000;
    procedure main;
    procedure get_mana_pol_01(valRecordDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        valOption number := null,
        valSessionId number := null,
        row_records out sys_refcursor);
    procedure get_mana_pol_02(valRecordDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        valOption number := null,
        valSessionId number := null,
        row_records out sys_refcursor);
    procedure get_version_date(
        row_records out sys_refcursor);
    procedure delete_session_id(valSessionID number,
        row_records out sys_refcursor);
    procedure delete_session(valSessionID number);
    procedure truncate_table(row_records out sys_refcursor);
end LIFE_AGENCY_MANA_POLICY_REPORT;
/
create or replace package body ams.LIFE_AGENCY_MANA_POLICY_REPORT is
    procedure main
    is
    begin
        null;
    end;

    /*chinhlk option 0: BVL    1: TAL   2: ca 2*/
    procedure get_mana_pol_01(valRecordDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        valOption number := null,
        valSessionId number := null,
        row_records out sys_refcursor)
    is
        var_record_date date := trunc(valRecordDate, 'DD');
        var_record_month date := trunc(valRecordDate, 'MM'); --thang day la thang nao cua no de lay neu k lay dc theo ngay
        var_branch_id number(10) := nvl(valBranchID, 0);
        var_agent_id number(10) := nvl(valAgentID, 0);
        var_run_begin_time date := sysdate;
        var_run_end_time date := sysdate;
    begin
            if var_agent_id <> 0 then
                open row_records for
                select /*+ CARDINALITY(res, 100)
                    */
                    res.company_name,
                    res.office_ams_id,
                    res.office_name,
                    res.agency_ams_id,
                    res.agency_name,
                    res.unit_ams_id,
                    res.unit_name,
                    res.outlet_id,
                    res.outlet_ams_id,
                    res.outlet_name,
                    res.position_name,
                    to_char(res.position_date, 'DD/MM/YYYY') position_date,
                    to_char(res.effective_date, 'DD/MM/YYYY') effective_date,
                    to_char(res.terminative_date, 'DD/MM/YYYY') terminative_date,
                    res.account_number,
                    to_char(res.pol_effective_date, 'DD/MM/YYYY') pol_effective_date,
                    to_char(res.pol_issue_date, 'DD/MM/YYYY') pol_issue_date,
                    to_char(res.pol_of_date, 'DD/MM/YYYY') pol_of_date,
                    ceil(months_between(var_record_date,res.pol_effective_date)/12) pol_real_year, -- Nam thuc te cua hop dong
                    res.freq_per_annum_name freq_per_annum,/*
                    res.risk_term,
                    to_char(res.term_from_date, 'DD/MM/YYYY') term_from_date,
                    to_char(res.term_to_date, 'DD/MM/YYYY') term_to_date,*/
                    res.init_premium,
                    res.freq_premium,
                    res.lsum_premium,
                    res.afyp,
                    res.pol_status_name status,
                    res.commission_status_name,
                    res.holder_name,
                    res.insured_name,
                    res.holder_address,
                    res.init_outlet_ams_id,
                    res.source_of_data
                from ams.la_mana_policy_repo res
                where res.record_date = var_record_date
                    and
                    (
                       nvl(valOption, 2) = 2  --ca 2 nguon
                       or ( valOption = 0 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                       or ( valOption = 1 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                    )
                    and res.outlet_id = var_agent_id
                order by
                    nlssort(res.company_name, 'nls_sort=Vietnamese'),
                    nlssort(res.office_name, 'nls_sort=Vietnamese') nulls first,
                    nlssort(res.agency_name, 'nls_sort=Vietnamese') nulls first,
                    nlssort(res.unit_name, 'nls_sort=Vietnamese') nulls first,
                    nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                    nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese'),
                    res.pol_issue_date desc;
           elsif var_branch_id <> 0 then
                open row_records for
                select /*+ CARDINALITY(res, 100)
                    */
                    res.company_name,
                    res.office_ams_id,
                    res.office_name,
                    res.agency_ams_id,
                    res.agency_name,
                    res.unit_ams_id,
                    res.unit_name,
                    res.outlet_id,
                    res.outlet_ams_id,
                    res.outlet_name,
                    res.position_name,
                    to_char(res.position_date, 'DD/MM/YYYY') position_date,
                    to_char(res.effective_date, 'DD/MM/YYYY') effective_date,
                    to_char(res.terminative_date, 'DD/MM/YYYY') terminative_date,
                    res.account_number,
                    to_char(res.pol_effective_date, 'DD/MM/YYYY') pol_effective_date,
                    to_char(res.pol_issue_date, 'DD/MM/YYYY') pol_issue_date,
                    to_char(res.pol_of_date, 'DD/MM/YYYY') pol_of_date,
                    ceil(months_between(var_record_date,res.pol_effective_date)/12) pol_real_year, -- Nam thuc te cua hop dong
                    res.freq_per_annum_name freq_per_annum,
                    /*res.risk_term,
                    to_char(res.term_from_date, 'DD/MM/YYYY') term_from_date,
                    to_char(res.term_to_date, 'DD/MM/YYYY') term_to_date,   */
                    res.init_premium,
                    res.freq_premium,
                    res.lsum_premium,
                    res.afyp,
                    res.pol_status_name status,
                    res.commission_status_name,
                    res.holder_name,
                    res.insured_name,
                    res.holder_address,
                    res.init_outlet_ams_id,
                    res.source_of_data
                from ams.la_mana_policy_repo res
                where res.record_date = var_record_date
                    and
                    (
                       nvl(valOption, 2) = 2  --ca 2 nguon
                       or ( valOption = 0 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                       or ( valOption = 1 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                    )
                    and var_branch_id in
                    (
                        res.company_id,
                        res.office_id,
                        res.agency_id,
                        res.unit_id
                    )
                order by
                    nlssort(res.company_name, 'nls_sort=Vietnamese'),
                    nlssort(res.office_name, 'nls_sort=Vietnamese') nulls first,
                    nlssort(res.agency_name, 'nls_sort=Vietnamese') nulls first,
                    nlssort(res.unit_name, 'nls_sort=Vietnamese') nulls first,
                    nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                    nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese'),
                    res.pol_issue_date desc;
           elsif var_branch_id = 0 then
                open row_records for
                select /*+ CARDINALITY(res, 100)
                    */
                    res.company_name,
                    res.office_ams_id,
                    res.office_name,
                    res.agency_ams_id,
                    res.agency_name,
                    res.unit_ams_id,
                    res.unit_name,
                    res.outlet_id,
                    res.outlet_ams_id,
                    res.outlet_name,
                    res.position_name,
                    to_char(res.position_date, 'DD/MM/YYYY') position_date,
                    to_char(res.effective_date, 'DD/MM/YYYY') effective_date,
                    to_char(res.terminative_date, 'DD/MM/YYYY') terminative_date,
                    res.account_number,
                    to_char(res.pol_effective_date, 'DD/MM/YYYY') pol_effective_date,
                    to_char(res.pol_issue_date, 'DD/MM/YYYY') pol_issue_date,
                    to_char(res.pol_of_date, 'DD/MM/YYYY') pol_of_date,
                    ceil(months_between(var_record_date,res.pol_effective_date)/12) pol_real_year, -- Nam thuc te cua hop dong
                    res.freq_per_annum_name freq_per_annum,
                    /*res.risk_term,
                    to_char(res.term_from_date, 'DD/MM/YYYY') term_from_date,
                    to_char(res.term_to_date, 'DD/MM/YYYY') term_to_date,     */
                    res.init_premium,
                    res.freq_premium,
                    res.lsum_premium,
                    res.afyp,
                    res.pol_status_name status,
                    res.commission_status_name,
                    res.holder_name,
                    res.insured_name,
                    res.holder_address,
                    res.init_outlet_ams_id,
                    res.source_of_data
                from ams.la_mana_policy_repo res
                where res.record_date = var_record_date
                    and
                    (
                       nvl(valOption, 2) = 2  --ca 2 nguon
                       or ( valOption = 0 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                       or ( valOption = 1 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                    )
                order by
                    nlssort(res.company_name, 'nls_sort=Vietnamese'),
                    nlssort(res.office_name, 'nls_sort=Vietnamese') nulls first,
                    nlssort(res.agency_name, 'nls_sort=Vietnamese') nulls first,
                    nlssort(res.unit_name, 'nls_sort=Vietnamese') nulls first,
                    nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                    nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese'),
                    res.pol_issue_date desc;
            end if;

/*        --neu ma ho tra cuu trong vong 7 ngay gan nhat thi lay so lieu tu cac cai da co roi
        if var_record_date between var_delete_from_date and var_current_date then
            if var_agent_id <> 0 then
                open row_records for
                select \*+ CARDINALITY(res, 100)
                    *\
                    res.company_name,
                    res.office_ams_id,
                    res.office_name,
                    res.agency_ams_id,
                    res.agency_name,
                    res.unit_ams_id,
                    res.unit_name,
                    res.outlet_id,
                    res.outlet_ams_id,
                    res.outlet_name,
                    res.position_name,
                    to_char(res.position_date, 'DD/MM/YYYY') position_date,
                    to_char(res.effective_date, 'DD/MM/YYYY') effective_date,
                    to_char(res.terminative_date, 'DD/MM/YYYY') terminative_date,
                    res.account_number,
                    to_char(res.pol_effective_date, 'DD/MM/YYYY') pol_effective_date,
                    to_char(res.pol_issue_date, 'DD/MM/YYYY') pol_issue_date,
                    to_char(res.pol_of_date, 'DD/MM/YYYY') pol_of_date,
                    res.freq_per_annum,\*
                    res.risk_term,
                    to_char(res.term_from_date, 'DD/MM/YYYY') term_from_date,
                    to_char(res.term_to_date, 'DD/MM/YYYY') term_to_date,*\
                    res.init_premium,
                    res.freq_premium,
                    res.lsum_premium,
                    res.afyp,
                    res.pol_status_name,
                    res.commission_status_name,
                    res.holder_name,
                    res.insured_name,
                    res.holder_address,
                    res.source_of_data
                from ams.la_mana_policy_repo res
                where res.record_date = var_record_date
                    and
                    (
                       nvl(valOption, 2) = 2  --ca 2 nguon
                       or ( valOption = 0 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                       or ( valOption = 1 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                    )
                    and res.outlet_id = var_agent_id
                order by
                    nlssort(res.company_name, 'nls_sort=Vietnamese'),
                    nlssort(res.office_name, 'nls_sort=Vietnamese') nulls first,
                    nlssort(res.agency_name, 'nls_sort=Vietnamese') nulls first,
                    nlssort(res.unit_name, 'nls_sort=Vietnamese') nulls first,
                    nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                    nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese'),
                    res.pol_issue_date desc;
           elsif var_branch_id <> 0 then
                open row_records for
                select \*+ CARDINALITY(res, 100)
                    *\
                    res.company_name,
                    res.office_ams_id,
                    res.office_name,
                    res.agency_ams_id,
                    res.agency_name,
                    res.unit_ams_id,
                    res.unit_name,
                    res.outlet_id,
                    res.outlet_ams_id,
                    res.outlet_name,
                    res.position_name,
                    to_char(res.position_date, 'DD/MM/YYYY') position_date,
                    to_char(res.effective_date, 'DD/MM/YYYY') effective_date,
                    to_char(res.terminative_date, 'DD/MM/YYYY') terminative_date,
                    res.account_number,
                    to_char(res.pol_effective_date, 'DD/MM/YYYY') pol_effective_date,
                    to_char(res.pol_issue_date, 'DD/MM/YYYY') pol_issue_date,
                    to_char(res.pol_of_date, 'DD/MM/YYYY') pol_of_date,
                    res.freq_per_annum,
                    \*res.risk_term,
                    to_char(res.term_from_date, 'DD/MM/YYYY') term_from_date,
                    to_char(res.term_to_date, 'DD/MM/YYYY') term_to_date,   *\
                    res.init_premium,
                    res.freq_premium,
                    res.lsum_premium,
                    res.afyp,
                    res.pol_status_name,
                    res.commission_status_name,
                    res.holder_name,
                    res.insured_name,
                    res.holder_address,
                    res.source_of_data
                from ams.la_mana_policy_repo res
                where res.record_date = var_record_date
                    and
                    (
                       nvl(valOption, 2) = 2  --ca 2 nguon
                       or ( valOption = 0 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                       or ( valOption = 1 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                    )
                    and var_branch_id in
                    (
                        res.company_id,
                        res.office_id,
                        res.agency_id,
                        res.unit_id
                    )
                order by
                    nlssort(res.company_name, 'nls_sort=Vietnamese'),
                    nlssort(res.office_name, 'nls_sort=Vietnamese') nulls first,
                    nlssort(res.agency_name, 'nls_sort=Vietnamese') nulls first,
                    nlssort(res.unit_name, 'nls_sort=Vietnamese') nulls first,
                    nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                    nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese'),
                    res.pol_issue_date desc;
           elsif var_branch_id = 0 then
                open row_records for
                select \*+ CARDINALITY(res, 100)
                    *\
                    res.company_name,
                    res.office_ams_id,
                    res.office_name,
                    res.agency_ams_id,
                    res.agency_name,
                    res.unit_ams_id,
                    res.unit_name,
                    res.outlet_id,
                    res.outlet_ams_id,
                    res.outlet_name,
                    res.position_name,
                    to_char(res.position_date, 'DD/MM/YYYY') position_date,
                    to_char(res.effective_date, 'DD/MM/YYYY') effective_date,
                    to_char(res.terminative_date, 'DD/MM/YYYY') terminative_date,
                    res.account_number,
                    to_char(res.pol_effective_date, 'DD/MM/YYYY') pol_effective_date,
                    to_char(res.pol_issue_date, 'DD/MM/YYYY') pol_issue_date,
                    to_char(res.pol_of_date, 'DD/MM/YYYY') pol_of_date,
                    res.freq_per_annum,
                    \*res.risk_term,
                    to_char(res.term_from_date, 'DD/MM/YYYY') term_from_date,
                    to_char(res.term_to_date, 'DD/MM/YYYY') term_to_date,     *\
                    res.init_premium,
                    res.freq_premium,
                    res.lsum_premium,
                    res.afyp,
                    res.pol_status_name,
                    res.commission_status_name,
                    res.holder_name,
                    res.insured_name,
                    res.holder_address,
                    res.source_of_data
                from ams.la_mana_policy_repo res
                where res.record_date = var_record_date
                    and
                    (
                       nvl(valOption, 2) = 2  --ca 2 nguon
                       or ( valOption = 0 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                       or ( valOption = 1 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                    )
                order by
                    nlssort(res.company_name, 'nls_sort=Vietnamese'),
                    nlssort(res.office_name, 'nls_sort=Vietnamese') nulls first,
                    nlssort(res.agency_name, 'nls_sort=Vietnamese') nulls first,
                    nlssort(res.unit_name, 'nls_sort=Vietnamese') nulls first,
                    nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                    nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese'),
                    res.pol_issue_date desc;
            end if;
        else
            --phai cho phep thi moi co the duoc thuc hien
            if AMS_CORE_MODULE.is_active('POL_MANA_QUERY', (trunc(sysdate, 'DD') - 1))
                    = AMS_CORE_MODULE.IS_YES then
                --neu khong nam trong ngay thang day thi se can phai tao moi so lieu da co do vao
                --voi cai session da co cho no roi hien thi theo cai session da co day len
                if var_agent_id <> 0 then
                    --neu khong nam trong ngay thang day thi se can phai tao moi so lieu da co do vao
                    --voi cai session da co cho no roi hien thi theo cai session da co day len
                    insert \*+ APPEND *\ into ams.la_mana_policy_repo_tmp nologging
                    select \*+ CARDINALITY(tmp, 100)*\
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.type_code,
                        var_record_date, --bao cao la_mana_policy_repo nay phai dua du lieu theo ngay nay
                        tmp.version_date,
                        tmp.status_code,
                        tmp.source_of_data,
                        tmp.outlet_name,
                        tmp.company_id,
                        tmp.company_bvl_id,
                        tmp.company_ams_id,
                        tmp.company_name,
                        tmp.office_id,
                        tmp.office_ams_id,
                        tmp.office_name,
                        tmp.agency_id,
                        tmp.agency_ams_id,
                        tmp.agency_name,
                        tmp.unit_id,
                        tmp.unit_ams_id,
                        tmp.unit_name,
                        tmp.position_code,
                        tmp.position_date,
                        tmp.position_name,
                        tmp.effective_date,
                        tmp.terminative_date,
                        tmp.account_number,
                        tmp.pol_effective_date,
                        tmp.pol_issue_date,
                        tmp.pol_of_date,
                        null,
                        null,
                        tmp.freq_per_annum,
                        null,
                        tmp.commission_status_name,
                        \*tmp.risk_term,
                        tmp.term_from_date,
                        tmp.term_to_date,   *\
                        tmp.init_premium,
                        tmp.freq_premium,
                        tmp.lsum_premium,
                        tmp.afyp,
                        null,
                        null,
                        tmp.pol_status_name,
                        tmp.holder_name,
                        tmp.insured_name,
                        tmp.holder_address,
                        valSessionId,
                        ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                        ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                        sysdate,
                        sysdate
                    from ams.la_mana_policy tmp
                    where tmp.record_date = var_record_month
                        and
                        (
                           nvl(valOption, 2) = 2  --ca 2 nguon
                           or ( valOption = 0 and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                           or ( valOption = 1 and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                        )
                        and tmp.outlet_id = var_agent_id
                        and tmp.pol_of_date is null; --lay cac danh sach hop dong con hieu luc tinh den cuoi thang
                    commit;

                    ams.life_agency_log.time_end;
                    ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_MANA_POLICY.tal_get_policy', 'do vao bang la_mana_policy_repo ' || to_char(var_record_date, 'DD/MM/YYYY'));
                    ams.life_agency_log.time_stop;
                    ams.life_agency_log.time_begin;

                    --lay cac danh sach hop dong  het hieu luc sau ngay da dua vao nhu vay
                    insert \*+ APPEND *\ into ams.la_mana_policy_repo_tmp nologging
                    select \*+ CARDINALITY(tmp, 100)*\
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.type_code,
                        var_record_date, --bao cao la_mana_policy_repo nay phai dua du lieu theo ngay nay
                        tmp.version_date,
                        tmp.status_code,
                        tmp.source_of_data,
                        tmp.outlet_name,
                        tmp.company_id,
                        tmp.company_bvl_id,
                        tmp.company_ams_id,
                        tmp.company_name,
                        tmp.office_id,
                        tmp.office_ams_id,
                        tmp.office_name,
                        tmp.agency_id,
                        tmp.agency_ams_id,
                        tmp.agency_name,
                        tmp.unit_id,
                        tmp.unit_ams_id,
                        tmp.unit_name,
                        tmp.position_code,
                        tmp.position_date,
                        tmp.position_name,
                        tmp.effective_date,
                        tmp.terminative_date,
                        tmp.account_number,
                        tmp.pol_effective_date,
                        tmp.pol_issue_date,
                        tmp.pol_of_date,
                        null,
                        null,
                        tmp.freq_per_annum,
                        null,
                        tmp.commission_status_name,
                        \*tmp.risk_term,
                        tmp.term_from_date,
                        tmp.term_to_date,   *\
                        tmp.init_premium,
                        tmp.freq_premium,
                        tmp.lsum_premium,
                        tmp.afyp,
                        null,
                        null,
                        tmp.pol_status_name,
                        tmp.holder_name,
                        tmp.insured_name,
                        tmp.holder_address,
                        valSessionId,
                        ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                        ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                        sysdate,
                        sysdate
                    from ams.la_mana_policy tmp
                    where tmp.record_date = var_record_month
                        and
                        (
                           nvl(valOption, 2) = 2  --ca 2 nguon
                           or ( valOption = 0 and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                           or ( valOption = 1 and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                        )
                        and tmp.outlet_id = var_agent_id
                        --lay cac danh sach hop dong huy sau ngay day thi ra duoc cac hop dong con hieu luc
                        and nvl(tmp.pol_of_date, ams.LIFE_AGENCY_MANA_POLICY.DATE_MIN_VALUE) > var_record_date;
                    commit;

                    ams.life_agency_log.time_end;
                    ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_MANA_POLICY.tal_get_policy', 'do vao bang la_mana_policy_repo het hieu luc ' || to_char(var_record_date, 'DD/MM/YYYY'));
                    ams.life_agency_log.time_stop;
                    ams.life_agency_log.time_begin;

                    --sau do thi se hien thi du lieu ra cho nguoi su dung xem
                    open row_records for
                    select \*+ CARDINALITY(res, 100)
                        *\
                        res.company_name,
                        res.office_ams_id,
                        res.office_name,
                        res.agency_ams_id,
                        res.agency_name,
                        res.unit_ams_id,
                        res.unit_name,
                        res.outlet_id,
                        res.outlet_ams_id,
                        res.outlet_name,
                        res.position_name,
                        to_char(res.position_date, 'DD/MM/YYYY') position_date,
                        to_char(res.effective_date, 'DD/MM/YYYY') effective_date,
                        to_char(res.terminative_date, 'DD/MM/YYYY') terminative_date,
                        res.account_number,
                        to_char(res.pol_effective_date, 'DD/MM/YYYY') pol_effective_date,
                        to_char(res.pol_issue_date, 'DD/MM/YYYY') pol_issue_date,
                        to_char(res.pol_of_date, 'DD/MM/YYYY') pol_of_date,
                        res.freq_per_annum,
                        res.commission_status_name,
                       \* res.risk_term,
                        to_char(res.term_from_date, 'DD/MM/YYYY') term_from_date,
                        to_char(res.term_to_date, 'DD/MM/YYYY') term_to_date,  *\
                        res.init_premium,
                        res.freq_premium,
                        res.lsum_premium,
                        res.afyp,
                        res.pol_status_name,
                        res.holder_name,
                        res.insured_name,
                        res.holder_address,
                        res.source_of_data
                    from ams.la_mana_policy_repo_tmp res
                    where res.session_id = valSessionId
                        and res.outlet_id = var_agent_id
                    order by
                        nlssort(res.company_name, 'nls_sort=Vietnamese'),
                        nlssort(res.office_name, 'nls_sort=Vietnamese') nulls first,
                        nlssort(res.agency_name, 'nls_sort=Vietnamese') nulls first,
                        nlssort(res.unit_name, 'nls_sort=Vietnamese') nulls first,
                        nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                        nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese'),
                        res.pol_issue_date desc;
                    ams.life_agency_log.time_end;
                    ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_MANA_POLICY.tal_get_policy', 'open cursor  ' || to_char(var_record_date, 'DD/MM/YYYY'));
               elsif var_branch_id <> 0 then
                    --neu khong nam trong ngay thang day thi se can phai tao moi so lieu da co do vao
                    --voi cai session da co cho no roi hien thi theo cai session da co day len
                    insert \*+ APPEND *\ into ams.la_mana_policy_repo_tmp nologging
                    select \*+ CARDINALITY(tmp, 100)*\
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.type_code,
                        var_record_date, --bao cao la_mana_policy_repo nay phai dua du lieu theo ngay nay
                        tmp.version_date,
                        tmp.status_code,
                        tmp.source_of_data,
                        tmp.outlet_name,
                        tmp.company_id,
                        tmp.company_bvl_id,
                        tmp.company_ams_id,
                        tmp.company_name,
                        tmp.office_id,
                        tmp.office_ams_id,
                        tmp.office_name,
                        tmp.agency_id,
                        tmp.agency_ams_id,
                        tmp.agency_name,
                        tmp.unit_id,
                        tmp.unit_ams_id,
                        tmp.unit_name,
                        tmp.position_code,
                        tmp.position_date,
                        tmp.position_name,
                        tmp.effective_date,
                        tmp.terminative_date,
                        tmp.account_number,
                        tmp.pol_effective_date,
                        tmp.pol_issue_date,
                        tmp.pol_of_date,
                        null,
                        null,
                        tmp.freq_per_annum,
                        null,
                        tmp.commission_status_name,
                        \*tmp.risk_term,
                        tmp.term_from_date,
                        tmp.term_to_date,   *\
                        tmp.init_premium,
                        tmp.freq_premium,
                        tmp.lsum_premium,
                        tmp.afyp,
                        null,
                        null,
                        tmp.pol_status_name,
                        tmp.holder_name,
                        tmp.insured_name,
                        tmp.holder_address,
                        valSessionId,
                        ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                        ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                        sysdate,
                        sysdate
                    from ams.la_mana_policy tmp
                    --lay trong thang day
                    where tmp.record_date = var_record_month
                        and
                        (
                           nvl(valOption, 2) = 2  --ca 2 nguon
                           or ( valOption = 0 and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                           or ( valOption = 1 and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                        )
                        and var_branch_id in
                        (
                            tmp.company_id,
                            tmp.office_id,
                            tmp.agency_id,
                            tmp.unit_id
                        )
                        and tmp.pol_of_date is null; --lay cac danh sach hop dong con hieu luc tinh den cuoi thang
                    commit;

                    ams.life_agency_log.time_end;
                    ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_MANA_POLICY.tal_get_policy', 'do vao bang la_mana_policy_repo  : ' || to_char(var_record_date, 'DD/MM/YYYY'));
                    ams.life_agency_log.time_stop;
                    ams.life_agency_log.time_begin;

                    --lay cac danh sach hop dong  het hieu luc sau ngay da dua vao nhu vay
                    insert \*+ APPEND *\ into ams.la_mana_policy_repo_tmp nologging
                    select \*+ CARDINALITY(tmp, 100)*\
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.type_code,
                        var_record_date, --bao cao la_mana_policy_repo nay phai dua du lieu theo ngay nay
                        tmp.version_date,
                        tmp.status_code,
                        tmp.source_of_data,
                        tmp.outlet_name,
                        tmp.company_id,
                        tmp.company_bvl_id,
                        tmp.company_ams_id,
                        tmp.company_name,
                        tmp.office_id,
                        tmp.office_ams_id,
                        tmp.office_name,
                        tmp.agency_id,
                        tmp.agency_ams_id,
                        tmp.agency_name,
                        tmp.unit_id,
                        tmp.unit_ams_id,
                        tmp.unit_name,
                        tmp.position_code,
                        tmp.position_date,
                        tmp.position_name,
                        tmp.effective_date,
                        tmp.terminative_date,
                        tmp.account_number,
                        tmp.pol_effective_date,
                        tmp.pol_issue_date,
                        tmp.pol_of_date,
                        null,
                        null,
                        tmp.freq_per_annum,
                        null,
                        tmp.commission_status_name,
                        \*tmp.risk_term,
                        tmp.term_from_date,
                        tmp.term_to_date,   *\
                        tmp.init_premium,
                        tmp.freq_premium,
                        tmp.lsum_premium,
                        tmp.afyp,
                        null,
                        null,
                        tmp.pol_status_name,
                        tmp.holder_name,
                        tmp.insured_name,
                        tmp.holder_address,
                        valSessionId,
                        ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                        ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                        sysdate,
                        sysdate
                    from ams.la_mana_policy tmp
                    where tmp.record_date = var_record_month
                        and
                        (
                           nvl(valOption, 2) = 2  --ca 2 nguon
                           or ( valOption = 0 and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                           or ( valOption = 1 and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                        )
                        and var_branch_id in
                        (
                            tmp.company_id,
                            tmp.office_id,
                            tmp.agency_id,
                            tmp.unit_id
                        )
                        --lay cac danh sach hop dong huy sau ngay day thi ra duoc cac hop dong con hieu luc
                        and nvl(tmp.pol_of_date, ams.LIFE_AGENCY_MANA_POLICY.DATE_MIN_VALUE) > var_record_date;
                    commit;

                    ams.life_agency_log.time_end;
                    ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_MANA_POLICY.tal_get_policy', 'do vao bang la_mana_policy_repo het hieu luc ' || to_char(var_record_date, 'DD/MM/YYYY'));
                    ams.life_agency_log.time_stop;
                    ams.life_agency_log.time_begin;

                    --sau do thi se hien thi du lieu ra cho nguoi su dung xem
                    open row_records for
                    select \*+ CARDINALITY(res, 100)
                        *\
                        res.company_name,
                        res.office_ams_id,
                        res.office_name,
                        res.agency_ams_id,
                        res.agency_name,
                        res.unit_ams_id,
                        res.unit_name,
                        res.outlet_id,
                        res.outlet_ams_id,
                        res.outlet_name,
                        res.position_name,
                        to_char(res.position_date, 'DD/MM/YYYY') position_date,
                        to_char(res.effective_date, 'DD/MM/YYYY') effective_date,
                        to_char(res.terminative_date, 'DD/MM/YYYY') terminative_date,
                        res.account_number,
                        to_char(res.pol_effective_date, 'DD/MM/YYYY') pol_effective_date,
                        to_char(res.pol_issue_date, 'DD/MM/YYYY') pol_issue_date,
                        to_char(res.pol_of_date, 'DD/MM/YYYY') pol_of_date,
                        res.freq_per_annum,
                        res.commission_status_name,
                        \*res.risk_term,
                        to_char(res.term_from_date, 'DD/MM/YYYY') term_from_date,
                        to_char(res.term_to_date, 'DD/MM/YYYY') term_to_date,   *\
                        res.init_premium,
                        res.freq_premium,
                        res.lsum_premium,
                        res.afyp,
                        res.pol_status_name,
                        res.holder_name,
                        res.insured_name,
                        res.holder_address,
                        res.source_of_data
                    from ams.la_mana_policy_repo_tmp res
                    where res.session_id = valSessionId
                        and var_branch_id in
                        (
                            res.company_id,
                            res.office_id,
                            res.agency_id,
                            res.unit_id
                        )
                    order by
                        nlssort(res.company_name, 'nls_sort=Vietnamese'),
                        nlssort(res.office_name, 'nls_sort=Vietnamese') nulls first,
                        nlssort(res.agency_name, 'nls_sort=Vietnamese') nulls first,
                        nlssort(res.unit_name, 'nls_sort=Vietnamese') nulls first,
                        nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                        nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese'),
                        res.pol_issue_date desc;
                    ams.life_agency_log.time_end;
                    ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_MANA_POLICY.tal_get_policy', 'open cursor  ' || to_char(var_record_date, 'DD/MM/YYYY'));
            else --lay cho toan bo cac cong ty
                    --neu khong nam trong ngay thang day thi se can phai tao moi so lieu da co do vao
                    --voi cai session da co cho no roi hien thi theo cai session da co day len
                    insert \*+ APPEND *\ into ams.la_mana_policy_repo_tmp nologging
                    select \*+ CARDINALITY(tmp, 100)*\
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.type_code,
                        var_record_date, --bao cao la_mana_policy_repo nay phai dua du lieu theo ngay nay
                        tmp.version_date,
                        tmp.status_code,
                        tmp.source_of_data,
                        tmp.outlet_name,
                        tmp.company_id,
                        tmp.company_bvl_id,
                        tmp.company_ams_id,
                        tmp.company_name,
                        tmp.office_id,
                        tmp.office_ams_id,
                        tmp.office_name,
                        tmp.agency_id,
                        tmp.agency_ams_id,
                        tmp.agency_name,
                        tmp.unit_id,
                        tmp.unit_ams_id,
                        tmp.unit_name,
                        tmp.position_code,
                        tmp.position_date,
                        tmp.position_name,
                        tmp.effective_date,
                        tmp.terminative_date,
                        tmp.account_number,
                        tmp.pol_effective_date,
                        tmp.pol_issue_date,
                        tmp.pol_of_date,
                        null,
                        null,
                        tmp.freq_per_annum,
                        null,
                        tmp.commission_status_name,
                        \*tmp.risk_term,
                        tmp.term_from_date,
                        tmp.term_to_date,   *\
                        tmp.init_premium,
                        tmp.freq_premium,
                        tmp.lsum_premium,
                        tmp.afyp,
                        null,
                        null,
                        tmp.pol_status_name,
                        tmp.holder_name,
                        tmp.insured_name,
                        tmp.holder_address,
                        valSessionId,
                        ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                        ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                        sysdate,
                        sysdate
                    from ams.la_mana_policy tmp
                    where tmp.record_date = var_record_month
                        and
                        (
                           nvl(valOption, 2) = 2  --ca 2 nguon
                           or ( valOption = 0 and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                           or ( valOption = 1 and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                        )
                        and tmp.pol_of_date is null; --lay cac danh sach hop dong con hieu luc tinh den cuoi thang
                    commit;

                    ams.life_agency_log.time_end;
                    ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_MANA_POLICY.tal_get_policy', 'do vao bang la_mana_policy_repo ' || to_char(var_record_date, 'DD/MM/YYYY'));
                    ams.life_agency_log.time_stop;
                    ams.life_agency_log.time_begin;

                    --lay cac danh sach hop dong  het hieu luc sau ngay da dua vao nhu vay
                    insert \*+ APPEND *\ into ams.la_mana_policy_repo_tmp nologging
                    select \*+ CARDINALITY(tmp, 100)*\
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.type_code,
                        var_record_date, --bao cao la_mana_policy_repo nay phai dua du lieu theo ngay nay
                        tmp.version_date,
                        tmp.status_code,
                        tmp.source_of_data,
                        tmp.outlet_name,
                        tmp.company_id,
                        tmp.company_bvl_id,
                        tmp.company_ams_id,
                        tmp.company_name,
                        tmp.office_id,
                        tmp.office_ams_id,
                        tmp.office_name,
                        tmp.agency_id,
                        tmp.agency_ams_id,
                        tmp.agency_name,
                        tmp.unit_id,
                        tmp.unit_ams_id,
                        tmp.unit_name,
                        tmp.position_code,
                        tmp.position_date,
                        tmp.position_name,
                        tmp.effective_date,
                        tmp.terminative_date,
                        tmp.account_number,
                        tmp.pol_effective_date,
                        tmp.pol_issue_date,
                        tmp.pol_of_date,
                        null,
                        null,
                        tmp.freq_per_annum,
                        null,
                        tmp.commission_status_name,
                        \*tmp.risk_term,
                        tmp.term_from_date,
                        tmp.term_to_date,   *\
                        tmp.init_premium,
                        tmp.freq_premium,
                        tmp.lsum_premium,
                        tmp.afyp,
                        null,
                        null,
                        tmp.pol_status_name,
                        tmp.holder_name,
                        tmp.insured_name,
                        tmp.holder_address,
                        valSessionId,
                        ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                        ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                        sysdate,
                        sysdate
                    from ams.la_mana_policy tmp
                    where tmp.record_date = var_record_month
                        and
                        (
                           nvl(valOption, 2) = 2  --ca 2 nguon
                           or ( valOption = 0 and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                           or ( valOption = 1 and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                        )
                        --lay cac danh sach hop dong huy sau ngay day thi ra duoc cac hop dong con hieu luc
                        and nvl(tmp.pol_of_date, ams.LIFE_AGENCY_MANA_POLICY.DATE_MIN_VALUE) > var_record_date;
                    commit;

                    ams.life_agency_log.time_end;
                    ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_MANA_POLICY.tal_get_policy', 'do vao bang la_mana_policy_repo het hieu luc ' || to_char(var_record_date, 'DD/MM/YYYY'));
                    ams.life_agency_log.time_stop;
                    ams.life_agency_log.time_begin;

                    --sau do thi se hien thi du lieu ra cho nguoi su dung xem
                    open row_records for
                    select \*+ CARDINALITY(res, 100)
                        *\
                        res.company_name,
                        res.office_ams_id,
                        res.office_name,
                        res.agency_ams_id,
                        res.agency_name,
                        res.unit_ams_id,
                        res.unit_name,
                        res.outlet_id,
                        res.outlet_ams_id,
                        res.outlet_name,
                        res.position_name,
                        to_char(res.position_date, 'DD/MM/YYYY') position_date,
                        to_char(res.effective_date, 'DD/MM/YYYY') effective_date,
                        to_char(res.terminative_date, 'DD/MM/YYYY') terminative_date,
                        res.account_number,
                        to_char(res.pol_effective_date, 'DD/MM/YYYY') pol_effective_date,
                        to_char(res.pol_issue_date, 'DD/MM/YYYY') pol_issue_date,
                        to_char(res.pol_of_date, 'DD/MM/YYYY') pol_of_date,
                        res.freq_per_annum,
                        res.commission_status_name,
                        \*res.risk_term,
                        to_char(res.term_from_date, 'DD/MM/YYYY') term_from_date,
                        to_char(res.term_to_date, 'DD/MM/YYYY') term_to_date,       *\
                        res.init_premium,
                        res.freq_premium,
                        res.lsum_premium,
                        res.afyp,
                        res.pol_status_name,
                        res.holder_name,
                        res.insured_name,
                        res.holder_address,
                        res.source_of_data
                    from ams.la_mana_policy_repo_tmp res
                    where res.session_id = valSessionId
                    order by
                        nlssort(res.company_name, 'nls_sort=Vietnamese'),
                        nlssort(res.office_name, 'nls_sort=Vietnamese') nulls first,
                        nlssort(res.agency_name, 'nls_sort=Vietnamese') nulls first,
                        nlssort(res.unit_name, 'nls_sort=Vietnamese') nulls first,
                        nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                        nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese'),
                        res.pol_issue_date desc;
                    ams.life_agency_log.time_end;
                    ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_MANA_POLICY.tal_get_policy', 'open cursor  ' || to_char(var_record_date, 'DD/MM/YYYY'));
                 end if;
            end if;
            var_run_end_time := sysdate;
            ams.life_agency_log.time_log(1001, 'Thoi gian lay bao cao hop dong quan ly chi tiet', var_run_begin_time, var_run_end_time);
        end if;
               */
    end;

    /*chinhlk option 0: BVL    1: TAL   2: ca 2*/
    procedure get_mana_pol_02(valRecordDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        valOption number := null,
        valSessionId number := null,
        row_records out sys_refcursor)
    is
        var_record_date date := trunc(valRecordDate, 'DD');
        var_record_month date := trunc(valRecordDate, 'MM'); --thang day la thang nao cua no de lay neu k lay dc theo ngay
        var_branch_id number(10) := nvl(valBranchID, 0);
        var_agent_id number(10) := nvl(valAgentID, 0);
        var_run_begin_time date := sysdate;
        var_run_end_time date := sysdate;
    begin
        --neu ma ho tra cuu trong vong 7 ngay gan nhat thi lay so lieu tu cac cai da co roi
        if var_agent_id <> 0 then
            open row_records for
            select /*+ CARDINALITY(repo, 100) CARDINALITY(bvl, 100) CARDINALITY(ods, 100)
                */
                repo.company_name,
                repo.office_ams_id,
                repo.office_name,
                repo.agency_ams_id,
                repo.agency_name,
                repo.unit_ams_id,
                repo.unit_name,
                repo.outlet_id,
                repo.outlet_ams_id,
                repo.outlet_name,
                repo.position_name,
                repo.effective_date,
                repo.terminative_date,
                bvl.account_qty bvl_account_qty,
                bvl.init_premium bvl_init_premium,
                bvl.freq_premium bvl_freq_premium,
                bvl.lsum_premium bvl_lsum_premium,
                bvl.afyp bvl_afyp,
                ods.account_qty ods_account_qty,
                ods.init_premium ods_init_premium,
                ods.freq_premium ods_freq_premium,
                ods.lsum_premium ods_lsum_premium,
                ods.afyp ods_afyp,
                repo.account_qty,
                repo.init_premium,
                repo.freq_premium,
                repo.lsum_premium,
                repo.afyp
            from
            (
                select /*+ CARDINALITY(res, 100)
                    */
                    max(res.company_name) company_name,
                    max(res.office_ams_id) office_ams_id,
                    max(res.office_name) office_name,
                    max(res.agency_ams_id) agency_ams_id,
                    max(res.agency_name) agency_name,
                    max(res.unit_ams_id) unit_ams_id,
                    max(res.unit_name) unit_name,
                    max(res.outlet_id) outlet_id,
                    res.outlet_ams_id,
                    max(res.outlet_name) outlet_name,
                    max(res.position_name) position_name,
                    max(to_char(res.effective_date, 'DD/MM/YYYY')) effective_date,
                    max(to_char(res.terminative_date, 'DD/MM/YYYY')) terminative_date,
                    nvl(count(res.account_number), 0) account_qty,
                    sum(nvl(res.init_premium, 0)) init_premium,
                    sum(nvl(res.freq_premium, 0)) freq_premium,
                    sum(nvl(res.lsum_premium, 0)) lsum_premium,
                    sum(nvl(res.afyp, 0)) afyp
                from ams.la_mana_policy_repo res
                where res.record_date = var_record_date
                    and
                    (
                       nvl(valOption, 2) = 2  --ca 2 nguon
                       or ( valOption = 0 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                       or ( valOption = 1 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                    )
                    and res.outlet_id = var_agent_id
                group by res.outlet_ams_id
            ) repo
            left join
            (
                select /*+ CARDINALITY(res, 100)
                    */
                    res.outlet_ams_id,
                    nvl(count(res.account_number), 0) account_qty,
                    sum(nvl(res.init_premium, 0)) init_premium,
                    sum(nvl(res.freq_premium, 0)) freq_premium,
                    sum(nvl(res.lsum_premium, 0)) lsum_premium,
                    sum(nvl(res.afyp, 0)) afyp
                from ams.la_mana_policy_repo res
                where res.record_date = var_record_date
                    and res.source_of_data = ams.LIFE_AGENCY_INVOICE_REPORT.SYSTEM_REFER_BVLIFE
                    and
                    (
                       nvl(valOption, 2) = 2  --ca 2 nguon
                       or ( valOption = 0 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                       or ( valOption = 1 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                    )
                    and res.outlet_id = var_agent_id
                group by res.outlet_ams_id
            ) bvl
                on bvl.outlet_ams_id = repo.outlet_ams_id
            left join
            (
                select /*+ CARDINALITY(res, 100)
                    */
                    res.outlet_ams_id,
                    nvl(count(res.account_number), 0) account_qty,
                    sum(nvl(res.init_premium, 0)) init_premium,
                    sum(nvl(res.freq_premium, 0)) freq_premium,
                    sum(nvl(res.lsum_premium, 0)) lsum_premium,
                    sum(nvl(res.afyp, 0)) afyp
                from ams.la_mana_policy_repo res
                where res.record_date = var_record_date
                    and res.source_of_data = ams.LIFE_AGENCY_INVOICE_REPORT.SYSTEM_REFER_TALISMAN
                    and
                    (
                       nvl(valOption, 2) = 2  --ca 2 nguon
                       or ( valOption = 0 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                       or ( valOption = 1 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                    )
                    and res.outlet_id = var_agent_id
                group by res.outlet_ams_id
            ) ods
                on ods.outlet_ams_id = repo.outlet_ams_id
            order by
                nlssort(repo.company_name, 'nls_sort=Vietnamese'),
                nlssort(repo.office_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(repo.agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(repo.unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(repo.outlet_name, 'nls_sort=Vietnamese'),
                nlssort(repo.outlet_ams_id, 'nls_sort=Vietnamese');
       elsif var_branch_id <> 0 then
            open row_records for
            select /*+ CARDINALITY(repo, 100) CARDINALITY(bvl, 100) CARDINALITY(ods, 100)
                */
                repo.company_name,
                repo.office_ams_id,
                repo.office_name,
                repo.agency_ams_id,
                repo.agency_name,
                repo.unit_ams_id,
                repo.unit_name,
                repo.outlet_id,
                repo.outlet_ams_id,
                repo.outlet_name,
                repo.position_name,
                repo.effective_date,
                repo.terminative_date,
                bvl.account_qty bvl_account_qty,
                bvl.init_premium bvl_init_premium,
                bvl.freq_premium bvl_freq_premium,
                bvl.lsum_premium bvl_lsum_premium,
                bvl.afyp bvl_afyp,
                ods.account_qty ods_account_qty,
                ods.init_premium ods_init_premium,
                ods.freq_premium ods_freq_premium,
                ods.lsum_premium ods_lsum_premium,
                ods.afyp ods_afyp,
                repo.account_qty,
                repo.init_premium,
                repo.freq_premium,
                repo.lsum_premium,
                repo.afyp
            from
            (
                select /*+ CARDINALITY(res, 100)
                    */
                    max(res.company_name) company_name,
                    max(res.office_ams_id) office_ams_id,
                    max(res.office_name) office_name,
                    max(res.agency_ams_id) agency_ams_id,
                    max(res.agency_name) agency_name,
                    max(res.unit_ams_id) unit_ams_id,
                    max(res.unit_name) unit_name,
                    max(res.outlet_id) outlet_id,
                    res.outlet_ams_id,
                    max(res.outlet_name) outlet_name,
                    max(res.position_name) position_name,
                    max(to_char(res.effective_date, 'DD/MM/YYYY')) effective_date,
                    max(to_char(res.terminative_date, 'DD/MM/YYYY')) terminative_date,
                    nvl(count(res.account_number), 0) account_qty,
                    sum(nvl(res.init_premium, 0)) init_premium,
                    sum(nvl(res.freq_premium, 0)) freq_premium,
                    sum(nvl(res.lsum_premium, 0)) lsum_premium,
                    sum(nvl(res.afyp, 0)) afyp
                from ams.la_mana_policy_repo res
                where res.record_date = var_record_date
                    and
                    (
                       nvl(valOption, 2) = 2  --ca 2 nguon
                       or ( valOption = 0 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                       or ( valOption = 1 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                    )
                    and var_branch_id in
                    (
                        res.company_id,
                        res.office_id,
                        res.agency_id,
                        res.unit_id
                    )
                group by res.outlet_ams_id
            ) repo
            left join
            (
                select /*+ CARDINALITY(res, 100)
                    */
                    res.outlet_ams_id,
                    nvl(count(res.account_number), 0) account_qty,
                    sum(nvl(res.init_premium, 0)) init_premium,
                    sum(nvl(res.freq_premium, 0)) freq_premium,
                    sum(nvl(res.lsum_premium, 0)) lsum_premium,
                    sum(nvl(res.afyp, 0)) afyp
                from ams.la_mana_policy_repo res
                where res.record_date = var_record_date
                    and res.source_of_data = ams.LIFE_AGENCY_INVOICE_REPORT.SYSTEM_REFER_BVLIFE
                    and
                    (
                       nvl(valOption, 2) = 2  --ca 2 nguon
                       or ( valOption = 0 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                       or ( valOption = 1 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                    )
                    and var_branch_id in
                    (
                        res.company_id,
                        res.office_id,
                        res.agency_id,
                        res.unit_id
                    )
                group by res.outlet_ams_id
            ) bvl
                on bvl.outlet_ams_id = repo.outlet_ams_id
            left join
            (
                select /*+ CARDINALITY(res, 100)
                    */
                    res.outlet_ams_id,
                    nvl(count(res.account_number), 0) account_qty,
                    sum(nvl(res.init_premium, 0)) init_premium,
                    sum(nvl(res.freq_premium, 0)) freq_premium,
                    sum(nvl(res.lsum_premium, 0)) lsum_premium,
                    sum(nvl(res.afyp, 0)) afyp
                from ams.la_mana_policy_repo res
                where res.record_date = var_record_date
                    and res.source_of_data = ams.LIFE_AGENCY_INVOICE_REPORT.SYSTEM_REFER_TALISMAN
                    and
                    (
                       nvl(valOption, 2) = 2  --ca 2 nguon
                       or ( valOption = 0 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                       or ( valOption = 1 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                    )
                    and var_branch_id in
                    (
                        res.company_id,
                        res.office_id,
                        res.agency_id,
                        res.unit_id
                    )
                group by res.outlet_ams_id
            ) ods
                on ods.outlet_ams_id = repo.outlet_ams_id
            order by
                nlssort(repo.company_name, 'nls_sort=Vietnamese'),
                nlssort(repo.office_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(repo.agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(repo.unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(repo.outlet_name, 'nls_sort=Vietnamese'),
                nlssort(repo.outlet_ams_id, 'nls_sort=Vietnamese');
       elsif var_branch_id = 0 then
            open row_records for
            select /*+ CARDINALITY(repo, 100) CARDINALITY(bvl, 100) CARDINALITY(ods, 100)
                */
                repo.company_name,
                repo.office_ams_id,
                repo.office_name,
                repo.agency_ams_id,
                repo.agency_name,
                repo.unit_ams_id,
                repo.unit_name,
                repo.outlet_id,
                repo.outlet_ams_id,
                repo.outlet_name,
                repo.position_name,
                repo.effective_date,
                repo.terminative_date,
                bvl.account_qty bvl_account_qty,
                bvl.init_premium bvl_init_premium,
                bvl.freq_premium bvl_freq_premium,
                bvl.lsum_premium bvl_lsum_premium,
                bvl.afyp bvl_afyp,
                ods.account_qty ods_account_qty,
                ods.init_premium ods_init_premium,
                ods.freq_premium ods_freq_premium,
                ods.lsum_premium ods_lsum_premium,
                ods.afyp ods_afyp,
                repo.account_qty,
                repo.init_premium,
                repo.freq_premium,
                repo.lsum_premium,
                repo.afyp
            from
            (
                select /*+ CARDINALITY(res, 100)
                    */
                    max(res.company_name) company_name,
                    max(res.office_ams_id) office_ams_id,
                    max(res.office_name) office_name,
                    max(res.agency_ams_id) agency_ams_id,
                    max(res.agency_name) agency_name,
                    max(res.unit_ams_id) unit_ams_id,
                    max(res.unit_name) unit_name,
                    max(res.outlet_id) outlet_id,
                    res.outlet_ams_id,
                    max(res.outlet_name) outlet_name,
                    max(res.position_name) position_name,
                    max(to_char(res.effective_date, 'DD/MM/YYYY')) effective_date,
                    max(to_char(res.terminative_date, 'DD/MM/YYYY')) terminative_date,
                    nvl(count(res.account_number), 0) account_qty,
                    sum(nvl(res.init_premium, 0)) init_premium,
                    sum(nvl(res.freq_premium, 0)) freq_premium,
                    sum(nvl(res.lsum_premium, 0)) lsum_premium,
                    sum(nvl(res.afyp, 0)) afyp
                from ams.la_mana_policy_repo res
                where res.record_date = var_record_date
                    and
                    (
                       nvl(valOption, 2) = 2  --ca 2 nguon
                       or ( valOption = 0 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                       or ( valOption = 1 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                    )
                group by res.outlet_ams_id
            ) repo
            left join
            (
                select /*+ CARDINALITY(res, 100)
                    */
                    res.outlet_ams_id,
                    nvl(count(res.account_number), 0) account_qty,
                    sum(nvl(res.init_premium, 0)) init_premium,
                    sum(nvl(res.freq_premium, 0)) freq_premium,
                    sum(nvl(res.lsum_premium, 0)) lsum_premium,
                    sum(nvl(res.afyp, 0)) afyp
                from ams.la_mana_policy_repo res
                where res.record_date = var_record_date
                    and res.source_of_data = ams.LIFE_AGENCY_INVOICE_REPORT.SYSTEM_REFER_BVLIFE
                    and
                    (
                       nvl(valOption, 2) = 2  --ca 2 nguon
                       or ( valOption = 0 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                       or ( valOption = 1 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                    )
                group by res.outlet_ams_id
            ) bvl
                on bvl.outlet_ams_id = repo.outlet_ams_id
            left join
            (
                select /*+ CARDINALITY(res, 100)
                    */
                    res.outlet_ams_id,
                    nvl(count(res.account_number), 0) account_qty,
                    sum(nvl(res.init_premium, 0)) init_premium,
                    sum(nvl(res.freq_premium, 0)) freq_premium,
                    sum(nvl(res.lsum_premium, 0)) lsum_premium,
                    sum(nvl(res.afyp, 0)) afyp
                from ams.la_mana_policy_repo res
                where res.record_date = var_record_date
                    and res.source_of_data = ams.LIFE_AGENCY_INVOICE_REPORT.SYSTEM_REFER_TALISMAN
                    and
                    (
                       nvl(valOption, 2) = 2  --ca 2 nguon
                       or ( valOption = 0 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                       or ( valOption = 1 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                    )
                group by res.outlet_ams_id
            ) ods
                on ods.outlet_ams_id = repo.outlet_ams_id
            order by
                nlssort(repo.company_name, 'nls_sort=Vietnamese'),
                nlssort(repo.office_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(repo.agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(repo.unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(repo.outlet_name, 'nls_sort=Vietnamese'),
                nlssort(repo.outlet_ams_id, 'nls_sort=Vietnamese');
        end if;

/*
        if var_record_date between var_delete_from_date and var_current_date then
            if var_agent_id <> 0 then
                open row_records for
                select \*+ CARDINALITY(repo, 100) CARDINALITY(bvl, 100) CARDINALITY(ods, 100)
                    *\
                    repo.company_name,
                    repo.office_ams_id,
                    repo.office_name,
                    repo.agency_ams_id,
                    repo.agency_name,
                    repo.unit_ams_id,
                    repo.unit_name,
                    repo.outlet_id,
                    repo.outlet_ams_id,
                    repo.outlet_name,
                    repo.position_name,
                    repo.effective_date,
                    repo.terminative_date,
                    bvl.account_qty bvl_account_qty,
                    bvl.init_premium bvl_init_premium,
                    bvl.freq_premium bvl_freq_premium,
                    bvl.lsum_premium bvl_lsum_premium,
                    bvl.afyp bvl_afyp,
                    ods.account_qty ods_account_qty,
                    ods.init_premium ods_init_premium,
                    ods.freq_premium ods_freq_premium,
                    ods.lsum_premium ods_lsum_premium,
                    ods.afyp ods_afyp,
                    repo.account_qty,
                    repo.init_premium,
                    repo.freq_premium,
                    repo.lsum_premium,
                    repo.afyp
                from
                (
                    select \*+ CARDINALITY(res, 100)
                        *\
                        max(res.company_name) company_name,
                        max(res.office_ams_id) office_ams_id,
                        max(res.office_name) office_name,
                        max(res.agency_ams_id) agency_ams_id,
                        max(res.agency_name) agency_name,
                        max(res.unit_ams_id) unit_ams_id,
                        max(res.unit_name) unit_name,
                        max(res.outlet_id) outlet_id,
                        res.outlet_ams_id,
                        max(res.outlet_name) outlet_name,
                        max(res.position_name) position_name,
                        max(to_char(res.effective_date, 'DD/MM/YYYY')) effective_date,
                        max(to_char(res.terminative_date, 'DD/MM/YYYY')) terminative_date,
                        nvl(count(res.account_number), 0) account_qty,
                        sum(nvl(res.init_premium, 0)) init_premium,
                        sum(nvl(res.freq_premium, 0)) freq_premium,
                        sum(nvl(res.lsum_premium, 0)) lsum_premium,
                        sum(nvl(res.afyp, 0)) afyp
                    from ams.la_mana_policy_repo res
                    where res.record_date = var_record_date
                        and
                        (
                           nvl(valOption, 2) = 2  --ca 2 nguon
                           or ( valOption = 0 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                           or ( valOption = 1 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                        )
                        and res.outlet_id = var_agent_id
                    group by res.outlet_ams_id
                ) repo
                left join
                (
                    select \*+ CARDINALITY(res, 100)
                        *\
                        res.outlet_ams_id,
                        nvl(count(res.account_number), 0) account_qty,
                        sum(nvl(res.init_premium, 0)) init_premium,
                        sum(nvl(res.freq_premium, 0)) freq_premium,
                        sum(nvl(res.lsum_premium, 0)) lsum_premium,
                        sum(nvl(res.afyp, 0)) afyp
                    from ams.la_mana_policy_repo res
                    where res.record_date = var_record_date
                        and res.source_of_data = ams.LIFE_AGENCY_INVOICE_REPORT.SYSTEM_REFER_BVLIFE
                        and
                        (
                           nvl(valOption, 2) = 2  --ca 2 nguon
                           or ( valOption = 0 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                           or ( valOption = 1 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                        )
                        and res.outlet_id = var_agent_id
                    group by res.outlet_ams_id
                ) bvl
                    on bvl.outlet_ams_id = repo.outlet_ams_id
                left join
                (
                    select \*+ CARDINALITY(res, 100)
                        *\
                        res.outlet_ams_id,
                        nvl(count(res.account_number), 0) account_qty,
                        sum(nvl(res.init_premium, 0)) init_premium,
                        sum(nvl(res.freq_premium, 0)) freq_premium,
                        sum(nvl(res.lsum_premium, 0)) lsum_premium,
                        sum(nvl(res.afyp, 0)) afyp
                    from ams.la_mana_policy_repo res
                    where res.record_date = var_record_date
                        and res.source_of_data = ams.LIFE_AGENCY_INVOICE_REPORT.SYSTEM_REFER_TALISMAN
                        and
                        (
                           nvl(valOption, 2) = 2  --ca 2 nguon
                           or ( valOption = 0 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                           or ( valOption = 1 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                        )
                        and res.outlet_id = var_agent_id
                    group by res.outlet_ams_id
                ) ods
                    on ods.outlet_ams_id = repo.outlet_ams_id
                order by
                    nlssort(repo.company_name, 'nls_sort=Vietnamese'),
                    nlssort(repo.office_name, 'nls_sort=Vietnamese') nulls first,
                    nlssort(repo.agency_name, 'nls_sort=Vietnamese') nulls first,
                    nlssort(repo.unit_name, 'nls_sort=Vietnamese') nulls first,
                    nlssort(repo.outlet_name, 'nls_sort=Vietnamese'),
                    nlssort(repo.outlet_ams_id, 'nls_sort=Vietnamese');
           elsif var_branch_id <> 0 then
                open row_records for
                select \*+ CARDINALITY(repo, 100) CARDINALITY(bvl, 100) CARDINALITY(ods, 100)
                    *\
                    repo.company_name,
                    repo.office_ams_id,
                    repo.office_name,
                    repo.agency_ams_id,
                    repo.agency_name,
                    repo.unit_ams_id,
                    repo.unit_name,
                    repo.outlet_id,
                    repo.outlet_ams_id,
                    repo.outlet_name,
                    repo.position_name,
                    repo.effective_date,
                    repo.terminative_date,
                    bvl.account_qty bvl_account_qty,
                    bvl.init_premium bvl_init_premium,
                    bvl.freq_premium bvl_freq_premium,
                    bvl.lsum_premium bvl_lsum_premium,
                    bvl.afyp bvl_afyp,
                    ods.account_qty ods_account_qty,
                    ods.init_premium ods_init_premium,
                    ods.freq_premium ods_freq_premium,
                    ods.lsum_premium ods_lsum_premium,
                    ods.afyp ods_afyp,
                    repo.account_qty,
                    repo.init_premium,
                    repo.freq_premium,
                    repo.lsum_premium,
                    repo.afyp
                from
                (
                    select \*+ CARDINALITY(res, 100)
                        *\
                        max(res.company_name) company_name,
                        max(res.office_ams_id) office_ams_id,
                        max(res.office_name) office_name,
                        max(res.agency_ams_id) agency_ams_id,
                        max(res.agency_name) agency_name,
                        max(res.unit_ams_id) unit_ams_id,
                        max(res.unit_name) unit_name,
                        max(res.outlet_id) outlet_id,
                        res.outlet_ams_id,
                        max(res.outlet_name) outlet_name,
                        max(res.position_name) position_name,
                        max(to_char(res.effective_date, 'DD/MM/YYYY')) effective_date,
                        max(to_char(res.terminative_date, 'DD/MM/YYYY')) terminative_date,
                        nvl(count(res.account_number), 0) account_qty,
                        sum(nvl(res.init_premium, 0)) init_premium,
                        sum(nvl(res.freq_premium, 0)) freq_premium,
                        sum(nvl(res.lsum_premium, 0)) lsum_premium,
                        sum(nvl(res.afyp, 0)) afyp
                    from ams.la_mana_policy_repo res
                    where res.record_date = var_record_date
                        and
                        (
                           nvl(valOption, 2) = 2  --ca 2 nguon
                           or ( valOption = 0 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                           or ( valOption = 1 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                        )
                        and var_branch_id in
                        (
                            res.company_id,
                            res.office_id,
                            res.agency_id,
                            res.unit_id
                        )
                    group by res.outlet_ams_id
                ) repo
                left join
                (
                    select \*+ CARDINALITY(res, 100)
                        *\
                        res.outlet_ams_id,
                        nvl(count(res.account_number), 0) account_qty,
                        sum(nvl(res.init_premium, 0)) init_premium,
                        sum(nvl(res.freq_premium, 0)) freq_premium,
                        sum(nvl(res.lsum_premium, 0)) lsum_premium,
                        sum(nvl(res.afyp, 0)) afyp
                    from ams.la_mana_policy_repo res
                    where res.record_date = var_record_date
                        and res.source_of_data = ams.LIFE_AGENCY_INVOICE_REPORT.SYSTEM_REFER_BVLIFE
                        and
                        (
                           nvl(valOption, 2) = 2  --ca 2 nguon
                           or ( valOption = 0 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                           or ( valOption = 1 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                        )
                        and var_branch_id in
                        (
                            res.company_id,
                            res.office_id,
                            res.agency_id,
                            res.unit_id
                        )
                    group by res.outlet_ams_id
                ) bvl
                    on bvl.outlet_ams_id = repo.outlet_ams_id
                left join
                (
                    select \*+ CARDINALITY(res, 100)
                        *\
                        res.outlet_ams_id,
                        nvl(count(res.account_number), 0) account_qty,
                        sum(nvl(res.init_premium, 0)) init_premium,
                        sum(nvl(res.freq_premium, 0)) freq_premium,
                        sum(nvl(res.lsum_premium, 0)) lsum_premium,
                        sum(nvl(res.afyp, 0)) afyp
                    from ams.la_mana_policy_repo res
                    where res.record_date = var_record_date
                        and res.source_of_data = ams.LIFE_AGENCY_INVOICE_REPORT.SYSTEM_REFER_TALISMAN
                        and
                        (
                           nvl(valOption, 2) = 2  --ca 2 nguon
                           or ( valOption = 0 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                           or ( valOption = 1 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                        )
                        and var_branch_id in
                        (
                            res.company_id,
                            res.office_id,
                            res.agency_id,
                            res.unit_id
                        )
                    group by res.outlet_ams_id
                ) ods
                    on ods.outlet_ams_id = repo.outlet_ams_id
                order by
                    nlssort(repo.company_name, 'nls_sort=Vietnamese'),
                    nlssort(repo.office_name, 'nls_sort=Vietnamese') nulls first,
                    nlssort(repo.agency_name, 'nls_sort=Vietnamese') nulls first,
                    nlssort(repo.unit_name, 'nls_sort=Vietnamese') nulls first,
                    nlssort(repo.outlet_name, 'nls_sort=Vietnamese'),
                    nlssort(repo.outlet_ams_id, 'nls_sort=Vietnamese');
           elsif var_branch_id = 0 then
                open row_records for
                select \*+ CARDINALITY(repo, 100) CARDINALITY(bvl, 100) CARDINALITY(ods, 100)
                    *\
                    repo.company_name,
                    repo.office_ams_id,
                    repo.office_name,
                    repo.agency_ams_id,
                    repo.agency_name,
                    repo.unit_ams_id,
                    repo.unit_name,
                    repo.outlet_id,
                    repo.outlet_ams_id,
                    repo.outlet_name,
                    repo.position_name,
                    repo.effective_date,
                    repo.terminative_date,
                    bvl.account_qty bvl_account_qty,
                    bvl.init_premium bvl_init_premium,
                    bvl.freq_premium bvl_freq_premium,
                    bvl.lsum_premium bvl_lsum_premium,
                    bvl.afyp bvl_afyp,
                    ods.account_qty ods_account_qty,
                    ods.init_premium ods_init_premium,
                    ods.freq_premium ods_freq_premium,
                    ods.lsum_premium ods_lsum_premium,
                    ods.afyp ods_afyp,
                    repo.account_qty,
                    repo.init_premium,
                    repo.freq_premium,
                    repo.lsum_premium,
                    repo.afyp
                from
                (
                    select \*+ CARDINALITY(res, 100)
                        *\
                        max(res.company_name) company_name,
                        max(res.office_ams_id) office_ams_id,
                        max(res.office_name) office_name,
                        max(res.agency_ams_id) agency_ams_id,
                        max(res.agency_name) agency_name,
                        max(res.unit_ams_id) unit_ams_id,
                        max(res.unit_name) unit_name,
                        max(res.outlet_id) outlet_id,
                        res.outlet_ams_id,
                        max(res.outlet_name) outlet_name,
                        max(res.position_name) position_name,
                        max(to_char(res.effective_date, 'DD/MM/YYYY')) effective_date,
                        max(to_char(res.terminative_date, 'DD/MM/YYYY')) terminative_date,
                        nvl(count(res.account_number), 0) account_qty,
                        sum(nvl(res.init_premium, 0)) init_premium,
                        sum(nvl(res.freq_premium, 0)) freq_premium,
                        sum(nvl(res.lsum_premium, 0)) lsum_premium,
                        sum(nvl(res.afyp, 0)) afyp
                    from ams.la_mana_policy_repo res
                    where res.record_date = var_record_date
                        and
                        (
                           nvl(valOption, 2) = 2  --ca 2 nguon
                           or ( valOption = 0 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                           or ( valOption = 1 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                        )
                    group by res.outlet_ams_id
                ) repo
                left join
                (
                    select \*+ CARDINALITY(res, 100)
                        *\
                        res.outlet_ams_id,
                        nvl(count(res.account_number), 0) account_qty,
                        sum(nvl(res.init_premium, 0)) init_premium,
                        sum(nvl(res.freq_premium, 0)) freq_premium,
                        sum(nvl(res.lsum_premium, 0)) lsum_premium,
                        sum(nvl(res.afyp, 0)) afyp
                    from ams.la_mana_policy_repo res
                    where res.record_date = var_record_date
                        and res.source_of_data = ams.LIFE_AGENCY_INVOICE_REPORT.SYSTEM_REFER_BVLIFE
                        and
                        (
                           nvl(valOption, 2) = 2  --ca 2 nguon
                           or ( valOption = 0 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                           or ( valOption = 1 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                        )
                    group by res.outlet_ams_id
                ) bvl
                    on bvl.outlet_ams_id = repo.outlet_ams_id
                left join
                (
                    select \*+ CARDINALITY(res, 100)
                        *\
                        res.outlet_ams_id,
                        nvl(count(res.account_number), 0) account_qty,
                        sum(nvl(res.init_premium, 0)) init_premium,
                        sum(nvl(res.freq_premium, 0)) freq_premium,
                        sum(nvl(res.lsum_premium, 0)) lsum_premium,
                        sum(nvl(res.afyp, 0)) afyp
                    from ams.la_mana_policy_repo res
                    where res.record_date = var_record_date
                        and res.source_of_data = ams.LIFE_AGENCY_INVOICE_REPORT.SYSTEM_REFER_TALISMAN
                        and
                        (
                           nvl(valOption, 2) = 2  --ca 2 nguon
                           or ( valOption = 0 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                           or ( valOption = 1 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                        )
                    group by res.outlet_ams_id
                ) ods
                    on ods.outlet_ams_id = repo.outlet_ams_id
                order by
                    nlssort(repo.company_name, 'nls_sort=Vietnamese'),
                    nlssort(repo.office_name, 'nls_sort=Vietnamese') nulls first,
                    nlssort(repo.agency_name, 'nls_sort=Vietnamese') nulls first,
                    nlssort(repo.unit_name, 'nls_sort=Vietnamese') nulls first,
                    nlssort(repo.outlet_name, 'nls_sort=Vietnamese'),
                    nlssort(repo.outlet_ams_id, 'nls_sort=Vietnamese');
            end if;
        else
            --phai cho phep thi moi co the duoc thuc hien
            if AMS_CORE_MODULE.is_active('POL_MANA_QUERY', (trunc(sysdate, 'DD') - 1))
                    = AMS_CORE_MODULE.IS_YES then
                --neu khong nam trong ngay thang day thi se can phai tao moi so lieu da co do vao
                --voi cai session da co cho no roi hien thi theo cai session da co day len
                if var_agent_id <> 0 then
                    --neu khong nam trong ngay thang day thi se can phai tao moi so lieu da co do vao
                    --voi cai session da co cho no roi hien thi theo cai session da co day len
                    insert \*+ APPEND *\ into ams.la_mana_policy_repo_tmp nologging
                    select \*+ CARDINALITY(tmp, 100)*\
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.type_code,
                        var_record_date, --bao cao la_mana_policy_repo nay phai dua du lieu theo ngay nay
                        tmp.version_date,
                        tmp.status_code,
                        tmp.source_of_data,
                        tmp.outlet_name,
                        tmp.company_id,
                        tmp.company_bvl_id,
                        tmp.company_ams_id,
                        tmp.company_name,
                        tmp.office_id,
                        tmp.office_ams_id,
                        tmp.office_name,
                        tmp.agency_id,
                        tmp.agency_ams_id,
                        tmp.agency_name,
                        tmp.unit_id,
                        tmp.unit_ams_id,
                        tmp.unit_name,
                        tmp.position_code,
                        tmp.position_date,
                        tmp.position_name,
                        tmp.effective_date,
                        tmp.terminative_date,
                        tmp.account_number,
                        tmp.pol_effective_date,
                        tmp.pol_issue_date,
                        tmp.pol_of_date,
                        null,
                        null,
                        tmp.freq_per_annum,
                        null,
                        tmp.commission_status_name,
                        \*tmp.risk_term,
                        tmp.term_from_date,
                        tmp.term_to_date,   *\
                        tmp.init_premium,
                        tmp.freq_premium,
                        tmp.lsum_premium,
                        tmp.afyp,
                        null,
                        null,
                        tmp.pol_status_name,
                        tmp.holder_name,
                        tmp.insured_name,
                        tmp.holder_address,
                        valSessionId,
                        ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                        ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                        sysdate,
                        sysdate
                    from ams.la_mana_policy tmp
                    where tmp.record_date = var_record_month
                        and
                        (
                           nvl(valOption, 2) = 2  --ca 2 nguon
                           or ( valOption = 0 and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                           or ( valOption = 1 and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                        )
                        and tmp.outlet_id = var_agent_id
                        and tmp.pol_of_date is null; --lay cac danh sach hop dong con hieu luc tinh den cuoi thang
                    commit;

                    ams.life_agency_log.time_end;
                    ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_MANA_POLICY.tal_get_policy', 'do vao bang la_mana_policy_repo ' || to_char(var_record_date, 'DD/MM/YYYY'));
                    ams.life_agency_log.time_stop;
                    ams.life_agency_log.time_begin;

                    --lay cac danh sach hop dong  het hieu luc sau ngay da dua vao nhu vay
                    insert \*+ APPEND *\ into ams.la_mana_policy_repo_tmp nologging
                    select \*+ CARDINALITY(tmp, 100)*\
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.type_code,
                        var_record_date, --bao cao la_mana_policy_repo nay phai dua du lieu theo ngay nay
                        tmp.version_date,
                        tmp.status_code,
                        tmp.source_of_data,
                        tmp.outlet_name,
                        tmp.company_id,
                        tmp.company_bvl_id,
                        tmp.company_ams_id,
                        tmp.company_name,
                        tmp.office_id,
                        tmp.office_ams_id,
                        tmp.office_name,
                        tmp.agency_id,
                        tmp.agency_ams_id,
                        tmp.agency_name,
                        tmp.unit_id,
                        tmp.unit_ams_id,
                        tmp.unit_name,
                        tmp.position_code,
                        tmp.position_date,
                        tmp.position_name,
                        tmp.effective_date,
                        tmp.terminative_date,
                        tmp.account_number,
                        tmp.pol_effective_date,
                        tmp.pol_issue_date,
                        tmp.pol_of_date,
                        null,
                        null,
                        tmp.freq_per_annum,
                        null,
                        tmp.commission_status_name,
                        \*tmp.risk_term,
                        tmp.term_from_date,
                        tmp.term_to_date,   *\
                        tmp.init_premium,
                        tmp.freq_premium,
                        tmp.lsum_premium,
                        tmp.afyp,
                        null,
                        null,
                        tmp.pol_status_name,
                        tmp.holder_name,
                        tmp.insured_name,
                        tmp.holder_address,
                        valSessionId,
                        ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                        ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                        sysdate,
                        sysdate
                    from ams.la_mana_policy tmp
                    where tmp.record_date = var_record_month
                        and
                        (
                           nvl(valOption, 2) = 2  --ca 2 nguon
                           or ( valOption = 0 and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                           or ( valOption = 1 and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                        )
                        and tmp.outlet_id = var_agent_id
                        --lay cac danh sach hop dong huy sau ngay day thi ra duoc cac hop dong con hieu luc
                        and nvl(tmp.pol_of_date, ams.LIFE_AGENCY_MANA_POLICY.DATE_MIN_VALUE) > var_record_date;
                    commit;

                    ams.life_agency_log.time_end;
                    ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_MANA_POLICY.tal_get_policy', 'do vao bang la_mana_policy_repo het hieu luc' || to_char(var_record_date, 'DD/MM/YYYY'));
                    ams.life_agency_log.time_stop;
                    ams.life_agency_log.time_begin;

                    --sau do thi se hien thi du lieu ra cho nguoi su dung xem
                    open row_records for
                    select \*+ CARDINALITY(repo, 100) CARDINALITY(bvl, 100) CARDINALITY(ods, 100)
                        *\
                        repo.company_name,
                        repo.office_ams_id,
                        repo.office_name,
                        repo.agency_ams_id,
                        repo.agency_name,
                        repo.unit_ams_id,
                        repo.unit_name,
                        repo.outlet_id,
                        repo.outlet_ams_id,
                        repo.outlet_name,
                        repo.position_name,
                        repo.effective_date,
                        repo.terminative_date,
                        bvl.account_qty bvl_account_qty,
                        bvl.init_premium bvl_init_premium,
                        bvl.freq_premium bvl_freq_premium,
                        bvl.lsum_premium bvl_lsum_premium,
                        bvl.afyp bvl_afyp,
                        ods.account_qty ods_account_qty,
                        ods.init_premium ods_init_premium,
                        ods.freq_premium ods_freq_premium,
                        ods.lsum_premium ods_lsum_premium,
                        ods.afyp ods_afyp,
                        repo.account_qty,
                        repo.init_premium,
                        repo.freq_premium,
                        repo.lsum_premium,
                        repo.afyp
                    from
                    (
                        select \*+ CARDINALITY(res, 100)
                            *\
                            max(res.company_name) company_name,
                            max(res.office_ams_id) office_ams_id,
                            max(res.office_name) office_name,
                            max(res.agency_ams_id) agency_ams_id,
                            max(res.agency_name) agency_name,
                            max(res.unit_ams_id) unit_ams_id,
                            max(res.unit_name) unit_name,
                            max(res.outlet_id) outlet_id,
                            res.outlet_ams_id,
                            max(res.outlet_name) outlet_name,
                            max(res.position_name) position_name,
                            max(to_char(res.effective_date, 'DD/MM/YYYY')) effective_date,
                            max(to_char(res.terminative_date, 'DD/MM/YYYY')) terminative_date,
                            nvl(count(res.account_number), 0) account_qty,
                            sum(nvl(res.init_premium, 0)) init_premium,
                            sum(nvl(res.freq_premium, 0)) freq_premium,
                            sum(nvl(res.lsum_premium, 0)) lsum_premium,
                            sum(nvl(res.afyp, 0)) afyp
                        from ams.la_mana_policy_repo_tmp res
                        where res.session_id = valSessionId
                            and
                            (
                               nvl(valOption, 2) = 2  --ca 2 nguon
                               or ( valOption = 0 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                               or ( valOption = 1 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                            )
                            and res.outlet_id = var_agent_id
                        group by res.outlet_ams_id
                    ) repo
                    left join
                    (
                        select \*+ CARDINALITY(res, 100)
                            *\
                            res.outlet_ams_id,
                            nvl(count(res.account_number), 0) account_qty,
                            sum(nvl(res.init_premium, 0)) init_premium,
                            sum(nvl(res.freq_premium, 0)) freq_premium,
                            sum(nvl(res.lsum_premium, 0)) lsum_premium,
                            sum(nvl(res.afyp, 0)) afyp
                        from ams.la_mana_policy_repo_tmp res
                        where res.session_id = valSessionId
                            and res.source_of_data = ams.LIFE_AGENCY_INVOICE_REPORT.SYSTEM_REFER_BVLIFE
                            and
                            (
                               nvl(valOption, 2) = 2  --ca 2 nguon
                               or ( valOption = 0 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                               or ( valOption = 1 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                            )
                            and res.outlet_id = var_agent_id
                        group by res.outlet_ams_id
                    ) bvl
                        on bvl.outlet_ams_id = repo.outlet_ams_id
                    left join
                    (
                        select \*+ CARDINALITY(res, 100)
                            *\
                            res.outlet_ams_id,
                            nvl(count(res.account_number), 0) account_qty,
                            sum(nvl(res.init_premium, 0)) init_premium,
                            sum(nvl(res.freq_premium, 0)) freq_premium,
                            sum(nvl(res.lsum_premium, 0)) lsum_premium,
                            sum(nvl(res.afyp, 0)) afyp
                        from ams.la_mana_policy_repo_tmp res
                        where res.session_id = valSessionId
                            and res.source_of_data = ams.LIFE_AGENCY_INVOICE_REPORT.SYSTEM_REFER_TALISMAN
                            and
                            (
                               nvl(valOption, 2) = 2  --ca 2 nguon
                               or ( valOption = 0 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                               or ( valOption = 1 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                            )
                            and res.outlet_id = var_agent_id
                        group by res.outlet_ams_id
                    ) ods
                        on ods.outlet_ams_id = repo.outlet_ams_id
                    order by
                        nlssort(repo.company_name, 'nls_sort=Vietnamese'),
                        nlssort(repo.office_name, 'nls_sort=Vietnamese') nulls first,
                        nlssort(repo.agency_name, 'nls_sort=Vietnamese') nulls first,
                        nlssort(repo.unit_name, 'nls_sort=Vietnamese') nulls first,
                        nlssort(repo.outlet_name, 'nls_sort=Vietnamese'),
                        nlssort(repo.outlet_ams_id, 'nls_sort=Vietnamese');
                    ams.life_agency_log.time_end;
                    ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_MANA_POLICY.tal_get_policy', 'open cursor  ' || to_char(var_record_date, 'DD/MM/YYYY'));
               elsif var_branch_id <> 0 then
                    --neu khong nam trong ngay thang day thi se can phai tao moi so lieu da co do vao
                    --voi cai session da co cho no roi hien thi theo cai session da co day len
                    --neu khong nam trong ngay thang day thi se can phai tao moi so lieu da co do vao
                    --voi cai session da co cho no roi hien thi theo cai session da co day len
                    insert \*+ APPEND *\ into ams.la_mana_policy_repo_tmp nologging
                    select \*+ CARDINALITY(tmp, 100)*\
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.type_code,
                        var_record_date, --bao cao la_mana_policy_repo nay phai dua du lieu theo ngay nay
                        tmp.version_date,
                        tmp.status_code,
                        tmp.source_of_data,
                        tmp.outlet_name,
                        tmp.company_id,
                        tmp.company_bvl_id,
                        tmp.company_ams_id,
                        tmp.company_name,
                        tmp.office_id,
                        tmp.office_ams_id,
                        tmp.office_name,
                        tmp.agency_id,
                        tmp.agency_ams_id,
                        tmp.agency_name,
                        tmp.unit_id,
                        tmp.unit_ams_id,
                        tmp.unit_name,
                        tmp.position_code,
                        tmp.position_date,
                        tmp.position_name,
                        tmp.effective_date,
                        tmp.terminative_date,
                        tmp.account_number,
                        tmp.pol_effective_date,
                        tmp.pol_issue_date,
                        tmp.pol_of_date,
                        null,
                        null,
                        tmp.freq_per_annum,
                        null,
                        tmp.commission_status_name,
                        \*tmp.risk_term,
                        tmp.term_from_date,
                        tmp.term_to_date,   *\
                        tmp.init_premium,
                        tmp.freq_premium,
                        tmp.lsum_premium,
                        tmp.afyp,
                        null,
                        null,
                        tmp.pol_status_name,
                        tmp.holder_name,
                        tmp.insured_name,
                        tmp.holder_address,
                        valSessionId,
                        ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                        ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                        sysdate,
                        sysdate
                    from ams.la_mana_policy tmp
                    where tmp.record_date = var_record_month
                        and
                        (
                           nvl(valOption, 2) = 2  --ca 2 nguon
                           or ( valOption = 0 and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                           or ( valOption = 1 and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                        )
                        and var_branch_id in
                        (
                            tmp.company_id,
                            tmp.office_id,
                            tmp.agency_id,
                            tmp.unit_id
                        )
                        and tmp.pol_of_date is null; --lay cac danh sach hop dong con hieu luc tinh den cuoi thang
                    commit;

                    ams.life_agency_log.time_end;
                    ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_MANA_POLICY.tal_get_policy', 'do vao bang la_mana_policy_repo ' || to_char(var_record_date, 'DD/MM/YYYY'));
                    ams.life_agency_log.time_stop;
                    ams.life_agency_log.time_begin;

                    --lay cac danh sach hop dong  het hieu luc sau ngay da dua vao nhu vay
                    insert \*+ APPEND *\ into ams.la_mana_policy_repo_tmp nologging
                    select \*+ CARDINALITY(tmp, 100)*\
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.type_code,
                        var_record_date, --bao cao la_mana_policy_repo nay phai dua du lieu theo ngay nay
                        tmp.version_date,
                        tmp.status_code,
                        tmp.source_of_data,
                        tmp.outlet_name,
                        tmp.company_id,
                        tmp.company_bvl_id,
                        tmp.company_ams_id,
                        tmp.company_name,
                        tmp.office_id,
                        tmp.office_ams_id,
                        tmp.office_name,
                        tmp.agency_id,
                        tmp.agency_ams_id,
                        tmp.agency_name,
                        tmp.unit_id,
                        tmp.unit_ams_id,
                        tmp.unit_name,
                        tmp.position_code,
                        tmp.position_date,
                        tmp.position_name,
                        tmp.effective_date,
                        tmp.terminative_date,
                        tmp.account_number,
                        tmp.pol_effective_date,
                        tmp.pol_issue_date,
                        tmp.pol_of_date,
                        null,
                        null,
                        tmp.freq_per_annum,
                        null,
                        tmp.commission_status_name,
                        \*tmp.risk_term,
                        tmp.term_from_date,
                        tmp.term_to_date,   *\
                        tmp.init_premium,
                        tmp.freq_premium,
                        tmp.lsum_premium,
                        tmp.afyp,
                        null,
                        null,
                        tmp.pol_status_name,
                        tmp.holder_name,
                        tmp.insured_name,
                        tmp.holder_address,
                        valSessionId,
                        ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                        ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                        sysdate,
                        sysdate
                    from ams.la_mana_policy tmp
                    where tmp.record_date = var_record_month
                        and
                        (
                           nvl(valOption, 2) = 2  --ca 2 nguon
                           or ( valOption = 0 and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                           or ( valOption = 1 and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                        )
                        and var_branch_id in
                        (
                            tmp.company_id,
                            tmp.office_id,
                            tmp.agency_id,
                            tmp.unit_id
                        )
                        --lay cac danh sach hop dong huy sau ngay day thi ra duoc cac hop dong con hieu luc
                        and nvl(tmp.pol_of_date, ams.LIFE_AGENCY_MANA_POLICY.DATE_MIN_VALUE) > var_record_date;
                    commit;

                    ams.life_agency_log.time_end;
                    ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_MANA_POLICY.tal_get_policy', 'do vao bang la_mana_policy_repo het hieu luc' || to_char(var_record_date, 'DD/MM/YYYY'));
                    ams.life_agency_log.time_stop;
                    ams.life_agency_log.time_begin;

                    --sau do thi se hien thi du lieu ra cho nguoi su dung xem
                    open row_records for
                    select \*+ CARDINALITY(repo, 100) CARDINALITY(bvl, 100) CARDINALITY(ods, 100)
                        *\
                        repo.company_name,
                        repo.office_ams_id,
                        repo.office_name,
                        repo.agency_ams_id,
                        repo.agency_name,
                        repo.unit_ams_id,
                        repo.unit_name,
                        repo.outlet_id,
                        repo.outlet_ams_id,
                        repo.outlet_name,
                        repo.position_name,
                        repo.effective_date,
                        repo.terminative_date,
                        bvl.account_qty bvl_account_qty,
                        bvl.init_premium bvl_init_premium,
                        bvl.freq_premium bvl_freq_premium,
                        bvl.lsum_premium bvl_lsum_premium,
                        bvl.afyp bvl_afyp,
                        ods.account_qty ods_account_qty,
                        ods.init_premium ods_init_premium,
                        ods.freq_premium ods_freq_premium,
                        ods.lsum_premium ods_lsum_premium,
                        ods.afyp ods_afyp,
                        repo.account_qty,
                        repo.init_premium,
                        repo.freq_premium,
                        repo.lsum_premium,
                        repo.afyp
                    from
                    (
                        select \*+ CARDINALITY(res, 100)
                            *\
                            max(res.company_name) company_name,
                            max(res.office_ams_id) office_ams_id,
                            max(res.office_name) office_name,
                            max(res.agency_ams_id) agency_ams_id,
                            max(res.agency_name) agency_name,
                            max(res.unit_ams_id) unit_ams_id,
                            max(res.unit_name) unit_name,
                            max(res.outlet_id) outlet_id,
                            res.outlet_ams_id,
                            max(res.outlet_name) outlet_name,
                            max(res.position_name) position_name,
                            max(to_char(res.effective_date, 'DD/MM/YYYY')) effective_date,
                            max(to_char(res.terminative_date, 'DD/MM/YYYY')) terminative_date,
                            nvl(count(res.account_number), 0) account_qty,
                            sum(nvl(res.init_premium, 0)) init_premium,
                            sum(nvl(res.freq_premium, 0)) freq_premium,
                            sum(nvl(res.lsum_premium, 0)) lsum_premium,
                            sum(nvl(res.afyp, 0)) afyp
                        from ams.la_mana_policy_repo_tmp res
                        where res.session_id = valSessionId
                            and
                            (
                               nvl(valOption, 2) = 2  --ca 2 nguon
                               or ( valOption = 0 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                               or ( valOption = 1 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                            )
                            and var_branch_id in
                            (
                                res.company_id,
                                res.office_id,
                                res.agency_id,
                                res.unit_id
                            )
                        group by res.outlet_ams_id
                    ) repo
                    left join
                    (
                        select \*+ CARDINALITY(res, 100)
                            *\
                            res.outlet_ams_id,
                            nvl(count(res.account_number), 0) account_qty,
                            sum(nvl(res.init_premium, 0)) init_premium,
                            sum(nvl(res.freq_premium, 0)) freq_premium,
                            sum(nvl(res.lsum_premium, 0)) lsum_premium,
                            sum(nvl(res.afyp, 0)) afyp
                        from ams.la_mana_policy_repo_tmp res
                        where res.session_id = valSessionId
                            and res.source_of_data = ams.LIFE_AGENCY_INVOICE_REPORT.SYSTEM_REFER_BVLIFE
                            and
                            (
                               nvl(valOption, 2) = 2  --ca 2 nguon
                               or ( valOption = 0 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                               or ( valOption = 1 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                            )
                            and var_branch_id in
                            (
                                res.company_id,
                                res.office_id,
                                res.agency_id,
                                res.unit_id
                            )
                        group by res.outlet_ams_id
                    ) bvl
                        on bvl.outlet_ams_id = repo.outlet_ams_id
                    left join
                    (
                        select \*+ CARDINALITY(res, 100)
                            *\
                            res.outlet_ams_id,
                            nvl(count(res.account_number), 0) account_qty,
                            sum(nvl(res.init_premium, 0)) init_premium,
                            sum(nvl(res.freq_premium, 0)) freq_premium,
                            sum(nvl(res.lsum_premium, 0)) lsum_premium,
                            sum(nvl(res.afyp, 0)) afyp
                        from ams.la_mana_policy_repo_tmp res
                        where res.session_id = valSessionId
                            and res.source_of_data = ams.LIFE_AGENCY_INVOICE_REPORT.SYSTEM_REFER_TALISMAN
                            and
                            (
                               nvl(valOption, 2) = 2  --ca 2 nguon
                               or ( valOption = 0 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                               or ( valOption = 1 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                            )
                            and var_branch_id in
                            (
                                res.company_id,
                                res.office_id,
                                res.agency_id,
                                res.unit_id
                            )
                        group by res.outlet_ams_id
                    ) ods
                        on ods.outlet_ams_id = repo.outlet_ams_id
                    order by
                        nlssort(repo.company_name, 'nls_sort=Vietnamese'),
                        nlssort(repo.office_name, 'nls_sort=Vietnamese') nulls first,
                        nlssort(repo.agency_name, 'nls_sort=Vietnamese') nulls first,
                        nlssort(repo.unit_name, 'nls_sort=Vietnamese') nulls first,
                        nlssort(repo.outlet_name, 'nls_sort=Vietnamese'),
                        nlssort(repo.outlet_ams_id, 'nls_sort=Vietnamese');
                    ams.life_agency_log.time_end;
                    ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_MANA_POLICY.tal_get_policy', 'open cursor' || to_char(var_record_date, 'DD/MM/YYYY'));
            else --lay cho toan bo cac cong ty
                    --neu khong nam trong ngay thang day thi se can phai tao moi so lieu da co do vao
                    --voi cai session da co cho no roi hien thi theo cai session da co day len
                    --neu khong nam trong ngay thang day thi se can phai tao moi so lieu da co do vao
                    --voi cai session da co cho no roi hien thi theo cai session da co day len
                    --neu khong nam trong ngay thang day thi se can phai tao moi so lieu da co do vao
                    --voi cai session da co cho no roi hien thi theo cai session da co day len
                    insert \*+ APPEND *\ into ams.la_mana_policy_repo_tmp nologging
                    select \*+ CARDINALITY(tmp, 100)*\
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.type_code,
                        var_record_date, --bao cao la_mana_policy_repo nay phai dua du lieu theo ngay nay
                        tmp.version_date,
                        tmp.status_code,
                        tmp.source_of_data,
                        tmp.outlet_name,
                        tmp.company_id,
                        tmp.company_bvl_id,
                        tmp.company_ams_id,
                        tmp.company_name,
                        tmp.office_id,
                        tmp.office_ams_id,
                        tmp.office_name,
                        tmp.agency_id,
                        tmp.agency_ams_id,
                        tmp.agency_name,
                        tmp.unit_id,
                        tmp.unit_ams_id,
                        tmp.unit_name,
                        tmp.position_code,
                        tmp.position_date,
                        tmp.position_name,
                        tmp.effective_date,
                        tmp.terminative_date,
                        tmp.account_number,
                        tmp.pol_effective_date,
                        tmp.pol_issue_date,
                        tmp.pol_of_date,
                        null,
                        null,
                        tmp.freq_per_annum,
                        null,
                        tmp.commission_status_name,
                        \*tmp.risk_term,
                        tmp.term_from_date,
                        tmp.term_to_date,   *\
                        tmp.init_premium,
                        tmp.freq_premium,
                        tmp.lsum_premium,
                        tmp.afyp,
                        null,
                        null,
                        tmp.pol_status_name,
                        tmp.holder_name,
                        tmp.insured_name,
                        tmp.holder_address,
                        valSessionId,
                        ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                        ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                        sysdate,
                        sysdate
                    from ams.la_mana_policy tmp
                    where tmp.record_date = var_record_month
                        and
                        (
                           nvl(valOption, 2) = 2  --ca 2 nguon
                           or ( valOption = 0 and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                           or ( valOption = 1 and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                        )
                        and tmp.pol_of_date is null; --lay cac danh sach hop dong con hieu luc tinh den cuoi thang
                    commit;

                    ams.life_agency_log.time_end;
                    ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_MANA_POLICY.tal_get_policy', 'do vao bang la_mana_policy_repo ' || to_char(var_record_date, 'DD/MM/YYYY'));
                    ams.life_agency_log.time_stop;
                    ams.life_agency_log.time_begin;

                    --lay cac danh sach hop dong  het hieu luc sau ngay da dua vao nhu vay
                    insert \*+ APPEND *\ into ams.la_mana_policy_repo_tmp nologging
                    select \*+ CARDINALITY(tmp, 100)*\
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.type_code,
                        var_record_date, --bao cao la_mana_policy_repo nay phai dua du lieu theo ngay nay
                        tmp.version_date,
                        tmp.status_code,
                        tmp.source_of_data,
                        tmp.outlet_name,
                        tmp.company_id,
                        tmp.company_bvl_id,
                        tmp.company_ams_id,
                        tmp.company_name,
                        tmp.office_id,
                        tmp.office_ams_id,
                        tmp.office_name,
                        tmp.agency_id,
                        tmp.agency_ams_id,
                        tmp.agency_name,
                        tmp.unit_id,
                        tmp.unit_ams_id,
                        tmp.unit_name,
                        tmp.position_code,
                        tmp.position_date,
                        tmp.position_name,
                        tmp.effective_date,
                        tmp.terminative_date,
                        tmp.account_number,
                        tmp.pol_effective_date,
                        tmp.pol_issue_date,
                        tmp.pol_of_date,
                        null,
                        null,
                        tmp.freq_per_annum,
                        null,
                        tmp.commission_status_name,
                        \*tmp.risk_term,
                        tmp.term_from_date,
                        tmp.term_to_date,   *\
                        tmp.init_premium,
                        tmp.freq_premium,
                        tmp.lsum_premium,
                        tmp.afyp,
                        null,
                        null,
                        tmp.pol_status_name,
                        tmp.holder_name,
                        tmp.insured_name,
                        tmp.holder_address,
                        valSessionId,
                        ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                        ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                        sysdate,
                        sysdate
                    from ams.la_mana_policy tmp
                    where tmp.record_date = var_record_month
                        and
                        (
                           nvl(valOption, 2) = 2  --ca 2 nguon
                           or ( valOption = 0 and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                           or ( valOption = 1 and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                        )
                        --lay cac danh sach hop dong huy sau ngay day thi ra duoc cac hop dong con hieu luc
                        and nvl(tmp.pol_of_date, ams.LIFE_AGENCY_MANA_POLICY.DATE_MIN_VALUE) > var_record_date;
                    commit;

                    ams.life_agency_log.time_end;
                    ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_MANA_POLICY.tal_get_policy', 'do vao bang la_mana_policy_repo het hieu luc' || to_char(var_record_date, 'DD/MM/YYYY'));
                    ams.life_agency_log.time_stop;
                    ams.life_agency_log.time_begin;

                    --sau do thi se hien thi du lieu ra cho nguoi su dung xem
                    open row_records for
                    select \*+ CARDINALITY(repo, 100) CARDINALITY(bvl, 100) CARDINALITY(ods, 100)
                        *\
                        repo.company_name,
                        repo.office_ams_id,
                        repo.office_name,
                        repo.agency_ams_id,
                        repo.agency_name,
                        repo.unit_ams_id,
                        repo.unit_name,
                        repo.outlet_id,
                        repo.outlet_ams_id,
                        repo.outlet_name,
                        repo.position_name,
                        repo.effective_date,
                        repo.terminative_date,
                        bvl.account_qty bvl_account_qty,
                        bvl.init_premium bvl_init_premium,
                        bvl.freq_premium bvl_freq_premium,
                        bvl.lsum_premium bvl_lsum_premium,
                        bvl.afyp bvl_afyp,
                        ods.account_qty ods_account_qty,
                        ods.init_premium ods_init_premium,
                        ods.freq_premium ods_freq_premium,
                        ods.lsum_premium ods_lsum_premium,
                        ods.afyp ods_afyp,
                        repo.account_qty,
                        repo.init_premium,
                        repo.freq_premium,
                        repo.lsum_premium,
                        repo.afyp
                    from
                    (
                        select \*+ CARDINALITY(res, 100)
                            *\
                            max(res.company_name) company_name,
                            max(res.office_ams_id) office_ams_id,
                            max(res.office_name) office_name,
                            max(res.agency_ams_id) agency_ams_id,
                            max(res.agency_name) agency_name,
                            max(res.unit_ams_id) unit_ams_id,
                            max(res.unit_name) unit_name,
                            max(res.outlet_id) outlet_id,
                            res.outlet_ams_id,
                            max(res.outlet_name) outlet_name,
                            max(res.position_name) position_name,
                            max(to_char(res.effective_date, 'DD/MM/YYYY')) effective_date,
                            max(to_char(res.terminative_date, 'DD/MM/YYYY')) terminative_date,
                            nvl(count(res.account_number), 0) account_qty,
                            sum(nvl(res.init_premium, 0)) init_premium,
                            sum(nvl(res.freq_premium, 0)) freq_premium,
                            sum(nvl(res.lsum_premium, 0)) lsum_premium,
                            sum(nvl(res.afyp, 0)) afyp
                        from ams.la_mana_policy_repo_tmp res
                        where res.session_id = valSessionId
                            and
                            (
                               nvl(valOption, 2) = 2  --ca 2 nguon
                               or ( valOption = 0 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                               or ( valOption = 1 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                            )
                        group by res.outlet_ams_id
                    ) repo
                    left join
                    (
                        select \*+ CARDINALITY(res, 100)
                            *\
                            res.outlet_ams_id,
                            nvl(count(res.account_number), 0) account_qty,
                            sum(nvl(res.init_premium, 0)) init_premium,
                            sum(nvl(res.freq_premium, 0)) freq_premium,
                            sum(nvl(res.lsum_premium, 0)) lsum_premium,
                            sum(nvl(res.afyp, 0)) afyp
                        from ams.la_mana_policy_repo_tmp res
                        where res.session_id = valSessionId
                            and res.source_of_data = ams.LIFE_AGENCY_INVOICE_REPORT.SYSTEM_REFER_BVLIFE
                            and
                            (
                               nvl(valOption, 2) = 2  --ca 2 nguon
                               or ( valOption = 0 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                               or ( valOption = 1 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                            )
                        group by res.outlet_ams_id
                    ) bvl
                        on bvl.outlet_ams_id = repo.outlet_ams_id
                    left join
                    (
                        select \*+ CARDINALITY(res, 100)
                            *\
                            res.outlet_ams_id,
                            nvl(count(res.account_number), 0) account_qty,
                            sum(nvl(res.init_premium, 0)) init_premium,
                            sum(nvl(res.freq_premium, 0)) freq_premium,
                            sum(nvl(res.lsum_premium, 0)) lsum_premium,
                            sum(nvl(res.afyp, 0)) afyp
                        from ams.la_mana_policy_repo_tmp res
                        where res.session_id = valSessionId
                            and res.source_of_data = ams.LIFE_AGENCY_INVOICE_REPORT.SYSTEM_REFER_TALISMAN
                            and
                            (
                               nvl(valOption, 2) = 2  --ca 2 nguon
                               or ( valOption = 0 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE)
                               or ( valOption = 1 and res.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN)
                            )
                        group by res.outlet_ams_id
                    ) ods
                        on ods.outlet_ams_id = repo.outlet_ams_id
                    order by
                        nlssort(repo.company_name, 'nls_sort=Vietnamese'),
                        nlssort(repo.office_name, 'nls_sort=Vietnamese') nulls first,
                        nlssort(repo.agency_name, 'nls_sort=Vietnamese') nulls first,
                        nlssort(repo.unit_name, 'nls_sort=Vietnamese') nulls first,
                        nlssort(repo.outlet_name, 'nls_sort=Vietnamese'),
                        nlssort(repo.outlet_ams_id, 'nls_sort=Vietnamese');
                    ams.life_agency_log.time_end;
                    ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_MANA_POLICY.tal_get_policy', 'open cursor' || to_char(var_record_date, 'DD/MM/YYYY'));
                 end if;
             end if;
            var_run_end_time := sysdate;
            ams.life_agency_log.time_log(1001, 'Thoi gian lay bao cao hop dong quan ly tong hop', var_run_begin_time, var_run_end_time);
        end if;
*/
    end;

    procedure get_version_date(
        row_records out sys_refcursor)
    is
        var_version_date date :=  trunc(sysdate - 1, 'DD');
    begin
/*        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;      */
        begin
            --lay cai nay de co the lay ra thang ma no co so lieu o serv_data_va FYP va policy
            --de lay so lieu ra cho dung
            /*lay ngay chay so lieu ra cho no*/
            select
                /*+
                    CARDINALITY(tmp, 100)
                */
                nvl(tmp.version_date, sysdate)
                    into var_version_date
            from ams.la_mana_policy tmp
            where tmp.record_date = trunc(sysdate, 'MM')
                and rownum <= 1;
        exception
             when others then
                var_version_date :=  trunc(sysdate, 'DD');
                life_agency_log.write_log(-1000,
                    'life_agency_policy: k co var_version_date cua bao cao hdong quan ly',
                    sqlerrm,
                    sqlcode);
                open row_records for
                select to_char(nvl(var_version_date, sysdate), 'DD/MM/YYYY')
                from dual;
        end;

        var_version_date := var_version_date - 1;

        open row_records for
        select to_char(nvl(var_version_date, sysdate), 'DD/MM/YYYY')
        from dual;
/*        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_MANA_POLICY_REPORT', ' get_version_date' );*/
    end;

    procedure delete_session_id(valSessionID number,
        row_records out sys_refcursor)
    is
        tgt varchar2(32767);
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        ams.LIFE_AGENCY_MANA_POLICY_REPORT.delete_session(valSessionID);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(valSessionID, 'LIFE_AGENCY_MANA_POLICY_REPORT', ' delete_session_id' );
        tgt:= 'xoa thanh cong';
        open row_records for
            select tgt flag from dual;

    exception
        when others then
            rollback;
            tgt:= 'xoa khong thanh cong';
            open row_records for
                select tgt flag from dual;
    end;

    procedure delete_session(valSessionID number)
    is
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        loop
            delete ams.la_mana_policy_repo_tmp o
            where o.session_id = valSessionID
                and rownum < ams.LIFE_AGENCY_MANA_POLICY_REPORT.MAX_DELETE_NUMBER;
            exit when SQL%rowcount < ams.LIFE_AGENCY_MANA_POLICY_REPORT.MAX_DELETE_NUMBER - 1;
            commit;
        end loop;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(valSessionID, 'LIFE_AGENCY_MANA_POLICY_REPORT', ' delete_session_id' );
    exception
        when others then
            rollback;
            life_agency_log.write_log(valSessionID,
                'life_agency_policy: loi  delete_session',
                sqlerrm,
                sqlcode);
    end;

    procedure truncate_table(row_records out sys_refcursor)
    is
        tgt varchar2(32767);
    begin
        --xoa du lieu o bang tam nay di
        execute immediate 'truncate table ams.la_mana_policy_repo_tmp';
        dbms_stats.gather_table_stats(null, 'la_mana_policy_repo_tmp', cascade => true);
        tgt:= 'xoa thanh cong';
        open row_records for
            select tgt flag from dual;
    exception
        when others then
            rollback;
            tgt:= 'xoa khong thanh cong';
            open row_records for
                select tgt flag from dual;
    end;

end LIFE_AGENCY_MANA_POLICY_REPORT;
/
