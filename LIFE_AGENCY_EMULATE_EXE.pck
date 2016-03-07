create or replace package ams.LIFE_AGENCY_EMULATE_EXE is
    MODULE_CODE_MAIN VARCHAR2(16) := 'MAIN';
    MODULE_CODE_COMP VARCHAR2(16) := 'COMP';

    DATA_CODE_COMM VARCHAR2(16) := 'COMM';
    DATA_CODE_FYC VARCHAR2(16) := 'FYC';
    DATA_CODE_FYP VARCHAR2(16) := 'FYP';
    DATA_CODE_FYN VARCHAR2(16) := 'FYN';
    DATA_CODE_IP VARCHAR2(16) := 'IP';
    DATA_CODE_AFIS VARCHAR2(16) := 'AFIS';
    DATA_CODE_AFIF VARCHAR2(16) := 'AFIF';
    DATA_CODE_ISSU VARCHAR2(16) := 'ISSU';
    DATA_CODE_CANC VARCHAR2(16) := 'CANC';
    DATA_CODE_TERM VARCHAR2(16) := 'TERM';
    DATA_CODE_TMFY VARCHAR2(16) := 'TMFY';
    DATA_CODE_MAIN_FYN VARCHAR2(16) := 'MAIN_FYN';

    POLYC_CODE_INIT VARCHAR2(16) := 'INIT';
    POLYC_CODE_EFFE VARCHAR2(16) := 'EFFE';
    POLYC_CODE_PROC VARCHAR2(16) := 'PROC';
    POLYC_CODE_CANC VARCHAR2(16) := 'CANC';
    POLYC_CODE_TERM VARCHAR2(16) := 'TERM';
    POLYC_CODE_EXIT VARCHAR2(16) := 'EXIT';

    BE_PAID_YES VARCHAR2(1) := 'Y';
    BE_PAID_NO VARCHAR2(1) := 'N';
    BE_PAID_DTL VARCHAR2(1) := 'D';
    BE_PAID_SPC VARCHAR2(1) := 'S';
    BE_PAID_TERM VARCHAR2(1) := 'T';

    BE_EXECUTING_YES VARCHAR2(1) := 'Y';
    BE_EXECUTING_NO VARCHAR2(1) := 'N';
    BE_EXECUTING_DEL VARCHAR2(1) := 'D';

    AMST_YES VARCHAR2(1) := 'Y';
    AMST_NO VARCHAR2(1) := 'N';

    STATUS_TERM varchar2(32) := 'TERM';
    STATUS_CURR varchar2(32) := 'CURR';

    COMP_CODE_MMXII_CV00 VARCHAR2(16) := 'CV00';
    COMP_CODE_MMXII_CV01 VARCHAR2(16) := 'CV01';
    COMP_CODE_MMXII_CV02 VARCHAR2(16) := 'CV02';
    COMP_CODE_MMXII_CV03 VARCHAR2(16) := 'CV03';
    COMP_CODE_MMXII_CV04 VARCHAR2(16) := 'CV04';
    COMP_CODE_MMXII_CV05 VARCHAR2(16) := 'CV05';

    MMXII_COMP_OUSL VARCHAR2(16) := 'MMXII_COMP_OUSL';
    MMXII_COMP_OUCL VARCHAR2(16) := 'MMXII_COMP_OUCL';
    MMXII_COMP_NAGM VARCHAR2(16) := 'MMXII_COMP_NAGM';
    MMXII_COMP_AGEM VARCHAR2(16) := 'MMXII_COMP_AGEM';
    MMXII_COMP_AGQR VARCHAR2(16) := 'MMXII_COMP_AGQR';
    MMXII_COMP_AGFA VARCHAR2(16) := 'MMXII_COMP_AGFA';
    MMXII_COMP_MNBS VARCHAR2(16) := 'MMXII_COMP_MNBS';
    MMXII_COMP_MNQR VARCHAR2(16) := 'MMXII_COMP_MNQR';
    MMXII_COMP_MNNU VARCHAR2(16) := 'MMXII_COMP_MNNU';
    MMXII_COMP_MNNA VARCHAR2(16) := 'MMXII_COMP_MNNA';

    COMP_DATE_MMXII_BEGN date := to_date('1-jan-2012');

    SYSTEM_USER varchar2(16) := 'SYSTEM';
    THEME_LANGUAGE VARCHAR2(16) := 'VN';

    DATE_MAX_VALUE date := to_date('31-dec-9999');
    DATE_MIN_VALUE date := to_date('1-jan-1900');

    SEQUENCE_MAX_VALUE number(5) := 99999;
    SEQUENCE_MIN_VALUE number(5) := 1;

    SYSTEM_REFER_AMS varchar2(16) := 'AMS';
    SYSTEM_REFER_TALISMAN varchar2(16) := 'TAL';
    SYSTEM_REFER_BVLIFE varchar2(16) := 'BVL';

    TALISMAN_GOLIVE date := to_date('28-feb-2011');

    SYSTEM_VALUE_YES varchar2(1) := 'Y';
    SYSTEM_VALUE_NO varchar2(1) := 'N';

    RECORD_MAX_DELETE number(10) := 50000;

    OBJECT_TYPE_OUTLET VARCHAR2(16) := 'OUTL';
    OBJECT_TYPE_BRANCH VARCHAR2(16) := 'BRAN';

    FUNCTION_PREP VARCHAR2(16) := 'PREP';
    FUNCTION_OPEN VARCHAR2(16) := 'OPEN';
    FUNCTION_LOAD VARCHAR2(16) := 'LOAD';
    FUNCTION_WAIT VARCHAR2(16) := 'WAIT';
    FUNCTION_FAIL VARCHAR2(16) := 'FAIL';
    FUNCTION_CLOS VARCHAR2(16) := 'CLOS';

    OBJECT_STATUS_ACTIVE VARCHAR2(16) := 'ACTI';
    OBJECT_STATUS_INACTIVE VARCHAR2(16) := 'INAT';
    OBJECT_STATUS_FREEZE VARCHAR2(16) := 'FRZE';

    OBJECT_LOCK VARCHAR2(16) := 'LOCK';
    OBJECT_UNLOCK VARCHAR2(16) := 'UNLK';

    CURRENT_IS_YES VARCHAR2(1) := 'Y';
    CURRENT_IS_NO VARCHAR2(1) := 'N';
    CURRENT_IS_OTHER VARCHAR2(1) := 'O';

    MODULE_INDEX VARCHAR2(32) := 'INDEX';

    OUTLET_INFO_TYPE_TALM_ID VARCHAR2(16) := 'TLID';
    OUTLET_INFO_TYPE_BVLF_ID VARCHAR2(16) := 'BLID';
    OUTLET_INFO_TYPE_NAME VARCHAR2(16) := 'NAME';
    OUTLET_INFO_TYPE_LOCA VARCHAR2(16) := 'LOCA';
    OUTLET_INFO_TYPE_POSI VARCHAR2(16) := 'POSI';
    OUTLET_INFO_TYPE_FUNC VARCHAR2(16) := 'FUNC';
    OUTLET_INFO_TYPE_OFFI VARCHAR2(16) := 'OFFI';
    OUTLET_INFO_TYPE_STAT VARCHAR2(16) := 'STAT';
    OUTLET_INFO_TYPE_OUTC VARCHAR2(16) := 'OUTC';
    OUTLET_INFO_TYPE_BEGN VARCHAR2(16) := 'BEGN';
    OUTLET_INFO_TYPE_CHED VARCHAR2(16) := 'CHED';
    OUTLET_INFO_TYPE_TERM VARCHAR2(16) := 'TERM';
    OUTLET_INFO_TYPE_EMPL VARCHAR2(16) := 'EMPL';


    BRANCH_INFO_TYPE_TALM_ID VARCHAR2(16) := 'TLID';
    BRANCH_INFO_TYPE_BVLF_ID VARCHAR2(16) := 'BLID';
    BRANCH_INFO_TYPE_CLIT_ID VARCHAR2(16) := 'CLID';
    BRANCH_INFO_TYPE_CODE VARCHAR2(16) := 'TYPE';
    BRANCH_INFO_TYPE_NAME VARCHAR2(16) := 'NAME';
    BRANCH_INFO_TYPE_STRT VARCHAR2(16) := 'STRT';

    STATUS_SUBMITTED VARCHAR2(32) := 'SUBM';
    STATUS_APPROVED VARCHAR2(32) := 'APPR';
    STATUS_FINISHED VARCHAR2(32) := 'FINI';

    var_record_date date := trunc(sysdate, 'MM');

    procedure main;
    procedure run(valRecordDate date := null,
        valCompanyID number := null);
    procedure run_quarter(valRecordDate date := null,
        valCompanyID number := null);
    procedure modl_exp_quar_curr(valRecordDate date := null,
        valCompanyID number := null);
    procedure modl_quar_open(valRecordDate date := null);
    procedure modl_quar_data(valRecordDate date := null);
    procedure modl_quar_close(valRecordDate date := null);
    procedure run_year(valRecordDate date := null,
        valCompanyID number := null);
    procedure modl_exp_year_curr(valRecordDate date := null,
        valCompanyID number := null);
    procedure modl_year_open(valRecordDate date := null);
    procedure modl_year_data(valRecordDate date := null);
    procedure modl_year_close(valRecordDate date := null);

end LIFE_AGENCY_EMULATE_EXE;
/
create or replace package body ams.LIFE_AGENCY_EMULATE_EXE is
    procedure main
    is
    begin
        null;
    end;

    procedure run(valRecordDate date := null,
        valCompanyID number := null)
    is
    begin
        ams.life_agency_emulate_exe.run_quarter(valRecordDate, valCompanyID);
        ams.life_agency_emulate_exe.run_year(valRecordDate, valCompanyID);
    end;

    procedure run_quarter(valRecordDate date := null,
        valCompanyID number := null)
    is
    begin
        ams.life_agency_emulate_exe.modl_exp_quar_curr(valRecordDate, valCompanyID);
        ams.life_agency_emulate_exe.modl_quar_open(valRecordDate);
        ams.life_agency_emulate_exe.modl_quar_data(valRecordDate);
        ams.life_agency_emulate_exe.modl_quar_close(valRecordDate);
    end;

    procedure modl_exp_quar_curr(valRecordDate date := null,
        valCompanyID number := null)
    is
        var_rec_date date := valRecordDate;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        begin
            --lay cai nay de co the lay ra thang ma no co so lieu o serv_data_va FYP va policy
            --de lay so lieu ra cho dung
            select /*+ CARDINALITY(res, 100)*/
                res.record_date
                    into var_rec_date
            from
            (
                select  /*+ CARDINALITY(tmp, 100)*/
                    tmp.record_date,
                    row_number() over (order by tmp.record_date desc)  as rowno
                from ams.mod_data_fyp tmp
                where tmp.record_date <= add_months(trunc(valRecordDate, 'MM'), 2)
                    and tmp.type_of_data = ams.LIFE_AGENCY_EMULATE_EXE.MODULE_CODE_MAIN
                    and tmp.status_code = ams.LIFE_AGENCY_EMULATE_EXE.OBJECT_STATUS_ACTIVE
                    and tmp.type_of_data = 'MAIN'
                    and tmp.processed_date
                        between trunc(valRecordDate, 'MM')
                        and add_months(trunc(valRecordDate, 'MM'), 2)
                    /*so lieu phai la lay o trong nam day chu khong phai lay o nam sau duoc*/
                    and tmp.record_date <= add_months(trunc(valRecordDate, 'YYYY'), 11)
                    and tmp.policy_number is not null
                    and tmp.outlet_ams_id is not null
            ) res
            where res.rowno = 1;
        exception
             when others then
                 var_rec_date := valRecordDate;
        end;

        var_record_date := var_rec_date;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(ams.life_agency_code.log_id_index, 'LIFE_AGENCY_EMULATE', 'modl_exp_outl_curr 1');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* Xoa du lieu dai ly*/
        loop
            delete ams.la_emulate_quarter del
            where del.record_date = trunc(valRecordDate, 'MM')
                and del.status_code = ams.LIFE_AGENCY_EMULATE_EXE.STATUS_CURR
                and
                (
                    del.company_id = nvl(valCompanyID, 0)
                    or
                    nvl(valCompanyID, 0) = 0
                )
                and rownum < ams.LIFE_AGENCY_EMULATE_EXE.RECORD_MAX_DELETE;
            exit when SQL%rowcount < ams.LIFE_AGENCY_EMULATE_EXE.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(ams.life_agency_code.log_id_index, 'LIFE_AGENCY_EMULATE', 'modl_exp_outl_curr 1');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        insert /*+ APPEND */ into ams.la_emulate_quarter nologging(
            outlet_id,
            outlet_ams_id,
            record_date,
            version_date,
            status_code,
            outlet_name,
            company_id,
            company_ams_id,
            company_name,
            office_id,
            office_ams_id,
            office_name,
            agency_id,
            agency_ams_id,
            agency_name,
            unit_id,
            unit_ams_id,
            unit_name,
            position_code,
            position_date,
            effective_date,
            terminative_date,
            be_executing,
            create_user,
            update_user,
            create_datetime,
            update_datetime)
        select /*+ CARDINALITY(outl, 100)*/
            outl.outlet_id,
            outl.outlet_ams_id,
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            ams.LIFE_AGENCY_EMULATE_EXE.STATUS_CURR,
            outl.outlet_name,
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
            outl.position_code,
            outl.position_date,
            outl.effective_date,
            outl.terminative_date,
            ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_YES,
            ams.LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
            ams.LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.serv_outlet_data outl
        where outl.record_date = var_record_date
            and outl.type_code = ams.LIFE_AGENCY_EMULATE_EXE.MODULE_CODE_MAIN
            and outl.status_code = ams.LIFE_AGENCY_EMULATE_EXE.OBJECT_STATUS_ACTIVE
            and
            (
                outl.company_id = nvl(valCompanyID, 0)
                or
                nvl(valCompanyID, 0) = 0
            )
            and outl.terminative_date is null;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(ams.life_agency_code.log_id_index, 'LIFE_AGENCY_EMULATE', 'modl_exp_outl_curr 1.1');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        --Sau do thi merge cac thong tin ve effective_date
        --o trong bang la_history_agent  va lay cac thong tin ve ngay tro thanh chinh thuc TVV truc tiep cua no vao day
        --Sau do se tinh ra tham nien senr_by_months luon o day
        update ams.la_emulate_quarter tmp
        set
            tmp.senior_by_months =
                round(
                    months_between(
                        add_months(trunc(valRecordDate, 'MM'), 3) - 1,
                        trunc(tmp.effective_date, 'MM')
                    )
                ),
            tmp.update_user = ams.LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
            tmp.update_datetime = sysdate
        where tmp.record_date = trunc(valRecordDate, 'MM')
            and tmp.be_executing = ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_YES;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(ams.life_agency_code.log_id_index, 'LIFE_AGENCY_EMULATE', 'modl_exp_outl_curr 2');
    end;

    procedure modl_quar_open(valRecordDate date := null)
    is
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Len danh sach Tu van vien duoc tra thu lao thu phi*/
        update ams.la_emulate_quarter comp
        set
            comp.from_date = trunc(valRecordDate, 'MM'),
            comp.to_date = add_months(trunc(valRecordDate, 'MM'), 3) - 1,
            comp.quar_first_month_fyp = 0,
            comp.quar_first_month_iss = 0,
            comp.quar_first_month_acti = 0,
            comp.quar_second_month_fyp = 0,
            comp.quar_second_month_iss = 0,
            comp.quar_second_month_acti = 0,
            comp.quar_third_month_fyp = 0,
            comp.quar_third_month_iss = 0,
            comp.quar_third_month_acti = 0,
            comp.quar_period_fyp = 0,
            comp.quar_period_acti_qty = 0,
            comp.quar_period_afis = 0,
            comp.quar_period_afif = 0,
            comp.quar_period_pr36 = 0,
            comp.quar_first_month_coll_etmt = 0,
            comp.quar_first_month_coll_real = 0,
            comp.quar_second_month_coll_etmt = 0,
            comp.quar_second_month_coll_real = 0,
            comp.quar_third_month_coll_etmt = 0,
            comp.quar_third_month_coll_real = 0,
            comp.quar_period_coll_etmt = 0,
            comp.quar_period_coll_real = 0,
            comp.quar_period_coll_rate = 0,
            comp.update_user = ams.LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.be_executing = ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_YES
            and comp.status_code = ams.LIFE_AGENCY_EMULATE_EXE.STATUS_CURR;
        commit;

        update ams.la_emulate_quarter o
        set
            o.from_date = o.effective_date,
            o.update_user = ams.LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
            o.update_datetime = sysdate
        where o.record_date = trunc(valRecordDate, 'MM')
            and o.be_executing = ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_YES
            and o.status_code = ams.LIFE_AGENCY_EMULATE_EXE.STATUS_CURR
            and o.from_date < o.effective_date;
        commit;

        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_emulate_quarter o
        using
            (
                select /*+ CARDINALITY(code, 100)*/
                    code.code_code position_code,
                    code.code_value position_name
                from ams.cla_codes code
                where code.code_language = ams.LIFE_AGENCY_EMULATE_EXE.THEME_LANGUAGE
                    and code.code_group = ams.LIFE_AGENCY_EMULATE_EXE.OUTLET_INFO_TYPE_POSI
                    and trunc(sysdate, 'DD')
                        between nvl(code.from_date, ams.LIFE_AGENCY_EMULATE_EXE.DATE_MIN_VALUE)
                        and nvl(code.to_date, ams.LIFE_AGENCY_EMULATE_EXE.DATE_MAX_VALUE)
            ) upd
        on (
            trunc(valRecordDate, 'MM') = o.record_date
            and
            ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_YES = o.be_executing
            and
            upd.position_code = o.position_code
        )
        when matched then
            update
                set
                    o.position_name = upd.position_name,
                    o.update_user = ams.LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
                    o.update_datetime = sysdate;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(ams.life_agency_code.log_id_index, 'LIFE_AGENCY_EMULATE', 'modl_quar_open');

    end;

    procedure modl_quar_data(valRecordDate date := null)
    is
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        --lay du lieu trong thang dau tien cua quy cho no
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_emulate_quarter o
        using
            (
                select  /*+ CARDINALITY(pol, 100)
                           CARDINALITY(trans, 100)*/
                    trans.outlet_ams_id,
                    sum(nvl(trans.fyp, 0)) index_value
                from
                (   /*lay danh sach cac hop dong phat hanh trong QUY
                    chu khong phai lay danh sach cac hop dong phat hanh trong thang*/
                    select /*+ CARDINALITY(pol, 100)*/
                        pol.policy_number
                    from ams.mod_data_policy pol
                    where pol.record_date = var_record_date
                        and pol.type_of_data = ams.LIFE_AGENCY_EMULATE_EXE.MODULE_CODE_MAIN
                        and pol.changes_code = ams.LIFE_AGENCY_EMULATE_EXE.POLYC_CODE_PROC
                        and pol.status_code = ams.LIFE_AGENCY_EMULATE_EXE.OBJECT_STATUS_ACTIVE
                        and pol.changes_date /*phat hanh trong QUY*/
                            between trunc(valRecordDate, 'MM')
                            and (add_months(trunc(valRecordDate, 'MM'), 3) - 1)
                        and pol.init_ams_id is not null
                    group by pol.policy_number
                    minus
                    /*tru di cac hop dong huy 14 ngay*/
                    select /*+ CARDINALITY(pol, 100)*/
                        pol.policy_number
                    from ams.mod_data_policy pol
                    where pol.record_date = var_record_date
                        and pol.type_of_data = ams.LIFE_AGENCY_EMULATE_EXE.MODULE_CODE_MAIN
                        and pol.changes_code = ams.LIFE_AGENCY_EMULATE_EXE.POLYC_CODE_CANC
                        and pol.status_code = ams.LIFE_AGENCY_EMULATE_EXE.OBJECT_STATUS_ACTIVE
                        and pol.changes_date
                            between trunc(valRecordDate, 'MM')
                            and (add_months(trunc(valRecordDate, 'MM'), 5) - 1)
                        and pol.init_ams_id is not null
                    group by pol.policy_number
                ) pol
                join
                (
                    select  /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_ams_id,
                        tmp.policy_number,
                        tmp.fyp
                    from ams.mod_data_fyp tmp
                    where tmp.record_date --lay them so lieu cua 1 thang cua thang duy nhat la thang day
                        between trunc(valRecordDate, 'MM')
                            and (add_months(trunc(valRecordDate, 'MM'), 2) - 1)
                        and tmp.type_of_data = 'MAIN'
                        and tmp.processed_date  /*chi lay ra FYP duoc phat sinh trong 1 thang da xac dinh cua QUY*/
                            between trunc(valRecordDate, 'MM')
                            and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                        and tmp.policy_number is not null
                        and tmp.outlet_ams_id is not null
                ) trans
                    on pol.policy_number = trans.policy_number
                group by trans.outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = o.record_date
            and
            ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_YES = o.be_executing
            and
            upd.outlet_ams_id = o.outlet_ams_id
        )
        when matched then
            update
                set
                    o.quar_first_month_fyp = upd.index_value,
                    o.update_user = ams.LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(ams.life_agency_code.log_id_index, 'LIFE_AGENCY_EMULATE', 'modl_quar_data 1');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_emulate_quarter o
        using
            (
                select  /*+ CARDINALITY(pol, 100)
                                 CARDINALITY(iss, 100) */
                    iss.outlet_ams_id,
                    count(iss.policy_number) index_value
                from
                (
                    select /*+ CARDINALITY(pol, 100)*/
                        pol.policy_number
                    from ams.mod_data_policy pol
                    where pol.record_date = var_record_date
                        and pol.type_of_data = ams.LIFE_AGENCY_EMULATE_EXE.MODULE_CODE_MAIN
                        and pol.changes_code = ams.LIFE_AGENCY_EMULATE_EXE.POLYC_CODE_PROC
                        and pol.status_code = ams.LIFE_AGENCY_EMULATE_EXE.OBJECT_STATUS_ACTIVE
                        and pol.changes_date
                            between trunc(valRecordDate, 'MM')
                            and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                        and pol.init_ams_id is not null
                    group by pol.policy_number
                    minus
                    select /*+ CARDINALITY(pol, 100)*/
                        pol.policy_number
                    from ams.mod_data_policy pol
                    where pol.record_date = var_record_date
                        and pol.type_of_data = ams.LIFE_AGENCY_EMULATE_EXE.MODULE_CODE_MAIN
                        and pol.changes_code = ams.LIFE_AGENCY_EMULATE_EXE.POLYC_CODE_CANC
                        and pol.status_code = ams.LIFE_AGENCY_EMULATE_EXE.OBJECT_STATUS_ACTIVE
                        and pol.changes_date
                            between trunc(valRecordDate, 'MM')
                            and (add_months(trunc(valRecordDate, 'MM'), 3) - 1)
                        and pol.init_ams_id is not null
                    group by pol.policy_number
                ) pol
                join
                (
                    select /*+ CARDINALITY(pol, 100)*/
                        pol.init_ams_id outlet_ams_id,
                        pol.policy_number
                    from ams.mod_data_policy pol
                    where pol.record_date = var_record_date
                        and pol.type_of_data = ams.LIFE_AGENCY_EMULATE_EXE.MODULE_CODE_MAIN
                        and pol.changes_code = ams.LIFE_AGENCY_EMULATE_EXE.POLYC_CODE_PROC
                        and pol.status_code = ams.LIFE_AGENCY_EMULATE_EXE.OBJECT_STATUS_ACTIVE
                        and pol.changes_date
                            between trunc(valRecordDate, 'MM')
                            and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                        and pol.init_ams_id is not null
                ) iss
                    on iss.policy_number = pol.policy_number
                group by iss.outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = o.record_date
            and
            ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_YES = o.be_executing
            and
            upd.outlet_ams_id = o.outlet_ams_id
        )
        when matched then
            update
                set
                    o.quar_first_month_iss = upd.index_value,
                    o.update_user = ams.LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(ams.life_agency_code.log_id_index, 'LIFE_AGENCY_EMULATE', 'modl_quar_data 2');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* Cap nhat thang co hoat dong hay khong?*/
        update ams.la_emulate_quarter o
        set
            o.quar_first_month_acti = 1,
            o.update_user = ams.LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
            o.update_datetime = sysdate
        where o.record_date = trunc(valRecordDate, 'MM')
            and o.be_executing = ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_YES
            and nvl(o.quar_first_month_iss, 0) > 0;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(ams.life_agency_code.log_id_index, 'LIFE_AGENCY_EMULATE', 'modl_quar_data 3');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /*lay du lieu cho thang thu 2 cua quy*/
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_emulate_quarter o
        using
            (
                select  /*+ CARDINALITY(pol, 100)
                           CARDINALITY(trans, 100)*/
                    trans.outlet_ams_id,
                    sum(nvl(trans.fyp, 0)) index_value
                from
                (  /*lay danh sach cac hop dong phat hanh trong QUY
                    chu khong phai lay danh sach cac hop dong phat hanh trong thang*/
                    select /*+ CARDINALITY(pol, 100)*/
                        pol.policy_number
                    from ams.mod_data_policy pol
                    where pol.record_date = var_record_date
                        and pol.type_of_data = ams.LIFE_AGENCY_EMULATE_EXE.MODULE_CODE_MAIN
                        and pol.changes_code = ams.LIFE_AGENCY_EMULATE_EXE.POLYC_CODE_PROC
                        and pol.status_code = ams.LIFE_AGENCY_EMULATE_EXE.OBJECT_STATUS_ACTIVE
                        and pol.changes_date /*phat hanh trong QUY*/
                            between trunc(valRecordDate, 'MM')
                            and (add_months(trunc(valRecordDate, 'MM'), 3) - 1)
                        and pol.init_ams_id is not null
                    group by pol.policy_number
                    minus
                    select /*+ CARDINALITY(pol, 100)*/
                        pol.policy_number
                    from ams.mod_data_policy pol
                    where pol.record_date = var_record_date
                        and pol.type_of_data = ams.LIFE_AGENCY_EMULATE_EXE.MODULE_CODE_MAIN
                        and pol.changes_code = ams.LIFE_AGENCY_EMULATE_EXE.POLYC_CODE_CANC
                        and pol.status_code = ams.LIFE_AGENCY_EMULATE_EXE.OBJECT_STATUS_ACTIVE
                        and pol.changes_date
                            between trunc(valRecordDate, 'MM')
                            and (add_months(trunc(valRecordDate, 'MM'), 5) - 1)
                        and pol.init_ams_id is not null
                    group by pol.policy_number
                ) pol
                join
                (
                    select  /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_ams_id,
                        tmp.policy_number,
                        tmp.fyp
                    from ams.mod_data_fyp tmp
                    where tmp.record_date--lay them so lieu cua 2 thang sau do cho no day du luon
                            between add_months(trunc(valRecordDate, 'MM'), 1)
                            and (add_months(trunc(valRecordDate, 'MM'), 3) - 1)
                        and tmp.type_of_data = 'MAIN'
                        and tmp.processed_date /*chi lay ra FYP duoc phat sinh trong thang thu 2 cua QUY*/
                            between add_months(trunc(valRecordDate, 'MM'), 1)
                            and (add_months(trunc(valRecordDate, 'MM'), 2) - 1)
                        and tmp.policy_number is not null
                        and tmp.outlet_ams_id is not null
                ) trans
                    on pol.policy_number = trans.policy_number
                group by trans.outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = o.record_date
            and
            ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_YES = o.be_executing
            and
            upd.outlet_ams_id = o.outlet_ams_id
        )
        when matched then
            update
                set
                    o.quar_second_month_fyp = upd.index_value,
                    o.update_user = ams.LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(ams.life_agency_code.log_id_index, 'LIFE_AGENCY_EMULATE', 'modl_quar_data 4');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_emulate_quarter o
        using
            (
                select  /*+ CARDINALITY(pol, 100)
                                 CARDINALITY(iss, 100) */
                    iss.outlet_ams_id,
                    count(iss.policy_number) index_value
                from
                (
                    select /*+ CARDINALITY(pol, 100)*/
                        pol.policy_number
                    from ams.mod_data_policy pol
                    where pol.record_date = var_record_date
                        and pol.type_of_data = ams.LIFE_AGENCY_EMULATE_EXE.MODULE_CODE_MAIN
                        and pol.changes_code = ams.LIFE_AGENCY_EMULATE_EXE.POLYC_CODE_PROC
                        and pol.status_code = ams.LIFE_AGENCY_EMULATE_EXE.OBJECT_STATUS_ACTIVE
                        and pol.changes_date
                            between add_months(trunc(valRecordDate, 'MM'), 1)
                            and (add_months(trunc(valRecordDate, 'MM'), 2) - 1)
                        and pol.init_ams_id is not null
                    group by pol.policy_number
                    minus
                    select /*+ CARDINALITY(pol, 100)*/
                        pol.policy_number
                    from ams.mod_data_policy pol
                    where pol.record_date = var_record_date
                        and pol.type_of_data = ams.LIFE_AGENCY_EMULATE_EXE.MODULE_CODE_MAIN
                        and pol.changes_code = ams.LIFE_AGENCY_EMULATE_EXE.POLYC_CODE_CANC
                        and pol.status_code = ams.LIFE_AGENCY_EMULATE_EXE.OBJECT_STATUS_ACTIVE
                        and pol.changes_date
                            between add_months(trunc(valRecordDate, 'MM'), 1)
                            and (add_months(trunc(valRecordDate, 'MM'), 4) - 1)
                        and pol.init_ams_id is not null
                    group by pol.policy_number
                ) pol
                join
                (
                    select /*+ CARDINALITY(pol, 100)*/
                        pol.init_ams_id outlet_ams_id,
                        pol.policy_number
                    from ams.mod_data_policy pol
                    where pol.record_date = var_record_date
                        and pol.type_of_data = ams.LIFE_AGENCY_EMULATE_EXE.MODULE_CODE_MAIN
                        and pol.changes_code = ams.LIFE_AGENCY_EMULATE_EXE.POLYC_CODE_PROC
                        and pol.status_code = ams.LIFE_AGENCY_EMULATE_EXE.OBJECT_STATUS_ACTIVE
                        and pol.changes_date
                            between add_months(trunc(valRecordDate, 'MM'), 1)
                            and (add_months(trunc(valRecordDate, 'MM'), 2) - 1)
                        and pol.init_ams_id is not null
                ) iss
                    on iss.policy_number = pol.policy_number
                group by iss.outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = o.record_date
            and
            ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_YES = o.be_executing
            and
            upd.outlet_ams_id = o.outlet_ams_id
        )
        when matched then
            update
                set
                    o.quar_second_month_iss = upd.index_value,
                    o.update_user = ams.LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(ams.life_agency_code.log_id_index, 'LIFE_AGENCY_EMULATE', 'modl_quar_data 5');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* Cap nhat thang co hoat dong hay khong?*/
        update ams.la_emulate_quarter o
        set
            o.quar_second_month_acti = 1,
            o.update_user = ams.LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
            o.update_datetime = sysdate
        where o.record_date = trunc(valRecordDate, 'MM')
            and o.be_executing = ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_YES
            and nvl(o.quar_second_month_iss, 0) > 0;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(ams.life_agency_code.log_id_index, 'LIFE_AGENCY_EMULATE', 'modl_quar_data 6');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        --lay du lieu trong thang thu 3 cua quy cho no
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_emulate_quarter o
        using
            (
                select  /*+ CARDINALITY(pol, 100)
                           CARDINALITY(trans, 100)*/
                    trans.outlet_ams_id,
                    sum(nvl(trans.fyp, 0)) index_value
                from
                (
                    select /*+ CARDINALITY(pol, 100)*/
                        pol.policy_number
                    from ams.mod_data_policy pol
                    where pol.record_date = var_record_date
                        and pol.type_of_data = ams.LIFE_AGENCY_EMULATE_EXE.MODULE_CODE_MAIN
                        and pol.changes_code = ams.LIFE_AGENCY_EMULATE_EXE.POLYC_CODE_PROC
                        and pol.status_code = ams.LIFE_AGENCY_EMULATE_EXE.OBJECT_STATUS_ACTIVE
                        and pol.changes_date /*phat hanh trong QUY*/
                            between trunc(valRecordDate, 'MM')
                            and (add_months(trunc(valRecordDate, 'MM'), 3) - 1)
                        and pol.init_ams_id is not null
                    group by pol.policy_number
                    minus
                    select /*+ CARDINALITY(pol, 100)*/
                        pol.policy_number
                    from ams.mod_data_policy pol
                    where pol.record_date = var_record_date
                        and pol.type_of_data = ams.LIFE_AGENCY_EMULATE_EXE.MODULE_CODE_MAIN
                        and pol.changes_code = ams.LIFE_AGENCY_EMULATE_EXE.POLYC_CODE_CANC
                        and pol.status_code = ams.LIFE_AGENCY_EMULATE_EXE.OBJECT_STATUS_ACTIVE
                        and pol.changes_date
                            between trunc(valRecordDate, 'MM')
                            and (add_months(trunc(valRecordDate, 'MM'), 5) - 1)
                        and pol.init_ams_id is not null
                    group by pol.policy_number
                ) pol
                join
                (
                    select  /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_ams_id,
                        tmp.policy_number,
                        tmp.fyp
                    from ams.mod_data_fyp tmp
                    where tmp.record_date--lay them so lieu cua 2 thang sau do cho no day du luon
                            between add_months(trunc(valRecordDate, 'MM'), 2)
                            and (add_months(trunc(valRecordDate, 'MM'), 5) - 1)
                        and tmp.type_of_data = 'MAIN'
                        and tmp.processed_date /*chi lay ra FYP duoc phat sinh trong 1 thang da xac dinh cua QUY*/
                            between add_months(trunc(valRecordDate, 'MM'), 2)
                            and (add_months(trunc(valRecordDate, 'MM'), 3) - 1)
                        and tmp.policy_number is not null
                        and tmp.outlet_ams_id is not null
                ) trans
                    on pol.policy_number = trans.policy_number
                group by trans.outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = o.record_date
            and
            ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_YES = o.be_executing
            and
            upd.outlet_ams_id = o.outlet_ams_id
        )
        when matched then
            update
                set
                    o.quar_third_month_fyp = upd.index_value,
                    o.update_user = ams.LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(ams.life_agency_code.log_id_index, 'LIFE_AGENCY_EMULATE', 'modl_quar_data 7');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_emulate_quarter o
        using
            (
                select  /*+ CARDINALITY(pol, 100)
                                 CARDINALITY(iss, 100) */
                    iss.outlet_ams_id,
                    count(iss.policy_number) index_value
                from
                (
                    select /*+ CARDINALITY(pol, 100)*/
                        pol.policy_number
                    from ams.mod_data_policy pol
                    where pol.record_date = var_record_date
                        and pol.type_of_data = ams.LIFE_AGENCY_EMULATE_EXE.MODULE_CODE_MAIN
                        and pol.changes_code = ams.LIFE_AGENCY_EMULATE_EXE.POLYC_CODE_PROC
                        and pol.status_code = ams.LIFE_AGENCY_EMULATE_EXE.OBJECT_STATUS_ACTIVE
                        and pol.changes_date
                            between add_months(trunc(valRecordDate, 'MM'), 2)
                            and (add_months(trunc(valRecordDate, 'MM'), 3) - 1)
                        and pol.init_ams_id is not null
                    group by pol.policy_number
                    minus
                    select /*+ CARDINALITY(pol, 100)*/
                        pol.policy_number
                    from ams.mod_data_policy pol
                    where pol.record_date = var_record_date
                        and pol.type_of_data = ams.LIFE_AGENCY_EMULATE_EXE.MODULE_CODE_MAIN
                        and pol.changes_code = ams.LIFE_AGENCY_EMULATE_EXE.POLYC_CODE_CANC
                        and pol.status_code = ams.LIFE_AGENCY_EMULATE_EXE.OBJECT_STATUS_ACTIVE
                        and pol.changes_date
                            between add_months(trunc(valRecordDate, 'MM'), 2)
                            and (add_months(trunc(valRecordDate, 'MM'), 5) - 1)
                        and pol.init_ams_id is not null
                    group by pol.policy_number
                ) pol
                join
                (
                    select /*+ CARDINALITY(pol, 100)*/
                        pol.init_ams_id outlet_ams_id,
                        pol.policy_number
                    from ams.mod_data_policy pol
                    where pol.record_date = var_record_date
                        and pol.type_of_data = ams.LIFE_AGENCY_EMULATE_EXE.MODULE_CODE_MAIN
                        and pol.changes_code = ams.LIFE_AGENCY_EMULATE_EXE.POLYC_CODE_PROC
                        and pol.status_code = ams.LIFE_AGENCY_EMULATE_EXE.OBJECT_STATUS_ACTIVE
                        and pol.changes_date
                            between add_months(trunc(valRecordDate, 'MM'), 2)
                            and (add_months(trunc(valRecordDate, 'MM'), 3) - 1)
                        and pol.init_ams_id is not null
                ) iss
                    on iss.policy_number = pol.policy_number
                group by iss.outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = o.record_date
            and
            ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_YES = o.be_executing
            and
            upd.outlet_ams_id = o.outlet_ams_id
        )
        when matched then
            update
                set
                    o.quar_third_month_iss = upd.index_value,
                    o.update_user = ams.LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(ams.life_agency_code.log_id_index, 'LIFE_AGENCY_EMULATE', 'modl_quar_data 8');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* Cap nhat thang co hoat dong hay khong?*/
        update ams.la_emulate_quarter o
        set
            o.quar_third_month_acti = 1,
            o.update_user = ams.LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
            o.update_datetime = sysdate
        where o.record_date = trunc(valRecordDate, 'MM')
            and o.be_executing = ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_YES
            and nvl(o.quar_third_month_iss, 0) > 0;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(ams.life_agency_code.log_id_index, 'LIFE_AGENCY_EMULATE', 'modl_quar_data 9');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* Cap nhat thang co hoat dong hay khong?*/
        update ams.la_emulate_quarter o
        set
            o.quar_third_month_acti = 1,
            o.update_user = ams.LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
            o.update_datetime = sysdate
        where o.record_date = trunc(valRecordDate, 'MM')
            and o.be_executing = ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_YES
            and nvl(o.quar_third_month_iss, 0) > 0;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(ams.life_agency_code.log_id_index, 'LIFE_AGENCY_EMULATE', 'modl_quar_data 11');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /*tinh tong FYP KTM trong quy va so thang hoat dong trong quy*/
        update ams.la_emulate_quarter o
        set
            o.quar_period_acti_qty = nvl(o.quar_first_month_acti, 0) +
                                                     nvl(o.quar_second_month_acti, 0) +
                                                     nvl(o.quar_third_month_acti, 0),
            o.quar_period_fyp = nvl(o.quar_first_month_fyp, 0) +
                                                     nvl(o.quar_second_month_fyp, 0) +
                                                     nvl(o.quar_third_month_fyp, 0),
            o.update_user = ams.LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
            o.update_datetime = sysdate
        where o.record_date = trunc(valRecordDate, 'MM')
            and o.be_executing = ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_YES;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(ams.life_agency_code.log_id_index, 'LIFE_AGENCY_EMULATE', 'modl_quar_data 12');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_emulate_quarter o
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_ams_id,
                    nvl(tmp.data_value, 0) index_value
                from ams.mod_data tmp
                where tmp.record_date = var_record_date
                    and tmp.module_code = ams.LIFE_AGENCY_EMULATE_EXE.MODULE_CODE_MAIN
                    and tmp.data_code = ams.LIFE_AGENCY_EMULATE_EXE.DATA_CODE_AFIS
            ) upd
        on (
            trunc(valRecordDate, 'MM') = o.record_date
            and
            ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_YES = o.be_executing
            and
            upd.outlet_ams_id = o.outlet_ams_id
        )
        when matched then
            update
                set
                    o.quar_period_afis = upd.index_value,
                    o.update_user = ams.LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(ams.life_agency_code.log_id_index, 'LIFE_AGENCY_EMULATE', 'modl_quar_data 13');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_emulate_quarter o
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_ams_id,
                    nvl(tmp.data_value, 0) index_value
                from ams.mod_data tmp
                where tmp.record_date = var_record_date
                    and tmp.module_code = ams.LIFE_AGENCY_EMULATE_EXE.MODULE_CODE_MAIN
                    and tmp.data_code = ams.LIFE_AGENCY_EMULATE_EXE.DATA_CODE_AFIF
            ) upd
        on (
            trunc(valRecordDate, 'MM') = o.record_date
            and
            ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_YES = o.be_executing
            and
            upd.outlet_ams_id = o.outlet_ams_id
        )
        when matched then
            update
                set
                    o.quar_period_afif = upd.index_value,
                    o.update_user = ams.LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(ams.life_agency_code.log_id_index, 'LIFE_AGENCY_EMULATE', 'modl_quar_data 14');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_emulate_quarter o
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_ams_id,
                    nvl(tmp.data_value, 0) index_value
                from ams.mod_data tmp
                where tmp.record_date = var_record_date
                    and tmp.module_code = ams.LIFE_AGENCY_EMULATE_EXE.MODULE_CODE_MAIN
                    and tmp.data_code = ams.LIFE_AGENCY_EMULATE_EXE.DATA_CODE_AFIF
            ) upd
        on (
            trunc(valRecordDate, 'MM') = o.record_date
            and
            ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_YES = o.be_executing
            and
            upd.outlet_ams_id = o.outlet_ams_id
        )
        when matched then
            update
                set
                    o.quar_period_afif = upd.index_value,
                    o.update_user = ams.LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(ams.life_agency_code.log_id_index, 'LIFE_AGENCY_EMULATE', 'modl_quar_data 15');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        update ams.la_emulate_quarter o
        set
            o.quar_period_pr36 =
                round(
                    decode(nvl(o.quar_period_afis, 0),
                        0, 100,
                        least(
                            (nvl(o.quar_period_afif, 0) / nvl(o.quar_period_afis, 0)) * 100,
                            999.99
                        )
                    ),
                    2
                ),
            o.update_user = ams.LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
            o.update_datetime = sysdate
        where o.record_date = trunc(valRecordDate, 'MM')
            and o.be_executing = ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_YES;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(ams.life_agency_code.log_id_index, 'LIFE_AGENCY_EMULATE', 'modl_quar_data 16');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_emulate_quarter o
        using
            (
                select /*+ CARDINALITY(i, 100)*/
                    i.agent_id outlet_id,
                    nvl(i.index_value_number, 0) data_index
                from ams.la_index i
                where i.record_date = trunc(valRecordDate, 'MM')
                    and i.index_code = 'INVO_PREM'
                    and i.group_code = 'LIMR'
                    and i.category_code = 'INDX'
                    and i.time_frequency = 'MONTHLY'
                    and i.type_data = 'OUTL'
            ) upd
        on (
            trunc(valRecordDate, 'MM') = o.record_date
            and
            ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_YES = o.be_executing
            and
            upd.outlet_id = o.outlet_id
        )
        when matched then
            update
                set
                    o.quar_first_month_coll_etmt = upd.data_index,
                    o.update_user = ams.LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(ams.life_agency_code.log_id_index, 'LIFE_AGENCY_EMULATE', 'modl_quar_data 17');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_emulate_quarter o
        using
            (
                select /*+ CARDINALITY(i, 100)*/
                    i.agent_id outlet_id,
                    nvl(i.index_value_number, 0) data_index
                from ams.la_index i
                where i.record_date = trunc(valRecordDate, 'MM')
                    and i.index_code = 'REAL_PREM'
                    and i.group_code = 'LIMR'
                    and i.category_code = 'INDX'
                    and i.time_frequency = 'MONTHLY'
                    and i.type_data = 'OUTL'
            ) upd
        on (
            trunc(valRecordDate, 'MM') = o.record_date
            and
            ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_YES = o.be_executing
            and
            upd.outlet_id = o.outlet_id
        )
        when matched then
            update
                set
                    o.quar_first_month_coll_real = upd.data_index,
                    o.update_user = ams.LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(ams.life_agency_code.log_id_index, 'LIFE_AGENCY_EMULATE', 'modl_quar_data 18');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_emulate_quarter o
        using
            (
                select /*+ CARDINALITY(i, 100)*/
                    i.agent_id outlet_id,
                    nvl(i.index_value_number, 0) data_index
                from ams.la_index i
                where i.record_date = add_months(trunc(valRecordDate, 'MM'), 1)
                    and i.index_code = 'INVO_PREM'
                    and i.group_code = 'LIMR'
                    and i.category_code = 'INDX'
                    and i.time_frequency = 'MONTHLY'
                    and i.type_data = 'OUTL'
            ) upd
        on (
            trunc(valRecordDate, 'MM') = o.record_date
            and
            ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_YES = o.be_executing
            and
            upd.outlet_id = o.outlet_id
        )
        when matched then
            update
                set
                    o.quar_second_month_coll_etmt = upd.data_index,
                    o.update_user = ams.LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(ams.life_agency_code.log_id_index, 'LIFE_AGENCY_EMULATE', 'modl_quar_data 19');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_emulate_quarter o
        using
            (
                select /*+ CARDINALITY(i, 100)*/
                    i.agent_id outlet_id,
                    nvl(i.index_value_number, 0) data_index
                from ams.la_index i
                where i.record_date = add_months(trunc(valRecordDate, 'MM'), 1)
                    and i.index_code = 'REAL_PREM'
                    and i.group_code = 'LIMR'
                    and i.category_code = 'INDX'
                    and i.time_frequency = 'MONTHLY'
                    and i.type_data = 'OUTL'
            ) upd
        on (
            trunc(valRecordDate, 'MM') = o.record_date
            and
            ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_YES = o.be_executing
            and
            upd.outlet_id = o.outlet_id
        )
        when matched then
            update
                set
                    o.quar_second_month_coll_real = upd.data_index,
                    o.update_user = ams.LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(ams.life_agency_code.log_id_index, 'LIFE_AGENCY_EMULATE', 'modl_quar_data 20');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_emulate_quarter o
        using
            (
                select /*+ CARDINALITY(i, 100)*/
                    i.agent_id outlet_id,
                    nvl(i.index_value_number, 0) data_index
                from ams.la_index i
                where i.record_date = add_months(trunc(valRecordDate, 'MM'), 2)
                    and i.index_code = 'INVO_PREM'
                    and i.group_code = 'LIMR'
                    and i.category_code = 'INDX'
                    and i.time_frequency = 'MONTHLY'
                    and i.type_data = 'OUTL'
            ) upd
        on (
            trunc(valRecordDate, 'MM') = o.record_date
            and
            ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_YES = o.be_executing
            and
            upd.outlet_id = o.outlet_id
        )
        when matched then
            update
                set
                    o.quar_third_month_coll_etmt = upd.data_index,
                    o.update_user = ams.LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(ams.life_agency_code.log_id_index, 'LIFE_AGENCY_EMULATE', 'modl_quar_data 21');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_emulate_quarter o
        using
            (
                select /*+ CARDINALITY(i, 100)*/
                    i.agent_id outlet_id,
                    nvl(i.index_value_number, 0) data_index
                from ams.la_index i
                where i.record_date = add_months(trunc(valRecordDate, 'MM'), 2)
                    and i.index_code = 'REAL_PREM'
                    and i.group_code = 'LIMR'
                    and i.category_code = 'INDX'
                    and i.time_frequency = 'MONTHLY'
                    and i.type_data = 'OUTL'
            ) upd
        on (
            trunc(valRecordDate, 'MM') = o.record_date
            and
            ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_YES = o.be_executing
            and
            upd.outlet_id = o.outlet_id
        )
        when matched then
            update
                set
                    o.quar_third_month_coll_real = upd.data_index,
                    o.update_user = ams.LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(ams.life_agency_code.log_id_index, 'LIFE_AGENCY_EMULATE', 'modl_quar_data 22');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        update ams.la_emulate_quarter o
        set
            o.quar_period_coll_etmt = nvl(o.quar_first_month_coll_etmt, 0) +
                                                     nvl(o.quar_second_month_coll_etmt, 0) +
                                                     nvl(o.quar_third_month_coll_etmt, 0),
            o.quar_period_coll_real = nvl(o.quar_first_month_coll_real, 0) +
                                                     nvl(o.quar_second_month_coll_real, 0) +
                                                     nvl(o.quar_third_month_coll_real, 0),
            o.update_user = ams.LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
            o.update_datetime = sysdate
        where o.record_date = trunc(valRecordDate, 'MM')
            and o.be_executing = ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_YES;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(ams.life_agency_code.log_id_index, 'LIFE_AGENCY_EMULATE', 'modl_quar_data 23');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        update ams.la_emulate_quarter o
        set
            o.quar_period_coll_rate =
                round(
                    decode(nvl(o.quar_period_coll_etmt, 0),
                        0, 100,
                        least(
                            (nvl(o.quar_period_coll_real, 0) / nvl(o.quar_period_coll_etmt, 0)) * 100,
                            999.99
                        )
                    ),
                    2
                ),
            o.update_user = ams.LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
            o.update_datetime = sysdate
        where o.record_date = trunc(valRecordDate, 'MM')
            and o.be_executing = ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_YES;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(ams.life_agency_code.log_id_index, 'LIFE_AGENCY_EMULATE', 'modl_quar_data 24');
    end;

    procedure modl_quar_close(valRecordDate date := null)
    is
    begin
        /* Ket thuc qua trinh tinh thu lao quy dai ly
           trong bang ams.la_direct_agqr*/
        update ams.la_emulate_quarter o
        set
            o.be_executing = ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_NO,
            o.update_user = LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
            o.update_datetime = sysdate
        where o.record_date = trunc(valRecordDate, 'MM')
            and o.be_executing = ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_YES;
        commit;
    end;

    procedure run_year(valRecordDate date := null,
        valCompanyID number := null)
    is
    begin
        ams.life_agency_emulate_exe.modl_exp_year_curr(valRecordDate, valCompanyID);
        ams.life_agency_emulate_exe.modl_year_open(valRecordDate);
        ams.life_agency_emulate_exe.modl_year_data(valRecordDate);
        ams.life_agency_emulate_exe.modl_year_close(valRecordDate);
    end;

    procedure modl_exp_year_curr(valRecordDate date := null,
        valCompanyID number := null)
    is
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Xoa du lieu dai ly*/
        loop
            delete ams.la_emulate_year del
            where del.record_date = trunc(valRecordDate, 'YYYY')
                and del.status_code = ams.LIFE_AGENCY_EMULATE_EXE.STATUS_CURR
                and
                (
                    del.company_id = nvl(valCompanyID, 0)
                    or
                    nvl(valCompanyID, 0) = 0
                )
                and rownum < ams.LIFE_AGENCY_EMULATE_EXE.RECORD_MAX_DELETE;
            exit when SQL%rowcount < ams.LIFE_AGENCY_EMULATE_EXE.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(ams.life_agency_code.log_id_index, 'LIFE_AGENCY_EMULATE', 'modl_exp_outl_curr 1');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        insert /*+ APPEND */ into ams.la_emulate_year nologging(
            outlet_id,
            outlet_ams_id,
            record_date,
            version_date,
            status_code,
            outlet_name,
            company_id,
            company_ams_id,
            company_name,
            office_id,
            office_ams_id,
            office_name,
            agency_id,
            agency_ams_id,
            agency_name,
            unit_id,
            unit_ams_id,
            unit_name,
            position_code,
            position_date,
            effective_date,
            terminative_date,
            be_executing,
            create_user,
            update_user,
            create_datetime,
            update_datetime)
        select /*+ CARDINALITY(outl, 100)*/
            outl.outlet_id,
            outl.outlet_ams_id,
            trunc(valRecordDate, 'YYYY'),
            trunc(sysdate, 'DD'),
            ams.LIFE_AGENCY_EMULATE_EXE.STATUS_CURR,
            outl.outlet_name,
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
            outl.position_code,
            outl.position_date,
            outl.effective_date,
            outl.terminative_date,
            ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_YES,
            ams.LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
            ams.LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.serv_outlet_data outl
        where outl.record_date = var_record_date
            and outl.type_code = ams.LIFE_AGENCY_EMULATE_EXE.MODULE_CODE_MAIN
            and outl.status_code = ams.LIFE_AGENCY_EMULATE_EXE.OBJECT_STATUS_ACTIVE
            and
            (
                outl.company_id = nvl(valCompanyID, 0)
                or
                nvl(valCompanyID, 0) = 0
            )
            and outl.terminative_date is null;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(ams.life_agency_code.log_id_index, 'LIFE_AGENCY_EMULATE', 'modl_exp_outl_curr 1.1');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        --Sau do thi merge cac thong tin ve effective_date
        --o trong bang la_history_agent  va lay cac thong tin ve ngay tro thanh chinh thuc TVV truc tiep cua no vao day
        --Sau do se tinh ra tham nien senr_by_months luon o day
        update ams.la_emulate_year tmp
        set
            tmp.senior_by_months =
                round(
                    months_between(
                        add_months(trunc(valRecordDate, 'YYYY'),12) - 1,
                        trunc(tmp.effective_date, 'MM')
                    )
                ),
            tmp.update_user = ams.LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
            tmp.update_datetime = sysdate
        where tmp.record_date = trunc(valRecordDate, 'MM')
            and tmp.be_executing = ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_YES;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(ams.life_agency_code.log_id_index, 'LIFE_AGENCY_EMULATE', 'modl_exp_outl_curr 2');
    end;

    procedure modl_year_open(valRecordDate date := null)
    is
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Len danh sach Tu van vien duoc tra thu lao thu phi*/
        update ams.la_emulate_year o
        set
            o.from_date = trunc(valRecordDate, 'YYYY'),
            o.to_date = add_months(trunc(valRecordDate, 'YYYY'),12) - 1,
            o.year_first_quarter_acti_qty = 0,
            o.year_first_quarter_fyp  = 0,
            o.year_first_quarter_pr36 = 0,
            o.year_first_quarter_coll_rate = 0,
            o.year_second_quarter_acti_qty = 0,
            o.year_second_quarter_fyp = 0,
            o.year_second_quarter_pr36 = 0,
            o.year_second_quarter_coll_rate = 0,
            o.year_third_quarter_acti_qty = 0,
            o.year_third_quarter_fyp = 0,
            o.year_third_quarter_pr36  = 0,
            o.year_third_quarter_coll_rate  = 0,
            o.year_fourth_quarter_acti_qty = 0,
            o.year_fourth_quarter_fyp = 0,
            o.year_fourth_quarter_pr36 = 0,
            o.year_fourth_quarter_coll_rate = 0,
            o.update_user = ams.LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
            o.update_datetime = sysdate
        where o.record_date = trunc(valRecordDate, 'MM')
            and o.be_executing = ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_YES
            and o.status_code = ams.LIFE_AGENCY_EMULATE_EXE.STATUS_CURR;
        commit;

        update ams.la_emulate_year o
        set
            o.from_date = o.effective_date,
            o.update_user = ams.LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
            o.update_datetime = sysdate
        where o.record_date = trunc(valRecordDate, 'MM')
            and o.be_executing = ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_YES
            and o.status_code = ams.LIFE_AGENCY_EMULATE_EXE.STATUS_CURR
            and o.from_date < o.effective_date;
        commit;

        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_emulate_year o
        using
            (
                select /*+ CARDINALITY(code, 100)*/
                    code.code_code position_code,
                    code.code_value position_name
                from ams.cla_codes code
                where code.code_language = ams.LIFE_AGENCY_EMULATE_EXE.THEME_LANGUAGE
                    and code.code_group = ams.LIFE_AGENCY_EMULATE_EXE.OUTLET_INFO_TYPE_POSI
                    and trunc(sysdate, 'DD')
                        between nvl(code.from_date, ams.LIFE_AGENCY_EMULATE_EXE.DATE_MIN_VALUE)
                        and nvl(code.to_date, ams.LIFE_AGENCY_EMULATE_EXE.DATE_MAX_VALUE)
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_YES = o.be_executing
            and
            upd.position_code = o.position_code
        )
        when matched then
            update
                set
                    o.position_name = upd.position_name,
                    o.update_user = ams.LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
                    o.update_datetime = sysdate;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(ams.life_agency_code.log_id_index, 'LIFE_AGENCY_EMULATE', 'modl_quar_open');
    end;

    procedure modl_year_data(valRecordDate date := null)
    is
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_emulate_year o
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_ams_id,
                    tmp.quar_period_acti_qty,
                    tmp.quar_period_fyp,
                    tmp.quar_period_pr36,
                    tmp.quar_period_coll_rate
                from ams.la_emulate_quarter tmp
                where tmp.record_date = trunc(valRecordDate, 'YYYY')
                    and tmp.be_executing = ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_NO
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_YES = o.be_executing
            and
            upd.outlet_ams_id = o.outlet_ams_id
        )
        when matched then
            update
                set
                    o.year_first_quarter_acti_qty = upd.quar_period_acti_qty,
                    o.year_first_quarter_fyp = upd.quar_period_fyp,
                    o.year_first_quarter_pr36 = upd.quar_period_pr36,
                    o.year_first_quarter_coll_rate = upd.quar_period_coll_rate,
                    o.update_user = ams.LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(ams.life_agency_code.log_id_index, 'LIFE_AGENCY_EMULATE', 'modl_year_data 1');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_emulate_year o
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_ams_id,
                    tmp.quar_period_acti_qty,
                    tmp.quar_period_fyp,
                    tmp.quar_period_pr36,
                    tmp.quar_period_coll_rate
                from ams.la_emulate_quarter tmp
                where tmp.record_date = add_months(trunc(valRecordDate, 'YYYY'), 3)
                    and tmp.be_executing = ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_NO
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_YES = o.be_executing
            and
            upd.outlet_ams_id = o.outlet_ams_id
        )
        when matched then
            update
                set
                    o.year_second_quarter_acti_qty = upd.quar_period_acti_qty,
                    o.year_second_quarter_fyp = upd.quar_period_fyp,
                    o.year_second_quarter_pr36 = upd.quar_period_pr36,
                    o.year_second_quarter_coll_rate = upd.quar_period_coll_rate,
                    o.update_user = ams.LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(ams.life_agency_code.log_id_index, 'LIFE_AGENCY_EMULATE', 'modl_year_data 2');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_emulate_year o
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_ams_id,
                    tmp.quar_period_acti_qty,
                    tmp.quar_period_fyp,
                    tmp.quar_period_pr36,
                    tmp.quar_period_coll_rate
                from ams.la_emulate_quarter tmp
                where tmp.record_date = add_months(trunc(valRecordDate, 'YYYY'), 6)
                    and tmp.be_executing = ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_NO
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_YES = o.be_executing
            and
            upd.outlet_ams_id = o.outlet_ams_id
        )
        when matched then
            update
                set
                    o.year_third_quarter_acti_qty = upd.quar_period_acti_qty,
                    o.year_third_quarter_fyp = upd.quar_period_fyp,
                    o.year_third_quarter_pr36 = upd.quar_period_pr36,
                    o.year_third_quarter_coll_rate = upd.quar_period_coll_rate,
                    o.update_user = ams.LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(ams.life_agency_code.log_id_index, 'LIFE_AGENCY_EMULATE', 'modl_year_data 3');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_emulate_year o
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_ams_id,
                    tmp.quar_period_acti_qty,
                    tmp.quar_period_fyp,
                    tmp.quar_period_pr36,
                    tmp.quar_period_coll_rate
                from ams.la_emulate_quarter tmp
                where tmp.record_date = add_months(trunc(valRecordDate, 'YYYY'), 9)
                    and tmp.be_executing = ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_NO
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_YES = o.be_executing
            and
            upd.outlet_ams_id = o.outlet_ams_id
        )
        when matched then
            update
                set
                    o.year_fourth_quarter_acti_qty = upd.quar_period_acti_qty,
                    o.year_fourth_quarter_fyp = upd.quar_period_fyp,
                    o.year_fourth_quarter_pr36 = upd.quar_period_pr36,
                    o.year_fourth_quarter_coll_rate = upd.quar_period_coll_rate,
                    o.update_user = ams.LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
                    o.update_datetime = sysdate;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(ams.life_agency_code.log_id_index, 'LIFE_AGENCY_EMULATE', 'modl_year_data 4');
    end;

    procedure modl_year_close(valRecordDate date := null)
    is
    begin
        /* Ket thuc qua trinh tinh thu lao quy dai ly
           trong bang ams.la_direct_agqr*/
        update ams.la_emulate_year o
        set
            o.be_executing = ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_NO,
            o.update_user = LIFE_AGENCY_EMULATE_EXE.SYSTEM_USER,
            o.update_datetime = sysdate
        where o.record_date = trunc(valRecordDate, 'YYYY')
            and o.be_executing = ams.LIFE_AGENCY_EMULATE_EXE.BE_EXECUTING_YES;
        commit;
    end;

end LIFE_AGENCY_EMULATE_EXE;
/
