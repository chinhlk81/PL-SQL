create or replace package ams.LIFE_AGENCY_MANA_POLICY is

    PACK_DATE date := to_date('09-jul-2011');
    TALISMAN_GOLIVE date := to_date('28-feb-2011');

    var_delete_from_date date := trunc(sysdate - 7, 'DD');
    var_current_date date := trunc(sysdate, 'DD');
    --lay tat ca la cai nay de do so lieu vao cho no nhanh va de hon nhe
    var_session_module_id number(1) := 1;

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
    MAX_DELETE_NUMBER number(10) := 50000;

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

    POL_CODE_WOP VARCHAR2(16) := 'WOP';  --Dung thu phi
    POL_NAME_WOP VARCHAR2(16) := 'Dừng thu phí';  --Dung thu phi

    COMM_CONT NUMBER(1) := 1; --con hoa hong khai thac
    COMM_CONT_NAME VARCHAR2(64) := 'Còn hoa hồng';

    COMM_CONT_NO NUMBER(1) := 0; --con hoa hong khai thac
    COMM_CONT_NAME_NO VARCHAR2(64) := 'Hết hoa hồng';

    procedure daily_mana_gui(valRecordDate date := null,
        valReRun number := null,
        valDeleteOldData number := null,
        row_records out sys_refcursor);
    procedure main(valRecordDate date := null,
        valReRun number := null,
        valDeleteOldData number := null);
    procedure run(valRecordDate date := null,
        valReRun number := null,
        valDeleteOldData number := null);
    procedure pol_clear_old_data(valRecordDate date := null,
        valTypeOfData varchar2 := null,
        valCompanyID number := null,
        valSessionId number := null);
    procedure pol_clear_data(valRecordDate date := null,
        valTypeOfData varchar2 := null,
        valCompanyID number := null,
        valSessionId number := null);
    procedure bvl_get_policy_prepare(valRecordDate date := null,
        valTypeOfData varchar2 := null,
        valCompanyID number := null,
        valSessionId number := null);
    procedure bvl_get_policy(valRecordDate date := null,
        valTypeOfData varchar2 := null,
        valCompanyID number := null,
        valSessionId number := null);

    procedure bvl_get_policy_synch(valRecordDate date := null,
        valTypeOfData varchar2 := null,
        valCompanyID number := null,
        valSessionId number := null);

    procedure tal_get_policy_prepare(valRecordDate date := null,
        valTypeOfData varchar2 := null,
        valCompanyID number := null,
        valSessionId number := null);
    procedure tal_get_policy(valRecordDate date := null,
        valTypeOfData varchar2 := null,
        valCompanyID number := null,
        valSessionId number := null);
    procedure tal_get_policy_synch(valRecordDate date := null,
        valTypeOfData varchar2 := null,
        valCompanyID number := null,
        valSessionId number := null);
    procedure get_comm_prepare(valRecordDate date := null,
        valTypeOfData varchar2 := null,
        valCompanyID number := null,
        valSessionId number := null);
    function outlet_of_account(valDate date := null,
        valAccountNumber varchar2 := null,
        valTypeOfOutlet varchar2 := null) return varchar2;
end LIFE_AGENCY_MANA_POLICY;
/
create or replace package body ams.LIFE_AGENCY_MANA_POLICY is
    procedure daily_mana_gui(valRecordDate date := null,
        valReRun number := null,
        valDeleteOldData number := null,
        row_records out sys_refcursor)
    is
      --CHU Y CHO NAY LA DAU VAO THEO NGAY CHU KHONG THEO THANG
      var_record_date date := trunc(valRecordDate, 'DD');
      var_error_message varchar2(3000) := null;
    begin
        if AMS_CORE_MODULE.is_active('POL_MANA_JOB', (trunc(sysdate, 'DD') - 1))
                = AMS_CORE_MODULE.IS_YES then
            --chay du lieu tu dau thang cho no luon cho no nhanh
            ams.LIFE_AGENCY_MANA_POLICY.main(var_record_date, valReRun, valDeleteOldData);
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

    procedure main(valRecordDate date := null,
        valReRun number := null,
        valDeleteOldData number := null)
    is
        var_record_date date := trunc(valRecordDate, 'DD');
        var_rerun number(1) := nvl(valReRun, 0);
    begin
        --neu ma tu ngay mong 1 den ngay mong 10 thi se chay lai thang truoc moi du duoc
        if to_number(to_char(sysdate, 'DD')) between 1 and 10 then
            --chay lai thang truoc thi du lieu moi du duoc
            ams.life_agency_mana_policy.run(trunc(sysdate, 'MM') - 1,
                                     0,
                                     0);
        end if;
        --sau do chay cho ngay hom day
        ams.life_agency_mana_policy.run(var_record_date,
                                 var_rerun,
                                 valDeleteOldData);
    exception
        when others then
            life_agency_log.write_log(-999,
                'loi tai thu tuc: ams.LIFE_AGENCY_MANA_POLICY.run',
                sqlerrm,
                sqlcode);
    end;


    procedure run(valRecordDate date := null,
        valReRun number := null,
        valDeleteOldData number := null)
    is
        var_run_from_time date := sysdate;
        var_run_to_time date := sysdate;
        var_session_id number(14) := 0;
        var_record_date date := trunc(valRecordDate, 'DD');
        var_rerun number(1) := nvl(valReRun, 0);
    begin
        var_run_from_time := sysdate;
        /* POLICY*/

        var_session_id := dbms_random.value(1,10000);
        var_session_id := 1;

        /*neu ma xoa du lieu cu di thi moi chay cai lenh nay*/
        if valDeleteOldData = 1 then
            ams.LIFE_AGENCY_MANA_POLICY.pol_clear_old_data(var_record_date,
                ams.LIFE_AGENCY_MANA_POLICY.MODULE_CODE_MAIN,
                0,
                var_session_id);
        end if;

        --xoa du lieu trong bang repo
        ams.LIFE_AGENCY_MANA_POLICY.pol_clear_data(var_record_date,
            ams.LIFE_AGENCY_MANA_POLICY.MODULE_CODE_MAIN,
            0,
            var_session_id);

        --neu ma chay lai du lieu
        if var_rerun = 1 then
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            --xoa het moi du lieu va chay lai tu dau cho no
            execute immediate 'truncate table ams.la_mana_policy_history';
            execute immediate 'truncate table ams.la_mana_policy';
            execute immediate 'truncate table ams.la_mana_policy_repo';
            commit;
            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'bvl_get_policy_synch', 'truncate o main');
        end if;

        --lay du lieu con hhkt khong?
        /*ams.LIFE_AGENCY_MANA_POLICY.get_comm_prepare(var_record_date,
            ams.LIFE_AGENCY_MANA_POLICY.MODULE_CODE_MAIN,
            0,
            var_session_id);*/

        if AMS_CORE_MODULE.is_active('POL_MANA_BVL', (trunc(sysdate, 'DD') - 1))
                = AMS_CORE_MODULE.IS_YES then
            --neu ma chay lai du lieu
            if var_rerun = 1 then
                --chay lai het cho no
                ams.LIFE_AGENCY_MANA_POLICY.bvl_get_policy_prepare(var_record_date,
                    ams.LIFE_AGENCY_MANA_POLICY.MODULE_CODE_MAIN,
                    0,
                    var_session_id);
            end if;
            --lay du lieu cua thang do den ngay do cho chinh xac len
            ams.LIFE_AGENCY_MANA_POLICY.bvl_get_policy(var_record_date,
                ams.LIFE_AGENCY_MANA_POLICY.MODULE_CODE_MAIN,
                0,
                var_session_id);
            ams.LIFE_AGENCY_MANA_POLICY.bvl_get_policy_synch(var_record_date,
                ams.LIFE_AGENCY_MANA_POLICY.MODULE_CODE_MAIN,
                0,
                var_session_id);
        end if;


        if AMS_CORE_MODULE.is_active('POL_MANA_TAL', (trunc(sysdate, 'DD') - 1))
                = AMS_CORE_MODULE.IS_YES then
            --neu ma chay lai du lieu
           if var_rerun = 1 then
                --chay lai het cho no
                ams.LIFE_AGENCY_MANA_POLICY.tal_get_policy_prepare(var_record_date,
                    ams.LIFE_AGENCY_MANA_POLICY.MODULE_CODE_MAIN,
                    0,
                    var_session_id);
            end if;

            ams.LIFE_AGENCY_MANA_POLICY.tal_get_policy(var_record_date,
                ams.LIFE_AGENCY_MANA_POLICY.MODULE_CODE_MAIN,
                0,
                var_session_id);
            ams.LIFE_AGENCY_MANA_POLICY.tal_get_policy_synch(var_record_date,
                ams.LIFE_AGENCY_MANA_POLICY.MODULE_CODE_MAIN,
                0,
                var_session_id);
        end if;

        var_run_to_time := sysdate;
        ams.life_agency_log.time_log(0, 'Tat ca cac cong ty', var_run_from_time, var_run_to_time);
    exception
        when others then
            life_agency_log.write_log(-999,
                'loi tai thu tuc: ams.LIFE_AGENCY_MANA_POLICY.main',
                sqlerrm,
                sqlcode);
    end;


    --xoa het du lieu cu ma qua 6 thang truoc day
    procedure pol_clear_old_data(valRecordDate date := null,
        valTypeOfData varchar2 := null,
        valCompanyID number := null,
        valSessionId number := null)
    is
        var_delete_from_month date := add_months(trunc(sysdate, 'MM'), -5);
        --xoa tat ca cac du lieu co truoc do 7 ngay di da
        var_delete_date_before date :=  trunc(valRecordDate - 7, 'DD');
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        --xoa du lieu cua ban can xoa truoc khi thuc hien

        --var_delete_from_date
        --xoa cac du lieu can xoa truoc do 7 ngay di da
        loop
            delete ams.la_mana_policy_repo del
            where del.record_date < var_delete_date_before
                and del.type_code = valTypeOfData
                and rownum < ams.LIFE_AGENCY_MANA_POLICY.RECORD_MAX_DELETE;
            exit when SQL%rowcount < ams.LIFE_AGENCY_MANA_POLICY.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_MANA_POLICY', 'xoa la_mana_policy_repo');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        dbms_stats.gather_table_stats(null, 'la_mana_policy_repo', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'bvl_get_policy_synch', 'gather la_mana_policy_repo ');

        exception
            when others then
                rollback;
                life_agency_log.write_log(1000,
                    'bvl_clear_data: loi thu tuc xoa du lieu bang tam',
                    sqlerrm,
                    sqlcode);
    end;

    procedure pol_clear_data(valRecordDate date := null,
        valTypeOfData varchar2 := null,
        valCompanyID number := null,
        valSessionId number := null)
    is
        var_record_date date := trunc(valRecordDate, 'MM');
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        --xoa du lieu cua ban can xoa truoc khi thuc hien
        --ca BVL va TAL
        loop
            delete ams.la_mana_policy del
            where del.record_date = var_record_date
                and del.type_code = valTypeOfData
                and rownum < ams.LIFE_AGENCY_MANA_POLICY.RECORD_MAX_DELETE;
            exit when SQL%rowcount < ams.LIFE_AGENCY_MANA_POLICY.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_MANA_POLICY', 'truncate cac bang tam thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        exception
            when others then
                rollback;
                life_agency_log.write_log(1000,
                    'bvl_clear_data: loi thu tuc xoa du lieu bang tam',
                    sqlerrm,
                    sqlcode);
    end;

    procedure bvl_get_policy_prepare(valRecordDate date := null,
        valTypeOfData varchar2 := null,
        valCompanyID number := null,
        valSessionId number := null)
    is
        var_record_date date := trunc(valRecordDate, 'MM');
        var_selected_data_date date := trunc(valRecordDate, 'DD');
        var_str_from_date varchar2(64) := to_char(add_months(sysdate, -500), 'DD-MON-YYYY');
        var_str_record_date varchar2(64) := to_char(trunc(valRecordDate, 'MM'), 'DD-MON-YYYY');

        --lay du lieu trong vong 1 thang thoi nhe
        var_from_date date := trunc(valRecordDate, 'MM');
        --cuoi thang la cuoi thang nay luon cho no de tinh
        var_to_date date := add_months(trunc(valRecordDate, 'MM'), 1) - 1;

        var_str_from_date varchar2(64) := to_char(trunc(valRecordDate, 'MM'), 'DD-MON-YYYY');
        var_str_to_date varchar2(64) := to_char(add_months(trunc(valRecordDate, 'MM'), 1) - 1, 'DD-MON-YYYY');

        var_error_pos  number(8, 2) := null;
        var_session_id number(14) := 1;
        var_version_date date := trunc(sysdate, 'DD');
        var_query varchar(32000) := '';
        var_run_begin_time date := sysdate;
        var_run_end_time date := sysdate;
    begin
        var_run_begin_time := sysdate;
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 1;

        --cho tat ca session id bang 1
        var_session_id := var_session_module_id;

        --xoa du lieu BVL de sau do se do lai tat ca du lieu lai tu dau cho no
        --cai nay ghi nhu the thoi nhung ma se khong chay duoc dau vi
        --truncate het bang nay khi chay lai tu lan dau tien roi day nhe
        --truncate het di khi thuc hien co nhe
        loop
            delete ams.la_mana_policy del
            where del.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE
                and rownum < ams.LIFE_AGENCY_MANA_POLICY.RECORD_MAX_DELETE;
            exit when SQL%rowcount < ams.LIFE_AGENCY_MANA_POLICY.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'bvl_get_policy_prepare', 'delete ams.la_mana_policy thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 2;

        --xoa du lieu cua bang nay di
        execute immediate 'truncate table ams.la_mana_policy_ext_tmp';
        --neu la chay lai thi se lay lai tat ca cac du lieu cho no phat hanh trong moi thang
        --thuc hien doi voi lan chay dau tien cho no
        execute immediate 'truncate table ams.la_mana_bvl_policy_tmp';
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'bvl_get_policy_prepare', 'truncate cac bang thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 3;

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

            execute immediate 'truncate table ams.la_mana_bvl_policy_tmp';
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(list_databse.id, 'bvl_get_policy_prepare', 'delete  la_mana_bvl_policy_tmp cty  ' || list_databse.name || '  ' ||   to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 3.1;

            --lay danh sach cac hop dong vao bang
            --do lay lan dau tien nen cho lay danh sach cac hop dong
            --CON HIEU LUC HET HIEU LUC THI KHONG LAY
            var_query := ' begin
                insert /*+ APPEND */ into ams.la_mana_bvl_policy_tmp nologging
                select  /*+ CARDINALITY(pol, 100) */ '||
                    var_session_id || ', ' || '
                    to_date(' ||chr(39) || var_record_date || chr(39) || '),
                    daily_hd' || list_databse.link || '(to_date(' ||chr(39) || var_str_to_date || chr(39) || '), pol.hd_id),' ||
                    chr(39)||'D'||chr(39)|| ' || daily_hd' || list_databse.link || '(to_date(' ||chr(39) || var_str_to_date || chr(39) || '), pol.hd_id),
                    to_date(' ||chr(39) || var_version_date || chr(39) || '),
                    ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE,'
                    || chr(39) || list_databse.id || chr(39) || ',
                    pol.hd_id,
                    pol.ngaydau,
                    pol.ngayphanh,
                    pol.of_date,
                    ams_core_function.get_freq_by_months' || list_databse.link || '(pol.hd_id, to_date(' ||chr(39) || var_str_to_date || chr(39) || ')),
                    ams_core_function.get_freq_premium' || list_databse.link || '(pol.hd_id, to_date(' ||chr(39) || var_str_to_date || chr(39) || ')),
                    null,
                    pol.tt_hd,
                    ams_core_function.get_init_outlet_id' || list_databse.link || '(pol.hd_id, to_date(' ||chr(39) || var_str_to_date || chr(39) || ')),
                    ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                    ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                    sysdate,
                    sysdate,
                    hhct.con_hhkt' || list_databse.link || '(pol.hd_id, to_date(' ||chr(39) || var_str_to_date || chr(39) || '),'''')
                  from
                  (
                      select  /*+ CARDINALITY(tmp, 100)*/
                          tmp.dl_id,
                          tmp.hd_id,
                          tmp.ngaydau,
                          tmp.ngayphanh,
                          tmp.tt_hd,
                          null of_date
                      from nt_hopdong' || list_databse.link || ' tmp
                      where tmp.tt_hd like '||chr(39)||'0_________0%'||chr(39)||'
                          and tmp.dk_nop <> '||chr(39)||'00'||chr(39)||'
                          and tmp.ngayphanh <= to_date(' ||chr(39) || var_str_to_date || chr(39) || ')
                          and tmp.ngay_hluc <= to_date(' ||chr(39) || var_str_to_date || chr(39) || ')
                          and tmp.sf_id not in ('||chr(39)||'1010767'||chr(39)||', '||chr(39)||'1010794'||chr(39)||')
                          and tmp.cty_id = '||chr(39)|| list_databse.id ||chr(39)||'
                  ) pol;
            end;
            ';
            execute immediate var_query;
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(list_databse.id, 'bvl_get_policy_prepare', 'do vao tu bang nt_hopdong cty  ' || list_databse.name || '  ' ||   to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 3.2;

            --lay danh sach cac hop dong trong bang lích su hop dong
            --CHI LAY CAC HOP DONG CON HIEU LUC THOI
            var_query := ' begin
                insert /*+ APPEND */ into ams.la_mana_bvl_policy_tmp nologging
                select  /*+ CARDINALITY(pol, 100) CARDINALITY(hd, 100) CARDINALITY(rid, 100)*/ '||
                    var_session_id || ', ' || '
                    to_date(' ||chr(39) || var_record_date || chr(39) || '),
                    daily_hd' || list_databse.link || '(to_date(' ||chr(39) || var_str_to_date || chr(39) || '), pol.hd_id),' ||
                    chr(39)||'D'||chr(39)|| ' || daily_hd' || list_databse.link || '(to_date(' ||chr(39) || var_str_to_date || chr(39) || '), pol.hd_id),
                    to_date(' ||chr(39) || var_version_date || chr(39) || '),
                    ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE,'
                    || chr(39) || list_databse.id || chr(39) || ',
                    pol.hd_id,
                    hd.ngaydau,
                    hd.ngayphanh,
                    pol.of_date,
                    ams_core_function.get_freq_by_months' || list_databse.link || '(pol.hd_id, to_date(' ||chr(39) || var_str_to_date || chr(39) || ')),
                    ams_core_function.get_freq_premium' || list_databse.link || '(pol.hd_id, to_date(' ||chr(39) || var_str_to_date || chr(39) || ')),
                    null,
                    pol.tthd,
                    ams_core_function.get_init_outlet_id' || list_databse.link || '(pol.hd_id, to_date(' ||chr(39) || var_str_to_date || chr(39) || ')),
                    ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                    ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                    sysdate,
                    sysdate,
                    hhct.con_hhkt' || list_databse.link || '(pol.hd_id, to_date(' ||chr(39) || var_str_to_date || chr(39) || '),'''')
                  from
                  (
                      select  /*+ CARDINALITY(tmp, 100)*/
                          tmp.dl_id,
                          tmp.hd_id,
                          tmp.tthd,
                          null of_date,
                          tmp.sf_id
                      from  nt_lshd' || list_databse.link || ' tmp
                      where tmp.tthd like '||chr(39)||'0_________0%'||chr(39)||'
                          and tmp.dk_nop <> '||chr(39)||'00'||chr(39)||'
                          and tmp.ngayqd >= to_date(' ||chr(39) || var_str_to_date || chr(39) || ')
                          and tmp.ngay_hluc < to_date(' ||chr(39) || var_str_to_date || chr(39) || ')
                          and tmp.sf_id not in ('||chr(39)||'1010767'||chr(39)||', '||chr(39)||'1010794'||chr(39)||')
                          and tmp.cty_id = '||chr(39)|| list_databse.id ||chr(39)||'
                  ) pol
                  left join
                  (
                      select /*+ CARDINALITY(tmp, 100)*/
                          tmp.hd_id,
                          tmp.ngaydau,
                          tmp.ngayphanh
                      from nt_hopdong' || list_databse.link || ' tmp
                      where tmp.ngayphanh <= to_date(' ||chr(39) || var_str_to_date || chr(39) || ')
                          and tmp.sf_id not in ('||chr(39)||'1010767'||chr(39)||', '||chr(39)||'1010794'||chr(39)||')
                          and tmp.cty_id = '||chr(39)|| list_databse.id ||chr(39)||'
                  ) hd
                      on hd.hd_id = pol.hd_id;
            end;
            ';
            execute immediate var_query;
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(list_databse.id, 'bvl_get_policy_prepare', 'do vao tu bang lshd  cty  ' || list_databse.name || '  ' ||   to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 3.3;

            --do du lieu vao bang la_mana_policy_ext_tmp truoc da sau do se do vao bang lich su cho no sau
            insert /*+ APPEND */ into ams.la_mana_policy_ext_tmp nologging
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
                pol_effective_date,
                pol_issue_date,
                pol_of_date,
                freq_by_months,
                freq_per_annum,
                freq_per_annum_name,
                commission_status,
                commission_status_name,
                init_premium,
                freq_premium,
                lsum_premium,
                afyp,
                pol_status,
                pol_status_code,
                pol_status_name,
                holder_name,
                insured_name,
                holder_address,
                init_outlet_id,
                init_outlet_ams_id,
                session_id,
                create_user,
                update_user,
                create_datetime,
                update_datetime
            )
            select /*+ CARDINALITY(tmp, 100)*/
                null,--outlet_id
                tmp.outlet_ams_id,
                ams.LIFE_AGENCY_MANA_POLICY.MODULE_CODE_MAIN,
                var_record_date,
                var_version_date,--                              date,
                ams.LIFE_AGENCY_MANA_POLICY.OBJECT_STATUS_ACTIVE, --status_code
                ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE,--source_of_data                          varchar2(16),
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
                tmp.effective_date,--tmp.pol_effective_date
                tmp.issue_date, --pol_issue_date           date,
                tmp.of_date,--pol_of_date           date,
                tmp.freq_by_months,--
                12 /
                    (
                        decode(nvl(to_number(tmp.freq_by_months), 0),
                            0, 120,
                            nvl(to_number(tmp.freq_by_months), 0)
                            )
                    ),--freq_per_annum
                null,--freq_name
                --null,
                tmp.commission_status, -- tt hoa hong
                null,
                tmp.init_premium,
                tmp.freq_premium,
                null,--lsum
                null,--tmp.afyp
                tmp.status_code,
                null,
                null,
                null,--tmp.holder_name,--holder_name         nvarchar2(255),
                null,--insured_name        nvarchar2(255),
                null,--holder_address      nvarchar2(255),
                null,--init_outlet_id
                'D' || tmp.init_outlet_bvl_id, --init_outlet_ams_id
                var_session_id,
                ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                sysdate,
                sysdate
            from ams.la_mana_bvl_policy_tmp tmp
            where tmp.session_id = var_session_id
                and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE
                and tmp.company_bvl_id = list_databse.id;
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(list_databse.id, 'bvl_get_policy_prepare', 'do vao bang la_mana_policy_ext_tmp thang ' || list_databse.name || '  ' ||  to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));

            var_run_end_time := sysdate;
            ams.life_agency_log.time_log(list_databse.id, 'Thoi gian chay BVL cty ' || list_databse.name || '  ' || to_char(valRecordDate, 'dd/mm/yyyy'), var_run_begin_time, var_run_end_time);
        end loop;

        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 5;

        --cap nhat cac thong tin khac vao day nua
        update ams.la_mana_policy_ext_tmp tmp
        set tmp.afyp = nvl(tmp.freq_by_months, 0.1) * nvl(tmp.init_premium, 0),
            tmp.freq_premium = tmp.init_premium
        where tmp.session_id = var_session_id
            and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE;
        commit;

        -- Cap nhat tinh trang hoa hong
        update ams.la_mana_policy_ext_tmp tmp
        set tmp.commission_status_name = ams.LIFE_AGENCY_MANA_POLICY.COMM_CONT_NAME
        where tmp.commission_status = ams.LIFE_AGENCY_MANA_POLICY.COMM_CONT
            and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE;
        commit;

        update ams.la_mana_policy_ext_tmp tmp
        set tmp.commission_status_name = ams.LIFE_AGENCY_MANA_POLICY.COMM_CONT_NAME_NO
        where tmp.commission_status = ams.LIFE_AGENCY_MANA_POLICY.COMM_CONT_NO
            and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'bvl_get_policy_prepare', 'cap nhat afyp thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 6;

        update ams.la_mana_policy_ext_tmp tmp
        set tmp.pol_status_code = ams.LIFE_AGENCY_MANA_POLICY.POL_CODE_WOP,
            tmp.pol_status_name = ams.LIFE_AGENCY_MANA_POLICY.POL_NAME_WOP
        where tmp.session_id = var_session_id
            and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE
            and tmp.pol_status is not null
            and substr(tmp.pol_status, 2, 1) = '1'; --neu ky tu thu 2 cua no = 1 thi chung to la no dang bi dung thu phi
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'bvl_get_policy_prepare', 'cap nhat WOP thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 5.3;

        --cap nhat dinh ky dong phi vao day
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_mana_policy_ext_tmp o
        using
            (
                select  /*+ CARDINALITY(code, 100)*/
                    code.code_code freq_code,
                    code.code_value freq_name
                from ams.cla_codes code
                where code.code_language = ams.LIFE_AGENCY_MANA_POLICY.THEME_LANGUAGE
                    and code.code_group = 'FREQ'
                    and trunc(sysdate, 'DD')
                        between nvl(code.from_date, ams.LIFE_AGENCY_MANA_POLICY.DATE_MIN_VALUE)
                        and nvl(code.to_date, ams.LIFE_AGENCY_MANA_POLICY.DATE_MAX_VALUE)
            ) upd
        on (
            var_session_id = o.session_id
            and
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE = o.source_of_data
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
        ams.life_agency_log.write_log(1000, 'bvl_get_policy_prepare', 'cap nhat dinh ky dong phi thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 7;

        --merge vao bang la_mana_policy_ext_tmp
        --lay ten nguoi tham gia dia chi vao lam tam o day
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_mana_policy_ext_tmp o
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.account_number,
                    max(tmp.holder_name) holder_name,
                    max(tmp.insured_name) insured_name,
                    max(tmp.address) holder_address
                from ams.la_inv_bvl_customer tmp
                where tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE
                group by tmp.account_number
            ) upd
        on ( --trong thang day voi cac account_number day
            var_session_id = o.session_id
            and
            var_record_date = o.record_date
            and
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE = o.source_of_data
            and
            upd.account_number = o.account_number
        )
        when matched then
            update
                set
                    o.holder_name = upd.holder_name,
                    o.insured_name = upd.insured_name,
                    o.holder_address = upd.holder_address,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'bvl_get_policy_prepare', 'do ten khach hang BVL thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 6;

        --merge vao bang la_mana_policy_ext_tmp
        --lay tu ODS them vi BVL co the thieu du lieu lay ten nguoi tham gia dia chi vao olam tam o day
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_mana_policy_ext_tmp o
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.account_number,
                    max(tmp.holder_name) holder_name,
                    max(tmp.insured_name) insured_name,
                    max(tmp.holder_address) holder_address
                from ams.la_inv_tal_customer tmp
                where tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE
                group by tmp.account_number
            ) upd
        on ( --trong thang day voi cac barcode day
            var_session_id = o.session_id
            and
            var_record_date = o.record_date
            and
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE = o.source_of_data
            and
            upd.account_number = o.account_number
        )
        when matched then
            update
                set
                    o.holder_name = upd.holder_name,
                    o.insured_name = upd.insured_name,
                    o.holder_address = upd.holder_address,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'bvl_get_policy_prepare', 'do ten khach hang TAL thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 7;
        /*cap nhat cac thong tin ve dai ly */
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_mana_policy_ext_tmp o
        using
            (
                select  /*+ CARDINALITY(o, 100)*/
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
                from ams.la_inv_outlet o
                where o.record_date = var_record_date
                group by o.outlet_ams_id
            ) upd
        on (
            var_session_id = o.session_id
            and
            var_record_date = o.record_date
            and
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE = o.source_of_data
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
        ams.life_agency_log.write_log(1000, 'bvl_get_policy_prepare', 'cap nhat cac thong tin dai ly thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 8;

         merge  /*+ CARDINALITY(o, 100)
                    CARDINALITY(upd, 100)
                    LEADING(o upd) */
              into ams.la_mana_policy_ext_tmp o
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
              ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE = o.source_of_data
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
        ams.life_agency_log.write_log(1000, 'bvl_get_policy_prepare', 'lay ma cong ty BVL thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 9.1;

        dbms_stats.gather_table_stats(null, 'la_mana_policy_ext_tmp', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'bvl_get_policy_prepare', 'gather ams.la_mana_policy_ext_tmp thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 10;

        --sau do do tat ca VAO BANG LISH SU CHO NO
        --de ve sau do ra thi se rat de va tien
        --cac  du lieu tu bang la_mana_policy_ext_tmp vao trong bang la_mana_policy_history
        insert /*+ APPEND */ into ams.la_mana_policy_history nologging
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
            pol_effective_date,
            pol_issue_date,
            pol_of_date,
            freq_by_months,
            freq_per_annum,
            freq_per_annum_name,
            commission_status,
            commission_status_name,
            init_premium,
            freq_premium,
            lsum_premium,
            afyp,
            pol_status,
            pol_status_code,
            pol_status_name,
            holder_name,
            insured_name,
            holder_address,
            init_outlet_id,
            init_outlet_ams_id,
            session_id,
            create_user,
            update_user,
            create_datetime,
            update_datetime
        )
        select /*+ CARDINALITY(tmp, 100)*/
            max(tmp.outlet_id) outlet_id ,
            max(tmp.outlet_ams_id) outlet_ams_id,
            max(tmp.type_code) type_code,
            max(tmp.record_date) record_date,
            max(tmp.version_date) version_date,
            max(tmp.status_code) status_code,
            max(tmp.source_of_data) source_of_data,
            max(tmp.outlet_name) outlet_name ,
            max(tmp.company_id) company_id ,
            max(tmp.company_bvl_id) company_bvl_id ,
            max(tmp.company_ams_id) company_ams_id,
            max(tmp.company_name) company_name ,
            max(tmp.office_id) office_id,
            max(tmp.office_ams_id) office_ams_id,
            max(tmp.office_name) office_name,
            max(tmp.agency_id) agency_id,
            max(tmp.agency_ams_id) agency_ams_id ,
            max(tmp.agency_name) agency_name ,
            max(tmp.unit_id) unit_id ,
            max(tmp.unit_ams_id) unit_ams_id,
            max(tmp.unit_name) unit_name ,
            max(tmp.position_code) position_code ,
            max(tmp.position_date) position_date,
            max(tmp.position_name) position_name ,
            max(tmp.effective_date) effective_date,
            max(tmp.terminative_date) terminative_date ,
            tmp.account_number,
            max(tmp.pol_effective_date) pol_effective_date ,
            max(tmp.pol_issue_date) pol_issue_date ,
            max(tmp.pol_of_date) pol_of_date,
            max(tmp.freq_by_months) freq_by_months,
            max(tmp.freq_per_annum) freq_per_annum,
            max(tmp.freq_per_annum_name) freq_per_annum_name,
            max(tmp.commission_status) commission_status,--null,--
            max(tmp.commission_status_name) commission_status_name,--null,--
            max(tmp.init_premium) init_premium,
            max(tmp.freq_premium) freq_premium,
            max(tmp.lsum_premium) lsum_premium,
            max(tmp.afyp) afyp,
            max(tmp.pol_status) pol_status ,
            max(tmp.pol_status_code) pol_status_code ,
            max(tmp.pol_status_name) pol_status_name,
            max(tmp.holder_name) holder_name,
            max(tmp.insured_name) insured_name ,
            max(tmp.holder_address) holder_address,
            max(tmp.init_outlet_id) init_outlet_id ,
            max(tmp.init_outlet_ams_id) init_outlet_ams_id,
            var_session_module_id, --session_id = 1 cho no
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.la_mana_policy_ext_tmp tmp
        where tmp.session_id = var_session_id
            and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE
        group by tmp.account_number;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'bvl_get_policy_prepare', 'do vao bang la_mana_policy tu bang ext thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        var_error_pos := 10;
        dbms_stats.gather_table_stats(null, 'la_mana_policy_history', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'bvl_get_policy_prepare', 'gather ams.la_mana_policy thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        --sau do thuc hien do so lieu vao bang de tra theo ngay cho no
        --lay tu BVL truoc tu bang  la_mana_policy_ext_tmp da co o tren va khong xoa
        --lay cac danh sach hop dong con hieu luc trong thang day truoc
        --neu ma chon ngay vao day no nam trong ngay hien tai - 7 cho den ngay hien tai
        --thi se xoa du lieu cu va do so lieu moi vao ban nay de
        --no query ra cho nhanh

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'bvl_get_policy_prepare', 'co chay cai nay: ngay select khi chay: ' ||  to_char(var_selected_data_date, 'dd/mm/yyyy') || ' - co nam trong (  tu ngay: ' || to_char(var_delete_from_date, 'dd/mm/yyyy') || ' - ' || to_char(var_current_date, 'dd/mm/yyyy')  || ' : den ngay ) ?' );
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        var_run_end_time := sysdate;
        ams.life_agency_log.time_log(1001, 'Thoi gian chay bvl', var_run_begin_time, var_run_end_time);
        exception
            when others then
                rollback;
                life_agency_log.write_log(1000,
                    'bvl_get_policy: loi  ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                    sqlerrm,
                    sqlcode);
    end;
    --phan nay se la chay cho no vao tung ngay mot va chi back lai 1 thang
    --va chay cho thang do do du lieu hop dong phat hanh va con hieu luc trong thang do
    --hop dong het hieu luc trong thang do va do vao trong bang
    --la_mana_policy cho no luon voi record_date chinh la thang do cho no
    --chinh la thang da co day cho no
    --record_date la thang day luon cho no
    --record date chinh la du lieu co den thang do cho no
    procedure bvl_get_policy(valRecordDate date := null,
        valTypeOfData varchar2 := null,
        valCompanyID number := null,
        valSessionId number := null)
    is
        var_record_date date := trunc(valRecordDate, 'MM');
        var_selected_data_date date := trunc(valRecordDate, 'DD');
        var_str_record_date varchar2(64) := to_char(trunc(valRecordDate, 'MM'), 'DD-MON-YYYY');

        --lay du lieu trong vong 1 thang thi se du duoc so lieu roi
        var_from_date date := var_record_date;
        --cuoi thang la cuoi thang nay luon cho no de tinh
        var_to_date date := add_months(trunc(valRecordDate, 'MM'), 1) - 1;

        --lay du lieu cua 1 thang da co roi
        var_str_from_date varchar2(64) := to_char(var_from_date, 'DD-MON-YYYY');
        var_str_to_date varchar2(64) := to_char(var_to_date, 'DD-MON-YYYY');



        var_change_from_date date := add_months(trunc(sysdate, 'DD'), -6);
        --cuoi thang la cuoi thang nay luon cho no de tinh
        var_change_to_date date := add_months(trunc(sysdate, 'DD'), 6);

        --lay du lieu cua 1 thang da co roi
        var_str_change_from_date varchar2(64) := to_char(var_change_from_date, 'DD-MON-YYYY');
        var_str_change_to_date  varchar2(64) := to_char(var_change_to_date, 'DD-MON-YYYY');


        var_error_pos  number(8, 2) := null;
        var_session_id number(14) := 0;
        var_version_date date := trunc(sysdate, 'DD');
        var_query varchar(32000) := '';
        var_run_begin_time date := sysdate;
        var_run_end_time date := sysdate;

        var_date date := trunc(valRecordDate, 'MM');
    begin
        var_run_begin_time := sysdate;
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 1;

        var_session_id := valSessionId;

        --chi chay trong vong 1 thang day thoi
        loop
            delete ams.la_mana_policy del
            where del.record_date = var_record_date
                and del.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE
                and rownum < ams.LIFE_AGENCY_MANA_POLICY.RECORD_MAX_DELETE;
            exit when SQL%rowcount < ams.LIFE_AGENCY_MANA_POLICY.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'bvl_get_policy', 'delete ams.la_mana_policy thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 2;
        --xoa du lieu cua bang nay di
        execute immediate 'truncate table ams.la_mana_policy_ext_tmp';
        execute immediate 'truncate table ams.la_mana_bvl_policy_tmp';
        commit;


        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'bvl_get_policy', 'truncate la_mana_policy_ext_tmp thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 3;

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
            execute immediate 'truncate table ams.la_mana_bvl_policy_tmp';
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(list_databse.id, 'bvl_get_policy', 'delete  la_mana_bvl_policy_tmp cty  ' || list_databse.name || '  ' ||   to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 1.1;

            --lay danh sach cac hop dong co THAY DOI  TRANG THAI va CON HIEU LUC
            --KHONG PHAI LAY RIENG CAC HOP DONG PHAT HANH TRONG THANG THI SE BI THIEU
            --VI NEU CO THAY DOI VE TINH TRANG HOP DONG CUAN NO
            --lay danh sach cac hop dong het hieu luc trong thang day luon

            -------CAN PHAI SUA TIEP O DAY CHO NO
            --sau do khi ma do vao bang kia thi chi can select distint cho no de du lieu duoc dung hon la duoc roi
            --du lieu do thi no se bi trung lap cac du lieu cho no nen can phai xu ly tiep sau
            var_query := ' begin
                insert /*+ APPEND */ into ams.la_mana_bvl_policy_tmp nologging
                select  /*+ CARDINALITY(pol, 100)*/ '||
                    var_session_id || ', ' || '
                    to_date(' ||chr(39) || var_record_date || chr(39) || '),
                    daily_hd' || list_databse.link || '(to_date(' ||chr(39) || var_str_to_date || chr(39) || '), pol.hd_id),' ||
                    chr(39)||'D'||chr(39)|| ' || daily_hd' || list_databse.link || '(to_date(' ||chr(39) || var_str_to_date || chr(39) || '), pol.hd_id),
                    to_date(' ||chr(39) || var_version_date || chr(39) || '),
                    ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE,'
                    || chr(39) || list_databse.id || chr(39) || ',
                    pol.hd_id,
                    pol.ngaydau,
                    pol.ngayphanh,
                    pol.of_date,
                    ams_core_function.get_freq_by_months' || list_databse.link || '(pol.hd_id, to_date(' ||chr(39) || var_str_to_date || chr(39) || ')),
                    ams_core_function.get_freq_premium' || list_databse.link || '(pol.hd_id, to_date(' ||chr(39) || var_str_to_date || chr(39) || ')),
                    null,
                    pol.tt_hd,
                    ams_core_function.get_init_outlet_id' || list_databse.link || '(pol.hd_id, to_date(' ||chr(39) || var_str_to_date || chr(39) || ')),
                    ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                    ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                    sysdate,
                    sysdate,
                    hhct.con_hhkt' || list_databse.link || '(pol.hd_id, to_date(' ||chr(39) || var_str_to_date || chr(39) || '),'''')
                  from
                  (
                      select  /*+ CARDINALITY(tmp, 100)*/
                          tmp.dl_id,
                          tmp.hd_id,
                          tmp.ngaydau,
                          tmp.ngayphanh,
                          tmp.tt_hd,
                          null of_date
                      from nt_hopdong' || list_databse.link || ' tmp
                      where tmp.tt_hd like '||chr(39)||'0_________0%'||chr(39)||'
                          and tmp.dk_nop <> '||chr(39)||'00'||chr(39)||'
                          and tmp.ngayphanh <= to_date(' ||chr(39) || var_str_to_date || chr(39) || ')
                          and tmp.ngay_hluc between to_date(' ||chr(39) || var_str_from_date || chr(39) || ') and to_date(' ||chr(39) || var_str_to_date || chr(39) || ')
                          and tmp.sf_id not in ('||chr(39)||'1010767'||chr(39)||', '||chr(39)||'1010794'||chr(39)||')
                          and tmp.cty_id = '||chr(39)|| list_databse.id ||chr(39)||'
                      union
                      --Cac hop dong (san pham truyen thong) HET HIEU LUC TRONG THANG (dau thang, ngay cuoi thang)
                      select /*+ CARDINALITY(tmp, 100)*/
                          tmp.dl_id,
                          tmp.hd_id,
                          tmp.ngaydau,
                          tmp.ngayphanh,
                          tmp.tt_hd,
                          tmp.ngay_hluc of_date
                      from nt_hopdong' || list_databse.link || ' tmp
                      where tmp.tt_hd like '||chr(39)||'1%'||chr(39)||'
                          and tmp.dk_nop <> '||chr(39)||'00'||chr(39)||'
                          and tmp.ngayphanh <= to_date(' ||chr(39) || var_str_to_date || chr(39) || ')
                          and tmp.ngay_hluc between to_date(' ||chr(39) || var_str_from_date || chr(39) || ') and to_date(' ||chr(39) || var_str_to_date || chr(39) || ')
                          and tmp.sf_id not in ('||chr(39)||'1010767'||chr(39)||', '||chr(39)||'1010794'||chr(39)||')
                          and tmp.cty_id = '||chr(39)|| list_databse.id ||chr(39)||'
                  ) pol;
            end;
            ';
            execute immediate var_query;
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(list_databse.id, 'bvl_get_policy', 'do vao tu bang nt_hopdong cty  ' || list_databse.name || '  ' ||   to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 1.2;

            --lay danh sach cac hop dong co hieu luc trong thang day
            --tuc la duoc khoi phuc hieu luc trong thang day
            --lay CAC HOP DONG MA CO SU THAY DOI
            var_query := ' begin
                insert /*+ APPEND */ into ams.la_mana_bvl_policy_tmp nologging
                select  /*+ CARDINALITY(pol, 100) CARDINALITY(hd, 100) CARDINALITY(rid, 100)*/ '||
                    var_session_id || ', ' || '
                    to_date(' ||chr(39) || var_record_date || chr(39) || '),
                    daily_hd' || list_databse.link || '(to_date(' ||chr(39) || var_str_to_date || chr(39) || '), pol.hd_id),' ||
                    chr(39)||'D'||chr(39)|| ' || daily_hd' || list_databse.link || '(to_date(' ||chr(39) || var_str_to_date || chr(39) || '), pol.hd_id),
                    to_date(' ||chr(39) || var_version_date || chr(39) || '),
                    ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE,'
                    || chr(39) || list_databse.id || chr(39) || ',
                    pol.hd_id,
                    hd.ngaydau,
                    hd.ngayphanh,
                    pol.of_date,
                    ams_core_function.get_freq_by_months' || list_databse.link || '(pol.hd_id, to_date(' ||chr(39) || var_str_to_date || chr(39) || ')),
                    ams_core_function.get_freq_premium' || list_databse.link || '(pol.hd_id, to_date(' ||chr(39) || var_str_to_date || chr(39) || ')),
                    null,
                    pol.tthd,
                    ams_core_function.get_init_outlet_id' || list_databse.link || '(pol.hd_id, to_date(' ||chr(39) || var_str_to_date || chr(39) || ')),
                    ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                    ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                    sysdate,
                    sysdate,
                    hhct.con_hhkt' || list_databse.link || '(pol.hd_id, to_date(' ||chr(39) || var_str_to_date || chr(39) || '),'''')
                  from
                  (
                      select  /*+ CARDINALITY(tmp, 100)*/
                          tmp.dl_id,
                          tmp.hd_id,
                          tmp.tthd,
                          null of_date,
                          tmp.sf_id
                      from  nt_lshd' || list_databse.link || ' tmp
                      where tmp.tthd like '||chr(39)||'0_________0%'||chr(39)||'
                          and tmp.dk_nop <> '||chr(39)||'00'||chr(39)||'
                          and tmp.ngayqd >= to_date(' ||chr(39) || var_str_to_date || chr(39) || ')
                          and tmp.ngay_hluc between to_date(' ||chr(39) || var_str_from_date || chr(39) || ') and to_date(' ||chr(39) || var_str_to_date || chr(39) || ')
                          and tmp.sf_id not in ('||chr(39)||'1010767'||chr(39)||', '||chr(39)||'1010794'||chr(39)||')
                          and tmp.cty_id = '||chr(39)|| list_databse.id ||chr(39)||'
                      union
                      --Cac hop dong (san pham truyen thong) HET HIEU LUC TRONG THANG (dau thang, ngay cuoi thang -1)
                      --trong lich su hop dong
                      select /*+ CARDINALITY(tmp, 100)*/
                          tmp.dl_id,
                          tmp.hd_id,
                          tmp.tthd,
                          tmp.ngay_hluc of_date,
                          tmp.sf_id
                      from nt_lshd' || list_databse.link || ' tmp
                      where tmp.tthd like '||chr(39)||'1%'||chr(39)||'
                          and tmp.dk_nop <> '||chr(39)||'00'||chr(39)||'
                          and tmp.ngayqd >= to_date(' ||chr(39) || var_str_to_date || chr(39) || ')
                          and tmp.ngay_hluc between to_date(' ||chr(39) || var_str_from_date || chr(39) || ') and to_date(' ||chr(39) || var_str_to_date || chr(39) || ')
                          and tmp.sf_id not in ('||chr(39)||'1010767'||chr(39)||', '||chr(39)||'1010794'||chr(39)||')
                          and tmp.cty_id = '||chr(39)|| list_databse.id ||chr(39)||'
                  ) pol
                  left join
                  (
                      select /*+ CARDINALITY(tmp, 100)*/
                          tmp.hd_id,
                          tmp.ngaydau,
                          tmp.ngayphanh
                      from nt_hopdong' || list_databse.link || ' tmp
                      where tmp.ngayphanh <= to_date(' ||chr(39) || var_str_to_date || chr(39) || ')
                          and tmp.sf_id not in ('||chr(39)||'1010767'||chr(39)||', '||chr(39)||'1010794'||chr(39)||')
                          and tmp.cty_id = '||chr(39)|| list_databse.id ||chr(39)||'
                  ) hd
                      on hd.hd_id = pol.hd_id;
            end;
            ';
            execute immediate var_query;
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(list_databse.id, 'bvl_get_policy', 'do vao tu bang lshd  cty  ' || list_databse.name || '  ' ||   to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 1.3;

            insert /*+ APPEND */ into ams.la_mana_policy_ext_tmp nologging
            select /*+ CARDINALITY(tmp, 100)*/
                null,--outlet_id
                tmp.outlet_ams_id,
                ams.LIFE_AGENCY_MANA_POLICY.MODULE_CODE_MAIN,
                var_record_date,
                var_version_date,--                              date,
                ams.LIFE_AGENCY_MANA_POLICY.OBJECT_STATUS_ACTIVE, --status_code
                ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE,--source_of_data                          varchar2(16),
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
                tmp.effective_date,--tmp.pol_effective_date
                tmp.issue_date, --pol_issue_date           date,
                tmp.of_date,--pol_of_date           date,
                tmp.freq_by_months,--
                12 /
                    (
                        decode(nvl(to_number(tmp.freq_by_months), 0),
                            0, 120,
                            nvl(to_number(tmp.freq_by_months), 0)
                            )
                    ),--freq_per_annum
                null,--freq_name
                tmp.commission_status,--null,--
                null,--
                tmp.init_premium,
                tmp.freq_premium,
                null,--lsum
                null,--tmp.afyp
                tmp.status_code,
                null,
                null,
                null,--tmp.holder_name,--holder_name         nvarchar2(255),
                null,--insured_name        nvarchar2(255),
                null,--holder_address      nvarchar2(255),
                null,--init_outlet_id
                'D' || tmp.init_outlet_bvl_id, --init_outlet_ams_id
                var_session_id,
                ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                sysdate,
                sysdate
            from ams.la_mana_bvl_policy_tmp tmp
            where tmp.session_id = var_session_id
                and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE
                and tmp.company_bvl_id = list_databse.id;
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(list_databse.id, 'bvl_get_policy', 'do vao bang la_mana_policy_ext_tmp thang ' || list_databse.name || '  ' ||  to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 1.3;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(list_databse.id, 'bvl_get_policy', 'delete ams.la_mana_bvl_policy_tmp cty  ' || list_databse.name || '  ' ||   to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));


            var_run_end_time := sysdate;
            ams.life_agency_log.time_log(list_databse.id, 'Thoi gian chay BVL cty ' || list_databse.name || '  ' || to_char(valRecordDate, 'dd/mm/yyyy'), var_run_begin_time, var_run_end_time);
        end loop;

        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 4;

        --cap nhat cac thong tin khac vao day nua
        update ams.la_mana_policy_ext_tmp tmp
        set tmp.afyp = nvl(tmp.freq_by_months, 0.1) * nvl(tmp.init_premium, 0),
            tmp.freq_premium = tmp.init_premium
        where tmp.session_id = var_session_id
            and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'bvl_get_policy', 'cap nhat afyp thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 5;

        update ams.la_mana_policy_ext_tmp tmp
        set tmp.pol_status_code = ams.LIFE_AGENCY_MANA_POLICY.POL_CODE_WOP,
            tmp.pol_status_name = ams.LIFE_AGENCY_MANA_POLICY.POL_NAME_WOP
        where tmp.session_id = var_session_id
            and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE
            and tmp.pol_status is not null
            and substr(tmp.pol_status, 2, 1) = '1'; --neu ky tu thu 2 cua no = 1 thi chung to la no dang bi dung thu phi
        commit;

        -- Cap nhat tinh trang hoa hong
        update ams.la_mana_policy_ext_tmp tmp
        set tmp.commission_status_name = ams.LIFE_AGENCY_MANA_POLICY.COMM_CONT_NAME
        where tmp.commission_status = ams.LIFE_AGENCY_MANA_POLICY.COMM_CONT
            and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE;
        commit;

        update ams.la_mana_policy_ext_tmp tmp
        set tmp.commission_status_name = ams.LIFE_AGENCY_MANA_POLICY.COMM_CONT_NAME_NO
        where tmp.commission_status = ams.LIFE_AGENCY_MANA_POLICY.COMM_CONT_NO
            and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'bvl_get_policy', 'cap nhat WOP thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 6;

        --cap nhat dinh ky dong phi vao day
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_mana_policy_ext_tmp o
        using
            (
                select  /*+ CARDINALITY(code, 100)*/
                    code.code_code freq_code,
                    code.code_value freq_name
                from ams.cla_codes code
                where code.code_language = ams.LIFE_AGENCY_MANA_POLICY.THEME_LANGUAGE
                    and code.code_group = 'FREQ'
                    and trunc(sysdate, 'DD')
                        between nvl(code.from_date, ams.LIFE_AGENCY_MANA_POLICY.DATE_MIN_VALUE)
                        and nvl(code.to_date, ams.LIFE_AGENCY_MANA_POLICY.DATE_MAX_VALUE)
            ) upd
        on (
            var_session_id = o.session_id
            and
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE = o.source_of_data
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
        ams.life_agency_log.write_log(1000, 'bvl_get_policy', 'cap nhat dinh ky dong phi thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 7;

        --merge vao bang la_mana_policy_ext_tmp
        --lay ten nguoi tham gia dia chi vao lam tam o day
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_mana_policy_ext_tmp o
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.account_number,
                    max(tmp.holder_name) holder_name,
                    max(tmp.insured_name) insured_name,
                    max(tmp.address) holder_address
                from ams.la_inv_bvl_customer tmp
                where tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE
                group by tmp.account_number
            ) upd
        on ( --trong thang day voi cac barcode day
            var_session_id = o.session_id
            and
            var_record_date = o.record_date
            and
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE = o.source_of_data
            and
            upd.account_number = o.account_number
        )
        when matched then
            update
                set
                    o.holder_name = upd.holder_name,
                    o.insured_name = upd.insured_name,
                    o.holder_address = upd.holder_address,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'bvl_get_policy', 'do ten khach hang BVL thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 6;

        --merge vao bang la_mana_policy_ext_tmp
        --lay tu ODS them vi BVL co the thieu du lieu lay ten nguoi tham gia dia chi vao olam tam o day
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_mana_policy_ext_tmp o
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.account_number,
                    max(tmp.holder_name) holder_name,
                    max(tmp.insured_name) insured_name,
                    max(tmp.holder_address) holder_address
                from ams.la_inv_tal_customer tmp
                where tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE
                group by tmp.account_number
            ) upd
        on ( --trong thang day voi cac barcode day
            var_session_id = o.session_id
            and
            var_record_date = o.record_date
            and
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE = o.source_of_data
            and
            upd.account_number = o.account_number
        )
        when matched then
            update
                set
                    o.holder_name = upd.holder_name,
                    o.insured_name = upd.insured_name,
                    o.holder_address = upd.holder_address,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'bvl_get_policy', 'do ten khach hang TAL thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 7;

        /*cap nhat cac thong tin ve dai ly */
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_mana_policy_ext_tmp o
        using
            (
                select  /*+ CARDINALITY(o, 100)*/
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
                from ams.la_inv_outlet o
                where o.record_date = var_record_date
                group by o.outlet_ams_id
            ) upd
        on (
            var_session_id = o.session_id
            and
            var_record_date = o.record_date
            and
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE = o.source_of_data
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
        ams.life_agency_log.write_log(1000, 'bvl_get_policy', 'cap nhat cac thong tin dai ly thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 8;

         merge  /*+ CARDINALITY(o, 100)
                    CARDINALITY(upd, 100)
                    LEADING(o upd) */
              into ams.la_mana_policy_ext_tmp o
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
              ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE = o.source_of_data
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
        ams.life_agency_log.write_log(1000, 'bvl_get_policy', 'lay ma cong ty BVL thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 9.1;

        dbms_stats.gather_table_stats(null, 'la_mana_policy_ext_tmp', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'bvl_get_policy', 'gather ams.la_mana_policy_ext_tmp thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 10;

        --sau do do tat cac cac  du lieu tu bang la_mana_policy_ext_tmp vao trong bang la_mana_policy
        insert /*+ APPEND */ into ams.la_mana_policy nologging
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
            pol_effective_date,
            pol_issue_date,
            pol_of_date,
            freq_by_months,
            freq_per_annum,
            freq_per_annum_name,
            commission_status,
            commission_status_name,
            init_premium,
            freq_premium,
            lsum_premium,
            afyp,
            pol_status,
            pol_status_code,
            pol_status_name,
            holder_name,
            insured_name,
            holder_address,
            init_outlet_id,
            init_outlet_ams_id,
            create_user,
            update_user,
            create_datetime,
            update_datetime
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
            tmp.pol_effective_date,
            tmp.pol_issue_date,
            tmp.pol_of_date,
            null,
            null,
            tmp.freq_per_annum_name,
            tmp.commission_status,--null,
            tmp.commission_status_name,--null,
            tmp.init_premium,
            tmp.freq_premium,
            tmp.lsum_premium,
            tmp.afyp,
            null,--pol_status
            tmp.pol_status_code,
            tmp.pol_status_name,
            tmp.holder_name,
            tmp.insured_name,
            tmp.holder_address,
            tmp.init_outlet_id,
            tmp.init_outlet_ams_id,
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.la_mana_policy_ext_tmp tmp
        where tmp.session_id = var_session_id
            and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'bvl_get_policy', 'do vao bang la_mana_policy tu bang ext thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        var_error_pos := 10;
        dbms_stats.gather_table_stats(null, 'la_mana_policy', cascade => true);

        --xu ly cho phan cac hop dong chay them khi ma co su thay doi dai ly chuyen thu
        --lay vao danh sach cac hop dong co suthay doi dai ly chuyen thu tu thoi diem hien tai back lai 6 thang


        --xoa du lieu cua bang nay di
        execute immediate 'truncate table ams.la_mana_policy_change_tmp';
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'bvl_get_policy', 'truncate la_mana_policy_ext_tmp thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 3;

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
            execute immediate 'truncate table ams.la_mana_bvl_policy_tmp';
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(list_databse.id, 'bvl_get_policy', 'delete  la_mana_bvl_policy_tmp cty  ' || list_databse.name || '  ' ||   to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 1.1;

            -------CAN PHAI SUA TIEP O DAY CHO NO
            --sau do khi ma do vao bang kia thi chi can select distint cho no de du lieu duoc dung hon la duoc roi
            --du lieu do thi no se bi trung lap cac du lieu cho no nen can phai xu ly tiep sau
            var_query := ' begin
                insert /*+ APPEND */ into ams.la_mana_bvl_policy_tmp nologging
                select  /*+ CARDINALITY(qdsd, 100) CARDINALITY(pol, 100)*/ '||
                    var_session_id || ', ' || '
                    to_date(' ||chr(39) || var_record_date || chr(39) || '),
                    daily_hd' || list_databse.link || '(to_date(' ||chr(39) || var_str_to_date || chr(39) || '), pol.hd_id),' ||
                    chr(39)||'D'||chr(39)|| ' || daily_hd' || list_databse.link || '(to_date(' ||chr(39) || var_str_to_date || chr(39) || '), pol.hd_id),
                    to_date(' ||chr(39) || var_version_date || chr(39) || '),
                    ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE,'
                    || chr(39) || list_databse.id || chr(39) || ',
                    pol.hd_id,
                    pol.ngaydau,
                    pol.ngayphanh,
                    pol.of_date,
                    ams_core_function.get_freq_by_months' || list_databse.link || '(pol.hd_id, to_date(' ||chr(39) || var_str_to_date || chr(39) || ')),
                    ams_core_function.get_freq_premium' || list_databse.link || '(pol.hd_id, to_date(' ||chr(39) || var_str_to_date || chr(39) || ')),
                    null,
                    pol.tt_hd,
                    ams_core_function.get_init_outlet_id' || list_databse.link || '(pol.hd_id, to_date(' ||chr(39) || var_str_to_date || chr(39) || ')),
                    ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                    ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                    sysdate,
                    sysdate,
                    hhct.con_hhkt' || list_databse.link || '(pol.hd_id, to_date(' ||chr(39) || var_str_to_date || chr(39) || '),'''')
                  from
                  (
                      select  /*+ CARDINALITY(tmp, 100)*/
                          tmp.hd_id
                      from nt_qdsd' || list_databse.link || ' tmp
                      where tmp.loaitd = '||chr(39)||'09'||chr(39)||'
                          and tmp.ngayqd between to_date(' ||chr(39) || var_str_change_from_date || chr(39) || ') and to_date(' ||chr(39) || var_str_change_to_date || chr(39) || ')
                  ) qdsd
                  join
                  (
                      select  /*+ CARDINALITY(tmp, 100)*/
                          tmp.dl_id,
                          tmp.hd_id,
                          tmp.ngaydau,
                          tmp.ngayphanh,
                          tmp.tt_hd,
                          null of_date
                      from nt_hopdong' || list_databse.link || ' tmp
                      where tmp.dk_nop <> '||chr(39)||'00'||chr(39)||'
                          and tmp.sf_id not in ('||chr(39)||'1010767'||chr(39)||', '||chr(39)||'1010794'||chr(39)||')
                          and tmp.cty_id = '||chr(39)|| list_databse.id ||chr(39)||'
                  ) pol
                      on qdsd.hd_id = pol.hd_id;
            end;
            ';
            execute immediate var_query;
            commit;


            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(list_databse.id, 'bvl_get_policy', 'do vao tu bang la_mana_policy_change_tmp  cty  ' || list_databse.name || '  ' ||   to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 1.3;

            --do du lieu vao bang moi tao
            insert /*+ APPEND */ into ams.la_mana_policy_change_tmp nologging
            select /*+ CARDINALITY(tmp, 100)*/
                null,--outlet_id
                tmp.outlet_ams_id,
                ams.LIFE_AGENCY_MANA_POLICY.MODULE_CODE_MAIN,
                var_record_date,
                var_version_date,--                              date,
                ams.LIFE_AGENCY_MANA_POLICY.OBJECT_STATUS_ACTIVE, --status_code
                ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE,--source_of_data                          varchar2(16),
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
                tmp.effective_date,--tmp.pol_effective_date
                tmp.issue_date, --pol_issue_date           date,
                tmp.of_date,--pol_of_date           date,
                tmp.freq_by_months,--
                12 /
                    (
                        decode(nvl(to_number(tmp.freq_by_months), 0),
                            0, 120,
                            nvl(to_number(tmp.freq_by_months), 0)
                            )
                    ),--freq_per_annum
                null,--freq_name
                tmp.commission_status,--null,--
                null,--
                tmp.init_premium,
                tmp.freq_premium,
                null,--lsum
                null,--tmp.afyp
                tmp.status_code,
                null,
                null,
                null,--tmp.holder_name,--holder_name         nvarchar2(255),
                null,--insured_name        nvarchar2(255),
                null,--holder_address      nvarchar2(255),
                null,--init_outlet_id
                'D' || tmp.init_outlet_bvl_id, --init_outlet_ams_id
                var_session_id,
                ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                sysdate,
                sysdate
            from ams.la_mana_bvl_policy_tmp tmp
            where tmp.session_id = var_session_id
                and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE
                and tmp.company_bvl_id = list_databse.id;
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(list_databse.id, 'bvl_get_policy', 'do vao bang la_mana_policy_change_tmp thang ' || list_databse.name || '  ' ||  to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_run_end_time := sysdate;
            ams.life_agency_log.time_log(list_databse.id, 'Thoi gian chay BVL cty ' || list_databse.name || '  ' || to_char(valRecordDate, 'dd/mm/yyyy'), var_run_begin_time, var_run_end_time);
        end loop;

        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 4;

        --cap nhat cac thong tin khac vao day nua
        update ams.la_mana_policy_change_tmp tmp
        set tmp.afyp = nvl(tmp.freq_by_months, 0.1) * nvl(tmp.init_premium, 0),
            tmp.freq_premium = tmp.init_premium
        where tmp.session_id = var_session_id
            and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'bvl_get_policy', 'cap nhat afyp thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 5;

        update ams.la_mana_policy_change_tmp tmp
        set tmp.pol_status_code = ams.LIFE_AGENCY_MANA_POLICY.POL_CODE_WOP,
            tmp.pol_status_name = ams.LIFE_AGENCY_MANA_POLICY.POL_NAME_WOP
        where tmp.session_id = var_session_id
            and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE
            and tmp.pol_status is not null
            and substr(tmp.pol_status, 2, 1) = '1'; --neu ky tu thu 2 cua no = 1 thi chung to la no dang bi dung thu phi
        commit;

        -- Cap nhat tinh trang hoa hong
        update ams.la_mana_policy_change_tmp tmp
        set tmp.commission_status_name = ams.LIFE_AGENCY_MANA_POLICY.COMM_CONT_NAME
        where tmp.commission_status = ams.LIFE_AGENCY_MANA_POLICY.COMM_CONT
            and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE;
        commit;

        update ams.la_mana_policy_change_tmp tmp
        set tmp.commission_status_name = ams.LIFE_AGENCY_MANA_POLICY.COMM_CONT_NAME_NO
        where tmp.commission_status = ams.LIFE_AGENCY_MANA_POLICY.COMM_CONT_NO
            and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'bvl_get_policy', 'cap nhat WOP thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 6;

        --cap nhat dinh ky dong phi vao day
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_mana_policy_change_tmp o
        using
            (
                select  /*+ CARDINALITY(code, 100)*/
                    code.code_code freq_code,
                    code.code_value freq_name
                from ams.cla_codes code
                where code.code_language = ams.LIFE_AGENCY_MANA_POLICY.THEME_LANGUAGE
                    and code.code_group = 'FREQ'
                    and trunc(sysdate, 'DD')
                        between nvl(code.from_date, ams.LIFE_AGENCY_MANA_POLICY.DATE_MIN_VALUE)
                        and nvl(code.to_date, ams.LIFE_AGENCY_MANA_POLICY.DATE_MAX_VALUE)
            ) upd
        on (
            var_session_id = o.session_id
            and
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE = o.source_of_data
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
        ams.life_agency_log.write_log(1000, 'bvl_get_policy', 'cap nhat dinh ky dong phi thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 7;

        --merge vao bang la_mana_policy_ext_tmp
        --lay ten nguoi tham gia dia chi vao lam tam o day
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_mana_policy_change_tmp o
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.account_number,
                    max(tmp.holder_name) holder_name,
                    max(tmp.insured_name) insured_name,
                    max(tmp.address) holder_address
                from ams.la_inv_bvl_customer tmp
                where tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE
                group by tmp.account_number
            ) upd
        on ( --trong thang day voi cac barcode day
            var_session_id = o.session_id
            and
            var_record_date = o.record_date
            and
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE = o.source_of_data
            and
            upd.account_number = o.account_number
        )
        when matched then
            update
                set
                    o.holder_name = upd.holder_name,
                    o.insured_name = upd.insured_name,
                    o.holder_address = upd.holder_address,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'bvl_get_policy', 'do ten khach hang BVL thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 6;

        --merge vao bang la_mana_policy_ext_tmp
        --lay tu ODS them vi BVL co the thieu du lieu lay ten nguoi tham gia dia chi vao olam tam o day
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_mana_policy_change_tmp o
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.account_number,
                    max(tmp.holder_name) holder_name,
                    max(tmp.insured_name) insured_name,
                    max(tmp.holder_address) holder_address
                from ams.la_inv_tal_customer tmp
                where tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE
                group by tmp.account_number
            ) upd
        on ( --trong thang day voi cac barcode day
            var_session_id = o.session_id
            and
            var_record_date = o.record_date
            and
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE = o.source_of_data
            and
            upd.account_number = o.account_number
        )
        when matched then
            update
                set
                    o.holder_name = upd.holder_name,
                    o.insured_name = upd.insured_name,
                    o.holder_address = upd.holder_address,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'bvl_get_policy', 'do ten khach hang TAL thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 7;

        /*cap nhat cac thong tin ve dai ly */
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_mana_policy_change_tmp o
        using
            (
                select  /*+ CARDINALITY(o, 100)*/
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
                from ams.la_inv_outlet o
                where o.record_date = var_record_date
                group by o.outlet_ams_id
            ) upd
        on (
            var_session_id = o.session_id
            and
            var_record_date = o.record_date
            and
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE = o.source_of_data
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
        ams.life_agency_log.write_log(1000, 'bvl_get_policy', 'cap nhat cac thong tin dai ly thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 8;

         merge  /*+ CARDINALITY(o, 100)
                    CARDINALITY(upd, 100)
                    LEADING(o upd) */
              into ams.la_mana_policy_change_tmp o
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
              ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE = o.source_of_data
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
        ams.life_agency_log.write_log(1000, 'bvl_get_policy', 'lay ma cong ty BVL thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 9.1;

        --dbms_stats.gather_table_stats(null, 'la_mana_policy_change_tmp', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'bvl_get_policy', 'gather ams.la_mana_policy_ext_tmp thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 10;

        --sau do thi merge cac thong tin vao bang la_mana_policy_history cho no
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_mana_policy_history o
        using
            (
                select  /*+ CARDINALITY(tmp, 100)*/
                    max(tmp.outlet_id) outlet_id,
                    max(tmp.outlet_ams_id) outlet_ams_id,
                    max(tmp.status_code) status_code,
                    max(tmp.source_of_data) source_of_data,
                    max(tmp.outlet_name) outlet_name,
                    max(tmp.company_id) company_id,
                    max(tmp.company_bvl_id) company_bvl_id,
                    max(tmp.company_ams_id) company_ams_id,
                    max(tmp.company_name) company_name,
                    max(tmp.office_id) office_id,
                    max(tmp.office_ams_id) office_ams_id,
                    max(tmp.office_name) office_name,
                    max(tmp.agency_id) agency_id,
                    max(tmp.agency_ams_id) agency_ams_id,
                    max(tmp.agency_name) agency_name,
                    max(tmp.unit_id) unit_id,
                    max(tmp.unit_ams_id) unit_ams_id,
                    max(tmp.unit_name) unit_name,
                    max(tmp.position_code) position_code,
                    max(tmp.position_date) position_date,
                    max(tmp.position_name) position_name,
                    max(tmp.effective_date) effective_date,
                    max(tmp.terminative_date) terminative_date,
                    tmp.account_number,
                    max(tmp.pol_effective_date) pol_effective_date,
                    max(tmp.pol_issue_date) pol_issue_date,
                    max(tmp.pol_of_date) pol_of_date,
                    max(tmp.freq_by_months) freq_by_months,
                    max(tmp.freq_per_annum) freq_per_annum,
                    max(tmp.freq_per_annum_name) freq_per_annum_name,
                    max(tmp.commission_status) commission_status,
                    max(tmp.commission_status_name) commission_status_name,
                    max(tmp.init_premium) init_premium,
                    max(tmp.freq_premium) freq_premium,
                    max(tmp.lsum_premium) lsum_premium,
                    max(tmp.afyp) afyp,
                    max(tmp.pol_status) pol_status,
                    max(tmp.pol_status_code) pol_status_code,
                    max(tmp.pol_status_name) pol_status_name,
                    max(tmp.holder_name) holder_name,
                    max(tmp.insured_name) insured_name,
                    max(tmp.holder_address) holder_address,
                    max(tmp.init_outlet_id) init_outlet_id,
                    max(tmp.init_outlet_ams_id) init_outlet_ams_id
                from ams.la_mana_policy_change_tmp tmp
                --lay tu bang lich su voi session id = 1 la mot nhu da co roi
                where tmp.session_id = var_session_module_id
                    and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE
                group by tmp.account_number
            ) upd
        on (
            var_session_id = o.session_id
            and
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE = o.source_of_data
            and
            upd.account_number = o.account_number
        )
        when matched then
            update
                set
                    o.outlet_id = upd.outlet_id,
                    o.outlet_ams_id = upd.outlet_ams_id,
                    o.status_code = upd.status_code,
                    o.outlet_name = upd.outlet_name,
                    o.company_id = upd.company_id,
                    o.company_bvl_id = upd.company_bvl_id,
                    o.company_ams_id = upd.company_ams_id,
                    o.company_name = upd.company_name,
                    o.office_id = upd.office_id,
                    o.office_ams_id = upd.office_ams_id,
                    o.office_name = upd.office_name,
                    o.agency_id = upd.agency_id,
                    o.agency_ams_id = upd.agency_ams_id,
                    o.agency_name = upd.agency_name,
                    o.unit_id = upd.unit_id,
                    o.unit_ams_id = upd.unit_ams_id,
                    o.unit_name = upd.unit_name,
                    o.position_code = upd.position_code,
                    o.position_date = upd.position_date,
                    o.position_name = upd.position_name,
                    o.effective_date = upd.effective_date,
                    o.terminative_date = upd.terminative_date,
                    o.pol_effective_date = upd.pol_effective_date,
                    o.pol_issue_date = upd.pol_issue_date,
                    o.pol_of_date = upd.pol_of_date,
                    o.freq_by_months = upd.freq_by_months,
                    o.freq_per_annum = upd.freq_per_annum,
                    o.freq_per_annum_name = upd.freq_per_annum_name,
                    o.commission_status = upd.commission_status,
                    o.commission_status_name = upd.commission_status_name,
                    o.init_premium = upd.init_premium,
                    o.freq_premium = upd.freq_premium,
                    o.lsum_premium = upd.lsum_premium,
                    o.afyp = upd.afyp,
                    o.pol_status = upd.pol_status,
                    o.pol_status_code = upd.pol_status_code,
                    o.pol_status_name = upd.pol_status_name,
                    o.holder_name = upd.holder_name,
                    o.insured_name = upd.insured_name,
                    o.holder_address = upd.holder_address,
                    o.init_outlet_id = upd.init_outlet_id,
                    o.init_outlet_ams_id = upd.init_outlet_ams_id,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'bvl_get_policy', 'merge cac thong tin vao bang la_mana_policy_history  thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 10;

        var_run_end_time := sysdate;
        ams.life_agency_log.time_log(1001, 'Thoi gian chay bvl', var_run_begin_time, var_run_end_time);
        exception
            when others then
                rollback;
                life_agency_log.write_log(1000,
                    'bvl_get_policy: loi  ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                    sqlerrm,
                    sqlcode);
    end;
    /*
        Creater: Le Khac Chinh
        Date Create: 1/12/2012
        Version: 1.0
        Description: Dong bo du lieu tren BVL
        Parameter:
            valRecordDate [date]: Thang ghi nhan
            valTypeOfData [varchar2]: Loai du lieu
            valCompanyID [number]: Ma cong ty
            valSessionId [number]: Session Id
        Update:  Le Khac Chinh
            Version: 1.2
            Date Updated: 2/7/2014
            Note:  Fix lai chuong trinh theo yeu cau cua BA va UAT theo ID 141662
    */
    --sau khi do xong duoc so lieu vao bang la_mana_policy cua tung thang roi thi se xu ly lay so lieu
    --de do vao bang report o day cho no
    procedure bvl_get_policy_synch(valRecordDate date := null,
        valTypeOfData varchar2 := null,
        valCompanyID number := null,
        valSessionId number := null)
    is
        var_record_date date := trunc(valRecordDate, 'MM');
        var_selected_data_date date := trunc(valRecordDate, 'DD');
        var_str_record_date varchar2(64) := to_char(trunc(valRecordDate, 'MM'), 'DD-MON-YYYY');

        --chay theo tung thang thi se xu ly cho no nhu sau
        var_month_from_date date := add_months(trunc(valRecordDate, 'MM'), -100);
        --chay cho den cuoi thang truoc day thi so lieu moi chinh xac duoc
        var_month_to_date date := add_months(trunc(valRecordDate, 'MM'), -1);

        --lay du lieu trong vong 1 thang thi se du duoc so lieu roi
        var_from_date date := var_record_date;
        --cuoi thang la cuoi thang nay luon cho no de tinh
        var_to_date date := add_months(trunc(valRecordDate, 'MM'), 1) - 1;

        --lay du lieu cua 1 thang da co roi
        var_str_from_date varchar2(64) := to_char(var_from_date, 'DD-MON-YYYY');
        var_str_to_date varchar2(64) := to_char(var_to_date, 'DD-MON-YYYY');

        var_error_pos  number(8, 2) := null;
        var_session_id number(14) := 0;
        var_version_date date := trunc(sysdate, 'DD');
        var_query varchar(32000) := '';
        var_run_begin_time date := sysdate;
        var_run_end_time date := sysdate;

        var_date date := trunc(valRecordDate, 'MM');
    begin
        var_run_begin_time := sysdate;
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 1;

        var_session_id := valSessionId;

        --xoa du lieu cua bang nay di
        execute immediate 'truncate table ams.la_mana_policy_repo_tmp';
        execute immediate 'truncate table ams.la_mana_policy_if_account_tmp';
        execute immediate 'truncate table ams.la_mana_policy_of_account_tmp';
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'bvl_get_policy_synch', 'truncate cac bang tam thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 2;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'bvl_get_policy_synch', 'co chay cai nay: ngay select khi chay: ' ||  to_char(var_selected_data_date, 'dd/mm/yyyy') || ' - co nam trong (  tu ngay: ' || to_char(var_delete_from_date, 'dd/mm/yyyy') || ' - ' || to_char(var_current_date, 'dd/mm/yyyy')  || ' : den ngay ) ?' );
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        --if var_selected_data_date between var_delete_from_date and var_current_date then
        if var_selected_data_date between var_selected_data_date  and var_selected_data_date  then
            --xoa truoc khi do so lieu vao cho no chac chan da
            --neu khong la se chay thua do chay 2 lan

              ams.life_agency_log.time_end;
              ams.life_agency_log.write_log(1000, 'bvl_get_policy_synch', 'ghi vao voi ngay la:' || to_char(var_selected_data_date, 'dd/mm/yyyy'));
              ams.life_agency_log.time_stop;
              ams.life_agency_log.time_begin;

              loop
                  delete ams.la_mana_policy_repo o
                  where o.record_date = var_selected_data_date
                      and o.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE
                      and rownum < ams.LIFE_AGENCY_MANA_POLICY.MAX_DELETE_NUMBER;
                  exit when SQL%rowcount < ams.LIFE_AGENCY_MANA_POLICY.MAX_DELETE_NUMBER - 1;
                  commit;
              end loop;
              commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'bvl_get_policy_synch', 'delete ams.la_mana_policy_repo thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;

            --1.dau tien se do vao danh sach cac hop dong con hieu luc o trong bang lich su la_mana_policy_history da luu lai cho no du lieu o day
            --trong bang do chi chua cac hop dong con hieu luc

            insert /*+ APPEND */ into ams.la_mana_policy_if_account_tmp nologging
            select /*+ CARDINALITY(tmp, 100)*/
                var_selected_data_date, --bao cao la_mana_policy_repo nay phai dua du lieu theo ngay nay
                tmp.record_date,
                tmp.source_of_data,
                tmp.account_number,
                var_session_id,
                ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                sysdate,
                sysdate
            from ams.la_mana_policy_history tmp
            --lay tu bang lich su voi session id = 1 la mot nhu da co roi
            where tmp.session_id = var_session_module_id
                and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE;
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'bvl_get_policy_synch', 'do vao bang la_mana_policy_history  thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 1.1;

            --sau do ke tu thang ma do so lieu vao cho no o bang lich su + 1 cho den
            --thang ma chay nay -1
            --do vao danh sach cac hop dong con hieu luc
            --minus di danh sach cac hop dong HET hieu luc


            --Buoc 1:
            --sau do ke tu thang ma do so lieu vao cho no o bang lich su + 1 cho den
            --thang ma chay nay -1
            --do vao danh sach cac hop dong con hieu luc
            --minus di danh sach cac hop dong HET hieu luc

            --chay lan luot tung thang ke tu thang sau khi luu o history cho den truoc thanh tinh

            begin
                --lay cai nay de co the lay ra thang ma no co so lieu o serv_data_va FYP va policy
                --de lay so lieu ra cho dung
                select  /*+ CARDINALITY(tmp, 100)*/
                    tmp.record_date
                        into var_month_from_date
                from ams.la_mana_policy_history tmp
                --lay tu bang lich su voi session id = 1 la mot nhu da co roi
                where tmp.session_id = var_session_module_id
                    and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE
                    and rownum <= 1;
            exception
                 when others then
                       --neu khong tim thay thi se lay so lieu nhu the nay cung duoc
                      select  /*+ CARDINALITY(tmp, 100)*/
                          min(tmp.record_date)
                              into var_month_from_date
                      from ams.la_mana_policy tmp
                      where tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE;
            end;

            --lay cai to_date cho no
            begin
                --lay cai nay de co the lay ra thang ma no co so lieu o serv_data_va FYP va policy
                --de lay so lieu ra cho dung
                var_month_to_date := add_months(trunc(valRecordDate, 'MM'), -1);
            exception
                 when others then
                       --neu khong tim thay thi se lay so lieu nhu the nay cung duoc
                      select  /*+ CARDINALITY(tmp, 100)*/
                          max(tmp.record_date)
                              into var_month_to_date
                      from ams.la_mana_policy tmp
                      where tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE;
                      var_month_to_date := add_months(var_month_to_date, -1);
            end;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'bvl_get_policy_synch', 'so lieu do bang acc se tu thang: ' || to_char(var_month_from_date, 'dd/mm/yyyy') ||  ' cho den thang ' || to_char(var_month_to_date, 'dd/mm/yyyy') || ' de xu ly con hieu luc tru di het hieu luc trong giai doan cach thang do'  );
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;

            if var_month_to_date >= var_month_from_date then
                for i in 0..months_between(var_month_to_date, var_month_from_date)
                loop
                    --lay thang do ra
                    var_date := add_months(var_month_from_date, i);
                    --do so lieu cua tung thang vao mot bang tam da co de roi sau do se minus di la ra cac hop dong con hieu luc
                    --do vao bang cac hop dong con hieu luc
                    ams.life_agency_log.time_stop;
                    ams.life_agency_log.time_begin;
                    var_error_pos := 1.2;

                    insert /*+ APPEND */ into ams.la_mana_policy_if_account_tmp nologging
                    select /*+ CARDINALITY(tmp, 100)*/
                        var_selected_data_date, --bao cao la_mana_policy_repo nay phai dua du lieu theo ngay nay
                        tmp.record_date,
                        tmp.source_of_data,
                        tmp.account_number,
                        var_session_id,
                        ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                        ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                        sysdate,
                        sysdate
                    from ams.la_mana_policy tmp
                    --lay cac hop dong con hieu luc o tai thang do cho thang day cho no
                    where tmp.record_date = var_date
                        and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE
                        and tmp.pol_of_date is null;
                    commit;

                    ams.life_agency_log.time_end;
                    ams.life_agency_log.write_log(1000, 'bvl_get_policy_synch', 'do vao bang la_mana_policy_if_account_tmp cua cac thang,  thang ' || to_char(var_date, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
                    ams.life_agency_log.time_stop;
                    ams.life_agency_log.time_begin;
                    var_error_pos := 1.3;


                    --do vao bang danh sach cac hop dong het hieu luc trong cac thang do
                    insert /*+ APPEND */ into ams.la_mana_policy_of_account_tmp nologging
                    select /*+ CARDINALITY(tmp, 100)*/
                        var_selected_data_date, --bao cao la_mana_policy_repo nay phai dua du lieu theo ngay nay
                        tmp.record_date,
                        tmp.source_of_data,
                        tmp.account_number,
                        var_session_id,
                        ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                        ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                        sysdate,
                        sysdate
                    from ams.la_mana_policy tmp
                    --lay cac hop dong con hieu luc o tai thang do cho thang day cho no
                    where tmp.record_date = var_date
                        and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE
                        and tmp.pol_of_date is not null;
                    commit;

                    ams.life_agency_log.time_end;
                    ams.life_agency_log.write_log(1000, 'bvl_get_policy_synch', 'do vao bang la_mana_policy_of_account_tmp cua cac thang,  thang ' || to_char(var_date, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
                end loop;
            end if;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'bvl_get_policy_synch', 'do vao bang la_mana_policy_if_account_tmp la_mana_policy_of_account_tmp cua cac thang,  thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 3;

            --sau do do vao bang tam so lieu cac du lieu
            --roi den thang thang tinh nay thi se
            --do vao cac hop dong con hieu luc
            --va cac hop dong het hieu luc SAU ngay tinh o selected date
            --thi ra duoc cac hop dong con hieu luc

            insert /*+ APPEND */ into ams.la_mana_policy_if_account_tmp nologging
            select /*+ CARDINALITY(tmp, 100)*/
                var_selected_data_date, --bao cao la_mana_policy_repo nay phai dua du lieu theo ngay nay
                tmp.record_date,
                tmp.source_of_data,
                tmp.account_number,
                var_session_id,
                ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                sysdate,
                sysdate
            from ams.la_mana_policy tmp
            --lay cac hop dong con hieu luc o thang hien tai
            where tmp.record_date = var_record_date
                and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE
                and tmp.pol_of_date is null;
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'bvl_get_policy_synch', 'do vao bang la_mana_policy_if_account_tmp cua  thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 4;

            --do vao bang danh sach cac hop dong het hieu luc trong cac thang do
            insert /*+ APPEND */ into ams.la_mana_policy_of_account_tmp nologging
            select /*+ CARDINALITY(tmp, 100)*/
                var_selected_data_date, --bao cao la_mana_policy_repo nay phai dua du lieu theo ngay nay
                tmp.record_date,
                tmp.source_of_data,
                tmp.account_number,
                var_session_id,
                ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                sysdate,
                sysdate
            from ams.la_mana_policy tmp
            --lay cac hop dong het hieu luc voi ngay het hieu luc sau ngay selected do
            where tmp.record_date = var_record_date
                and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE
                --lay cac danh sach hop dong huy sau ngay day thi hop dong do no van con hieu luc
                and nvl(tmp.pol_of_date, ams.LIFE_AGENCY_MANA_POLICY.DATE_MIN_VALUE) > var_selected_data_date;
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'bvl_get_policy_synch', 'do vao bang la_mana_policy_if_account_tmp cua  thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 5;

            dbms_stats.gather_table_stats(null, 'la_mana_policy_if_account_tmp', cascade => true);
            dbms_stats.gather_table_stats(null, 'la_mana_policy_of_account_tmp', cascade => true);
            dbms_stats.gather_table_stats(null, 'la_mana_policy_history', cascade => true);
            dbms_stats.gather_table_stats(null, 'la_mana_policy', cascade => true);

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'bvl_get_policy_synch', 'gather het cac bang thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 2;

            --do vao bang temp la_mana_policy_repo_tmp danh sach
            --cac hop dong con hieu luc  sau khi minus di cac hop dong het hieu luc
            --sau do se merge cac  thong tin nguoc lai theo thu tu thi se ra duoc du cac thong tin cho no
            insert /*+ APPEND */ into ams.la_mana_policy_repo_tmp nologging
            select /*+ CARDINALITY(repo, 100)*/
                null,--outlet_id           number(10),
                null,--outlet_ams_id       varchar2(16),
                ams.LIFE_AGENCY_MANA_POLICY.MODULE_CODE_MAIN,
                var_selected_data_date,
                var_version_date,
                null,--status_code         varchar2(16),
                ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE,--null,--source_of_data      varchar2(16),
                null,--outlet_name         nvarchar2(255),
                null,--company_id          number(10),
                null,--company_bvl_id      varchar2(16),
                null,--company_ams_id      varchar2(16),
                null,--company_name        nvarchar2(255),
                null,--office_id           number(10),
                null,--office_ams_id       varchar2(16),
                null,--office_name         nvarchar2(255),
                null,--agency_id           number(10),
                null,--agency_ams_id       varchar2(16),
                null,--agency_name         nvarchar2(255),
                null,--unit_id             number(10),
                null,--unit_ams_id         varchar2(16),
                null,--unit_name           nvarchar2(255),
                null,--position_code       varchar2(16),
                null,--position_date       date,
                null,--position_name       nvarchar2(32),
                null,--effective_date      date,
                null,--terminative_date    date,
                repo.account_number,--account_number      varchar2(64),
                null,--pol_effective_date  date,
                null,--pol_issue_date      date,
                null,--pol_of_date         date,
                null,--freq_by_months      number(5,2),
                null,--freq_per_annum      number(5,2),
                null,--freq_per_annum_name nvarchar2(32),
                null,--commission_status      number(1),
                null,--commission_status_name      varchar2(16),
                null,--init_premium        number(18,2),
                null,--freq_premium        number(18,2),
                null,--lsum_premium        number(18,2),
                null,--afyp                number(18,2),
                null,--pol_status          varchar2(32),
                null,--pol_status_code     varchar2(32),
                null,--pol_status_name     nvarchar2(64),
                null,--holder_name         nvarchar2(255),
                null,--insured_name        nvarchar2(255),
                null,--holder_address      nvarchar2(512),
                null,
                null,
                var_session_id,--          number(14),
                ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                sysdate,
                sysdate
            from
            (
                select  /*+ CARDINALITY(tmp, 100)*/
                    tmp.account_number
                from la_mana_policy_if_account_tmp tmp
                where tmp.session_id = var_session_id
                    and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE
                    and tmp.account_number is not null
                minus --tru di cac hop dong bi huy sau 14 ngay
                select  /*+ CARDINALITY(tmp, 100)*/
                    tmp.account_number
                from la_mana_policy_of_account_tmp tmp
                where tmp.session_id = var_session_id
                    and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE
            ) repo
            group by repo.account_number;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'bvl_get_policy_synch', 'do vao  bang la_mana_policy_repo_tmp thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 6;

            dbms_stats.gather_table_stats(null, 'la_mana_policy_history', cascade => true);
            dbms_stats.gather_table_stats(null, 'la_mana_policy_repo_tmp', cascade => true);

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'bvl_get_policy_synch', 'gather la_mana_policy_history la_mana_policy_repo_tmp thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 6.1;

            --sau do thi merge cac thong tin da tinh vao cho no cung theo thu tu tren thi se dung duoc het
            merge  /*+ CARDINALITY(o, 100)
                      CARDINALITY(upd, 100)
                      LEADING(o upd) */
                into ams.la_mana_policy_repo_tmp o
            using
                (
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
                        tmp.pol_effective_date,
                        tmp.pol_issue_date,
                        tmp.pol_of_date,
                        tmp.freq_by_months,
                        tmp.freq_per_annum,
                        tmp.freq_per_annum_name,
                        tmp.init_premium,
                        tmp.freq_premium,
                        tmp.lsum_premium,
                        tmp.afyp,
                        tmp.commission_status,
                        tmp.commission_status_name,
                        tmp.pol_status,
                        tmp.pol_status_code,
                        tmp.pol_status_name,
                        tmp.holder_name,
                        tmp.insured_name,
                        tmp.holder_address,
                        tmp.init_outlet_id,
                        tmp.init_outlet_ams_id
                    from ams.la_mana_policy_history tmp
                    --lay tu bang lich su voi session id = 1 la mot nhu da co roi
                    where tmp.session_id = var_session_module_id
                        and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE
                ) upd
            on (
                var_session_id = o.session_id
                and
                ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE = o.source_of_data
                and
                upd.account_number = o.account_number
            )
            when matched then
                update
                    set
                        o.outlet_id = upd.outlet_id,
                        o.outlet_ams_id = upd.outlet_ams_id,
                        o.status_code = upd.status_code,
                        o.outlet_name = upd.outlet_name,
                        o.company_id = upd.company_id,
                        o.company_bvl_id = upd.company_bvl_id,
                        o.company_ams_id = upd.company_ams_id,
                        o.company_name = upd.company_name,
                        o.office_id = upd.office_id,
                        o.office_ams_id = upd.office_ams_id,
                        o.office_name = upd.office_name,
                        o.agency_id = upd.agency_id,
                        o.agency_ams_id = upd.agency_ams_id,
                        o.agency_name = upd.agency_name,
                        o.unit_id = upd.unit_id,
                        o.unit_ams_id = upd.unit_ams_id,
                        o.unit_name = upd.unit_name,
                        o.position_code = upd.position_code,
                        o.position_date = upd.position_date,
                        o.position_name = upd.position_name,
                        o.effective_date = upd.effective_date,
                        o.terminative_date = upd.terminative_date,
                        o.pol_effective_date = upd.pol_effective_date,
                        o.pol_issue_date = upd.pol_issue_date,
                        o.pol_of_date = upd.pol_of_date,
                        o.freq_by_months = upd.freq_by_months,
                        o.freq_per_annum = upd.freq_per_annum,
                        o.freq_per_annum_name = upd.freq_per_annum_name,
                        o.commission_status = upd.commission_status,
                        o.commission_status_name = upd.commission_status_name,
                        o.init_premium = upd.init_premium,
                        o.freq_premium = upd.freq_premium,
                        o.lsum_premium = upd.lsum_premium,
                        o.afyp = upd.afyp,
                        o.pol_status = upd.pol_status,
                        o.pol_status_code = upd.pol_status_code,
                        o.pol_status_name = upd.pol_status_name,
                        o.holder_name = upd.holder_name,
                        o.insured_name = upd.insured_name,
                        o.holder_address = upd.holder_address,
                        o.init_outlet_id = upd.init_outlet_id,
                        o.init_outlet_ams_id = upd.init_outlet_ams_id,
                        o.update_datetime = sysdate;
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'bvl_get_policy_synch', 'merge tu  bang la_mana_policy_history thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 7;

            --sau do thi merge cac thong tin da luu tu bang la_mana_policy theo ngay thang da co cho no
            --cap nhat lai months_between(var_month_to_date, var_month_from_date) + 1 de lay duoc thong tin ve dai ly cho dung
            if var_month_to_date >= var_month_from_date then
                for i in 0..months_between(var_month_to_date, var_month_from_date) + 1
                loop
                    --lay thang do ra
                    var_date := add_months(var_month_from_date, i);
                    --do so lieu cua tung thang vao mot bang tam da co de roi sau do se minus di la ra cac hop dong con hieu luc
                    --do vao bang cac hop dong con hieu luc
                    ams.life_agency_log.time_stop;
                    ams.life_agency_log.time_begin;
                    var_error_pos := 8.1;

                    merge  /*+ CARDINALITY(o, 100)
                              CARDINALITY(upd, 100)
                              LEADING(o upd) */
                        into ams.la_mana_policy_repo_tmp o
                    using
                        (
                            select  /*+ CARDINALITY(tmp, 100)*/
                                max(tmp.outlet_id) outlet_id,
                                max(tmp.outlet_ams_id) outlet_ams_id,
                                max(tmp.status_code) status_code,
                                max(tmp.source_of_data) source_of_data,
                                max(tmp.outlet_name) outlet_name,
                                max(tmp.company_id) company_id,
                                max(tmp.company_bvl_id) company_bvl_id,
                                max(tmp.company_ams_id) company_ams_id,
                                max(tmp.company_name) company_name,
                                max(tmp.office_id) office_id,
                                max(tmp.office_ams_id) office_ams_id,
                                max(tmp.office_name) office_name,
                                max(tmp.agency_id) agency_id,
                                max(tmp.agency_ams_id) agency_ams_id,
                                max(tmp.agency_name) agency_name,
                                max(tmp.unit_id) unit_id,
                                max(tmp.unit_ams_id) unit_ams_id,
                                max(tmp.unit_name) unit_name,
                                max(tmp.position_code) position_code,
                                max(tmp.position_date) position_date,
                                max(tmp.position_name) position_name,
                                max(tmp.effective_date) effective_date,
                                max(tmp.terminative_date) terminative_date,
                                tmp.account_number,
                                max(tmp.pol_effective_date) pol_effective_date,
                                max(tmp.pol_issue_date) pol_issue_date,
                                max(tmp.pol_of_date) pol_of_date,
                                max(tmp.freq_by_months) freq_by_months,
                                max(tmp.freq_per_annum) freq_per_annum,
                                max(tmp.freq_per_annum_name) freq_per_annum_name,
                                max(tmp.commission_status) commission_status,
                                max(tmp.commission_status_name) commission_status_name,
                                max(tmp.init_premium) init_premium,
                                max(tmp.freq_premium) freq_premium,
                                max(tmp.lsum_premium) lsum_premium,
                                max(tmp.afyp) afyp,
                                max(tmp.pol_status) pol_status,
                                max(tmp.pol_status_code) pol_status_code,
                                max(tmp.pol_status_name) pol_status_name,
                                max(tmp.holder_name) holder_name,
                                max(tmp.insured_name) insured_name,
                                max(tmp.holder_address) holder_address,
                                max(tmp.init_outlet_id) init_outlet_id,
                                max(tmp.init_outlet_ams_id) init_outlet_ams_id
                            from ams.la_mana_policy tmp
                            --lay tu bang lich su voi record_date nhu da co roi
                            where tmp.record_date  = var_date
                                and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE
                                --nhung cai khong bi het hieu luc thoi
                                and tmp.pol_of_date is null
                            group by tmp.account_number
                        ) upd
                    on (
                        var_session_id = o.session_id
                        and
                        ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE = o.source_of_data
                        and
                        upd.account_number = o.account_number
                    )
                    when matched then
                        update
                            set
                                o.outlet_id = upd.outlet_id,
                                o.outlet_ams_id = upd.outlet_ams_id,
                                o.status_code = upd.status_code,
                                o.outlet_name = upd.outlet_name,
                                o.company_id = upd.company_id,
                                o.company_bvl_id = upd.company_bvl_id,
                                o.company_ams_id = upd.company_ams_id,
                                o.company_name = upd.company_name,
                                o.office_id = upd.office_id,
                                o.office_ams_id = upd.office_ams_id,
                                o.office_name = upd.office_name,
                                o.agency_id = upd.agency_id,
                                o.agency_ams_id = upd.agency_ams_id,
                                o.agency_name = upd.agency_name,
                                o.unit_id = upd.unit_id,
                                o.unit_ams_id = upd.unit_ams_id,
                                o.unit_name = upd.unit_name,
                                o.position_code = upd.position_code,
                                o.position_date = upd.position_date,
                                o.position_name = upd.position_name,
                                o.effective_date = upd.effective_date,
                                o.terminative_date = upd.terminative_date,
                                o.pol_effective_date = upd.pol_effective_date,
                                o.pol_issue_date = upd.pol_issue_date,
                                o.pol_of_date = upd.pol_of_date,
                                o.freq_by_months = upd.freq_by_months,
                                o.freq_per_annum = upd.freq_per_annum,
                                o.freq_per_annum_name = upd.freq_per_annum_name,
                                o.commission_status = upd.commission_status,
                                o.commission_status_name = upd.commission_status_name,
                                o.init_premium = upd.init_premium,
                                o.freq_premium = upd.freq_premium,
                                o.lsum_premium = upd.lsum_premium,
                                o.afyp = upd.afyp,
                                o.pol_status = upd.pol_status,
                                o.pol_status_code = upd.pol_status_code,
                                o.pol_status_name = upd.pol_status_name,
                                o.holder_name = upd.holder_name,
                                o.insured_name = upd.insured_name,
                                o.holder_address = upd.holder_address,
                                o.init_outlet_id = upd.init_outlet_id,
                                o.init_outlet_ams_id = upd.init_outlet_ams_id,
                                o.update_datetime = sysdate;
                    commit;

                    ams.life_agency_log.time_end;
                    ams.life_agency_log.write_log(1000, 'bvl_get_policy_synch', 'merge tu  bang la_mana_policy thang ' || to_char(var_date, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
                end loop;
            end if;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'bvl_get_policy_synch', 'merge tat ca het mat thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 9;

            --sau do thi merge cac thong tin da tinh vao cho no cung theo thu tu tren thi se dung duoc het
            merge  /*+ CARDINALITY(o, 100)
                      CARDINALITY(upd, 100)
                      LEADING(o upd) */
                into ams.la_mana_policy_repo_tmp o
            using
                (
                    select  /*+ CARDINALITY(tmp, 100)*/
                        max(tmp.outlet_id) outlet_id,
                        max(tmp.outlet_ams_id) outlet_ams_id,
                        max(tmp.status_code) status_code,
                        max(tmp.source_of_data) source_of_data,
                        max(tmp.outlet_name) outlet_name,
                        max(tmp.company_id) company_id,
                        max(tmp.company_bvl_id) company_bvl_id,
                        max(tmp.company_ams_id) company_ams_id,
                        max(tmp.company_name) company_name,
                        max(tmp.office_id) office_id,
                        max(tmp.office_ams_id) office_ams_id,
                        max(tmp.office_name) office_name,
                        max(tmp.agency_id) agency_id,
                        max(tmp.agency_ams_id) agency_ams_id,
                        max(tmp.agency_name) agency_name,
                        max(tmp.unit_id) unit_id,
                        max(tmp.unit_ams_id) unit_ams_id,
                        max(tmp.unit_name) unit_name,
                        max(tmp.position_code) position_code,
                        max(tmp.position_date) position_date,
                        max(tmp.position_name) position_name,
                        max(tmp.effective_date) effective_date,
                        max(tmp.terminative_date) terminative_date,
                        tmp.account_number,
                        max(tmp.pol_effective_date) pol_effective_date,
                        max(tmp.pol_issue_date) pol_issue_date,
                        max(tmp.pol_of_date) pol_of_date,
                        max(tmp.freq_by_months) freq_by_months,
                        max(tmp.freq_per_annum) freq_per_annum,
                        max(tmp.freq_per_annum_name) freq_per_annum_name,
                        max(tmp.commission_status) commission_status,
                        max(tmp.commission_status_name) commission_status_name,
                        max(tmp.init_premium) init_premium,
                        max(tmp.freq_premium) freq_premium,
                        max(tmp.lsum_premium) lsum_premium,
                        max(tmp.afyp) afyp,
                        max(tmp.pol_status) pol_status,
                        max(tmp.pol_status_code) pol_status_code,
                        max(tmp.pol_status_name) pol_status_name,
                        max(tmp.holder_name) holder_name,
                        max(tmp.insured_name) insured_name,
                        max(tmp.holder_address) holder_address,
                        max(tmp.init_outlet_id) init_outlet_id,
                        max(tmp.init_outlet_ams_id) init_outlet_ams_id
                    from ams.la_mana_policy_change_tmp tmp
                    --lay tu bang lich su voi session id = 1 la mot nhu da co roi
                    where tmp.session_id = var_session_module_id
                        and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE
                    group by tmp.account_number
                ) upd
            on (
                var_session_id = o.session_id
                and
                ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_BVLIFE = o.source_of_data
                and
                upd.account_number = o.account_number
            )
            when matched then
                update
                    set
                        o.outlet_id = upd.outlet_id,
                        o.outlet_ams_id = upd.outlet_ams_id,
                        o.status_code = upd.status_code,
                        o.outlet_name = upd.outlet_name,
                        o.company_id = upd.company_id,
                        o.company_bvl_id = upd.company_bvl_id,
                        o.company_ams_id = upd.company_ams_id,
                        o.company_name = upd.company_name,
                        o.office_id = upd.office_id,
                        o.office_ams_id = upd.office_ams_id,
                        o.office_name = upd.office_name,
                        o.agency_id = upd.agency_id,
                        o.agency_ams_id = upd.agency_ams_id,
                        o.agency_name = upd.agency_name,
                        o.unit_id = upd.unit_id,
                        o.unit_ams_id = upd.unit_ams_id,
                        o.unit_name = upd.unit_name,
                        o.position_code = upd.position_code,
                        o.position_date = upd.position_date,
                        o.position_name = upd.position_name,
                        o.effective_date = upd.effective_date,
                        o.terminative_date = upd.terminative_date,
                        o.pol_effective_date = upd.pol_effective_date,
                        o.pol_issue_date = upd.pol_issue_date,
                        o.pol_of_date = upd.pol_of_date,
                        o.freq_by_months = upd.freq_by_months,
                        o.freq_per_annum = upd.freq_per_annum,
                        o.freq_per_annum_name = upd.freq_per_annum_name,
                        o.commission_status = upd.commission_status,
                        o.commission_status_name = upd.commission_status_name,
                        o.init_premium = upd.init_premium,
                        o.freq_premium = upd.freq_premium,
                        o.lsum_premium = upd.lsum_premium,
                        o.afyp = upd.afyp,
                        o.pol_status = upd.pol_status,
                        o.pol_status_code = upd.pol_status_code,
                        o.pol_status_name = upd.pol_status_name,
                        o.holder_name = upd.holder_name,
                        o.insured_name = upd.insured_name,
                        o.holder_address = upd.holder_address,
                        o.init_outlet_id = upd.init_outlet_id,
                        o.init_outlet_ams_id = upd.init_outlet_ams_id,
                        o.update_datetime = sysdate;
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'bvl_get_policy_synch', 'lay tinh trang hoa hong khai thac la_mana_policy_repo_tmp thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 9.1;

            --dbms_stats.gather_table_stats(null, 'la_mana_policy_repo_tmp', cascade => true);

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'bvl_get_policy_synch', 'gather la_mana_policy_repo_tmp thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 10;


            --do het du lieu da co vao bang da tinh cho no
            insert /*+ APPEND */ into ams.la_mana_policy_repo nologging
            select /*+ CARDINALITY(tmp, 100)*/
                tmp.*
            from ams.la_mana_policy_repo_tmp tmp
            where tmp.session_id = var_session_id;
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'bvl_get_policy_synch', 'do len bang report thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 11;


            --dbms_stats.gather_table_stats(null, 'la_mana_policy_repo', cascade => true);

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'bvl_get_policy_synch', 'gather la_mana_policy_repo ');
        end if;


        var_run_end_time := sysdate;
        ams.life_agency_log.time_log(1001, 'Thoi gian chay bvl', var_run_begin_time, var_run_end_time);
        exception
            when others then
                rollback;
                life_agency_log.write_log(1000,
                    'bvl_get_policy: loi  ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                    sqlerrm,
                    sqlcode);
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 1/12/2012
        Version: 1.0
        Description: Lay du lieu ve cac hop dong quan ly o Talisman ban dau
        Parameter:
            valRecordDate [date]: Thang ghi nhan
            valTypeOfData [varchar2]: Loai du lieu
            valCompanyID [number]: Ma cong ty
            valSessionId [number]: Session Id
        Update:  Le Khac Chinh
            Version: 1.1
            Date Updated: 6/8/2013
            Note:  Fix lai chuong trinh theo yeu cau cua BA va UAT
                      Sua sai cot Con hoa hong khai thac va sua sai phan lay HD con hieu luc
    */
    procedure tal_get_policy_prepare(valRecordDate date := null,
        valTypeOfData varchar2 := null,
        valCompanyID number := null,
        valSessionId number := null)
    is
        var_record_date date := trunc(valRecordDate, 'MM');
        var_selected_data_date date := trunc(valRecordDate, 'DD');
        --lay du lieu trong vong 1 thang thoi nhe
        var_from_date date := trunc(valRecordDate, 'MM');
        --cuoi thang la cuoi thang nay luon cho no de tinh
        var_to_date date := add_months(trunc(valRecordDate, 'MM'), 1) - 1;
        var_error_pos  number(8, 2) := null;
        var_session_id number(14) := 0;
        var_version_date date := trunc(sysdate, 'DD');
        var_run_begin_time date := sysdate;
        var_run_end_time date := sysdate;
        var_session_activity_id number(18,2) := 0;
    begin
        /* Xoa du lieu hoa don
        trong 1 thang di da*/
        var_run_begin_time := sysdate;

        var_session_id := var_session_module_id;

        --xoa du lieu
        loop
            delete ams.la_mana_policy del
            where del.record_date = var_record_date
                and del.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN
                and rownum < ams.LIFE_AGENCY_MANA_POLICY.RECORD_MAX_DELETE;
            exit when SQL%rowcount < ams.LIFE_AGENCY_MANA_POLICY.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'tal_get_policy_prepare', 'delete ams.la_mana_policy talisman thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        --xoa du lieu cua bang nay di
        execute immediate 'truncate table ams.la_mana_policy_ext_tmp';
        --neu la chay lai thi se lay lai tat ca cac du lieu cho no phat hanh trong moi thang
        --thuc hien doi voi lan chay dau tien cho no
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'tal_get_policy_prepare', 'truncate cac bang thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 3;

        dbms_stats.gather_table_stats(null, 'la_mana_policy_ext_tmp', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_MANA_POLICY.tal_get_policy', 'truncate table ams.la_mana_policy_ext_tmp ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 1;

        --Sau do se tong hop du lieu vao bao cao o bang chinh de cho nguoi su dung truy van ra
        --Buoc 1
        --lay cac so lieu con no phi vao bang trong thang
        --do vao bang nay truoc da sau do se do cac bang day sang kia

        --do vao danh sach cac hop dong con hieu luc KHONG BI DUNG THU PHI  tinh den cuoi thang
        insert /*+ APPEND */ into ams.la_mana_policy_ext_tmp nologging
        select
            /*+ CARDINALITY(pol, 100)
                 CARDINALITY(act, 100)
                 CARDINALITY(acc, 100)
                 CARDINALITY(pro, 100)
                 CARDINALITY(act_iss, 100)
                 CARDINALITY(lsum, 100)
                 CARDINALITY(aor, 100)
            */
            aor.outlet_client_id,--outlet_id
            null,--tmp.outlet_ams_id,
            ams.LIFE_AGENCY_MANA_POLICY.MODULE_CODE_MAIN,
            var_record_date,
            var_version_date,--                              date,
            ams.LIFE_AGENCY_MANA_POLICY.OBJECT_STATUS_ACTIVE, --status_code
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN,--source_of_data                          varchar2(16),
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
            acc.account_number,--account_number   varchar2(16),
            trunc(acc.commence_date, 'DD'),--tmp.pol_effective_date
            trunc(act_iss.bus_processed_date, 'DD'), --pol_issue_date           date,
            null,--pol_of_date           date,
            null,--tmp.freq_by_months,--
            act.freq_per_annum,--freq_per_annum
            act.payment_frequency,--freq_name
            null,
            null,
            act.regular_premium, --IP
            act.regular_premium,--Phi dinh ky
            lsum.premium,--lsum
            null,--tmp.afyp
            null,
            null,
            null,
            null,--tmp.holder_name,--holder_name         nvarchar2(255),
            null,--insured_name        nvarchar2(255),
            null,--holder_address      nvarchar2(255),
            null,
            null,
            var_session_id,
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            select  /*+ CARDINALITY(pol1, 100)*/
                pol1.account_id,
                max(pol1.activity_id) activity_id
            from ods.activity pol1
                --cac activity con hieu luc cho den ngay cuoi thang
            where trunc(greatest(pol1.bus_processed_date, pol1.effective_date)) <= var_to_date
                and pol1.is_reversed = 'N'
            group by pol1.account_id
        ) pol
        inner join--lay theo chi lay cac hop dong con hieu luc
        (--con hieu luc
            select  /*+ CARDINALITY(act1, 100)*/
                act1.account_id,
                act1.activity_id
            from ods.activity act1
            where act1.status_code not in ('PIF','OF','PA', 'IFWP')
        ) pol2
            on pol.activity_id = pol2.activity_id
        join
        (  --lay chi tiet ra
            select  /*+ CARDINALITY(act1, 100)*/
                act1.activity_id,
                act1.regular_premium,
                act1.freq_per_annum,
                act1.payment_frequency
            from ods.activity act1
            --cac activity con hieu luc cho den ngay cuoi thang
            where trunc(greatest(act1.bus_processed_date, act1.effective_date)) <= var_to_date
                and act1.is_reversed is not null
                and act1.status_code not in ('PIF','OF','PA', 'IFWP')
          )  act
              on act.activity_id = pol.activity_id
          left join
          (  --lay ma hop dong
             select  /*+ CARDINALITY(acc, 100)*/
                 acc.account_id,
                 acc.product_id,
                 acc.account_number,
                 acc.commence_date
             from ods.account  acc
          ) acc
              on acc.account_id = pol.account_id
          join
          (
              select /*+ CARDINALITY(tmp, 100)*/
                  tmp.product_code,
                  tmp.product_id
              from ods.product tmp
          ) pro
              on pro.product_id = acc.product_id
          left join
          (
             select  /*+ CARDINALITY(act, 100)*/
                 act.account_id,
                 act.bus_processed_date
             from ods.activity act
             where act.activity_code = 'A100'
                 and act.is_reversed = 'N'
          ) act_iss
              on act_iss.account_id = pol.account_id
          left join
          (
              select /*+ CARDINALITY(tran, 100) CARDINALITY(tran_proc, 100)*/
                  tran.account_id,
                  sum(nvl(tran.money, 0)) premium
              from
              (
                  select   /*+ CARDINALITY(tmp, 100)*/  tmp.account_id,
                      trunc(tmp.processed_date, 'DD') processed_date,
                      (tmp.balance_effect_indicator * tmp.gross_amount) money
                  from ods.account_transaction  tmp
                  where tmp.transaction_type_code in (
                      'LS  ',
                      'RLS ')
              ) tran
              join
              (
                  select   /*+ CARDINALITY(tmp, 100)*/
                      tmp.account_id,
                      trunc(tmp.bus_processed_date, 'DD') processed_date
                  from ods.activity tmp
                  where tmp.activity_code = 'A100'
                      and tmp.is_reversed = 'N'
              ) tran_proc
                  on
                  (
                      tran_proc.account_id = tran.account_id
                      and
                      tran.processed_date between tran_proc.processed_date and add_months(tran_proc.processed_date, 12)
                  )
              group by tran.account_id
          ) lsum
              on lsum.account_id = pol.account_id
          left join
          (  --lay ra dai ly quan ly hop dong day luon
              select  /*+ CARDINALITY(tmp, 100)*/
                  tmp.account_id,
                  tmp.outlet_client_id,
                  tmp.account_outlet_id
              from ods.account_outlet_relationship  tmp
              where tmp.relationship_type_code = 'SERV'
          ) aor
              on aor.account_id  = pol.account_id
          where aor.account_outlet_id  =
              (
                  select  /*+ CARDINALITY(a, 100)*/
                      max(a.account_outlet_id)
                  from ods.account_outlet_relationship   a
                  where a.account_id = pol.account_id
                      and a.relationship_type_code = 'SERV'
                      and trunc(a.effective_date, 'DD') <= var_to_date
              );
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_MANA_POLICY.tal_get_policy', 'do cac hop dong con hieu luc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        --do vao danh sach cac hop dong bi dung thu phi vao day cho no
        insert /*+ APPEND */ into ams.la_mana_policy_ext_tmp nologging
        select
            /*+ CARDINALITY(pol, 100)
                 CARDINALITY(act, 100)
                 CARDINALITY(acc, 100)
                 CARDINALITY(act_iss, 100)
                 CARDINALITY(lsum, 100)
                 CARDINALITY(aor, 100)
            */
            aor.outlet_client_id,--outlet_id
            null,--tmp.outlet_ams_id,
            ams.LIFE_AGENCY_MANA_POLICY.MODULE_CODE_MAIN,
            var_record_date,
            var_version_date,--                              date,
            ams.LIFE_AGENCY_MANA_POLICY.OBJECT_STATUS_ACTIVE, --status_code
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN,--source_of_data                          varchar2(16),
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
            acc.account_number,--account_number   varchar2(16),
            trunc(acc.commence_date, 'DD'),--tmp.pol_effective_date
            trunc(act_iss.bus_processed_date, 'DD'), --pol_issue_date           date,
            trunc(greatest(act.bus_processed_date, act.effective_date), 'DD'),--pol_of_date           date,
            null,--tmp.freq_by_months,--
            act.freq_per_annum,--freq_per_annum
            act.payment_frequency,--freq_name
            null,
            null,
            nvl(act.regular_premium, act_iss.regular_premium), --IP
            nvl(act.regular_premium, act_iss.regular_premium), --Phi dinh ky
            lsum.premium,--lsum
            null,--tmp.afyp
            null,--tmp.status
            ams.LIFE_AGENCY_MANA_POLICY.POL_CODE_WOP,--trang thai la dung thu phi
            ams.LIFE_AGENCY_MANA_POLICY.POL_NAME_WOP,
            null,--tmp.holder_name,--holder_name         nvarchar2(255),
            null,--insured_name        nvarchar2(255),
            null,--holder_address      nvarchar2(255),
            null,
            null,
            var_session_id,
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            select  /*+ CARDINALITY(pol1, 100)*/
                pol1.account_id,
                max(pol1.activity_id) activity_id
            from ods.activity pol1
            --cac activity con hieu luc cho den ngay cuoi thang
            where trunc(greatest(pol1.bus_processed_date, pol1.effective_date)) <= var_to_date
                and pol1.is_reversed = 'N'
            group by pol1.account_id
        ) pol
        inner join
        (--chi lay cac hop dong bi dung thu phi
                select  /*+ CARDINALITY(act1, 100)*/
                act1.account_id,
                act1.activity_id
                from ods.activity act1
            where act1.status_code in ('IFWP')
        ) pol2
            on pol.activity_id = pol2.activity_id
        join
        (  --lay chi tiet ra
            select  /*+ CARDINALITY(act1, 100)*/
                act1.activity_id,
                act1.regular_premium,
                act1.freq_per_annum,
                act1.payment_frequency,
                act1.bus_processed_date,
                act1.effective_date
            from ods.activity act1
            --cac activity het hieu luc cho den ngay cuoi thang
            where trunc(greatest(act1.bus_processed_date, act1.effective_date)) <= var_to_date
                and act1.is_reversed is not null
                    --chi lay cac hop dong bi dung thu phi
                    and act1.status_code in ('IFWP')
          )  act
              on act.activity_id = pol.activity_id
          join --phai join cho nay vi co the k chua dc phat hanh
          --khong la sai (khac voi cai tren)
          (
             select  /*+ CARDINALITY(act, 100)*/
                 act.account_id,
                 act.bus_processed_date,
                 act.regular_premium
             from ods.activity act
             where act.activity_code = 'A100'
                 and act.is_reversed = 'N'
          ) act_iss
              on act_iss.account_id = pol.account_id
          left join
          (  --lay ma hop dong
             select  /*+ CARDINALITY(acc, 100)*/
                 acc.account_id,
                 acc.product_id,
                 acc.account_number,
                 acc.commence_date
             from ods.account  acc
          ) acc
              on acc.account_id = pol.account_id
          join
          (
              select /*+ CARDINALITY(tmp, 100)*/
                  tmp.product_code,
                  tmp.product_id
              from ods.product tmp
          ) pro
              on pro.product_id = acc.product_id
          left join
          (
              select /*+ CARDINALITY(tran, 100) CARDINALITY(tran_proc, 100)*/
                  tran.account_id,
                  sum(nvl(tran.money, 0)) premium
              from
              (
                  select   /*+ CARDINALITY(tmp, 100)*/  tmp.account_id,
                      trunc(tmp.processed_date, 'DD') processed_date,
                      (tmp.balance_effect_indicator * tmp.gross_amount) money
                  from ods.account_transaction  tmp
                  where tmp.transaction_type_code in (
                      'LS  ',
                      'RLS ')
              ) tran
              join
              (
                  select   /*+ CARDINALITY(tmp, 100)*/
                      tmp.account_id,
                      trunc(tmp.bus_processed_date, 'DD') processed_date
                  from ods.activity tmp
                  where tmp.activity_code = 'A100'
                      and tmp.is_reversed = 'N'
              ) tran_proc
                  on
                  (
                      tran_proc.account_id = tran.account_id
                      and
                      tran.processed_date between tran_proc.processed_date and add_months(tran_proc.processed_date, 12)
                  )
              group by tran.account_id
          ) lsum
              on lsum.account_id = pol.account_id
          left join
          (  --lay ra dai ly quan ly hop dong day luon
              select  /*+ CARDINALITY(tmp, 100)*/
                  tmp.account_id,
                  tmp.outlet_client_id,
                  tmp.account_outlet_id
              from ods.account_outlet_relationship  tmp
              where tmp.relationship_type_code = 'SERV'
          ) aor
              on aor.account_id  = pol.account_id
          where aor.account_outlet_id  =
              (
                  select  /*+ CARDINALITY(a, 100)*/
                      max(a.account_outlet_id)
                  from ods.account_outlet_relationship   a
                  where a.account_id = pol.account_id
                      and a.relationship_type_code = 'SERV'
                      and trunc(a.effective_date, 'DD') <= var_to_date
              );
        commit;
        dbms_stats.gather_table_stats(null, 'la_mana_policy_ext_tmp', cascade => true);
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_MANA_POLICY.tal_get_policy', 'do cac hop dong dung thu phi ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 2;

        --sau khi do het so lieu vao thi se cap nhat hieu luc tu ngay den ngay cho no

        dbms_stats.gather_table_stats(null, 'la_mana_policy_ext_tmp', cascade => true);
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_MANA_POLICY.tal_get_policy', 'do cac hop dong het hieu luc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 3;

        --cap nhat cac thong tin khac vao day nua
        update ams.la_mana_policy_ext_tmp tmp
        set tmp.afyp = nvl(tmp.freq_per_annum, 0.1) * nvl(tmp.init_premium, 0),
            tmp.freq_premium = tmp.init_premium
        where tmp.session_id = var_session_id
            and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_MANA_POLICY.tal_get_policy', 'tinh afyp thoi han bao hiem cho  thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 3.1;

        update ams.la_mana_policy_ext_tmp tmp
        set tmp.init_outlet_ams_id = life_agency_mana_policy.outlet_of_account(var_to_date,
                                        tmp.account_number,
                                        'INIT')
        where tmp.session_id = var_session_id
            and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_MANA_POLICY.tal_get_policy', 'lay dai ly khai thac thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 4;

        dbms_stats.gather_table_stats(null, 'la_mana_policy_ext_tmp', cascade => true);
        dbms_stats.gather_table_stats(null, 'la_inv_outlet', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_MANA_POLICY.tal_get_policy', 'gather la_mana_policy_ext_tmp  la_inv_outlet_tmp thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 5;


        /*cap nhat cac thong tin ve dai ly */
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_mana_policy_ext_tmp o
        using
            (
                select  /*+ CARDINALITY(o, 100)*/
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
                from ams.la_inv_outlet o
                where o.record_date = var_record_date
                group by o.outlet_ams_id
            ) upd
        on (
            var_session_id = o.session_id
            and
            var_record_date = o.record_date
            and
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN = o.source_of_data
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
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_MANA_POLICY.tal_get_policy', 'cap nhat cac thong tin dai ly thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 6;
        --neu khong co ten dai ly o day thi chung no la no da duoc day vao cho cong ty roi
        --se xu ly cho no o day
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_mana_policy_ext_tmp o
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_client_id outlet_id,
                    tmp.location_id company_id,
                    tmp.location_name company_name
                from ods.outlet tmp
                where tmp.location_type_code = 'CTTV'
                and tmp.status_code = 'CURR'
            ) upd
        on (
            var_session_id = o.session_id
            and
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN = o.source_of_data
            --trong truong hop khong the lay duoc ten cong ty ra
            --thi tuc la no cho ve mot cong ty da co chinh la truong outlet_id
            --outlet_id is not null = company_id va company_id la null
            --thi update lai ten cong ty va ma cong ty chinh la outlet_id cho no
            and --neu ma trung ma cua no thi se update cho no
            --trang thai cho no
            upd.outlet_id = o.outlet_id
        )
        when matched then
            update
                set
                    o.company_id = upd.company_id,
                    o.company_name = upd.company_name
            where o.outlet_ams_id is null;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_MANA_POLICY.tal_get_policy', 'cap nhat cty neu k co dai ly thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 6;

        --merge vao bang la_mana_policy_ext_tmp
        --lay ten nguoi tham gia dia chi vao lam tam o day
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_mana_policy_ext_tmp o
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.account_number,
                    max(tmp.holder_name) holder_name,
                    max(tmp.insured_name) insured_name,
                    max(tmp.holder_address) holder_address
                from ams.la_inv_tal_customer tmp
                where tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN
                group by tmp.account_number
            ) upd
        on ( --trong thang day voi cac barcode day
            var_session_id = o.session_id
            and
            var_record_date = o.record_date
            and
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN = o.source_of_data
            and
            upd.account_number = o.account_number
        )
        when matched then
            update
                set
                    o.holder_name = upd.holder_name,
                    o.insured_name = upd.insured_name,
                    o.holder_address = upd.holder_address,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_MANA_POLICY.tal_get_policy', 'lay ten nguoi tham gia ... tham gia dia chi thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos :=  7;

        -- AnhNH Cap nha thong tin tinh trang hoa hong
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_mana_policy_ext_tmp o
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                       pol.serv_outlet_id  outlet_id,
                       pol.init_comm_status,
                       pol.policy_number
                from ams.la_comp_policy_inforce pol
                where pol.record_date = trunc(var_record_date, 'MM')
            ) upd
        on (
            var_session_id = o.session_id
            and
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN = o.source_of_data
            and
            upd.policy_number = o.account_number
            and
            var_record_date = o.record_date

        )
        when matched then
            update
                set
                    o.commission_status = upd.init_comm_status;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_MANA_POLICY.tal_get_policy', 'xong commission thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos :=  7;

        update ams.la_mana_policy_ext_tmp tmp
        set tmp.commission_status_name = ams.LIFE_AGENCY_MANA_POLICY.COMM_CONT_NAME
        where tmp.commission_status = ams.LIFE_AGENCY_MANA_POLICY.COMM_CONT
            and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_MANA_POLICY.tal_get_policy', 'xong commission name thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos :=  7;
        update ams.la_mana_policy_ext_tmp tmp
        set tmp.commission_status_name = ams.LIFE_AGENCY_MANA_POLICY.COMM_CONT_NAME_NO
        where tmp.commission_status = ams.LIFE_AGENCY_MANA_POLICY.COMM_CONT_NO
            and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN;
        commit;

        --sau do do tat ca VAO BANG LISH SU CHO NO
        --de ve sau do ra thi se rat de va tien
        --cac  du lieu tu bang la_mana_policy_ext_tmp vao trong bang la_mana_policy_history
        insert /*+ APPEND */ into ams.la_mana_policy_history nologging
        select /*+ CARDINALITY(tmp, 100)*/
            max(tmp.outlet_id) outlet_id ,
            max(tmp.outlet_ams_id) outlet_ams_id,
            max(tmp.type_code) type_code,
            max(tmp.record_date) record_date,
            max(tmp.version_date) version_date,
            max(tmp.status_code) status_code,
            max(tmp.source_of_data) source_of_data,
            max(tmp.outlet_name) outlet_name ,
            max(tmp.company_id) company_id ,
            max(tmp.company_bvl_id) company_bvl_id ,
            max(tmp.company_ams_id) company_ams_id,
            max(tmp.company_name) company_name ,
            max(tmp.office_id) office_id,
            max(tmp.office_ams_id) office_ams_id,
            max(tmp.office_name) office_name,
            max(tmp.agency_id) agency_id,
            max(tmp.agency_ams_id) agency_ams_id ,
            max(tmp.agency_name) agency_name ,
            max(tmp.unit_id) unit_id ,
            max(tmp.unit_ams_id) unit_ams_id,
            max(tmp.unit_name) unit_name ,
            max(tmp.position_code) position_code ,
            max(tmp.position_date) position_date,
            max(tmp.position_name) position_name ,
            max(tmp.effective_date) effective_date,
            max(tmp.terminative_date) terminative_date ,
            tmp.account_number,
            max(tmp.pol_effective_date) pol_effective_date ,
            max(tmp.pol_issue_date) pol_issue_date ,
            max(tmp.pol_of_date) pol_of_date,
            max(tmp.freq_by_months) freq_by_months,
            max(tmp.freq_per_annum) freq_per_annum,
            max(tmp.freq_per_annum_name) freq_per_annum_name,
            max(tmp.commission_status) commission_status,--null,--
            max(tmp.commission_status_name) commission_status_name,--null,--
            max(tmp.init_premium) init_premium,
            max(tmp.freq_premium) freq_premium,
            max(tmp.lsum_premium) lsum_premium,
            max(tmp.afyp) afyp,
            max(tmp.pol_status) pol_status ,
            max(tmp.pol_status_code) pol_status_code ,
            max(tmp.pol_status_name) pol_status_name,
            max(tmp.holder_name) holder_name,
            max(tmp.insured_name) insured_name ,
            max(tmp.holder_address) holder_address,
            max(tmp.init_outlet_id) init_outlet_id ,
            max(tmp.init_outlet_ams_id) init_outlet_ams_id,
            var_session_module_id, --session_id = 1 cho no
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.la_mana_policy_ext_tmp tmp
        where tmp.session_id = var_session_id
            and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN
        group by tmp.account_number;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'tal_get_policy_prepare', 'do vao bang la_mana_policy_history tu bang ext thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        var_error_pos := 10;
        dbms_stats.gather_table_stats(null, 'la_mana_policy_history', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'tal_get_policy_prepare', 'gather ams.la_mana_policy thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        --sau do thuc hien do so lieu vao bang de tra theo ngay cho no
        --lay tu BVL truoc tu bang  la_mana_policy_ext_tmp da co o tren va khong xoa
        --lay cac danh sach hop dong con hieu luc trong thang day truoc
        --neu ma chon ngay vao day no nam trong ngay hien tai - 7 cho den ngay hien tai
        --thi se xoa du lieu cu va do so lieu moi vao ban nay de
        --no query ra cho nhanh

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'tal_get_policy_prepare', 'co chay cai nay: ngay select khi chay: ' ||  to_char(var_selected_data_date, 'dd/mm/yyyy') || ' - co nam trong (  tu ngay: ' || to_char(var_delete_from_date, 'dd/mm/yyyy') || ' - ' || to_char(var_current_date, 'dd/mm/yyyy')  || ' : den ngay ) ?' );
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        var_run_end_time := sysdate;
        ams.life_agency_log.time_log(1001, 'Thoi gian chay tal', var_run_begin_time, var_run_end_time);
        exception
            when others then
                rollback;
                life_agency_log.write_log(1000,
                    'bvl_get_invoice: loi  ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                    sqlerrm,
                    sqlcode);
    end;
    /*
        Creater: Le Khac Chinh
        Date Create: 1/12/2012
        Version: 1.0
        Description: Lay du lieu ve cac hop dong quan ly o Talisman tung thang
        Parameter:
            valRecordDate [date]: Thang ghi nhan
            valTypeOfData [varchar2]: Loai du lieu
            valCompanyID [number]: Ma cong ty
            valSessionId [number]: Session Id
        Update:  Le Khac Chinh
            Version: 1.1
            Date Updated: 6/8/2013
            Note:  Fix lai chuong trinh theo yeu cau cua BA va UAT
                      Sua sai cot Con hoa hong khai thac va sua sai phan lay HD con hieu luc
    */
    procedure tal_get_policy(valRecordDate date := null,
        valTypeOfData varchar2 := null,
        valCompanyID number := null,
        valSessionId number := null)
    is
        var_record_date date := trunc(valRecordDate, 'MM');
        var_selected_data_date date := trunc(valRecordDate, 'DD');
        --lay du lieu trong vong 1 thang thoi nhe
        var_from_date date := trunc(valRecordDate, 'MM');
        --cuoi thang la cuoi thang nay luon cho no de tinh
        var_to_date date := add_months(trunc(valRecordDate, 'MM'), 1) - 1;
        var_undo_to_date date := add_months(trunc(valRecordDate, 'MM'), 3) - 1;

        var_error_pos  number(8, 2) := null;
        var_session_id number(14) := 0;
        var_version_date date := trunc(sysdate, 'DD');
        var_run_begin_time date := sysdate;
        var_run_end_time date := sysdate;
        var_session_activity_id number(18,2) := 0;
    begin
        /* Xoa du lieu hoa don
        trong 1 thang di da*/
        var_run_begin_time := sysdate;

        var_session_id := var_session_module_id;

        --chi chay trong vong 1 thang day
        loop
            delete ams.la_mana_policy del
            where del.record_date = var_record_date
                and del.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN
                and rownum < ams.LIFE_AGENCY_MANA_POLICY.RECORD_MAX_DELETE;
            exit when SQL%rowcount < ams.LIFE_AGENCY_MANA_POLICY.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_MANA_POLICY.bvl_get_policy', 'delete ams.la_mana_policy talisman thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        --xoa du lieu cua bang nay di
        execute immediate 'truncate table ams.la_mana_policy_ext_tmp';
        --neu la chay lai thi se lay lai tat ca cac du lieu cho no phat hanh trong moi thang
        --thuc hien doi voi lan chay dau tien cho no
        commit;
        dbms_stats.gather_table_stats(null, 'la_mana_policy_ext_tmp', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'bvl_get_policy_prepare', 'truncate la_mana_policy_ext_tmp  thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 3;


        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'tal_get_policy', 'truncate table ams.la_mana_policy_ext_tmp ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 4;

        --Sau do se tong hop du lieu vao bao cao o bang chinh de cho nguoi su dung truy van ra
        --Buoc 1
        --lay danh sach cac hop dong co THAY DOI  TRANG THAI va CON HIEU LUC
        --KHONG PHAI LAY RIENG CAC HOP DONG PHAT HANH TRONG THANG THI SE BI THIEU
        --VI NEU CO THAY DOI VE TINH TRANG HOP DONG CUAN NO
        --lay danh sach cac hop dong het hieu luc trong thang day luon

        --sau do khi ma do vao bang kia thi chi can select distint cho no de du lieu duoc dung hon la duoc roi
        --du lieu do thi no se bi trung lap cac du lieu cho no nen can phai xu ly tiep sau


        --do vao danh sach cac hop dong con hieu luc KHONG BI DUNG THU PHI  tinh den cuoi thang
        insert /*+ APPEND */ into ams.la_mana_policy_ext_tmp nologging
        select
            /*+ CARDINALITY(pol, 100)
                 CARDINALITY(act, 100)
                 CARDINALITY(acc, 100)
                 CARDINALITY(pro, 100)
                 CARDINALITY(act_iss, 100)
                 CARDINALITY(lsum, 100)
                 CARDINALITY(aor, 100)
            */
            aor.outlet_client_id,--outlet_id
            null,--tmp.outlet_ams_id,
            ams.LIFE_AGENCY_MANA_POLICY.MODULE_CODE_MAIN,
            var_record_date,
            var_version_date,--                              date,
            ams.LIFE_AGENCY_MANA_POLICY.OBJECT_STATUS_ACTIVE, --status_code
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN,--source_of_data                          varchar2(16),
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
            acc.account_number,--account_number   varchar2(16),
            trunc(acc.commence_date, 'DD'),--tmp.pol_effective_date
            trunc(act_iss.bus_processed_date, 'DD'), --pol_issue_date           date,
            null,--pol_of_date           date,
            null,--tmp.freq_by_months,--
            act.freq_per_annum,--freq_per_annum
            act.payment_frequency,--freq_name
            null,
            null,
            act.regular_premium, --IP
            act.regular_premium,--Phi dinh ky
            lsum.premium,--lsum
            null,--tmp.afyp
            null,
            null,
            null,
            null,--tmp.holder_name,--holder_name         nvarchar2(255),
            null,--insured_name        nvarchar2(255),
            null,--holder_address      nvarchar2(255),
            null,
            null,
            var_session_id,
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            select  /*+ CARDINALITY(pol1, 100)*/
                pol1.account_id,
                max(pol1.activity_id) activity_id
            from ods.activity pol1
                --cac activity co thay doi va con hieu luc trong thang do
            where trunc(greatest(pol1.bus_processed_date, pol1.effective_date))
                       between var_from_date and var_to_date
                and pol1.is_reversed = 'N'
            group by pol1.account_id
        ) pol
        inner join--lay theo chi lay cac hop dong con hieu luc
        (--con hieu luc
            select  /*+ CARDINALITY(act1, 100)*/
                act1.account_id,
                act1.activity_id
            from ods.activity act1
            where act1.status_code not in ('PIF','OF','PA', 'IFWP')
        ) pol2
            on pol.activity_id = pol2.activity_id
        join
        (  --lay chi tiet ra
            select  /*+ CARDINALITY(act1, 100)*/
                act1.activity_id,
                act1.regular_premium,
                act1.freq_per_annum,
                act1.payment_frequency
            from ods.activity act1
            --cac activity co thay doi va con hieu luc trong thang do
            where trunc(greatest(act1.bus_processed_date, act1.effective_date))
                between var_from_date and var_to_date
                and act1.is_reversed is not null
                and act1.status_code not in ('PIF','OF','PA', 'IFWP')
          )  act
              on act.activity_id = pol.activity_id
          left join
          (  --lay ma hop dong
             select  /*+ CARDINALITY(acc, 100)*/
                 acc.account_id,
                 acc.product_id,
                 acc.account_number,
                 acc.commence_date
             from ods.account  acc
          ) acc
              on acc.account_id = pol.account_id
          join
          (
              select /*+ CARDINALITY(tmp, 100)*/
                  tmp.product_code,
                  tmp.product_id
              from ods.product tmp
          ) pro
              on pro.product_id = acc.product_id
          left join
          (
             select  /*+ CARDINALITY(act, 100)*/
                 act.account_id,
                 act.bus_processed_date
             from ods.activity act
             where act.activity_code = 'A100'
                 and act.is_reversed = 'N'
          ) act_iss
              on act_iss.account_id = pol.account_id
          left join
          (
              select /*+ CARDINALITY(tran, 100) CARDINALITY(tran_proc, 100)*/
                  tran.account_id,
                  sum(nvl(tran.money, 0)) premium
              from
              (
                  select   /*+ CARDINALITY(tmp, 100)*/  tmp.account_id,
                      trunc(tmp.processed_date, 'DD') processed_date,
                      (tmp.balance_effect_indicator * tmp.gross_amount) money
                  from ods.account_transaction  tmp
                  where tmp.transaction_type_code in (
                      'LS  ',
                      'RLS ')
              ) tran
              join
              (
                  select   /*+ CARDINALITY(tmp, 100)*/
                      tmp.account_id,
                      trunc(tmp.bus_processed_date, 'DD') processed_date
                  from ods.activity tmp
                  where tmp.activity_code = 'A100'
                      and tmp.is_reversed = 'N'
              ) tran_proc
                  on
                  (
                      tran_proc.account_id = tran.account_id
                      and
                      tran.processed_date between tran_proc.processed_date and add_months(tran_proc.processed_date, 12)
                  )
              group by tran.account_id
          ) lsum
              on lsum.account_id = pol.account_id
          left join
          (  --lay ra dai ly quan ly hop dong day luon
              select  /*+ CARDINALITY(tmp, 100)*/
                  tmp.account_id,
                  tmp.outlet_client_id,
                  tmp.account_outlet_id
              from ods.account_outlet_relationship  tmp
              where tmp.relationship_type_code = 'SERV'
          ) aor
              on aor.account_id  = pol.account_id
          where aor.account_outlet_id  =
              (
                  select  /*+ CARDINALITY(a, 100)*/
                      max(a.account_outlet_id)
                  from ods.account_outlet_relationship   a
                  where a.account_id = pol.account_id
                      and a.relationship_type_code = 'SERV'
                      and trunc(a.effective_date, 'DD') <= var_to_date
              );
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'tal_get_policy', 'do cac hop dong con hieu luc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        --do vao danh sach cac hop dong bi dung thu phi vao day cho no
        insert /*+ APPEND */ into ams.la_mana_policy_ext_tmp nologging
        select
            /*+ CARDINALITY(pol, 100)
                 CARDINALITY(act, 100)
                 CARDINALITY(acc, 100)
                 CARDINALITY(act_iss, 100)
                 CARDINALITY(lsum, 100)
                 CARDINALITY(aor, 100)
            */
            aor.outlet_client_id,--outlet_id
            null,--tmp.outlet_ams_id,
            ams.LIFE_AGENCY_MANA_POLICY.MODULE_CODE_MAIN,
            var_record_date,
            var_version_date,--                              date,
            ams.LIFE_AGENCY_MANA_POLICY.OBJECT_STATUS_ACTIVE, --status_code
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN,--source_of_data                          varchar2(16),
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
            acc.account_number,--account_number   varchar2(16),
            trunc(acc.commence_date, 'DD'),--tmp.pol_effective_date
            trunc(act_iss.bus_processed_date, 'DD'), --pol_issue_date           date,
            trunc(greatest(act.bus_processed_date, act.effective_date), 'DD'),--pol_of_date           date,
            null,--tmp.freq_by_months,--
            act.freq_per_annum,--freq_per_annum
            act.payment_frequency,--freq_name
            null,
            null,
            nvl(act.regular_premium, act_iss.regular_premium), --IP
            nvl(act.regular_premium, act_iss.regular_premium), --Phi dinh ky
            lsum.premium,--lsum
            null,--tmp.afyp
            null,--tmp.status
            ams.LIFE_AGENCY_MANA_POLICY.POL_CODE_WOP,--trang thai la dung thu phi
            ams.LIFE_AGENCY_MANA_POLICY.POL_NAME_WOP,
            null,--tmp.holder_name,--holder_name         nvarchar2(255),
            null,--insured_name        nvarchar2(255),
            null,--holder_address      nvarchar2(255),
            null,
            null,
            var_session_id,
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            select  /*+ CARDINALITY(pol1, 100)*/
                pol1.account_id,
                max(pol1.activity_id) activity_id
            from ods.activity pol1
            --cac activity dung thu phi trong thang do
            where trunc(greatest(pol1.bus_processed_date, pol1.effective_date))
                       between var_from_date and var_to_date
                and pol1.is_reversed = 'N'
            group by pol1.account_id
        ) pol
        inner join
        (--chi lay cac hop dong bi dung thu phi
            select  /*+ CARDINALITY(act1, 100)*/
                act1.account_id,
                act1.activity_id
            from ods.activity act1
            where act1.status_code in ('IFWP')
        ) pol2
            on pol.activity_id = pol2.activity_id
        join
        (  --lay chi tiet ra
            select  /*+ CARDINALITY(act1, 100)*/
                act1.activity_id,
                act1.regular_premium,
                act1.freq_per_annum,
                act1.payment_frequency,
                act1.bus_processed_date,
                act1.effective_date
            from ods.activity act1
            --cac activity dung thu phi trong thang do
            where trunc(greatest(act1.bus_processed_date, act1.effective_date))
                       between var_from_date and var_to_date
                and act1.is_reversed is not null
                --chi lay cac hop dong bi dung thu phi
                and act1.status_code in ('IFWP')
          )  act
              on act.activity_id = pol.activity_id
          join --phai join cho nay vi co the k chua dc phat hanh
          --khong la sai (khac voi cai tren)
          (
             select  /*+ CARDINALITY(act, 100)*/
                 act.account_id,
                 act.bus_processed_date,
                 act.regular_premium
             from ods.activity act
             where act.activity_code = 'A100'
                 and act.is_reversed = 'N'
          ) act_iss
              on act_iss.account_id = pol.account_id
          left join
          (  --lay ma hop dong
             select  /*+ CARDINALITY(acc, 100)*/
                 acc.account_id,
                 acc.product_id,
                 acc.account_number,
                 acc.commence_date
             from ods.account  acc
          ) acc
              on acc.account_id = pol.account_id
          join
          (
              select /*+ CARDINALITY(tmp, 100)*/
                  tmp.product_code,
                  tmp.product_id
              from ods.product tmp
          ) pro
              on pro.product_id = acc.product_id
          left join
          (
              select /*+ CARDINALITY(tran, 100) CARDINALITY(tran_proc, 100)*/
                  tran.account_id,
                  sum(nvl(tran.money, 0)) premium
              from
              (
                  select   /*+ CARDINALITY(tmp, 100)*/  tmp.account_id,
                      trunc(tmp.processed_date, 'DD') processed_date,
                      (tmp.balance_effect_indicator * tmp.gross_amount) money
                  from ods.account_transaction  tmp
                  where tmp.transaction_type_code in (
                      'LS  ',
                      'RLS ')
              ) tran
              join
              (
                  select   /*+ CARDINALITY(tmp, 100)*/
                      tmp.account_id,
                      trunc(tmp.bus_processed_date, 'DD') processed_date
                  from ods.activity tmp
                  where tmp.activity_code = 'A100'
                      and tmp.is_reversed = 'N'
              ) tran_proc
                  on
                  (
                      tran_proc.account_id = tran.account_id
                      and
                      tran.processed_date between tran_proc.processed_date and add_months(tran_proc.processed_date, 12)
                  )
              group by tran.account_id
          ) lsum
              on lsum.account_id = pol.account_id
          left join
          (  --lay ra dai ly quan ly hop dong day luon
              select  /*+ CARDINALITY(tmp, 100)*/
                  tmp.account_id,
                  tmp.outlet_client_id,
                  tmp.account_outlet_id
              from ods.account_outlet_relationship  tmp
              where tmp.relationship_type_code = 'SERV'
          ) aor
              on aor.account_id  = pol.account_id
          where aor.account_outlet_id  =
              (
                  select  /*+ CARDINALITY(a, 100)*/
                      max(a.account_outlet_id)
                  from ods.account_outlet_relationship   a
                  where a.account_id = pol.account_id
                      and a.relationship_type_code = 'SERV'
                      and trunc(a.effective_date, 'DD') <= var_to_date
              );
        commit;
        dbms_stats.gather_table_stats(null, 'la_mana_policy_ext_tmp', cascade => true);
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'tal_get_policy', 'do cac hop dong dung thu phi ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 2;

        --do vao danh sach cac hop dong het hieu luc trong thang
        insert /*+ APPEND */ into ams.la_mana_policy_ext_tmp nologging
        select
            /*+ CARDINALITY(pol, 100)
                 CARDINALITY(act, 100)
                 CARDINALITY(acc, 100)
                 CARDINALITY(act_iss, 100)
                 CARDINALITY(lsum, 100)
                 CARDINALITY(aor, 100)
            */
            aor.outlet_client_id,--outlet_id
            null,--tmp.outlet_ams_id,
            ams.LIFE_AGENCY_MANA_POLICY.MODULE_CODE_MAIN,
            var_record_date,
            var_version_date,--                              date,
            ams.LIFE_AGENCY_MANA_POLICY.OBJECT_STATUS_ACTIVE, --status_code
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN,--source_of_data                          varchar2(16),
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
            acc.account_number,--account_number   varchar2(16),
            trunc(acc.commence_date, 'DD'),--tmp.pol_effective_date
            trunc(act_iss.bus_processed_date, 'DD'), --pol_issue_date           date,
            trunc(greatest(act.bus_processed_date, act.effective_date), 'DD'),--pol_of_date           date,
            null,--tmp.freq_by_months,--
            act.freq_per_annum,--freq_per_annum
            act.payment_frequency,--freq_name
            null,
            null,
            nvl(act.regular_premium, act_iss.regular_premium), --IP
            nvl(act.regular_premium, act_iss.regular_premium), --Phi dinh ky
            lsum.premium,--lsum
            null,--tmp.afyp
            null,
            null,
            null,
            null,--tmp.holder_name,--holder_name         nvarchar2(255),
            null,--insured_name        nvarchar2(255),
            null,--holder_address      nvarchar2(255),
            null,
            null,
            var_session_id,
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            select  /*+ CARDINALITY(pol1, 100)*/
                pol1.account_id,
                max(pol1.activity_id) activity_id
            from
            (
                select  /*+ CARDINALITY(act1, 100)*/
                    act1.activity_id,
                    act1.account_id
                from ods.activity act1
                --cac activity het hieu luc trong thang do
                where trunc(greatest(act1.bus_processed_date, act1.effective_date))
                       between var_from_date and var_to_date
                    and act1.is_reversed is not null
                    --chi lay cac hop dong bi het hieu luc
                    and act1.status_code in ('OF')
                minus
                select /*+ CARDINALITY(act2, 100)*/
                    act2.reversed_acti_id,
                    act2.account_id
                from ods.activity act2
                where trunc(greatest(act2.bus_processed_date, act2.effective_date))
                       between var_from_date and var_undo_to_date
            ) pol1
            group by pol1.account_id
        ) pol
        join
        (  --lay chi tiet ra
            select  /*+ CARDINALITY(act1, 100)*/
                act1.activity_id,
                act1.regular_premium,
                act1.freq_per_annum,
                act1.payment_frequency,
                act1.bus_processed_date,
                act1.effective_date
            from ods.activity act1
            --cac activity het hieu luc cho den ngay cuoi thang
            where trunc(greatest(act1.bus_processed_date, act1.effective_date))
                    between var_from_date and var_to_date
                and act1.is_reversed is not null
                --chi lay cac hop dong bi het hieu luc
                and act1.status_code in ('OF')
          )  act
              on act.activity_id = pol.activity_id
          join --phai join cho nay vi co the k chua dc phat hanh
          --khong la sai (khac voi cai tren)
          (
             select  /*+ CARDINALITY(act, 100)*/
                 act.account_id,
                 act.bus_processed_date,
                 act.regular_premium
             from ods.activity act
             where act.activity_code = 'A100'
                 and act.is_reversed = 'N'
          ) act_iss
              on act_iss.account_id = pol.account_id
          left join
          (  --lay ma hop dong
             select  /*+ CARDINALITY(acc, 100)*/
                 acc.account_id,
                 acc.product_id,
                 acc.account_number,
                 acc.commence_date
             from ods.account  acc
          ) acc
              on acc.account_id = pol.account_id
          join
          (
              select /*+ CARDINALITY(tmp, 100)*/
                  tmp.product_code,
                  tmp.product_id
              from ods.product tmp
          ) pro
              on pro.product_id = acc.product_id
          left join
          (
              select /*+ CARDINALITY(tran, 100) CARDINALITY(tran_proc, 100)*/
                  tran.account_id,
                  sum(nvl(tran.money, 0)) premium
              from
              (
                  select   /*+ CARDINALITY(tmp, 100)*/  tmp.account_id,
                      trunc(tmp.processed_date, 'DD') processed_date,
                      (tmp.balance_effect_indicator * tmp.gross_amount) money
                  from ods.account_transaction  tmp
                  where tmp.transaction_type_code in (
                      'LS  ',
                      'RLS ')
              ) tran
              join
              (
                  select   /*+ CARDINALITY(tmp, 100)*/
                      tmp.account_id,
                      trunc(tmp.bus_processed_date, 'DD') processed_date
                  from ods.activity tmp
                  where tmp.activity_code = 'A100'
                      and tmp.is_reversed = 'N'
              ) tran_proc
                  on
                  (
                      tran_proc.account_id = tran.account_id
                      and
                      tran.processed_date between tran_proc.processed_date and add_months(tran_proc.processed_date, 12)
                  )
              group by tran.account_id
          ) lsum
              on lsum.account_id = pol.account_id
          left join
          (  --lay ra dai ly quan ly hop dong day luon
              select  /*+ CARDINALITY(tmp, 100)*/
                  tmp.account_id,
                  tmp.outlet_client_id,
                  tmp.account_outlet_id
              from ods.account_outlet_relationship  tmp
              where tmp.relationship_type_code = 'SERV'
          ) aor
              on aor.account_id  = pol.account_id
          where aor.account_outlet_id  =
              (
                  select  /*+ CARDINALITY(a, 100)*/
                      max(a.account_outlet_id)
                  from ods.account_outlet_relationship   a
                  where a.account_id = pol.account_id
                      and a.relationship_type_code = 'SERV'
                      and trunc(a.effective_date, 'DD') <= var_to_date
              );
        commit;

        --sau khi do het so lieu vao thi se cap nhat hieu luc tu ngay den ngay cho no

        dbms_stats.gather_table_stats(null, 'la_mana_policy_ext_tmp', cascade => true);
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'tal_get_policy', 'do cac hop dong het hieu luc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 3;

        --cap nhat cac thong tin khac vao day nua
        update ams.la_mana_policy_ext_tmp tmp
        set tmp.afyp = nvl(tmp.freq_per_annum, 0.1) * nvl(tmp.init_premium, 0),
            tmp.freq_premium = tmp.init_premium
        where tmp.session_id = var_session_id
            and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'tal_get_policy', 'tinh afyp cho  thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 3.1;

        update ams.la_mana_policy_ext_tmp tmp
        set tmp.init_outlet_ams_id = life_agency_mana_policy.outlet_of_account(var_to_date,
                                        tmp.account_number,
                                        'INIT')
        where tmp.session_id = var_session_id
            and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'tal_get_policy', 'lay dai ly khai thac cho  thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 4;

        dbms_stats.gather_table_stats(null, 'la_mana_policy_ext_tmp', cascade => true);
        dbms_stats.gather_table_stats(null, 'la_inv_outlet', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'tal_get_policy', 'gather la_mana_policy_ext_tmp  la_inv_outlet_tmp thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 5;

        /*cap nhat cac thong tin ve dai ly */
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_mana_policy_ext_tmp o
        using
            (
                select  /*+ CARDINALITY(o, 100)*/
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
                from ams.la_inv_outlet o
                where o.record_date = var_record_date
                group by o.outlet_ams_id
            ) upd
        on (
            var_session_id = o.session_id
            and
            var_record_date = o.record_date
            and
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN = o.source_of_data
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
        ams.life_agency_log.write_log(1000, 'tal_get_policy', 'cap nhat cac thong tin dai ly thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 6;
        --neu khong co ten dai ly o day thi chung no la no da duoc day vao cho cong ty roi
        --se xu ly cho no o day
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_mana_policy_ext_tmp o
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_client_id outlet_id,
                    tmp.location_id company_id,
                    tmp.location_name company_name
                from ods.outlet tmp
                where tmp.location_type_code = 'CTTV'
                and tmp.status_code = 'CURR'
            ) upd
        on (
            var_session_id = o.session_id
            and
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN = o.source_of_data
            --trong truong hop khong the lay duoc ten cong ty ra
            --thi tuc la no cho ve mot cong ty da co chinh la truong outlet_id
            --outlet_id is not null = company_id va company_id la null
            --thi update lai ten cong ty va ma cong ty chinh la outlet_id cho no
            and --neu ma trung ma cua no thi se update cho no
            --trang thai cho no
            upd.outlet_id = o.outlet_id
            and
            o.outlet_ams_id is null
        )
        when matched then
            update
                set
                    o.company_id = upd.company_id,
                    o.company_name = upd.company_name,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'tal_get_policy', 'cap nhat cty neu k co dai ly thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 6;


        dbms_stats.gather_table_stats(null, 'la_inv_tal_customer', cascade => true);

        --merge vao bang la_mana_policy_ext_tmp
        --lay ten nguoi tham gia dia chi vao lam tam o day
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_mana_policy_ext_tmp o
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.account_number,
                    max(tmp.holder_name) holder_name,
                    max(tmp.insured_name) insured_name,
                    max(tmp.holder_address) holder_address
                from ams.la_inv_tal_customer tmp
                where tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN
                group by tmp.account_number
            ) upd
        on ( --trong thang day voi cac barcode day
            var_session_id = o.session_id
            and
            var_record_date = o.record_date
            and
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN = o.source_of_data
            and
            upd.account_number = o.account_number
        )
        when matched then
            update
                set
                    o.holder_name = upd.holder_name,
                    o.insured_name = upd.insured_name,
                    o.holder_address = upd.holder_address,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'tal_get_policy', 'lay ten nguoi tham gia ... tham gia dia chi thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos :=  7;



        dbms_stats.gather_table_stats(null, 'la_mana_policy_ext_tmp', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'tal_get_policy', 'gather ams.la_mana_policy_ext_tmp thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 10;

        -- AnhNH Cap nha thong tin tinh trang hoa hong
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_mana_policy_ext_tmp o
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                       pol.serv_outlet_id  outlet_id,
                       pol.init_comm_status,
                       pol.policy_number
                from ams.la_comp_policy_inforce pol
                where pol.record_date = trunc(var_record_date, 'MM')

            ) upd
        on (
            var_session_id = o.session_id
            and
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN = o.source_of_data
            and
            upd.policy_number = o.account_number
            and
            var_record_date = o.record_date

        )
        when matched then
            update
                set
                    o.commission_status = upd.init_comm_status;
        commit;

        update ams.la_mana_policy_ext_tmp tmp
        set tmp.commission_status_name = ams.LIFE_AGENCY_MANA_POLICY.COMM_CONT_NAME
        where tmp.commission_status = ams.LIFE_AGENCY_MANA_POLICY.COMM_CONT
            and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN;

        commit;
        update ams.la_mana_policy_ext_tmp tmp
        set tmp.commission_status_name = ams.LIFE_AGENCY_MANA_POLICY.COMM_CONT_NAME_NO
        where tmp.commission_status = ams.LIFE_AGENCY_MANA_POLICY.COMM_CONT_NO
            and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN;
        commit;

        --sau do do tat cac cac  du lieu tu bang la_mana_policy_ext_tmp vao trong bang la_mana_policy
        insert /*+ APPEND */ into ams.la_mana_policy nologging
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
            tmp.pol_effective_date,
            tmp.pol_issue_date,
            tmp.pol_of_date,
            null,
            null,
            tmp.freq_per_annum_name,
            tmp.commission_status,--null,
            tmp.commission_status_name,--null,
            tmp.init_premium,
            tmp.freq_premium,
            tmp.lsum_premium,
            tmp.afyp,
            null,--pol_status
            tmp.pol_status_code,
            tmp.pol_status_name,
            tmp.holder_name,
            tmp.insured_name,
            tmp.init_outlet_id,
            tmp.init_outlet_ams_id,
            tmp.holder_address,
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
            ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.la_mana_policy_ext_tmp tmp
        where tmp.session_id = var_session_id
            and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'tal_get_policy', 'do vao bang la_mana_policy tu bang ext thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        var_error_pos := 10;
        dbms_stats.gather_table_stats(null, 'la_mana_policy', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'tal_get_policy', 'gather ams.la_mana_policy thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        var_run_end_time := sysdate;
        ams.life_agency_log.time_log(1001, 'Thoi gian chay tal', var_run_begin_time, var_run_end_time);
        exception
            when others then
                rollback;
                life_agency_log.write_log(1000,
                    'bvl_get_invoice: loi  ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                    sqlerrm,
                    sqlcode);
    end;

    --sau khi do xong duoc so lieu vao bang la_mana_policy cua tung thang roi thi se xu ly lay so lieu
    --de do vao bang report o day cho no
    procedure tal_get_policy_synch(valRecordDate date := null,
        valTypeOfData varchar2 := null,
        valCompanyID number := null,
        valSessionId number := null)
    is
        var_record_date date := trunc(valRecordDate, 'MM');
        var_selected_data_date date := trunc(valRecordDate, 'DD');
        --chay theo tung thang thi se xu ly cho no nhu sau
        var_month_from_date date := add_months(trunc(valRecordDate, 'MM'), -100);
        --chay cho den cuoi thang truoc day thi so lieu moi chinh xac duoc
        var_month_to_date date := add_months(trunc(valRecordDate, 'MM'), -1);

        --lay du lieu trong vong 1 thang thi se du duoc so lieu roi
        var_from_date date := var_record_date;
        --cuoi thang la cuoi thang nay luon cho no de tinh
        var_to_date date := add_months(trunc(valRecordDate, 'MM'), 1) - 1;

        var_error_pos  number(8, 2) := null;
        var_session_id number(14) := 0;
        var_version_date date := trunc(sysdate, 'DD');
        var_query varchar(32000) := '';
        var_run_begin_time date := sysdate;
        var_run_end_time date := sysdate;

        var_date date := trunc(valRecordDate, 'MM');
    begin
        var_run_begin_time := sysdate;
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 1;

        var_session_id := valSessionId;

        --xoa du lieu cua bang nay di
        execute immediate 'truncate table ams.la_mana_policy_repo_tmp';
        execute immediate 'truncate table ams.la_mana_policy_if_account_tmp';
        execute immediate 'truncate table ams.la_mana_policy_of_account_tmp';
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'tal_get_policy_synch', 'truncate cac bang tam thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 2;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'tal_get_policy_synch', 'co chay cai nay: ngay select khi chay: ' ||  to_char(var_selected_data_date, 'dd/mm/yyyy') || ' - co nam trong (  tu ngay: ' || to_char(var_delete_from_date, 'dd/mm/yyyy') || ' - ' || to_char(var_current_date, 'dd/mm/yyyy')  || ' : den ngay ) ?' );
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        --if var_selected_data_date between var_delete_from_date and var_current_date then
        if var_selected_data_date between var_selected_data_date  and var_selected_data_date  then
            --xoa truoc khi do so lieu vao cho no chac chan da
            --neu khong la se chay thua do chay 2 lan
              ams.life_agency_log.time_end;
              ams.life_agency_log.write_log(1000, 'tal_get_policy_synch', 'ghi vao voi ngay la:' || to_char(var_selected_data_date, 'dd/mm/yyyy'));
              ams.life_agency_log.time_stop;
              ams.life_agency_log.time_begin;

              loop
                  delete ams.la_mana_policy_repo o
                  where o.record_date = var_selected_data_date
                      and o.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN
                      and rownum < ams.LIFE_AGENCY_MANA_POLICY.MAX_DELETE_NUMBER;
                  exit when SQL%rowcount < ams.LIFE_AGENCY_MANA_POLICY.MAX_DELETE_NUMBER - 1;
                  commit;
              end loop;
              commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'tal_get_policy_synch', 'delete ams.la_mana_policy_repo thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;

            --1.dau tien se do vao danh sach cac hop dong con hieu luc o trong bang lich su la_mana_policy_history da luu lai cho no du lieu o day
            --trong bang do chi chua cac hop dong con hieu luc

            insert /*+ APPEND */ into ams.la_mana_policy_if_account_tmp nologging
            select /*+ CARDINALITY(tmp, 100)*/
                var_selected_data_date, --bao cao la_mana_policy_repo nay phai dua du lieu theo ngay nay
                tmp.record_date,
                tmp.source_of_data,
                tmp.account_number,
                var_session_id,
                ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                sysdate,
                sysdate
            from ams.la_mana_policy_history tmp
            --lay tu bang lich su voi session id = 1 la mot nhu da co roi
            where tmp.session_id = var_session_module_id
                and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN;
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'tal_get_policy_synch', 'do vao bang la_mana_policy_history  thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 1.1;

            --sau do ke tu thang ma do so lieu vao cho no o bang lich su + 1 cho den
            --thang ma chay nay -1
            --do vao danh sach cac hop dong con hieu luc
            --minus di danh sach cac hop dong HET hieu luc


            --Buoc 1:
            --sau do ke tu thang ma do so lieu vao cho no o bang lich su + 1 cho den
            --thang ma chay nay -1
            --do vao danh sach cac hop dong con hieu luc
            --minus di danh sach cac hop dong HET hieu luc

            --chay lan luot tung thang ke tu thang sau khi luu o history cho den truoc thanh tinh

            begin
                --lay cai nay de co the lay ra thang ma no co so lieu o serv_data_va FYP va policy
                --de lay so lieu ra cho dung
                select  /*+ CARDINALITY(tmp, 100)*/
                    tmp.record_date
                        into var_month_from_date
                from ams.la_mana_policy_history tmp
                --lay tu bang lich su voi session id = 1 la mot nhu da co roi
                where tmp.session_id = var_session_module_id
                    and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN
                    and rownum <= 1;
            exception
                 when others then
                       --neu khong tim thay thi se lay so lieu nhu the nay cung duoc
                      select  /*+ CARDINALITY(tmp, 100)*/
                          min(tmp.record_date)
                              into var_month_from_date
                      from ams.la_mana_policy tmp
                      where tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN;
            end;

            --lay cai to_date cho no
            begin
                --lay cai nay de co the lay ra thang ma no co so lieu o serv_data_va FYP va policy
                --de lay so lieu ra cho dung
                var_month_to_date := add_months(trunc(valRecordDate, 'MM'), -1);
            exception
                 when others then
                       --neu khong tim thay thi se lay so lieu nhu the nay cung duoc
                      select  /*+ CARDINALITY(tmp, 100)*/
                          max(tmp.record_date)
                              into var_month_to_date
                      from ams.la_mana_policy tmp
                      where tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN;
                      var_month_to_date := add_months(var_month_to_date, -1);
            end;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'tal_get_policy_synch', 'so lieu do bang acc se tu thang: ' || to_char(var_month_from_date, 'dd/mm/yyyy') ||  ' cho den thang ' || to_char(var_month_to_date, 'dd/mm/yyyy') || ' de xu ly con hieu luc tru di het hieu luc trong giai doan cach thang do'  );
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;

            if var_month_to_date >= var_month_from_date then
                for i in 0..months_between(var_month_to_date, var_month_from_date)
                loop
                    --lay thang do ra
                    var_date := add_months(var_month_from_date, i);
                    --do so lieu cua tung thang vao mot bang tam da co de roi sau do se minus di la ra cac hop dong con hieu luc
                    --do vao bang cac hop dong con hieu luc
                    ams.life_agency_log.time_stop;
                    ams.life_agency_log.time_begin;
                    var_error_pos := 1.2;

                    insert /*+ APPEND */ into ams.la_mana_policy_if_account_tmp nologging
                    select /*+ CARDINALITY(tmp, 100)*/
                        var_selected_data_date, --bao cao la_mana_policy_repo nay phai dua du lieu theo ngay nay
                        tmp.record_date,
                        tmp.source_of_data,
                        tmp.account_number,
                        var_session_id,
                        ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                        ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                        sysdate,
                        sysdate
                    from ams.la_mana_policy tmp
                    --lay cac hop dong con hieu luc o tai thang do cho thang day cho no
                    where tmp.record_date = var_date
                        and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN
                        and tmp.pol_of_date is null;
                    commit;

                    ams.life_agency_log.time_end;
                    ams.life_agency_log.write_log(1000, 'tal_get_policy_synch', 'do vao bang la_mana_policy_if_account_tmp cua cac thang,  thang ' || to_char(var_date, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
                    ams.life_agency_log.time_stop;
                    ams.life_agency_log.time_begin;
                    var_error_pos := 1.3;


                    --do vao bang danh sach cac hop dong het hieu luc trong cac thang do
                    insert /*+ APPEND */ into ams.la_mana_policy_of_account_tmp nologging
                    select /*+ CARDINALITY(tmp, 100)*/
                        var_selected_data_date, --bao cao la_mana_policy_repo nay phai dua du lieu theo ngay nay
                        tmp.record_date,
                        tmp.source_of_data,
                        tmp.account_number,
                        var_session_id,
                        ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                        ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                        sysdate,
                        sysdate
                    from ams.la_mana_policy tmp
                    --lay cac hop dong con hieu luc o tai thang do cho thang day cho no
                    where tmp.record_date = var_date
                        and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN
                        and tmp.pol_of_date is not null;
                    commit;

                    ams.life_agency_log.time_end;
                    ams.life_agency_log.write_log(1000, 'tal_get_policy_synch', 'do vao bang la_mana_policy_of_account_tmp cua cac thang,  thang ' || to_char(var_date, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
                end loop;
            end if;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'tal_get_policy_synch', 'do vao bang la_mana_policy_if_account_tmp la_mana_policy_of_account_tmp cua cac thang,  thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 3;

            --sau do do vao bang tam so lieu cac du lieu
            --roi den thang thang tinh nay thi se
            --do vao cac hop dong con hieu luc
            --va cac hop dong het hieu luc SAU ngay tinh o selected date
            --thi ra duoc cac hop dong con hieu luc

            insert /*+ APPEND */ into ams.la_mana_policy_if_account_tmp nologging
            select /*+ CARDINALITY(tmp, 100)*/
                var_selected_data_date, --bao cao la_mana_policy_repo nay phai dua du lieu theo ngay nay
                tmp.record_date,
                tmp.source_of_data,
                tmp.account_number,
                var_session_id,
                ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                sysdate,
                sysdate
            from ams.la_mana_policy tmp
            --lay cac hop dong con hieu luc o thang hien tai
            where tmp.record_date = var_record_date
                and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN
                and tmp.pol_of_date is null;
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'tal_get_policy_synch', 'do vao bang la_mana_policy_if_account_tmp cua  thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 4;

            --do vao bang danh sach cac hop dong het hieu luc trong cac thang do
            insert /*+ APPEND */ into ams.la_mana_policy_of_account_tmp nologging
            select /*+ CARDINALITY(tmp, 100)*/
                var_selected_data_date, --bao cao la_mana_policy_repo nay phai dua du lieu theo ngay nay
                tmp.record_date,
                tmp.source_of_data,
                tmp.account_number,
                var_session_id,
                ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                sysdate,
                sysdate
            from ams.la_mana_policy tmp
            --lay cac hop dong het hieu luc voi ngay het hieu luc sau ngay selected do
            where tmp.record_date = var_record_date
                and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN
                --lay cac danh sach hop dong huy sau ngay day thi hop dong do no van con hieu luc
                and nvl(tmp.pol_of_date, ams.LIFE_AGENCY_MANA_POLICY.DATE_MIN_VALUE) > var_selected_data_date;
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'tal_get_policy_synch', 'do vao bang la_mana_policy_if_account_tmp cua  thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 5;

            dbms_stats.gather_table_stats(null, 'la_mana_policy_if_account_tmp', cascade => true);
            dbms_stats.gather_table_stats(null, 'la_mana_policy_of_account_tmp', cascade => true);
            dbms_stats.gather_table_stats(null, 'la_mana_policy_history', cascade => true);
            dbms_stats.gather_table_stats(null, 'la_mana_policy', cascade => true);

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'tal_get_policy_synch', 'gather het cac bang thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 2;

            --do vao bang temp la_mana_policy_repo_tmp danh sach
            --cac hop dong con hieu luc  sau khi minus di cac hop dong het hieu luc
            --sau do se merge cac  thong tin nguoc lai theo thu tu thi se ra duoc du cac thong tin cho no
            insert /*+ APPEND */ into ams.la_mana_policy_repo_tmp nologging
            select /*+ CARDINALITY(repo, 100)*/
                null,--outlet_id           number(10),
                null,--outlet_ams_id       varchar2(16),
                ams.LIFE_AGENCY_MANA_POLICY.MODULE_CODE_MAIN,
                var_selected_data_date,
                var_version_date,
                null,--status_code         varchar2(16),
                ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN,--null,--source_of_data      varchar2(16),
                null,--outlet_name         nvarchar2(255),
                null,--company_id          number(10),
                null,--company_bvl_id      varchar2(16),
                null,--company_ams_id      varchar2(16),
                null,--company_name        nvarchar2(255),
                null,--office_id           number(10),
                null,--office_ams_id       varchar2(16),
                null,--office_name         nvarchar2(255),
                null,--agency_id           number(10),
                null,--agency_ams_id       varchar2(16),
                null,--agency_name         nvarchar2(255),
                null,--unit_id             number(10),
                null,--unit_ams_id         varchar2(16),
                null,--unit_name           nvarchar2(255),
                null,--position_code       varchar2(16),
                null,--position_date       date,
                null,--position_name       nvarchar2(32),
                null,--effective_date      date,
                null,--terminative_date    date,
                repo.account_number,--account_number      varchar2(64),
                null,--pol_effective_date  date,
                null,--pol_issue_date      date,
                null,--pol_of_date         date,
                null,--freq_by_months      number(5,2),
                null,--freq_per_annum      number(5,2),
                null,--freq_per_annum_name nvarchar2(32),
                null,--commission_status      number(1),
                null,--commission_status_name      varchar2(16),
                null,--init_premium        number(18,2),
                null,--freq_premium        number(18,2),
                null,--lsum_premium        number(18,2),
                null,--afyp                number(18,2),
                null,--pol_status          varchar2(32),
                null,--pol_status_code     varchar2(32),
                null,--pol_status_name     nvarchar2(64),
                null,--holder_name         nvarchar2(255),
                null,--insured_name        nvarchar2(255),
                null,--holder_address      nvarchar2(512),
                null,
                null,
                var_session_id,--          number(14),
                ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                sysdate,
                sysdate
            from
            (
                select  /*+ CARDINALITY(tmp, 100)*/
                    tmp.account_number
                from la_mana_policy_if_account_tmp tmp
                where tmp.session_id = var_session_id
                    and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN
                    and tmp.account_number is not null
                group by tmp.account_number
                minus --tru di cac hop dong bi huy sau 14 ngay
                select  /*+ CARDINALITY(tmp, 100)*/
                    tmp.account_number
                from la_mana_policy_of_account_tmp tmp
                where tmp.session_id = var_session_id
                    and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN
                group by tmp.account_number
            ) repo
            group by repo.account_number;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'tal_get_policy_synch', 'do vao  bang la_mana_policy_repo_tmp thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 6;
            --sau do thi merge cac thong tin da tinh vao cho no cung theo thu tu tren thi se dung duoc het
            merge  /*+ CARDINALITY(o, 100)
                      CARDINALITY(upd, 100)
                      LEADING(o upd) */
                into ams.la_mana_policy_repo_tmp o
            using
                (
                    select  /*+ CARDINALITY(tmp, 100)*/
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
                        tmp.pol_effective_date,
                        tmp.pol_issue_date,
                        tmp.pol_of_date,
                        tmp.freq_by_months,
                        tmp.freq_per_annum,
                        tmp.freq_per_annum_name,
                        tmp.init_premium,
                        tmp.freq_premium,
                        tmp.lsum_premium,
                        tmp.afyp,
                        tmp.commission_status,
                        tmp.commission_status_name,
                        tmp.pol_status,
                        tmp.pol_status_code,
                        tmp.pol_status_name,
                        tmp.holder_name,
                        tmp.insured_name,
                        tmp.holder_address,
                        tmp.init_outlet_id,
                        tmp.init_outlet_ams_id
                    from ams.la_mana_policy_history tmp
                    --lay tu bang lich su voi session id = 1 la mot nhu da co roi
                    where tmp.session_id = var_session_module_id
                        and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN
                ) upd
            on (
                var_session_id = o.session_id
                and
                ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN = o.source_of_data
                and
                upd.account_number = o.account_number
            )
            when matched then
                update
                    set
                        o.outlet_id = upd.outlet_id,
                        o.outlet_ams_id = upd.outlet_ams_id,
                        o.status_code = upd.status_code,
                        o.outlet_name = upd.outlet_name,
                        o.company_id = upd.company_id,
                        o.company_bvl_id = upd.company_bvl_id,
                        o.company_ams_id = upd.company_ams_id,
                        o.company_name = upd.company_name,
                        o.office_id = upd.office_id,
                        o.office_ams_id = upd.office_ams_id,
                        o.office_name = upd.office_name,
                        o.agency_id = upd.agency_id,
                        o.agency_ams_id = upd.agency_ams_id,
                        o.agency_name = upd.agency_name,
                        o.unit_id = upd.unit_id,
                        o.unit_ams_id = upd.unit_ams_id,
                        o.unit_name = upd.unit_name,
                        o.position_code = upd.position_code,
                        o.position_date = upd.position_date,
                        o.position_name = upd.position_name,
                        o.effective_date = upd.effective_date,
                        o.terminative_date = upd.terminative_date,
                        o.pol_effective_date = upd.pol_effective_date,
                        o.pol_issue_date = upd.pol_issue_date,
                        o.pol_of_date = upd.pol_of_date,
                        o.freq_by_months = upd.freq_by_months,
                        o.freq_per_annum = upd.freq_per_annum,
                        o.freq_per_annum_name = upd.freq_per_annum_name,
                        o.commission_status = upd.commission_status,
                        o.commission_status_name = upd.commission_status_name,
                        o.init_premium = upd.init_premium,
                        o.freq_premium = upd.freq_premium,
                        o.lsum_premium = upd.lsum_premium,
                        o.afyp = upd.afyp,
                        o.pol_status = upd.pol_status,
                        o.pol_status_code = upd.pol_status_code,
                        o.pol_status_name = upd.pol_status_name,
                        o.holder_name = upd.holder_name,
                        o.insured_name = upd.insured_name,
                        o.holder_address = upd.holder_address,
                        o.init_outlet_id = upd.init_outlet_id,
                        o.init_outlet_ams_id = upd.init_outlet_ams_id,
                        o.update_datetime = sysdate;
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'tal_get_policy_synch', 'merge tu  bang la_mana_policy_history thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 7;

            --sau do thi merge cac thong tin da luu tu bang la_mana_policy theo ngay thang da co cho no
            if var_month_to_date >= var_month_from_date then
                for i in 0..months_between(var_month_to_date, var_month_from_date)
                loop
                    --lay thang do ra
                    var_date := add_months(var_month_from_date, i);
                    --do so lieu cua tung thang vao mot bang tam da co de roi sau do se minus di la ra cac hop dong con hieu luc
                    --do vao bang cac hop dong con hieu luc
                    ams.life_agency_log.time_stop;
                    ams.life_agency_log.time_begin;
                    var_error_pos := 8.1;

                    merge  /*+ CARDINALITY(o, 100)
                              CARDINALITY(upd, 100)
                              LEADING(o upd) */
                        into ams.la_mana_policy_repo_tmp o
                    using
                        (
                            select  /*+ CARDINALITY(tmp, 100)*/
                                max(tmp.outlet_id) outlet_id,
                                max(tmp.outlet_ams_id) outlet_ams_id,
                                max(tmp.status_code) status_code,
                                max(tmp.source_of_data) source_of_data,
                                max(tmp.outlet_name) outlet_name,
                                max(tmp.company_id) company_id,
                                max(tmp.company_bvl_id) company_bvl_id,
                                max(tmp.company_ams_id) company_ams_id,
                                max(tmp.company_name) company_name,
                                max(tmp.office_id) office_id,
                                max(tmp.office_ams_id) office_ams_id,
                                max(tmp.office_name) office_name,
                                max(tmp.agency_id) agency_id,
                                max(tmp.agency_ams_id) agency_ams_id,
                                max(tmp.agency_name) agency_name,
                                max(tmp.unit_id) unit_id,
                                max(tmp.unit_ams_id) unit_ams_id,
                                max(tmp.unit_name) unit_name,
                                max(tmp.position_code) position_code,
                                max(tmp.position_date) position_date,
                                max(tmp.position_name) position_name,
                                max(tmp.effective_date) effective_date,
                                max(tmp.terminative_date) terminative_date,
                                tmp.account_number,
                                max(tmp.pol_effective_date) pol_effective_date,
                                max(tmp.pol_issue_date) pol_issue_date,
                                max(tmp.pol_of_date) pol_of_date,
                                max(tmp.freq_by_months) freq_by_months,
                                max(tmp.freq_per_annum) freq_per_annum,
                                max(tmp.freq_per_annum_name) freq_per_annum_name,
                                max(tmp.commission_status) commission_status,
                                max(tmp.commission_status_name) commission_status_name,
                                max(tmp.init_premium) init_premium,
                                max(tmp.freq_premium) freq_premium,
                                max(tmp.lsum_premium) lsum_premium,
                                max(tmp.afyp) afyp,
                                max(tmp.pol_status) pol_status,
                                max(tmp.pol_status_code) pol_status_code,
                                max(tmp.pol_status_name) pol_status_name,
                                max(tmp.holder_name) holder_name,
                                max(tmp.insured_name) insured_name,
                                max(tmp.holder_address) holder_address,
                                max(tmp.init_outlet_id) init_outlet_id,
                                max(tmp.init_outlet_ams_id) init_outlet_ams_id
                            from ams.la_mana_policy tmp
                            --lay tu bang lich su voi record_date nhu da co roi
                            where tmp.record_date  = var_date
                                and tmp.source_of_data = ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN
                                --nhung cai khong bi het hieu luc thoi
                                and tmp.pol_of_date is null
                            group by tmp.account_number
                        ) upd
                    on (
                        var_session_id = o.session_id
                        and
                        ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN = o.source_of_data
                        and
                        upd.account_number = o.account_number
                    )
                    when matched then
                        update
                            set
                                o.outlet_id = upd.outlet_id,
                                o.outlet_ams_id = upd.outlet_ams_id,
                                o.status_code = upd.status_code,
                                o.outlet_name = upd.outlet_name,
                                o.company_id = upd.company_id,
                                o.company_bvl_id = upd.company_bvl_id,
                                o.company_ams_id = upd.company_ams_id,
                                o.company_name = upd.company_name,
                                o.office_id = upd.office_id,
                                o.office_ams_id = upd.office_ams_id,
                                o.office_name = upd.office_name,
                                o.agency_id = upd.agency_id,
                                o.agency_ams_id = upd.agency_ams_id,
                                o.agency_name = upd.agency_name,
                                o.unit_id = upd.unit_id,
                                o.unit_ams_id = upd.unit_ams_id,
                                o.unit_name = upd.unit_name,
                                o.position_code = upd.position_code,
                                o.position_date = upd.position_date,
                                o.position_name = upd.position_name,
                                o.effective_date = upd.effective_date,
                                o.terminative_date = upd.terminative_date,
                                o.pol_effective_date = upd.pol_effective_date,
                                o.pol_issue_date = upd.pol_issue_date,
                                o.pol_of_date = upd.pol_of_date,
                                o.freq_by_months = upd.freq_by_months,
                                o.freq_per_annum = upd.freq_per_annum,
                                o.freq_per_annum_name = upd.freq_per_annum_name,
                                o.commission_status = upd.commission_status,
                                o.commission_status_name = upd.commission_status_name,
                                o.init_premium = upd.init_premium,
                                o.freq_premium = upd.freq_premium,
                                o.lsum_premium = upd.lsum_premium,
                                o.afyp = upd.afyp,
                                o.pol_status = upd.pol_status,
                                o.pol_status_code = upd.pol_status_code,
                                o.pol_status_name = upd.pol_status_name,
                                o.holder_name = upd.holder_name,
                                o.insured_name = upd.insured_name,
                                o.holder_address = upd.holder_address,
                                o.init_outlet_id = upd.init_outlet_id,
                                o.init_outlet_ams_id = upd.init_outlet_ams_id,
                                o.update_datetime = sysdate;
                    commit;

                    ams.life_agency_log.time_end;
                    ams.life_agency_log.write_log(1000, 'tal_get_policy_synch', 'merge tu  bang la_mana_policy thang ' || to_char(var_date, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
                end loop;
            end if;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'tal_get_policy_synch', 'merge tat ca het mat thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 9;
            /* --cap nhat con hoa hong khai thac khong o day luon cho no
            merge  \*+ CARDINALITY(o, 100)
                      CARDINALITY(upd, 100)
                      LEADING(o upd) *\
                into ams.la_mana_policy_repo_tmp o
            using
                (
                    select \*+ CARDINALITY(tmp, 100)*\
                        tmp.account_number
                    from ams.la_mana_comm_account_tmp tmp
                    where tmp.session_id = var_session_module_id
                ) upd
            on (
                var_session_id = o.session_id
                and
                ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN = o.source_of_data
                and
                upd.account_number = o.account_number
            )
            when matched then
                update
                    set
                        o.commission_status = ams.LIFE_AGENCY_MANA_POLICY.COMM_CONT,
                        o.commission_status_name = ams.LIFE_AGENCY_MANA_POLICY.COMM_CONT_NAME;
            commit;*/

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'bvl_get_policy_synch', 'lay tinh trang hoa hong khai thac la_mana_policy_repo_tmp thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 9.1;

            dbms_stats.gather_table_stats(null, 'la_mana_policy_repo_tmp', cascade => true);

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'tal_get_policy_synch', 'gather la_mana_policy_repo_tmp thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 10;

            /*Cap nhat lai ma cua dai ly quan ly tai dung thoi diem ngay chay bao cao*/
            update ams.la_mana_policy_repo_tmp tmp
            set tmp.outlet_ams_id = ams.life_agency_mana_policy.outlet_of_account(valRecordDate,
                                            tmp.account_number,
                                            'SERV'),
                tmp.init_outlet_ams_id = ams.life_agency_mana_policy.outlet_of_account(valRecordDate,
                                            tmp.account_number,
                                            'INIT')
            where tmp.session_id = var_session_id;
            commit;

            /*Cap nhat lai con hay het hoa hong khai thac
            Ngay xac dinh la ngay chay du lieu valRecordDate*/
            update ams.la_mana_policy_repo_tmp tmp
            set tmp.commission_status = ams.LIFE_AGENCY_MANA_POLICY.COMM_CONT_NO,
                tmp.update_datetime = sysdate
            where tmp.session_id = var_session_id
                and months_between(valRecordDate, trunc(tmp.pol_effective_date, 'DD')) /12 > 4;
            commit;

            update ams.la_mana_policy_repo_tmp tmp
            set tmp.commission_status = ams.LIFE_AGENCY_MANA_POLICY.COMM_CONT,
                tmp.update_datetime = sysdate
            where tmp.session_id = var_session_id
                and months_between(valRecordDate, trunc(tmp.pol_effective_date, 'DD')) /12 <= 4;
            commit;

            update ams.la_mana_policy_repo_tmp tmp
            set tmp.commission_status_name = ams.LIFE_AGENCY_MANA_POLICY.COMM_CONT_NAME,
                tmp.update_datetime = sysdate
            where  tmp.session_id = var_session_id
                and tmp.commission_status = ams.LIFE_AGENCY_MANA_POLICY.COMM_CONT;
            commit;

            update ams.la_mana_policy_repo_tmp tmp
            set tmp.commission_status_name = ams.LIFE_AGENCY_MANA_POLICY.COMM_CONT_NAME_NO,
                tmp.update_datetime = sysdate
            where tmp.session_id = var_session_id
                and tmp.commission_status = ams.LIFE_AGENCY_MANA_POLICY.COMM_CONT_NO;
            commit;

            /*update ams.la_mana_policy_repo_tmp tmp
            set tmp.outlet_ams_id = ams.life_agency_mana_policy.outlet_of_account(var_record_date,
                                            tmp.account_number,
                                            'SERV'),
                tmp.init_outlet_ams_id = ams.life_agency_mana_policy.outlet_of_account(var_record_date,
                                            tmp.account_number,
                                            'INIT')
            where tmp.session_id = var_session_id;
            commit;*/

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'tal_get_policy_synch', 'cap nhat lai dl thu phi thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 11;

            /*cap nhat cac thong tin ve dai ly */
            merge  /*+ CARDINALITY(o, 100)
                      CARDINALITY(upd, 100)
                      LEADING(o upd) */
                into ams.la_mana_policy_repo_tmp o
            using
                (
                    select  /*+ CARDINALITY(o, 100)*/
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
                    from ams.la_inv_outlet o
                    where o.record_date = var_record_date
                    group by o.outlet_ams_id
                ) upd
            on (
                var_session_id = o.session_id
                and
                valRecordDate = o.record_date
                and
                ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_REFER_TALISMAN = o.source_of_data
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
            ams.life_agency_log.write_log(1000, 'tal_get_policy_synch', 'gather la_mana_policy_repo_tmp thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 12;

            --do het du lieu da co vao bang da tinh cho no
            insert /*+ APPEND */ into ams.la_mana_policy_repo nologging
            select /*+ CARDINALITY(tmp, 100)*/
                tmp.*
            from ams.la_mana_policy_repo_tmp tmp
            where tmp.session_id = var_session_id;
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'tal_get_policy_synch', 'do len bang report thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 11;


            --dbms_stats.gather_table_stats(null, 'la_mana_policy_repo', cascade => true);

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'tal_get_policy_synch', 'gather la_mana_policy_repo ');
        end if;

        var_run_end_time := sysdate;
        ams.life_agency_log.time_log(1001, 'Thoi gian chay bvl', var_run_begin_time, var_run_end_time);
        exception
            when others then
                rollback;
                life_agency_log.write_log(1000,
                    'tal_get_policy_synch: loi  ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                    sqlerrm,
                    sqlcode);
    end;

    procedure get_comm_prepare(valRecordDate date := null,
        valTypeOfData varchar2 := null,
        valCompanyID number := null,
        valSessionId number := null)
    is
        var_record_date date := trunc(valRecordDate, 'MM');
        var_selected_data_date date := trunc(valRecordDate, 'DD');
        --lay du lieu trong vong 1 thang thoi nhe
        var_from_date date := trunc(valRecordDate, 'MM');
        --cuoi thang la cuoi thang nay luon cho no de tinh
        var_to_date date := add_months(trunc(valRecordDate, 'MM'), 1) - 1;
        var_error_pos  number(8, 2) := null;
        var_session_id number(14) := 0;
        var_version_date date := trunc(sysdate, 'DD');
        var_run_begin_time date := sysdate;
        var_run_end_time date := sysdate;
        var_session_activity_id number(18,2) := 0;

        var_record_date_dl08 date := trunc(sysdate, 'MM');
        var_record_date_acc date := trunc(sysdate, 'MM');
    begin
        /* Xoa du lieu hoa don
        trong 1 thang di da*/
        var_run_begin_time := sysdate;
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        begin
            --lay cai nay de co the lay ra thang ma no co so lieu o serv_data_va FYP va policy
            --de lay so lieu ra cho dung
            select /*+ CARDINALITY(res, 100)*/
                res.record_date
                    into var_record_date_dl08
            from
            (
                select  /*+ CARDINALITY(tmp, 100)*/
                    tmp.record_date,
                    row_number() over (order by tmp.record_date desc)  as rowno
                from ams.la_report_dl08 tmp --lay du lieu tu bang nay xem no da co du lieu chua
                where tmp.record_date <= var_record_date
            ) res
            where res.rowno = 1;
        exception
             when others then
                 var_record_date_dl08 := trunc(sysdate, 'MM');
                life_agency_log.write_log(1,
                    'policy: lay var_record_date_dl08 khong co',
                    sqlerrm,
                    sqlcode);
        end;
        --lay ra record date cho la_mana_comm_account_tmp
        --xem da do du lieu vao bang nay chua
        begin
            select  /*+ CARDINALITY(tmp, 100)*/
                tmp.record_date
                    into var_record_date_acc
            from ams.la_mana_comm_account_tmp tmp --lay du lieu tu bang nay xem no da co du lieu chua
            where tmp.record_date <= var_record_date
                and rownum <= 1;
        exception
             when others then
                --cho no = the nay de co the chay duoc cai phan kia cho no
                var_record_date_acc := add_months(var_record_date_dl08, -1);
                life_agency_log.write_log(1,
                    'policy: lay var_record_date_acc khong co',
                    sqlerrm,
                    sqlcode);
        end;

        --neu ma var_record_date_dl08 > var_record_date_acc
        --thi truncate tat ca bang la_mana_comm_account_tmp va do vao tu bang la_report_dl08 vao bang nay voi thang do
        --dong thoi update cac so lieu tu bang ext va merge voi du lieu vao tu bang nay cho no
        --o duoi cac cai cuoi kia

        if var_record_date_dl08 > var_record_date_acc then
            execute immediate 'truncate table ams.la_mana_comm_account_tmp';
            commit;
            dbms_stats.gather_table_stats(null, 'la_mana_comm_account_tmp', cascade => true);
            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'tal_get_policy_synch', 'truncate truncate table ams.la_mana_comm_account_tmp ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 1;
            --do vao tu bang la_report_dl08 vao bang la_mana_comm_account_tmp voi thang do
            insert /*+ APPEND */ into ams.la_mana_comm_account_tmp nologging
            select /*+ CARDINALITY(tmp, 100)*/
                --cho session = 1 cho no tat ca
                var_session_module_id,
                var_record_date_dl08,   --lay cai thang moi nhat day cho no
                tmp.policy_number,
                ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                ams.LIFE_AGENCY_MANA_POLICY.SYSTEM_USER,
                sysdate,
                sysdate
            from ams.la_report_dl08 tmp
            where tmp.record_date = var_record_date_dl08
                and tmp.type_data = 'REPO_MONTH'
                and tmp.commission_total <> 0
            group by tmp.policy_number;
            commit;
            dbms_stats.gather_table_stats(null, 'la_mana_comm_account_tmp', cascade => true);
        end if;
        var_run_end_time := sysdate;
        ams.life_agency_log.time_log(1001, 'Thoi gian chay get_comm_prepare', var_run_begin_time, var_run_end_time);
        exception
            when others then
                rollback;
                life_agency_log.write_log(1000,
                    'get_comm_prepare: loi  ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                    sqlerrm,
                    sqlcode);
    end;

    function outlet_of_account(valDate date := null,
        valAccountNumber varchar2 := null,
        valTypeOfOutlet varchar2 := null) return varchar2
    is
        var_outlet_id number (10) := null;
        var_date date := null;
        var_account_outlet_id number(10) := 0;
        var_account_id number(10) := 0;
        var_outlet_ams_id varchar2(16) := null;
    begin
       begin
            select  /*+ CARDINALITY(acc, 100)*/
                max(acc.account_id) into var_account_id
            from ods.account acc
            where acc.account_number = valAccountNumber;
        exception
            when others then
                var_account_id := 0;
        end;

       begin
            select  /*+ CARDINALITY(acc_out_rel, 100)*/
                max(trunc(acc_out_rel.account_outlet_id)) into var_account_outlet_id
            from ods.account_outlet_relationship acc_out_rel
            where acc_out_rel.account_id = var_account_id
                and acc_out_rel.relationship_type_code = valTypeOfOutlet
                and trunc(acc_out_rel.effective_date) <= valDate;
        exception
            when others then
                var_account_outlet_id := 0;
        end;

        begin
            select   /*+ CARDINALITY(acc_out_rel, 100)*/
                acc_out_rel.outlet_number into var_outlet_ams_id
            from ods.account_outlet_relationship acc_out_rel
            where acc_out_rel.account_id = var_account_id
                and acc_out_rel.relationship_type_code = valTypeOfOutlet
                and acc_out_rel.account_outlet_id = var_account_outlet_id;

        exception
            when others then
                var_outlet_ams_id := null;
        end;

        return var_outlet_ams_id;
    end;


end LIFE_AGENCY_MANA_POLICY;
/
