create or replace package ams.AMS_MODL_COMP_MMXIII_REPORT is

    NAGM_DATA_GENR NVARCHAR2(64) := 'Tổng hợp';
    NAGM_DATA_QUAR NVARCHAR2(64) := 'Quý';
    NAGM_DATA_MONT NVARCHAR2(64) := 'Tháng';

    AGEM_DATA_GENR NVARCHAR2(64) := 'Tổng hợp';
    AGEM_DATA_QUAR NVARCHAR2(64) := 'Quý';
    AGEM_DATA_MONT NVARCHAR2(64) := 'Tháng';


    AGIN_DATA_GENR NVARCHAR2(64) := 'Tổng hợp';
    AGIN_DATA_QUAR NVARCHAR2(64) := 'Quý';
    AGIN_DATA_MONT NVARCHAR2(64) := 'Tháng';

    AGFA_DATA_GENR NVARCHAR2(64) := 'Tổng hợp';
    AGFA_DATA_MONT NVARCHAR2(64) := 'Tháng';

    MNEA_DATA_GENR NVARCHAR2(64) := 'Tổng hợp';
    MNEA_DATA_MONT NVARCHAR2(64) := 'Tháng';
    MNEA_DATA_DETL NVARCHAR2(64) := 'Chi tiết';

    AGQR_DATA_GENR NVARCHAR2(64) := 'Tổng hợp';
    AGQR_DATA_MONT NVARCHAR2(64) := 'Tháng';

    MNQL_DATA_GENR NVARCHAR2(64) := 'Tổng hợp';
    MNQL_DATA_QUAR NVARCHAR2(64) := 'Tháng';

    MNQR_DATA_GENR NVARCHAR2(64) := 'Tổng hợp';
    MNQR_DATA_QUAR NVARCHAR2(64) := 'Quý';

    MNNU_DATA_GENR NVARCHAR2(64) := 'Tổng hợp';
    MNNU_DATA_DETL NVARCHAR2(64) := 'Chi tiết';

    MNNA_DATA_GENR NVARCHAR2(64) := 'Tổng hợp';
    MNNA_DATA_DETL NVARCHAR2(64) := 'Chi tiết';

    MNBS_DIRE_TITLE NVARCHAR2(64) := 'Trực tiếp';
    MNBS_INDI_TITLE NVARCHAR2(64) := 'Gián tiếp';


    MNPU_DATA_GENR NVARCHAR2(64) := 'Tổng hợp';
    MNPU_DATA_MONT NVARCHAR2(64) := 'Tháng';

    NAME_RESULTS_PASS nvarchar2(64) := 'Ðạt';
    NAME_RESULTS_FAIL nvarchar2(64) := 'Không đạt';
    NAME_RESULTS_NONE nvarchar2(64) := 'Không xét';

    COMP_STATUS_CURR NVARCHAR2(64) := 'Ðang khai thác';
    COMP_STATUS_TERM NVARCHAR2(64) := 'Nghỉ việc';

    MODULE_CODE_MAIN VARCHAR2(16) := 'MAIN';
    BE_EXECUTING_YES VARCHAR2(1) := 'Y';
    BE_EXECUTING_NO VARCHAR2(1) := 'N';
    BE_EXECUTING_DEL VARCHAR2(1) := 'D';

    OUTLET_INFO_TYPE_POSI VARCHAR2(16) := 'POSI';
    SYSTEM_USER varchar2(16) := 'SYSTEM';
    THEME_LANGUAGE VARCHAR2(16) := 'VN';

    DATE_MAX_VALUE date := to_date('31-dec-9999');
    DATE_MIN_VALUE date := to_date('1-jan-1900');
    OBJECT_STATUS_ACTIVE VARCHAR2(16) := 'ACTI';
    MNEA_DATE_END date:= to_date('31-dec-2013');


    BE_PAID_YES VARCHAR2(1) := 'Y';
    BE_PAID_NO VARCHAR2(1) := 'N';
    BE_PAID_DTL VARCHAR2(1) := 'D';
    BE_PAID_SPC VARCHAR2(1) := 'S';
    BE_PAID_TERM VARCHAR2(1) := 'T';
    BE_PAID_EMPL VARCHAR2(1) := 'E';

    STATUS_TERM varchar2(16) := 'TERM';
    STATUS_CURR varchar2(16) := 'CURR';

    COMP_CODE_MMXIII_CV00 VARCHAR2(16) := 'CV00';
    COMP_CODE_MMXIII_CV01 VARCHAR2(16) := 'CV01';
    COMP_CODE_MMXIII_CV02 VARCHAR2(16) := 'CV02';
    COMP_CODE_MMXIII_CV03 VARCHAR2(16) := 'CV03';
    COMP_CODE_MMXIII_CV04 VARCHAR2(16) := 'CV04';
    COMP_CODE_MMXIII_CV05 VARCHAR2(16) := 'CV05';

    AGIN_DATA_TVV_TC varchar2(1) := 'X';
    AGIN_DATA_TVV varchar2(1) := ' ';

    procedure main;

    procedure mmxiii_get_comp(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor);

    procedure mmxiii_get_mnbs01(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor);

    procedure mmxiii_get_mnbs02(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor);
    procedure mmxiii_get_nagm01(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor);
    procedure mmxiii_get_agqr01(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor);
    procedure mmxiii_get_agem01(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor);
    procedure mmxiii_get_agin01(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor);
    procedure mmxiii_get_agin02(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor);
    procedure mmxiii_get_agfa01(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor);
    procedure mmxiii_get_agfa02(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor);
    procedure mmxiii_get_mnqr01(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor);
    procedure mmxiii_get_mnql01(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor);
    procedure mmxiii_get_mnnu01(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor);
    procedure mmxiii_get_mnna01(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor);
    procedure mmxiii_get_mnna02(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor);
    procedure mmxiii_get_mnea01(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor);
    procedure mmxiii_get_mnea_am01(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor);
   procedure mmxiii_get_mnpu01(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor);
    procedure mmxiii_get_mnpu02(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor);

    procedure mmxiii_get_center_comp(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor);
end AMS_MODL_COMP_MMXIII_REPORT;
/
create or replace package body ams.AMS_MODL_COMP_MMXIII_REPORT is
    /*chinhlk 19/3/2013 sua lai bao cao thuong gioi thieu dai ly moi them ca dai ly khong dat thuong cung hien thi len de cho dung du lieu hon*/
    procedure main
    is
    begin
        null;
    end;

    procedure mmxiii_get_comp(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor)
    is
        var_record_date date := trunc(valDate, 'MM');
        var_branch_id number(10) := nvl(valBranchID, 0);
        var_agent_id number(10) := nvl(valAgentID, 0);
    begin
        if var_agent_id <> 0 then
            open row_records for
            select /*+ CARDINALITY(comp, 100) CARDINALITY(posi, 100)*/
                comp.outlet_ams_id,
                comp.status_code,
                comp.info_outlet_name,
                comp.info_company_ams_id,
                comp.info_company_name,
                comp.info_agency_ams_id,
                comp.info_agency_name,
                comp.info_unit_ams_id,
                comp.info_unit_name,
                comp.info_position_code,
                to_char(comp.info_effective_date, 'DD/MM/YYYY') info_effective_date,
                to_char(comp.info_terminative_date, 'DD/MM/YYYY') info_terminative_date,
                case
                    when comp.status_code = AMS_MODL_COMP_MMXIII_REPORT.STATUS_CURR then
                        AMS_MODL_COMP_MMXIII_REPORT.COMP_STATUS_CURR
                    when comp.status_code = AMS_MODL_COMP_MMXIII_REPORT.STATUS_TERM then
                        AMS_MODL_COMP_MMXIII_REPORT.COMP_STATUS_TERM
                    end status_title,
                posi.position_name,

                comp.ousl_comp_money,

                comp.oucl_outl_fixd_money,
                comp.oucl_outl_soft_plus_money,
                comp.oucl_outl_soft_minu_money,
                comp.oucl_mana_fixd_money,
                comp.oucl_mana_soft_money,
                comp.oucl_comp_money,

                comp.nagm_senr_by_months,
                comp.nagm_period_ip,
                comp.nagm_period_issue,
                comp.nagm_period_pr36,
                comp.nagm_period_coll_rate,
                comp.nagm_comp_money,

                comp.agin_period_empl,
                comp.agin_comp_money,

                comp.agqr_period_fyc,
                comp.agqr_period_fyp,
                comp.agqr_period_pr36,
                comp.agqr_period_coll_rate agqr_cond_coll_rate,
                comp.agqr_comp_ratio,
                comp.agqr_comp_money_calc,
                comp.agqr_period_point,
                comp.agqr_activity_coefficient,
                comp.agqr_comp_money,

                comp.agem_period_fyc,
                comp.agem_period_empl,
                comp.agem_comp_ratio,
                comp.agem_comp_money,

                comp.mnbs_period_dire_fyc_calc,
                comp.mnbs_period_indi_fyc_calc,
                comp.mnbs_period_fyp,
                comp.mnbs_comp_dire_ratio,
                comp.mnbs_comp_indi_ratio,
                comp.mnbs_comp_money_calc,
                comp.mnbs_period_point,
                comp.mnbs_activity_coefficient,
                comp.mnbs_comp_money,

                comp.mnqr_period_fyc_calc,
                comp.mnqr_period_fyp,
                comp.mnqr_period_empl,
                comp.mnqr_period_qual,
                comp.mnqr_period_pr36,
                comp.mnqr_period_coll_rate,
                comp.mnqr_comp_ratio,
                comp.mnqr_comp_money_calc,
                comp.mnqr_period_point,
                comp.mnqr_activity_coefficient,
                comp.mnqr_comp_money,

                comp.mnnu_buss_money,
                comp.mnnu_comp_money,

                comp.mnna_period_fyp,
                comp.mnna_deve_count,
                comp.mnna_comp_money,

                comp.comp_mmxii_nagm,
                comp.comp_mmxii_mnnu,
                comp.comp_mmxii_mnna,

                comp.comp_money
            from ams.la_compensation_mmxiii comp
            left join
            (
                select
                    code.code_code position_code,
                    code.code_value position_name
                from ams.cla_codes code
                where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                    and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                    and trunc(valDate, 'MM')
                        between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                        and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
            ) posi
                on posi.position_code = comp.info_position_code
            where comp.record_date = trunc(valDate, 'MM')
                and comp.be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                and comp.outlet_id = var_agent_id
            order by
                nlssort(comp.info_company_name, 'nls_sort=Vietnamese'),
                nlssort(comp.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(comp.info_unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(comp.info_outlet_name, 'nls_sort=Vietnamese'),
                nlssort(comp.outlet_ams_id, 'nls_sort=Vietnamese');
       elsif var_branch_id <> 0 then
            open row_records for
            select /*+ CARDINALITY(comp, 100) CARDINALITY(posi, 100)*/
                comp.outlet_ams_id,
                comp.status_code,
                comp.info_outlet_name,
                comp.info_company_ams_id,
                comp.info_company_name,
                comp.info_agency_ams_id,
                comp.info_agency_name,
                comp.info_unit_ams_id,
                comp.info_unit_name,
                comp.info_position_code,
                to_char(comp.info_effective_date, 'DD/MM/YYYY') info_effective_date,
                to_char(comp.info_terminative_date, 'DD/MM/YYYY') info_terminative_date,
                case
                    when comp.status_code = AMS_MODL_COMP_MMXIII_REPORT.STATUS_CURR then
                        AMS_MODL_COMP_MMXIII_REPORT.COMP_STATUS_CURR
                    when comp.status_code = AMS_MODL_COMP_MMXIII_REPORT.STATUS_TERM then
                        AMS_MODL_COMP_MMXIII_REPORT.COMP_STATUS_TERM
                    end status_title,
                posi.position_name,

                comp.ousl_comp_money,

                comp.oucl_outl_fixd_money,
                comp.oucl_outl_soft_plus_money,
                comp.oucl_outl_soft_minu_money,
                comp.oucl_mana_fixd_money,
                comp.oucl_mana_soft_money,
                comp.oucl_comp_money,

                comp.nagm_senr_by_months,
                comp.nagm_period_ip,
                comp.nagm_period_issue,
                comp.nagm_period_pr36,
                comp.nagm_period_coll_rate,
                comp.nagm_comp_money,

                comp.agin_period_empl,
                comp.agin_comp_money,

                comp.agqr_period_fyc,
                comp.agqr_period_fyp,
                comp.agqr_period_pr36,
                comp.agqr_period_coll_rate agqr_cond_coll_rate,
                comp.agqr_comp_ratio,
                comp.agqr_comp_money_calc,
                comp.agqr_period_point,
                comp.agqr_activity_coefficient,
                comp.agqr_comp_money,

                comp.agem_period_fyc,
                comp.agem_period_empl,
                comp.agem_comp_ratio,
                comp.agem_comp_money,

                comp.mnbs_period_dire_fyc_calc,
                comp.mnbs_period_indi_fyc_calc,
                comp.mnbs_period_fyp,
                comp.mnbs_comp_dire_ratio,
                comp.mnbs_comp_indi_ratio,
                comp.mnbs_comp_money_calc,
                comp.mnbs_period_point,
                comp.mnbs_activity_coefficient,
                comp.mnbs_comp_money,

                comp.mnqr_period_fyc_calc,
                comp.mnqr_period_fyp,
                comp.mnqr_period_empl,
                comp.mnqr_period_qual,
                comp.mnqr_period_pr36,
                comp.mnqr_period_coll_rate,
                comp.mnqr_comp_ratio,
                comp.mnqr_comp_money_calc,
                comp.mnqr_period_point,
                comp.mnqr_activity_coefficient,
                comp.mnqr_comp_money,

                comp.mnnu_buss_money,
                comp.mnnu_comp_money,

                comp.mnna_period_fyp,
                comp.mnna_deve_count,
                comp.mnna_comp_money,

                comp.comp_mmxii_nagm,
                comp.comp_mmxii_mnnu,
                comp.comp_mmxii_mnna,

                comp.comp_money
            from ams.la_compensation_mmxiii comp
            left join
            (
                select
                    code.code_code position_code,
                    code.code_value position_name
                from ams.cla_codes code
                where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                    and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                    and trunc(valDate, 'MM')
                        between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                        and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
            ) posi
                on posi.position_code = comp.info_position_code
            where comp.record_date = trunc(valDate, 'MM')
                and comp.be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                and var_branch_id in
                (
                    comp.info_company_id,
                    comp.info_office_id,
                    comp.info_agency_id,
                    comp.info_unit_id
                )
            order by
                nlssort(comp.info_company_name, 'nls_sort=Vietnamese'),
                nlssort(comp.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(comp.info_unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(comp.info_outlet_name, 'nls_sort=Vietnamese'),
                nlssort(comp.outlet_ams_id, 'nls_sort=Vietnamese');
       elsif var_branch_id = 0 then
            open row_records for
            select /*+ CARDINALITY(comp, 100) CARDINALITY(posi, 100)*/
                comp.outlet_ams_id,
                comp.status_code,
                comp.info_outlet_name,
                comp.info_company_ams_id,
                comp.info_company_name,
                comp.info_agency_ams_id,
                comp.info_agency_name,
                comp.info_unit_ams_id,
                comp.info_unit_name,
                comp.info_position_code,
                to_char(comp.info_effective_date, 'DD/MM/YYYY') info_effective_date,
                to_char(comp.info_terminative_date, 'DD/MM/YYYY') info_terminative_date,
                case
                    when comp.status_code = AMS_MODL_COMP_MMXIII_REPORT.STATUS_CURR then
                        AMS_MODL_COMP_MMXIII_REPORT.COMP_STATUS_CURR
                    when comp.status_code = AMS_MODL_COMP_MMXIII_REPORT.STATUS_TERM then
                        AMS_MODL_COMP_MMXIII_REPORT.COMP_STATUS_TERM
                    end status_title,
                posi.position_name,

                comp.ousl_comp_money,

                comp.oucl_outl_fixd_money,
                comp.oucl_outl_soft_plus_money,
                comp.oucl_outl_soft_minu_money,
                comp.oucl_mana_fixd_money,
                comp.oucl_mana_soft_money,
                comp.oucl_comp_money,

                comp.nagm_senr_by_months,
                comp.nagm_period_ip,
                comp.nagm_period_issue,
                comp.nagm_period_pr36,
                comp.nagm_period_coll_rate,
                comp.nagm_comp_money,

                comp.agin_period_empl,
                comp.agin_comp_money,

                comp.agqr_period_fyc,
                comp.agqr_period_fyp,
                comp.agqr_period_pr36,
                comp.agqr_period_coll_rate agqr_cond_coll_rate,
                comp.agqr_comp_ratio,
                comp.agqr_comp_money_calc,
                comp.agqr_period_point,
                comp.agqr_activity_coefficient,
                comp.agqr_comp_money,

                comp.agem_period_fyc,
                comp.agem_period_empl,
                comp.agem_comp_ratio,
                comp.agem_comp_money,

                comp.mnbs_period_dire_fyc_calc,
                comp.mnbs_period_indi_fyc_calc,
                comp.mnbs_period_fyp,
                comp.mnbs_comp_dire_ratio,
                comp.mnbs_comp_indi_ratio,
                comp.mnbs_comp_money_calc,
                comp.mnbs_period_point,
                comp.mnbs_activity_coefficient,
                comp.mnbs_comp_money,

                comp.mnqr_period_fyc_calc,
                comp.mnqr_period_fyp,
                comp.mnqr_period_empl,
                comp.mnqr_period_qual,
                comp.mnqr_period_pr36,
                comp.mnqr_period_coll_rate,
                comp.mnqr_comp_ratio,
                comp.mnqr_comp_money_calc,
                comp.mnqr_period_point,
                comp.mnqr_activity_coefficient,
                comp.mnqr_comp_money,

                comp.mnnu_buss_money,
                comp.mnnu_comp_money,

                comp.mnna_period_fyp,
                comp.mnna_deve_count,
                comp.mnna_comp_money,

                comp.comp_mmxii_nagm,
                comp.comp_mmxii_mnnu,
                comp.comp_mmxii_mnna,

                comp.comp_money
            from ams.la_compensation_mmxiii comp
            left join
            (
                select
                    code.code_code position_code,
                    code.code_value position_name
                from ams.cla_codes code
                where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                    and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                    and trunc(valDate, 'MM')
                        between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                        and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
            ) posi
                on posi.position_code = comp.info_position_code
            where comp.record_date = trunc(valDate, 'MM')
                and comp.be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
            order by
                nlssort(comp.info_company_name, 'nls_sort=Vietnamese'),
                nlssort(comp.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(comp.info_unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(comp.info_outlet_name, 'nls_sort=Vietnamese'),
                nlssort(comp.outlet_ams_id, 'nls_sort=Vietnamese');
        end if;
    end;


    procedure mmxiii_get_mnbs01(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor)
    is
        var_record_date date := trunc(valDate, 'MM');
        var_branch_id number(10) := nvl(valBranchID, 0);
        var_agent_id number(10) := nvl(valAgentID, 0);
    begin
        if var_agent_id <> 0 then
            open row_records for
            select  /*+ CARDINALITY(res, 100)*/
                case
                    when res.type_of_data = 0 then
                        rank() over (
                            partition by res.type_of_data
                            order by nlssort(res.mnbs_company_name, 'nls_sort=Vietnamese'),
                                nlssort(res.mnbs_agency_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.mnbs_unit_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.mnbs_outlet_name, 'nls_sort=Vietnamese'),
                                nlssort(res.mnbs_outlet_ams_id, 'nls_sort=Vietnamese')
                        )
                    end noid,
                case
                    when res.type_of_data = 0 then
                        res.outl_company_name
                    end outl_company_name,
                case
                    when res.type_of_data = 0 then
                        res.outl_agency_name
                    when res.type_of_data = 1 then
                        res.outl_agency_name
                    end outl_agency_name,
                case
                    when res.type_of_data = 0  then
                        res.outl_unit_name
                    when res.type_of_data = 1  then
                        res.outl_unit_name
                    end outl_unit_name,
                res.outl_outlet_ams_id,
                res.outl_outlet_name,
                case
                    when res.type_of_data = 0  then
                        res.mnbs_outl_position
                    end mnbs_outl_position,
                res.outl_dire_or_indi,
                res.outl_dire_fyp,
                res.outl_indi_fyp,
                res.outl_fyc_ratio,
                res.outl_unit_level,
                res.outl_unit_ratio,
                res.outl_dire_real_fyc,
                res.outl_dire_calc_fyc,
                res.outl_indi_real_fyc,
                res.outl_indi_calc_fyc,
                res.outl_comp_dire_ratio,
                res.outl_comp_indi_ratio,
                res.outl_comp_money_calc,
                res.outl_period_point,
                res.outl_activity_coefficient,
                res.outl_comp_money
            from
            (
                select /*+ CARDINALITY(outl, 100) CARDINALITY(posi, 100)*/
                    outl.outlet_ams_id mnbs_outlet_ams_id,
                    outl.info_outlet_name mnbs_outlet_name,
                    outl.info_company_name mnbs_company_name,
                    outl.info_agency_name mnbs_agency_name,
                    outl.info_unit_name mnbs_unit_name,

                    outl.outlet_ams_id outl_outlet_ams_id,
                    outl.info_outlet_name outl_outlet_name,
                    outl.info_company_name outl_company_name,
                    outl.info_agency_name outl_agency_name,
                    outl.info_unit_name outl_unit_name,
                    null outl_dire_or_indi,
                    posi.position_name mnbs_outl_position,
                    outl.mnbs_period_fyp outl_dire_fyp,
                    null outl_indi_fyp,
                    null outl_fyc_ratio,
                    null outl_unit_level,
                    null outl_unit_ratio,
                    outl.mnbs_period_dire_fyc outl_dire_real_fyc,
                    outl.mnbs_period_dire_fyc_calc outl_dire_calc_fyc,
                    outl.mnbs_period_indi_fyc outl_indi_real_fyc,
                    outl.mnbs_period_indi_fyc_calc outl_indi_calc_fyc,
                    outl.mnbs_comp_dire_ratio outl_comp_dire_ratio,
                    outl.mnbs_comp_indi_ratio outl_comp_indi_ratio,
                    outl.mnbs_comp_money_calc outl_comp_money_calc,
                    outl.mnbs_period_point  outl_period_point,
                    outl.mnbs_activity_coefficient  outl_activity_coefficient,
                    outl.mnbs_comp_money outl_comp_money,
                    0 type_of_data
                from
                (
                    select /*+ CARDINALITY(comp, 100)*/
                        comp.outlet_ams_id,
                        comp.info_outlet_name,
                        comp.info_company_name,
                        comp.info_agency_name,
                        comp.info_unit_name,
                        comp.mnbs_position_code,
                        comp.mnbs_branch_id,
                        comp.mnbs_branch_ams_id,
                        comp.mnbs_period_fyp,
                        comp.mnbs_period_dire_fyc,
                        comp.mnbs_period_dire_fyc_calc,
                        comp.mnbs_period_indi_fyc,
                        comp.mnbs_period_indi_fyc_calc,
                        comp.mnbs_comp_dire_ratio,
                        comp.mnbs_comp_indi_ratio,
                        comp.mnbs_comp_money_calc,
                        comp.mnbs_period_point,
                        comp.mnbs_activity_coefficient,
                        comp.mnbs_comp_money
                    from ams.la_compensation_mmxiii comp
                    where comp.record_date = trunc(valDate, 'MM')
                        and comp.mnbs_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and comp.mnbs_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                        and comp.outlet_id = var_agent_id
                ) outl
                left join
                (
                    select  /*+ CARDINALITY(code, 100)*/
                        code.code_code position_code,
                        code.code_value position_name
                    from ams.cla_codes code
                    where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                        and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                        and trunc(valDate, 'MM')
                            between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                            and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
                ) posi
                    on posi.position_code = outl.mnbs_position_code

                union all

                select  /*+ CARDINALITY(outl, 100) CARDINALITY(mnbs, 100)*/
                    outl.outlet_ams_id mnbs_outlet_ams_id,
                    outl.info_outlet_name mnbs_outlet_name,
                    outl.info_company_name mnbs_company_name,
                    outl.info_agency_name mnbs_agency_name,
                    outl.info_unit_name mnbs_unit_name,

                    mnbs.outlet_ams_id outl_outlet_ams_id,
                    mnbs.outlet_name outl_outlet_name,
                    mnbs.company_name outl_company_name,
                    mnbs.agency_name outl_agency_name,
                    mnbs.unit_name outl_unit_name,
                    case
                        when
                            (
                                mnbs.mnbs_branch_ams_id = mnbs.agency_ams_id
                                and
                                mnbs.unit_ams_id is null
                            )
                            or
                            (mnbs.mnbs_branch_ams_id = mnbs.unit_ams_id)
                            then
                            AMS_MODL_COMP_MMXIII_REPORT.MNBS_DIRE_TITLE
                        when
                            (mnbs.mnbs_branch_ams_id = mnbs.agency_ams_id)
                            and
                            (mnbs.unit_ams_id is not null)
                            then
                            AMS_MODL_COMP_MMXIII_REPORT.MNBS_INDI_TITLE
                        end outl_dire_or_indi,
                    null mnbs_outl_position,
                    mnbs.mnbs_period_fyp outl_dire_fyp,
                    null outl_indi_fyp,
                    mnbs.mnbs_fyc_ratio outl_fyc_ratio,
                    mnbs.mnbs_unit_level outl_unit_level,
                    mnbs.mnbs_unit_ratio outl_unit_ratio,
                    mnbs.mnbs_period_dire_fyc outl_dire_real_fyc,
                    mnbs.mnbs_period_dire_fyc_calc outl_dire_calc_fyc,
                    mnbs.mnbs_period_indi_fyc outl_indi_real_fyc,
                    mnbs.mnbs_period_indi_fyc_calc outl_indi_calc_fyc,
                    null outl_comp_dire_ratio,
                    null outl_comp_indi_ratio,
                    null outl_comp_money_calc,
                    null outl_period_point,
                    null outl_activity_coefficient,
                    null outl_comp_money,
                    1 type_of_data
                from
                (
                    select /*+ CARDINALITY(comp, 100)*/
                        comp.outlet_id,
                        comp.outlet_ams_id,
                        comp.info_outlet_name,
                        comp.info_company_id,
                        comp.info_company_ams_id,
                        comp.info_company_name,
                        comp.info_agency_id,
                        comp.info_agency_ams_id,
                        comp.info_agency_name,
                        comp.info_unit_id,
                        comp.info_unit_ams_id,
                        comp.info_unit_name,
                        comp.mnbs_branch_id,
                        comp.mnbs_branch_ams_id
                    from ams.la_compensation_mmxiii comp
                    where comp.record_date = trunc(valDate, 'MM')
                        and comp.mnbs_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and comp.mnbs_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                        and comp.outlet_id = var_agent_id
                ) outl
                join
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        *
                    from ams.la_comp_mmxiii_mnbs tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.mnbs_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnbs_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                        and tmp.outlet_ams_id <> tmp.mnbs_outlet_ams_id
                ) mnbs
                    on mnbs.mnbs_branch_ams_id = outl.mnbs_branch_ams_id
            ) res
            order by nlssort(res.mnbs_company_name, 'nls_sort=Vietnamese'),
                nlssort(res.mnbs_agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.mnbs_unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.mnbs_outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.mnbs_outlet_ams_id, 'nls_sort=Vietnamese'),
                res.type_of_data,
                nlssort(res.outl_unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.outl_outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.outl_outlet_ams_id, 'nls_sort=Vietnamese');
       elsif var_branch_id <> 0 then
            open row_records for
            select  /*+ CARDINALITY(res, 100)*/
                case
                    when res.type_of_data = 0 then
                        rank() over (
                            partition by res.type_of_data
                            order by nlssort(res.mnbs_company_name, 'nls_sort=Vietnamese'),
                                nlssort(res.mnbs_agency_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.mnbs_unit_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.mnbs_outlet_name, 'nls_sort=Vietnamese'),
                                nlssort(res.mnbs_outlet_ams_id, 'nls_sort=Vietnamese')
                        )
                    end noid,
                case
                    when res.type_of_data = 0 then
                        res.outl_company_name
                    end outl_company_name,
                case
                    when res.type_of_data = 0 then
                        res.outl_agency_name
                    when res.type_of_data = 1 then
                        res.outl_agency_name
                    end outl_agency_name,
                case
                    when res.type_of_data = 0  then
                        res.outl_unit_name
                    when res.type_of_data = 1  then
                        res.outl_unit_name
                    end outl_unit_name,
                res.outl_outlet_ams_id,
                res.outl_outlet_name,
                case
                    when res.type_of_data = 0  then
                        res.mnbs_outl_position
                    end mnbs_outl_position,
                res.outl_dire_or_indi,
                res.outl_dire_fyp,
                res.outl_indi_fyp,
                res.outl_fyc_ratio,
                res.outl_unit_level,
                res.outl_unit_ratio,
                res.outl_dire_real_fyc,
                res.outl_dire_calc_fyc,
                res.outl_indi_real_fyc,
                res.outl_indi_calc_fyc,
                res.outl_comp_dire_ratio,
                res.outl_comp_indi_ratio,
                res.outl_comp_money_calc,
                res.outl_period_point,
                res.outl_activity_coefficient,
                res.outl_comp_money
            from
            (
                select /*+ CARDINALITY(outl, 100) CARDINALITY(posi, 100)*/
                    outl.outlet_ams_id mnbs_outlet_ams_id,
                    outl.info_outlet_name mnbs_outlet_name,
                    outl.info_company_name mnbs_company_name,
                    outl.info_agency_name mnbs_agency_name,
                    outl.info_unit_name mnbs_unit_name,

                    outl.outlet_ams_id outl_outlet_ams_id,
                    outl.info_outlet_name outl_outlet_name,
                    outl.info_company_name outl_company_name,
                    outl.info_agency_name outl_agency_name,
                    outl.info_unit_name outl_unit_name,
                    null outl_dire_or_indi,
                    posi.position_name mnbs_outl_position,
                    outl.mnbs_period_fyp outl_dire_fyp,
                    null outl_indi_fyp,
                    null outl_fyc_ratio,
                    null outl_unit_level,
                    null outl_unit_ratio,
                    outl.mnbs_period_dire_fyc outl_dire_real_fyc,
                    outl.mnbs_period_dire_fyc_calc outl_dire_calc_fyc,
                    outl.mnbs_period_indi_fyc outl_indi_real_fyc,
                    outl.mnbs_period_indi_fyc_calc outl_indi_calc_fyc,
                    outl.mnbs_comp_dire_ratio outl_comp_dire_ratio,
                    outl.mnbs_comp_indi_ratio outl_comp_indi_ratio,
                    outl.mnbs_comp_money_calc outl_comp_money_calc,
                    outl.mnbs_period_point  outl_period_point,
                    outl.mnbs_activity_coefficient  outl_activity_coefficient,
                    outl.mnbs_comp_money outl_comp_money,
                    0 type_of_data
                from
                (
                    select /*+ CARDINALITY(comp, 100)*/
                        comp.outlet_ams_id,
                        comp.info_outlet_name,
                        comp.info_company_name,
                        comp.info_agency_name,
                        comp.info_unit_name,
                        comp.mnbs_position_code,
                        comp.mnbs_branch_id,
                        comp.mnbs_branch_ams_id,
                        comp.mnbs_period_fyp,
                        comp.mnbs_period_dire_fyc,
                        comp.mnbs_period_dire_fyc_calc,
                        comp.mnbs_period_indi_fyc,
                        comp.mnbs_period_indi_fyc_calc,
                        comp.mnbs_comp_dire_ratio,
                        comp.mnbs_comp_indi_ratio,
                        comp.mnbs_comp_money_calc,
                        comp.mnbs_period_point,
                        comp.mnbs_activity_coefficient,
                        comp.mnbs_comp_money
                    from ams.la_compensation_mmxiii comp
                    where comp.record_date = trunc(valDate, 'MM')
                        and comp.mnbs_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and comp.mnbs_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                        and var_branch_id in
                        (
                            comp.info_company_id,
                            comp.info_office_id,
                            comp.info_agency_id,
                            comp.info_unit_id
                        )
                ) outl
                left join
                (
                    select  /*+ CARDINALITY(code, 100)*/
                        code.code_code position_code,
                        code.code_value position_name
                    from ams.cla_codes code
                    where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                        and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                        and trunc(valDate, 'MM')
                            between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                            and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
                ) posi
                    on posi.position_code = outl.mnbs_position_code

                union all

                select  /*+ CARDINALITY(outl, 100) CARDINALITY(mnbs, 100)*/
                    outl.outlet_ams_id mnbs_outlet_ams_id,
                    outl.info_outlet_name mnbs_outlet_name,
                    outl.info_company_name mnbs_company_name,
                    outl.info_agency_name mnbs_agency_name,
                    outl.info_unit_name mnbs_unit_name,

                    mnbs.outlet_ams_id outl_outlet_ams_id,
                    mnbs.outlet_name outl_outlet_name,
                    mnbs.company_name outl_company_name,
                    mnbs.agency_name outl_agency_name,
                    mnbs.unit_name outl_unit_name,
                    case
                        when
                            (
                                mnbs.mnbs_branch_ams_id = mnbs.agency_ams_id
                                and
                                mnbs.unit_ams_id is null
                            )
                            or
                            (mnbs.mnbs_branch_ams_id = mnbs.unit_ams_id)
                            then
                            AMS_MODL_COMP_MMXIII_REPORT.MNBS_DIRE_TITLE
                        when
                            (mnbs.mnbs_branch_ams_id = mnbs.agency_ams_id)
                            and
                            (mnbs.unit_ams_id is not null)
                            then
                            AMS_MODL_COMP_MMXIII_REPORT.MNBS_INDI_TITLE
                        end outl_dire_or_indi,
                    null mnbs_outl_position,
                    mnbs.mnbs_period_fyp outl_dire_fyp,
                    null outl_indi_fyp,
                    mnbs.mnbs_fyc_ratio outl_fyc_ratio,
                    mnbs.mnbs_unit_level outl_unit_level,
                    mnbs.mnbs_unit_ratio outl_unit_ratio,
                    mnbs.mnbs_period_dire_fyc outl_dire_real_fyc,
                    mnbs.mnbs_period_dire_fyc_calc outl_dire_calc_fyc,
                    mnbs.mnbs_period_indi_fyc outl_indi_real_fyc,
                    mnbs.mnbs_period_indi_fyc_calc outl_indi_calc_fyc,
                    null outl_comp_dire_ratio,
                    null outl_comp_indi_ratio,
                    null outl_comp_money_calc,
                    null outl_period_point,
                    null outl_activity_coefficient,
                    null outl_comp_money,
                    1 type_of_data
                from
                (
                    select /*+ CARDINALITY(comp, 100)*/
                        comp.outlet_id,
                        comp.outlet_ams_id,
                        comp.info_outlet_name,
                        comp.info_company_id,
                        comp.info_company_ams_id,
                        comp.info_company_name,
                        comp.info_agency_id,
                        comp.info_agency_ams_id,
                        comp.info_agency_name,
                        comp.info_unit_id,
                        comp.info_unit_ams_id,
                        comp.info_unit_name,
                        comp.mnbs_branch_id,
                        comp.mnbs_branch_ams_id
                    from ams.la_compensation_mmxiii comp
                    where comp.record_date = trunc(valDate, 'MM')
                        and comp.mnbs_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and comp.mnbs_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                        and var_branch_id in
                        (
                            comp.info_company_id,
                            comp.info_office_id,
                            comp.info_agency_id,
                            comp.info_unit_id
                        )
                ) outl
                join
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        *
                    from ams.la_comp_mmxiii_mnbs tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.mnbs_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnbs_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                        and tmp.outlet_ams_id <> tmp.mnbs_outlet_ams_id
                ) mnbs
                    on mnbs.mnbs_branch_ams_id = outl.mnbs_branch_ams_id
            ) res
            order by nlssort(res.mnbs_company_name, 'nls_sort=Vietnamese'),
                nlssort(res.mnbs_agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.mnbs_unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.mnbs_outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.mnbs_outlet_ams_id, 'nls_sort=Vietnamese'),
                res.type_of_data,
                nlssort(res.outl_unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.outl_outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.outl_outlet_ams_id, 'nls_sort=Vietnamese');
       elsif var_branch_id = 0 then
            open row_records for
            select  /*+ CARDINALITY(res, 100)*/
                case
                    when res.type_of_data = 0 then
                        rank() over (
                            partition by res.type_of_data
                            order by nlssort(res.mnbs_company_name, 'nls_sort=Vietnamese'),
                                nlssort(res.mnbs_agency_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.mnbs_unit_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.mnbs_outlet_name, 'nls_sort=Vietnamese'),
                                nlssort(res.mnbs_outlet_ams_id, 'nls_sort=Vietnamese')
                        )
                    end noid,
                case
                    when res.type_of_data = 0 then
                        res.outl_company_name
                    end outl_company_name,
                case
                    when res.type_of_data = 0 then
                        res.outl_agency_name
                    when res.type_of_data = 1 then
                        res.outl_agency_name
                    end outl_agency_name,
                case
                    when res.type_of_data = 0  then
                        res.outl_unit_name
                    when res.type_of_data = 1  then
                        res.outl_unit_name
                    end outl_unit_name,
                res.outl_outlet_ams_id,
                res.outl_outlet_name,
                case
                    when res.type_of_data = 0  then
                        res.mnbs_outl_position
                    end mnbs_outl_position,
                res.outl_dire_or_indi,
                res.outl_dire_fyp,
                res.outl_indi_fyp,
                res.outl_fyc_ratio,
                res.outl_unit_level,
                res.outl_unit_ratio,
                res.outl_dire_real_fyc,
                res.outl_dire_calc_fyc,
                res.outl_indi_real_fyc,
                res.outl_indi_calc_fyc,
                res.outl_comp_dire_ratio,
                res.outl_comp_indi_ratio,
                res.outl_comp_money_calc,
                res.outl_period_point,
                res.outl_activity_coefficient,
                res.outl_comp_money
            from
            (
                select /*+ CARDINALITY(outl, 100) CARDINALITY(posi, 100)*/
                    outl.outlet_ams_id mnbs_outlet_ams_id,
                    outl.info_outlet_name mnbs_outlet_name,
                    outl.info_company_name mnbs_company_name,
                    outl.info_agency_name mnbs_agency_name,
                    outl.info_unit_name mnbs_unit_name,

                    outl.outlet_ams_id outl_outlet_ams_id,
                    outl.info_outlet_name outl_outlet_name,
                    outl.info_company_name outl_company_name,
                    outl.info_agency_name outl_agency_name,
                    outl.info_unit_name outl_unit_name,
                    null outl_dire_or_indi,
                    posi.position_name mnbs_outl_position,
                    outl.mnbs_period_fyp outl_dire_fyp,
                    null outl_indi_fyp,
                    null outl_fyc_ratio,
                    null outl_unit_level,
                    null outl_unit_ratio,
                    outl.mnbs_period_dire_fyc outl_dire_real_fyc,
                    outl.mnbs_period_dire_fyc_calc outl_dire_calc_fyc,
                    outl.mnbs_period_indi_fyc outl_indi_real_fyc,
                    outl.mnbs_period_indi_fyc_calc outl_indi_calc_fyc,
                    outl.mnbs_comp_dire_ratio outl_comp_dire_ratio,
                    outl.mnbs_comp_indi_ratio outl_comp_indi_ratio,
                    outl.mnbs_comp_money_calc outl_comp_money_calc,
                    outl.mnbs_period_point  outl_period_point,
                    outl.mnbs_activity_coefficient  outl_activity_coefficient,
                    outl.mnbs_comp_money outl_comp_money,
                    0 type_of_data
                from
                (
                    select /*+ CARDINALITY(comp, 100)*/
                        comp.outlet_ams_id,
                        comp.info_outlet_name,
                        comp.info_company_name,
                        comp.info_agency_name,
                        comp.info_unit_name,
                        comp.mnbs_position_code,
                        comp.mnbs_branch_id,
                        comp.mnbs_branch_ams_id,
                        comp.mnbs_period_fyp,
                        comp.mnbs_period_dire_fyc,
                        comp.mnbs_period_dire_fyc_calc,
                        comp.mnbs_period_indi_fyc,
                        comp.mnbs_period_indi_fyc_calc,
                        comp.mnbs_comp_dire_ratio,
                        comp.mnbs_comp_indi_ratio,
                        comp.mnbs_comp_money_calc,
                        comp.mnbs_period_point,
                        comp.mnbs_activity_coefficient,
                        comp.mnbs_comp_money
                    from ams.la_compensation_mmxiii comp
                    where comp.record_date = trunc(valDate, 'MM')
                        and comp.mnbs_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and comp.mnbs_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                ) outl
                left join
                (
                    select  /*+ CARDINALITY(code, 100)*/
                        code.code_code position_code,
                        code.code_value position_name
                    from ams.cla_codes code
                    where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                        and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                        and trunc(valDate, 'MM')
                            between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                            and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
                ) posi
                    on posi.position_code = outl.mnbs_position_code

                union all

                select  /*+ CARDINALITY(outl, 100) CARDINALITY(mnbs, 100)*/
                    outl.outlet_ams_id mnbs_outlet_ams_id,
                    outl.info_outlet_name mnbs_outlet_name,
                    outl.info_company_name mnbs_company_name,
                    outl.info_agency_name mnbs_agency_name,
                    outl.info_unit_name mnbs_unit_name,

                    mnbs.outlet_ams_id outl_outlet_ams_id,
                    mnbs.outlet_name outl_outlet_name,
                    mnbs.company_name outl_company_name,
                    mnbs.agency_name outl_agency_name,
                    mnbs.unit_name outl_unit_name,
                    case
                        when
                            (
                                mnbs.mnbs_branch_ams_id = mnbs.agency_ams_id
                                and
                                mnbs.unit_ams_id is null
                            )
                            or
                            (mnbs.mnbs_branch_ams_id = mnbs.unit_ams_id)
                            then
                            AMS_MODL_COMP_MMXIII_REPORT.MNBS_DIRE_TITLE
                        when
                            (mnbs.mnbs_branch_ams_id = mnbs.agency_ams_id)
                            and
                            (mnbs.unit_ams_id is not null)
                            then
                            AMS_MODL_COMP_MMXIII_REPORT.MNBS_INDI_TITLE
                        end outl_dire_or_indi,
                    null mnbs_outl_position,
                    mnbs.mnbs_period_fyp outl_dire_fyp,
                    null outl_indi_fyp,
                    mnbs.mnbs_fyc_ratio outl_fyc_ratio,
                    mnbs.mnbs_unit_level outl_unit_level,
                    mnbs.mnbs_unit_ratio outl_unit_ratio,
                    mnbs.mnbs_period_dire_fyc outl_dire_real_fyc,
                    mnbs.mnbs_period_dire_fyc_calc outl_dire_calc_fyc,
                    mnbs.mnbs_period_indi_fyc outl_indi_real_fyc,
                    mnbs.mnbs_period_indi_fyc_calc outl_indi_calc_fyc,
                    null outl_comp_dire_ratio,
                    null outl_comp_indi_ratio,
                    null outl_comp_money_calc,
                    null outl_period_point,
                    null outl_activity_coefficient,
                    null outl_comp_money,
                    1 type_of_data
                from
                (
                    select /*+ CARDINALITY(comp, 100)*/
                        comp.outlet_id,
                        comp.outlet_ams_id,
                        comp.info_outlet_name,
                        comp.info_company_id,
                        comp.info_company_ams_id,
                        comp.info_company_name,
                        comp.info_agency_id,
                        comp.info_agency_ams_id,
                        comp.info_agency_name,
                        comp.info_unit_id,
                        comp.info_unit_ams_id,
                        comp.info_unit_name,
                        comp.mnbs_branch_id,
                        comp.mnbs_branch_ams_id
                    from ams.la_compensation_mmxiii comp
                    where comp.record_date = trunc(valDate, 'MM')
                        and comp.mnbs_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and comp.mnbs_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                ) outl
                join
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        *
                    from ams.la_comp_mmxiii_mnbs tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.mnbs_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnbs_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                        and tmp.outlet_ams_id <> tmp.mnbs_outlet_ams_id
                ) mnbs
                    on mnbs.mnbs_branch_ams_id = outl.mnbs_branch_ams_id
            ) res
            order by nlssort(res.mnbs_company_name, 'nls_sort=Vietnamese'),
                nlssort(res.mnbs_agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.mnbs_unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.mnbs_outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.mnbs_outlet_ams_id, 'nls_sort=Vietnamese'),
                res.type_of_data,
                nlssort(res.outl_unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.outl_outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.outl_outlet_ams_id, 'nls_sort=Vietnamese');
        end if;
    end;

    /*
      Version: 1.1
      Nguoi thay doi: Vu Duc Thong
      Ngay thay doi: 07/11/2013
      Noi dung: Thay doi hien thi cấp đẻ và tên của nhóm.
    */
    --Lay cau truc phat trien ban nhom cho no o day
    procedure mmxiii_get_mnbs02(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor)
    is
        var_record_date date := trunc(valDate, 'MM');
        var_branch_id number(10) := nvl(valBranchID, 0);
        var_agent_id number(10) := nvl(valAgentID, 0);
    begin
        if var_branch_id <> 0 then
            open row_records for
                select /*+ CARDINALITY(outl, 100)*/
                    outl.company_name,
                    outl.office_name,
                    outl.agency_name  ,
                    nvl(unit1.branch_name, agency.branch_name) umnm_unit_name,
                    unit.branch_name unit_name,
                    outl.outlet_ams_id,
                    outl.outlet_name,
                    to_char(des.position_date, 'DD/MM/YYYY') position_date,
                    nvl(dev.umnm_unit_level, 0) umnm_agency_status,
                    des.umnm_unit_level,
                    round(des.umnm_unit_ratio, 2) umnm_unit_ratio
                from
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_ams_id,
                        tmp.unit_ams_id,
                        tmp.position_date,
                        tmp.umnm_unit_ams_id,
                        tmp.umnm_agency_status,
                        tmp.umnm_unit_level,
                        tmp.umnm_unit_ratio
                    from ams.la_comp_mmxiii_unit_des_source tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                ) des
                join
                (
                   select /*+ CARDINALITY(outl, 100)*/
                       outl.outlet_id,
                       outl.company_name,
                       outl.office_name,
                       outl.agency_name,
                       outl.outlet_ams_id,
                       outl.outlet_name
                   from ams.serv_outlet_data outl
                   where outl.record_date = trunc(valDate, 'MM')
                        and var_branch_id in
                        (
                            outl.company_id,
                            outl.office_id,
                            outl.agency_id,
                            outl.unit_id
                        )
                ) outl
                    on outl.outlet_ams_id = des.outlet_ams_id
                left join
                (
                    select /*+ CARDINALITY(tmp, 100) */
                        tmp.branch_id,
                        tmp.branch_ams_id,
                        tmp.branch_name
                    from ams.serv_branch_mapping tmp
                    where tmp.branch_type = 'NHOM'
                ) unit
                    on unit.branch_ams_id = des.unit_ams_id
                left join
                (
                    select /*+ CARDINALITY(tmp, 100) */
                        tmp.branch_id,
                        tmp.branch_ams_id,
                        tmp.branch_name
                    from ams.serv_branch_mapping tmp
                    where tmp.branch_type = 'NHOM'
                ) unit1
                    on unit1.branch_ams_id = des.umnm_unit_ams_id
                left join
                (
                    select /*+ CARDINALITY(tmp, 100) */
                        tmp.branch_id,
                        tmp.branch_ams_id,
                        tmp.branch_name
                    from ams.serv_branch_mapping tmp
                    where tmp.branch_type = 'BAN'
                ) agency
                    on agency.branch_ams_id = des.umnm_unit_ams_id
                left join
                (
                     select des.unit_ams_id, max(des.umnm_unit_level) umnm_unit_level
                     from la_comp_mmxiii_unit_des_source des
                     group by des.unit_ams_id
                ) dev
                    on des.umnm_unit_ams_id = dev.unit_ams_id
              order by
                nlssort(outl.company_name, 'nls_sort=Vietnamese'),
                nlssort(outl.office_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(outl.agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(unit.branch_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(unit1.branch_name, 'nls_sort=Vietnamese') nulls first;
       elsif var_branch_id = 0 then
            open row_records for
                select /*+ CARDINALITY(outl, 100)*/
                    outl.company_name,
                    outl.office_name,
                    outl.agency_name  ,
                    nvl(unit1.branch_name, agency.branch_name) umnm_unit_name,
                    unit.branch_name unit_name,
                    outl.outlet_ams_id,
                    outl.outlet_name,
                    to_char(des.position_date, 'DD/MM/YYYY') position_date,
                    nvl(dev.umnm_unit_level, 0) umnm_agency_status,
                    des.umnm_unit_level,
                    round(des.umnm_unit_ratio, 2) umnm_unit_ratio
                from
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_ams_id,
                        tmp.unit_ams_id,
                        tmp.position_date,
                        tmp.umnm_unit_ams_id,
                        tmp.umnm_agency_status,
                        tmp.umnm_unit_level,
                        tmp.umnm_unit_ratio
                    from ams.la_comp_mmxiii_unit_des_source tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                ) des
                join
                (
                   select /*+ CARDINALITY(outl, 100)*/
                       outl.outlet_id,
                       outl.company_name,
                       outl.office_name,
                       outl.agency_name,
                       outl.outlet_ams_id,
                       outl.outlet_name
                   from ams.serv_outlet_data outl
                   where outl.record_date = trunc(valDate, 'MM')
                ) outl
                    on outl.outlet_ams_id = des.outlet_ams_id
                left join
                (
                    select /*+ CARDINALITY(tmp, 100) */
                        tmp.branch_id,
                        tmp.branch_ams_id,
                        tmp.branch_name
                    from ams.serv_branch_mapping tmp
                    where tmp.branch_type = 'NHOM'
                ) unit
                    on unit.branch_ams_id = des.unit_ams_id
                left join
                (
                    select /*+ CARDINALITY(tmp, 100) */
                        tmp.branch_id,
                        tmp.branch_ams_id,
                        tmp.branch_name
                    from ams.serv_branch_mapping tmp
                    where tmp.branch_type = 'NHOM'
                ) unit1
                    on unit1.branch_ams_id = des.umnm_unit_ams_id
                left join
                (
                    select /*+ CARDINALITY(tmp, 100) */
                        tmp.branch_id,
                        tmp.branch_ams_id,
                        tmp.branch_name
                    from ams.serv_branch_mapping tmp
                    where tmp.branch_type = 'BAN'
                ) agency
                    on agency.branch_ams_id = des.umnm_unit_ams_id
                left join
                (
                     select des.unit_ams_id, max(des.umnm_unit_level) umnm_unit_level
                     from la_comp_mmxiii_unit_des_source des
                     group by des.unit_ams_id
                ) dev
                    on des.umnm_unit_ams_id = dev.unit_ams_id
              order by
                nlssort(outl.company_name, 'nls_sort=Vietnamese'),
                nlssort(outl.office_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(outl.agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(unit.branch_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(unit1.branch_name, 'nls_sort=Vietnamese') nulls first;
        end if;
    end;

    procedure mmxiii_get_nagm01(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor)
    is
        var_record_date date := trunc(valDate, 'MM');
        var_branch_id number(10) := nvl(valBranchID, 0);
        var_agent_id number(10) := nvl(valAgentID, 0);
    begin
        if var_agent_id <> 0 then
        open row_records for
        select
            case
                when res.type_of_data = 0 then
                    rank() over (
                        partition by res.type_of_data
                        order by nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                            nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                            nlssort(res.info_unit_name, 'nls_sort=Vietnamese') nulls first,
                            nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                            nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese')
                    )
                end noid,
            case
                when res.type_of_data = 0 then
                    res.outlet_ams_id
                end outlet_ams_id,
            case
                when res.type_of_data = 0 then
                    res.info_outlet_name
                end info_outlet_name,
            case
                when res.type_of_data = 0 then
                    res.info_company_ams_id
                end info_company_ams_id,
            case
                when res.type_of_data = 0 then
                    res.info_company_name
                end info_company_name,
            case
                when res.type_of_data = 0 then
                    res.info_agency_ams_id
                end info_agency_ams_id,
            case
                when res.type_of_data = 0 then
                    res.info_agency_name
                end info_agency_name,
            case
                when res.type_of_data = 0 then
                    res.info_unit_ams_id
                end info_unit_ams_id,
            case
                when res.type_of_data = 0 then
                    res.info_unit_name
                end info_unit_name,
            to_char(res.info_effective_date, 'DD/MM/YYYY') info_effective_date,
            to_char(res.info_terminative_date, 'DD/MM/YYYY') info_terminative_date,
            to_char(res.nagm_data_date, 'DD/MM/YYYY') nagm_data_date,
            case
                when res.type_of_data = 0 then
                    res.nagm_senr_by_months
                end nagm_senr_by_months,
            res.nagm_period_ip,
            res.nagm_cond_ip,
            res.nagm_period_issue,
            res.nagm_cond_issue,
            res.nagm_period_afis,
            res.nagm_period_afif,
            res.nagm_period_pr36,
            res.nagm_cond_pr36,
            res.nagm_period_coll_etmt,
            res.nagm_period_coll_real,
            res.nagm_period_coll_rate,
            res.nagm_cond_coll_rate,
            res.nagm_comp_money,
            case
                when res.type_of_data = 0 then
                    AMS_REPO_COMPENSATION.NAGM_DATA_GENR
                when res.type_of_data = 1 then
                    AMS_REPO_COMPENSATION.NAGM_DATA_MONT
                end type_of_data
        from
        (
            select
                tmp.outlet_ams_id,
                tmp.info_outlet_name,
                tmp.info_company_ams_id,
                tmp.info_company_name,
                tmp.info_agency_ams_id,
                tmp.info_agency_name,
                tmp.info_unit_ams_id,
                tmp.info_unit_name,
                tmp.info_effective_date,
                tmp.info_terminative_date,
                tmp.record_date nagm_data_date,
                tmp.nagm_senr_by_months,
                tmp.nagm_period_ip,
                tmp.nagm_cond_ip,
                tmp.nagm_period_issue,
                tmp.nagm_cond_issue,
                tmp.nagm_period_afis,
                tmp.nagm_period_afif,
                tmp.nagm_period_pr36,
                tmp.nagm_cond_pr36,
                tmp.nagm_period_coll_etmt,
                tmp.nagm_period_coll_real,
                tmp.nagm_period_coll_rate,
                tmp.nagm_cond_coll_rate,
                tmp.nagm_comp_money,
                0 type_of_data
            from ams.la_compensation_mmxiii tmp
            where tmp.record_date = trunc(valDate, 'MM')
                and tmp.nagm_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                and tmp.nagm_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                and tmp.outlet_id = var_agent_id

            union all

            select
                outl.outlet_ams_id,
                outl.info_outlet_name,
                outl.info_company_ams_id,
                outl.info_company_name,
                outl.info_agency_ams_id,
                outl.info_agency_name,
                outl.info_unit_ams_id,
                outl.info_unit_name,
                null info_effective_date,
                null info_terminative_date,
                nagm.nagm_data_date,
                null nagm_senr_by_months,
                nagm.nagm_period_ip,
                null nagm_cond_ip,
                nagm.nagm_period_issue,
                null nagm_cond_issue,
                null nagm_period_afis,
                null nagm_period_afif,
                null nagm_period_pr36,
                null nagm_cond_pr36,
                nagm.nagm_period_coll_etmt,
                nagm.nagm_period_coll_real,
                null nagm_period_coll_rate,
                null nagm_cond_coll_rate,
                null nagm_comp_money,
                1 type_of_data
            from
            (
                select
                    comp.outlet_ams_id,
                    comp.info_outlet_name,
                    comp.info_company_ams_id,
                    comp.info_company_name,
                    comp.info_agency_ams_id,
                    comp.info_agency_name,
                    comp.info_unit_ams_id,
                    comp.info_unit_name
                from ams.la_compensation_mmxiii comp
                where comp.record_date = trunc(valDate, 'MM')
                    and comp.nagm_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                    and comp.nagm_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                    and comp.outlet_id = var_agent_id
            ) outl
            join
            (
                select
                    tmp.outlet_ams_id,
                    tmp.outlet_name info_outlet_name,
                    tmp.nagm_data_date,
                    tmp.nagm_period_ip,
                    tmp.nagm_period_issue,
                    tmp.nagm_period_afis,
                    tmp.nagm_period_afif,
                    tmp.nagm_period_pr36,
                    tmp.nagm_period_coll_etmt,
                    tmp.nagm_period_coll_real,
                    tmp.nagm_period_coll_rate
                from ams.la_comp_mmxiii_nagm tmp
                where tmp.record_date = trunc(valDate, 'MM')
                    and tmp.nagm_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                    and tmp.nagm_be_paid  = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_DTL
                    and tmp.outlet_id = var_agent_id
            ) nagm
                on nagm.outlet_ams_id = outl.outlet_ams_id
        ) res;
       elsif var_branch_id <> 0 then
            open row_records for
            select
                case
                    when res.type_of_data = 0 then
                        rank() over (
                            partition by res.type_of_data
                            order by nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                                nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.info_unit_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese')
                        )
                    end noid,
                case
                    when res.type_of_data = 0 then
                        res.outlet_ams_id
                    end outlet_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_outlet_name
                    end info_outlet_name,
                case
                    when res.type_of_data = 0 then
                        res.info_company_ams_id
                    end info_company_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_company_name
                    end info_company_name,
                case
                    when res.type_of_data = 0 then
                        res.info_agency_ams_id
                    end info_agency_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_agency_name
                    end info_agency_name,
                case
                    when res.type_of_data = 0 then
                        res.info_unit_ams_id
                    end info_unit_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_unit_name
                    end info_unit_name,
                to_char(res.info_effective_date, 'DD/MM/YYYY') info_effective_date,
                to_char(res.info_terminative_date, 'DD/MM/YYYY') info_terminative_date,
                to_char(res.nagm_data_date, 'DD/MM/YYYY') nagm_data_date,
                case
                    when res.type_of_data = 0 then
                        res.nagm_senr_by_months
                    end nagm_senr_by_months,
                res.nagm_period_ip,
                res.nagm_cond_ip,
                res.nagm_period_issue,
                res.nagm_cond_issue,
                res.nagm_period_afis,
                res.nagm_period_afif,
                res.nagm_period_pr36,
                res.nagm_cond_pr36,
                res.nagm_period_coll_etmt,
                res.nagm_period_coll_real,
                res.nagm_period_coll_rate,
                res.nagm_cond_coll_rate,
                res.nagm_comp_money,
                case
                    when res.type_of_data = 0 then
                        AMS_REPO_COMPENSATION.NAGM_DATA_GENR
                    when res.type_of_data = 1 then
                        AMS_REPO_COMPENSATION.NAGM_DATA_MONT
                    end type_of_data
            from
            (
                select
                    tmp.outlet_ams_id,
                    tmp.info_outlet_name,
                    tmp.info_company_ams_id,
                    tmp.info_company_name,
                    tmp.info_agency_ams_id,
                    tmp.info_agency_name,
                    tmp.info_unit_ams_id,
                    tmp.info_unit_name,
                    tmp.info_effective_date,
                    tmp.info_terminative_date,
                    tmp.record_date nagm_data_date,
                    tmp.nagm_senr_by_months,
                    tmp.nagm_period_ip,
                    tmp.nagm_cond_ip,
                    tmp.nagm_period_issue,
                    tmp.nagm_cond_issue,
                    tmp.nagm_period_afis,
                    tmp.nagm_period_afif,
                    tmp.nagm_period_pr36,
                    tmp.nagm_cond_pr36,
                    tmp.nagm_period_coll_etmt,
                    tmp.nagm_period_coll_real,
                    tmp.nagm_period_coll_rate,
                    tmp.nagm_cond_coll_rate,
                    tmp.nagm_comp_money,
                    0 type_of_data
                from ams.la_compensation_mmxiii tmp
                where tmp.record_date = trunc(valDate, 'MM')
                    and tmp.nagm_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                    and tmp.nagm_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                    and var_branch_id in
                    (
                        tmp.info_company_id,
                        tmp.info_office_id,
                        tmp.info_agency_id,
                        tmp.info_unit_id
                    )

                union all

                select
                    outl.outlet_ams_id,
                    outl.info_outlet_name,
                    outl.info_company_ams_id,
                    outl.info_company_name,
                    outl.info_agency_ams_id,
                    outl.info_agency_name,
                    outl.info_unit_ams_id,
                    outl.info_unit_name,
                    null info_effective_date,
                    null info_terminative_date,
                    nagm.nagm_data_date,
                    null nagm_senr_by_months,
                    nagm.nagm_period_ip,
                    null nagm_cond_ip,
                    nagm.nagm_period_issue,
                    null nagm_cond_issue,
                    null nagm_period_afis,
                    null nagm_period_afif,
                    null nagm_period_pr36,
                    null nagm_cond_pr36,
                    nagm.nagm_period_coll_etmt,
                    nagm.nagm_period_coll_real,
                    null nagm_period_coll_rate,
                    null nagm_cond_coll_rate,
                    null nagm_comp_money,
                    1 type_of_data
                from
                (
                    select
                        comp.outlet_ams_id,
                        comp.info_outlet_name,
                        comp.info_company_ams_id,
                        comp.info_company_name,
                        comp.info_agency_ams_id,
                        comp.info_agency_name,
                        comp.info_unit_ams_id,
                        comp.info_unit_name
                    from ams.la_compensation_mmxiii comp
                    where comp.record_date = trunc(valDate, 'MM')
                        and comp.nagm_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and comp.nagm_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                        and var_branch_id in
                        (
                            comp.info_company_id,
                            comp.info_office_id,
                            comp.info_agency_id,
                            comp.info_unit_id
                        )
                ) outl
                join
                (
                    select
                        tmp.outlet_ams_id,
                        tmp.outlet_name info_outlet_name,
                        tmp.nagm_data_date,
                        tmp.nagm_period_ip,
                        tmp.nagm_period_issue,
                        tmp.nagm_period_afis,
                        tmp.nagm_period_afif,
                        tmp.nagm_period_pr36,
                        tmp.nagm_period_coll_etmt,
                        tmp.nagm_period_coll_real,
                        tmp.nagm_period_coll_rate
                    from ams.la_comp_mmxiii_nagm tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.nagm_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.nagm_be_paid  = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_DTL
                ) nagm
                    on nagm.outlet_ams_id = outl.outlet_ams_id
            ) res
            order by
                nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.info_unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese'),
                res.type_of_data,
                res.nagm_data_date;
       elsif var_branch_id = 0 then
            open row_records for
            select
                case
                    when res.type_of_data = 0 then
                        rank() over (
                            partition by res.type_of_data
                            order by nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                                nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.info_unit_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese')
                        )
                    end noid,
                case
                    when res.type_of_data = 0 then
                        res.outlet_ams_id
                    end outlet_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_outlet_name
                    end info_outlet_name,
                case
                    when res.type_of_data = 0 then
                        res.info_company_ams_id
                    end info_company_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_company_name
                    end info_company_name,
                case
                    when res.type_of_data = 0 then
                        res.info_agency_ams_id
                    end info_agency_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_agency_name
                    end info_agency_name,
                case
                    when res.type_of_data = 0 then
                        res.info_unit_ams_id
                    end info_unit_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_unit_name
                    end info_unit_name,
                to_char(res.info_effective_date, 'DD/MM/YYYY') info_effective_date,
                to_char(res.info_terminative_date, 'DD/MM/YYYY') info_terminative_date,
                to_char(res.nagm_data_date, 'DD/MM/YYYY') nagm_data_date,
                case
                    when res.type_of_data = 0 then
                        res.nagm_senr_by_months
                    end nagm_senr_by_months,
                res.nagm_period_ip,
                res.nagm_cond_ip,
                res.nagm_period_issue,
                res.nagm_cond_issue,
                res.nagm_period_afis,
                res.nagm_period_afif,
                res.nagm_period_pr36,
                res.nagm_cond_pr36,
                res.nagm_period_coll_etmt,
                res.nagm_period_coll_real,
                res.nagm_period_coll_rate,
                res.nagm_cond_coll_rate,
                res.nagm_comp_money,
                case
                    when res.type_of_data = 0 then
                        AMS_REPO_COMPENSATION.NAGM_DATA_GENR
                    when res.type_of_data = 1 then
                        AMS_REPO_COMPENSATION.NAGM_DATA_MONT
                    end type_of_data
            from
            (
                select
                    tmp.outlet_ams_id,
                    tmp.info_outlet_name,
                    tmp.info_company_ams_id,
                    tmp.info_company_name,
                    tmp.info_agency_ams_id,
                    tmp.info_agency_name,
                    tmp.info_unit_ams_id,
                    tmp.info_unit_name,
                    tmp.info_effective_date,
                    tmp.info_terminative_date,
                    tmp.record_date nagm_data_date,
                    tmp.nagm_senr_by_months,
                    tmp.nagm_period_ip,
                    tmp.nagm_cond_ip,
                    tmp.nagm_period_issue,
                    tmp.nagm_cond_issue,
                    tmp.nagm_period_afis,
                    tmp.nagm_period_afif,
                    tmp.nagm_period_pr36,
                    tmp.nagm_cond_pr36,
                    tmp.nagm_period_coll_etmt,
                    tmp.nagm_period_coll_real,
                    tmp.nagm_period_coll_rate,
                    tmp.nagm_cond_coll_rate,
                    tmp.nagm_comp_money,
                    0 type_of_data
                from ams.la_compensation_mmxiii tmp
                where tmp.record_date = trunc(valDate, 'MM')
                    and tmp.nagm_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                    and tmp.nagm_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES

                union all

                select
                    outl.outlet_ams_id,
                    outl.info_outlet_name,
                    outl.info_company_ams_id,
                    outl.info_company_name,
                    outl.info_agency_ams_id,
                    outl.info_agency_name,
                    outl.info_unit_ams_id,
                    outl.info_unit_name,
                    null info_effective_date,
                    null info_terminative_date,
                    nagm.nagm_data_date,
                    null nagm_senr_by_months,
                    nagm.nagm_period_ip,
                    null nagm_cond_ip,
                    nagm.nagm_period_issue,
                    null nagm_cond_issue,
                    null nagm_period_afis,
                    null nagm_period_afif,
                    null nagm_period_pr36,
                    null nagm_cond_pr36,
                    nagm.nagm_period_coll_etmt,
                    nagm.nagm_period_coll_real,
                    null nagm_period_coll_rate,
                    null nagm_cond_coll_rate,
                    null nagm_comp_money,
                    1 type_of_data
                from
                (
                    select
                        comp.outlet_ams_id,
                        comp.info_outlet_name,
                        comp.info_company_ams_id,
                        comp.info_company_name,
                        comp.info_agency_ams_id,
                        comp.info_agency_name,
                        comp.info_unit_ams_id,
                        comp.info_unit_name
                    from ams.la_compensation_mmxiii comp
                    where comp.record_date = trunc(valDate, 'MM')
                        and comp.nagm_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and comp.nagm_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                ) outl
                join
                (
                    select
                        tmp.outlet_ams_id,
                        tmp.outlet_name info_outlet_name,
                        tmp.nagm_data_date,
                        tmp.nagm_period_ip,
                        tmp.nagm_period_issue,
                        tmp.nagm_period_afis,
                        tmp.nagm_period_afif,
                        tmp.nagm_period_pr36,
                        tmp.nagm_period_coll_etmt,
                        tmp.nagm_period_coll_real,
                        tmp.nagm_period_coll_rate
                    from ams.la_comp_mmxiii_nagm tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.nagm_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.nagm_be_paid  = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_DTL
                ) nagm
                    on nagm.outlet_ams_id = outl.outlet_ams_id
            ) res
            order by
                nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.info_unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese'),
                res.type_of_data,
                res.nagm_data_date;
        end if;
    end;

    /*thuong quy DL*/
    procedure mmxiii_get_agqr01(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor)
    is
        var_branch_id number(10) := nvl(valBranchID, 0);
        var_agent_id number(10) := nvl(valAgentID, 0);
    begin
        if var_agent_id <> 0 then
            open row_records for
            select
                case
                    when res.type_of_data = 0 then
                        rank() over (
                            partition by res.type_of_data
                            order by nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                                nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.info_unit_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese')
                        )
                    end noid,
                case
                    when res.type_of_data = 0 then
                        res.outlet_ams_id
                    end outlet_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_outlet_name
                    end info_outlet_name,
                case
                    when res.type_of_data = 0 then
                        res.info_company_name
                    end info_company_name,
                case
                    when res.type_of_data = 0 then
                        res.info_agency_name
                    end info_agency_name,
                case
                    when res.type_of_data = 0 then
                        res.info_unit_name
                    end info_unit_name,
                res.position_name,
                to_char(res.info_effective_date, 'DD/MM/YYYY') info_effective_date,
                to_char(res.info_terminative_date, 'DD/MM/YYYY') info_terminative_date,
                to_char(res.agqr_data_date, 'DD/MM/YYYY') agqr_data_date,
                res.agqr_period_fyc,
                res.agqr_period_fyp,
                res.agqr_period_afis,
                res.agqr_period_afif,
                res.agqr_period_pr36,
                res.agqr_period_coll_etmt,
                res.agqr_period_coll_real,
                res.agqr_period_coll_rate,
                res.agqr_cond_coll_rate,
                res.agqr_comp_ratio,
                res.agqr_comp_money_calc,
                res.agqr_period_point,
                res.agqr_activity_coefficient,
                res.agqr_comp_money,
                case
                    when res.type_of_data = 0 then
                        AMS_MODL_COMP_MMXIII_REPORT.AGQR_DATA_GENR
                    when res.type_of_data = 1 then
                        AMS_MODL_COMP_MMXIII_REPORT.AGQR_DATA_MONT
                    end type_of_data
            from
            (
                select
                        outl.outlet_ams_id,
                        outl.info_outlet_name,
                        outl.info_company_name,
                        outl.info_agency_name,
                        outl.info_unit_name,
                        pos.position_name,
                        outl.info_effective_date,
                        outl.info_terminative_date,
                        outl.agqr_data_date,
                        outl.agqr_period_fyc,
                        outl.agqr_period_fyp,
                        outl.agqr_period_afis,
                        outl.agqr_period_afif,
                        outl.agqr_period_pr36,
                        outl.agqr_period_coll_etmt,
                        outl.agqr_period_coll_real,
                        outl.agqr_period_coll_rate,
                        outl.agqr_cond_coll_rate,
                        outl.agqr_comp_ratio,
                        outl.agqr_comp_money_calc,
                        outl.agqr_period_point,
                        outl.agqr_activity_coefficient,
                        outl.agqr_comp_money,
                        0 type_of_data
                from
                (
                    select
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.info_outlet_name,
                        tmp.info_company_name,
                        tmp.info_agency_name,
                        tmp.info_unit_name,
                        tmp.info_effective_date,
                        tmp.info_terminative_date,
                        tmp.info_position_code position_code,
                        tmp.record_date agqr_data_date,
                        tmp.agqr_period_fyc,
                        tmp.agqr_period_fyp,
                        tmp.agqr_period_afis,
                        tmp.agqr_period_afif,
                        tmp.agqr_period_pr36,
                        tmp.agqr_period_coll_etmt,
                        tmp.agqr_period_coll_real,
                        tmp.agqr_period_coll_rate,
                        tmp.agqr_cond_coll_rate,
                        tmp.agqr_comp_ratio,
                        tmp.agqr_comp_money_calc,
                        tmp.agqr_period_point,
                        tmp.agqr_activity_coefficient,
                        tmp.agqr_comp_money
                    from ams.la_compensation_mmxiii tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.agqr_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.agqr_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                        and tmp.outlet_id = var_agent_id
                ) outl
                left join
                (
                    select code.code_code position_code,
                        code.code_value position_name
                    from ams.cla_codes code
                    where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                        and code.code_group = AMS_CORE_CODE.OUTLET_INFO_TYPE_POSI
                        and trunc(valDate, 'MM')
                            between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                            and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
                ) pos
                    on pos.position_code = outl.position_code

                union all

                select
                    outl.outlet_ams_id,
                    outl.info_outlet_name,
                    outl.info_company_name,
                    outl.info_agency_name,
                    outl.info_unit_name,
                    null position_name,
                    null info_effective_date,
                    null info_terminative_date,
                    agqr.agqr_data_date,
                    agqr.agqr_period_fyc,
                    agqr.agqr_period_fyp,
                    null agqr_period_afis,
                    null agqr_period_afif,
                    null agqr_period_pr36,
                    agqr.agqr_period_coll_etmt,
                    agqr.agqr_period_coll_real,
                    null agqr_period_coll_rate,
                    null agqr_cond_coll_rate,
                    null agqr_comp_ratio,
                    null agqr_comp_money_calc,
                    agqr.agqr_period_point,
                    null agqr_activity_coefficient,
                    null agqr_comp_money,
                    1 type_of_data
                from
                (
                    select
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.info_outlet_name,
                        tmp.info_company_name,
                        tmp.info_agency_name,
                        tmp.info_unit_name
                    from ams.la_compensation_mmxiii tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.agqr_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.agqr_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                        and tmp.outlet_id = var_agent_id
                ) outl
                left join
                (
                    select
                        tmp.outlet_ams_id,
                        tmp.agqr_data_date,
                        tmp.agqr_period_fyc,
                        tmp.agqr_period_fyp,
                        tmp.agqr_period_afis,
                        tmp.agqr_period_afif,
                        tmp.agqr_period_pr36,
                        tmp.agqr_period_coll_etmt,
                        tmp.agqr_period_coll_real,
                        tmp.agqr_period_coll_rate,
                        tmp.agqr_period_point
                    from ams.la_comp_mmxiii_agqr tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.agqr_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.agqr_be_paid in
                        (
                            AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_DTL,
                            AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_SPC
                        )
                ) agqr
                    on agqr.outlet_ams_id = outl.outlet_ams_id
            ) res
            order by
                nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.info_unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese'),
                res.type_of_data,
                res.agqr_data_date;
       elsif var_branch_id <> 0 then
            open row_records for
            select
                case
                    when res.type_of_data = 0 then
                        rank() over (
                            partition by res.type_of_data
                            order by nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                                nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.info_unit_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese')
                        )
                    end noid,
                case
                    when res.type_of_data = 0 then
                        res.outlet_ams_id
                    end outlet_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_outlet_name
                    end info_outlet_name,
                case
                    when res.type_of_data = 0 then
                        res.info_company_name
                    end info_company_name,
                case
                    when res.type_of_data = 0 then
                        res.info_agency_name
                    end info_agency_name,
                case
                    when res.type_of_data = 0 then
                        res.info_unit_name
                    end info_unit_name,
                res.position_name,
                to_char(res.info_effective_date, 'DD/MM/YYYY') info_effective_date,
                to_char(res.info_terminative_date, 'DD/MM/YYYY') info_terminative_date,
                to_char(res.agqr_data_date, 'DD/MM/YYYY') agqr_data_date,
                res.agqr_period_fyc,
                res.agqr_period_fyp,
                res.agqr_period_afis,
                res.agqr_period_afif,
                res.agqr_period_pr36,
                res.agqr_period_coll_etmt,
                res.agqr_period_coll_real,
                res.agqr_period_coll_rate,
                res.agqr_cond_coll_rate,
                res.agqr_comp_ratio,
                res.agqr_comp_money_calc,
                res.agqr_period_point,
                res.agqr_activity_coefficient,
                res.agqr_comp_money,
                case
                    when res.type_of_data = 0 then
                        AMS_MODL_COMP_MMXIII_REPORT.AGQR_DATA_GENR
                    when res.type_of_data = 1 then
                        AMS_MODL_COMP_MMXIII_REPORT.AGQR_DATA_MONT
                    end type_of_data
            from
            (
                select
                        outl.outlet_ams_id,
                        outl.info_outlet_name,
                        outl.info_company_name,
                        outl.info_agency_name,
                        outl.info_unit_name,
                        pos.position_name,
                        outl.info_effective_date,
                        outl.info_terminative_date,
                        outl.agqr_data_date,
                        outl.agqr_period_fyc,
                        outl.agqr_period_fyp,
                        outl.agqr_period_afis,
                        outl.agqr_period_afif,
                        outl.agqr_period_pr36,
                        outl.agqr_period_coll_etmt,
                        outl.agqr_period_coll_real,
                        outl.agqr_period_coll_rate,
                        outl.agqr_cond_coll_rate,
                        outl.agqr_comp_ratio,
                        outl.agqr_comp_money_calc,
                        outl.agqr_period_point,
                        outl.agqr_activity_coefficient,
                        outl.agqr_comp_money,
                        0 type_of_data
                from
                (
                    select
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.info_outlet_name,
                        tmp.info_company_name,
                        tmp.info_agency_name,
                        tmp.info_unit_name,
                        tmp.info_effective_date,
                        tmp.info_terminative_date,
                        tmp.info_position_code position_code,
                        tmp.record_date agqr_data_date,
                        tmp.agqr_period_fyc,
                        tmp.agqr_period_fyp,
                        tmp.agqr_period_afis,
                        tmp.agqr_period_afif,
                        tmp.agqr_period_pr36,
                        tmp.agqr_period_coll_etmt,
                        tmp.agqr_period_coll_real,
                        tmp.agqr_period_coll_rate,
                        tmp.agqr_cond_coll_rate,
                        tmp.agqr_comp_ratio,
                        tmp.agqr_comp_money_calc,
                        tmp.agqr_period_point,
                        tmp.agqr_activity_coefficient,
                        tmp.agqr_comp_money
                    from ams.la_compensation_mmxiii tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.agqr_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.agqr_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                        and var_branch_id in
                        (
                            tmp.info_company_id,
                            tmp.info_office_id,
                            tmp.info_agency_id,
                            tmp.info_unit_id
                        )
                ) outl
                left join
                (
                    select code.code_code position_code,
                        code.code_value position_name
                    from ams.cla_codes code
                    where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                        and code.code_group = AMS_CORE_CODE.OUTLET_INFO_TYPE_POSI
                        and trunc(valDate, 'MM')
                            between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                            and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
                ) pos
                    on pos.position_code = outl.position_code

                union all

                select
                    outl.outlet_ams_id,
                    outl.info_outlet_name,
                    outl.info_company_name,
                    outl.info_agency_name,
                    outl.info_unit_name,
                    null position_name,
                    null info_effective_date,
                    null info_terminative_date,
                    agqr.agqr_data_date,
                    agqr.agqr_period_fyc,
                    agqr.agqr_period_fyp,
                    null agqr_period_afis,
                    null agqr_period_afif,
                    null agqr_period_pr36,
                    agqr.agqr_period_coll_etmt,
                    agqr.agqr_period_coll_real,
                    null agqr_period_coll_rate,
                    null agqr_cond_coll_rate,
                    null agqr_comp_ratio,
                    null agqr_comp_money_calc,
                    agqr.agqr_period_point,
                    null agqr_activity_coefficient,
                    null agqr_comp_money,
                    1 type_of_data
                from
                (
                    select
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.info_outlet_name,
                        tmp.info_company_name,
                        tmp.info_agency_name,
                        tmp.info_unit_name
                    from ams.la_compensation_mmxiii tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.agqr_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.agqr_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                        and var_branch_id in
                        (
                            tmp.info_company_id,
                            tmp.info_office_id,
                            tmp.info_agency_id,
                            tmp.info_unit_id
                        )
                ) outl
                left join
                (
                    select
                        tmp.outlet_ams_id,
                        tmp.agqr_data_date,
                        tmp.agqr_period_fyc,
                        tmp.agqr_period_fyp,
                        tmp.agqr_period_afis,
                        tmp.agqr_period_afif,
                        tmp.agqr_period_pr36,
                        tmp.agqr_period_coll_etmt,
                        tmp.agqr_period_coll_real,
                        tmp.agqr_period_coll_rate,
                        tmp.agqr_period_point
                    from ams.la_comp_mmxiii_agqr tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.agqr_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.agqr_be_paid in
                        (
                            AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_DTL,
                            AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_SPC
                        )
                ) agqr
                    on agqr.outlet_ams_id = outl.outlet_ams_id
            ) res
            order by
                nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.info_unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese'),
                res.type_of_data,
                res.agqr_data_date;
       elsif var_branch_id = 0 then
            open row_records for
            select
                case
                    when res.type_of_data = 0 then
                        rank() over (
                            partition by res.type_of_data
                            order by nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                                nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.info_unit_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese')
                        )
                    end noid,
                case
                    when res.type_of_data = 0 then
                        res.outlet_ams_id
                    end outlet_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_outlet_name
                    end info_outlet_name,
                case
                    when res.type_of_data = 0 then
                        res.info_company_name
                    end info_company_name,
                case
                    when res.type_of_data = 0 then
                        res.info_agency_name
                    end info_agency_name,
                case
                    when res.type_of_data = 0 then
                        res.info_unit_name
                    end info_unit_name,
                res.position_name,
                to_char(res.info_effective_date, 'DD/MM/YYYY') info_effective_date,
                to_char(res.info_terminative_date, 'DD/MM/YYYY') info_terminative_date,
                to_char(res.agqr_data_date, 'DD/MM/YYYY') agqr_data_date,
                res.agqr_period_fyc,
                res.agqr_period_fyp,
                res.agqr_period_afis,
                res.agqr_period_afif,
                res.agqr_period_pr36,
                res.agqr_period_coll_etmt,
                res.agqr_period_coll_real,
                res.agqr_period_coll_rate,
                res.agqr_cond_coll_rate,
                res.agqr_comp_ratio,
                res.agqr_comp_money_calc,
                res.agqr_period_point,
                res.agqr_activity_coefficient,
                res.agqr_comp_money,
                case
                    when res.type_of_data = 0 then
                        AMS_MODL_COMP_MMXIII_REPORT.AGQR_DATA_GENR
                    when res.type_of_data = 1 then
                        AMS_MODL_COMP_MMXIII_REPORT.AGQR_DATA_MONT
                    end type_of_data
            from
            (
                select
                        outl.outlet_ams_id,
                        outl.info_outlet_name,
                        outl.info_company_name,
                        outl.info_agency_name,
                        outl.info_unit_name,
                        pos.position_name,
                        outl.info_effective_date,
                        outl.info_terminative_date,
                        outl.agqr_data_date,
                        outl.agqr_period_fyc,
                        outl.agqr_period_fyp,
                        outl.agqr_period_afis,
                        outl.agqr_period_afif,
                        outl.agqr_period_pr36,
                        outl.agqr_period_coll_etmt,
                        outl.agqr_period_coll_real,
                        outl.agqr_period_coll_rate,
                        outl.agqr_cond_coll_rate,
                        outl.agqr_comp_ratio,
                        outl.agqr_comp_money_calc,
                        outl.agqr_period_point,
                        outl.agqr_activity_coefficient,
                        outl.agqr_comp_money,
                        0 type_of_data
                from
                (
                    select
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.info_outlet_name,
                        tmp.info_company_name,
                        tmp.info_agency_name,
                        tmp.info_unit_name,
                        tmp.info_effective_date,
                        tmp.info_terminative_date,
                        tmp.info_position_code position_code,
                        tmp.record_date agqr_data_date,
                        tmp.agqr_period_fyc,
                        tmp.agqr_period_fyp,
                        tmp.agqr_period_afis,
                        tmp.agqr_period_afif,
                        tmp.agqr_period_pr36,
                        tmp.agqr_period_coll_etmt,
                        tmp.agqr_period_coll_real,
                        tmp.agqr_period_coll_rate,
                        tmp.agqr_cond_coll_rate,
                        tmp.agqr_comp_ratio,
                        tmp.agqr_comp_money_calc,
                        tmp.agqr_period_point,
                        tmp.agqr_activity_coefficient,
                        tmp.agqr_comp_money
                    from ams.la_compensation_mmxiii tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.agqr_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.agqr_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                ) outl
                left join
                (
                    select code.code_code position_code,
                        code.code_value position_name
                    from ams.cla_codes code
                    where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                        and code.code_group = AMS_CORE_CODE.OUTLET_INFO_TYPE_POSI
                        and trunc(valDate, 'MM')
                            between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                            and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
                ) pos
                    on pos.position_code = outl.position_code

                union all

                select
                    outl.outlet_ams_id,
                    outl.info_outlet_name,
                    outl.info_company_name,
                    outl.info_agency_name,
                    outl.info_unit_name,
                    null position_name,
                    null info_effective_date,
                    null info_terminative_date,
                    agqr.agqr_data_date,
                    agqr.agqr_period_fyc,
                    agqr.agqr_period_fyp,
                    null agqr_period_afis,
                    null agqr_period_afif,
                    null agqr_period_pr36,
                    agqr.agqr_period_coll_etmt,
                    agqr.agqr_period_coll_real,
                    null agqr_period_coll_rate,
                    null agqr_cond_coll_rate,
                    null agqr_comp_ratio,
                    null agqr_comp_money_calc,
                    agqr.agqr_period_point,
                    null agqr_activity_coefficient,
                    null agqr_comp_money,
                    1 type_of_data
                from
                (
                    select
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.info_outlet_name,
                        tmp.info_company_name,
                        tmp.info_agency_name,
                        tmp.info_unit_name
                    from ams.la_compensation_mmxiii tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.agqr_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.agqr_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                ) outl
                left join
                (
                    select
                        tmp.outlet_ams_id,
                        tmp.agqr_data_date,
                        tmp.agqr_period_fyc,
                        tmp.agqr_period_fyp,
                        tmp.agqr_period_afis,
                        tmp.agqr_period_afif,
                        tmp.agqr_period_pr36,
                        tmp.agqr_period_coll_etmt,
                        tmp.agqr_period_coll_real,
                        tmp.agqr_period_coll_rate,
                        tmp.agqr_period_point
                    from ams.la_comp_mmxiii_agqr tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.agqr_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.agqr_be_paid in
                        (
                            AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_DTL,
                            AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_SPC
                        )
                ) agqr
                    on agqr.outlet_ams_id = outl.outlet_ams_id
            ) res
            order by
                nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.info_unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese'),
                res.type_of_data,
                res.agqr_data_date;
        end if;
    end;

    /*thuong tuyen dung*/
    procedure mmxiii_get_agem01(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor)
    is
        var_branch_id number(10) := nvl(valBranchID, 0);
        var_agent_id number(10) := nvl(valAgentID, 0);
    begin
        if var_agent_id <> 0 then
            open row_records for
            select
                case
                    when res.type_of_data = 0 then
                        rank() over (
                            partition by res.type_of_data
                            order by nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                                nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.info_unit_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese')
                        )
                    end noid,
                case
                    when res.type_of_data = 0 then
                        res.outlet_ams_id
                    end outlet_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_outlet_name
                    end info_outlet_name,
                case
                    when res.type_of_data = 0 then
                        res.info_company_ams_id
                    end info_company_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_company_name
                    end info_company_name,
                case
                    when res.type_of_data = 0 then
                        res.info_agency_ams_id
                    end info_agency_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_agency_name
                    end info_agency_name,
                case
                    when res.type_of_data = 0 then
                        res.info_unit_ams_id
                    end info_unit_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_unit_name
                    end info_unit_name,
                res.info_position_name,
                to_char(res.info_effective_date, 'DD/MM/YYYY') info_effective_date,
                to_char(res.info_terminative_date, 'DD/MM/YYYY') info_terminative_date,
                res.agem_outlet_ams_id,
                res.agem_outlet_name,
                to_char(res.agem_effective_date, 'DD/MM/YYYY') agem_effective_date,
                to_char(res.agem_terminative_date, 'DD/MM/YYYY') agem_terminative_date,
                to_char(res.agem_data_date, 'DD/MM/YYYY') agem_data_date,
                res.agem_period_fyc,
                res.agem_period_fyp,
                res.agem_period_empl,
                res.agem_comp_ratio,
                res.agem_comp_money,
                case
                    when res.type_of_data = 0 then
                        AMS_MODL_COMP_MMXIII_REPORT.AGEM_DATA_GENR
                    when res.type_of_data = 1 then
                        AMS_MODL_COMP_MMXIII_REPORT.AGEM_DATA_QUAR
                    when res.type_of_data = 2 then
                        AMS_MODL_COMP_MMXIII_REPORT.AGEM_DATA_MONT
                    end type_of_data
            from
            (
                select
                    outl.outlet_ams_id,
                    outl.info_outlet_name,
                    outl.info_company_ams_id,
                    outl.info_company_name,
                    outl.info_agency_ams_id,
                    outl.info_agency_name,
                    outl.info_unit_ams_id,
                    outl.info_unit_name,
                    posi.position_name info_position_name,
                    outl.info_effective_date,
                    outl.info_terminative_date,
                    outl.agem_outlet_ams_id,
                    outl.agem_outlet_name,
                    outl.agem_effective_date,
                    outl.agem_terminative_date,
                    outl.agem_data_date,
                    outl.agem_period_fyc,
                    outl.agem_period_fyp,
                    outl.agem_period_empl,
                    outl.agem_comp_ratio,
                    outl.agem_comp_money,
                    0 type_of_data
                from
                (
                    select
                        comp.outlet_ams_id,
                        comp.info_outlet_name,
                        comp.info_company_ams_id,
                        comp.info_company_name,
                        comp.info_agency_ams_id,
                        comp.info_agency_name,
                        comp.info_unit_ams_id,
                        comp.info_unit_name,
                        comp.info_effective_date,
                        comp.info_terminative_date,
                        comp.agem_position_code info_position_code,
                        null agem_outlet_ams_id,
                        null agem_outlet_name,
                        null agem_effective_date,
                        null agem_terminative_date,
                        comp.record_date agem_data_date,
                        comp.agem_period_fyc,
                        null agem_period_fyp,
                        comp.agem_period_empl,
                        comp.agem_comp_ratio,
                        comp.agem_comp_money
                    from ams.la_compensation_mmxiii comp
                    where comp.record_date = trunc(valDate, 'MM')
                        and comp.agem_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and comp.agem_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                        and comp.outlet_id = var_agent_id
                  ) outl
                  left join
                  (
                      select code.code_code position_code,
                          code.code_value position_name
                      from ams.cla_codes code
                      where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                          and code.code_group = AMS_CORE_CODE.OUTLET_INFO_TYPE_POSI
                          and trunc(valDate, 'MM')
                              between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                              and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
                  ) posi
                      on posi.position_code = outl.info_position_code

                  union all

                  select
                      outl.outlet_ams_id,
                      outl.info_outlet_name,
                      outl.info_company_ams_id,
                      outl.info_company_name,
                      outl.info_agency_ams_id,
                      outl.info_agency_name,
                      outl.info_unit_ams_id,
                      outl.info_unit_name,
                      null info_effective_date,
                      null info_terminative_date,
                      null info_position_code,
                      agem.outlet_ams_id agem_outlet_ams_id,
                      agem.outlet_name agem_outlet_name,
                      case
                          when agem.agem_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES then
                              agem.effective_date
                          end agem_effective_date,
                      case
                          when agem.agem_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES then
                              agem.terminative_date
                          end agem_terminative_date,
                      agem.agem_data_date,
                      agem.agem_period_fyc,
                      null agem_period_fyp,
                      case
                          when agem.agem_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES then
                              agem.agem_period_empl
                          end agem_period_empl,
                      case
                          when agem.agem_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES then
                              agem.agem_comp_ratio
                          end agem_comp_ratio,
                      case
                          when agem.agem_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES then
                              agem.agem_comp_money
                          end agem_comp_money,
                      case
                          when agem.agem_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES then
                              1
                          when agem.agem_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_DTL then
                              2
                          end type_of_data
                  from
                  (
                      select
                          comp.outlet_ams_id,
                          comp.info_outlet_name,
                          comp.info_company_ams_id,
                          comp.info_company_name,
                          comp.info_agency_ams_id,
                          comp.info_agency_name,
                          comp.info_unit_ams_id,
                          comp.info_unit_name
                      from ams.la_compensation_mmxiii comp
                      where comp.record_date = trunc(valDate, 'MM')
                          and comp.agem_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                          and comp.agem_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                          and comp.outlet_id = var_agent_id
                  ) outl
                  join
                  (
                      select *
                      from ams.la_comp_mmxiii_agem tmp
                      where tmp.record_date = trunc(valDate, 'MM')
                          and tmp.agem_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                          and tmp.agem_be_paid in
                          (
                              AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                          )
                  ) agem
                      on agem.agem_outlet_ams_id = outl.outlet_ams_id
            ) res
            order by nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.info_unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese'),
                res.type_of_data,
                res.agem_effective_date;
       elsif var_branch_id <> 0 then
            open row_records for
            select
                case
                    when res.type_of_data = 0 then
                        rank() over (
                            partition by res.type_of_data
                            order by nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                                nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.info_unit_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese')
                        )
                    end noid,
                case
                    when res.type_of_data = 0 then
                        res.outlet_ams_id
                    end outlet_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_outlet_name
                    end info_outlet_name,
                case
                    when res.type_of_data = 0 then
                        res.info_company_ams_id
                    end info_company_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_company_name
                    end info_company_name,
                case
                    when res.type_of_data = 0 then
                        res.info_agency_ams_id
                    end info_agency_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_agency_name
                    end info_agency_name,
                case
                    when res.type_of_data = 0 then
                        res.info_unit_ams_id
                    end info_unit_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_unit_name
                    end info_unit_name,
                res.info_position_name,
                to_char(res.info_effective_date, 'DD/MM/YYYY') info_effective_date,
                to_char(res.info_terminative_date, 'DD/MM/YYYY') info_terminative_date,
                res.agem_outlet_ams_id,
                res.agem_outlet_name,
                to_char(res.agem_effective_date, 'DD/MM/YYYY') agem_effective_date,
                to_char(res.agem_terminative_date, 'DD/MM/YYYY') agem_terminative_date,
                to_char(res.agem_data_date, 'DD/MM/YYYY') agem_data_date,
                res.agem_period_fyc,
                res.agem_period_fyp,
                res.agem_period_empl,
                res.agem_comp_ratio,
                res.agem_comp_money,
                case
                    when res.type_of_data = 0 then
                        AMS_MODL_COMP_MMXIII_REPORT.AGEM_DATA_GENR
                    when res.type_of_data = 1 then
                        AMS_MODL_COMP_MMXIII_REPORT.AGEM_DATA_QUAR
                    when res.type_of_data = 2 then
                        AMS_MODL_COMP_MMXIII_REPORT.AGEM_DATA_MONT
                    end type_of_data
            from
            (
                select
                    outl.outlet_ams_id,
                    outl.info_outlet_name,
                    outl.info_company_ams_id,
                    outl.info_company_name,
                    outl.info_agency_ams_id,
                    outl.info_agency_name,
                    outl.info_unit_ams_id,
                    outl.info_unit_name,
                    posi.position_name info_position_name,
                    outl.info_effective_date,
                    outl.info_terminative_date,
                    outl.agem_outlet_ams_id,
                    outl.agem_outlet_name,
                    outl.agem_effective_date,
                    outl.agem_terminative_date,
                    outl.agem_data_date,
                    outl.agem_period_fyc,
                    outl.agem_period_fyp,
                    outl.agem_period_empl,
                    outl.agem_comp_ratio,
                    outl.agem_comp_money,
                    0 type_of_data
                from
                (
                    select
                        comp.outlet_ams_id,
                        comp.info_outlet_name,
                        comp.info_company_ams_id,
                        comp.info_company_name,
                        comp.info_agency_ams_id,
                        comp.info_agency_name,
                        comp.info_unit_ams_id,
                        comp.info_unit_name,
                        comp.info_effective_date,
                        comp.info_terminative_date,
                        comp.agem_position_code info_position_code,
                        null agem_outlet_ams_id,
                        null agem_outlet_name,
                        null agem_effective_date,
                        null agem_terminative_date,
                        comp.record_date agem_data_date,
                        comp.agem_period_fyc,
                        null agem_period_fyp,
                        comp.agem_period_empl,
                        comp.agem_comp_ratio,
                        comp.agem_comp_money
                    from ams.la_compensation_mmxiii comp
                    where comp.record_date = trunc(valDate, 'MM')
                        and comp.agem_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and comp.agem_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                        and var_branch_id in
                        (
                            comp.info_company_id,
                            comp.info_office_id,
                            comp.info_agency_id,
                            comp.info_unit_id
                        )
                  ) outl
                  left join
                  (
                      select code.code_code position_code,
                          code.code_value position_name
                      from ams.cla_codes code
                      where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                          and code.code_group = AMS_CORE_CODE.OUTLET_INFO_TYPE_POSI
                          and trunc(valDate, 'MM')
                              between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                              and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
                  ) posi
                      on posi.position_code = outl.info_position_code

                  union all

                  select
                      outl.outlet_ams_id,
                      outl.info_outlet_name,
                      outl.info_company_ams_id,
                      outl.info_company_name,
                      outl.info_agency_ams_id,
                      outl.info_agency_name,
                      outl.info_unit_ams_id,
                      outl.info_unit_name,
                      null info_effective_date,
                      null info_terminative_date,
                      null info_position_code,
                      agem.outlet_ams_id agem_outlet_ams_id,
                      agem.outlet_name agem_outlet_name,
                      case
                          when agem.agem_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES then
                              agem.effective_date
                          end agem_effective_date,
                      case
                          when agem.agem_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES then
                              agem.terminative_date
                          end agem_terminative_date,
                      agem.agem_data_date,
                      agem.agem_period_fyc,
                      null agem_period_fyp,
                      case
                          when agem.agem_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES then
                              agem.agem_period_empl
                          end agem_period_empl,
                      case
                          when agem.agem_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES then
                              agem.agem_comp_ratio
                          end agem_comp_ratio,
                      case
                          when agem.agem_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES then
                              agem.agem_comp_money
                          end agem_comp_money,
                      case
                          when agem.agem_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES then
                              1
                          when agem.agem_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_DTL then
                              2
                          end type_of_data
                  from
                  (
                      select
                          comp.outlet_ams_id,
                          comp.info_outlet_name,
                          comp.info_company_ams_id,
                          comp.info_company_name,
                          comp.info_agency_ams_id,
                          comp.info_agency_name,
                          comp.info_unit_ams_id,
                          comp.info_unit_name
                      from ams.la_compensation_mmxiii comp
                      where comp.record_date = trunc(valDate, 'MM')
                          and comp.agem_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                          and comp.agem_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                        and var_branch_id in
                        (
                            comp.info_company_id,
                            comp.info_office_id,
                            comp.info_agency_id,
                            comp.info_unit_id
                        )
                  ) outl
                  join
                  (
                      select *
                      from ams.la_comp_mmxiii_agem tmp
                      where tmp.record_date = trunc(valDate, 'MM')
                          and tmp.agem_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                          and tmp.agem_be_paid in
                          (
                              AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                          )
                  ) agem
                      on agem.agem_outlet_ams_id = outl.outlet_ams_id
            ) res
            order by nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.info_unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese'),
                res.type_of_data,
                res.agem_effective_date;
       elsif var_branch_id = 0 then
            open row_records for
            select
                case
                    when res.type_of_data = 0 then
                        rank() over (
                            partition by res.type_of_data
                            order by nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                                nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.info_unit_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese')
                        )
                    end noid,
                case
                    when res.type_of_data = 0 then
                        res.outlet_ams_id
                    end outlet_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_outlet_name
                    end info_outlet_name,
                case
                    when res.type_of_data = 0 then
                        res.info_company_ams_id
                    end info_company_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_company_name
                    end info_company_name,
                case
                    when res.type_of_data = 0 then
                        res.info_agency_ams_id
                    end info_agency_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_agency_name
                    end info_agency_name,
                case
                    when res.type_of_data = 0 then
                        res.info_unit_ams_id
                    end info_unit_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_unit_name
                    end info_unit_name,
                res.info_position_name,
                to_char(res.info_effective_date, 'DD/MM/YYYY') info_effective_date,
                to_char(res.info_terminative_date, 'DD/MM/YYYY') info_terminative_date,
                res.agem_outlet_ams_id,
                res.agem_outlet_name,
                to_char(res.agem_effective_date, 'DD/MM/YYYY') agem_effective_date,
                to_char(res.agem_terminative_date, 'DD/MM/YYYY') agem_terminative_date,
                to_char(res.agem_data_date, 'DD/MM/YYYY') agem_data_date,
                res.agem_period_fyc,
                res.agem_period_fyp,
                res.agem_period_empl,
                res.agem_comp_ratio,
                res.agem_comp_money,
                case
                    when res.type_of_data = 0 then
                        AMS_MODL_COMP_MMXIII_REPORT.AGEM_DATA_GENR
                    when res.type_of_data = 1 then
                        AMS_MODL_COMP_MMXIII_REPORT.AGEM_DATA_QUAR
                    when res.type_of_data = 2 then
                        AMS_MODL_COMP_MMXIII_REPORT.AGEM_DATA_MONT
                    end type_of_data
            from
            (
                select
                    outl.outlet_ams_id,
                    outl.info_outlet_name,
                    outl.info_company_ams_id,
                    outl.info_company_name,
                    outl.info_agency_ams_id,
                    outl.info_agency_name,
                    outl.info_unit_ams_id,
                    outl.info_unit_name,
                    posi.position_name info_position_name,
                    outl.info_effective_date,
                    outl.info_terminative_date,
                    outl.agem_outlet_ams_id,
                    outl.agem_outlet_name,
                    outl.agem_effective_date,
                    outl.agem_terminative_date,
                    outl.agem_data_date,
                    outl.agem_period_fyc,
                    outl.agem_period_fyp,
                    outl.agem_period_empl,
                    outl.agem_comp_ratio,
                    outl.agem_comp_money,
                    0 type_of_data
                from
                (
                    select
                        comp.outlet_ams_id,
                        comp.info_outlet_name,
                        comp.info_company_ams_id,
                        comp.info_company_name,
                        comp.info_agency_ams_id,
                        comp.info_agency_name,
                        comp.info_unit_ams_id,
                        comp.info_unit_name,
                        comp.info_effective_date,
                        comp.info_terminative_date,
                        comp.agem_position_code info_position_code,
                        null agem_outlet_ams_id,
                        null agem_outlet_name,
                        null agem_effective_date,
                        null agem_terminative_date,
                        comp.record_date agem_data_date,
                        comp.agem_period_fyc,
                        null agem_period_fyp,
                        comp.agem_period_empl,
                        comp.agem_comp_ratio,
                        comp.agem_comp_money
                    from ams.la_compensation_mmxiii comp
                    where comp.record_date = trunc(valDate, 'MM')
                        and comp.agem_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and comp.agem_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                  ) outl
                  left join
                  (
                      select code.code_code position_code,
                          code.code_value position_name
                      from ams.cla_codes code
                      where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                          and code.code_group = AMS_CORE_CODE.OUTLET_INFO_TYPE_POSI
                          and trunc(valDate, 'MM')
                              between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                              and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
                  ) posi
                      on posi.position_code = outl.info_position_code

                  union all

                  select
                      outl.outlet_ams_id,
                      outl.info_outlet_name,
                      outl.info_company_ams_id,
                      outl.info_company_name,
                      outl.info_agency_ams_id,
                      outl.info_agency_name,
                      outl.info_unit_ams_id,
                      outl.info_unit_name,
                      null info_effective_date,
                      null info_terminative_date,
                      null info_position_code,
                      agem.outlet_ams_id agem_outlet_ams_id,
                      agem.outlet_name agem_outlet_name,
                      case
                          when agem.agem_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES then
                              agem.effective_date
                          end agem_effective_date,
                      case
                          when agem.agem_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES then
                              agem.terminative_date
                          end agem_terminative_date,
                      agem.agem_data_date,
                      agem.agem_period_fyc,
                      null agem_period_fyp,
                      case
                          when agem.agem_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES then
                              agem.agem_period_empl
                          end agem_period_empl,
                      case
                          when agem.agem_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES then
                              agem.agem_comp_ratio
                          end agem_comp_ratio,
                      case
                          when agem.agem_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES then
                              agem.agem_comp_money
                          end agem_comp_money,
                      case
                          when agem.agem_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES then
                              1
                          when agem.agem_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_DTL then
                              2
                          end type_of_data
                  from
                  (
                      select
                          comp.outlet_ams_id,
                          comp.info_outlet_name,
                          comp.info_company_ams_id,
                          comp.info_company_name,
                          comp.info_agency_ams_id,
                          comp.info_agency_name,
                          comp.info_unit_ams_id,
                          comp.info_unit_name
                      from ams.la_compensation_mmxiii comp
                      where comp.record_date = trunc(valDate, 'MM')
                          and comp.agem_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                          and comp.agem_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                  ) outl
                  join
                  (
                      select *
                      from ams.la_comp_mmxiii_agem tmp
                      where tmp.record_date = trunc(valDate, 'MM')
                          and tmp.agem_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                          and tmp.agem_be_paid in
                          (
                              AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                          )
                  ) agem
                      on agem.agem_outlet_ams_id = outl.outlet_ams_id
            ) res
            order by nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.info_unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese'),
                res.type_of_data,
                res.agem_effective_date;
        end if;
    end;

    /*thuong gioi thieu dai ly moi
    sua lai ngay 19/3/2013 hien thi tat ca moi dai ly len ke ca khong tuyen duoc du de kiem tra*/
    /*
        Creater: Le Khac Chinh
        Date Create: 1/6/2013
        Version: 1.0
        Description: Thu tuc hien thi bao cao thuong gioi thieu dai ly moi
        Parameter:
            valRecordDate [date]: Thang chay
        Update:  Le Khac Chinh
            Version: 1.1
            Date Updated: 22/7/2013
            Note:  Fix lai chuong trinh theo yeu cau:
                      de co the hien thi duoc ca nhung dai ly da co du lieu trong bang chua TVV thanh cong de hien ra cho no

        Update: Vu Duc Thong
        Version: 1.2
        Nguoi thay doi: Vu Duc Thong
        Ngay thay doi: 15/07/2013
        Noi dung: Hien thi them cot tu van vien thanh cong
    */
    procedure mmxiii_get_agin01(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor)
    is
        var_branch_id number(10) := nvl(valBranchID, 0);
        var_agent_id number(10) := nvl(valAgentID, 0);
    begin
        if var_agent_id <> 0 then
            open row_records for
            select
                case
                    when res.type_of_data = 0 then
                        rank() over (
                            partition by res.type_of_data
                            order by nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                                nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.info_unit_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese')
                        )
                    end noid,
                case
                    when res.type_of_data = 0 then
                        res.outlet_ams_id
                    end outlet_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_outlet_name
                    end info_outlet_name,
                case
                    when res.type_of_data = 0 then
                        res.info_company_ams_id
                    end info_company_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_company_name
                    end info_company_name,
                case
                    when res.type_of_data = 0 then
                        res.info_agency_ams_id
                    end info_agency_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_agency_name
                    end info_agency_name,
                case
                    when res.type_of_data = 0 then
                        res.info_unit_ams_id
                    end info_unit_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_unit_name
                    end info_unit_name,
                case
                    when res.type_of_data = 0 then
                        res.info_position_name
                    end info_position_name,
                case
                    when res.type_of_data = 0 then
                        to_char(res.info_effective_date, 'DD/MM/YYYY')
                    end info_effective_date,
                case
                    when res.type_of_data = 0 then
                        to_char(res.info_terminative_date, 'DD/MM/YYYY')
                    end info_terminative_date,
                res.agin_outlet_ams_id,
                res.agin_outlet_name,
                to_char(res.agin_effective_date, 'DD/MM/YYYY') agin_effective_date,
                to_char(res.agin_terminative_date, 'DD/MM/YYYY') agin_terminative_date,
                to_char(res.agin_from_date, 'DD/MM/YYYY') agin_from_date,
                to_char(res.agin_to_date, 'DD/MM/YYYY') agin_to_date,
                res.agin_period_issue,
                res.agin_period_ip,
                nvl(res.agin_period_empl, 0) agin_period_empl,
                res.agin_period_money,
                res.agin_comp_money,
                case
                    when res.type_of_data = 0 then
                        AMS_MODL_COMP_MMXIII_REPORT.AGIN_DATA_GENR
                    when res.type_of_data = 1 then
                        AMS_MODL_COMP_MMXIII_REPORT.AGIN_DATA_QUAR
                    when res.type_of_data = 2 then
                        AMS_MODL_COMP_MMXIII_REPORT.AGIN_DATA_MONT
                    end type_of_data,

                case when res.outlet_tc is not null and res.type_of_data = 1 then
                        AMS_MODL_COMP_MMXIII_REPORT.AGIN_DATA_TVV_TC
                     when res.outlet_tc is null then
                        AMS_MODL_COMP_MMXIII_REPORT.AGIN_DATA_TVV
                     end outlet_tc
            from
            (
                select /*+ CARDINALITY(repo, 100)
                           CARDINALITY(outl, 100)
                           CARDINALITY(posi, 100)*/
                    outl.outlet_ams_id,
                    outl.info_outlet_name,
                    outl.info_company_ams_id,
                    outl.info_company_name,
                    outl.info_agency_ams_id,
                    outl.info_agency_name,
                    outl.info_unit_ams_id,
                    outl.info_unit_name,
                    posi.position_name info_position_name,
                    outl.info_effective_date,
                    outl.info_terminative_date,
                    outl.agin_outlet_ams_id,
                    outl.agin_outlet_name,
                    outl.agin_effective_date,
                    outl.agin_terminative_date,
                    outl.agin_from_date,
                    outl.agin_to_date,
                    outl.agin_period_issue,
                    outl.agin_period_ip,
                    outl.agin_period_empl,
                    outl.agin_comp_money agin_period_money,
                    outl.agin_comp_money,
                    0 type_of_data,
                    a.outlet_tc
                from
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_ams_id
                    from ams.la_employment_rights_2013 tmp
                    where
                        (tmp.record_date = add_months(trunc(valDate, 'MM'), -5)
                        or tmp.record_date = add_months(trunc(valDate, 'MM'), -8)
                        or tmp.record_date = add_months(trunc(valDate, 'MM'), -11))
                        and tmp.outlet_id = var_agent_id
                    group by tmp.outlet_ams_id
                ) repo
                join
                (
                    select /*+ CARDINALITY(comp, 100)*/
                        comp.outlet_ams_id,
                        comp.info_outlet_name,
                        comp.info_company_ams_id,
                        comp.info_company_name,
                        comp.info_agency_ams_id,
                        comp.info_agency_name,
                        comp.info_unit_ams_id,
                        comp.info_unit_name,
                        comp.info_effective_date,
                        comp.info_terminative_date,
                        comp.info_position_code,
                        null agin_outlet_ams_id,
                        null agin_outlet_name,
                        null agin_effective_date,
                        null agin_terminative_date,
                        null agin_from_date,
                        null agin_to_date,
                        null agin_period_issue,
                        null agin_period_ip,
                        null agin_period_money,
                        comp.agin_period_empl,
                        comp.agin_comp_money
                    from ams.la_compensation_mmxiii comp
                    where comp.record_date = trunc(valDate, 'MM')
                        and comp.agin_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and comp.outlet_id = var_agent_id
                  ) outl
                     on outl.outlet_ams_id = repo.outlet_ams_id
                  left join
                  (
                     select
                        tvv.outlet_ams_id outlet_tc
                     from ams.la_employment_rights_2013 tvv
                     where tvv.outlet_id = var_agent_id
                         and tvv.right_from_date <= trunc(valDate, 'MM')
                         and tvv.right_to_date >= trunc(valDate, 'MM')
                     group by tvv.outlet_ams_id
                  ) a
                     on outl.outlet_ams_id = a.outlet_tc
                  left join
                  (
                      select code.code_code position_code,
                          code.code_value position_name
                      from ams.cla_codes code
                      where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                          and code.code_group = AMS_CORE_CODE.OUTLET_INFO_TYPE_POSI
                          and trunc(valDate, 'MM')
                              between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                              and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
                  ) posi
                      on posi.position_code = trim(outl.info_position_code)

                  union all

                  select /*+ CARDINALITY(repo, 100)
                             CARDINALITY(outl, 100)
                             CARDINALITY(agin, 100)*/
                      outl.outlet_ams_id,
                      outl.info_outlet_name,
                      outl.info_company_ams_id,
                      outl.info_company_name,
                      outl.info_agency_ams_id,
                      outl.info_agency_name,
                      outl.info_unit_ams_id,
                      outl.info_unit_name,
                      null info_effective_date,
                      null info_terminative_date,
                      null info_position_code,
                      agin.outlet_ams_id agin_outlet_ams_id,
                      agin.outlet_name agin_outlet_name,
                      agin.effective_date,
                      agin.terminative_date,
                      agin.agin_from_date,
                      agin.agin_to_date,
                      agin.agin_period_issue,
                      agin.agin_period_ip,
                      agin.agin_period_asmt,
                      nvl(agin.agin_period_money, 0) agin_period_money,
                      0 agin_comp_money,
                      1 type_of_data,
                      a.outlet_tc
                  from
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_ams_id
                    from ams.la_employment_rights_2013 tmp
                    where
                        (tmp.record_date = add_months(trunc(valDate, 'MM'), -5)
                        or tmp.record_date = add_months(trunc(valDate, 'MM'), -8)
                        or tmp.record_date = add_months(trunc(valDate, 'MM'), -11))
                        and tmp.outlet_id = var_agent_id
                    group by tmp.outlet_ams_id
                ) repo
                join
                (
                    select /*+ CARDINALITY(comp, 100)*/
                        comp.outlet_ams_id,
                        comp.info_outlet_name,
                        comp.info_company_ams_id,
                        comp.info_company_name,
                        comp.info_agency_ams_id,
                        comp.info_agency_name,
                        comp.info_unit_ams_id,
                        comp.info_unit_name
                    from ams.la_compensation_mmxiii comp
                    where comp.record_date = trunc(valDate, 'MM')
                        and comp.agin_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and comp.outlet_id = var_agent_id
                  ) outl
                     on outl.outlet_ams_id = repo.outlet_ams_id
                  join
                  (
                      select /*+ CARDINALITY(tmp, 100)*/
                          tmp.outlet_ams_id,
                          tmp.outlet_name,
                          tmp.effective_date,
                          tmp.terminative_date,
                          tmp.agin_from_date,
                          tmp.agin_to_date,
                          tmp.agin_outlet_ams_id,
                          tmp.agin_period_issue,
                          tmp.agin_period_ip,
                          tmp.agin_period_asmt,
                          tmp.agin_period_money
                      from ams.la_comp_mmxiii_agin tmp
                      where tmp.record_date = trunc(valDate, 'MM')
                          and tmp.agin_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                          and tmp.effective_date >= trunc(valDate, 'YYYY')
                  ) agin
                      on agin.agin_outlet_ams_id = outl.outlet_ams_id
                  /*Danh dau cac dai ly dc tuyen khi DL tuyen la TVV TC*/
                  left join
                  (
                      select /*+ CARDINALITY(tvv, 100)*/
                         agin.outlet_ams_id outlet_tc
                      from ams.la_employment_rights_2013 tvv
                      join ams.la_comp_mmxiii_agin agin
                        on tvv.outlet_ams_id = agin.agin_outlet_ams_id
                      where agin.effective_date
                            between tvv.right_from_date
                                and tvv.right_to_date
                        and agin.agin_position_code in (
                          AMS_MODL_COMP_MMXIII_REPORT.COMP_CODE_MMXIII_CV00,
                          AMS_MODL_COMP_MMXIII_REPORT.COMP_CODE_MMXIII_CV05)
                  ) a
                     on agin.outlet_ams_id = a.outlet_tc
            ) res
            order by nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.info_unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese'),
                res.type_of_data,
                res.agin_effective_date;
        elsif var_branch_id <> 0 then
            open row_records for
            select
                case
                    when res.type_of_data = 0 then
                        rank() over (
                            partition by res.type_of_data
                            order by nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                                nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.info_unit_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese')
                        )
                    end noid,
                case
                    when res.type_of_data = 0 then
                        res.outlet_ams_id
                    end outlet_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_outlet_name
                    end info_outlet_name,
                case
                    when res.type_of_data = 0 then
                        res.info_company_ams_id
                    end info_company_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_company_name
                    end info_company_name,
                case
                    when res.type_of_data = 0 then
                        res.info_agency_ams_id
                    end info_agency_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_agency_name
                    end info_agency_name,
                case
                    when res.type_of_data = 0 then
                        res.info_unit_ams_id
                    end info_unit_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_unit_name
                    end info_unit_name,
                case
                    when res.type_of_data = 0 then
                        res.info_position_name
                    end info_position_name,
                case
                    when res.type_of_data = 0 then
                        to_char(res.info_effective_date, 'DD/MM/YYYY')
                    end info_effective_date,
                case
                    when res.type_of_data = 0 then
                        to_char(res.info_terminative_date, 'DD/MM/YYYY')
                    end info_terminative_date,
                res.agin_outlet_ams_id,
                res.agin_outlet_name,
                to_char(res.agin_effective_date, 'DD/MM/YYYY') agin_effective_date,
                to_char(res.agin_terminative_date, 'DD/MM/YYYY') agin_terminative_date,
                to_char(res.agin_from_date, 'DD/MM/YYYY') agin_from_date,
                to_char(res.agin_to_date, 'DD/MM/YYYY') agin_to_date,
                res.agin_period_issue,
                res.agin_period_ip,
                nvl(res.agin_period_empl, 0) agin_period_empl,
                res.agin_period_money,
                res.agin_comp_money,
                case
                    when res.type_of_data = 0 then
                        AMS_MODL_COMP_MMXIII_REPORT.AGIN_DATA_GENR
                    when res.type_of_data = 1 then
                        AMS_MODL_COMP_MMXIII_REPORT.AGIN_DATA_QUAR
                    when res.type_of_data = 2 then
                        AMS_MODL_COMP_MMXIII_REPORT.AGIN_DATA_MONT
                    end type_of_data,

                case when res.outlet_tc is not null and res.type_of_data = 1 then
                        AMS_MODL_COMP_MMXIII_REPORT.AGIN_DATA_TVV_TC
                     when res.outlet_tc is null then
                        AMS_MODL_COMP_MMXIII_REPORT.AGIN_DATA_TVV
                     end outlet_tc
            from
            (
                select /*+ CARDINALITY(repo, 100)
                           CARDINALITY(outl, 100)
                           CARDINALITY(posi, 100)*/
                    outl.outlet_ams_id,
                    outl.info_outlet_name,
                    outl.info_company_ams_id,
                    outl.info_company_name,
                    outl.info_agency_ams_id,
                    outl.info_agency_name,
                    outl.info_unit_ams_id,
                    outl.info_unit_name,
                    posi.position_name info_position_name,
                    outl.info_effective_date,
                    outl.info_terminative_date,
                    outl.agin_outlet_ams_id,
                    outl.agin_outlet_name,
                    outl.agin_effective_date,
                    outl.agin_terminative_date,
                    outl.agin_from_date,
                    outl.agin_to_date,
                    outl.agin_period_issue,
                    outl.agin_period_ip,
                    outl.agin_period_empl,
                    outl.agin_comp_money agin_period_money,
                    outl.agin_comp_money,
                    0 type_of_data,
                    a.outlet_tc
                from
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_ams_id
                    from ams.la_employment_rights_2013 tmp
                    where
                        (tmp.record_date = add_months(trunc(valDate, 'MM'), -5)
                        or tmp.record_date = add_months(trunc(valDate, 'MM'), -8)
                        or tmp.record_date = add_months(trunc(valDate, 'MM'), -11))
                    group by tmp.outlet_ams_id
                ) repo
                join
                (
                    select /*+ CARDINALITY(comp, 100)*/
                        comp.outlet_ams_id,
                        comp.info_outlet_name,
                        comp.info_company_ams_id,
                        comp.info_company_name,
                        comp.info_agency_ams_id,
                        comp.info_agency_name,
                        comp.info_unit_ams_id,
                        comp.info_unit_name,
                        comp.info_effective_date,
                        comp.info_terminative_date,
                        comp.info_position_code,
                        null agin_outlet_ams_id,
                        null agin_outlet_name,
                        null agin_effective_date,
                        null agin_terminative_date,
                        null agin_from_date,
                        null agin_to_date,
                        null agin_period_issue,
                        null agin_period_ip,
                        null agin_period_money,
                        comp.agin_period_empl,
                        comp.agin_comp_money
                    from ams.la_compensation_mmxiii comp
                    where comp.record_date = trunc(valDate, 'MM')
                        and comp.agin_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and var_branch_id in
                        (
                            comp.info_company_id,
                            comp.info_office_id,
                            comp.info_agency_id,
                            comp.info_unit_id
                        )
                  ) outl
                     on outl.outlet_ams_id = repo.outlet_ams_id
                  left join
                  (
                     select
                        tvv.outlet_ams_id outlet_tc
                     from ams.la_employment_rights_2013 tvv
                     where tvv.right_from_date <= trunc(valDate, 'MM')
                         and tvv.right_to_date >= trunc(valDate, 'MM')
                     group by tvv.outlet_ams_id
                  ) a
                     on outl.outlet_ams_id = a.outlet_tc
                  left join
                  (
                      select code.code_code position_code,
                          code.code_value position_name
                      from ams.cla_codes code
                      where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                          and code.code_group = AMS_CORE_CODE.OUTLET_INFO_TYPE_POSI
                          and trunc(valDate, 'MM')
                              between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                              and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
                  ) posi
                      on posi.position_code = trim(outl.info_position_code)

                  union all

                  select /*+ CARDINALITY(repo, 100)
                             CARDINALITY(outl, 100)
                             CARDINALITY(agin, 100)*/
                      outl.outlet_ams_id,
                      outl.info_outlet_name,
                      outl.info_company_ams_id,
                      outl.info_company_name,
                      outl.info_agency_ams_id,
                      outl.info_agency_name,
                      outl.info_unit_ams_id,
                      outl.info_unit_name,
                      null info_effective_date,
                      null info_terminative_date,
                      null info_position_code,
                      agin.outlet_ams_id agin_outlet_ams_id,
                      agin.outlet_name agin_outlet_name,
                      agin.effective_date,
                      agin.terminative_date,
                      agin.agin_from_date,
                      agin.agin_to_date,
                      agin.agin_period_issue,
                      agin.agin_period_ip,
                      agin.agin_period_asmt,
                      nvl(agin.agin_period_money, 0) agin_period_money,
                      0 agin_comp_money,
                      1 type_of_data,
                      a.outlet_tc
                  from
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_ams_id
                    from ams.la_employment_rights_2013 tmp
                    where
                        (tmp.record_date = add_months(trunc(valDate, 'MM'), -5)
                        or tmp.record_date = add_months(trunc(valDate, 'MM'), -8)
                        or tmp.record_date = add_months(trunc(valDate, 'MM'), -11))
                    group by tmp.outlet_ams_id
                ) repo
                join
                (
                    select /*+ CARDINALITY(comp, 100)*/
                        comp.outlet_ams_id,
                        comp.info_outlet_name,
                        comp.info_company_ams_id,
                        comp.info_company_name,
                        comp.info_agency_ams_id,
                        comp.info_agency_name,
                        comp.info_unit_ams_id,
                        comp.info_unit_name
                    from ams.la_compensation_mmxiii comp
                    where comp.record_date = trunc(valDate, 'MM')
                        and comp.agin_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and var_branch_id in
                        (
                            comp.info_company_id,
                            comp.info_office_id,
                            comp.info_agency_id,
                            comp.info_unit_id
                        )
                  ) outl
                     on outl.outlet_ams_id = repo.outlet_ams_id
                  join
                  (
                      select /*+ CARDINALITY(tmp, 100)*/
                          tmp.outlet_ams_id,
                          tmp.outlet_name,
                          tmp.effective_date,
                          tmp.terminative_date,
                          tmp.agin_from_date,
                          tmp.agin_to_date,
                          tmp.agin_outlet_ams_id,
                          tmp.agin_period_issue,
                          tmp.agin_period_ip,
                          tmp.agin_period_asmt,
                          tmp.agin_period_money
                      from ams.la_comp_mmxiii_agin tmp
                      where tmp.record_date = trunc(valDate, 'MM')
                          and tmp.agin_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                          and tmp.effective_date >= trunc(valDate, 'YYYY')
                  ) agin
                      on agin.agin_outlet_ams_id = outl.outlet_ams_id
                  /*Danh dau cac dai ly dc tuyen khi DL tuyen la TVV TC*/
                  left join
                  (
                      select /*+ CARDINALITY(tvv, 100)*/
                         agin.outlet_ams_id outlet_tc
                      from ams.la_employment_rights_2013 tvv
                      join ams.la_comp_mmxiii_agin agin
                        on tvv.outlet_ams_id = agin.agin_outlet_ams_id
                      where agin.effective_date
                            between tvv.right_from_date
                                and tvv.right_to_date
                        and agin.agin_position_code in (
                          AMS_MODL_COMP_MMXIII_REPORT.COMP_CODE_MMXIII_CV00,
                          AMS_MODL_COMP_MMXIII_REPORT.COMP_CODE_MMXIII_CV05)
                  ) a
                     on agin.outlet_ams_id = a.outlet_tc
            ) res
            order by nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.info_unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese'),
                res.type_of_data,
                res.agin_effective_date;
        elsif var_branch_id = 0 then
            open row_records for
            select
                case
                    when res.type_of_data = 0 then
                        rank() over (
                            partition by res.type_of_data
                            order by nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                                nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.info_unit_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese')
                        )
                    end noid,
                case
                    when res.type_of_data = 0 then
                        res.outlet_ams_id
                    end outlet_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_outlet_name
                    end info_outlet_name,
                case
                    when res.type_of_data = 0 then
                        res.info_company_ams_id
                    end info_company_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_company_name
                    end info_company_name,
                case
                    when res.type_of_data = 0 then
                        res.info_agency_ams_id
                    end info_agency_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_agency_name
                    end info_agency_name,
                case
                    when res.type_of_data = 0 then
                        res.info_unit_ams_id
                    end info_unit_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_unit_name
                    end info_unit_name,
                case
                    when res.type_of_data = 0 then
                        res.info_position_name
                    end info_position_name,
                case
                    when res.type_of_data = 0 then
                        to_char(res.info_effective_date, 'DD/MM/YYYY')
                    end info_effective_date,
                case
                    when res.type_of_data = 0 then
                        to_char(res.info_terminative_date, 'DD/MM/YYYY')
                    end info_terminative_date,
                res.agin_outlet_ams_id,
                res.agin_outlet_name,
                to_char(res.agin_effective_date, 'DD/MM/YYYY') agin_effective_date,
                to_char(res.agin_terminative_date, 'DD/MM/YYYY') agin_terminative_date,
                to_char(res.agin_from_date, 'DD/MM/YYYY') agin_from_date,
                to_char(res.agin_to_date, 'DD/MM/YYYY') agin_to_date,
                res.agin_period_issue,
                res.agin_period_ip,
                nvl(res.agin_period_empl, 0) agin_period_empl,
                res.agin_period_money,
                res.agin_comp_money,
                case
                    when res.type_of_data = 0 then
                        AMS_MODL_COMP_MMXIII_REPORT.AGIN_DATA_GENR
                    when res.type_of_data = 1 then
                        AMS_MODL_COMP_MMXIII_REPORT.AGIN_DATA_QUAR
                    when res.type_of_data = 2 then
                        AMS_MODL_COMP_MMXIII_REPORT.AGIN_DATA_MONT
                    end type_of_data,


                case when res.outlet_tc is not null and res.type_of_data = 1 then
                        AMS_MODL_COMP_MMXIII_REPORT.AGIN_DATA_TVV_TC
                     when res.outlet_tc is null then
                        AMS_MODL_COMP_MMXIII_REPORT.AGIN_DATA_TVV
                     end outlet_tc
            from
            (
                select /*+ CARDINALITY(repo, 100)
                           CARDINALITY(outl, 100)
                           CARDINALITY(posi, 100)*/
                    outl.outlet_ams_id,
                    outl.info_outlet_name,
                    outl.info_company_ams_id,
                    outl.info_company_name,
                    outl.info_agency_ams_id,
                    outl.info_agency_name,
                    outl.info_unit_ams_id,
                    outl.info_unit_name,
                    posi.position_name info_position_name,
                    outl.info_effective_date,
                    outl.info_terminative_date,
                    outl.agin_outlet_ams_id,
                    outl.agin_outlet_name,
                    outl.agin_effective_date,
                    outl.agin_terminative_date,
                    outl.agin_from_date,
                    outl.agin_to_date,
                    outl.agin_period_issue,
                    outl.agin_period_ip,
                    outl.agin_period_empl,
                    outl.agin_comp_money agin_period_money,
                    outl.agin_comp_money,
                    0 type_of_data,
                    a.outlet_tc
                from
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_ams_id
                    from ams.la_employment_rights_2013 tmp
                    where
                        (tmp.record_date = add_months(trunc(valDate, 'MM'), -5)
                        or tmp.record_date = add_months(trunc(valDate, 'MM'), -8)
                        or tmp.record_date = add_months(trunc(valDate, 'MM'), -11))
                    group by tmp.outlet_ams_id
                ) repo
                join
                (
                    select /*+ CARDINALITY(comp, 100)*/
                        comp.outlet_ams_id,
                        comp.info_outlet_name,
                        comp.info_company_ams_id,
                        comp.info_company_name,
                        comp.info_agency_ams_id,
                        comp.info_agency_name,
                        comp.info_unit_ams_id,
                        comp.info_unit_name,
                        comp.info_effective_date,
                        comp.info_terminative_date,
                        comp.info_position_code,
                        null agin_outlet_ams_id,
                        null agin_outlet_name,
                        null agin_effective_date,
                        null agin_terminative_date,
                        null agin_from_date,
                        null agin_to_date,
                        null agin_period_issue,
                        null agin_period_ip,
                        null agin_period_money,
                        comp.agin_period_empl,
                        comp.agin_comp_money
                    from ams.la_compensation_mmxiii comp
                    where comp.record_date = trunc(valDate, 'MM')
                        and comp.agin_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                  ) outl
                     on outl.outlet_ams_id = repo.outlet_ams_id
                  left join
                  (
                     select
                        tvv.outlet_ams_id outlet_tc
                     from ams.la_employment_rights_2013 tvv
                     where tvv.right_from_date <= trunc(valDate, 'MM')
                         and tvv.right_to_date >= trunc(valDate, 'MM')
                     group by tvv.outlet_ams_id
                  ) a
                     on outl.outlet_ams_id = a.outlet_tc
                  left join
                  (
                      select code.code_code position_code,
                          code.code_value position_name
                      from ams.cla_codes code
                      where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                          and code.code_group = AMS_CORE_CODE.OUTLET_INFO_TYPE_POSI
                          and trunc(valDate, 'MM')
                              between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                              and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
                  ) posi
                      on posi.position_code = trim(outl.info_position_code)

                  union all

                  select /*+ CARDINALITY(repo, 100)
                             CARDINALITY(outl, 100)
                             CARDINALITY(agin, 100)*/
                      outl.outlet_ams_id,
                      outl.info_outlet_name,
                      outl.info_company_ams_id,
                      outl.info_company_name,
                      outl.info_agency_ams_id,
                      outl.info_agency_name,
                      outl.info_unit_ams_id,
                      outl.info_unit_name,
                      null info_effective_date,
                      null info_terminative_date,
                      null info_position_code,
                      agin.outlet_ams_id agin_outlet_ams_id,
                      agin.outlet_name agin_outlet_name,
                      agin.effective_date,
                      agin.terminative_date,
                      agin.agin_from_date,
                      agin.agin_to_date,
                      agin.agin_period_issue,
                      agin.agin_period_ip,
                      agin.agin_period_asmt,
                      nvl(agin.agin_period_money, 0) agin_period_money,
                      0 agin_comp_money,
                      1 type_of_data,
                      a.outlet_tc
                  from
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_ams_id
                    from ams.la_employment_rights_2013 tmp
                    where
                        (tmp.record_date = add_months(trunc(valDate, 'MM'), -5)
                        or tmp.record_date = add_months(trunc(valDate, 'MM'), -8)
                        or tmp.record_date = add_months(trunc(valDate, 'MM'), -11))
                    group by tmp.outlet_ams_id
                ) repo
                join
                (
                    select /*+ CARDINALITY(comp, 100)*/
                        comp.outlet_ams_id,
                        comp.info_outlet_name,
                        comp.info_company_ams_id,
                        comp.info_company_name,
                        comp.info_agency_ams_id,
                        comp.info_agency_name,
                        comp.info_unit_ams_id,
                        comp.info_unit_name
                    from ams.la_compensation_mmxiii comp
                    where comp.record_date = trunc(valDate, 'MM')
                        and comp.agin_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                  ) outl
                     on outl.outlet_ams_id = repo.outlet_ams_id
                  join
                  (
                      select /*+ CARDINALITY(tmp, 100)*/
                          tmp.outlet_ams_id,
                          tmp.outlet_name,
                          tmp.effective_date,
                          tmp.terminative_date,
                          tmp.agin_from_date,
                          tmp.agin_to_date,
                          tmp.agin_outlet_ams_id,
                          tmp.agin_period_issue,
                          tmp.agin_period_ip,
                          tmp.agin_period_asmt,
                          tmp.agin_period_money
                      from ams.la_comp_mmxiii_agin tmp
                      where tmp.record_date = trunc(valDate, 'MM')
                          and tmp.agin_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                          and tmp.effective_date >= trunc(valDate, 'YYYY')
                  ) agin
                      on agin.agin_outlet_ams_id = outl.outlet_ams_id
                  /*Danh dau cac dai ly dc tuyen khi DL tuyen la TVV TC*/
                  left join
                  (
                      select /*+ CARDINALITY(tvv, 100)*/
                         agin.outlet_ams_id outlet_tc
                      from ams.la_employment_rights_2013 tvv
                      join ams.la_comp_mmxiii_agin agin
                        on tvv.outlet_ams_id = agin.agin_outlet_ams_id
                      where agin.effective_date
                            between tvv.right_from_date
                                and tvv.right_to_date
                        and agin.agin_position_code in (
                          AMS_MODL_COMP_MMXIII_REPORT.COMP_CODE_MMXIII_CV00,
                          AMS_MODL_COMP_MMXIII_REPORT.COMP_CODE_MMXIII_CV05)
                  ) a
                     on agin.outlet_ams_id = a.outlet_tc
            ) res
            order by nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.info_unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese'),
                res.type_of_data,
                res.agin_effective_date;
            end if;
    end;

    --chi tiet IP trong 90 ngay lam viec dau tien
    procedure mmxiii_get_agin02(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor)
    is
        var_branch_id number(10) := nvl(valBranchID, 0);
        var_agent_id number(10) := nvl(valAgentID, 0);
    begin
        if var_agent_id <> 0 then
              open row_records for
              select /*+
                         CARDINALITY(outl, 100)
                         CARDINALITY(tran, 100)
                         CARDINALITY(trans_type, 100)
                         */
                  outl.outlet_id,
                  outl.outlet_ams_id,
                  outl.outlet_name,
                  outl.company_id,
                  outl.company_name,
                  outl.office_id,
                  outl.office_name,
                  outl.agency_id,
                  outl.agency_name,
                  outl.unit_id,
                  outl.unit_name,
                  to_char(outl.effective_date, 'DD/MM/YYYY') effective_date,
                  to_char(outl.terminative_date, 'DD/MM/YYYY') terminative_date,
                  to_char(outl.agin_record_date, 'DD/MM/YYYY') agin_record_date,
                  to_char(outl.agin_from_date, 'DD/MM/YYYY') agin_from_date,
                  to_char(outl.agin_to_date, 'DD/MM/YYYY') agin_to_date,
                  nvl(trans_type.trans_name, tran.trans_code) transaction_code,
                  to_char(tran.trans_date, 'DD/MM/YYYY') transaction_date,
                  tran.policy_number,
                  tran.trans_ip,
                  tran.data_source
              from
              (
                  select /*+ CARDINALITY(tmp, 100)*/
                      tmp.outlet_id,
                      tmp.outlet_ams_id,
                      tmp.outlet_name,
                      tmp.company_id,
                      tmp.company_name,
                      tmp.office_id,
                      tmp.office_name,
                      tmp.agency_id,
                      tmp.agency_name,
                      tmp.unit_id,
                      tmp.unit_name,
                      tmp.effective_date,
                      tmp.terminative_date,
                      tmp.position_code,
                      tmp.position_date,
                      tmp.agin_record_date,
                      tmp.agin_period_begin agin_from_date,
                      tmp.agin_period_end agin_to_date,
                      tmp.agin_period_issue,
                      tmp.agin_period_ip
                  from ams.la_comp_mmxiii_agin_na tmp
                  where tmp.record_date = trunc(valDate, 'YYYY')
                      and tmp.outlet_id = var_agent_id
              ) outl
              /*cho nay can lam la IP trong 90 ngay lam viec dau tien cua no
              xet ngay hieu luc cho no
              can kiem tra xem cho nay chay co lau khong?*/
              join
              (
                  select  /*+ CARDINALITY(tmp, 100)*/
                      tmp.outlet_ams_id,
                      tmp.policy_number,
                      tmp.trans_date,
                      tmp.trans_code,
                      tmp.trans_ip,
                      tmp.data_source
                  from ams.la_comp_mmxiii_agin_trans tmp
                  where tmp.outlet_id = var_agent_id
              ) tran
                  on
                  (
                      tran.outlet_ams_id = outl.outlet_ams_id
                      and--trong vong  90 ngay lam viec dau tien cua dai ly luu o day
                      tran.trans_date between outl.agin_from_date and outl.agin_to_date
                  )
              left join
              (
                  select /*+ CARDINALITY(code, 100)*/
                      code.code_code trans_code,
                      code.code_value trans_name
                  from ams.cla_codes code
                  where code.code_language = AMS_CORE_SYSTEM.THEME_LANGUAGE
                      and code.code_group = 'TRANS'
                      and trunc(sysdate, 'DD')
                          between nvl(code.from_date, AMS_CORE_SYSTEM.DATE_MIN_VALUE)
                          and nvl(code.to_date, AMS_CORE_SYSTEM.DATE_MAX_VALUE)
              ) trans_type
                  on trans_type.trans_code = tran.trans_code
              order by
                  nlssort(outl.company_name, 'nls_sort=Vietnamese'),
                  nlssort(outl.office_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(outl.agency_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(outl.unit_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(outl.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(outl.outlet_ams_id, 'nls_sort=Vietnamese');
        elsif var_branch_id <> 0 then
              open row_records for
              select /*+
                         CARDINALITY(outl, 100)
                         CARDINALITY(tran, 100)
                         CARDINALITY(trans_type, 100)
                         */
                  outl.outlet_id,
                  outl.outlet_ams_id,
                  outl.outlet_name,
                  outl.company_id,
                  outl.company_name,
                  outl.office_id,
                  outl.office_name,
                  outl.agency_id,
                  outl.agency_name,
                  outl.unit_id,
                  outl.unit_name,
                  to_char(outl.effective_date, 'DD/MM/YYYY') effective_date,
                  to_char(outl.terminative_date, 'DD/MM/YYYY') terminative_date,
                  to_char(outl.agin_record_date, 'DD/MM/YYYY') agin_record_date,
                  to_char(outl.agin_from_date, 'DD/MM/YYYY') agin_from_date,
                  to_char(outl.agin_to_date, 'DD/MM/YYYY') agin_to_date,
                  nvl(trans_type.trans_name, tran.trans_code) transaction_code,
                  to_char(tran.trans_date, 'DD/MM/YYYY') transaction_date,
                  tran.policy_number,
                  tran.trans_ip,
                  tran.data_source
              from
              (
                  select /*+ CARDINALITY(tmp, 100)*/
                      tmp.outlet_id,
                      tmp.outlet_ams_id,
                      tmp.outlet_name,
                      tmp.company_id,
                      tmp.company_name,
                      tmp.office_id,
                      tmp.office_name,
                      tmp.agency_id,
                      tmp.agency_name,
                      tmp.unit_id,
                      tmp.unit_name,
                      tmp.effective_date,
                      tmp.terminative_date,
                      tmp.position_code,
                      tmp.position_date,
                      tmp.agin_record_date,
                      tmp.agin_period_begin agin_from_date,
                      tmp.agin_period_end agin_to_date,
                      tmp.agin_period_issue,
                      tmp.agin_period_ip
                  from ams.la_comp_mmxiii_agin_na tmp
                  where tmp.record_date = trunc(valDate, 'YYYY')
                      and var_branch_id in
                      (
                          tmp.company_id,
                          tmp.office_id,
                          tmp.agency_id,
                          tmp.unit_id
                      )
              ) outl
              /*cho nay can lam la IP trong 90 ngay lam viec dau tien cua no
              xet ngay hieu luc cho no
              can kiem tra xem cho nay chay co lau khong?*/
              join
              (
                  select  /*+ CARDINALITY(tmp, 100)*/
                      tmp.outlet_ams_id,
                      tmp.policy_number,
                      tmp.trans_date,
                      tmp.trans_code,
                      tmp.trans_ip,
                      tmp.data_source
                  from ams.la_comp_mmxiii_agin_trans tmp
                  where var_branch_id in
                  (
                      tmp.company_id,
                      tmp.office_id,
                      tmp.agency_id,
                      tmp.unit_id
                  )
              ) tran
                  on
                  (
                      tran.outlet_ams_id = outl.outlet_ams_id
                      and--trong vong  90 ngay lam viec dau tien cua dai ly luu o day
                      tran.trans_date between outl.agin_from_date and outl.agin_to_date
                  )
              left join
              (
                  select /*+ CARDINALITY(code, 100)*/
                      code.code_code trans_code,
                      code.code_value trans_name
                  from ams.cla_codes code
                  where code.code_language = AMS_CORE_SYSTEM.THEME_LANGUAGE
                      and code.code_group = 'TRANS'
                      and trunc(sysdate, 'DD')
                          between nvl(code.from_date, AMS_CORE_SYSTEM.DATE_MIN_VALUE)
                          and nvl(code.to_date, AMS_CORE_SYSTEM.DATE_MAX_VALUE)
              ) trans_type
                  on trans_type.trans_code = tran.trans_code
              order by
                  nlssort(outl.company_name, 'nls_sort=Vietnamese'),
                  nlssort(outl.office_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(outl.agency_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(outl.unit_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(outl.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(outl.outlet_ams_id, 'nls_sort=Vietnamese');
        elsif var_branch_id = 0 then
              open row_records for
              select /*+
                         CARDINALITY(outl, 100)
                         CARDINALITY(tran, 100)
                         CARDINALITY(trans_type, 100)
                         */
                  outl.outlet_id,
                  outl.outlet_ams_id,
                  outl.outlet_name,
                  outl.company_id,
                  outl.company_name,
                  outl.office_id,
                  outl.office_name,
                  outl.agency_id,
                  outl.agency_name,
                  outl.unit_id,
                  outl.unit_name,
                  to_char(outl.effective_date, 'DD/MM/YYYY') effective_date,
                  to_char(outl.terminative_date, 'DD/MM/YYYY') terminative_date,
                  to_char(outl.agin_record_date, 'DD/MM/YYYY') agin_record_date,
                  to_char(outl.agin_from_date, 'DD/MM/YYYY') agin_from_date,
                  to_char(outl.agin_to_date, 'DD/MM/YYYY') agin_to_date,
                  nvl(trans_type.trans_name, tran.trans_code) transaction_code,
                  to_char(tran.trans_date, 'DD/MM/YYYY') transaction_date,
                  tran.policy_number,
                  tran.trans_ip,
                  tran.data_source
              from
              (
                  select /*+ CARDINALITY(tmp, 100)*/
                      tmp.outlet_id,
                      tmp.outlet_ams_id,
                      tmp.outlet_name,
                      tmp.company_id,
                      tmp.company_name,
                      tmp.office_id,
                      tmp.office_name,
                      tmp.agency_id,
                      tmp.agency_name,
                      tmp.unit_id,
                      tmp.unit_name,
                      tmp.effective_date,
                      tmp.terminative_date,
                      tmp.position_code,
                      tmp.position_date,
                      tmp.agin_record_date,
                      tmp.agin_period_begin agin_from_date,
                      tmp.agin_period_end agin_to_date,
                      tmp.agin_period_issue,
                      tmp.agin_period_ip
                  from ams.la_comp_mmxiii_agin_na tmp
                  where tmp.record_date = trunc(valDate, 'YYYY')
              ) outl
              /*cho nay can lam la IP trong 90 ngay lam viec dau tien cua no
              xet ngay hieu luc cho no
              can kiem tra xem cho nay chay co lau khong?*/
              join
              (
                  select  /*+ CARDINALITY(tmp, 100)*/
                      tmp.outlet_ams_id,
                      tmp.policy_number,
                      tmp.trans_date,
                      tmp.trans_code,
                      tmp.trans_ip,
                      tmp.data_source
                  from ams.la_comp_mmxiii_agin_trans tmp
              ) tran
                  on
                  (
                      tran.outlet_ams_id = outl.outlet_ams_id
                      and--trong vong  90 ngay lam viec dau tien cua dai ly luu o day
                      tran.trans_date between outl.agin_from_date and outl.agin_to_date
                  )
              left join
              (
                  select /*+ CARDINALITY(code, 100)*/
                      code.code_code trans_code,
                      code.code_value trans_name
                  from ams.cla_codes code
                  where code.code_language = AMS_CORE_SYSTEM.THEME_LANGUAGE
                      and code.code_group = 'TRANS'
                      and trunc(sysdate, 'DD')
                          between nvl(code.from_date, AMS_CORE_SYSTEM.DATE_MIN_VALUE)
                          and nvl(code.to_date, AMS_CORE_SYSTEM.DATE_MAX_VALUE)
              ) trans_type
                  on trans_type.trans_code = tran.trans_code
              order by
                  nlssort(outl.company_name, 'nls_sort=Vietnamese'),
                  nlssort(outl.office_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(outl.agency_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(outl.unit_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(outl.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(outl.outlet_ams_id, 'nls_sort=Vietnamese');
          end if;
    end;

    procedure mmxiii_get_agfa01(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor)
    is
        var_branch_id number(10) := nvl(valBranchID, 0);
        var_agent_id number(10) := nvl(valAgentID, 0);
    begin
        if var_agent_id <> 0 then
            open row_records for
            select
                case
                    when res.type_of_data = 0 then
                        rank() over (
                            partition by res.type_of_data
                            order by nlssort(res.company_name, 'nls_sort=Vietnamese'),
                                nlssort(res.agency_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.unit_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese')
                        )
                    end noid,
                case
                    when res.type_of_data = 0 then
                        res.company_name
                    end company_name,
                case
                    when res.type_of_data = 0 then
                        res.agency_name
                    end agency_name,
                case
                    when res.type_of_data = 0  then
                        res.unit_name
                    end unit_name,
                case
                    when res.type_of_data = 0  then
                        res.outlet_ams_id
                    end outlet_ams_id,
                case
                    when res.type_of_data = 0  then
                        res.outlet_name
                    end outlet_name,
                res.position_name,
                to_char(res.effective_date, 'DD/MM/YYYY') effective_date,
                to_char(res.terminative_date, 'DD/MM/YYYY') terminative_date,
                to_char(res.agfa_data_date, 'DD/MM/YYYY') agfa_data_date,
                res.agfa_period_fyp,
                res.agfa_period_fyc,
                res.agfa_period_fypn,
                res.agfa_period_afis,
                res.agfa_period_afif,
                res.agfa_period_pr36,
                res.agfa_period_issu,
                res.agfa_comp_ratio,
                res.agfa_comp_money,
                case
                    when res.type_of_data = 0 then
                        AMS_MODL_COMP_MMXIII_REPORT.AGFA_DATA_GENR
                    when res.type_of_data = 1 then
                        AMS_MODL_COMP_MMXIII_REPORT.AGFA_DATA_MONT
                    end type_of_data
            from
            (
                select
                    outl.outlet_ams_id,
                    outl.outlet_name,
                    outl.company_name,
                    outl.agency_name,
                    outl.unit_name,
                    pos.position_name,
                    outl.effective_date,
                    outl.terminative_date,
                    outl.agfa_data_date,
                    outl.agfa_period_fyp,
                    outl.agfa_period_fyc,
                    outl.agfa_period_fypn,
                    outl.agfa_period_afis,
                    outl.agfa_period_afif,
                    outl.agfa_period_pr36,
                    outl.agfa_period_issu,
                    outl.agfa_comp_ratio,
                    outl.agfa_comp_money,
                    0 type_of_data
                from
                (
                    select
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.outlet_name,
                        tmp.company_name,
                        tmp.agency_name,
                        tmp.unit_name,
                        tmp.effective_date,
                        tmp.terminative_date,
                        tmp.position_code,
                        tmp.agfa_data_date,
                        tmp.agfa_period_fyp,
                        tmp.agfa_period_fyc,
                        tmp.agfa_period_fypn,
                        tmp.agfa_period_afis,
                        tmp.agfa_period_afif,
                        tmp.agfa_period_pr36,
                        tmp.agfa_period_issu,
                        tmp.agfa_comp_ratio,
                        tmp.agfa_comp_money
                    from ams.la_comp_mmxiii_agfa tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.agfa_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.agfa_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                        and tmp.outlet_id = var_agent_id
                ) outl
                left join
                (
                    select code.code_code position_code,
                        code.code_value position_name
                    from ams.cla_codes code
                    where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                        and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                        and trunc(valDate, 'MM')
                            between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                            and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
                ) pos
                    on pos.position_code = outl.position_code

                union all

                select
                    tmp.outlet_ams_id,
                    tmp.outlet_name,
                    tmp.company_name,
                    tmp.agency_name,
                    tmp.unit_name,
                    null position_name,
                    null effective_date,
                    null terminative_date,
                    tmp.agfa_data_date,
                    tmp.agfa_period_fyp,
                    tmp.agfa_period_fyc,
                    tmp.agfa_period_fypn,
                    null agfa_period_afis,
                    null agfa_period_afif,
                    null agfa_period_pr36,
                    tmp.agfa_period_issu,
                    null agfa_comp_ratio,
                    null agfa_comp_money,
                    1 type_of_data
                from ams.la_comp_mmxiii_agfa tmp
                where tmp.record_date = trunc(valDate, 'MM')
                    and tmp.agfa_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                    and tmp.agfa_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_DTL
                    and tmp.outlet_id = var_agent_id
            ) res
            order by
                nlssort(res.company_name, 'nls_sort=Vietnamese'),
                nlssort(res.agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese'),
                res.type_of_data,
                res.agfa_data_date;
       elsif var_branch_id <> 0 then
            open row_records for
            select
                case
                    when res.type_of_data = 0 then
                        rank() over (
                            partition by res.type_of_data
                            order by nlssort(res.company_name, 'nls_sort=Vietnamese'),
                                nlssort(res.agency_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.unit_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese')
                        )
                    end noid,
                case
                    when res.type_of_data = 0 then
                        res.company_name
                    end company_name,
                case
                    when res.type_of_data = 0 then
                        res.agency_name
                    end agency_name,
                case
                    when res.type_of_data = 0  then
                        res.unit_name
                    end unit_name,
                case
                    when res.type_of_data = 0  then
                        res.outlet_ams_id
                    end outlet_ams_id,
                case
                    when res.type_of_data = 0  then
                        res.outlet_name
                    end outlet_name,
                res.position_name,
                to_char(res.effective_date, 'DD/MM/YYYY') effective_date,
                to_char(res.terminative_date, 'DD/MM/YYYY') terminative_date,
                to_char(res.agfa_data_date, 'DD/MM/YYYY') agfa_data_date,
                res.agfa_period_fyp,
                res.agfa_period_fyc,
                res.agfa_period_fypn,
                res.agfa_period_afis,
                res.agfa_period_afif,
                res.agfa_period_pr36,
                res.agfa_period_issu,
                res.agfa_comp_ratio,
                res.agfa_comp_money,
                case
                    when res.type_of_data = 0 then
                        AMS_MODL_COMP_MMXIII_REPORT.AGFA_DATA_GENR
                    when res.type_of_data = 1 then
                        AMS_MODL_COMP_MMXIII_REPORT.AGFA_DATA_MONT
                    end type_of_data
            from
            (
                select
                    outl.outlet_ams_id,
                    outl.outlet_name,
                    outl.company_name,
                    outl.agency_name,
                    outl.unit_name,
                    pos.position_name,
                    outl.effective_date,
                    outl.terminative_date,
                    outl.agfa_data_date,
                    outl.agfa_period_fyp,
                    outl.agfa_period_fyc,
                    outl.agfa_period_fypn,
                    outl.agfa_period_afis,
                    outl.agfa_period_afif,
                    outl.agfa_period_pr36,
                    outl.agfa_period_issu,
                    outl.agfa_comp_ratio,
                    outl.agfa_comp_money,
                    0 type_of_data
                from
                (
                    select
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.outlet_name,
                        tmp.company_name,
                        tmp.agency_name,
                        tmp.unit_name,
                        tmp.effective_date,
                        tmp.terminative_date,
                        tmp.position_code,
                        tmp.agfa_data_date,
                        tmp.agfa_period_fyp,
                        tmp.agfa_period_fyc,
                        tmp.agfa_period_fypn,
                        tmp.agfa_period_afis,
                        tmp.agfa_period_afif,
                        tmp.agfa_period_pr36,
                        tmp.agfa_period_issu,
                        tmp.agfa_comp_ratio,
                        tmp.agfa_comp_money
                    from ams.la_comp_mmxiii_agfa tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.agfa_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.agfa_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                        and var_branch_id in
                        (
                            tmp.company_id,
                            tmp.office_id,
                            tmp.agency_id,
                            tmp.unit_id
                        )
                ) outl
                left join
                (
                    select code.code_code position_code,
                        code.code_value position_name
                    from ams.cla_codes code
                    where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                        and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                        and trunc(valDate, 'MM')
                            between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                            and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
                ) pos
                    on pos.position_code = outl.position_code

                union all

                select
                    tmp.outlet_ams_id,
                    tmp.outlet_name,
                    tmp.company_name,
                    tmp.agency_name,
                    tmp.unit_name,
                    null position_name,
                    null effective_date,
                    null terminative_date,
                    tmp.agfa_data_date,
                    tmp.agfa_period_fyp,
                    tmp.agfa_period_fyc,
                    tmp.agfa_period_fypn,
                    null agfa_period_afis,
                    null agfa_period_afif,
                    null agfa_period_pr36,
                    tmp.agfa_period_issu,
                    null agfa_comp_ratio,
                    null agfa_comp_money,
                    1 type_of_data
                from ams.la_comp_mmxiii_agfa tmp
                where tmp.record_date = trunc(valDate, 'MM')
                    and tmp.agfa_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                    and tmp.agfa_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_DTL
                    and var_branch_id in
                    (
                        tmp.company_id,
                        tmp.office_id,
                        tmp.agency_id,
                        tmp.unit_id
                    )
            ) res
            order by
                nlssort(res.company_name, 'nls_sort=Vietnamese'),
                nlssort(res.agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese'),
                res.type_of_data,
                res.agfa_data_date;
       elsif var_branch_id = 0 then
            open row_records for
            select
                case
                    when res.type_of_data = 0 then
                        rank() over (
                            partition by res.type_of_data
                            order by nlssort(res.company_name, 'nls_sort=Vietnamese'),
                                nlssort(res.agency_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.unit_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese')
                        )
                    end noid,
                case
                    when res.type_of_data = 0 then
                        res.company_name
                    end company_name,
                case
                    when res.type_of_data = 0 then
                        res.agency_name
                    end agency_name,
                case
                    when res.type_of_data = 0  then
                        res.unit_name
                    end unit_name,
                case
                    when res.type_of_data = 0  then
                        res.outlet_ams_id
                    end outlet_ams_id,
                case
                    when res.type_of_data = 0  then
                        res.outlet_name
                    end outlet_name,
                res.position_name,
                to_char(res.effective_date, 'DD/MM/YYYY') effective_date,
                to_char(res.terminative_date, 'DD/MM/YYYY') terminative_date,
                to_char(res.agfa_data_date, 'DD/MM/YYYY') agfa_data_date,
                res.agfa_period_fyp,
                res.agfa_period_fyc,
                res.agfa_period_fypn,
                res.agfa_period_afis,
                res.agfa_period_afif,
                res.agfa_period_pr36,
                res.agfa_period_issu,
                res.agfa_comp_ratio,
                res.agfa_comp_money,
                case
                    when res.type_of_data = 0 then
                        AMS_MODL_COMP_MMXIII_REPORT.AGFA_DATA_GENR
                    when res.type_of_data = 1 then
                        AMS_MODL_COMP_MMXIII_REPORT.AGFA_DATA_MONT
                    end type_of_data
            from
            (
                select
                    outl.outlet_ams_id,
                    outl.outlet_name,
                    outl.company_name,
                    outl.agency_name,
                    outl.unit_name,
                    pos.position_name,
                    outl.effective_date,
                    outl.terminative_date,
                    outl.agfa_data_date,
                    outl.agfa_period_fyp,
                    outl.agfa_period_fyc,
                    outl.agfa_period_fypn,
                    outl.agfa_period_afis,
                    outl.agfa_period_afif,
                    outl.agfa_period_pr36,
                    outl.agfa_period_issu,
                    outl.agfa_comp_ratio,
                    outl.agfa_comp_money,
                    0 type_of_data
                from
                (
                    select
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.outlet_name,
                        tmp.company_name,
                        tmp.agency_name,
                        tmp.unit_name,
                        tmp.effective_date,
                        tmp.terminative_date,
                        tmp.position_code,
                        tmp.agfa_data_date,
                        tmp.agfa_period_fyp,
                        tmp.agfa_period_fyc,
                        tmp.agfa_period_fypn,
                        tmp.agfa_period_afis,
                        tmp.agfa_period_afif,
                        tmp.agfa_period_pr36,
                        tmp.agfa_period_issu,
                        tmp.agfa_comp_ratio,
                        tmp.agfa_comp_money
                    from ams.la_comp_mmxiii_agfa tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.agfa_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.agfa_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                ) outl
                left join
                (
                    select code.code_code position_code,
                        code.code_value position_name
                    from ams.cla_codes code
                    where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                        and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                        and trunc(valDate, 'MM')
                            between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                            and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
                ) pos
                    on pos.position_code = outl.position_code

                union all

                select
                    tmp.outlet_ams_id,
                    tmp.outlet_name,
                    tmp.company_name,
                    tmp.agency_name,
                    tmp.unit_name,
                    null position_name,
                    null effective_date,
                    null terminative_date,
                    tmp.agfa_data_date,
                    tmp.agfa_period_fyp,
                    tmp.agfa_period_fyc,
                    tmp.agfa_period_fypn,
                    null agfa_period_afis,
                    null agfa_period_afif,
                    null agfa_period_pr36,
                    tmp.agfa_period_issu,
                    null agfa_comp_ratio,
                    null agfa_comp_money,
                    1 type_of_data
                from ams.la_comp_mmxiii_agfa tmp
                where tmp.record_date = trunc(valDate, 'MM')
                    and tmp.agfa_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                    and tmp.agfa_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_DTL
            ) res
            order by
                nlssort(res.company_name, 'nls_sort=Vietnamese'),
                nlssort(res.agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese'),
                res.type_of_data,
                res.agfa_data_date;
        end if;
    end;

    /*chinhlk them vao ngay 12/10/2012
    bao cao tong hop hoat dong deu*/
    procedure mmxiii_get_agfa02(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor)
    is
        var_branch_id number(10) := nvl(valBranchID, 0);
        var_agent_id number(10) := nvl(valAgentID, 0);
        var_record_date date := trunc(valDate, 'MM');
        var_from_date date := add_months(trunc(valDate, 'MM'), -2);
        var_begin_year date := trunc(valDate, 'YYYY');
    begin
        if var_agent_id <> 0 then
            open row_records for
            select
                res.company_name,
                res.office_name,
                res.agency_name,
                res.office_name,
                res.unit_name,
                res.outlet_id,
                res.outlet_ams_id,
                res.outlet_name,
                res.position_name,
                to_char(add_months(res.record_date, -2), 'DD/MM/YYYY') period_from_date,
                to_char(last_day(res.record_date), 'DD/MM/YYYY') period_to_date,
                to_char(res.effective_date, 'DD/MM/YYYY') effective_date,
                to_char(res.terminative_date, 'DD/MM/YYYY') terminative_date,
                round(
                    months_between(
                        last_day(res.record_date),
                        res.effective_date
                    )
                , 2
                ) senior,
                res.agfa_period_issu,
                res.agfa_period_fypn,
                res.agfa_period_fyp,
                res.agfa_period_afis,
                res.agfa_period_afif,
                res.agfa_period_pr36,
                res.agfa_period_coll_etmt,
                res.agfa_period_coll_real,
                round(
                    decode(nvl(res.agfa_period_coll_etmt, 0),
                        0, 100,
                        (nvl(res.agfa_period_coll_real, 0) / nvl(res.agfa_period_coll_etmt, 0)) * 100
                    ),
                    2
                ) agfa_coll_rate,
                res.agfa_period_fyc,
                res.agfa_comp_ratio,
                res.agfa_comp_money,
                res.agfa_comp_accumulated
            from
            (
                select  /*+ CARDINALITY(outl, 100)
                                 CARDINALITY(off, 100)
                                 CARDINALITY(pos, 100)*/
                    outl.outlet_id,
                    outl.outlet_ams_id,
                    outl.outlet_name,
                    outl.company_name,
                    outl.office_name,
                    outl.agency_name,
                    outl.unit_name,
                    pos.position_name,
                    outl.effective_date,
                    outl.terminative_date,
                    outl.record_date,
                    outl.agfa_data_date,
                    outl.agfa_period_issu,
                    outl.agfa_period_fypn,
                    outl.agfa_period_fyp,
                    outl.agfa_period_fyc,
                    outl.agfa_period_afis,
                    outl.agfa_period_afif,
                    outl.agfa_period_pr36,
                    coll.agfa_period_coll_etmt,
                    coll.agfa_period_coll_real,
                    outl.agfa_comp_ratio,
                    outl.agfa_comp_money,
                    acc.agfa_comp_accumulated
                from
                (
                    select  /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.outlet_name,
                        tmp.company_name,
                        tmp.office_name,
                        tmp.agency_name,
                        tmp.unit_name,
                        tmp.effective_date,
                        tmp.terminative_date,
                        tmp.position_code,
                        tmp.record_date,
                        tmp.agfa_data_date,
                        tmp.agfa_period_issu,
                        tmp.agfa_period_fypn,
                        tmp.agfa_period_fyp,
                        tmp.agfa_period_fyc,
                        tmp.agfa_period_afis,
                        tmp.agfa_period_afif,
                        tmp.agfa_period_pr36,
                        tmp.agfa_comp_ratio,
                        tmp.agfa_comp_money
                    from ams.la_comp_mmxiii_agfa tmp
                    where tmp.record_date = var_record_date
                        and tmp.agfa_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.agfa_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                        and tmp.outlet_id = var_agent_id
                ) outl
                left join
                (
                    select /*+ CARDINALITY(outl, 100)*/
                        outl.outlet_id,
                        outl.period_coll_etmt agfa_period_coll_etmt,
                        outl.period_coll_real agfa_period_coll_real
                    from ams.serv_outlet_data outl
                    where outl.record_date = var_record_date
                        and outl.type_code = ams.AMS_MODL_COMP_MMXIII_REPORT.MODULE_CODE_MAIN
                        and outl.status_code = ams.AMS_MODL_COMP_MMXIII_REPORT.OBJECT_STATUS_ACTIVE
                        and outl.outlet_id = var_agent_id
                ) coll
                    on coll.outlet_id = outl.outlet_id
                left join
                (   /*luy ke tu dau nam*/
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_id,
                        sum(nvl(tmp.agfa_comp_money, 0)) agfa_comp_accumulated
                    from ams.la_comp_mmxiii_agfa tmp
                    where tmp.record_date between var_begin_year and var_record_date
                        and tmp.agfa_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.agfa_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                        and tmp.outlet_id = var_agent_id
                    group by tmp.outlet_id
                ) acc
                    on acc.outlet_id = outl.outlet_id
                left join
                (
                    select code.code_code position_code,
                        code.code_value position_name
                    from ams.cla_codes code
                    where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                        and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                        and trunc(valDate, 'MM')
                            between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                            and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
                ) pos
                    on pos.position_code = outl.position_code
            ) res
            order by
                nlssort(res.company_name, 'nls_sort=Vietnamese'),
                nlssort(res.office_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese'),
                res.record_date;
       elsif var_branch_id <> 0 then
            open row_records for
            select
                res.company_name,
                res.office_name,
                res.agency_name,
                res.office_name,
                res.unit_name,
                res.outlet_id,
                res.outlet_ams_id,
                res.outlet_name,
                res.position_name,
                to_char(add_months(res.record_date, -2), 'DD/MM/YYYY') period_from_date,
                to_char(last_day(res.record_date), 'DD/MM/YYYY') period_to_date,
                to_char(res.effective_date, 'DD/MM/YYYY') effective_date,
                to_char(res.terminative_date, 'DD/MM/YYYY') terminative_date,
                round(
                    months_between(
                        last_day(res.record_date),
                        res.effective_date
                    )
                , 2
                ) senior,
                res.agfa_period_issu,
                res.agfa_period_fypn,
                res.agfa_period_fyp,
                res.agfa_period_afis,
                res.agfa_period_afif,
                res.agfa_period_pr36,
                res.agfa_period_coll_etmt,
                res.agfa_period_coll_real,
                round(
                    decode(nvl(res.agfa_period_coll_etmt, 0),
                        0, 100,
                        (nvl(res.agfa_period_coll_real, 0) / nvl(res.agfa_period_coll_etmt, 0)) * 100
                    ),
                    2
                ) agfa_coll_rate,
                res.agfa_period_fyc,
                res.agfa_comp_ratio,
                res.agfa_comp_money,
                res.agfa_comp_accumulated
            from
            (
                select  /*+ CARDINALITY(outl, 100)
                                 CARDINALITY(off, 100)
                                 CARDINALITY(pos, 100)*/
                    outl.outlet_id,
                    outl.outlet_ams_id,
                    outl.outlet_name,
                    outl.company_name,
                    outl.office_name,
                    outl.agency_name,
                    outl.unit_name,
                    pos.position_name,
                    outl.effective_date,
                    outl.terminative_date,
                    outl.record_date,
                    outl.agfa_data_date,
                    outl.agfa_period_issu,
                    outl.agfa_period_fypn,
                    outl.agfa_period_fyp,
                    outl.agfa_period_fyc,
                    outl.agfa_period_afis,
                    outl.agfa_period_afif,
                    outl.agfa_period_pr36,
                    coll.agfa_period_coll_etmt,
                    coll.agfa_period_coll_real,
                    outl.agfa_comp_ratio,
                    outl.agfa_comp_money,
                    acc.agfa_comp_accumulated
                from
                (
                    select  /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.outlet_name,
                        tmp.company_name,
                        tmp.office_name,
                        tmp.agency_name,
                        tmp.unit_name,
                        tmp.effective_date,
                        tmp.terminative_date,
                        tmp.position_code,
                        tmp.record_date,
                        tmp.agfa_data_date,
                        tmp.agfa_period_issu,
                        tmp.agfa_period_fypn,
                        tmp.agfa_period_fyp,
                        tmp.agfa_period_fyc,
                        tmp.agfa_period_afis,
                        tmp.agfa_period_afif,
                        tmp.agfa_period_pr36,
                        tmp.agfa_comp_ratio,
                        tmp.agfa_comp_money
                    from ams.la_comp_mmxiii_agfa tmp
                    where tmp.record_date = var_record_date
                        and tmp.agfa_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.agfa_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                        and var_branch_id in
                        (
                            tmp.company_id,
                            tmp.office_id,
                            tmp.agency_id,
                            tmp.unit_id
                        )
                ) outl
                left join
                (
                    select /*+ CARDINALITY(outl, 100)*/
                        outl.outlet_id,
                        outl.period_coll_etmt agfa_period_coll_etmt,
                        outl.period_coll_real agfa_period_coll_real
                    from ams.serv_outlet_data outl
                    where outl.record_date = var_record_date
                        and outl.type_code = ams.AMS_MODL_COMP_MMXIII_REPORT.MODULE_CODE_MAIN
                        and outl.status_code = ams.AMS_MODL_COMP_MMXIII_REPORT.OBJECT_STATUS_ACTIVE
                        and var_branch_id in
                        (
                            outl.company_id,
                            outl.office_id,
                            outl.agency_id,
                            outl.unit_id
                        )
                ) coll
                    on coll.outlet_id = outl.outlet_id
                left join
                (   /*luy ke tu dau nam*/
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_id,
                        sum(nvl(tmp.agfa_comp_money, 0)) agfa_comp_accumulated
                    from ams.la_comp_mmxiii_agfa tmp
                    where tmp.record_date between var_begin_year and var_record_date
                        and tmp.agfa_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.agfa_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                        and var_branch_id in
                        (
                            tmp.company_id,
                            tmp.office_id,
                            tmp.agency_id,
                            tmp.unit_id
                        )
                    group by tmp.outlet_id
                ) acc
                    on acc.outlet_id = outl.outlet_id
                left join
                (
                    select code.code_code position_code,
                        code.code_value position_name
                    from ams.cla_codes code
                    where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                        and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                        and trunc(valDate, 'MM')
                            between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                            and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
                ) pos
                    on pos.position_code = outl.position_code
            ) res
            order by
                nlssort(res.company_name, 'nls_sort=Vietnamese'),
                nlssort(res.office_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese'),
                res.record_date;
       elsif var_branch_id = 0 then
            open row_records for
            select
                res.company_name,
                res.office_name,
                res.agency_name,
                res.office_name,
                res.unit_name,
                res.outlet_id,
                res.outlet_ams_id,
                res.outlet_name,
                res.position_name,
                to_char(add_months(res.record_date, -2), 'DD/MM/YYYY') period_from_date,
                to_char(last_day(res.record_date), 'DD/MM/YYYY') period_to_date,
                to_char(res.effective_date, 'DD/MM/YYYY') effective_date,
                to_char(res.terminative_date, 'DD/MM/YYYY') terminative_date,
                round(
                    months_between(
                        last_day(res.record_date),
                        res.effective_date
                    )
                , 2
                ) senior,
                res.agfa_period_issu,
                res.agfa_period_fypn,
                res.agfa_period_fyp,
                res.agfa_period_afis,
                res.agfa_period_afif,
                res.agfa_period_pr36,
                res.agfa_period_coll_etmt,
                res.agfa_period_coll_real,
                round(
                    decode(nvl(res.agfa_period_coll_etmt, 0),
                        0, 100,
                        (nvl(res.agfa_period_coll_real, 0) / nvl(res.agfa_period_coll_etmt, 0)) * 100
                    ),
                    2
                ) agfa_coll_rate,
                res.agfa_period_fyc,
                res.agfa_comp_ratio,
                res.agfa_comp_money,
                res.agfa_comp_accumulated
            from
            (
                select  /*+ CARDINALITY(outl, 100)
                                 CARDINALITY(off, 100)
                                 CARDINALITY(pos, 100)*/
                    outl.outlet_id,
                    outl.outlet_ams_id,
                    outl.outlet_name,
                    outl.company_name,
                    outl.office_name,
                    outl.agency_name,
                    outl.unit_name,
                    pos.position_name,
                    outl.effective_date,
                    outl.terminative_date,
                    outl.record_date,
                    outl.agfa_data_date,
                    outl.agfa_period_issu,
                    outl.agfa_period_fypn,
                    outl.agfa_period_fyp,
                    outl.agfa_period_fyc,
                    outl.agfa_period_afis,
                    outl.agfa_period_afif,
                    outl.agfa_period_pr36,
                    coll.agfa_period_coll_etmt,
                    coll.agfa_period_coll_real,
                    outl.agfa_comp_ratio,
                    outl.agfa_comp_money,
                    acc.agfa_comp_accumulated
                from
                (
                    select  /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.outlet_name,
                        tmp.company_name,
                        tmp.office_name,
                        tmp.agency_name,
                        tmp.unit_name,
                        tmp.effective_date,
                        tmp.terminative_date,
                        tmp.position_code,
                        tmp.record_date,
                        tmp.agfa_data_date,
                        tmp.agfa_period_issu,
                        tmp.agfa_period_fypn,
                        tmp.agfa_period_fyp,
                        tmp.agfa_period_fyc,
                        tmp.agfa_period_afis,
                        tmp.agfa_period_afif,
                        tmp.agfa_period_pr36,
                        tmp.agfa_comp_ratio,
                        tmp.agfa_comp_money
                    from ams.la_comp_mmxiii_agfa tmp
                    where tmp.record_date = var_record_date
                        and tmp.agfa_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.agfa_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                ) outl
                left join
                (
                    select /*+ CARDINALITY(outl, 100)*/
                        outl.outlet_id,
                        outl.period_coll_etmt agfa_period_coll_etmt,
                        outl.period_coll_real agfa_period_coll_real
                    from ams.serv_outlet_data outl
                    where outl.record_date = var_record_date
                        and outl.type_code = ams.AMS_MODL_COMP_MMXIII_REPORT.MODULE_CODE_MAIN
                        and outl.status_code = ams.AMS_MODL_COMP_MMXIII_REPORT.OBJECT_STATUS_ACTIVE
                ) coll
                    on coll.outlet_id = outl.outlet_id
                left join
                (   /*luy ke tu dau nam*/
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_id,
                        sum(nvl(tmp.agfa_comp_money, 0)) agfa_comp_accumulated
                    from ams.la_comp_mmxiii_agfa tmp
                    where tmp.record_date between var_begin_year and var_record_date
                        and tmp.agfa_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.agfa_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                    group by tmp.outlet_id
                ) acc
                    on acc.outlet_id = outl.outlet_id
                left join
                (
                    select code.code_code position_code,
                        code.code_value position_name
                    from ams.cla_codes code
                    where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                        and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                        and trunc(valDate, 'MM')
                            between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                            and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
                ) pos
                    on pos.position_code = outl.position_code
            ) res
            order by
                nlssort(res.company_name, 'nls_sort=Vietnamese'),
                nlssort(res.office_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese'),
                res.record_date;
        end if;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 1/6/2013
        Version: 1.0
        Description: Thu tuc hien thi bao cao thuong quy truong ban va truong nhom
        Parameter:
            valRecordDate [date]: Thang chay
        Update:  Le Khac Chinh
            Version: 1.1
            Date Updated: 5/7/2013
            Note:  Fix lai chuong trinh theo yeu cau: #107749 cua BA
                      Hien thi chinh xac cac dai ly tuyen dung thuan cua ban va nhom
    */
    procedure mmxiii_get_mnqr01(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor)
    is
        var_branch_id number(10) := nvl(valBranchID, 0);
        var_agent_id number(10) := nvl(valAgentID, 0);
    begin
        if var_agent_id <> 0 then
        open row_records for
        select
            case
                when res.type_of_data = 0 then
                    rank() over (
                        partition by res.type_of_data
                        order by nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                            nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                            nlssort(res.info_unit_name, 'nls_sort=Vietnamese') nulls first,
                            nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                            nlssort(res.info_outlet_ams_id, 'nls_sort=Vietnamese')
                    )
                end noid,
            case
                when res.type_of_data = 0 then
                    res.info_company_name
                end info_company_name,
            case
                when res.type_of_data = 0 then
                    res.info_agency_name
                end info_agency_name,
            case
                when res.type_of_data = 1 then
                    res.unit_name
                end info_unit_name,
            case
                when res.type_of_data = 0 then
                    res.info_outlet_ams_id
                else
                    res.outlet_ams_id
                end info_outlet_ams_id,
            case
                when res.type_of_data = 0 then
                    res.info_outlet_name
                else
                    res.outlet_name
                end info_outlet_name,
            case
                when res.type_of_data = 0 then
                    res.leader_position_name
                end info_position_name,
            to_char(res.effective_date, 'DD/MM/YYYY') out_effective_date,
            to_char(res.terminative_date, 'DD/MM/YYYY') out_terminative_date,
            to_char(res.mnqr_data_date, 'DD/MM/YYYY') mnqr_data_date,
            res.mnqr_period_fyp,
            res.mnqr_period_fyp_calc,
            res.mnqr_period_issue,
            res.mnqr_period_empl,
            res.mnqr_period_empl_calc,
            res.mnqr_period_qual,
            res.mnqr_period_afis,
            res.mnqr_period_afis_calc,
            res.mnqr_period_afif,
            res.mnqr_period_afif_calc,
            res.mnqr_period_pr36,
            res.mnqr_period_coll_etmt,
            res.mnqr_period_coll_etmt_calc,
            res.mnqr_period_coll_real,
            res.mnqr_period_coll_real_calc,
            res.mnqr_period_coll_rate,
            res.mnqr_period_fyc,
            res.mnqr_fyc_ratio,
            res.mnqr_branch_level,
            res.mnqr_period_fyc_calc,
            res.mnqr_comp_ratio,
            res.mnqr_comp_money_calc,
            res.mnqr_period_point,
            res.mnqr_activity_coefficient,
            res.mnqr_comp_money,
            case
                when res.type_of_data = 0 then
                    AMS_MODL_COMP_MMXIII_REPORT.MNQR_DATA_GENR
                when res.type_of_data = 1 then
                    AMS_MODL_COMP_MMXIII_REPORT.MNQR_DATA_QUAR
                end type_of_data
        from
        (
            select
                key.info_outlet_ams_id,
                key.info_outlet_name,
                key.info_company_name,
                key.info_agency_name,
                key.info_unit_name,
                pos_leader.position_name leader_position_name,
                null outlet_ams_id,
                null outlet_name,
                null effective_date,
                null terminative_date,
                key.record_date mnqr_data_date,
                null mnqr_period_fyp,
                key.mnqr_period_fyp mnqr_period_fyp_calc,--sau khi cho no xu ly thi phai lay so lieu nhu the nay thi moi dung duoc cho no
                null mnqr_period_issue,
                null mnqr_period_empl,
                key.mnqr_period_empl mnqr_period_empl_calc,--sau khi cho no xu ly thi phai lay so lieu nhu the nay thi moi dung duoc cho no
                key.mnqr_period_qual,
                null mnqr_period_afis,
                key.mnqr_period_afis mnqr_period_afis_calc,--sau khi cho no xu ly thi phai lay so lieu nhu the nay thi moi dung duoc cho no
                null mnqr_period_afif,
                key.mnqr_period_afif mnqr_period_afif_calc,--sau khi cho no xu ly thi phai lay so lieu nhu the nay thi moi dung duoc cho no
                key.mnqr_period_pr36,
                null mnqr_period_coll_etmt,
                key.mnqr_period_coll_etmt mnqr_period_coll_etmt_calc,--sau khi cho no xu ly thi phai lay so lieu nhu the nay thi moi dung duoc cho no
                null mnqr_period_coll_real,
                key.mnqr_period_coll_real mnqr_period_coll_real_calc,--sau khi cho no xu ly thi phai lay so lieu nhu the nay thi moi dung duoc cho no
                key.mnqr_period_coll_rate,
                key.mnqr_period_fyc,
                key.mnqr_fyc_ratio,
                null mnqr_branch_level,
                key.mnqr_period_fyc_calc,
                key.mnqr_comp_ratio,
                key.mnqr_comp_money_calc,
                key.mnqr_period_point,
                key.mnqr_activity_coefficient,
                key.mnqr_comp_money,
                0 type_of_data,
                key.info_outlet_ams_id mnqr_info_outlet_ams_id,
                key.info_outlet_name mnqr_info_outlet_name,
                key.info_company_name mnqr_info_company_name,
                key.info_agency_name mnqr_info_agency_name,
                key.info_unit_name mnqr_info_unit_name,
                null outl_outlet_ams_id,
                null outl_outlet_name,
                null unit_name
            from
            (
                select
                    tmp.outlet_ams_id info_outlet_ams_id,
                    tmp.info_outlet_name,
                    tmp.info_company_name,
                    tmp.info_agency_name,
                    tmp.info_unit_name,
                    tmp.mnqr_position_code position_code,
                    tmp.mnqr_branch_ams_id,
                    tmp.record_date,
                    tmp.mnqr_period_fyc,
                    null mnqr_fyc_ratio,
                    tmp.mnqr_period_fyc_calc,
                    tmp.mnqr_period_fyp,
                    tmp.mnqr_period_empl,
                    tmp.mnqr_period_afis,
                    tmp.mnqr_period_afif,
                    tmp.mnqr_period_pr36,
                    tmp.mnqr_period_coll_etmt,
                    tmp.mnqr_period_coll_real,
                    tmp.mnqr_period_coll_rate,
                    tmp.mnqr_period_qual,
                    tmp.mnqr_comp_ratio,
                    tmp.mnqr_comp_money_calc,
                    tmp.mnqr_period_point,
                    tmp.mnqr_activity_coefficient,
                    tmp.mnqr_comp_money
                from ams.la_compensation_mmxiii tmp
                where tmp.record_date = trunc(valDate, 'MM')
                    and tmp.mnqr_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                    and tmp.mnqr_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                    and tmp.outlet_id = var_agent_id
            ) key
            join
            (
                select code.code_code position_code,
                    code.code_value position_name
                from ams.cla_codes code
                where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                    and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                    and trunc(valDate, 'MM')
                        between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                        and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
            ) pos_leader
                on pos_leader.position_code = key.position_code

            union all

            select
                key.info_outlet_ams_id,
                key.info_outlet_name,
                key.info_company_name,
                key.info_agency_name,
                key.info_unit_name,
                null leader_position_name,
                outl.outlet_ams_id,
                outl.outlet_name,
                outl.effective_date,
                outl.terminative_date,
                outl.mnqr_data_date,
                outl.mnqr_period_fyp,
                outl.mnqr_period_fyp_calc,
                outl.mnqr_period_issue,
                outl.mnqr_period_empl,
                outl.mnqr_period_empl_calc,
                outl.mnqr_period_qual,
                outl.mnqr_period_afis,
                outl.mnqr_period_afis_calc,
                outl.mnqr_period_afif,
                outl.mnqr_period_afif_calc,
                outl.mnqr_period_pr36,
                outl.mnqr_period_coll_etmt,
                outl.mnqr_period_coll_etmt_calc,
                outl.mnqr_period_coll_real,
                outl.mnqr_period_coll_real_calc,
                outl.mnqr_period_coll_rate,
                outl.mnqr_period_fyc,
                outl.mnqr_fyc_ratio,
                outl.mnqr_branch_level,
                outl.mnqr_period_fyc_calc,
                null mnqr_comp_ratio,
                null mnqr_comp_money_calc,
                null mnqr_period_point,
                null mnqr_activity_coefficient,
                null mnqr_comp_money,
                1 type_of_data,
                key.info_outlet_ams_id mnqr_info_outlet_ams_id,
                key.info_outlet_name mnqr_info_outlet_name,
                key.info_company_name mnqr_info_company_name,
                key.info_agency_name mnqr_info_agency_name,
                key.info_unit_name mnqr_info_unit_name,
                outl.outlet_ams_id outl_outlet_ams_id,
                outl.outlet_name outl_outlet_name,
                outl.unit_name
            from
            (
                select
                    tmp.outlet_ams_id info_outlet_ams_id,
                    tmp.info_outlet_name,
                    tmp.info_company_name,
                    tmp.info_agency_name,
                    tmp.info_unit_name,
                    tmp.mnqr_position_code position_code,
                    tmp.mnqr_branch_ams_id
                from ams.la_compensation_mmxiii tmp
                where tmp.record_date = trunc(valDate, 'MM')
                    and tmp.mnqr_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                    and tmp.mnqr_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                    and tmp.outlet_id = var_agent_id
            ) key
            join
            (
                select
                    tmp.outlet_id,
                    tmp.outlet_ams_id,
                    tmp.outlet_name,
                    tmp.unit_name,
                    tmp.effective_date,
                    tmp.terminative_date,
                    tmp.mnqr_data_date,
                    tmp.mnqr_branch_ams_id,
                    case
                        when tmp.outlet_ams_id = tmp.mnqr_outlet_ams_id then
                            0
                        else
                            tmp.mnqr_period_fyc
                        end mnqr_period_fyc,
                    tmp.mnqr_fyc_ratio,
                    tmp.mnqr_branch_level,
                    case
                        when tmp.outlet_ams_id = tmp.mnqr_outlet_ams_id then
                            0
                        else
                            tmp.mnqr_period_fyc_calc
                        end mnqr_period_fyc_calc,
                    case
                        when tmp.outlet_ams_id = tmp.mnqr_outlet_ams_id then
                            0
                        else
                            tmp.mnqr_period_fyp
                        end mnqr_period_fyp,
                    case
                        when tmp.outlet_ams_id = tmp.mnqr_outlet_ams_id then
                            0
                        else
                            tmp.mnqr_period_fyp_calc
                        end mnqr_period_fyp_calc,
                    tmp.mnqr_period_issue,
                    tmp.mnqr_period_empl,
                    tmp.mnqr_period_empl_calc,
                    tmp.mnqr_period_qual,
                    tmp.mnqr_period_afis,
                    tmp.mnqr_period_afis_calc,
                    tmp.mnqr_period_afif,
                    tmp.mnqr_period_afif_calc,
                    tmp.mnqr_period_pr36,
                    tmp.mnqr_period_coll_etmt,
                    tmp.mnqr_period_coll_etmt_calc,
                    tmp.mnqr_period_coll_real,
                    tmp.mnqr_period_coll_real_calc,
                    tmp.mnqr_period_coll_rate,
                    tmp.mnqr_empl_asmt,
                    case
                        when tmp.outlet_ams_id = tmp.mnqr_outlet_ams_id then
                            tmp.mnqr_period_point
                        end mnqr_period_point,
                    case
                        when tmp.outlet_ams_id = tmp.mnqr_outlet_ams_id then
                            tmp.mnqr_activity_coefficient
                        end mnqr_activity_coefficient
                from ams.la_comp_mmxiii_mnqr tmp
                where tmp.record_date = trunc(valDate, 'MM')
                    and tmp.mnqr_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                    and tmp.mnqr_be_paid in (AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES,
                    AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_EMPL)
            ) outl
                on outl.mnqr_branch_ams_id = key.mnqr_branch_ams_id
        ) res
        order by nlssort(res.mnqr_info_company_name, 'nls_sort=Vietnamese'),
            nlssort(res.mnqr_info_agency_name, 'nls_sort=Vietnamese') nulls first,
            nlssort(res.mnqr_info_unit_name, 'nls_sort=Vietnamese') nulls first,
            nlssort(res.mnqr_info_outlet_name, 'nls_sort=Vietnamese'),
            nlssort(res.mnqr_info_outlet_ams_id, 'nls_sort=Vietnamese'),
            res.type_of_data,
            nlssort(res.unit_name, 'nls_sort=Vietnamese') nulls first,
            nlssort(res.outl_outlet_name, 'nls_sort=Vietnamese'),
            nlssort(res.outl_outlet_ams_id, 'nls_sort=Vietnamese');
       elsif var_branch_id <> 0 then
        open row_records for
        select
            case
                when res.type_of_data = 0 then
                    rank() over (
                        partition by res.type_of_data
                        order by nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                            nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                            nlssort(res.info_unit_name, 'nls_sort=Vietnamese') nulls first,
                            nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                            nlssort(res.info_outlet_ams_id, 'nls_sort=Vietnamese')
                    )
                end noid,
            case
                when res.type_of_data = 0 then
                    res.info_company_name
                end info_company_name,
            case
                when res.type_of_data = 0 then
                    res.info_agency_name
                end info_agency_name,
            case
                when res.type_of_data = 1 then
                    res.unit_name
                end info_unit_name,
            case
                when res.type_of_data = 0 then
                    res.info_outlet_ams_id
                else
                    res.outlet_ams_id
                end info_outlet_ams_id,
            case
                when res.type_of_data = 0 then
                    res.info_outlet_name
                else
                    res.outlet_name
                end info_outlet_name,
            case
                when res.type_of_data = 0 then
                    res.leader_position_name
                end info_position_name,
            to_char(res.effective_date, 'DD/MM/YYYY') out_effective_date,
            to_char(res.terminative_date, 'DD/MM/YYYY') out_terminative_date,
            to_char(res.mnqr_data_date, 'DD/MM/YYYY') mnqr_data_date,
            res.mnqr_period_fyp,
            res.mnqr_period_fyp_calc,
            res.mnqr_period_issue,
            res.mnqr_period_empl,
            res.mnqr_period_empl_calc,
            res.mnqr_period_qual,
            res.mnqr_period_afis,
            res.mnqr_period_afis_calc,
            res.mnqr_period_afif,
            res.mnqr_period_afif_calc,
            res.mnqr_period_pr36,
            res.mnqr_period_coll_etmt,
            res.mnqr_period_coll_etmt_calc,
            res.mnqr_period_coll_real,
            res.mnqr_period_coll_real_calc,
            res.mnqr_period_coll_rate,
            res.mnqr_period_fyc,
            res.mnqr_fyc_ratio,
            res.mnqr_branch_level,
            res.mnqr_period_fyc_calc,
            res.mnqr_comp_ratio,
            res.mnqr_comp_money_calc,
            res.mnqr_period_point,
            res.mnqr_activity_coefficient,
            res.mnqr_comp_money,
            case
                when res.type_of_data = 0 then
                    AMS_MODL_COMP_MMXIII_REPORT.MNQR_DATA_GENR
                when res.type_of_data = 1 then
                    AMS_MODL_COMP_MMXIII_REPORT.MNQR_DATA_QUAR
                end type_of_data
        from
        (
            select
                key.info_outlet_ams_id,
                key.info_outlet_name,
                key.info_company_name,
                key.info_agency_name,
                key.info_unit_name,
                pos_leader.position_name leader_position_name,
                null outlet_ams_id,
                null outlet_name,
                null effective_date,
                null terminative_date,
                key.record_date mnqr_data_date,
                null mnqr_period_fyp,
                key.mnqr_period_fyp mnqr_period_fyp_calc,--sau khi cho no xu ly thi phai lay so lieu nhu the nay thi moi dung duoc cho no
                null mnqr_period_issue,
                null mnqr_period_empl,
                key.mnqr_period_empl mnqr_period_empl_calc,--sau khi cho no xu ly thi phai lay so lieu nhu the nay thi moi dung duoc cho no
                key.mnqr_period_qual,
                null mnqr_period_afis,
                key.mnqr_period_afis mnqr_period_afis_calc,--sau khi cho no xu ly thi phai lay so lieu nhu the nay thi moi dung duoc cho no
                null mnqr_period_afif,
                key.mnqr_period_afif mnqr_period_afif_calc,--sau khi cho no xu ly thi phai lay so lieu nhu the nay thi moi dung duoc cho no
                key.mnqr_period_pr36,
                null mnqr_period_coll_etmt,
                key.mnqr_period_coll_etmt mnqr_period_coll_etmt_calc,--sau khi cho no xu ly thi phai lay so lieu nhu the nay thi moi dung duoc cho no
                null mnqr_period_coll_real,
                key.mnqr_period_coll_real mnqr_period_coll_real_calc,--sau khi cho no xu ly thi phai lay so lieu nhu the nay thi moi dung duoc cho no
                key.mnqr_period_coll_rate,
                key.mnqr_period_fyc,
                key.mnqr_fyc_ratio,
                null mnqr_branch_level,
                key.mnqr_period_fyc_calc,
                key.mnqr_comp_ratio,
                key.mnqr_comp_money_calc,
                key.mnqr_period_point,
                key.mnqr_activity_coefficient,
                key.mnqr_comp_money,
                0 type_of_data,
                key.info_outlet_ams_id mnqr_info_outlet_ams_id,
                key.info_outlet_name mnqr_info_outlet_name,
                key.info_company_name mnqr_info_company_name,
                key.info_agency_name mnqr_info_agency_name,
                key.info_unit_name mnqr_info_unit_name,
                null outl_outlet_ams_id,
                null outl_outlet_name,
                null unit_name
            from
            (
                select
                    tmp.outlet_ams_id info_outlet_ams_id,
                    tmp.info_outlet_name,
                    tmp.info_company_name,
                    tmp.info_agency_name,
                    tmp.info_unit_name,
                    tmp.mnqr_position_code position_code,
                    tmp.mnqr_branch_ams_id,
                    tmp.record_date,
                    tmp.mnqr_period_fyc,
                    null mnqr_fyc_ratio,
                    tmp.mnqr_period_fyc_calc,
                    tmp.mnqr_period_fyp,
                    tmp.mnqr_period_empl,
                    tmp.mnqr_period_afis,
                    tmp.mnqr_period_afif,
                    tmp.mnqr_period_pr36,
                    tmp.mnqr_period_coll_etmt,
                    tmp.mnqr_period_coll_real,
                    tmp.mnqr_period_coll_rate,
                    tmp.mnqr_period_qual,
                    tmp.mnqr_comp_ratio,
                    tmp.mnqr_comp_money_calc,
                    tmp.mnqr_period_point,
                    tmp.mnqr_activity_coefficient,
                    tmp.mnqr_comp_money
                from ams.la_compensation_mmxiii tmp
                where tmp.record_date = trunc(valDate, 'MM')
                    and tmp.mnqr_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                    and tmp.mnqr_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                    and var_branch_id in
                    (
                        tmp.info_company_id,
                        tmp.info_office_id,
                        tmp.info_agency_id,
                        tmp.info_unit_id
                    )
            ) key
            join
            (
                select code.code_code position_code,
                    code.code_value position_name
                from ams.cla_codes code
                where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                    and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                    and trunc(valDate, 'MM')
                        between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                        and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
            ) pos_leader
                on pos_leader.position_code = key.position_code

            union all

            select
                key.info_outlet_ams_id,
                key.info_outlet_name,
                key.info_company_name,
                key.info_agency_name,
                key.info_unit_name,
                null leader_position_name,
                outl.outlet_ams_id,
                outl.outlet_name,
                outl.effective_date,
                outl.terminative_date,
                outl.mnqr_data_date,
                outl.mnqr_period_fyp,
                outl.mnqr_period_fyp_calc,
                outl.mnqr_period_issue,
                outl.mnqr_period_empl,
                outl.mnqr_period_empl_calc,
                outl.mnqr_period_qual,
                outl.mnqr_period_afis,
                outl.mnqr_period_afis_calc,
                outl.mnqr_period_afif,
                outl.mnqr_period_afif_calc,
                outl.mnqr_period_pr36,
                outl.mnqr_period_coll_etmt,
                outl.mnqr_period_coll_etmt_calc,
                outl.mnqr_period_coll_real,
                outl.mnqr_period_coll_real_calc,
                outl.mnqr_period_coll_rate,
                outl.mnqr_period_fyc,
                outl.mnqr_fyc_ratio,
                outl.mnqr_branch_level,
                outl.mnqr_period_fyc_calc,
                null mnqr_comp_ratio,
                null mnqr_comp_money_calc,
                null mnqr_period_point,
                null mnqr_activity_coefficient,
                null mnqr_comp_money,
                1 type_of_data,
                key.info_outlet_ams_id mnqr_info_outlet_ams_id,
                key.info_outlet_name mnqr_info_outlet_name,
                key.info_company_name mnqr_info_company_name,
                key.info_agency_name mnqr_info_agency_name,
                key.info_unit_name mnqr_info_unit_name,
                outl.outlet_ams_id outl_outlet_ams_id,
                outl.outlet_name outl_outlet_name,
                outl.unit_name
            from
            (
                select
                    tmp.outlet_ams_id info_outlet_ams_id,
                    tmp.info_outlet_name,
                    tmp.info_company_name,
                    tmp.info_agency_name,
                    tmp.info_unit_name,
                    tmp.mnqr_position_code position_code,
                    tmp.mnqr_branch_ams_id
                from ams.la_compensation_mmxiii tmp
                where tmp.record_date = trunc(valDate, 'MM')
                    and tmp.mnqr_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                    and tmp.mnqr_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                    and var_branch_id in
                    (
                        tmp.info_company_id,
                        tmp.info_office_id,
                        tmp.info_agency_id,
                        tmp.info_unit_id
                    )
            ) key
            join
            (
                select
                    tmp.outlet_id,
                    tmp.outlet_ams_id,
                    tmp.outlet_name,
                    tmp.unit_name,
                    tmp.effective_date,
                    tmp.terminative_date,
                    tmp.mnqr_data_date,
                    tmp.mnqr_branch_ams_id,
                    case
                        when tmp.outlet_ams_id = tmp.mnqr_outlet_ams_id then
                            0
                        else
                            tmp.mnqr_period_fyc
                        end mnqr_period_fyc,
                    tmp.mnqr_fyc_ratio,
                    tmp.mnqr_branch_level,
                    case
                        when tmp.outlet_ams_id = tmp.mnqr_outlet_ams_id then
                            0
                        else
                            tmp.mnqr_period_fyc_calc
                        end mnqr_period_fyc_calc,
                    case
                        when tmp.outlet_ams_id = tmp.mnqr_outlet_ams_id then
                            0
                        else
                            tmp.mnqr_period_fyp
                        end mnqr_period_fyp,
                    case
                        when tmp.outlet_ams_id = tmp.mnqr_outlet_ams_id then
                            0
                        else
                            tmp.mnqr_period_fyp_calc
                        end mnqr_period_fyp_calc,
                    tmp.mnqr_period_issue,
                    tmp.mnqr_period_empl,
                    tmp.mnqr_period_empl_calc,
                    tmp.mnqr_period_qual,
                    tmp.mnqr_period_afis,
                    tmp.mnqr_period_afis_calc,
                    tmp.mnqr_period_afif,
                    tmp.mnqr_period_afif_calc,
                    tmp.mnqr_period_pr36,
                    tmp.mnqr_period_coll_etmt,
                    tmp.mnqr_period_coll_etmt_calc,
                    tmp.mnqr_period_coll_real,
                    tmp.mnqr_period_coll_real_calc,
                    tmp.mnqr_period_coll_rate,
                    tmp.mnqr_empl_asmt,
                    case
                        when tmp.outlet_ams_id = tmp.mnqr_outlet_ams_id then
                            tmp.mnqr_period_point
                        end mnqr_period_point,
                    case
                        when tmp.outlet_ams_id = tmp.mnqr_outlet_ams_id then
                            tmp.mnqr_activity_coefficient
                        end mnqr_activity_coefficient
                from ams.la_comp_mmxiii_mnqr tmp
                where tmp.record_date = trunc(valDate, 'MM')
                    and tmp.mnqr_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                    and tmp.mnqr_be_paid in (AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES,
                    AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_EMPL)
            ) outl
                on outl.mnqr_branch_ams_id = key.mnqr_branch_ams_id
        ) res
        order by nlssort(res.mnqr_info_company_name, 'nls_sort=Vietnamese'),
            nlssort(res.mnqr_info_agency_name, 'nls_sort=Vietnamese') nulls first,
            nlssort(res.mnqr_info_unit_name, 'nls_sort=Vietnamese') nulls first,
            nlssort(res.mnqr_info_outlet_name, 'nls_sort=Vietnamese'),
            nlssort(res.mnqr_info_outlet_ams_id, 'nls_sort=Vietnamese'),
            res.type_of_data,
            nlssort(res.unit_name, 'nls_sort=Vietnamese') nulls first,
            nlssort(res.outl_outlet_name, 'nls_sort=Vietnamese'),
            nlssort(res.outl_outlet_ams_id, 'nls_sort=Vietnamese');
       elsif var_branch_id = 0 then --cap tong cong ty
        open row_records for
        select
            case
                when res.type_of_data = 0 then
                    rank() over (
                        partition by res.type_of_data
                        order by nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                            nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                            nlssort(res.info_unit_name, 'nls_sort=Vietnamese') nulls first,
                            nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                            nlssort(res.info_outlet_ams_id, 'nls_sort=Vietnamese')
                    )
                end noid,
            case
                when res.type_of_data = 0 then
                    res.info_company_name
                end info_company_name,
            case
                when res.type_of_data = 0 then
                    res.info_agency_name
                end info_agency_name,
            case
                when res.type_of_data = 1 then
                    res.unit_name
                end info_unit_name,
            case
                when res.type_of_data = 0 then
                    res.info_outlet_ams_id
                else
                    res.outlet_ams_id
                end info_outlet_ams_id,
            case
                when res.type_of_data = 0 then
                    res.info_outlet_name
                else
                    res.outlet_name
                end info_outlet_name,
            case
                when res.type_of_data = 0 then
                    res.leader_position_name
                end info_position_name,
            to_char(res.effective_date, 'DD/MM/YYYY') out_effective_date,
            to_char(res.terminative_date, 'DD/MM/YYYY') out_terminative_date,
            to_char(res.mnqr_data_date, 'DD/MM/YYYY') mnqr_data_date,
            res.mnqr_period_fyp,
            res.mnqr_period_fyp_calc,
            res.mnqr_period_issue,
            res.mnqr_period_empl,
            res.mnqr_period_empl_calc,
            res.mnqr_period_qual,
            res.mnqr_period_afis,
            res.mnqr_period_afis_calc,
            res.mnqr_period_afif,
            res.mnqr_period_afif_calc,
            res.mnqr_period_pr36,
            res.mnqr_period_coll_etmt,
            res.mnqr_period_coll_etmt_calc,
            res.mnqr_period_coll_real,
            res.mnqr_period_coll_real_calc,
            res.mnqr_period_coll_rate,
            res.mnqr_period_fyc,
            res.mnqr_fyc_ratio,
            res.mnqr_branch_level,
            res.mnqr_period_fyc_calc,
            res.mnqr_comp_ratio,
            res.mnqr_comp_money_calc,
            res.mnqr_period_point,
            res.mnqr_activity_coefficient,
            res.mnqr_comp_money,
            case
                when res.type_of_data = 0 then
                    AMS_MODL_COMP_MMXIII_REPORT.MNQR_DATA_GENR
                when res.type_of_data = 1 then
                    AMS_MODL_COMP_MMXIII_REPORT.MNQR_DATA_QUAR
                end type_of_data
        from
        (
            select
                key.info_outlet_ams_id,
                key.info_outlet_name,
                key.info_company_name,
                key.info_agency_name,
                key.info_unit_name,
                pos_leader.position_name leader_position_name,
                null outlet_ams_id,
                null outlet_name,
                null effective_date,
                null terminative_date,
                key.record_date mnqr_data_date,
                null mnqr_period_fyp,
                key.mnqr_period_fyp mnqr_period_fyp_calc,--sau khi cho no xu ly thi phai lay so lieu nhu the nay thi moi dung duoc cho no
                null mnqr_period_issue,
                null mnqr_period_empl,
                key.mnqr_period_empl mnqr_period_empl_calc,--sau khi cho no xu ly thi phai lay so lieu nhu the nay thi moi dung duoc cho no
                key.mnqr_period_qual,
                null mnqr_period_afis,
                key.mnqr_period_afis mnqr_period_afis_calc,--sau khi cho no xu ly thi phai lay so lieu nhu the nay thi moi dung duoc cho no
                null mnqr_period_afif,
                key.mnqr_period_afif mnqr_period_afif_calc,--sau khi cho no xu ly thi phai lay so lieu nhu the nay thi moi dung duoc cho no
                key.mnqr_period_pr36,
                null mnqr_period_coll_etmt,
                key.mnqr_period_coll_etmt mnqr_period_coll_etmt_calc,--sau khi cho no xu ly thi phai lay so lieu nhu the nay thi moi dung duoc cho no
                null mnqr_period_coll_real,
                key.mnqr_period_coll_real mnqr_period_coll_real_calc,--sau khi cho no xu ly thi phai lay so lieu nhu the nay thi moi dung duoc cho no
                key.mnqr_period_coll_rate,
                key.mnqr_period_fyc,
                key.mnqr_fyc_ratio,
                null mnqr_branch_level,
                key.mnqr_period_fyc_calc,
                key.mnqr_comp_ratio,
                key.mnqr_comp_money_calc,
                key.mnqr_period_point,
                key.mnqr_activity_coefficient,
                key.mnqr_comp_money,
                0 type_of_data,
                key.info_outlet_ams_id mnqr_info_outlet_ams_id,
                key.info_outlet_name mnqr_info_outlet_name,
                key.info_company_name mnqr_info_company_name,
                key.info_agency_name mnqr_info_agency_name,
                key.info_unit_name mnqr_info_unit_name,
                null outl_outlet_ams_id,
                null outl_outlet_name,
                null unit_name
            from
            (
                select
                    tmp.outlet_ams_id info_outlet_ams_id,
                    tmp.info_outlet_name,
                    tmp.info_company_name,
                    tmp.info_agency_name,
                    tmp.info_unit_name,
                    tmp.mnqr_position_code position_code,
                    tmp.mnqr_branch_ams_id,
                    tmp.record_date,
                    tmp.mnqr_period_fyc,
                    null mnqr_fyc_ratio,
                    tmp.mnqr_period_fyc_calc,
                    tmp.mnqr_period_fyp,
                    tmp.mnqr_period_empl,
                    tmp.mnqr_period_afis,
                    tmp.mnqr_period_afif,
                    tmp.mnqr_period_pr36,
                    tmp.mnqr_period_coll_etmt,
                    tmp.mnqr_period_coll_real,
                    tmp.mnqr_period_coll_rate,
                    tmp.mnqr_period_qual,
                    tmp.mnqr_comp_ratio,
                    tmp.mnqr_comp_money_calc,
                    tmp.mnqr_period_point,
                    tmp.mnqr_activity_coefficient,
                    tmp.mnqr_comp_money
                from ams.la_compensation_mmxiii tmp
                where tmp.record_date = trunc(valDate, 'MM')
                    and tmp.mnqr_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                    and tmp.mnqr_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
            ) key
            join
            (
                select code.code_code position_code,
                    code.code_value position_name
                from ams.cla_codes code
                where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                    and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                    and trunc(valDate, 'MM')
                        between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                        and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
            ) pos_leader
                on pos_leader.position_code = key.position_code

            union all

            select
                key.info_outlet_ams_id,
                key.info_outlet_name,
                key.info_company_name,
                key.info_agency_name,
                key.info_unit_name,
                null leader_position_name,
                outl.outlet_ams_id,
                outl.outlet_name,
                outl.effective_date,
                outl.terminative_date,
                outl.mnqr_data_date,
                outl.mnqr_period_fyp,
                outl.mnqr_period_fyp_calc,
                outl.mnqr_period_issue,
                outl.mnqr_period_empl,
                outl.mnqr_period_empl_calc,
                outl.mnqr_period_qual,
                outl.mnqr_period_afis,
                outl.mnqr_period_afis_calc,
                outl.mnqr_period_afif,
                outl.mnqr_period_afif_calc,
                outl.mnqr_period_pr36,
                outl.mnqr_period_coll_etmt,
                outl.mnqr_period_coll_etmt_calc,
                outl.mnqr_period_coll_real,
                outl.mnqr_period_coll_real_calc,
                outl.mnqr_period_coll_rate,
                outl.mnqr_period_fyc,
                outl.mnqr_fyc_ratio,
                outl.mnqr_branch_level,
                outl.mnqr_period_fyc_calc,
                null mnqr_comp_ratio,
                null mnqr_comp_money_calc,
                null mnqr_period_point,
                null mnqr_activity_coefficient,
                null mnqr_comp_money,
                1 type_of_data,
                key.info_outlet_ams_id mnqr_info_outlet_ams_id,
                key.info_outlet_name mnqr_info_outlet_name,
                key.info_company_name mnqr_info_company_name,
                key.info_agency_name mnqr_info_agency_name,
                key.info_unit_name mnqr_info_unit_name,
                outl.outlet_ams_id outl_outlet_ams_id,
                outl.outlet_name outl_outlet_name,
                outl.unit_name
            from
            (
                select
                    tmp.outlet_ams_id info_outlet_ams_id,
                    tmp.info_outlet_name,
                    tmp.info_company_name,
                    tmp.info_agency_name,
                    tmp.info_unit_name,
                    tmp.mnqr_position_code position_code,
                    tmp.mnqr_branch_ams_id
                from ams.la_compensation_mmxiii tmp
                where tmp.record_date = trunc(valDate, 'MM')
                    and tmp.mnqr_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                    and tmp.mnqr_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
            ) key
            join
            (
                select
                    tmp.outlet_id,
                    tmp.outlet_ams_id,
                    tmp.outlet_name,
                    tmp.unit_name,
                    tmp.effective_date,
                    tmp.terminative_date,
                    tmp.mnqr_data_date,
                    tmp.mnqr_branch_ams_id,
                    case
                        when tmp.outlet_ams_id = tmp.mnqr_outlet_ams_id then
                            0
                        else
                            tmp.mnqr_period_fyc
                        end mnqr_period_fyc,
                    tmp.mnqr_fyc_ratio,
                    tmp.mnqr_branch_level,
                    case
                        when tmp.outlet_ams_id = tmp.mnqr_outlet_ams_id then
                            0
                        else
                            tmp.mnqr_period_fyc_calc
                        end mnqr_period_fyc_calc,
                    case
                        when tmp.outlet_ams_id = tmp.mnqr_outlet_ams_id then
                            0
                        else
                            tmp.mnqr_period_fyp
                        end mnqr_period_fyp,
                    case
                        when tmp.outlet_ams_id = tmp.mnqr_outlet_ams_id then
                            0
                        else
                            tmp.mnqr_period_fyp_calc
                        end mnqr_period_fyp_calc,
                    tmp.mnqr_period_issue,
                    tmp.mnqr_period_empl,
                    tmp.mnqr_period_empl_calc,
                    tmp.mnqr_period_qual,
                    tmp.mnqr_period_afis,
                    tmp.mnqr_period_afis_calc,
                    tmp.mnqr_period_afif,
                    tmp.mnqr_period_afif_calc,
                    tmp.mnqr_period_pr36,
                    tmp.mnqr_period_coll_etmt,
                    tmp.mnqr_period_coll_etmt_calc,
                    tmp.mnqr_period_coll_real,
                    tmp.mnqr_period_coll_real_calc,
                    tmp.mnqr_period_coll_rate,
                    tmp.mnqr_empl_asmt,
                    case
                        when tmp.outlet_ams_id = tmp.mnqr_outlet_ams_id then
                            tmp.mnqr_period_point
                        end mnqr_period_point,
                    case
                        when tmp.outlet_ams_id = tmp.mnqr_outlet_ams_id then
                            tmp.mnqr_activity_coefficient
                        end mnqr_activity_coefficient
                from ams.la_comp_mmxiii_mnqr tmp
                where tmp.record_date = trunc(valDate, 'MM')
                    and tmp.mnqr_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                    and tmp.mnqr_be_paid in (AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES,
                    AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_EMPL)
            ) outl
                on outl.mnqr_branch_ams_id = key.mnqr_branch_ams_id
        ) res
        order by nlssort(res.mnqr_info_company_name, 'nls_sort=Vietnamese'),
            nlssort(res.mnqr_info_agency_name, 'nls_sort=Vietnamese') nulls first,
            nlssort(res.mnqr_info_unit_name, 'nls_sort=Vietnamese') nulls first,
            nlssort(res.mnqr_info_outlet_name, 'nls_sort=Vietnamese'),
            nlssort(res.mnqr_info_outlet_ams_id, 'nls_sort=Vietnamese'),
            res.type_of_data,
            nlssort(res.unit_name, 'nls_sort=Vietnamese') nulls first,
            nlssort(res.outl_outlet_name, 'nls_sort=Vietnamese'),
            nlssort(res.outl_outlet_ams_id, 'nls_sort=Vietnamese');
        end if;
    end;

    procedure mmxiii_get_mnql01(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor)
    is
        var_branch_id number(10) := nvl(valBranchID, 0);
        var_agent_id number(10) := nvl(valAgentID, 0);
    begin
        if var_agent_id <> 0 then
            open row_records for
            select
                    case
                        when res.type_of_data = 0 then
                            rank() over (
                                partition by res.type_of_data
                                order by nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                                    nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                                    nlssort(res.info_unit_name, 'nls_sort=Vietnamese') nulls first,
                                    nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                                    nlssort(res.info_outlet_ams_id, 'nls_sort=Vietnamese')
                            )
                        end noid,
                    res.info_company_name,
                    res.info_agency_name,
                    res.info_unit_name,
                    res.info_outlet_ams_id,
                    res.info_outlet_name,
                    res.leader_position_name info_position_name,
                    res.outlet_ams_id out_outlet_ams_id,
                    res.outlet_name out_outlet_name,
                    res.agency_name out_agency_name,
                    res.unit_name out_unit_name,
                    to_char(res.effective_date, 'DD/MM/YYYY') out_effective_date,
                    to_char(res.terminative_date, 'DD/MM/YYYY') out_terminative_date,
                    res.outl_position_name,
                    res.mnqr_data_date,
                    to_char(res.mnqr_data_date, 'DD/MM/YYYY') out_data_date,
                    res.mnqr_period_fyp,
                    res.mnqr_period_afis,
                    res.mnqr_period_afif,
                    res.mnqr_period_pr36,
                    res.mnqr_period_coll_etmt,
                    res.mnqr_period_coll_real,
                    res.mnqr_period_coll_rate,
                    res.mnqr_period_qual,
                    case
                        when res.type_of_data = 0 then
                            AMS_REPO_COMPENSATION.MNQL_DATA_GENR
                        when res.type_of_data = 1 then
                            AMS_REPO_COMPENSATION.MNQL_DATA_QUAR
                        end type_of_data,
                    case
                        when res.type_of_data = 0 and nvl(res.mnqr_period_qual, 0) = 1 then
                            AMS_REPO_COMPENSATION.NAME_RESULTS_PASS
                        when res.type_of_data = 0 and nvl(res.mnqr_period_qual, 0) <= 0 then
                            AMS_REPO_COMPENSATION.NAME_RESULTS_FAIL
                        end mnqr_period_qual
                from
                (
                    select
                        key.info_outlet_ams_id,
                        key.info_outlet_name,
                        key.info_company_name,
                        key.info_agency_name,
                        key.info_unit_name,
                        pos_leader.position_name leader_position_name,
                        outl.outlet_ams_id,
                        outl.outlet_name,
                        outl.agency_name,
                        outl.unit_name,
                        outl.effective_date,
                        outl.terminative_date,
                        pos_outl.position_name outl_position_name,
                        outl.mnqr_data_date,
                        outl.mnqr_period_fyp,
                        outl.mnqr_period_afis,
                        outl.mnqr_period_afif,
                        outl.mnqr_period_pr36,
                        outl.mnqr_period_coll_etmt,
                        outl.mnqr_period_coll_real,
                        outl.mnqr_period_coll_rate,
                        outl.mnqr_period_qual,
                        0 type_of_data,
                        key.info_outlet_ams_id mnqr_info_outlet_ams_id,
                        key.info_outlet_name mnqr_info_outlet_name,
                        key.info_company_name mnqr_info_company_name,
                        key.info_agency_name mnqr_info_agency_name,
                        key.info_unit_name mnqr_info_unit_name,
                        outl.outlet_ams_id outl_outlet_ams_id,
                        outl.outlet_name outl_outlet_name,
                        outl.unit_name outl_unit_name
                    from
                    (
                        select
                            tmp.outlet_ams_id info_outlet_ams_id,
                            tmp.info_outlet_name,
                            tmp.info_company_name,
                            tmp.info_agency_name,
                            tmp.info_unit_name,
                            tmp.mnqr_position_code position_code,
                            tmp.mnqr_branch_ams_id
                        from ams.la_compensation_mmxiii tmp
                        where tmp.record_date = trunc(valDate, 'MM')
                            and tmp.mnqr_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                            and tmp.mnqr_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                            and tmp.outlet_id = var_agent_id
                    ) key
                    join
                    (
                        select
                            tmp.outlet_id,
                            tmp.outlet_ams_id,
                            tmp.agency_name,
                            tmp.unit_name,
                            tmp.outlet_name,
                            tmp.effective_date,
                            tmp.terminative_date,
                            tmp.mnqr_data_date,
                            tmp.mnqr_branch_ams_id,
                            tmp.mnqr_period_fyc,
                            tmp.mnqr_period_fyc_calc,
                            tmp.mnqr_period_fyp,
                            tmp.mnqr_period_empl,
                            tmp.mnqr_period_qual,
                            tmp.mnqr_period_afis,
                            tmp.mnqr_period_afif,
                            tmp.mnqr_period_pr36,
                            tmp.mnqr_period_coll_etmt,
                            tmp.mnqr_period_coll_real,
                            tmp.mnqr_period_coll_rate,
                            tmp.mnqr_empl_asmt,
                            tmp.mnqr_fyc_ratio
                        from ams.la_comp_mmxiii_mnqr tmp
                        where tmp.record_date = trunc(valDate, 'MM')
                            and tmp.mnqr_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                            and tmp.mnqr_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                    ) outl
                        on outl.mnqr_branch_ams_id = key.mnqr_branch_ams_id
                    left join
                    (
                        select code.code_code position_code,
                            code.code_value position_name
                        from ams.cla_codes code
                        where code.code_language = AMS_CORE_SYSTEM.THEME_LANGUAGE
                            and code.code_group = AMS_CORE_CODE.OUTLET_INFO_TYPE_POSI
                            and trunc(valDate, 'MM')
                                between nvl(code.from_date, AMS_CORE_SYSTEM.DATE_MIN_VALUE)
                                and nvl(code.to_date, AMS_CORE_SYSTEM.DATE_MAX_VALUE)
                    ) pos_leader
                        on pos_leader.position_code = key.position_code
                    left join
                    (
                        select lha.agent_id,
                            lha.history_value position_code
                        from ams.la_history_agent lha
                        where lha.type_code = 'CVDL_CODE'
                            and add_months(trunc(valDate, 'MM'), 1) - 1 >= lha.from_date
                            and add_months(trunc(valDate, 'MM'), 1) - 1 <nvl(lha.to_date,'1-jan-2099')
                    ) posi
                       on posi.agent_id = outl.outlet_id
                    left join
                    (
                        select code.code_code position_code,
                            code.code_value position_name
                        from ams.cla_codes code
                        where code.code_language = AMS_CORE_SYSTEM.THEME_LANGUAGE
                            and code.code_group = AMS_CORE_CODE.OUTLET_INFO_TYPE_POSI
                            and trunc(valDate, 'MM')
                                between nvl(code.from_date, AMS_CORE_SYSTEM.DATE_MIN_VALUE)
                                and nvl(code.to_date, AMS_CORE_SYSTEM.DATE_MAX_VALUE)
                    ) pos_outl
                        on pos_outl.position_code = posi.position_code
                ) res;
       elsif var_branch_id <> 0 then
            open row_records for
            select
                    case
                        when res.type_of_data = 0 then
                            rank() over (
                                partition by res.type_of_data
                                order by nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                                    nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                                    nlssort(res.info_unit_name, 'nls_sort=Vietnamese') nulls first,
                                    nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                                    nlssort(res.info_outlet_ams_id, 'nls_sort=Vietnamese')
                            )
                        end noid,
                    res.info_company_name,
                    res.info_agency_name,
                    res.info_unit_name,
                    res.info_outlet_ams_id,
                    res.info_outlet_name,
                    res.leader_position_name info_position_name,
                    res.outlet_ams_id out_outlet_ams_id,
                    res.outlet_name out_outlet_name,
                    res.agency_name out_agency_name,
                    res.unit_name out_unit_name,
                    to_char(res.effective_date, 'DD/MM/YYYY') out_effective_date,
                    to_char(res.terminative_date, 'DD/MM/YYYY') out_terminative_date,
                    res.outl_position_name,
                    res.mnqr_data_date,
                    to_char(res.mnqr_data_date, 'DD/MM/YYYY') out_data_date,
                    res.mnqr_period_fyp,
                    res.mnqr_period_afis,
                    res.mnqr_period_afif,
                    res.mnqr_period_pr36,
                    res.mnqr_period_coll_etmt,
                    res.mnqr_period_coll_real,
                    res.mnqr_period_coll_rate,
                    res.mnqr_period_qual,
                    case
                        when res.type_of_data = 0 then
                            AMS_REPO_COMPENSATION.MNQL_DATA_GENR
                        when res.type_of_data = 1 then
                            AMS_REPO_COMPENSATION.MNQL_DATA_QUAR
                        end type_of_data,
                    case
                        when res.type_of_data = 0 and nvl(res.mnqr_period_qual, 0) = 1 then
                            AMS_REPO_COMPENSATION.NAME_RESULTS_PASS
                        when res.type_of_data = 0 and nvl(res.mnqr_period_qual, 0) <= 0 then
                            AMS_REPO_COMPENSATION.NAME_RESULTS_FAIL
                        end mnqr_period_qual
                from
                (
                    select
                        key.info_outlet_ams_id,
                        key.info_outlet_name,
                        key.info_company_name,
                        key.info_agency_name,
                        key.info_unit_name,
                        pos_leader.position_name leader_position_name,
                        outl.outlet_ams_id,
                        outl.outlet_name,
                        outl.agency_name,
                        outl.unit_name,
                        outl.effective_date,
                        outl.terminative_date,
                        pos_outl.position_name outl_position_name,
                        outl.mnqr_data_date,
                        outl.mnqr_period_fyp,
                        outl.mnqr_period_afis,
                        outl.mnqr_period_afif,
                        outl.mnqr_period_pr36,
                        outl.mnqr_period_coll_etmt,
                        outl.mnqr_period_coll_real,
                        outl.mnqr_period_coll_rate,
                        outl.mnqr_period_qual,
                        0 type_of_data,
                        key.info_outlet_ams_id mnqr_info_outlet_ams_id,
                        key.info_outlet_name mnqr_info_outlet_name,
                        key.info_company_name mnqr_info_company_name,
                        key.info_agency_name mnqr_info_agency_name,
                        key.info_unit_name mnqr_info_unit_name,
                        outl.outlet_ams_id outl_outlet_ams_id,
                        outl.outlet_name outl_outlet_name,
                        outl.unit_name outl_unit_name
                    from
                    (
                        select
                            tmp.outlet_ams_id info_outlet_ams_id,
                            tmp.info_outlet_name,
                            tmp.info_company_name,
                            tmp.info_agency_name,
                            tmp.info_unit_name,
                            tmp.mnqr_position_code position_code,
                            tmp.mnqr_branch_ams_id
                        from ams.la_compensation_mmxiii tmp
                        where tmp.record_date = trunc(valDate, 'MM')
                            and tmp.mnqr_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                            and tmp.mnqr_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                            and var_branch_id in
                            (
                                tmp.info_company_id,
                                tmp.info_office_id,
                                tmp.info_agency_id,
                                tmp.info_unit_id
                            )
                    ) key
                    join
                    (
                        select
                            tmp.outlet_id,
                            tmp.outlet_ams_id,
                            tmp.agency_name,
                            tmp.unit_name,
                            tmp.outlet_name,
                            tmp.effective_date,
                            tmp.terminative_date,
                            tmp.mnqr_data_date,
                            tmp.mnqr_branch_ams_id,
                            tmp.mnqr_period_fyc,
                            tmp.mnqr_period_fyc_calc,
                            tmp.mnqr_period_fyp,
                            tmp.mnqr_period_empl,
                            tmp.mnqr_period_qual,
                            tmp.mnqr_period_afis,
                            tmp.mnqr_period_afif,
                            tmp.mnqr_period_pr36,
                            tmp.mnqr_period_coll_etmt,
                            tmp.mnqr_period_coll_real,
                            tmp.mnqr_period_coll_rate,
                            tmp.mnqr_empl_asmt,
                            tmp.mnqr_fyc_ratio
                        from ams.la_comp_mmxiii_mnqr tmp
                        where tmp.record_date = trunc(valDate, 'MM')
                            and tmp.mnqr_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                            and tmp.mnqr_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                    ) outl
                        on outl.mnqr_branch_ams_id = key.mnqr_branch_ams_id
                    left join
                    (
                        select code.code_code position_code,
                            code.code_value position_name
                        from ams.cla_codes code
                        where code.code_language = AMS_CORE_SYSTEM.THEME_LANGUAGE
                            and code.code_group = AMS_CORE_CODE.OUTLET_INFO_TYPE_POSI
                            and trunc(valDate, 'MM')
                                between nvl(code.from_date, AMS_CORE_SYSTEM.DATE_MIN_VALUE)
                                and nvl(code.to_date, AMS_CORE_SYSTEM.DATE_MAX_VALUE)
                    ) pos_leader
                        on pos_leader.position_code = key.position_code
                    left join
                    (
                        select lha.agent_id,
                            lha.history_value position_code
                        from ams.la_history_agent lha
                        where lha.type_code = 'CVDL_CODE'
                            and add_months(trunc(valDate, 'MM'), 1) - 1 >= lha.from_date
                            and add_months(trunc(valDate, 'MM'), 1) - 1 <nvl(lha.to_date,'1-jan-2099')
                    ) posi
                       on posi.agent_id = outl.outlet_id
                    left join
                    (
                        select code.code_code position_code,
                            code.code_value position_name
                        from ams.cla_codes code
                        where code.code_language = AMS_CORE_SYSTEM.THEME_LANGUAGE
                            and code.code_group = AMS_CORE_CODE.OUTLET_INFO_TYPE_POSI
                            and trunc(valDate, 'MM')
                                between nvl(code.from_date, AMS_CORE_SYSTEM.DATE_MIN_VALUE)
                                and nvl(code.to_date, AMS_CORE_SYSTEM.DATE_MAX_VALUE)
                    ) pos_outl
                        on pos_outl.position_code = posi.position_code
                ) res;
        end if;
    end;

    procedure mmxiii_get_mnnu01(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor)
    is
        var_branch_id number(10) := nvl(valBranchID, 0);
        var_agent_id number(10) := nvl(valAgentID, 0);
    begin
        if var_agent_id <> 0 then
            open row_records for
            select
                case
                    when res.type_of_data = 0 then
                        rank() over (
                            partition by res.type_of_data
                            order by nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                                nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.info_unit_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                                nlssort(res.info_outlet_ams_id, 'nls_sort=Vietnamese')
                        )
                    end noid,
                case
                    when res.type_of_data = 0 then
                        res.info_outlet_ams_id
                    end info_outlet_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_outlet_name
                    end info_outlet_name,
                case
                    when res.type_of_data = 0 then
                        res.info_company_name
                    end info_company_name,
                case
                    when res.type_of_data = 0 then
                        res.info_agency_name
                    end info_agency_name,
                case
                    when res.type_of_data = 0 then
                        res.info_unit_name
                    end info_unit_name,
                res.info_position_name,
                res.mnnu_outlet_ams_id,
                res.mnnu_outlet_name,
                res.mnnu_agency_name,
                res.mnnu_unit_name,
                to_char(res.mnnu_effective_date, 'DD/MM/YYYY') outl_mnnu_effective_date,
                res.mnnu_senr_by_months,
                res.mnnu_buss_money,
                res.mnnu_comp_ratio,
                res.mnnu_comp_money,
                case
                    when res.type_of_data = 0 then
                        AMS_MODL_COMP_MMXIII_REPORT.MNNU_DATA_GENR
                    when res.type_of_data = 1 then
                        AMS_MODL_COMP_MMXIII_REPORT.MNNU_DATA_DETL
                    end type_of_data
            from
            (
                select
                        outl.mnnu_outlet_ams_id info_outlet_ams_id,
                        outl.info_outlet_name,
                        outl.info_company_name,
                        outl.info_agency_name,
                        outl.info_unit_name,
                        pos.position_name info_position_name,

                        null mnnu_outlet_ams_id,
                        null mnnu_outlet_name,
                        null mnnu_agency_name,
                        null mnnu_unit_name,
                        null mnnu_effective_date,
                        null mnnu_senr_by_months,
                        outl.mnnu_buss_money mnnu_buss_money,
                        null mnnu_comp_ratio,
                        outl.mnnu_comp_money,
                        0 type_of_data
                from
                (
                    select
                        tmp.outlet_id,
                        tmp.info_outlet_name,
                        tmp.info_company_name,
                        tmp.info_agency_name,
                        tmp.info_unit_name,
                        tmp.info_effective_date,
                        tmp.info_terminative_date,
                        tmp.record_date,
                        tmp.mnnu_position_code position_code,
                        tmp.mnnu_outlet_id,
                        tmp.mnnu_outlet_ams_id,
                        tmp.mnnu_buss_money,
                        tmp.mnnu_comp_money
                    from ams.la_compensation_mmxiii tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.mnnu_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnnu_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                        and tmp.outlet_id = var_agent_id
                ) outl
                join
                (
                    select code.code_code position_code,
                        code.code_value position_name
                    from ams.cla_codes code
                    where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                        and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                        and trunc(valDate, 'MM')
                            between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                            and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
                ) pos
                    on pos.position_code = outl.position_code

                union all

                select
                    outl.outlet_ams_id info_outlet_ams_id,
                    outl.info_outlet_name,
                    outl.info_company_name,
                    outl.info_agency_name,
                    outl.info_unit_name,
                    null info_position_name,

                    mnnu.outlet_ams_id mnnu_outlet_ams_id,
                    mnnu.outlet_name mnnu_outlet_name,
                    mnnu.agency_name mnnu_agency_name,
                    mnnu.unit_name mnnu_unit_name,
                    mnnu.effective_date mnnu_effective_date,
                    mnnu.senr_by_months mnnu_senr_by_months,
                    mnnu.mnnu_buss_money,
                    mnnu.mnnu_comp_ratio,
                    mnnu.mnnu_comp_money,
                    1 type_of_data
                from
                (
                    select
                        tmp.outlet_ams_id,
                        tmp.info_outlet_name,
                        tmp.info_company_name,
                        tmp.info_agency_name,
                        tmp.info_unit_name
                    from ams.la_compensation_mmxiii tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.mnnu_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnnu_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                        and tmp.outlet_id = var_agent_id
                ) outl
                join
                (
                    select
                        tmp.mnnu_outlet_ams_id,
                        tmp.outlet_ams_id,
                        tmp.outlet_name,
                        tmp.agency_name,
                        tmp.unit_name,
                        tmp.effective_date,
                        tmp.senr_by_months,
                        tmp.mnnu_buss_money,
                        tmp.mnnu_comp_ratio,
                        tmp.mnnu_comp_money
                    from ams.la_comp_mmxiii_mnnu tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.mnnu_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnnu_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                        and tmp.outlet_ams_id is not null
                ) mnnu
                    on mnnu.mnnu_outlet_ams_id = outl.outlet_ams_id
            ) res
            order by
                nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.info_unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.info_outlet_ams_id, 'nls_sort=Vietnamese'),
                res.type_of_data,
                nlssort(res.mnnu_unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.mnnu_outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.mnnu_outlet_ams_id, 'nls_sort=Vietnamese');
       elsif var_branch_id <> 0 then
            open row_records for
            select
                case
                    when res.type_of_data = 0 then
                        rank() over (
                            partition by res.type_of_data
                            order by nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                                nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.info_unit_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                                nlssort(res.info_outlet_ams_id, 'nls_sort=Vietnamese')
                        )
                    end noid,
                case
                    when res.type_of_data = 0 then
                        res.info_outlet_ams_id
                    end info_outlet_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_outlet_name
                    end info_outlet_name,
                case
                    when res.type_of_data = 0 then
                        res.info_company_name
                    end info_company_name,
                case
                    when res.type_of_data = 0 then
                        res.info_agency_name
                    end info_agency_name,
                case
                    when res.type_of_data = 0 then
                        res.info_unit_name
                    end info_unit_name,
                res.info_position_name,
                res.mnnu_outlet_ams_id,
                res.mnnu_outlet_name,
                res.mnnu_agency_name,
                res.mnnu_unit_name,
                to_char(res.mnnu_effective_date, 'DD/MM/YYYY') outl_mnnu_effective_date,
                res.mnnu_senr_by_months,
                res.mnnu_buss_money,
                res.mnnu_comp_ratio,
                res.mnnu_comp_money,
                case
                    when res.type_of_data = 0 then
                        AMS_MODL_COMP_MMXIII_REPORT.MNNU_DATA_GENR
                    when res.type_of_data = 1 then
                        AMS_MODL_COMP_MMXIII_REPORT.MNNU_DATA_DETL
                    end type_of_data
            from
            (
                select
                        outl.mnnu_outlet_ams_id info_outlet_ams_id,
                        outl.info_outlet_name,
                        outl.info_company_name,
                        outl.info_agency_name,
                        outl.info_unit_name,
                        pos.position_name info_position_name,

                        null mnnu_outlet_ams_id,
                        null mnnu_outlet_name,
                        null mnnu_agency_name,
                        null mnnu_unit_name,
                        null mnnu_effective_date,
                        null mnnu_senr_by_months,
                        outl.mnnu_buss_money mnnu_buss_money,
                        null mnnu_comp_ratio,
                        outl.mnnu_comp_money,
                        0 type_of_data
                from
                (
                    select
                        tmp.outlet_id,
                        tmp.info_outlet_name,
                        tmp.info_company_name,
                        tmp.info_agency_name,
                        tmp.info_unit_name,
                        tmp.info_effective_date,
                        tmp.info_terminative_date,
                        tmp.record_date,
                        tmp.mnnu_position_code position_code,
                        tmp.mnnu_outlet_id,
                        tmp.mnnu_outlet_ams_id,
                        tmp.mnnu_buss_money,
                        tmp.mnnu_comp_money
                    from ams.la_compensation_mmxiii tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.mnnu_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnnu_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                        and var_branch_id in
                        (
                            tmp.info_company_id,
                            tmp.info_office_id,
                            tmp.info_agency_id,
                            tmp.info_unit_id
                        )
                ) outl
                join
                (
                    select code.code_code position_code,
                        code.code_value position_name
                    from ams.cla_codes code
                    where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                        and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                        and trunc(valDate, 'MM')
                            between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                            and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
                ) pos
                    on pos.position_code = outl.position_code

                union all

                select
                    outl.outlet_ams_id info_outlet_ams_id,
                    outl.info_outlet_name,
                    outl.info_company_name,
                    outl.info_agency_name,
                    outl.info_unit_name,
                    null info_position_name,

                    mnnu.outlet_ams_id mnnu_outlet_ams_id,
                    mnnu.outlet_name mnnu_outlet_name,
                    mnnu.agency_name mnnu_agency_name,
                    mnnu.unit_name mnnu_unit_name,
                    mnnu.effective_date mnnu_effective_date,
                    mnnu.senr_by_months mnnu_senr_by_months,
                    mnnu.mnnu_buss_money,
                    mnnu.mnnu_comp_ratio,
                    mnnu.mnnu_comp_money,
                    1 type_of_data
                from
                (
                    select
                        tmp.outlet_ams_id,
                        tmp.info_outlet_name,
                        tmp.info_company_name,
                        tmp.info_agency_name,
                        tmp.info_unit_name
                    from ams.la_compensation_mmxiii tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.mnnu_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnnu_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                        and var_branch_id in
                        (
                            tmp.info_company_id,
                            tmp.info_office_id,
                            tmp.info_agency_id,
                            tmp.info_unit_id
                        )
                ) outl
                join
                (
                    select
                        tmp.mnnu_outlet_ams_id,
                        tmp.outlet_ams_id,
                        tmp.outlet_name,
                        tmp.agency_name,
                        tmp.unit_name,
                        tmp.effective_date,
                        tmp.senr_by_months,
                        tmp.mnnu_buss_money,
                        tmp.mnnu_comp_ratio,
                        tmp.mnnu_comp_money
                    from ams.la_comp_mmxiii_mnnu tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.mnnu_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnnu_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                        and tmp.outlet_ams_id is not null
                ) mnnu
                    on mnnu.mnnu_outlet_ams_id = outl.outlet_ams_id
            ) res
            order by
                nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.info_unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.info_outlet_ams_id, 'nls_sort=Vietnamese'),
                res.type_of_data,
                nlssort(res.mnnu_unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.mnnu_outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.mnnu_outlet_ams_id, 'nls_sort=Vietnamese');
       elsif var_branch_id = 0 then   --cap tong cong ty
            open row_records for
            select
                case
                    when res.type_of_data = 0 then
                        rank() over (
                            partition by res.type_of_data
                            order by nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                                nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.info_unit_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                                nlssort(res.info_outlet_ams_id, 'nls_sort=Vietnamese')
                        )
                    end noid,
                case
                    when res.type_of_data = 0 then
                        res.info_outlet_ams_id
                    end info_outlet_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_outlet_name
                    end info_outlet_name,
                case
                    when res.type_of_data = 0 then
                        res.info_company_name
                    end info_company_name,
                case
                    when res.type_of_data = 0 then
                        res.info_agency_name
                    end info_agency_name,
                case
                    when res.type_of_data = 0 then
                        res.info_unit_name
                    end info_unit_name,
                res.info_position_name,
                res.mnnu_outlet_ams_id,
                res.mnnu_outlet_name,
                res.mnnu_agency_name,
                res.mnnu_unit_name,
                to_char(res.mnnu_effective_date, 'DD/MM/YYYY') outl_mnnu_effective_date,
                res.mnnu_senr_by_months,
                res.mnnu_buss_money,
                res.mnnu_comp_ratio,
                res.mnnu_comp_money,
                case
                    when res.type_of_data = 0 then
                        AMS_MODL_COMP_MMXIII_REPORT.MNNU_DATA_GENR
                    when res.type_of_data = 1 then
                        AMS_MODL_COMP_MMXIII_REPORT.MNNU_DATA_DETL
                    end type_of_data
            from
            (
                select
                        outl.mnnu_outlet_ams_id info_outlet_ams_id,
                        outl.info_outlet_name,
                        outl.info_company_name,
                        outl.info_agency_name,
                        outl.info_unit_name,
                        pos.position_name info_position_name,

                        null mnnu_outlet_ams_id,
                        null mnnu_outlet_name,
                        null mnnu_agency_name,
                        null mnnu_unit_name,
                        null mnnu_effective_date,
                        null mnnu_senr_by_months,
                        outl.mnnu_buss_money mnnu_buss_money,
                        null mnnu_comp_ratio,
                        outl.mnnu_comp_money,
                        0 type_of_data
                from
                (
                    select
                        tmp.outlet_id,
                        tmp.info_outlet_name,
                        tmp.info_company_name,
                        tmp.info_agency_name,
                        tmp.info_unit_name,
                        tmp.info_effective_date,
                        tmp.info_terminative_date,
                        tmp.record_date,
                        tmp.mnnu_position_code position_code,
                        tmp.mnnu_outlet_id,
                        tmp.mnnu_outlet_ams_id,
                        tmp.mnnu_buss_money,
                        tmp.mnnu_comp_money
                    from ams.la_compensation_mmxiii tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.mnnu_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnnu_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                ) outl
                join
                (
                    select code.code_code position_code,
                        code.code_value position_name
                    from ams.cla_codes code
                    where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                        and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                        and trunc(valDate, 'MM')
                            between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                            and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
                ) pos
                    on pos.position_code = outl.position_code

                union all

                select
                    outl.outlet_ams_id info_outlet_ams_id,
                    outl.info_outlet_name,
                    outl.info_company_name,
                    outl.info_agency_name,
                    outl.info_unit_name,
                    null info_position_name,

                    mnnu.outlet_ams_id mnnu_outlet_ams_id,
                    mnnu.outlet_name mnnu_outlet_name,
                    mnnu.agency_name mnnu_agency_name,
                    mnnu.unit_name mnnu_unit_name,
                    mnnu.effective_date mnnu_effective_date,
                    mnnu.senr_by_months mnnu_senr_by_months,
                    mnnu.mnnu_buss_money,
                    mnnu.mnnu_comp_ratio,
                    mnnu.mnnu_comp_money,
                    1 type_of_data
                from
                (
                    select
                        tmp.outlet_ams_id,
                        tmp.info_outlet_name,
                        tmp.info_company_name,
                        tmp.info_agency_name,
                        tmp.info_unit_name
                    from ams.la_compensation_mmxiii tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.mnnu_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnnu_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                ) outl
                join
                (
                    select
                        tmp.mnnu_outlet_ams_id,
                        tmp.outlet_ams_id,
                        tmp.outlet_name,
                        tmp.agency_name,
                        tmp.unit_name,
                        tmp.effective_date,
                        tmp.senr_by_months,
                        tmp.mnnu_buss_money,
                        tmp.mnnu_comp_ratio,
                        tmp.mnnu_comp_money
                    from ams.la_comp_mmxiii_mnnu tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.mnnu_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnnu_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                        and tmp.outlet_ams_id is not null
                ) mnnu
                    on mnnu.mnnu_outlet_ams_id = outl.outlet_ams_id
            ) res
            order by
                nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.info_unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.info_outlet_ams_id, 'nls_sort=Vietnamese'),
                res.type_of_data,
                nlssort(res.mnnu_unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.mnnu_outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.mnnu_outlet_ams_id, 'nls_sort=Vietnamese');
        end if;
    end;

    procedure mmxiii_get_mnna01(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor)
    is
        var_branch_id number(10) := nvl(valBranchID, 0);
        var_agent_id number(10) := nvl(valAgentID, 0);
    begin
        if var_agent_id <> 0 then
            open row_records for
            select
                case
                    when res.type_of_data = 0 then
                        rank() over (
                            partition by res.type_of_data
                            order by nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                                nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                                nlssort(res.info_outlet_ams_id, 'nls_sort=Vietnamese')
                        )
                    end noid,
                case
                    when res.type_of_data = 0 then
                        res.info_outlet_ams_id
                    end info_outlet_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_outlet_name
                    end info_outlet_name,
                case
                    when res.type_of_data = 0 then
                        res.info_company_name
                    end info_company_name,
                case
                    when res.type_of_data = 0 then
                        res.info_agency_name
                    end info_agency_name,
                res.info_position_name,
                res.mnna_outlet_ams_id,
                res.mnna_outlet_name,
                res.mnna_agency_name,
                to_char(res.mnna_effective_date, 'DD/MM/YYYY') outl_mnna_effective_date,
                res.mnna_period_fyp,
                res.mnna_senr_by_months,
                res.mnna_comp_ratio,
                res.mnna_comp_money,
                case
                    when res.type_of_data = 0 then
                        AMS_MODL_COMP_MMXIII_REPORT.MNNA_DATA_GENR
                    when res.type_of_data = 1 then
                        AMS_MODL_COMP_MMXIII_REPORT.MNNA_DATA_DETL
                    end type_of_data
            from
            (
                select
                    outl.mnna_outlet_ams_id info_outlet_ams_id,
                    outl.info_outlet_name,
                    outl.info_company_name,
                    outl.info_agency_name,
                    pos.position_name info_position_name,
                    null mnna_outlet_ams_id,
                    null mnna_outlet_name,
                    null mnna_agency_name,
                    null mnna_effective_date,
                    null mnna_senr_by_months,
                    outl.mnna_period_fyp,
                    null mnna_comp_ratio,
                    outl.mnna_comp_money,
                    0 type_of_data
                from
                (
                    select
                        tmp.outlet_id,
                        tmp.info_outlet_name,
                        tmp.info_company_name,
                        tmp.info_agency_name,
                        tmp.info_unit_name,
                        tmp.info_effective_date,
                        tmp.info_terminative_date,
                        tmp.record_date,
                        tmp.mnna_position_code position_code,
                        tmp.mnna_outlet_id,
                        tmp.mnna_outlet_ams_id,
                        tmp.mnna_period_fyp,
                        tmp.mnna_comp_money
                    from ams.la_compensation_mmxiii tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.mnna_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnna_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                        and tmp.outlet_id = var_agent_id
                ) outl
                join
                (
                    select code.code_code position_code,
                        code.code_value position_name
                    from ams.cla_codes code
                    where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                        and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                        and trunc(valDate, 'MM')
                            between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                            and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
                ) pos
                    on pos.position_code = outl.position_code

                union all

                select
                    outl.outlet_ams_id info_outlet_ams_id,
                    outl.info_outlet_name,
                    outl.info_company_name,
                    outl.info_agency_name,
                    null info_position_name,
                    mnna.outlet_ams_id mnna_outlet_ams_id,
                    mnna.outlet_name mnna_outlet_name,
                    mnna.agency_name mnna_agency_name,
                    mnna.effective_date mnna_effective_date,
                    mnna.senr_by_months mnna_senr_by_months,
                    mnna.mnna_period_fyp mnna_period_fyp,
                    mnna.mnna_comp_ratio,
                    mnna.mnna_comp_money,
                    1 type_of_data
                from
                (
                    select
                        tmp.outlet_ams_id,
                        tmp.info_outlet_name,
                        tmp.info_company_name,
                        tmp.info_agency_name
                    from ams.la_compensation_mmxiii tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.mnna_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnna_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                        and tmp.outlet_id = var_agent_id
                ) outl
                join
                (
                    select
                        tmp.mnna_outlet_ams_id,
                        tmp.outlet_ams_id,
                        tmp.outlet_name,
                        tmp.agency_name,
                        tmp.effective_date,
                        tmp.senr_by_months,
                        tmp.mnna_period_fyp,
                        tmp.mnna_comp_ratio,
                        tmp.mnna_comp_money
                    from ams.la_comp_mmxiii_mnna tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.mnna_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnna_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                ) mnna
                    on mnna.mnna_outlet_ams_id = outl.outlet_ams_id
            ) res
            order by
                nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.info_outlet_ams_id, 'nls_sort=Vietnamese'),
                res.type_of_data,
                nlssort(res.mnna_outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.mnna_outlet_ams_id, 'nls_sort=Vietnamese');
       elsif var_branch_id <> 0 then
            open row_records for
            select
                case
                    when res.type_of_data = 0 then
                        rank() over (
                            partition by res.type_of_data
                            order by nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                                nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                                nlssort(res.info_outlet_ams_id, 'nls_sort=Vietnamese')
                        )
                    end noid,
                case
                    when res.type_of_data = 0 then
                        res.info_outlet_ams_id
                    end info_outlet_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_outlet_name
                    end info_outlet_name,
                case
                    when res.type_of_data = 0 then
                        res.info_company_name
                    end info_company_name,
                case
                    when res.type_of_data = 0 then
                        res.info_agency_name
                    end info_agency_name,
                res.info_position_name,
                res.mnna_outlet_ams_id,
                res.mnna_outlet_name,
                res.mnna_agency_name,
                to_char(res.mnna_effective_date, 'DD/MM/YYYY') outl_mnna_effective_date,
                res.mnna_period_fyp,
                res.mnna_senr_by_months,
                res.mnna_comp_ratio,
                res.mnna_comp_money,
                case
                    when res.type_of_data = 0 then
                        AMS_MODL_COMP_MMXIII_REPORT.MNNA_DATA_GENR
                    when res.type_of_data = 1 then
                        AMS_MODL_COMP_MMXIII_REPORT.MNNA_DATA_DETL
                    end type_of_data
            from
            (
                select
                    outl.mnna_outlet_ams_id info_outlet_ams_id,
                    outl.info_outlet_name,
                    outl.info_company_name,
                    outl.info_agency_name,
                    pos.position_name info_position_name,
                    null mnna_outlet_ams_id,
                    null mnna_outlet_name,
                    null mnna_agency_name,
                    null mnna_effective_date,
                    null mnna_senr_by_months,
                    outl.mnna_period_fyp,
                    null mnna_comp_ratio,
                    outl.mnna_comp_money,
                    0 type_of_data
                from
                (
                    select
                        tmp.outlet_id,
                        tmp.info_outlet_name,
                        tmp.info_company_name,
                        tmp.info_agency_name,
                        tmp.info_unit_name,
                        tmp.info_effective_date,
                        tmp.info_terminative_date,
                        tmp.record_date,
                        tmp.mnna_position_code position_code,
                        tmp.mnna_outlet_id,
                        tmp.mnna_outlet_ams_id,
                        tmp.mnna_period_fyp,
                        tmp.mnna_comp_money
                    from ams.la_compensation_mmxiii tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.mnna_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnna_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                        and var_branch_id in
                        (
                            tmp.info_company_id,
                            tmp.info_office_id,
                            tmp.info_agency_id,
                            tmp.info_unit_id
                        )
                ) outl
                join
                (
                    select code.code_code position_code,
                        code.code_value position_name
                    from ams.cla_codes code
                    where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                        and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                        and trunc(valDate, 'MM')
                            between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                            and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
                ) pos
                    on pos.position_code = outl.position_code

                union all

                select
                    outl.outlet_ams_id info_outlet_ams_id,
                    outl.info_outlet_name,
                    outl.info_company_name,
                    outl.info_agency_name,
                    null info_position_name,
                    mnna.outlet_ams_id mnna_outlet_ams_id,
                    mnna.outlet_name mnna_outlet_name,
                    mnna.agency_name mnna_agency_name,
                    mnna.effective_date mnna_effective_date,
                    mnna.senr_by_months mnna_senr_by_months,
                    mnna.mnna_period_fyp mnna_period_fyp,
                    mnna.mnna_comp_ratio,
                    mnna.mnna_comp_money,
                    1 type_of_data
                from
                (
                    select
                        tmp.outlet_ams_id,
                        tmp.info_outlet_name,
                        tmp.info_company_name,
                        tmp.info_agency_name
                    from ams.la_compensation_mmxiii tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.mnna_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnna_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                        and var_branch_id in
                        (
                            tmp.info_company_id,
                            tmp.info_office_id,
                            tmp.info_agency_id,
                            tmp.info_unit_id
                        )
                ) outl
                join
                (
                    select
                        tmp.mnna_outlet_ams_id,
                        tmp.outlet_ams_id,
                        tmp.outlet_name,
                        tmp.agency_name,
                        tmp.effective_date,
                        tmp.senr_by_months,
                        tmp.mnna_period_fyp,
                        tmp.mnna_comp_ratio,
                        tmp.mnna_comp_money
                    from ams.la_comp_mmxiii_mnna tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.mnna_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnna_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                ) mnna
                    on mnna.mnna_outlet_ams_id = outl.outlet_ams_id
            ) res
            order by
                nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.info_outlet_ams_id, 'nls_sort=Vietnamese'),
                res.type_of_data,
                nlssort(res.mnna_outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.mnna_outlet_ams_id, 'nls_sort=Vietnamese');
       elsif var_branch_id = 0 then             --cap tong cong ty
            open row_records for
            select
                case
                    when res.type_of_data = 0 then
                        rank() over (
                            partition by res.type_of_data
                            order by nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                                nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                                nlssort(res.info_outlet_ams_id, 'nls_sort=Vietnamese')
                        )
                    end noid,
                case
                    when res.type_of_data = 0 then
                        res.info_outlet_ams_id
                    end info_outlet_ams_id,
                case
                    when res.type_of_data = 0 then
                        res.info_outlet_name
                    end info_outlet_name,
                case
                    when res.type_of_data = 0 then
                        res.info_company_name
                    end info_company_name,
                case
                    when res.type_of_data = 0 then
                        res.info_agency_name
                    end info_agency_name,
                res.info_position_name,
                res.mnna_outlet_ams_id,
                res.mnna_outlet_name,
                res.mnna_agency_name,
                to_char(res.mnna_effective_date, 'DD/MM/YYYY') outl_mnna_effective_date,
                res.mnna_period_fyp,
                res.mnna_senr_by_months,
                res.mnna_comp_ratio,
                res.mnna_comp_money,
                case
                    when res.type_of_data = 0 then
                        AMS_MODL_COMP_MMXIII_REPORT.MNNA_DATA_GENR
                    when res.type_of_data = 1 then
                        AMS_MODL_COMP_MMXIII_REPORT.MNNA_DATA_DETL
                    end type_of_data
            from
            (
                select
                    outl.mnna_outlet_ams_id info_outlet_ams_id,
                    outl.info_outlet_name,
                    outl.info_company_name,
                    outl.info_agency_name,
                    pos.position_name info_position_name,
                    null mnna_outlet_ams_id,
                    null mnna_outlet_name,
                    null mnna_agency_name,
                    null mnna_effective_date,
                    null mnna_senr_by_months,
                    outl.mnna_period_fyp,
                    null mnna_comp_ratio,
                    outl.mnna_comp_money,
                    0 type_of_data
                from
                (
                    select
                        tmp.outlet_id,
                        tmp.info_outlet_name,
                        tmp.info_company_name,
                        tmp.info_agency_name,
                        tmp.info_unit_name,
                        tmp.info_effective_date,
                        tmp.info_terminative_date,
                        tmp.record_date,
                        tmp.mnna_position_code position_code,
                        tmp.mnna_outlet_id,
                        tmp.mnna_outlet_ams_id,
                        tmp.mnna_period_fyp,
                        tmp.mnna_comp_money
                    from ams.la_compensation_mmxiii tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.mnna_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnna_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                ) outl
                join
                (
                    select code.code_code position_code,
                        code.code_value position_name
                    from ams.cla_codes code
                    where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                        and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                        and trunc(valDate, 'MM')
                            between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                            and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
                ) pos
                    on pos.position_code = outl.position_code

                union all

                select
                    outl.outlet_ams_id info_outlet_ams_id,
                    outl.info_outlet_name,
                    outl.info_company_name,
                    outl.info_agency_name,
                    null info_position_name,
                    mnna.outlet_ams_id mnna_outlet_ams_id,
                    mnna.outlet_name mnna_outlet_name,
                    mnna.agency_name mnna_agency_name,
                    mnna.effective_date mnna_effective_date,
                    mnna.senr_by_months mnna_senr_by_months,
                    mnna.mnna_period_fyp mnna_period_fyp,
                    mnna.mnna_comp_ratio,
                    mnna.mnna_comp_money,
                    1 type_of_data
                from
                (
                    select
                        tmp.outlet_ams_id,
                        tmp.info_outlet_name,
                        tmp.info_company_name,
                        tmp.info_agency_name
                    from ams.la_compensation_mmxiii tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.mnna_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnna_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                ) outl
                join
                (
                    select
                        tmp.mnna_outlet_ams_id,
                        tmp.outlet_ams_id,
                        tmp.outlet_name,
                        tmp.agency_name,
                        tmp.effective_date,
                        tmp.senr_by_months,
                        tmp.mnna_period_fyp,
                        tmp.mnna_comp_ratio,
                        tmp.mnna_comp_money
                    from ams.la_comp_mmxiii_mnna tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.mnna_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnna_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                ) mnna
                    on mnna.mnna_outlet_ams_id = outl.outlet_ams_id
            ) res
            order by
                nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.info_outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.info_outlet_ams_id, 'nls_sort=Vietnamese'),
                res.type_of_data,
                nlssort(res.mnna_outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.mnna_outlet_ams_id, 'nls_sort=Vietnamese');

       end if;
    end;

    procedure mmxiii_get_mnna02(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor)
    is
        var_branch_id number(10) := nvl(valBranchID, 0);
        var_agent_id number(10) := nvl(valAgentID, 0);
    begin
        if var_agent_id <> 0 then
            open row_records for
             select
                outl.outlet_id,
                outl.outlet_ams_id,
                outl.outlet_name,
                outl.company_name,
                outl.office_name,
                outl.agency_name,
                outl.unit_name,
                pos.position_name,
                to_char(outl.effective_date, 'DD/MM/YYYY') effective_date,
                to_char(outl.terminative_date, 'DD/MM/YYYY') terminative_date,
                to_char(outl.position_date, 'DD/MM/YYYY') position_date,
                outl.mnna_unit_level,
                outl.mnna_period_fyp,
                outl.mnna_period_fyp_calc
            from
            (
                select
                    tmp.outlet_id,
                    tmp.outlet_ams_id,
                    tmp.outlet_name,
                    tmp.company_name,
                    tmp.office_name,
                    tmp.agency_name,
                    tmp.unit_name,
                    tmp.effective_date,
                    tmp.terminative_date,
                    tmp.position_code,
                    tmp.position_date,
                    tmp.mnna_unit_level,
                    tmp.mnna_period_fyp,
                    tmp.mnna_period_fyp_calc
                from ams.la_comp_mmxiii_mnna_detail tmp
                where tmp.record_date = trunc(valDate, 'MM')
                    and tmp.mnna_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                    and tmp.mnna_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                    and tmp.outlet_id = var_agent_id
            ) outl
            join
            (
                select code.code_code position_code,
                    code.code_value position_name
                from ams.cla_codes code
                where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                    and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                    and trunc(valDate, 'MM')
                        between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                        and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
            ) pos
                on pos.position_code = outl.position_code
            order by
                nlssort(outl.company_name, 'nls_sort=Vietnamese'),
                nlssort(outl.agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(outl.unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(outl.outlet_name, 'nls_sort=Vietnamese'),
                nlssort(outl.outlet_ams_id, 'nls_sort=Vietnamese');
       elsif var_branch_id <> 0 then
            open row_records for
             select
                outl.outlet_id,
                outl.outlet_ams_id,
                outl.outlet_name,
                outl.company_name,
                outl.office_name,
                outl.agency_name,
                outl.unit_name,
                pos.position_name,
                to_char(outl.effective_date, 'DD/MM/YYYY') effective_date,
                to_char(outl.terminative_date, 'DD/MM/YYYY') terminative_date,
                to_char(outl.position_date, 'DD/MM/YYYY') position_date,
                outl.mnna_unit_level,
                outl.mnna_period_fyp,
                outl.mnna_period_fyp_calc
            from
            (
                select
                    tmp.outlet_id,
                    tmp.outlet_ams_id,
                    tmp.outlet_name,
                    tmp.company_name,
                    tmp.office_name,
                    tmp.agency_name,
                    tmp.unit_name,
                    tmp.effective_date,
                    tmp.terminative_date,
                    tmp.position_code,
                    tmp.position_date,
                    tmp.mnna_unit_level,
                    tmp.mnna_period_fyp,
                    tmp.mnna_period_fyp_calc
                from ams.la_comp_mmxiii_mnna_detail tmp
                where tmp.record_date = trunc(valDate, 'MM')
                    and tmp.mnna_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                    and tmp.mnna_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                    and var_branch_id in
                    (
                        tmp.company_id,
                        tmp.office_id,
                        tmp.agency_id,
                        tmp.unit_id
                    )
            ) outl
            join
            (
                select code.code_code position_code,
                    code.code_value position_name
                from ams.cla_codes code
                where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                    and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                    and trunc(valDate, 'MM')
                        between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                        and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
            ) pos
                on pos.position_code = outl.position_code
            order by
                nlssort(outl.company_name, 'nls_sort=Vietnamese'),
                nlssort(outl.agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(outl.unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(outl.outlet_name, 'nls_sort=Vietnamese'),
                nlssort(outl.outlet_ams_id, 'nls_sort=Vietnamese');
       elsif var_branch_id = 0 then             --cap tong cong ty
            open row_records for
             select
                outl.outlet_id,
                outl.outlet_ams_id,
                outl.outlet_name,
                outl.company_name,
                outl.office_name,
                outl.agency_name,
                outl.unit_name,
                pos.position_name,
                to_char(outl.effective_date, 'DD/MM/YYYY') effective_date,
                to_char(outl.terminative_date, 'DD/MM/YYYY') terminative_date,
                to_char(outl.position_date, 'DD/MM/YYYY') position_date,
                outl.mnna_unit_level,
                outl.mnna_period_fyp,
                outl.mnna_period_fyp_calc
            from
            (
                select
                    tmp.outlet_id,
                    tmp.outlet_ams_id,
                    tmp.outlet_name,
                    tmp.company_name,
                    tmp.office_name,
                    tmp.agency_name,
                    tmp.unit_name,
                    tmp.effective_date,
                    tmp.terminative_date,
                    tmp.position_code,
                    tmp.position_date,
                    tmp.mnna_unit_level,
                    tmp.mnna_period_fyp,
                    tmp.mnna_period_fyp_calc
                from ams.la_comp_mmxiii_mnna_detail tmp
                where tmp.record_date = trunc(valDate, 'MM')
                    and tmp.mnna_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                    and tmp.mnna_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
            ) outl
            join
            (
                select code.code_code position_code,
                    code.code_value position_name
                from ams.cla_codes code
                where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                    and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                    and trunc(valDate, 'MM')
                        between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                        and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
            ) pos
                on pos.position_code = outl.position_code
            order by
                nlssort(outl.company_name, 'nls_sort=Vietnamese'),
                nlssort(outl.agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(outl.unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(outl.outlet_name, 'nls_sort=Vietnamese'),
                nlssort(outl.outlet_ams_id, 'nls_sort=Vietnamese');
       end if;
   end;

    procedure mmxiii_get_mnea01(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor)
    is
        var_branch_id number(10) := nvl(valBranchID, 0);
        var_agent_id number(10) := nvl(valAgentID, 0);
    begin
        if var_agent_id <> 0 then
            open row_records for
            select
                case
                    when res.type_of_data = 0 then
                        rank() over (
                            partition by res.type_of_data
                            order by nlssort(res.company_name, 'nls_sort=Vietnamese'),
                                nlssort(res.agency_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.unit_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese')
                        )
                    end noid,
                case
                    when res.type_of_data = 0 then
                        res.company_name
                    end company_name,
                case
                    when res.type_of_data = 0 then
                        res.office_name
                    end office_name,
                case
                    when res.type_of_data = 0 then
                        res.agency_name
                    end agency_name,
                case
                    when res.type_of_data = 0  then
                        res.unit_name
                    end unit_name,
                case
                    when res.type_of_data = 0  then
                        res.outlet_ams_id
                    end outlet_ams_id,
                case
                    when res.type_of_data = 0  then
                        res.outlet_name
                    end outlet_name,
                res.position_name,
                to_char(res.effective_date, 'DD/MM/YYYY') effective_date,
                to_char(res.terminative_date, 'DD/MM/YYYY') terminative_date,
                to_char(res.mnea_data_date, 'DD/MM/YYYY') mnea_data_date,
                res.mnea_period_na_qty,
                res.mnea_period_fyp,
                case
                    when res.type_of_data = 0  then
                        res.mnea_period_month_qty
                    when res.type_of_data = 1  then
                        res.mnea_period_asmt
                    end mnea_period_month_qty,
                res.mnea_period_fyc,
                res.mnea_comp_ratio,
                res.mnea_comp_money,
                case
                    when res.type_of_data = 0 then
                        AMS_MODL_COMP_MMXIII_REPORT.MNEA_DATA_GENR
                    when res.type_of_data = 1 then
                        AMS_MODL_COMP_MMXIII_REPORT.MNEA_DATA_MONT
                    end type_of_data
            from
            (
                select /*+ CARDINALITY(outl, 100)*/
                    outl.outlet_ams_id,
                    outl.outlet_name,
                    outl.company_name,
                    outl.office_name,
                    outl.agency_name,
                    outl.unit_name,
                    pos.position_name,
                    outl.effective_date,
                    outl.terminative_date,
                    outl.mnea_data_date,
                    outl.mnea_period_na_qty,
                    null mnea_period_fyp,
                    outl.mnea_period_asmt,
                    outl.mnea_period_month_qty,
                    outl.mnea_period_fyc,
                    outl.mnea_comp_ratio,
                    outl.mnea_comp_money,
                    0 type_of_data
                from
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.outlet_name,
                        tmp.company_name,
                        tmp.office_name,
                        tmp.agency_name,
                        tmp.unit_name,
                        tmp.effective_date,
                        tmp.terminative_date,
                        tmp.position_code,
                        tmp.mnea_data_date,
                        tmp.mnea_period_na_qty,
                        tmp.mnea_period_fyp,
                        tmp.mnea_period_asmt,
                        tmp.mnea_period_month_qty,
                        tmp.mnea_period_fyc,
                        tmp.mnea_comp_ratio,
                        tmp.mnea_comp_money
                    from ams.la_comp_mmxiii_mnea tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.mnea_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnea_be_paid in (
                            AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES,
                            AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_NO)
                        and tmp.outlet_id = var_agent_id
                ) outl
                left join
                (
                    select code.code_code position_code,
                        code.code_value position_name
                    from ams.cla_codes code
                    where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                        and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                        and trunc(valDate, 'MM')
                            between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                            and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
                ) pos
                    on pos.position_code = outl.position_code

                union all
                select
                    det.outlet_ams_id,
                    det.outlet_name,
                    det.company_name,
                    det.office_name,
                    det.agency_name,
                    det.unit_name,
                    det.position_name,
                    det.effective_date,
                    det.terminative_date,
                    det.mnea_data_date,
                    nvl(det.mnea_period_na_qty, 0) mnea_period_na_qty,
                    det.mnea_period_fyp,
                    det.mnea_period_asmt,
                    det.mnea_period_month_qty,
                    det.mnea_period_fyc,
                    det.mnea_comp_ratio,
                    det.mnea_comp_money,
                    det.type_of_data
                from
                (
                    select
                        tmp.outlet_ams_id
                    from ams.la_comp_mmxiii_mnea tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.mnea_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnea_be_paid in (
                            AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES,
                            AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_NO)
                        and tmp.outlet_id = var_agent_id
                ) outl
                join
                (
                    select
                        tmp.outlet_ams_id,
                        tmp.outlet_name,
                        tmp.company_name,
                        tmp.office_name,
                        tmp.agency_name,
                        tmp.unit_name,
                        null position_name,
                        null effective_date,
                        null terminative_date,
                        tmp.mnea_data_date,
                        tmp.mnea_period_na_qty,
                        tmp.mnea_period_fyp,
                        tmp.mnea_period_asmt,
                        null mnea_period_month_qty,
                        tmp.mnea_period_fyc,
                        tmp.mnea_comp_ratio,
                        tmp.mnea_comp_money,
                        1 type_of_data
                    from ams.la_comp_mmxiii_mnea tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.mnea_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnea_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_DTL
                        and tmp.outlet_id = var_agent_id
                ) det
                    on det.outlet_ams_id = outl.outlet_ams_id
            ) res
            order by
                nlssort(res.company_name, 'nls_sort=Vietnamese'),
                nlssort(res.office_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese'),
                res.type_of_data,
                res.mnea_data_date;
       elsif var_branch_id <> 0 then
            open row_records for
            select
                case
                    when res.type_of_data = 0 then
                        rank() over (
                            partition by res.type_of_data
                            order by nlssort(res.company_name, 'nls_sort=Vietnamese'),
                                nlssort(res.agency_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.unit_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese')
                        )
                    end noid,
                case
                    when res.type_of_data = 0 then
                        res.company_name
                    end company_name,
                case
                    when res.type_of_data = 0 then
                        res.office_name
                    end office_name,
                case
                    when res.type_of_data = 0 then
                        res.agency_name
                    end agency_name,
                case
                    when res.type_of_data = 0  then
                        res.unit_name
                    end unit_name,
                case
                    when res.type_of_data = 0  then
                        res.outlet_ams_id
                    end outlet_ams_id,
                case
                    when res.type_of_data = 0  then
                        res.outlet_name
                    end outlet_name,
                res.position_name,
                to_char(res.effective_date, 'DD/MM/YYYY') effective_date,
                to_char(res.terminative_date, 'DD/MM/YYYY') terminative_date,
                to_char(res.mnea_data_date, 'DD/MM/YYYY') mnea_data_date,
                res.mnea_period_na_qty,
                res.mnea_period_fyp,
                case
                    when res.type_of_data = 0  then
                        res.mnea_period_month_qty
                    when res.type_of_data = 1  then
                        res.mnea_period_asmt
                    end mnea_period_month_qty,
                res.mnea_period_fyc,
                res.mnea_comp_ratio,
                res.mnea_comp_money,
                case
                    when res.type_of_data = 0 then
                        AMS_MODL_COMP_MMXIII_REPORT.MNEA_DATA_GENR
                    when res.type_of_data = 1 then
                        AMS_MODL_COMP_MMXIII_REPORT.MNEA_DATA_MONT
                    end type_of_data
            from
            (
                select /*+ CARDINALITY(outl, 100)*/
                    outl.outlet_ams_id,
                    outl.outlet_name,
                    outl.company_name,
                    outl.office_name,
                    outl.agency_name,
                    outl.unit_name,
                    pos.position_name,
                    outl.effective_date,
                    outl.terminative_date,
                    outl.mnea_data_date,
                    outl.mnea_period_na_qty,
                    null mnea_period_fyp,
                    outl.mnea_period_asmt,
                    outl.mnea_period_month_qty,
                    outl.mnea_period_fyc,
                    outl.mnea_comp_ratio,
                    outl.mnea_comp_money,
                    0 type_of_data
                from
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.outlet_name,
                        tmp.company_name,
                        tmp.office_name,
                        tmp.agency_name,
                        tmp.unit_name,
                        tmp.effective_date,
                        tmp.terminative_date,
                        tmp.position_code,
                        tmp.mnea_data_date,
                        tmp.mnea_period_na_qty,
                        tmp.mnea_period_fyp,
                        tmp.mnea_period_asmt,
                        tmp.mnea_period_month_qty,
                        tmp.mnea_period_fyc,
                        tmp.mnea_comp_ratio,
                        tmp.mnea_comp_money
                    from ams.la_comp_mmxiii_mnea tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.mnea_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnea_be_paid in (
                            AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES,
                            AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_NO)
                        and var_branch_id in
                        (
                            tmp.company_id,
                            tmp.office_id,
                            tmp.agency_id,
                            tmp.unit_id
                        )
                ) outl
                left join
                (
                    select code.code_code position_code,
                        code.code_value position_name
                    from ams.cla_codes code
                    where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                        and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                        and trunc(valDate, 'MM')
                            between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                            and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
                ) pos
                    on pos.position_code = outl.position_code

                union all
                select
                    det.outlet_ams_id,
                    det.outlet_name,
                    det.company_name,
                    det.office_name,
                    det.agency_name,
                    det.unit_name,
                    det.position_name,
                    det.effective_date,
                    det.terminative_date,
                    det.mnea_data_date,
                    nvl(det.mnea_period_na_qty, 0) mnea_period_na_qty,
                    det.mnea_period_fyp,
                    det.mnea_period_asmt,
                    det.mnea_period_month_qty,
                    det.mnea_period_fyc,
                    det.mnea_comp_ratio,
                    det.mnea_comp_money,
                    det.type_of_data
                from
                (
                    select
                        tmp.outlet_ams_id
                    from ams.la_comp_mmxiii_mnea tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.mnea_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnea_be_paid in (
                            AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES,
                            AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_NO)
                        and var_branch_id in
                        (
                            tmp.company_id,
                            tmp.office_id,
                            tmp.agency_id,
                            tmp.unit_id
                        )
                ) outl
                join
                (
                    select
                        tmp.outlet_ams_id,
                        tmp.outlet_name,
                        tmp.company_name,
                        tmp.office_name,
                        tmp.agency_name,
                        tmp.unit_name,
                        null position_name,
                        null effective_date,
                        null terminative_date,
                        tmp.mnea_data_date,
                        tmp.mnea_period_na_qty,
                        tmp.mnea_period_fyp,
                        tmp.mnea_period_asmt,
                        null mnea_period_month_qty,
                        tmp.mnea_period_fyc,
                        tmp.mnea_comp_ratio,
                        tmp.mnea_comp_money,
                        1 type_of_data
                    from ams.la_comp_mmxiii_mnea tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.mnea_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnea_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_DTL
                        and var_branch_id in
                        (
                            tmp.company_id,
                            tmp.office_id,
                            tmp.agency_id,
                            tmp.unit_id
                        )
                ) det
                    on det.outlet_ams_id = outl.outlet_ams_id
            ) res
            order by
                nlssort(res.company_name, 'nls_sort=Vietnamese'),
                nlssort(res.office_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese'),
                res.type_of_data,
                res.mnea_data_date;
         elsif var_branch_id = 0 then
            open row_records for
            select
                case
                    when res.type_of_data = 0 then
                        rank() over (
                            partition by res.type_of_data
                            order by nlssort(res.company_name, 'nls_sort=Vietnamese'),
                                nlssort(res.agency_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.unit_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese')
                        )
                    end noid,
                case
                    when res.type_of_data = 0 then
                        res.company_name
                    end company_name,
                case
                    when res.type_of_data = 0 then
                        res.office_name
                    end office_name,
                case
                    when res.type_of_data = 0 then
                        res.agency_name
                    end agency_name,
                case
                    when res.type_of_data = 0  then
                        res.unit_name
                    end unit_name,
                case
                    when res.type_of_data = 0  then
                        res.outlet_ams_id
                    end outlet_ams_id,
                case
                    when res.type_of_data = 0  then
                        res.outlet_name
                    end outlet_name,
                res.position_name,
                to_char(res.effective_date, 'DD/MM/YYYY') effective_date,
                to_char(res.terminative_date, 'DD/MM/YYYY') terminative_date,
                to_char(res.mnea_data_date, 'DD/MM/YYYY') mnea_data_date,
                res.mnea_period_na_qty,
                res.mnea_period_fyp,
                case
                    when res.type_of_data = 0  then
                        res.mnea_period_month_qty
                    when res.type_of_data = 1  then
                        res.mnea_period_asmt
                    end mnea_period_month_qty,
                res.mnea_period_fyc,
                res.mnea_comp_ratio,
                res.mnea_comp_money,
                case
                    when res.type_of_data = 0 then
                        AMS_MODL_COMP_MMXIII_REPORT.MNEA_DATA_GENR
                    when res.type_of_data = 1 then
                        AMS_MODL_COMP_MMXIII_REPORT.MNEA_DATA_MONT
                    end type_of_data
            from
            (
                select /*+ CARDINALITY(outl, 100)*/
                    outl.outlet_ams_id,
                    outl.outlet_name,
                    outl.company_name,
                    outl.office_name,
                    outl.agency_name,
                    outl.unit_name,
                    pos.position_name,
                    outl.effective_date,
                    outl.terminative_date,
                    outl.mnea_data_date,
                    outl.mnea_period_na_qty,
                    null mnea_period_fyp,
                    outl.mnea_period_asmt,
                    outl.mnea_period_month_qty,
                    outl.mnea_period_fyc,
                    outl.mnea_comp_ratio,
                    outl.mnea_comp_money,
                    0 type_of_data
                from
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.outlet_name,
                        tmp.company_name,
                        tmp.office_name,
                        tmp.agency_name,
                        tmp.unit_name,
                        tmp.effective_date,
                        tmp.terminative_date,
                        tmp.position_code,
                        tmp.mnea_data_date,
                        tmp.mnea_period_na_qty,
                        tmp.mnea_period_fyp,
                        tmp.mnea_period_asmt,
                        tmp.mnea_period_month_qty,
                        tmp.mnea_period_fyc,
                        tmp.mnea_comp_ratio,
                        tmp.mnea_comp_money
                    from ams.la_comp_mmxiii_mnea tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.mnea_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnea_be_paid in (
                            AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES,
                            AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_NO)
                ) outl
                left join
                (
                    select code.code_code position_code,
                        code.code_value position_name
                    from ams.cla_codes code
                    where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                        and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                        and trunc(valDate, 'MM')
                            between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                            and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
                ) pos
                    on pos.position_code = outl.position_code

                union all
                select
                    det.outlet_ams_id,
                    det.outlet_name,
                    det.company_name,
                    det.office_name,
                    det.agency_name,
                    det.unit_name,
                    det.position_name,
                    det.effective_date,
                    det.terminative_date,
                    det.mnea_data_date,
                    nvl(det.mnea_period_na_qty, 0) mnea_period_na_qty,
                    det.mnea_period_fyp,
                    det.mnea_period_asmt,
                    det.mnea_period_month_qty,
                    det.mnea_period_fyc,
                    det.mnea_comp_ratio,
                    det.mnea_comp_money,
                    det.type_of_data
                from
                (
                    select
                        tmp.outlet_ams_id
                    from ams.la_comp_mmxiii_mnea tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.mnea_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnea_be_paid in (
                            AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES,
                            AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_NO)
                ) outl
                join
                (
                    select
                        tmp.outlet_ams_id,
                        tmp.outlet_name,
                        tmp.company_name,
                        tmp.office_name,
                        tmp.agency_name,
                        tmp.unit_name,
                        null position_name,
                        null effective_date,
                        null terminative_date,
                        tmp.mnea_data_date,
                        tmp.mnea_period_na_qty,
                        tmp.mnea_period_fyp,
                        tmp.mnea_period_asmt,
                        null mnea_period_month_qty,
                        tmp.mnea_period_fyc,
                        tmp.mnea_comp_ratio,
                        tmp.mnea_comp_money,
                        1 type_of_data
                    from ams.la_comp_mmxiii_mnea tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.mnea_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnea_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_DTL
                ) det
                    on det.outlet_ams_id = outl.outlet_ams_id
            ) res
            order by
                nlssort(res.company_name, 'nls_sort=Vietnamese'),
                nlssort(res.office_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese'),
                res.type_of_data,
                res.mnea_data_date;
        end if;
    end;

    /*
      Update:
      Version: 1.1
      Nguoi thay doi: Vu Duc Thong
      Ngay thay doi: 11/07/2013
      Noi dung: Hien thi them chi tiet cac nhom ko phai la nhom cap 2 tro len
    */
    procedure mmxiii_get_mnea_am01(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor)
    is
        var_branch_id number(10) := nvl(valBranchID, 0);
        var_agent_id number(10) := nvl(valAgentID, 0);
        var_Date date := valDate;
    begin
        if valDate > AMS_MODL_COMP_MMXIII_REPORT.MNEA_DATE_END then
           var_Date := AMS_MODL_COMP_MMXIII_REPORT.MNEA_DATE_END;
        end if;

        if var_agent_id <> 0 then
            open row_records for
            select
                case
                    when res.type_of_data = 0 then
                        rank() over (
                            partition by res.type_of_data
                            order by nlssort(res.company_name, 'nls_sort=Vietnamese'),
                                nlssort(res.agency_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese')
                        )
                    end noid,
                case
                    when res.type_of_data = 0 then
                        res.company_name
                    end company_name,
                case
                    when res.type_of_data = 0 then
                        res.agency_name
                    end agency_name,
                case
                    when res.type_of_data = 0  then
                        res.outlet_ams_id
                    end outlet_ams_id,
                case
                    when res.type_of_data = 0  then
                        res.outlet_name
                    end outlet_name,
                res.position_name,
                case
                    when res.type_of_data = 0  then
                        to_char(res.effective_date, 'DD/MM/YYYY')
                    end effective_date,
                case
                    when res.type_of_data = 0  then
                        to_char(res.terminative_date, 'DD/MM/YYYY')
                    end terminative_date,
                case
                    when res.type_of_data = 0  then
                        res.position_date
                    end position_date,
                case
                    when res.type_of_data = 1  then
                        res.um_mnea_period_fyp
                    when res.type_of_data = 0  then
                        res.mnea_period_fyp
                    end mnea_period_fyp,
                case
                    when res.type_of_data = 1  then
                        res.um_outlet_ams_id
                    end um_outlet_ams_id,
                case
                    when res.type_of_data = 1  then
                        res.um_outlet_name
                    end um_outlet_name,
                case
                    when res.type_of_data = 1  then
                        res.um_unit_name
                    end um_unit_name,
                case
                    when res.type_of_data = 1  then
                        res.um_mnea_comp_money
                    when res.type_of_data = 0  then
                        res.mnea_eaum_money
                    end mnea_um_comp_money,
                case
                    when res.type_of_data = 0  then
                        res.mnea_comp_ratio
                    end mnea_comp_ratio,
                case
                    when res.type_of_data = 0  then
                        res.mnea_comp_money
                    end mnea_comp_money,
                case
                    when res.type_of_data = 0 then
                        AMS_MODL_COMP_MMXIII_REPORT.MNEA_DATA_GENR
                    when res.type_of_data = 1 then
                        AMS_MODL_COMP_MMXIII_REPORT.MNEA_DATA_DETL
                    end type_of_data
            from
            (
                select
                    outl.outlet_id,
                    outl.outlet_ams_id,
                    outl.outlet_name,
                    outl.company_name,
                    outl.office_name,
                    outl.agency_name,
                    outl.effective_date,
                    outl.terminative_date,
                    pos.position_name,
                    outl.position_date,
                    outl.mnea_period_fyp,
                    --cac truong nhom o day
                    null um_outlet_ams_id,
                    null um_outlet_name,
                    null um_unit_name,
                    null um_mnea_comp_money,
                    /*FYP chi tiet truong nhom*/
                    null um_mnea_period_fyp,
                    outl.mnea_eaum_money,
                    outl.mnea_comp_ratio,
                    outl.mnea_comp_money,
                    0 type_of_data
                from
                (
                    select
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.outlet_name,
                        tmp.company_name,
                        tmp.office_name,
                        tmp.agency_ams_id,
                        tmp.agency_name,
                        tmp.effective_date,
                        tmp.terminative_date,
                        tmp.position_code,
                        tmp.position_date,
                        tmp.mnea_period_fyp,
                        tmp.mnea_eaum_money,
                        tmp.mnea_comp_ratio,
                        tmp.mnea_comp_money,
                        1 type_of_data
                    from ams.la_comp_mmxiii_mnea_am tmp
                    where tmp.record_date = trunc(var_Date, 'MM')
                        and tmp.mnea_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnea_be_paid in (
                            AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES,
                            AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_NO)
                        and tmp.outlet_id = var_agent_id
                ) outl
                left join
                (
                    select code.code_code position_code,
                        code.code_value position_name
                    from ams.cla_codes code
                    where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                        and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                        and trunc(var_Date, 'MM')
                            between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                            and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
                ) pos
                    on pos.position_code = outl.position_code

                union all

                select
                    outl.outlet_id,
                    outl.outlet_ams_id,
                    outl.outlet_name,
                    outl.company_name,
                    outl.office_name,
                    outl.agency_name,
                    outl.effective_date,
                    outl.terminative_date,
                    null position_name,
                    outl.position_date,
                    outl.mnea_period_fyp,
                    --cac truong nhom o day
                    um.outlet_ams_id um_outlet_ams_id,
                    um.outlet_name um_outlet_name,
                    um.unit_name um_unit_name,
                    um.mnea_comp_money um_mnea_comp_money,
                    /*FYP chi tiet truong nhom*/
                    um.um_mnea_period_fyp um_mnea_period_fyp,
                    outl.mnea_eaum_money,
                    outl.mnea_comp_ratio,
                    outl.mnea_comp_money,
                    1 type_of_data
                from
                (
                    select
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.outlet_name,
                        tmp.company_name,
                        tmp.office_name,
                        tmp.agency_ams_id,
                        tmp.agency_name,
                        tmp.effective_date,
                        tmp.terminative_date,
                        tmp.position_code,
                        tmp.position_date,
                        tmp.mnea_period_fyp,
                        tmp.mnea_eaum_money,
                        tmp.mnea_comp_ratio,
                        tmp.mnea_comp_money
                    from ams.la_comp_mmxiii_mnea_am tmp
                    where tmp.record_date = trunc(var_Date, 'MM')
                        and tmp.mnea_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnea_be_paid in (
                            AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES,
                            AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_NO)
                        and tmp.outlet_id = var_agent_id
                ) outl
                left join
                (
                    select
                         a.outlet_id,
                         a.outlet_ams_id,
                         a.outlet_name,
                         a.agency_ams_id,
                         a.unit_name,
                         a.mnea_comp_money,
                         b.um_mnea_period_fyp um_mnea_period_fyp
                    from
                        (
                           select
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.outlet_name,
                        tmp.agency_ams_id,
                                nvl(tmp.unit_ams_id, 'A') unit_ams_id,
                        tmp.unit_name,
                        --chinhlk 28/11/2013 sua lai de doi voi truong ban thi khong hien thi thuong phat trien nhom moi vao
                        case when tmp.position_code = AMS_MODL_COMP_MMXIII_REPORT.COMP_CODE_MMXIII_CV04 then null
                            else tmp.mnea_comp_money
                        end mnea_comp_money,
                        --tmp.mnea_comp_money,
                                /*FYP CT*/
                                tmp.mnea_period_fyp um_mnea_period_fyp
                    from ams.la_comp_mmxiii_mnea tmp
                    where tmp.record_date = trunc(var_Date, 'MM')
                        and tmp.mnea_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnea_be_paid in (
                            AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES,
                            AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_NO)
                        and tmp.agency_ams_id is not null
                        and (tmp.unit_ams_id not in ( select distinct de.unit_ams_id
                                                     from ams.la_comp_mmxiii_mnea_am_detail de
                                                     where de.record_date = trunc(var_Date, 'MM')
                                                        and de.mnea_unit_level > 1)
                              or tmp.unit_ams_id is null)
                           ) a
                           left join
                           (
                             select
                                  amde.agency_ams_id,
                                  nvl(amde.unit_ams_id, 'A') unit_ams_id,
                                  sum(amde.mnea_period_fyp_calc) um_mnea_period_fyp
                              from ams.la_comp_mmxiii_mnea_am_detail amde
                              where amde.record_date between trunc(var_Date, 'YYYY') and trunc(var_Date, 'MM')
                                  and amde.mnea_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                                  and amde.mnea_unit_level = 1
                                  and amde.agency_ams_id is not null
                              group by amde.agency_ams_id, amde.unit_ams_id
                           ) b
                            on a.unit_ams_id = b.unit_ams_id
                            and a.agency_ams_id = b.agency_ams_id
                ) um
                    on um.agency_ams_id = outl.agency_ams_id
            ) res
            order by
                nlssort(res.company_name, 'nls_sort=Vietnamese'),
                nlssort(res.office_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.agency_name, 'nls_sort=Vietnamese') nulls first,
                res.type_of_data,
                nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese'),
                nlssort(res.um_outlet_name, 'nls_sort=Vietnamese');
       elsif var_branch_id <> 0 then

            open row_records for
            select
                case
                    when res.type_of_data = 0 then
                        rank() over (
                            partition by res.type_of_data
                            order by nlssort(res.company_name, 'nls_sort=Vietnamese'),
                                nlssort(res.agency_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese')
                        )
                    end noid,
                case
                    when res.type_of_data = 0 then
                        res.company_name
                    end company_name,
                case
                    when res.type_of_data = 0 then
                        res.agency_name
                    end agency_name,
                case
                    when res.type_of_data = 0  then
                        res.outlet_ams_id
                    end outlet_ams_id,
                case
                    when res.type_of_data = 0  then
                        res.outlet_name
                    end outlet_name,
                res.position_name,
                case
                    when res.type_of_data = 0  then
                        to_char(res.effective_date, 'DD/MM/YYYY')
                    end effective_date,
                case
                    when res.type_of_data = 0  then
                        to_char(res.terminative_date, 'DD/MM/YYYY')
                    end terminative_date,
                case
                    when res.type_of_data = 0  then
                        res.position_date
                    end position_date,
                case
                    when res.type_of_data = 1  then
                        res.um_mnea_period_fyp
                    when res.type_of_data = 0  then
                        res.mnea_period_fyp
                    end mnea_period_fyp,
                case
                    when res.type_of_data = 1  then
                        res.um_outlet_ams_id
                    end um_outlet_ams_id,
                case
                    when res.type_of_data = 1  then
                        res.um_outlet_name
                    end um_outlet_name,
                case
                    when res.type_of_data = 1  then
                        res.um_unit_name
                    end um_unit_name,
                case
                    when res.type_of_data = 1  then
                        res.um_mnea_comp_money
                    when res.type_of_data = 0  then
                        res.mnea_eaum_money
                    end mnea_um_comp_money,
                case
                    when res.type_of_data = 0  then
                        res.mnea_comp_ratio
                    end mnea_comp_ratio,
                case
                    when res.type_of_data = 0  then
                        res.mnea_comp_money
                    end mnea_comp_money,
                case
                    when res.type_of_data = 0 then
                        AMS_MODL_COMP_MMXIII_REPORT.MNEA_DATA_GENR
                    when res.type_of_data = 1 then
                        AMS_MODL_COMP_MMXIII_REPORT.MNEA_DATA_DETL
                    end type_of_data
            from
            (
                select
                    outl.outlet_id,
                    outl.outlet_ams_id,
                    outl.outlet_name,
                    outl.company_name,
                    outl.office_name,
                    outl.agency_name,
                    outl.effective_date,
                    outl.terminative_date,
                    pos.position_name,
                    outl.position_date,
                    outl.mnea_period_fyp,
                    --cac truong nhom o day
                    null um_outlet_ams_id,
                    null um_outlet_name,
                    null um_unit_name,
                    null um_mnea_comp_money,
                    /*FYP chi tiet truong nhom*/
                    null um_mnea_period_fyp,
                    outl.mnea_eaum_money,
                    outl.mnea_comp_ratio,
                    outl.mnea_comp_money,
                    0 type_of_data
                from
                (
                    select
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.outlet_name,
                        tmp.company_name,
                        tmp.office_name,
                        tmp.agency_ams_id,
                        tmp.agency_name,
                        tmp.effective_date,
                        tmp.terminative_date,
                        tmp.position_code,
                        tmp.position_date,
                        tmp.mnea_period_fyp,
                        tmp.mnea_eaum_money,
                        tmp.mnea_comp_ratio,
                        tmp.mnea_comp_money,
                        1 type_of_data
                    from ams.la_comp_mmxiii_mnea_am tmp
                    where tmp.record_date = trunc(var_Date, 'MM')
                        and tmp.mnea_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnea_be_paid in (
                            AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES,
                            AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_NO)
                        and var_branch_id in
                        (
                            tmp.company_id,
                            tmp.office_id,
                            tmp.agency_id
                        )
                ) outl
                left join
                (
                    select code.code_code position_code,
                        code.code_value position_name
                    from ams.cla_codes code
                    where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                        and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                        and trunc(var_Date, 'MM')
                            between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                            and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
                ) pos
                    on pos.position_code = outl.position_code

                union all

                select
                    outl.outlet_id,
                    outl.outlet_ams_id,
                    outl.outlet_name,
                    outl.company_name,
                    outl.office_name,
                    outl.agency_name,
                    outl.effective_date,
                    outl.terminative_date,
                    null position_name,
                    outl.position_date,
                    outl.mnea_period_fyp,
                    --cac truong nhom o day
                    um.outlet_ams_id um_outlet_ams_id,
                    um.outlet_name um_outlet_name,
                    um.unit_name um_unit_name,
                    um.mnea_comp_money um_mnea_comp_money,
                    /*FYP chi tiet truong nhom*/
                    um.um_mnea_period_fyp um_mnea_period_fyp,
                    outl.mnea_eaum_money,
                    outl.mnea_comp_ratio,
                    outl.mnea_comp_money,
                    1 type_of_data
                from
                (
                    select
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.outlet_name,
                        tmp.company_name,
                        tmp.office_name,
                        tmp.agency_ams_id,
                        tmp.agency_name,
                        tmp.effective_date,
                        tmp.terminative_date,
                        tmp.position_code,
                        tmp.position_date,
                        tmp.mnea_period_fyp,
                        tmp.mnea_eaum_money,
                        tmp.mnea_comp_ratio,
                        tmp.mnea_comp_money
                    from ams.la_comp_mmxiii_mnea_am tmp
                    where tmp.record_date = trunc(var_Date, 'MM')
                        and tmp.mnea_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnea_be_paid in (
                            AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES,
                            AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_NO)
                        and var_branch_id in
                        (
                            tmp.company_id,
                            tmp.office_id,
                            tmp.agency_id
                        )
                ) outl
                left join
                (
                    select
                         a.outlet_id,
                         a.outlet_ams_id,
                         a.outlet_name,
                         a.agency_ams_id,
                         a.unit_name,
                         a.mnea_comp_money,
                         b.um_mnea_period_fyp um_mnea_period_fyp
                    from
                        (
                           select
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.outlet_name,
                        tmp.agency_ams_id,
                                nvl(tmp.unit_ams_id, 'A') unit_ams_id,
                        tmp.unit_name,
                        --chinhlk 28/11/2013 sua lai de doi voi truong ban thi khong hien thi thuong phat trien nhom moi vao
                        case when tmp.position_code = AMS_MODL_COMP_MMXIII_REPORT.COMP_CODE_MMXIII_CV04 then null
                            else tmp.mnea_comp_money
                        end mnea_comp_money,
                        --tmp.mnea_comp_money,
                                /*FYP CT*/
                                tmp.mnea_period_fyp um_mnea_period_fyp
                    from ams.la_comp_mmxiii_mnea tmp
                    where tmp.record_date = trunc(var_Date, 'MM')
                        and tmp.mnea_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnea_be_paid in (
                            AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES,
                            AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_NO)
                        and tmp.agency_ams_id is not null
                        and (tmp.unit_ams_id not in ( select distinct de.unit_ams_id
                                                     from ams.la_comp_mmxiii_mnea_am_detail de
                                                     where de.record_date = trunc(var_Date, 'MM')
                                                        and de.mnea_unit_level > 1)
                              or tmp.unit_ams_id is null)
                           ) a
                           left join
                           (
                             select
                                  amde.agency_ams_id,
                                  nvl(amde.unit_ams_id, 'A') unit_ams_id,
                                  sum(amde.mnea_period_fyp_calc) um_mnea_period_fyp
                              from ams.la_comp_mmxiii_mnea_am_detail amde
                              where amde.record_date between trunc(var_Date, 'YYYY') and trunc(var_Date, 'MM')
                                  and amde.mnea_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                                  and amde.mnea_unit_level = 1
                                  and amde.agency_ams_id is not null
                              group by amde.agency_ams_id, amde.unit_ams_id
                           ) b
                            on a.unit_ams_id = b.unit_ams_id
                            and a.agency_ams_id = b.agency_ams_id
                ) um
                    on um.agency_ams_id = outl.agency_ams_id
            ) res
            order by
                nlssort(res.company_name, 'nls_sort=Vietnamese'),
                nlssort(res.office_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.agency_name, 'nls_sort=Vietnamese') nulls first,
                res.type_of_data,
                nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese'),
                nlssort(res.um_outlet_name, 'nls_sort=Vietnamese');
       elsif var_branch_id = 0 then
            open row_records for
            select
                case
                    when res.type_of_data = 0 then
                        rank() over (
                            partition by res.type_of_data
                            order by nlssort(res.company_name, 'nls_sort=Vietnamese'),
                                nlssort(res.agency_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese')
                        )
                    end noid,
                case
                    when res.type_of_data = 0 then
                        res.company_name
                    end company_name,
                case
                    when res.type_of_data = 0 then
                        res.agency_name
                    end agency_name,
                case
                    when res.type_of_data = 0  then
                        res.outlet_ams_id
                    end outlet_ams_id,
                case
                    when res.type_of_data = 0  then
                        res.outlet_name
                    end outlet_name,
                res.position_name,
                case
                    when res.type_of_data = 0  then
                        to_char(res.effective_date, 'DD/MM/YYYY')
                    end effective_date,
                case
                    when res.type_of_data = 0  then
                        to_char(res.terminative_date, 'DD/MM/YYYY')
                    end terminative_date,
                case
                    when res.type_of_data = 0  then
                        res.position_date
                    end position_date,
                case
                    when res.type_of_data = 1  then
                        res.um_mnea_period_fyp
                    when res.type_of_data = 0  then
                        res.mnea_period_fyp
                    end mnea_period_fyp,
                case
                    when res.type_of_data = 1  then
                        res.um_outlet_ams_id
                    end um_outlet_ams_id,
                case
                    when res.type_of_data = 1  then
                        res.um_outlet_name
                    end um_outlet_name,
                case
                    when res.type_of_data = 1  then
                        res.um_unit_name
                    end um_unit_name,
                case
                    when res.type_of_data = 1  then
                        res.um_mnea_comp_money
                    when res.type_of_data = 0  then
                        res.mnea_eaum_money
                    end mnea_um_comp_money,
                case
                    when res.type_of_data = 0  then
                        res.mnea_comp_ratio
                    end mnea_comp_ratio,
                case
                    when res.type_of_data = 0  then
                        res.mnea_comp_money
                    end mnea_comp_money,
                case
                    when res.type_of_data = 0 then
                        AMS_MODL_COMP_MMXIII_REPORT.MNEA_DATA_GENR
                    when res.type_of_data = 1 then
                        AMS_MODL_COMP_MMXIII_REPORT.MNEA_DATA_DETL
                    end type_of_data
            from
            (
                select
                    outl.outlet_id,
                    outl.outlet_ams_id,
                    outl.outlet_name,
                    outl.company_name,
                    outl.office_name,
                    outl.agency_name,
                    outl.effective_date,
                    outl.terminative_date,
                    pos.position_name,
                    outl.position_date,
                    outl.mnea_period_fyp,
                    --cac truong nhom o day
                    null um_outlet_ams_id,
                    null um_outlet_name,
                    null um_unit_name,
                    null um_mnea_comp_money,
                    /*FYP chi tiet truong nhom*/
                    null um_mnea_period_fyp,
                    outl.mnea_eaum_money,
                    outl.mnea_comp_ratio,
                    outl.mnea_comp_money,
                    0 type_of_data
                from
                (
                    select
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.outlet_name,
                        tmp.company_name,
                        tmp.office_name,
                        tmp.agency_ams_id,
                        tmp.agency_name,
                        tmp.effective_date,
                        tmp.terminative_date,
                        tmp.position_code,
                        tmp.position_date,
                        tmp.mnea_eaum_money,
                        tmp.mnea_comp_ratio,
                        tmp.mnea_comp_money,
                        /*FYP chi tiet truong nhom*/
                        tmp.mnea_period_fyp,
                        1 type_of_data
                    from ams.la_comp_mmxiii_mnea_am tmp
                    where tmp.record_date = trunc(var_Date, 'MM')
                        and tmp.mnea_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnea_be_paid in (
                            AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES,
                            AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_NO)
                ) outl
                left join
                (
                    select code.code_code position_code,
                        code.code_value position_name
                    from ams.cla_codes code
                    where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                        and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                        and trunc(var_Date, 'MM')
                            between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                            and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
                ) pos
                    on pos.position_code = outl.position_code

                union all

                select
                    outl.outlet_id,
                    outl.outlet_ams_id,
                    outl.outlet_name,
                    outl.company_name,
                    outl.office_name,
                    outl.agency_name,
                    outl.effective_date,
                    outl.terminative_date,
                    null position_name,
                    outl.position_date,
                    outl.mnea_period_fyp,
                    --cac truong nhom o day
                    um.outlet_ams_id um_outlet_ams_id,
                    um.outlet_name um_outlet_name,
                    um.unit_name um_unit_name,
                    um.mnea_comp_money um_mnea_comp_money,
                    /*FYP chi tiet truong nhom*/
                    um.um_mnea_period_fyp um_mnea_period_fyp,
                    outl.mnea_eaum_money,
                    outl.mnea_comp_ratio,
                    outl.mnea_comp_money,
                    1 type_of_data
                from
                (
                    select
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.outlet_name,
                        tmp.company_name,
                        tmp.office_name,
                        tmp.agency_ams_id,
                        tmp.agency_name,
                        tmp.effective_date,
                        tmp.terminative_date,
                        tmp.position_code,
                        tmp.position_date,
                        tmp.mnea_period_fyp,
                        tmp.mnea_eaum_money,
                        tmp.mnea_comp_ratio,
                        tmp.mnea_comp_money
                    from ams.la_comp_mmxiii_mnea_am tmp
                    where tmp.record_date = trunc(var_Date, 'MM')
                        and tmp.mnea_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnea_be_paid in (
                            AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES,
                            AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_NO)
                ) outl
                left join
                (
                    select
                         a.outlet_id,
                         a.outlet_ams_id,
                         a.outlet_name,
                         a.agency_ams_id,
                         a.unit_name,
                         a.mnea_comp_money,
                         b.um_mnea_period_fyp um_mnea_period_fyp
                    from
                        (
                           select
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.outlet_name,
                        tmp.agency_ams_id,
                                nvl(tmp.unit_ams_id, 'A') unit_ams_id,
                        tmp.unit_name,
                        --chinhlk 28/11/2013 sua lai de doi voi truong ban thi khong hien thi thuong phat trien nhom moi vao
                        case when tmp.position_code = AMS_MODL_COMP_MMXIII_REPORT.COMP_CODE_MMXIII_CV04 then null
                            else tmp.mnea_comp_money
                        end mnea_comp_money,
                        --tmp.mnea_comp_money,
                                /*FYP CT*/
                                tmp.mnea_period_fyp um_mnea_period_fyp
                    from ams.la_comp_mmxiii_mnea tmp
                    where tmp.record_date = trunc(var_Date, 'MM')
                        and tmp.mnea_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnea_be_paid in (
                            AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES,
                            AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_NO)
                        and tmp.agency_ams_id is not null
                        and (tmp.unit_ams_id not in ( select distinct de.unit_ams_id
                                                     from ams.la_comp_mmxiii_mnea_am_detail de
                                                     where de.record_date = trunc(var_Date, 'MM')
                                                        and de.mnea_unit_level > 1)
                              or tmp.unit_ams_id is null)
                          ) a
                    left join
                           (
                             select
                                  amde.agency_ams_id,
                                  nvl(amde.unit_ams_id, 'A') unit_ams_id,
                                  sum(amde.mnea_period_fyp_calc) um_mnea_period_fyp
                              from ams.la_comp_mmxiii_mnea_am_detail amde
                              where amde.record_date between trunc(var_Date, 'YYYY') and trunc(var_Date, 'MM')
                                  and amde.mnea_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                                  and amde.mnea_unit_level = 1
                                  and amde.agency_ams_id is not null
                              group by amde.agency_ams_id, amde.unit_ams_id
                           ) b
                          on a.unit_ams_id = b.unit_ams_id
                          and a.agency_ams_id = b.agency_ams_id
                ) um
                    on um.agency_ams_id = outl.agency_ams_id
            ) res
            order by
                nlssort(res.company_name, 'nls_sort=Vietnamese'),
                nlssort(res.office_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.agency_name, 'nls_sort=Vietnamese') nulls first,
                res.type_of_data,
                nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese'),
                nlssort(res.um_outlet_name, 'nls_sort=Vietnamese');
       end if;
   end;

   procedure mmxiii_get_mnpu01(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor)
    is
        var_branch_id number(10) := nvl(valBranchID, 0);
        var_agent_id number(10) := nvl(valAgentID, 0);
    begin
        if var_agent_id <> 0 then
            open row_records for
                select /*+ CARDINALITY(outl, 100) CARDINALITY(pos, 100)*/
                    outl.outlet_ams_id,
                    outl.outlet_name,
                    outl.company_name,
                    outl.office_name,
                    outl.agency_name,
                    outl.unit_name,
                    to_char(outl.effective_date, 'DD/MM/YYYY') effective_date,
                    to_char(outl.terminative_date, 'DD/MM/YYYY') terminative_date,
                    pos.position_name,
                    to_char(outl.position_date, 'DD/MM/YYYY') position_date,
                    to_char(outl.mnpu_pum_prom_date, 'DD/MM/YYYY') mnpu_pum_prom_date,
                    to_char(outl.mnpu_um_prom_date, 'DD/MM/YYYY') mnpu_um_prom_date,
                    outl.mnpu_period_fyp,
                    outl.mnpu_time_of_challenge,
                    decode(outl.mnpu_cert_status, 1, 'X') mnpu_cert_status,
                    to_char(outl.mnpu_cert_date, 'DD/MM/YYYY') mnpu_cert_date,
                    outl.mnpu_cert_money,
                    outl.mnpu_comp_money,
                    outl.mnpu_total_money
                from
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_ams_id,
                        tmp.outlet_name,
                        tmp.company_name,
                        tmp.office_name,
                        tmp.agency_name,
                        tmp.unit_name,
                        tmp.effective_date,
                        tmp.terminative_date,
                        tmp.position_code,
                        tmp.position_date,
                        tmp.mnpu_pum_prom_date,
                        tmp.mnpu_um_prom_date,
                        tmp.mnpu_period_fyp,
                        tmp.mnpu_time_of_challenge,
                        tmp.mnpu_cert_status,
                        tmp.mnpu_cert_date,
                        tmp.mnpu_cert_money,
                        tmp.mnpu_comp_money,
                        tmp.mnpu_total_money
                    from ams.la_comp_mmxiii_mnpu tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.mnpu_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnpu_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                        and tmp.outlet_id = var_agent_id
                ) outl
                left join
                (
                    select code.code_code position_code,
                        code.code_value position_name
                    from ams.cla_codes code
                    where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                        and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                        and trunc(valDate, 'MM')
                            between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                            and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
                ) pos
                    on pos.position_code = outl.position_code
                order by
                    nlssort(outl.company_name, 'nls_sort=Vietnamese'),
                    nlssort(outl.office_name, 'nls_sort=Vietnamese') nulls first,
                    nlssort(outl.agency_name, 'nls_sort=Vietnamese') nulls first,
                    nlssort(outl.unit_name, 'nls_sort=Vietnamese') nulls first,
                    nlssort(outl.outlet_name, 'nls_sort=Vietnamese'),
                    nlssort(outl.outlet_ams_id, 'nls_sort=Vietnamese');
       elsif var_branch_id <> 0 then
            open row_records for
                select /*+ CARDINALITY(outl, 100) CARDINALITY(pos, 100)*/
                    outl.outlet_ams_id,
                    outl.outlet_name,
                    outl.company_name,
                    outl.office_name,
                    outl.agency_name,
                    outl.unit_name,
                    to_char(outl.effective_date, 'DD/MM/YYYY') effective_date,
                    to_char(outl.terminative_date, 'DD/MM/YYYY') terminative_date,
                    pos.position_name,
                    to_char(outl.position_date, 'DD/MM/YYYY') position_date,
                    to_char(outl.mnpu_pum_prom_date, 'DD/MM/YYYY') mnpu_pum_prom_date,
                    to_char(outl.mnpu_um_prom_date, 'DD/MM/YYYY') mnpu_um_prom_date,
                    outl.mnpu_period_fyp,
                    outl.mnpu_time_of_challenge,
                    decode(outl.mnpu_cert_status, 1, 'X') mnpu_cert_status,
                    to_char(outl.mnpu_cert_date, 'DD/MM/YYYY') mnpu_cert_date,
                    outl.mnpu_cert_money,
                    outl.mnpu_comp_money,
                    outl.mnpu_total_money
                from
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_ams_id,
                        tmp.outlet_name,
                        tmp.company_name,
                        tmp.office_name,
                        tmp.agency_name,
                        tmp.unit_name,
                        tmp.effective_date,
                        tmp.terminative_date,
                        tmp.position_code,
                        tmp.position_date,
                        tmp.mnpu_pum_prom_date,
                        tmp.mnpu_um_prom_date,
                        tmp.mnpu_period_fyp,
                        tmp.mnpu_time_of_challenge,
                        tmp.mnpu_cert_status,
                        tmp.mnpu_cert_date,
                        tmp.mnpu_cert_money,
                        tmp.mnpu_comp_money,
                        tmp.mnpu_total_money
                    from ams.la_comp_mmxiii_mnpu tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.mnpu_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnpu_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                        and var_branch_id in
                        (
                            tmp.company_id,
                            tmp.office_id,
                            tmp.agency_id,
                            tmp.unit_id
                        )
                ) outl
                left join
                (
                    select code.code_code position_code,
                        code.code_value position_name
                    from ams.cla_codes code
                    where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                        and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                        and trunc(valDate, 'MM')
                            between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                            and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
                ) pos
                    on pos.position_code = outl.position_code
                order by
                    nlssort(outl.company_name, 'nls_sort=Vietnamese'),
                    nlssort(outl.office_name, 'nls_sort=Vietnamese') nulls first,
                    nlssort(outl.agency_name, 'nls_sort=Vietnamese') nulls first,
                    nlssort(outl.unit_name, 'nls_sort=Vietnamese') nulls first,
                    nlssort(outl.outlet_name, 'nls_sort=Vietnamese'),
                    nlssort(outl.outlet_ams_id, 'nls_sort=Vietnamese');
       elsif var_branch_id = 0 then
            open row_records for
                select /*+ CARDINALITY(outl, 100) CARDINALITY(pos, 100)*/
                    outl.outlet_ams_id,
                    outl.outlet_name,
                    outl.company_name,
                    outl.office_name,
                    outl.agency_name,
                    outl.unit_name,
                    to_char(outl.effective_date, 'DD/MM/YYYY') effective_date,
                    to_char(outl.terminative_date, 'DD/MM/YYYY') terminative_date,
                    pos.position_name,
                    to_char(outl.position_date, 'DD/MM/YYYY') position_date,
                    to_char(outl.mnpu_pum_prom_date, 'DD/MM/YYYY') mnpu_pum_prom_date,
                    to_char(outl.mnpu_um_prom_date, 'DD/MM/YYYY') mnpu_um_prom_date,
                    outl.mnpu_period_fyp,
                    outl.mnpu_time_of_challenge,
                    decode(outl.mnpu_cert_status, 1, 'X') mnpu_cert_status,
                    to_char(outl.mnpu_cert_date, 'DD/MM/YYYY') mnpu_cert_date,
                    outl.mnpu_cert_money,
                    outl.mnpu_comp_money,
                    outl.mnpu_total_money
                from
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_ams_id,
                        tmp.outlet_name,
                        tmp.company_name,
                        tmp.office_name,
                        tmp.agency_name,
                        tmp.unit_name,
                        tmp.effective_date,
                        tmp.terminative_date,
                        tmp.position_code,
                        tmp.position_date,
                        tmp.mnpu_pum_prom_date,
                        tmp.mnpu_um_prom_date,
                        tmp.mnpu_period_fyp,
                        tmp.mnpu_time_of_challenge,
                        tmp.mnpu_cert_status,
                        tmp.mnpu_cert_date,
                        tmp.mnpu_cert_money,
                        tmp.mnpu_comp_money,
                        tmp.mnpu_total_money
                    from ams.la_comp_mmxiii_mnpu tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.mnpu_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnpu_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                ) outl
                left join
                (
                    select code.code_code position_code,
                        code.code_value position_name
                    from ams.cla_codes code
                    where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                        and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                        and trunc(valDate, 'MM')
                            between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                            and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
                ) pos
                    on pos.position_code = outl.position_code
                order by
                    nlssort(outl.company_name, 'nls_sort=Vietnamese'),
                    nlssort(outl.office_name, 'nls_sort=Vietnamese') nulls first,
                    nlssort(outl.agency_name, 'nls_sort=Vietnamese') nulls first,
                    nlssort(outl.unit_name, 'nls_sort=Vietnamese') nulls first,
                    nlssort(outl.outlet_name, 'nls_sort=Vietnamese'),
                    nlssort(outl.outlet_ams_id, 'nls_sort=Vietnamese');
        end if;
    end;

    procedure mmxiii_get_mnpu02(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor)
    is
        var_branch_id number(10) := nvl(valBranchID, 0);
        var_agent_id number(10) := nvl(valAgentID, 0);
    begin
        if var_agent_id <> 0 then
            open row_records for
            select
                case
                    when res.type_of_data = 0 then
                        rank() over (
                            partition by res.type_of_data
                            order by nlssort(res.company_name, 'nls_sort=Vietnamese'),
                                nlssort(res.agency_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.unit_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese')
                        )
                    end noid,
                case
                    when res.type_of_data = 0 then
                        res.company_name
                    end company_name,
                case
                    when res.type_of_data = 0 then
                        res.agency_name
                    end agency_name,
                case
                    when res.type_of_data = 0 then
                        res.office_name
                    end office_name,
                case
                    when res.type_of_data = 0  then
                        res.unit_name
                    end unit_name,
                case
                    when res.type_of_data = 0  then
                        res.outlet_ams_id
                    end outlet_ams_id,
                case
                    when res.type_of_data = 0  then
                        res.outlet_name
                    end outlet_name,
                case
                    when res.type_of_data = 0  then
                        res.position_name
                    end position_name,
                to_char(res.effective_date, 'DD/MM/YYYY') effective_date,
                to_char(res.terminative_date, 'DD/MM/YYYY') terminative_date,
                case
                    when res.type_of_data = 0  then
                        to_char(res.mnpu_pum_prom_date, 'DD/MM/YYYY')
                    end mnpu_pum_prom_date,
                case
                    when res.type_of_data = 0  then
                        to_char(res.mnpu_um_prom_date, 'DD/MM/YYYY')
                    end mnpu_um_prom_date,

              case
                    when res.type_of_data = 0  then
                        mnpu_time_of_challenge
                    end mnpu_time_of_challenge,
              to_char(res.mnpu_data_date, 'DD/MM/YYYY') mnpu_data_date,
              res.mnpu_period_fyp,
              case
                    when res.type_of_data = 0  then
                        mnpu_comp_money
                    end mnpu_comp_money,
                case
                    when res.type_of_data = 0 then
                        AMS_MODL_COMP_MMXIII_REPORT.MNPU_DATA_GENR
                    when res.type_of_data = 1 then
                        AMS_MODL_COMP_MMXIII_REPORT.MNPU_DATA_MONT
                    end type_of_data
            from
            (
                select
                    outl.outlet_id,
                    outl.outlet_ams_id,
                    outl.outlet_name,
                    outl.company_name,
                    outl.office_name,
                    outl.agency_name,
                    outl.unit_name,
                    outl.effective_date,
                    outl.terminative_date,
                    pos.position_name,
                    outl.mnpu_data_date,
                    outl.mnpu_pum_prom_date,
                    outl.mnpu_um_prom_date,
                    outl.mnpu_time_of_challenge,
                    outl.mnpu_period_fyp,
                    outl.mnpu_comp_money,
                    0 type_of_data
                from
                (
                    select
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.outlet_name,
                        tmp.company_name,
                        tmp.office_name,
                        tmp.agency_name,
                        tmp.unit_name,
                        tmp.effective_date,
                        tmp.terminative_date,
                        tmp.position_code,
                        tmp.mnpu_data_date,
                        tmp.mnpu_pum_prom_date,
                        tmp.mnpu_um_prom_date,
                        tmp.mnpu_time_of_challenge,
                        tmp.mnpu_period_fyp,
                        tmp.mnpu_comp_money
                    from ams.la_comp_mmxiii_mnpu_detail tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.mnpu_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnpu_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                        and tmp.outlet_id = var_agent_id
                ) outl
                left join
                (
                    select code.code_code position_code,
                        code.code_value position_name
                    from ams.cla_codes code
                    where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                        and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                        and trunc(valDate, 'MM')
                            between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                            and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
                ) pos
                    on pos.position_code = outl.position_code

                union all

                select
                    tmp.outlet_id,
                    tmp.outlet_ams_id,
                    tmp.outlet_name,
                    tmp.company_name,
                    tmp.office_name,
                    tmp.agency_name,
                    tmp.unit_name,
                    tmp.effective_date,
                    tmp.terminative_date,
                    null position_name,
                    tmp.mnpu_data_date,
                    null mnpu_pum_prom_date,
                    null mnpu_um_prom_date,
                    null mnpu_time_of_challenge,
                    tmp.mnpu_period_fyp,
                    null mnpu_comp_money,
                    1 type_of_data
                from ams.la_comp_mmxiii_mnpu_detail tmp
                where tmp.record_date = trunc(valDate, 'MM')
                    and tmp.mnpu_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                    and tmp.mnpu_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_DTL
                    and tmp.outlet_id = var_agent_id
            ) res
            order by
                nlssort(res.company_name, 'nls_sort=Vietnamese'),
                nlssort(res.agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese'),
                res.type_of_data,
                res.mnpu_data_date;
       elsif var_branch_id <> 0 then
            open row_records for
            select
                case
                    when res.type_of_data = 0 then
                        rank() over (
                            partition by res.type_of_data
                            order by nlssort(res.company_name, 'nls_sort=Vietnamese'),
                                nlssort(res.agency_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.unit_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese')
                        )
                    end noid,
                case
                    when res.type_of_data = 0 then
                        res.company_name
                    end company_name,
                case
                    when res.type_of_data = 0 then
                        res.agency_name
                    end agency_name,
                case
                    when res.type_of_data = 0 then
                        res.office_name
                    end office_name,
                case
                    when res.type_of_data = 0  then
                        res.unit_name
                    end unit_name,
                case
                    when res.type_of_data = 0  then
                        res.outlet_ams_id
                    end outlet_ams_id,
                case
                    when res.type_of_data = 0  then
                        res.outlet_name
                    end outlet_name,
                case
                    when res.type_of_data = 0  then
                        res.position_name
                    end position_name,
                to_char(res.effective_date, 'DD/MM/YYYY') effective_date,
                to_char(res.terminative_date, 'DD/MM/YYYY') terminative_date,
                case
                    when res.type_of_data = 0  then
                        to_char(res.mnpu_pum_prom_date, 'DD/MM/YYYY')
                    end mnpu_pum_prom_date,
                case
                    when res.type_of_data = 0  then
                        to_char(res.mnpu_um_prom_date, 'DD/MM/YYYY')
                    end mnpu_um_prom_date,

              case
                    when res.type_of_data = 0  then
                        mnpu_time_of_challenge
                    end mnpu_time_of_challenge,
              to_char(res.mnpu_data_date, 'DD/MM/YYYY') mnpu_data_date,
              res.mnpu_period_fyp,
              case
                    when res.type_of_data = 0  then
                        mnpu_comp_money
                    end mnpu_comp_money,
                case
                    when res.type_of_data = 0 then
                        AMS_MODL_COMP_MMXIII_REPORT.MNPU_DATA_GENR
                    when res.type_of_data = 1 then
                        AMS_MODL_COMP_MMXIII_REPORT.MNPU_DATA_MONT
                    end type_of_data
            from
            (
                select
                    outl.outlet_id,
                    outl.outlet_ams_id,
                    outl.outlet_name,
                    outl.company_name,
                    outl.office_name,
                    outl.agency_name,
                    outl.unit_name,
                    outl.effective_date,
                    outl.terminative_date,
                    pos.position_name,
                    outl.mnpu_data_date,
                    outl.mnpu_pum_prom_date,
                    outl.mnpu_um_prom_date,
                    outl.mnpu_time_of_challenge,
                    outl.mnpu_period_fyp,
                    outl.mnpu_comp_money,
                    0 type_of_data
                from
                (
                    select
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.outlet_name,
                        tmp.company_name,
                        tmp.office_name,
                        tmp.agency_name,
                        tmp.unit_name,
                        tmp.effective_date,
                        tmp.terminative_date,
                        tmp.position_code,
                        tmp.mnpu_data_date,
                        tmp.mnpu_pum_prom_date,
                        tmp.mnpu_um_prom_date,
                        tmp.mnpu_time_of_challenge,
                        tmp.mnpu_period_fyp,
                        tmp.mnpu_comp_money
                    from ams.la_comp_mmxiii_mnpu_detail tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.mnpu_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnpu_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                        and var_branch_id in
                        (
                            tmp.company_id,
                            tmp.office_id,
                            tmp.agency_id,
                            tmp.unit_id
                        )
                ) outl
                left join
                (
                    select code.code_code position_code,
                        code.code_value position_name
                    from ams.cla_codes code
                    where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                        and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                        and trunc(valDate, 'MM')
                            between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                            and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
                ) pos
                    on pos.position_code = outl.position_code

                union all

                select
                    tmp.outlet_id,
                    tmp.outlet_ams_id,
                    tmp.outlet_name,
                    tmp.company_name,
                    tmp.office_name,
                    tmp.agency_name,
                    tmp.unit_name,
                    tmp.effective_date,
                    tmp.terminative_date,
                    null position_name,
                    tmp.mnpu_data_date,
                    null mnpu_pum_prom_date,
                    null mnpu_um_prom_date,
                    null mnpu_time_of_challenge,
                    tmp.mnpu_period_fyp,
                    null mnpu_comp_money,
                    1 type_of_data
                from ams.la_comp_mmxiii_mnpu_detail tmp
                where tmp.record_date = trunc(valDate, 'MM')
                    and tmp.mnpu_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                    and tmp.mnpu_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_DTL
                    and var_branch_id in
                    (
                        tmp.company_id,
                        tmp.office_id,
                        tmp.agency_id,
                        tmp.unit_id
                    )
            ) res
            order by
                nlssort(res.company_name, 'nls_sort=Vietnamese'),
                nlssort(res.agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese'),
                res.type_of_data,
                res.mnpu_data_date;
       elsif var_branch_id = 0 then

            open row_records for
            select
                case
                    when res.type_of_data = 0 then
                        rank() over (
                            partition by res.type_of_data
                            order by nlssort(res.company_name, 'nls_sort=Vietnamese'),
                                nlssort(res.agency_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.unit_name, 'nls_sort=Vietnamese') nulls first,
                                nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese')
                        )
                    end noid,
                case
                    when res.type_of_data = 0 then
                        res.company_name
                    end company_name,
                case
                    when res.type_of_data = 0 then
                        res.agency_name
                    end agency_name,
                case
                    when res.type_of_data = 0 then
                        res.office_name
                    end office_name,
                case
                    when res.type_of_data = 0  then
                        res.unit_name
                    end unit_name,
                case
                    when res.type_of_data = 0  then
                        res.outlet_ams_id
                    end outlet_ams_id,
                case
                    when res.type_of_data = 0  then
                        res.outlet_name
                    end outlet_name,
                case
                    when res.type_of_data = 0  then
                        res.position_name
                    end position_name,
                to_char(res.effective_date, 'DD/MM/YYYY') effective_date,
                to_char(res.terminative_date, 'DD/MM/YYYY') terminative_date,
                case
                    when res.type_of_data = 0  then
                        to_char(res.mnpu_pum_prom_date, 'DD/MM/YYYY')
                    end mnpu_pum_prom_date,
                case
                    when res.type_of_data = 0  then
                        to_char(res.mnpu_um_prom_date, 'DD/MM/YYYY')
                    end mnpu_um_prom_date,

              case
                    when res.type_of_data = 0  then
                        mnpu_time_of_challenge
                    end mnpu_time_of_challenge,
              to_char(res.mnpu_data_date, 'DD/MM/YYYY') mnpu_data_date,
              res.mnpu_period_fyp,
              case
                    when res.type_of_data = 0  then
                        mnpu_comp_money
                    end mnpu_comp_money,
              case
                  when res.type_of_data = 0 then
                      AMS_MODL_COMP_MMXIII_REPORT.MNPU_DATA_GENR
                  when res.type_of_data = 1 then
                      AMS_MODL_COMP_MMXIII_REPORT.MNPU_DATA_MONT
                  end type_of_data
            from
            (
                select
                    outl.outlet_id,
                    outl.outlet_ams_id,
                    outl.outlet_name,
                    outl.company_name,
                    outl.office_name,
                    outl.agency_name,
                    outl.unit_name,
                    outl.effective_date,
                    outl.terminative_date,
                    pos.position_name,
                    outl.mnpu_data_date,
                    outl.mnpu_pum_prom_date,
                    outl.mnpu_um_prom_date,
                    outl.mnpu_time_of_challenge,
                    outl.mnpu_period_fyp,
                    outl.mnpu_comp_money,
                    0 type_of_data
                from
                (
                    select
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.outlet_name,
                        tmp.company_name,
                        tmp.office_name,
                        tmp.agency_name,
                        tmp.unit_name,
                        tmp.effective_date,
                        tmp.terminative_date,
                        tmp.position_code,
                        tmp.mnpu_data_date,
                        tmp.mnpu_pum_prom_date,
                        tmp.mnpu_um_prom_date,
                        tmp.mnpu_time_of_challenge,
                        tmp.mnpu_period_fyp,
                        tmp.mnpu_comp_money
                    from ams.la_comp_mmxiii_mnpu_detail tmp
                    where tmp.record_date = trunc(valDate, 'MM')
                        and tmp.mnpu_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                        and tmp.mnpu_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                ) outl
                left join
                (
                    select code.code_code position_code,
                        code.code_value position_name
                    from ams.cla_codes code
                    where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                        and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                        and trunc(valDate, 'MM')
                            between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                            and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
                ) pos
                    on pos.position_code = outl.position_code

                union all

                select
                    tmp.outlet_id,
                    tmp.outlet_ams_id,
                    tmp.outlet_name,
                    tmp.company_name,
                    tmp.office_name,
                    tmp.agency_name,
                    tmp.unit_name,
                    tmp.effective_date,
                    tmp.terminative_date,
                    null position_name,
                    tmp.mnpu_data_date,
                    null mnpu_pum_prom_date,
                    null mnpu_um_prom_date,
                    null mnpu_time_of_challenge,
                    tmp.mnpu_period_fyp,
                    null mnpu_comp_money,
                    1 type_of_data
                from ams.la_comp_mmxiii_mnpu_detail tmp
                where tmp.record_date = trunc(valDate, 'MM')
                    and tmp.mnpu_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                    and tmp.mnpu_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_DTL
            ) res
            order by
                nlssort(res.company_name, 'nls_sort=Vietnamese'),
                nlssort(res.agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese'),
                res.type_of_data,
                res.mnpu_data_date;
        end if;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 1/6/2013
        Version: 1.0
        Description: Thu tuc hien thi bao cao thanh toan tap trung cho phong TCKT
        Parameter:
            valDate [date] : Thang chay
            valBranchID [number] : Ma don vi tra cuu
            valAgentID [number] : Ma dai ly
            row_records [out sys_refcursor] : Du lieu tra ve
        Update:  Le Khac Chinh
            Version: 1.1
            Date Updated: 1/10/2013
            Note:  Fix lai chuong trinh theo yeu cau 116883
                      Bo cot thu lao Vinh danh tan nghiep thi phai chinh lai o cot tong cong
    */
    procedure mmxiii_get_center_comp(valDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor)
    is
        var_record_date date := trunc(valDate, 'MM');
        var_branch_id number(10) := nvl(valBranchID, 0);
        var_agent_id number(10) := nvl(valAgentID, 0);
        var_begin_year  date := trunc(valDate, 'YYYY');
    begin
        if var_agent_id <> 0 then
            open row_records for
            select /*+ CARDINALITY(comp, 100) CARDINALITY(agfa, 100) CARDINALITY(mnea, 100) CARDINALITY(mnea_am, 100) CARDINALITY(mnpu, 100) CARDINALITY(posi, 100)*/
                comp.outlet_ams_id,
                comp.info_outlet_name,
                comp.info_company_ams_id,
                comp.info_company_name,
                comp.info_agency_ams_id,
                comp.info_agency_name,
                comp.info_unit_ams_id,
                comp.info_unit_name,
                comp.info_position_code,
                to_char(comp.info_effective_date, 'DD/MM/YYYY') info_effective_date,
                to_char(comp.info_terminative_date, 'DD/MM/YYYY') info_terminative_date,
                nvl(posi.position_name, posi_cv.position_name) position_name,
                comp.ousl_comp_money,
                comp.oucl_comp_money,
                nvl(comp.ousl_comp_money, 0) + nvl(comp.oucl_comp_money, 0) comm_money,

                nvl(comp.nagm_comp_money, 0) + nvl(comp.comp_mmxii_nagm, 0)  nagm_comp_money,
                nvl(comp.agqr_comp_money, 0) + nvl(comp.mnqr_comp_money, 0) agqr_comp_money,
                case when to_char(var_record_date, 'MM') = '12' then
                  agfa.comp_money
                end agfa_comp_money,--thuong hoat dong deu
                comp.agem_comp_money, --thuong tuyen dung
                --thuong vinh danh tan nghiep
                comp.mnbs_comp_money,
                nvl(comp.mnnu_comp_money, 0) +  nvl(comp.comp_mmxii_mnnu, 0) mnnu_comp_money,
                nvl(comp.mnna_comp_money, 0)  + nvl(comp.comp_mmxii_mnna, 0) mnna_comp_money,
                --thuong gioi thieu dai ly moi
                comp.agin_comp_money,
                case when to_char(var_record_date, 'MM') = '12' then
                    nvl(mnea.comp_money, 0) + nvl(mnea_am.comp_money, 0)
                end mnea_comp_money,
                mnpu.comp_money mnpu_comp_money,--thuong vinh danh tan nghiep
                case when to_char(var_record_date, 'MM') = '12' then
                    nvl(comp.nagm_comp_money, 0) + nvl(comp.comp_mmxii_nagm, 0) +
                    nvl(comp.agqr_comp_money, 0) + nvl(comp.mnqr_comp_money, 0) +
                    nvl(agfa.comp_money, 0) +
                    nvl(comp.agem_comp_money, 0) +
                    nvl(comp.mnbs_comp_money, 0) +
                    nvl(comp.mnnu_comp_money, 0) +  nvl(comp.comp_mmxii_mnnu, 0) +
                    nvl(comp.mnna_comp_money, 0)  + nvl(comp.comp_mmxii_mnna, 0) +
                    nvl(comp.agin_comp_money, 0) +
                    nvl(mnea.comp_money, 0) + nvl(mnea_am.comp_money, 0)
                else /*khong la thang 12 thi khong cho cac loai khac */
                    nvl(comp.nagm_comp_money, 0) + nvl(comp.comp_mmxii_nagm, 0) +
                    nvl(comp.agqr_comp_money, 0) + nvl(comp.mnqr_comp_money, 0) +
                    nvl(comp.agem_comp_money, 0) +
                    nvl(comp.mnbs_comp_money, 0) +
                    nvl(comp.mnnu_comp_money, 0) +  nvl(comp.comp_mmxii_mnnu, 0) +
                    nvl(comp.mnna_comp_money, 0)  + nvl(comp.comp_mmxii_mnna, 0) +
                    nvl(comp.agin_comp_money, 0)
                end sum_money,
                case when to_char(var_record_date, 'MM') = '12' then
                    nvl(comp.ousl_comp_money, 0) + nvl(comp.oucl_comp_money, 0) +
                    nvl(comp.nagm_comp_money, 0) + nvl(comp.comp_mmxii_nagm, 0) +
                    nvl(comp.agqr_comp_money, 0) + nvl(comp.mnqr_comp_money, 0) +
                    nvl(agfa.comp_money, 0) +
                    nvl(comp.agem_comp_money, 0) +
                    nvl(comp.mnbs_comp_money, 0) +
                    nvl(comp.mnnu_comp_money, 0) +  nvl(comp.comp_mmxii_mnnu, 0) +
                    nvl(comp.mnna_comp_money, 0)  + nvl(comp.comp_mmxii_mnna, 0) +
                    nvl(comp.agin_comp_money, 0) +
                    nvl(mnea.comp_money, 0) + nvl(mnea_am.comp_money, 0)
                else
                    nvl(comp.ousl_comp_money, 0) + nvl(comp.oucl_comp_money, 0) +
                    nvl(comp.nagm_comp_money, 0) + nvl(comp.comp_mmxii_nagm, 0) +
                    nvl(comp.agqr_comp_money, 0) + nvl(comp.mnqr_comp_money, 0) +
                    nvl(comp.agem_comp_money, 0) +
                    nvl(comp.mnbs_comp_money, 0) +
                    nvl(comp.mnnu_comp_money, 0) +  nvl(comp.comp_mmxii_mnnu, 0) +
                    nvl(comp.mnna_comp_money, 0)  + nvl(comp.comp_mmxii_mnna, 0) +
                    nvl(comp.agin_comp_money, 0)
                end total_money,
                case when nvl(comp.info_position_code, cv.position_code)  in ('CV00', 'CV05') then 1
                    when nvl(comp.info_position_code, cv.position_code) in ('CV01') then 2
                    when nvl(comp.info_position_code, cv.position_code) in ('CV02') then 3
                    when nvl(comp.info_position_code, cv.position_code) in ('CV03') then 4
                    when nvl(comp.info_position_code, cv.position_code) in ('CV04') then 5
                end type,
                case when nvl(comp.info_position_code, cv.position_code) in ('CV00', 'CV05') then 'I'
                    when nvl(comp.info_position_code, cv.position_code) in ('CV01') then 'II'
                    when nvl(comp.info_position_code, cv.position_code) in ('CV02') then 'III'
                    when nvl(comp.info_position_code, cv.position_code) in ('CV03') then 'IV'
                    when nvl(comp.info_position_code, cv.position_code) in ('CV04') then 'V'
                end type_code
            from
            (
                select  /*+ CARDINALITY(tmp, 100)*/
                    *
                from ams.la_compensation_mmxiii tmp
                where tmp.record_date = trunc(valDate, 'MM')
                    and tmp.be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                    and tmp.outlet_id = var_agent_id
            ) comp
            left join
            (   /*luy ke tu dau nam*/
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_id,
                    sum(nvl(tmp.agfa_comp_money, 0)) comp_money
                from ams.la_comp_mmxiii_agfa tmp
                where tmp.record_date between var_begin_year and var_record_date
                    and tmp.agfa_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                    and tmp.agfa_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                    and tmp.outlet_id = var_agent_id
                group by tmp.outlet_id
            ) agfa
                on agfa.outlet_id = comp.outlet_id
            --Thuong quan ly hoat dong hieu qua thi chi lay du lieu tai thang 12 cho no thoi
            --cho ca 2 loai nhe
            left join
            (   /*luy ke tu dau nam*/
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_id,
                    sum(nvl(tmp.mnea_comp_money, 0)) comp_money
                from ams.la_comp_mmxiii_mnea_am tmp
                where tmp.record_date = add_months(trunc(valDate, 'YYYY'), 11)
                    and tmp.mnea_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                    and tmp.mnea_be_paid in (
                        AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES)
                    and tmp.outlet_id = var_agent_id
                group by tmp.outlet_id
            ) mnea_am
                on mnea_am.outlet_id = comp.outlet_id
            left join
            (   /*luy ke tu dau nam*/
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_id,
                    sum(nvl(tmp.mnea_comp_money, 0)) comp_money
                from ams.la_comp_mmxiii_mnea tmp
                where tmp.record_date = add_months(trunc(valDate, 'YYYY'), 11)
                    and tmp.mnea_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                    and tmp.mnea_be_paid in (
                        AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES)
                    and tmp.outlet_id = var_agent_id
                group by tmp.outlet_id
            ) mnea
                on mnea.outlet_id = comp.outlet_id
            left join
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_id,
                    sum(nvl(tmp.mnpu_total_money, 0)) comp_money
                from ams.la_comp_mmxiii_mnpu tmp
                where tmp.record_date = trunc(valDate, 'MM')
                    and tmp.mnpu_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                    and tmp.mnpu_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                    and tmp.outlet_id = var_agent_id
                group by tmp.outlet_id
            ) mnpu
                on mnpu.outlet_id = comp.outlet_id
            left join
            (
                select
                    code.code_code position_code,
                    code.code_value position_name
                from ams.cla_codes code
                where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                    and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                    and trunc(valDate, 'MM')
                        between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                        and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
            ) posi
                on posi.position_code = comp.info_position_code
            left join
            (
                select  /*+ CARDINALITY(lha, 100)*/
                    lha.agent_id outlet_id,
                    max(lha.history_value) position_code
                from ams.la_history_agent lha
                where lha.type_code = 'CVDL_CODE'
                    and lha.current_is = 'Y'
                group by lha.agent_id
            ) cv
                on cv.outlet_id = comp.outlet_id
            left join
            (
                select
                    code.code_code position_code,
                    code.code_value position_name
                from ams.cla_codes code
                where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                    and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                    and trunc(valDate, 'MM')
                        between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                        and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
            ) posi_cv
                on posi_cv.position_code = cv.position_code
            order by
                nlssort(comp.info_company_name, 'nls_sort=Vietnamese'),
                nlssort(comp.outlet_ams_id, 'nls_sort=Vietnamese');
       elsif var_branch_id <> 0 then
            open row_records for
            select /*+ CARDINALITY(comp, 100) CARDINALITY(agfa, 100) CARDINALITY(mnea, 100) CARDINALITY(mnea_am, 100) CARDINALITY(mnpu, 100) CARDINALITY(posi, 100)*/
                comp.outlet_ams_id,
                comp.info_outlet_name,
                comp.info_company_ams_id,
                comp.info_company_name,
                comp.info_agency_ams_id,
                comp.info_agency_name,
                comp.info_unit_ams_id,
                comp.info_unit_name,
                comp.info_position_code,
                to_char(comp.info_effective_date, 'DD/MM/YYYY') info_effective_date,
                to_char(comp.info_terminative_date, 'DD/MM/YYYY') info_terminative_date,
                nvl(posi.position_name, posi_cv.position_name) position_name,
                comp.ousl_comp_money,
                comp.oucl_comp_money,
                nvl(comp.ousl_comp_money, 0) + nvl(comp.oucl_comp_money, 0) comm_money,

                nvl(comp.nagm_comp_money, 0) + nvl(comp.comp_mmxii_nagm, 0)  nagm_comp_money,
                nvl(comp.agqr_comp_money, 0) + nvl(comp.mnqr_comp_money, 0) agqr_comp_money,
                case when to_char(var_record_date, 'MM') = '12' then
                  agfa.comp_money
                end agfa_comp_money,--thuong hoat dong deu
                comp.agem_comp_money, --thuong tuyen dung
                --thuong vinh danh tan nghiep
                comp.mnbs_comp_money,
                nvl(comp.mnnu_comp_money, 0) +  nvl(comp.comp_mmxii_mnnu, 0) mnnu_comp_money,
                nvl(comp.mnna_comp_money, 0)  + nvl(comp.comp_mmxii_mnna, 0) mnna_comp_money,
                --thuong gioi thieu dai ly moi
                comp.agin_comp_money,
                case when to_char(var_record_date, 'MM') = '12' then
                    nvl(mnea.comp_money, 0) + nvl(mnea_am.comp_money, 0)
                end mnea_comp_money,
                mnpu.comp_money mnpu_comp_money,--thuong vinh danh tan nghiep
                case when to_char(var_record_date, 'MM') = '12' then
                    nvl(comp.nagm_comp_money, 0) + nvl(comp.comp_mmxii_nagm, 0) +
                    nvl(comp.agqr_comp_money, 0) + nvl(comp.mnqr_comp_money, 0) +
                    nvl(agfa.comp_money, 0) +
                    nvl(comp.agem_comp_money, 0) +
                    nvl(comp.mnbs_comp_money, 0) +
                    nvl(comp.mnnu_comp_money, 0) +  nvl(comp.comp_mmxii_mnnu, 0) +
                    nvl(comp.mnna_comp_money, 0)  + nvl(comp.comp_mmxii_mnna, 0) +
                    nvl(comp.agin_comp_money, 0) +
                    nvl(mnea.comp_money, 0) + nvl(mnea_am.comp_money, 0)
                else /*khong la thang 12 thi khong cho cac loai khac */
                    nvl(comp.nagm_comp_money, 0) + nvl(comp.comp_mmxii_nagm, 0) +
                    nvl(comp.agqr_comp_money, 0) + nvl(comp.mnqr_comp_money, 0) +
                    nvl(comp.agem_comp_money, 0) +
                    nvl(comp.mnbs_comp_money, 0) +
                    nvl(comp.mnnu_comp_money, 0) +  nvl(comp.comp_mmxii_mnnu, 0) +
                    nvl(comp.mnna_comp_money, 0)  + nvl(comp.comp_mmxii_mnna, 0) +
                    nvl(comp.agin_comp_money, 0)
                end sum_money,
                case when to_char(var_record_date, 'MM') = '12' then
                    nvl(comp.ousl_comp_money, 0) + nvl(comp.oucl_comp_money, 0) +
                    nvl(comp.nagm_comp_money, 0) + nvl(comp.comp_mmxii_nagm, 0) +
                    nvl(comp.agqr_comp_money, 0) + nvl(comp.mnqr_comp_money, 0) +
                    nvl(agfa.comp_money, 0) +
                    nvl(comp.agem_comp_money, 0) +
                    nvl(comp.mnbs_comp_money, 0) +
                    nvl(comp.mnnu_comp_money, 0) +  nvl(comp.comp_mmxii_mnnu, 0) +
                    nvl(comp.mnna_comp_money, 0)  + nvl(comp.comp_mmxii_mnna, 0) +
                    nvl(comp.agin_comp_money, 0) +
                    nvl(mnea.comp_money, 0) + nvl(mnea_am.comp_money, 0)
                else
                    nvl(comp.ousl_comp_money, 0) + nvl(comp.oucl_comp_money, 0) +
                    nvl(comp.nagm_comp_money, 0) + nvl(comp.comp_mmxii_nagm, 0) +
                    nvl(comp.agqr_comp_money, 0) + nvl(comp.mnqr_comp_money, 0) +
                    nvl(comp.agem_comp_money, 0) +
                    nvl(comp.mnbs_comp_money, 0) +
                    nvl(comp.mnnu_comp_money, 0) +  nvl(comp.comp_mmxii_mnnu, 0) +
                    nvl(comp.mnna_comp_money, 0)  + nvl(comp.comp_mmxii_mnna, 0) +
                    nvl(comp.agin_comp_money, 0)
                end total_money,
                case when nvl(comp.info_position_code, cv.position_code)  in ('CV00', 'CV05') then 1
                    when nvl(comp.info_position_code, cv.position_code) in ('CV01') then 2
                    when nvl(comp.info_position_code, cv.position_code) in ('CV02') then 3
                    when nvl(comp.info_position_code, cv.position_code) in ('CV03') then 4
                    when nvl(comp.info_position_code, cv.position_code) in ('CV04') then 5
                end type,
                case when nvl(comp.info_position_code, cv.position_code) in ('CV00', 'CV05') then 'I'
                    when nvl(comp.info_position_code, cv.position_code) in ('CV01') then 'II'
                    when nvl(comp.info_position_code, cv.position_code) in ('CV02') then 'III'
                    when nvl(comp.info_position_code, cv.position_code) in ('CV03') then 'IV'
                    when nvl(comp.info_position_code, cv.position_code) in ('CV04') then 'V'
                end type_code
            from
            (
                select  /*+ CARDINALITY(tmp, 100)*/
                    *
                from ams.la_compensation_mmxiii tmp
                where tmp.record_date = trunc(valDate, 'MM')
                    and tmp.be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                    and var_branch_id in
                    (
                        tmp.info_company_id,
                        tmp.info_office_id,
                        tmp.info_agency_id,
                        tmp.info_unit_id
                    )
            ) comp
            left join
            (   /*luy ke tu dau nam*/
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_id,
                    sum(nvl(tmp.agfa_comp_money, 0)) comp_money
                from ams.la_comp_mmxiii_agfa tmp
                where tmp.record_date between var_begin_year and var_record_date
                    and tmp.agfa_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                    and tmp.agfa_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                    and var_branch_id in
                    (
                        tmp.company_id,
                        tmp.office_id,
                        tmp.agency_id,
                        tmp.unit_id
                    )
                group by tmp.outlet_id
            ) agfa
                on agfa.outlet_id = comp.outlet_id
            --Thuong quan ly hoat dong hieu qua thi chi lay du lieu tai thang 12 cho no thoi
            --cho ca 2 loai nhe
            left join
            (   /*luy ke tu dau nam*/
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_id,
                    sum(nvl(tmp.mnea_comp_money, 0)) comp_money
                from ams.la_comp_mmxiii_mnea_am tmp
                where tmp.record_date = add_months(trunc(valDate, 'YYYY'), 11)
                    and tmp.mnea_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                    and tmp.mnea_be_paid in (
                        AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES)
                group by tmp.outlet_id
            ) mnea_am
                on mnea_am.outlet_id = comp.outlet_id
            left join
            (   /*luy ke tu dau nam*/
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_id,
                    sum(nvl(tmp.mnea_comp_money, 0)) comp_money
                from ams.la_comp_mmxiii_mnea tmp
                where tmp.record_date = add_months(trunc(valDate, 'YYYY'), 11)
                    and tmp.mnea_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                    and tmp.mnea_be_paid in (
                        AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES)
                    and var_branch_id in
                    (
                        tmp.company_id,
                        tmp.office_id,
                        tmp.agency_id,
                        tmp.unit_id
                    )
                group by tmp.outlet_id
            ) mnea
                on mnea.outlet_id = comp.outlet_id
            left join
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_id,
                    sum(nvl(tmp.mnpu_total_money, 0)) comp_money
                from ams.la_comp_mmxiii_mnpu tmp
                where tmp.record_date = trunc(valDate, 'MM')
                    and tmp.mnpu_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                    and tmp.mnpu_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                    and var_branch_id in
                    (
                        tmp.company_id,
                        tmp.office_id,
                        tmp.agency_id,
                        tmp.unit_id
                    )
                group by tmp.outlet_id
            ) mnpu
                on mnpu.outlet_id = comp.outlet_id
            left join
            (
                select
                    code.code_code position_code,
                    code.code_value position_name
                from ams.cla_codes code
                where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                    and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                    and trunc(valDate, 'MM')
                        between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                        and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
            ) posi
                on posi.position_code = comp.info_position_code
            left join
            (
                select  /*+ CARDINALITY(lha, 100)*/
                    lha.agent_id outlet_id,
                    max(lha.history_value) position_code
                from ams.la_history_agent lha
                where lha.type_code = 'CVDL_CODE'
                    and lha.current_is = 'Y'
                group by lha.agent_id
            ) cv
                on cv.outlet_id = comp.outlet_id
            left join
            (
                select
                    code.code_code position_code,
                    code.code_value position_name
                from ams.cla_codes code
                where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                    and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                    and trunc(valDate, 'MM')
                        between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                        and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
            ) posi_cv
                on posi_cv.position_code = cv.position_code
            order by
                nlssort(comp.info_company_name, 'nls_sort=Vietnamese'),
                nlssort(comp.outlet_ams_id, 'nls_sort=Vietnamese');
       elsif var_branch_id = 0 then
            open row_records for
            select /*+ CARDINALITY(comp, 100) CARDINALITY(agfa, 100) CARDINALITY(mnea, 100) CARDINALITY(mnea_am, 100) CARDINALITY(mnpu, 100) CARDINALITY(posi, 100)*/
                comp.outlet_ams_id,
                comp.info_outlet_name,
                comp.info_company_ams_id,
                comp.info_company_name,
                comp.info_agency_ams_id,
                comp.info_agency_name,
                comp.info_unit_ams_id,
                comp.info_unit_name,
                comp.info_position_code,
                to_char(comp.info_effective_date, 'DD/MM/YYYY') info_effective_date,
                to_char(comp.info_terminative_date, 'DD/MM/YYYY') info_terminative_date,
                nvl(posi.position_name, posi_cv.position_name) position_name,
                comp.ousl_comp_money,
                comp.oucl_comp_money,
                nvl(comp.ousl_comp_money, 0) + nvl(comp.oucl_comp_money, 0) comm_money,

                nvl(comp.nagm_comp_money, 0) + nvl(comp.comp_mmxii_nagm, 0)  nagm_comp_money,
                nvl(comp.agqr_comp_money, 0) + nvl(comp.mnqr_comp_money, 0) agqr_comp_money,
                case when to_char(var_record_date, 'MM') = '12' then
                  agfa.comp_money
                end agfa_comp_money,--thuong hoat dong deu
                comp.agem_comp_money, --thuong tuyen dung
                --thuong vinh danh tan nghiep
                comp.mnbs_comp_money,
                nvl(comp.mnnu_comp_money, 0) +  nvl(comp.comp_mmxii_mnnu, 0) mnnu_comp_money,
                nvl(comp.mnna_comp_money, 0)  + nvl(comp.comp_mmxii_mnna, 0) mnna_comp_money,
                --thuong gioi thieu dai ly moi
                comp.agin_comp_money,
                case when to_char(var_record_date, 'MM') = '12' then
                    nvl(mnea.comp_money, 0) + nvl(mnea_am.comp_money, 0)
                end mnea_comp_money,
                mnpu.comp_money mnpu_comp_money,--thuong vinh danh tan nghiep
                case when to_char(var_record_date, 'MM') = '12' then
                    nvl(comp.nagm_comp_money, 0) + nvl(comp.comp_mmxii_nagm, 0) +
                    nvl(comp.agqr_comp_money, 0) + nvl(comp.mnqr_comp_money, 0) +
                    nvl(agfa.comp_money, 0) +
                    nvl(comp.agem_comp_money, 0) +
                    nvl(comp.mnbs_comp_money, 0) +
                    nvl(comp.mnnu_comp_money, 0) +  nvl(comp.comp_mmxii_mnnu, 0) +
                    nvl(comp.mnna_comp_money, 0)  + nvl(comp.comp_mmxii_mnna, 0) +
                    nvl(comp.agin_comp_money, 0) +
                    nvl(mnea.comp_money, 0) + nvl(mnea_am.comp_money, 0)
                else /*khong la thang 12 thi khong cho cac loai khac */
                    nvl(comp.nagm_comp_money, 0) + nvl(comp.comp_mmxii_nagm, 0) +
                    nvl(comp.agqr_comp_money, 0) + nvl(comp.mnqr_comp_money, 0) +
                    nvl(comp.agem_comp_money, 0) +
                    nvl(comp.mnbs_comp_money, 0) +
                    nvl(comp.mnnu_comp_money, 0) +  nvl(comp.comp_mmxii_mnnu, 0) +
                    nvl(comp.mnna_comp_money, 0)  + nvl(comp.comp_mmxii_mnna, 0) +
                    nvl(comp.agin_comp_money, 0)
                end sum_money,
                case when to_char(var_record_date, 'MM') = '12' then
                    nvl(comp.ousl_comp_money, 0) + nvl(comp.oucl_comp_money, 0) +
                    nvl(comp.nagm_comp_money, 0) + nvl(comp.comp_mmxii_nagm, 0) +
                    nvl(comp.agqr_comp_money, 0) + nvl(comp.mnqr_comp_money, 0) +
                    nvl(agfa.comp_money, 0) +
                    nvl(comp.agem_comp_money, 0) +
                    nvl(comp.mnbs_comp_money, 0) +
                    nvl(comp.mnnu_comp_money, 0) +  nvl(comp.comp_mmxii_mnnu, 0) +
                    nvl(comp.mnna_comp_money, 0)  + nvl(comp.comp_mmxii_mnna, 0) +
                    nvl(comp.agin_comp_money, 0) +
                    nvl(mnea.comp_money, 0) + nvl(mnea_am.comp_money, 0)
                else
                    nvl(comp.ousl_comp_money, 0) + nvl(comp.oucl_comp_money, 0) +
                    nvl(comp.nagm_comp_money, 0) + nvl(comp.comp_mmxii_nagm, 0) +
                    nvl(comp.agqr_comp_money, 0) + nvl(comp.mnqr_comp_money, 0) +
                    nvl(comp.agem_comp_money, 0) +
                    nvl(comp.mnbs_comp_money, 0) +
                    nvl(comp.mnnu_comp_money, 0) +  nvl(comp.comp_mmxii_mnnu, 0) +
                    nvl(comp.mnna_comp_money, 0)  + nvl(comp.comp_mmxii_mnna, 0) +
                    nvl(comp.agin_comp_money, 0)
                end total_money,
                case when nvl(comp.info_position_code, cv.position_code)  in ('CV00', 'CV05') then 1
                    when nvl(comp.info_position_code, cv.position_code) in ('CV01') then 2
                    when nvl(comp.info_position_code, cv.position_code) in ('CV02') then 3
                    when nvl(comp.info_position_code, cv.position_code) in ('CV03') then 4
                    when nvl(comp.info_position_code, cv.position_code) in ('CV04') then 5
                end type,
                case when nvl(comp.info_position_code, cv.position_code) in ('CV00', 'CV05') then 'I'
                    when nvl(comp.info_position_code, cv.position_code) in ('CV01') then 'II'
                    when nvl(comp.info_position_code, cv.position_code) in ('CV02') then 'III'
                    when nvl(comp.info_position_code, cv.position_code) in ('CV03') then 'IV'
                    when nvl(comp.info_position_code, cv.position_code) in ('CV04') then 'V'
                end type_code
            from
            (
                select  /*+ CARDINALITY(tmp, 100)*/
                    *
                from ams.la_compensation_mmxiii tmp
                where tmp.record_date = trunc(valDate, 'MM')
                    and tmp.be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
            ) comp
            left join
            (   /*luy ke tu dau nam*/
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_id,
                    sum(nvl(tmp.agfa_comp_money, 0)) comp_money
                from ams.la_comp_mmxiii_agfa tmp
                where tmp.record_date between var_begin_year and var_record_date
                    and tmp.agfa_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                    and tmp.agfa_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                group by tmp.outlet_id
            ) agfa
                on agfa.outlet_id = comp.outlet_id
            --Thuong quan ly hoat dong hieu qua thi chi lay du lieu tai thang 12 cho no thoi
            --cho ca 2 loai nhe
            left join
            (   /*luy ke tu dau nam*/
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_id,
                    sum(nvl(tmp.mnea_comp_money, 0)) comp_money
                from ams.la_comp_mmxiii_mnea_am tmp
                where tmp.record_date = add_months(trunc(valDate, 'YYYY'), 11)
                    and tmp.mnea_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                    and tmp.mnea_be_paid in (
                        AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES)
                group by tmp.outlet_id
            ) mnea_am
                on mnea_am.outlet_id = comp.outlet_id
            left join
            (   /*luy ke tu dau nam*/
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_id,
                    sum(nvl(tmp.mnea_comp_money, 0)) comp_money
                from ams.la_comp_mmxiii_mnea tmp
                where tmp.record_date = add_months(trunc(valDate, 'YYYY'), 11)
                    and tmp.mnea_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                    and tmp.mnea_be_paid in (
                        AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES)
                group by tmp.outlet_id
            ) mnea
                on mnea.outlet_id = comp.outlet_id
            left join
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_id,
                    sum(nvl(tmp.mnpu_total_money, 0)) comp_money
                from ams.la_comp_mmxiii_mnpu tmp
                where tmp.record_date = trunc(valDate, 'MM')
                    and tmp.mnpu_be_executing = AMS_MODL_COMP_MMXIII_REPORT.BE_EXECUTING_NO
                    and tmp.mnpu_be_paid = AMS_MODL_COMP_MMXIII_REPORT.BE_PAID_YES
                group by tmp.outlet_id
            ) mnpu
                on mnpu.outlet_id = comp.outlet_id
            left join
            (
                select
                    code.code_code position_code,
                    code.code_value position_name
                from ams.cla_codes code
                where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                    and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                    and trunc(valDate, 'MM')
                        between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                        and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
            ) posi
                on posi.position_code = comp.info_position_code
            left join
            (
                select  /*+ CARDINALITY(lha, 100)*/
                    lha.agent_id outlet_id,
                    max(lha.history_value) position_code
                from ams.la_history_agent lha
                where lha.type_code = 'CVDL_CODE'
                    and lha.current_is = 'Y'
                group by lha.agent_id
            ) cv
                on cv.outlet_id = comp.outlet_id
            left join
            (
                select
                    code.code_code position_code,
                    code.code_value position_name
                from ams.cla_codes code
                where code.code_language = AMS_MODL_COMP_MMXIII_REPORT.THEME_LANGUAGE
                    and code.code_group = AMS_MODL_COMP_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                    and trunc(valDate, 'MM')
                        between nvl(code.from_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MIN_VALUE)
                        and nvl(code.to_date, AMS_MODL_COMP_MMXIII_REPORT.DATE_MAX_VALUE)
            ) posi_cv
                on posi_cv.position_code = cv.position_code
            order by
                nlssort(comp.info_company_name, 'nls_sort=Vietnamese'),
                nlssort(comp.outlet_ams_id, 'nls_sort=Vietnamese');
        end if;
    end;

end AMS_MODL_COMP_MMXIII_REPORT;
/
