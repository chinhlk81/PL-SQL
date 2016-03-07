create or replace package ams.LIFE_AGENCY_INVOICE is

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

    UVL_DEBIT_CODE VARCHAR2(32) := 'NO PHI'; --xoa truoc thang tinh day
    UVL_PLAN_CODE  VARCHAR2(32) := 'PHAI THU'; --xoa truoc thang tinh day
    UVL_CREDIT_CODE  VARCHAR2(32) := 'THUC THU'; --xoa truoc thang tinh day

    UVL_INV_NOT_COLLECT VARCHAR2(64) := 'No phi do chua thu duoc';
    UVL_INV_COLLECT_AFTER VARCHAR2(64) := 'No phí do thu trong các tháng truoc dó';
    UVL_INV_CANCEL_INV VARCHAR2(64) := 'No phí do huy HÐ trong tháng';

    UVL_COLLECT_PLAN VARCHAR2(64) := 'Phai thu trong tháng';

    UVL_CREDIT_PREMIUM VARCHAR2(64) := 'Thuc thu trong tháng';

    procedure daily_invoice;

    procedure daily_invoice_gui(valRecordDate date := null,
        row_records out sys_refcursor);

    procedure main(valRecordDate date := null);

    procedure inv_prepare(valRecordDate date := null,
        valTypeOfData varchar2 := null,
        valCompanyID number := null,
        valSessionId number := null);

    procedure bvl_clear_data(valRecordDate date := null,
        valTypeOfData varchar2 := null,
        valCompanyID number := null,
        valSessionId number := null);

    procedure bvl_get_invoice(valRecordDate date := null,
        valTypeOfData varchar2 := null,
        valCompanyID number := null,
        valSessionId number := null);

/*    procedure tal_prepare(valRecordDate date := null,
        valTypeOfData varchar2 := null,
        valCompanyID number := null,
        valSessionId number := null);*/

    procedure tal_clear_data(valRecordDate date := null,
        valTypeOfData varchar2 := null,
        valCompanyID number := null,
        valSessionId number := null);

    procedure tal_get_invoice(valRecordDate date := null,
        valTypeOfData varchar2 := null,
        valCompanyID number := null,
        valSessionId number := null);
end LIFE_AGENCY_INVOICE;
/
create or replace package body ams.LIFE_AGENCY_INVOICE is
    --chinhlk 10/10/2012 sua lai RECORD_MAX_DELETE cho dung 111
    --bo di cac dieu kien rang buoc ve phi tam thu khi chua phat hanh hop dong
    /*thu tuc de goi cho no va hang ngay chay cho no */
    /*chinhlk 28/2/2013 sua lai do co 1 vai loi ve du lieu dai ly*/
    procedure daily_invoice
    is
    begin
        if AMS_CORE_MODULE.is_active('REPORT_INV_JOB', (trunc(sysdate, 'DD') - 1))
                = AMS_CORE_MODULE.IS_YES then
            --chay du lieu tu dau thang cho no luon cho no nhanh
            ams.LIFE_AGENCY_INVOICE.main(trunc((trunc(sysdate, 'DD') - 1), 'MM'));
        end if;
    exception
        when others then
            rollback;
            life_agency_log.write_log(-999,
                'loi tai thu tuc: daily_invoice_gui',
                sqlerrm,
                sqlcode);
    end;

    procedure daily_invoice_gui(valRecordDate date := null,
        row_records out sys_refcursor)
    is
      var_record_date date := trunc(valRecordDate, 'MM');
      var_error_message varchar2(3000) := null;
      v number(12,2):=0;
    begin
        if AMS_CORE_MODULE.is_active('REPORT_INV_JOB', (trunc(sysdate, 'DD') - 1))
                = AMS_CORE_MODULE.IS_YES then
            --chay du lieu tu dau thang cho no luon cho no nhanh
            ams.LIFE_AGENCY_INVOICE.main(var_record_date);
        end if;
        open row_records for
        select '1' from dual;
    exception
        when others then
            rollback;
            life_agency_log.write_log(-999,
                'loi tai thu tuc: daily_invoice_gui',
                sqlerrm,
                sqlcode);
            var_error_message := sqlerrm;
            open row_records for
            select var_error_message from dual;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 1/10/2012
        Version: 1.0
        Description: Thu tuc  chinh de chay bao cao no phi
        Parameter:
            valRecordDate [date]: Thang ghi nhan
        Update:  Le Khac Chinh
            Version: 1.1
            Date Updated: 18/9/2013
            Note:  Them phan chay du lieu thong tin khach hang luon vao day
    */

    procedure main(valRecordDate date := null)
    is
        var_run_from_time date := sysdate;
        var_run_to_time date := sysdate;
        var_session_id number(14) := 0;
        var_record_date date := trunc(valRecordDate, 'MM');
    begin
        var_run_from_time := sysdate;
        /* POLICY*/

        var_session_id := dbms_random.value(1,10000);

        life_agency_invoice_customer.get_customer(var_record_date);
        --dau tien lay cho thong tin khach hang truoc de no chay truoc
        --cai nay chay auto duoc va da chay kem voi thu tuc o phia tren roi nen la khong can chay lai o phia duoi nay
        --ams.life_agency_invoice_customer.tal_get_customer(var_session_id);
        --de lay so lieu cho no ca o BVL va TAL cho no dung hon

        ams.LIFE_AGENCY_INVOICE.inv_prepare(var_record_date,
            ams.LIFE_AGENCY_INVOICE.MODULE_CODE_MAIN,
            0,
            var_session_id);

        ams.LIFE_AGENCY_INVOICE.bvl_clear_data(var_record_date,
            ams.LIFE_AGENCY_INVOICE.MODULE_CODE_MAIN,
            0,
            var_session_id);

        ams.LIFE_AGENCY_INVOICE.bvl_get_invoice(var_record_date,
            ams.LIFE_AGENCY_INVOICE.MODULE_CODE_MAIN,
            0,
            var_session_id);


/*        ams.LIFE_AGENCY_INVOICE.tal_prepare(var_record_date,
            ams.LIFE_AGENCY_INVOICE.MODULE_CODE_MAIN,
            0,
            var_session_id);*/
        --neu cho phep chay so lieu o phan Talisman thi se lam nhu sau...

        ams.LIFE_AGENCY_INVOICE.tal_clear_data(var_record_date,
            ams.LIFE_AGENCY_INVOICE.MODULE_CODE_MAIN,
            0,
            var_session_id);

        ams.LIFE_AGENCY_INVOICE.tal_get_invoice(var_record_date,
            ams.LIFE_AGENCY_INVOICE.MODULE_CODE_MAIN,
            0,
            var_session_id);

        var_run_to_time := sysdate;
        ams.life_agency_log.time_log(0, 'Tat ca cac cong ty', var_run_from_time, var_run_to_time);
    exception
        when others then
            life_agency_log.write_log(-999,
                'loi tai thu tuc: ams.LIFE_AGENCY_INVOICE.mail',
                sqlerrm,
                sqlcode);
    end;

    procedure inv_prepare(valRecordDate date := null,
        valTypeOfData varchar2 := null,
        valCompanyID number := null,
        valSessionId number := null)
    is
        var_record_date date := trunc(valRecordDate, 'MM');
        var_branch_id_string varchar2(10) := nvl(to_char(valCompanyID), '%');
        --lay du lieu trong vong 1 thang thoi nhe
        var_from_date date := trunc(valRecordDate, 'MM');
        --cuoi thang la cuoi thang nay luon cho no de tinh
        var_to_date date := add_months(trunc(valRecordDate, 'MM'), 1) - 1;
        --quay lai cac dai ly da nghi viec trong 5 nam
        var_outlet_from_date date := add_months(var_record_date, -60);
        var_outlet_to_date date := add_months(var_record_date, -1);

        var_company_id  number := null;
        var_error_pos  number(8, 2) := null;

        var_run_from_time date := sysdate;
        var_run_to_time date := sysdate;

        var_session_id number(14) := 0;
        var_version_date date := trunc(sysdate, 'DD');

        var_invoice_from_date date := trunc(add_months(var_record_date, -6), 'DD');

        var_query varchar(32000) := '';

        var_run_begin_time date := sysdate;
        var_run_end_time date := sysdate;
    begin
        /* Xoa du lieu hoa don
        trong 1 thang di da*/
        var_run_begin_time := sysdate;
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        var_session_id := valSessionId;

        --xoa bang ma da dua vao
        execute immediate 'truncate table ams.la_inv_outlet_tmp';
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE', 'truncate la_inv_outlet_tmp thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 1;

        /*xoa du lieu cua bang tam truoc khi dua vao*/
        --execute immediate 'truncate table ams.la_inv_outlet_tmp';

        --lay cac so lieu ve dai ly vao bang tam de tinh cho de
        insert /*+ APPEND */ into ams.la_inv_outlet_tmp nologging
        select /*+ CARDINALITY(outl, 100)*/
            var_session_id,
            var_record_date,
            outl.outlet_id,
            var_version_date,
            ams.LIFE_AGENCY_INVOICE.STATUS_CURR,
            outl.outlet_ams_id,
            outl.outlet_ams_id,
            substr(outl.outlet_ams_id, 2) outlet_bvl_id,
            outl.outlet_name,
            outl.position_code,
            null,--position_name,
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
            ams.LIFE_AGENCY_INVOICE.SYSTEM_USER,
            ams.LIFE_AGENCY_INVOICE.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.serv_outlet_data outl
        where outl.record_date = var_record_date
            and outl.type_code = ams.LIFE_AGENCY_INVOICE.MODULE_CODE_MAIN
            and outl.status_code = ams.LIFE_AGENCY_INVOICE.OBJECT_STATUS_ACTIVE;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE', 'lay so lieu outlet dang lam thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 2;

        insert /*+ APPEND */ into ams.la_inv_outlet_tmp nologging
        select /*+ CARDINALITY(outl, 100)  */
            var_session_id,
            var_record_date,
            outl.outlet_id,
            var_version_date,
            ams.LIFE_AGENCY_INVOICE.STATUS_TERM,
            outl.outlet_ams_id,
            outl.outlet_ams_id,
            substr(outl.outlet_ams_id, 2) outlet_bvl_id,
            outl.outlet_name,
            outl.position_code,
            null,--position_name,
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
            ams.LIFE_AGENCY_INVOICE.SYSTEM_USER,
            ams.LIFE_AGENCY_INVOICE.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.serv_outlet_data outl
        where outl.record_date
                between var_outlet_from_date
                and var_outlet_to_date
            and outl.type_code = ams.LIFE_AGENCY_INVOICE.MODULE_CODE_MAIN
            and outl.status_code = ams.LIFE_AGENCY_INVOICE.OBJECT_STATUS_ACTIVE
            and outl.terminative_date is not null;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE', 'lay dai ly nghi viec quay lai 60 thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 2.1;

          /*ten chuc vu cua dai ly cap nhat vao day*/
         merge  /*+ CARDINALITY(o, 100)
                    CARDINALITY(upd, 100)
                    LEADING(o upd) */
              into ams.la_inv_outlet_tmp o
          using
              (
                  select  /*+ CARDINALITY(code, 100)*/
                      code.code_code position_code,
                      code.code_value position_name
                  from ams.cla_codes code
                  where code.code_language = ams.LIFE_AGENCY_INVOICE.THEME_LANGUAGE
                      and code.code_group = ams.LIFE_AGENCY_INVOICE.OUTLET_INFO_TYPE_POSI
                      and trunc(sysdate, 'DD')
                          between nvl(code.from_date, ams.LIFE_AGENCY_INVOICE.DATE_MIN_VALUE)
                          and nvl(code.to_date, ams.LIFE_AGENCY_INVOICE.DATE_MAX_VALUE)
              ) upd
          on (
              var_session_id = o.session_id
              and
              upd.position_code = o.position_code
          )
          when matched then
              update
                  set
                      o.position_name = upd.position_name,
                      o.update_datetime = sysdate;
         commit;

          /*ma chuc vu cua dai ly da nghi viec*/
         merge  /*+ CARDINALITY(o, 100)
                    CARDINALITY(upd, 100)
                    LEADING(o upd) */
              into ams.la_inv_outlet_tmp o
          using
              (
                  select   /*+ CARDINALITY(lha, 100)*/
                      lha.agent_id outlet_id,
                      max(lha.history_value) position_code
                  from ams.la_history_agent lha
                  where lha.type_code = 'CVDL_CODE'
                      and lha.current_is = 'Y'
                  group by lha.agent_id
              ) upd
          on (
              var_session_id = o.session_id
              and
              upd.outlet_id = o.outlet_id
              and
              o.position_name is null
          )
          when matched then
              update
                  set
                      o.position_code = upd.position_code,
                      o.update_datetime = sysdate;
        commit;

        --lay them mot lan nua thi no moi lay dc het so lieu cho no
         /*ten chuc vu cua dai ly cap nhat vao day*/
         merge  /*+ CARDINALITY(o, 100)
                    CARDINALITY(upd, 100)
                    LEADING(o upd) */
              into ams.la_inv_outlet_tmp o
          using
              (
                  select  /*+ CARDINALITY(code, 100)*/
                      code.code_code position_code,
                      code.code_value position_name
                  from ams.cla_codes code
                  where code.code_language = ams.LIFE_AGENCY_INVOICE.THEME_LANGUAGE
                      and code.code_group = ams.LIFE_AGENCY_INVOICE.OUTLET_INFO_TYPE_POSI
                      and trunc(sysdate, 'DD')
                          between nvl(code.from_date, ams.LIFE_AGENCY_INVOICE.DATE_MIN_VALUE)
                          and nvl(code.to_date, ams.LIFE_AGENCY_INVOICE.DATE_MAX_VALUE)
              ) upd
          on (
              var_session_id = o.session_id
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
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE', 'lay ma chuc vu cua dai ly da nghi viec ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 3;

        dbms_stats.gather_table_stats(null, 'la_inv_outlet_tmp', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE', 'gather la_inv_outlet_tmp  thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 4;

        --xoa du lieu o bang dich du lieu trong thang day
        loop
            delete ams.la_inv_outlet del
            where del.record_date = var_record_date
                and rownum < ams.LIFE_AGENCY_INVOICE.RECORD_MAX_DELETE;
            exit when SQL%rowcount < ams.LIFE_AGENCY_INVOICE.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE', 'xoa bang la_inv_outlet  thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 5;

        --sau do do tat cac cac  du lieu tu bang la_inv_invoice_ext vao trong bang la_inv_invoice_ext
        insert /*+ APPEND */ into ams.la_inv_outlet nologging
        select /*+ CARDINALITY(tmp, 100)*/
            tmp.*
        from ams.la_inv_outlet_tmp tmp
        where tmp.session_id = var_session_id;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE', 'do dl len bang la_inv_outlet  thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        var_run_end_time := sysdate;
        ams.life_agency_log.time_log(1001, 'Thoi gian chay', var_run_begin_time, var_run_end_time);
        exception
            when others then
                rollback;
                life_agency_log.write_log(1000,
                    'get_invoice_tal: loi thu tuc inv_prepare ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                    sqlerrm,
                    sqlcode);
    end;

    procedure bvl_clear_data(valRecordDate date := null,
        valTypeOfData varchar2 := null,
        valCompanyID number := null,
        valSessionId number := null)
    is
        var_record_date date := trunc(valRecordDate, 'MM');
        var_branch_id_string varchar2(10) := nvl(to_char(valCompanyID), '%');
        --lay du lieu trong vong 1 thang thoi nhe
        var_company_id  number := null;
        var_error_pos  number(8, 2) := null;

        var_run_from_time date := sysdate;
        var_run_to_time date := sysdate;

        var_session_id number(14) := 0;
        var_version_date date := trunc(sysdate, 'DD');
        var_run_begin_time date := sysdate;
        var_run_end_time date := sysdate;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        --xoa du lieu cua ban can xoa truoc khi thuc hien
        loop
            delete ams.la_inv_invoice del
            where del.record_date = var_record_date
                and del.type_code = valTypeOfData
                and del.source_of_data = ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_BVLIFE
                and rownum < ams.LIFE_AGENCY_INVOICE.RECORD_MAX_DELETE;
            exit when SQL%rowcount < ams.LIFE_AGENCY_INVOICE.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE', ' xoa dl lan chay thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /*xoa du lieu cua bang tam truoc khi dua vao*/

        execute immediate 'truncate table ams.la_inv_bvl_invoice_tmp';
        commit;
        execute immediate 'truncate table ams.la_inv_bvl_credit_total_tmp';
        commit;
        /*xoa du lieu cua bang tam truoc khi dua vao*/
        execute immediate 'truncate table ams.la_inv_invoice_ext';
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE', 'truncate cac bang tam thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        exception
            when others then
                rollback;
                life_agency_log.write_log(1000,
                    'bvl_clear_data: loi thu tuc xoa du lieu bang tam',
                    sqlerrm,
                    sqlcode);
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 1/10/2012
        Version: 1.0
        Description: Thu tuc  do du lieu vao bang hoa don cac du lieu tu BVL
        Parameter:
            valRecordDate [date]: Thang ghi nhan
            valTypeOfData [varchar2]: Kieu du lieu
            valCompanyID [number]: Ma cong ty
            valSessionId [number]: Session ID
        Update:  Le Khac Chinh
            Version: 1.1
            Date Updated: 18/9/2013
            Note:  Fix theo ID: 113056 lay so hoa don va so dien thoai khach hang vao
                                          Loai bo cac hop dong da chuyen tinh di tinh khac
        Update:  Le Khac Chinh
            Version: 1.2
            Date Updated: 13/12/2013
            Note:  Fix theo ID: 123671 khong lay cac hop dong vay phi va tra vay
    */
    procedure bvl_get_invoice(valRecordDate date := null,
        valTypeOfData varchar2 := null,
        valCompanyID number := null,
        valSessionId number := null)
    is
        var_record_date date := trunc(valRecordDate, 'MM');
        var_str_record_date varchar2(64) := to_char(trunc(valRecordDate, 'MM'), 'DD-MON-YYYY');

        var_branch_id_string varchar2(10) := nvl(to_char(valCompanyID), '%');
        --lay du lieu trong vong 1 thang thoi nhe
        var_from_date date := trunc(valRecordDate, 'MM');

        --cuoi thang la cuoi thang nay luon cho no de tinh
        var_to_date date := add_months(trunc(valRecordDate, 'MM'), 1) - 1;

        var_str_from_date varchar2(64) := to_char(trunc(valRecordDate, 'MM'), 'DD-MON-YYYY');
        var_str_to_date varchar2(64) := to_char(add_months(trunc(valRecordDate, 'MM'), 1) - 1, 'DD-MON-YYYY');

        var_str_from_collected_date varchar2(64)  := to_char(add_months(trunc(valRecordDate, 'MM'), -3), 'DD-MON-YYYY');
        var_from_collected_date varchar2(64)  := add_months(trunc(valRecordDate, 'MM'), -3);


        var_outlet_from_date date := add_months(var_record_date, -12);
        var_outlet_to_date date := add_months(var_record_date, -1);

        var_company_id  number := null;
        var_error_pos  number(8, 2) := null;

        var_run_from_time date := sysdate;
        var_run_to_time date := sysdate;

        var_session_id number(14) := 0;
        var_version_date date := trunc(sysdate, 'DD');

        --var_version_date date := to_char(sysdate, 'DD-MMM-YYYY');
        --chi lay cac hoa don thuc thu cua cac hop dong do ma co ngay thuc thu back lai 3 thang cho nhanh
        var_invoice_from_date date := trunc(add_months(var_record_date, -3), 'DD');
        var_str_invoice_from_date varchar2(64) :=  to_char(add_months(trunc(valRecordDate, 'MM'), -3), 'DD-MON-YYYY');

        var_query varchar(32000) := '';

        var_run_begin_time date := sysdate;
        var_run_end_time date := sysdate;
    begin
        /* Xoa du lieu hoa don
        trong 1 thang di da*/
        var_run_begin_time := sysdate;
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 1;

        var_session_id := valSessionId;

        for list_databse in (
            select bvl.id,
                bvl.schema,
                bvl.link,
                bvl.name
            from ams.sys_database_bvlife bvl
            where bvl.status = 'Y'
        )
        loop
            var_run_begin_time := sysdate;
            var_error_pos := 1;

            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;

            execute immediate 'truncate table ams.la_inv_bvl_invoice_tmp';
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(list_databse.id, 'LIFE_AGENCY_INVOICE.bvl_get_invoice', 'truncate  la_inv_bvl_invoice_tmp cty  ' || list_databse.name || '  ' ||   to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 1.1;

             --lay ke hoach thu vao bang la_inv_bvl_collect_plan_tmp
            var_query := ' begin
                insert /*+ APPEND */ into ams.la_inv_bvl_invoice_tmp nologging
                select  /*+ CARDINALITY(hh, 100) CARDINALITY(hd, 100)*/ '||
                    var_session_id || ', ' || '
                    to_date(' ||chr(39) || var_record_date || chr(39) || '),
                    hh.dl_id,'||
                    chr(39)||'D'||chr(39)||' || hh.dl_id,
                    to_date(' ||chr(39) || var_version_date || chr(39) || '),
                    ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_BVLIFE,'||'
                    null, '
                    || chr(39) || list_databse.id || chr(39) || ',
                    hh.hd_id,
                    hh.dk_nop,
                    hd.sohdon,--invoice_number
                    hh.tu_ngay,
                    hh.den_ngay,
                    hh.ngay_dk,
                    hh.so_phi_phai_thu,
                    null, --real_premium,
                    null,  --collected_date
                    hh.vayphi,
                    ams.LIFE_AGENCY_INVOICE.SYSTEM_USER,
                    ams.LIFE_AGENCY_INVOICE.SYSTEM_USER,
                    sysdate,
                    sysdate,
                    null,
                    case when hh.vayphi = 0
                            and hh.vayphithangtruoc = 1
                            and hh.tu_ngay < to_date(' ||chr(39) || var_str_record_date || chr(39) || ')
                        then 1
                    end
                  from
                  (
                      select /*+ CARDINALITY(tmp, 100)*/  tmp.dl_id,
                          tmp.hd_id ,tmp.vayphi,tmp.ngay_dk,max(tmp.tu_ngay) tu_ngay,tmp.den_ngay,tmp.dk_nop, tmp.vayphithangtruoc,
                          sum(nvl(tmp.n1,0)+nvl(tmp.n2,0)+nvl(tmp.ns,0)) so_phi_phai_thu
                      from
                      (
                           select /*+ CARDINALITY(nt, 100) CARDINALITY(hd, 100)*/
                               nt.dl_id, nt.ngay_dk, nt.tu_ngay, nt.den_ngay,
                               nt.dk_nop,nt.hd_id,nt.no_dn,
                               nvl(nt.n1,0) n1, nvl(nt.n2,0) n2, nvl(nt.ns,0) ns,
                                '  || list_databse.schema || 'vayphi.covayphi' || list_databse.link || '(nt.hd_id,last_day(nt.no_dn)) vayphi,
                                '  || list_databse.schema || 'vayphi.covayphi' || list_databse.link || '(nt.hd_id,to_date(' ||chr(39) || var_str_record_date || chr(39) || ') - 1) vayphithangtruoc
                           from
                           (
                                select  /*+ CARDINALITY(a, 100)*/
                                          a.hd_id, a.tu_ngay,a.tgia_id, a.cty_id,a.dl_id,a.no_dn,a.sf_id,
                                          a.ngay_dk, a.den_ngay,a.dk_nop, a.n1, a.n2, a.ns
                                from '  || list_databse.schema || 'nt_no' || list_databse.link || '  a
                                where a.cty_id = '|| chr(39) || list_databse.id || chr(39) ||'
                                    and a.no_dn = to_date(' ||chr(39) || var_str_record_date || chr(39) || ')
                                    and nvl(a.n1,0) + nvl(a.n2,0) + nvl(a.ns,0) > 0
                                    and ' || list_databse.schema || 'thulao_limra.cur1_ttsp' || list_databse.link ||'(a.hd_id,a.sf_id,last_day(a.no_dn)) like '|| chr(39) ||'00%'|| chr(39) ||'
                           )nt
                           join
                           (
                               select   /*+ CARDINALITY(h, 100)*/ h.hd_id, h.ngaydau
                               from  '  || list_databse.schema || 'nt_hopdong' || list_databse.link || '  h
                           ) hd
                           on
                           (nt.hd_id=hd.hd_id and nt.tu_ngay<>hd.ngaydau
                           )
                           union all
                           select  /*+ CARDINALITY(a, 100)*/
                                a.dl_id, a.ngay_dk, a.tu_ngay, a.den_ngay, a.dky_nop,a.hd_id,add_months(last_day(a.tu_ngay)+1,-1),
                                nvl(a.phi1,0) n1, nvl(a.phi2,0) n2, nvl(a.phis,0) ns, 0, 0
                           from '  || list_databse.schema || 'nt_khthu' || list_databse.link || ' a ' || '
                           where a.cty_id = '|| chr(39) || list_databse.id || chr(39) ||'
                                and a.tu_ngay between to_date(' ||chr(39) || var_str_from_date || chr(39) || ') and to_date(' ||chr(39) || var_str_to_date || chr(39) || ')
                                and ' || list_databse.schema || 'thulao_limra.cur1_ttsp' || list_databse.link ||'(a.hd_id, a.sf_id,last_day(a.tu_ngay)) not like '|| chr(39) ||'1%'|| chr(39) ||'
                                and ' || list_databse.schema || 'vayphi.covayphi' || list_databse.link || '(a.hd_id, last_day(a.tu_ngay)) = 0
                      ) tmp
                      group by tmp.dl_id,tmp.ngay_dk,tmp.den_ngay,tmp.dk_nop,tmp.hd_id,tmp.vayphi,tmp.vayphithangtruoc
                  ) hh
                  left join
                  (
                      select   /*+ CARDINALITY(b, 100)*/
                          b.hd_id,
                          b.sohdon,
                          b.tu_ngay,
                          b.den_ngay
                      from  '  || list_databse.schema || 'nt_hdon_in' || list_databse.link || ' b
                      where b.tt not in (''02'', ''00'',''99'')
                  ) hd
                      on hh.hd_id = hd.hd_id  and hh.tu_ngay= hd.tu_ngay and hh.den_ngay = hd.den_ngay
                  where substr(' || list_databse.schema || 'hdtdoi.cur_tt_hd' || list_databse.link || '(hh.hd_id, to_date(' ||chr(39) || var_str_to_date || chr(39) || ')), 11, 1) <> ' ||chr(39) || '1' || chr(39) || ';
            end;
            ';
            --doan code tren them dieu kien neu ma ky tu thu 11 la 1 thi la no da chuyen di tinh khac roi
            --neu ma no khac 1 thi chung to do khong phai la hop dong chuyen tinh di
            --con neu = 1 thi no la hop dong chuyen tinh
            --cac truong hop khac duong nhien thi no dang o tinh hien tai
            /*case when hh.vayphi = 0
                    and hh.vayphithangtruoc = 1
                    and hh.tu_ngay < to_date(' ||chr(39) || var_str_record_date || chr(39) || ')
                then 1
            end
            Doan nay la xac dinh hop dong nay tra vay cho tu ngay do  trong thang day*/
            execute immediate var_query;
            commit;

            var_error_pos := 2;
            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(list_databse.id, 'LIFE_AGENCY_INVOICE.bvl_get_invoice', 'do  phai thu  ' || list_databse.name || '  ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;

            execute immediate 'truncate table ams.la_inv_bvl_credit_total_tmp';
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(list_databse.id, 'LIFE_AGENCY_INVOICE.bvl_get_invoice', 'truncate la_inv_bvl_credit_total_tmp  ' || list_databse.name || '  ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 2.1;

            var_query := ' begin
            insert /*+ APPEND */ into ams.la_inv_bvl_credit_total_tmp nologging'||
            ' ('||
                ' session_id,    '||
                ' version_date,    '||
                ' source_of_data,    '||
                ' company_bvl_id,    '||
                ' account_number,    '||
                ' freq_per_annum,    '||
                ' from_date,    '||
                ' to_date,    '||
                ' from_period_date,    '||
                ' premium,    '||
                ' collected_date,    '||
                ' create_user,    '||
                ' update_user,    '||
                ' create_datetime,    '||
                ' update_datetime,    '||
                ' real_invoice_number,    '||
                ' pay_loan '||
            ') '||
            ' select /*+ CARDINALITY(e1, 100)
                       CARDINALITY(e2, 100)
                       CARDINALITY(hh, 100)
                       CARDINALITY(ct, 100)
                       CARDINALITY(e3, 100)
                       CARDINALITY(e4, 100) */ '  ||
                var_session_id || ',
                to_date(' ||chr(39) || var_version_date || chr(39) || '),
                ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_BVLIFE, ' ||
                chr(39) || list_databse.id || chr(39) || ', ' ||
                ' e1.hd_id, '||
                ' e1.dk_nop, '||
                ' null, '||
                ' e1.den_ngay, '||
                ' e1.ngay_dk, '||
                ' (sum(nvl(e1.n1,0)+nvl(e1.n2,0)+nvl(e1.ns,0)) - sum(nvl(e2.n1,0)+nvl(e2.n2,0)+nvl(e2.ns,0))) phi_thuc_thu, '||
                ' max(ct.ngaykt), '||
                ' ams.LIFE_AGENCY_INVOICE.SYSTEM_USER, '||
                ' ams.LIFE_AGENCY_INVOICE.SYSTEM_USER, '||
                ' sysdate, '||
                ' sysdate,  '||
                ' null, '||
                ' null '||
                ' from '||
                ' (  '||
                    ' ( '||
                     ' select   /*+ CARDINALITY(nt, 100) CARDINALITY(hd, 100)*/ nt.no_dn, nt.hd_id, nt.tu_ngay,nt.dk_nop,nt.sf_id,nt.n1 n1,nt.n2 n2,nt.ns ns, '||
                          ' nt.cty_id,nt.dl_id,nt.ngay_dk, nt.den_ngay      '||
                     ' from '||
                       ' ( '||
                        ' select   /*+ CARDINALITY(n, 100)*/  n.no_dn, n.hd_id,n.tu_ngay,n.dk_nop,n.sf_id,n.n1 n1,n.n2 n2,n.ns ns, '||
                              ' n.cty_id,n.dl_id, n.ngay_dk, n.den_ngay '||
                         ' from '  || list_databse.schema || 'nt_no' || list_databse.link || '  n '||
                          ' where n.cty_id = '|| chr(39) || list_databse.id || chr(39) ||
                              ' and n.no_dn = to_date(' ||chr(39) || var_str_record_date || chr(39) || ') ' ||
                              ' and nvl(n.n1,0) + nvl(n.n2,0) + nvl(n.ns,0) > 0 ' ||
                              ' and ' || list_databse.schema || 'thulao_limra.cur1_ttsp' || list_databse.link ||'(n.hd_id,n.sf_id,last_day(n.no_dn)) like '|| chr(39) ||'00%'|| chr(39) ||
                         ' ) nt ' ||
                         ' join ' ||
                         ' (   '||
                              ' select   /*+ CARDINALITY(h, 100)*/  h.hd_id, h.ngaydau   '||
                              ' from  '  || list_databse.schema || 'nt_hopdong' || list_databse.link || '  h    '||
                          ' ) hd  '||
                          ' on  '||
                          ' (  '||
                            ' nt.hd_id=hd.hd_id  '||
                            ' and   '||
                            ' nt.tu_ngay <> hd.ngaydau  '||
                          ' )  '||
                      ' union all  '||
                      ' select   /*+ CARDINALITY(a, 100)*/  add_months(last_day(a.tu_ngay)+1,-1),a.hd_id, a.tu_ngay,a.dky_nop dk_nop,a.sf_id,a.phi1 n1,a.phi2 n2,a.phis ns,  '||
                          ' a.cty_id,a.dl_id, a.ngay_dk,a.den_ngay   '||
                      ' from '  || list_databse.schema || 'nt_khthu' || list_databse.link || ' a ' ||
                      ' where a.cty_id = '|| chr(39) || list_databse.id || chr(39) ||
                          ' and a.tu_ngay between to_date(' ||chr(39) || var_str_from_date || chr(39) || ') and to_date(' ||chr(39) || var_str_to_date || chr(39) || ') ' ||
                          ' and ' || list_databse.schema || 'thulao_limra.cur1_ttsp' || list_databse.link ||'(a.hd_id, a.sf_id,last_day(a.tu_ngay)) not like '|| chr(39) ||'1%'|| chr(39) ||
                    ' ) e1  '||
                    ' left join  '||
                    ' (   '||
                        ' select   /*+ CARDINALITY(n, 100)*/  n.no_dn, n.hd_id,n.tu_ngay,n.dk_nop,n.n1,n.n2,n.ns,  '||
                           ' n.dl_id, n.ngay_dk, n.den_ngay  '||
                        ' from   '||
                        ' (       '||
                            ' select /*+  CARDINALITY(a,100) */   '||
                                ' a.dl_id ,   '||
                                ' a.hd_id,  '||
                                ' a.dk_nop,  '||
                                ' a.tu_ngay,  '||
                                ' a.den_ngay,  '||
                                ' a.ngay_dk,'||
                                ' a.no_dn, '||
                                ' nvl(a.n1, 0) n1,  '||
                                ' nvl(a.n2, 0) n2,  '||
                                ' nvl(a.ns, 0) ns,  '||
                                ' a.thutu  '||
                            ' from '  || list_databse.schema || 'nt_nokh' || list_databse.link || ' a ' ||
                            ' where a.cty_id = '|| chr(39) || list_databse.id || chr(39) ||
                                ' and a.no_dn = to_date(' ||chr(39) || var_str_record_date || chr(39) || ') '||
                                ' and nvl(a.n1,0) + nvl(a.n2,0) + nvl(a.ns,0) > 0   '||
                         ' ) n  '||
                         ' inner join  '||
                         ' ( select   /*+ CARDINALITY(a, 100)*/  a.hd_id,  max(a.thutu) thutu  '||
                           ' from '  || list_databse.schema || 'nt_nokh' || list_databse.link || ' a ' ||
                           ' where a.no_dn = to_date(' ||chr(39) || var_str_record_date || chr(39) || ')'||
                           ' group by hd_id  '||
                        ' ) t  '||
                            ' on n.hd_id = t.hd_id   '||
                                ' and n.thutu = t.thutu  '||
                    ' ) e2  '||
                    ' on  '||
                    ' (  '||
                      ' e1.hd_id = e2.hd_id  '||
                      ' and  '||
                      ' e1.tu_ngay = e2.tu_ngay  '||
                    ' )  '||
                    ' left join  '||
                     ' ( ' ||
                    ' select   /*+ CARDINALITY(a, 100)*/  a.hd_id, a.tungay,max(a.ngaykt) ngaykt '||
                       ' from '  || list_databse.schema || 'nt_ct' || list_databse.link || ' a ' ||
                       ' where  a.dk_id in (''00101'',''00501'') ' ||
                          ' and a.ngaykt between to_date(' ||chr(39) || var_str_from_date || chr(39) || ') and to_date(' ||chr(39) || var_str_to_date || chr(39) || ') ' ||
                       ' group by a.tungay,  a.hd_id ' ||
                    ' ) ct  '||
                    ' on  '||
                    ' (  '||
                      ' ct.hd_id = e1.hd_id  '||
                      ' and ct.tungay = e1.tu_ngay  '||
                    ' )  '||
                ' )  '||
                ' group by e1.hd_id,e1.ngay_dk,e1.den_ngay,e1.dk_nop;  '||
            ' end '||
            ';' ;

            execute immediate var_query;
            commit;

            var_error_pos := 3;
            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(list_databse.id, 'LIFE_AGENCY_INVOICE.bvl_get_invoice', 'do  la_inv_bvl_credit_total_tmp  ' || list_databse.name || '  ' ||  to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;

            execute immediate 'truncate table ams.la_inv_bvl_credit_ext_tmp';
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(list_databse.id, 'LIFE_AGENCY_INVOICE.bvl_get_invoice', 'truncate la_inv_bvl_credit_ext_tmp  ' || list_databse.name || '  ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;

            --Cho nay lam nhu the nay la sai ma phai lam giong het nhu Hung Anh lam co nhe!!!
            --Khong la se bi sai mat day nhe!
            insert /*+ APPEND */ into ams.la_inv_bvl_credit_ext_tmp nologging
            (
                session_id,
                version_date,
                source_of_data,
                company_bvl_id,
                account_number,
                freq_per_annum,
                from_period_date,
                to_date,
                premium,
                collected_date,
                create_user,
                update_user,
                create_datetime,
                update_datetime,
                real_invoice_number,
                pay_loan
            )
            select /*+ CARDINALITY(tmp, 100)*/
                var_session_id,
                var_version_date,
                ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_BVLIFE,
                max(tmp.company_bvl_id),
                tmp.account_number,
                tmp.freq_per_annum,
                tmp.from_period_date,
                tmp.to_date,
                sum(nvl(tmp.premium, 0))  real_premium,
                max(tmp.collected_date) collected_date,
                ams.LIFE_AGENCY_INVOICE.SYSTEM_USER,
                ams.LIFE_AGENCY_INVOICE.SYSTEM_USER,
                sysdate,
                sysdate,
                max(tmp.real_invoice_number) real_invoice_number,
                max(tmp.pay_loan) pay_loan
            from ams.la_inv_bvl_credit_total_tmp tmp
            where tmp.session_id = var_session_id
                and tmp.source_of_data = ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_BVLIFE
                and tmp.company_bvl_id = list_databse.id
           group by
                tmp.account_number,
                tmp.freq_per_annum,
                tmp.from_period_date,
                tmp.to_date
           having sum(nvl(tmp.premium, 0)) <> 0;
           commit;

            var_error_pos := 4;
            /*chinhlk 28/2/2013 sua lai do co 1 vai loi ve du lieu dai ly*/
            --sau do thi  se merge thuc thu ngay thuc thu
            merge  /*+ CARDINALITY(o, 100)
                      CARDINALITY(upd, 100)
                      LEADING(o upd) */
                into ams.la_inv_bvl_invoice_tmp o
            using
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.account_number,
                        tmp.freq_per_annum,
                        tmp.from_period_date,
                        tmp.to_date,
                        sum(tmp.premium) real_premium,
                        max(tmp.collected_date) collected_date,
                        max(tmp.real_invoice_number) real_invoice_number,
                        max(tmp.pay_loan) pay_loan
                    from ams.la_inv_bvl_credit_ext_tmp tmp
                    where tmp.session_id = var_session_id
                        and tmp.source_of_data = ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_BVLIFE
                        and tmp.company_bvl_id = list_databse.id
                    group by
                        tmp.account_number,
                        tmp.freq_per_annum,
                        tmp.from_period_date,
                        tmp.to_date
                ) upd
            on (
                var_session_id = o.session_id
                and
                ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_BVLIFE = o.source_of_data
                and--cho nay can phai co dieu kien den ngay de cho no that giong voi cai cu cua no de lam cho no nhanh nhe
                upd.account_number = o.account_number
                and
                nvl(upd.from_period_date, to_date('1-jan-2099')) = nvl(o.from_period_date, to_date('1-jan-2099'))
                and
                upd.to_date = o.to_date
                and
                upd.freq_per_annum = o.freq_per_annum
            )
            when matched then
                update
                    set
                        o.real_premium = upd.real_premium,
                        o.collected_date = upd.collected_date,
                        /*o.real_invoice_number = upd.real_invoice_number,
                        o.pay_loan = upd.pay_loan,*/
                        o.update_datetime = sysdate;
            commit;

            var_error_pos := 4;
            /*chinhlk 28/2/2013 sua lai do co 1 vai loi ve du lieu dai ly*/
            --sau do thi  se merge thuc thu ngay thuc thu
/*            merge  \*+ CARDINALITY(o, 100)
                      CARDINALITY(upd, 100)
                      LEADING(o upd) *\
                into ams.la_inv_bvl_invoice_tmp o
            using
                (   \*chinhlk 4/6/2013Khong thuc hien group by o day theo dung code Hung Anh vi neu khong se bi sai*\
                    select \*+ CARDINALITY(tmp, 100)*\
                        tmp.account_number,
                        tmp.freq_per_annum,
                        tmp.from_period_date,
                        tmp.to_date,
                        tmp.premium real_premium,
                        tmp.collected_date collected_date
                    from ams.la_inv_bvl_credit_total_tmp tmp
                    where tmp.session_id = var_session_id
                        and tmp.source_of_data = ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_BVLIFE
                        and tmp.company_bvl_id = list_databse.id
                ) upd
            on (
                var_session_id = o.session_id
                and
                ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_BVLIFE = o.source_of_data
                and--cho nay can phai co dieu kien den ngay de cho no that giong voi cai cu cua no de lam cho no nhanh nhe
                upd.account_number = o.account_number
                and
                upd.from_period_date = o.from_period_date
                and
                upd.to_date = o.to_date
                and
                upd.freq_per_annum = o.freq_per_annum
            )
            when matched then
                update
                    set
                        o.real_premium = upd.real_premium,
                        o.collected_date = upd.collected_date,
                        o.update_datetime = sysdate;
            commit;*/
            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(list_databse.id, 'LIFE_AGENCY_INVOICE.bvl_get_invoice', 'do  thuc thu  ' || list_databse.name || '  ' ||to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 4.1;
            --do cac so lieu vao bang la_inv_invoice_ext  tu bang la_inv_bvl_invoice_tmp
            --de sau do se truncate bang la_inv_bvl_invoice_tmp di de lay cong ty khac vao nua
            --de chuan bi do len tat ca cho no
            insert /*+ APPEND */ into ams.la_inv_invoice_ext nologging
            (
                outlet_id,
                outlet_ams_id,
                type_code,
                record_date,
                version_date,
                status_code,
                source_of_data,
                outlet_name,
                company_id,
                company_bvl_id,
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
                position_name,
                effective_date,
                terminative_date,
                account_number,
                barcode,
                holder_name,
                insured_name,
                holder_address,
                invoice_number,
                status_invoice_code,
                coll_premium,
                real_premium,
                from_date,
                to_date,
                print_date,
                collected_date,
                is_loan,
                data_type_code,
                data_type_name,
                session_id,
                create_user,
                update_user,
                create_datetime,
                update_datetime,
                phone,
                real_invoice_number,
                pay_loan
            )
            select /*+ CARDINALITY(tmp, 100)*/
                null,--outlet_id                                     number(10),
                tmp.outlet_ams_id,
                ams.LIFE_AGENCY_INVOICE.MODULE_CODE_MAIN,
                var_record_date,
                var_version_date,--                              date,
                ams.LIFE_AGENCY_INVOICE.OBJECT_STATUS_ACTIVE, --status_code
                ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_BVLIFE,--source_of_data                          varchar2(16),
                null,--outlet_name                               nvarchar2(255),
                null,--company_id                               number(10),
                tmp.company_bvl_id,--company_bvl_id                       varchar2(16),
                null,--company_ams_id                       varchar2(16),
                null,--company_name                          nvarchar2(255),
                null,--office_id                                     number(10),
                null,--office_ams_id                             varchar2(16),
                null,--office_name                                nvarchar2(255),
                null,--agency_id                                   number(10),
                null,--agency_ams_id                          varchar2(16),
                null,--agency_name                             nvarchar2(255),
                null,--unit_id                                         number(10),
                null,--unit_ams_id                                 varchar2(16),
                null,--unit_name                                   nvarchar2(255),
                null,--position_code                             varchar2(16),
                null,--position_date                              date,
                null,--position_name                             nvarchar2(32),
                null,--effective_date                             date,
                null,--terminative_date                         date,
                tmp.account_number,--account_number   varchar2(16),
                null,--tmp.barcode,--barcode                varchar2(20),
                null,--tmp.holder_name,--holder_name         nvarchar2(255),
                null,--insured_name        nvarchar2(255),
                null,--holder_address      nvarchar2(255),
                tmp.invoice_number,--invoice_number     varchar2(32),
                null,--tmp.status_invoice_code,--status_invoice_code          varchar2(2),
                tmp.coll_premium,
                tmp.real_premium,--real_premium                number(18,2),
                tmp.from_date,-- from_date             date,
                tmp.to_date,--to_date                 date,
                null,--tmp.print_date,--print_date             date,
                tmp.collected_date,--collected_date      date,
                tmp.is_loan,
                null,--LIFE_AGENCY_INVOICE.UVL_PLAN_CODE,--     varchar2(16),
                null,--tmp.status_name,--    nvarchar2(64),
                var_session_id,
                ams.LIFE_AGENCY_INVOICE.SYSTEM_USER,
                ams.LIFE_AGENCY_INVOICE.SYSTEM_USER,
                sysdate,
                sysdate,
                null,--phone
                tmp.real_invoice_number, --real_invoice_number
                tmp.pay_loan --tra lai vay
            from ams.la_inv_bvl_invoice_tmp tmp
            where tmp.session_id = var_session_id
                and tmp.source_of_data = ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_BVLIFE
                and tmp.company_bvl_id = list_databse.id
                and tmp.pay_loan is null; --khong lay hop dong tra vay vao day luon cho no
                --and tmp.pay_loan is null; --khong lay danh sach cac hop dong no phi vao day cho no
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE.bvl_get_invoice', 'do vao la_inv_invoice_ext   ' || list_databse.name || '  ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));

            var_run_end_time := sysdate;
            ams.life_agency_log.time_log(list_databse.id, 'Thoi gian chay BVL cty ' || list_databse.name || '  ' || to_char(valRecordDate, 'dd/mm/yyyy'), var_run_begin_time, var_run_end_time);
        end loop;

        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 5;

        --merge vao bang la_inv_invoice_ext
        --lay ten nguoi tham gia dia chi vao lam tam o day
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_inv_invoice_ext o
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.account_number,
                    max(tmp.holder_id) holder_id,
                    max(tmp.holder_name) holder_name,
                    max(tmp.insured_name) insured_name,
                    max(tmp.address) holder_address,
                    max(tmp.phone) phone
                from ams.la_inv_bvl_customer tmp
                where tmp.source_of_data = ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_BVLIFE
                group by tmp.account_number
            ) upd
        on ( --trong thang day voi cac barcode day
            var_session_id = o.session_id
            and
            var_record_date = o.record_date
            and
            ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_BVLIFE = o.source_of_data
            and
            upd.account_number = o.account_number
        )
        when matched then
            update
                set
                    o.holder_name = upd.holder_name,
                    o.insured_name = upd.insured_name,
                    o.holder_address = upd.holder_address,
                    o.phone = upd.phone,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE.bvl_get_invoice', 'do ten khach hang thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 6;

        --merge vao bang la_inv_invoice_ext
        --lay tu ODS them vi BVL co the thieu du lieu lay ten nguoi tham gia dia chi vao olam tam o day
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_inv_invoice_ext o
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.account_number,
                    max(tmp.holder_name) holder_name,
                    max(tmp.insured_name) insured_name,
                    max(tmp.holder_address) holder_address,
                    max(tmp.phone) phone
                from ams.la_inv_tal_customer tmp
                where tmp.source_of_data = ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_TALISMAN
                group by tmp.account_number
            ) upd
        on ( --trong thang day voi cac barcode day
            var_session_id = o.session_id
            and
            var_record_date = o.record_date
            and
            ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_BVLIFE = o.source_of_data
            and
            upd.account_number = o.account_number
        )
        when matched then
            update
                set
                    o.holder_name = upd.holder_name,
                    o.insured_name = upd.insured_name,
                    o.holder_address = upd.holder_address,
                    o.phone = upd.phone,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE.bvl_get_invoice', 'do ten khach hang thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 7;

       /*chinhlk 28/2/2013 sua lai do co 1 vai loi ve du lieu dai ly*/
        /*cap nhat cac thong tin ve dai ly */
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_inv_invoice_ext o
        using
            (
                select  /*+ CARDINALITY(o) , 100) */
                    o.outlet_ams_id,
                    max(o.outlet_bvlife_id) outlet_bvlife_id,
                    max(o.outlet_id)  outlet_id,
                    max(o.outlet_name) outlet_name,
                    max(o.outlet_number) outlet_number,
                    max(o.company_id) company_id,
                    max(o.company_ams_id) company_ams_id,
                    max(o.company_name) company_name,
                    max(o.office_id) office_id,
                    max(o.office_ams_id) office_ams_id,
                    max(o.office_name) office_name,
                    max(o.agency_id) agency_id,
                    max(o.agency_ams_id) agency_ams_id,
                    max(o.agency_name) agency_name,
                    max(o.unit_id) unit_id,
                    max(o.unit_ams_id) unit_ams_id,
                    max(o.unit_name) unit_name,
                    max(o.position_code) position_code,
                    max(o.position_date) position_date,
                    max(o.effective_date) effective_date,
                    max(o.terminative_date)  terminative_date
                from ams.la_inv_outlet_tmp o
                where o.session_id = var_session_id
                group by o.outlet_ams_id
            ) upd
        on (
            var_session_id = o.session_id
            and
            var_record_date = o.record_date
            and
            ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_BVLIFE = o.source_of_data
            and
            upd.outlet_ams_id = o.outlet_ams_id
        )
        when matched then
            update
                set
                    o.company_name = upd.company_name,
                    o.company_ams_id = upd.company_ams_id,
                    o.company_id = upd.company_id,
                    o.outlet_id = upd.outlet_id,
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
                    o.position_date  = upd.position_date,
                    o.update_datetime = sysdate;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE.bvl_get_invoice', 'cap nhat cac thong tin dai ly thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 8;

          /*ten chuc vu cua dai ly cap nhat vao day*/
         merge  /*+ CARDINALITY(o, 100)
                    CARDINALITY(upd, 100)
                    LEADING(o upd) */
              into ams.la_inv_invoice_ext o
          using
              (
                  select  /*+ CARDINALITY(code, 100)*/
                      code.code_code position_code,
                      code.code_value position_name
                  from ams.cla_codes code
                  where code.code_language = ams.LIFE_AGENCY_INVOICE.THEME_LANGUAGE
                      and code.code_group = ams.LIFE_AGENCY_INVOICE.OUTLET_INFO_TYPE_POSI
                      and trunc(sysdate, 'DD')
                          between nvl(code.from_date, ams.LIFE_AGENCY_INVOICE.DATE_MIN_VALUE)
                          and nvl(code.to_date, ams.LIFE_AGENCY_INVOICE.DATE_MAX_VALUE)
              ) upd
          on (
              var_session_id = o.session_id
              and
              var_record_date = o.record_date
              and
              ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_BVLIFE = o.source_of_data
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
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE.bvl_get_invoice', 'lay chuc vu thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 9;


         merge  /*+ CARDINALITY(o, 100)
                    CARDINALITY(upd, 100)
                    LEADING(o upd) */
              into ams.la_inv_invoice_ext o
          using
              (
                  select /*+ CARDINALITY(tmp, 100)*/
                      tmp.branch_id company_id,
                      tmp.branch_bvlife_code company_bvl_id,
                      tmp.branch_name company_name
                  from ams.la_history_branch tmp
                  where tmp.type_code = 'CTTV'
                      and tmp.current_is = 'Y'
              ) upd
          on (
              var_session_id = o.session_id
              and
              var_record_date = o.record_date
              and
              ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_BVLIFE = o.source_of_data
              and
              upd.company_bvl_id = o.company_bvl_id
          )
          when matched then
              update
                  set
                      o.company_id = upd.company_id,
                      o.company_name = upd.company_name,
                      o.update_datetime = sysdate;
         commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE.bvl_get_invoice', 'lay ma cong ty BVL thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 9.1;

        --dbms_stats.gather_table_stats(null, 'la_inv_invoice_ext', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE.bvl_get_invoice', 'gather ams.la_inv_invoice_ext thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 10;

        --sau do do tat cac cac  du lieu tu bang la_inv_invoice_ext vao trong bang la_inv_invoice_ext
        insert /*+ APPEND */ into ams.la_inv_invoice nologging
        (
            outlet_id,
            outlet_ams_id,
            type_code,
            record_date,
            version_date,
            status_code,
            source_of_data,
            outlet_name,
            company_id,
            company_bvl_id,
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
            position_name,
            effective_date,
            terminative_date,
            account_number,
            barcode,
            holder_name,
            insured_name,
            holder_address,
            invoice_number,
            status_invoice_code,
            coll_premium,
            real_premium,
            from_date,
            to_date,
            print_date,
            collected_date,
            is_loan,
            data_type_code,
            data_type_name,
            session_id,
            create_user,
            update_user,
            create_datetime,
            update_datetime,
            phone,
            real_invoice_number,
            pay_loan
        )
        select /*+ CARDINALITY(tmp, 100)*/
            tmp.outlet_id,
            tmp.outlet_ams_id,
            tmp.type_code,
            tmp.record_date,
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
            tmp.barcode,
            tmp.holder_name,
            tmp.insured_name,
            tmp.holder_address,
            tmp.invoice_number,
            tmp.status_invoice_code,
            tmp.coll_premium,
            tmp.real_premium,
            tmp.from_date,
            tmp.to_date,
            tmp.print_date ,
            tmp.collected_date,
            tmp.is_loan,
            tmp.data_type_code,
            tmp.data_type_name,
            tmp.session_id,
            ams.LIFE_AGENCY_INVOICE.SYSTEM_USER,
            ams.LIFE_AGENCY_INVOICE.SYSTEM_USER,
            sysdate,
            sysdate,
            tmp.phone,
            tmp.real_invoice_number,
            tmp.pay_loan
        from ams.la_inv_invoice_ext tmp
        where tmp.session_id = var_session_id
            and tmp.source_of_data = ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_BVLIFE;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE.bvl_get_invoice', 'do vao bang la_inv_invoice tu bang ext thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        var_error_pos := 10;
        --dbms_stats.gather_table_stats(null, 'la_inv_invoice', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE.bvl_get_invoice', 'gather ams.la_inv_invoice thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        var_run_end_time := sysdate;
        ams.life_agency_log.time_log(1001, 'Thoi gian chay bvl', var_run_begin_time, var_run_end_time);
        exception
            when others then
                rollback;
                life_agency_log.write_log(1000,
                    'bvl_get_invoice: loi  ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                    sqlerrm,
                    sqlcode);
    end;

/*    procedure tal_prepare(valRecordDate date := null,
        valTypeOfData varchar2 := null,
        valCompanyID number := null,
        valSessionId number := null)
    is
        var_error_pos  number(8, 2) := null;
        var_run_from_time date := sysdate;
        var_run_to_time date := sysdate;
        var_session_id number(14) := 0;
        var_version_date date := trunc(sysdate, 'DD');
        var_run_begin_time date := sysdate;
        var_run_end_time date := sysdate;
    begin
        var_run_begin_time := sysdate;

        var_session_id := valSessionId;

        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 1;

        \*xoa du lieu cua bang tam truoc khi dua vao*\
        execute immediate 'truncate table ams.la_inv_invoice_tmp';
        execute immediate 'truncate table ams.la_inv_credit_invoice_tmp';
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE.get_invoice_prepare', 'truncate cac bang ');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 2;

        \*lay tat ca danh sach cac hoa don tu TAL len cho no
        lay tat ca cac cai phai thu*\
        insert \*+ APPEND *\ into ams.la_inv_invoice_tmp nologging
        select \*+ CARDINALITY(llh, 100)
                  CARDINALITY(lacp, 100)
                  CARDINALITY(tlrso, 100)
                  CARDINALITY(tal, 100)
                  CARDINALITY(tpt, 100)
                  CARDINALITY(tpl, 100)
                  CARDINALITY(tc, 100)
                  CARDINALITY(aor , 100)
                  *\
            var_session_id,
            aor.outlet_number dl_id,
            var_version_date,
            ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_TALISMAN,
            null, --company_code
            llh.leth_account_number hd_id,
            tlrso.lrad_id ma_vach,
            llh.leth_mailing_surname  tentgia,
            null,--insured_name
            null,--holder_address
            tlrso.lrad_id  so_hdon,
            decode(tal.status_code, 'IF', '01', '04')  tt,
            case when tpt.product_type_code = 'TRLF' then
              case when (to_number(lacp.ldxp_policy_balance) <= 0) and (to_number(lacp.ldxp_premium_in_suspense) > 0) then
                   lacp.ldxp_instalment_premium - lacp.ldxp_premium_in_suspense
              else
                   lacp.ldxp_instalment_premium
              end
            when (tpt.product_type_code = 'UNIV' or tpt.product_type_code = 'ULFE') then
              lacp.ldxp_invoiced_amount
            end phi,
            trunc(lacp.ldxp_next_billing_due_date, 'DD'),
            trunc(hoadon_denngay(lacp.ldxp_next_billing_due_date, lacp.ldxp_next_anniversary_date, lacp.ldxp_payment_freq_code), 'DD')  den_ngay,
            trunc(llh.leth_created_date, 'DD') ngaytao,
            null ngay_thu,
            null  ngay_huy,
            null, --losted_date
            null, --issued_date
            null, --selected
            null, --decision_id
            null,
            null,
            ams.LIFE_AGENCY_INVOICE.SYSTEM_USER,
            ams.LIFE_AGENCY_INVOICE.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            select  \*+ CARDINALITY(tmp, 100)  *\
                  tmp.leth_id,
                  tmp.leth_request_id,
                  tmp.leth_account_number,
                  tmp.leth_mailing_surname,
                  tmp.leth_created_date
            from ldcm_letter_header@AMSDEV00.BAOVIET.COM.VN tmp
            where tmp.leth_letter_type = 'PNOT'
        )  llh,
        (
            select  \*+ CARDINALITY(tmp, 100)  *\
                tmp.lrad_id,
                tmp.lrad_request_id,
                tmp.lrad_request_status_code_id
            from tscm_letter_request_send_to@AMSDEV00.BAOVIET.COM.VN tmp
            where tmp.lrad_sent_date is not null
                and tmp.lrad_hold_flag = 'N'
        ) tlrso,
        (
            select  \*+ CARDINALITY(tmp, 100)  *\
                  tmp.ldxp_letter_request_id,
                  tmp.ldxp_next_billing_due_date,
                  tmp.ldxp_next_anniversary_date,
                  tmp.ldxp_payment_freq_code,
                  tmp.ldxp_policy_balance,
                  tmp.ldxp_premium_in_suspense,
                  tmp.ldxp_instalment_premium,
                  tmp.ldxp_invoiced_amount
            from ldrp_activity_cx_policy@AMSDEV00.BAOVIET.COM.VN tmp
        ) lacp,
        (
            select  \*+ CARDINALITY(tmp, 100)  *\
                tmp.product_id,
                tmp.account_number,
                tmp.account_id,
                tmp.status_code
            from ods.account@ODSAMDEV tmp
        )  tal,
        (
            select   \*+ CARDINALITY(tmp, 100)  *\
                tmp.product_type_id,
                tmp.product_type_code
            from ods.product_type@ODSAMDEV tmp
        )  tpt,
        (
            select \*+ CARDINALITY(tmp, 100)  *\
                tmp.product_type_id,
                tmp.product_id
            from ods.product@ODSAMDEV tmp
        )  tpl,
        (
            select   \*+ CARDINALITY(tmp, 100)  *\
                tmp.code_id
            from tscm_code@AMSDEV00.BAOVIET.COM.VN tmp
            where tmp.code_code <> 'CANC'
        )  tc,
        (
            select   \*+ CARDINALITY(tmp, 100)  *\
                tmp.account_id,
                tmp.outlet_number
            from ods.account_outlet_relationship@AMSDEV00.BAOVIET.COM.VN tmp
            where tmp.relationship_type_code = 'SERV'
        )  aor
        where tlrso.lrad_request_id = llh.leth_request_id
            and llh.leth_request_id = lacp.ldxp_letter_request_id
            and llh.leth_account_number = tal.account_number
            and tal.product_id = tpl.product_id
            and tpt.product_type_id = tpl.product_type_id
            and tlrso.lrad_request_status_code_id = tc.code_id
            and tal.account_id = aor.account_id;
        commit;
        dbms_stats.gather_table_stats(null, 'la_inv_invoice_tmp', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE.get_invoice_prepare', 'do du lieu phai thu');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 3;

        --lay cac hoa don thuc thu len cho vao bang khac
        insert \*+ APPEND *\ into ams.la_inv_credit_invoice_tmp nologging
        select \*+ CARDINALITY(llh1, 100)
                  CARDINALITY(lacp1, 100)
                  CARDINALITY(tlrso1, 100)
                  CARDINALITY(tr1, 100)
                  CARDINALITY(td1, 100)
                  CARDINALITY(tc1, 100)
                  CARDINALITY(tal1, 100)
                  CARDINALITY(tpt1, 100)
                  CARDINALITY(tpl1, 100)
                  *\
            var_session_id,
            var_version_date,
            ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_TALISMAN,
            tlrso1.lrad_id,-- ma_vach,
            case when tc1.code_code = 'RECE'
                then  '03'
            when (tc1.code_code = 'APPL' or tc1.code_code = 'UNAP' or tc1.code_code = 'UCNV'
                 or tc1.code_code = 'UNAU' or tc1.code_code = 'SPLT' or tc1.code_code = 'DISH' or tc1.code_code is null )
                then  '01'
            end tt,
            trunc(td1.dept_date_entered, 'DD') ngay_thu,
            case when (tc1.code_code = 'CANC' or tc1.code_code = 'REPL' or tc1.code_code = 'REVS' or tc1.code_code ='REND' or tc1.code_code ='APRF')
                then  trunc(td1.dept_status_date, 'DD')  else  null
            end ngay_huy,
            ams.LIFE_AGENCY_INVOICE.SYSTEM_USER,
            ams.LIFE_AGENCY_INVOICE.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            select  \*+ CARDINALITY(tmp, 100)  *\
                  tmp.leth_id,
                  tmp.leth_request_id,
                  tmp.leth_account_number
            from ams.ldcm_letter_header@AMSDEV00.BAOVIET.COM.VN tmp
            where leth_letter_type = 'PNOT'
        )  llh1,
        (
            select   \*+ CARDINALITY(tmp, 100)  *\
                tmp.ldxp_letter_request_id
            from ldrp_activity_cx_policy@AMSDEV00.BAOVIET.COM.VN tmp
        ) lacp1,
        (
            select   \*+ CARDINALITY(tmp, 100)  *\
                tmp.lrad_id
            from tscm_letter_request_send_to@AMSDEV00.BAOVIET.COM.VN tmp
        ) tlrso1,
        (
            select   \*+ CARDINALITY(tmp, 100)  *\
                tmp.rcpt_id,
                tmp.rcpt_receipt_number
            from tscm_receipt@AMSDEV00.BAOVIET.COM.VN tmp
        ) tr1,
        (
            select   \*+ CARDINALITY(tmp, 100)  *\
                tmp.dept_status_code_id,
                tmp.dept_receipt_id,
                tmp.dept_status_date,
                tmp.dept_date_entered
            from tscm_deposit@AMSDEV00.BAOVIET.COM.VN tmp
        )  td1,
        (
            select   \*+ CARDINALITY(tmp, 100)  *\
                tmp.code_id,
                tmp.code_code
            from tscm_code@AMSDEV00.BAOVIET.COM.VN tmp
            where tmp.code_code = 'RECE'
        )  tc1,
        (
            select   \*+ CARDINALITY(tmp, 100)  *\
                tmp.product_id,
                tmp.account_number
            from ods.account@ODSAMDEV tmp
        )  tal1,
        (
            select   \*+ CARDINALITY(tmp, 100)  *\
                tmp.product_type_id
            from ods.product_type@ODSAMDEV tmp
        )  tpt1,
        (
            select   \*+ CARDINALITY(tmp, 100)  *\
                tmp.product_type_id,
                tmp.product_id
            from ods.product@ODSAMDEV tmp
        )  tpl1
        where tlrso1.lrad_id = llh1.leth_id
          and llh1.leth_request_id = lacp1.ldxp_letter_request_id
          and to_char(tr1.rcpt_receipt_number) = to_char(tlrso1.lrad_id)
          and td1.dept_receipt_id     = tr1.rcpt_id
          and tc1.code_id = td1.dept_status_code_id
          and llh1.leth_account_number = tal1.account_number
          and tal1.product_id = tpl1.product_id
          and tpt1.product_type_id = tpl1.product_type_id ;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE.get_invoice_prepare', 'do du lieu thuc thu');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 4;

        dbms_stats.gather_table_stats(null, 'la_inv_credit_invoice_tmp', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE.get_invoice_prepare', 'gather du lieu thuc thu');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 5;

        --sao do thi merge cac thong tin tu bang thuc thu vao phai thu
        merge  \*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) *\
            into ams.la_inv_invoice_tmp o
        using
            (
                select \*+ CARDINALITY(tmp, 100)*\
                    tmp.barcode,
                    tmp.status_code,
                    tmp.collected_date,
                    tmp.cancel_date
                from ams.la_inv_credit_invoice_tmp tmp
                where tmp.session_id = var_session_id
                    and tmp.source_of_data = ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_TALISMAN
            ) upd
        on (
            var_session_id = o.session_id
            and
            ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_TALISMAN = o.source_of_data
            and
            upd.barcode = o.barcode
        )
        when matched then
            update
                set
                    o.status_code = nvl(upd.status_code, o.status_code),
                    o.collected_date = upd.collected_date,
                    o.cancel_date = upd.cancel_date,
                    o.update_datetime = sysdate;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE.get_invoice_prepare', 'merge thuc thu vao phai thu');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 5;

        dbms_stats.gather_table_stats(null, 'la_inv_invoice_tmp', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE.get_invoice_prepare', 'gather lai het');

        var_run_end_time := sysdate;
        ams.life_agency_log.time_log(1001, 'get_invoice_prepare chay', var_run_begin_time, var_run_end_time);
        exception
            when others then
                rollback;
                life_agency_log.write_log(1000,
                    'get_invoice_tal: loi thu tuc chay get_invoice_prepare  vi tri: ' || to_char(var_error_pos),
                    sqlerrm,
                    sqlcode);
    end;
*/
    procedure tal_clear_data(valRecordDate date := null,
        valTypeOfData varchar2 := null,
        valCompanyID number := null,
        valSessionId number := null)
    is
        var_record_date date := trunc(valRecordDate, 'MM');
        var_branch_id_string varchar2(10) := nvl(to_char(valCompanyID), '%');
        --lay du lieu trong vong 1 thang thoi nhe
        var_company_id  number := null;
        var_error_pos  number(8, 2) := null;

        var_run_from_time date := sysdate;
        var_run_to_time date := sysdate;

        var_session_id number(14) := 0;
        var_version_date date := trunc(sysdate, 'DD');
        var_run_begin_time date := sysdate;
        var_run_end_time date := sysdate;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 0;
        --xoa du lieu cua ban can xoa truoc khi thuc hien
        loop
            delete ams.la_inv_invoice del
            where del.record_date = var_record_date
                and del.type_code = valTypeOfData
                and del.source_of_data = ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_TALISMAN
                and rownum < ams.LIFE_AGENCY_INVOICE.RECORD_MAX_DELETE;
            exit when SQL%rowcount < ams.LIFE_AGENCY_INVOICE.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE', ' xoa dl lan chay thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 1;
        /*xoa du lieu cua bang tam truoc khi dua vao*/
        execute immediate 'truncate table ams.la_inv_invoice_ext';
        execute immediate 'truncate table ams.la_inv_debit_premium_tmp';
        execute immediate 'truncate table ams.la_inv_credit_premium_tmp';
        execute immediate 'truncate table ams.la_inv_cancel_invoice_tmp';
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE', 'truncate cac bang tam ');
        exception
            when others then
                rollback;
                life_agency_log.write_log(1000,
                    'tal_clear_data: loi thu tuc chay   vi tri: ' || to_char(var_error_pos) ,
                    sqlerrm,
                    sqlcode);
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 10/10/2012
        Version: 1.0
        Description: Lay so lieu ve hoa don thu phi va no phi tu Talisman
        Parameter:
            valRecordDate [date]: Thang ghi nhan
            valTypeOfData [varchar2]: Kieu du lieu
            valCompanyID [number]: Ma cong ty
            valSessionId [number]: Session ID
        Update:  Le Khac Chinh
            Version: 1.1
            Date Updated: 29/7/2013
            Note:  Fix lai chuong trinh theo yeu cau: 111230 cua BA
                      Fix loi khi Hoi thay doi view dan toi package khong compile duoc
            Version: 1.2
            Date Updated: 30/8/2013
            Note:  Fix lai chuong trinh theo yeu cau: 113056 cua anh Huu Hoa va BA
                      Bo gather de chay nhanh hon
            Update:  Le Khac Chinh
                Version: 1.2
                Date Updated: 11/2/2014
                Note:  Fix lai chuong trinh theo yeu cau: 127628 cua SME
            Update:  Le Khac Chinh
                Version: 1.3
                Date Updated: 1/4/2014
                Note:  Fix lai chuong trinh theo yeu cau: 128263 cua SME
    */
    procedure tal_get_invoice(valRecordDate date := null,
        valTypeOfData varchar2 := null,
        valCompanyID number := null,
        valSessionId number := null)
    is
        var_record_date date := trunc(valRecordDate, 'MM');
        var_branch_id_string varchar2(10) := nvl(to_char(valCompanyID), '%');
        --lay du lieu trong vong 1 thang thoi nhe
        var_from_date date := trunc(valRecordDate, 'MM');
        --cuoi thang la cuoi thang nay luon cho no de tinh
        var_to_date date := add_months(trunc(valRecordDate, 'MM'), 1) - 1;
        --cai bien nay de xu ly cho phan no phi moi chinh xac can cu dua vao cai nay
        var_next_month date := add_months(trunc(valRecordDate, 'MM'), 1);


        var_outlet_from_date date := add_months(var_record_date, -12);
        var_outlet_to_date date := add_months(var_record_date, -1);


        var_error_pos  number(8, 2) := null;

        var_run_from_time date := sysdate;
        var_run_to_time date := sysdate;

        var_session_id number(14) := 0;
        var_version_date date := trunc(sysdate, 'DD');
        var_session_id_tmp number(14) := 0;

        var_run_begin_time date := sysdate;
        var_run_end_time date := sysdate;

        /*Lay lai du lieu cua 9 thang truoc*/
        var_from_date_data date := add_months(var_record_date, -9);
    begin
        /* Xoa du lieu hoa don
        trong 1 thang di da*/
        var_run_begin_time := sysdate;

        var_session_id := valSessionId;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE.tal_get_invoice', 'lay so lieu thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 1;
       /*lay tat ca danh sach cac hoa don tu TAL len cho no
        lay tat ca*/
        if AMS_CORE_MODULE.is_active('REPORT_INV_TALISMAN', (trunc(sysdate, 'DD') - 1))
                = AMS_CORE_MODULE.IS_YES then
            --xoa bang tam nay di
            execute immediate 'truncate table ams.la_inv_invoice_tmp';
            commit;
            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE.tal_get_invoice', 'truncate table ams.la_inv_invoice_tmp thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 1.2;

            if AMS_CORE_MODULE.is_active('REPORT_INV_RECEIPT', (trunc(sysdate, 'DD') - 1))
                    = AMS_CORE_MODULE.IS_YES then
                insert /*+ APPEND */ into ams.la_inv_invoice_tmp nologging
                (
                    session_id,
                    outlet_ams_id,
                    version_date,
                    source_of_data,
                    company_code,
                    account_number,
                    barcode,
                    holder_name,
                    insured_name,
                    holder_address,
                    invoice_number,
                    status_code,
                    premium,
                    from_date,
                    to_date,
                    print_date,
                    collected_date,/*
                    cancel_date,*/
                    losted_date,
                    issued_date,
                    selected,
                    decision_id,
                    invoice_status_code,
                    invoice_status_name,
                    create_user,
                    update_user,
                    create_datetime,
                    update_datetime
                )
                select /*+ CARDINALITY(tmp, 100)*/
                    var_session_id,
                    tmp.dl_id,
                    var_version_date,
                    ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_TALISMAN,
                    null,--tmp.company_code,
                    tmp.hd_id,
                    tmp.ma_vach,
                    tmp.tentgia,
                    null,--insured_name
                    null,--holder_address
                    tmp.so_hdon,
                    tmp.tt,
                    tmp.phi,
                    trunc(tmp.tu_ngay, 'DD'),
                    trunc(tmp.den_ngay, 'DD'),
                    trunc(tmp.ngaytao, 'DD'),
                    trunc(tmp.ngay_thu, 'DD'),/*
                    trunc(tmp.ngay_huy, 'DD'),*/
                    null, --losted_date
                    null, --issued_date
                    null, --selected
                    null, --decision_id
                    null, --invoice_status_code
                    null, --invoice_status_name
                    ams.LIFE_AGENCY_INVOICE.SYSTEM_USER,
                    ams.LIFE_AGENCY_INVOICE.SYSTEM_USER,
                    sysdate,
                    sysdate
                from
                (
                    select
                        sel1.ma_vach,sel1.so_hdon,sel1.dl_id,sel1.hd_id,sel1.tentgia,
                        sel1.tu_ngay,sel1.den_ngay,sel1.phi,nvl(sel2.tt,sel1.tt) tt,null ngay_huy,sel2.ngay_thu,sel1.ngaytao
                    from
                    (
                        select a.leth_id ma_vach,
                             '03' tt,
                             f.dept_date_entered ngay_thu
                        from ggtal.ldcm_letter_header a
                             join ggtal.tscm_receipt e on e.rcpt_receipt_number = to_char(a.leth_id)
                             join ggtal.tscm_deposit f on f.dept_receipt_id = e.rcpt_id and f.dept_status_code_id = 357 --RECE
                        where trunc(a.leth_created_date) >= var_from_date_data and
                              a.leth_letter_type = 'PNOT'
                    ) sel2
                    right outer join
                    (select
                            x.leth_id ma_vach,
                            x.leth_id so_hdon,
                            --aor.outlet_number dl_id,
                            o.outlet_number dl_id,
                            --lacp.ldxp_intermediary_number dl_id,
                            --x.account_number hd_id,
                            acc.account_number hd_id,
                            x.leth_mailing_surname tentgia,
                            decode(x.lreq_trans_event_id,null,
                                   to_date(x.ldxp_next_billing_due_date),
                                   (select to_date(tte.trev_effective_date) from ggtal.tscm_transaction_event tte where tte.trev_id = x.lreq_trans_event_id)
                                  ) tu_ngay,
                            --to_date(lacp.ldxp_next_billing_due_date) tu_ngay,
                          hoadon_denngay(decode(x.lreq_trans_event_id,null,
                                   to_date(x.ldxp_next_billing_due_date),
                                   (select to_date(tte.trev_effective_date) from ggtal.tscm_transaction_event tte where tte.trev_id = x.lreq_trans_event_id)
                                  ),to_date(x.ldxp_next_anniversary_date),x.ldxp_payment_freq_code)
                          as den_ngay,
                          --hoadon_denngay(to_date(lacp.ldxp_next_billing_due_date),to_date(lacp.ldxp_next_anniversary_date),lacp.ldxp_payment_freq_code)
                          --as den_ngay,
                          case when prot.product_type_code = 'TRLF' then
                              case when (to_number(x.ldxp_policy_balance) <= 0) and (to_number(x.ldxp_premium_in_suspense) > 0) then
                                   x.ldxp_instalment_premium - x.ldxp_premium_in_suspense
                              else
                                   x.ldxp_instalment_premium
                              end
                            when (prot.product_type_code = 'UNIV' or prot.product_type_code = 'ULFE') then
                              x.ldxp_invoiced_amount
                          end phi,
                          x.leth_created_date ngaytao,
                          decode(acc.status_code,'IF','01','04') tt
                          from (select /*+ LEADING(a b c d) USE_NL(b c d)*/
                                       a.leth_id,
                                       trunc(a.leth_created_date) leth_created_date,
                                       a.leth_request_id lreq_id,
                                       b.lreq_template_id ltmp_id,
                                       b.lreq_account_id,
                                       --a.leth_account_number account_number,
                                       a.leth_letter_type,
                                       b.lreq_trans_event_id,
                                       d.ldxp_policy_balance,
                                       d.ldxp_premium_in_suspense,
                                       d.ldxp_instalment_premium,
                                       d.ldxp_invoiced_amount,
                                       d.ldxp_next_billing_due_date,
                                       d.ldxp_next_anniversary_date,
                                       d.ldxp_payment_freq_code,
                                       a.leth_mailing_surname
                                from ggtal.ldcm_letter_header a
                                     join ggtal.tscm_letter_request b on (a.leth_request_id = b.lreq_id)
                                     join ggtal.tscm_letter_request_send_to c on (c.lrad_id = a.leth_id)
                                     join ggtal.ldrp_activity_cx_policy d on a.leth_request_id = d.ldxp_letter_request_id
                                     --join ggtal.tscm_code d on (c.lrad_request_status_code_id=d.code_id)
                                where trunc(a.leth_created_date) >= var_from_date_data and
                                      a.leth_letter_type = 'PNOT' and
                                      --d.code_code!='CANC' and
                                      c.lrad_hold_flag='N' and
                                      c.lrad_request_status_code_id != 33866 and
                                      c.lrad_sent_date is not null) x
                                join ods.account acc on (x.lreq_account_id = acc.account_id)
                                join ods.account_outlet_relationship aor on (acc.account_id = aor.account_id and
                                                                             aor.relationship_type_code = 'SERV' and
                                                                             aor.account_outlet_id = (select max(aor_max.account_outlet_id)
                                                                                                      from ods.account_outlet_relationship aor_max
                                                                                                      where aor_max.account_id = aor.account_id and
                                                                                                            aor_max.relationship_type_code = 'SERV' and
                                                                                                      trunc(aor_max.effective_date) <= x.leth_created_date
                                                                                                     )
                                                                            )
                                join ods.product pro on (pro.product_id = acc.product_id)
                                join ods.product_type prot on (prot.product_type_id = pro.product_type_id)
                                join ams.tmp_outlet o on aor.outlet_client_id = o.outlet_id
                              ) sel1
                    on sel1.ma_vach = sel2.ma_vach
                ) tmp;
                commit;
                ams.life_agency_log.time_end;
                ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE.tal_get_invoice', 'do la_inv_invoice_tmp thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
                ams.life_agency_log.time_stop;
                ams.life_agency_log.time_begin;
                var_error_pos := 1.2;
                execute immediate 'truncate table ams.la_inv_invoice_receipt_tmp';
                commit;
                insert /*+ APPEND */ into  ams.la_inv_invoice_receipt_tmp nologging
                (
                    barcode,
                    status_code,
                    collected_date,
                    create_user,
                    update_user,
                    create_datetime,
                    update_datetime
                )
                select   /*+ CARDINALITY(a, 100) CARDINALITY(b, 100)*/
                    b.ma_vach,
                    '03' tt,
                    trunc(b.ngay_thu, 'DD'),
                    ams.LIFE_AGENCY_INVOICE.SYSTEM_USER,
                    ams.LIFE_AGENCY_INVOICE.SYSTEM_USER,
                    sysdate,
                    sysdate
                from
                (
                    select   /*+ CARDINALITY(cre, 100) CARDINALITY(cd, 100) CARDINALITY(tc, 100)*/
                    nvl(to_char(cd.dept_reference), to_char(cre.rcpt_receipt_number)) as ma_vach
                    from
                    (
                        select  /*+ CARDINALITY(cre, 100) */
                            *
                        from ggtal.tscm_receipt cre
                        where trunc(cre.rcpt_date_entered) >=  var_from_date_data
                    ) cre
                    join
                    (
                        select /*+ CARDINALITY(cd, 100) */
                            *
                        from ggtal.tscm_deposit cd
                        where trunc(cd.dept_date_entered)  >= var_from_date_data
                    ) cd
                    on cd.dept_receipt_id = cre.rcpt_id
                    join ggtal.tscm_code tc on tc.code_id = cre.rcpt_status_code_id
                        and tc.code_code not in ('CANC', 'DISH')
                    minus --tru di cac barcode da co o phia tren roi
                    select  /*+ CARDINALITY(a, 100)  CARDINALITY(e, 100)  CARDINALITY(f, 100) */
                        to_char(a.leth_id) ma_vach
                    from ggtal.ldcm_letter_header a
                    join ggtal.tscm_receipt e
                        on e.rcpt_receipt_number = to_char(a.leth_id)
                    join ggtal.tscm_deposit f
                        on f.dept_receipt_id = e.rcpt_id and f.dept_status_code_id = 357 --RECE
                    where trunc(a.leth_created_date) >= var_from_date_data
                    and a.leth_letter_type = 'PNOT'
                ) a
                join
                (
                    select   /*+ CARDINALITY(cre, 100) CARDINALITY(cd, 100) CARDINALITY(tc, 100)*/
                        nvl(to_char(cd.dept_reference), to_char(cre.rcpt_receipt_number)) as ma_vach,
                        cre.rcpt_effective_date  ngay_thu
                    from
                    (
                        select  /*+ CARDINALITY(cre, 100) */
                            cre.*
                        from ggtal.tscm_receipt cre
                        where trunc(cre.rcpt_effective_date) >= var_from_date_data
                    ) cre
                    join
                    (
                        select /*+ CARDINALITY(cd, 100) */
                            cd.*
                        from ggtal.tscm_deposit cd
                        where cd.dept_date_entered  >= var_from_date_data
                    ) cd
                    on cd.dept_receipt_id = cre.rcpt_id
                    join ggtal.tscm_code tc on tc.code_id = cre.rcpt_status_code_id
                        and tc.code_code not in ('CANC', 'DISH')
                ) b on a.ma_vach = b.ma_vach;
                commit;
                ams.life_agency_log.time_end;
                ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE.tal_get_invoice', 'do la_inv_invoice_receipt_tmp thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
                ams.life_agency_log.time_stop;
                ams.life_agency_log.time_begin;
                var_error_pos := 1.2;

                /*Cap nhat du lieu ve ngay thuc thu */
                merge  /*+ CARDINALITY(o, 100)
                      CARDINALITY(upd, 100)
                      LEADING(o upd) */
                    into ams.la_inv_invoice_tmp  des
                using (
                    select  /*+ CARDINALITY(tmp, 100) */
                        tmp.barcode,
                        tmp.status_code,
                        tmp.collected_date
                    from ams.la_inv_invoice_receipt_tmp tmp
                ) upd
                on (
                    des.barcode = upd.barcode
                )
                when matched then
                    update
                        set
                            des.status_code = upd.status_code,
                            des.collected_date = upd.collected_date,
                            des.update_datetime = sysdate;
                commit;
                ams.life_agency_log.time_end;
                ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE.tal_get_invoice', 'Cap nhat du lieu ve ngay thuc thu thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
                ams.life_agency_log.time_stop;
                ams.life_agency_log.time_begin;
                var_error_pos := 1.2;
            else
                insert /*+ APPEND */ into ams.la_inv_invoice_tmp nologging
                (
                    session_id,
                    outlet_ams_id,
                    version_date,
                    source_of_data,
                    company_code,
                    account_number,
                    barcode,
                    holder_name,
                    insured_name,
                    holder_address,
                    invoice_number,
                    status_code,
                    premium,
                    from_date,
                    to_date,
                    print_date,
                    collected_date,/*
                    cancel_date,*/
                    losted_date,
                    issued_date,
                    selected,
                    decision_id,
                    invoice_status_code,
                    invoice_status_name,
                    create_user,
                    update_user,
                    create_datetime,
                    update_datetime
                )
                select /*+ CARDINALITY(tmp, 100)*/
                    var_session_id,
                    tmp.dl_id,
                    var_version_date,
                    ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_TALISMAN,
                    null,--tmp.company_code,
                    tmp.hd_id,
                    tmp.ma_vach,
                    tmp.tentgia,
                    null,--insured_name
                    null,--holder_address
                    tmp.so_hdon,
                    tmp.tt,
                    tmp.phi,
                    trunc(tmp.tu_ngay, 'DD'),
                    trunc(tmp.den_ngay, 'DD'),
                    trunc(tmp.ngaytao, 'DD'),
                    trunc(tmp.ngay_thu, 'DD'),/*
                    trunc(tmp.ngay_huy, 'DD'),*/
                    null, --losted_date
                    null, --issued_date
                    null, --selected
                    null, --decision_id
                    null, --invoice_status_code
                    null, --invoice_status_name
                    ams.LIFE_AGENCY_INVOICE.SYSTEM_USER,
                    ams.LIFE_AGENCY_INVOICE.SYSTEM_USER,
                    sysdate,
                    sysdate
                from ams.vw_hoadon tmp;
                commit;
            end if;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE.tal_get_invoice', 'do vao  table ams.la_inv_invoice_tmp thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        else --neu no khong chay lai so lieu ma lay tu cac cai so lieu cu thi se
        --can phai cap nhat lai session id cua bang cua nhung cai o ben TAL
        --lai voi cai session id dang chay nay thi moi co the dung duoc
        --neu khong thi neu no khong chay lai thi se bi sai mat
        --chi can lay cai dau tien ra la dc
            begin
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.session_id
                    into var_session_id_tmp
                from ams.la_inv_invoice_tmp tmp
                where tmp.source_of_data = ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_TALISMAN
                    and rownum <= 1;
            exception
                when others then
                    var_session_id_tmp := var_session_id;
                    ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE.tal_get_invoice', 'khong lay dc session_id temp');
            end;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE.tal_get_invoice', 'lay var_session_id_tmp thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 1.4;
            --cap nhat lai cho no session moi la session dang chay de chay cho
            --no chinh xac thi moi co the co so lieu de xu ly cho dung duoc
            update ams.la_inv_invoice_tmp tmp
            set tmp.session_id = var_session_id --cap nhat bang cai moi
            where tmp.session_id = var_session_id_tmp --lay theo cai cu
                and tmp.source_of_data = ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_TALISMAN;
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE.tal_get_invoice', 'update sesion ams.la_inv_invoice_tmp thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
        end if;

        --dbms_stats.gather_table_stats(null, 'la_inv_invoice_tmp', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE.tal_get_invoice', 'gather la_inv_invoice_tmp thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 3;

        /*lay tat ca danh sach cac hoa don bi huy*/
        insert /*+ APPEND */ into ams.la_inv_cancel_invoice_tmp nologging
        select /*+ CARDINALITY(tmp, 100)*/
            var_session_id,
            var_version_date,
            ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_TALISMAN,
            null,
            tmp.achi_mavach,
            trunc(tmp.achi_ngay_qd, 'DD'),
            null, --status_code
            ams.LIFE_AGENCY_INVOICE.SYSTEM_USER,
            ams.LIFE_AGENCY_INVOICE.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.bms_anchi tmp
        where tmp.achi_nguon_dl = 1 --lay tu TAL
            and tmp.achi_tinhtrang_id in (3, 7); -- 3 huy, 7 mat
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE.tal_get_invoice', 'lay so lieu  cac hoa don bi huy thang' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 4;

        dbms_stats.gather_table_stats(null, 'la_inv_cancel_invoice_tmp', cascade => true);

        ---do vao cac hoa don no phi theo dinh nghia da co
        insert /*+ APPEND */ into ams.la_inv_debit_premium_tmp nologging
        select /*+ CARDINALITY(tmp, 100)*/
            var_session_id,
            tmp.outlet_ams_id,
            var_version_date,
            ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_TALISMAN,
            null, --company_code
            tmp.account_number,
            tmp.barcode,
            null,--tmp.holder_id,
            tmp.holder_name,
            tmp.invoice_number,
            tmp.status_code,
            ams.LIFE_AGENCY_INVOICE.UVL_DEBIT_CODE,
            tmp.premium,
            tmp.from_date,
            tmp.to_date,
            tmp.print_date,
            tmp.collected_date,
            ams.LIFE_AGENCY_INVOICE.SYSTEM_USER,
            ams.LIFE_AGENCY_INVOICE.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.la_inv_invoice_tmp tmp
        where tmp.session_id = var_session_id
           and tmp.source_of_data = ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_TALISMAN
           --no con no phi vao truoc day
           --lay no phi va ca PHAI THU nhung chua thu duoc phi trong thang
           and tmp.from_date < var_next_month
           --neu no con no phi that va chua tra gi
           and (tmp.status_code = '01'
                or  --da thu duoc phi nhung thuc thu phi vao thang sau
                (tmp.status_code = '03' and tmp.collected_date >= var_next_month)
                --hoac la ton tai hoa don da huy nhung huy vao thang sau cho no
                or exists (select 1
                           from ams.la_inv_cancel_invoice_tmp hm
                           where hm.barcode = tmp.barcode
                             and hm.decision_date >= var_next_month
                        )
               )
           --va  khong ton tai hoa don da huy truoc do, neu da huy roi thi khong tinh la no phi
           and not exists (select 1
                           from ams.la_inv_cancel_invoice_tmp hm
                           where hm.barcode = tmp.barcode
                             and hm.decision_date  < var_next_month
                          );
        commit;

        ---do vao cac hoa don PHAT SINH trong thang de khogn bi trung lap voi du lieu o phia tren
        insert /*+ APPEND */ into ams.la_inv_debit_premium_tmp nologging
        select /*+ CARDINALITY(inv, 100) CARDINALITY(res, 100)*/
            var_session_id,
            res.outlet_ams_id,
            var_version_date,
            ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_TALISMAN,
            null, --company_code
            res.account_number,
            res.barcode,
            null,--tmp.holder_id,
            res.holder_name,
            res.invoice_number,
            res.status_code,
            'PHATSINH',--ma cua no la phat sinh
            res.premium,
            res.from_date,
            res.to_date,
            res.print_date,
            null,--ngay thu duoc bang null
            ams.LIFE_AGENCY_INVOICE.SYSTEM_USER,
            ams.LIFE_AGENCY_INVOICE.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            select  /*+ CARDINALITY(tmp) , 100)*/
                tmp.barcode
            from ams.la_inv_invoice_tmp tmp
            where tmp.session_id = var_session_id
                and tmp.source_of_data = ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_TALISMAN
                ---phat sinh trong thang
               and tmp.from_date
                   between var_from_date
                   and var_from_date
               --va khong  ton tai hoa don nay la da huy
               and not exists (select 1
                         from ams.la_inv_cancel_invoice_tmp hm
                         where hm.barcode = tmp.barcode
                      )
               --fix theo ID: 113056  loai bo neu da thuc thu duoc tu thang truoc thi khong dua vao phat sinh trong thang nay
               and not exists
               (
                   select 1
                   from ams.la_inv_invoice_tmp tmp1
                   where tmp1.status_code = '03'
                        --thuc thu tu thang truoc do
                       and tmp1.collected_date < var_from_date
                       and tmp1.barcode = tmp.barcode
               )
            group by tmp.barcode
            minus --tru di cac ma vach o phia tren ma bi ghi la no phi de khong bi trung lap du lieu
            select /*+ CARDINALITY(tmp) , 100)*/
                tmp.barcode
            from ams.la_inv_debit_premium_tmp tmp
            where tmp.session_id = var_session_id
                and tmp.source_of_data = ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_TALISMAN
                and tmp.STATUS_NAME = ams.LIFE_AGENCY_INVOICE.UVL_DEBIT_CODE
            group by tmp.barcode
        ) inv
        join
        (
            select /*+ CARDINALITY(tmp, 100)*/
                tmp.outlet_ams_id,
                tmp.account_number,
                tmp.barcode,
                tmp.holder_name,
                tmp.invoice_number,
                tmp.status_code,
                tmp.premium,
                tmp.from_date,
                tmp.to_date,
                tmp.print_date
            from ams.la_inv_invoice_tmp tmp
            where tmp.session_id = var_session_id
                and tmp.source_of_data = ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_TALISMAN
                ---phat sinh trong thang
               and tmp.from_date
                   between var_from_date
                   and var_from_date
               --va khong  ton tai hoa don nay la da huy
               and not exists (select 1
                         from ams.la_inv_cancel_invoice_tmp hm
                         where hm.barcode = tmp.barcode
                      )
               --fix theo ID: 113056  loai bo neu da thuc thu duoc tu thang truoc thi khong dua vao phat sinh trong thang nay
               and not exists
               (
                   select 1
                   from ams.la_inv_invoice_tmp tmp1
                   where tmp1.status_code = '03'
                        --thuc thu tu thang truoc do
                       and tmp1.collected_date < var_from_date
                       and tmp1.barcode = tmp.barcode
               )
        ) res
            on res.barcode = inv.barcode;
        commit;

        /*---do vao cac hoa don PHAT SINH trong thang
        insert \*+ APPEND *\ into ams.la_inv_debit_premium_tmp nologging
        select \*+ CARDINALITY(tmp, 100)*\
            var_session_id,
            tmp.outlet_ams_id,
            var_version_date,
            ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_TALISMAN,
            null, --company_code
            tmp.account_number,
            tmp.barcode,
            null,--tmp.holder_id,
            tmp.holder_name,
            tmp.invoice_number,
            tmp.status_code,
            'PHATSINH',--ma cua no la phat sinh
            tmp.premium,
            tmp.from_date,
            tmp.to_date,
            tmp.print_date,
            null,--ngay thu duoc bang null
            ams.LIFE_AGENCY_INVOICE.SYSTEM_USER,
            ams.LIFE_AGENCY_INVOICE.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.la_inv_invoice_tmp tmp
        where tmp.session_id = var_session_id
            and tmp.source_of_data = ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_TALISMAN
            ---phat sinh trong thang
           and tmp.from_date
               between var_from_date
               and var_from_date
           --va khong  ton tai hoa don nay la da huy
           and not exists (select 1
                     from ams.la_inv_cancel_invoice_tmp hm
                     where hm.barcode = tmp.barcode
                  )
           --fix theo ID: 113056  loai bo neu da thuc thu duoc tu thang truoc thi khong dua vao phat sinh trong thang nay
           and not exists
           (
               select 1
               from ams.la_inv_invoice_tmp tmp1
               where tmp1.status_code = '03'
                    --thuc thu tu thang truoc do
                   and tmp1.collected_date < var_from_date
                   and tmp1.barcode = tmp.barcode
           );
        commit;*/

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE.tal_get_invoice', 'lay hoa don no phi thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 5;

        dbms_stats.gather_table_stats(null, 'la_inv_debit_premium_tmp', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE.tal_get_invoice', 'gather la_inv_debit_premium_tmp thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 5.1;


        /*BUOC 3 : Thuc thu trong thang*/
        --do cac barcode len bang thuc thu la_inv_credit_premium_tmp cho no
        insert /*+ APPEND */ into ams.la_inv_credit_premium_tmp nologging
        select /*+ CARDINALITY(tmp, 100)*/
            var_session_id,
            tmp.outlet_ams_id,
            var_version_date,
            ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_TALISMAN,
            null, --company_code
            tmp.account_number,
            tmp.barcode,
            tmp.holder_name,
            tmp.invoice_number,
            ams.LIFE_AGENCY_INVOICE.UVL_CREDIT_CODE,
            ams.LIFE_AGENCY_INVOICE.UVL_CREDIT_PREMIUM, --status_name
            tmp.premium,
            tmp.from_date,
            tmp.to_date,
            tmp.print_date,
            tmp.collected_date,
            ams.LIFE_AGENCY_INVOICE.SYSTEM_USER,
            ams.LIFE_AGENCY_INVOICE.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.la_inv_invoice_tmp tmp
        where tmp.session_id = var_session_id
            and tmp.source_of_data = ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_TALISMAN
            --thuc thu duoc trong thang do
            and tmp.collected_date between var_from_date and var_to_date;
        commit;

        dbms_stats.gather_table_stats(null, 'la_inv_credit_premium_tmp', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE.tal_get_invoice', 'BUOC 3 : Thuc thu trong thang thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /*Can phai lay thuc thu tru di phat sinh thi se ra duoc nhung hoa don
        No phi nhung ma da dong duoc tien vao
        Sau do union voi nhung cai no phi chua dong + voi phat sinh thi
        se ra duoc cac cai phai thu trong ky
        nhu the thi moi day du duoc*/
        insert /*+ APPEND */ into ams.la_inv_debit_premium_tmp nologging
        select /*+ CARDINALITY(bar, 100) CARDINALITY(res, 100)*/
            var_session_id,
            res.outlet_ams_id,
            var_version_date,
            ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_TALISMAN,
            null, --company_code
            res.account_number,
            res.barcode,
            null,--tmp.holder_id,
            res.holder_name,
            res.invoice_number,
            null,--statuscode = null
            'NOPHI_DATHU', --status_name
            res.premium,
            res.from_date,
            res.to_date,
            res.print_date,
            null,--res.collected_date,--cho cai nay bang null de cho no dung
            ams.LIFE_AGENCY_INVOICE.SYSTEM_USER,
            ams.LIFE_AGENCY_INVOICE.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            /*Lay cac ma vach cua thuc thu tru di phai thu thi ra duoc cac cai no phi da thu duoc trong thang
            Sau do dua het vao bang no phi roi merge thong tin sang thi se ra duoc tat ca moi hoa don*/
            select /*+ CARDINALITY(tmp) , 100)*/
                tmp.barcode
            from ams.la_inv_credit_premium_tmp tmp
            where tmp.session_id = var_session_id
                and tmp.source_of_data = ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_TALISMAN
            group by tmp.barcode
            minus
            select /*+ CARDINALITY(tmp, 100)*/
                tmp.barcode
            from ams.la_inv_invoice_tmp tmp
            where tmp.session_id = var_session_id
                and tmp.source_of_data = ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_TALISMAN
                ---phat sinh trong thang
               and tmp.from_date
                   between var_from_date
                   and var_from_date
               --va khong  ton tai hoa don nay la da huy
               and not exists (select 1
                         from ams.la_inv_cancel_invoice_tmp hm
                         where hm.barcode = tmp.barcode
                      )
            group by tmp.barcode
        ) bar
        join/*Lay chi tiet thong tin de dua vao bang no phi cho no dung */
        (
            select /*+ CARDINALITY(tmp) , 100)*/
                max(tmp.outlet_ams_id) outlet_ams_id,
                max(tmp.account_number) account_number,
                tmp.barcode,
                max(tmp.holder_name) holder_name,
                max(tmp.invoice_number) invoice_number,
                max(tmp.status_code) status_code,
                max(tmp.premium) premium,
                max(tmp.from_date) from_date,
                max(tmp.to_date) to_date,
                max(tmp.print_date) print_date,
                max(tmp.collected_date) collected_date
            from ams.la_inv_credit_premium_tmp tmp
            where tmp.session_id = var_session_id
                and tmp.source_of_data = ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_TALISMAN
            group by tmp.barcode
        ) res
            on res.barcode = bar.barcode;
        commit;

        --Sau do se tong hop du lieu vao bao cao o bang chinh de cho nguoi su dung truy van ra

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE.tal_get_invoice', 'No phi nhung ma da dong duoc tien vao thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 12;

        --Sau do se tong hop du lieu vao bao cao o bang chinh de cho nguoi su dung truy van ra
        --Buoc 1
        --Do het du lieu cua 1. no phi chua dong duoc
        --2.No phi da dong duoc va 3. phat sinh vao 1 bang
        insert /*+ APPEND */ into ams.la_inv_invoice_ext  nologging
        (
            outlet_id,
            outlet_ams_id,
            type_code,
            record_date,
            version_date,
            status_code,
            source_of_data,
            outlet_name,
            company_id,
            company_bvl_id,
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
            position_name,
            effective_date,
            terminative_date,
            account_number,
            barcode,
            holder_name,
            insured_name,
            holder_address,
            invoice_number,
            status_invoice_code,
            coll_premium,
            real_premium,
            from_date,
            to_date,
            print_date,
            collected_date,
            is_loan,
            data_type_code,
            data_type_name,
            session_id,
            create_user,
            update_user,
            create_datetime,
            update_datetime,
            phone,
            real_invoice_number
        )
        select /*+ CARDINALITY(tmp, 100)*/
            null,--outlet_id                                     number(10),
            tmp.outlet_ams_id,
            ams.LIFE_AGENCY_INVOICE.MODULE_CODE_MAIN,
            var_record_date,
            var_version_date,--                              date,
            ams.LIFE_AGENCY_INVOICE.OBJECT_STATUS_ACTIVE, --status_code
            ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_TALISMAN,--source_of_data                          varchar2(16),
            null,--outlet_name                               nvarchar2(255),
            null,--company_id                               number(10),
            null,--company_bvl_id                       varchar2(16),
            null,--company_ams_id                       varchar2(16),
            null,--company_name                          nvarchar2(255),
            null,--office_id                                     number(10),
            null,--office_ams_id                             varchar2(16),
            null,--office_name                                nvarchar2(255),
            null,--agency_id                                   number(10),
            null,--agency_ams_id                          varchar2(16),
            null,--agency_name                             nvarchar2(255),
            null,--unit_id                                         number(10),
            null,--unit_ams_id                                 varchar2(16),
            null,--unit_name                                   nvarchar2(255),
            null,--position_code                             varchar2(16),
            null,--position_date                              date,
            null,--position_name                             nvarchar2(32),
            null,--effective_date                             date,
            null,--terminative_date                         date,
            tmp.account_number,--account_number   varchar2(16),
            tmp.barcode,--barcode                varchar2(20),
            tmp.holder_name,--holder_name         nvarchar2(255),
            null,--insured_name        nvarchar2(255),
            null,--holder_address      nvarchar2(255),
            tmp.invoice_number,--invoice_number     varchar2(32),
            tmp.status_code,--status_code          varchar2(2),
            tmp.premium,--  coll_premium                number(18,2),
            null,--  real_premium                number(18,2),
            tmp.from_date,-- from_date             date,
            tmp.to_date,--to_date                 date,
            tmp.print_date,--print_date             date,
            tmp.collected_date,--collected_date      date,
            null,--is_loan
            ams.LIFE_AGENCY_INVOICE.UVL_DEBIT_CODE,--     varchar2(16),
            tmp.status_name,--    nvarchar2(64),
            var_session_id,
            ams.LIFE_AGENCY_INVOICE.SYSTEM_USER,
            ams.LIFE_AGENCY_INVOICE.SYSTEM_USER,
            sysdate,
            sysdate,
            null,--phone
            null--real_invoice_number
        from ams.la_inv_debit_premium_tmp tmp
        where tmp.session_id = var_session_id
            and tmp.source_of_data = ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_TALISMAN;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE.tal_get_invoice', 'do hdon no phi vao bang report thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 13;

        --doi voi nhung cai ma da thuc thu thi chi can merge vao la duoc
        --voi cac barcode la duy nhat da duoc them vao cho no
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_inv_invoice_ext o
        using
            (
                select /*+ CARDINALITY(tmp) , 100)*/
                    max(tmp.outlet_ams_id) outlet_ams_id,
                    max(tmp.account_number) account_number,
                    tmp.barcode,
                    max(tmp.holder_name) holder_name,
                    max(tmp.invoice_number) invoice_number,
                    max(tmp.status_code) status_code,
                    max(tmp.premium) real_premium,
                    max(tmp.from_date) from_date,
                    max(tmp.to_date) to_date,
                    max(tmp.print_date) print_date,
                    max(tmp.collected_date) collected_date
                from ams.la_inv_credit_premium_tmp tmp
                where tmp.session_id = var_session_id
                    and tmp.source_of_data = ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_TALISMAN
                group by tmp.barcode
            ) upd
        on ( --trong thang day voi cac barcode day
            var_session_id = o.session_id
            and
            var_record_date = o.record_date
            and
            ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_TALISMAN = o.source_of_data
            and
            upd.barcode = o.barcode
        )
        when matched then
            update
                set
                    o.outlet_ams_id = upd.outlet_ams_id,
                    o.account_number = upd.account_number,
                    o.holder_name = upd.holder_name,
                    o.invoice_number = upd.invoice_number,
                    o.real_premium = upd.real_premium,
                    o.from_date = upd.from_date,
                    o.to_date = upd.to_date,
                    o.print_date = upd.print_date,
                    o.collected_date = upd.collected_date,
                    --khi da thu duoc thi doi lai thanh thuc thu cho no
                    --khong can cai nay nua vi chi can co collected_date thi tuc la da thuc thu trong thang day roi
                    /*o.data_type_code = ams.LIFE_AGENCY_INVOICE.UVL_CREDIT_CODE,
                    o.data_type_name = ams.LIFE_AGENCY_INVOICE.UVL_CREDIT_PREMIUM,*/
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE.tal_get_invoice', 'do thuc thu vao bang report thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 15;

        dbms_stats.gather_table_stats(null, 'la_inv_invoice_ext', cascade => true);
        dbms_stats.gather_table_stats(null, 'la_inv_outlet_tmp', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE.tal_get_invoice', 'gather la_inv_invoice_ext  la_inv_outlet_tmp thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 16;

        /*chinhlk 28/2/2013 sua lai do co 1 vai loi ve du lieu dai ly*/
        /*cap nhat cac thong tin ve dai ly */
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_inv_invoice_ext o
        using
            (
                select  /*+ CARDINALITY(o) , 100) */
                    o.outlet_ams_id,
                    max(o.outlet_bvlife_id) outlet_bvlife_id,
                    max(o.outlet_id)  outlet_id,
                    max(o.outlet_name) outlet_name,
                    max(o.outlet_number) outlet_number,
                    max(o.company_id) company_id,
                    max(o.company_ams_id) company_ams_id,
                    max(o.company_name) company_name,
                    max(o.office_id) office_id,
                    max(o.office_ams_id) office_ams_id,
                    max(o.office_name) office_name,
                    max(o.agency_id) agency_id,
                    max(o.agency_ams_id) agency_ams_id,
                    max(o.agency_name) agency_name,
                    max(o.unit_id) unit_id,
                    max(o.unit_ams_id) unit_ams_id,
                    max(o.unit_name) unit_name,
                    max(o.position_code) position_code,
                    max(o.position_name) position_name,
                    max(o.position_date) position_date,
                    max(o.effective_date) effective_date,
                    max(o.terminative_date)  terminative_date
                from ams.la_inv_outlet_tmp o
                where o.session_id = var_session_id
                group by o.outlet_ams_id
            ) upd
        on (
            var_session_id = o.session_id
            and
            var_record_date = o.record_date
            and
            ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_TALISMAN = o.source_of_data
            and
            upd.outlet_ams_id = o.outlet_ams_id
        )
        when matched then
            update
                set
                    o.company_name = upd.company_name,
                    o.company_ams_id = upd.company_ams_id,
                    o.company_id = upd.company_id,
                    o.outlet_id = upd.outlet_id,
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
                    o.position_name  = upd.position_name,
                    o.position_date  = upd.position_date,
                    o.update_datetime = sysdate;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE.tal_get_invoice', 'cap nhat cac thong tin dai ly thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 17;

        --merge vao bang la_inv_invoice_ext
        --lay ten nguoi tham gia dia chi vao lam tam o day
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_inv_invoice_ext o
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.account_number,
                    max(tmp.holder_name) holder_name,
                    max(tmp.insured_name) insured_name,
                    max(tmp.holder_address) holder_address,
                    max(tmp.phone) phone
                from ams.la_inv_tal_customer tmp
                where tmp.source_of_data = ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_TALISMAN
                group by tmp.account_number
            ) upd
        on ( --trong thang day voi cac barcode day
            var_session_id = o.session_id
            and
            var_record_date = o.record_date
            and
            ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_TALISMAN = o.source_of_data
            and
            upd.account_number = o.account_number
        )
        when matched then
            update
                set
                    o.holder_name = upd.holder_name,
                    o.insured_name = upd.insured_name,
                    o.holder_address = upd.holder_address,
                    o.phone = upd.phone,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE.tal_get_invoice', 'lay ten gn tham gia dia chi thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 18;

        --sau do do tat cac cac  du lieu tu bang la_inv_invoice_ext vao trong bang la_inv_invoice_ext
        insert /*+ APPEND */ into ams.la_inv_invoice nologging
        (
            outlet_id,
            outlet_ams_id,
            type_code,
            record_date,
            version_date,
            status_code,
            source_of_data,
            outlet_name,
            company_id,
            company_bvl_id,
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
            position_name,
            effective_date,
            terminative_date,
            account_number,
            barcode,
            holder_name,
            insured_name,
            holder_address,
            invoice_number,
            status_invoice_code,
            coll_premium,
            real_premium,
            from_date,
            to_date,
            print_date,
            collected_date,
            is_loan,
            data_type_code,
            data_type_name,
            session_id,
            create_user,
            update_user,
            create_datetime,
            update_datetime,
            phone,
            real_invoice_number
        )
        select /*+ CARDINALITY(tmp, 100)*/
            tmp.outlet_id,
            tmp.outlet_ams_id,
            tmp.type_code,
            tmp.record_date,
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
            tmp.barcode,
            tmp.holder_name,
            tmp.insured_name,
            tmp.holder_address,
            tmp.invoice_number,
            tmp.status_invoice_code,
            tmp.coll_premium,
            --cho nay neu ma da nop phi vao trong thang day thi moi ghi vao cho no la real_premium cho no
            --con khong thi se la bang null
            case when tmp.collected_date is not null then
                tmp.real_premium
            end,
            tmp.from_date,
            tmp.to_date,
            tmp.print_date ,
            tmp.collected_date,
            tmp.is_loan,
            tmp.data_type_code,
            tmp.data_type_name,
            tmp.session_id,
            ams.LIFE_AGENCY_INVOICE.SYSTEM_USER,
            ams.LIFE_AGENCY_INVOICE.SYSTEM_USER,
            sysdate,
            sysdate,
            tmp.phone,
            case when tmp.collected_date is not null then
                tmp.invoice_number
            end
        from ams.la_inv_invoice_ext tmp
        where tmp.session_id = var_session_id
            and tmp.source_of_data = ams.LIFE_AGENCY_INVOICE.SYSTEM_REFER_TALISMAN;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE.tal_get_invoice', 'lay ams.la_inv_invoice tu la_inv_invoice_ext thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 19;

        --dbms_stats.gather_table_stats(null, 'la_inv_invoice', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE.tal_get_invoice', 'gather ams.la_inv_invoice thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 20;

        var_run_end_time := sysdate;
        ams.life_agency_log.time_log(1001, 'Thoi gian chay tal', var_run_begin_time, var_run_end_time);
        exception
            when others then
                rollback;
                life_agency_log.write_log(1000,
                    'get_invoice_tal: loi thu tuc get_invoice_tal ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                    sqlerrm,
                    sqlcode);
    end;

end LIFE_AGENCY_INVOICE;
/
