create or replace package ams.AMS_MODL_COMP_MMXIII is


    MODULE_CODE_MAIN VARCHAR2(16) := 'MAIN';
    MODULE_CODE_COMP VARCHAR2(16) := 'COMP';
    MODULE_CODE_PROM VARCHAR2(16) := 'PROM';
    --lay tat ca la cai nay de do so lieu vao cho no nhanh va de hon nhe
    VAR_SESSION_ID number(1) := 1;

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

    BE_PAID_YES VARCHAR2(1) := 'Y';
    BE_PAID_NO VARCHAR2(1) := 'N';
    BE_PAID_DTL VARCHAR2(1) := 'D';
    BE_PAID_SPC VARCHAR2(1) := 'S';
    BE_PAID_TERM VARCHAR2(1) := 'T';

    BE_PAID_EMPL VARCHAR2(1) := 'E';

    BE_EXECUTING_YES VARCHAR2(1) := 'Y';
    BE_EXECUTING_NO VARCHAR2(1) := 'N';
    BE_EXECUTING_DEL VARCHAR2(1) := 'D';

    AMST_YES VARCHAR2(1) := 'Y';
    AMST_NO VARCHAR2(1) := 'N';

    STATUS_TERM varchar2(16) := 'TERM';
    STATUS_CURR varchar2(16) := 'CURR';

    COMP_CODE_MMXIII_CV00 VARCHAR2(16) := 'CV00';
    COMP_CODE_MMXIII_CV01 VARCHAR2(16) := 'CV01';
    COMP_CODE_MMXIII_CV02 VARCHAR2(16) := 'CV02';
    COMP_CODE_MMXIII_CV03 VARCHAR2(16) := 'CV03';
    COMP_CODE_MMXIII_CV04 VARCHAR2(16) := 'CV04';
    COMP_CODE_MMXIII_CV05 VARCHAR2(16) := 'CV05';

    MMXIII_COMP_OUSL VARCHAR2(16) := 'MMXIII_COMP_OUSL';
    MMXIII_COMP_OUCL VARCHAR2(16) := 'MMXIII_COMP_OUCL';
    MMXIII_COMP_NAGM VARCHAR2(16) := 'MMXIII_COMP_NAGM';
    MMXIII_COMP_AGEM VARCHAR2(16) := 'MMXIII_COMP_AGEM';
    MMXIII_COMP_AGQR VARCHAR2(16) := 'MMXIII_COMP_AGQR';
    MMXIII_COMP_AGFA VARCHAR2(16) := 'MMXIII_COMP_AGFA';
    MMXIII_COMP_AGIN VARCHAR2(16) := 'MMXIII_COMP_AGIN';
    MMXIII_COMP_MNBS VARCHAR2(16) := 'MMXIII_COMP_MNBS';
    MMXIII_COMP_MNQR VARCHAR2(16) := 'MMXIII_COMP_MNQR';
    MMXIII_COMP_MNNU VARCHAR2(16) := 'MMXIII_COMP_MNNU';
    MMXIII_COMP_MNNA VARCHAR2(16) := 'MMXIII_COMP_MNNA';
    MMXIII_COMP_MNEA VARCHAR2(16) := 'MMXIII_COMP_MNEA';
    MMXIII_COMP_MNEA_AM VARCHAR2(32) := 'MMXIII_COMP_MNEA_AM';
    MMXIII_COMP_MNPU VARCHAR2(32) := 'MMXIII_COMP_MNPU';


    MMXIII_COMP_MNNU_MMXII VARCHAR2(64) := 'MMXIII_COMP_MNNU_MMXII';

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

    MMXIII_PROM_PUMP VARCHAR2(16) := 'MMXIII_PROM_PUMP';

    COMP_DATE_MMXII_BEGN date := to_date('1-jan-2012');

    COMP_DATE_MMXIII_BEGN date := to_date('1-jan-2013');
    COMP_DATE_MMXIII_END date := to_date('31-dec-2013');

    --Dai ly phai duoc tuyen tu ngay nay den ngay nay thi moi duoc tinh vao
    COMP_DATE_AGIN_BEGN date := to_date('16-dec-2012');
    COMP_DATE_AGIN_END date := to_date('15-dec-2013');

    --Cac giao dich IP keo dai tu 16/12/2012 cho den 16/3/2014 de tinh giao dich IP cho no dung
    COMP_DATE_AGIN_TRANS_BEGN date := to_date('16-dec-2012');
    COMP_DATE_AGIN_TRANS_END date := add_months(to_date('16-mar-2014'), 3);--CHU Y:DAY PHAI LA NAM 2014 day nhe KHONG LA SAI DAY NHE

    --AnhNH add: Tinh cac dai ly dc tuyen dung tu ngay 16/12/2012
    COMP_DATE_AGQR_BEGN date := to_date('16-dec-2012');

    /*End chinh sua lai de kiem tra o cho nay*/

    RECORD_MAX_DELETE number(10) := 50000;

    DATE_MAX_VALUE date := to_date('31-dec-9999');
    DATE_MIN_VALUE date := to_date('1-jan-1900');


    SYSTEM_USER varchar2(16) := 'SYSTEM';
    THEME_LANGUAGE VARCHAR2(16) := 'VN';



    OUTLET_INFO_TYPE_POSI VARCHAR2(16) := 'POSI';

    OBJECT_STATUS_ACTIVE VARCHAR2(16) := 'ACTI';
    OBJECT_STATUS_INACTIVE VARCHAR2(16) := 'INAT';
    OBJECT_STATUS_FREEZE VARCHAR2(16) := 'FRZE';

    procedure main(valRecordDate date := null,
        valCompanyID number := null);
    procedure mmxiii_modl_prepare(valRecordDate date := null,
        valCompanyID number := null);


    /* ACTION*/
    procedure mmxiii_modl_run(valRecordDate date := null,
        valCompanyID number := null);

    /* Trich xuat du lieu dai ly*/
    procedure mmxiii_modl_exp(valRecordDate date := null,
        valCompanyID number := null);
    procedure mmxiii_modl_exp_clr(valRecordDate date := null,
        valCompanyID number := null);
    procedure mmxiii_modl_exp_curr(valRecordDate date := null,
        valCompanyID number := null);
    procedure mmxiii_modl_exp_term(valRecordDate date := null,
        valCompanyID number := null);

    /* Tinh toan thu lao*/
    procedure mmxiii_modl_exe(valRecordDate date := null);

    procedure mmxiii_modl_data_prepare(valRecordDate date := null);

    /* Thu lao Hoa hong*/
    procedure mmxiii_modl_ousl(valRecordDate date := null);
    procedure mmxiii_modl_ousl_open(valRecordDate date := null);
    procedure mmxiii_modl_ousl_comp(valRecordDate date := null);
    procedure mmxiii_modl_ousl_close(valRecordDate date := null);

    /* Thu lao thu phi*/
    procedure mmxiii_modl_oucl(valRecordDate date := null);
    procedure mmxiii_modl_oucl_open(valRecordDate date := null);
    procedure mmxiii_modl_oucl_comp(valRecordDate date := null);
    procedure mmxiii_modl_oucl_close(valRecordDate date := null);

    /* Thu lao phat trien kinh doanh theo quy che 2013*/
    procedure mmxiii_modl_mnbs(valRecordDate date := null);
    procedure mmxiii_modl_unit_dev_run(valRecordDate date := null);
    procedure mmxiii_modl_unit_dev_clear(valRecordDate date := null);
    procedure mmxiii_modl_unit_dev(valRecordDate date := null);
    procedure mmxiii_modl_mnbs_open(valRecordDate date := null);
    procedure mmxiii_modl_mnbs_data(valRecordDate date := null);
    procedure mmxiii_modl_mnbs_cond(valRecordDate date := null);
    procedure mmxiii_modl_mnbs_comp(valRecordDate date := null);
    procedure mmxiii_modl_mnbs_close(valRecordDate date := null);

    /* Thu lao phat trien NN dai ly moi nam 2013*/
    procedure mmxiii_modl_nagm(valRecordDate date := null);
    procedure mmxiii_modl_nagm_open(valRecordDate date := null);
    procedure mmxiii_modl_nagm_data(valRecordDate date := null);
    procedure mmxiii_modl_nagm_cond(valRecordDate date := null);
    procedure mmxiii_modl_nagm_comp(valRecordDate date := null);
    procedure mmxiii_modl_nagm_close(valRecordDate date := null);

    /* Thu lao thuong quy theo quy che 2013*/
    procedure mmxiii_modl_agqr(valRecordDate date := null);
    procedure mmxiii_modl_agqr_open(valRecordDate date := null);
    procedure mmxiii_modl_agqr_data(valRecordDate date := null);
    procedure mmxiii_modl_agqr_cond(valRecordDate date := null);
    procedure mmxiii_modl_agqr_comp(valRecordDate date := null);
    procedure mmxiii_modl_agqr_close(valRecordDate date := null);

    /* Thu lao tuyen dung theo quy che 2013*/
    procedure mmxiii_modl_agem(valRecordDate date := null);
    procedure mmxiii_modl_agem_open(valRecordDate date := null);
    procedure mmxiii_modl_agem_data(valRecordDate date := null);
    procedure mmxiii_modl_agem_cond(valRecordDate date := null);
    procedure mmxiii_modl_agem_comp(valRecordDate date := null);
    procedure mmxiii_modl_agem_close(valRecordDate date := null);

    /* Thu lao thuong quy cua truong ban truong nhom theo quy che 2013*/
    procedure mmxiii_modl_mnqr(valRecordDate date := null);
    procedure mmxiii_modl_mnqr_open(valRecordDate date := null);
    procedure mmxiii_modl_mnqr_data(valRecordDate date := null);
    procedure mmxiii_modl_mnqr_cond(valRecordDate date := null);
    procedure mmxiii_modl_mnqr_comp(valRecordDate date := null);
    procedure mmxiii_modl_mnqr_close(valRecordDate date := null);

    /* Thuong quan ly hoat dong hieu qua theo quy che 2013*/
    procedure mmxiii_modl_mnea(valRecordDate date := null);
    procedure mmxiii_modl_mnea_prepare(valRecordDate date := null);
    --procedure mmxiii_modl_mnea_init(valRecordDate date := null);
    procedure mmxiii_modl_mnea_open(valRecordDate date := null);
    procedure mmxiii_modl_mnea_data(valRecordDate date := null);
    procedure mmxiii_modl_mnea_cond(valRecordDate date := null);
    procedure mmxiii_modl_mnea_comp(valRecordDate date := null);
    procedure mmxiii_modl_mnea_close(valRecordDate date := null);

    /* Thuong quan ly hoat dong hieu qua cho truong ban theo quy che 2013*/
    procedure mmxiii_modl_mnea_am(valRecordDate date := null);
    procedure mmxiii_modl_mnea_am_open(valRecordDate date := null);
    procedure mmxiii_modl_mnea_am_data(valRecordDate date := null);
    procedure mmxiii_modl_mnea_am_cond(valRecordDate date := null);
    procedure mmxiii_modl_mnea_am_comp(valRecordDate date := null);
    procedure mmxiii_modl_mnea_am_close(valRecordDate date := null);

    /* Thu lao gioi thieu dai ly moi theo quy che 2013*/
    procedure mmxiii_modl_agin(valRecordDate date := null);
    procedure mmxiii_modl_agin_open(valRecordDate date := null);
    procedure mmxiii_modl_agin_data(valRecordDate date := null);
    procedure mmxiii_modl_agin_comp(valRecordDate date := null);
    procedure mmxiii_modl_agin_close(valRecordDate date := null);

    /* Thu lao phat trien nhom moi theo quy che 2013*/
    procedure mmxiii_modl_mnnu(valRecordDate date := null);
    procedure mmxiii_modl_mnnu_open(valRecordDate date := null);
    procedure mmxiii_modl_mnnu_data(valRecordDate date := null);
    procedure mmxiii_modl_mnnu_cond(valRecordDate date := null);
    procedure mmxiii_modl_mnnu_comp(valRecordDate date := null);
    procedure mmxiii_modl_mnnu_close(valRecordDate date := null);

    /* Thu lao phat trien ban moi theo quy che 2013*/
    procedure mmxiii_modl_mnna(valRecordDate date := null);
    procedure mmxiii_modl_mnna_open(valRecordDate date := null);
    procedure mmxiii_modl_mnna_data(valRecordDate date := null);
    procedure mmxiii_modl_mnna_cond(valRecordDate date := null);
    procedure mmxiii_modl_mnna_comp(valRecordDate date := null);
    procedure mmxiii_modl_mnna_close(valRecordDate date := null);

    /* Thu lao phat trien nhom moi theo quy che 2012 va quy che 2011*/
    procedure mmxiii_modl_mnnu_mmxii(valRecordDate date := null);
    procedure mmxiii_modl_mnnu_mmxii_open(valRecordDate date := null);
    procedure mmxiii_modl_mnnu_mmxii_data(valRecordDate date := null);
    procedure mmxiii_modl_mnnu_mmxii_cond(valRecordDate date := null);
    procedure mmxiii_modl_mnnu_mmxii_comp(valRecordDate date := null);
    procedure mmxiii_modl_mnnu_mmxii_close(valRecordDate date := null);

    /* Thu lao Vinh danh tan nghiep theo quy che 2013*/
    procedure mmxiii_modl_mnpu(valRecordDate date := null);
    procedure mmxiii_modl_mnpu_open(valRecordDate date := null);
    procedure mmxiii_modl_mnpu_data(valRecordDate date := null);
    procedure mmxiii_modl_mnpu_cond(valRecordDate date := null);
    procedure mmxiii_modl_mnpu_cert(valRecordDate date := null);
    procedure mmxiii_modl_mnpu_comp(valRecordDate date := null);
    procedure mmxiii_modl_mnpu_close(valRecordDate date := null);

    /* Thu lao hoat dong deu theo quy che 2013*/
    procedure mmxiii_modl_agfa(valRecordDate date := null);
    procedure mmxiii_modl_agfa_open(valRecordDate date := null);
    procedure mmxiii_modl_agfa_data(valRecordDate date := null);
    procedure mmxiii_modl_agfa_cond(valRecordDate date := null);
    procedure mmxiii_modl_agfa_comp(valRecordDate date := null);
    procedure mmxiii_modl_agfa_close(valRecordDate date := null);

    -----------------------------------------------------------------
    /* Thu lao 2012 KHONG CHAY thu lao thuong nhom moi 2012 o day do da tinh o tren roi
    Khong la se bi sai o phia tren*/
    -----------------------------------------------------------------
    /* Thu lao phat trien nhom moi nam 2011 va 2012  vat sang nam 2013*/
    procedure mmxii_modl_mnnu(valRecordDate date := null);
    /* Thu lao phat trien nghe nghiep theo quy che 2012 vat sang nam 2013*/
    procedure mmxii_modl_nagm(valRecordDate date := null);
    /* Thu lao phat trien ban moi theo quy che 2012 vat sang nam 2013*/
    procedure mmxii_modl_mnna(valRecordDate date := null);

    /* Tong thu lao*/
    procedure mmxiii_modl_comp(valRecordDate date := null);
    procedure mmxiii_modl_close(valRecordDate date := null);
    procedure mmxiii_modl_data_complete(valRecordDate date := null);

    procedure mmxiii_modl_backup(valRecordDate date := null);

end AMS_MODL_COMP_MMXIII;
/
create or replace package body ams.AMS_MODL_COMP_MMXIII is
    /*chinhlk 22/01/2013 sua thu lao PTKD nam 2013 lam theo tai lieu phan tich moi anh Tuan doi voi thu lao PTKD
                  Co tinh FYP cua dai ly nghi viec trong thang va KHONG tinh FYC
                  cua dai ly nghi viec trong thang
      chinhlk 20/2/2013 sua lai thu lao phat trien nhom moi theo quy che 2012 va quy che 2011 vat sang nam 2013
                  Do thiet ke sai va them bang vao nen bay gio se sua bang cach dung cac bang cu cua quy che 2012
                  roi sau do merge du lieu len bang chinh
      chinhlk 21/2/2013 sua lai voi thuong PTNN do ben BVNT confirm ve khau tru khi nhan dc 2 trieu
      chinhlk 21/2/2013 sua lai thu lao PT Nhom moi nam 2012  them group by de de phong loi du lieu o day neu 1 nhom co 2 truong nhom
    */
    procedure main(valRecordDate date := null,
        valCompanyID number := null)
    is
        var_run_from_time date := sysdate;
        var_run_to_time date := sysdate;
    begin
        var_run_from_time := sysdate;

        --chinhlk rao lai doan nay theo y cua Hung Anh...
        /*for i in 0..4
        loop
            AMS_MODL_COMP_MMXIII.mmxiii_modl_prepare(add_months(trunc(valRecordDate, 'MM'), -i), valCompanyID);
        end loop;*/

        AMS_MODL_COMP_MMXIII.mmxiii_modl_run(valRecordDate, valCompanyID);

        var_run_to_time := sysdate;
        ams.life_agency_log.time_log(1000, 'Thoi gian chay thu lao nam  2013 thang ' || to_char(valRecordDate, 'dd/mm/yyyy')  || ' cua cong ty: ' || to_char(valCompanyID), var_run_from_time, var_run_to_time);
    end;
    procedure mmxiii_modl_prepare(valRecordDate date := null,
        valCompanyID number := null)
    is
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Xoa du lieu dai ly*/
        loop
            delete ams.inp_data_outlet del
            where del.record_date = trunc(valRecordDate, 'MM')
                and del.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                --and del.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                and
                (
                    del.company_id = nvl(valCompanyID, 0)
                    or
                    nvl(valCompanyID, 0) = 0
                )
                and rownum < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_prepare', 'Xoa du lieu dai ly bang inp_data_outlet thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /*Do so lieu moi vao bang  ams.inp_data_outlet tu bang serv_outlet_data */
        insert into  /*+ APPEND */  ams.inp_data_outlet nologging
        select  /*+ CARDINALITY(tmp, 100)*/
            tmp.outlet_id,
            tmp.type_code,
            tmp.record_date,
            tmp.version_date,
            tmp.status_code,
            tmp.outlet_ams_id,
            tmp.outlet_name,
            tmp.position_code,
            tmp.position_date,
            tmp.effective_date,
            tmp.terminative_date,
            tmp.company_id,
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
            tmp.period_comm,
            tmp.period_fyc,
            tmp.period_fyp,
            tmp.period_afis,
            tmp.period_afif,
            tmp.period_coll_etmt,
            tmp.period_coll_real,
            tmp.period_coll_rate,
            tmp.period_issue,
            null,
            null,
            null,
            null,
            null,
            null,
            null,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.serv_outlet_data tmp
        where tmp.record_date = trunc(valRecordDate, 'MM')
            and tmp.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
            and tmp.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
            and
            (
                tmp.company_id = nvl(valCompanyID, 0)
                or
                nvl(valCompanyID, 0) = 0
            );
        commit;


        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_prepare', 'Do du lieu dai ly bang inp_data_outlet thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    end;

    procedure mmxiii_modl_run(valRecordDate date := null,
        valCompanyID number := null)
    is
        var_run_from_time date := sysdate;
        var_run_to_time date := sysdate;
    begin
        AMS_MODL_COMP_MMXIII.mmxiii_modl_exp(valRecordDate, valCompanyID);
        AMS_MODL_COMP_MMXIII.mmxiii_modl_exe(valRecordDate);

        /*Back up du lieu da chay*/
       AMS_MODL_COMP_MMXIII.mmxiii_modl_backup(valRecordDate);

        var_run_to_time := sysdate;
        ams.life_agency_log.time_log(1000, 'Thoi gian chay thu lao nam  2013 thang ' || to_char(valRecordDate, 'dd/mm/yyyy')  || ' cua cong ty: ' || to_char(valCompanyID), var_run_from_time, var_run_to_time);
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_run: loi thu tuc chay thu lao 2013' || to_char(valRecordDate, 'dd/mm/yyyy'),
                sqlerrm,
                sqlcode);

    end;

    procedure mmxiii_modl_exp(valRecordDate date := null,
        valCompanyID number := null)
    is
    begin
        AMS_MODL_COMP_MMXIII.mmxiii_modl_exp_clr(valRecordDate, valCompanyID);
        AMS_MODL_COMP_MMXIII.mmxiii_modl_exp_curr(valRecordDate, valCompanyID);
        AMS_MODL_COMP_MMXIII.mmxiii_modl_exp_term(valRecordDate, valCompanyID);
    end;

    procedure mmxiii_modl_exp_clr(valRecordDate date := null,
        valCompanyID number := null)
    is
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Xoa du lieu dai ly o bang co thu lao la_compensation_mmxiii la bang chinh di*/
        loop
            delete ams.la_compensation_mmxiii del
            where del.record_date = trunc(valRecordDate, 'MM')
                and
                (
                    del.info_company_id = nvl(valCompanyID, 0)
                    or
                    nvl(valCompanyID, 0) = 0
                )
                and rownum < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_exp_clr', 'Xoa du lieu dai ly o bang chinh la_compensation_mmxiii thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /*truncate du lieu o bang la_compensation_mmxiii_tmp
        roi sau do se do du lieu vao bang la_compensation_mmxiii_tmp
        roi do tu bang la_compensation_mmxiii_tmp vao bang chinh la_compensation_mmxiii
        sau cung*/
        execute immediate 'truncate table ams.la_compensation_mmxiii_tmp';
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_exp_clr', 'truncate la_compensation_mmxiii_tmp thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        dbms_stats.gather_table_stats(null, 'la_compensation_mmxiii_tmp', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_exp_clr', 'gather_table_stats table ams.la_compensation_mmxiii_tmp thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    end;

    procedure mmxiii_modl_exp_curr(valRecordDate date := null,
        valCompanyID number := null)
    is
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Xoa du lieu dai ly*/
        loop
            delete ams.la_compensation_mmxiii del
            where del.record_date = trunc(valRecordDate, 'MM')
                and del.status_code = AMS_MODL_COMP_MMXIII.STATUS_CURR
                and
                (
                    del.info_company_id = nvl(valCompanyID, 0)
                    or
                    nvl(valCompanyID, 0) = 0
                )
                and rownum < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_exp_curr', 'Xoa du lieu dai ly thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* Len danh sach du lieu dai ly dang hoat dong dua vao bang la_compensation_mmxiii_tmp*/
        insert /*+ APPEND */ into ams.la_compensation_mmxiii_tmp nologging(
            outlet_id,
            outlet_ams_id,
            record_date,
            version_date,
            status_code,
            info_outlet_name,
            info_company_id,
            info_company_ams_id,
            info_company_name,
            info_office_id,
            info_office_ams_id,
            info_office_name,
            info_agency_id,
            info_agency_ams_id,
            info_agency_name,
            info_unit_id,
            info_unit_ams_id,
            info_unit_name,
            info_position_code,
            info_position_date,
            info_effective_date,
            info_terminative_date,
            info_senr_by_months,
            be_paid,
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
            AMS_MODL_COMP_MMXIII.STATUS_CURR,
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
            months_between(add_months(trunc(valRecordDate, 'MM'), 1), outl.effective_date),
            AMS_MODL_COMP_MMXIII.BE_PAID_YES,
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.inp_data_outlet outl
        where outl.record_date = trunc(valRecordDate, 'MM')
            and outl.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
            and outl.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
            and
            (
                outl.company_id = nvl(valCompanyID, 0)
                or
                nvl(valCompanyID, 0) = 0
            )
            and outl.terminative_date is null;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_exp_curr', ' Len danh sach du lieu dai ly dang hoat dong thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    end;

    procedure mmxiii_modl_exp_term(valRecordDate date := null,
        valCompanyID number := null)
    is
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Xoa du lieu dai ly*/
        loop
            delete ams.la_compensation_mmxiii del
            where del.record_date = trunc(valRecordDate, 'MM')
                and del.status_code = AMS_MODL_COMP_MMXIII.STATUS_TERM
                and
                (
                    del.info_company_id = nvl(valCompanyID, 0)
                    or
                    nvl(valCompanyID, 0) = 0
                )
                and rownum < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_exp_term', 'Xoa du lieu dai ly thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* Len danh sach du lieu dai ly dang hoat dong vao bang la_compensation_mmxiii_tmp*/
        insert /*+ APPEND */ into ams.la_compensation_mmxiii_tmp nologging(
            outlet_id,
            outlet_ams_id,
            record_date,
            version_date,
            status_code,
            info_outlet_name,
            info_company_id,
            info_company_ams_id,
            info_company_name,
            info_office_id,
            info_office_ams_id,
            info_office_name,
            info_agency_id,
            info_agency_ams_id,
            info_agency_name,
            info_unit_id,
            info_unit_ams_id,
            info_unit_name,
            info_effective_date,
            info_terminative_date,
            info_senr_by_months,
            be_paid,
            be_executing,
            create_user,
            update_user,
            create_datetime,
            update_datetime)
        select  /*+ CARDINALITY(outl, 100)*/
            outl.outlet_id,
            outl.outlet_ams_id,
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            AMS_MODL_COMP_MMXIII.STATUS_TERM,
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
            outl.effective_date,
            outl.terminative_date,
            months_between(add_months(trunc(valRecordDate, 'MM'), 1), outl.effective_date),
            AMS_MODL_COMP_MMXIII.BE_PAID_YES,
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.inp_data_outlet outl
        where outl.record_date = trunc(valRecordDate, 'MM')
            and outl.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
            and outl.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
            and
            (
                outl.company_id = nvl(valCompanyID, 0)
                or
                nvl(valCompanyID, 0) = 0
            )
            and outl.terminative_date is not null
            and outl.terminative_date
                between trunc(valRecordDate, 'MM')
                and (add_months(trunc(valRecordDate, 'MM'), 1) - 1);
        commit;

        dbms_stats.gather_table_stats(null, 'la_compensation_mmxiii_tmp', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_exp_term', 'Len danh sach du lieu dai ly dang hoat dong thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    end;

    procedure mmxiii_modl_exe(valRecordDate date := null)
    is
    begin
        /*Khoi dong qua trinh tinh toan thu lao*/
        AMS_MODL_COMP_MMXIII.mmxiii_modl_data_prepare(valRecordDate);

       /* --Thu lao theo quy che 2013*/
        AMS_MODL_COMP_MMXIII.mmxiii_modl_ousl(valRecordDate);
        AMS_MODL_COMP_MMXIII.mmxiii_modl_oucl(valRecordDate);
        AMS_MODL_COMP_MMXIII.mmxiii_modl_mnbs(valRecordDate);

        /*Thu lao phat trien nghe nghiep nam 2013*/
        AMS_MODL_COMP_MMXIII.mmxiii_modl_nagm(valRecordDate);

        /* Thu lao thuong phat trien nhom moi theo quy che nam 2011 va 2012 tinh toan truc tiep vao day */
        AMS_MODL_COMP_MMXIII.mmxiii_modl_mnnu_mmxii(valRecordDate);

        /* Thu lao theo quy che 2012: Merge so lieu vao bang chinh sau khi da tinh cho cac bang con
        o day la chinh xac so lieu roi*/
        AMS_MODL_COMP_MMXIII.mmxii_modl_nagm(valRecordDate);
        AMS_MODL_COMP_MMXIII.mmxii_modl_mnnu(valRecordDate);
        AMS_MODL_COMP_MMXIII.mmxii_modl_mnna(valRecordDate);


        AMS_MODL_COMP_MMXIII.mmxiii_modl_agqr(valRecordDate);
        AMS_MODL_COMP_MMXIII.mmxiii_modl_agem(valRecordDate);
        AMS_MODL_COMP_MMXIII.mmxiii_modl_mnqr(valRecordDate);

        AMS_MODL_COMP_MMXIII.mmxiii_modl_mnnu(valRecordDate);
        AMS_MODL_COMP_MMXIII.mmxiii_modl_mnna(valRecordDate);

        --Thuong QL HD HQ truong nhom 2013
        AMS_MODL_COMP_MMXIII.mmxiii_modl_mnea(valRecordDate);
        --Thuong QL HD HQ truong ban 2013
        AMS_MODL_COMP_MMXIII.mmxiii_modl_mnea_am(valRecordDate);
        --Thuong gioi thieu DL moi 2013
        AMS_MODL_COMP_MMXIII.mmxiii_modl_agin(valRecordDate);
        --Thuong hoat dong deu
        AMS_MODL_COMP_MMXIII.mmxiii_modl_agfa(valRecordDate);
        --Thuong Vinh danh tan nghiep
        AMS_MODL_COMP_MMXIII.mmxiii_modl_mnpu(valRecordDate);

        /* Tong thu lao hang thang*/
        AMS_MODL_COMP_MMXIII.mmxiii_modl_comp(valRecordDate);
        AMS_MODL_COMP_MMXIII.mmxiii_modl_close(valRecordDate);

        /*Ket thuc qua trinh tinh toan thu lao*/
        AMS_MODL_COMP_MMXIII.mmxiii_modl_data_complete(valRecordDate);

    end;

    /*Khoi dong qua trinh tinh toan thu lao*/
    procedure mmxiii_modl_data_prepare(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
        var_record_date date:= trunc(valRecordDate, 'MM');
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /*Truncate bang bang inp_data_outlet_tmp de do du lieu tu bang inp_data_outlet vao cho bang do*/
        execute immediate 'truncate table ams.inp_data_outlet_tmp';
        commit;

        dbms_stats.gather_table_stats(null, 'inp_data_outlet_tmp', cascade => true);
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_data_prepare', 'truncate inp_data_outlet_tmp');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 4;

        /*Lay du lieu tu bang inp_data_outlet do vao bang inp_data_outlet_tmp 5 thang ke tu thang tinh thu lao tro ve truoc*/
        for i in -7..11
        loop
            /*chi lay du lieu trong vong 1 nam cong them voi du lieu cu da co cua no
            can chay the nay de lay so lieu de tinh IP trong 90 ngay lam viec dau tien trong ca nam cua no*/
            if add_months(trunc(valRecordDate, 'YYYY'), i)
                between add_months(trunc(valRecordDate, 'YYYY'), -7)
                and add_months(trunc(valRecordDate, 'YYYY'), 11)
            then
                insert /*+ APPEND */ into ams.inp_data_outlet_tmp nologging
                select  /*+ CARDINALITY(tmp, 100)*/
                    tmp.*,
                    AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                from ams.inp_data_outlet tmp
                where tmp.record_date = add_months(trunc(valRecordDate, 'YYYY'), i)
                    and tmp.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                    and tmp.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE;
                commit;
            end if;
        end loop;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_data_prepare', 'do vao  12 thang du lieu');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 5;

        dbms_stats.gather_table_stats(null, 'inp_data_outlet_tmp', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_data_prepare', 'gather_table_stats inp_data_outlet_tmp');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 6;

        /*Truncate bang bang la_prom_history_agent_tmp cho bang do*/
        execute immediate 'truncate table ams.la_prom_history_agent_tmp';
        commit;

        dbms_stats.gather_table_stats(null, 'la_prom_history_agent_tmp', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_data_prepare', 'truncate la_prom_history_agent_tmp');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 4;

        /*Lay du lieu tu bang la_history_agent do vao bang la_prom_history_agent_tmp chi tieu tuyen dung*/
        insert /*+ APPEND */ into ams.la_prom_history_agent_tmp nologging
        select /*+ CARDINALITY(lha, 100)*/
            var_record_date,
            lha.agent_id outlet_id,
            max(lha.history_number) empl_id
        from ams.la_history_agent lha
        where lha.type_code = 'DLTD'
            and lha.current_is = 'Y'
        group by lha.agent_id;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_data_prepare', 'do vao  la_prom_history_agent_tmp ');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 5;

        dbms_stats.gather_table_stats(null, 'la_prom_history_agent_tmp', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_data_prepare', 'gather la_prom_history_agent_tmp');

    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_data_prepare: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_ousl(valRecordDate date := null)
    is
    begin
        if (
            AMS_CORE_MODULE.is_active(
                AMS_MODL_COMP_MMXIII.MMXIII_COMP_OUSL,
                trunc(valRecordDate, 'MM')
            ) = AMS_CORE_MODULE.IS_YES
        ) then
            for var_result in (
                select comp_date.compensation_date
                from ams.mod_comp_date comp_date
                where comp_date.module_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_COMP
                    and comp_date.sub_code = AMS_MODL_COMP_MMXIII.MMXIII_COMP_OUSL
                    and comp_date.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                    and comp_date.compensation_date = trunc(valRecordDate, 'MM')
                group by comp_date.compensation_date
            ) loop
                AMS_MODL_COMP_MMXIII.mmxiii_modl_ousl_open(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_ousl_comp(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_ousl_close(valRecordDate);
            end loop;
        end if;
    end;

    procedure mmxiii_modl_ousl_open(valRecordDate date := null)
    is
    begin
        /* Len danh sach Tu van vien duoc tra thu lao hoa hong*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.ousl_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES,
            comp.ousl_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
            comp.ousl_comp_money = 0,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.status_code in
            (
                AMS_MODL_COMP_MMXIII.STATUS_CURR,
                AMS_MODL_COMP_MMXIII.STATUS_TERM
            );
        commit;
    end;

    procedure mmxiii_modl_ousl_comp(valRecordDate date := null)
    is
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        dbms_stats.gather_table_stats(null, 'inp_data_outlet_tmp', cascade => true);
        dbms_stats.gather_table_stats(null, 'la_compensation_mmxiii_tmp', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_ousl_comp', 'gather_table_stats inp_data_outlet_tmp');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* Tinh thu lao hoa hong cho dai ly*/
        merge /*+ CARDINALITY(comp, 100)*/
            into ams.la_compensation_mmxiii_tmp comp
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_ams_id,
                    nvl(data.period_comm, 0) data_value
                from ams.inp_data_outlet_tmp data
                where data.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                    and data.record_date = trunc(valRecordDate, 'MM')
                    and data.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                    and data.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
            ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.ousl_be_executing
            and
            upd.outlet_ams_id = comp.outlet_ams_id
        )
        when matched then
             update
                set
                    comp.ousl_comp_money = upd.data_value,
                    comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    comp.update_datetime = sysdate;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_ousl_comp', 'mmxiii_modl_ousl_comp 1');
    end;

    procedure mmxiii_modl_ousl_close(valRecordDate date := null)
    is
    begin
        /* Ket thuc qua trinh tinh thu lao hoa hong dai ly
           trong bang ams.la_compensation_mmxiii_tmp*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.ousl_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.ousl_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES;
        commit;
    end;

    procedure mmxiii_modl_oucl(valRecordDate date := null)
    is
    begin
        if (
            AMS_CORE_MODULE.is_active(
                AMS_MODL_COMP_MMXIII.MMXIII_COMP_OUCL,
                trunc(valRecordDate, 'MM')
            ) = AMS_CORE_MODULE.IS_YES
        ) then
            for var_result in (
                select comp_date.compensation_date
                from ams.mod_comp_date comp_date
                where comp_date.module_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_COMP
                    and comp_date.sub_code = AMS_MODL_COMP_MMXIII.MMXIII_COMP_OUCL
                    and comp_date.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                    and comp_date.compensation_date = trunc(valRecordDate, 'MM')
                group by comp_date.compensation_date
            ) loop
                AMS_MODL_COMP_MMXIII.mmxiii_modl_oucl_open(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_oucl_comp(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_oucl_close(valRecordDate);
            end loop;
        end if;
    end;

    procedure mmxiii_modl_oucl_open(valRecordDate date := null)
    is
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Len danh sach Tu van vien duoc tra thu lao thu phi*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.oucl_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES,
            comp.oucl_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
            comp.oucl_outl_fixd_money = 0,
            comp.oucl_outl_soft_plus_money = 0,
            comp.oucl_outl_soft_minu_money = 0,
            comp.oucl_mana_fixd_money = 0,
            comp.oucl_mana_soft_money = 0,
            comp.oucl_comp_money = 0,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES;
            /*chinhlk 18/5/2013 lay ca hoa hong chuyen thu cua DL nghi viec vao nua*/
            --and comp.status_code = AMS_MODL_COMP_MMXIII.STATUS_CURR;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_oucl_open', 'mmxiii_modl_oucl_open 1');
    end;

    procedure mmxiii_modl_oucl_comp(valRecordDate date := null)
    is
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Thu lao thu phi: Phan cung*/
        merge /*+ CARDINALITY(comp, 100)*/
            into ams.la_compensation_mmxiii_tmp comp
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.agent_id outlet_id,
                    tmp.collection_value_number data_value
                from ams.la_collection tmp
                where tmp.record_date = trunc(valRecordDate, 'MM')
                    and tmp.collection_code = 'FIXD_MONE'
                    and tmp.group_code = 'FIXD'
                    and tmp.category_code = 'COLL'
                    and tmp.time_frequency = 'MONTHLY'
                    and tmp.type_data = 'OUTL'
            ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.oucl_be_executing
            and
            upd.outlet_id = comp.outlet_id
            )
        when matched then
            update
                set
                    comp.oucl_outl_fixd_money = nvl(upd.data_value, 0),
                    comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    comp.update_datetime = sysdate;
        commit;

        /* Thu lao thu phi: Phan mem [+]*/
        merge /*+ CARDINALITY(comp, 100)*/
            into ams.la_compensation_mmxiii_tmp comp
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.agent_id outlet_id,
                    tmp.collection_value_number data_value
                from ams.la_collection tmp
                where tmp.record_date = trunc(valRecordDate, 'MM')
                    and tmp.collection_code = 'SOFT_MONE'
                    and tmp.group_code = 'SOFT'
                    and tmp.category_code = 'COLL'
                    and tmp.time_frequency = 'MONTHLY'
                    and tmp.type_data = 'OUTL'
            ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.oucl_be_executing
            and
            upd.outlet_id = comp.outlet_id
            )
        when matched then
            update
                set
                    comp.oucl_outl_soft_plus_money = nvl(upd.data_value, 0),
                    comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    comp.update_datetime = sysdate;
        commit;

        /* Thu lao thu phi: Phan mem [-]*/
        merge /*+ CARDINALITY(comp, 100)*/
            into ams.la_compensation_mmxiii_tmp comp
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.agent_id outlet_id,
                    tmp.collection_value_number data_value
                from ams.la_collection tmp
                where tmp.record_date = trunc(valRecordDate, 'MM')
                    and tmp.collection_code = 'MINS_MONE'
                    and tmp.group_code = 'MINS'
                    and tmp.category_code = 'COLL'
                    and tmp.time_frequency = 'MONTHLY'
                    and tmp.type_data = 'OUTL'
            ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.oucl_be_executing
            and
            upd.outlet_id = comp.outlet_id
            )
        when matched then
            update
                set
                    comp.oucl_outl_soft_minu_money = nvl(upd.data_value, 0),
                    comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    comp.update_datetime = sysdate;
        commit;

        /* Thu lao thu phi: Truong nhom phan cung*/
        merge /*+ CARDINALITY(comp, 100)*/
            into ams.la_compensation_mmxiii_tmp comp
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.agent_id outlet_id,
                    tmp.collection_value_number data_value
                from ams.la_collection tmp
                where tmp.record_date = trunc(valRecordDate, 'MM')
                    and tmp.collection_code = 'FIXD_MONE'
                    and tmp.group_code = 'FIXD'
                    and tmp.category_code = 'COLL'
                    and tmp.time_frequency = 'MONTHLY'
                    and tmp.type_data = 'MANA'
            ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.oucl_be_executing
            and
            upd.outlet_id = comp.outlet_id
            )
        when matched then
            update
                set
                    comp.oucl_mana_fixd_money = nvl(upd.data_value, 0),
                    comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    comp.update_datetime = sysdate;
        commit;

        /* Thu lao thu phi: Truong nhom phan mem*/
        merge /*+ CARDINALITY(comp, 100)*/
            into ams.la_compensation_mmxiii_tmp comp
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.agent_id outlet_id,
                    tmp.collection_value_number data_value
                from ams.la_collection tmp
                where tmp.record_date = trunc(valRecordDate, 'MM')
                    and tmp.collection_code = 'SOFT_MONE'
                    and tmp.group_code = 'SOFT'
                    and tmp.category_code = 'COLL'
                    and tmp.time_frequency = 'MONTHLY'
                    and tmp.type_data = 'MANA'
            ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.oucl_be_executing
            and
            upd.outlet_id = comp.outlet_id
            )
        when matched then
            update
                set
                    comp.oucl_mana_soft_money = nvl(upd.data_value, 0),
                    comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    comp.update_datetime = sysdate;
        commit;

        /* Thu lao thu phi*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.oucl_comp_money =
                nvl(comp.oucl_outl_fixd_money, 0) +
                nvl(comp.oucl_outl_soft_plus_money, 0) +
                nvl(comp.oucl_outl_soft_minu_money, 0) +
                nvl(comp.oucl_mana_fixd_money, 0) +
                nvl(comp.oucl_mana_soft_money, 0),
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.oucl_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_oucl_comp', 'mmxiii_modl_oucl_comp da xong');
    end;

    procedure mmxiii_modl_oucl_close(valRecordDate date := null)
    is
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Ket thuc qua trinh tinh thu lao thu phi
           trong bang ams.la_compensation_mmxiii_tmp*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.oucl_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.oucl_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_oucl_close', 'mmxiii_modl_oucl_close da chay xong');
    end;

    procedure mmxiii_modl_mnbs(valRecordDate date := null)
    is
    begin
        if (
            AMS_CORE_MODULE.is_active(
                AMS_MODL_COMP_MMXIII.MMXIII_COMP_MNBS,
                trunc(valRecordDate, 'MM')
            ) = AMS_CORE_MODULE.IS_YES
        ) then
            for var_result in (
                select comp_date.compensation_date
                from ams.mod_comp_date comp_date
                where comp_date.module_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_COMP
                    and comp_date.sub_code = AMS_MODL_COMP_MMXIII.MMXIII_COMP_MNBS
                    and comp_date.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                    and comp_date.compensation_date = trunc(valRecordDate, 'MM')
                group by comp_date.compensation_date
            ) loop
                 --khi chay phat trien kinh doanh can phai chay du lieu nay thi moi dung duoc
                 --chay 1 thang truoc da
                /*Xoa het du lieu truoc khi chay*/
                AMS_MODL_COMP_MMXIII.mmxiii_modl_unit_dev_clear(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_unit_dev(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnbs_open(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnbs_data(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnbs_cond(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnbs_comp(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnbs_close(valRecordDate);
              end loop;
        end if;
    end;

    /*Thuong quy TB TN Can chay lai du lieu phat trien nhom chi tiet trong vong 3 thang tro ve truoc de lay cho dung doi voi
    thuong quy cua truong ban thi moi dung duoc*/
    procedure mmxiii_modl_unit_dev_run(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /*Xoa het du lieu truoc khi chay thi moi ra duoc cau truc ban nhom dung duoc*/
        AMS_MODL_COMP_MMXIII.mmxiii_modl_unit_dev_clear(valRecordDate);
        --chay cho no du lieu phat trien ban nhom trong vong 3 thang luon
        for i in -2..0
        loop
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            if add_months(trunc(valRecordDate,'MM'), i) between trunc(valRecordDate,'YYYY')
                and add_months(trunc(valRecordDate,'YYYY'), 11) then
                AMS_MODL_COMP_MMXIII.mmxiii_modl_unit_dev(add_months(trunc(valRecordDate,'MM'), i));
            end if;
            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'mmxiii_modl_unit_dev_run', 'chay xong 3 thang PT MN thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        end loop;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_unit_dev_run', 'chay xong 3 thang PT MN thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_unit_dev: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_unit_dev_clear(valRecordDate date := null)
    is
    begin
        /* Xoa du lieu chi tiet
        chinhlk 22/5/2013 sua sau khi anh Hoa phat hien loi sai
        xoa het du lieu truoc khi chay*/
        loop
            delete ams.la_comp_mmxiii_unit_dev del
            where rownum < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;
    end;
    /*
        Creater: Le Khac Chinh
        Date Create: 1/2/2013
        Version: 1.0
        Description: Thu tuc xay dung cau truc nhom cha con va chau
        Parameter:
            valRecordDate [date]: Thang chay
        Update:  Le Khac Chinh
            Version: 1.1
            Date Updated: 25/10/2013
            Note:  Fix theo ID: 119666 Xac dinh chinh xac hon cap cua nhom tach ra tu nhom truc tiep cua ban

        Update: Vu Duc Thong
        Version: 1.2
        Date Update: 01/11/2013
        Description: Chinh sua cap cua nhom con, nhom chau...
    */
    procedure mmxiii_modl_unit_dev(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;

        loop_counter   integer;
        highest_number integer;
        p_data_leaf    sys_refcursor;

        v_outlet_id    number(10);
        v_outlet_ams_id    varchar2(16);
        v_outlet_name    nvarchar2(255);
        v_company_id    number(10);
        v_company_ams_id    varchar2(16);
        v_company_name    nvarchar2(255);
        v_office_id    number(10);
        v_office_ams_id    varchar2(16);
        v_office_name    nvarchar2(255);
        v_agency_id    number(10);
        v_agency_ams_id    varchar2(16);
        v_agency_name    nvarchar2(255);
        v_unit_id    number(10);
        v_unit_ams_id    varchar2(16);
        v_unit_name    nvarchar2(255);
        v_effective_date    date;
        v_terminative_date    date;
        v_position_code    varchar2(16);
        v_position_date    date;
        v_umnm_outlet_id    number(10);
        v_umnm_outlet_ams_id    varchar2(16);
        v_umnm_outlet_name    nvarchar2(255);
        v_umnm_unit_id    number(10);
        v_umnm_unit_ams_id    varchar2(16);
        v_umnm_unit_name    nvarchar2(255);
        v_umnm_agency_status    number(1);
        v_umnm_unit_level number(1);
        v_umnm_unit_ratio number(5,2);
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* Xoa du lieu chi tiet*/
        loop
            delete ams.la_comp_mmxiii_unit_dev del
            where rownum < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_unit_dev', 'Xoa du lieu chi tiet thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 1;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_unit_dev', 'xoa du lieu thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 2;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_unit_dev', 'Dau tien phai len danh sach cac nhom cap 1 thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 3;

        /*Lay cac truong nhom tai thoi diem hien tai*/
        insert /*+ APPEND */ into ams.la_comp_mmxiii_unit_dev nologging (
            outlet_ams_id,
            record_date,
            version_date,
            agency_ams_id,
            unit_ams_id,
            position_date,
            umnm_be_paid,
            umnm_be_executing,
            create_user,
            update_user,
            create_datetime,
            update_datetime
        )
        select /*+ CARDINALITY(data, 100)*/
            tmp.outlet_ams_id,
            trunc(valRecordDate, 'MM'),
            cast(trunc(sysdate, 'DD') as date),
            tmp.agency_ams_id,
            tmp.unit_ams_id,
            tmp.position_date,
            AMS_MODL_COMP_MMXIII.BE_PAID_NO,
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.inp_data_outlet_tmp tmp
        where tmp.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
            and tmp.record_date = trunc(valRecordDate, 'MM')
            and tmp.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
            and tmp.position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02
            and tmp.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
            and tmp.position_date
                between trunc(valRecordDate, 'YYYY')
                and last_day(trunc(valRecordDate, 'MM'));
        commit;

        dbms_stats.gather_table_stats(null, 'la_comp_mmxiii_unit_dev', cascade => true);


        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_unit_dev', 'Lay ra danh sach cac NHOM MOI thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 4;

        /* Xet trong vong quay lai 12 thang*/
        for i in 0..11
        loop
            if add_months(trunc(valRecordDate, 'MM'), -i)
                between trunc(valRecordDate, 'YYYY')
                and trunc(valRecordDate, 'MM')
            then
                merge /*+ CARDINALITY(umdv, 100)*/
                    into ams.la_comp_mmxiii_unit_dev umdv
                using
                    (
                        select /*+ CARDINALITY(newu, 100)
                                   CARDINALITY(oldo, 100)
                                   CARDINALITY(oldu, 100) */
                            newu.outlet_ams_id,
                            oldu.unit_ams_id umnp_unit_ams_id
                        from
                        (
                            select /*+ CARDINALITY(umnm, 100)  */
                                umnm.outlet_ams_id,
                                umnm.unit_ams_id
                            from ams.la_comp_mmxiii_unit_dev umnm
                            where umnm.record_date = trunc(valRecordDate, 'MM')
                                and umnm.umnm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                        ) newu
                        join
                        (
                            select /*+ CARDINALITY(data, 100)*/
                                data.record_date,
                                data.outlet_id,
                                data.outlet_ams_id,
                                data.unit_id,
                                data.unit_ams_id
                            from ams.inp_data_outlet_tmp data
                            where data.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                                and data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                                and data.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                                and data.position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV01
                                and data.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                        ) oldo
                            on
                            (
                                oldo.outlet_ams_id = newu.outlet_ams_id
                            )
                        join
                        (
                            select
                                data.outlet_id,
                                data.outlet_ams_id,
                                data.outlet_name,
                                data.unit_id,
                                data.unit_ams_id,
                                data.unit_name
                            from ams.inp_data_outlet_tmp data
                            where data.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                                and data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                                and data.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                                and data.position_code in
                                (
                                    AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02,
                                    AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV03
                                )
                                and data.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                                and data.outlet_ams_id not in
                                    (
                                      select outl.outlet_ams_id
                                      from inp_data_outlet_tmp outl
                                      where outl.record_date = trunc(valRecordDate, 'MM')
                                        and outl.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                                        and outl.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                                        and outl.position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
                                    )
                        ) oldu
                            on
                            (
                                oldu.unit_ams_id = oldo.unit_ams_id
                            )
                        where newu.unit_ams_id <> nvl(oldo.unit_ams_id, '')
                    ) upd
                on (
                    trunc(valRecordDate, 'MM') = umdv.record_date
                    and
                    upd.outlet_ams_id = umdv.outlet_ams_id
                    )
                when matched then
                    update
                        set
                            umdv.umnm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES,
                            umdv.umnm_unit_ams_id = upd.umnp_unit_ams_id,
                            umdv.umnm_agency_status = 0;
                commit;

                merge /*+ CARDINALITY(umdv, 100)*/
                    into ams.la_comp_mmxiii_unit_dev umdv
                using
                    (
                        select /*+ CARDINALITY(newu, 100)
                                   CARDINALITY(oldo, 100)
                                   CARDINALITY(oldu, 100) */
                            newu.outlet_ams_id,
                            oldu.unit_ams_id umnp_unit_ams_id,
                            newu.agency_ams_id
                        from
                        (
                            select /*+ CARDINALITY(umnm, 100)  */
                                umnm.outlet_ams_id,
                                umnm.unit_ams_id,
                                umnm.agency_ams_id
                            from ams.la_comp_mmxiii_unit_dev umnm
                            where umnm.record_date = trunc(valRecordDate, 'MM')
                                and umnm.umnm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                                and umnm.umnm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_NO
                        ) newu
                        join
                        (
                            select /*+ CARDINALITY(data, 100)*/
                                data.record_date,
                                data.outlet_id,
                                data.outlet_ams_id,
                                data.unit_id,
                                data.unit_ams_id
                            from ams.inp_data_outlet_tmp data
                            where data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                                and data.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                                and data.position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV01
                                and data.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                        ) oldo
                            on
                            (
                                oldo.outlet_ams_id = newu.outlet_ams_id
                            )
                        join
                        (
                            select
                                data.outlet_id,
                                data.outlet_ams_id,
                                data.outlet_name,
                                data.unit_id,
                                data.unit_ams_id,
                                data.unit_name
                            from ams.inp_data_outlet_tmp data
                            where data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                                and data.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                                and data.position_code in
                                (
                                    AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02,
                                    AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV03
                                )
                                and data.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                                and data.outlet_ams_id in
                                    (
                                      select outl.outlet_ams_id
                                      from inp_data_outlet_tmp outl
                                      where outl.record_date = trunc(valRecordDate, 'MM')
                                        and outl.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                                        and outl.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                                        and outl.position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
                                    )
                        ) oldu
                            on
                            (
                                oldu.unit_ams_id = oldo.unit_ams_id
                            )
                        where newu.unit_ams_id <> nvl(oldo.unit_ams_id, '')
                    ) upd
                on (
                    trunc(valRecordDate, 'MM') = umdv.record_date
                    and
                    upd.outlet_ams_id = umdv.outlet_ams_id
                    )
                when matched then
                    update
                        set
                            umdv.umnm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES,
                            umdv.umnm_unit_ams_id = upd.agency_ams_id,
                            umdv.umnm_agency_status = 1;
                commit;

                merge /*+ CARDINALITY(umdv, 100)*/
                    into ams.la_comp_mmxiii_unit_dev umdv
                using
                    (
                        select /*+ CARDINALITY(newu, 100)
                                   CARDINALITY(oldo, 100)
                                   CARDINALITY(oldu, 100) */
                            newu.outlet_ams_id,
                            old_agency.agency_ams_id umnp_unit_ams_id
                        from
                        (
                            select /*+ CARDINALITY(umnm, 100)  */
                                umnm.outlet_ams_id,
                                umnm.unit_ams_id
                            from ams.la_comp_mmxiii_unit_dev umnm
                            where umnm.record_date = trunc(valRecordDate, 'MM')
                                and umnm.umnm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                                and umnm.umnm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_NO
                        ) newu
                        join
                        (
                            select /*+ CARDINALITY(data, 100)*/
                                data.record_date,
                                data.outlet_id,
                                data.outlet_ams_id,
                                data.unit_id,
                                data.unit_ams_id,
                                data.agency_id,
                                data.agency_ams_id
                            from ams.inp_data_outlet_tmp data
                            where data.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                                and data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                                and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                                and data.position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV01
                                and data.status_code = AMS_MODL_PROM_MMXIII.OBJECT_STATUS_ACTIVE
                        ) oldo
                            on
                            (
                                oldo.outlet_ams_id = newu.outlet_ams_id
                            )
                        join
                        (
                            select
                                data.outlet_id,
                                data.outlet_ams_id,
                                data.outlet_name,
                                data.unit_id,
                                data.unit_ams_id,
                                data.agency_id,
                                data.agency_ams_id,
                                data.agency_name
                            from ams.inp_data_outlet_tmp data
                            where data.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                                and data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                                and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                                and data.position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
                                and data.status_code = AMS_MODL_PROM_MMXIII.OBJECT_STATUS_ACTIVE
                                and data.unit_ams_id is null
                                and data.agency_ams_id is not null
                        ) old_agency
                            on
                            (
                                old_agency.agency_ams_id = oldo.agency_ams_id
                            )
                        left join
                        (
                            select
                                data.outlet_id,
                                data.outlet_ams_id,
                                data.unit_id,
                                data.unit_ams_id,
                                data.unit_name
                            from ams.inp_data_outlet_tmp data
                            where data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                                and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                                and data.position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02
                                and data.status_code = AMS_MODL_PROM_MMXIII.OBJECT_STATUS_ACTIVE
                        ) oldu
                            on
                            (
                                oldu.unit_ams_id = oldo.unit_ams_id
                            )
                        where oldo.unit_ams_id is null
                    ) upd
                on (
                    trunc(valRecordDate, 'MM') = umdv.record_date
                    and
                    upd.outlet_ams_id = umdv.outlet_ams_id
                    )
                when matched then
                    update
                        set
                            umdv.umnm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES,
                            umdv.umnm_unit_ams_id = upd.umnp_unit_ams_id,
                            umdv.umnm_agency_status = 1;
                commit;

                merge /*+ CARDINALITY(umdv, 100)*/
                    into ams.la_comp_mmxiii_unit_dev umdv
                using
                    (
                        select /*+ CARDINALITY(newu, 100)
                                   CARDINALITY(oldo, 100)
                                   CARDINALITY(oldu, 100) */
                            newu.outlet_ams_id,
                            oldu.unit_ams_id umnp_unit_ams_id
                        from
                        (
                            select /*+ CARDINALITY(umnm, 100)  */
                                umnm.outlet_ams_id,
                                umnm.unit_ams_id
                            from ams.la_comp_mmxiii_unit_dev umnm
                            where umnm.record_date = trunc(valRecordDate, 'MM')
                                and umnm.umnm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                                and umnm.umnm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_NO
                        ) newu
                        join
                        (
                            select /*+ CARDINALITY(data, 100)*/
                                data.record_date,
                                data.outlet_id,
                                data.outlet_ams_id,
                                data.unit_id,
                                data.unit_ams_id
                            from ams.inp_data_outlet_tmp data
                            where data.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                                and data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                                and data.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                                and data.position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV01
                                and data.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                        ) oldo
                            on
                            (
                                oldo.outlet_ams_id = newu.outlet_ams_id
                            )
                        join
                        (
                            select
                                data.outlet_id,
                                data.outlet_ams_id,
                                data.outlet_name,
                                data.unit_id,
                                data.unit_ams_id,
                                data.unit_name
                            from ams.inp_data_outlet_tmp data
                            where data.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                                and data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                                and data.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                                and data.position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV01
                                and data.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                        ) oldu
                            on
                            (
                                oldu.unit_ams_id = oldo.unit_ams_id
                            and newu.outlet_ams_id = oldu.outlet_ams_id
                            )
                        where newu.unit_ams_id <> nvl(oldo.unit_ams_id, '')
                    ) upd
                on (
                    trunc(valRecordDate, 'MM') = umdv.record_date
                    and
                    upd.outlet_ams_id = umdv.outlet_ams_id
                    )
                when matched then
                    update
                        set
                            umdv.umnm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES,
                            umdv.umnm_unit_ams_id = upd.umnp_unit_ams_id,
                            umdv.umnm_agency_status = 0;
                commit;
            end if;
        end loop;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_unit_dev', 'Xet trong vong quay lai 12 thang thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 5;

        update ams.la_comp_mmxiii_unit_dev umnm
        set umnm.umnm_unit_ams_id = umnm.agency_ams_id
        where umnm.record_date = trunc(valRecordDate, 'MM')
            and umnm.umnm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and umnm.umnm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and umnm.umnm_unit_ams_id is null;
       commit;

       /*Khong xu ly cho truong hop neu khong ducc PAID*/
        update ams.la_comp_mmxiii_unit_dev umnm
        set umnm.umnm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO
        where umnm.record_date = trunc(valRecordDate, 'MM')
            and umnm.umnm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_NO;
       commit;


        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_unit_dev', 'Cap nhat 1Xet trong vong quay lai 12 thang thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 6;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_unit_dev', 'Cap nhat 2 Xet trong vong quay lai 12 thang thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 7;

        insert /*+ APPEND */ into ams.la_comp_mmxiii_unit_dev nologging(
            /*outlet_id,*/
            outlet_ams_id,
            record_date,
            version_date,
            unit_ams_id,
            umnm_be_paid,
            umnm_be_executing,
            create_user,
            update_user,
            create_datetime,
            update_datetime
        )
        select  /*+ CARDINALITY(devu, 100)*/
            null,
            trunc(valRecordDate, 'MM'),
            cast(trunc(sysdate, 'DD') as date),
            devu.unit_ams_id,
            AMS_MODL_COMP_MMXIII.BE_PAID_YES,
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            select  /*+ CARDINALITY(dev, 100)*/
                dev.unit_ams_id
            from
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.umnm_unit_ams_id unit_ams_id
                from ams.la_comp_mmxiii_unit_dev tmp
                where tmp.record_date = trunc(valRecordDate, 'MM')
                    and tmp.umnm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and tmp.umnm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                    and tmp.umnm_agency_status = 0
                    and tmp.unit_ams_id is not null
                group by tmp.umnm_unit_ams_id
                minus
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.unit_ams_id
                from ams.la_comp_mmxiii_unit_dev tmp
                where tmp.record_date = trunc(valRecordDate, 'MM')
                    and tmp.umnm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and tmp.umnm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                    and tmp.umnm_agency_status = 0
                    and tmp.umnm_unit_ams_id is not null
                group by tmp.unit_ams_id
            ) dev
            group by dev.unit_ams_id
        ) devu;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_unit_dev', 'phai them cac nut la nut goc thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 8;

        /* Xoa du lieu chi tiet*/
        loop
            delete ams.la_comp_mmxiii_unit_des_agency del
            where del.record_date = trunc(valRecordDate, 'MM')
                and rownum < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_unit_dev', 'Xoa du lieu chi tiet thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 9;

                    insert /*+ APPEND */ into ams.la_comp_mmxiii_unit_des_agency  nologging(
                        outlet_ams_id,
                        record_date,
                        version_date,
                        unit_ams_id,
                        position_date,
                        umnm_unit_ams_id,
                        umnm_unit_level,
                        umnm_unit_ratio,
                        create_user,
                        update_user,
                        create_datetime,
                        update_datetime
                    )
                    select /*+ CARDINALITY(tmp, 100)*/
            max(tmp.outlet_ams_id),
                        trunc(valRecordDate, 'MM'),
                        cast(trunc(sysdate, 'DD') as date),
                        tmp.unit_ams_id,
            max(tmp.position_date),
            max(tmp.umnm_unit_ams_id),
            max(level) as umnm_unit_level,
            decode(max(level),
                            0, 100,
                100 / (max(level)) ) as umnm_unit_ratio,
                        AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                        AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                        sysdate,
                        sysdate
                    from ams.la_comp_mmxiii_unit_dev tmp
                    where tmp.record_date = trunc(valRecordDate, 'MM')
                        and tmp.umnm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                        and tmp.umnm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
        group by tmp.unit_ams_id
                    connect by nocycle prior tmp.unit_ams_id = tmp.umnm_unit_ams_id;
        commit;


        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_unit_dev', 'Xoa du lieu chi tiet thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 10;

        /* Xoa du lieu chi tiet*/
        loop
            delete ams.la_comp_mmxiii_unit_des_source del
            where del.record_date = trunc(valRecordDate, 'MM')
                and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        insert /*+ APPEND */ into ams.la_comp_mmxiii_unit_des_source  nologging(
          outlet_ams_id,
          record_date,
          version_date,
          company_id,
          company_name,
          agency_id,
          agency_name,
          unit_id,
          unit_ams_id,
          unit_name,
          position_date,
          umnm_unit_ams_id,
          umnm_unit_name,
          umnm_agency_status,
          umnm_unit_level,
          umnm_unit_ratio,
          create_user,
          update_user,
          create_datetime,
          update_datetime
        )
        select /*+ CARDINALITY(tmp, 100)*/
            tmp.outlet_ams_id,
            trunc(valRecordDate, 'MM'),
            cast(trunc(sysdate, 'DD') as date),
            null,
            null,
            null,
            null,
            null,
            tmp.unit_ams_id,
            null,
            tmp.position_date,
            tmp.umnm_unit_ams_id,
            null,
            1,
            tmp.umnm_unit_level,
            tmp.umnm_unit_ratio,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.la_comp_mmxiii_unit_des_agency tmp
        where tmp.record_date = trunc(valRecordDate, 'MM');
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_unit_dev', 'da xong thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_unit_dev: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_mnbs_open(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* Len danh sach Tu van vien tinh thu lao phat trien kinh doanh*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.mnbs_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES,
            comp.mnbs_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
            comp.mnbs_position_code = comp.info_position_code,
            comp.mnbs_branch_id = comp.info_unit_id,
            comp.mnbs_branch_ams_id = comp.info_unit_ams_id,
            comp.mnbs_period_fyp = 0,
            comp.mnbs_period_dire_fyc = 0,
            comp.mnbs_period_dire_fyc_calc = 0,
            comp.mnbs_period_indi_fyc = 0,
            comp.mnbs_period_indi_fyc_calc = 0,
            comp.mnbs_comp_dire_ratio = 0,
            comp.mnbs_comp_indi_ratio = 0,
            comp.mnbs_comp_money_calc = 0,
            comp.mnbs_comp_money = 0,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.status_code = AMS_MODL_COMP_MMXIII.STATUS_CURR
            and comp.info_position_code  = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnbs_open', 'mmxiii_modl_mnbs_open 1');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 1;

        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.mnbs_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES,
            comp.mnbs_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
            comp.mnbs_position_code = comp.info_position_code,
            comp.mnbs_branch_id = comp.info_unit_id,
            comp.mnbs_branch_ams_id = comp.info_unit_ams_id,
            comp.mnbs_period_fyp = 0,
            comp.mnbs_period_dire_fyc = 0,
            comp.mnbs_period_dire_fyc_calc = 0,
            comp.mnbs_period_indi_fyc = 0,
            comp.mnbs_period_indi_fyc_calc = 0,
            comp.mnbs_comp_dire_ratio = 0,
            comp.mnbs_comp_indi_ratio = 0,
            comp.mnbs_comp_money_calc = 0,
            comp.mnbs_comp_money = 0,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.status_code = AMS_MODL_COMP_MMXIII.STATUS_CURR
            and comp.info_position_code  = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV03;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnbs_open', 'mmxiii_modl_mnbs_open 2');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 2;

        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.mnbs_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES,
            comp.mnbs_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
            comp.mnbs_position_code = comp.info_position_code,
            comp.mnbs_branch_id = comp.info_agency_id,
            comp.mnbs_branch_ams_id = comp.info_agency_ams_id,
            comp.mnbs_period_fyp = 0,
            comp.mnbs_period_dire_fyc = 0,
            comp.mnbs_period_dire_fyc_calc = 0,
            comp.mnbs_period_indi_fyc = 0,
            comp.mnbs_period_indi_fyc_calc = 0,
            comp.mnbs_comp_dire_ratio = 0,
            comp.mnbs_comp_indi_ratio = 0,
            comp.mnbs_comp_money_calc = 0,
            comp.mnbs_comp_money = 0,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.status_code = AMS_MODL_COMP_MMXIII.STATUS_CURR
            and comp.info_position_code  = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnbs_open', 'mmxiii_modl_mnbs_open 3');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 3;

        /* Xoa du lieu chi tiet - Cho nay xoa luon het ca thang hay xoa theo cong ty cho tien
        18/1/2012: chinhlk sua code Quynh phan nay khong xoa theo ban nhom ma xoa ca tong cong ty roi chay lai het cho no tien*/
        --dbms_stats.gather_table_stats(null, 'la_comp_mmxiii_mnbs', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnbs_open', 'gather  la_comp_mmxiii_mnbs');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 5;

/*        loop
            delete ams.la_comp_mmxiii_mnbs del
            where del.session_id =  AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                and del.record_date = trunc(valRecordDate, 'MM')
                and rownum < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;*/

        /* Len danh sach du lieu chi tiet can xoa*/
        merge /*+ CARDINALITY(mnbs, 100)*/
            into ams.la_comp_mmxiii_mnbs mnbs
        using
            (   /*chay theo cong ty o cho nay va cap nhat theo cong ty*/
                select /*+ CARDINALITY(comp, 100)*/
                    comp.info_company_id company_id
                from ams.la_compensation_mmxiii_tmp comp
                where comp.record_date = trunc(valRecordDate, 'MM')
                    and comp.mnbs_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and comp.mnbs_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                    and comp.mnbs_branch_ams_id is not null
               group by comp.info_company_id
            ) upd
            on (
                AMS_MODL_COMP_MMXIII.VAR_SESSION_ID = mnbs.session_id
                and
                trunc(valRecordDate, 'MM') = mnbs.record_date
                and
                upd.company_id = mnbs.company_id
            )
        when matched then
            update
                set
                    mnbs.mnbs_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_DEL;
        commit;

        /* Xoa du lieu chi tiet theo cong ty hay toan bo cac cong ty o phia tren*/
        loop
            delete ams.la_comp_mmxiii_mnbs del
            where del.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                and del.record_date = trunc(valRecordDate, 'MM')
                and del.mnbs_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_DEL
                and rownum < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;


        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnbs_open', 'mmxiii_modl_mnbs_open delete het so lieu bang con');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 5;

        /* Chi tiet dai ly*/
        insert /*+ APPEND */ into ams.la_comp_mmxiii_mnbs nologging (
            outlet_id,
            outlet_ams_id,
            record_date,
            version_date,
            company_id,
            company_ams_id,
            company_name,
            agency_id,
            agency_ams_id,
            agency_name,
            unit_id,
            unit_ams_id,
            unit_name,
            outlet_name,
            effective_date,
            terminative_date,
            mnbs_be_paid,
            mnbs_be_executing,
            mnbs_data_date,
            mnbs_position_code,
            mnbs_outlet_id,
            mnbs_outlet_ams_id,
            mnbs_branch_id,
            mnbs_branch_ams_id,
            mnbs_period_fyc,
            mnbs_period_fyp,
            mnbs_period_dire_fyc,
            mnbs_period_dire_fyc_calc,
            mnbs_period_indi_fyc,
            mnbs_period_indi_fyc_calc,
            mnbs_empl_asmt,
            mnbs_fyc_ratio,
            session_id,
            create_user,
            update_user,
            create_datetime,
            update_datetime)
        select /*+ CARDINALITY(outl, 100)*/
            outl.outlet_id,
            outl.outlet_ams_id,
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            outl.company_id,
            outl.company_ams_id,
            outl.company_name,
            outl.agency_id,
            outl.agency_ams_id,
            outl.agency_name,
            outl.unit_id,
            outl.unit_ams_id,
            outl.unit_name,
            outl.outlet_name,
            outl.effective_date,
            outl.terminative_date,
            AMS_MODL_COMP_MMXIII.BE_PAID_YES,
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
            trunc(valRecordDate, 'MM'),
            key.mnbs_position_code,
            key.outlet_id,
            key.outlet_ams_id,
            key.mnbs_branch_id,
            key.mnbs_branch_ams_id,
            0,
            0,
            0,
            0,
            0,
            0,
            AMS_MODL_COMP_MMXIII.AMST_YES,
            0,
            AMS_MODL_COMP_MMXIII.VAR_SESSION_ID,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (   /*chi lay mot cong ty vao neu ma chay mot cong ty thoi*/
            select /*+ CARDINALITY(tmp, 100)*/
                tmp.outlet_id,
                tmp.outlet_ams_id,
                tmp.mnbs_branch_id,
                tmp.mnbs_branch_ams_id,
                tmp.mnbs_position_code
            from ams.la_compensation_mmxiii_tmp tmp
            where tmp.record_date = trunc(valRecordDate, 'MM')
                and tmp.mnbs_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                and tmp.mnbs_be_paid = LIFE_AGENCY_CODE.OUTLET_PAID_YES
                and tmp.mnbs_branch_ams_id is not null
                and tmp.mnbs_position_code in
                (
                    AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02,
                    AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV03
                )
        ) key
        join
        (
            select /*+ CARDINALITY(tmp, 100)*/
                tmp.outlet_id,
                tmp.outlet_ams_id,
                tmp.outlet_name,
                tmp.company_id,
                tmp.company_ams_id,
                tmp.company_name,
                tmp.agency_id,
                tmp.agency_ams_id,
                tmp.agency_name,
                tmp.unit_id,
                tmp.unit_ams_id,
                tmp.unit_name,
                tmp.effective_date,
                tmp.terminative_date,
                tmp.unit_ams_id mnbs_branch_ams_id
            from ams.inp_data_outlet_tmp tmp
            where tmp.session_id =  AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                and tmp.record_date = trunc(valRecordDate, 'MM')
                and tmp.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                and tmp.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                and tmp.unit_ams_id is not null
        ) outl
            on outl.mnbs_branch_ams_id = key.mnbs_branch_ams_id;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnbs_open', 'mmxiii_modl_mnbs_open 6');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 6;

        insert /*+ APPEND */ into ams.la_comp_mmxiii_mnbs nologging (
            outlet_id,
            outlet_ams_id,
            record_date,
            version_date,
            company_id,
            company_ams_id,
            company_name,
            agency_id,
            agency_ams_id,
            agency_name,
            unit_id,
            unit_ams_id,
            unit_name,
            outlet_name,
            effective_date,
            terminative_date,
            mnbs_be_paid,
            mnbs_be_executing,
            mnbs_data_date,
            mnbs_position_code,
            mnbs_outlet_id,
            mnbs_outlet_ams_id,
            mnbs_branch_id,
            mnbs_branch_ams_id,
            mnbs_period_fyc,
            mnbs_period_fyp,
            mnbs_period_dire_fyc,
            mnbs_period_dire_fyc_calc,
            mnbs_period_indi_fyc,
            mnbs_period_indi_fyc_calc,
            mnbs_empl_asmt,
            mnbs_fyc_ratio,
            session_id,
            create_user,
            update_user,
            create_datetime,
            update_datetime)
        select /*+ CARDINALITY(key, 100) CARDINALITY(outl, 100)*/
            outl.outlet_id,
            outl.outlet_ams_id,
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            outl.company_id,
            outl.company_ams_id,
            outl.company_name,
            outl.agency_id,
            outl.agency_ams_id,
            outl.agency_name,
            outl.unit_id,
            outl.unit_ams_id,
            outl.unit_name,
            outl.outlet_name,
            outl.effective_date,
            outl.terminative_date,
            AMS_MODL_COMP_MMXIII.BE_PAID_YES,
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
            trunc(valRecordDate, 'MM'),
            key.mnbs_position_code,
            key.outlet_id,
            key.outlet_ams_id,
            key.mnbs_branch_id,
            key.mnbs_branch_ams_id,
            0,
            0,
            0,
            0,
            0,
            0,
            AMS_MODL_COMP_MMXIII.AMST_YES,
            0,
            AMS_MODL_COMP_MMXIII.VAR_SESSION_ID,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            select /*+ CARDINALITY(tmp, 100)*/
                tmp.outlet_id,
                tmp.outlet_ams_id,
                tmp.mnbs_branch_id,
                tmp.mnbs_branch_ams_id,
                tmp.mnbs_position_code
            from ams.la_compensation_mmxiii_tmp tmp
            where tmp.record_date = trunc(valRecordDate, 'MM')
                and tmp.mnbs_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                and tmp.mnbs_be_paid = LIFE_AGENCY_CODE.OUTLET_PAID_YES
                and tmp.mnbs_branch_ams_id is not null
                and tmp.mnbs_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
        ) key
        join
        (
            select /*+ CARDINALITY(tmp, 100)*/
                tmp.outlet_id,
                tmp.outlet_ams_id,
                tmp.outlet_name,
                tmp.company_id,
                tmp.company_ams_id,
                tmp.company_name,
                tmp.agency_id,
                tmp.agency_ams_id,
                tmp.agency_name,
                tmp.unit_id,
                tmp.unit_ams_id,
                tmp.unit_name,
                tmp.effective_date,
                tmp.terminative_date,
                tmp.agency_ams_id mnbs_branch_ams_id
            from ams.inp_data_outlet_tmp tmp
            where tmp.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                and tmp.record_date = trunc(valRecordDate, 'MM')
                and tmp.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                and tmp.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                and tmp.agency_ams_id is not null
        ) outl
            on outl.mnbs_branch_ams_id = key.mnbs_branch_ams_id;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnbs_open', 'mmxiii_modl_mnbs_open 7');
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_mnbs_open: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_mnbs_data(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Chi tiet du lieu tung thang*/
        merge  /*+ CARDINALITY(mnbs, 100)
                  CARDINALITY(upd, 100)
                  LEADING(mnbs upd) */
            into ams.la_comp_mmxiii_mnbs mnbs
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_ams_id,
                    data.record_date data_date,
                    nvl(data.period_fyc, 0) period_fyc,
                    nvl(data.period_fyp, 0) period_fyp
                from ams.inp_data_outlet_tmp data
                where data.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                    and data.record_date = trunc(valRecordDate, 'MM')
                    and data.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                    and data.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
            ) upd
        on (
            AMS_MODL_COMP_MMXIII.VAR_SESSION_ID = mnbs.session_id
            and
            trunc(valRecordDate, 'MM') = mnbs.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnbs.mnbs_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = mnbs.mnbs_be_paid
            and
            upd.outlet_ams_id = mnbs.outlet_ams_id
        )
        when matched then
            update
                set
                    mnbs.mnbs_period_fyc = upd.period_fyc,
                    mnbs.mnbs_period_fyp = upd.period_fyp,
                    mnbs.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    mnbs.update_datetime = sysdate;
        commit;

        /*chinhlk 22/01/2013 sua them theo tai lieu phan tich moi anh Tuan doi voi thu lao PTKD
        Co tinh FYP cua dai ly nghi viec trong thang va KHONG tinh FYC
        cua dai ly nghi viec trong thang*/
        update ams.la_comp_mmxiii_mnbs mnbs
        set
            mnbs.mnbs_period_fyc = 0,
            mnbs.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            mnbs.update_datetime = sysdate
        where mnbs.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
            and mnbs.record_date = trunc(valRecordDate, 'MM')
            and mnbs.mnbs_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and mnbs.mnbs_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and mnbs.terminative_date is not null; --neu ma nghi viec trong thang thi cho FYC bang 0 luon de khong tinh
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnbs_data', 'mmxiii_modl_mnbs_data 1');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 1;

        /* Cap nhat dai ly khong do ban, nhom truc tiep tuyen*/
        merge  /*+ CARDINALITY(mnbs, 100)
                  CARDINALITY(upd, 100)
                  LEADING(mnbs upd) */
            into ams.la_comp_mmxiii_mnbs mnbs
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.agent_id outlet_id,
                    tmp.branch_id
                from ams.la_employment_relations tmp
                where trunc(valRecordDate, 'MM')  >= tmp.effective_date
                    and trunc(valRecordDate, 'MM') < nvl(tmp.terminative_date, AMS_MODL_COMP_MMXIII.DATE_MAX_VALUE)
                    and tmp.type_relation = 'Y'
                group by tmp.agent_id,
                    tmp.branch_id
            ) upd
        on (
            AMS_MODL_COMP_MMXIII.VAR_SESSION_ID = mnbs.session_id
            and
            trunc(valRecordDate, 'MM') = mnbs.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnbs.mnbs_be_executing
            and
            upd.outlet_id = mnbs.outlet_id
            and
            upd.branch_id = mnbs.mnbs_branch_id
            )
        when matched then
            update
                set
                    mnbs.mnbs_empl_asmt = AMS_MODL_COMP_MMXIII.AMST_NO,
                    mnbs.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    mnbs.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnbs_data', 'mmxiii_modl_mnbs_data 2');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 2;

        update ams.la_comp_mmxiii_mnbs mnbs
        set
            mnbs.mnbs_fyc_ratio = decode(mnbs.mnbs_empl_asmt,
                AMS_MODL_COMP_MMXIII.AMST_NO, 70,
                100),
            mnbs.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            mnbs.update_datetime = sysdate
        where mnbs.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
            and mnbs.record_date = trunc(valRecordDate, 'MM')
            and mnbs.mnbs_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and mnbs.mnbs_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnbs_data', 'mmxiii_modl_mnbs_data 3');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 3;

        /* FYC truc tiep*/
        update ams.la_comp_mmxiii_mnbs mnbs
        set
            mnbs.mnbs_period_dire_fyc = nvl(mnbs.mnbs_period_fyc, 0),
            mnbs.mnbs_period_dire_fyc_calc = nvl(mnbs.mnbs_period_fyc, 0) * nvl(mnbs.mnbs_fyc_ratio, 0) / 100,
            mnbs.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            mnbs.update_datetime = sysdate
        where mnbs.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
            and mnbs.record_date = trunc(valRecordDate, 'MM')
            and mnbs.mnbs_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and mnbs.mnbs_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and mnbs.mnbs_position_code in
            (
                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02,
                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV03
            )
            and mnbs.unit_ams_id = mnbs.mnbs_branch_ams_id;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnbs_data', 'mmxiii_modl_mnbs_data 4');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 4;

        --cap nhat FYC truc tiep
        update ams.la_comp_mmxiii_mnbs mnbs
        set
            mnbs.mnbs_period_dire_fyc = nvl(mnbs.mnbs_period_fyc, 0),
            mnbs.mnbs_period_dire_fyc_calc = nvl(mnbs.mnbs_period_fyc, 0) * nvl(mnbs.mnbs_fyc_ratio, 0) / 100,
            mnbs.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            mnbs.update_datetime = sysdate
        where mnbs.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
            and mnbs.record_date = trunc(valRecordDate, 'MM')
            and mnbs.mnbs_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and mnbs.mnbs_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and mnbs.mnbs_position_code in
            (
                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
            )
            and mnbs.agency_ams_id = mnbs.mnbs_branch_ams_id
            and mnbs.unit_ams_id is null;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnbs_data', 'mmxiii_modl_mnbs_data 5');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 5;

        /* FYC gian tiep*/
        update ams.la_comp_mmxiii_mnbs mnbs
        set
            mnbs.mnbs_period_indi_fyc = nvl(mnbs.mnbs_period_fyc, 0),
            mnbs.mnbs_period_indi_fyc_calc = nvl(mnbs.mnbs_period_fyc, 0) * nvl(mnbs.mnbs_fyc_ratio, 0) / 100,
            --cap nhat theo yeu cau em Van Anh 27/3/2013 la hien thi cap 1 cho cac nhom ma no khong co su thay doi gi ca
            --va ty le thuong la 100% luon o day doi voi cac nhom cap 1 cho no
            --neu no la cap 2 thi se cap nhat lai cho no o phia duoi
            mnbs.mnbs_unit_level = 1,
            mnbs.mnbs_unit_ratio = 100,
            mnbs.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            mnbs.update_datetime = sysdate
        where mnbs.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
            and mnbs.record_date = trunc(valRecordDate, 'MM')
            and mnbs.mnbs_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and mnbs.mnbs_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and mnbs.mnbs_position_code in
            (
                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
            )
            and mnbs.agency_ams_id = mnbs.mnbs_branch_ams_id
            and mnbs.unit_ams_id is not null;
        commit;

        /*Doan code nay chi xu ly duy nhat cho Truong ban voi cac dieu kien chat che nay */
        /*chinhlk 18/3/2013 sua lai khi co cong van moi cua BVNT
        Nhan voi 1/n voi n la cap cua nhom gian tiep
        Lay so lieu tu bang da tong hop san o phia tren la_comp_mmxiii_mnbs cua thang day
        ca thang 12 cua no thi cung da cap nhat duoc dung so lieu roi nen la khong lo o day*/
        merge  /*+ CARDINALITY(mnbs, 100)
                  CARDINALITY(upd, 100)
                  LEADING(mnbs upd) */
            into ams.la_comp_mmxiii_mnbs mnbs
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.unit_ams_id, --o day phai lay theo cai nay thi moi dung duoc
                    --neu lay theo umnm  la sai vi day la nhom co cong da phat trien nhom con ra va tinh he so nhu the la khong dung
                    max(tmp.umnm_unit_level) mnbs_unit_level,
                    max(tmp.umnm_unit_ratio) mnbs_unit_ratio
                from ams.la_comp_mmxiii_unit_des_source tmp
                --lay du lieu trong thang do
                where tmp.record_date = trunc(valRecordDate, 'MM')
                group by tmp.unit_ams_id
            ) upd
        on (
            AMS_MODL_COMP_MMXIII.VAR_SESSION_ID = mnbs.session_id
            and
            trunc(valRecordDate, 'MM') = mnbs.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnbs.mnbs_be_executing
            and
            --chi  xu ly cho no o ma CV04 thoi tuc la o truong ban thoi
            --o day de cho no it so lieu va khong bi sai
            AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04 = mnbs.mnbs_position_code
            --truong ban ban quan ly nhom gian tiep do them vao cac dieu kien nay de khong bi sai cho no
            and
            mnbs.agency_ams_id = mnbs.mnbs_branch_ams_id
            and --chi tinh cho no nhu the
            mnbs.unit_ams_id is not null
            and --bat buoc phai co dieu kien nay thi moi co the tinh duoc dung cho no
            --match theo dieu kien cac nhom nhu the thi moi tinh duoc dung cho no
            upd.unit_ams_id = mnbs.unit_ams_id
            )
        when matched then
            update
                set
                    mnbs.mnbs_unit_level = upd.mnbs_unit_level,
                    mnbs.mnbs_unit_ratio = upd.mnbs_unit_ratio;
        commit;

        /*Cap nhat FYC gian tiep
        cap nhat lai mnbs_period_indi_fyc_calc = nvl(mnbs_period_indi_fyc_calc, 0) * nvl(mnbs.mnbs_level_ratio, 1) neu ma level cua no > 1
        xu ly nhu the nay thi moi dung duoc
        khong dung cot kia nua de xu ly cho no nhanh
        Neu ma khong co mnbs_level va mnbs_level_ratio = null thi se mac dinh cho no = 1
        de de phong bi sai*/
        update ams.la_comp_mmxiii_mnbs mnbs
        set --cap nhat cho truong mnbs_period_indi_fyc_total nay se la truong cuoi cung co the duoc nhan cua no
            mnbs.mnbs_period_indi_fyc_calc = nvl(mnbs_period_indi_fyc_calc, 0) * nvl(mnbs.mnbs_unit_ratio, 1) / 100
         --neu ma khong co cai mnbs_level_ratio thi se phai cho no mac dinh la 1 neu khong thi se bi sai so lieu
         --xu ly rieng cho nhung truong hop ma truong ban co cac nhom gian tiep va tach nhom gian tiep ra
        where mnbs.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
            and mnbs.record_date = trunc(valRecordDate, 'MM')
            and mnbs.mnbs_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and mnbs.mnbs_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and mnbs.mnbs_position_code in
            (
                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
            )
            --truong ban ban quan ly nhom gian tiep
            and mnbs.agency_ams_id = mnbs.mnbs_branch_ams_id
            --day la nhom gian tiep cua truong ban
            and mnbs.unit_ams_id is not null;
        commit;
        /*Het phan xu ly duy nhat cho truong ban theo cong van moi cua ho o day o day*/

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnbs_data', 'mmxiii_modl_mnbs_data 6');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 6;

        /* FYP cac dai ly gian tiep = 0*/
        update ams.la_comp_mmxiii_mnbs mnbs
        set
            mnbs.mnbs_period_fyp = 0,
            mnbs.update_user = ams.AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            mnbs.update_datetime = sysdate
        where mnbs.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
            and mnbs.record_date = trunc(valRecordDate, 'MM')
            and mnbs.mnbs_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and mnbs.mnbs_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and mnbs.mnbs_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
            and mnbs.agency_ams_id = mnbs.mnbs_branch_ams_id
            and mnbs.agency_ams_id is not null
            and mnbs.unit_ams_id is not null;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnbs_data', 'mmxiii_modl_mnbs_data 7');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 7;

        dbms_stats.gather_table_stats(null, 'la_comp_mmxiii_mnbs', cascade => true);

        /* Tong hop so lieu*/
        merge   /*+ CARDINALITY(comp, 100)
                  CARDINALITY(upd, 100)
                  LEADING(comp upd) */
            into ams.la_compensation_mmxiii_tmp comp
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.mnbs_branch_ams_id,
                    sum(nvl(data.mnbs_period_fyp, 0)) mnbs_period_fyp,
                    sum(nvl(data.mnbs_period_dire_fyc, 0)) mnbs_period_dire_fyc,
                    sum(nvl(data.mnbs_period_dire_fyc_calc, 0)) mnbs_period_dire_fyc_calc,
                    sum(nvl(data.mnbs_period_indi_fyc, 0)) mnbs_period_indi_fyc,
                    sum(nvl(data.mnbs_period_indi_fyc_calc, 0)) mnbs_period_indi_fyc_calc
                from ams.la_comp_mmxiii_mnbs data
                where data.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                    and data.record_date = trunc(valRecordDate, 'MM')
                    and data.mnbs_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and data.mnbs_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                    and data.outlet_ams_id <> data.mnbs_outlet_ams_id
                group by data.mnbs_branch_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.mnbs_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = comp.mnbs_be_paid
            and
            upd.mnbs_branch_ams_id = comp.mnbs_branch_ams_id
        )
        when matched then
            update
                set
                    comp.mnbs_period_fyp = upd.mnbs_period_fyp,
                    comp.mnbs_period_dire_fyc = upd.mnbs_period_dire_fyc,
                    comp.mnbs_period_dire_fyc_calc = upd.mnbs_period_dire_fyc_calc,
                    comp.mnbs_period_indi_fyc = upd.mnbs_period_indi_fyc,
                    comp.mnbs_period_indi_fyc_calc = upd.mnbs_period_indi_fyc_calc;
        commit;

        /* Cap nhat diem cho Thu lao PT Kinh doanh*/
        merge   /*+ CARDINALITY(comp, 100)
                  CARDINALITY(upd, 100)
                  LEADING(comp upd) */
            into ams.la_compensation_mmxiii_tmp comp
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.agent_id outlet_id,
                    max(data.manager_point) mnbs_period_point
                from ams.la_monthly_point data
                where data.month = trunc(valRecordDate, 'MM')
                    and data.manager_point is not null
                group by data.agent_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.mnbs_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = comp.mnbs_be_paid
            and
            upd.outlet_id = comp.outlet_id
        )
        when matched then
            update
                set
                    comp.mnbs_period_point = upd.mnbs_period_point;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnbs_data', 'mmxiii_modl_mnbs_data 8');
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_mnbs_data: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_mnbs_cond(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
       --cho nay fix theo yeu cau moi
       --config ty le them vao day, hay la fix cung vao cho no nhanh cung duoc nhe
        /* Tinh ty le huong tren FYC cho truong nhom*/
        merge /*+ CARDINALITY(comp, 100)*/
            into ams.la_compensation_mmxiii_tmp comp
        using
        (   /*tu 250 tr tro len thi duoc 23%*/
            select
                250000000 fyp_from,
                100000000000 fyp_to,
                23 comp_ratio
            from dual
            /*tu 150 tr den < 250 tr thi duoc 19%*/
            union all
            select
                150000000 fyp_from,
                250000000 fyp_to,
                19 comp_ratio
            from dual
            union all
            /*tu 50 tr den < 150 tr  thi duoc 15%*/
            select
                  50000000 fyp_from,
                150000000 fyp_to,
                15 comp_ratio
            from dual
            union all
            /*tu <50 tr thi duoc 12%*/
            select
                -100000000000 fyp_from,
                50000000 fyp_to,
                12 comp_ratio
            from dual
        ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.mnbs_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = comp.mnbs_be_paid
            and
            AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02 = comp.mnbs_position_code
            and/*
            upd.company_id = comp.info_company_id
            and*/
            nvl(comp.mnbs_period_fyp, 0) >= upd.fyp_from
            and
            nvl(comp.mnbs_period_fyp, 0) < upd.fyp_to
        )
        when matched then
            update
                set
                    comp.mnbs_comp_dire_ratio = upd.comp_ratio,
                    comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    comp.update_datetime = sysdate;
        commit;

        /*merge \*+ CARDINALITY(comp, 100)*\
            into ams.la_compensation_mmxiii_tmp comp
        using
        (
            select
                l.branch_id company_id,
                nvl(l.index_from, -100000000000) fyp_from,
                nvl(l.index_to, 100000000000) fyp_to,
                nvl(l.lookup_number, 0) comp_ratio
            from ams.la_index_lookup l
            where l.decisive_date is not null
                and (add_months(trunc(valRecordDate, 'MM'), 1) - 1) >= l.effective_date
                and (add_months(trunc(valRecordDate, 'MM'), 1) - 1) < nvl(l.terminative_date, '1-jan-2099')
                and l.type_of_agency = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02
                and l.index_code = 'FYP'
                and l.group_code = 'BUSS'
                and l.category_code = 'COMP'
            order by l.branch_id,
                l.lookup_number
        ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.mnbs_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = comp.mnbs_be_paid
            and
            AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02 = comp.mnbs_position_code
            and
            upd.company_id = comp.info_company_id
            and
            nvl(comp.mnbs_period_fyp, 0) >= upd.fyp_from
            and
            nvl(comp.mnbs_period_fyp, 0) < upd.fyp_to
        )
        when matched then
            update
                set
                    comp.mnbs_comp_dire_ratio = upd.comp_ratio,
                    comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    comp.update_datetime = sysdate;
        commit;*/
       --cho nay fix  = 10
        /* Tinh ty le huong tren FYC cho truong nhom CNTH*/

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnbs_cond', 'mmxiii_modl_mnbs_cond 1');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 1;

        merge /*+ CARDINALITY(comp, 100)*/
            into ams.la_compensation_mmxiii_tmp comp
        using
            (   /*truong nhom CNTH thi duoc 10%*/
                select 10 comp_ratio
                from dual
            ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.mnbs_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = comp.mnbs_be_paid
            and
            AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV03 = comp.mnbs_position_code
            /*and
            upd.company_id = comp.info_company_id*/
        )
        when matched then
            update
                set
                    comp.mnbs_comp_dire_ratio = upd.comp_ratio,
                    comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    comp.update_datetime = sysdate;
        commit;

/*        merge \*+ CARDINALITY(comp, 100)*\
            into ams.la_compensation_mmxiii_tmp comp
        using
            (
                select
                    l.branch_id company_id,
                    nvl(l.lookup_number, 0) comp_ratio
                from ams.la_index_lookup l
                where l.decisive_date is not null
                    and (add_months(trunc(valRecordDate, 'MM'), 1) - 1) >= l.effective_date
                    and (add_months(trunc(valRecordDate, 'MM'), 1) - 1) < nvl(l.terminative_date, '1-jan-2099')
                    and l.type_of_agency = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV03
                    and l.index_code = 'FYC'
                    and l.group_code = 'BUSS'
                    and l.category_code = 'COMP'
            ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.mnbs_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = comp.mnbs_be_paid
            and
            AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV03 = comp.mnbs_position_code
            and
            upd.company_id = comp.info_company_id
        )
        when matched then
            update
                set
                    comp.mnbs_comp_dire_ratio = upd.comp_ratio,
                    comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    comp.update_datetime = sysdate;
        commit;*/
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnbs_cond', 'mmxiii_modl_mnbs_cond 1');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 2;


        /* Tinh ty le huong tren FYC truc tiep cho truong ban quan ly nhom truc tiep
        lam giong nhu truong nhom phia tren*/
        merge /*+ CARDINALITY(comp, 100)*/
            into ams.la_compensation_mmxiii_tmp comp
        using
        (   /*tu 250 tr tro len thi duoc 23%*/
            select
                250000000 fyp_from,
                100000000000 fyp_to,
                23 comp_ratio
            from dual
            /*tu 150 tr den < 250 tr thi duoc 19%*/
            union all
            select
                150000000 fyp_from,
                250000000 fyp_to,
                19 comp_ratio
            from dual
            union all
            /*tu 50 tr den < 150 tr  thi duoc 15%*/
            select
                  50000000 fyp_from,
                150000000 fyp_to,
                15 comp_ratio
            from dual
            union all
            /*tu <50 tr thi duoc 12%*/
            select
                -100000000000 fyp_from,
                50000000 fyp_to,
                12 comp_ratio
            from dual
        ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.mnbs_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = comp.mnbs_be_paid
            and
            AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04 = comp.mnbs_position_code
            and/*
            upd.company_id = comp.info_company_id
            and*/
            nvl(comp.mnbs_period_fyp, 0) >= upd.fyp_from
            and
            nvl(comp.mnbs_period_fyp, 0) < upd.fyp_to
        )
        when matched then
            update
                set
                    comp.mnbs_comp_dire_ratio = upd.comp_ratio,
                    comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    comp.update_datetime = sysdate;
        commit;
/*        merge \*+ CARDINALITY(comp, 100)*\
            into ams.la_compensation_mmxiii_tmp comp
        using
        (
            select
                l.branch_id company_id,
                nvl(l.index_from, -100000000000) fyp_from,
                nvl(l.index_to, 100000000000) fyp_to,
                nvl(l.lookup_number, 0) comp_ratio
            from ams.la_index_lookup l
            where l.decisive_date is not null
                and (add_months(trunc(valRecordDate, 'MM'), 1) - 1) >= l.effective_date
                and (add_months(trunc(valRecordDate, 'MM'), 1) - 1) < nvl(l.terminative_date, '1-jan-2099')
                and l.type_of_agency = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02
                and l.index_code = 'FYP'
                and l.group_code = 'BUSS'
                and l.category_code = 'COMP'
        ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.mnbs_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = comp.mnbs_be_paid
            and
            AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04 = comp.mnbs_position_code
            and
            upd.company_id = comp.info_company_id
            and
            nvl(comp.mnbs_period_fyp, 0) >= upd.fyp_from
            and
            nvl(comp.mnbs_period_fyp, 0) < upd.fyp_to
        )
        when matched then
            update
                set
                    comp.mnbs_comp_dire_ratio = upd.comp_ratio,
                    comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    comp.update_datetime = sysdate;
        commit;*/

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnbs_cond', 'mmxiii_modl_mnbs_cond 1');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 3;

       --cho nay fix  = 10
        /* Tinh ty le huong tren FYC gian tiep cho truong ban*/
        merge /*+ CARDINALITY(comp, 100)*/
            into ams.la_compensation_mmxiii_tmp comp
        using
            (   /*nhom gian tiep cua truong ban thi truong ban duoc huong 10%*/
                select 10 comp_ratio
                from dual
            ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.mnbs_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = comp.mnbs_be_paid
            and
            AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04 = comp.mnbs_position_code
            /*and
            upd.company_id = comp.info_company_id*/
        )
        when matched then
            update
                set
                    comp.mnbs_comp_indi_ratio = upd.comp_ratio,
                    comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    comp.update_datetime = sysdate;
        commit;

/*        merge \*+ CARDINALITY(comp, 100)*\
            into ams.la_compensation_mmxiii_tmp comp
        using
            (
                select
                    l.branch_id company_id,
                    nvl(l.lookup_number, 0) comp_ratio
                from ams.la_index_lookup l
                where l.decisive_date is not null
                    and (add_months(trunc(valRecordDate, 'MM'), 1) - 1) >= l.effective_date
                    and (add_months(trunc(valRecordDate, 'MM'), 1) - 1) < nvl(l.terminative_date, '1-jan-2099')
                    and l.type_of_agency = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
                    and l.index_code = 'FYC'
                    and l.group_code = 'BUSS'
                    and l.category_code = 'COMP'
            ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.mnbs_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = comp.mnbs_be_paid
            and
            AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04 = comp.mnbs_position_code
            and
            upd.company_id = comp.info_company_id
        )
        when matched then
            update
                set
                    comp.mnbs_comp_indi_ratio = upd.comp_ratio,
                    comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    comp.update_datetime = sysdate;
        commit;*/

        /* Cap nhat ty le thuong theo diem hang thang cua truong ban truong nhom*/
        merge /*+ CARDINALITY(comp, 100)*/
            into ams.la_compensation_mmxiii_tmp comp
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.from_point,
                    nvl(tmp.to_point, 999) to_point,
                    tmp.coefficient mnbs_activity_coefficient
                from ams.la_grading_coefficient tmp
                where tmp.grading_group_id = '2011TN'
            ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.mnbs_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = comp.mnbs_be_paid
            and
            comp.mnbs_period_point >= upd.from_point
            and
            comp.mnbs_period_point < upd.to_point
            )
        when matched then
            update
                set
                    comp.mnbs_activity_coefficient = upd.mnbs_activity_coefficient;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnbs_cond', 'mmxiii_modl_mnbs_cond 1');
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_mnbs_cond: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_mnbs_comp(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Tinh thu lao phat trien kinh doanh voi truong nhom*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.mnbs_comp_money_calc = nvl(comp.mnbs_period_dire_fyc_calc, 0) * nvl(comp.mnbs_comp_dire_ratio, 0)  / 100,
            comp.mnbs_comp_money = nvl(comp.mnbs_period_dire_fyc_calc, 0) * nvl(comp.mnbs_comp_dire_ratio, 0) * nvl(comp.mnbs_activity_coefficient, 1)  / 100,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.mnbs_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.mnbs_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and comp.mnbs_position_code in
            (
                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02,
                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV03
            );
        commit;

        /*Tinh voi truong ban*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.mnbs_comp_money_calc =
                nvl(comp.mnbs_period_dire_fyc_calc, 0) * nvl(comp.mnbs_comp_dire_ratio, 0) / 100
                +
                nvl(comp.mnbs_period_indi_fyc_calc, 0) * nvl(comp.mnbs_comp_indi_ratio, 0) / 100,
            comp.mnbs_comp_money =
                (
                    nvl(comp.mnbs_period_dire_fyc_calc, 0) * nvl(comp.mnbs_comp_dire_ratio, 0) / 100
                    +
                    nvl(comp.mnbs_period_indi_fyc_calc, 0) * nvl(comp.mnbs_comp_indi_ratio, 0)  / 100
                ) * nvl(comp.mnbs_activity_coefficient, 1)
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.mnbs_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.mnbs_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and comp.mnbs_position_code  = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnbs_comp', 'mmxiii_modl_mnbs_comp \voi truong ban');
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_mnbs_comp: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_mnbs_close(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Ket thuc qua trinh tinh thu lao phat trien kinh doanh
           trong bang la_compensation_mmxiii_tmp*/
        update ams.la_comp_mmxiii_mnbs mnbs
        set
            mnbs.mnbs_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO,
            mnbs.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            mnbs.update_datetime = sysdate
        where mnbs.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
            and mnbs.record_date = trunc(valRecordDate, 'MM')
            and mnbs.mnbs_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES;
        commit;

        /* Ket thuc qua trinh tinh thu lao phat trien kinh doanh
           trong bang la_compensation_mmxiii_tmp*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.mnbs_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.mnbs_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnbs_close', 'mmxiii_modl_mnbs_close ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_mnbs_close: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;
    --Bat dau thuong phat trien nghe nghiep nam 2013
    procedure mmxiii_modl_nagm(valRecordDate date := null)
    is
    begin
        if (
            AMS_CORE_MODULE.is_active(
                AMS_MODL_COMP_MMXIII.MMXIII_COMP_NAGM,
                trunc(valRecordDate, 'MM')
            ) = AMS_CORE_MODULE.IS_YES
        ) then
            for var_result in (
                select comp_date.compensation_date
                from ams.mod_comp_date comp_date
                where comp_date.module_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_COMP
                    and comp_date.sub_code = AMS_MODL_COMP_MMXIII.MMXIII_COMP_NAGM
                    and comp_date.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                    and comp_date.compensation_date = trunc(valRecordDate, 'MM')
                group by comp_date.compensation_date
            ) loop
                AMS_MODL_COMP_MMXIII.mmxiii_modl_nagm_open(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_nagm_data(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_nagm_cond(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_nagm_comp(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_nagm_close(valRecordDate);
            end loop;
        end if;
    end;

    procedure mmxiii_modl_nagm_open(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Len danh sach Tu van vien duoc tra thu lao thu phi*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_NO,
            comp.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
            comp.nagm_from_date = null,
            comp.nagm_to_date = null,
            comp.nagm_effective_date = comp.info_effective_date,
            comp.nagm_senr_by_months = comp.info_senr_by_months,
            comp.nagm_period_ip = 0,
            comp.nagm_cond_ip = 0,
            comp.nagm_period_issue = 0,
            comp.nagm_cond_issue = 0,
            comp.nagm_period_afis = 0,
            comp.nagm_period_afif = 0,
            comp.nagm_period_pr36 = 0,
            comp.nagm_cond_pr36 = 0,
            comp.nagm_period_coll_etmt = 0,
            comp.nagm_period_coll_real = 0,
            comp.nagm_period_coll_rate = 0,
            comp.nagm_cond_coll_rate = 0,
            comp.nagm_comp_money = 0,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.status_code = AMS_MODL_COMP_MMXIII.STATUS_CURR;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_nagm_open', 'Len danh sach Tu van vien duoc tra thu lao thu phi thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* Loai bo cac dai ly vao lam viec truoc khi ap dung
           quy che thu lao 2013*/
        if (AMS_CORE_MODULE.is_active(
                'MMXIII_COMP_NAGM_CONFIG',
                trunc(valRecordDate, 'MM')
            ) = AMS_CORE_MODULE.IS_YES
        ) then
            update ams.la_compensation_mmxiii_tmp comp
            set
                comp.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_NO,
                comp.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO,
                comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                comp.update_datetime = sysdate
            where comp.record_date = trunc(valRecordDate, 'MM')
                and comp.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                --khi nao lam that thi can phai chinh sua lai doan code nay cho dung voi no
                --phai lam viec tu 16/12/2012 cho den het 15/12/2013 neu khong thi se khong tinh cho no
                and
                (
                    comp.nagm_effective_date < AMS_MODL_COMP_MMXIII.COMP_DATE_MMXIII_BEGN - 16
                    or
                    comp.nagm_effective_date > to_date('15-dec-2013')
                );
            commit;
        end if;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_nagm_open', 'Loai bo cac dai ly vao lam viec truoc khi ap dung quy che  thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* Cap nhat thoi gian cong tac [thang] theo quy che
           thu lao 2012*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.nagm_senr_by_months =
                round(
                    months_between(
                        add_months(trunc(valRecordDate, 'MM'), 0),
                        trunc(comp.nagm_effective_date - 15, 'MM')
                    )
                ),
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_nagm_open', 'Cap nhat thoi gian cong tac [thang] theo quy che thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* Xac nhan cac Tu van vien duoc xet thu lao phat trien dai ly*/
        merge /*+ CARDINALITY(comp, 100)*/
            into ams.la_compensation_mmxiii_tmp comp
        using
        (
            select
                2 index_from,
                3 index_to,
                10000000 cond_ip,
                1 cond_issue,
                1100000 comp_money
            from dual
            union
            select
                3 index_from,
                4 index_to,
                15000000 cond_ip,
                2 cond_issue,
                1600000 comp_money
            from dual
            union
            select
                4 index_from,
                5 index_to,
                20000000 cond_ip,
                3 cond_issue,
                2000000 comp_money
            from dual
/*            select l1.branch_id company_id,
                nvl(l1.index_from, 0) index_from,
                nvl(l1.index_to, 999) index_to,
                l2.index_from cond_fyc,
                l1.lookup_number comp_money
            from ams.la_index_lookup l1
            join ams.la_index_lookup l2
                on
                (
                    l2.link_index = l1.index_id
                    and
                    l2.link_index <> l2.index_id
                )
            where l1.decisive_date is not null
                and (add_months(trunc(valRecordDate, 'MM'), 1) - 1) >= l1.effective_date
                and (add_months(trunc(valRecordDate, 'MM'), 1) - 1) < nvl(l1.terminative_date, '1-jan-2099')
                and l1.type_of_agency = 'CV05'
                and l1.group_code = 'DEVE'
                and l1.category_code = 'COMP'*/
        ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.nagm_be_executing
/*            and
            upd.company_id = comp.info_company_id*/
            and
            comp.nagm_senr_by_months >= upd.index_from
            and
            comp.nagm_senr_by_months < upd.index_to
        )
        when matched then
            update
                set
                    comp.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES,
                    comp.nagm_from_date = trunc(comp.nagm_effective_date, 'MM'),
                    comp.nagm_to_date = (add_months(trunc(valRecordDate, 'MM'), 1) - 1),
                    comp.nagm_cond_ip = upd.cond_ip,
                    comp.nagm_cond_issue = upd.cond_issue,
                    comp.nagm_comp_money = upd.comp_money,
                    comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    comp.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_nagm_open', 'Xac nhan cac Tu van vien duoc xet thu lao phat trien dai ly thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* Len danh sach du lieu chi tiet can xoa*/
        merge /*+ CARDINALITY(nagm, 100)*/
            into ams.la_comp_mmxiii_nagm nagm
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_ams_id
                from ams.la_compensation_mmxiii_tmp tmp
                where tmp.record_date = trunc(valRecordDate, 'MM')
                    and tmp.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and tmp.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                group by tmp.outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = nagm.record_date
            and
            upd.outlet_ams_id = nagm.outlet_ams_id
        )
        when matched then
            update
                set
                    nagm.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_DEL;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_nagm_open', 'Len danh sach du lieu chi tiet can xoa thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* Xoa du lieu chi tiet*/
        loop
            delete ams.la_comp_mmxiii_nagm del
            where del.record_date = trunc(valRecordDate, 'MM')
                and del.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_DEL
                and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;


        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_nagm_open', 'Xoa du lieu chi tiet thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* Chi tiet tung thang*/
        for i in 0..3
        loop
            insert /*+ APPEND */ into ams.la_comp_mmxiii_nagm nologging
            select  /*+ CARDINALITY(comp, 100)*/
                comp.outlet_id,
                comp.outlet_ams_id,
                trunc(valRecordDate, 'MM'),
                trunc(sysdate, 'DD'),
                comp.info_outlet_name,
                AMS_MODL_COMP_MMXIII.BE_PAID_DTL,
                AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
                add_months(trunc(valRecordDate, 'MM'), -i),
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                sysdate,
                sysdate
            from ams.la_compensation_mmxiii_tmp comp
            where comp.record_date = trunc(valRecordDate, 'MM')
                and comp.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                and comp.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                and trunc(comp.nagm_effective_date, 'MM') <= add_months(trunc(valRecordDate, 'MM'), -i);
            commit;
        end loop;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_nagm_open', 'Chi tiet tung thang thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* So lieu tong hop*/
        insert /*+ APPEND */ into ams.la_comp_mmxiii_nagm nologging
        select /*+ CARDINALITY(tmp, 100)*/
            max(nagm.outlet_id),
            nagm.outlet_ams_id,
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            max(nagm.outlet_name),
            AMS_MODL_COMP_MMXIII.BE_PAID_YES,
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
            trunc(valRecordDate, 'MM'),
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.la_comp_mmxiii_nagm nagm
        where nagm.record_date = trunc(valRecordDate, 'MM')
            and nagm.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and nagm.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_DTL
        group by nagm.outlet_ams_id;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_nagm_open', 'So lieu tong hop thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));

    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_nagm_open: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_nagm_data(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        dbms_stats.gather_table_stats(null, 'inp_data_outlet_tmp', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_nagm_data', 'gather_table_stats inp_data_outlet_tmp thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        for i in -3..0
        loop
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            merge  /*+ CARDINALITY(nagm, 100)
                  CARDINALITY(upd, 100)
                  LEADING(nagm upd) */
                into ams.la_comp_mmxiii_nagm nagm
            using
                (
                    select /*+ CARDINALITY(data, 100)*/
                        data.outlet_ams_id,
                        data.record_date data_date,
                        nvl(data.period_ip, 0) period_ip,
                        nvl(data.period_net_issue, 0) period_issue,--phai su dung chi  tieu nay de lam cho no
                        nvl(data.period_afis, 0) period_afis,
                        nvl(data.period_afif, 0) period_afif,
                        nvl(data.period_coll_etmt, 0) period_coll_etmt,
                        nvl(data.period_coll_real, 0) period_coll_real
                    from ams.inp_data_outlet_tmp data
                    where  data.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                        and data.record_date = add_months(trunc(valRecordDate, 'MM') , i)
                        and data.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                        and data.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                ) upd
            on (
                trunc(valRecordDate, 'MM') = nagm.record_date
                and
                AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = nagm.nagm_be_executing
                and
                AMS_MODL_COMP_MMXIII.BE_PAID_DTL = nagm.nagm_be_paid
                and
                upd.outlet_ams_id = nagm.outlet_ams_id
                and
                add_months(trunc(valRecordDate, 'MM') , i) = nagm.nagm_data_date
            )
            when matched then
                update
                    set
                        nagm.nagm_period_ip = upd.period_ip,
                        nagm.nagm_period_issue = upd.period_issue,
                        nagm.nagm_period_afis = upd.period_afis,
                        nagm.nagm_period_afif = upd.period_afif,
                        nagm.nagm_period_coll_etmt = upd.period_coll_etmt,
                        nagm.nagm_period_coll_real = upd.period_coll_real,
                        nagm.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                        nagm.update_datetime = sysdate;
            commit;
            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'mmxiii_modl_nagm_data', 'merge la_comp_mmxiii_nagm thang ' || to_char(add_months(trunc(valRecordDate, 'MM') , i), 'dd/mm/yyyy'));
        end loop;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_nagm_data', 'Chi tiet du lieu tung thang  thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        dbms_stats.gather_table_stats(null, 'la_comp_mmxiii_nagm', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_nagm_data', 'gather_table_stats la_comp_mmxiii_nagm thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* Tong hop so lieu*/
        merge /*+ CARDINALITY(nagm, 100)*/
            into ams.la_comp_mmxiii_nagm nagm
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_ams_id,
                    sum(nvl(data.nagm_period_ip, 0)) nagm_period_ip,
                    sum(nvl(data.nagm_period_issue, 0)) nagm_period_issue,
                    sum(nvl(data.nagm_period_coll_etmt, 0)) nagm_period_coll_etmt,
                    sum(nvl(data.nagm_period_coll_real, 0)) nagm_period_coll_real
                from ams.la_comp_mmxiii_nagm data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and data.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_DTL
                group by data.outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = nagm.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = nagm.nagm_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = nagm.nagm_be_paid
            and
            upd.outlet_ams_id = nagm.outlet_ams_id
        )
        when matched then
            update
                set
                    nagm.nagm_period_ip = upd.nagm_period_ip,
                    nagm.nagm_period_issue = upd.nagm_period_issue,
                    nagm.nagm_period_coll_etmt = upd.nagm_period_coll_etmt,
                    nagm.nagm_period_coll_real = upd.nagm_period_coll_real,
                    nagm.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    nagm.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_nagm_data', 'Tong hop so lieu thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        merge /*+ CARDINALITY(nagm, 100)*/
            into ams.la_comp_mmxiii_nagm nagm
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_ams_id,
                    nvl(data.nagm_period_afis, 0) nagm_period_afis,
                    nvl(data.nagm_period_afif, 0) nagm_period_afif
                from ams.la_comp_mmxiii_nagm data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and data.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_DTL
                    and data.nagm_data_date = trunc(valRecordDate, 'MM')
            ) upd
        on (
            trunc(valRecordDate, 'MM') = nagm.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = nagm.nagm_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = nagm.nagm_be_paid
            and
            upd.outlet_ams_id = nagm.outlet_ams_id
        )
        when matched then
            update
                set
                    nagm.nagm_period_afis = upd.nagm_period_afis,
                    nagm.nagm_period_afif = upd.nagm_period_afif,
                    nagm.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    nagm.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_nagm_data', 'merge 1 so lieu thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        merge /*+ CARDINALITY(comp, 100)*/
            into ams.la_compensation_mmxiii_tmp comp
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_ams_id,
                    nvl(data.nagm_period_ip, 0) nagm_period_ip,
                    nvl(data.nagm_period_issue, 0) nagm_period_issue,
                    nvl(data.nagm_period_afis, 0) nagm_period_afis,
                    nvl(data.nagm_period_afif, 0) nagm_period_afif,
                    nvl(data.nagm_period_coll_etmt, 0) nagm_period_coll_etmt,
                    nvl(data.nagm_period_coll_real, 0) nagm_period_coll_real
                from ams.la_comp_mmxiii_nagm data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and data.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.nagm_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = comp.nagm_be_paid
            and
            upd.outlet_ams_id = comp.outlet_ams_id
        )
        when matched then
            update
                set
                    comp.nagm_period_ip = upd.nagm_period_ip,
                    comp.nagm_period_issue = upd.nagm_period_issue,
                    comp.nagm_period_afis = upd.nagm_period_afis,
                    comp.nagm_period_afif = upd.nagm_period_afif,
                    comp.nagm_period_coll_etmt = upd.nagm_period_coll_etmt,
                    comp.nagm_period_coll_real = upd.nagm_period_coll_real,
                    comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    comp.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_nagm_data', 'merge 2 so lieu thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* Tinh toan so lieu*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.nagm_period_pr36 =
                round(
                    decode(nvl(comp.nagm_period_afis, 0),
                        0, 100,
                        least(
                            (nvl(comp.nagm_period_afif, 0) / nvl(comp.nagm_period_afis, 0)) * 100,
                            999.99
                        )
                    ),
                    2
                ),
            comp.nagm_period_coll_rate =
                round(
                    decode(nvl(comp.nagm_period_coll_etmt, 0),
                        0, 100,
                        least(
                            (nvl(comp.nagm_period_coll_real, 0) / nvl(comp.nagm_period_coll_etmt, 0)) * 100,
                            999.99
                        )
                    ),
                    2
                ),
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_nagm_data', 'Tinh toan so lieu thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));


    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_nagm_data: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_nagm_cond(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Cap nhat Dieu kien PR36 >= 85 va Ty Le Thu Phi >= 92%*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.nagm_cond_pr36 = 85,
            comp.nagm_cond_coll_rate = 92,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES;
        commit;

/*        merge \*+ CARDINALITY(comp, 100)*\
            into ams.la_compensation_mmxiii_tmp comp
        using
            (
                select \*+ CARDINALITY(l, 100)*\
                    l.branch_id company_id,
                    nvl(l.lookup_number, 0) cond_pr36
                from ams.la_index_lookup l
                where l.decisive_date is not null
                    and add_months(trunc(valRecordDate, 'MM'), 1) - 1 >= l.effective_date
                    and add_months(trunc(valRecordDate, 'MM'), 1) - 1 < nvl(l.terminative_date, '1-jan-2099')
                    and l.type_of_agency = 'CV05'
                    and l.index_code = 'PERS'
                    and l.group_code = 'DEPE'
                    and l.category_code = 'COMP'
            ) upd
            on (
            AMS_MODL_COMP_MMXIII.VAR_SESSION_ID = comp.session_id
            and
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.nagm_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = comp.nagm_be_paid
            and
            upd.company_id = comp.info_company_id
        )
        when matched then
            update
                set
                    comp.nagm_cond_pr36 = upd.cond_pr36,
                    comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    comp.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_nagm_cond', 'merge 1 so lieu thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        \* Dieu kien Ty le thu phi*\
        merge \*+ CARDINALITY(comp, 100)*\
            into ams.la_compensation_mmxiii_tmp comp
        using
            (
                select \*+ CARDINALITY(l, 100)*\
                    l.branch_id company_id,
                    nvl(l.lookup_number, 0) cond_coll_rate
                from ams.la_index_lookup l
                where l.decisive_date is not null
                    and add_months(trunc(valRecordDate, 'MM'), 1) - 1 >= l.effective_date
                    and add_months(trunc(valRecordDate, 'MM'), 1) - 1 < nvl(l.terminative_date, '1-jan-2099')
                    and l.type_of_agency = 'CV05'
                    and l.index_code = 'RECE'
                    and l.group_code = 'DERE'
                    and l.category_code = 'COMP'
            ) upd
            on (
            AMS_MODL_COMP_MMXIII.VAR_SESSION_ID = comp.session_id
            and
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.nagm_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = comp.nagm_be_paid
            and
            upd.company_id = comp.info_company_id
        )
        when matched then
            update
                set
                    comp.nagm_cond_coll_rate = upd.cond_coll_rate,
                    comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    comp.update_datetime = sysdate;
        commit;*/
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_nagm_cond', 'cap nhat dieu kien thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));


    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_nagm_cond: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    /*
    Update time: 20/8/2013
    Modify by: AnhNH
    ID:
    */
    procedure mmxiii_modl_nagm_comp(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /*Dau tien phai xu ly cac truong hop dac biet nay truoc da
        sau khi da xu ly xong
        De cho nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO
        Roi cac truong hop sau se khong xu ly cho no
        thi se xu ly cac truong hop binh thuong thi xu ly nhu luc dau de khong bi lot mat truong hop no bi am
        sau do bi tru thi tru di thang truoc thi hoa ra la la cong vao cho no*/

        /*Neu ma 2 thang dau tien IP dat >= 20 trieu thi se
        duoc chi tra ngay tai thoi diem ket thuc thang 2 la 2 000 000 */
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.nagm_comp_money = 2000000,
            --khi da xu ly xong roi thi se khong xu ly cho no khi ma doi voi truong hop binh thuong thi moi la dung duoc
            comp.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and comp.nagm_period_ip >= 20000000
            and round(comp.nagm_senr_by_months) = 2
            and comp.nagm_period_pr36 >= comp.nagm_cond_pr36
            and comp.nagm_period_coll_rate >= comp.nagm_cond_coll_rate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_nagm_comp', 'Neu ma 2 thang dau tien IP dat 20 trieu thi se duoc nhan 2 trieu luon thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /*Neu ma thang 2 IP >= 20 tr thi thang 2 duoc nhan 2 trieu
        Neu ma thang 3 co hop dong huy lam giam IP < 20 trieu thi phai khau tru
        vao so tien nhan duoc trong thang 2
        Case 1:  co IP luy ke (tong IP thang 2 va thang 3) la >= 15 tr va < 20 tr
        thi se phai hoan tra 400 000 tuc ghi am 400 000
        */
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.nagm_comp_money = -400000,
            comp.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and round(comp.nagm_senr_by_months) = 3
            /*neu ma tien thuong cua thang thu 2 la 2 trieu roi
            ma IP luy ke thang 3(bang tong thang 1 2 va 3)  la <20 tr thi phai khau tru thuong */
            and nvl(
            (     --du lieu tu bang nay thi phai lay tu du lieu bang thuc da co cua no moi dung
                    select (sum(nvl(past.nagm_comp_money, 0)))
                    from ams.la_compensation_mmxiii past
                    where past.record_date--doan code nay lay du lieu thang thu 2 vi chi thang lam viec thu 2 moi co thuong thang lam viec thu 1 k co thuong
                            between add_months(trunc(valRecordDate, 'MM'), -1)
                            and add_months(trunc(valRecordDate, 'MM'), -1)
                        and past.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                        and past.outlet_ams_id = comp.outlet_ams_id
                ),
                0
            ) >= 2000000 --neu ma thuong thang thu 2 la 2 trieu
            /*va IP luy ke tai thang 3 cua no (la tong thang 1 2 3) >= 15 tr va < 20 tr
            va co so luong HD thuan KTM >= 2 thi se phai khau tru 400000 tuc chi duoc nhan 1tr6*/
            and nvl(comp.nagm_period_ip, 0) >= 15000000
            and nvl(comp.nagm_period_ip, 0) < 20000000
            /*so luong HD thuan KTM luy ke phai >= 2*/
            and nvl(comp.nagm_period_issue, 0) >= 2;
            --khi do se ghi am 400 nghin vao tien thuong thang nay
        commit;

        /*chinhlk 21/2/2013 sua lai voi thuong PTNN do ben BVNT confirm ve khau tru khi nhan dc 2 trieu*/
        /*Case 2:  co IP luy ke (tong IP thang 2 va thang 3) la >= 15 tr va < 20 tr
        co so luong HD KTM < 2 thi se chi duoc nhan 1tr 1 do do khau tru 900 nghin
        Tuc la chi an voi thang 2 cua no thoi
        */
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.nagm_comp_money = -900000,
            comp.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and round(comp.nagm_senr_by_months) = 3
            /*neu ma tien thuong cua thang thu 2 la 2 trieu roi
            ma IP luy ke thang 3(bang tong thang 1 2 va 3)  la <20 tr va >= 15 tr
            thi phai khau tru thuong */
            and nvl(
            (     --du lieu tu bang nay thi phai lay tu du lieu bang thuc da co cua no moi dung
                    select (sum(nvl(past.nagm_comp_money, 0)))
                    from ams.la_compensation_mmxiii past
                    where past.record_date--doan code nay lay du lieu thang thu 2 vi chi thang lam viec thu 2 moi co thuong thang lam viec thu 1 k co thuong
                            between add_months(trunc(valRecordDate, 'MM'), -1)
                            and add_months(trunc(valRecordDate, 'MM'), -1)
                        and past.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                        and past.outlet_ams_id = comp.outlet_ams_id
                ),
                0
            ) >= 2000000 --neu ma thuong thang thu 2 la 2 trieu
            /*va IP luy ke tai thang 3 cua no (la tong thang 1 2 3) >= 15 tr va < 20 tr
            va co so luong HD thuan KTM < 2 thi se phai khau tru 900000 tuc chi duoc nhan 1tr1*/
            and nvl(comp.nagm_period_ip, 0) >= 15000000
            and nvl(comp.nagm_period_ip, 0) < 20000000
            /*so luong HD thuan KTM luy ke phai < 2*/
            and nvl(comp.nagm_period_issue, 0) < 2;
            --khi do se ghi am 900 nghin vao tien thuong thang nay
        commit;

        /*Case 3:  co IP luy ke (tong IP thang 2 va thang 3) la >= 10 tr va <= 15 tr
        co so luong HD KTM >= 1 thi se chi duoc nhan 1tr 1 do do khau tru 900 nghin
        Tuc la chi an voi thang 2 cua no thoi khong dat thang thu 3 la 1 tr 6
        */
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.nagm_comp_money = -900000,
            comp.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and round(comp.nagm_senr_by_months) = 3
            /*neu ma tien thuong cua thang thu 2 la 2 trieu roi
            ma IP luy ke thang 3(bang tong thang 1 2 va 3)  la <20 tr va >= 15 tr
            thi phai khau tru thuong */
            and nvl(
            (     --du lieu tu bang nay thi phai lay tu du lieu bang thuc da co cua no moi dung
                    select (sum(nvl(past.nagm_comp_money, 0)))
                    from ams.la_compensation_mmxiii past
                    where past.record_date--doan code nay lay du lieu thang thu 2 vi chi thang lam viec thu 2 moi co thuong thang lam viec thu 1 k co thuong
                            between add_months(trunc(valRecordDate, 'MM'), -1)
                            and add_months(trunc(valRecordDate, 'MM'), -1)
                        and past.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                        and past.outlet_ams_id = comp.outlet_ams_id
                ),
                0
            ) >= 2000000 --neu ma thuong thang thu 2 la 2 trieu
            /*va IP luy ke tai thang 3 cua no (la tong thang 1 2 3) >= 10 tr va <=15 tr              va co so luong HD thuan KTM < 2 thi se phai khau tru 900000 tuc chi duoc nhan 1tr1*/
            and nvl(comp.nagm_period_ip, 0) >= 10000000
            and nvl(comp.nagm_period_ip, 0) <= 15000000
            /*so luong HD thuan KTM luy ke phai >= 1*/
            and nvl(comp.nagm_period_issue, 0) >= 1;
            --khi do se ghi am 900 nghin vao tien thuong thang nay
        commit;

        /*Case 4:  co IP luy ke (tong IP thang 2 va thang 3) la < 10 tr
          thi se khau tru het tuc ghi am 2 tr vao tien thuong
          do khong dat duoc cac thang 1 va thang thu 2
        */
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.nagm_comp_money = -2000000,
            comp.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and round(comp.nagm_senr_by_months) = 3
            /*neu ma tien thuong cua thang thu 2 la 2 trieu roi
            ma IP luy ke thang 3(bang tong thang 1 2 va 3)  la <20 tr va >= 15 tr
            thi phai khau tru thuong */
            and nvl(
            (     --du lieu tu bang nay thi phai lay tu du lieu bang thuc da co cua no moi dung
                    select (sum(nvl(past.nagm_comp_money, 0)))
                    from ams.la_compensation_mmxiii past
                    where past.record_date--doan code nay lay du lieu thang thu 2 vi chi thang lam viec thu 2 moi co thuong thang lam viec thu 1 k co thuong
                            between add_months(trunc(valRecordDate, 'MM'), -1)
                            and add_months(trunc(valRecordDate, 'MM'), -1)
                        and past.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                        and past.outlet_ams_id = comp.outlet_ams_id
                ),
                0
            ) >= 2000000 --neu ma thuong thang thu 2 la 2 trieu
            /*va IP luy ke tai thang 3 cua no (la tong thang 1 2 3) < 10 tr */
            and nvl(comp.nagm_period_ip, 0) < 10000000;
            --khi do se ghi am 2 tr vao tien thuong thang nay de thu hoi
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_nagm_comp', 'Neu ma thang 2 IP >= 20 tr thi  ma tong IP thang 2 va thang 3 = 0 thi se bi ghi am 2 tr cho thuong PTNN thang 3 thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /*Voi tham nien la 4 thang
        Neu co them HD lam tang them IP 20 tr va 1 trong cac case o phia ben tren thi se lam nhu sau:

        Case 1:
        Neu dat case 1 o phia tren va IP luy ke cua thang thu 4 nay >= 20 tr va co HD KTM thuan >= 3 tr
        thi duoc nhan 400 nghin de tong thuong la 2 tr
        */
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.nagm_comp_money = 400000,
            comp.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and round(comp.nagm_senr_by_months) = 4
            /*neu ma tien thuong cua thang thu 2 la 2 trieu roi
            ma IP luy ke thang 3(bang tong thang 1 2 va 3)  la <20 tr thi phai khau tru thuong */
            --doan code nay the hien neu ma thuong o thang thu 2 la = 2 trieu roi
            and nvl(
            (     --du lieu tu bang nay thi phai lay tu du lieu bang thuc da co cua no moi dung
                    select (sum(nvl(past.nagm_comp_money, 0)))
                    from ams.la_compensation_mmxiii past
                    --doan code nay lay du lieu thang thu 2 vi chi thang lam viec thu 2 moi co thuong thang lam viec thu 1 k co thuong
                    where past.record_date = add_months(trunc(valRecordDate, 'MM'), -2)
                        and past.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                        and past.outlet_ams_id = comp.outlet_ams_id
                ),
                0
            ) >= 2000000 --neu ma thuong thang thu 2 la 2 trieu
            /* doan code nay dam bao la da thoa man case 1
            tuc IP luy ke tai thang 3 cua no (la tong thang 1 2 3) >= 15 tr va < 20 tr
            va co so luong HD thuan KTM >= 2 thi se phai khau tru 400000 tuc chi duoc nhan 1tr6*/
            and exists
            (       --du lieu tu bang nay thi phai lay tu du lieu bang thuc da co cua no moi dung
                    select 1
                    from ams.la_compensation_mmxiii past
                    --doan code nay lay du lieu thang thu 3
                    where past.record_date = add_months(trunc(valRecordDate, 'MM'), -1)
                        and past.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                        --lay cua dai ly do
                        and past.outlet_ams_id = comp.outlet_ams_id
                        and nvl(past.nagm_period_ip, 0) >= 15000000
                        and nvl(past.nagm_period_ip, 0) < 20000000
                        /*so luong HD thuan KTM luy ke phai >= 2*/
                        and nvl(past.nagm_period_issue, 0) >= 2
            )
            /*va IP luy ke cua thang thu 4 nay >= 20 tr va so HD KTM thuan >= 3 trieu*/
            and nvl(comp.nagm_period_ip, 0) >= 20000000
            /*so luong HD thuan KTM luy ke phai >= 2*/
            and nvl(comp.nagm_period_issue, 0) >= 3;
            --khi do se cong 400 nghin vao tien thuong thang nay de lay lai tien
        commit;


        /*chinhlk 21/2/2013 sua lai voi thuong PTNN do ben BVNT confirm ve khau tru khi nhan dc 2 trieu*/
        /*Voi tham nien la 4 thang
        Neu co them HD lam tang them IP 20 tr va 1 trong cac case o phia ben tren thi se lam nhu sau:
        Case 2:
        Neu dat case 2 o phia tren va IP luy ke cua thang thu 4 nay >= 20 tr va co HD KTM thuan >= 3 tr
        thi duoc nhan 900 nghin de tong thuong la 2 tr
        */
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.nagm_comp_money = 900000,
            comp.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and round(comp.nagm_senr_by_months) = 4
            /*neu ma tien thuong cua thang thu 2 la 2 trieu roi
            ma IP luy ke thang 3(bang tong thang 1 2 va 3)  la <20 tr thi phai khau tru thuong */
            --doan code nay the hien neu ma thuong o thang thu 2 la = 2 trieu roi
            and nvl(
            (     --du lieu tu bang nay thi phai lay tu du lieu bang thuc da co cua no moi dung
                    select (sum(nvl(past.nagm_comp_money, 0)))
                    from ams.la_compensation_mmxiii past
                    --doan code nay lay du lieu thang thu 2 vi chi thang lam viec thu 2 moi co thuong thang lam viec thu 1 k co thuong
                    where past.record_date = add_months(trunc(valRecordDate, 'MM'), -2)
                        and past.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                        and past.outlet_ams_id = comp.outlet_ams_id
                ),
                0
            ) >= 2000000 --neu ma thuong thang thu 2 la 2 trieu
            /* doan code nay dam bao la da thoa man case 1
            tuc IP luy ke tai thang 3 cua no (la tong thang 1 2 3) >= 15 tr va < 20 tr
            va co so luong HD thuan KTM < 2 thi se phai khau tru 900000 tuc chi duoc nhan 1tr6*/
            and exists
            (       --du lieu tu bang nay thi phai lay tu du lieu bang thuc da co cua no moi dung
                    select 1
                    from ams.la_compensation_mmxiii past
                    --doan code nay lay du lieu thang thu 3
                    where past.record_date = add_months(trunc(valRecordDate, 'MM'), -1)
                        and past.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                        --lay cua dai ly do
                        and past.outlet_ams_id = comp.outlet_ams_id
                        and nvl(past.nagm_period_ip, 0) >= 15000000
                        and nvl(past.nagm_period_ip, 0) < 20000000
                        /*so luong HD thuan KTM luy ke < 2*/
                        and nvl(past.nagm_period_issue, 0) < 2
            )
            /*va IP luy ke cua thang thu 4 nay >= 20 tr va so HD KTM thuan >= 3 trieu*/
            and nvl(comp.nagm_period_ip, 0) >= 20000000
            /*so luong HD thuan KTM luy ke phai >= 2*/
            and nvl(comp.nagm_period_issue, 0) >= 3;
            --khi do se cong 900 nghin vao tien thuong thang nay de lay lai tien
        commit;

        /*Voi tham nien la 4 thang
        Neu co them HD lam tang them IP 20 tr va 1 trong cac case o phia ben tren thi se lam nhu sau:
        Case 3:
        Neu dat case 3 o phia tren va IP luy ke cua thang thu 4 nay >= 20 tr va co HD KTM thuan >= 3 tr
        thi duoc nhan 900 nghin de tong thuong la 2 tr
        */
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.nagm_comp_money = 900000,
            comp.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and round(comp.nagm_senr_by_months) = 4
            /*neu ma tien thuong cua thang thu 2 la 2 trieu roi
            ma IP luy ke thang 3(bang tong thang 1 2 va 3)  la <20 tr thi phai khau tru thuong */
            --doan code nay the hien neu ma thuong o thang thu 2 la = 2 trieu roi
            and nvl(
            (     --du lieu tu bang nay thi phai lay tu du lieu bang thuc da co cua no moi dung
                    select (sum(nvl(past.nagm_comp_money, 0)))
                    from ams.la_compensation_mmxiii past
                    --doan code nay lay du lieu thang thu 2 vi chi thang lam viec thu 2 moi co thuong thang lam viec thu 1 k co thuong
                    where past.record_date = add_months(trunc(valRecordDate, 'MM'), -2)
                        and past.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                        and past.outlet_ams_id = comp.outlet_ams_id
                ),
                0
            ) >= 2000000 --neu ma thuong thang thu 2 la 2 trieu
            /* doan code nay dam bao la da thoa man case 1
            tuc IP luy ke tai thang 3 cua no (la tong thang 1 2 3) >= 15 tr va < 20 tr
            va co so luong HD thuan KTM < 2 thi se phai khau tru 900000 tuc chi duoc nhan 1tr6*/
            and exists
            (       --du lieu tu bang nay thi phai lay tu du lieu bang thuc da co cua no moi dung
                    select 1
                    from ams.la_compensation_mmxiii past
                    --doan code nay lay du lieu thang thu 3
                    where past.record_date = add_months(trunc(valRecordDate, 'MM'), -1)
                        and past.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                        --lay cua dai ly do
                        and past.outlet_ams_id = comp.outlet_ams_id
                        and nvl(past.nagm_period_ip, 0) >= 10000000
                        and nvl(past.nagm_period_ip, 0) <= 15000000
                        /*so luong HD thuan KTM luy ke >= 1*/
                        and nvl(past.nagm_period_issue, 0) >= 1
            )
            /*va IP luy ke cua thang thu 4 nay >= 20 tr va so HD KTM thuan >= 3 trieu*/
            and nvl(comp.nagm_period_ip, 0) >= 20000000
            /*so luong HD thuan KTM luy ke phai >= 2*/
            and nvl(comp.nagm_period_issue, 0) >= 3;
            --khi do se cong 900 nghin vao tien thuong thang nay de lay lai tien
        commit;

        /*
        Case 4:
        Neu dat case 4 o phia tren va IP luy ke cua thang thu 4 nay >= 20 tr va co HD KTM thuan >= 3 tr
        thi duoc nhan 2 tr de tong thuong la 2 tr
        */
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.nagm_comp_money = 2000000,
            comp.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and round(comp.nagm_senr_by_months) = 4
            /*neu ma tien thuong cua thang thu 2 la 2 trieu roi
            ma IP luy ke thang 3(bang tong thang 1 2 va 3)  la <20 tr thi phai khau tru thuong */
            --doan code nay the hien neu ma thuong o thang thu 2 la = 2 trieu roi
            and nvl(
            (     --du lieu tu bang nay thi phai lay tu du lieu bang thuc da co cua no moi dung
                    select (sum(nvl(past.nagm_comp_money, 0)))
                    from ams.la_compensation_mmxiii past
                    --doan code nay lay du lieu thang thu 2 vi chi thang lam viec thu 2 moi co thuong thang lam viec thu 1 k co thuong
                    where past.record_date = add_months(trunc(valRecordDate, 'MM'), -2)
                        and past.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                        and past.outlet_ams_id = comp.outlet_ams_id
                ),
                0
            ) >= 2000000 --neu ma thuong thang thu 2 la 2 trieu
            /* doan code nay dam bao la da thoa man case 4
            tuc IP luy ke tai thang 3 cua no (la tong thang 1 2 3)  < 10 tr
            va co so luong HD thuan KTM < 2 thi se phai khau tru 2 tr tuc chi duoc nhan 1tr6*/
            and exists
            (       --du lieu tu bang nay thi phai lay tu du lieu bang thuc da co cua no moi dung
                    select 1
                    from ams.la_compensation_mmxiii past
                    --doan code nay lay du lieu thang thu 3
                    where past.record_date = add_months(trunc(valRecordDate, 'MM'), -1)
                        and past.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                        --lay cua dai ly do
                        and past.outlet_ams_id = comp.outlet_ams_id
                        --IP cua no < 10000000
                        and nvl(past.nagm_period_ip, 0) < 10000000
            )
            /*va IP luy ke cua thang thu 4 nay >= 20 tr va so HD KTM thuan >= 3 trieu*/
            and nvl(comp.nagm_period_ip, 0) >= 20000000
            /*so luong HD thuan KTM luy ke phai >= 2*/
            and nvl(comp.nagm_period_issue, 0) >= 3;
            --khi do se cong 900 nghin vao tien thuong thang nay de lay lai tien
        commit;

        /*Neu ma da duoc nhan 2 tr roi o thang lam viec thu 2 thi
        cac thang sau se khong duoc nhan gi ca
        */
        /*Voi tham nien la 3 thang va 4 thang*/
        /*Sau khi thuc hien update nhu the nay thi moi thuc hien tiep tuc xu ly
        giam tru di nhu phia duoi neu ma khong dat duoc cac chi tieu da nhan duoc*/
        /*Voi tham nien la 3 thang
        Chi can dieu kien la IP >= 20 trieu o thang thu 3 va thu 4 thi khong quan tam den so HD quan ly nua

        O day con thieu truong hop
        VI
        Thang 2 28/2 PH 1 HD A co IP = 20 tr
        Thang 3  1/3 Huy HD A
                       30/3 PH HD B co IP = 40 tr
                       Vay Thang 3 co IP = 20 tr, HD KTM thuan = 0
                       Da xu ly o day
        Thang 4 Huy HD B thi PHAI hoan tra lai 2 tr o day chua xu ly
        */
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.nagm_comp_money = 0,
            comp.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and round(comp.nagm_senr_by_months) = 3
            and nvl(
            (     --du lieu tu bang nay thi phai lay tu du lieu bang thuc da co cua no moi dung
                    select (sum(nvl(past.nagm_comp_money, 0)))
                    from ams.la_compensation_mmxiii past
                    where past.record_date--doan code nay lay du lieu thang thu 2 vi chi thang lam viec thu 2 moi co thuong thang lam viec thu 1 k co thuong
                            between add_months(trunc(valRecordDate, 'MM'), -1)
                            and add_months(trunc(valRecordDate, 'MM'), -1)
                        and past.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                        and past.outlet_ams_id = comp.outlet_ams_id
                ),
                0
            ) >= 2000000 --neu tong thuong da duoc 2 trieu roi  dong thoi IP luy ke tai thang 3 dam bao >= 20 tr thi se khong bi hoan tra
            and nvl(comp.nagm_period_ip, 0) >= 20000000;
        commit;

        /*Voi tham nien la 4 thang thi neu da nhan o cac thang truoc so tien >= 2tr roi thi thang nay se khong duoc nhan gi ca*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.nagm_comp_money = 0,
            comp.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and round(comp.nagm_senr_by_months) = 4
            and nvl(
            (     --du lieu tu bang nay thi phai lay tu du lieu bang thuc da co cua no moi dung
                    select (sum(nvl(past.nagm_comp_money, 0)))
                    from ams.la_compensation_mmxiii past
                    where past.record_date--doan code nay lay du lieu thang thu 2 va 3 vi chi thang lam viec thu 2 moi co thuong thang lam viec thu 1 k co thuong
                            between add_months(trunc(valRecordDate, 'MM'), -2)
                            and add_months(trunc(valRecordDate, 'MM'), -1)
                        and past.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                        and past.outlet_ams_id = comp.outlet_ams_id
                ),
                0
            ) >= 2000000--neu tong thuong da duoc 2 trieu roi  dong thoi IP luy ke tai thang 3 dam bao >= 20 tr thi se khong bi hoan tra
            and nvl(comp.nagm_period_ip, 0) >= 20000000;
        commit;
        --sau khi da xu ly nhu the nay roi thi be executing = NO thi se khong phai xu ly cho doan duoi nay nua

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_nagm_comp', 'Da nhan 2 trieu thi thang 3 va 4 khong duoc nhan gi ca thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /*Sau do thi moi xu ly cac truong hop binh thuong
        thi khi do tru di no moi chinh xac duoc so lieu*/
        /* Khong dat dieu kien ty le duy tri*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_NO,
            comp.nagm_comp_money = 0,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and nvl(comp.nagm_period_pr36, 0) < nvl(comp.nagm_cond_pr36, 0);
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_nagm_comp', 'Khong dat dieu kien ty le duy tri so lieu thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* Khong dat dieu kien ty le thu phi*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_NO,
            comp.nagm_comp_money = 0,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and nvl(comp.nagm_period_coll_rate, 0) < nvl(comp.nagm_cond_coll_rate, 0);
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_nagm_comp', 'Khong dat dieu kien ty le thu phi so lieu thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* Khong dat dieu kien luy ke IP*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_NO,
            comp.nagm_comp_money = 0,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and nvl(comp.nagm_period_ip, 0) < nvl(comp.nagm_cond_ip, 0);
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_nagm_comp', ' Khong dat dieu kien luy ke IP so lieu thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* Khong dat dieu kien luy ke so hop dong KTM thuan*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_NO,
            comp.nagm_comp_money = 0,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and nvl(comp.nagm_period_issue, 0) < nvl(comp.nagm_cond_issue, 0);
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_nagm_comp', 'Khong dat dieu kien luy ke so hop dong KTM thuanthang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* Xac nhan nang cao thu lao
           Truong hop: Tru di so tien da nhan vao thoi gian truoc do de tinh duoc dung hon
           co kem them dieu kien thang thu 2 co thuong < 2 trieu vi neu = 2 trieu thi da xu ly truoc cho no roi*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.nagm_comp_money =
                nvl(comp.nagm_comp_money, 0) -
                nvl(
                    (   --du lieu tu bang nay thi phai lay tu du lieu bang thuc da co cua no moi dung
                        select (sum(nvl(past.nagm_comp_money, 0)))
                        from ams.la_compensation_mmxiii past
                        where past.record_date  --doan code nay da lay du lieu thang thu 2 cua dai ly vi chi thang thu 2 moi co thuong( doc tai lieu)
                                between add_months(trunc(valRecordDate, 'MM'), -1)
                                and add_months(trunc(valRecordDate, 'MM'), -1)
                            and past.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                            and past.outlet_ams_id = comp.outlet_ams_id
                    ),
                    0
                )
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and round(comp.nagm_senr_by_months) = 3
            --voi dieu kien la tien thuong cua thang truoc do < 2 tr thi se xu ly truong hop nay
            --khi do thi se khong phai xu ly khi ma no tru di thang truoc
            --them truong hop nay de cho chac chan xu ly
            and nvl(
            (     --du lieu tu bang nay thi phai lay tu du lieu bang thuc da co cua no moi dung
                    select (sum(nvl(past.nagm_comp_money, 0)))
                    from ams.la_compensation_mmxiii past
                    where past.record_date--doan code nay lay du lieu thang thu 2 vi chi thang lam viec thu 2 moi co thuong thang lam viec thu 1 k co thuong
                            between add_months(trunc(valRecordDate, 'MM'), -1)
                            and add_months(trunc(valRecordDate, 'MM'), -1)
                        and past.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                        and past.outlet_ams_id = comp.outlet_ams_id
                ),
                0
            ) < 2000000; --neu tong thuong da duoc 2 trieu roi  tai thang truoc thi thang nay se khong xu ly cho no
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_nagm_comp', 'Xac dinh thuong nhan duoc o thang thu 3 thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        --tru di so tien da nhan vao thoi gian truoc de tinh dung hon
        --co kem them dieu kien thang thu 2 co thuong < 2 trieu vi neu = 2 trieu thi da xu ly truoc cho no roi
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.nagm_comp_money =
                nvl(comp.nagm_comp_money, 0) -
                nvl(
                    (   --du lieu tu bang nay thi phai lay tu du lieu bang thuc da co cua no moi dung
                        select (sum(nvl(past.nagm_comp_money, 0)))
                        from ams.la_compensation_mmxiii past
                        where past.record_date --doan code nay lay du lieu thang thu 2 va 3 cua dai ly doc tai lieu se thay
                                between add_months(trunc(valRecordDate, 'MM'), -2)
                                and add_months(trunc(valRecordDate, 'MM'), -1)
                            and past.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                            and past.outlet_ams_id = comp.outlet_ams_id
                    ),
                    0
                )
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and round(comp.nagm_senr_by_months) = 4
            --voi dieu kien la tien thuong cua thang truoc do < 2 tr thi se xu ly truong hop nay
            --khi do thi se khong phai xu ly khi ma no tru di thang truoc
            --them truong hop nay de cho chac chan xu ly
            and nvl(
            (     --du lieu tu bang nay thi phai lay tu du lieu bang thuc da co cua no moi dung
                        select (sum(nvl(past.nagm_comp_money, 0)))
                        from ams.la_compensation_mmxiii past
                        where past.record_date --doan code nay lay du lieu thang thu 2 va 3 cua dai ly doc tai lieu se thay
                                between add_months(trunc(valRecordDate, 'MM'), -2)
                                and add_months(trunc(valRecordDate, 'MM'), -1)
                            and past.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                            and past.outlet_ams_id = comp.outlet_ams_id
                ),
                0
            ) < 2000000; --neu tong thuong da duoc 2 trieu roi  tai 2 thang truoc thi thang nay se khong xu ly cho no khi tru di
        commit;


        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_nagm_comp', 'Da nhan 2 trieu thi thang 4 khong duoc nhan gi ca thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));


    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_nagm_comp: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_nagm_close(valRecordDate date := null)
    is
    begin
        /* Ket thuc qua trinh tinh thu lao tuyen dung
           trong bang la_comp_mmxiii_nagm*/
        update ams.la_comp_mmxiii_nagm nagm
        set
            nagm.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO,
            nagm.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            nagm.update_datetime = sysdate
        where nagm.record_date = trunc(valRecordDate, 'MM')
            and nagm.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES;
        commit;

        /* Ket thuc qua trinh tinh thu lao thu phi
           trong bang ams.la_compensation_mmxiii_tmp*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.nagm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES;
        commit;
    end;



    procedure mmxiii_modl_agqr(valRecordDate date := null)
    is
    begin
        if (
            AMS_CORE_MODULE.is_active(
                AMS_MODL_COMP_MMXIII.MMXIII_COMP_AGQR,
                trunc(valRecordDate, 'MM')
            ) = AMS_CORE_MODULE.IS_YES
        ) then
            for var_result in (
                select comp_date.compensation_date
                from ams.mod_comp_date comp_date
                where comp_date.module_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_COMP
                    and comp_date.sub_code = AMS_MODL_COMP_MMXIII.MMXIII_COMP_AGQR
                    and comp_date.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                    and comp_date.compensation_date = trunc(valRecordDate, 'MM')
                group by comp_date.compensation_date
            ) loop
                AMS_MODL_COMP_MMXIII.mmxiii_modl_agqr_open(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_agqr_data(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_agqr_cond(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_agqr_comp(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_agqr_close(valRecordDate);
            end loop;
        end if;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 1/2/2013
        Version: 1.0
        Description: Thu tuc tinh toan cac chi tieu cho thuong quy dai ly phan khoi tao
        Parameter:
            valRecordDate [date]: Thang chay
        Update:  Nguyen Hung Anh
            Version: 1.1
            Date Updated: 1/8/2013
            Note:  Fix theo ID: 111434
    */
    procedure mmxiii_modl_agqr_open(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Len danh sach Tu van vien tinh thu lao thuong quy*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.agqr_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES,
            comp.agqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
            comp.agqr_outlet_id = comp.outlet_id,
            comp.agqr_outlet_ams_id = comp.outlet_ams_id,
            comp.agqr_effective_date = comp.info_effective_date,
            comp.agqr_from_date = add_months(trunc(valRecordDate, 'MM'), -2),
            comp.agqr_to_date = (add_months(trunc(valRecordDate, 'MM'), 1) - 1),
            comp.agqr_period_fyc = 0,
            comp.agqr_period_fyp = 0,
            comp.agqr_period_afis = 0,
            comp.agqr_period_afif = 0,
            comp.agqr_period_pr36 = 0,
            comp.agqr_period_coll_etmt = 0,
            comp.agqr_period_coll_real = 0,
            comp.agqr_period_coll_rate = 0,
            comp.agqr_cond_coll_rate = 0,
            comp.agqr_comp_ratio = 0,
            comp.agqr_comp_money_calc = 0,
            comp.agqr_comp_money = 0,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.status_code = AMS_MODL_COMP_MMXIII.STATUS_CURR
            and comp.info_effective_date < (trunc(valRecordDate, 'MM') + 15);--chi lay cac dai ly lam truoc ngay 15 cua thang cuoi quy
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agqr_open', 'Len danh sach Tu van vien tinh thu lao thuong quy  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 1;

        /* 20130802 AnhNH add Hieu chinh
           Tham nien:
               > 2 AND <= 5: Co xet
               <= 2: Khong xet*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.agqr_from_date = trunc(comp.agqr_effective_date, 'MM'),
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.agqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.agqr_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and months_between(
                add_months(trunc(valRecordDate, 'MM'), 1),
                trunc(comp.agqr_effective_date, 'MM')
                ) between 3 and 5
            and comp.agqr_effective_date >= AMS_MODL_COMP_MMXIII.COMP_DATE_AGQR_BEGN;
        commit;

        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.agqr_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_NO,
            comp.agqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.agqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.agqr_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and months_between(
                add_months(trunc(valRecordDate, 'MM'), 1),
                trunc(comp.agqr_effective_date, 'MM')
                ) <= 2;
        commit;
        -- End Add

        /* Xet cac dai ly lam viec trong ky*/
        /*update ams.la_compensation_mmxiii_tmp comp
        set
            comp.agqr_from_date = trunc(comp.agqr_effective_date, 'MM'),
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.agqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.agem_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and comp.agqr_effective_date
                between (add_months(trunc(valRecordDate, 'MM'), -2))
                and (add_months(trunc(valRecordDate, 'MM'), 1) - 1);
        commit;*/

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agqr_open', 'Xet cac dai ly lam viec trong ky  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 2;

        /* Len danh sach du lieu chi tiet can xoa*/
        merge /*+ CARDINALITY(agqr, 100)*/
            into ams.la_comp_mmxiii_agqr agqr
        using
            (
                select /*+ CARDINALITY(comp, 100)*/
                    comp.info_company_id company_id
                from ams.la_compensation_mmxiii_tmp comp
                where comp.record_date = trunc(valRecordDate, 'MM')
                    and comp.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                group by comp.info_company_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = agqr.record_date
            and
            upd.company_id = agqr.company_id
        )
        when matched then
            update
                set
                    agqr.agqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_DEL;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agqr_open', 'Len danh sach du lieu chi tiet can xoa  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 3;

        /* Xoa du lieu chi tiet*/
        loop
            delete ams.la_comp_mmxiii_agqr agqr
            where agqr.record_date = trunc(valRecordDate, 'MM')
                and agqr.agqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_DEL
                and rownum < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agqr_open', 'Xoa du lieu chi tiet  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 4;

        /* Len danh sach chi tiet cua dai ly*/
        for i in 0..2
        loop
            insert /*+ APPEND */ into ams.la_comp_mmxiii_agqr nologging(
                outlet_id,
                outlet_ams_id,
                record_date,
                version_date,
                outlet_name,
                company_id,
                effective_date,
                terminative_date,
                agqr_be_paid,
                agqr_be_executing,
                agqr_data_date,
                agqr_period_fyc,
                agqr_period_fyp,
                agqr_period_afis,
                agqr_period_afif,
                agqr_period_pr36,
                agqr_period_coll_etmt,
                agqr_period_coll_real,
                agqr_period_coll_rate,
                create_user,
                update_user,
                create_datetime,
                update_datetime)
            select /*+ CARDINALITY(comp, 100)*/
                comp.outlet_id,
                comp.outlet_ams_id,
                trunc(valRecordDate, 'MM'),
                trunc(sysdate, 'DD'),
                comp.info_outlet_name,
                comp.info_company_id,
                comp.agqr_effective_date,
                null,
                AMS_MODL_COMP_MMXIII.BE_PAID_DTL,
                AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
                add_months(trunc(valRecordDate, 'MM'), -i),
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                sysdate,
                sysdate
            from ams.la_compensation_mmxiii_tmp comp
            where comp.record_date = trunc(valRecordDate, 'MM')
                and comp.agqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                and comp.agqr_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                and add_months(trunc(valRecordDate, 'MM'), -i)
                    between comp.agqr_from_date
                    and comp.agqr_to_date;
            commit;
        end loop;

        /* AnhNH: Truong hop vao le quy: Cong them FYC tu quy truoc do*/
        for i in 3..4
        loop
            insert /*+ APPEND */ into ams.la_comp_mmxiii_agqr nologging(
                outlet_id,
                outlet_ams_id,
                record_date,
                version_date,
                outlet_name,
                company_id,
                effective_date,
                terminative_date,
                agqr_be_paid,
                agqr_be_executing,
                agqr_data_date,
                agqr_period_fyc,
                agqr_period_fyp,
                agqr_period_afis,
                agqr_period_afif,
                agqr_period_pr36,
                agqr_period_coll_etmt,
                agqr_period_coll_real,
                agqr_period_coll_rate,
                create_user,
                update_user,
                create_datetime,
                update_datetime)
            select /*+ CARDINALITY(comp, 100)*/
                comp.outlet_id,
                comp.outlet_ams_id,
                trunc(valRecordDate, 'MM'),
                trunc(sysdate, 'DD'),
                comp.info_outlet_name,
                comp.info_company_id,
                comp.agqr_effective_date,
                null,
                AMS_MODL_COMP_MMXIII.BE_PAID_SPC,
                AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
                add_months(trunc(valRecordDate, 'MM'), -i),
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                sysdate,
                sysdate
            from ams.la_compensation_mmxiii_tmp comp
            where comp.record_date = trunc(valRecordDate, 'MM')
                and comp.agqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                and comp.agqr_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                and add_months(trunc(valRecordDate, 'MM'), -i)
                    between comp.agqr_from_date
                    and comp.agqr_to_date;
            commit;
        end loop;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agqr_open', 'Len danh sach chi tiet cua dai ly  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 5;

        /* So lieu tong hop*/
        insert /*+ APPEND */ into ams.la_comp_mmxiii_agqr nologging(
            outlet_id,
            outlet_ams_id,
            record_date,
            version_date,
            outlet_name,
            company_id,
            effective_date,
            terminative_date,
            agqr_be_paid,
            agqr_be_executing,
            agqr_data_date,
            agqr_period_fyc,
            agqr_period_fyp,
            agqr_period_afis,
            agqr_period_afif,
            agqr_period_pr36,
            agqr_period_coll_etmt,
            agqr_period_coll_real,
            agqr_period_coll_rate,
            create_user,
            update_user,
            create_datetime,
            update_datetime)
        select /*+ CARDINALITY(agqr, 100)*/
            agqr.outlet_id,
            agqr.outlet_ams_id,
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            max(agqr.outlet_name),
            max(agqr.company_id),
            min(agqr.effective_date),
            null,
            AMS_MODL_COMP_MMXIII.BE_PAID_YES,
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
            trunc(valRecordDate, 'MM'),
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.la_comp_mmxiii_agqr agqr
        where agqr.record_date = trunc(valRecordDate, 'MM')
            and agqr.agqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and agqr.agqr_be_paid in
            (
                AMS_MODL_COMP_MMXIII.BE_PAID_DTL,
                AMS_MODL_COMP_MMXIII.BE_PAID_SPC
            )
        group by agqr.outlet_id,
            agqr.outlet_ams_id;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agqr_open', 'So lieu tong hop  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));

    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_agqr_open: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    /*  Update:  Nguyen Hung Anh
            Version: 1.1
            Date Updated: 1/8/2013
            Note:  Fix theo ID: 111434
    */

    procedure mmxiii_modl_agqr_data(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agqr_data', 'gather_table_stats inp_data_outlet_tmp thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 1;

        /* Chi tiet du lieu tung thang quay cho quy nen la lay tu -2 den 0
        ke tu thang dau tien cua quy cho den thang hien tai la thang cuoi cua quy*/
        for i in 0..2
        loop
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            merge  /*+ CARDINALITY(agqr, 100)
                  CARDINALITY(upd, 100)
                  LEADING(agqr upd) */
                into ams.la_comp_mmxiii_agqr agqr
            using
                (
                    select /*+ CARDINALITY(data, 100)*/
                        data.outlet_ams_id,
                        data.record_date data_date,
                        nvl(data.period_fyc, 0) period_fyc,
                        nvl(data.period_fyp, 0) period_fyp,
                        nvl(data.period_coll_etmt, 0) period_coll_etmt,
                        nvl(data.period_coll_real, 0) period_coll_real
                    from ams.inp_data_outlet_tmp data
                    where data.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                        and data.record_date = add_months(trunc(valRecordDate, 'MM') , -i)
                        and data.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                        and data.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                ) upd
            on (
                trunc(valRecordDate, 'MM') = agqr.record_date
                and
                AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = agqr.agqr_be_executing
                and
                AMS_MODL_COMP_MMXIII.BE_PAID_DTL = agqr.agqr_be_paid
                and
                add_months(trunc(valRecordDate, 'MM') , -i) = agqr.agqr_data_date
                and
                upd.outlet_ams_id = agqr.outlet_ams_id
            )
            when matched then
                update
                    set
                        agqr.agqr_period_fyc = upd.period_fyc,
                        agqr.agqr_period_fyp = upd.period_fyp,
                        agqr.agqr_period_coll_etmt = upd.period_coll_etmt,
                        agqr.agqr_period_coll_real = upd.period_coll_real,
                        agqr.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                        agqr.update_datetime = sysdate;
            commit;

            /*Cap nhat diem cho tung thang trong quy cua dai ly*/
            merge  /*+ CARDINALITY(agqr, 100)
                  CARDINALITY(upd, 100)
                  LEADING(agqr upd) */
                into ams.la_comp_mmxiii_agqr agqr
            using
                (
                    select /*+ CARDINALITY(data, 100)*/
                        data.agent_id outlet_id,
                        max(data.point) agqr_period_point
                    from ams.la_monthly_point data
                    where data.month = add_months(trunc(valRecordDate, 'MM') , -i)
                    group by data.agent_id
                ) upd
            on (
                trunc(valRecordDate, 'MM') = agqr.record_date
                and
                AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = agqr.agqr_be_executing
                and
                AMS_MODL_COMP_MMXIII.BE_PAID_DTL = agqr.agqr_be_paid
                and
                add_months(trunc(valRecordDate, 'MM') , -i) = agqr.agqr_data_date
                and
                upd.outlet_id = agqr.outlet_id
            )
            when matched then
                update
                    set
                        agqr.agqr_period_point = upd.agqr_period_point;
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'mmxiii_modl_agqr_data', 'Chi tiet du lieu tung thang quay cho quy  merge la_comp_mmxiii_agqr thang ' || to_char(add_months(trunc(valRecordDate, 'MM') , i), 'dd/mm/yyyy'));
        end loop;

        /* AnnhNH: FYC cong them*/
        for i in 3..4
        loop
            merge  /*+ CARDINALITY(agqr, 100)
                  CARDINALITY(upd, 100)
                  LEADING(agqr upd) */
                into ams.la_comp_mmxiii_agqr agqr
            using
                (
                    select /*+ CARDINALITY(data, 100)*/
                        data.outlet_ams_id,
                        data.record_date data_date,
                        nvl(data.period_fyc, 0) period_fyc
                    from ams.inp_data_outlet_tmp data
                    where data.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                        and data.record_date = add_months(trunc(valRecordDate, 'MM') , -i)
                        and data.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                        and data.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                ) upd
            on (
                trunc(valRecordDate, 'MM') = agqr.record_date
                and
                AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = agqr.agqr_be_executing
                and
                agqr.agqr_be_paid in
                (
                    AMS_MODL_COMP_MMXIII.BE_PAID_SPC
                )
                and
                add_months(trunc(valRecordDate, 'MM') , -i) = agqr.agqr_data_date
                and
                upd.outlet_ams_id = agqr.outlet_ams_id
            )
            when matched then
                update
                    set
                        agqr.agqr_period_fyc = upd.period_fyc,
                        agqr.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                        agqr.update_datetime = sysdate;
            commit;
        end loop;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agqr_data', 'merge ams.la_comp_mmxiii_agqr thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 2;

        /* PR36*/
        merge /*+ CARDINALITY(agqr, 100)*/
            into ams.la_comp_mmxiii_agqr agqr
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_ams_id,
                    data.record_date data_date,
                    nvl(data.period_afis, 0) period_afis,
                    nvl(data.period_afif, 0) period_afif
                from ams.inp_data_outlet_tmp data
                where data.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                    and data.record_date = trunc(valRecordDate, 'MM')
                    and data.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                    and data.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
            ) upd
        on (
            trunc(valRecordDate, 'MM') = agqr.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = agqr.agqr_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_DTL = agqr.agqr_be_paid
            and
            trunc(valRecordDate, 'MM') = agqr.agqr_data_date
            and
            upd.outlet_ams_id = agqr.outlet_ams_id
        )
        when matched then
            update
                set
                    agqr.agqr_period_afis = upd.period_afis,
                    agqr.agqr_period_afif = upd.period_afif,
                    agqr.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    agqr.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agqr_data', 'PR36 thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 3;

        dbms_stats.gather_table_stats(null, 'la_comp_mmxiii_agqr', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agqr_data', 'gather_table_stats la_comp_mmxiii_agqr thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* Tong hop so lieu cac chi tieu ngoai chi tieu FYC*/
        merge /*+ CARDINALITY(agqr, 100)*/
            into ams.la_comp_mmxiii_agqr agqr
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_ams_id,
                    sum(nvl(data.agqr_period_fyp, 0)) agqr_period_fyp,
                    sum(nvl(data.agqr_period_afis, 0)) agqr_period_afis,
                    sum(nvl(data.agqr_period_afif, 0)) agqr_period_afif,
                    sum(nvl(data.agqr_period_coll_etmt, 0)) agqr_period_coll_etmt,
                    sum(nvl(data.agqr_period_coll_real, 0)) agqr_period_coll_real
                from ams.la_comp_mmxiii_agqr data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.agqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and data.agqr_be_paid in
                    (
                        AMS_MODL_COMP_MMXIII.BE_PAID_DTL/*,
                        AMS_MODL_COMP_MMXIII.BE_PAID_SPC*/
                    )
                group by data.outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = agqr.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = agqr.agqr_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = agqr.agqr_be_paid
            and
            upd.outlet_ams_id = agqr.outlet_ams_id
        )
        when matched then
            update
                set
                    agqr.agqr_period_fyp = upd.agqr_period_fyp,
                    agqr.agqr_period_afis = upd.agqr_period_afis,
                    agqr.agqr_period_afif = upd.agqr_period_afif,
                    agqr.agqr_period_coll_etmt = upd.agqr_period_coll_etmt,
                    agqr.agqr_period_coll_real = upd.agqr_period_coll_real;
        commit;

        /* AnhNH: FYC phai tinh cho ca 2 thang da co cua thang le quy*/
        merge /*+ CARDINALITY(agqr, 100)*/
            into ams.la_comp_mmxiii_agqr agqr
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_ams_id,
                    sum(nvl(data.agqr_period_fyc, 0)) agqr_period_fyc
                from ams.la_comp_mmxiii_agqr data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.agqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and data.agqr_be_paid in
                    (
                        AMS_MODL_COMP_MMXIII.BE_PAID_DTL,
                        /*tinh ca FYC o thang le quy*/
                        AMS_MODL_COMP_MMXIII.BE_PAID_SPC
                    )
                group by data.outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = agqr.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = agqr.agqr_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = agqr.agqr_be_paid
            and
            upd.outlet_ams_id = agqr.outlet_ams_id
        )
        when matched then
            update
                set
                    agqr.agqr_period_fyc = upd.agqr_period_fyc;
        commit;

        /*Lay diem theo quy tach ra the nay de tinh duoc chinh xac diem cho no trong quy*/
        merge /*+ CARDINALITY(agqr, 100)*/
            into ams.la_comp_mmxiii_agqr agqr
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_ams_id,
                    /*chinhlk 7/5/2013 cap nhat lai theo yeu cau moi la:
                    chi co duoc cham diem ca 3 thang thi moi tinh, con khong cham 1 thang thi cho bang null luon*/
                    decode(count(data.outlet_ams_id),
                        3, round(sum(nvl(data.agqr_period_point, 0)) / count(data.outlet_ams_id), 2),
                        null) agqr_period_point
                from ams.la_comp_mmxiii_agqr data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.agqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and data.agqr_be_paid in
                    (
                        AMS_MODL_COMP_MMXIII.BE_PAID_DTL
                    )
                    and data.agqr_period_point is not null--can phai co them dieu kien nay thi moi chinh xac duoc cho no
                    --neu khong thi se tinh sai
                group by data.outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = agqr.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = agqr.agqr_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = agqr.agqr_be_paid
            and
            upd.outlet_ams_id = agqr.outlet_ams_id
        )
        when matched then
            update
                set
                    agqr.agqr_period_point = upd.agqr_period_point;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agqr_data', 'Tong hop so lieu thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 4;

        merge /*+ CARDINALITY(comp, 100)*/
            into ams.la_compensation_mmxiii_tmp comp
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_ams_id,
                    data.agqr_period_fyc,
                    data.agqr_period_fyp,
                    data.agqr_period_afis,
                    data.agqr_period_afif,
                    data.agqr_period_coll_etmt,
                    data.agqr_period_coll_real,
                    data.agqr_period_point
                from ams.la_comp_mmxiii_agqr data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.agqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and data.agqr_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.agqr_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = comp.agqr_be_paid
            and
            upd.outlet_ams_id = comp.outlet_ams_id
        )
        when matched then
            update
                set
                    comp.agqr_period_fyc = upd.agqr_period_fyc,
                    comp.agqr_period_fyp = upd.agqr_period_fyp,
                    comp.agqr_period_afis = upd.agqr_period_afis,
                    comp.agqr_period_afif = upd.agqr_period_afif,
                    comp.agqr_period_coll_etmt = upd.agqr_period_coll_etmt,
                    comp.agqr_period_coll_real = upd.agqr_period_coll_real,
                    comp.agqr_period_point = upd.agqr_period_point,
                    comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    comp.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agqr_data', 'Tong hop so lieu 2 thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 5;

        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.agqr_period_pr36 =
                round(
                    decode(nvl(comp.agqr_period_afis, 0),
                        0, 100,
                        least(
                            (nvl(comp.agqr_period_afif, 0) / nvl(comp.agqr_period_afis, 0)) * 100,
                            999.99
                        )
                    ),
                    2
                ),
            comp.agqr_period_coll_rate =
                round(
                    decode(nvl(comp.agqr_period_coll_etmt, 0),
                        0, 100,
                        least(
                            (nvl(comp.agqr_period_coll_real, 0) / nvl(comp.agqr_period_coll_etmt, 0)) * 100,
                            999.99
                        )
                    ),
                    2
                ),
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.agqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.agqr_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agqr_data', 'PR36 thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));

    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_agqr_data: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_agqr_cond(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Cap nhat Dieu kien Ty Le Thu Phi >= 92%*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.agqr_cond_coll_rate = 92,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.agqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.agqr_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agqr_cond', 'Cap nhat Dieu kien Ty Le Thu Phi >= 92% thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 1;

        /* Cap nhat ty le thuong quy dai ly*/
        merge /*+ CARDINALITY(comp, 100)*/
            into ams.la_compensation_mmxiii_tmp comp
        using
            (
                select
                    15000000 fyp_from,
                    30000000 fyp_to,
                    85 pers_ratio_from,
                    93 pers_ratio_to,
                    5 comp_ratio
                from dual
                union
                select
                    15000000 fyp_from,
                    30000000 fyp_to,
                    93 pers_ratio_from,
                    1000 pers_ratio_to,
                    10 comp_ratio
                from dual
                union
                select
                    30000000 fyp_from,
                    80000000 fyp_to,
                    85 pers_ratio_from,
                    93 pers_ratio_to,
                    8 comp_ratio
                from dual
                union
                select
                    30000000 fyp_from,
                    80000000 fyp_to,
                    93 pers_ratio_from,
                    1000 pers_ratio_to,
                    13 comp_ratio
                from dual
                union
                select
                    80000000 fyp_from,
                    150000000 fyp_to,
                    85 pers_ratio_from,
                    93 pers_ratio_to,
                    13 comp_ratio
                from dual
                union
                select
                    80000000 fyp_from,
                    150000000 fyp_to,
                    93 pers_ratio_from,
                    1000 pers_ratio_to,
                    18 comp_ratio
                from dual
                union
                select
                    150000000 fyp_from,
                    10000000000000 fyp_to,
                    85 pers_ratio_from,
                    93 pers_ratio_to,
                    20 comp_ratio
                from dual
                union
                select
                    150000000 fyp_from,
                    10000000000000 fyp_to,
                    93 pers_ratio_from,
                    1000 pers_ratio_to,
                    25 comp_ratio
                from dual
            ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.agqr_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = comp.agqr_be_paid
            and
            comp.agqr_period_pr36 >= upd.pers_ratio_from
            and
            comp.agqr_period_pr36 < upd.pers_ratio_to
            and
            nvl(comp.agqr_period_fyp, 0) >= upd.fyp_from
            and
            nvl(comp.agqr_period_fyp, 0) < upd.fyp_to
            )
        when matched then
            update
                set
                    comp.agqr_comp_ratio = upd.comp_ratio,
                    comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    comp.update_datetime = sysdate;
        commit;

        /* Cap nhat ty le thuong theo diem hang thang dai ly*/
        merge /*+ CARDINALITY(comp, 100)*/
            into ams.la_compensation_mmxiii_tmp comp
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.from_point,
                    nvl(tmp.to_point, 999) to_point,
                    tmp.coefficient agqr_activity_coefficient
                from ams.la_grading_coefficient tmp
                where tmp.grading_group_id = '2011DL'
            ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.agqr_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = comp.agqr_be_paid
            and
            comp.agqr_period_point >= upd.from_point
            and
            comp.agqr_period_point < upd.to_point
            )
        when matched then
            update
                set
                    comp.agqr_activity_coefficient = upd.agqr_activity_coefficient;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agqr_cond', 'Cap nhat ty le thuong quy dai ly thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_agqr_cond: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_agqr_comp(valRecordDate date := null)
    is
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Dieu chinh ty le FYC = 0 neu khong dat ty le thu phi*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.agqr_comp_ratio = 0,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.agqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.agqr_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and nvl(comp.agqr_period_coll_rate, 0) < nvl(comp.agqr_cond_coll_rate, 0);
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agqr_comp', 'Dieu chinh ty le FYC = 0 neu khong dat ty le thu phi  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* Tinh thu lao thuong quy dai ly
        Neu ma khong co ty le hoat dong thi = 1 luon cho no*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.agqr_comp_money_calc = nvl(comp.agqr_period_fyc, 0) * nvl(comp.agqr_comp_ratio, 0)/ 100,
            comp.agqr_comp_money = nvl(comp.agqr_period_fyc, 0) * nvl(comp.agqr_comp_ratio, 0) *  nvl(comp.agqr_activity_coefficient, 1)/ 100,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.agqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.agqr_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agqr_comp', 'Tinh thu lao thuong quy dai ly  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    end;

    procedure mmxiii_modl_agqr_close(valRecordDate date := null)
    is
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Ket thuc qua trinh tinh thu lao quy dai ly
           trong bang la_comp_mmxiii_agqr*/
        update ams.la_comp_mmxiii_agqr agqr
        set
            agqr.agqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO
        where agqr.record_date = trunc(valRecordDate, 'MM')
            and agqr.agqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agqr_close', 'Ket thuc qua trinh la_comp_mmxiii_agqr thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* Ket thuc qua trinh tinh thu lao quy dai ly
           trong bang la_compensation_mmxiii_tmp*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.agqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.agqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agqr_close', 'Ket thuc qua trinh tinh thu lao quy dai ly thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    end;


    procedure mmxiii_modl_agem(valRecordDate date := null)
    is
    begin
        if (
            AMS_CORE_MODULE.is_active(
                AMS_MODL_COMP_MMXIII.MMXIII_COMP_AGEM,
                trunc(valRecordDate, 'MM')
            ) = AMS_CORE_MODULE.IS_YES
        ) then
            for var_result in (
                select comp_date.compensation_date
                from ams.mod_comp_date comp_date
                where comp_date.module_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_COMP
                    and comp_date.sub_code = AMS_MODL_COMP_MMXIII.MMXIII_COMP_AGEM
                    and comp_date.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                    and comp_date.compensation_date = trunc(valRecordDate, 'MM')
                group by comp_date.compensation_date
            ) loop
                AMS_MODL_COMP_MMXIII.mmxiii_modl_agem_open(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_agem_data(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_agem_cond(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_agem_comp(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_agem_close(valRecordDate);
            end loop;
        end if;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 1/2/2013
        Version: 1.0
        Description: Thu tuc tinh toan cac chi tieu cho thuong tuyen dung phan khoi tao
        Parameter:
            valRecordDate [date]: Thang chay
        Update:  Nguyen Hung Anh
            Version: 1.1
            Date Updated: 9/8/2013
            Note:  Fix theo ID: 113172
                      Khong tinh FYC cua cac dai ly duoc tuyen khi DL trong thoi gian la tu van vien thanh cong
    */
    procedure mmxiii_modl_agem_open(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
        var_month_qty number(1) := 2; --so thang se quay lai
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Len danh sach Tu van vien tinh thu lao tuyen dung*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.agem_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES,
            comp.agem_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
            comp.agem_outlet_id = comp.outlet_id,
            comp.agem_outlet_ams_id = comp.outlet_ams_id,
            comp.agem_from_date = (add_months(trunc(valRecordDate, 'MM'), -2)),
            comp.agem_to_date = (add_months(trunc(valRecordDate, 'MM'), 1) - 1),
            comp.agem_position_code = comp.info_position_code,
            comp.agem_period_fyc = 0,
            comp.agem_period_empl = 0,
            comp.agem_comp_ratio = 0,
            comp.agem_comp_money = 0,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.status_code = AMS_MODL_COMP_MMXIII.STATUS_CURR
            and comp.info_position_code in (
                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV01,
                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02,
                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV03,
                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
            );
        commit;

        /* Neu tham niem lam TTN < 3 thang thi ko xet
        */
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.agem_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO,
            comp.agem_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_NO,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.info_position_code in (
                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV01
            )
            and months_between(
                add_months(trunc(valRecordDate, 'MM'), 1),
                trunc(comp.info_position_date, 'MM') - 1
                ) < 3;
        commit;

        /* Neu dac cach vao lam truong nhom, truong ban */
        -- T/h1: Tham nien lam viec, tham nien lam TN, TB chua du 3 thang
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.agem_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO,
            comp.agem_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_NO,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.info_position_code in (
                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02,
                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV03,
                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
            )
            and months_between(
                add_months(trunc(valRecordDate, 'MM'), 1),
                trunc(comp.info_position_date, 'MM') - 1
                ) < 3
            and months_between(
                add_months(trunc(valRecordDate, 'MM'), 1),
                trunc(comp.info_effective_date, 'MM') - 1
                ) < 3;
        commit;

        -- T/h2: Tham nien lam TN, TB chua du 3 thang va dc dac cach len TN, TB tu TVV
        merge
            into ams.la_compensation_mmxiii_tmp comp
        using
            (
                 select
                    inp.outlet_ams_id
                 from ams.inp_data_outlet inp
                 where inp.position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV05
                     and inp.record_date = add_months(trunc(valRecordDate, 'MM'), -2)
            ) upd
        on (
            comp.record_date = trunc(valRecordDate, 'MM')
            and
            comp.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and
            comp.info_position_code in (
                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02,
                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV03,
                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
            )
            and
            upd.outlet_ams_id = comp.outlet_ams_id
        )
        when matched then
            update
                set
                    comp.agem_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO,
                    comp.agem_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_NO,
                    comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    comp.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agem_open', 'Len danh sach Tu van vien tinh thu lao tuyen dung  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 1;

        /* Len danh sach du lieu chi tiet can xoa*/
        merge /*+ CARDINALITY(agem, 100)*/
            into ams.la_comp_mmxiii_agem agem
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.info_company_id company_id
                from ams.la_compensation_mmxiii_tmp tmp
                where tmp.record_date = trunc(valRecordDate, 'MM')
                    and tmp.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                group by tmp.info_company_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = agem.record_date
            and
            upd.company_id = agem.company_id
        )
        when matched then
            update
                set
                    agem.agem_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_DEL;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agem_open', 'Len danh sach du lieu chi tiet can xoa  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 2;

        /* Xoa du lieu chi tiet*/
        loop
            delete ams.la_comp_mmxiii_agem agem
            where agem.record_date = trunc(valRecordDate, 'MM')
                and agem.agem_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_DEL
                and rownum < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agem_open', 'Xoa du lieu chi tiet  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* Danh sach chi tiet cac dai ly duoc tuyen dung
        Cho nay can phai chinh lai va lay cac cac dai ly duoc tuyen tu 15/12/2012 cho den 31/12/2012 nua de cho day du so lieu
        Neu ma chay o thang 3 thi tuc quy 1 thi can phai lay cac cac dai ly duoc tuyen tu 15/12/2012 cho den 31/12/2012 nua de cho day du so lieu
        nen phai back lai 4 thang ke tu thang 3 lay ca thang 12 nam 2012 nua de lay cac dai ly tren
        con binh thuong chi can i tu 0 den 2
        truong hop thang 3 nam 2012 thi i chay tu 0 den 3*/

        var_month_qty := 2;
        --Neu chay thang 3 nam 2013 thi se back lai 4 thang de lay so lieu dai ly tuyen moi cho dung
        if to_char(trunc(valRecordDate, 'MM'), 'DDMM') = '0103' then
            var_month_qty := 3;
        end if;

        for i in 0..var_month_qty
        loop
            insert /*+ APPEND */ into ams.la_comp_mmxiii_agem nologging(
                outlet_id,
                outlet_ams_id,
                record_date,
                version_date,
                outlet_name,
                company_id,
                agency_id,
                agency_ams_id,
                agency_name,
                unit_id,
                unit_ams_id,
                unit_name,
                effective_date,
                terminative_date,
                senr_by_month,
                empl_position_code,
                agem_be_paid,
                agem_be_executing,
                agem_data_date,
                agem_outlet_id,
                agem_outlet_ams_id,
                agem_period_fyc,
                agem_period_empl,
                agem_comp_ratio,
                agem_comp_money,
                create_user,
                update_user,
                create_datetime,
                update_datetime)
            select  /*+ CARDINALITY(key, 100) CARDINALITY(empl, 100) CARDINALITY(outl, 100)*/
                outl.outlet_id,
                outl.outlet_ams_id,
                trunc(valRecordDate, 'MM'),
                trunc(sysdate, 'DD'),
                outl.outlet_name,
                outl.company_id,
                outl.agency_id,
                outl.agency_ams_id,
                outl.agency_name,
                outl.unit_id,
                outl.unit_ams_id,
                outl.unit_name,
                outl.effective_date,
                outl.terminative_date,
                round(
                    months_between(
                        add_months(trunc(valRecordDate, 'MM'), 0),
                        trunc(outl.effective_date - 15, 'MM')
                    )
                ),
                null, --chuc vu khi tuyen thi se phai de sau day se merge thong tin cho no
                AMS_MODL_COMP_MMXIII.BE_PAID_DTL,
                AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
                add_months(trunc(valRecordDate, 'MM'), -i),
                key.agem_outlet_id,
                key.agem_outlet_ams_id,
                0,
                0,
                0,
                0,
                AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                sysdate,
                sysdate
            from
            (   /*cac dai ly ta thang hien tai con duy tri tien truong nhom truong nhom truong ban*/
                select /*+ CARDINALITY(comp, 100)*/
                   comp.agem_outlet_id,
                   comp.agem_outlet_ams_id
                from ams.la_compensation_mmxiii_tmp comp
                where comp.record_date = trunc(valRecordDate, 'MM')
                    and comp.agem_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and comp.agem_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            ) key
            join --lay ra danh sach cac dai ly duoc cac ca nhan tren tuyen vao
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_id,
                    tmp.empl_id
                from ams.la_prom_history_agent_tmp tmp
                where tmp.record_date = trunc(valRecordDate, 'MM')
            ) empl
                on empl.empl_id = key.agem_outlet_id--dl nay tuyen dung
            join --lay ra chi tiet thong tin cac dai ly duoc tuyen vao
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_id,
                    tmp.outlet_ams_id,
                    tmp.outlet_name,
                    tmp.company_id,
                    tmp.agency_id,
                    tmp.agency_ams_id,
                    tmp.agency_name,
                    tmp.unit_id,
                    tmp.unit_ams_id,
                    tmp.unit_name,
                    tmp.effective_date,
                    tmp.terminative_date
                from ams.inp_data_outlet_tmp tmp
                where tmp.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                    and tmp.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                    and tmp.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                    and tmp.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                    --CHO NAY CAN HOI LAI
                    and tmp.effective_date--chi tinh cac dai ly duoc tuyen moi tu 16/12/2012 den 15/12/2013
                        between trunc(valRecordDate, 'YYYY') - 16  --16/12/2012
                        and (add_months(trunc(valRecordDate, 'YYYY'), 12) - 17) --15/12/2013
                    /*dai ly chua nghi viec hay da nghi trong thang*/
                    and (
                        tmp.terminative_date is null
                        or
                        tmp.terminative_date
                            between add_months(trunc(valRecordDate, 'MM'), -i)
                            and (add_months(trunc(valRecordDate, 'MM'), 1 -i) - 1)
                    )
            ) outl
                on outl.outlet_id = empl.outlet_id; --dl nay duoc tuyen vao
            commit;
        end loop;

/*        for var_agem in (
            select
               comp.agem_outlet_id,
               comp.agem_outlet_ams_id
            from ams.la_compensation_mmxiii_tmp comp
            where comp.record_date = trunc(valRecordDate, 'MM')
                and comp.agem_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                and comp.agem_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
        )
        loop
            for i in 0..2
            loop
                for var_empl in (
                    select lha.agent_id empl_outlet_id,
                        lha.history_number outlet_id,
                        (
                            select
                                max(tmp.position_code)
                            from ams.serv_outlet_data tmp
                            where tmp.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                                and tmp.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                                and tmp.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                                and tmp.outlet_id = var_agem.agem_outlet_id
                        ) position_code
                    from ams.la_history_agent lha
                    where lha.type_code = 'DLTD'
                        and lha.current_is = 'Y'
                        and lha.history_number = var_agem.agem_outlet_id
                )
                loop
                    insert \*+ APPEND *\ into ams.la_comp_mmxiii_agem nologging(
                        outlet_id,
                        outlet_ams_id,
                        record_date,
                        version_date,
                        outlet_name,
                        company_id,
                        agency_id,
                        agency_ams_id,
                        agency_name,
                        unit_id,
                        unit_ams_id,
                        unit_name,
                        effective_date,
                        terminative_date,
                        senr_by_month,
                        empl_position_code,
                        agem_be_paid,
                        agem_be_executing,
                        agem_data_date,
                        agem_outlet_id,
                        agem_outlet_ams_id,
                        agem_period_fyc,
                        agem_period_empl,
                        agem_comp_ratio,
                        agem_comp_money,
                        create_user,
                        update_user,
                        create_datetime,
                        update_datetime)
                    select outl.outlet_id,
                        outl.outlet_ams_id,
                        trunc(valRecordDate, 'MM'),
                        trunc(sysdate, 'DD'),
                        outl.outlet_name,
                        outl.company_id,
                        outl.agency_id,
                        outl.agency_ams_id,
                        outl.agency_name,
                        outl.unit_id,
                        outl.unit_ams_id,
                        outl.unit_name,
                        outl.effective_date,
                        outl.terminative_date,
                        round(
                            months_between(
                                add_months(trunc(valRecordDate, 'MM'), 0),
                                trunc(outl.effective_date - 15, 'MM')
                            )
                        ),
                        var_empl.position_code,
                        AMS_MODL_COMP_MMXIII.BE_PAID_DTL,
                        AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
                        add_months(trunc(valRecordDate, 'MM'), -i),
                        var_agem.agem_outlet_id,
                        var_agem.agem_outlet_ams_id,
                        0,
                        0,
                        0,
                        0,
                        AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                        AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                        sysdate,
                        sysdate
                    from ams.inp_data_outlet_tmp outl
                    where outl.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                        and outl.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                        and outl.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                        and outl.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                        and outl.outlet_id = var_empl.empl_outlet_id
                        --CHO NAY CAN HOI LAI
                        and outl.effective_date--chi tinh cac dai ly duoc tuyen moi tu 16/12/2012 den 15/12/2013
                            between trunc(valRecordDate, 'YYYY') - 16  --16/12/2012
                            and (add_months(trunc(valRecordDate, 'YYYY'), 12) - 17) --15/12/2-13
                        and (
                            outl.terminative_date is null
                            or
                            outl.terminative_date
                                between add_months(trunc(valRecordDate, 'MM'), -i)
                                and (add_months(trunc(valRecordDate, 'MM'), 1 -i) - 1)
                        );
                    commit;
                end loop;
            end loop;
        end loop;
*/
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agem_open', 'Danh sach chi tiet cac dai ly duoc tuyen dung  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 3;

        /* So lieu tong hop*/
        insert /*+ APPEND */ into ams.la_comp_mmxiii_agem nologging(
            outlet_id,
            outlet_ams_id,
            record_date,
            version_date,
            outlet_name,
            company_id,
            effective_date,
            terminative_date,
            agem_be_paid,
            agem_be_executing,
            agem_data_date,
            agem_outlet_id,
            agem_outlet_ams_id,
            agem_period_fyc,
            agem_period_empl,
            agem_comp_ratio,
            agem_comp_money,
            create_user,
            update_user,
            create_datetime,
            update_datetime
        )
        select  /*+ CARDINALITY(agem, 100)*/
            agem.outlet_id,
            agem.outlet_ams_id,
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            max(agem.outlet_name),
            max(agem.company_id),
            min(agem.effective_date),
            max(agem.terminative_date),
            AMS_MODL_COMP_MMXIII.BE_PAID_YES,
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
            trunc(valRecordDate, 'MM'),
            agem.agem_outlet_id,
            agem.agem_outlet_ams_id,
            0,
            0,
            0,
            0,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.la_comp_mmxiii_agem agem
        where agem.record_date = trunc(valRecordDate, 'MM')
            and agem.agem_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and agem.agem_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_DTL
            and agem.senr_by_month > 0
        group by agem.outlet_id,
            agem.outlet_ams_id,
            agem.agem_outlet_id,
            agem.agem_outlet_ams_id;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agem_open', 'So lieu tong hop  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 4;

        --Du lieu chi cap nhat o dong IS PAID la dong tong hop thoi nhe
        --khong cap nhat o dong chi tiet
        /* Cap nhat chuc vu khi tuyen dai ly moi cua dai ly tuyen dai ly moi vao tai thang tuyen vao*/
        merge /*+ CARDINALITY(agem, 100)*/
            into ams.la_comp_mmxiii_agem agem
        using
            (
                select /*+ CARDINALITY(empl, 100)
                           CARDINALITY(outl, 100) */
                    empl.outlet_ams_id, --lay ra ma dai ly moi duoc tuyen vao
                    outl.position_code empl_position_code --va ma chuc vu cua dai ly tuyen dai ly moi  vao
                from
                (  --lay ra danh sach cac dai ly duoc tuyen vao va ngay duoc tuyen vao tai tung thang
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_ams_id,
                        tmp.agem_outlet_ams_id,
                        tmp.effective_date
                    from ams.la_comp_mmxiii_agem tmp
                    where tmp.record_date = trunc(valRecordDate, 'MM')
                        and tmp.agem_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                        and tmp.agem_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                ) empl
                join
                ( --join voi danh sach cac tien truong nhom truong nhom truong ban tuyen cac dai ly tai tung thang
                    select /*+ CARDINALITY(data, 100)*/
                        data.outlet_ams_id agem_outlet_ams_id,
                        data.record_date,
                        data.position_code  --vi tri tai thang day
                    from ams.inp_data_outlet_tmp data
                    where data.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                        /*cap nhat lay so lieu trong vong 1 nam tro ve truoc de cho day du so lieu*/
                        and data.record_date
                            between add_months(trunc(valRecordDate, 'MM'), -12)
                            and trunc(valRecordDate, 'MM')
                        and data.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                        and data.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                ) outl
                    on
                    (
                        outl.agem_outlet_ams_id = empl.agem_outlet_ams_id
                        and--cho nay du lieu co the co rat nhieu dong nhung chi cai dong
                        --ma thang ma co ngay ky hop dong cua dai ly moi
                        --bang voi thang cua dai ly di tuyen dai ly moi do vao thi ra chi 1 dong
                        trunc(outl.record_date, 'MM') = trunc(empl.effective_date, 'MM') --lay ra ma chuc vu tai thang tuyen dai ly day
                    )
            ) upd
        on (
            trunc(valRecordDate, 'MM') = agem.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = agem.agem_be_paid
            and
            upd.outlet_ams_id = agem.outlet_ams_id
        )
        when matched then
            update
                set
                    agem.empl_position_code = upd.empl_position_code,
                    agem.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    agem.update_datetime = sysdate;
        commit;

        /*Khong xu ly doi voi cac truong hop ma khi tuyen vao la Tu Van Vien*/
        update ams.la_comp_mmxiii_agem agem
        set
            agem.agem_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_NO,
            agem.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            agem.update_datetime = sysdate
        where agem.record_date = trunc(valRecordDate, 'MM')
            and agem.agem_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            /*lay ca truong hop DETAIL va YES vao cho no dung*/
            /*Khong xu ly doi voi cac truong hop ma chuc vu khi tuyen DL moi
            vao la Tu Van Vien*/
            and agem.empl_position_code not in
            (
                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV01,
                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02,
                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV03,
                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
            );
        commit;
        /*Khong xu ly doi voi cac truong hop ma khi dai ly tuyen dai ly moi tuyen vao la Tu Van Vien va khong phai la tien truong nhom tro len
        Them dieu kien de hoan toan khong xu ly tiep theo*/
        update ams.la_comp_mmxiii_agem agem
        set
            agem.agem_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO,
            agem.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            agem.update_datetime = sysdate
        where agem.record_date = trunc(valRecordDate, 'MM')
            and agem.agem_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            /*lay ca truong hop DETAIL va YES vao cho no dung*/
            /*Khong xu ly doi voi cac truong hop ma chuc vu khi tuyen DL moi
            vao la Tu Van Vien*/
            and agem.empl_position_code not in
            (
                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV01,
                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02,
                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV03,
                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
            );
        commit;

/*        \* Cap nhat chuc vu khi tuyen dai ly moi*\
        merge \*+ CARDINALITY(agem, 100)*\
            into ams.la_comp_mmxiii_agem agem
        using
            (
                select \*+ CARDINALITY(empl, 100)
                           CARDINALITY(outl, 100) *\
                    empl.outlet_ams_id,
                    outl.position_code empl_position_code
                from
                (
                    select \*+ CARDINALITY(tmp, 100)*\
                        tmp.outlet_ams_id,
                        tmp.agem_outlet_ams_id,
                        tmp.effective_date
                    from ams.la_comp_mmxiii_agem tmp
                    where tmp.record_date = trunc(valRecordDate, 'MM')
                        and tmp.agem_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                        and tmp.agem_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                ) empl
                join
                (
                    select \*+ CARDINALITY(data, 100)*\
                        data.outlet_ams_id agem_outlet_ams_id,
                        data.record_date,
                        data.position_code
                    from ams.inp_data_outlet_tmp data
                    where data.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                        and data.record_date
                            between add_months(trunc(valRecordDate, 'MM'), -3)
                            and trunc(valRecordDate, 'MM')
                        and data.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                        and data.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                ) outl
                    on
                    (
                        outl.agem_outlet_ams_id = empl.agem_outlet_ams_id
                        and
                        trunc(outl.record_date, 'MM') = trunc(empl.effective_date, 'MM')
                    )
            ) upd
        on (
            trunc(valRecordDate, 'MM') = agem.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = agem.agem_be_paid
            and
            upd.outlet_ams_id = agem.outlet_ams_id
        )
        when matched then
            update
                set
                    agem.empl_position_code = upd.empl_position_code,
                    agem.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    agem.update_datetime = sysdate;
        commit;
*/
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agem_open', 'Cap nhat chuc vu khi tuyen dai ly moi  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_agem_open: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_agem_data(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
        var_month_qty number(1) := 2; --so thang se quay lai
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Chi tiet du lieu tung thang*/
        /* Chi tiet du lieu tung thang quay ke tu thang hien tai la thang cuoi cua quy cho den thang dau tien cua quy*/
        var_month_qty := 2;
        --Neu chay thang 3 nam 2013 thi se back lai 4 thang de lay so lieu dai ly tuyen moi cho dung
        if to_char(trunc(valRecordDate, 'MM'), 'DDMM') = '0103' then
            var_month_qty := 3;
        end if;

        for i in 0..var_month_qty
        loop
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            merge  /*+ CARDINALITY(agem, 100)
                  CARDINALITY(upd, 100)
                  LEADING(agem upd) */
                into ams.la_comp_mmxiii_agem agem
            using
                (
                    select /*+ CARDINALITY(data, 100)*/
                        data.outlet_ams_id,
                        data.record_date data_date,
                        nvl(data.period_fyc, 0) period_fyc
                    from ams.inp_data_outlet_tmp data
                    where data.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                        and data.record_date = add_months(trunc(valRecordDate, 'MM') , -i)
                        and data.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                        and data.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                ) upd
            on (
                trunc(valRecordDate, 'MM') = agem.record_date
                and
                AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = agem.agem_be_executing
                and
                AMS_MODL_COMP_MMXIII.BE_PAID_DTL = agem.agem_be_paid
                and
                add_months(trunc(valRecordDate, 'MM') , -i) = agem.agem_data_date
                and
                upd.outlet_ams_id = agem.outlet_ams_id
            )
            when matched then
                update
                    set
                        agem.agem_period_fyc = upd.period_fyc,
                        agem.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                        agem.update_datetime = sysdate;
            commit;
            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'mmxiii_modl_agem_data', 'Chi tiet du lieu tung thang thang ' || to_char(add_months(trunc(valRecordDate, 'MM') , -i), 'dd/mm/yyyy'));
        end loop;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agem_data', 'Chi tiet du lieu tung thang  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 1;
        /* Tong hop du lieu*/
        merge /*+ CARDINALITY(agem, 100)*/
            into ams.la_comp_mmxiii_agem agem
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_ams_id,
                    sum(nvl(data.agem_period_fyc, 0)) agem_period_fyc
                from ams.la_comp_mmxiii_agem data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.agem_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and data.agem_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_DTL
                group by data.outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = agem.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = agem.agem_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = agem.agem_be_paid
            and
            upd.outlet_ams_id = agem.outlet_ams_id
        )
        when matched then
            update
                set
                    agem.agem_period_fyc = upd.agem_period_fyc,
                    agem.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    agem.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agem_data', 'Tong hop du lieu  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 2;

        /* Cac truong hop khong duoc tinh tuyen dung khi khong phai la
           Tien truong nhom
           Truong nhom CNTH
           Truong nhom
           Truong ban
           Do chi xu ly o dong
           agem.agem_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
           nen cho nay se xu ly duoc cho no
           */
        update ams.la_comp_mmxiii_agem agem
        set
            agem.agem_period_empl = 1,
            agem.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            agem.update_datetime = sysdate
        where agem.record_date = trunc(valRecordDate, 'MM')
            and agem.agem_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and agem.agem_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            --tinh trong tu 3 thang truoc cua no nhu the nay la dung roi ke ca tu 16/12/2012 den 31/12/2012 cung da co o day
            --do k lien quan den so lieu thang nay
            and agem.effective_date
                between (add_months(trunc(valRecordDate, 'MM'), -3) + 15)
                and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
            and (
                agem.terminative_date is null
                or
                agem.terminative_date > (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
            )
            and agem.empl_position_code in
            (
                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV01,
                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02,
                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV03,
                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
            );
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agem_data', 'Cac truong hop khong duoc tinh tuyen dung   thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 3;

        merge /*+ CARDINALITY(agem, 100)*/
            into ams.la_compensation_mmxiii_tmp comp
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.agem_outlet_ams_id,
                    sum(nvl(tmp.agem_period_fyc, 0)) agem_period_fyc,
                    sum(nvl(tmp.agem_period_empl, 0)) agem_period_empl
                from ams.la_comp_mmxiii_agem tmp
                where tmp.record_date = trunc(valRecordDate, 'MM')
                    and tmp.agem_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and tmp.agem_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                group by tmp.agem_outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.agem_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = comp.agem_be_paid
            and
            upd.agem_outlet_ams_id = comp.agem_outlet_ams_id
            )
        when matched then
            update
                set
                    comp.agem_period_fyc = upd.agem_period_fyc,
                    comp.agem_period_empl = upd.agem_period_empl,
                    comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    comp.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agem_data', 'Ty le  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_agem_open: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_agem_cond(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Xac dinh ty le huong theo FYC trong ky*/
        merge /*+ CARDINALITY(comp, 100)*/
            into ams.la_compensation_mmxiii_tmp comp
        using
            (
                select
                    2 index_from,
                    3 index_to,
                    7 comp_ratio
                from dual
                union
                select
                    3 index_from,
                    999 index_to,
                    10 comp_ratio
                from dual
            ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.agem_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = comp.agem_be_paid
            and
            upd.index_from <= comp.agem_period_empl
            and
            upd.index_to > comp.agem_period_empl
            )
        when matched then
            update
                set
                    comp.agem_comp_ratio = upd.comp_ratio,
                    comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    comp.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agem_cond', 'Xac dinh ty le huong theo FYC trong ky  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 1;

        /* Cap nhap ty le huong chi tiet toi tung dai ly*/
        merge /*+ CARDINALITY(agem, 100)*/
            into ams.la_comp_mmxiii_agem agem
        using
            (
                select /*+ CARDINALITY(comp, 100)*/
                    comp.agem_outlet_ams_id,
                    comp.agem_comp_ratio
                from ams.la_compensation_mmxiii_tmp comp
                where comp.record_date = trunc(valRecordDate, 'MM')
                    and comp.agem_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and comp.agem_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            ) upd
        on (
            trunc(valRecordDate, 'MM') = agem.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = agem.agem_be_executing
            and
            agem.agem_be_paid in
            (
                AMS_MODL_COMP_MMXIII.BE_PAID_DTL,
                AMS_MODL_COMP_MMXIII.BE_PAID_YES
            )
            and
            upd.agem_outlet_ams_id = agem.agem_outlet_ams_id
        )
        when matched then
            update
                set
                    agem.agem_comp_ratio = upd.agem_comp_ratio,
                    agem.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    agem.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agem_cond', 'Cap nhap ty le huong chi tiet toi tung dai ly  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_agem_cond: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_agem_comp(valRecordDate date := null)
    is
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Tinh thu lao chi tiet toi dai ly*/
        update ams.la_comp_mmxiii_agem agem
        set
            agem.agem_comp_money = nvl(agem.agem_period_fyc, 0) * nvl(agem.agem_comp_ratio, 0) / 100,
            agem.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            agem.update_datetime = sysdate
        where agem.record_date = trunc(valRecordDate, 'MM')
            and agem.agem_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and agem.agem_be_paid in
            (
                AMS_MODL_COMP_MMXIII.BE_PAID_DTL,
                AMS_MODL_COMP_MMXIII.BE_PAID_YES
            );
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agem_comp', 'Tinh thu lao chi tiet toi dai ly  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* Tinh thu lao tuyen dung duoc huong trong ky*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.agem_comp_money = nvl(comp.agem_period_fyc, 0) * nvl(comp.agem_comp_ratio, 0) / 100,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.agem_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.agem_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agem_comp', 'Tinh thu lao tuyen dung duoc huong trong ky  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    end;

    procedure mmxiii_modl_agem_close(valRecordDate date := null)
    is
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Ket thuc qua trinh tinh thu lao tuyen dung trong bang la_comp_mmxiii_agem*/
        update ams.la_comp_mmxiii_agem agem
        set
            agem.agem_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO,
            agem.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            agem.update_datetime = sysdate
        where agem.record_date = trunc(valRecordDate, 'MM')
            and agem.agem_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agem_close', '  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* Ket thuc qua trinh tinh thu lao tuyen dung trong bang la_cpst_2012_outlet*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.agem_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.agem_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agem_close', '  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));

    end;


    procedure mmxiii_modl_mnqr(valRecordDate date := null)
    is
    begin
        if (
            AMS_CORE_MODULE.is_active(
                AMS_MODL_COMP_MMXIII.MMXIII_COMP_MNQR,
                trunc(valRecordDate, 'MM')
            ) = AMS_CORE_MODULE.IS_YES
        ) then
            for var_result in (
                select comp_date.compensation_date
                from ams.mod_comp_date comp_date
                where comp_date.module_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_COMP
                    and comp_date.sub_code = AMS_MODL_COMP_MMXIII.MMXIII_COMP_MNQR
                    and comp_date.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                    and comp_date.compensation_date = trunc(valRecordDate, 'MM')
                group by comp_date.compensation_date
            ) loop
                --thuong quy thi can phai chay lai ca 3 thang du lieu cho no doi voi cau truc phat trien ban nhom
                AMS_MODL_COMP_MMXIII.mmxiii_modl_unit_dev_run(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnqr_open(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnqr_data(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnqr_cond(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnqr_comp(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnqr_close(valRecordDate);
            end loop;
        end if;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 1/6/2013
        Version: 1.0
        Description: Thu tuc tinh toan cac chi tieu cho thuong quy truong ban va truong nhom
        Parameter:
            valRecordDate [date]: Thang chay
        Update:  Le Khac Chinh
            Version: 1.1
            Date Updated: 10/7/2013
            Note:  Fix lai chuong trinh theo yeu cau: #107749 cua BA
                      Dem chinh xac so luong tuyen dung thuan doi voi thuong quy cua truong nhom
    */
    procedure mmxiii_modl_mnqr_open(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Len danh sach Truong ban, truong nhom duoc huong
           thu lao thuong quy*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.mnqr_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES,
            comp.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
            comp.mnqr_from_date = add_months(trunc(valRecordDate, 'MM'), -2),
            comp.mnqr_to_date = (add_months(trunc(valRecordDate, 'MM'), 1) - 1),
            comp.mnqr_position_code = comp.info_position_code,
            comp.mnqr_position_date = comp.info_position_date,
            comp.mnqr_branch_id = comp.info_unit_id,
            comp.mnqr_branch_ams_id = comp.info_unit_ams_id,
            comp.mnqr_period_fyc = 0,
            comp.mnqr_period_fyc_calc = 0,
            comp.mnqr_period_fyp = 0,
            comp.mnqr_period_empl = 0,
            comp.mnqr_period_qual = 0,
            comp.mnqr_period_afis = 0,
            comp.mnqr_period_afif = 0,
            comp.mnqr_period_pr36 = 0,
            comp.mnqr_period_coll_etmt = 0,
            comp.mnqr_period_coll_real = 0,
            comp.mnqr_period_coll_rate = 0,
            comp.mnqr_comp_ratio = 0,
            comp.mnqr_comp_money = 0,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.status_code = AMS_MODL_COMP_MMXIII.STATUS_CURR
            and comp.info_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_open', 'Len danh sach Truong ban, truong nhom duoc huong  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 1;

        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.mnqr_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES,
            comp.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
            comp.mnqr_from_date = add_months(trunc(valRecordDate, 'MM'), -2),
            comp.mnqr_to_date = (add_months(trunc(valRecordDate, 'MM'), 1) - 1),
            comp.mnqr_position_code = comp.info_position_code,
            comp.mnqr_position_date = comp.info_position_date,
            comp.mnqr_branch_id = comp.info_agency_id,
            comp.mnqr_branch_ams_id = comp.info_agency_ams_id,
            comp.mnqr_period_fyc = 0,
            comp.mnqr_period_fyc_calc = 0,
            comp.mnqr_period_fyp = 0,
            comp.mnqr_period_empl = 0,
            comp.mnqr_period_qual = 0,
            comp.mnqr_period_afis = 0,
            comp.mnqr_period_afif = 0,
            comp.mnqr_period_pr36 = 0,
            comp.mnqr_period_coll_etmt = 0,
            comp.mnqr_period_coll_real = 0,
            comp.mnqr_period_coll_rate = 0,
            comp.mnqr_comp_ratio = 0,
            comp.mnqr_comp_money = 0,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.status_code = AMS_MODL_COMP_MMXIII.STATUS_CURR
            and comp.info_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_open', '  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 2;

        /* Hieu chinh doi voi truong nhom
           SENR:
               > 2 AND <= 5: Tu khi hieu luc chuc vu
               <= 2: Khong xet*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.mnqr_from_date = trunc(comp.mnqr_position_date, 'MM'),
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02
            and months_between(
                add_months(trunc(valRecordDate, 'MM'), 1),
                trunc(comp.mnqr_position_date, 'MM')
                ) between 3 and 5;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_open', 'Hieu chinh doi voi truong nhom  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 3;

        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.mnqr_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_NO,
            comp.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02
            and months_between(
                add_months(trunc(valRecordDate, 'MM'), 1),
                trunc(comp.mnqr_position_date, 'MM')
                ) <= 2;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_open', '  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 4;

        /* Hieu chinh voi truong ban
           SENR:
               > 2 AND <= 5: Tu khi hieu luc chuc vu
               <= 2: Neu truoc khi thang tien la Truong nhom, xet thu lao thuong quy
                     voi vai tro Truong nhom cho khoang thoi gian truoc khi thang tien*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.mnqr_from_date = trunc(comp.mnqr_position_date, 'MM'),
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
            and months_between(
                add_months(trunc(valRecordDate, 'MM'), 1),
                trunc(comp.mnqr_position_date, 'MM')
                ) between 3 and 5;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_open', ' Hieu chinh voi truong ban thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 5;

        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.mnqr_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_NO,
            comp.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
            and months_between(
                add_months(trunc(valRecordDate, 'MM'), 1),
                trunc(comp.mnqr_position_date, 'MM')
                ) <= 2;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_open', '  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 6;

       /* update ams.la_compensation_mmxiii_tmp comp
        set
            comp.mnqr_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES,
            comp.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
            comp.mnqr_to_date = (add_months(trunc(comp.mnqr_position_date, 'MM'), 0) - 1),
            comp.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO
            and comp.mnqr_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_NO
            and comp.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04;
           */ ------------------------------------------------------
        -- Cap nhat lai ban nhom, ngay hieu luc chuc vu
        --CAN PHAI SUA LAI CODE O CHO NAY
        --Neu ma thoi gian la 5 thang lam truong ban
        --thi 3 thang sau duoc xet thuong voi vai tro la truong ban
        --con 2 thang truoc day cung duoc xet voi vai tro la truong ban
        merge /*+ CARDINALITY(comp, 100)*/
            into ams.la_compensation_mmxiii_tmp comp
        using
            (
                select   /*+ CARDINALITY(tmp, 100)*/
                    distinct
                    outl.outlet_ams_id,
                    outl.unit_id,
                    outl.unit_ams_id,
                    outl.position_date
                from
                (
                     select   /*+ CARDINALITY(tmp, 100)*/
                         tmp.outlet_ams_id,
                         tmp.mnqr_position_date,
                         --lay ra thang truoc cua thang thang tien len lam truong ban roi sau do se biet duoc
                         --sau do se gan comp.mnqr_to_date = (add_months(trunc(comp.mnqr_position_date, 'MM'), 0) - 1),
                         trunc(trunc(tmp.mnqr_position_date, 'MM') - 1, 'MM') data_record_date
                     from ams.la_compensation_mmxiii_tmp tmp
                     where tmp.record_date = trunc(valRecordDate, 'MM')
                         and tmp.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO
                         and tmp.mnqr_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_NO
                         and tmp.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
                ) mnqr
                join
                (
                    select  /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_ams_id,
                        tmp.unit_id,
                        tmp.unit_ams_id,
                        tmp.position_date,
                        tmp.record_date
                    from ams.inp_data_outlet_tmp tmp
                    where tmp.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                        and tmp.record_date --no phai nam trong khoan thoi gian nay,
                        --chay lai cho no trong thoi gian 7 thang cho nhieu len de tim ra
                            between add_months(trunc(valRecordDate, 'MM'), -7)
                            and trunc(valRecordDate, 'MM')
                ) outl
                    on
                    (
                        outl.outlet_ams_id = mnqr.outlet_ams_id
                        and--dieu kien nay se lay ra duoc ngay thang len duoc
                        --comp.mnqr_position_date = upd.position_date la thoi gian len duoc lam truong nhom va
                        --ngay hieu luc len lam truong nhom la ngay nao o day
                        --mnqr.data_record_date la THANG CUOI CUNG DANG LAM TRUONG NHOM
                        outl.record_date = mnqr.data_record_date
                    )
            ) upd
        on (
            comp.record_date = trunc(valRecordDate, 'MM')
            and
            comp.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO
            and
            comp.mnqr_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_NO
            and
            comp.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
            and
            comp.outlet_ams_id = upd.outlet_ams_id
        )
        when matched then
            update
                set--cap nhat comp.mnqr_to_date  den ngay chinh la ngay thang tien len - 1 tuc la ngay cuoi cung lam truong nhom
                     --de tinh thuong quy cho truong nhom trong giai doan day
                     --ngay thang tien len la tinh cho ngay thang tien len lam truong nhom cho no
                    comp.mnqr_to_date = (add_months(trunc(comp.mnqr_position_date, 'MM'), 0) - 1),
                    comp.mnqr_position_date = upd.position_date,
                    comp.mnqr_branch_id = upd.unit_id,
                    comp.mnqr_branch_ams_id = upd.unit_ams_id;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_open', 'Cap nhat lai ban nhom, ngay hieu luc chuc vu  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 7;

        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.mnqr_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES,
            comp.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
            comp.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO
            and comp.mnqr_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_NO
            and comp.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_open', 'Duoc tra  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 8;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_open', '  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 10;

        /* Len danh sach du lieu chi tiet can xoa*/
        merge /*+ CARDINALITY(mnqr, 100)*/
            into ams.la_comp_mmxiii_mnqr mnqr
        using
            (
                select /*+ CARDINALITY(comp, 100)*/
                    comp.info_company_id company_id
                from ams.la_compensation_mmxiii_tmp comp
                where comp.record_date = trunc(valRecordDate, 'MM')
                    and comp.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                group by comp.info_company_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = mnqr.record_date
            and
            upd.company_id = mnqr.company_id
        )
        when matched then
            update
                set
                    mnqr.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_DEL;
        commit;

/*        merge \*+ CARDINALITY(mnqr, 100)*\
            into ams.la_comp_mmxiii_mnqr mnqr
        using
            (
                select \*+ CARDINALITY(comp, 100)*\
                    comp.outlet_ams_id
                from ams.la_compensation_mmxiii_tmp comp
                where comp.record_date = trunc(valRecordDate, 'MM')
                    and comp.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                group by comp.outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = mnqr.record_date
            and
            upd.outlet_ams_id = mnqr.outlet_ams_id
        )
        when matched then
            update
                set
                    mnqr.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_DEL;
        commit;*/

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_open', 'Len danh sach du lieu chi tiet can xoa  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 9;

        /* Xoa du lieu chi tiet*/
        loop
            delete ams.la_comp_mmxiii_mnqr del
            where del.record_date = trunc(valRecordDate, 'MM')
                and del.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_DEL
                and rownum < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_open', ' Xoa du lieu chi tiet  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 9;

        /* Du lieu dai ly chi tiet trong quy*/
        for i in 0..2
        loop
            /* Truong hop: Truong nhom*/
            /* Cac dai ly con lam viec trong thang*/
            insert /*+ APPEND */ into ams.la_comp_mmxiii_mnqr nologging(
                outlet_id,
                outlet_ams_id,
                record_date,
                version_date,
                company_id,
                company_ams_id,
                company_name,
                agency_id,
                agency_ams_id,
                agency_name,
                unit_id,
                unit_ams_id,
                unit_name,
                outlet_name,
                effective_date,
                terminative_date,
                mnqr_be_paid,
                mnqr_be_executing,
                mnqr_data_date,
                mnqr_from_date,
                mnqr_to_date,
                mnqr_outlet_id,
                mnqr_outlet_ams_id,
                mnqr_branch_id,
                mnqr_branch_ams_id,
                mnqr_branch_level,
                mnqr_branch_ratio,
                mnqr_position_code,
                mnqr_period_fyc,
                mnqr_period_fyc_calc,
                mnqr_period_fyp,
                mnqr_period_fyp_calc,
                mnqr_period_empl,
                mnqr_period_empl_calc,
                mnqr_period_qual,
                mnqr_period_afis,
                mnqr_period_afis_calc,
                mnqr_period_afif,
                mnqr_period_afif_calc,
                mnqr_period_pr36,
                mnqr_period_coll_etmt,
                mnqr_period_coll_etmt_calc,
                mnqr_period_coll_real,
                mnqr_period_coll_real_calc,
                mnqr_period_coll_rate,
                mnqr_empl_asmt,
                mnqr_fyc_ratio,
                create_user,
                update_user,
                create_datetime,
                update_datetime)
            select /*+ CARDINALITY(comp, 100) CARDINALITY(outl, 100)*/
                outl.outlet_id,
                outl.outlet_ams_id,
                trunc(valRecordDate, 'MM'),
                trunc(sysdate, 'DD'),
                outl.company_id,
                outl.company_ams_id,
                outl.company_name,
                outl.agency_id,
                outl.agency_ams_id,
                outl.agency_name,
                outl.unit_id,
                outl.unit_ams_id,
                outl.unit_name,
                outl.outlet_name,
                outl.effective_date,
                outl.terminative_date,
                AMS_MODL_COMP_MMXIII.BE_PAID_DTL,
                AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
                add_months(trunc(valRecordDate, 'MM'), -i),
                comp.mnqr_from_date,
                comp.mnqr_to_date,
                comp.outlet_id,
                comp.outlet_ams_id,
                comp.mnqr_branch_id,
                comp.mnqr_branch_ams_id,
                1,
                100,
                comp.mnqr_position_code, --chi cap nhat doi voi CV02
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
                AMS_MODL_COMP_MMXIII.AMST_YES,
                0,
                AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                sysdate,
                sysdate
            from
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_id,
                    tmp.outlet_ams_id,
                    tmp.mnqr_branch_id,
                    tmp.mnqr_branch_ams_id,
                    tmp.mnqr_from_date,
                    tmp.mnqr_to_date,
                    tmp.mnqr_position_code
                from ams.la_compensation_mmxiii_tmp tmp
                where tmp.record_date = trunc(valRecordDate, 'MM')
                    and tmp.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and tmp.mnqr_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                    and tmp.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02
            ) comp
            join
            (
                select  /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_id,
                    tmp.outlet_ams_id,
                    tmp.outlet_name,
                    tmp.company_id,
                    tmp.company_ams_id,
                    tmp.company_name,
                    tmp.agency_id,
                    tmp.agency_ams_id,
                    tmp.agency_name,
                    tmp.unit_id,
                    tmp.unit_ams_id,
                    tmp.unit_name,
                    tmp.effective_date,
                    tmp.terminative_date,
                    tmp.unit_ams_id mnqr_branch_ams_id
                from ams.inp_data_outlet_tmp tmp
                where tmp.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                    and tmp.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                    and tmp.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                    and tmp.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                    and tmp.unit_ams_id is not null
                    and
                    (
                        tmp.terminative_date is null
                        or
                        tmp.terminative_date >= add_months(trunc(valRecordDate, 'MM'), 1 - i)
                    )
            ) outl
                on outl.mnqr_branch_ams_id = comp.mnqr_branch_ams_id
            where add_months(trunc(valRecordDate, 'MM'), -i)
                    between comp.mnqr_from_date
                    and comp.mnqr_to_date;
            commit;

            /* Cac dai ly nghi viec trong thang*/
            insert /*+ APPEND */ into ams.la_comp_mmxiii_mnqr nologging(
                outlet_id,
                outlet_ams_id,
                record_date,
                version_date,
                company_id,
                company_ams_id,
                company_name,
                agency_id,
                agency_ams_id,
                agency_name,
                unit_id,
                unit_ams_id,
                unit_name,
                outlet_name,
                effective_date,
                terminative_date,
                mnqr_be_paid,
                mnqr_be_executing,
                mnqr_data_date,
                mnqr_from_date,
                mnqr_to_date,
                mnqr_outlet_id,
                mnqr_outlet_ams_id,
                mnqr_branch_id,
                mnqr_branch_ams_id,
                mnqr_branch_level,
                mnqr_branch_ratio,
                mnqr_position_code,
                mnqr_period_fyc,
                mnqr_period_fyc_calc,
                mnqr_period_fyp,
                mnqr_period_fyp_calc,
                mnqr_period_empl,
                mnqr_period_empl_calc,
                mnqr_period_qual,
                mnqr_period_afis,
                mnqr_period_afis_calc,
                mnqr_period_afif,
                mnqr_period_afif_calc,
                mnqr_period_pr36,
                mnqr_period_coll_etmt,
                mnqr_period_coll_etmt_calc,
                mnqr_period_coll_real,
                mnqr_period_coll_real_calc,
                mnqr_period_coll_rate,
                mnqr_empl_asmt,
                mnqr_fyc_ratio,
                create_user,
                update_user,
                create_datetime,
                update_datetime)
            select /*+ CARDINALITY(comp, 100) CARDINALITY(outl, 100)*/
                outl.outlet_id,
                outl.outlet_ams_id,
                trunc(valRecordDate, 'MM'),
                trunc(sysdate, 'DD'),
                outl.company_id,
                outl.company_ams_id,
                outl.company_name,
                outl.agency_id,
                outl.agency_ams_id,
                outl.agency_name,
                outl.unit_id,
                outl.unit_ams_id,
                outl.unit_name,
                outl.outlet_name,
                outl.effective_date,
                outl.terminative_date,
                AMS_MODL_COMP_MMXIII.BE_PAID_TERM,
                AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
                add_months(trunc(valRecordDate, 'MM'), -i),
                comp.mnqr_from_date,
                comp.mnqr_to_date,
                comp.outlet_id,
                comp.outlet_ams_id,
                comp.mnqr_branch_id,
                comp.mnqr_branch_ams_id,
                1,
                100,
                comp.mnqr_position_code, --chi cap nhat doi voi CV02
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
                AMS_MODL_COMP_MMXIII.AMST_YES,
                0,
                AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                sysdate,
                sysdate
            from
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_id,
                    tmp.outlet_ams_id,
                    tmp.mnqr_branch_id,
                    tmp.mnqr_branch_ams_id,
                    tmp.mnqr_from_date,
                    tmp.mnqr_to_date,
                    tmp.mnqr_position_code
                from ams.la_compensation_mmxiii_tmp tmp
                where tmp.record_date = trunc(valRecordDate, 'MM')
                    and tmp.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and tmp.mnqr_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                    and tmp.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02
            ) comp
            join
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_id,
                    tmp.outlet_ams_id,
                    tmp.outlet_name,
                    tmp.company_id,
                    tmp.company_ams_id,
                    tmp.company_name,
                    tmp.agency_id,
                    tmp.agency_ams_id,
                    tmp.agency_name,
                    tmp.unit_id,
                    tmp.unit_ams_id,
                    tmp.unit_name,
                    tmp.effective_date,
                    tmp.terminative_date,
                    tmp.unit_ams_id mnqr_branch_ams_id
                from ams.inp_data_outlet_tmp tmp
                where tmp.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                    and tmp.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                    and tmp.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                    and tmp.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                    and tmp.unit_ams_id is not null
                    and tmp.terminative_date
                        between add_months(trunc(valRecordDate, 'MM'), -i)
                        and (add_months(trunc(valRecordDate, 'MM'), 1 - i) - 1)
            ) outl
                on outl.mnqr_branch_ams_id = comp.mnqr_branch_ams_id
            where add_months(trunc(valRecordDate, 'MM'), -i)
                    between comp.mnqr_from_date
                    and comp.mnqr_to_date;
            commit;

            /* Truong hop truong ban*/
            /* Cac dai ly con lam viec trong thang*/
            insert /*+ APPEND */ into ams.la_comp_mmxiii_mnqr nologging(
                outlet_id,
                outlet_ams_id,
                record_date,
                version_date,
                company_id,
                company_ams_id,
                company_name,
                agency_id,
                agency_ams_id,
                agency_name,
                unit_id,
                unit_ams_id,
                unit_name,
                outlet_name,
                effective_date,
                terminative_date,
                mnqr_be_paid,
                mnqr_be_executing,
                mnqr_data_date,
                mnqr_from_date,
                mnqr_to_date,
                mnqr_outlet_id,
                mnqr_outlet_ams_id,
                mnqr_branch_id,
                mnqr_branch_ams_id,
                mnqr_branch_level,
                mnqr_branch_ratio,
                mnqr_position_code,
                mnqr_period_fyc,
                mnqr_period_fyc_calc,
                mnqr_period_fyp,
                mnqr_period_fyp_calc,
                mnqr_period_empl,
                mnqr_period_empl_calc,
                mnqr_period_qual,
                mnqr_period_afis,
                mnqr_period_afis_calc,
                mnqr_period_afif,
                mnqr_period_afif_calc,
                mnqr_period_pr36,
                mnqr_period_coll_etmt,
                mnqr_period_coll_etmt_calc,
                mnqr_period_coll_real,
                mnqr_period_coll_real_calc,
                mnqr_period_coll_rate,
                mnqr_empl_asmt,
                mnqr_fyc_ratio,
                create_user,
                update_user,
                create_datetime,
                update_datetime)
            select /*+ CARDINALITY(comp, 100) CARDINALITY(outl, 100)*/
                outl.outlet_id,
                outl.outlet_ams_id,
                trunc(valRecordDate, 'MM'),
                trunc(sysdate, 'DD'),
                outl.company_id,
                outl.company_ams_id,
                outl.company_name,
                outl.agency_id,
                outl.agency_ams_id,
                outl.agency_name,
                outl.unit_id,
                outl.unit_ams_id,
                outl.unit_name,
                outl.outlet_name,
                outl.effective_date,
                outl.terminative_date,
                AMS_MODL_COMP_MMXIII.BE_PAID_DTL,
                AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
                add_months(trunc(valRecordDate, 'MM'), -i),
                comp.mnqr_from_date,
                comp.mnqr_to_date,
                comp.outlet_id,
                comp.outlet_ams_id,
                comp.mnqr_branch_id,
                comp.mnqr_branch_ams_id,
                1,
                100,
                comp.mnqr_position_code, --chi cap nhat doi voi CV04 tuc chi cap nhat doi voi truong ban
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
                AMS_MODL_COMP_MMXIII.AMST_YES,
                0,
                AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                sysdate,
                sysdate
            from
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_id,
                    tmp.outlet_ams_id,
                    tmp.mnqr_branch_id,
                    tmp.mnqr_branch_ams_id,
                    tmp.mnqr_from_date,
                    tmp.mnqr_to_date,
                    tmp.mnqr_position_code
                from ams.la_compensation_mmxiii_tmp tmp
                where tmp.record_date = trunc(valRecordDate, 'MM')
                    and tmp.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and tmp.mnqr_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                    and tmp.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
            ) comp
            join
            (
                select  /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_id,
                    tmp.outlet_ams_id,
                    tmp.outlet_name,
                    tmp.company_id,
                    tmp.company_ams_id,
                    tmp.company_name,
                    tmp.agency_id,
                    tmp.agency_ams_id,
                    tmp.agency_name,
                    tmp.unit_id,
                    tmp.unit_ams_id,
                    tmp.unit_name,
                    tmp.effective_date,
                    tmp.terminative_date,
                    tmp.agency_ams_id mnqr_branch_ams_id
                from ams.inp_data_outlet_tmp tmp
                where tmp.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                    and tmp.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                    and tmp.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                    and tmp.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                    and tmp.agency_ams_id is not null
                    and
                    (
                        tmp.terminative_date is null
                        or
                        tmp.terminative_date >= add_months(trunc(valRecordDate, 'MM'), 1 - i)
                    )
            ) outl
                on outl.mnqr_branch_ams_id = comp.mnqr_branch_ams_id
            where add_months(trunc(valRecordDate, 'MM'), -i)
                    between comp.mnqr_from_date
                    and comp.mnqr_to_date;
            commit;

            /* Cac dai ly nghi viec trong thang*/
            insert /*+ APPEND */ into ams.la_comp_mmxiii_mnqr nologging(
                outlet_id,
                outlet_ams_id,
                record_date,
                version_date,
                company_id,
                company_ams_id,
                company_name,
                agency_id,
                agency_ams_id,
                agency_name,
                unit_id,
                unit_ams_id,
                unit_name,
                outlet_name,
                effective_date,
                terminative_date,
                mnqr_be_paid,
                mnqr_be_executing,
                mnqr_data_date,
                mnqr_from_date,
                mnqr_to_date,
                mnqr_outlet_id,
                mnqr_outlet_ams_id,
                mnqr_branch_id,
                mnqr_branch_ams_id,
                mnqr_branch_level,
                mnqr_branch_ratio,
                mnqr_position_code,
                mnqr_period_fyc,
                mnqr_period_fyc_calc,
                mnqr_period_fyp,
                mnqr_period_fyp_calc,
                mnqr_period_empl,
                mnqr_period_empl_calc,
                mnqr_period_qual,
                mnqr_period_afis,
                mnqr_period_afis_calc,
                mnqr_period_afif,
                mnqr_period_afif_calc,
                mnqr_period_pr36,
                mnqr_period_coll_etmt,
                mnqr_period_coll_etmt_calc,
                mnqr_period_coll_real,
                mnqr_period_coll_real_calc,
                mnqr_period_coll_rate,
                mnqr_empl_asmt,
                mnqr_fyc_ratio,
                create_user,
                update_user,
                create_datetime,
                update_datetime)
            select /*+ CARDINALITY(comp, 100) CARDINALITY(outl, 100)*/
                outl.outlet_id,
                outl.outlet_ams_id,
                trunc(valRecordDate, 'MM'),
                trunc(sysdate, 'DD'),
                outl.company_id,
                outl.company_ams_id,
                outl.company_name,
                outl.agency_id,
                outl.agency_ams_id,
                outl.agency_name,
                outl.unit_id,
                outl.unit_ams_id,
                outl.unit_name,
                outl.outlet_name,
                outl.effective_date,
                outl.terminative_date,
                AMS_MODL_COMP_MMXIII.BE_PAID_TERM,
                AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
                add_months(trunc(valRecordDate, 'MM'), -i),
                comp.mnqr_from_date,
                comp.mnqr_to_date,
                comp.outlet_id,
                comp.outlet_ams_id,
                comp.mnqr_branch_id,
                comp.mnqr_branch_ams_id,
                1,
                100,
                comp.mnqr_position_code, --chi cap nhat doi voi CV04
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
                AMS_MODL_COMP_MMXIII.AMST_YES,
                0,
                AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                sysdate,
                sysdate
            from
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_id,
                    tmp.outlet_ams_id,
                    tmp.mnqr_branch_id,
                    tmp.mnqr_branch_ams_id,
                    tmp.mnqr_from_date,
                    tmp.mnqr_to_date,
                    tmp.mnqr_position_code
                from ams.la_compensation_mmxiii_tmp tmp
                where tmp.record_date = trunc(valRecordDate, 'MM')
                    and tmp.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and tmp.mnqr_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                    and tmp.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
            ) comp
            join
            (
                select  /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_id,
                    tmp.outlet_ams_id,
                    tmp.outlet_name,
                    tmp.company_id,
                    tmp.company_ams_id,
                    tmp.company_name,
                    tmp.agency_id,
                    tmp.agency_ams_id,
                    tmp.agency_name,
                    tmp.unit_id,
                    tmp.unit_ams_id,
                    tmp.unit_name,
                    tmp.effective_date,
                    tmp.terminative_date,
                    tmp.agency_ams_id mnqr_branch_ams_id
                from ams.inp_data_outlet_tmp tmp
                where tmp.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                    and tmp.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                    and tmp.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                    and tmp.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                    and tmp.agency_ams_id is not null
                    and tmp.terminative_date
                        between add_months(trunc(valRecordDate, 'MM'), -i)
                        and (add_months(trunc(valRecordDate, 'MM'), 1 - i) - 1)
            ) outl
                on outl.mnqr_branch_ams_id = comp.mnqr_branch_ams_id
            where add_months(trunc(valRecordDate, 'MM'), -i)
                    between comp.mnqr_from_date
                    and comp.mnqr_to_date;
            commit;
        end loop;


        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_open', 'Du lieu dai ly chi tiet trong quy  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 11;

        /* Truong hop dac biet: Cong them FYC tu quy truoc do*/
        for i in 3..4
        loop
            /* Truong hop: Truong nhom*/
            insert /*+ APPEND */ into ams.la_comp_mmxiii_mnqr nologging(
                outlet_id,
                outlet_ams_id,
                record_date,
                version_date,
                company_id,
                company_ams_id,
                company_name,
                agency_id,
                agency_ams_id,
                agency_name,
                unit_id,
                unit_ams_id,
                unit_name,
                outlet_name,
                effective_date,
                terminative_date,
                mnqr_be_paid,
                mnqr_be_executing,
                mnqr_data_date,
                mnqr_from_date,
                mnqr_to_date,
                mnqr_outlet_id,
                mnqr_outlet_ams_id,
                mnqr_branch_id,
                mnqr_branch_ams_id,
                mnqr_branch_level,
                mnqr_branch_ratio,
                mnqr_position_code,
                mnqr_period_fyc,
                mnqr_period_fyc_calc,
                mnqr_period_fyp,
                mnqr_period_fyp_calc,
                mnqr_period_empl,
                mnqr_period_empl_calc,
                mnqr_period_qual,
                mnqr_period_afis,
                mnqr_period_afis_calc,
                mnqr_period_afif,
                mnqr_period_afif_calc,
                mnqr_period_pr36,
                mnqr_period_coll_etmt,
                mnqr_period_coll_etmt_calc,
                mnqr_period_coll_real,
                mnqr_period_coll_real_calc,
                mnqr_period_coll_rate,
                mnqr_empl_asmt,
                mnqr_fyc_ratio,
                create_user,
                update_user,
                create_datetime,
                update_datetime)
            select /*+ CARDINALITY(comp, 100) CARDINALITY(outl, 100)*/
                outl.outlet_id,
                outl.outlet_ams_id,
                trunc(valRecordDate, 'MM'),
                trunc(sysdate, 'DD'),
                outl.company_id,
                outl.company_ams_id,
                outl.company_name,
                outl.agency_id,
                outl.agency_ams_id,
                outl.agency_name,
                outl.unit_id,
                outl.unit_ams_id,
                outl.unit_name,
                outl.outlet_name,
                outl.effective_date,
                outl.terminative_date,
                AMS_MODL_COMP_MMXIII.BE_PAID_SPC,
                AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
                add_months(trunc(valRecordDate, 'MM'), -i),
                comp.mnqr_from_date,
                comp.mnqr_to_date,
                comp.outlet_id,
                comp.outlet_ams_id,
                comp.mnqr_branch_id,
                comp.mnqr_branch_ams_id,
                1,
                100,
                comp.mnqr_position_code, --chi cap nhat doi voi CV04
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
                AMS_MODL_COMP_MMXIII.AMST_YES,
                0,
                AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                sysdate,
                sysdate
            from
            (
                select
                    tmp.outlet_id,
                    tmp.outlet_ams_id,
                    tmp.mnqr_branch_id,
                    tmp.mnqr_branch_ams_id,
                    tmp.mnqr_from_date,
                    tmp.mnqr_to_date,
                    tmp.mnqr_position_code
                from ams.la_compensation_mmxiii_tmp tmp
                where tmp.record_date = trunc(valRecordDate, 'MM')
                    and tmp.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and tmp.mnqr_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                    and tmp.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02
            ) comp
            join
            (
                select tmp.outlet_id,
                    tmp.outlet_ams_id,
                    tmp.outlet_name,
                    tmp.company_id,
                    tmp.company_ams_id,
                    tmp.company_name,
                    tmp.agency_id,
                    tmp.agency_ams_id,
                    tmp.agency_name,
                    tmp.unit_id,
                    tmp.unit_ams_id,
                    tmp.unit_name,
                    tmp.effective_date,
                    tmp.terminative_date,
                    tmp.unit_ams_id mnqr_branch_ams_id
                from ams.inp_data_outlet_tmp tmp
                where tmp.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                    and tmp.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                    and tmp.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                    and tmp.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                    and tmp.unit_ams_id is not null
            ) outl
                on outl.mnqr_branch_ams_id = comp.mnqr_branch_ams_id
            where add_months(trunc(valRecordDate, 'MM'), -i)
                    between comp.mnqr_from_date
                    and comp.mnqr_to_date;
            commit;

            /* Truong hop truong ban*/
            insert /*+ APPEND */ into ams.la_comp_mmxiii_mnqr nologging(
                outlet_id,
                outlet_ams_id,
                record_date,
                version_date,
                company_id,
                company_ams_id,
                company_name,
                agency_id,
                agency_ams_id,
                agency_name,
                unit_id,
                unit_ams_id,
                unit_name,
                outlet_name,
                effective_date,
                terminative_date,
                mnqr_be_paid,
                mnqr_be_executing,
                mnqr_data_date,
                mnqr_from_date,
                mnqr_to_date,
                mnqr_outlet_id,
                mnqr_outlet_ams_id,
                mnqr_branch_id,
                mnqr_branch_ams_id,
                mnqr_branch_level,
                mnqr_branch_ratio,
                mnqr_position_code,
                mnqr_period_fyc,
                mnqr_period_fyc_calc,
                mnqr_period_fyp,
                mnqr_period_fyp_calc,
                mnqr_period_empl,
                mnqr_period_empl_calc,
                mnqr_period_qual,
                mnqr_period_afis,
                mnqr_period_afis_calc,
                mnqr_period_afif,
                mnqr_period_afif_calc,
                mnqr_period_pr36,
                mnqr_period_coll_etmt,
                mnqr_period_coll_etmt_calc,
                mnqr_period_coll_real,
                mnqr_period_coll_real_calc,
                mnqr_period_coll_rate,
                mnqr_empl_asmt,
                mnqr_fyc_ratio,
                create_user,
                update_user,
                create_datetime,
                update_datetime)
            select /*+ CARDINALITY(comp, 100) CARDINALITY(outl, 100)*/
                outl.outlet_id,
                outl.outlet_ams_id,
                trunc(valRecordDate, 'MM'),
                trunc(sysdate, 'DD'),
                outl.company_id,
                outl.company_ams_id,
                outl.company_name,
                outl.agency_id,
                outl.agency_ams_id,
                outl.agency_name,
                outl.unit_id,
                outl.unit_ams_id,
                outl.unit_name,
                outl.outlet_name,
                outl.effective_date,
                outl.terminative_date,
                AMS_MODL_COMP_MMXIII.BE_PAID_SPC,
                AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
                add_months(trunc(valRecordDate, 'MM'), -i),
                comp.mnqr_from_date,
                comp.mnqr_to_date,
                comp.outlet_id,
                comp.outlet_ams_id,
                comp.mnqr_branch_id,
                comp.mnqr_branch_ams_id,
                1,
                100,
                comp.mnqr_position_code, --chi cap nhat doi voi CV04
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
                AMS_MODL_COMP_MMXIII.AMST_YES,
                0,
                AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                sysdate,
                sysdate
            from
            (
                select
                    tmp.outlet_id,
                    tmp.outlet_ams_id,
                    tmp.mnqr_branch_id,
                    tmp.mnqr_branch_ams_id,
                    tmp.mnqr_from_date,
                    tmp.mnqr_to_date,
                    tmp.mnqr_position_code
                from ams.la_compensation_mmxiii_tmp tmp
                where tmp.record_date = trunc(valRecordDate, 'MM')
                    and tmp.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and tmp.mnqr_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                    and tmp.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
            ) comp
            join
            (
                select tmp.outlet_id,
                    tmp.outlet_ams_id,
                    tmp.outlet_name,
                    tmp.company_id,
                    tmp.company_ams_id,
                    tmp.company_name,
                    tmp.agency_id,
                    tmp.agency_ams_id,
                    tmp.agency_name,
                    tmp.unit_id,
                    tmp.unit_ams_id,
                    tmp.unit_name,
                    tmp.effective_date,
                    tmp.terminative_date,
                    tmp.agency_ams_id mnqr_branch_ams_id
                from ams.inp_data_outlet_tmp tmp
                where tmp.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                    and tmp.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                    and tmp.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                    and tmp.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                    and tmp.agency_ams_id is not null
            ) outl
                on outl.mnqr_branch_ams_id = comp.mnqr_branch_ams_id
            where add_months(trunc(valRecordDate, 'MM'), -i)
                    between comp.mnqr_from_date
                    and comp.mnqr_to_date;
            commit;
        end loop;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_open', 'Truong hop dac biet: Cong them FYC tu quy truoc do  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 12;
        /* So lieu tong hop*/
        insert /*+ APPEND */ into ams.la_comp_mmxiii_mnqr nologging(
            outlet_id,
            outlet_ams_id,
            record_date,
            version_date,
            company_id,
            agency_ams_id, --lay them ma cua ban de tinh cho no
            unit_ams_id, --lay them ma cua nhom de tinh cho no
            unit_name, --lay them ten cua nhom de hien thi ra cho no
            outlet_name,
            effective_date,
            terminative_date,
            mnqr_be_paid,
            mnqr_be_executing,
            mnqr_data_date,
            mnqr_from_date,
            mnqr_to_date,
            mnqr_outlet_id,
            mnqr_outlet_ams_id,
            mnqr_branch_id,
            mnqr_branch_ams_id,
            mnqr_branch_level,
            mnqr_branch_ratio,
            mnqr_position_code,
            mnqr_period_fyc,
            mnqr_period_fyc_calc,
            mnqr_period_fyp,
            mnqr_period_fyp_calc,
            mnqr_period_empl,
            mnqr_period_empl_calc,
            mnqr_period_qual,
            mnqr_period_afis,
            mnqr_period_afis_calc,
            mnqr_period_afif,
            mnqr_period_afif_calc,
            mnqr_period_pr36,
            mnqr_period_coll_etmt,
            mnqr_period_coll_etmt_calc,
            mnqr_period_coll_real,
            mnqr_period_coll_real_calc,
            mnqr_period_coll_rate,
            create_user,
            update_user,
            create_datetime,
            update_datetime)
        select
            mnqr.outlet_id,
            mnqr.outlet_ams_id,
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            max(mnqr.company_id),
            max(mnqr.agency_ams_id),
            max(mnqr.unit_ams_id),
            max(mnqr.unit_name),
            max(mnqr.outlet_name),
            min(mnqr.effective_date),
            max(mnqr.terminative_date),
            AMS_MODL_COMP_MMXIII.BE_PAID_YES,
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
            trunc(valRecordDate, 'MM'),
            min(mnqr.mnqr_from_date),
            max(mnqr.mnqr_to_date),
            mnqr.mnqr_outlet_id,
            mnqr.mnqr_outlet_ams_id,
            mnqr.mnqr_branch_id,
            mnqr.mnqr_branch_ams_id,
            max(mnqr.mnqr_branch_level),
            max(mnqr.mnqr_branch_ratio),
            max(mnqr.mnqr_position_code),
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
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.la_comp_mmxiii_mnqr mnqr
        where mnqr.record_date = trunc(valRecordDate, 'MM')
            and mnqr.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and mnqr.mnqr_be_paid in
            (
                AMS_MODL_COMP_MMXIII.BE_PAID_DTL,
                AMS_MODL_COMP_MMXIII.BE_PAID_TERM,
                AMS_MODL_COMP_MMXIII.BE_PAID_SPC
            )
        group by mnqr.outlet_id,
            mnqr.outlet_ams_id,
            mnqr.mnqr_outlet_id,
            mnqr.mnqr_outlet_ams_id,
            mnqr.mnqr_branch_id,
            mnqr.mnqr_branch_ams_id;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_open', 'Truong hop dac biet: Cong them FYC tu quy truoc do  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /*Trong truong hop den cuoi cua 1 quy vi du la thang 9 chuyen sang nhom khac thi du lieu tai thang 9 khi con lam viec
        phai la du lieu moi nhat cho no thi moi co the tinh dung duoc du lieu ve phat trien ban nhom cho no neu ma tinh thuong quy cho no*/
        /*Chinh vi vay sau khi co so lieu can phai merge lai so lieu tai thang cuoi cung cho dai ly
        De tinh thang cuoi cung la ban nhom moi nhat cho no*/
        for i in -2..0
        loop
            merge  /*+ CARDINALITY(mnqr, 100)
                      CARDINALITY(upd, 100)
                      LEADING(mnqr upd) */
                into ams.la_comp_mmxiii_mnqr mnqr
            using
                (
                    select /*+ CARDINALITY(data, 100)*/
                        data.outlet_ams_id,
                        data.company_id,
                        data.unit_ams_id,
                        data.unit_name
                    from ams.inp_data_outlet_tmp data
                    where data.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                        and data.record_date = add_months(trunc(valRecordDate, 'MM') , i)
                        and data.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                        and data.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                ) upd
            on (
                trunc(valRecordDate, 'MM') = mnqr.record_date
                and
                AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnqr.mnqr_be_executing
                and
                mnqr.mnqr_be_paid in
                (---lay dong tong hop thi se hien ra duoc cho no dung so lieu
                    AMS_MODL_COMP_MMXIII.BE_PAID_YES
                )
                and --chi  xu ly cho no o ma CV04 thoi tuc la o truong ban thoi
                --o day de cho no it so lieu va khong bi sai khong la du lieu se bi sai
                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04 = mnqr.mnqr_position_code
                and
                upd.outlet_ams_id = mnqr.outlet_ams_id
                )
            when matched then
                update
                    set
                        mnqr.company_id = upd.company_id,
                        mnqr.unit_ams_id = upd.unit_ams_id,
                        mnqr.unit_name = upd.unit_name;
            commit;
        end loop;


        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_open', 'cap nhat dong tong hop  neu chuyen nhom thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /*Cap nhat level de tinh thuong quy duy nhat cho Truong Ban doi voi cac dai ly thuoc ban da co de
        KHONG tinh FYP va FYC doi voi cac nhom chau tro xuong tuc co level >=2 tro di la khong tinh FYP va FYC
        Cap nhat cho dong tong hop*/
        merge  /*+ CARDINALITY(mnqr, 100)
                  CARDINALITY(upd, 100)
                  LEADING(mnqr upd) */
            into ams.la_comp_mmxiii_mnqr mnqr
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.unit_ams_id, --o day phai lay theo cai nay thi moi dung duoc
                    --neu lay theo umnm  la sai vi day la nhom co cong da phat trien nhom con ra va tinh he so nhu the la khong dung
                    max(tmp.umnm_unit_level) mnqr_branch_level,
                    max(tmp.umnm_unit_ratio) mnqr_branch_ratio
                from ams.la_comp_mmxiii_unit_des_source tmp
                --lay du lieu trong thang do
                where tmp.record_date = trunc(valRecordDate, 'MM')
                    and tmp.unit_ams_id is not null
                    --chi lay cac nhom ma level >= 2 tuc la tu nhom chau tro di cho no
                    --thi moi cap nhat vao de cho FYP va FYC = 0 cho no
                    and tmp.umnm_unit_level >= 2
                group by tmp.unit_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = mnqr.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnqr.mnqr_be_executing
            and--lay dong tong hop thi se hien ra duoc cho no dung so lieu
            mnqr.mnqr_be_paid in
            (
                AMS_MODL_COMP_MMXIII.BE_PAID_YES
            )
            and --chi  xu ly cho no o ma CV04 thoi tuc la o truong ban thoi
            --o day de cho no it so lieu va khong bi sai khong la du lieu se bi sai
            AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04 = mnqr.mnqr_position_code
            and --chu y la cac dai ly thuoc nhom day no phai bang nhom trong kia cho no thi moi dung duoc
            upd.unit_ams_id = mnqr.unit_ams_id
            )
        when matched then
            update
                set--cap nhat cac nhom ma no o level 2 thi se cho no la level 2 de khong tinh cho no
                    mnqr.mnqr_branch_level = upd.mnqr_branch_level,
                    --neu ma o nhom tu level 2 tro di thi ty le = 0 luon o day cho no de nhan vao thi no se = 0 luon
                    mnqr.mnqr_branch_ratio = 0;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_open', 'Cap nhat level de tinh thuong quy duy nhat cho Truong BanCong them FYC tu quy truoc do  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        --cap nhat tiep cho cac dong chi tiet de hien thi ra cho dung
        for i in 0..2
        loop
            merge  /*+ CARDINALITY(mnqr, 100)
                      CARDINALITY(upd, 100)
                      LEADING(mnqr upd) */
                into ams.la_comp_mmxiii_mnqr mnqr
            using
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.unit_ams_id, --o day phai lay theo cai nay thi moi dung duoc
                        --neu lay theo umnm  la sai vi day la nhom co cong da phat trien nhom con ra va tinh he so nhu the la khong dung
                        max(tmp.umnm_unit_level) mnqr_branch_level,
                        max(tmp.umnm_unit_ratio) mnqr_branch_ratio
                    from ams.la_comp_mmxiii_unit_des_source tmp
                    --lay du lieu tu cac thang truoc do chay ve
                    where tmp.record_date = add_months(trunc(valRecordDate, 'MM') , -i)
                        and tmp.unit_ams_id is not null
                        --chi lay cac nhom ma level >= 2 tuc la tu nhom chau tro di cho no
                        --thi moi cap nhat vao de cho FYP va FYC = 0 cho no
                        and tmp.umnm_unit_level >= 2
                    group by tmp.unit_ams_id
                ) upd
            on (
                trunc(valRecordDate, 'MM') = mnqr.record_date
                and
                AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnqr.mnqr_be_executing
                and
                mnqr.mnqr_be_paid in
                (
                    AMS_MODL_COMP_MMXIII.BE_PAID_DTL,
                    AMS_MODL_COMP_MMXIII.BE_PAID_TERM
                )
                and
                add_months(trunc(valRecordDate, 'MM') , -i) = mnqr.mnqr_data_date
                and --chi  xu ly cho no o ma CV04 thoi tuc la o truong ban thoi
                --o day de cho no it so lieu va khong bi sai khong la du lieu se bi sai
                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04 = mnqr.mnqr_position_code
                and --chu y la cac dai ly thuoc nhom day no phai bang nhom trong kia cho no thi moi dung duoc
                upd.unit_ams_id = mnqr.unit_ams_id
                )
            when matched then
                update
                    set--cap nhat cac nhom ma no o level 2 thi se cho no la level 2 de khong tinh cho no
                        mnqr.mnqr_branch_level = upd.mnqr_branch_level,
                        --neu ma o nhom tu level 2 tro di thi ty le = 0 luon o day cho no de nhan vao thi no se = 0 luon
                        mnqr.mnqr_branch_ratio = 0;
            commit;
        end loop;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_open', 'cap nhat tiep cho cac dong chi tiet de hien thi ra cho dung  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* Phan cong them*/
        for i in 3..4
        loop
            merge  /*+ CARDINALITY(mnqr, 100)
                      CARDINALITY(upd, 100)
                      LEADING(mnqr upd) */
                into ams.la_comp_mmxiii_mnqr mnqr
            using
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.unit_ams_id, --o day phai lay theo cai nay thi moi dung duoc
                        --neu lay theo umnm  la sai vi day la nhom co cong da phat trien nhom con ra va tinh he so nhu the la khong dung
                        max(tmp.umnm_unit_level) mnqr_branch_level,
                        max(tmp.umnm_unit_ratio) mnqr_branch_ratio
                    from ams.la_comp_mmxiii_unit_des_source tmp
                    --lay du lieu tu cac thang truoc do chay ve
                    where tmp.record_date = add_months(trunc(valRecordDate, 'MM') , -i)
                        and tmp.unit_ams_id is not null
                        --chi lay cac nhom ma level >= 2 tuc la tu nhom chau tro di cho no
                        --thi moi cap nhat vao de cho FYP va FYC = 0 cho no
                        and tmp.umnm_unit_level >= 2
                    group by tmp.unit_ams_id
                ) upd
            on (
                trunc(valRecordDate, 'MM') = mnqr.record_date
                and
                AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnqr.mnqr_be_executing
                and
                mnqr.mnqr_be_paid in
                (   --nhung thang o 2 thang no bi nhu the
                    AMS_MODL_COMP_MMXIII.BE_PAID_SPC
                )
                and
                add_months(trunc(valRecordDate, 'MM') , -i) = mnqr.mnqr_data_date
                and --chi  xu ly cho no o ma CV04 thoi tuc la o truong ban thoi
                --o day de cho no it so lieu va khong bi sai khong la du lieu se bi sai
                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04 = mnqr.mnqr_position_code
                and --chu y la cac dai ly thuoc nhom day no phai bang nhom trong kia cho no thi moi dung duoc
                upd.unit_ams_id = mnqr.unit_ams_id
                )
            when matched then
                update
                    set--cap nhat cac nhom ma no o level 2 thi se cho no la level 2 de khong tinh cho no
                        mnqr.mnqr_branch_level = upd.mnqr_branch_level,
                        --neu ma o nhom tu level 2 tro di thi ty le = 0 luon o day cho no de nhan vao thi no se = 0 luon
                        mnqr.mnqr_branch_ratio = 0;
            commit;
        end loop;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_open', 'Phan cong them thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_mnqr_open: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 1/6/2013
        Version: 1.0
        Description: Thu tuc tinh toan cac chi tieu cho thuong quy truong ban va truong nhom
        Parameter:
            valRecordDate [date]: Thang chay
        Update:  Le Khac Chinh
            Version: 1.1
            Date Updated: 10/7/2013
            Note:  Fix lai chuong trinh theo yeu cau: #107749 cua BA
                      Dem chinh xac so luong tuyen dung thuan doi voi thuong quy cua truong nhom
            Version: 1.2
            Date Updated: 12/7/2013
            Note:  Fix lai chuong trinh theo yeu cau: #107749 cua BA
                      Thuc hien chinh sua va dem chinh xac so luong tuyen dung thuan de khong xay ra bi loi du lieu
    */
    procedure mmxiii_modl_mnqr_data(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
        var_qty  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        -------------------------------------------------------------
        /* Cap nhat dai ly khong do ban, nhom truc tiep tuyen*/
        -------------------------------------------------------------
        for i in 0..4
        loop
            merge /*+ CARDINALITY(mnqr, 100)*/
                into ams.la_comp_mmxiii_mnqr mnqr
            using
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        add_months(trunc(valRecordDate, 'MM'), -i) record_date,
                        tmp.agent_id outlet_id,
                        tmp.branch_id
                    from ams.la_employment_relations tmp
                    where add_months(trunc(valRecordDate, 'MM'), -i)  >= tmp.effective_date
                        and add_months(trunc(valRecordDate, 'MM'), -i) < nvl(tmp.terminative_date, AMS_MODL_COMP_MMXIII.DATE_MAX_VALUE)
                        and tmp.type_relation = 'Y'
                    group by tmp.agent_id,
                        tmp.branch_id
                ) upd
            on (
                trunc(valRecordDate, 'MM') = mnqr.record_date
                and
                AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnqr.mnqr_be_executing
                and
                mnqr.mnqr_be_paid in
                (
                    AMS_MODL_COMP_MMXIII.BE_PAID_DTL,
                    AMS_MODL_COMP_MMXIII.BE_PAID_TERM,
                    AMS_MODL_COMP_MMXIII.BE_PAID_SPC
                )
                and
                upd.outlet_id = mnqr.outlet_id
                and
                upd.branch_id = mnqr.mnqr_branch_id
                and
                upd.record_date = mnqr.mnqr_data_date
                )
            when matched then
                update
                    set
                        mnqr.mnqr_empl_asmt = AMS_MODL_COMP_MMXIII.AMST_NO,
                        mnqr.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                        mnqr.update_datetime = sysdate;
            commit;
        end loop;


        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_data', 'Cap nhat dai ly khong do ban, nhom truc tiep tuyen  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 1;
        update ams.la_comp_mmxiii_mnqr mnqr
        set
            mnqr.mnqr_fyc_ratio = decode(mnqr.mnqr_empl_asmt,
                AMS_MODL_COMP_MMXIII.AMST_NO, 70,
                100),
            mnqr.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            mnqr.update_datetime = sysdate
        where mnqr.record_date = trunc(valRecordDate, 'MM')
            and mnqr.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and mnqr.mnqr_be_paid in (
                AMS_MODL_COMP_MMXIII.BE_PAID_DTL,
                AMS_MODL_COMP_MMXIII.BE_PAID_TERM,
                AMS_MODL_COMP_MMXIII.BE_PAID_SPC
            );
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_data', ' mnqr_fyc_ratio thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 1;

        -------------------------------------------------------------
        /* Chi tiet du lieu tung thang*/
        -------------------------------------------------------------
        /* FYC, FYP, Phi phai thu, Phi thuc thu trong quy*/
        for i in 0..2
        loop
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            merge /*+ CARDINALITY(mnqr, 100)*/
                into ams.la_comp_mmxiii_mnqr mnqr
            using
                (
                    select /*+ CARDINALITY(data, 100)*/
                        data.outlet_ams_id,
                        data.record_date data_date,
                        nvl(data.period_fyc, 0) period_fyc,
                        nvl(data.period_fyp, 0) period_fyp,
                        nvl(data.period_coll_etmt, 0) period_coll_etmt,
                        nvl(data.period_coll_real, 0) period_coll_real
                    from ams.inp_data_outlet_tmp data
                    where data.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                        and data.record_date = add_months(trunc(valRecordDate, 'MM') , -i)
                        and data.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                        and data.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                ) upd
            on (
                trunc(valRecordDate, 'MM') = mnqr.record_date
                and
                AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnqr.mnqr_be_executing
                and
                mnqr.mnqr_be_paid in
                (
                    AMS_MODL_COMP_MMXIII.BE_PAID_DTL,
                    AMS_MODL_COMP_MMXIII.BE_PAID_TERM
                )
                and
                add_months(trunc(valRecordDate, 'MM') , -i) = mnqr.mnqr_data_date
                and
                upd.outlet_ams_id = mnqr.outlet_ams_id
            )
            when matched then
                update
                    set
                        mnqr.mnqr_period_fyc = upd.period_fyc,
                        mnqr.mnqr_period_fyp = upd.period_fyp,
                        mnqr.mnqr_period_coll_etmt = upd.period_coll_etmt,
                        mnqr.mnqr_period_coll_real = upd.period_coll_real;
            commit;
            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_data', 'Chi tiet du lieu tung thang quay cho quy  merge la_comp_mmxiii_agem thang ' || to_char(add_months(trunc(valRecordDate, 'MM') , i), 'dd/mm/yyyy'));
        end loop;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_data', 'Chi tiet du lieu tung thang  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 1;
        /* PR36
        Chi lay o thang cuoi cung cua Quy de merge vao cho thang cuoi cung cua Quy
        Cho nay da lam chinh xac roi*/
        merge /*+ CARDINALITY(mnqr, 100)*/
            into ams.la_comp_mmxiii_mnqr mnqr
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_ams_id,
                    data.record_date data_date,
                    nvl(data.period_afis, 0) period_afis,
                    nvl(data.period_afif, 0) period_afif
                from ams.inp_data_outlet_tmp data
                where data.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                    and data.record_date = trunc(valRecordDate, 'MM')
                    and data.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                    and data.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
            ) upd
        on (
            trunc(valRecordDate, 'MM') = mnqr.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnqr.mnqr_be_executing
            and
            mnqr.mnqr_be_paid in
            (
                AMS_MODL_COMP_MMXIII.BE_PAID_DTL
            )
            and
            upd.outlet_ams_id = mnqr.outlet_ams_id
            and
            trunc(valRecordDate, 'MM') = mnqr.mnqr_data_date
        )
        when matched then
            update
                set
                    mnqr.mnqr_period_afis = upd.period_afis,
                    mnqr.mnqr_period_afif = upd.period_afif,
                    mnqr.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    mnqr.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_data', 'PR36  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 1;

        /* FYC cong them*/
        for i in 3..4
        loop
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            merge /*+ CARDINALITY(mnqr, 100)*/
                into ams.la_comp_mmxiii_mnqr mnqr
            using
                (
                    select /*+ CARDINALITY(data, 100)*/
                        data.outlet_ams_id,
                        nvl(data.period_fyc, 0) period_fyc
                    from ams.inp_data_outlet_tmp data
                    where data.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                        and data.record_date =  add_months(trunc(valRecordDate, 'MM'), -i)
                        and data.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                        and data.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                ) upd
            on (
                trunc(valRecordDate, 'MM') = mnqr.record_date
                and
                AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnqr.mnqr_be_executing
                and
                mnqr.mnqr_be_paid in
                (
                    AMS_MODL_COMP_MMXIII.BE_PAID_SPC
                )
                and
                add_months(trunc(valRecordDate, 'MM') , -i) = mnqr.mnqr_data_date
                and
                upd.outlet_ams_id = mnqr.outlet_ams_id
            )
            when matched then
                update
                    set
                        mnqr.mnqr_period_fyc = upd.period_fyc,
                        mnqr.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                        mnqr.update_datetime = sysdate;
            commit;
            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_data', 'Chi tiet du lieu tung thang quay cho quy  merge la_comp_mmxiii_agem thang ' || to_char(add_months(trunc(valRecordDate, 'MM') , i), 'dd/mm/yyyy'));
        end loop;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_data', 'FYC cong them  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 1;

        /* Cho cac chi tieu dieu chinh cua ban hay nhom deu bang voi cac so lieu truoc
        FYP, FYC, PR36 , Phai phai thu thuc thu
        Con tuyen dung thuan thi phai chinh o BE PAID cua tung dai ly thi moi dung se chinh o phia sau
        Chinh o day la khong dung*/
        update ams.la_comp_mmxiii_mnqr mnqr
        set
            mnqr.mnqr_period_fyc_calc = nvl(mnqr.mnqr_period_fyc, 0) * nvl(mnqr.mnqr_fyc_ratio, 0) / 100,
            --chinhlk 28/3/2013 cap nhat lai FYP sau khi tinh toan bang cho no
            --cho tat ca moi dai ly thuoc nhom va ban
            mnqr.mnqr_period_fyp_calc = nvl(mnqr.mnqr_period_fyp, 0),
            --chinhlk 30/3/3013 chinh sua sau khi anh Hoa va anh Tuan
            --them voi chi tieu PR36 ty le thu phi
            mnqr.mnqr_period_afis_calc = mnqr.mnqr_period_afis,
            mnqr.mnqr_period_afif_calc = mnqr.mnqr_period_afif,
            mnqr.mnqr_period_coll_etmt_calc = mnqr.mnqr_period_coll_etmt,
            mnqr.mnqr_period_coll_real_calc = mnqr.mnqr_period_coll_real,
            mnqr.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            mnqr.update_datetime = sysdate
        where mnqr.record_date = trunc(valRecordDate, 'MM')
            and mnqr.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and mnqr.mnqr_be_paid in (
                AMS_MODL_COMP_MMXIII.BE_PAID_DTL,
                AMS_MODL_COMP_MMXIII.BE_PAID_TERM,
                AMS_MODL_COMP_MMXIII.BE_PAID_SPC
            );
        commit;

        /* Doi voi Truong ban: Cap nhat FYC FYP cho ban theo ty le
        Doi voi truong ban Neu ma la nhom chau tro di thi FYC va ca FYP = 0
        PR36 , Phai phai thu thuc thu cung cho bang  0 luon de cong vao cho no
        cho phan tren nay luon*/
        update ams.la_comp_mmxiii_mnqr mnqr
        set
            mnqr.mnqr_period_fyp_calc = 0, --cap nhat cho = 0 luon o day doi voi ca FYP va FYC thi moi dung duoc
            mnqr.mnqr_period_fyc_calc = 0, --cap nhat cho = 0 luon o day
            mnqr.mnqr_period_afis_calc = 0,
            mnqr.mnqr_period_afif_calc = 0,
            mnqr.mnqr_period_coll_etmt_calc = 0,
            mnqr.mnqr_period_coll_real_calc = 0
        where mnqr.record_date = trunc(valRecordDate, 'MM')
            and mnqr.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and mnqr.mnqr_be_paid in (
                AMS_MODL_COMP_MMXIII.BE_PAID_DTL,
                AMS_MODL_COMP_MMXIII.BE_PAID_TERM,
                AMS_MODL_COMP_MMXIII.BE_PAID_SPC
            )
            --chi xac dinh doi voi thuong quy danh cho truong ban
            --chi  xu ly cho no o ma CV04 thoi tuc la o truong ban thoi
            --Doi voi truong nhom thi KHONG duoc dung o day
            and mnqr.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
            and nvl(mnqr.mnqr_branch_level, 0) >= 2;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_data', 'Doi voi Truong ban: Cap nhat FYC FYP cho ban theo ty le FYP, FYC, PR36 , Phai phai thu thuc thu  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 1;

        /* Diem quan ly va ty le hoat dong cua Truong nhom */
        for i in 0..2
        loop
            merge /*+ CARDINALITY(mnqr, 100)*/
                into ams.la_comp_mmxiii_mnqr mnqr
            using
                (
                    select /*+ CARDINALITY(data, 100)*/
                        data.agent_id outlet_id,
                        max(data.manager_point) mnqr_period_point
                    from ams.la_monthly_point data
                    where data.month = add_months(trunc(valRecordDate, 'MM') , -i)
                        and data.manager_point is not null--can phai them dieu kien nay thi moi dung duoc
                    group by data.agent_id
                ) upd
            on (
                trunc(valRecordDate, 'MM') = mnqr.record_date
                and
                AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnqr.mnqr_be_executing
                and
                mnqr.mnqr_be_paid in
                (--chi xu ly o du lieu chi tiet
                    AMS_MODL_COMP_MMXIII.BE_PAID_DTL
                )
                and
                add_months(trunc(valRecordDate, 'MM') , -i) = mnqr.mnqr_data_date
                and--chi xu ly o nhung thang ma la truong ban truong nhom thoi
                mnqr.outlet_ams_id = mnqr.mnqr_outlet_ams_id
                and
                upd.outlet_id = mnqr.outlet_id
            )
            when matched then
                update
                    set
                        mnqr.mnqr_period_point = upd.mnqr_period_point;
            commit;
        end loop;

        merge /*+ CARDINALITY(mnqr, 100)*/
            into ams.la_comp_mmxiii_mnqr mnqr
        using
            (
                /*Lay so luong cac hop dong phat hanh thuan trong QUY lam theo cong thuc nay*/
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_ams_id,
                    /*chinhlk 7/5/2013 cap nhat lai theo yeu cau moi la:
                    chi co duoc cham diem ca 3 thang thi moi tinh, con khong cham 1 thang thi cho bang null luon*/
                    decode(count(data.outlet_ams_id),
                        3, round(sum(nvl(data.mnqr_period_point, 0)) / count(data.outlet_ams_id), 2),
                        null) mnqr_period_point
                from ams.la_comp_mmxiii_mnqr data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and data.mnqr_be_paid in
                    ( --lay du lieu chi tiet
                        AMS_MODL_COMP_MMXIII.BE_PAID_DTL
                    )
                    and--chi xu ly o nhung thang ma la truong ban truong nhom thoi
                    data.outlet_ams_id = data.mnqr_outlet_ams_id
                    --lay diem cua nhung ong da co thoi --chi tinh cac dai ly da dat duoc du lieu dung cho no thi moi chinh xac duoc
                    --thi du lieu moi chinh xac duoc
                    and data.mnqr_period_point is not null
                group by data.outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = mnqr.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnqr.mnqr_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = mnqr.mnqr_be_paid
            and--chi xu ly o nhung thang ma la truong ban truong nhom thoi
            mnqr.outlet_ams_id = mnqr.mnqr_outlet_ams_id
            and
            upd.outlet_ams_id = mnqr.outlet_ams_id
            )
        when matched then
            update
                set
                    mnqr.mnqr_period_point = upd.mnqr_period_point;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_data', 'Cap nhat diem tung thang thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 1.1;

        /* Tuyen dung thuan trong ky: Xu ly truoc sau do tong hop so lieu cho no
        chinhlk 30/3/2013 thay doi lai de tinh truoc cho no de tinh khi ma truong ban sau
        dua phan nay len day de tinh cho no de phia sau luon the*/

        /*chinhlk 11/4/2013 sua doi cho nay chat khuc
        tuyen dung vao thang nao thi se duoc tinh cho thang day va xac dinh trong thang day
        den khi thang sau tach nhom ra thang nhom cap chau thi van xac dinh cho no duoc la cua ong truong ban
        Chi cap nhat cho cac gia tri BE_PAID_DTL boi vi
        Neu nhu vay thi se tinh duoc no xac dinh o thang nao cho no
        o day la tuyen dung thuan nen khong tinh dai ly nghi viec*/
        update ams.la_comp_mmxiii_mnqr mnqr
        set
            mnqr.mnqr_period_empl = 1,
            mnqr.mnqr_period_empl_calc = 1 --khi da co dieu kien phia tren thi can phai co dieu kien phia duoi nay nua thi moi dung duoc
        where mnqr.record_date = trunc(valRecordDate, 'MM')
            and mnqr.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and mnqr.mnqr_be_paid in
            (  /*o day la tuyen dung thuan nen khong tinh dai ly nghi viec*/
                AMS_MODL_COMP_MMXIII.BE_PAID_DTL
            )
            --CHO NAY CAN PHAI HOI LAI ANH HUU HOA NGAY
            --NGAY TUYEN DUNG CUA NO PHAI la tu 16/12/2012
            --and mnqr.effective_date >= trunc(valRecordDate, 'YYYY')
            --dieu kien phia duoi nay la da dung roi nen khong can phai them dieu kien nay nua
            and mnqr.effective_date--ngay lam viec la sau ngay 15 cua thang cuoi quy truoc
                between (add_months(trunc(valRecordDate, 'MM'), -3) + 15)
                and (add_months(trunc(valRecordDate, 'MM'), -0) + 15)
            /*neu ma ngay vao lam cua no bang chinh  thang du lieu cua no
            cong them voi 15 ngay nua neu nam trong thang nao thi se tinh cho thang du lieu day cho no
            Dieu kien nay la rat quan trong va da xu ly dung duoc cho no roi
            Xu ly nhu code ben duoi thi moi lam duoc cho no*/
            and add_months(trunc(mnqr.effective_date - 15, 'MM'), 1) = mnqr.mnqr_data_date
            and
            (
                mnqr.terminative_date is null
                or --cho nay cung da dam bao la nghi viec o sau quy do roi nen yen tam roi
                mnqr.terminative_date > (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
            );
        commit;

        /*Cap nhat lai So luong tuyen dung thuan doi voi Cap >= 2 tuc cap chau cua
        Thuong quy Truong ban se = 0*/
        update ams.la_comp_mmxiii_mnqr mnqr
        set
            mnqr.mnqr_period_empl_calc = 0
        where mnqr.record_date = trunc(valRecordDate, 'MM')
            and mnqr.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and mnqr.mnqr_be_paid in
            (  /*o day la tuyen dung thuan nen khong tinh dai ly nghi viec*/
                AMS_MODL_COMP_MMXIII.BE_PAID_DTL
            )
            --CHO NAY CAN PHAI HOI LAI ANH HUU HOA NGAY
            --NGAY TUYEN DUNG CUA NO PHAI la tu 16/12/2012
            --and mnqr.effective_date >= trunc(valRecordDate, 'YYYY')
            --dieu kien phia duoi nay la da dung roi nen khong can phai them dieu kien nay nua
            and mnqr.effective_date--ngay lam viec la sau ngay 15 cua thang cuoi quy truoc
                between (add_months(trunc(valRecordDate, 'MM'), -3) + 15)
                and (add_months(trunc(valRecordDate, 'MM'), -0) + 15)
            /*neu ma ngay vao lam cua no bang chinh  thang du lieu cua no
            cong them voi 15 ngay nua neu nam trong thang nao thi se tinh cho thang du lieu day cho no
            Dieu kien nay la rat quan trong va da xu ly dung duoc cho no roi*/
            and add_months(trunc(mnqr.effective_date - 15, 'MM'), 1) = mnqr.mnqr_data_date
            and
            (
                mnqr.terminative_date is null
                or --cho nay cung da dam bao la nghi viec o sau quy do roi nen yen tam roi
                mnqr.terminative_date > (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
            )
            --them dieu kien nay vao
            --chi xac dinh doi voi thuong quy danh cho truong ban
            --chi  xu ly cho no o ma CV04 thoi tuc la o truong ban thoi
            --Doi voi truong nhom thi KHONG duoc dung o day
            and mnqr.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
            and nvl(mnqr.mnqr_branch_level, 0) >= 2;
        commit;

        -------------------------------------------------------------
        /* Tong cong so lieu theo ban va nhom cho Truong ban va Truong nhom*/
        -------------------------------------------------------------
        /* FYP, AFIS, AFIF, Phi phai thu, Phi thuc thu
        Tinh cho cac cac chi  tieu khi ma duoc cong vao cho no*/
        merge /*+ CARDINALITY(mnqr, 100)*/
            into ams.la_comp_mmxiii_mnqr mnqr
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_ams_id,
                    data.mnqr_branch_ams_id,
                    sum(nvl(data.mnqr_period_fyp, 0)) mnqr_period_fyp,
                    sum(nvl(data.mnqr_period_fyp_calc, 0)) mnqr_period_fyp_calc,
                    sum(nvl(data.mnqr_period_afis, 0)) mnqr_period_afis,
                    sum(nvl(data.mnqr_period_afis_calc, 0)) mnqr_period_afis_calc,
                    sum(nvl(data.mnqr_period_afif, 0)) mnqr_period_afif,
                    sum(nvl(data.mnqr_period_afif_calc, 0)) mnqr_period_afif_calc,
                    sum(nvl(data.mnqr_period_coll_etmt, 0)) mnqr_period_coll_etmt,
                    sum(nvl(data.mnqr_period_coll_etmt_calc, 0)) mnqr_period_coll_etmt_calc,
                    sum(nvl(data.mnqr_period_coll_real, 0)) mnqr_period_coll_real,
                    sum(nvl(data.mnqr_period_coll_real_calc, 0)) mnqr_period_coll_real_calc,
                    /*chinhlk them ca tuyen dung thuan trong ky*/
                    sum(nvl(data.mnqr_period_empl, 0)) mnqr_period_empl,
                    sum(nvl(data.mnqr_period_empl_calc, 0)) mnqr_period_empl_calc
                from ams.la_comp_mmxiii_mnqr data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and data.mnqr_be_paid in
                    (
                        AMS_MODL_COMP_MMXIII.BE_PAID_DTL,
                        AMS_MODL_COMP_MMXIII.BE_PAID_TERM
                    )
                    and data.mnqr_data_date
                        between add_months(trunc(valRecordDate, 'MM'), -2)
                        and trunc(valRecordDate, 'MM')
                group by data.outlet_ams_id,
                    data.mnqr_branch_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = mnqr.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnqr.mnqr_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = mnqr.mnqr_be_paid
            and
            upd.outlet_ams_id = mnqr.outlet_ams_id
            and
            upd.mnqr_branch_ams_id = mnqr.mnqr_branch_ams_id
        )
        when matched then
            update
                set
                    mnqr.mnqr_period_fyp = upd.mnqr_period_fyp,
                    mnqr.mnqr_period_fyp_calc = upd.mnqr_period_fyp_calc,
                    mnqr.mnqr_period_afis = upd.mnqr_period_afis,
                    mnqr.mnqr_period_afis_calc = upd.mnqr_period_afis_calc,
                    mnqr.mnqr_period_afif = upd.mnqr_period_afif,
                    mnqr.mnqr_period_afif_calc = upd.mnqr_period_afif_calc,
                    mnqr.mnqr_period_coll_etmt = upd.mnqr_period_coll_etmt,
                    mnqr.mnqr_period_coll_etmt_calc = upd.mnqr_period_coll_etmt_calc,
                    mnqr.mnqr_period_coll_real = upd.mnqr_period_coll_real,
                    mnqr.mnqr_period_coll_real_calc = upd.mnqr_period_coll_real_calc,
                    mnqr.mnqr_period_empl = upd.mnqr_period_empl,
                    mnqr.mnqr_period_empl_calc = upd.mnqr_period_empl_calc;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_data', 'Tong cong so lieu theo ban va nhom cho Truong ban va Truong nhom  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 1;

        /* FYC phai tinh cho ca 2 thang da co*/
        merge /*+ CARDINALITY(mnqr, 100)*/
            into ams.la_comp_mmxiii_mnqr mnqr
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_ams_id,
                    data.mnqr_branch_ams_id,
                    sum(nvl(data.mnqr_period_fyc, 0)) mnqr_period_fyc,
                    sum(nvl(data.mnqr_period_fyc_calc, 0)) mnqr_period_fyc_calc
                from ams.la_comp_mmxiii_mnqr data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and data.mnqr_be_paid in
                    (
                        AMS_MODL_COMP_MMXIII.BE_PAID_DTL,
                        AMS_MODL_COMP_MMXIII.BE_PAID_TERM,
                        AMS_MODL_COMP_MMXIII.BE_PAID_SPC
                    )
                group by data.outlet_ams_id,
                    data.mnqr_branch_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = mnqr.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnqr.mnqr_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = mnqr.mnqr_be_paid
            and
            upd.outlet_ams_id = mnqr.outlet_ams_id
            and
            upd.mnqr_branch_ams_id = mnqr.mnqr_branch_ams_id
            )
        when matched then
            update
                set
                    mnqr.mnqr_period_fyc = upd.mnqr_period_fyc,
                    mnqr.mnqr_period_fyc_calc = upd.mnqr_period_fyc_calc,
                    mnqr.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    mnqr.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_data', 'FYC phai tinh cho ca 2 thang da co  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 1;

        /*Cap nhat so luong HD KTM thuan trong QUY de xac dinh dai ly dat chuan o day*/
        /*Lay trong QUY*/
        merge /*+ CARDINALITY(mnqr, 100)*/
            into ams.la_comp_mmxiii_mnqr mnqr
        using
            (
                /*Lay so luong cac hop dong phat hanh thuan trong QUY lam theo cong thuc nay*/
                select /*+ CARDINALITY(grou, 100)*/
                    grou.outlet_ams_id,
                    sum(nvl(grou.data_value, 0)) data_value
                from
                (   /*cac hop dong duoc phat hanh trong quy*/
                    select /*+ CARDINALITY(data, 100)*/
                        data.outlet_ams_id,
                        sum(nvl(data.data_value, 0)) data_value
                    from ams.mod_data data
                    where data.record_date --lay trong QUY
                        between add_months(trunc(valRecordDate, 'MM'), -2)
                        and trunc(valRecordDate, 'MM')
                        and data.module_code = AMS_MODL_INPUT_DATA.MODULE_CODE_MAIN
                        and data.data_code = AMS_MODL_INPUT_DATA.DATA_CODE_ISSU
                    group by data.outlet_ams_id
                    union all --tru di cac hop dong bi huy 14 ngay trong quy do
                    select /*+ CARDINALITY(data, 100)*/
                        data.outlet_ams_id,
                        sum(-nvl(data.data_value, 0)) data_value
                    from ams.mod_data data
                    where data.record_date
                        between add_months(trunc(valRecordDate, 'MM'), -2)
                        and trunc(valRecordDate, 'MM')
                        and data.module_code = AMS_MODL_INPUT_DATA.MODULE_CODE_MAIN
                        and data.data_code = AMS_MODL_INPUT_DATA.DATA_CODE_CANC
                    group by data.outlet_ams_id
                ) grou
                group by grou.outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = mnqr.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnqr.mnqr_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = mnqr.mnqr_be_paid
            and
            upd.outlet_ams_id = mnqr.outlet_ams_id
            )
        when matched then
            update
                set
                    mnqr.mnqr_period_issue = upd.data_value;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_data', 'Cap nhat so luong HD KTM thuan trong QUY de xac dinh dai ly dat chuan o day  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 1;

        /* PR36 va Ty le thu phi*/
        update ams.la_comp_mmxiii_mnqr mnqr
        set
            mnqr.mnqr_period_pr36 =
                round(
                    decode(nvl(mnqr.mnqr_period_afis_calc, 0),
                        0, 100,
                        least(
                            (nvl(mnqr.mnqr_period_afif_calc, 0) / nvl(mnqr.mnqr_period_afis_calc, 0)) * 100,
                            999.99
                        )
                    ),
                    2
                ),
            mnqr.mnqr_period_coll_rate =
                round(
                    decode(nvl(mnqr.mnqr_period_coll_etmt_calc, 0),
                        0, 100,
                        least(
                            (nvl(mnqr.mnqr_period_coll_real_calc, 0) / nvl(mnqr.mnqr_period_coll_etmt_calc, 0)) * 100,
                            999.99
                        )
                    ),
                    2
                )
        where mnqr.record_date = trunc(valRecordDate, 'MM')
            and mnqr.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and mnqr.mnqr_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES;
        commit;


        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_data', 'Tuyen dung thuan trong ky  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 1;

        /* Dat chuan trong ky
           FYP: >= 15.000.000
           Co toi thieu 2 HD KTM thuan trong QUY
           PR36: 85
           Thu phi: 92
           chinhlk 9/3/2013 co thay doi code o day */
        update ams.la_comp_mmxiii_mnqr mnqr
        set
            mnqr.mnqr_period_qual = 1,
            mnqr.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            mnqr.update_datetime = sysdate
        where mnqr.record_date = trunc(valRecordDate, 'MM')
            and mnqr.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and mnqr.mnqr_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            --chinhlk 27/3/2013
            --khong tinh doi voi truong nhom hay truong ban da co
            and mnqr.outlet_ams_id <> mnqr.mnqr_outlet_ams_id--khong tinh truong nhom hay truong ban
            --chinhlk 9/3/2013 sua lai o day phai la < chu khong phai <= vi neu thi se tinh <= ngay 16 ma phai < 16 vi tu ngay 15 tro ve truoc tinh cho thang day
            --tu ngay 16 tro ve sau thi tinh cho thang sau
            and mnqr.effective_date <  trunc(valRecordDate, 'MM') + 15  --day la ngay 16 roi day nhe nen phai la chi < 16 thi tuc la chi tinh voi cac dai ly vao truoc ngay
            and--con lam viec tai thoi diem xet
            (
                mnqr.terminative_date is null
                or
                mnqr.terminative_date > (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
            )
            --chinhlk thay doi code theo quy che nam 2013 ve dai ly dat chuan
            and nvl(mnqr.mnqr_period_fyp, 0) >= 15000000
            and nvl(mnqr.mnqr_period_issue, 0) >= 2
            and nvl(mnqr.mnqr_period_pr36, 0) >= 85
            and nvl(mnqr.mnqr_period_coll_rate, 0) >= 92;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_data', ' Dat chuan trong ky thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 1;

        -------------------------------------------------------------
        /* So lieu Truong ban, Truong nhom*/
        -------------------------------------------------------------
        /* FYC, FYP, Tuyen dung thuan, Dat chuan trong ky*/
        --chinhlk 28/3/2013 cap nhat lai phai lay tu ty le sau khi dieu chinh de cho vao cho dung
        --mnqr_period_fyp_calc de cho vao      mnqr_period_fyp khi da xu ly cho no
        --khong dung them cot nua
        merge /*+ CARDINALITY(comp, 100)*/
            into ams.la_compensation_mmxiii_tmp comp
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.mnqr_branch_ams_id,
                    sum(nvl(data.mnqr_period_fyc, 0)) mnqr_period_fyc,
                    sum(nvl(data.mnqr_period_fyc_calc, 0)) mnqr_period_fyc_calc,
                    sum(nvl(data.mnqr_period_fyp_calc, 0)) mnqr_period_fyp, --cho nay chinhlk cap nhat lai phai lau tu ty le sau khi dieu chinh de cho vao cho dung
                    sum(nvl(data.mnqr_period_empl_calc, 0)) mnqr_period_empl,
                    sum(nvl(data.mnqr_period_qual, 0)) mnqr_period_qual
                from ams.la_comp_mmxiii_mnqr data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and data.mnqr_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                    and data.outlet_ams_id <> data.mnqr_outlet_ams_id--khong tinh truong nhom hay truong ban
                    and data.mnqr_branch_ams_id is not null
                group by data.mnqr_branch_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.mnqr_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = comp.mnqr_be_paid
            and
            upd.mnqr_branch_ams_id = comp.mnqr_branch_ams_id
        )
        when matched then
            update
                set
                    comp.mnqr_period_fyc = upd.mnqr_period_fyc,
                    comp.mnqr_period_fyc_calc = upd.mnqr_period_fyc_calc,
                    comp.mnqr_period_fyp = upd.mnqr_period_fyp,
                    comp.mnqr_period_empl = upd.mnqr_period_empl,
                    comp.mnqr_period_qual = upd.mnqr_period_qual,
                    comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    comp.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_data', ' So lieu Truong ban, Truong nhom thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 1;

        /* Phi phai thu, phi thuc thu trong ky
        Phai tinh ca Truong ban va Truong nhom o day*/
        merge /*+ CARDINALITY(comp, 100)*/
            into ams.la_compensation_mmxiii_tmp comp
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.mnqr_branch_ams_id,
                    sum(nvl(data.mnqr_period_coll_etmt_calc, 0)) mnqr_period_coll_etmt,
                    sum(nvl(data.mnqr_period_coll_real_calc, 0)) mnqr_period_coll_real
                from ams.la_comp_mmxiii_mnqr data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and data.mnqr_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                    and data.mnqr_branch_ams_id is not null
                group by data.mnqr_branch_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.mnqr_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = comp.mnqr_be_paid
            and
            upd.mnqr_branch_ams_id = comp.mnqr_branch_ams_id
        )
        when matched then
            update
                set
                    comp.mnqr_period_coll_etmt = upd.mnqr_period_coll_etmt,
                    comp.mnqr_period_coll_real = upd.mnqr_period_coll_real,
                    comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    comp.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_data', 'Phi phai thu, phi thuc thu trong ky  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 1;

        /* AFIS, AFIF*/
        merge /*+ CARDINALITY(comp, 100)*/
            into ams.la_compensation_mmxiii_tmp comp
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.mnqr_branch_ams_id,
                    sum(nvl(data.mnqr_period_afis_calc, 0)) mnqr_period_afis,
                    sum(nvl(data.mnqr_period_afif_calc, 0)) mnqr_period_afif
                from ams.la_comp_mmxiii_mnqr data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and data.mnqr_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                    and (
                        data.terminative_date is null
                        or
                        data.terminative_date > (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                    )
                    and data.mnqr_branch_ams_id is not null
                group by data.mnqr_branch_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.mnqr_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = comp.mnqr_be_paid
            and
            upd.mnqr_branch_ams_id = comp.mnqr_branch_ams_id
        )
        when matched then
            update
                set
                    comp.mnqr_period_afis = upd.mnqr_period_afis,
                    comp.mnqr_period_afif = upd.mnqr_period_afif,
                    comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    comp.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_data', 'AFIS, AFIF  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 1;

        /* PR36 va Ty le thu phi*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.mnqr_period_pr36 =
                round(
                    decode(nvl(comp.mnqr_period_afis, 0),
                        0, 100,
                        least(
                            (nvl(comp.mnqr_period_afif, 0) / nvl(comp.mnqr_period_afis, 0)) * 100,
                            999.99
                        )
                    ),
                    2
                ),
            comp.mnqr_period_coll_rate =
                round(
                    decode(nvl(comp.mnqr_period_coll_etmt, 0),
                        0, 100,
                        least(
                            (nvl(comp.mnqr_period_coll_real, 0) / nvl(comp.mnqr_period_coll_etmt, 0)) * 100,
                            999.99
                        )
                    ),
                    2
                )
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.mnqr_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_data', 'PR36 va Ty le thu phi  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 1;

        /* Diem thuong trung binh duoc cap nhat vao bang chinh*/
        merge /*+ CARDINALITY(comp, 100)*/
            into ams.la_compensation_mmxiii_tmp comp
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_ams_id,
                    max(data.mnqr_period_point) mnqr_period_point
                from ams.la_comp_mmxiii_mnqr data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and data.mnqr_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                    --chi xu ly o nhung thang ma la truong ban truong nhom thoi
                    and data.outlet_ams_id = data.mnqr_outlet_ams_id
                    and data.mnqr_period_point is not null--diem trung binh cua quy cua no la co du lieu
                group by data.outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.mnqr_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = comp.mnqr_be_paid
            and
            upd.outlet_ams_id = comp.outlet_ams_id
        )
        when matched then
            update
                set
                    comp.mnqr_period_point = upd.mnqr_period_point;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_data', 'Diem thuong trung binh thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 2;

        /*Gather lai de chay duoc nhanh hon*/
        dbms_stats.gather_table_stats(null, 'la_comp_mmxiii_mnqr', cascade => true);


        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_data', 'gather_table_stats la_comp_mmxiii_mnqr thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /*Xy ly theo cac nhom*/
        for unit_rec in
          (
              select /*+ CARDINALITY(mnqr, 100)*/
                  mnqr.unit_ams_id
              from ams.la_comp_mmxiii_mnqr mnqr
              where mnqr.record_date = trunc(valRecordDate, 'MM')
                  and mnqr.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                  and mnqr.mnqr_be_paid in
                  (   /*chi lay du lieu o bang chinh*/
                      AMS_MODL_COMP_MMXIII.BE_PAID_YES
                  )
                  and mnqr.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02
                  and mnqr.unit_ams_id is not null
              group by mnqr.unit_ams_id
          )
        loop
            /*Lay so luong dat tieu chuan va kiem tra neu > 0 thi moi them vao*/
            select count(*)
                into var_qty
            from
            (
                select  /*+ CARDINALITY(res, 100)*/
                    res.outlet_ams_id
                from
                (
                    /*Danh sach cac dai ly moi do nhom do tuyen vao*/
                    select /*+ CARDINALITY(key, 100) CARDINALITY(empl, 100) CARDINALITY(outl, 100)*/
                        outl.outlet_ams_id
                    from
                    (
                        select /*+ CARDINALITY(mnqr, 100)*/
                            mnqr.outlet_id
                        from ams.la_comp_mmxiii_mnqr mnqr
                        where mnqr.record_date = trunc(valRecordDate, 'MM')
                            and mnqr.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                            and mnqr.mnqr_be_paid in
                            (   /*chi lay du lieu o bang chinh*/
                                AMS_MODL_COMP_MMXIII.BE_PAID_YES
                            )
                            and mnqr.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02
                            and mnqr.unit_ams_id = unit_rec.unit_ams_id
                        group by mnqr.outlet_id
                    ) key
                    join --lay ra danh sach cac dai ly duoc cac ca nhan tren tuyen vao
                    (
                        select /*+ CARDINALITY(tmp, 100)*/
                            tmp.outlet_id,
                            tmp.empl_id
                        from ams.la_prom_history_agent_tmp tmp
                        where tmp.record_date = trunc(valRecordDate, 'MM')
                    ) empl
                        on empl.empl_id = key.outlet_id
                     join /*Lay cac dai ly moi vao lam viec trong 3 thang de khong bi nhieu du lieu*/
                     (
                        select /*+ CARDINALITY(mnqr, 100)*/
                            mnqr.outlet_id,
                            mnqr.outlet_ams_id
                        from ams.la_comp_mmxiii_mnqr mnqr
                        where mnqr.record_date = trunc(valRecordDate, 'MM')
                            and mnqr.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                            and mnqr.mnqr_be_paid in
                            (   /*chi lay du lieu o bang chinh*/
                                AMS_MODL_COMP_MMXIII.BE_PAID_YES
                            )
                            and mnqr.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02
                            /*phai lam viec moi vao lam trong quy thi moi dung duoc*/
                            and mnqr.effective_date--ngay lam viec la sau ngay 15 cua thang cuoi quy truoc
                                between (add_months(trunc(valRecordDate, 'MM'), -3) + 15)
                                and (add_months(trunc(valRecordDate, 'MM'), -0) + 15)
                     ) outl
                        on outl.outlet_id = empl.outlet_id
                    /*tru di danh sach cac dai ly co trong nhom do da co de khong bi thua*/
                    minus
                    select /*+ CARDINALITY(mnqr, 100)*/
                        mnqr.outlet_ams_id
                    from ams.la_comp_mmxiii_mnqr mnqr
                    where mnqr.record_date = trunc(valRecordDate, 'MM')
                        and mnqr.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                        and mnqr.mnqr_be_paid in
                        (   /*chi lay du lieu o bang chinh*/
                            AMS_MODL_COMP_MMXIII.BE_PAID_YES
                        )
                        and mnqr.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02
                        and mnqr.unit_ams_id = unit_rec.unit_ams_id
                    group by mnqr.outlet_ams_id
               ) res
               group by res.outlet_ams_id
           ) repo;

            /*Neu so luong dai ly dat dieu kien tim kiem >0 thi moi insert vao*/
            if var_qty >0 then
                /*Duyet tung nhom neu ma co nhom khong co chua dai ly thi se phai insert vao neu thieu*/
                insert /*+ APPEND */ into ams.la_comp_mmxiii_mnqr nologging(
                    outlet_id,
                    outlet_ams_id,
                    record_date,
                    version_date,
                    company_id,
                    company_ams_id,
                    company_name,
                    agency_id,
                    agency_ams_id,
                    agency_name,
                    unit_id,
                    unit_ams_id,
                    unit_name,
                    outlet_name,
                    effective_date,
                    terminative_date,
                    mnqr_be_paid,
                    mnqr_be_executing,
                    mnqr_data_date,
                    mnqr_from_date,
                    mnqr_to_date,
                    mnqr_outlet_id,
                    mnqr_outlet_ams_id,
                    mnqr_branch_id,
                    mnqr_branch_ams_id,
                    mnqr_position_code,
                    mnqr_period_empl,
                    mnqr_period_empl_calc,
                    create_user,
                    update_user,
                    create_datetime,
                    update_datetime)
                select /*+ CARDINALITY(res, 100) CARDINALITY(key, 100)*/
                    key.outlet_id,
                    key.outlet_ams_id,
                    trunc(valRecordDate, 'MM'),
                    trunc(sysdate, 'DD'),
                    key.company_id,
                    key.company_ams_id,
                    key.company_name,
                    key.agency_id,
                    key.agency_ams_id,
                    key.agency_name,
                    key.unit_id,
                    key.unit_ams_id,
                    key.unit_name,
                    key.outlet_name,
                    key.effective_date,
                    key.terminative_date,
                    AMS_MODL_COMP_MMXIII.BE_PAID_EMPL,
                    AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
                    key.mnqr_data_date,
                    key.mnqr_from_date,
                    key.mnqr_to_date,
                    key.mnqr_outlet_id,
                    key.mnqr_outlet_ams_id,
                    null,--key.mnqr_branch_id,
                    unit_rec.unit_ams_id,--lay theo ma nay vao
                    key.mnqr_position_code,
                    0,
                    0,
                    AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    sysdate,
                    sysdate
                from
                (
                    select  /*+ CARDINALITY(res, 100)*/
                        res.outlet_ams_id
                    from
                    (
                        /*Danh sach cac dai ly moi do nhom do tuyen vao*/
                        select /*+ CARDINALITY(key, 100) CARDINALITY(empl, 100) CARDINALITY(outl, 100)*/
                            outl.outlet_ams_id
                        from
                        (
                            select /*+ CARDINALITY(mnqr, 100)*/
                                mnqr.outlet_id
                            from ams.la_comp_mmxiii_mnqr mnqr
                            where mnqr.record_date = trunc(valRecordDate, 'MM')
                                and mnqr.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                                and mnqr.mnqr_be_paid in
                                (   /*chi lay du lieu o bang chinh*/
                                    AMS_MODL_COMP_MMXIII.BE_PAID_YES
                                )
                                and mnqr.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02
                                and mnqr.unit_ams_id = unit_rec.unit_ams_id
                            group by mnqr.outlet_id
                        ) key
                        join --lay ra danh sach cac dai ly duoc cac ca nhan tren tuyen vao
                        (
                            select /*+ CARDINALITY(tmp, 100)*/
                                tmp.outlet_id,
                                tmp.empl_id
                            from ams.la_prom_history_agent_tmp tmp
                            where tmp.record_date = trunc(valRecordDate, 'MM')
                        ) empl
                            on empl.empl_id = key.outlet_id
                         join /*Lay cac dai ly moi vao lam viec trong 3 thang de khong bi nhieu du lieu*/
                         (
                            select /*+ CARDINALITY(mnqr, 100)*/
                                mnqr.outlet_id,
                                mnqr.outlet_ams_id
                            from ams.la_comp_mmxiii_mnqr mnqr
                            where mnqr.record_date = trunc(valRecordDate, 'MM')
                                and mnqr.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                                and mnqr.mnqr_be_paid in
                                (   /*chi lay du lieu o bang chinh*/
                                    AMS_MODL_COMP_MMXIII.BE_PAID_YES
                                )
                                and mnqr.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02
                                /*phai lam viec moi vao lam trong quy thi moi dung duoc*/
                                and mnqr.effective_date--ngay lam viec la sau ngay 15 cua thang cuoi quy truoc
                                    between (add_months(trunc(valRecordDate, 'MM'), -3) + 15)
                                    and (add_months(trunc(valRecordDate, 'MM'), -0) + 15)
                         ) outl
                            on outl.outlet_id = empl.outlet_id
                        /*tru di danh sach cac dai ly co trong nhom do da co de khong bi thua*/
                        minus
                        select /*+ CARDINALITY(mnqr, 100)*/
                            mnqr.outlet_ams_id
                        from ams.la_comp_mmxiii_mnqr mnqr
                        where mnqr.record_date = trunc(valRecordDate, 'MM')
                            and mnqr.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                            and mnqr.mnqr_be_paid in
                            (   /*chi lay du lieu o bang chinh*/
                                AMS_MODL_COMP_MMXIII.BE_PAID_YES
                            )
                            and mnqr.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02
                            and mnqr.unit_ams_id = unit_rec.unit_ams_id
                        group by mnqr.outlet_ams_id
                   ) res
                   group by res.outlet_ams_id
               ) repo
               join
               (
                  select /*+ CARDINALITY(mnqr, 100)*/
                      mnqr.outlet_id,
                      mnqr.outlet_ams_id,
                      mnqr.company_id,
                      mnqr.company_ams_id,
                      mnqr.company_name,
                      mnqr.agency_id,
                      mnqr.agency_ams_id,
                      mnqr.agency_name,
                      mnqr.unit_id,
                      mnqr.unit_ams_id,
                      mnqr.unit_name,
                      mnqr.outlet_name,
                      mnqr.effective_date,
                      mnqr.terminative_date,
                      mnqr.mnqr_data_date,
                      mnqr.mnqr_from_date,
                      mnqr.mnqr_to_date,
                      mnqr.mnqr_outlet_id,
                      mnqr.mnqr_outlet_ams_id,
                      mnqr.mnqr_branch_id,
                      mnqr.mnqr_branch_ams_id,
                      mnqr.mnqr_position_code
                  from ams.la_comp_mmxiii_mnqr mnqr
                  where mnqr.record_date = trunc(valRecordDate, 'MM')
                      and mnqr.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                      and mnqr.mnqr_be_paid in
                      (   /*chi lay du lieu o bang chinh*/
                          AMS_MODL_COMP_MMXIII.BE_PAID_YES
                      )
                      and mnqr.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02
                      /*phai lam viec moi vao lam trong quy thi moi dung duoc*/
                      and mnqr.effective_date--ngay lam viec la sau ngay 15 cua thang cuoi quy truoc
                          between (add_months(trunc(valRecordDate, 'MM'), -3) + 15)
                          and (add_months(trunc(valRecordDate, 'MM'), -0) + 15)
               ) key
                  on key.outlet_ams_id = repo.outlet_ams_id;
                commit;
            end if;
        end loop;


        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_data', 'Xu ly theo cac nhom thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 2;

        /*cap nhat lai du lieu cua cac dai ly nay cua nhom day cho la = 0
        Doi voi cac du lieu da co truoc do roi
        O truong Be paid = Yes thi moi dung duoc
        */
        update ams.la_comp_mmxiii_mnqr mnqr
        set mnqr.mnqr_period_empl = 0,
            mnqr.mnqr_period_empl_calc = 0
        where mnqr.record_date = trunc(valRecordDate, 'MM')
            and mnqr.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and mnqr.mnqr_be_paid in
                (
                    AMS_MODL_COMP_MMXIII.BE_PAID_YES,
                    AMS_MODL_COMP_MMXIII.BE_PAID_DTL
                )
            and mnqr.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02
            /*and \*chi xu ly o nhom do*\
            mnqr.unit_ams_id = unit_rec.unit_ams_id*/
             /*chi cap nhat o nhung dai ly nhu the*/
             /*Co the can xu ly them ca la no phai can  nhom do nua co*/
            and mnqr.outlet_ams_id in
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_ams_id
                from ams.la_comp_mmxiii_mnqr data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and data.mnqr_be_paid in
                    (
                        /*chi lay danh sach cac dai ly duoc dua ra o phia tren*/
                        AMS_MODL_COMP_MMXIII.BE_PAID_EMPL
                    )
                    and data.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02
                group by
                    data.outlet_ams_id
            );
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_data', 'Cap nhat lai du lieu thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 3;

        /*Cap nhat lai doi voi cac truong hop cac dai ly thuoc danh sach cac dai ly da co o phia tren*/
        update ams.la_comp_mmxiii_mnqr mnqr
        set
            mnqr.mnqr_period_empl = 1,
            mnqr.mnqr_period_empl_calc = 1 --khi da co dieu kien phia tren thi can phai co dieu kien phia duoi nay nua thi moi dung duoc
        where mnqr.record_date = trunc(valRecordDate, 'MM')
            and mnqr.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and mnqr.mnqr_be_paid in
            (  /*chi xu ly rieng cho cac truong hop ma tuyen moi nhu the nay*/
                AMS_MODL_COMP_MMXIII.BE_PAID_EMPL
            )
            /*chi xu ly rieng doi voi nhom do dua vao nhom mnqr_branch_ams_id nay*/
            /*and mnqr.mnqr_branch_ams_id = unit_rec.mnqr_branch_ams_id*/
            --dieu kien phia duoi nay la da dung roi nen khong can phai them dieu kien nay nua
            and mnqr.effective_date--ngay lam viec la sau ngay 15 cua thang cuoi quy truoc
                between (add_months(trunc(valRecordDate, 'MM'), -3) + 15)
                and (add_months(trunc(valRecordDate, 'MM'), -0) + 15)
            and mnqr.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02
            /*neu ma ngay vao lam cua no bang chinh  thang du lieu cua no
            cong them voi 15 ngay nua neu nam trong thang nao thi se tinh cho thang du lieu day cho no
            Dieu kien nay la rat quan trong va da xu ly dung duoc cho no roi
            Xu ly nhu code ben duoi thi moi lam duoc cho no*/
            /*Khong su dung dieu kien nay nua vi neu khong thi se bi sai mat do cai nay la khong dung*/
            --and add_months(trunc(mnqr.effective_date - 15, 'MM'), 1) = mnqr.mnqr_data_date
            /*tuyen dung thuan trong ky*/
            and
            (
                mnqr.terminative_date is null
                or --cho nay cung da dam bao la nghi viec o sau quy do roi nen yen tam roi
                mnqr.terminative_date > (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
            )
            /*Chi lay danh sach cac dai ly thuoc danh sach cac dai ly da xac dinh o phia tren*/
            and mnqr.outlet_ams_id in
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_ams_id
                from ams.la_comp_mmxiii_mnqr data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and data.mnqr_be_paid in
                    (
                        /*chi lay danh sach cac dai ly duoc dua ra o phia tren*/
                        AMS_MODL_COMP_MMXIII.BE_PAID_EMPL
                    )
                    and data.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02
                group by
                    data.outlet_ams_id
            );
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_data', 'Cap nhat lai du lieu 2 thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 4;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_data', 'Thuc hien tinh toan lai doi voi mot so nhom cu thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 1;

        /*Cap nhat lai so lieu cho cac nhom de rut bo di truoc da*/
        for unit_rec in
          (
                select /*+ CARDINALITY(data, 100)*/
                    data.unit_ams_id
                from ams.la_comp_mmxiii_mnqr data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and data.mnqr_be_paid in
                    (
                        /*chi lay danh sach cac dai ly duoc dua ra o phia tren*/
                        AMS_MODL_COMP_MMXIII.BE_PAID_EMPL
                    )
                    and data.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02
                    and data.unit_ams_id is not null
                group by
                    data.unit_ams_id
          )
        loop
            /* Tinh cho cac cac chi  tieu khi ma duoc cong vao cho no*/
            /*Doi voi nhom den thi chi duoc cong vao cac statusla detail lai */

            merge /*+ CARDINALITY(comp, 100)*/
                into ams.la_compensation_mmxiii_tmp comp
            using
                (
                    select /*+ CARDINALITY(data, 100)*/
                        data.mnqr_branch_ams_id,
                        sum(nvl(data.mnqr_period_empl_calc, 0)) mnqr_period_empl
                    from ams.la_comp_mmxiii_mnqr data
                    where data.record_date = trunc(valRecordDate, 'MM')
                        and data.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                        and data.mnqr_be_paid in
                        (
                            AMS_MODL_COMP_MMXIII.BE_PAID_DTL
                        )
                        and data.outlet_ams_id <> data.mnqr_outlet_ams_id--khong tinh truong nhom hay truong ban
                        and data.mnqr_branch_ams_id is not null
                        and data.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02
                        /*chi lay o danh sach  nhom nhu the nay*/
                        and data.mnqr_branch_ams_id = unit_rec.unit_ams_id
                    group by data.mnqr_branch_ams_id
                ) upd
            on (
                trunc(valRecordDate, 'MM') = comp.record_date
                and
                AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.mnqr_be_executing
                and
                AMS_MODL_COMP_MMXIII.BE_PAID_YES = comp.mnqr_be_paid
                and
                upd.mnqr_branch_ams_id = comp.mnqr_branch_ams_id
            )
            when matched then
                update
                    set
                        comp.mnqr_period_empl = upd.mnqr_period_empl,
                        comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                        comp.update_datetime = sysdate;
            commit;
        end loop;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_data', 'Thuc hien tinh toan lai doi voi mot so nhom rut thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 5;

        /*Cap nhat lai so lieu cho cac nhom o nhom moi
        ma duoc nhan danh sach dai ly moi nay vao se tinh len cho no*/
        for unit_rec in
          (
                select /*+ CARDINALITY(data, 100)*/
                    data.mnqr_branch_ams_id
                from ams.la_comp_mmxiii_mnqr data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and data.mnqr_be_paid in
                    (
                        /*chi lay danh sach cac dai ly duoc dua ra o phia tren*/
                        AMS_MODL_COMP_MMXIII.BE_PAID_EMPL
                    )
                    and data.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02
                    and data.mnqr_branch_ams_id is not null
                group by
                    data.mnqr_branch_ams_id
          )
        loop
            merge /*+ CARDINALITY(comp, 100)*/
                into ams.la_compensation_mmxiii_tmp comp
            using
                (
                    select /*+ CARDINALITY(data, 100)*/
                        data.mnqr_branch_ams_id,
                        sum(nvl(data.mnqr_period_empl_calc, 0)) mnqr_period_empl
                    from ams.la_comp_mmxiii_mnqr data
                    where data.record_date = trunc(valRecordDate, 'MM')
                        and data.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                        and data.mnqr_be_paid in
                        (
                            AMS_MODL_COMP_MMXIII.BE_PAID_DTL,
                            --phai lay ca danh sach nay nua vao thi moi day du cho no duoc
                            AMS_MODL_COMP_MMXIII.BE_PAID_EMPL
                        )
                        and data.outlet_ams_id <> data.mnqr_outlet_ams_id--khong tinh truong nhom hay truong ban
                        and data.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02
                        and data.mnqr_branch_ams_id is not null
                        /*chi lay o danh sach cac dai ly nhu the nay*/
                        and data.mnqr_branch_ams_id = unit_rec.mnqr_branch_ams_id
                    group by data.mnqr_branch_ams_id
                ) upd
            on (
                trunc(valRecordDate, 'MM') = comp.record_date
                and
                AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.mnqr_be_executing
                and
                AMS_MODL_COMP_MMXIII.BE_PAID_YES = comp.mnqr_be_paid
                and
                upd.mnqr_branch_ams_id = comp.mnqr_branch_ams_id
            )
            when matched then
                update
                    set
                        comp.mnqr_period_empl = upd.mnqr_period_empl,
                        comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                        comp.update_datetime = sysdate;
            commit;
        end loop;

        /*Cap nhat xu ly cho truong ban lam tuong tu doi voi truong nhom da lam o phia tren roi*/

        /*Xy ly theo cac ban*/
        for agency_rec in
          (
              select /*+ CARDINALITY(mnqr, 100)*/
                  mnqr.agency_ams_id
              from ams.la_comp_mmxiii_mnqr mnqr
              where mnqr.record_date = trunc(valRecordDate, 'MM')
                  and mnqr.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                  and mnqr.mnqr_be_paid in
                  (   /*chi lay du lieu o bang chinh*/
                      AMS_MODL_COMP_MMXIII.BE_PAID_YES
                  )
                  and mnqr.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
                  and mnqr.agency_ams_id is not null
              group by mnqr.agency_ams_id
          )
        loop
            /*Lay so luong dat tieu chuan va kiem tra neu > 0 thi moi them vao*/
            select count(*)
                into var_qty
            from
            (
                select  /*+ CARDINALITY(res, 100)*/
                    res.outlet_ams_id
                from
                (
                    /*Danh sach cac dai ly moi do ban do tuyen vao*/
                    select /*+ CARDINALITY(key, 100) CARDINALITY(empl, 100)*/
                        outl.outlet_ams_id
                    from
                    (
                        select /*+ CARDINALITY(mnqr, 100)*/
                            mnqr.outlet_id
                        from ams.la_comp_mmxiii_mnqr mnqr
                        where mnqr.record_date = trunc(valRecordDate, 'MM')
                            and mnqr.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                            and mnqr.mnqr_be_paid in
                            (   /*chi lay du lieu o bang chinh*/
                                AMS_MODL_COMP_MMXIII.BE_PAID_YES
                            )
                            and mnqr.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
                            and mnqr.agency_ams_id = agency_rec.agency_ams_id
                        group by mnqr.outlet_id
                    ) key
                    join --lay ra danh sach cac dai ly duoc cac ca nhan tren tuyen vao
                    (
                        select /*+ CARDINALITY(tmp, 100)*/
                            tmp.outlet_id,
                            tmp.empl_id
                        from ams.la_prom_history_agent_tmp tmp
                        where tmp.record_date = trunc(valRecordDate, 'MM')
                    ) empl
                        on empl.empl_id = key.outlet_id
                     join /*lay danh sach cac dai ly moi vao lam trong 3 thang de it du lieu di*/
                     (
                        select /*+ CARDINALITY(mnqr, 100)*/
                            mnqr.outlet_id,
                            mnqr.outlet_ams_id
                        from ams.la_comp_mmxiii_mnqr mnqr
                        where mnqr.record_date = trunc(valRecordDate, 'MM')
                            and mnqr.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                            and mnqr.mnqr_be_paid in
                            (   /*chi lay du lieu o bang chinh*/
                                AMS_MODL_COMP_MMXIII.BE_PAID_YES
                            )
                            and mnqr.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
                            /*phai lam viec moi vao lam trong quy thi moi dung duoc*/
                            and mnqr.effective_date--ngay lam viec la sau ngay 15 cua thang cuoi quy truoc
                                between (add_months(trunc(valRecordDate, 'MM'), -3) + 15)
                                and (add_months(trunc(valRecordDate, 'MM'), -0) + 15)
                     ) outl
                        on outl.outlet_id = empl.outlet_id
                    /*tru di danh sach cac dai ly co trong ban do da co de khong bi thua*/
                    minus
                    select /*+ CARDINALITY(mnqr, 100)*/
                        mnqr.outlet_ams_id
                    from ams.la_comp_mmxiii_mnqr mnqr
                    where mnqr.record_date = trunc(valRecordDate, 'MM')
                        and mnqr.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                        and mnqr.mnqr_be_paid in
                        (   /*chi lay du lieu o bang chinh*/
                            AMS_MODL_COMP_MMXIII.BE_PAID_YES
                        )
                        and mnqr.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
                        and mnqr.agency_ams_id = agency_rec.agency_ams_id
                    group by mnqr.outlet_ams_id
               ) res
               group by res.outlet_ams_id
           ) repo;

            /*Neu so luong dai ly dat dieu kien tim kiem >0 thi moi insert vao*/
            if var_qty >0 then
                /*Duyet tung ban neu ma co ban khong co chua dai ly thi se phai insert vao neu thieu*/
                insert /*+ APPEND */ into ams.la_comp_mmxiii_mnqr nologging(
                    outlet_id,
                    outlet_ams_id,
                    record_date,
                    version_date,
                    company_id,
                    company_ams_id,
                    company_name,
                    agency_id,
                    agency_ams_id,
                    agency_name,
                    unit_id,
                    unit_ams_id,
                    unit_name,
                    outlet_name,
                    effective_date,
                    terminative_date,
                    mnqr_be_paid,
                    mnqr_be_executing,
                    mnqr_data_date,
                    mnqr_from_date,
                    mnqr_to_date,
                    mnqr_outlet_id,
                    mnqr_outlet_ams_id,
                    mnqr_branch_id,
                    mnqr_branch_ams_id,
                    mnqr_position_code,
                    mnqr_period_empl,
                    mnqr_period_empl_calc,
                    create_user,
                    update_user,
                    create_datetime,
                    update_datetime)
                select /*+ CARDINALITY(res, 100) CARDINALITY(key, 100)*/
                    key.outlet_id,
                    key.outlet_ams_id,
                    trunc(valRecordDate, 'MM'),
                    trunc(sysdate, 'DD'),
                    key.company_id,
                    key.company_ams_id,
                    key.company_name,
                    key.agency_id,
                    key.agency_ams_id,
                    key.agency_name,
                    key.unit_id,
                    key.unit_ams_id,
                    key.unit_name,
                    key.outlet_name,
                    key.effective_date,
                    key.terminative_date,
                    AMS_MODL_COMP_MMXIII.BE_PAID_EMPL,
                    AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
                    key.mnqr_data_date,
                    key.mnqr_from_date,
                    key.mnqr_to_date,
                    key.mnqr_outlet_id,
                    key.mnqr_outlet_ams_id,
                    null,--key.mnqr_branch_id,
                    agency_rec.agency_ams_id,--lay theo ma nay vao
                    key.mnqr_position_code,
                    0,
                    0,
                    AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    sysdate,
                    sysdate
                from
                (
                    select  /*+ CARDINALITY(res, 100)*/
                        res.outlet_ams_id
                    from
                    (
                        /*Danh sach cac dai ly moi do ban do tuyen vao*/
                        select /*+ CARDINALITY(key, 100) CARDINALITY(empl, 100)*/
                            outl.outlet_ams_id
                        from
                        (
                            select /*+ CARDINALITY(mnqr, 100)*/
                                mnqr.outlet_id
                            from ams.la_comp_mmxiii_mnqr mnqr
                            where mnqr.record_date = trunc(valRecordDate, 'MM')
                                and mnqr.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                                and mnqr.mnqr_be_paid in
                                (   /*chi lay du lieu o bang chinh*/
                                    AMS_MODL_COMP_MMXIII.BE_PAID_YES
                                )
                                and mnqr.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
                                and mnqr.agency_ams_id = agency_rec.agency_ams_id
                            group by mnqr.outlet_id
                        ) key
                        join --lay ra danh sach cac dai ly duoc cac ca nhan tren tuyen vao
                        (
                            select /*+ CARDINALITY(tmp, 100)*/
                                tmp.outlet_id,
                                tmp.empl_id
                            from ams.la_prom_history_agent_tmp tmp
                            where tmp.record_date = trunc(valRecordDate, 'MM')
                        ) empl
                            on empl.empl_id = key.outlet_id
                         join /*lay danh sach cac dai ly moi vao lam trong 3 thang de it du lieu di*/
                         (
                            select /*+ CARDINALITY(mnqr, 100)*/
                                mnqr.outlet_id,
                                mnqr.outlet_ams_id
                            from ams.la_comp_mmxiii_mnqr mnqr
                            where mnqr.record_date = trunc(valRecordDate, 'MM')
                                and mnqr.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                                and mnqr.mnqr_be_paid in
                                (   /*chi lay du lieu o bang chinh*/
                                    AMS_MODL_COMP_MMXIII.BE_PAID_YES
                                )
                                and mnqr.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
                                /*phai lam viec moi vao lam trong quy thi moi dung duoc*/
                                and mnqr.effective_date--ngay lam viec la sau ngay 15 cua thang cuoi quy truoc
                                    between (add_months(trunc(valRecordDate, 'MM'), -3) + 15)
                                    and (add_months(trunc(valRecordDate, 'MM'), -0) + 15)
                         ) outl
                            on outl.outlet_id = empl.outlet_id
                        /*tru di danh sach cac dai ly co trong ban do da co de khong bi thua*/
                        minus
                        select /*+ CARDINALITY(mnqr, 100)*/
                            mnqr.outlet_ams_id
                        from ams.la_comp_mmxiii_mnqr mnqr
                        where mnqr.record_date = trunc(valRecordDate, 'MM')
                            and mnqr.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                            and mnqr.mnqr_be_paid in
                            (   /*chi lay du lieu o bang chinh*/
                                AMS_MODL_COMP_MMXIII.BE_PAID_YES
                            )
                            and mnqr.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
                            and mnqr.agency_ams_id = agency_rec.agency_ams_id
                        group by mnqr.outlet_ams_id
                   ) res
                   group by res.outlet_ams_id
               ) repo
               join
               (
                  select /*+ CARDINALITY(mnqr, 100)*/
                      mnqr.outlet_id,
                      mnqr.outlet_ams_id,
                      mnqr.company_id,
                      mnqr.company_ams_id,
                      mnqr.company_name,
                      mnqr.agency_id,
                      mnqr.agency_ams_id,
                      mnqr.agency_name,
                      mnqr.unit_id,
                      mnqr.unit_ams_id,
                      mnqr.unit_name,
                      mnqr.outlet_name,
                      mnqr.effective_date,
                      mnqr.terminative_date,
                      mnqr.mnqr_data_date,
                      mnqr.mnqr_from_date,
                      mnqr.mnqr_to_date,
                      mnqr.mnqr_outlet_id,
                      mnqr.mnqr_outlet_ams_id,
                      mnqr.mnqr_branch_id,
                      mnqr.mnqr_branch_ams_id,
                      mnqr.mnqr_position_code
                  from ams.la_comp_mmxiii_mnqr mnqr
                  where mnqr.record_date = trunc(valRecordDate, 'MM')
                      and mnqr.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                      and mnqr.mnqr_be_paid in
                      (   /*chi lay du lieu o bang chinh*/
                          AMS_MODL_COMP_MMXIII.BE_PAID_YES
                      )
                      and mnqr.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
                      /*phai lam viec moi vao lam trong quy thi moi dung duoc*/
                      and mnqr.effective_date--ngay lam viec la sau ngay 15 cua thang cuoi quy truoc
                          between (add_months(trunc(valRecordDate, 'MM'), -3) + 15)
                          and (add_months(trunc(valRecordDate, 'MM'), -0) + 15)
               ) key
                  on key.outlet_ams_id = repo.outlet_ams_id;
                commit;
            end if;
        end loop;


        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_data', 'Xu ly theo cac ban thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 2;

        /*cap nhat lai du lieu cua cac dai ly nay cua ban day cho la = 0
        Doi voi cac du lieu da co truoc do roi
        O truong Be paid = Yes thi moi dung duoc
        */
        update ams.la_comp_mmxiii_mnqr mnqr
        set mnqr.mnqr_period_empl = 0,
            mnqr.mnqr_period_empl_calc = 0
        where mnqr.record_date = trunc(valRecordDate, 'MM')
            and mnqr.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and mnqr.mnqr_be_paid in
                (
                    AMS_MODL_COMP_MMXIII.BE_PAID_YES,
                    AMS_MODL_COMP_MMXIII.BE_PAID_DTL
                )
            and mnqr.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
            /*and /*chi xu ly o ban do*/
            --mnqr.unit_ams_id = agency_rec.agency_ams_id*/
             /*chi cap nhat o nhung dai ly nhu the*/
             /*Co the can xu ly them ca la no phai can  ban do nua co*/
            and mnqr.outlet_ams_id in
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_ams_id
                from ams.la_comp_mmxiii_mnqr data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and data.mnqr_be_paid in
                    (
                        /*chi lay danh sach cac dai ly duoc dua ra o phia tren*/
                        AMS_MODL_COMP_MMXIII.BE_PAID_EMPL
                    )
                    and data.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
                group by
                    data.outlet_ams_id
            );
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_data', 'Cap nhat lai du lieu thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 3;

        /*Cap nhat lai doi voi cac truong hop cac dai ly thuoc danh sach cac dai ly da co o phia tren*/
        update ams.la_comp_mmxiii_mnqr mnqr
        set
            mnqr.mnqr_period_empl = 1,
            mnqr.mnqr_period_empl_calc = 1 --khi da co dieu kien phia tren thi can phai co dieu kien phia duoi nay nua thi moi dung duoc
        where mnqr.record_date = trunc(valRecordDate, 'MM')
            and mnqr.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and mnqr.mnqr_be_paid in
            (  /*chi xu ly rieng cho cac truong hop ma tuyen moi nhu the nay*/
                AMS_MODL_COMP_MMXIII.BE_PAID_EMPL
            )
            /*chi xu ly rieng doi voi ban do dua vao ban mnqr_branch_ams_id nay*/
            /*and mnqr.mnqr_branch_ams_id = agency_rec.mnqr_branch_ams_id*/
            --dieu kien phia duoi nay la da dung roi nen khong can phai them dieu kien nay nua
            and mnqr.effective_date--ngay lam viec la sau ngay 15 cua thang cuoi quy truoc
                between (add_months(trunc(valRecordDate, 'MM'), -3) + 15)
                and (add_months(trunc(valRecordDate, 'MM'), -0) + 15)
            and mnqr.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
            /*neu ma ngay vao lam cua no bang chinh  thang du lieu cua no
            cong them voi 15 ngay nua neu nam trong thang nao thi se tinh cho thang du lieu day cho no
            Dieu kien nay la rat quan trong va da xu ly dung duoc cho no roi
            Xu ly nhu code ben duoi thi moi lam duoc cho no*/
            /*Khong su dung dieu kien nay nua vi neu khong thi se bi sai mat do cai nay la khong dung*/
            --and add_months(trunc(mnqr.effective_date - 15, 'MM'), 1) = mnqr.mnqr_data_date
            /*tuyen dung thuan trong ky*/
            and
            (
                mnqr.terminative_date is null
                or --cho nay cung da dam bao la nghi viec o sau quy do roi nen yen tam roi
                mnqr.terminative_date > (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
            )
            /*Chi lay danh sach cac dai ly thuoc danh sach cac dai ly da xac dinh o phia tren*/
            and mnqr.outlet_ams_id in
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_ams_id
                from ams.la_comp_mmxiii_mnqr data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and data.mnqr_be_paid in
                    (
                        /*chi lay danh sach cac dai ly duoc dua ra o phia tren*/
                        AMS_MODL_COMP_MMXIII.BE_PAID_EMPL
                    )
                    and data.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
                group by
                    data.outlet_ams_id
            );
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_data', 'Thuc hien tinh toan lai doi voi mot so ban cu thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 1;

        /*Cap nhat lai so lieu cho cac ban de rut bo di truoc da*/
        for agency_rec in
          (
                select /*+ CARDINALITY(data, 100)*/
                    data.agency_ams_id
                from ams.la_comp_mmxiii_mnqr data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and data.mnqr_be_paid in
                    (
                        /*chi lay danh sach cac dai ly duoc dua ra o phia tren*/
                        AMS_MODL_COMP_MMXIII.BE_PAID_EMPL
                    )
                    and data.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
                    and data.agency_ams_id is not null
                group by
                    data.agency_ams_id
          )
        loop
            /* Tinh cho cac cac chi  tieu khi ma duoc cong vao cho no*/
            /*Doi voi ban den thi chi duoc cong vao cac statusla detail lai */

            merge /*+ CARDINALITY(comp, 100)*/
                into ams.la_compensation_mmxiii_tmp comp
            using
                (
                    select /*+ CARDINALITY(data, 100)*/
                        data.mnqr_branch_ams_id,
                        sum(nvl(data.mnqr_period_empl_calc, 0)) mnqr_period_empl
                    from ams.la_comp_mmxiii_mnqr data
                    where data.record_date = trunc(valRecordDate, 'MM')
                        and data.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                        and data.mnqr_be_paid in
                        (
                            AMS_MODL_COMP_MMXIII.BE_PAID_DTL
                        )
                        and data.outlet_ams_id <> data.mnqr_outlet_ams_id--khong tinh truong ban hay truong ban
                        and data.mnqr_branch_ams_id is not null
                        and data.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
                        /*chi lay o danh sach  ban nhu the nay*/
                        and data.mnqr_branch_ams_id = agency_rec.agency_ams_id
                    group by data.mnqr_branch_ams_id
                ) upd
            on (
                trunc(valRecordDate, 'MM') = comp.record_date
                and
                AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.mnqr_be_executing
                and
                AMS_MODL_COMP_MMXIII.BE_PAID_YES = comp.mnqr_be_paid
                and
                upd.mnqr_branch_ams_id = comp.mnqr_branch_ams_id
            )
            when matched then
                update
                    set
                        comp.mnqr_period_empl = upd.mnqr_period_empl,
                        comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                        comp.update_datetime = sysdate;
            commit;
        end loop;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_data', 'Thuc hien tinh toan lai doi voi mot so ban rut thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 5;

        /*Cap nhat lai so lieu cho cac ban o ban moi
        ma duoc nhan danh sach dai ly moi nay vao se tinh len cho no*/
        for agency_rec in
          (
                select /*+ CARDINALITY(data, 100)*/
                    data.mnqr_branch_ams_id
                from ams.la_comp_mmxiii_mnqr data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and data.mnqr_be_paid in
                    (
                        /*chi lay danh sach cac dai ly duoc dua ra o phia tren*/
                        AMS_MODL_COMP_MMXIII.BE_PAID_EMPL
                    )
                    and data.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
                    and data.mnqr_branch_ams_id is not null
                group by
                    data.mnqr_branch_ams_id
          )
        loop
            merge /*+ CARDINALITY(comp, 100)*/
                into ams.la_compensation_mmxiii_tmp comp
            using
                (
                    select /*+ CARDINALITY(data, 100)*/
                        data.mnqr_branch_ams_id,
                        sum(nvl(data.mnqr_period_empl_calc, 0)) mnqr_period_empl
                    from ams.la_comp_mmxiii_mnqr data
                    where data.record_date = trunc(valRecordDate, 'MM')
                        and data.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                        and data.mnqr_be_paid in
                        (
                            AMS_MODL_COMP_MMXIII.BE_PAID_DTL,
                            --phai lay ca danh sach nay nua vao thi moi day du cho no duoc
                            AMS_MODL_COMP_MMXIII.BE_PAID_EMPL
                        )
                        and data.outlet_ams_id <> data.mnqr_outlet_ams_id--khong tinh truong ban
                        and data.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
                        and data.mnqr_branch_ams_id is not null
                        /*chi lay o danh sach cac dai ly nhu the nay*/
                        and data.mnqr_branch_ams_id = agency_rec.mnqr_branch_ams_id
                    group by data.mnqr_branch_ams_id
                ) upd
            on (
                trunc(valRecordDate, 'MM') = comp.record_date
                and
                AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.mnqr_be_executing
                and
                AMS_MODL_COMP_MMXIII.BE_PAID_YES = comp.mnqr_be_paid
                and
                upd.mnqr_branch_ams_id = comp.mnqr_branch_ams_id
            )
            when matched then
                update
                    set
                        comp.mnqr_period_empl = upd.mnqr_period_empl,
                        comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                        comp.update_datetime = sysdate;
            commit;
        end loop;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_data', 'Xy ly xong theo ban thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_mnqr_data: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_mnqr_cond(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Tinh ty le huong tren FYC cho truong nhom da kiem tra*/
        merge /*+ CARDINALITY(comp, 100)*/
            into ams.la_compensation_mmxiii_tmp comp
        using
        (
                /*Tinh ty le huong tren FYC cho truong nhom trong khoang 250000000 - 1000000000000*/
                select
                    250000000 fyp_from,
                    100000000000 fyp_to,
                    5 qual_from,
                    1000 qual_to,
                    3 empl_from,
                    1000 empl_to,
                    92 coll_rate_from,
                    1000 coll_rate_to,
                    14 comp_ratio
                from dual
                union
                select
                    250000000 fyp_from,
                    100000000000 fyp_to,
                    5 qual_from,
                    1000 qual_to,
                    3 empl_from,
                    1000 empl_to,
                    88 coll_rate_from,
                    92 coll_rate_to,
                    13 comp_ratio
                from dual
                union
                select
                    250000000 fyp_from,
                    100000000000 fyp_to,
                    5 qual_from,
                    1000 qual_to,
                    2 empl_from,
                    3 empl_to,
                    92 coll_rate_from,
                    1000 coll_rate_to,
                    12 comp_ratio
                from dual
                union
                select
                    250000000 fyp_from,
                    100000000000 fyp_to,
                    5 qual_from,
                    1000 qual_to,
                    2 empl_from,
                    3 empl_to,
                    88 coll_rate_from,
                    92 coll_rate_to,
                    11 comp_ratio
                from dual
                union
                select
                    250000000 fyp_from,
                    100000000000 fyp_to,
                    3 qual_from,
                    5 qual_to,
                    3 empl_from,
                    1000 empl_to,
                    92 coll_rate_from,
                    1000 coll_rate_to,
                    10 comp_ratio
                from dual
                union
                select
                    250000000 fyp_from,
                    100000000000 fyp_to,
                    3 qual_from,
                    5 qual_to,
                    3 empl_from,
                    1000 empl_to,
                    88 coll_rate_from,
                    92 coll_rate_to,
                    9 comp_ratio
                from dual
                union
                select
                    250000000 fyp_from,
                    100000000000 fyp_to,
                    3 qual_from,
                    5 qual_to,
                    2 empl_from,
                    3 empl_to,
                    92 coll_rate_from,
                    1000 coll_rate_to,
                    8 comp_ratio
                from dual
                union
                select
                    250000000 fyp_from,
                    100000000000 fyp_to,
                    3 qual_from,
                    5 qual_to,
                    2 empl_from,
                    3 empl_to,
                    88 coll_rate_from,
                    92 coll_rate_to,
                    7 comp_ratio
                from dual
                union
                select
                    250000000 fyp_from,
                    100000000000 fyp_to,
                    2 qual_from,
                    3 qual_to,
                    3 empl_from,
                    1000 empl_to,
                    92 coll_rate_from,
                    1000 coll_rate_to,
                    7 comp_ratio
                from dual
                union
                select
                    250000000 fyp_from,
                    100000000000 fyp_to,
                    2 qual_from,
                    3 qual_to,
                    3 empl_from,
                    1000 empl_to,
                    88 coll_rate_from,
                    92 coll_rate_to,
                    6 comp_ratio
                from dual
                union
                select
                    250000000 fyp_from,
                    100000000000 fyp_to,
                    2 qual_from,
                    3 qual_to,
                    2 empl_from,
                    3 empl_to,
                    92 coll_rate_from,
                    1000 coll_rate_to,
                    5 comp_ratio
                from dual
                union
                select
                    250000000 fyp_from,
                    100000000000 fyp_to,
                    2 qual_from,
                    3 qual_to,
                    2 empl_from,
                    3 empl_to,
                    88 coll_rate_from,
                    92 coll_rate_to,
                    4 comp_ratio
                from dual

                /*Tinh ty le huong tren FYC cho truong nhom trong khoang 150000000 - 250000000*/
                union
                select
                    150000000 fyp_from,
                    250000000 fyp_to,
                    5 qual_from,
                    1000 qual_to,
                    3 empl_from,
                    1000 empl_to,
                    92 coll_rate_from,
                    1000 coll_rate_to,
                    10 comp_ratio
                from dual
                union
                select
                    150000000 fyp_from,
                    250000000 fyp_to,
                    5 qual_from,
                    1000 qual_to,
                    3 empl_from,
                    1000 empl_to,
                    88 coll_rate_from,
                    92 coll_rate_to,
                    9 comp_ratio
                from dual
                union
                select
                    150000000 fyp_from,
                    250000000 fyp_to,
                    5 qual_from,
                    1000 qual_to,
                    2 empl_from,
                    3 empl_to,
                    92 coll_rate_from,
                    1000 coll_rate_to,
                    8 comp_ratio
                from dual
                union
                select
                    150000000 fyp_from,
                    250000000 fyp_to,
                    5 qual_from,
                    1000 qual_to,
                    2 empl_from,
                    3 empl_to,
                    88 coll_rate_from,
                    92 coll_rate_to,
                    7 comp_ratio
                from dual
                union
                select
                    150000000 fyp_from,
                    250000000 fyp_to,
                    3 qual_from,
                    5 qual_to,
                    3 empl_from,
                    1000 empl_to,
                    92 coll_rate_from,
                    1000 coll_rate_to,
                    7 comp_ratio
                from dual
                union
                select
                    150000000 fyp_from,
                    250000000 fyp_to,
                    3 qual_from,
                    5 qual_to,
                    3 empl_from,
                    1000 empl_to,
                    88 coll_rate_from,
                    92 coll_rate_to,
                    6 comp_ratio
                from dual
                union
                select
                    150000000 fyp_from,
                    250000000 fyp_to,
                    3 qual_from,
                    5 qual_to,
                    2 empl_from,
                    3 empl_to,
                    92 coll_rate_from,
                    1000 coll_rate_to,
                    5 comp_ratio
                from dual
                union
                select
                    150000000 fyp_from,
                    250000000 fyp_to,
                    3 qual_from,
                    5 qual_to,
                    2 empl_from,
                    3 empl_to,
                    88 coll_rate_from,
                    92 coll_rate_to,
                    4 comp_ratio
                from dual
                union
                select
                    150000000 fyp_from,
                    250000000 fyp_to,
                    2 qual_from,
                    3 qual_to,
                    3 empl_from,
                    1000 empl_to,
                    92 coll_rate_from,
                    1000 coll_rate_to,
                    5 comp_ratio
                from dual
                union
                select
                    150000000 fyp_from,
                    250000000 fyp_to,
                    2 qual_from,
                    3 qual_to,
                    3 empl_from,
                    1000 empl_to,
                    88 coll_rate_from,
                    92 coll_rate_to,
                    4 comp_ratio
                from dual
                union
                select
                    150000000 fyp_from,
                    250000000 fyp_to,
                    2 qual_from,
                    3 qual_to,
                    2 empl_from,
                    3 empl_to,
                    92 coll_rate_from,
                    1000 coll_rate_to,
                    3 comp_ratio
                from dual
                union
                select
                    150000000 fyp_from,
                    250000000 fyp_to,
                    2 qual_from,
                    3 qual_to,
                    2 empl_from,
                    3 empl_to,
                    88 coll_rate_from,
                    92 coll_rate_to,
                    2 comp_ratio
                from dual
                /*Tinh ty le huong tren FYC cho truong nhom trong khoang 100000000 - 150000000*/
                union
                select
                    100000000 fyp_from,
                    150000000 fyp_to,
                    5 qual_from,
                    1000 qual_to,
                    3 empl_from,
                    1000 empl_to,
                    92 coll_rate_from,
                    1000 coll_rate_to,
                    7 comp_ratio
                from dual
                union
                select
                    100000000 fyp_from,
                    150000000 fyp_to,
                    5 qual_from,
                    1000 qual_to,
                    3 empl_from,
                    1000 empl_to,
                    88 coll_rate_from,
                    92 coll_rate_to,
                    6 comp_ratio
                from dual
                union
                select
                    100000000 fyp_from,
                    150000000 fyp_to,
                    5 qual_from,
                    1000 qual_to,
                    2 empl_from,
                    3 empl_to,
                    92 coll_rate_from,
                    1000 coll_rate_to,
                    5 comp_ratio
                from dual
                union
                select
                    100000000 fyp_from,
                    150000000 fyp_to,
                    5 qual_from,
                    1000 qual_to,
                    2 empl_from,
                    3 empl_to,
                    88 coll_rate_from,
                    92 coll_rate_to,
                    4 comp_ratio
                from dual
                union
                select
                    100000000 fyp_from,
                    150000000 fyp_to,
                    3 qual_from,
                    5 qual_to,
                    3 empl_from,
                    1000 empl_to,
                    92 coll_rate_from,
                    1000 coll_rate_to,
                    5 comp_ratio
                from dual
                union
                select
                    100000000 fyp_from,
                    150000000 fyp_to,
                    3 qual_from,
                    5 qual_to,
                    3 empl_from,
                    1000 empl_to,
                    88 coll_rate_from,
                    92 coll_rate_to,
                    4 comp_ratio
                from dual
                union
                select
                    100000000 fyp_from,
                    150000000 fyp_to,
                    3 qual_from,
                    5 qual_to,
                    2 empl_from,
                    3 empl_to,
                    92 coll_rate_from,
                    1000 coll_rate_to,
                    3 comp_ratio
                from dual
                union
                select
                    100000000 fyp_from,
                    150000000 fyp_to,
                    3 qual_from,
                    5 qual_to,
                    2 empl_from,
                    3 empl_to,
                    88 coll_rate_from,
                    92 coll_rate_to,
                    2 comp_ratio
                from dual
                union
                select
                    100000000 fyp_from,
                    150000000 fyp_to,
                    2 qual_from,
                    3 qual_to,
                    3 empl_from,
                    1000 empl_to,
                    92 coll_rate_from,
                    1000 coll_rate_to,
                    4 comp_ratio
                from dual
                union
                select
                    100000000 fyp_from,
                    150000000 fyp_to,
                    2 qual_from,
                    3 qual_to,
                    3 empl_from,
                    1000 empl_to,
                    88 coll_rate_from,
                    92 coll_rate_to,
                    3 comp_ratio
                from dual
                union
                select
                    100000000 fyp_from,
                    150000000 fyp_to,
                    2 qual_from,
                    3 qual_to,
                    2 empl_from,
                    3 empl_to,
                    92 coll_rate_from,
                    1000 coll_rate_to,
                    2 comp_ratio
                from dual
                union
                select
                    100000000 fyp_from,
                    150000000 fyp_to,
                    2 qual_from,
                    3 qual_to,
                    2 empl_from,
                    3 empl_to,
                    88 coll_rate_from,
                    92 coll_rate_to,
                    1 comp_ratio
                from dual
        ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.mnqr_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = comp.mnqr_be_paid
            and
            AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02 = comp.mnqr_position_code
            and
            nvl(comp.mnqr_period_fyp, 0) >= upd.fyp_from
            and
            nvl(comp.mnqr_period_fyp, 0) < upd.fyp_to
            and
            nvl(comp.mnqr_period_empl, 0) >= upd.empl_from
            and
            nvl(comp.mnqr_period_empl, 0) < upd.empl_to
            and
            nvl(comp.mnqr_period_qual, 0) >= upd.qual_from
            and
            nvl(comp.mnqr_period_qual, 0) < upd.qual_to
            and
            nvl(comp.mnqr_period_coll_rate, 0) >= upd.coll_rate_from
            and
            nvl(comp.mnqr_period_coll_rate, 0) < upd.coll_rate_to
        )
        when matched then
            update
                set
                    comp.mnqr_comp_ratio = upd.comp_ratio,
                    comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    comp.update_datetime = sysdate;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_cond', '  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 1;

        /* PR36*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.mnqr_comp_ratio = 0,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.mnqr_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and comp.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02
            and nvl(comp.mnqr_period_pr36, 0) < 85;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_cond', '  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 1;

        -------------------------------------------------------------
        /* Tinh ty le thuong cho Truong ban da kiem tra*/
        -------------------------------------------------------------
        merge /*+ CARDINALITY(comp, 100)*/
            into ams.la_compensation_mmxiii_tmp comp
        using
        (
            /* Tinh ty le thuong cho Truong ban theo quy che 2013 trong khoang 2.000.000.000 - 1.000.000.000.000*/
            select
                    2000000000 fyp_from,
                    1000000000000 fyp_to,
                    92 coll_rate_from,
                    1000 coll_rate_to,
                    10 comp_ratio
                from dual
                union
                select
                    2000000000 fyp_from,
                    1000000000000 fyp_to,
                    90 coll_rate_from,
                    92 coll_rate_to,
                    9 comp_ratio
                from dual
                union
                select
                    2000000000 fyp_from,
                    1000000000000 fyp_to,
                    88 coll_rate_from,
                    90 coll_rate_to,
                    8 comp_ratio
                from dual
             /* Tinh ty le thuong cho Truong ban theo quy che 2013 trong khoang 1.500.000.000 - 2.000.000.000*/
                union
                select
                    1500000000 fyp_from,
                    2000000000 fyp_to,
                    92 coll_rate_from,
                    1000 coll_rate_to,
                    8 comp_ratio
                from dual
                union
                select
                    1500000000 fyp_from,
                    2000000000 fyp_to,
                    90 coll_rate_from,
                    92 coll_rate_to,
                    7 comp_ratio
                from dual
                union
                select
                    1500000000 fyp_from,
                    2000000000 fyp_to,
                    88 coll_rate_from,
                    90 coll_rate_to,
                    6 comp_ratio
                from dual
              /* Tinh ty le thuong cho Truong ban theo quy che 2013 trong khoang 1.000.000.000 - 1.500.000.000*/
                union
                select
                    1000000000 fyp_from,
                    1500000000 fyp_to,
                    92 coll_rate_from,
                    1000 coll_rate_to,
                    6 comp_ratio
                from dual
                union
                select
                    1000000000 fyp_from,
                    1500000000 fyp_to,
                    90 coll_rate_from,
                    92 coll_rate_to,
                    5 comp_ratio
                from dual
                union
                select
                    1000000000 fyp_from,
                    1500000000 fyp_to,
                    88 coll_rate_from,
                    90 coll_rate_to,
                    4 comp_ratio
                from dual
              /* Tinh ty le thuong cho Truong ban theo quy che 2013 trong khoang 600.000.000 - 1.000.000.000*/
                union
                select
                    600000000 fyp_from,
                    1000000000 fyp_to,
                    92 coll_rate_from,
                    1000 coll_rate_to,
                    4 comp_ratio
                from dual
                union
                select
                    600000000 fyp_from,
                    1000000000 fyp_to,
                    90 coll_rate_from,
                    92 coll_rate_to,
                    3 comp_ratio
                from dual
                union
                select
                    600000000 fyp_from,
                    1000000000 fyp_to,
                    88 coll_rate_from,
                    90 coll_rate_to,
                    2 comp_ratio
                from dual
        ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.mnqr_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = comp.mnqr_be_paid
            and
            AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04 = comp.mnqr_position_code
            and
            nvl(comp.mnqr_period_fyp, 0) >= upd.fyp_from
            and
            nvl(comp.mnqr_period_fyp, 0) < upd.fyp_to
            and
            nvl(comp.mnqr_period_coll_rate, 0) >= upd.coll_rate_from
            and
            nvl(comp.mnqr_period_coll_rate, 0) < upd.coll_rate_to
        )
        when matched then
            update
                set
                    comp.mnqr_comp_ratio = upd.comp_ratio,
                    comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    comp.update_datetime = sysdate;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_cond', '  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 1;

        /* PR36*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.mnqr_comp_ratio = 0,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.mnqr_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and comp.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
            and nvl(comp.mnqr_period_pr36, 0) < 80;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_cond', '  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 1;

        /* EMPL*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.mnqr_comp_ratio = 0,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.mnqr_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and comp.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
            and nvl(comp.mnqr_period_empl, 0) < 8;
        commit;

        merge /*+ CARDINALITY(comp, 100)*/
            into ams.la_compensation_mmxiii_tmp comp
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.from_point,
                    nvl(tmp.to_point, 999) to_point,
                    tmp.coefficient mnqr_activity_coefficient
                from ams.la_grading_coefficient tmp
                where tmp.grading_group_id = '2011TN'
            ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.mnqr_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = comp.mnqr_be_paid
            and
            comp.mnqr_period_point >= upd.from_point
            and
            comp.mnqr_period_point < upd.to_point
            )
        when matched then
            update
                set
                    comp.mnqr_activity_coefficient = upd.mnqr_activity_coefficient;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_cond', '  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_mnqr_cond: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_mnqr_comp(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Tinh thu lao*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.mnqr_comp_money_calc = nvl(comp.mnqr_period_fyc_calc, 0) * nvl(comp.mnqr_comp_ratio, 0) / 100,
            comp.mnqr_comp_money = nvl(comp.mnqr_period_fyc_calc, 0) * nvl(comp.mnqr_comp_ratio, 0) * nvl(comp.mnqr_activity_coefficient, 1) / 100,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.mnqr_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and comp.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_comp', ' Truong nhom  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 1;

        /*CV04 */
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.mnqr_comp_money_calc = nvl(comp.mnqr_period_fyc_calc, 0) * nvl(comp.mnqr_comp_ratio, 0)/ 100,
            comp.mnqr_comp_money = nvl(comp.mnqr_period_fyc_calc, 0) * nvl(comp.mnqr_comp_ratio, 0) * nvl(comp.mnqr_activity_coefficient, 1) / 100,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.mnqr_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and comp.mnqr_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_comp', ' Truong ban thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));

    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_mnqr_comp: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_mnqr_close(valRecordDate date := null)
    is
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Ket thuc qua trinh tinh thu lao quy dai ly
           trong bang la_comp_mmxiii_mnqr*/
        update ams.la_comp_mmxiii_mnqr mnqr
        set
            mnqr.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO,
            mnqr.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            mnqr.update_datetime = sysdate
        where mnqr.record_date = trunc(valRecordDate, 'MM')
            and mnqr.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES;
        commit;

        /* Ket thuc qua trinh tinh thu lao quy dai ly
           trong bang la_compensation_mmxiii_tmp*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.mnqr_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnqr_close', '  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));

    end;

    /*Thuong quan ly hoat dong hieu qua*/
    procedure mmxiii_modl_mnea(valRecordDate date := null)
    is
    begin null;
        if (
            AMS_CORE_MODULE.is_active(
                AMS_MODL_COMP_MMXIII.MMXIII_COMP_MNEA,
                trunc(valRecordDate, 'MM')
            ) = AMS_CORE_MODULE.IS_YES
        ) then
            for var_result in (
                select comp_date.compensation_date
                from ams.mod_comp_date comp_date
                where comp_date.module_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_COMP
                    and comp_date.sub_code = AMS_MODL_COMP_MMXIII.MMXIII_COMP_MNEA
                    and comp_date.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                    and comp_date.compensation_date = trunc(valRecordDate, 'MM')
                group by comp_date.compensation_date
            ) loop
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnea_prepare(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnea_open(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnea_data(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnea_cond(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnea_comp(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnea_close(valRecordDate);
            end loop;
        end if;
    end;

    /*Do toan bo so lieu ve cac dai ly duoc tuyen moi vao day cung IP va so HD KTM da tnh cho no
    de kiem tra xem no co phai la dai ly moi khong*/
    procedure mmxiii_modl_mnea_prepare(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
        var_begin_date date := AMS_MODL_COMP_MMXIII.COMP_DATE_AGIN_TRANS_BEGN;
        var_end_date date := AMS_MODL_COMP_MMXIII.COMP_DATE_AGIN_TRANS_END;
        var_month_qty number(2) := 0;
        var_position_qty number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /*Truncate bang bang inp_data_outlet_tmp de do du lieu tu bang inp_data_outlet vao cho bang do*/
        execute immediate 'truncate table ams.la_comp_mmxiii_agin_trans';
        commit;

        dbms_stats.gather_table_stats(null, 'la_comp_mmxiii_agin_trans', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_prepare', 'truncate la_comp_mmxiii_agin_trans');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 1;
        --cho nay can phai sua lai o day roi day nhe
        insert /*+ APPEND */ into ams.la_comp_mmxiii_agin_trans nologging
        select  /*+
                   CARDINALITY(key, 100)
                   CARDINALITY(indx, 100)
                   */
            key.outlet_id,
            key.outlet_ams_id,
            trunc(valRecordDate, 'YYYY'),
            trunc(sysdate, 'DD'),
            indx.source_of_data,
            key.outlet_name,
            key.company_id,
            key.company_ams_id,
            key.company_name,
            key.office_id,
            key.office_ams_id,
            key.office_name,
            key.agency_id,
            key.agency_ams_id,
            key.agency_name,
            key.unit_id,
            key.unit_ams_id,
            key.unit_name,
            key.effective_date,
            key.terminative_date,
            key.position_code,
            key.position_date,
            indx.policy_number,
            indx.transaction_code,
            indx.transaction_date,
            indx.transaction_premium,
            indx.transaction_ip,
            indx.source_of_data,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            select /*+ CARDINALITY(data, 100)*/
                data.outlet_id,
                data.outlet_ams_id,
                data.outlet_name,
                data.position_code,
                data.position_date,
                data.effective_date,
                data.terminative_date,
                data.company_id,
                data.company_ams_id,
                data.company_name,
                data.office_id,
                data.office_ams_id,
                data.office_name,
                data.agency_id,
                data.agency_ams_id,
                data.agency_name,
                data.unit_id,
                data.unit_ams_id,
                data.unit_name
            from ams.inp_data_outlet_tmp data
            where data.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                and data.record_date = trunc(valRecordDate, 'MM')
                and data.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                and data.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
        ) key
        join
        (
            select
                /*+
                CARDINALITY(trans, 100)
                CARDINALITY(pol, 100)
                */
                trans.outlet_ams_id,
                trans.policy_number,
                trans.transaction_date,
                trans.source_of_data,
                'INIT' transaction_code,
                sum(nvl(trans.ip, 0)) transaction_premium,
                sum(nvl(trans.ip, 0)) transaction_ip
            from
            (
                select  /*+ CARDINALITY(oult, 100) CARDINALITY(iss, 100)*/
                    iss.policy_number
                from
                (
                    select /*+ CARDINALITY(data, 100)*/
                        data.outlet_ams_id,
                        data.effective_date from_date,
                        data.effective_date + 89 to_date
                    from ams.inp_data_outlet_tmp data
                    where data.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                        and data.record_date = trunc(valRecordDate, 'MM')
                        and data.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                        and data.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                ) outl
                join
                (
                    select /*+ CARDINALITY(pol, 100)*/
                        pol.policy_number,
                        pol.init_ams_id outlet_ams_id,
                        pol.changes_date issue_date
                    from ams.mod_data_policy pol
                    where pol.record_date = trunc(valRecordDate, 'MM')
                        and pol.type_of_data = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                        and pol.changes_code = AMS_MODL_COMP_MMXIII.POLYC_CODE_PROC
                        and pol.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                        and pol.changes_date --chi lay theo dieu kien ngay phat hanh khong lay theo ngay hieu luc
                            between var_begin_date
                            and var_end_date
                        and pol.init_ams_id is not null
                ) iss
                    on iss.outlet_ams_id = outl.outlet_ams_id
                        and iss.issue_date between outl.from_date and outl.to_date
                group by iss.policy_number
                minus
                select  /*+ CARDINALITY(oult, 100) CARDINALITY(canc, 100)*/
                    canc.policy_number
                from
                (
                    select /*+ CARDINALITY(data, 100)*/
                        data.outlet_ams_id,
                        data.effective_date from_date,
                        data.effective_date + 89 to_date
                    from ams.inp_data_outlet_tmp data
                    where data.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                        and data.record_date = trunc(valRecordDate, 'MM')
                        and data.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                        and data.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                ) outl
                join
                (
                    select /*+ CARDINALITY(pol, 100)*/
                        pol.policy_number,
                        pol.init_ams_id outlet_ams_id,
                        pol.changes_date cancel_date
                    from ams.mod_data_policy pol
                    where pol.record_date = trunc(valRecordDate, 'MM')
                        and pol.type_of_data = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                        and pol.changes_code = AMS_MODL_COMP_MMXIII.DATA_CODE_CANC
                        and pol.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                        /*ngay huy 14 ngay*/
                        and pol.changes_date
                            between var_begin_date
                            and (var_end_date + 14)
                        and pol.init_ams_id is not null
                ) canc
                    on canc.outlet_ams_id = outl.outlet_ams_id
                        and canc.cancel_date between outl.from_date and outl.to_date
                group by canc.policy_number
            ) pol
            inner join
            (   /*lay ra phi dau tien*/
                select /*+ CARDINALITY(pol, 100)*/
                    pol.init_ams_id outlet_ams_id,
                    pol.policy_number,
                    pol.freq_date transaction_date,--tam thoi lay ngay hieu luc hop dong hop dong lam ngay xac dinh cac giao dich dong IP vao
                    pol.freq_premium ip,
                    pol.source_of_data
                from ams.mod_data_policy pol
                where pol.record_date = trunc(valRecordDate, 'MM')
                    and pol.type_of_data = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                    and pol.changes_code = AMS_MODL_COMP_MMXIII.POLYC_CODE_PROC
                    and pol.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                    and pol.changes_date --chi can dieu kien ngay phat hanh nam trong thoi gian rong rai nhu vay
                        between var_begin_date
                        and var_end_date
                    and pol.init_ams_id is not null
            ) trans
                on trans.policy_number = pol.policy_number
            group by trans.outlet_ams_id,
                trans.policy_number,
                trans.transaction_date,
                trans.source_of_data
        ) indx
           on indx.outlet_ams_id = key.outlet_ams_id;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_prepare', ' Do du lieu dai ly con lam viec vao  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 2;

        /*lay them ca cac giao dich cua cac dai ly da nghi viec tu dau nam cho den thang truoc day*/
        insert /*+ APPEND */ into ams.la_comp_mmxiii_agin_trans nologging
        select  /*+
                   CARDINALITY(key, 100)
                   CARDINALITY(indx, 100)
                   */
            key.outlet_id,
            key.outlet_ams_id,
            trunc(valRecordDate, 'YYYY'),
            trunc(sysdate, 'DD'),
            indx.source_of_data,
            key.outlet_name,
            key.company_id,
            key.company_ams_id,
            key.company_name,
            key.office_id,
            key.office_ams_id,
            key.office_name,
            key.agency_id,
            key.agency_ams_id,
            key.agency_name,
            key.unit_id,
            key.unit_ams_id,
            key.unit_name,
            key.effective_date,
            key.terminative_date,
            key.position_code,
            key.position_date,
            indx.policy_number,
            indx.transaction_code,
            indx.transaction_date,
            indx.transaction_premium,
            indx.transaction_ip,
            indx.source_of_data,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            select /*+ CARDINALITY(data, 100)*/
                data.outlet_id,
                data.outlet_ams_id,
                data.outlet_name,
                data.position_code,
                data.position_date,
                data.effective_date,
                data.terminative_date,
                data.company_id,
                data.company_ams_id,
                data.company_name,
                data.office_id,
                data.office_ams_id,
                data.office_name,
                data.agency_id,
                data.agency_ams_id,
                data.agency_name,
                data.unit_id,
                data.unit_ams_id,
                data.unit_name
            from ams.inp_data_outlet_tmp data
            where  data.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                and data.record_date --cho nay can phai lay ca cac dai ly vao lam va nghi viec trong giai doan tu 15/12/2012 den 31/12/2012
                      between trunc(valRecordDate, 'YYYY')
                      and add_months(trunc(valRecordDate, 'MM'), -1)
                and data.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                and data.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                and data.terminative_date is not null
        ) key
        join
        (
            select
                /*+
                CARDINALITY(trans, 100)
                CARDINALITY(pol, 100)
                */
                trans.outlet_ams_id,
                trans.policy_number,
                trans.transaction_date,
                trans.source_of_data,
                'INIT' transaction_code,
                sum(nvl(trans.ip, 0)) transaction_premium,
                sum(nvl(trans.ip, 0)) transaction_ip
            from
            (
                select  /*+ CARDINALITY(oult, 100) CARDINALITY(iss, 100)*/
                    iss.policy_number
                from
                (
                    select /*+ CARDINALITY(data, 100)*/
                        data.outlet_ams_id,
                        data.effective_date from_date,
                        data.effective_date + 89 to_date
                    from ams.inp_data_outlet_tmp data
                    where data.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                        and data.record_date --cho nay can phai lay ca cac dai ly vao lam va nghi viec trong giai doan tu 15/12/2012 den 31/12/2012
                              between trunc(valRecordDate, 'YYYY')
                              and add_months(trunc(valRecordDate, 'MM'), -1)
                        and data.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                        and data.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                        and data.terminative_date is not null
                ) outl
                join
                (
                    select /*+ CARDINALITY(pol, 100)*/
                        pol.policy_number,
                        pol.init_ams_id outlet_ams_id,
                        pol.changes_date issue_date
                    from ams.mod_data_policy pol
                    where pol.record_date = trunc(valRecordDate, 'MM')
                        and pol.type_of_data = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                        and pol.changes_code = AMS_MODL_COMP_MMXIII.POLYC_CODE_PROC
                        and pol.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                        and pol.changes_date --chi lay theo dieu kien ngay phat hanh khong lay theo ngay hieu luc
                            between var_begin_date
                            and var_end_date
                        and pol.init_ams_id is not null
                ) iss
                    on iss.outlet_ams_id = outl.outlet_ams_id
                        and iss.issue_date between outl.from_date and outl.to_date
                group by iss.policy_number
                minus
                select  /*+ CARDINALITY(oult, 100) CARDINALITY(canc, 100)*/
                    canc.policy_number
                from
                (
                    select /*+ CARDINALITY(data, 100)*/
                        data.outlet_ams_id,
                        data.effective_date from_date,
                        data.effective_date + 89 to_date
                    from ams.inp_data_outlet_tmp data
                    where data.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                        and data.record_date --cho nay can phai lay ca cac dai ly vao lam va nghi viec trong giai doan tu 15/12/2012 den 31/12/2012
                              between trunc(valRecordDate, 'YYYY')
                              and add_months(trunc(valRecordDate, 'MM'), -1)
                        and data.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                        and data.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                        and data.terminative_date is not null
                ) outl
                join
                (
                    select /*+ CARDINALITY(pol, 100)*/
                        pol.policy_number,
                        pol.init_ams_id outlet_ams_id,
                        pol.changes_date cancel_date
                    from ams.mod_data_policy pol
                    where pol.record_date = trunc(valRecordDate, 'MM')
                        and pol.type_of_data = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                        and pol.changes_code = AMS_MODL_COMP_MMXIII.DATA_CODE_CANC
                        and pol.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                        /*ngay huy 14 ngay*/
                        and pol.changes_date
                            between var_begin_date
                            and (var_end_date + 14)
                        and pol.init_ams_id is not null
                ) canc
                    on canc.outlet_ams_id = outl.outlet_ams_id
                        and canc.cancel_date between outl.from_date and outl.to_date
                group by canc.policy_number
            ) pol
            inner join
            (   /*lay ra phi dau tien*/
                select /*+ CARDINALITY(pol, 100)*/
                    pol.init_ams_id outlet_ams_id,
                    pol.policy_number,
                    pol.freq_date transaction_date,--tam thoi lay ngay hieu luc hop dong hop dong lam ngay xac dinh cac giao dich dong IP vao
                    pol.freq_premium ip,
                    pol.source_of_data
                from ams.mod_data_policy pol
                where pol.record_date = trunc(valRecordDate, 'MM')
                    and pol.type_of_data = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                    and pol.changes_code = AMS_MODL_COMP_MMXIII.POLYC_CODE_PROC
                    and pol.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                    and pol.changes_date --chi can dieu kien ngay phat hanh nam trong thoi gian rong rai nhu vay
                        between var_begin_date
                        and var_end_date
                    and pol.init_ams_id is not null
            ) trans
                on trans.policy_number = pol.policy_number
            group by trans.outlet_ams_id,
                trans.policy_number,
                trans.transaction_date,
                trans.source_of_data
        ) indx
           on indx.outlet_ams_id = key.outlet_ams_id;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_prepare', ' lay them ca cac giao dich cua cac dai ly da nghi viec tu dau nam cho den thang truoc day thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 2.1;

        /*lay them ca cac giao dich cua cac dai ly duoc tuyen tu 16/12/2012 den
        31/12/2012 thi cung nghi viec trong thoi gian do luon de cho day du
        cho nay can phai lay ca cac dai ly vao lam va nghi viec trong giai doan tu 15/12/2012 den 31/12/2012        */
        insert /*+ APPEND */ into ams.la_comp_mmxiii_agin_trans nologging
        select  /*+
                   CARDINALITY(key, 100)
                   CARDINALITY(indx, 100)
                   */
            key.outlet_id,
            key.outlet_ams_id,
            trunc(valRecordDate, 'YYYY'),
            trunc(sysdate, 'DD'),
            indx.source_of_data,
            key.outlet_name,
            key.company_id,
            key.company_ams_id,
            key.company_name,
            key.office_id,
            key.office_ams_id,
            key.office_name,
            key.agency_id,
            key.agency_ams_id,
            key.agency_name,
            key.unit_id,
            key.unit_ams_id,
            key.unit_name,
            key.effective_date,
            key.terminative_date,
            key.position_code,
            key.position_date,
            indx.policy_number,
            indx.transaction_code,
            indx.transaction_date,
            indx.transaction_premium,
            indx.transaction_ip,
            indx.source_of_data,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            sysdate,
            sysdate
        from
        ( --cho nay can phai lay ca cac dai ly vao lam va nghi viec trong giai doan tu 15/12/2012 den 31/12/2012
            select /*+ CARDINALITY(data, 100)*/
                data.outlet_id,
                data.outlet_ams_id,
                data.outlet_name,
                data.position_code,
                data.position_date,
                data.effective_date,
                data.terminative_date,
                data.company_id,
                data.company_ams_id,
                data.company_name,
                data.office_id,
                data.office_ams_id,
                data.office_name,
                data.agency_id,
                data.agency_ams_id,
                data.agency_name,
                data.unit_id,
                data.unit_ams_id,
                data.unit_name
            from ams.inp_data_outlet_tmp data
            where  data.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                --lay du lieu o thang 12 nam 2012
                and data.record_date = add_months(trunc(valRecordDate, 'YYYY'), -1)
                and data.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                and data.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                and data.effective_date  --vao lam viec tu ngay 16/12/2012 den 31/12/2012
                    between trunc(valRecordDate, 'YYYY')  - 16  --ngay 16/12/2012 den 31/12/2012
                    and trunc(valRecordDate, 'YYYY')  - 1
                and data.terminative_date is not null
                and data.terminative_date  --vua vao lam va nghi viec cung luon trong thoi gian tu 16/12/2012 den 31/12/2012
                    between trunc(valRecordDate, 'YYYY')  - 16  --ngay 16/12/2012
                    and trunc(valRecordDate, 'YYYY')  - 1
        ) key
        join
        (
            select
                /*+
                CARDINALITY(trans, 100)
                CARDINALITY(pol, 100)
                */
                trans.outlet_ams_id,
                trans.policy_number,
                trans.transaction_date,
                trans.source_of_data,
                'INIT' transaction_code,
                sum(nvl(trans.ip, 0)) transaction_premium,
                sum(nvl(trans.ip, 0)) transaction_ip
            from
            (
                select  /*+ CARDINALITY(oult, 100) CARDINALITY(iss, 100)*/
                    iss.policy_number
                from
                (
                    select /*+ CARDINALITY(data, 100)*/
                        data.outlet_ams_id,
                        data.effective_date from_date,
                        data.effective_date + 89 to_date
                    from ams.inp_data_outlet_tmp data
                    where  data.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                        --lay du lieu o thang 12 nam 2012
                        and data.record_date = add_months(trunc(valRecordDate, 'YYYY'), -1)
                        and data.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                        and data.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                        and data.effective_date  --vao lam viec tu ngay 16/12/2012 den 31/12/2012
                            between trunc(valRecordDate, 'YYYY')  - 16  --ngay 16/12/2012 den 31/12/2012
                            and trunc(valRecordDate, 'YYYY')  - 1
                        and data.terminative_date is not null
                        and data.terminative_date  --vua vao lam va nghi viec cung luon trong thoi gian tu 16/12/2012 den 31/12/2012
                            between trunc(valRecordDate, 'YYYY')  - 16  --ngay 16/12/2012
                            and trunc(valRecordDate, 'YYYY')  - 1
                ) outl
                join
                (
                    select /*+ CARDINALITY(pol, 100)*/
                        pol.policy_number,
                        pol.init_ams_id outlet_ams_id,
                        pol.changes_date issue_date
                    from ams.mod_data_policy pol
                    where pol.record_date = trunc(valRecordDate, 'MM')
                        and pol.type_of_data = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                        and pol.changes_code = AMS_MODL_COMP_MMXIII.POLYC_CODE_PROC
                        and pol.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                        and pol.changes_date --chi lay theo dieu kien ngay phat hanh khong lay theo ngay hieu luc
                            between var_begin_date
                            and var_end_date
                        and pol.init_ams_id is not null
                ) iss
                    on iss.outlet_ams_id = outl.outlet_ams_id
                        and iss.issue_date between outl.from_date and outl.to_date
                group by iss.policy_number
                minus
                select  /*+ CARDINALITY(oult, 100) CARDINALITY(canc, 100)*/
                    canc.policy_number
                from
                (
                    select /*+ CARDINALITY(data, 100)*/
                        data.outlet_ams_id,
                        data.effective_date from_date,
                        data.effective_date + 89 to_date
                    from ams.inp_data_outlet_tmp data
                    where  data.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                        --lay du lieu o thang 12 nam 2012
                        and data.record_date = add_months(trunc(valRecordDate, 'YYYY'), -1)
                        and data.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                        and data.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                        and data.effective_date  --vao lam viec tu ngay 16/12/2012 den 31/12/2012
                            between trunc(valRecordDate, 'YYYY')  - 16  --ngay 16/12/2012 den 31/12/2012
                            and trunc(valRecordDate, 'YYYY')  - 1
                        and data.terminative_date is not null
                        and data.terminative_date  --vua vao lam va nghi viec cung luon trong thoi gian tu 16/12/2012 den 31/12/2012
                            between trunc(valRecordDate, 'YYYY')  - 16  --ngay 16/12/2012
                            and trunc(valRecordDate, 'YYYY')  - 1
                ) outl
                join
                (
                    select /*+ CARDINALITY(pol, 100)*/
                        pol.policy_number,
                        pol.init_ams_id outlet_ams_id,
                        pol.changes_date cancel_date
                    from ams.mod_data_policy pol
                    where pol.record_date = trunc(valRecordDate, 'MM')
                        and pol.type_of_data = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                        and pol.changes_code = AMS_MODL_COMP_MMXIII.DATA_CODE_CANC
                        and pol.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                        /*ngay huy 14 ngay*/
                        and pol.changes_date
                            between var_begin_date
                            and (var_end_date + 14)
                        and pol.init_ams_id is not null
                ) canc
                    on canc.outlet_ams_id = outl.outlet_ams_id
                        and canc.cancel_date between outl.from_date and outl.to_date
                group by canc.policy_number
            ) pol
            inner join
            (   /*lay ra phi dau tien*/
                select /*+ CARDINALITY(pol, 100)*/
                    pol.init_ams_id outlet_ams_id,
                    pol.policy_number,
                    pol.freq_date transaction_date,--tam thoi lay ngay hieu luc hop dong hop dong lam ngay xac dinh cac giao dich dong IP vao
                    pol.freq_premium ip,
                    pol.source_of_data
                from ams.mod_data_policy pol
                where pol.record_date = trunc(valRecordDate, 'MM')
                    and pol.type_of_data = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                    and pol.changes_code = AMS_MODL_COMP_MMXIII.POLYC_CODE_PROC
                    and pol.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                    and pol.changes_date --chi can dieu kien ngay phat hanh nam trong thoi gian rong rai nhu vay
                        between var_begin_date
                        and var_end_date
                    and pol.init_ams_id is not null
            ) trans
                on trans.policy_number = pol.policy_number
            group by trans.outlet_ams_id,
                trans.policy_number,
                trans.transaction_date,
                trans.source_of_data
        ) indx
           on indx.outlet_ams_id = key.outlet_ams_id;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_prepare', ' lay them ca cac giao dich cua cac dai ly duoc tuyen tu 16/12/2012 den 31/12/2012 thi cung nghi viec trong thoi gian do  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 3;

        dbms_stats.gather_table_stats(null, 'la_comp_mmxiii_agin_trans', cascade => true);

        /*Truncate bang bang la_comp_mmxiii_agin_na de do du lieu tu bang inp_data_outlet vao cho bang do*/
        execute immediate 'truncate table ams.la_comp_mmxiii_agin_na';
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_prepare', 'truncate inp_data_outlet_tmp');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 4;

        /*Do danh sach cac dai ly duoc tuyen moi vao ban la_comp_mmxiii_agin_na
        de tinh trong 90 ngay lam viec dau tien thi duoc bao nhieu IP*/
        insert /*+ APPEND */ into ams.la_comp_mmxiii_agin_na nologging (
            outlet_id,
            outlet_ams_id,
            record_date,
            version_date,
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
            effective_date,
            terminative_date,
            position_code,
            position_date,
            agin_quater_date,
            agin_record_date,
            agin_period_begin,
            agin_period_end,
            agin_period_issue,
            agin_period_ip,
            agin_asmt,
            create_user,
            update_user,
            create_datetime,
            update_datetime
        )
        select  /*+
                   CARDINALITY(key, 100)
                   */
            key.outlet_id,
            key.outlet_ams_id,
            trunc(valRecordDate, 'YYYY'),
            trunc(sysdate, 'DD'),
            key.outlet_name,
            key.company_id,
            key.company_ams_id,
            key.company_name,
            key.office_id,
            key.office_ams_id,
            key.office_name,
            key.agency_id,
            key.agency_ams_id,
            key.agency_name,
            key.unit_id,
            key.unit_ams_id,
            key.unit_name,
            key.effective_date,
            key.terminative_date,
            key.position_code,
            key.position_date,
            --lay ra quy tinh cho no khi ma ket thuc 90 ngay lam viec dau tien de tinh cho dung so lieu
            --phai xac dinh nhu the nay thi moi tinh dung duoc quy cho no con neu khong thi se bi sai
            case
                  when to_number(to_char(trunc(key.effective_date + 89, 'MM'), 'MM')) between 1 and 3 then to_date('1-mar-' || to_char(valRecordDate, 'YYYY'))
                  when to_number(to_char(trunc(key.effective_date + 89, 'MM'), 'MM')) between 3 and 6 then to_date('1-jun-' || to_char(valRecordDate, 'YYYY'))
                  when to_number(to_char(trunc(key.effective_date + 89, 'MM'), 'MM')) between 7 and 9 then to_date('1-sep-' || to_char(valRecordDate, 'YYYY'))
                  when to_number(to_char(trunc(key.effective_date + 89, 'MM'), 'MM')) between 10 and 12 then to_date('1-dec-' || to_char(valRecordDate, 'YYYY'))
            end,
            trunc(key.effective_date + 89, 'MM'),--thang se ghi nhan cho no
            key.effective_date,
            key.effective_date + 89, --90 ngay lam viec dau tien den ngay nao
            null,
            null,
            null,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.inp_data_outlet_tmp key
        where key.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
            and key.record_date = trunc(valRecordDate, 'MM')
            and key.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
            and key.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
            and key.effective_date is not null
            and key.effective_date --chi lay dai ly moi duoc tuyen tu 16/12/2012 cho den 15/12/2013
                between trunc(valRecordDate, 'YYYY')  - 16  --ngay 16/12/2012
                and add_months(trunc(valRecordDate, 'YYYY'), 12) - 17; --ngay 15/12/2013
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_prepare', 'Do danh sach cac dai ly duoc tuyen moi vao ban la_comp_mmxiii_agin_na thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 5;
        /*Anh Hoa bao la phai lay ca dai ly nghi viec vao tu thang 1 nam 2013 cho den truoc thang tinh  */
        insert /*+ APPEND */ into ams.la_comp_mmxiii_agin_na nologging
        select  /*+
                   CARDINALITY(key, 100)
                   */
            key.outlet_id,
            key.outlet_ams_id,
            trunc(valRecordDate, 'YYYY'),
            trunc(sysdate, 'DD'),
            key.outlet_name,
            key.company_id,
            key.company_ams_id,
            key.company_name,
            key.office_id,
            key.office_ams_id,
            key.office_name,
            key.agency_id,
            key.agency_ams_id,
            key.agency_name,
            key.unit_id,
            key.unit_ams_id,
            key.unit_name,
            key.effective_date,
            key.terminative_date,
            key.position_code,
            key.position_date,
            --lay ra quy tinh cho no khi ma ket thuc 90 ngay lam viec dau tien de tinh cho dung so lieu
            --phai xac dinh nhu the nay thi moi tinh dung duoc quy cho no con neu khong thi se bi sai
            case
                  when to_number(to_char(trunc(key.effective_date + 89, 'MM'), 'MM')) between 1 and 3 then to_date('1-mar-' || to_char(valRecordDate, 'YYYY'))
                  when to_number(to_char(trunc(key.effective_date + 89, 'MM'), 'MM')) between 3 and 6 then to_date('1-jun-' || to_char(valRecordDate, 'YYYY'))
                  when to_number(to_char(trunc(key.effective_date + 89, 'MM'), 'MM')) between 7 and 9 then to_date('1-sep-' || to_char(valRecordDate, 'YYYY'))
                  when to_number(to_char(trunc(key.effective_date + 89, 'MM'), 'MM')) between 10 and 12 then to_date('1-dec-' || to_char(valRecordDate, 'YYYY'))
            end,
            trunc(key.effective_date + 89, 'MM'),--thang se ghi nhan cho no
            key.effective_date,
            key.effective_date + 89, --90 ngay lam viec dau tien den ngay nao
            null,
            null,
            null,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.inp_data_outlet_tmp key
        where key.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
            --cac dai ly nghi viec tu dau nam cho den thang do de tinh cho no dung
            and key.record_date
                between trunc(valRecordDate, 'YYYY')
                and add_months(trunc(valRecordDate, 'MM'), -1)
            and key.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
            and key.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
            and key.effective_date is not null
            and key.effective_date --chi lay dai ly moi duoc tuyen tu 16/12/2012 cho den 15/12/2013
                between trunc(valRecordDate, 'YYYY')  - 16  --ngay 16/12/2012
                and add_months(trunc(valRecordDate, 'YYYY'), 12) - 17 --ngay 15/12/2013
            and key.terminative_date is not null;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_prepare', 'phai lay ca dai ly nghi viec tu thang 1 nam 2013 cho den truoc thang tinh  vao  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /*lay them ca cac dai ly duoc tuyen tu 16/12/2012 den  31/12/2012 thi cung nghi viec
        trong thoi gian do luon de cho day du */

        insert /*+ APPEND */ into ams.la_comp_mmxiii_agin_na nologging
        select  /*+
                   CARDINALITY(key, 100)
                   */
            key.outlet_id,
            key.outlet_ams_id,
            trunc(valRecordDate, 'YYYY'),
            trunc(sysdate, 'DD'),
            key.outlet_name,
            key.company_id,
            key.company_ams_id,
            key.company_name,
            key.office_id,
            key.office_ams_id,
            key.office_name,
            key.agency_id,
            key.agency_ams_id,
            key.agency_name,
            key.unit_id,
            key.unit_ams_id,
            key.unit_name,
            key.effective_date,
            key.terminative_date,
            key.position_code,
            key.position_date,
            --lay ra quy tinh cho no khi ma ket thuc 90 ngay lam viec dau tien de tinh cho dung so lieu
            --phai xac dinh nhu the nay thi moi tinh dung duoc quy cho no con neu khong thi se bi sai
            case
                  when to_number(to_char(trunc(key.effective_date + 89, 'MM'), 'MM')) between 1 and 3 then to_date('1-mar-' || to_char(valRecordDate, 'YYYY'))
                  when to_number(to_char(trunc(key.effective_date + 89, 'MM'), 'MM')) between 3 and 6 then to_date('1-jun-' || to_char(valRecordDate, 'YYYY'))
                  when to_number(to_char(trunc(key.effective_date + 89, 'MM'), 'MM')) between 7 and 9 then to_date('1-sep-' || to_char(valRecordDate, 'YYYY'))
                  when to_number(to_char(trunc(key.effective_date + 89, 'MM'), 'MM')) between 10 and 12 then to_date('1-dec-' || to_char(valRecordDate, 'YYYY'))
            end,
            trunc(key.effective_date + 89, 'MM'),--thang se ghi nhan cho no
            key.effective_date,
            key.effective_date + 89, --90 ngay lam viec dau tien den ngay nao
            null,
            null,
            null,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.inp_data_outlet_tmp key
        where  key.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
            --lay du lieu o thang 12 nam 2012
            and key.record_date = add_months(trunc(valRecordDate, 'YYYY'), -1)
            and key.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
            and key.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
            and key.effective_date  --vao lam viec tu ngay 16/12/2012 den 31/12/2012
                between trunc(valRecordDate, 'YYYY')  - 16  --ngay 16/12/2012 den 31/12/2012
                and trunc(valRecordDate, 'YYYY')  - 1
            and key.terminative_date is not null
            and key.terminative_date  --vua vao lam va nghi viec cung luon trong thoi gian tu 16/12/2012 den 31/12/2012
                between trunc(valRecordDate, 'YYYY')  - 16  --ngay 16/12/2012
                and trunc(valRecordDate, 'YYYY')  - 1;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_prepare', 'lay them ca cac dai ly duoc tuyen tu 16/12/2012 den  31/12/2012 thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        --Lay vao so HD KTM va IP trong 90 ngay lam viec dau tien cua dai ly
        merge/*+ CARDINALITY(o, 100) */
            into ams.la_comp_mmxiii_agin_na o
        using
            (
                select /*+
                           CARDINALITY(outl, 100)
                           CARDINALITY(tran, 100)
                           */
                    outl.outlet_ams_id,
                    sum(nvl(tran.trans_ip, 0)) agin_period_ip,
                    nvl(count(tran.policy_number), 0) agin_period_issue
                from
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_ams_id,
                        tmp.agin_period_begin begin_date, --bat dau cua tinh 90 ngay
                        tmp.agin_period_end end_date--ngay ket thuc cua tinh 90 ngay
                    from ams.la_comp_mmxiii_agin_na tmp
                    where tmp.record_date = trunc(valRecordDate, 'YYYY')
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
                        tmp.trans_ip
                    from ams.la_comp_mmxiii_agin_trans tmp
                ) tran
                    on
                    (
                        tran.outlet_ams_id = outl.outlet_ams_id
                        and--trong vong  90 ngay lam viec dau tin cua dai ly luu o day
                        tran.trans_date between outl.begin_date and outl.end_date
                    )
                group by outl.outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            upd.outlet_ams_id = o.outlet_ams_id
            )
        when matched then
            update
            set --cap nhat IP va so hop dong KTM thuan cho dai ly moi nay
                o.agin_period_ip = upd.agin_period_ip,
                o.agin_period_issue = upd.agin_period_issue,
                o.update_datetime = sysdate;
        commit;

        /*Cap nhat luon vao day cho tien theo doi so lieu cho minh*/
        update ams.la_comp_mmxiii_agin_na tmp
        set tmp.agin_asmt  = 1
        where tmp.agin_period_issue >= 2
            and tmp.agin_period_ip >= 15000000;
        commit;

        dbms_stats.gather_table_stats(null, 'la_comp_mmxiii_agin_na', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_prepare', 'Lay vao so HD KTM va IP trong 90 ngay lam viec dau tien cua dai ly  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 6;

        /*Truncate bang bang la_comp_mmxiii_mnea_na de do du lieu tu bang inp_data_outlet vao cho bang do*/
        execute immediate 'truncate table ams.la_comp_mmxiii_mnea_na';
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_prepare', ' truncate table  la_comp_mmxiii_mnea_na thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 6;

        /*Do toan bo cac so lieu vao bang la danh sach cac dai ly moi
        duoc tuyen vao bang la_comp_mmxiii_mnea_na
        roi sau do lay ra ma nguoi tuyen dung va chuc vu hien nay nguoi tuyen dung
        roi se dem so luong roi merge theo ma nguoi tuyen dung voi bang la_comp_mmxiii_mnea de
        Chu y: chi tinh la tuyen dung khi ma da len lam truong nhom roi thi moi duoc tinh cho no thi moi co the dung duoc
        Khi ma dang lam tu van vien thi khong duoc tinh*/
        insert /*+ APPEND */ into ams.la_comp_mmxiii_mnea_na nologging
        select  /*+
                   CARDINALITY(key, 100)
                   */
            key.outlet_id,
            key.outlet_ams_id,
            trunc(valRecordDate, 'YYYY'), --theo nam luon cho tien
            trunc(sysdate, 'DD'),
            key.outlet_name,
            key.company_id,
            key.company_ams_id,
            key.company_name,
            key.office_id,
            key.office_ams_id,
            key.office_name,
            key.agency_id,
            key.agency_ams_id,
            key.agency_name,
            key.unit_id,
            key.unit_ams_id,
            key.unit_name,
            key.effective_date,
            key.terminative_date,
            key.position_code,
            key.position_date,
            AMS_MODL_COMP_MMXIII.BE_PAID_YES,
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
            --cho nay dung de ve sau se xu ly theo tung thang
            trunc(key.effective_date, 'MM'), --data_date thi lay theo thang ma dai ly do vao lam viec
            null,--agna_outlet_id
            null,--agna_outlet_ams_id
            null,--agna_position_code
            key.agin_period_begin, --ngay bat dau tinh IP
            key.agin_period_end, --ngay ket thuc tinh IP
            key.agin_period_issue,
            key.agin_period_ip,
            null,--key.agin_asmt, --khong dua gia tri nay vao vi se phai xet o duoi nua
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.la_comp_mmxiii_agin_na key;
        --chi do vao thang nay danh sach cac dai ly moi ma duoc tinh thuong cho no thoi
        --Neu khong thi se khong do vao cho no
        --Va se phai do vao thang sau cho no
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_prepare', 'Do toan bo cac so lieu vao bang la danh sach cac dai ly moi
        duoc tuyen vao bang la_comp_mmxiii_mnea_na   thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 9;

        /*Cap nhat dai ly do la do dai ly nao tuyen vao*/
        merge/*+ CARDINALITY(o, 100)*/
            into ams.la_comp_mmxiii_mnea_na o
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_id,
                    tmp.empl_id
                from ams.la_prom_history_agent_tmp tmp
                where tmp.record_date = trunc(valRecordDate, 'MM')
            ) upd
        on ( --day la phai tinh theo nam cho no thi moi dung duoc khong la sai mat
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = o.mnea_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = o.mnea_be_paid
            and
            upd.outlet_id = o.outlet_id
            )
        when matched then
            update
            set --cap nhat dai ly tuyen dung dai ly do vao
                o.mnea_outlet_id = upd.empl_id;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_prepare', 'Cap nhat dai ly do la do dai ly nao tuyen vao  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 10;

        /* Ghi nhan outlet ams id*/
        merge /*+ CARDINALITY(o, 100)*/
            into ams.la_comp_mmxiii_mnea_na o
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_client_id mnea_outlet_id,
                    max(tmp.outlet_number) outlet_ams_id
                from ods.outlet tmp
                group by tmp.outlet_client_id
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = o.mnea_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = o.mnea_be_paid
            and --phai nhu the nahy thi moi cap nhat duoc dung so lieu cho no duoc
            --khong la sai day nhe su dung nhu the nay thi moi dung duoc co nhe
            upd.mnea_outlet_id = o.mnea_outlet_id
            )
        when matched then
            update
                set
                    o.mnea_outlet_ams_id = upd.outlet_ams_id;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_prepare', 'Ghi nhan outlet ams id  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 11;

        --Du lieu chi cap nhat o dong IS PAID la dong tong hop thoi nhe
        --khong cap nhat o dong chi tiet
        /* Cap nhat chuc vu khi tuyen dai ly moi cua dai ly tuyen dai ly moi vao tai thang tuyen vao*/
        var_month_qty := months_between(trunc(valRecordDate, 'MM'), trunc(valRecordDate, 'YYYY'));
        /*do so lieu cua tung thang vao
        Phai lay nhu the nay vi chi tinh nhung thang den thoi gian do van con la truong nhom*/
        for i in 0..var_month_qty
        loop
            merge /*+ CARDINALITY(mnea, 100)*/
                into ams.la_comp_mmxiii_mnea_na mnea
            using
                (
                    select /*+ CARDINALITY(empl, 100)
                               CARDINALITY(outl, 100) */
                        empl.outlet_ams_id, --lay ra ma dai ly moi duoc tuyen vao
                        outl.position_code mnea_position_code --va ma chuc vu cua dai ly tuyen dai ly moi  vao
                    from
                    (  --lay ra danh sach cac dai ly duoc tuyen vao va ngay duoc tuyen vao tai tung thang
                        select /*+ CARDINALITY(tmp, 100)*/
                            tmp.outlet_ams_id,
                            tmp.mnea_outlet_ams_id,
                            tmp.effective_date
                        from ams.la_comp_mmxiii_mnea_na tmp
                        where tmp.record_date = trunc(valRecordDate, 'YYYY')
                            --chay tung thang mot trong nam
                            and tmp.mnea_data_date = add_months(trunc(valRecordDate, 'MM'), -i)
                            and tmp.mnea_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                            and tmp.mnea_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                    ) empl
                    join
                    ( --join voi danh sach cac tien truong nhom truong nhom truong ban tuyen cac dai ly tai tung thang
                        select /*+ CARDINALITY(data, 100)*/
                            data.outlet_ams_id mnea_outlet_ams_id,
                            data.record_date,
                            data.position_code  --vi tri tai thang day
                        from ams.inp_data_outlet_tmp data
                        where data.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                            --trong trong ca mot nam luon de cho no co du so lieu de hien ra
                            and data.record_date
                                between add_months(trunc(valRecordDate, 'YYYY'), -3)
                                and trunc(valRecordDate, 'MM')
                            and data.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                            and data.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                    ) outl
                        on
                        (
                            outl.mnea_outlet_ams_id = empl.mnea_outlet_ams_id
                            and--cho nay du lieu co the co rat nhieu dong nhung chi cai dong
                            --ma thang ma co ngay ky hop dong cua dai ly moi
                            --bang voi thang cua dai ly di tuyen dai ly moi do vao thi ra chi 1 dong
                            trunc(outl.record_date, 'MM') = trunc(empl.effective_date, 'MM') --lay ra ma chuc vu tai thang tuyen dai ly day
                        )
                ) upd
            on (
                trunc(valRecordDate, 'YYYY') = mnea.record_date
                and
                AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnea.mnea_be_executing
                and
                AMS_MODL_COMP_MMXIII.BE_PAID_YES = mnea.mnea_be_paid
                and
                add_months(trunc(valRecordDate, 'MM'), -i) = mnea.mnea_data_date
                and
                upd.outlet_ams_id = mnea.outlet_ams_id
            )
            when matched then
                update
                    set
                        mnea.mnea_position_code = upd.mnea_position_code,
                        mnea.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                        mnea.update_datetime = sysdate;
            commit;
        end loop;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_prepare', 'Cap nhat chuc vu khi tuyen vao  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 12;

        begin
            select /*+ CARDINALITY(tmp, 100)*/
                count(tmp.outlet_ams_id)
                into var_position_qty
            from ams.la_comp_mmxiii_mnea_na tmp
            where tmp.record_date = trunc(valRecordDate, 'YYYY')
                and tmp.mnea_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                and tmp.mnea_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                and tmp.mnea_position_code is null;
        exception
            when others then
                var_position_qty := -1;
                life_agency_log.write_log(-1000,
                    'mmxiii_modl_mnea_prepare: loi du lieu ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' la_comp_mmxiii_mnea_na o postion_code bi null can xem qua lai' ,
                    'Thong bao loi du lieu',
                    -1000);
        end;

        if nvl(var_position_qty, 0) > 0 then
                life_agency_log.write_log(-1000,
                    'mmxiii_modl_mnea_prepare: Co mot so dai ly duoc tuyen boi cong ty' || to_char(valRecordDate, 'dd/mm/yyyy') || ' la_comp_mmxiii_mnea_na o postion_code bi null can xem qua lai' ,
                    'Thong bao',
                    -1000);
        end if;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agin_open', 'Cap nhat chuc vu khi tuyen dai ly moi cua dai ly   thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 13;

        --Cap nhat = 1 neu la thoa man dieu kien la dai ly moi
        --va nguoi tuyen vao khong phai la tien truong nhom truong nhom
        --dong thoi phai co du lieu trong phan danh sach cac ung vien duoc quyen tuyen moi
        --da luu trong he thong o thoi gian truoc
        update ams.la_comp_mmxiii_mnea_na tmp
        set tmp.mnea_period_asmt = 1
        where tmp.record_date = trunc(valRecordDate, 'YYYY')
            and tmp.mnea_period_issue >= 2
            and tmp.mnea_period_ip >= 15000000
            --chi tinh cho no khi ma nguoi tuyen la TRUONG NHOM HAY TRUONG BAN
            --CON CAC CHUC DANH KHAC THI SE KHONG TINH CHO NO
            --CAN HOI LAI ANH HUU HOA O DAY
            and tmp.mnea_position_code in
            (
                    AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02,
                    AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV03,
                    AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
            );
        commit;
        dbms_stats.gather_table_stats(null, 'la_comp_mmxiii_mnea_na', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_prepare', ' Cap nhat = 1 neu la thoa man dieu kien la dai ly moi thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_mnea_prepare: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_mnea_open(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Len danh sach du lieu chi tiet can xoa*/
        merge /*+ CARDINALITY(comp, 100)*/
            into ams.la_comp_mmxiii_mnea mnea
        using
            (
                select /*+ CARDINALITY(comp, 100)*/
                    comp.info_company_id company_id
                from ams.la_compensation_mmxiii_tmp comp
                where comp.record_date = trunc(valRecordDate, 'MM')
                    and comp.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
               group by comp.info_company_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = mnea.record_date
            and
            upd.company_id = mnea.company_id
        )
        when matched then
            update
                set
                    mnea.mnea_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_DEL;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_open', 'Len danh sach du lieu chi tiet can xoa  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 1;

        /* Xoa du lieu chi tiet*/
        loop
            delete ams.la_comp_mmxiii_mnea mnea
            where mnea.record_date = trunc(valRecordDate, 'MM')
                and mnea.mnea_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_DEL
                and rownum < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_open', 'Xoa du lieu chi tiet  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 2;

        /*Do du lieu cho bang chinh truoc de tu danh sach cac nhom day se do vao bang con va lay ra
        cac dai ly thuoc bang con day cho de dang hon*/
        /*Do du lieu truong nhom truoc*/

        insert /*+ APPEND */ into ams.la_comp_mmxiii_mnea nologging(
            outlet_id,
            outlet_ams_id,
            record_date,
            version_date,
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
            effective_date,
            terminative_date,
            position_code,
            position_date,
            mnea_be_paid,
            mnea_be_executing,
            mnea_data_date,
            mnea_branch_id,
            mnea_branch_ams_id,
            mnea_period_na_qty,
            mnea_period_fyp,
            mnea_period_asmt,
            mnea_period_month_qty,
            mnea_period_fyc,
            mnea_comp_ratio,
            mnea_comp_money,
            create_user,
            update_user,
            create_datetime,
            update_datetime
        )
        select /*+ CARDINALITY(outl, 100) */
            outl.outlet_id,
            outl.outlet_ams_id,
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            outl.info_outlet_name,
            outl.info_company_id,
            outl.info_company_ams_id,
            outl.info_company_name,
            outl.info_office_id,
            outl.info_office_ams_id,
            outl.info_office_name,
            outl.info_agency_id,
            outl.info_agency_ams_id,
            outl.info_agency_name,
            outl.info_unit_id,
            outl.info_unit_ams_id,
            outl.info_unit_name,
            outl.info_effective_date,
            null,
            outl.info_position_code,
            outl.info_position_date,
            AMS_MODL_COMP_MMXIII.BE_PAID_YES,
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
            trunc(valRecordDate, 'MM'),
            outl.info_unit_id,
            outl.info_unit_ams_id,
            0,
            0,
            null,
            0,
            0,
            0,
            0,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.la_compensation_mmxiii_tmp outl
        where outl.record_date = trunc(valRecordDate, 'MM')
            and outl.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and outl.status_code = AMS_MODL_COMP_MMXIII.STATUS_CURR
            --and outl.info_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02
            and ams.AMS_DATA_OUTLET.get_regency_code(outl.outlet_ams_id,
                                        add_months(trunc(valRecordDate, 'YYYY'), 12))  = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02
            and
            (
                ams.AMS_DATA_OUTLET.get_regency_code(outl.outlet_ams_id,
                                            add_months(trunc(valRecordDate, 'YYYY'), 12) - 1)  = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
                or
                (
                    ams.AMS_DATA_OUTLET.get_regency_code(outl.outlet_ams_id,
                                                add_months(trunc(valRecordDate, 'YYYY'), 12) - 1)  = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02
                    and months_between(
                        add_months(trunc(valRecordDate, 'YYYY'), 12),
                        trunc(outl.info_position_date, 'MM')
                        ) >= 2
                )
            );
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_open', 'Do du lieu truong nhom truoc  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 5;

        /*Khong xet cho TN CNTH*/
        /*Do du lieu truong ban*/
        insert /*+ APPEND */ into ams.la_comp_mmxiii_mnea nologging(
            outlet_id,
            outlet_ams_id,
            record_date,
            version_date,
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
            effective_date,
            terminative_date,
            position_code,
            position_date,
            mnea_be_paid,
            mnea_be_executing,
            mnea_data_date,
            mnea_branch_id,
            mnea_branch_ams_id,
            mnea_period_na_qty,
            mnea_period_fyp,
            mnea_period_asmt,
            mnea_period_month_qty,
            mnea_period_fyc,
            mnea_comp_ratio,
            mnea_comp_money,
            create_user,
            update_user,
            create_datetime,
            update_datetime
        )
        select  /*+ CARDINALITY(outl, 100) */
            outl.outlet_id,
            outl.outlet_ams_id,
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            outl.info_outlet_name,
            outl.info_company_id,
            outl.info_company_ams_id,
            outl.info_company_name,
            outl.info_office_id,
            outl.info_office_ams_id,
            outl.info_office_name,
            outl.info_agency_id,
            outl.info_agency_ams_id,
            outl.info_agency_name,
            outl.info_unit_id,
            outl.info_unit_ams_id,
            outl.info_unit_name,
            outl.info_effective_date,
            null,
            outl.info_position_code,
            outl.info_position_date,
            AMS_MODL_COMP_MMXIII.BE_PAID_YES,
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
            trunc(valRecordDate, 'MM'),
            outl.info_agency_id,
            outl.info_agency_ams_id,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.la_compensation_mmxiii_tmp outl
        where outl.record_date = trunc(valRecordDate, 'MM')
            and outl.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and outl.status_code = AMS_MODL_COMP_MMXIII.STATUS_CURR
            --and outl.info_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
            --chinhlk 28/11/2013 theo y kien anh Hoa them doan code nay de chi tinh con duy tri chuc vu truong ban tai thoi diem 1/1/2014
            and ams.AMS_DATA_OUTLET.get_regency_code(outl.outlet_ams_id,
                                        add_months(trunc(valRecordDate, 'YYYY'), 12))  = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_open', 'Do du lieu truong ban  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 6;
        /*Sau do se tinh ra so luong cac dai ly tuyen dung cua truong nhom do
        dem tu bang la_comp_mmxiii_mnea_na voi ma truong nhom va so luong da co vao trong bang la_comp_mmxiii_mnea*/

        merge /*+ CARDINALITY(mnea, 100)*/
            into ams.la_comp_mmxiii_mnea mnea
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.mnea_outlet_ams_id outlet_ams_id,
                    sum(nvl(tmp.mnea_period_asmt, 0)) mnea_period_na_qty
                from ams.la_comp_mmxiii_mnea_na tmp
                where tmp.record_date = trunc(valRecordDate, 'YYYY') --lay theo nam nhu the nay
                    --chi lay cac truong nhom cho no de tinh
                    and tmp.mnea_position_code in
                    (
                            AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02,
                            AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV03,
                            AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
                    )
                    and nvl(tmp.mnea_period_asmt, 0) = 1 --phai dat duoc tieu chuan DL moi
                group by tmp.mnea_outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = mnea.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnea.mnea_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = mnea.mnea_be_paid
            and
            upd.outlet_ams_id = mnea.outlet_ams_id
        )
        when matched then
            update
                set
                    mnea.mnea_period_na_qty = upd.mnea_period_na_qty;
        commit;

        /*
        Modify date: 19/8/2013 - 19/9/2013
        Edit by: AnhNH
        ID: 113530
        Description: Dem thieu thang voi TB bi ha bac xuong TN
        */
        --Update ngay chuc vu cua truong nhom = ngay chuc vu truong ban
        --B1: Update cho thang dau tien lam TN
/*        merge \*+ CARDINALITY(mnea, 100)*\
            into ams.la_comp_mmxiii_mnea mnea
        using
            (
                select \*+ CARDINALITY(tmp, 100)*\
                    distinct
                    tmp.outlet_ams_id,
                    tmp.position_date
                from ams.la_comp_mmxiii_mnea tmp
                where tmp.record_date = add_months(trunc(valRecordDate,'MM'), -1)
                    and tmp.position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
             ) upd
        on (
            trunc(valRecordDate, 'MM') = mnea.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnea.mnea_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = mnea.mnea_be_paid
            and
            mnea.position_code in
                (
                     AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02,
                     AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV03
                 )
            and
            upd.outlet_ams_id = mnea.outlet_ams_id
        )
        when matched then
            update
                set
                    mnea.position_date = upd.position_date;
        commit;

        -- B2:Update cho cac thang tiep theo
        merge \*+ CARDINALITY(mnea, 100)*\
            into ams.la_comp_mmxiii_mnea mnea
        using
            (
                select \*+ CARDINALITY(tmp, 100)*\
                    distinct
                    tmp.outlet_ams_id,
                    tmp.position_date,
                    tmp.position_code
                from ams.la_comp_mmxiii_mnea tmp
                where tmp.record_date = add_months(trunc(valRecordDate,'MM'), -1)
                    and tmp.position_code in
                       (
                            AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02,
                            AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV03
                        )
             ) upd
        on (
            trunc(valRecordDate, 'MM') = mnea.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnea.mnea_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = mnea.mnea_be_paid
            and
            mnea.position_code in
                (
                     AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02,
                     AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV03
                 )
            and
            upd.position_code = mnea.position_code
            and
            upd.outlet_ams_id = mnea.outlet_ams_id
        )
        when matched then
            update
                set
                    mnea.position_date = upd.position_date;
        commit;*/

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_open', 'tinh ra so luong cac dai ly tuyen dung cua truong nhom do   thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_mnea_open: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_mnea_data(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
        var_month_qty number(2) := 0;
        var_rec_date date := trunc(valRecordDate, 'MM');
    begin
        /* Chi tiet du lieu tung thang do vao bang chi tiet truoc so lieu trong thang day cua tat ca cac dai ly*/
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /*Do du lieu tung thang vao bang la_comp_mmxiii_mnea
        o cot AMS_MODL_COMP_MMXIII.BE_PAID_DETAIL*/
        /*Du lieu se luu duoi dang tung thang trong nam 2013
        Vi du tu thang 1 nam 2013 den thang 10 nam 2013
        Lay do lieu vao merge tu bang detail vao
        Roi sau do se tong hop so lieu vao bang IS_PAID_YES
        De tinh toan cac chi tieu hien thi len man hinh*/

        var_month_qty := months_between(trunc(valRecordDate, 'MM'), trunc(valRecordDate, 'YYYY'));
        /*do so lieu cua tung thang vao
        Phai lay nhu the nay vi chi tinh nhung thang den thoi gian do van con la truong nhom*/
        for i in 0..var_month_qty
        loop
           var_rec_date := add_months(trunc(valRecordDate,'MM'), -i);
           if var_rec_date between trunc(valRecordDate, 'YYYY') and trunc(valRecordDate, 'MM') then
                insert /*+ APPEND */ into ams.la_comp_mmxiii_mnea nologging(
                    outlet_id,
                    outlet_ams_id,
                    record_date,
                    version_date,
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
                    effective_date,
                    terminative_date,
                    position_code,
                    position_date,
                    mnea_be_paid,
                    mnea_be_executing,
                    mnea_data_date,
                    mnea_branch_id,
                    mnea_branch_ams_id,
                    mnea_period_na_qty,
                    mnea_period_month_qty,
                    mnea_period_asmt,
                    mnea_period_fyc,
                    mnea_comp_ratio,
                    mnea_comp_money,
                    create_user,
                    update_user,
                    create_datetime,
                    update_datetime
                )
                select /*+ CARDINALITY(mnea, 100) CARDINALITY(outl, 100)*/
                    mnea.outlet_id,
                    mnea.outlet_ams_id,
                    trunc(valRecordDate, 'MM'),
                    trunc(sysdate, 'DD'),
                    mnea.outlet_name,
                    mnea.company_id,
                    mnea.company_ams_id,
                    mnea.company_name,
                    mnea.office_id,
                    mnea.office_ams_id,
                    mnea.office_name,
                    mnea.agency_id,
                    mnea.agency_ams_id,
                    mnea.agency_name,
                    mnea.unit_id,
                    mnea.unit_ams_id,
                    mnea.unit_name,
                    mnea.effective_date,
                    mnea.terminative_date,
                    outl.position_code,
                    outl.position_date,
                    AMS_MODL_COMP_MMXIII.BE_PAID_DTL,
                    AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
                    add_months(trunc(valRecordDate,'MM'), -i),
                    case when outl.position_code in  (
                                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02,
                                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV03)
                        then outl.unit_id
                        when outl.position_code in  (
                                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04)
                        then outl.agency_id
                    end mnea_branch_id,
                    case when outl.position_code in  (
                                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02,
                                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV03)
                        then outl.unit_ams_id
                        when outl.position_code in  (
                                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04)
                        then outl.agency_ams_id
                    end mnea_branch_ams_id,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    sysdate,
                    sysdate
                from
                (
                    select /*+ CARDINALITY(outl, 100)*/
                        outl.outlet_id,
                        outl.outlet_ams_id,
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
                        outl.effective_date,
                        outl.terminative_date,
                        outl.position_code,
                        outl.position_date,
                        outl.mnea_branch_id,
                        outl.mnea_branch_ams_id
                    from ams.la_comp_mmxiii_mnea outl
                    where outl.record_date = trunc(valRecordDate, 'MM')
                        and outl.mnea_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                        and outl.mnea_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                ) mnea
                join
                (
                    select  /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.outlet_name,
                        tmp.company_id,
                        tmp.company_ams_id,
                        tmp.agency_id,
                        tmp.agency_ams_id,
                        tmp.unit_id,
                        tmp.unit_ams_id,
                        tmp.effective_date,
                        tmp.terminative_date,
                        tmp.position_code,
                        tmp.position_date
                    from ams.inp_data_outlet_tmp tmp
                    where tmp.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                        and tmp.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                        and tmp.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                        and tmp.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                ) outl
                    on outl.outlet_ams_id = mnea.outlet_ams_id;
                    --can co dieu kien nay khong la lai thuc mat day nhe
                    --phai lon hon ngay len chuc
                    -- Khong quan tam den chuc vu
                    --and add_months(trunc(valRecordDate,'MM'), -i) >= outl.position_date;
                commit;

                ams.life_agency_log.time_end;
                ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_data', 'Do du lieu tung thang vao bang la_comp_mmxiii_mnea   thang  ' || to_char(var_rec_date, 'dd/mm/yyyy'));
                ams.life_agency_log.time_stop;
                ams.life_agency_log.time_begin;
                var_error_pos  := 4;

                /*
                Modify date: 19/9/2013
                Edit by: AnhNH
                ID: 113530
                Description: Dem thieu thang voi TB bi ha bac xuong TN
                Dung Cot Status_code de chua chuc vu truong ban
                dung cua no theo nhu tung thang
                */
                merge /*+ CARDINALITY(comp, 100)*/
                    into ams.la_comp_mmxiii_mnea comp
                using
                    (   --nhom theo cac nhom
                        select /*+ CARDINALITY(data, 100)*/
                            --data.unit_ams_id mnea_branch_ams_id,
                            --sum(nvl(data.period_fyc, 0)) mnea_period_fyc,
                            --sum(nvl(data.period_fyp, 0)) mnea_period_fyp
                            data.outlet_ams_id,
                            data.record_date,
                            data.position_code,
                            data.agency_ams_id
                        from ams.inp_data_outlet_tmp data
                        where data.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                            and data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                            and data.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                            and data.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                            and data.position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
                    ) upd
                on (
                    trunc(valRecordDate, 'MM') = comp.record_date
                    and
                    AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.mnea_be_executing
                    and--cap nhat vao truong chi tiet o phia tren
                    AMS_MODL_COMP_MMXIII.BE_PAID_DTL = comp.mnea_be_paid
                    and--chi lay du lieu chi tiet o thang day
                    add_months(trunc(valRecordDate, 'MM'), -i) = comp.mnea_data_date
                    and
                    upd.outlet_ams_id = comp.outlet_ams_id
                )
                when matched then
                    update
                        set
                            comp.status_code = upd.position_code,
                            comp.mnea_branch_ams_id = upd.agency_ams_id;
                commit;


                /*Doi voi truong nhom
                Merge so lieu chi tiet cua tung thang vao
                cua cac nhom day tu bang detail ve FYP FYC cua tat ca cac thang*/
                merge /*+ CARDINALITY(comp, 100)*/
                    into ams.la_comp_mmxiii_mnea comp
                using
                    (   --nhom theo cac nhom
                        select /*+ CARDINALITY(data, 100)*/
                            data.unit_ams_id mnea_branch_ams_id,
                            sum(nvl(data.period_fyc, 0)) mnea_period_fyc,
                            sum(nvl(data.period_fyp, 0)) mnea_period_fyp
                        from ams.inp_data_outlet_tmp data
                        where data.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                            and data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                            and data.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                            and data.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                            and data.unit_ams_id is not null
                            --FYC va FYP KHONG tinh truong nhom khi cong tong vao
                            and data.position_code not in  (
                                  AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02,
                                  AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV03
                              )
                        group by data.unit_ams_id
                    ) upd
                on (
                    trunc(valRecordDate, 'MM') = comp.record_date
                    and
                    AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.mnea_be_executing
                    and--cap nhat vao truong chi tiet o phia tren
                    AMS_MODL_COMP_MMXIII.BE_PAID_DTL = comp.mnea_be_paid
                    and--chi lay du lieu chi tiet o thang day
                    add_months(trunc(valRecordDate, 'MM'), -i) = comp.mnea_data_date
                    and --chi tinh truong nhom cho no dung so lieu
                    comp.position_code in  (
                                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02,
                                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV03
                            )
                    and--lay o nhom day da co
                    upd.mnea_branch_ams_id = comp.mnea_branch_ams_id
                )
                when matched then
                    update
                        set
                            comp.mnea_period_fyp = upd.mnea_period_fyp,
                            comp.mnea_period_fyc = upd.mnea_period_fyc;
                commit;

                ams.life_agency_log.time_end;
                ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_data', 'merge cho truong nhom FYP FYC thang  ' || to_char(var_rec_date, 'dd/mm/yyyy'));
                ams.life_agency_log.time_stop;
                ams.life_agency_log.time_begin;
                var_error_pos  := 4;

                /*Doi voi truong ban la truong nhom truc tiep
                Merge so lieu chi tiet cua tung thang vao
                cua cac nhom day tu bang detail ve FYP FYC cua tat ca cac thang*/
                merge /*+ CARDINALITY(comp, 100)*/
                    into ams.la_comp_mmxiii_mnea comp
                using
                    (   --nhom theo cac nhom t
                        select /*+ CARDINALITY(data, 100)*/
                            data.agency_ams_id mnea_branch_ams_id,
                            sum(nvl(data.period_fyc, 0)) mnea_period_fyc,
                            sum(nvl(data.period_fyp, 0)) mnea_period_fyp
                        from ams.inp_data_outlet_tmp data
                        where data.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                            and data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                            and data.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                            and data.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                            --phai la nhom truc tiep thuoc ban
                            and data.unit_ams_id is null
                            and data.agency_ams_id is not null
                            --FYC va FYP KHONG tinh truong ban tuc nhom truc tiep cua ban thi KHONG tinh truong ban khi cong tong vao
                            and data.position_code not in  (
                                  AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
                              )
                        group by data.agency_ams_id
                    ) upd
                on (
                    trunc(valRecordDate, 'MM') = comp.record_date
                    and
                    AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.mnea_be_executing
                    and--cap nhat vao truong chi tiet o phia tren
                    AMS_MODL_COMP_MMXIII.BE_PAID_DTL = comp.mnea_be_paid
                    and--chi lay du lieu chi tiet o thang day
                    add_months(trunc(valRecordDate, 'MM'), -i) = comp.mnea_data_date
                    and --chi tinh truong ban -- AnhNH edit
                    comp.position_code in  (
                                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
                            )
                    and--lay o nhom day da co
                    upd.mnea_branch_ams_id = comp.mnea_branch_ams_id
                )
                when matched then
                    update
                        set
                            comp.mnea_period_fyp = upd.mnea_period_fyp,
                            comp.mnea_period_fyc = upd.mnea_period_fyc;
                commit;

                ams.life_agency_log.time_end;
                ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_data', 'merge cho truong ban FYP FYC  thang  ' || to_char(var_rec_date, 'dd/mm/yyyy'));
                ams.life_agency_log.time_stop;
                ams.life_agency_log.time_begin;
                var_error_pos  := 5;

                /*Cap nhat neu ma FYP cua nhom trong thang >=100 trieu thi moi duoc tinh = 1*/
                update ams.la_comp_mmxiii_mnea mnea
                set
                    mnea.mnea_period_asmt = 1
                where mnea.record_date = trunc(valRecordDate, 'MM')
                    and mnea.mnea_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and mnea.mnea_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_DTL
                    and mnea.mnea_data_date = add_months(trunc(valRecordDate, 'MM'), -i)
                    and nvl(mnea.mnea_period_fyp, 0) >= 100000000;--lon hon 100 tr thi se dat duoc yeu cau
                commit;

                ams.life_agency_log.time_end;
                ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_data', 'Cap nhat neu ma FYP cua nhom trong thang >=100 trieu thi moi duoc tinh = 1  thang  ' || to_char(var_rec_date, 'dd/mm/yyyy'));
                ams.life_agency_log.time_stop;
                ams.life_agency_log.time_begin;
                var_error_pos  := 6;

                merge /*+ CARDINALITY(mnea, 100)*/
                    into ams.la_comp_mmxiii_mnea mnea
                using
                    (
                        select /*+ CARDINALITY(tmp, 100)*/
                            tmp.mnea_outlet_ams_id outlet_ams_id,
                            sum(nvl(tmp.mnea_period_asmt, 0)) mnea_period_na_qty
                        from ams.la_comp_mmxiii_mnea_na tmp
                        where tmp.record_date = trunc(valRecordDate, 'YYYY') --lay theo nam nhu the nay
                            --chi lay o thang ma co so lieu no dat duoc tieu chuan 90 ngay
                            and tmp.mnea_data_date = add_months(trunc(valRecordDate, 'MM'), -i)
                            --chi lay cac truong nhom cho no de tinh va truong ban de duoc tinh nhu vay
                            and tmp.mnea_position_code in
                            (
                                    AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02,
                                    AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV03,
                                    AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
                            )
                            and nvl(tmp.mnea_period_asmt, 0) = 1 --phai dat duoc tieu chuan DL moi
                        group by tmp.mnea_outlet_ams_id
                    ) upd
                on (
                    trunc(valRecordDate, 'MM') = mnea.record_date
                    and
                    AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnea.mnea_be_executing
                    and--cap nhat vao truong chi tiet o phia tren
                    AMS_MODL_COMP_MMXIII.BE_PAID_DTL = mnea.mnea_be_paid
                    and--chi lay du lieu chi tiet o thang day
                    add_months(trunc(valRecordDate, 'MM'), -i) = mnea.mnea_data_date
                    and
                    upd.outlet_ams_id = mnea.outlet_ams_id
                )
                when matched then
                    update
                        set
                            mnea.mnea_period_na_qty = upd.mnea_period_na_qty;
                commit;
                ams.life_agency_log.time_end;
                ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_data', 'Cap nhat so luong tuyen moi tung thang thang  ' || to_char(var_rec_date, 'dd/mm/yyyy'));
            end if;
        end loop;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_data', '  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  :=6;

        /*Sau khi da lay du lieu cac thang chi tiet thi se do len cac ban ghi co BE_PAID_YES
        cac thang DAT FYP >=100 trieu va dem so luong cac thang cung tong FYC len de tinh thuong*/

        /*Merge so lieu chi tiet cua tung thang vao phan tong hop cho dai ly*/
        merge /*+ CARDINALITY(comp, 100)*/
            into ams.la_comp_mmxiii_mnea comp
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_ams_id, --lay ca FYP cho no o day
                    sum(nvl(data.mnea_period_fyc, 0)) mnea_period_fyc,
                    nvl(count(*), 0) mnea_period_month_qty --so thang dat FYP >= 100 tr
                from ams.la_comp_mmxiii_mnea data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.mnea_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    --layo cac dong chi tiet len
                    and data.mnea_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_DTL
                    and data.mnea_period_asmt = 1 --chi lay len cac thang ma co FYP >=100 tr de tinh thuong cho no
                group by data.outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.mnea_be_executing
            and--cap nhat vao truong tong hop de lay cac so lieu can thiet vao
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = comp.mnea_be_paid
            and--lay theo ma dai ly
            upd.outlet_ams_id = comp.outlet_ams_id
        )
        when matched then
            update
                set
                    comp.mnea_period_fyc = upd.mnea_period_fyc,
                    comp.mnea_period_month_qty = upd.mnea_period_month_qty;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_data', 'Merge so lieu chi tiet cua tung thang vao  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_mnea_data: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_mnea_cond(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        /*Cap nhat Neu khong tuyen duoc 6 dai ly moi KHONG PHAI THUAN
        thi se khong duoc nhan thuong quan ly hoat dong hieu qua o day*/
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Tinh thu lao tong hop toi dai ly*/
        update ams.la_comp_mmxiii_mnea mnea
        set
            mnea.mnea_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_NO
        where mnea.record_date = trunc(valRecordDate, 'MM')
            and mnea.mnea_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and mnea.mnea_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            /*Neu tuyen it hon 6 nguoi thi se khong duoc thuong gi ca*/
            and nvl(mnea.mnea_period_na_qty, 0) < 6;
        commit;

        /* Cap nhat Ty le duoc huong theo so thang dat FYP >= 100tr*/
        merge /*+ CARDINALITY(mnea, 100)*/
            into ams.la_comp_mmxiii_mnea mnea
        using
            (
                select
                    4 qty_from,
                    7 qty_to,
                    4 comp_ratio
                from dual
                union
                select
                    7 qty_from,
                    10 qty_to,
                    5 comp_ratio
                from dual
                union
                select
                    10 qty_from,
                    13 qty_to,
                    6 comp_ratio
                from dual
            ) upd
        on (
            trunc(valRecordDate, 'MM') = mnea.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnea.mnea_be_executing
            and--cap nhat vao truong tong hop de lay cac so lieu can thiet vao
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = mnea.mnea_be_paid
            and
            nvl(mnea.mnea_period_month_qty, 0) >= upd.qty_from
            and
            nvl(mnea.mnea_period_month_qty, 0)< upd.qty_to
            )
        when matched then
            update
                set
                    mnea.mnea_comp_ratio = upd.comp_ratio;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_cond', 'Cap nhat Ty le duoc huong theo so thang dat FYP >= 100tr  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_mnea_cond: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_mnea_comp(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Cap nhap ty le huong chi tiet toi tung thang*/
        merge /*+ CARDINALITY(mnea, 100)*/
            into ams.la_comp_mmxiii_mnea mnea
        using
            (
                select /*+ CARDINALITY(comp, 100)*/
                    comp.outlet_ams_id,
                    nvl(max(comp.mnea_comp_ratio), 0) mnea_comp_ratio
                from ams.la_comp_mmxiii_mnea comp
                where comp.record_date = trunc(valRecordDate, 'MM')
                    and comp.mnea_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and comp.mnea_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                group by comp.outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = mnea.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnea.mnea_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_DTL = mnea.mnea_be_paid
            and
            upd.outlet_ams_id = mnea.outlet_ams_id
        )
        when matched then
            update
                set
                    mnea.mnea_comp_ratio = upd.mnea_comp_ratio;
        commit;

        /* Tinh thu lao chi tiet toi dai ly BE_PAID_DTL*/
        update ams.la_comp_mmxiii_mnea mnea
        set
            mnea.mnea_comp_money = nvl(mnea.mnea_period_fyc, 0) * nvl(mnea.mnea_comp_ratio, 0) / 100
        where mnea.record_date = trunc(valRecordDate, 'MM')
            and mnea.mnea_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and mnea.mnea_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_DTL;
        commit;

        /* Tinh thu lao tong hop toi dai ly*/
        update ams.la_comp_mmxiii_mnea mnea
        set
            mnea.mnea_comp_money = nvl(mnea.mnea_period_fyc, 0) * nvl(mnea.mnea_comp_ratio, 0) / 100
        where mnea.record_date = trunc(valRecordDate, 'MM')
            and mnea.mnea_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and mnea.mnea_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_comp', 'Cap nhap ty le huong chi tiet toi tung thang  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_mnea_comp: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_mnea_close(valRecordDate date := null)
    is
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Ket thuc qua trinh tinh thu lao quy dai ly
           trong bang la_comp_mmxiii_mnea*/
        update ams.la_comp_mmxiii_mnea mnea
        set
            mnea.mnea_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO
        where mnea.record_date = trunc(valRecordDate, 'MM')
            and mnea.mnea_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES;
        commit;

        /* Ket thuc qua trinh tinh thu lao quy dai ly
           trong bang la_comp_mmxiii_mnea_detail*/
        update ams.la_comp_mmxiii_mnea_na mnea
        set
            mnea.mnea_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO
        where mnea.record_date = trunc(valRecordDate, 'MM')
            and mnea.mnea_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_close', 'Ket thuc qua trinh tinh thu lao thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    end;


    /*
      Creater: Le Khac Chinh
      Date Create:
      Version: 1.0

      Update:
      Version: 1.1
      Nguoi thay doi: Vu Duc Thong
      Ngay thay doi: 11/07/2013
      Noi dung: Thay doi FYP cua ban.
                FYP cua ban ko lay FYP cua cac nhom tu cap 2 tro len
    */
    /*Thuong quan ly hoat dong hieu qua*/
    procedure mmxiii_modl_mnea_am(valRecordDate date := null)
    is
    begin
        if (
            AMS_CORE_MODULE.is_active(
                AMS_MODL_COMP_MMXIII.MMXIII_COMP_MNEA_AM,
                trunc(valRecordDate, 'MM')
            ) = AMS_CORE_MODULE.IS_YES
        ) then
            for var_result in (
                select comp_date.compensation_date
                from ams.mod_comp_date comp_date
                where comp_date.module_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_COMP
                    and comp_date.sub_code = AMS_MODL_COMP_MMXIII.MMXIII_COMP_MNEA_AM
                    and comp_date.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                    and comp_date.compensation_date = trunc(valRecordDate, 'MM')
                group by comp_date.compensation_date
            ) loop
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnea_am_open(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnea_am_data(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnea_am_cond(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnea_am_comp(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnea_am_close(valRecordDate);
            end loop;
        end if;
    end;

    procedure mmxiii_modl_mnea_am_open(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
        var_months number(10) :=0;
        var_RecordDate date := valRecordDate;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        if valRecordDate > AMS_MODL_COMP_MMXIII.COMP_DATE_MMXIII_END then
           var_RecordDate := AMS_MODL_COMP_MMXIII.COMP_DATE_MMXIII_END;
        end if;

        var_months := months_between(trunc(var_RecordDate, 'MM'),trunc(var_RecordDate, 'YYYY'));
        /* Len danh sach du lieu chi tiet can xoa*/
        merge /*+ CARDINALITY(comp, 100)*/
            into ams.la_comp_mmxiii_mnea_am mnea
        using
            (
                select /*+ CARDINALITY(comp, 100)*/
                    comp.info_company_id company_id
                from ams.la_compensation_mmxiii_tmp comp
                where comp.record_date = trunc(var_RecordDate, 'MM')
                    and comp.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
               group by comp.info_company_id
            ) upd
        on (
            trunc(var_RecordDate, 'MM') = mnea.record_date
            and
            upd.company_id = mnea.company_id
        )
        when matched then
            update
                set
                    mnea.mnea_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_DEL;
        commit;

        /* Xoa du lieu chi tiet*/
        loop
            delete ams.la_comp_mmxiii_mnea_am mnea
            where mnea.record_date = trunc(var_RecordDate, 'MM')
                and mnea.mnea_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_DEL
                and rownum < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_am_open', 'Len danh sach du lieu chi tiet can xoa  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 1;

        /*Do du lieu cho bang chinh truoc de tu danh sach cac nhom day se do vao bang con va lay ra
        cac dai ly thuoc bang con day cho de dang hon*/
        /*Do du lieu truong nhom truoc*/
        insert /*+ APPEND */ into ams.la_comp_mmxiii_mnea_am nologging(
            outlet_id,
            outlet_ams_id,
            record_date,
            version_date,
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
            effective_date,
            terminative_date,
            position_code,
            position_date,
            mnea_be_paid,
            mnea_be_executing,
            mnea_period_fyp,
            mnea_eaum_money,
            mnea_comp_ratio,
            mnea_comp_money,
            create_user,
            update_user,
            create_datetime,
            update_datetime
        )
        select /*+ CARDINALITY(outl, 100) */
            outl.outlet_id,
            outl.outlet_ams_id,
            trunc(var_RecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            outl.info_outlet_name,
            outl.info_company_id,
            outl.info_company_ams_id,
            outl.info_company_name,
            outl.info_office_id,
            outl.info_office_ams_id,
            outl.info_office_name,
            outl.info_agency_id,
            outl.info_agency_ams_id,
            outl.info_agency_name,
            outl.info_effective_date,
            outl.info_terminative_date,
            outl.info_position_code,
            outl.info_position_date,
            AMS_MODL_COMP_MMXIII.BE_PAID_YES,
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
            0,
            0,
            0,
            0,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.la_compensation_mmxiii_tmp outl
        where outl.record_date = trunc(var_RecordDate, 'MM')
            and outl.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and outl.status_code = AMS_MODL_COMP_MMXIII.STATUS_CURR
            and outl.info_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04--cho lay truong ban vao
            --chinhlk 28/11/2013 them doan code nay de chi tinh con duy tri chuc vu truong ban tai thoi diem 1/1/2014
            and ams.AMS_DATA_OUTLET.get_regency_code(outl.outlet_ams_id,
                                        add_months(trunc(valRecordDate, 'YYYY'), 12))  = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_am_open', 'Do du lieu cho bang chinh truoc thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 1;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_am_open', 'Len danh sach du lieu chi tiet can xoa  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 1;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_am_open', 'Xoa du lieu chi tiet thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 1;

        /* Len danh sach du lieu chi tiet can xoa*/
        merge /*+ CARDINALITY(comp, 100)*/
            into ams.la_comp_mmxiii_mnea_am_detail detail
        using
            (
                select /*+ CARDINALITY(comp, 100)*/
                    comp.info_company_id company_id
                from ams.la_compensation_mmxiii_tmp comp
                where comp.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                group by comp.info_company_id
            ) upd
        on (

            upd.company_id = detail.company_id
        )
        when matched then
            update
                set
                    detail.mnea_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_DEL;
        commit;

        /* Xoa du lieu chi tiet*/
        loop
            delete ams.la_comp_mmxiii_mnea_am_detail detail
            where detail.mnea_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_DEL
                and rownum < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        /* Du lieu phat trien ban chi tiet*/
        for i in 0..var_months
        loop
        insert /*+ APPEND */ into ams.la_comp_mmxiii_mnea_am_detail nologging(
            outlet_id,
            outlet_ams_id,
            record_date,
            version_date,
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
            effective_date,
            terminative_date,
            position_code,
            position_date,
            mnea_be_paid,
            mnea_be_executing,
            mnea_period_fyp,
            mnea_period_fyp_calc,
            mnea_unit_level,
            create_user,
            update_user,
            create_datetime,
            update_datetime)
        select /*+  CARDINALITY(key, 100)  CARDINALITY(outl, 100)*/
            outl.outlet_id,
            outl.outlet_ams_id,
              add_months(trunc(var_RecordDate, 'MM'), - i),
            trunc(sysdate, 'DD'),
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
            outl.effective_date,
            outl.terminative_date,
            outl.position_code,
            outl.position_date,
            AMS_MODL_COMP_MMXIII.BE_PAID_YES,
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
            0,
            0,
            1,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            select /*+ CARDINALITY(outl, 100) */
                outl.outlet_id,
                outl.outlet_ams_id,
                outl.info_agency_id,
                outl.info_agency_ams_id agency_ams_id
            from ams.la_compensation_mmxiii_tmp outl
            where outl.record_date = trunc(var_RecordDate, 'MM')
                and outl.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                and outl.status_code = AMS_MODL_COMP_MMXIII.STATUS_CURR
                and outl.info_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
        ) key
        join
        (
            select /*+ CARDINALITY(tmp, 100)*/
                tmp.outlet_id,
                tmp.outlet_ams_id,
                tmp.outlet_name,
                tmp.company_id,
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
                tmp.effective_date,
                tmp.terminative_date,
                tmp.position_code,
                tmp.position_date
            from ams.inp_data_outlet_tmp tmp
              where tmp.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                  --and tmp.record_date = trunc(valRecordDate, 'MM')
                  and tmp.record_date = add_months(trunc(var_RecordDate, 'MM'), -i)
                  and tmp.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                  and tmp.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                  and trunc(tmp.effective_date, 'MM') <= add_months(trunc(valRecordDate, 'MM'), -i)
                and tmp.agency_ams_id is not null
        ) outl
            on outl.agency_ams_id = key.agency_ams_id;
        commit;
         end loop;


        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_am_open', ' Do du lieu truong ban truoc thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_mnea_am_open: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_mnea_am_data(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
        var_months number(10) := 0;
        var_RecordDate date := valRecordDate;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        if valRecordDate > AMS_MODL_COMP_MMXIII.COMP_DATE_MMXIII_END then
           var_RecordDate := AMS_MODL_COMP_MMXIII.COMP_DATE_MMXIII_END;
        end if;

        var_months := months_between(trunc(var_RecordDate, 'MM'),trunc(var_RecordDate, 'YYYY'));
        /*Cap nhat FYP */
        for i in 0..var_months
        loop
          merge /*+ CARDINALITY(mnea, 100)*/
              into ams.la_comp_mmxiii_mnea_am_detail mnea
          using
              (
                  /*ThongVD sua lai lay FYP cua dai ly*/
                  select /*+ CARDINALITY(data, 100)*/
                      data.outlet_ams_id,
                      data.record_date,
                      nvl(data.period_fyp, 0) period_fyp
                  from ams.inp_data_outlet_tmp data
                  where data.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                      and data.record_date = add_months(trunc(var_RecordDate, 'MM'), -i)
                      and data.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                      and data.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
              ) upd
          on (
              AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnea.mnea_be_executing
              and
              AMS_MODL_COMP_MMXIII.BE_PAID_YES = mnea.mnea_be_paid
              and
              upd.outlet_ams_id = mnea.outlet_ams_id
              and
              upd.record_date = mnea.record_date
          )
          when matched then
              update
                  set
                      mnea.mnea_period_fyp = upd.period_fyp,
                      mnea.mnea_period_fyp_calc = upd.period_fyp;
          commit;
        end loop;

        /*Cap nhat cap cua nhom*/
        /*ThongVD cap nhat lai cap cua cac nhom*/
        for i in 0..var_months
        loop
          merge  /*+ CARDINALITY(mnbs, 100)
                  CARDINALITY(upd, 100)
                  LEADING(mnbs upd) */
              into ams.la_comp_mmxiii_mnea_am_detail mnea
          using
              (
                  select /*+ CARDINALITY(tmp, 100)*/
                      tmp.unit_ams_id,
                      tmp.record_date,
                      nvl(tmp.umnm_unit_level, 0) mnea_unit_level
                  from ams.la_comp_mmxiii_unit_des_source tmp
                  where tmp.record_date = add_months(trunc(var_RecordDate, 'MM'), -i)
              ) upd
          on (
              AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnea.mnea_be_executing
              and
              AMS_MODL_COMP_MMXIII.BE_PAID_YES = mnea.mnea_be_paid
              and
              mnea.unit_ams_id is not null
              and
              upd.unit_ams_id = mnea.unit_ams_id
              and
              upd.record_date = mnea.record_date
              )
          when matched then
              update
                  set
                      mnea.mnea_unit_level = upd.mnea_unit_level;
          commit;
        end loop;

        /*Cap nhat FYP cua cac nhom neu la cap 2 tro len*/
        update ams.la_comp_mmxiii_mnea_am_detail mnea
        set
            mnea.mnea_period_fyp_calc = 0
        where mnea.record_date between trunc(var_RecordDate, 'YYYY')
                               and trunc(var_RecordDate, 'MM')
            and mnea.mnea_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and mnea.mnea_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and mnea.mnea_unit_level >= 2
            and mnea.unit_ams_id is not null;
        commit;

        /*Cap nhat FYP cua Truong ban*/
        update ams.la_comp_mmxiii_mnea_am_detail mnea
        set
            mnea.mnea_period_fyp_calc = 0
        where mnea.record_date between trunc(var_RecordDate, 'YYYY')
                               and trunc(var_RecordDate, 'MM')
            and mnea.mnea_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and mnea.mnea_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and mnea.position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04;
        commit;

        /*Lay du lieu tu bang chi tiet sau khi da tinh toan xong duoc FYP*/
        merge /*+ CARDINALITY(mnea, 100)*/
            into ams.la_comp_mmxiii_mnea_am mnea
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.agency_ams_id,
                    sum(nvl(data.mnea_period_fyp_calc, 0)) period_fyp
                from ams.la_comp_mmxiii_mnea_am_detail data
                where data.record_date
                        between trunc(var_RecordDate, 'YYYY')
                        and trunc(var_RecordDate, 'MM')
                    and data.agency_ams_id is not null
                group by data.agency_ams_id
            ) upd
        on (
            trunc(var_RecordDate, 'MM') = mnea.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnea.mnea_be_executing
            and
            upd.agency_ams_id = mnea.agency_ams_id
        )
        when matched then
            update
                set
                    mnea.mnea_period_fyp = upd.period_fyp;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_am_data', 'Lay FYP Khong tinh truong ban cua ca ban trong nam 2013 ke tu 1/1/2013 cho den thang chay  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 1;

        --lay du lieu ve thuong quan ly hoat dong hieu qua va nhom theo ban cua cac truong nhom
        merge /*+ CARDINALITY(mnna, 100)*/
            into ams.la_comp_mmxiii_mnea_am mnea
        using
            (
                select  /*+ CARDINALITY(mnna, 100)*/
                    mnea.agency_ams_id,
                    sum(nvl(mnea.mnea_comp_money, 0)) mnea_comp_money
                from ams.la_comp_mmxiii_mnea mnea
                where mnea.record_date = trunc(var_RecordDate, 'MM')
                    and mnea.mnea_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                    and mnea.agency_ams_id is not null
                    --chinhlk 28/11/2013 them dieu kien: khong tinh cua truong ban la truong nhom truc tiep
                    and mnea.unit_ams_id is not null
                group by mnea.agency_ams_id
            ) upd
        on (
            trunc(var_RecordDate, 'MM') = mnea.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnea.mnea_be_executing
            and
            upd.agency_ams_id = mnea.agency_ams_id
        )
        when matched then
            update
                set
                    mnea.mnea_eaum_money = upd.mnea_comp_money;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_am_data', 'lay du lieu ve thuong quan ly hoat dong hieu qua va nhom theo ban cua cac truong nhom da co san roi  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_mnea_am_data: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_mnea_am_cond(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
        var_RecordDate date := valRecordDate;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        if valRecordDate > AMS_MODL_COMP_MMXIII.COMP_DATE_MMXIII_END then
           var_RecordDate := AMS_MODL_COMP_MMXIII.COMP_DATE_MMXIII_END;
        end if;
        /*Cap nhat Neu khong dat 3 ty FYP ca nam
        thi se khong duoc nhan thuong quan ly hoat dong hieu qua o day*/

        /* Tinh thu lao tong hop toi dai ly*/
        update ams.la_comp_mmxiii_mnea_am mnea
        set
            mnea.mnea_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_NO
        where mnea.record_date = trunc(var_RecordDate, 'MM')
            and mnea.mnea_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and mnea.mnea_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            /*Neu khong dat 3 ty FYP thi se khong duoc thuong gi ca*/
            and nvl(mnea.mnea_period_fyp, 0) < 3000000000;
        commit;
        /*Cap nhat ty le thuong la 50%*/
        update ams.la_comp_mmxiii_mnea_am mnea
        set
            mnea.mnea_comp_ratio = 50
        where mnea.record_date = trunc(var_RecordDate, 'MM')
            and mnea.mnea_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and mnea.mnea_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_am_cond', 'Cap nhat Neu khong dat 3 ty FYP ca nam..  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_mnea_am_cond: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_mnea_am_comp(valRecordDate date := null)
    is
        var_RecordDate date := valRecordDate;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        if valRecordDate > AMS_MODL_COMP_MMXIII.COMP_DATE_MMXIII_END then
           var_RecordDate := AMS_MODL_COMP_MMXIII.COMP_DATE_MMXIII_END;
        end if;

        update ams.la_comp_mmxiii_mnea_am mnea
        set
            mnea.mnea_comp_money = nvl(mnea.mnea_eaum_money, 0) * nvl(mnea.mnea_comp_ratio, 0) / 100
        where mnea.record_date = trunc(var_RecordDate, 'MM')
            and mnea.mnea_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and mnea.mnea_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_am_comp', 'mmxiii_modl_mnea_am_comp  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    end;

    procedure mmxiii_modl_mnea_am_close(valRecordDate date := null)
    is
        var_RecordDate date := valRecordDate;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        if valRecordDate > AMS_MODL_COMP_MMXIII.COMP_DATE_MMXIII_END then
           var_RecordDate := AMS_MODL_COMP_MMXIII.COMP_DATE_MMXIII_END;
        end if;
        /* Ket thuc qua trinh tinh thu lao quy dai ly
           trong bang la_comp_mmxiii_mnea_am*/
        update ams.la_comp_mmxiii_mnea_am mnea
        set
            mnea.mnea_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO
        where mnea.record_date = trunc(var_RecordDate, 'MM')
            and mnea.mnea_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES;
        commit;

        update ams.la_comp_mmxiii_mnea_am_detail mnea
        set
            mnea.mnea_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO
        where mnea.record_date between trunc(var_RecordDate, 'YYYY')
                               and trunc(var_RecordDate, 'MM')
            and mnea.mnea_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnea_close', 'Ket thuc qua trinh tinh thu lao dai ly thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    end;

    /*Thuong gioi thieu dai ly moi cho chay sau khi chay thuong quan ly hoat dong hieu qua vi se khong pahi chay lai du lieu*/
    procedure mmxiii_modl_agin(valRecordDate date := null)
    is
    begin
        if (
            AMS_CORE_MODULE.is_active(
                AMS_MODL_COMP_MMXIII.MMXIII_COMP_AGIN,
                trunc(valRecordDate, 'MM')
            ) = AMS_CORE_MODULE.IS_YES
        ) then
            for var_result in (
                select comp_date.compensation_date
                from ams.mod_comp_date comp_date
                where comp_date.module_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_COMP
                    and comp_date.sub_code = AMS_MODL_COMP_MMXIII.MMXIII_COMP_AGIN
                    and comp_date.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                    and comp_date.compensation_date = trunc(valRecordDate, 'MM')
                group by comp_date.compensation_date
            ) loop
                AMS_MODL_COMP_MMXIII.mmxiii_modl_agin_open(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_agin_data(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_agin_comp(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_agin_close(valRecordDate);
            end loop;
        end if;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 1/2/2013
        Version: 1.0
        Description: Thu tuc tinh toan cac chi tieu cho thuong gioi thieu dai ly moi
        Parameter:
            valRecordDate [date]: Thang chay
        Update:  Le Khac Chinh
            Version: 1.1
            Date Updated: 19/7/2013
            Note:  Fix lai chuong trinh theo yeu cau: 109988 cua BA va SME
            Cap nhat chinh xac thang lay du lieu chinh xac cua danh sach cac Tu van vien thanh cong
    */
    procedure mmxiii_modl_agin_open(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
        var_position_qty number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        --chi do vao thang nay danh sach cac dai ly moi ma duoc tinh thuong cho no thoi
        --Neu khong thi se khong do vao cho no
        --Va se phai do vao thang sau cho no
        /*Sau khi da tinh toan roi thi se delete so lieu o bang la_comp_mmxiii_agin di
        o quy tinh toan day
        sau do do lai so lieu cua quy day tu bang la_comp_mmxiii_agin_na
        cua quy do
        Roi sau do moi nhap vao ai la nguoi tuyen dung dai ly do
        chuc vu khi tuyen dung la gi de tinh toan cho dung cac so lieu o day*/

        /* Len danh sach du lieu chi tiet can xoa*/
        merge /*+ CARDINALITY(agin, 100)*/
            into ams.la_comp_mmxiii_agin agin
        using
            (   /*chay theo cong ty o cho nay va cap nhat theo cong ty*/
                select /*+ CARDINALITY(comp, 100)*/
                    comp.info_company_id company_id
                from ams.la_compensation_mmxiii_tmp comp
                where comp.record_date = trunc(valRecordDate, 'MM')
                    and comp.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
               group by comp.info_company_id
            ) upd
            on (
                trunc(valRecordDate, 'MM') = agin.record_date
                and
                upd.company_id = agin.company_id
            )
        when matched then
            update
                set
                    agin.agin_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_DEL;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agin_open', ' Len danh sach du lieu chi tiet can xoa  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 1;

        /* Xoa du lieu chi tiet theo cong ty hay toan bo cac cong ty o phia tren*/
        loop
            delete ams.la_comp_mmxiii_agin del
            where del.record_date = trunc(valRecordDate, 'MM')
                and del.agin_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_DEL
                and rownum < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agin_open', 'Xoa du lieu chi tiet  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 2;

        /*Sau do thi se do so lieu vao tu bang la_comp_mmxiii_agin_na
        voi cac dai ly ma co ngay ket thuc 90 ngay lam viec dau tien la trong quy chua thang do*/
        /*Do danh sach cac dai ly duoc tuyen moi vao bang la_comp_mmxiii_agin_na
        de tinh trong 90 ngay lam viec dau tien thi duoc bao nhieu IP*/
        insert /*+ APPEND */ into ams.la_comp_mmxiii_agin nologging
        select  /*+
                   CARDINALITY(comp, 100)
                   CARDINALITY(key, 100)
                   */
            key.outlet_id,
            key.outlet_ams_id,
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            key.outlet_name,
            key.company_id,
            key.company_ams_id,
            key.company_name,
            key.office_id,
            key.office_ams_id,
            key.office_name,
            key.agency_id,
            key.agency_ams_id,
            key.agency_name,
            key.unit_id,
            key.unit_ams_id,
            key.unit_name,
            key.effective_date,
            key.terminative_date,
            trim(key.position_code),
            key.position_date,
            AMS_MODL_COMP_MMXIII.BE_PAID_YES,
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
            null,--agin_outlet_id
            null,--agin_outlet_ams_id
            null,--agin_position_code
            key.agin_period_begin, --ngay bat dau tinh IP
            key.agin_period_end, --ngay ket thuc tinh IP
            key.agin_period_issue,
            key.agin_period_ip,
            null,--agin_comp_money
            null,--key.agin_asmt,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            select /*+ CARDINALITY(comp, 100)*/
                comp.info_company_id company_id
            from ams.la_compensation_mmxiii_tmp comp
            where comp.record_date = trunc(valRecordDate, 'MM')
                and comp.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
           group by comp.info_company_id
        ) comp
        join
        (
            select/*+ CARDINALITY(comp, 100)*/
                tmp.outlet_id,
                tmp.outlet_ams_id,
                tmp.outlet_name,
                tmp.company_id,
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
                tmp.effective_date,
                tmp.terminative_date,
                tmp.position_code,
                tmp.position_date,
                tmp.agin_period_begin, --ngay bat dau tinh IP
                tmp.agin_period_end, --ngay ket thuc tinh IP
                tmp.agin_period_issue,
                tmp.agin_period_ip
            from ams.la_comp_mmxiii_agin_na tmp
            --chi do vao thang nay danh sach cac dai ly moi ma duoc tinh thuong cho no thoi
            --Neu khong thi se khong do vao cho no
            --Va se phai do vao thang sau cho no
            where tmp.agin_quater_date = trunc(valRecordDate, 'MM')
            --can co dieu kien nay thi moi co the dung duoc
                and tmp.effective_date >= trunc(valRecordDate, 'YYYY')
        ) key
           on key.company_id = comp.company_id;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agin_open', ' Do danh sach cac dai ly duoc tuyen moi vao bang la_comp_mmxiii_agin_na thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 3;

        /*Cap nhat dai ly do la do dai ly nao tuyen vao*/
        merge/*+ CARDINALITY(o, 100)*/
            into ams.la_comp_mmxiii_agin o
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_id,
                    tmp.empl_id
                from ams.la_prom_history_agent_tmp tmp
                where tmp.record_date = trunc(valRecordDate, 'MM')
            ) upd
        on (
            trunc(valRecordDate, 'MM') = o.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = o.agin_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = o.agin_be_paid
            and
            upd.outlet_id = o.outlet_id
            )
        when matched then
            update
            set --cap nhat dai ly tuyen dung dai ly do vao
                o.agin_outlet_id = upd.empl_id;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agin_open', 'Cap nhat dai ly do la do dai ly nao tuyen vao  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 4;

        /* Ghi nhan outlet ams id cho truong nay
           o.agin_outlet_ams_id = upd.agin_outlet_ams_id;
        */
        merge /*+ CARDINALITY(o, 100)*/
            into ams.la_comp_mmxiii_agin o
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_client_id agin_outlet_id,
                    max(tmp.outlet_number) agin_outlet_ams_id
                from ods.outlet tmp
                group by tmp.outlet_client_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = o.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = o.agin_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = o.agin_be_paid
            and
            upd.agin_outlet_id = o.agin_outlet_id
            )
        when matched then
            update
                set
                    o.agin_outlet_ams_id = upd.agin_outlet_ams_id;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agin_open', 'Ghi nhan outlet ams id  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 5;

        --Du lieu chi cap nhat o dong IS PAID la dong tong hop thoi nhe
        --khong cap nhat o dong chi tiet
        /* Cap nhat chuc vu khi tuyen dai ly moi cua dai ly tuyen dai ly moi vao tai thang tuyen vao*/
        merge /*+ CARDINALITY(agin, 100)*/
            into ams.la_comp_mmxiii_agin agin
        using
            (
                select /*+ CARDINALITY(empl, 100)
                           CARDINALITY(outl, 100) */
                    empl.outlet_ams_id, --lay ra ma dai ly duoc tuyen vao thi moi dung o day duoc
                    outl.position_code agin_position_code --va ma chuc vu cua dai ly tuyen dai ly moi  vao
                from
                (  --lay ra danh sach cac dai ly duoc tuyen vao va ngay duoc tuyen vao tai tung thang
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_ams_id,
                        tmp.agin_outlet_ams_id,
                        tmp.effective_date
                    from ams.la_comp_mmxiii_agin tmp
                    where tmp.record_date = trunc(valRecordDate, 'MM')
                        and tmp.agin_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                        and tmp.agin_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                ) empl
                join
                ( --join voi danh sach cac tien truong nhom truong nhom truong ban tuyen cac dai ly tai tung thang
                    select /*+ CARDINALITY(data, 100)*/
                        data.outlet_ams_id agin_outlet_ams_id,
                        data.record_date,
                        data.position_code  --vi tri tai thang day
                    from ams.inp_data_outlet_tmp data
                    where data.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                        --chi can cap nhat trong vong 3 thang tro lai cua quy
                        and data.record_date--phai tinh cho ca nam o day thi moi co the lay duoc du lieu dung thoi gian dang chay
                            between add_months(trunc(valRecordDate, 'YYYY'), -3)
                            and trunc(valRecordDate, 'MM')
                        and data.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                        and data.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                ) outl
                    on
                    (
                        outl.agin_outlet_ams_id = empl.agin_outlet_ams_id
                        and--cho nay du lieu co the co rat nhieu dong nhung chi cai dong
                        --ma thang ma co ngay ky hop dong cua dai ly moi
                        --bang voi thang cua dai ly di tuyen dai ly moi do vao thi ra chi 1 dong
                        trunc(outl.record_date, 'MM') = trunc(empl.effective_date, 'MM') --lay ra ma chuc vu tai thang tuyen dai ly day
                    )
            ) upd
        on (
            trunc(valRecordDate, 'MM') = agin.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = agin.agin_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = agin.agin_be_paid
            and
            upd.outlet_ams_id = agin.outlet_ams_id
        )
        when matched then
            update
                set--lay ra nhu the nay moi dung
                    agin.agin_position_code = trim(upd.agin_position_code),
                    agin.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    agin.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agin_open', 'Ghi nhan outlet ams id  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 6;

        begin
            select /*+ CARDINALITY(tmp, 100)*/
                count(tmp.outlet_ams_id)
                into var_position_qty
            from ams.la_comp_mmxiii_agin tmp
            where tmp.record_date = trunc(valRecordDate, 'MM')
                and tmp.agin_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                and tmp.agin_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                and tmp.agin_position_code is null;
        exception
            when others then
                var_position_qty := -1;
                life_agency_log.write_log(-1000,
                    'mmxiii_modl_agin_open: loi du lieu ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' la_comp_mmxiii_agin o postion_code bi null can xem qua lai' ,
                    'Thong bao loi du lieu',
                    -1000);
        end;

        if nvl(var_position_qty, 0) > 0 then
                life_agency_log.write_log(-1000,
                    'mmxiii_modl_agin_open: Co mot so dai ly duoc tuyen boi cong ty' || to_char(valRecordDate, 'dd/mm/yyyy') || ' la_comp_mmxiii_agin o postion_code bi null can xem qua lai' ,
                    'Thong bao loi du lieu',
                    -1000);
        end if;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agin_open', 'Cap nhat chuc vu khi tuyen dai ly moi cua dai ly   thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 7;

        --Cap nhat = 1 neu la thoa man dieu kien la dai ly moi
        --va nguoi tuyen vao khong phai la tien truong nhom truong nhom
        --dong thoi phai co du lieu trong phan danh sach cac ung vien duoc quyen tuyen moi
        --da luu trong he thong o thoi gian truoc
/*        update ams.la_comp_mmxiii_agin tmp
        set tmp.agin_period_asmt = 1
        where tmp.agin_period_issue >= 2
            and tmp.agin_period_ip >= 15000000;
        commit;       */


        /* Cap nhat danh sach dai ly duoc nhan thuong*/
        /* Cap nhat tai danh sach TVV Thanh cong voi record_date cach do 3 thang*/
        merge /*+ CARDINALITY(o, 100)*/
            into ams.la_comp_mmxiii_agin o
        using
            (   /*Bang nay chi co cac dai ly co quyen tuyen thi moi cho vao bang nay thoi*/
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_ams_id,
                    min(tmp.right_from_date) right_from_date,
                    max(tmp.right_to_date) right_to_date
                from ams.la_employment_rights_2013 tmp
                --can phai lay du lieu o thang nay boi vi nhu the moi dung duoc
                --CHO NAY CAN PHAI CHINH LAI VI CO THE VAN KHONG THE CO QUYEN TUYEN DUNG
                where tmp.record_date = add_months(valRecordDate, -2)
                group by tmp.outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = o.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = o.agin_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = o.agin_be_paid
            and--Neu duoc quyen tuyen dung va thoa man cac dieu kien o phai duoi thi se duoc cong nhan va nhan tien
            upd.outlet_ams_id = o.agin_outlet_ams_id --chu y phai lay dai ly da tuyen dung dai ly do va dai ly do duoc xet thuong gioi thieu dai ly moi
            and
            o.agin_period_issue >= 2
            and
            o.agin_period_ip >= 15000000
            and
            trim(o.agin_position_code) in --chi khi tuyen la dai ly thi moi duoc nhan thuong con khong thi khong duoc nhan thuong
                (
                    AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV00,
                    AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV05
                )
            --chinhlk 26/3/2013 them dieu kien nua o day theo confirm anh Cuong
            --neu ma tuyen tu 1/1/2013 thi moi duoc tinh cho no con khong thi se khong duoc tinh cho no o day
            and --them dieu kien nay nua moi dung vi chi duoc tuyen tu 1/1/2013 tro di con truoc ngay do thi khong co quyn tuyen dung cho no
            o.effective_date >= trunc(valRecordDate, 'YYYY')
            and--them dieu kien nay tuc la no se duoc quyen tuyen dung tu ngay nao den ngay nao nhu the thi moi duoc tinh cho no
                 --de phong truong hop la no tuyen trong thoi gian sau thoi gian day thi van duoc tinh cho no
            o.effective_date between upd.right_from_date and upd.right_to_date
            )
        when matched then
            update
                set
                    o.agin_period_asmt = 1,
                    o.agin_period_money = 1000000;
        commit;

        /* Cap nhat danh sach dai ly duoc nhan thuong*/
        /* Cap nhat tai danh sach TVV Thanh cong voi record_date cach do 6 thang*/
        merge /*+ CARDINALITY(o, 100)*/
            into ams.la_comp_mmxiii_agin o
        using
            (   /*Bang nay chi co cac dai ly co quyen tuyen thi moi cho vao bang nay thoi*/
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_ams_id,
                    min(tmp.right_from_date) right_from_date,
                    max(tmp.right_to_date) right_to_date
                from ams.la_employment_rights_2013 tmp
                --can phai lay du lieu o thang nay boi vi nhu the moi dung duoc
                --CHO NAY CAN PHAI CHINH LAI VI CO THE VAN KHONG THE CO QUYEN TUYEN DUNG
                where tmp.record_date = add_months(valRecordDate, -5)
                group by tmp.outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = o.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = o.agin_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = o.agin_be_paid
            and--Neu duoc quyen tuyen dung va thoa man cac dieu kien o phai duoi thi se duoc cong nhan va nhan tien
            upd.outlet_ams_id = o.agin_outlet_ams_id --chu y phai lay dai ly da tuyen dung dai ly do va dai ly do duoc xet thuong gioi thieu dai ly moi
            and
            o.agin_period_issue >= 2
            and
            o.agin_period_ip >= 15000000
            and
            trim(o.agin_position_code) in --chi khi tuyen la dai ly thi moi duoc nhan thuong con khong thi khong duoc nhan thuong
                (
                    AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV00,
                    AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV05
                )
            --chinhlk 26/3/2013 them dieu kien nua o day theo confirm anh Cuong
            --neu ma tuyen tu 1/1/2013 thi moi duoc tinh cho no con khong thi se khong duoc tinh cho no o day
            and --them dieu kien nay nua moi dung vi chi duoc tuyen tu 1/1/2013 tro di con truoc ngay do thi khong co quyn tuyen dung cho no
            o.effective_date >= trunc(valRecordDate, 'YYYY')
            and--them dieu kien nay tuc la no se duoc quyen tuyen dung tu ngay nao den ngay nao nhu the thi moi duoc tinh cho no
                 --de phong truong hop la no tuyen trong thoi gian sau thoi gian day thi van duoc tinh cho no
            o.effective_date between upd.right_from_date and upd.right_to_date
            )
        when matched then
            update
                set
                    o.agin_period_asmt = 1,
                    o.agin_period_money = 1000000;
        commit;

        /* Cap nhat danh sach dai ly duoc nhan thuong*/
        /* Cap nhat tai danh sach TVV Thanh cong voi record_date cach do 9 thang*/
        merge /*+ CARDINALITY(o, 100)*/
            into ams.la_comp_mmxiii_agin o
        using
            (   /*Bang nay chi co cac dai ly co quyen tuyen thi moi cho vao bang nay thoi*/
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_ams_id,
                    min(tmp.right_from_date) right_from_date,
                    max(tmp.right_to_date) right_to_date
                from ams.la_employment_rights_2013 tmp
                --can phai lay du lieu o thang nay boi vi nhu the moi dung duoc
                --CHO NAY CAN PHAI CHINH LAI VI CO THE VAN KHONG THE CO QUYEN TUYEN DUNG
                where tmp.record_date = add_months(valRecordDate, -8)
                group by tmp.outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = o.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = o.agin_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = o.agin_be_paid
            and--Neu duoc quyen tuyen dung va thoa man cac dieu kien o phai duoi thi se duoc cong nhan va nhan tien
            upd.outlet_ams_id = o.agin_outlet_ams_id --chu y phai lay dai ly da tuyen dung dai ly do va dai ly do duoc xet thuong gioi thieu dai ly moi
            and
            o.agin_period_issue >= 2
            and
            o.agin_period_ip >= 15000000
            and
            trim(o.agin_position_code) in --chi khi tuyen la dai ly thi moi duoc nhan thuong con khong thi khong duoc nhan thuong
                (
                    AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV00,
                    AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV05
                )
            --chinhlk 26/3/2013 them dieu kien nua o day theo confirm anh Cuong
            --neu ma tuyen tu 1/1/2013 thi moi duoc tinh cho no con khong thi se khong duoc tinh cho no o day
            and --them dieu kien nay nua moi dung vi chi duoc tuyen tu 1/1/2013 tro di con truoc ngay do thi khong co quyn tuyen dung cho no
            o.effective_date >= trunc(valRecordDate, 'YYYY')
            and--them dieu kien nay tuc la no se duoc quyen tuyen dung tu ngay nao den ngay nao nhu the thi moi duoc tinh cho no
                 --de phong truong hop la no tuyen trong thoi gian sau thoi gian day thi van duoc tinh cho no
            o.effective_date between upd.right_from_date and upd.right_to_date
            )
        when matched then
            update
                set
                    o.agin_period_asmt = 1,
                    o.agin_period_money = 1000000;
        commit;

        /* Cap nhat danh sach dai ly duoc nhan thuong*/
        /* Cap nhat tai danh sach TVV Thanh cong voi record_date cach do 12 thang*/
        merge /*+ CARDINALITY(o, 100)*/
            into ams.la_comp_mmxiii_agin o
        using
            (   /*Bang nay chi co cac dai ly co quyen tuyen thi moi cho vao bang nay thoi*/
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_ams_id,
                    min(tmp.right_from_date) right_from_date,
                    max(tmp.right_to_date) right_to_date
                from ams.la_employment_rights_2013 tmp
                --can phai lay du lieu o thang nay boi vi nhu the moi dung duoc
                --CHO NAY CAN PHAI CHINH LAI VI CO THE VAN KHONG THE CO QUYEN TUYEN DUNG
                where tmp.record_date = add_months(valRecordDate, -11)
                group by tmp.outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = o.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = o.agin_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = o.agin_be_paid
            and--Neu duoc quyen tuyen dung va thoa man cac dieu kien o phai duoi thi se duoc cong nhan va nhan tien
            upd.outlet_ams_id = o.agin_outlet_ams_id --chu y phai lay dai ly da tuyen dung dai ly do va dai ly do duoc xet thuong gioi thieu dai ly moi
            and
            o.agin_period_issue >= 2
            and
            o.agin_period_ip >= 15000000
            and
            trim(o.agin_position_code) in --chi khi tuyen la dai ly thi moi duoc nhan thuong con khong thi khong duoc nhan thuong
                (
                    AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV00,
                    AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV05
                )
            --chinhlk 26/3/2013 them dieu kien nua o day theo confirm anh Cuong
            --neu ma tuyen tu 1/1/2013 thi moi duoc tinh cho no con khong thi se khong duoc tinh cho no o day
            and --them dieu kien nay nua moi dung vi chi duoc tuyen tu 1/1/2013 tro di con truoc ngay do thi khong co quyn tuyen dung cho no
            o.effective_date >= trunc(valRecordDate, 'YYYY')
            and--them dieu kien nay tuc la no se duoc quyen tuyen dung tu ngay nao den ngay nao nhu the thi moi duoc tinh cho no
                 --de phong truong hop la no tuyen trong thoi gian sau thoi gian day thi van duoc tinh cho no
            o.effective_date between upd.right_from_date and upd.right_to_date
            )
        when matched then
            update
                set
                    o.agin_period_asmt = 1,
                    o.agin_period_money = 1000000;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agin_open', 'Cap nhat danh sach dai ly duoc nhan thuong  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 8;

        /* Len danh sach Tu van vien tinh thu lao thuong Gioi thieu dai ly moi
        Neu lay tat ca ra nhu the nay la sai day nhe*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.agin_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_NO,
            comp.agin_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
            comp.agin_outlet_id = comp.outlet_id,
            comp.agin_outlet_ams_id = comp.outlet_ams_id,
            comp.agin_position_code = trim(comp.info_position_code),
            comp.agin_period_empl = 0,
            comp.agin_period_money = 0,
            comp.agin_comp_money = 0,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.status_code = AMS_MODL_COMP_MMXIII.STATUS_CURR;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agin_open', 'Len danh sach Tu van vien tinh thu lao thuong Gioi thieu dai ly moi thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));

    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_agin_open: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_agin_data(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /*Cap nhat thuong vao bang chinh*/
        merge /*+ CARDINALITY(comp, 100)*/
            into ams.la_compensation_mmxiii_tmp comp
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.agin_outlet_ams_id,
                    nvl(count(tmp.outlet_ams_id), 0) agin_period_empl,
                    sum(nvl(tmp.agin_period_money, 0)) agin_period_money
                from ams.la_comp_mmxiii_agin tmp
                where tmp.record_date = trunc(valRecordDate, 'MM')
                    and tmp.agin_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and tmp.agin_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                    and tmp.agin_period_asmt = 1
                group by tmp.agin_outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.agin_be_executing
            and
            upd.agin_outlet_ams_id = comp.agin_outlet_ams_id
            )
        when matched then
            update
                set
                    comp.agin_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES,
                    comp.agin_period_empl = upd.agin_period_empl,
                    comp.agin_period_money = upd.agin_period_money,
                    comp.agin_comp_money = upd.agin_period_money,
                    comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    comp.update_datetime = sysdate;
        commit;


        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agin_data', ' Cap nhat thuong vao bang chinh thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));

    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_agin_data: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_agin_comp(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* Chi duoc toi da 4 trieu*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.agin_comp_money = 4000000,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.agin_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and comp.agin_comp_money >= 4000000;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agin_comp', 'Chi duoc toi da 4 trieu  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_agin_comp: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_agin_close(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Ket thuc qua trinh tinh thu lao quy dai ly
           trong bang la_comp_mmxiii_agin*/
        update ams.la_comp_mmxiii_agin agin
        set
            agin.agin_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO
        where agin.record_date = trunc(valRecordDate, 'MM')
            and agin.agin_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agin_close', 'Ket thuc qua trinh la_comp_mmxiii_agqr thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* Ket thuc qua trinh tinh thu lao quy dai ly
           trong bang la_compensation_mmxiii_tmp*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.agin_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.agin_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agin_close', 'Ket thuc qua trinh tinh thu lao quy dai ly thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_agin_close: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;


    procedure mmxiii_modl_mnnu(valRecordDate date := null)
    is
    begin
        if (
            AMS_CORE_MODULE.is_active(
                AMS_MODL_COMP_MMXIII.MMXIII_COMP_MNNU,
                trunc(valRecordDate, 'MM')
            ) = AMS_CORE_MODULE.IS_YES
        ) then
            for var_result in (
                select comp_date.compensation_date
                from ams.mod_comp_date comp_date
                where comp_date.module_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_COMP
                    and comp_date.sub_code = AMS_MODL_COMP_MMXIII.MMXIII_COMP_MNNU
                    and comp_date.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                    and comp_date.compensation_date = trunc(valRecordDate, 'MM')
                group by comp_date.compensation_date
            ) loop
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnnu_open(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnnu_data(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnnu_cond(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnnu_comp(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnnu_close(valRecordDate);
            end loop;
        end if;
    end;

    procedure mmxiii_modl_mnnu_open(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Len danh sach Tu van vien tinh thu lao phat trien nhom moi*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.mnnu_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES,
            comp.mnnu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
            comp.mnnu_position_code = comp.info_position_code,
            comp.mnnu_outlet_id = comp.outlet_id,
            comp.mnnu_outlet_ams_id = comp.outlet_ams_id,
            comp.mnnu_buss_money = 0,
            comp.mnnu_comp_money = 0,
            comp.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.status_code = AMS_MODL_COMP_MMXIII.STATUS_CURR
            and comp.info_position_code in
            (
                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02,
                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
            );
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnnu_open', 'Len danh sach Tu van vien tinh thu lao phat trien nhom moi   thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 1;

        /* Len danh sach du lieu chi tiet can xoa*/
        merge /*+ CARDINALITY(mnnu, 100)*/
            into ams.la_comp_mmxiii_mnnu mnnu
        using
            (
                select /*+ CARDINALITY(comp, 100)*/
                    comp.info_company_id company_id
                from ams.la_compensation_mmxiii_tmp comp
                where comp.record_date = trunc(valRecordDate, 'MM')
                    and comp.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
               group by comp.info_company_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = mnnu.record_date
            and
            upd.company_id = mnnu.company_id
        )
        when matched then
            update
                set
                    mnnu.mnnu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_DEL;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnnu_open', 'Len danh sach du lieu chi tiet can xoa   thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 1;

        /* Xoa du lieu chi tiet*/
        loop
            delete ams.la_comp_mmxiii_mnnu mnnu
            where mnnu.record_date = trunc(valRecordDate, 'MM')
                and mnnu.mnnu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_DEL
                and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnnu_open', 'Xoa du lieu chi tiet   thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 3;

        /* Du lieu phat trien nhom chi tiet*/
        insert /*+ APPEND */ into ams.la_comp_mmxiii_mnnu nologging(
            branch_id,
            branch_ams_id,
            record_date,
            version_date,
            company_id,
            company_ams_id,
            company_name,
            unit_id,
            unit_ams_id,
            unit_name,
            effective_date,
            terminative_date,
            senr_by_months,
            mnnu_be_paid,
            mnnu_be_executing,
            mnnu_outlet_id,
            mnnu_outlet_ams_id,
            mnnu_buss_money,
            mnnu_comp_ratio,
            mnnu_comp_money,
            create_user,
            update_user,
            create_datetime,
            update_datetime)
        select /*+ CARDINALITY(comp, 100) CARDINALITY(bran, 100) CARDINALITY(unit, 100)*/
            bran.branch_id,
            unit.branch_ams_id,
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            comp.info_company_id,
            comp.info_company_ams_id,
            comp.info_company_name,
            unit.branch_id,
            unit.branch_ams_id,
            unit.branch_name,
            trunc(bran.effective_date, 'MM'),
            bran.terminative_date,
            months_between(add_months(trunc(valRecordDate, 'MM'), 1), trunc(bran.effective_date, 'MM')),
            AMS_MODL_COMP_MMXIII.BE_PAID_YES,
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
            comp.mnnu_outlet_id,
            comp.mnnu_outlet_ams_id,
            0,
            0,
            0,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            select /*+ CARDINALITY(tmp, 100) */
                tmp.mnnu_outlet_id,
                tmp.mnnu_outlet_ams_id,
                tmp.info_company_id,
                tmp.info_company_ams_id,
                tmp.info_company_name,
                tmp.mnnu_position_code
            from ams.la_compensation_mmxiii_tmp tmp
            where tmp.record_date = trunc(valRecordDate, 'MM')
                and tmp.mnnu_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                and tmp.mnnu_be_paid = LIFE_AGENCY_CODE.OUTLET_PAID_YES
        ) comp
        join
        (
            select /*+ CARDINALITY(tmp, 100) */
                tmp.branch_id,
                tmp.effective_date,
                tmp.terminative_date,
                tmp.outlet_development_id outlet_id
            from ams.la_branch_development tmp
            where tmp.decisive_date is not null
                and tmp.effective_date is not null
                --phat trien nhom trong nam 2013 thi moi tinh thuong phat trien nhom moi trong nam 2013
                and tmp.effective_date
                    between trunc(valRecordDate, 'YYYY')
                    and add_months(trunc(valRecordDate, 'YYYY'), 12) - 1
                and trunc(valRecordDate, 'MM') >= tmp.effective_date
                and trunc(valRecordDate, 'MM') < nvl(tmp.terminative_date, AMS_CORE_SYSTEM.DATE_MAX_VALUE)
        ) bran
            on bran.outlet_id = comp.mnnu_outlet_id
        join
        (
            select /*+ CARDINALITY(tmp, 100) */
                tmp.branch_id,
                tmp.branch_ams_id,
                tmp.branch_name
            from ams.serv_branch_mapping tmp
            where tmp.branch_type = 'NHOM'
                and tmp.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
        ) unit
            on unit.branch_id = bran.branch_id;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnnu_open', 'Du lieu phat trien nhom chi tiet  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));

    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_mnnu_open: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_mnnu_data(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Chi tiet phat trien kinh doanh trong thang
        chinlk 18/3/2013 sua lai de lay group by de phong phat trien nhom bi loi*/
        merge /*+ CARDINALITY(mnnu, 100)*/
            into ams.la_comp_mmxiii_mnnu mnnu
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.mnbs_branch_id branch_id,
                    data.mnbs_branch_ams_id branch_ams_id,
                    max(data.outlet_id) outlet_id,
                    max(data.outlet_ams_id) outlet_ams_id,
                    max(data.info_outlet_name) outlet_name,
                    sum(nvl(data.mnbs_comp_money, 0)) mnnu_buss_money
                from ams.la_compensation_mmxiii_tmp data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.mnbs_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO
                    and data.mnbs_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                group by
                    data.mnbs_branch_id,
                    data.mnbs_branch_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = mnnu.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnnu.mnnu_be_executing
            and
            upd.branch_id = mnnu.branch_id
        )
        when matched then
            update
                set
                    mnnu.outlet_id = upd.outlet_id,
                    mnnu.outlet_ams_id = upd.outlet_ams_id,
                    mnnu.branch_ams_id = upd.branch_ams_id,
                    mnnu.outlet_name = upd.outlet_name,
                    mnnu.mnnu_buss_money = upd.mnnu_buss_money,
                    mnnu.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                    mnnu.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnnu_data', 'Chi tiet phat trien kinh doanh trong thang   thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 1;

        merge /*+ CARDINALITY(comp, 100)*/
            into ams.la_compensation_mmxiii_tmp comp
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.mnnu_outlet_ams_id,
                    sum(nvl(data.mnnu_buss_money, 0)) mnnu_buss_money
                from ams.la_comp_mmxiii_mnnu data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.mnnu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and data.mnnu_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                group by data.mnnu_outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.mnnu_be_executing
            and
            upd.mnnu_outlet_ams_id = comp.mnnu_outlet_ams_id
        )
        when matched then
            update
                set
                    comp.mnnu_buss_money = upd.mnnu_buss_money,
                    comp.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                    comp.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnnu_data', 'Chi tiet phat trien kinh doanh trong thang 2   thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));

    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_mnnu_data: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_mnnu_cond(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
/*        \* Cac nhom tach ra trong tu 01-jan-2010 den 31-dec-2011*\
        merge \*+ CARDINALITY(mnnu, 100)*\
            into ams.la_comp_mmxiii_mnnu mnnu
        using
            (
                select
                    1 senr_from,
                    12 senr_to,
                    100 comp_ratio
                from dual
            ) upd
        on (
            trunc(valRecordDate, 'MM') = mnnu.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnnu.mnnu_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = mnnu.mnnu_be_paid
            and
            mnnu.effective_date
                between add_months(AMS_MODL_COMP_MMXIII.COMP_DATE_MMXII_BEGN, -24)
                and add_months(AMS_MODL_COMP_MMXIII.COMP_DATE_MMXII_BEGN, -1)
            and
            nvl(mnnu.senr_by_months, 0) >= upd.senr_from
            and
            nvl(mnnu.senr_by_months, 0) < upd.senr_to
            )
        when matched then
            update
                set
                    mnnu.mnnu_comp_ratio = upd.comp_ratio,
                    mnnu.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                    mnnu.update_datetime = sysdate;
        commit;
*/
        /* Cac nhom tach ra tu 01-jan-2012*/
        merge /*+ CARDINALITY(mnnu, 100)*/
            into ams.la_comp_mmxiii_mnnu mnnu
        using
            (
                select --12 thang dau thi nhan duoc 100% luon
                    1 senr_from,
                    13 senr_to,
                    100 comp_ratio
                from dual
            ) upd
        on (
            trunc(valRecordDate, 'MM') = mnnu.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnnu.mnnu_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = mnnu.mnnu_be_paid
            and--chi lay cac nhom duoc tach ra trong nam 2013 thi se tinh theo quy che nam 2013
            --neu chay o cho nay ma sai thi se bi sai mat day
            mnnu.effective_date >= trunc(valRecordDate, 'YYYY')
            and --Nho hon ngay 1/1/2014 la duoc roi
            mnnu.effective_date < add_months(trunc(valRecordDate, 'YYYY'), 12)
            and
            nvl(mnnu.senr_by_months, 0) >= upd.senr_from
            and
            nvl(mnnu.senr_by_months, 0) < upd.senr_to
            )
        when matched then
            update
                set
                    mnnu.mnnu_comp_ratio = upd.comp_ratio,
                    mnnu.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                    mnnu.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnnu_cond', 'Cac nhom tach ra tu 01-jan-2012   thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));

    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_mnnu_cond: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_mnnu_comp(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        update ams.la_comp_mmxiii_mnnu mnnu
        set
            mnnu.mnnu_comp_money = nvl(mnnu.mnnu_buss_money, 0) * nvl(mnnu.mnnu_comp_ratio, 0) / 100,
            mnnu.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
            mnnu.update_datetime = sysdate
        where mnnu.record_date = trunc(valRecordDate, 'MM')
            and mnnu.mnnu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and mnnu.mnnu_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnnu_comp', 'update   thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 1;

        merge /*+ CARDINALITY(comp, 100)*/
            into ams.la_compensation_mmxiii_tmp comp
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.mnnu_outlet_ams_id,
                    sum(nvl(data.mnnu_comp_money, 0)) mnnu_comp_money
                from ams.la_comp_mmxiii_mnnu data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.mnnu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and data.mnnu_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                group by data.mnnu_outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.mnnu_be_executing
            and
            upd.mnnu_outlet_ams_id = comp.mnnu_outlet_ams_id
        )
        when matched then
            update
                set
                    comp.mnnu_comp_money = upd.mnnu_comp_money,
                    comp.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                    comp.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnnu_comp', ' update 1  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));

    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_mnnu_comp: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_mnnu_close(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Ket thuc qua trinh tinh thu lao phat trien nhom moi
           trong bang la_comp_mmxiii_mnnu*/
        update ams.la_comp_mmxiii_mnnu mnnu
        set
            mnnu.mnnu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO,
            mnnu.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
            mnnu.update_datetime = sysdate
        where mnnu.record_date = trunc(valRecordDate, 'MM')
            and mnnu.mnnu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES;
        commit;

        /* Ket thuc qua trinh tinh thu lao phat trien nhom moi
           trong bang la_compensation_mmxiii_tmp*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.mnnu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO,
            comp.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.mnnu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnnu_close', 'Ket thuc    thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));

    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_mnnu_close: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_mnna(valRecordDate date := null)
    is
    begin
        if (
            AMS_CORE_MODULE.is_active(
                AMS_MODL_COMP_MMXIII.MMXIII_COMP_MNNA,
                trunc(valRecordDate, 'MM')
            ) = AMS_CORE_MODULE.IS_YES
        ) then
            for var_result in (
                select comp_date.compensation_date
                from ams.mod_comp_date comp_date
                where comp_date.module_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_COMP
                    and comp_date.sub_code = AMS_MODL_COMP_MMXIII.MMXIII_COMP_MNNA
                    and comp_date.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                    and comp_date.compensation_date = trunc(valRecordDate, 'MM')
                group by comp_date.compensation_date
            ) loop
                AMS_MODL_COMP_MMXIII.mmxiii_modl_unit_dev(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnna_open(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnna_data(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnna_cond(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnna_comp(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnna_close(valRecordDate);
            end loop;
        end if;
    end;

    procedure mmxiii_modl_mnna_open(valRecordDate date := null)
    is
      /*cursor cur_unit is
        select *
        from ams.la_comp_mmxiii_unit_mnna mnna
        where mnna.outlet_unit_level_ams_id is not null;

      cursor cur_agency is
        select *
        from ams.la_comp_mmxiii_unit_mnna mnna
        where mnna.outlet_unit_ams_id is not null;

      V_UNIT_AMS_ID varchar2(32) := null;
      V_OUTLET_AMS_ID varchar2(32) := null;
      V_AGENCY_AMS_ID varchar2(32) := null;*/

    begin
        /* Len danh sach Tu van vien tinh thu lao phat trien ban moi*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.mnna_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES,
            comp.mnna_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
            comp.mnna_position_code = comp.info_position_code,
            comp.mnna_outlet_id = comp.outlet_id,
            comp.mnna_outlet_ams_id = comp.outlet_ams_id,
            comp.mnna_period_fyp = 0,
            comp.mnna_deve_count = 0,
            comp.mnna_comp_money = 0,
            comp.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.status_code = AMS_MODL_COMP_MMXIII.STATUS_CURR
            and comp.info_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04;
        commit;

        /* Len danh sach du lieu chi tiet can xoa*/
        merge /*+ CARDINALITY(mnna, 1000)*/
            into ams.la_comp_mmxiii_mnna mnna
        using
            (
                select /*+ CARDINALITY(comp, 1000)*/
                    comp.mnna_outlet_ams_id
                from ams.la_compensation_mmxiii_tmp comp
                where comp.record_date = trunc(valRecordDate, 'MM')
                    and comp.mnna_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and comp.mnna_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            ) upd
        on (
            trunc(valRecordDate, 'MM') = mnna.record_date
            and
            upd.mnna_outlet_ams_id = mnna.mnna_outlet_ams_id
        )
        when matched then
            update
                set
                    mnna.mnna_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_DEL;
        commit;

        /* Xoa du lieu chi tiet*/
        loop
            delete ams.la_comp_mmxiii_mnna mnna
            where mnna.record_date = trunc(valRecordDate, 'MM')
                and mnna.mnna_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_DEL
                and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        /* Du lieu phat trien ban chi tiet*/
        insert into ams.la_comp_mmxiii_mnna(
            branch_id,
            branch_ams_id,
            record_date,
            version_date,
            company_id,
            company_ams_id,
            company_name,
            agency_name,
            effective_date,
            terminative_date,
            senr_by_months,
            mnna_be_paid,
            mnna_be_executing,
            mnna_outlet_id,
            mnna_outlet_ams_id,
            mnna_period_fyp,
            mnna_comp_ratio,
            mnna_comp_money,
            create_user,
            update_user,
            create_datetime,
            update_datetime)
        select /*+ CARDINALITY(comp, 1000) CARDINALITY(bran, 100)*/
            bran.branch_id,
            agcy.branch_ams_id,
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            comp.info_company_id,
            comp.info_company_ams_id,
            comp.info_company_name,
            agcy.branch_name,
            trunc(bran.effective_date, 'MM'),
            bran.terminative_date,
            months_between(add_months(trunc(valRecordDate, 'MM'), 1), trunc(bran.effective_date, 'MM')),
            AMS_MODL_COMP_MMXIII.BE_PAID_YES,
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
            comp.mnna_outlet_id,
            comp.mnna_outlet_ams_id,
            0,
            0,
            0,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            select
                tmp.mnna_outlet_id,
                tmp.mnna_outlet_ams_id,
                tmp.info_company_id,
                tmp.info_company_ams_id,
                tmp.info_company_name,
                tmp.mnna_position_code
            from ams.la_compensation_mmxiii_tmp tmp
            where tmp.record_date = trunc(valRecordDate, 'MM')
                and tmp.mnna_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                and tmp.mnna_be_paid = LIFE_AGENCY_CODE.OUTLET_PAID_YES
        ) comp
        join
        (
            select
                tmp.branch_id,
                tmp.effective_date,
                tmp.terminative_date,
                tmp.outlet_development_id outlet_id
            from ams.la_branch_development tmp
            where tmp.decisive_date is not null
                and tmp.effective_date is not null
                and trunc(valRecordDate, 'MM') >= tmp.effective_date
                and trunc(valRecordDate, 'MM') < nvl(tmp.terminative_date, AMS_CORE_SYSTEM.DATE_MAX_VALUE)
        ) bran
            on bran.outlet_id = comp.mnna_outlet_id
        join
        (
            select
                tmp.branch_id,
                tmp.branch_ams_id,
                tmp.branch_name
            from ams.serv_branch_mapping tmp
            where tmp.branch_type = 'BAN'
                and tmp.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
        ) agcy
            on agcy.branch_id = bran.branch_id;
        commit;

        /* Thong tin ban moi*/
        merge /*+ CARDINALITY(mnna, 1000)*/
            into ams.la_comp_mmxiii_mnna mnna
        using
            (
                select /*+ CARDINALITY(data, 1000)*/
                    data.outlet_id,
                    data.outlet_ams_id,
                    data.info_outlet_name,
                    data.info_agency_ams_id
                from ams.la_compensation_mmxiii_tmp data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.info_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
                    and data.info_agency_ams_id is not null
            ) upd
        on (
            trunc(valRecordDate, 'MM') = mnna.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnna.mnna_be_executing
            and
            upd.info_agency_ams_id = mnna.branch_ams_id
        )
        when matched then
            update
                set
                    mnna.outlet_id = upd.outlet_id,
                    mnna.outlet_ams_id = upd.outlet_ams_id,
                    mnna.outlet_name = upd.info_outlet_name,
                    mnna.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                    mnna.update_datetime = sysdate;
        commit;

        /* Len danh sach du lieu chi tiet can xoa*/
        merge /*+ CARDINALITY(mnna, 100)*/
            into ams.la_comp_mmxiii_mnna_detail mnna
        using
            (
                select /*+ CARDINALITY(comp, 100)*/
                    comp.info_company_id company_id
                from ams.la_compensation_mmxiii_tmp comp
                where comp.record_date = trunc(valRecordDate, 'MM')
                    and comp.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                 group by comp.info_company_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = mnna.record_date
            and
            upd.company_id = mnna.company_id
        )
        when matched then
            update
                set
                    mnna.mnna_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_DEL;
        commit;

        /* Xoa du lieu chi tiet*/
        loop
            delete ams.la_comp_mmxiii_mnna_detail mnna
            where mnna.record_date = trunc(valRecordDate, 'MM')
                and mnna.mnna_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_DEL
                and rownum < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        /* Du lieu phat trien ban chi tiet*/
        insert /*+ APPEND */ into ams.la_comp_mmxiii_mnna_detail nologging(
            outlet_id,
            outlet_ams_id,
            record_date,
            version_date,
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
            effective_date,
            terminative_date,
            position_code,
            position_date,
            mnna_be_paid,
            mnna_be_executing,
            mnna_period_fyp,
            mnna_period_fyp_calc,
            mnna_unit_level,
            create_user,
            update_user,
            create_datetime,
            update_datetime)
        select /*+  CARDINALITY(bran, 100) CARDINALITY(agcy, 100) CARDINALITY(outl, 100)*/
            outl.outlet_id,
            outl.outlet_ams_id,
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
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
            outl.effective_date,
            outl.terminative_date,
            outl.position_code,
            outl.position_date,
            AMS_MODL_COMP_MMXIII.BE_PAID_YES,
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
            0,
            0,
            1,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            select /*+ CARDINALITY(tmp, 100) */
                tmp.branch_id,
                tmp.effective_date,
                tmp.terminative_date,
                tmp.outlet_development_id outlet_id
            from ams.la_branch_development tmp
            where tmp.decisive_date is not null
                and tmp.effective_date is not null
                and trunc(valRecordDate, 'MM') >= tmp.effective_date
                and trunc(valRecordDate, 'MM') < nvl(tmp.terminative_date, AMS_MODL_COMP_MMXIII.DATE_MAX_VALUE)
        ) bran
        join
        (
            select /*+ CARDINALITY(tmp, 100) */
                tmp.branch_id,
                tmp.branch_ams_id,
                tmp.branch_name
            from ams.serv_branch_mapping tmp
            where tmp.branch_type = 'BAN'
                and tmp.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
        ) agcy
            on agcy.branch_id = bran.branch_id
        join
        (
            select  /*+ CARDINALITY(tmp, 100)*/
                tmp.outlet_id,
                tmp.outlet_ams_id,
                tmp.info_outlet_name outlet_name,
                tmp.info_company_id company_id,
                tmp.info_company_ams_id company_ams_id,
                tmp.info_company_name company_name,
                tmp.info_office_id office_id,
                tmp.info_office_ams_id office_ams_id,
                tmp.info_office_name office_name,
                tmp.info_agency_id agency_id,
                tmp.info_agency_ams_id agency_ams_id,
                tmp.info_agency_name agency_name,
                tmp.info_unit_id unit_id,
                tmp.info_unit_ams_id unit_ams_id,
                tmp.info_unit_name unit_name,
                tmp.info_effective_date effective_date,
                tmp.info_terminative_date terminative_date,
                tmp.info_position_code position_code,
                tmp.info_position_date position_date,
                tmp.info_agency_ams_id mnna_branch_ams_id
            from ams.la_compensation_mmxiii_tmp tmp
            where tmp.record_date = trunc(valRecordDate, 'MM')
                and tmp.be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                and tmp.info_agency_ams_id is not null
        ) outl
            on outl.mnna_branch_ams_id = agcy.branch_ams_id;
        commit;

        /*\* Cap nhat TTN len TN trong vong 1thang*\
        insert into ams.la_comp_mmxiii_unit_mnna(
             outlet_ams_id,
             record_date,
             version_date,
             outlet_agency_ams_id,
             outlet_unit_ams_id,
             outlet_unit_level_ams_id,
             unit_ams_id,
             position_code,
             position_date,
             create_user,
             update_user,
             create_datetime,
             update_datetime)
         select \*+ CARDINALITY(data, 1000)*\
             data.outlet_ams_id,
             trunc(valRecordDate, 'MM'),
             cast(trunc(sysdate, 'DD') as date),
             '',
             '',
             data.outlet_ams_id,
             data.unit_ams_id,
             data.position_code,
             data.position_date,
             AMS_CORE_SYSTEM.SYSTEM_USER,
             AMS_CORE_SYSTEM.SYSTEM_USER,
             sysdate,
             sysdate
         from ams.inp_data_outlet data
         where data.record_date = trunc(valRecordDate, 'MM')
             and data.position_date
                  between add_months(trunc(valRecordDate, 'MM'), -1)
                  and trunc(valRecordDate, 'MM')
             and data.position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02
             and data.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE;
         commit;

         \* Cap nhat ma truong nhom cua nhom chau *\
         for p_unit in cur_unit
          loop
            begin
              select distinct data.unit_ams_id into V_UNIT_AMS_ID
              from ams.inp_data_outlet data
              where data.outlet_ams_id = p_unit.outlet_unit_level_ams_id
                  and data.record_date = add_months(trunc(p_unit.position_date, 'MM'), -1)
                  and data.unit_ams_id is not null;
              exception
                when NO_DATA_FOUND
                then
                V_UNIT_AMS_ID := null;
            end;

            begin
              select distinct inp.outlet_ams_id into V_OUTLET_AMS_ID
              from ams.inp_data_outlet inp
              where inp.unit_ams_id = V_UNIT_AMS_ID
                 and inp.position_code = 'CV02'
                 and inp.outlet_ams_id is not null;
              exception
                when NO_DATA_FOUND
                then
                V_OUTLET_AMS_ID := null;
            end;

            update ams.la_comp_mmxiii_unit_mnna mnna
            set mnna.outlet_unit_ams_id = V_OUTLET_AMS_ID
            where mnna.outlet_unit_level_ams_id = p_unit.outlet_unit_level_ams_id;
            commit;

            V_UNIT_AMS_ID  := null;
            V_OUTLET_AMS_ID := null;
            commit;
          end loop;

          \*Cap nhat ma truong ban cua nhom chau*\
          for p_agency in cur_agency
          loop
            begin
              select distinct data.agency_ams_id into V_AGENCY_AMS_ID
              from ams.inp_data_outlet data
              where data.outlet_ams_id = p_agency.outlet_unit_ams_id
                  and data.record_date = add_months(trunc(p_agency.position_date, 'MM'), -1)
                  and data.agency_ams_id is not null;
              exception
                when NO_DATA_FOUND
                then
                V_AGENCY_AMS_ID := null;
            end;

            begin
              select distinct inp.outlet_ams_id into V_OUTLET_AMS_ID
              from ams.inp_data_outlet inp
              where inp.agency_ams_id = V_AGENCY_AMS_ID
                  and inp.position_code = 'CV04'
                  and inp.outlet_ams_id is not null;
              exception
                when NO_DATA_FOUND
                then
                V_OUTLET_AMS_ID := null;
            end;

            update ams.la_comp_mmxiii_unit_mnna mnna
            set mnna.outlet_agency_ams_id = V_OUTLET_AMS_ID
            where mnna.outlet_unit_ams_id = p_agency.outlet_unit_ams_id;
            commit;

            V_AGENCY_AMS_ID  := null;
            V_OUTLET_AMS_ID := null;
          end loop;

          \*Xoa cac truong ban ko co nhom chau*\
          delete from ams.la_comp_mmxiii_unit_mnna mnna
          where mnna.outlet_agency_ams_id is null;
          commit;*/
    end;

    procedure mmxiii_modl_mnna_data(valRecordDate date := null)
    is
    begin
        /*Cap nhat FYP */
        merge /*+ CARDINALITY(mnna, 100)*/
            into ams.la_comp_mmxiii_mnna_detail mnna
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_ams_id,
                    nvl(data.period_fyp, 0) period_fyp
                from ams.inp_data_outlet data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                    and data.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
            ) upd
        on (
            trunc(valRecordDate, 'MM') = mnna.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnna.mnna_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = mnna.mnna_be_paid
            and
            upd.outlet_ams_id = mnna.outlet_ams_id
        )
        when matched then
            update
                set
                    mnna.mnna_period_fyp = upd.period_fyp,
                    mnna.mnna_period_fyp_calc = upd.period_fyp;
        commit;

        /*Cap nhat cap cua nhom*/
        merge  /*+ CARDINALITY(mnbs, 100)
                  CARDINALITY(upd, 100)
                  LEADING(mnbs upd) */
            into ams.la_comp_mmxiii_mnna_detail mnna
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.unit_ams_id,
                    max(tmp.umnm_unit_level) mnna_unit_level
                from ams.la_comp_mmxiii_unit_des_source tmp
                where tmp.record_date = trunc(valRecordDate, 'MM')
                group by tmp.unit_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = mnna.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnna.mnna_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = mnna.mnna_be_paid
            and
            mnna.unit_ams_id is not null
            and
            upd.unit_ams_id = mnna.unit_ams_id
            )
        when matched then
            update
                set
                    mnna.mnna_unit_level = upd.mnna_unit_level;
        commit;

        /*Cap nhat FYP cua cac nhom neu la cap 2 tro len thi se = 0*/
        update ams.la_comp_mmxiii_mnna_detail mnna
        set
            mnna.mnna_period_fyp_calc = 0
        where mnna.record_date = trunc(valRecordDate, 'MM')
            and mnna.mnna_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and mnna.mnna_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and mnna.mnna_unit_level >= 2
            and mnna.unit_ams_id is not null;
        commit;

        /*Cap nhat FYP cua Truong ban thi se = 0*/
        update ams.la_comp_mmxiii_mnna_detail mnna
        set
            mnna.mnna_period_fyp_calc = 0
        where mnna.record_date = trunc(valRecordDate, 'MM')
            and mnna.mnna_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and mnna.mnna_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and mnna.position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04;
        commit;

        /*Lay du lieu tu bang chi tiet sau khi da tinh toan xong duoc FYP cho no roi*/
        merge /*+ CARDINALITY(mnna, 100)*/
            into ams.la_comp_mmxiii_mnna mnna
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.agency_ams_id branch_ams_id,
                    sum(nvl(data.mnna_period_fyp_calc, 0)) period_fyp
                from ams.la_comp_mmxiii_mnna_detail data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.mnna_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and data.mnna_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                    and data.agency_ams_id is not null
                group by data.agency_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = mnna.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnna.mnna_be_executing
            and
            upd.branch_ams_id = mnna.branch_ams_id
        )
        when matched then
            update
                set
                    mnna.mnna_period_fyp = upd.period_fyp,
                    mnna.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    mnna.update_datetime = sysdate;
        commit;
    end;

    procedure mmxiii_modl_mnna_cond(valRecordDate date := null)
    is
    begin
        merge /*+ CARDINALITY(mnna, 100)*/
            into ams.la_comp_mmxiii_mnna mnna
        using
            (
                select
                    1 senr_from,
                    13 senr_to,
                    200000000 fyp_from,
                    500000000 fyp_to,
                    6000000 comp_money
                from dual
                union
                select
                    1 senr_from,
                    13 senr_to,
                    500000000 fyp_from,
                    1000000000000 fyp_to,
                    15000000 comp_money
                from dual
                union
                select
                    13 senr_from,
                    25 senr_to,
                    200000000 fyp_from,
                    500000000 fyp_to,
                    3000000 comp_money
                from dual
                union
                select
                    13 senr_from,
                    25 senr_to,
                    500000000 fyp_from,
                    1000000000000 fyp_to,
                    8000000 comp_money
                from dual
            ) upd
        on (
            trunc(valRecordDate, 'MM') = mnna.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnna.mnna_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = mnna.mnna_be_paid
           /* and
            upd.company_id = mnna.company_id*/
            and
            nvl(mnna.senr_by_months, 0) >= upd.senr_from
            and
            nvl(mnna.senr_by_months, 0) < upd.senr_to
            and
            nvl(mnna.mnna_period_fyp, 0) >= upd.fyp_from
            and
            nvl(mnna.mnna_period_fyp, 0) < upd.fyp_to
            )
        when matched then
            update
                set
                    mnna.mnna_comp_money = upd.comp_money,
                    mnna.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                    mnna.update_datetime = sysdate;
        commit;
    end;

    procedure mmxiii_modl_mnna_comp(valRecordDate date := null)
    is
    begin
        merge /*+ CARDINALITY(comp, 1000)*/
            into ams.la_compensation_mmxiii_tmp comp
        using
            (
                select /*+ CARDINALITY(data, 1000)*/
                    data.mnna_outlet_ams_id,
                    sum(nvl(data.mnna_period_fyp, 0)) mnna_period_fyp,
                    nvl(count(*), 0) mnna_deve_count,
                    sum(nvl(data.mnna_comp_money, 0)) mnna_comp_money
                from ams.la_comp_mmxiii_mnna data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.mnna_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and data.mnna_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                group by data.mnna_outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.mnna_be_executing
            and
            upd.mnna_outlet_ams_id = comp.mnna_outlet_ams_id
        )
        when matched then
            update
                set
                    comp.mnna_period_fyp = upd.mnna_period_fyp,
                    comp.mnna_deve_count = upd.mnna_deve_count,
                    comp.mnna_comp_money = upd.mnna_comp_money,
                    comp.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                    comp.update_datetime = sysdate;
        commit;
    end;

    procedure mmxiii_modl_mnna_close(valRecordDate date := null)
    is
    begin
        /* Ket thuc qua trinh tinh thu lao phat trien ban moi
           trong bang la_comp_mmxiii_mnna*/
        update ams.la_comp_mmxiii_mnna mnna
        set
            mnna.mnna_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO,
            mnna.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
            mnna.update_datetime = sysdate
        where mnna.record_date = trunc(valRecordDate, 'MM')
            and mnna.mnna_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES;
        commit;

        /* Ket thuc qua trinh tinh thu lao phat trien ban moi
           trong bang la_compensation_mmxiii_tmp*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.mnna_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO,
            comp.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.mnna_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES;
        commit;

        update ams.la_comp_mmxiii_mnna_detail mnna
        set
            mnna.mnna_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO
        where mnna.record_date = trunc(valRecordDate, 'MM')
            and mnna.mnna_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES;
        commit;

  /*      \*Xoa bang kiem tra nhom chau*\
        delete from ams.la_comp_mmxiii_unit_mnna
        commit;*/

  end;

    procedure mmxiii_modl_mnpu(valRecordDate date := null)
    is
    begin
        if (
            AMS_CORE_MODULE.is_active(
                AMS_MODL_COMP_MMXIII.MMXIII_COMP_MNPU,
                trunc(valRecordDate, 'MM')
            ) = AMS_CORE_MODULE.IS_YES
        ) then
            for var_result in (
                select comp_date.compensation_date
                from ams.mod_comp_date comp_date
                where comp_date.module_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_COMP
                    and comp_date.sub_code = AMS_MODL_COMP_MMXIII.MMXIII_COMP_MNPU
                    and comp_date.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                    and comp_date.compensation_date = trunc(valRecordDate, 'MM')
                group by comp_date.compensation_date
            ) loop
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnpu_open(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnpu_data(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnpu_cond(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnpu_cert(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnpu_comp(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnpu_close(valRecordDate);
            end loop;
        end if;
    end;

    --thu lao Vinh danh tan nghiep phai tra HANG THANG
    --no len thang nao thi duoc nhan thang day
    procedure mmxiii_modl_mnpu_open(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Len danh sach du lieu chi tiet can xoa*/
        merge /*+ CARDINALITY(mnpu, 100)*/
            into ams.la_comp_mmxiii_mnpu mnpu
        using
            (
                select /*+ CARDINALITY(comp, 100)*/
                    comp.info_company_id company_id
                from ams.la_compensation_mmxiii_tmp comp
                where comp.record_date = trunc(valRecordDate, 'MM')
                    and comp.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                 group by comp.info_company_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = mnpu.record_date
            and
            upd.company_id = mnpu.company_id
        )
        when matched then
            update
                set
                    mnpu.mnpu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_DEL;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnpu_open', 'Len danh sach du lieu chi tiet can xoa  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 2;

        /* Xoa du lieu chi tiet*/
        loop
            delete ams.la_comp_mmxiii_mnpu mnpu
            where mnpu.record_date = trunc(valRecordDate, 'MM')
                and mnpu.mnpu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_DEL
                and rownum < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnpu_open', 'Xoa du lieu chi tiet  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 2;

        /* Du lieu cua cac dai ly duoc thuong Vinh danh tan nghiep*/
        insert /*+ APPEND */ into ams.la_comp_mmxiii_mnpu nologging(
            outlet_id,
            outlet_ams_id,
            outlet_bvl_id,
            record_date,
            version_date,
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
            effective_date,
            terminative_date,
            position_code,
            position_date,
            outlet_name,
            mnpu_be_paid,
            mnpu_be_executing,
            mnpu_status,
            mnpu_pum_prom_date,--ngay thang tien lam tien truong nhom
            mnpu_um_prom_date, --ngay thang tien lam truong nhom
            mnpu_um_record_date, --ngay record_date cua len lam truong nhom
            mnpu_period_fyp,
            mnpu_time_of_challenge,
            mnpu_cert_status,
            mnpu_cert_date,
            mnpu_cert_money,
            mnpu_comp_money,
            mnpu_total_money,
            create_user,
            update_user,
            create_datetime,
            update_datetime
            )
        select /*+CARDINALITY(tmp, 100)*/
            tmp.outlet_id,
            tmp.outlet_ams_id,
            substr(tmp.outlet_ams_id, 2),
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            tmp.info_company_id,
            tmp.info_company_ams_id,
            tmp.info_company_name,
            tmp.info_office_id,
            tmp.info_office_ams_id,
            tmp.info_office_name,
            tmp.info_agency_id,
            tmp.info_agency_ams_id,
            tmp.info_agency_name,
            tmp.info_unit_id,
            tmp.info_unit_ams_id,
            tmp.info_unit_name,
            tmp.info_effective_date,
            tmp.info_terminative_date,
            tmp.info_position_code,
            tmp.info_position_date,
            tmp.info_outlet_name,
            AMS_MODL_COMP_MMXIII.BE_PAID_YES,
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
            0,
            ams.ams_core_function.get_position_date(tmp.outlet_id, tmp.info_position_date - 1),--lay ngay thang tien len lam tien truong nhom
            tmp.info_position_date,
            trunc(tmp.info_position_date, 'MM'), --record_date cua ngay len lam truong nhom
            0,
            0,
            0,
            null,
            0,
            0,
            0,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.la_compensation_mmxiii_tmp tmp
        where tmp.record_date = trunc(valRecordDate, 'MM')
            and tmp.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and tmp.status_code = AMS_MODL_COMP_MMXIII.STATUS_CURR
            --hien tai dang la truong nhom
            and tmp.info_position_code = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02
            --ngay thang tien duoc len lam truong nhom trong thang day thi moi duoc nhan cho no
            --A Hoa con firm ngay 21/3/2013
            --ngay thang tien dung la ngay dau quy cua no thi moi duoc tra tien
            and tmp.info_position_date = trunc(valRecordDate, 'MM');
            --cho nay se sua lai thanh lam cho THANG
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnpu_open', 'Du lieu cua cac dai ly duoc thuong Vinh danh tan nghiep  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 3;
        /*Doan nay tuc la neu ngay thang tien len lam tien truong nhom la >= 1/10/2012 thi
        boi vi coi nhu la thang tien len Tien truong nhom vao ngay 1/12/2012
        Day la lan xet bay nhieu thi chi can dem so lan da xet thang tien o nam 2013 la du
        Voi ngay chay thang  tu lon hon giua (dau nam, ngay thang tien)
                                              toi --> dau thang sau ===> van dam bao duoc so lieu la chinh xac
         Nhu vay la da dam bao duoc so lieu la chinh xac roi
                        and d.promotion_date
                            between greatest('1-jan-2012', prom.pump_effective_date)
                            and add_months(trunc(valRecordDate, 'MM'), 1)
        */
        update ams.la_comp_mmxiii_mnpu tmp
        set
            tmp.mnpu_time_of_challenge =
                (
                    select count(*)
                    from mod_prom_date d
                    where d.module_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_PROM
                        and d.sub_code = AMS_MODL_COMP_MMXIII.MMXIII_PROM_PUMP
                        and d.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                        and d.promotion_date
                            between greatest(trunc(valRecordDate, 'YYYY'), tmp.mnpu_pum_prom_date)
                            and add_months(trunc(valRecordDate, 'MM'), 1) --cho den thang tinh nay cong them 1 thi se biet duoc da chay thang tien tu dau nam la bao nhieu lan roi
                        /*can phai them dieu kien o day thi moi duoc dung cho no phai nho hon nhu the nay thi moi tinh duoc chinh xac*/
                        and greatest(trunc(valRecordDate, 'YYYY'), tmp.mnpu_pum_prom_date)
                            <= add_months(trunc(valRecordDate, 'MM'), 1)
                ),
            tmp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            tmp.update_datetime = sysdate
        where tmp.record_date = trunc(valRecordDate, 'MM')
            and tmp.mnpu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and tmp.mnpu_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            --cai nay la lay du lieu cua nam 2012 nen la dung the nay cung duoc de do phai fix code cung cho no
            and tmp.mnpu_pum_prom_date >= trunc(to_date('1-dec-' || to_char(add_months(valRecordDate, -12), 'YYYY')), 'DD');
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnpu_open', 'mnpu_pum_prom_date >= 1-dec-2012  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 4;

        /* Dem so lan xet thang tien cua nhung Tien truong nhom
        Neu ma co ngay hieu luc ke tu ngay 1/9/2012  den 30/11/2012 thi
        tuc la da duoc xet thang tien 1 lan roi trong nam 2012 roi nen phai cong them 1  (do da xet thang tien cua nam 2012)
        vao so lan da duoc xet thang tien cua nam 2013
        */
        /* Dem so lan xet thang tien cua nhung Tien truong nhom
        Neu ma co ngay hieu luc ke tu ngay 1/9/2012  den 30/11/2012 thi
        tuc la da duoc xet thang tien 1 lan roi trong nam 2012 roi nen phai cong them 1  (do da xet thang tien cua nam 2012)
        vao so lan da duoc xet thang tien cua nam 2013
        */
        /*Doan nay tuc la neu ngay thang tien len lam tien truong nhom la tu 30/6/2012 den 30/11/2012  thi
        Dai ly do da duoc xet thang tien 1 lan roi
        Nen can cong them 1 vao  so lan da xet thang tien o nam 2013
        Voi ngay chay thang  tu lon hon giua dau nam
                                              toi --> dau thang sau ===> van dam bao duoc so lieu la chinh xac
         Nhu vay la da dam bao duoc so lieu la chinh xac roi
                        and d.promotion_date
                            between '1-jan-2012'
                            and add_months(trunc(valRecordDate, 'MM'), 1)
         Code doan nay la chinh xac roi
        */
        update ams.la_comp_mmxiii_mnpu tmp
        set
            tmp.mnpu_time_of_challenge =
                (
                    select count(*) + 1
                    from mod_prom_date d
                    where d.module_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_PROM
                        and d.sub_code = AMS_MODL_COMP_MMXIII.MMXIII_PROM_PUMP
                        and d.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                        and d.promotion_date
                            between trunc(valRecordDate, 'YYYY')
                            and add_months(trunc(valRecordDate, 'MM'), 1)
                        /*can phai them dieu kien o day thi moi duoc dung cho no phai nho hon nhu the nay thi moi tinh duoc chinh xac*/
                        and trunc(valRecordDate, 'YYYY') <= add_months(trunc(valRecordDate, 'MM'), 1)
                ),
            tmp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            tmp.update_datetime = sysdate
        where tmp.record_date = trunc(valRecordDate, 'MM')
            and tmp.mnpu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and tmp.mnpu_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            --chinhlk fix lai neu thang tien tu 1/9/2012 den 30/11/2012 thi se thuc hien theo yeu cau cua anh Huu Hoa
            and tmp.mnpu_pum_prom_date
                between trunc(to_date('1-sep-' || to_char(add_months(valRecordDate, -12), 'YYYY')), 'DD')
                and trunc(to_date('30-nov-' || to_char(add_months(valRecordDate, -12), 'YYYY')), 'DD');
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnpu_open', 'neu thang tien tu 1/9/2012 den 30/11/2012  thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 5;

        /* Dem so lan xet thang tien cua nhung Tien truong nhom
        Neu ma co ngay hieu luc truoc ngay 30/8/2012
        tuc la da duoc xet thang tien 2 lan trong nam 2012 roi nen phai cong them 2  (do da xet thang tien cua nam 2011)
        vao so lan da duoc xet thang tien cua nam 2013
        */
        /*Doan nay tuc la neu ngay thang tien len lam tien truong nhom la <= 30/6/2012
        Tuc la Dai ly do da duoc xet thang tien  2 dot vao ngay 1/9/2012 va 1/12/2012 roi
        Nen can cong them 2 vao  so lan da xet thang tien o nam 2013
        Voi ngay chay thang  tu lon hon giua dau nam
                                              toi --> dau thang sau ===> van dam bao duoc so lieu la chinh xac
         Nhu vay la da dam bao duoc so lieu la chinh xac roi
                        and d.promotion_date
                            between '1-jan-2012'
                            and add_months(trunc(valRecordDate, 'MM'), 1)
         Code doan nay la chinh xac roi
        */
        update ams.la_comp_mmxiii_mnpu tmp
        set
            tmp.mnpu_time_of_challenge =
                (
                    select count(*) + 2
                    from mod_prom_date d
                    where d.module_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_PROM
                        and d.sub_code = AMS_MODL_COMP_MMXIII.MMXIII_PROM_PUMP
                        and d.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                        and d.promotion_date
                            between trunc(valRecordDate, 'YYYY')
                            and add_months(trunc(valRecordDate, 'MM'), 1)
                        /*can phai them dieu kien o day thi moi duoc dung cho no phai nho hon nhu the nay thi moi tinh duoc chinh xac*/
                        and trunc(valRecordDate, 'YYYY') <= add_months(trunc(valRecordDate, 'MM'), 1)
                ),
            tmp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            tmp.update_datetime = sysdate
        where tmp.record_date = trunc(valRecordDate, 'MM')
            and tmp.mnpu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and tmp.mnpu_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            --chinhlk fix lai neu thang tien tu 1/9/2012 den 30/11/2012 thi se thuc hien theo yeu cau cua anh Huu Hoa
            and tmp.mnpu_pum_prom_date
                between trunc(to_date('1-jun-' || to_char(add_months(valRecordDate, -12), 'YYYY')), 'DD')
                and trunc(to_date('31-aug-' || to_char(add_months(valRecordDate, -12), 'YYYY')), 'DD');
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnpu_open', ' 1/6/2012 den 31/8/2012 thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 6;

        /*Neu ma da co 2 lan xet thang tien trong nam 2012
        va day la lan xet thang tien thu 3 vao nam 2013 o tu thang 1 den thang 3
        thi phai tinh theo quy che nam 2012
        danh dau lai truong nhom nay de tinh rieng cho no*/

        --Neu thang tien   thang 3 nam 2013 thi se coi nhu da thang tien trong nam 2013
        --va co 2 dot xet trong nam 2012 da trai qua roi thi tinh rieng
        if to_number(to_char(trunc(valRecordDate, 'MM'), 'MM')) = 3 then
            update ams.la_comp_mmxiii_mnpu tmp
            set
                tmp.mnpu_time_of_challenge =
                    (
                        select count(*) + 2
                        from mod_prom_date d
                        where d.module_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_PROM
                            and d.sub_code = AMS_MODL_COMP_MMXIII.MMXIII_PROM_PUMP
                            and d.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                            and d.promotion_date
                                between trunc(valRecordDate, 'YYYY')
                                and add_months(trunc(valRecordDate, 'MM'), 1)
                            /*can phai them dieu kien o day thi moi duoc dung cho no phai nho hon nhu the nay thi moi tinh duoc chinh xac*/
                            and trunc(valRecordDate, 'YYYY') <= add_months(trunc(valRecordDate, 'MM'), 1)
                    ),
                tmp.mnpu_status = 1,--cap nhat de tinh rieng cho dai ly day
                tmp.mnpu_um_record_date = trunc(tmp.mnpu_um_prom_date, 'MM'),
                tmp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                tmp.update_datetime = sysdate
            where tmp.record_date = trunc(valRecordDate, 'MM')
                and tmp.mnpu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                and tmp.mnpu_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                --chinhlk fix lai neu thang tien tu 1/6/2012 den 31/8/2012 thi se thuc hien theo yeu cau cua anh Huu Hoa
                and tmp.mnpu_pum_prom_date
                    between trunc(to_date('1-jun-' || to_char(add_months(valRecordDate, -12), 'YYYY')), 'DD')
                    and trunc(to_date('31-aug-' || to_char(add_months(valRecordDate, -12), 'YYYY')), 'DD');
            commit;
            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnpu_open', '  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        end if;


        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnpu_open', '  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  :=7;
        --chinhlk 23/2/2013 them doan nay de theo yeu cau anh Huu Hoa
        --xu ly them truong hop nay nhe
        update ams.la_comp_mmxiii_mnpu tmp
        set
            tmp.mnpu_time_of_challenge =
                (
                    select count(*) + 3
                    from mod_prom_date d
                    where d.module_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_PROM
                        and d.sub_code = AMS_MODL_COMP_MMXIII.MMXIII_PROM_PUMP
                        and d.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                        and d.promotion_date
                            between trunc(valRecordDate, 'YYYY')
                            and add_months(trunc(valRecordDate, 'MM'), 1)
                        /*can phai them dieu kien o day thi moi duoc dung cho no phai nho hon nhu the nay thi moi tinh duoc chinh xac*/
                        and trunc(valRecordDate, 'YYYY') <= add_months(trunc(valRecordDate, 'MM'), 1)
                ),
            tmp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            tmp.update_datetime = sysdate
        where tmp.record_date = trunc(valRecordDate, 'MM')
            and tmp.mnpu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and tmp.mnpu_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and tmp.mnpu_pum_prom_date < trunc(to_date('1-jun-' || to_char(add_months(valRecordDate, -12), 'YYYY')), 'DD'); --neu nho hon 1 thang 6 thi coi nhu se la lan thu 3 roi
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnpu_open', 'co ngay hieu luc truoc ngay 1/6/2012  thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 9;
        --Neu thang tien   thang 3 nam 2013 thi se coi nhu da thang tien trong nam 2013
        --va co 2 dot xet trong nam 2012 da trai qua roi thi tinh rieng
        if to_number(to_char(trunc(valRecordDate, 'MM'), 'MM')) = 3 then
            /*Xu ly rieng trong truong hop da xet 2 lan trong nam 2012 va duoc  xet lan thu 3 o thang 3 nam 2013*/
            /* Len danh sach du lieu chi tiet can xoa o bang chi tiet
            Xoa het du lieu*/
            merge /*+ CARDINALITY(mnpu, 100)*/
                into ams.la_comp_mmxiii_mnpu_detail mnpu
            using
                (
                    select /*+ CARDINALITY(comp, 100)*/
                        comp.info_company_id company_id
                    from ams.la_compensation_mmxiii_tmp comp
                    where comp.record_date = trunc(valRecordDate, 'MM')
                        and comp.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                     group by comp.info_company_id
                ) upd
            on (
                trunc(valRecordDate, 'MM') = mnpu.record_date
                and
                upd.company_id = mnpu.company_id
            )
            when matched then
                update
                    set
                        mnpu.mnpu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_DEL;
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnpu_open', ' Len danh sach du lieu chi tiet can xoa o bang chi tiet    thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos  := 10;

            /* Xoa du lieu chi tiet*/
            loop
                delete ams.la_comp_mmxiii_mnpu_detail mnpu
                where mnpu.record_date = trunc(valRecordDate, 'MM')
                    and mnpu.mnpu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_DEL
                    and rownum < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnpu_open', ' Xoa du lieu chi tiet  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos  := 11;

            /*Voi danh sach cac dai ly duoc danh dau = 1 thi se do rieng sang mot bang chi tiet de tinh rieng FYP
            trong 3 thang gan nhat de tinh thuong cho no*/
            /* Du lieu dac biet chi tiet*/
            insert /*+ APPEND */ into ams.la_comp_mmxiii_mnpu_detail nologging(
                outlet_id,
                outlet_ams_id,
                record_date,
                version_date,
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
                effective_date,
                terminative_date,
                position_code,
                position_date,
                mnpu_be_paid,
                mnpu_be_executing,
                mnpu_data_date,
                mnpu_outlet_id,
                mnpu_outlet_ams_id,
                mnpu_pum_prom_date,
                mnpu_um_prom_date,
                mnpu_um_record_date,
                mnpu_time_of_challenge,
                mnpu_period_fyp,
                mnpu_comp_money,
                create_user,
                update_user,
                create_datetime,
                update_datetime
            )
            select /*+CARDINALITY(tmp, 100)*/
                tmp.outlet_id,
                tmp.outlet_ams_id,
                trunc(valRecordDate, 'MM'),
                trunc(sysdate, 'DD'),
                tmp.outlet_name,
                tmp.company_id,
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
                tmp.effective_date,
                tmp.terminative_date,
                tmp.position_code,
                tmp.position_date,
                AMS_MODL_COMP_MMXIII.BE_PAID_YES,
                AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
                trunc(valRecordDate, 'MM'),
                tmp.outlet_id,
                tmp.outlet_ams_id,
                tmp.mnpu_pum_prom_date,
                tmp.mnpu_um_prom_date,
                tmp.mnpu_um_record_date,
                tmp.mnpu_time_of_challenge,
                0,
                0,
                AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                sysdate,
                sysdate
            from ams.la_comp_mmxiii_mnpu tmp
            where tmp.record_date = trunc(valRecordDate, 'MM')
                and tmp.mnpu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                and tmp.mnpu_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                --chi lay danh sach cac dai ly ma co truong hop dac biet nay vao thoi
                and tmp.mnpu_status = 1;
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnpu_open', 'Du lieu dac biet chi tiet  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos  := 12;

            /*Do danh sach cac dai ly do tien truong nhom tuyen dung
            tinh FYP trong vong 3 thang truoc thoi diem xet thang tien*/
            /*day la quay nguoc tro lai 3 THANG TRUOC thoi diem xet thang tien*/
            --So lieu o day thi van phai xet khi ma dai ly
            --lay so lieu cua 5 thang truoc do de xu ly cho dung hon
            --KHONG BIET CO DUNG KHONG NUA CO?
            --THUAT TOAN SE DUOC GHI RO O PHIA DUOI NAY
            --Bien i o day la se duoc quet so lieu khi thang tien trong tung thang cua quy quay nguoc tro ve truoc

            --cho nay KHONG CAN THIET NHUNG DA LAM TRINH ROI THI THOI
            for i in 0..2
            loop
                --doi voi tung dai ly duoc thang tien trong tung thang thi bien J nay se lay du lieu dai ly trong 3 thang tro ve truoc khi len lam truong nhom
                --bien J nay la de lay du lieu cua 3 thang truoc khi len lam truong nhom
                --lay du du lieu cho 3 thang cho no
                for j in 1..3
                loop
                --Neu nam trong khoang thoi gian xac dinh o tren thi moi insert vao du lieu con neu khong thi thoi
                    /* Cac dai ly do Tien truong nhom tuyen*/
                    insert /*+ APPEND */ into ams.la_comp_mmxiii_mnpu_detail nologging (
                        outlet_id,
                        outlet_ams_id,
                        record_date,
                        version_date,
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
                        effective_date,
                        terminative_date,
                        position_code,
                        position_date,
                        mnpu_be_paid,
                        mnpu_be_executing,
                        mnpu_data_date,
                        mnpu_outlet_id,
                        mnpu_outlet_ams_id,
                        mnpu_pum_prom_date,
                        mnpu_um_prom_date,
                        mnpu_time_of_challenge,
                        mnpu_period_fyp,
                        mnpu_comp_money,
                        create_user,
                        update_user,
                        create_datetime,
                        update_datetime
                    )
                    select /*+ CARDINALITY(pum, 100) CARDINALITY(empl, 100) CARDINALITY(outl, 100)*/
                        outl.outlet_id,
                        outl.outlet_ams_id,
                        trunc(valRecordDate, 'MM'),
                        trunc(sysdate, 'DD'),
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
                        outl.effective_date,
                        outl.terminative_date,
                        outl.position_code,
                        outl.position_date,
                        AMS_MODL_COMP_MMXIII.BE_PAID_DTL,
                        AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
                        add_months(trunc(valRecordDate, 'MM'), -i - j), --detail date --xu ly o day cho no
                        pum.outlet_id,
                        pum.outlet_ams_id,
                        pum.mnpu_pum_prom_date,
                        pum.mnpu_um_prom_date,
                        null,
                        0,
                        0,
                        AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                        AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                        sysdate,
                        sysdate
                    from
                    (
                        select /*+ CARDINALITY(tmp, 100)*/
                            tmp.outlet_id,
                            tmp.outlet_ams_id,
                            tmp.mnpu_pum_prom_date,
                            tmp.mnpu_um_prom_date,
                            tmp.mnpu_um_record_date
                        from ams.la_comp_mmxiii_mnpu_detail tmp
                        where tmp.record_date = trunc(valRecordDate, 'MM')
                            --lay cac dai ly nhu the nay la duoc roi
                            and tmp.mnpu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                            and tmp.mnpu_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                            --NGAY NAY RAT QUAN TRONG
                            --VA TU NGAY NAY SE QUAY LAI VOI  -I - 1, - I - 2, -I -3 la quay lay 3 thang truoc cho no o phai duoi
                            --duoc thang tien trong vong cac thang
                            --vi du nhu  thang tien trong quy do
                            -- 0 tuc la duoc thang tien trong thang do
                            --  -1 tuc la duoc thang tien trong thang truoc do
                            --   -2 tuc la duoc thang tien trong 2 thang truoc do
                            -- voi xu ly nhu vay thi se lay ra duoc danh sach chinh xac la duoc xet
                            -- thang tien tu thang nao va quay nguoc lai 3 thang de lay FYP cua cac dai ly duoc tuyen truoc thoi diem xet
                            --3 thang nhu vay thi moi chinh xac duoc
                            and tmp.mnpu_um_record_date = add_months(trunc(valRecordDate, 'MM'), -i)  --do i = 0 den 2 nen o day dung nhu the nay la dung
                            --chi xet duoc thang tien trong vong 3 thang nguoc tro lai day
                            --vi chi xet trong quy nhu vay
                            --doan code nay dam bao lay du duoc so lieu cac truong nhom duoc thang tien len trong vong 3 thang dau tien
                            and tmp.mnpu_um_record_date
                                between add_months(trunc(valRecordDate, 'MM'), -2)
                                and trunc(valRecordDate, 'MM')
                    ) pum
                    join
                    (   --lay danh sach cac dai ly do tien truong nhom tuyen vao
                        select /*+ CARDINALITY(tmp, 100)*/
                            tmp.outlet_id,
                            tmp.empl_id
                        from ams.la_prom_history_agent_tmp tmp
                        where tmp.record_date = trunc(valRecordDate, 'MM')
                    ) empl
                        on empl.empl_id = pum.outlet_id
                    join
                    (
                        select /*+ CARDINALITY(data, 100)*/
                            data.record_date,
                            data.outlet_id,
                            data.outlet_ams_id,
                            data.outlet_name,
                            data.company_id,
                            data.company_ams_id,
                            data.company_name,
                            data.office_id,
                            data.office_ams_id,
                            data.office_name,
                            data.agency_id,
                            data.agency_ams_id,
                            data.agency_name,
                            data.unit_id,
                            data.unit_ams_id,
                            data.unit_name,
                            data.effective_date,
                            data.terminative_date,
                            data.position_code,
                            data.position_date
                        from ams.inp_data_outlet_tmp data
                        where data.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                            --lay ra danh sach cac dai ly trong thang day
                            --cho nay thi se lay du lieu cua 3 thang truoc thang day da co roi nhu the thi moi dung duoc
                            --neu i = 0 thi
                            --j se = - i - j do do =   0 - 1= -1, 0 -2 = -2, 0 - 3 = - 3 , --lay trong vong 3 thang truoc
                            --neu i = 1 thi
                            --j se = - i - j do do =  -1 - 1= -2, -1 -2 = -3, -1 - 3 = - 4 , --lay trong vong 3 thang truoc
                            --neu i = 2 thi
                            --j se =   - i - j do do =  -2 - 1= -3, -2 -2 = -4, -2 - 3 = - 5 , --lay trong vong 3 thang truoc
                            --nhu vay la thuat toan nay da dam bao lay ra duoc so lieu trong vong 3 thang truoc cho so lieu cua no

                            and data.record_date = add_months(trunc(valRecordDate, 'MM'), -i - j)--cho nay rat quan trong va da giai thich o phia tren
                            and data.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                            and data.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                    ) outl
                        on outl.outlet_id = empl.outlet_id
                            --dai ly phai duoc tuyen sau khi len duoc lam tien truong nhom roi
                            and outl.effective_date >= pum.mnpu_pum_prom_date
                            --THEM DIEU KIEN NAY CHI LA RANH BUOC CHAT HON
                            --chi lay trong vong 3 thang nguoc tro lai ke tu khi thang tien len lam truong nhom
                            --lay danh sach cac dai ly duoc tuyen vao trong vong khoang thoi gian 3 thang ke tu khi len lam truong nhom tro ve truoc
                            and outl.record_date between add_months(pum.mnpu_um_record_date, -3) and  add_months(pum.mnpu_um_record_date, -1);
                    commit;
                end loop;--cua bien J tuc la so thang quay nguoc lai
            end loop; --cua bien I tuc la de xac dinh duoc thang tien trong vong quy do nguoc lai cho dung

        end if;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnpu_open', 'quay nguoc tro lai 3 THANG TRUOC thoi diem xet thang tien  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_mnpu_open: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_mnpu_data(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
        var_from_date date := valRecordDate;
        var_to_date date := valRecordDate;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        --chay vao thang 3 thi moi tinh cho no
        if to_number(to_char(trunc(valRecordDate, 'MM'), 'MM')) = 3 then
            --quay lai 5 thang de lay du lieu cho no chinh xac hon
            --chi can quay lai neu co du lieu o thang nao thi se xu ly thang do
            --co du lieu la xu ly duoc cho no
            --add_months(trunc(valRecordDate, 'MM'), -i) = mnpu.mnpu_data_date
            for i in 1..5
            loop
                merge /*+ CARDINALITY(mnpu, 100)*/
                    into ams.la_comp_mmxiii_mnpu_detail mnpu
                using
                    (
                        select /*+ CARDINALITY(data, 100)*/
                            data.outlet_ams_id,
                            data.record_date data_date,
                            nvl(data.period_fyp, 0) period_fyp
                        from ams.inp_data_outlet_tmp data
                        where data.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                            --lay du lieu them cho no
                            and data.record_date = add_months(trunc(valRecordDate, 'MM') , -i)
                            and data.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                            and data.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                    ) upd
                on (
                    trunc(valRecordDate, 'MM') = mnpu.record_date
                    and
                    AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnpu.mnpu_be_executing
                    and--chi lay so lieu cho phan chi tiet va cua dai ly do tien truong nhom tuyen vao day
                    AMS_MODL_COMP_MMXIII.BE_PAID_DTL = mnpu.mnpu_be_paid
                    and --chu y la chi can cho nay--data_date o thang day co du lieu la no se co the lay duoc du lieu ra chinh xac cho minh
                    add_months(trunc(valRecordDate, 'MM'), -i) = mnpu.mnpu_data_date --dieu kien nay rat quan trong
                    and
                    upd.outlet_ams_id = mnpu.outlet_ams_id
                )
                when matched then
                    update
                        set
                            mnpu.mnpu_period_fyp = upd.period_fyp;
                commit;
            end loop; --cua bien I tuc la de xac dinh duoc thang tien trong vong quy do nguoc lai cho dung

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnpu_data', 'Chi tiet du lieu tung thang trong 3 thang  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos  := 2;

            /* Tong hop du lieu*/
            merge /*+ CARDINALITY(mnpu, 100)*/
                into ams.la_comp_mmxiii_mnpu_detail mnpu
            using
                (
                    select /*+ CARDINALITY(data, 100)*/
                        data.mnpu_outlet_ams_id, --thong hop theo tien truong nhom
                        sum(nvl(data.mnpu_period_fyp, 0)) mnpu_period_fyp
                    from ams.la_comp_mmxiii_mnpu_detail data
                    where data.record_date = trunc(valRecordDate, 'MM')
                        and data.mnpu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                        --chi lay phan chi tiet ra
                        and data.mnpu_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_DTL
                    group by data.mnpu_outlet_ams_id
                ) upd
            on (
                trunc(valRecordDate, 'MM') = mnpu.record_date
                and
                AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnpu.mnpu_be_executing
                and
                AMS_MODL_COMP_MMXIII.BE_PAID_YES = mnpu.mnpu_be_paid
                and
                upd.mnpu_outlet_ams_id = mnpu.mnpu_outlet_ams_id
            )
            when matched then
                update
                    set
                        mnpu.mnpu_period_fyp = upd.mnpu_period_fyp;
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnpu_data', 'Chi tiet du lieu tung thang trong 3 thang  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos  := 2;

            /*Cap nhat FYP vao bang chinh*/
            merge /*+ CARDINALITY(mnpu, 100)*/
                into ams.la_comp_mmxiii_mnpu mnpu
            using
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.mnpu_outlet_ams_id outlet_ams_id,
                        tmp.mnpu_period_fyp
                    from ams.la_comp_mmxiii_mnpu_detail tmp
                    where tmp.record_date = trunc(valRecordDate, 'MM')
                        and tmp.mnpu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                        and tmp.mnpu_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                ) upd
            on (
                trunc(valRecordDate, 'MM') = mnpu.record_date
                and
                AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnpu.mnpu_be_executing
                and
                AMS_MODL_COMP_MMXIII.BE_PAID_YES = mnpu.mnpu_be_paid
                and--chi tinh lai doi voi cac dai ly ma da thang tien 2 lan trong nam 2012 va day la lan thang tien thu 3 o nam 2013
                1 = mnpu.mnpu_status
                and
                upd.outlet_ams_id = mnpu.outlet_ams_id
                )
            when matched then
                update
                    set--cap nhat FYP
                        mnpu.mnpu_period_fyp = upd.mnpu_period_fyp;
            commit;
        end if;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnpu_data', ' Cap nhat FYP vao bang chinh thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_mnpu_data: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_mnpu_cond(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        if to_number(to_char(trunc(valRecordDate, 'MM'), 'MM')) = 3 then
            /* Cap nhat Ty le duoc huong theo   FYP 3 thang gan thoi diem thang tien cua cac dai ly do TTN tuyen vao*/
            merge /*+ CARDINALITY(mnpu, 100)*/
                into ams.la_comp_mmxiii_mnpu_detail mnpu
            using
                (
                    select --30 den duoi 50 tr thi dc 4 tr
                        30000000 fyp_from,
                        50000000 fyp_to,
                        4000000 comp_money
                    from dual
                    union
                    select--50 den duoi 80 tr thi duoc 7 tr
                        50000000 fyp_from,
                        80000000 fyp_to,
                        7000000 comp_money
                    from dual
                    union
                    select--tren 80 tr thi dc 11 tr
                        80000000 fyp_from,
                        1000000000000 fyp_to,
                        11000000 comp_money
                    from dual
                ) upd
            on (
                trunc(valRecordDate, 'MM') = mnpu.record_date
                and
                AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnpu.mnpu_be_executing
                and
                AMS_MODL_COMP_MMXIII.BE_PAID_YES = mnpu.mnpu_be_paid
                and
                nvl(mnpu.mnpu_period_fyp, 0) >= upd.fyp_from
                and
                nvl(mnpu.mnpu_period_fyp, 0) < upd.fyp_to
                )
            when matched then
                update
                    set
                        mnpu.mnpu_comp_money = upd.comp_money;
            commit;
        end if;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnpu_cond', 'Cap nhat Ty le duoc huong theo   FYP 3 thang    thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_mnpu_cond: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_mnpu_cert(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        var_error_pos  := 2;
        /*Cap nhat so tien duoc nhan neu khong la truong hop dac biet*/
        merge /*+ CARDINALITY(o, 100)*/
            into ams.la_comp_mmxiii_mnpu o
        using
            (
               select /*+ CARDINALITY(tmp, 100)*/
                  tmp.outlet_bvl_id,
                  'D' || tmp.outlet_bvl_id outlet_ams_id,
                  max(tmp.record_date) record_date,
                  max(trunc(tmp.record_date, 'MM')) record_data_date
               from ams.la_comp_certificate tmp
               where tmp.certificate_type is null
               group by tmp.outlet_bvl_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = o.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = o.mnpu_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = o.mnpu_be_paid
            and--chi tinh doi voi cac dai ly ma khong phai la dc xet 2 lan trong nam 2012 va dc len trong lan thu 3 nam 2013
            0 = o.mnpu_status
            and--thoi gian tinh toan phai truoc thoi gian nhan chung chi thi moi duoc nhan tien cho no
            o.record_date >= upd.record_data_date
            and
            upd.outlet_ams_id = o.outlet_ams_id
            )
        when matched then
            update
                set
                    o.mnpu_cert_status = 1, --cap nhat la da co chung chi cho no
                    o.mnpu_cert_date = upd.record_date, --cap nhat ngay nhan chung chi
                    o.mnpu_cert_money = 2000000;--cap nhat so tien duoc nhan
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnpu_comp', 'Cap nhat so tien duoc nhan neu khong la truong hop dac biet   thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));

    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_mnpu_comp: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;


    procedure mmxiii_modl_mnpu_comp(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        if to_number(to_char(trunc(valRecordDate, 'MM'), 'MM')) = 3 then
            /*Cap nhat thuong vao bang chinh*/
            merge /*+ CARDINALITY(mnpu, 100)*/
                into ams.la_comp_mmxiii_mnpu mnpu
            using
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.mnpu_outlet_ams_id outlet_ams_id,
                        sum(nvl(tmp.mnpu_comp_money, 0)) mnpu_comp_money
                    from ams.la_comp_mmxiii_mnpu_detail tmp
                    where tmp.record_date = trunc(valRecordDate, 'MM')
                        and tmp.mnpu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                        and tmp.mnpu_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                        and nvl(tmp.mnpu_comp_money, 0) > 0
                    group by tmp.mnpu_outlet_ams_id
                ) upd
            on (
                trunc(valRecordDate, 'MM') = mnpu.record_date
                and
                AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnpu.mnpu_be_executing
                and
                AMS_MODL_COMP_MMXIII.BE_PAID_YES = mnpu.mnpu_be_paid
                and--chi tinh lai doi voi cac dai ly ma da thang tien 2 lan trong nam 2012 va day la lan thang tien thu 3 o nam 2013
                1 = mnpu.mnpu_status
                and
                upd.outlet_ams_id = mnpu.outlet_ams_id
                )
            when matched then
                update
                    set--cap nhat so tien duoc nhan
                        mnpu.mnpu_comp_money = upd.mnpu_comp_money;
            commit;
        end if;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnpu_comp', 'Cap nhat thuong vao bang chinh thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 2;
        /*Cap nhat so tien duoc nhan neu khong la truong hop dac biet*/
        merge /*+ CARDINALITY(o, 100)*/
            into ams.la_comp_mmxiii_mnpu o
        using
            (
               select  --lan 1 dc 18 tr
                    1 time_of_challenge,
                    18000000 mnpu_comp_money
               from dual
               union
               select --lan 1 dc 13 tr
                    2 time_of_challenge,
                    13000000 mnpu_comp_money
               from dual
               union
               select--lan 3 dc 9 tr
                    3 time_of_challenge,
                    9000000 mnpu_comp_money
               from dual
            ) upd
        on (
            trunc(valRecordDate, 'MM') = o.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = o.mnpu_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = o.mnpu_be_paid
            and--chi tinh doi voi cac dai ly ma khong phai la dc xet 2 lan trong nam 2012 va dc len trong lan thu 3 nam 2013
            0 = o.mnpu_status
            and
            upd.time_of_challenge = nvl(o.mnpu_time_of_challenge, 0)
            )
        when matched then
            update
                set--cap nhat so tien duoc nhan
                    o.mnpu_comp_money = upd.mnpu_comp_money;
        commit;

        /*Cong tong cong tien vao*/
        update la_comp_mmxiii_mnpu tmp
        set tmp.mnpu_total_money = nvl(tmp.mnpu_comp_money, 0) + nvl(tmp.mnpu_cert_money, 0)
        where tmp.record_date = trunc(valRecordDate, 'MM')
            and tmp.mnpu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and tmp.mnpu_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnpu_comp', 'Cap nhat so tien duoc nhan neu khong la truong hop dac biet   thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_mnpu_comp: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_mnpu_close(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Ket thuc qua trinh tinh thu lao Vinh danh tan nghiep
           trong bang la_comp_mmxiii_mnpu*/
        update ams.la_comp_mmxiii_mnpu mnpu
        set
            mnpu.mnpu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO,
            mnpu.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            mnpu.update_datetime = sysdate
        where mnpu.record_date = trunc(valRecordDate, 'MM')
            and mnpu.mnpu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES;
        commit;

        update ams.la_comp_mmxiii_mnpu_detail mnpu
        set
            mnpu.mnpu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO,
            mnpu.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            mnpu.update_datetime = sysdate
        where mnpu.record_date = trunc(valRecordDate, 'MM')
            and mnpu.mnpu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnpu_close', ' Ket thuc qua trinh tinh thu lao   thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_mnpu_close: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;


    procedure mmxiii_modl_agfa(valRecordDate date := null)
    is
    begin
        if (
            AMS_CORE_MODULE.is_active(
                AMS_MODL_COMP_MMXIII.MMXIII_COMP_AGFA,
                trunc(valRecordDate, 'MM')
            ) = AMS_CORE_MODULE.IS_YES
        ) then
            for var_result in (
                select comp_date.compensation_date
                from ams.mod_comp_date comp_date
                where comp_date.module_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_COMP
                    and comp_date.sub_code = AMS_MODL_COMP_MMXIII.MMXIII_COMP_AGFA
                    and comp_date.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                    and comp_date.compensation_date = trunc(valRecordDate, 'MM')
                group by comp_date.compensation_date
            ) loop
                AMS_MODL_COMP_MMXIII.mmxiii_modl_agfa_open(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_agfa_data(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_agfa_cond(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_agfa_comp(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_agfa_close(valRecordDate);
            end loop;
        end if;
    end;

    procedure mmxiii_modl_agfa_open(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Len danh sach du lieu chi tiet can xoa*/
        merge /*+ CARDINALITY(comp, 100)*/
            into ams.la_comp_mmxiii_agfa agfa
        using
            (
                select /*+ CARDINALITY(comp, 100)*/
                    comp.info_company_id company_id
                from ams.la_compensation_mmxiii_tmp comp
                where comp.record_date = trunc(valRecordDate, 'MM')
                    and comp.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
               group by comp.info_company_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = agfa.record_date
            and
            upd.company_id = agfa.company_id
        )
        when matched then
            update
                set
                    agfa.agfa_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_DEL;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agfa_open', 'Len danh sach du lieu chi tiet can xoa   thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 1;

        /* Xoa du lieu chi tiet*/
        loop
            delete ams.la_comp_mmxiii_agfa agfa
            where agfa.record_date = trunc(valRecordDate, 'MM')
                and agfa.agfa_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_DEL
                and rownum < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agfa_open', 'Xoa du lieu chi tiet   thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 2;

        /* Len danh sach chi tiet cua dai ly*/
        for i in 0..2
        loop
            insert /*+ APPEND */ into ams.la_comp_mmxiii_agfa nologging(
                outlet_id,
                outlet_ams_id,
                record_date,
                version_date,
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
                outlet_name,
                effective_date,
                terminative_date,
                position_code,
                position_date,
                agfa_be_paid,
                agfa_be_executing,
                agfa_data_date,
                agfa_period_fyp,
                agfa_period_fyc,
                agfa_period_fypn,
                agfa_period_afis,
                agfa_period_afif,
                agfa_period_pr36,
                agfa_period_issu,
                agfa_period_acti,
                agfa_period_asmt,
                agfa_comp_ratio,
                agfa_comp_money,
                create_user,
                update_user,
                create_datetime,
                update_datetime
            )
            select  /*+ CARDINALITY(outl, 100) */
                outl.outlet_id,
                outl.outlet_ams_id,
                trunc(valRecordDate, 'MM'),
                trunc(sysdate, 'DD'),
                outl.info_company_id,
                outl.info_company_ams_id,
                outl.info_company_name,
                outl.info_office_id,
                outl.info_office_ams_id,
                outl.info_office_name,
                outl.info_agency_id,
                outl.info_agency_ams_id,
                outl.info_agency_name,
                outl.info_unit_id,
                outl.info_unit_ams_id,
                outl.info_unit_name,
                outl.info_outlet_name,
                outl.info_effective_date,
                null,
                outl.info_position_code,
                outl.info_position_date,
                AMS_MODL_COMP_MMXIII.BE_PAID_DTL,
                AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
                add_months(trunc(valRecordDate, 'MM'), -i),
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                AMS_MODL_COMP_MMXIII.AMST_NO,
                0,
                0,
                AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                sysdate,
                sysdate
            from ams.la_compensation_mmxiii_tmp outl
            where outl.record_date = trunc(valRecordDate, 'MM')
                and outl.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                and outl.status_code = AMS_MODL_COMP_MMXIII.STATUS_CURR
                --vao truoc ngay 15 thi moi duoc tinh cho quy nay con khong thi se khong duoc tinh
                and trunc(outl.info_effective_date - 15, 'MM') < add_months(trunc(valRecordDate, 'MM'), -2)
                and trunc(outl.info_effective_date, 'MM') <= add_months(trunc(valRecordDate, 'MM'), -i)
                and add_months(trunc(valRecordDate, 'MM'), -i) >= trunc(valRecordDate, 'YYYY');
            commit;
        end loop;


        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agfa_open', 'Len danh sach chi tiet cua dai ly   thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 3;
        /* So lieu tong hop*/
        insert /*+ APPEND */ into ams.la_comp_mmxiii_agfa nologging(
            outlet_id,
            outlet_ams_id,
            record_date,
            version_date,
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
            outlet_name,
            effective_date,
            terminative_date,
            position_code,
            position_date,
            agfa_be_paid,
            agfa_be_executing,
            agfa_data_date,
            agfa_period_fyp,
            agfa_period_fyc,
            agfa_period_fypn,
            agfa_period_afis,
            agfa_period_afif,
            agfa_period_pr36,
            agfa_period_issu,
            agfa_period_acti,
            agfa_period_asmt,
            agfa_comp_ratio,
            agfa_comp_money,
            create_user,
            update_user,
            create_datetime,
            update_datetime
        )
        select  /*+ CARDINALITY(outl, 100) */
            outl.outlet_id,
            outl.outlet_ams_id,
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            outl.info_company_id,
            outl.info_company_ams_id,
            outl.info_company_name,
            outl.info_office_id,
            outl.info_office_ams_id,
            outl.info_office_name,
            outl.info_agency_id,
            outl.info_agency_ams_id,
            outl.info_agency_name,
            outl.info_unit_id,
            outl.info_unit_ams_id,
            outl.info_unit_name,
            outl.info_outlet_name,
            outl.info_effective_date,
            null,
            outl.info_position_code,
            outl.info_position_date,
            AMS_MODL_COMP_MMXIII.BE_PAID_YES,
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
            trunc(valRecordDate, 'MM'),
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            AMS_MODL_COMP_MMXIII.AMST_YES,
            0,
            0,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.la_compensation_mmxiii_tmp outl
        where outl.record_date = trunc(valRecordDate, 'MM')
            and outl.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and outl.status_code = AMS_MODL_COMP_MMXIII.STATUS_CURR
            and trunc(outl.info_effective_date - 15, 'MM') < add_months(trunc(valRecordDate, 'MM'), -2)
            and trunc(outl.info_effective_date, 'MM') <= add_months(trunc(valRecordDate, 'MM'), -2)
            and add_months(trunc(valRecordDate, 'MM'), -2) >= trunc(valRecordDate, 'YYYY');
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agfa_open', 'So lieu tong hop   thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));

    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_agfa_open: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_agfa_data(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Chi tiet du lieu tung thang*/
        for i in 0..2
        loop
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            merge  /*+ CARDINALITY(agfa, 100)
                  CARDINALITY(upd, 100)
                  LEADING(agfa upd) */
                into ams.la_comp_mmxiii_agfa agfa
            using
                (
                    select /*+ CARDINALITY(data, 100)*/
                        data.outlet_ams_id,
                        data.record_date data_date,
                        nvl(data.period_fyc, 0) period_fyc,
                        nvl(data.period_fyp, 0) period_fyp,
                        nvl(data.period_issue, 0) period_issue
                    from ams.inp_data_outlet_tmp data
                    where data.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                        and data.record_date = add_months(trunc(valRecordDate, 'MM') , -i)
                        and data.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                        and data.status_code = AMS_MODL_COMP_MMXIII.OBJECT_STATUS_ACTIVE
                ) upd
            on (
                trunc(valRecordDate, 'MM') = agfa.record_date
                and
                AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = agfa.agfa_be_executing
                and
                AMS_MODL_COMP_MMXIII.BE_PAID_DTL = agfa.agfa_be_paid
                and
                add_months(trunc(valRecordDate, 'MM') , -i) = agfa.agfa_data_date
                and
                upd.outlet_ams_id = agfa.outlet_ams_id
            )
            when matched then
                update
                    set
                        agfa.agfa_period_fyc = upd.period_fyc,
                        agfa.agfa_period_fyp = upd.period_fyp,
                        agfa.agfa_period_issu = upd.period_issue;
            commit;
        end loop;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agfa_data', 'Chi tiet du lieu tung thang   thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 1;
        /* ACTION*/
        update ams.la_comp_mmxiii_agfa agfa
        set
            agfa.agfa_period_acti = 1,
            agfa.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            agfa.update_datetime = sysdate
        where agfa.record_date = trunc(valRecordDate, 'MM')
            and agfa.agfa_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and agfa.agfa_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_DTL
            and agfa.agfa_data_date
                between add_months(trunc(valRecordDate, 'MM'), -2)
                and trunc(valRecordDate, 'MM')
            and nvl(agfa.agfa_period_issu, 0) > 0;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agfa_data', ' ACTION  thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 2;
        /* FYPN*/
        for i in 0..2
        loop
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            merge  /*+ CARDINALITY(agfa, 100)
                  CARDINALITY(upd, 100)
                  LEADING(agfa upd) */
                into ams.la_comp_mmxiii_agfa agfa
            using
                (
                    select /*+ CARDINALITY(data, 100)*/
                        data.outlet_ams_id,
                        data.record_date,
                        nvl(data.data_value, 0) agfa_period_fypn
                    from ams.mod_data data
                    where data.record_date = add_months(trunc(valRecordDate, 'MM') , -i)
                        and data.module_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                        and data.data_code = AMS_MODL_COMP_MMXIII.DATA_CODE_MAIN_FYN
                ) upd
            on (
                trunc(valRecordDate, 'MM') = agfa.record_date
                and
                AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = agfa.agfa_be_executing
                and
                AMS_MODL_COMP_MMXIII.BE_PAID_DTL = agfa.agfa_be_paid
                and
                add_months(trunc(valRecordDate, 'MM') , -i) = agfa.agfa_data_date
                and
                upd.outlet_ams_id = agfa.outlet_ams_id
            )
            when matched then
                update
                    set
                       agfa.agfa_period_fypn = upd.agfa_period_fypn;
            commit;
        end loop;


        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agfa_data', 'FYPN   thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 3;
        /*merge \*+ CARDINALITY(agfa, 100)*\
            into ams.la_comp_mmxiii_agfa agfa
        using
            (
                select \*+ CARDINALITY(data, 100)*\
                    data.outlet_ams_id,
                    data.record_date,
                    nvl(data.data_value, 0) agfa_period_fypn
                from ams.mod_data data
                where data.record_date
                        between add_months(trunc(valRecordDate, 'MM'), -2)
                        and trunc(valRecordDate, 'MM')
                    and data.module_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                    and data.data_code = AMS_MODL_COMP_MMXIII.DATA_CODE_MAIN_FYN
            ) upd
        on (
            trunc(valRecordDate, 'MM') = agfa.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = agfa.agfa_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_DTL = agfa.agfa_be_paid
            and
            upd.outlet_ams_id = agfa.outlet_ams_id
            and
            upd.record_date = agfa.agfa_data_date
        )
        when matched then
            update
                set
                    agfa.agfa_period_fypn = upd.agfa_period_fypn,
                    agfa.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    agfa.update_datetime = sysdate;
        commit;*/

        /* PR36*/
        merge /*+ CARDINALITY(agfa, 100)*/
            into ams.la_comp_mmxiii_agfa agfa
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_ams_id,
                    data.record_date data_date,
                    nvl(data.period_afis, 0) period_afis,
                    nvl(data.period_afif, 0) period_afif
                from ams.inp_data_outlet_tmp data
                where data.session_id = AMS_MODL_COMP_MMXIII.VAR_SESSION_ID
                    and data.record_date = trunc(valRecordDate, 'MM')
                    and data.type_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_MAIN
                    and data.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
            ) upd
        on (
            trunc(valRecordDate, 'MM') = agfa.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = agfa.agfa_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_DTL = agfa.agfa_be_paid
            and
            upd.outlet_ams_id = agfa.outlet_ams_id
            and
            upd.data_date = agfa.agfa_data_date
        )
        when matched then
            update
                set
                    agfa.agfa_period_afis = upd.period_afis,
                    agfa.agfa_period_afif = upd.period_afif,
                    agfa.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    agfa.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agfa_data', 'PR36   thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 4;

        /* Tong hop so lieu*/
        merge /*+ CARDINALITY(agqr, 100)*/
            into ams.la_comp_mmxiii_agfa agfa
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_ams_id,
                    sum(nvl(data.agfa_period_fyc, 0)) agfa_period_fyc,
                    sum(nvl(data.agfa_period_fyp, 0)) agfa_period_fyp,
                    sum(nvl(data.agfa_period_fypn, 0)) agfa_period_fypn,
                    sum(nvl(data.agfa_period_afis, 0)) agfa_period_afis,
                    sum(nvl(data.agfa_period_afif, 0)) agfa_period_afif,
                    sum(nvl(data.agfa_period_issu, 0)) agfa_period_issu
                from ams.la_comp_mmxiii_agfa data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.agfa_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and data.agfa_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_DTL
                group by data.outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = agfa.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = agfa.agfa_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = agfa.agfa_be_paid
            and
            upd.outlet_ams_id = agfa.outlet_ams_id
        )
        when matched then
            update
                set
                    agfa.agfa_period_fyc = upd.agfa_period_fyc,
                    agfa.agfa_period_fyp = upd.agfa_period_fyp,
                    agfa.agfa_period_fypn = upd.agfa_period_fypn,
                    agfa.agfa_period_afis = upd.agfa_period_afis,
                    agfa.agfa_period_afif = upd.agfa_period_afif,
                    agfa.agfa_period_issu = upd.agfa_period_issu,
                    agfa.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    agfa.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agfa_data', 'Tong hop so lieu   thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 5;

        update ams.la_comp_mmxiii_agfa agfa
        set
            agfa.agfa_period_pr36 =
                round(
                    decode(nvl(agfa.agfa_period_afis, 0),
                        0, 100,
                        least(
                            (nvl(agfa.agfa_period_afif, 0) / nvl(agfa.agfa_period_afis, 0)) * 100,
                            999.99
                        )
                    ),
                    2
                ),
            agfa.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            agfa.update_datetime = sysdate
        where agfa.record_date = trunc(valRecordDate, 'MM')
            and agfa.agfa_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and agfa.agfa_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agfa_data', 'update   thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));

    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_agfa_data: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_agfa_cond(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Xet hoat dong deu trong thang
           FYPN: 6.000.000
           ACTION: YES*/
        update ams.la_comp_mmxiii_agfa agfa
        set
            agfa.agfa_period_asmt = AMS_MODL_COMP_MMXIII.AMST_YES,
            agfa.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            agfa.update_datetime = sysdate
        where agfa.record_date = trunc(valRecordDate, 'MM')
            and agfa.agfa_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and agfa.agfa_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_DTL
            and agfa.agfa_data_date
                between add_months(trunc(valRecordDate, 'MM'), -2)
                and trunc(valRecordDate, 'MM')
            and agfa.agfa_period_fypn >= 6000000
            and agfa.agfa_period_acti >= 1;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agfa_cond', 'Xet hoat dong deu trong thang   thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 1;

        /* Xet hoat dong deu trong ky*/
        merge /*+ CARDINALITY(agfa, 100)*/
            into ams.la_comp_mmxiii_agfa agfa
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_ams_id
                from ams.la_comp_mmxiii_agfa data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.agfa_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and data.agfa_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_DTL
                    and data.agfa_period_asmt = AMS_MODL_COMP_MMXIII.AMST_NO
                group by data.outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = agfa.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = agfa.agfa_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = agfa.agfa_be_paid
            and
            upd.outlet_ams_id = agfa.outlet_ams_id
            )
        when matched then
            update
                set
                    agfa.agfa_period_asmt = AMS_MODL_COMP_MMXIII.AMST_NO,
                    agfa.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    agfa.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agfa_cond', 'Xet hoat dong deu trong ky   thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 2;

        /* Ty le duoc huong theo FYC*/
        merge /*+ CARDINALITY(agfa, 100)*/
            into ams.la_comp_mmxiii_agfa agfa
        using
            (
                select
                    30000000 fyp_from,
                    50000000 fyp_to,
                    1.5 comp_ratio
                from dual
                union
                select
                    50000000 fyp_from,
                    100000000 fyp_to,
                    2.5 comp_ratio
                from dual
                union
                select
                    100000000 fyp_from,
                    1000000000000 fyp_to,
                    4 comp_ratio
                from dual
            ) upd
        on (
            trunc(valRecordDate, 'MM') = agfa.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = agfa.agfa_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = agfa.agfa_be_paid
            and
            AMS_MODL_COMP_MMXIII.AMST_YES = agfa.agfa_period_asmt
            and
            nvl(agfa.agfa_period_fyp, 0) >= upd.fyp_from
            and
            nvl(agfa.agfa_period_fyp, 0)< upd.fyp_to
            )
        when matched then
            update
                set
                    agfa.agfa_comp_ratio = upd.comp_ratio,
                    agfa.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    agfa.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agfa_cond', 'Ty le duoc huong theo FYC   thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));

    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_agfa_cond: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_agfa_comp(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Tinh thu lao hoat dong dai ly*/
        update ams.la_comp_mmxiii_agfa agfa
        set
            agfa.agfa_comp_money = nvl(agfa.agfa_period_fyc, 0) * nvl(agfa.agfa_comp_ratio, 0) / 100,
            agfa.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            agfa.update_datetime = sysdate
        where agfa.record_date = trunc(valRecordDate, 'MM')
            and agfa.agfa_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and agfa.agfa_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            and agfa.agfa_period_asmt = AMS_MODL_COMP_MMXIII.AMST_YES
            and agfa.agfa_period_pr36 >= 85 ; -- AnhNH add PR36 >=85%
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agfa_comp', 'Tinh thu lao hoat dong dai ly   thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));

    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_agfa_comp: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_agfa_close(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Ket thuc qua trinh tinh thu lao hoat dong dai ly*/
        update ams.la_comp_mmxiii_agfa agfa
        set
            agfa.agfa_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO,
            agfa.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            agfa.update_datetime = sysdate
        where agfa.record_date = trunc(valRecordDate, 'MM')
            and agfa.agfa_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agfa_close', 'Ket thuc qua trinh tinh thu lao hoat dong dai ly   thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));

    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_agfa_comp: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;


    /* Thu lao phat trien nhom moi theo quy che 2012 va quy che 2011 vat sang nam 2013
    phan nay thi se phai thuc hien:
    lay du lieu vao bang mod_compensation_mmxii o quy che 2012 cu
    sau do do vao bang mod_comp_mmxii_mnnu  o quy che 2012 cu
    roi merge thuong PTKD cua nam 2013 vao bang mod_comp_mmxii_mnnu
    roi tinh toan thuong Phat trien nhom moi cua nam 2012 vao cot o bang mod_compensation_mmxii o quy che 2012 cu
    roi sau do se merge lai bang chinh la bang la_compensation_mmxiii_tmp */
    procedure mmxiii_modl_mnnu_mmxii(valRecordDate date := null)
    is
    begin
        if (
            AMS_CORE_MODULE.is_active(
                AMS_MODL_COMP_MMXIII.MMXIII_COMP_MNNU_MMXII,
                trunc(valRecordDate, 'MM')
            ) = AMS_CORE_MODULE.IS_YES
        ) then
            for var_result in (
                select comp_date.compensation_date
                from ams.mod_comp_date comp_date
                where comp_date.module_code = AMS_MODL_COMP_MMXIII.MODULE_CODE_COMP
                    and comp_date.sub_code = AMS_MODL_COMP_MMXIII.MMXIII_COMP_MNNU_MMXII
                    and comp_date.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                    and comp_date.compensation_date = trunc(valRecordDate, 'MM')
                group by comp_date.compensation_date
            ) loop
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnnu_mmxii_open(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnnu_mmxii_data(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnnu_mmxii_cond(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnnu_mmxii_comp(valRecordDate);
                AMS_MODL_COMP_MMXIII.mmxiii_modl_mnnu_mmxii_close(valRecordDate);
            end loop;
        end if;
    end;

    procedure mmxiii_modl_mnnu_mmxii_open(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* de chay duoc chuan bi de cho mod_compensation_mmxii.be_executing
        tro lai trang thai BE_EXECUTING_YES do sau khi chay xong roi
        thi no thanh NO bay gio cho lai thanh YES de do duoc du lieu*/
        merge /*+ CARDINALITY(comp, 100)*/
            into ams.mod_compensation_mmxii comp
        using
            (   /*chay theo cong ty o cho nay va cap nhat theo cong ty
                   nhung cong ty nao chay thi moi chay cho cong ty do thoi nhe*/
                select /*+ CARDINALITY(comp, 100)*/
                    comp.info_company_id
                from ams.la_compensation_mmxiii_tmp comp
                where comp.record_date = trunc(valRecordDate, 'MM')
                    and comp.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
               group by comp.info_company_id
            ) upd
            on (
                trunc(valRecordDate, 'MM') = comp.record_date
                and
                upd.info_company_id = comp.info_company_id
            )
        when matched then
            update
                set
                    comp.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES;
        commit;

        /* Su dung bang cu mod_compensation_mmxii
        Len danh sach Tu van vien tinh thu lao phat trien nhom moi*/
        update ams.mod_compensation_mmxii comp
        set
            comp.mnnu_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES,
            comp.mnnu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
            comp.mnnu_position_code = comp.info_position_code,
            comp.mnnu_outlet_id = comp.outlet_id,
            comp.mnnu_outlet_ams_id = comp.outlet_ams_id,
            comp.mnnu_buss_money = 0,
            comp.mnnu_comp_money = 0,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and comp.status_code = AMS_MODL_COMP_MMXIII.STATUS_CURR
            and comp.info_position_code in
            (
                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02,
                AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV04
            );
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnnu_mmxii_open', 'mmxiii_modl_mnnu_mmxii_open 1');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 1;

        /* Len danh sach du lieu chi tiet can xoa*/
        merge /*+ CARDINALITY(mnnu, 100)*/
            into ams.mod_comp_mmxii_mnnu mnnu
        using
            (   /*chay theo cong ty o cho nay va cap nhat theo cong ty*/
                select /*+ CARDINALITY(comp, 100)*/
                    comp.info_company_id company_id
                from ams.mod_compensation_mmxii comp
                where comp.record_date = trunc(valRecordDate, 'MM')
                    and comp.mnnu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and comp.mnnu_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
               group by comp.info_company_id
            ) upd
            on (
                trunc(valRecordDate, 'MM') = mnnu.record_date
                and
                upd.company_id = mnnu.company_id
            )
        when matched then
            update
                set
                    mnnu.mnnu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_DEL;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnnu_mmxii_open', 'mmxiii_modl_mnnu_mmxii_open 1.1');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 1.1;

        /* Xoa du lieu chi tiet theo cong ty hay toan bo cac cong ty o phia tren*/
        loop
            delete ams.mod_comp_mmxii_mnnu mnnu
            where mnnu.record_date = trunc(valRecordDate, 'MM')
                and mnnu.mnnu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_DEL
                and rownum < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_MODL_COMP_MMXIII.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnnu_mmxii_open', 'mmxiii_modl_mnnu_mmxii_open 2');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  :=2;

        /* Du lieu phat trien nhom chi tiet cho thu lao phat trien nhom cua nam 2011 va 2012*/
        insert /*+ APPEND */ into ams.mod_comp_mmxii_mnnu nologging (
            outlet_id, /*truong nhom duoc tach ra*/
            outlet_ams_id,
            branch_id,
            branch_ams_id,
            record_date,
            version_date,
            company_id,
            company_ams_id,
            company_name,
            effective_date,
            terminative_date,
            senr_by_months,
            mnnu_be_paid,
            mnnu_be_executing,
            mnnu_outlet_id,/*ca nhan da co cong phat trien nhom*/
            mnnu_outlet_ams_id,/*ca nhan da co cong phat trien nhom*/
            mnnu_buss_money,
            mnnu_comp_ratio,
            mnnu_comp_money,
            create_user,
            update_user,
            create_datetime,
            update_datetime)
        select /*+ CARDINALITY(comp, 100) CARDINALITY(bran, 100) CARDINALITY(unit, 100) */
            null,
            null,
            bran.branch_id,
            unit.branch_ams_id,
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            comp.info_company_id,
            comp.info_company_ams_id,
            comp.info_company_name,
            trunc(bran.effective_date, 'MM'),
            bran.terminative_date,
            months_between(add_months(trunc(valRecordDate, 'MM'), 1), trunc(bran.effective_date, 'MM')),
            AMS_MODL_COMP_MMXIII.BE_PAID_YES,
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES,
            comp.mnnu_outlet_id,/*ca nhan da co cong phat trien nhom*/
            comp.mnnu_outlet_ams_id,
            0,
            0,
            0,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (   /*lay ra so lieu ve dai ly da co cong phat trien nhom do len kia*/
            select /*+ CARDINALITY(tmp, 100)*/
                tmp.mnnu_outlet_id,
                tmp.mnnu_outlet_ams_id,
                tmp.info_company_id,
                tmp.info_company_ams_id,
                tmp.info_company_name,
                tmp.mnnu_position_code
            from ams.mod_compensation_mmxii tmp
            where tmp.record_date = trunc(valRecordDate, 'MM')
                and tmp.mnnu_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                and tmp.mnnu_be_paid = LIFE_AGENCY_CODE.OUTLET_PAID_YES
        ) comp
        join
        (  /*lay ra cac nhom duoc phat trien va dai ly da co cong phat trien */
            select  /*+ CARDINALITY(tmp, 100)*/
                tmp.branch_id,
                tmp.effective_date,
                tmp.terminative_date,
                tmp.outlet_development_id outlet_id
            from ams.la_branch_development tmp
            where tmp.decisive_date is not null
                and tmp.effective_date is not null
                --chinhlk 21/3/2013 thay doi lai code
                --chi tinh doi voi cac nhom duoc phat trien tu 31/12/2012 tro ve truoc
                --thi se tinh theo chinh sach nam 2012 con khong neu ma phat trien tu 1/1/2013 thi se phai chay theo chinh sach nam 2013 cho no
                --dieu kien la < 1/1/2013 la se lay ra duoc chinh xac thu lao cho no
                and tmp.effective_date < trunc(valRecordDate, 'YYYY') --la < 1/1/2013 cho no la duoc roi
                and trunc(valRecordDate, 'MM') >= tmp.effective_date --toi thoi gian nay van duoc nhan thuong
                and trunc(valRecordDate, 'MM') < nvl(tmp.terminative_date, AMS_MODL_COMP_MMXIII.DATE_MAX_VALUE)
        ) bran
            on bran.outlet_id = comp.mnnu_outlet_id
        join
        (
            select  /*+ CARDINALITY(tmp, 100)*/
                tmp.branch_id,
                tmp.branch_ams_id,
                tmp.branch_name
            from ams.serv_branch_mapping tmp
            where tmp.branch_type = 'NHOM'
                and tmp.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
        ) unit
            on unit.branch_id = bran.branch_id;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnnu_mmxii_open', 'mmxiii_modl_mnnu_mmxii_open 3');
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_mnnu_mmxii_open: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_mnnu_mmxii_data(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Chi tiet phat trien kinh doanh trong thang lay thu lao PTKD
        tu bang la_compensation_mmxiii_tmp cua quy che 2012 sang*/
        /*Lay so lieu ve nhom duoc phat trien len do thi da co thuong PTKD la bao nhieu len
        dong thoi lay ra ten cua truong nhom dat duoc thuong phat trien kinh doanh cho chi tiet*/
        merge /*+ CARDINALITY(mnnu, 100)*/
            into ams.mod_comp_mmxii_mnnu mnnu
        using
            (  /*Lay so lieu ve nhom duoc phat trien len do thi da co thuong PTKD la bao nhieu de dua vao bang chi tiet*/
              /*chinhlk 21/2/2013 sua lai cho nay them group by de de phong loi du lieu o day neu 1 nhom co 2 truong nhom*/
                select /*+ CARDINALITY(data, 100)*/
                    data.mnbs_branch_id branch_id,
                    data.mnbs_branch_ams_id branch_ams_id,
                    max(data.outlet_id) outlet_id,
                    max(data.outlet_ams_id) outlet_ams_id,
                    max(data.info_outlet_name) outlet_name,
                    sum(nvl(data.mnbs_comp_money, 0)) mnnu_buss_money
                from ams.la_compensation_mmxiii_tmp data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.mnbs_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO
                    and data.mnbs_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                group by
                    data.mnbs_branch_id,
                    data.mnbs_branch_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = mnnu.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnnu.mnnu_be_executing
            and
            upd.branch_id = mnnu.branch_id
        )
        when matched then
            update
                set  /*lay ra cac thong tin ve nhom duoc phat trien len co truong nhom va thuong PTKD la bao nhieu*/
                    mnnu.outlet_id = upd.outlet_id,
                    mnnu.outlet_ams_id = upd.outlet_ams_id,
                    mnnu.branch_ams_id = upd.branch_ams_id,
                    mnnu.outlet_name = upd.outlet_name,
                    mnnu.mnnu_buss_money = upd.mnnu_buss_money, /*lay ra thuong PTKD vao bang chi tiet*/
                    mnnu.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    mnnu.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnnu_mmxii_data', 'mmxiii_modl_mnnu_mmxii_data 1');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 1;

        /*Lay tong thuong PTNM vao cot o bang chinh la bang khi tinh thu lao 2012 */
        merge /*+ CARDINALITY(comp, 100)*/
            into ams.mod_compensation_mmxii comp
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.mnnu_outlet_ams_id,
                    sum(nvl(data.mnnu_buss_money, 0)) mnnu_buss_money
                from ams.mod_comp_mmxii_mnnu data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.mnnu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and data.mnnu_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                group by data.mnnu_outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.mnnu_be_executing
            and
            upd.mnnu_outlet_ams_id = comp.mnnu_outlet_ams_id
        )
        when matched then
            update
                set
                    comp.mnnu_buss_money = upd.mnnu_buss_money,
                    comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    comp.update_datetime = sysdate;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnnu_mmxii_data', 'mmxiii_modl_mnnu_mmxii_data 2');
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_mnnu_mmxii_data: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;
    /*chinhlk 31/2/2013 sua lai cho nay de tinh cho chinh xac*/
    procedure mmxiii_modl_mnnu_mmxii_cond(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Cac nhom tach ra trong tu 01-jan-2010 den 31-dec-2011*/
        /*Can phai noi rong terminal date cho cac chi tieu nay den 1/1/2014*/
        merge   /*+ CARDINALITY(mnnu, 100)
                  CARDINALITY(upd, 100)
                  LEADING(mnnu upd) */
            into ams.mod_comp_mmxii_mnnu mnnu
        using
            (
                select
                    l.branch_id company_id,
                    nvl(l.index_from, 0) senr_from,
                    nvl(l.index_to, 1000) senr_to,
                    nvl(l.lookup_number, 0) comp_ratio
                from ams.la_index_lookup l
                where l.decisive_date is not null
                    and (add_months(trunc(valRecordDate, 'MM'), 1) - 1) >= l.effective_date
                    and (add_months(trunc(valRecordDate, 'MM'), 1) - 1) < nvl(l.terminative_date, '1-jan-2099')
                    and l.type_of_agency = 'UNITMANAGER'
                    and l.index_code = 'TIME'
                    and l.group_code = 'NEWUNIT'
                    and l.category_code = 'LIMRA'
            ) upd
        on (
            trunc(valRecordDate, 'MM') = mnnu.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnnu.mnnu_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = mnnu.mnnu_be_paid
            and
            upd.company_id = mnnu.company_id
            and   /*ngay phat trien nhom tu nam 1/1/2010 den 31/12/2011 chu y cho MMXII la nam 2011 tro di*/
            mnnu.effective_date
                between add_months(AMS_MODL_COMP_MMXIII.COMP_DATE_MMXII_BEGN, -24)
                --the nay la se duoc den 31/12/2011 do = 1/1/2012 tru di 1 ngay la dung theo ngay do roi
                and AMS_MODL_COMP_MMXIII.COMP_DATE_MMXII_BEGN - 1
            and
            nvl(mnnu.senr_by_months, 0) >= upd.senr_from
            and
            nvl(mnnu.senr_by_months, 0) < upd.senr_to
            )
        when matched then
            update
                set
                    mnnu.mnnu_comp_ratio = upd.comp_ratio,
                    mnnu.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    mnnu.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnnu_mmxii_cond', 'mmxiii_modl_mnnu_mmxii_cond 1');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 1;

        /* Cac nhom tach ra tu 01-jan-2012 den 31/12/2012 thi se dc tinh nhu sau*/
        merge /*+ CARDINALITY(mnnu, 100)*/
            into ams.mod_comp_mmxii_mnnu mnnu
        using
            (
                select
                    l.branch_id company_id,
                    nvl(l.index_from, 0) senr_from,
                    nvl(l.index_to, 1000) senr_to,
                    nvl(l.lookup_number, 0) comp_ratio
                from ams.la_index_lookup l
                where l.decisive_date is not null
                    and (add_months(trunc(valRecordDate, 'MM'), 1) - 1) >= l.effective_date
                    and (add_months(trunc(valRecordDate, 'MM'), 1) - 1) < nvl(l.terminative_date, '1-jan-2099')
                    and l.type_of_agency = AMS_MODL_COMP_MMXIII.COMP_CODE_MMXIII_CV02
                    and l.index_code = 'TIME'
                    and l.group_code = 'NEWU'
                    and l.category_code = 'COMP'
            ) upd
        on (
            trunc(valRecordDate, 'MM') = mnnu.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = mnnu.mnnu_be_executing
            and
            AMS_MODL_COMP_MMXIII.BE_PAID_YES = mnnu.mnnu_be_paid
            and
            upd.company_id = mnnu.company_id
            and  /*ngay phat trien nhom tu 1/1/2012 den 31/12/2012 thi thuc hien theo quy che nam 2012*/
            mnnu.effective_date
                between add_months(AMS_MODL_COMP_MMXIII.COMP_DATE_MMXIII_BEGN, -12)
                and AMS_MODL_COMP_MMXIII.COMP_DATE_MMXIII_BEGN - 1 --cho nay la 31/12/2012
            and
            nvl(mnnu.senr_by_months, 0) >= upd.senr_from
            and
            nvl(mnnu.senr_by_months, 0) < upd.senr_to
            )
        when matched then
            update
                set
                    mnnu.mnnu_comp_ratio = upd.comp_ratio,
                    mnnu.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    mnnu.update_datetime = sysdate;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnnu_mmxii_cond', 'mmxiii_modl_mnnu_mmxii_cond 2');
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_mnnu_mmxii_cond: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_mnnu_mmxii_comp(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin

        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        update ams.mod_comp_mmxii_mnnu mnnu
        set
            mnnu.mnnu_comp_money = nvl(mnnu.mnnu_buss_money, 0) * nvl(mnnu.mnnu_comp_ratio, 0) / 100,
            mnnu.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            mnnu.update_datetime = sysdate
        where mnnu.record_date = trunc(valRecordDate, 'MM')
            and mnnu.mnnu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
            and mnnu.mnnu_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnnu_mmxii_comp', 'mmxiii_modl_mnnu_mmxii_comp 1');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 1;

        merge /*+ CARDINALITY(comp, 100)*/
            into ams.mod_compensation_mmxii comp
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.mnnu_outlet_ams_id,
                    sum(nvl(data.mnnu_comp_money, 0)) mnnu_comp_money
                from ams.mod_comp_mmxii_mnnu data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.mnnu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
                    and data.mnnu_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
                group by data.mnnu_outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.mnnu_be_executing
            and
            upd.mnnu_outlet_ams_id = comp.mnnu_outlet_ams_id
        )
        when matched then
            update
                set
                    comp.mnnu_comp_money = upd.mnnu_comp_money,
                    comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    comp.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnnu_mmxii_comp', 'mmxiii_modl_mnnu_mmxii_comp 2');
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_mnnu_mmxii_comp: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_mnnu_mmxii_close(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Ket thuc qua trinh tinh thu lao phat trien nhom moi
           trong bang mod_comp_mmxii_mnnu*/
        update ams.mod_comp_mmxii_mnnu mnnu
        set
            mnnu.mnnu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO,
            mnnu.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            mnnu.update_datetime = sysdate
        where mnnu.record_date = trunc(valRecordDate, 'MM')
            and mnnu.mnnu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES;
        commit;

        /* Ket thuc qua trinh tinh thu lao phat trien nhom moi
           trong bang la_compensation_mmxiii_tmp*/
        update ams.mod_compensation_mmxii comp
        set
            comp.mnnu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.mnnu_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES;
        commit;

        /* Ket thuc qua trinh tinh thu lao phat trien nhom moi
           trong bang mod_compensation_mmxii bang chinh cua nam 2012*/
        update ams.mod_compensation_mmxii comp
        set
            comp.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_mnnu_mmxii_close', 'mmxiii_modl_mnnu_mmxii_close 1');
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_mnnu_mmxii_close: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    /* Thuong phat trien nhom moi tu nam 2012 2011 vat sang nam 2013
    OK da review code thi chi can chay no la duoc roi va se hien ra duoc vao day
    cac chi tieu khong can thay doi gi ca*/
    procedure mmxii_modl_mnnu(valRecordDate date := null)
    is
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /*Lay du lieu tu bang mod_compensation_mmxii vua nam 2012 ma da chay phia tren len cho no vao bang nay*/
        merge /*+ CARDINALITY(comp, 100)*/
            into ams.la_compensation_mmxiii_tmp comp
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_id,
                    data.mnnu_comp_money mnnu_comp_money
                from ams.mod_compensation_mmxii data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.mnnu_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.be_executing
            and
            upd.outlet_id = comp.outlet_id
        )
        when matched then
            update
                set
                    comp.comp_mmxii_mnnu = upd.mnnu_comp_money,
                    comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    comp.update_datetime = sysdate;
        commit;
    end;

    /* Thuong phat trien nghe nghiep tu nam 2012 vat sang nam 2013
    Phan nay can cap nhat code cua chinh sach nam 2012 thi moi co the dung duoc */
    procedure mmxii_modl_nagm(valRecordDate date := null)
    is
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        merge /*+ CARDINALITY(comp, 100)*/
            into ams.la_compensation_mmxiii_tmp comp
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_id,
                    data.nagm_comp_money
                from ams.mod_compensation_mmxii data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.nagm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.be_executing
            and
            upd.outlet_id = comp.outlet_id
        )
        when matched then
            update
                set
                    comp.comp_mmxii_nagm = upd.nagm_comp_money,
                    comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    comp.update_datetime = sysdate;
        commit;
    end;

    /* Thuong phat trien ban moi tu nam 2012 vat sang nam 2013
    OK da review code thi chi can chay no la duoc roi va se hien ra duoc vao day
    cac chi tieu khong can thay doi gi ca*/
    procedure mmxii_modl_mnna(valRecordDate date := null)
    is
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        merge /*+ CARDINALITY(comp, 100)*/
            into ams.la_compensation_mmxiii_tmp comp
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_id,
                    data.mnna_comp_money
                from ams.mod_compensation_mmxii data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.mnna_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
            ) upd
        on (
            trunc(valRecordDate, 'MM') = comp.record_date
            and
            AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES = comp.be_executing
            and
            upd.outlet_id = comp.outlet_id
        )
        when matched then
            update
                set
                    comp.comp_mmxii_mnna = upd.mnna_comp_money,
                    comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
                    comp.update_datetime = sysdate;
        commit;
    end;


    procedure mmxiii_modl_comp(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.comp_money =
                nvl(comp.ousl_comp_money, 0) +
                nvl(comp.oucl_comp_money, 0) +

                nvl(comp.mnbs_comp_money, 0) +
                nvl(comp.nagm_comp_money, 0) +
                nvl(comp.agqr_comp_money, 0) +
                nvl(comp.agem_comp_money, 0) +
                nvl(comp.agin_comp_money, 0) +
                nvl(comp.mnqr_comp_money, 0) +
                nvl(comp.mnnu_comp_money, 0) +
                nvl(comp.mnna_comp_money, 0) +
                /*thu lao phat trien nhom moi nam 2011 va nam 2012 vat sang*/
                nvl(comp.comp_mmxii_mnnu, 0) +
                nvl(comp.comp_mmxii_nagm, 0) +
                nvl(comp.comp_mmxii_mnna, 0) +
                0,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_comp', 'mmxiii_modl_comp tong thu lao thang  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_comp: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;


    procedure mmxiii_modl_close(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Ket thuc qua trinh tinh thu lao
           trong bang la_compensation_mmxiii_tmp*/
        update ams.la_compensation_mmxiii_tmp comp
        set
            comp.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO,
            comp.update_user = AMS_MODL_COMP_MMXIII.SYSTEM_USER,
            comp.update_datetime = sysdate
        where comp.record_date = trunc(valRecordDate, 'MM')
            and comp.be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_close', 'mmxiii_modl_close  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_close: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    /*Ket thuc qua trinh tinh toan thu lao*/
    procedure mmxiii_modl_data_complete(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /*Do lai du lieu vao bang la_compensation_mmxiii
        chinhlk 18/3/2013 thay doi do BVNT them yeu cau dua them cap cua nhom*/
        insert /*+ APPEND */ into ams.la_compensation_mmxiii nologging
        (
            outlet_id,
            outlet_ams_id,
            record_date,
            version_date,
            status_code,
            info_outlet_name,
            info_company_id,
            info_company_ams_id,
            info_company_name,
            info_office_id,
            info_office_ams_id,
            info_office_name,
            info_agency_id,
            info_agency_ams_id,
            info_agency_name,
            info_unit_id,
            info_unit_ams_id,
            info_unit_name,
            info_position_code,
            info_position_date,
            info_effective_date,
            info_terminative_date,
            info_senr_by_months,
            be_paid,
            be_executing,
            ousl_be_paid,
            ousl_be_executing,
            ousl_comp_money,
            oucl_be_paid,
            oucl_be_executing,
            oucl_outl_fixd_money,
            oucl_outl_soft_plus_money,
            oucl_outl_soft_minu_money,
            oucl_mana_fixd_money,
            oucl_mana_soft_money,
            oucl_comp_money,
            nagm_be_paid,
            nagm_be_executing,
            nagm_from_date,
            nagm_to_date,
            nagm_effective_date,
            nagm_senr_by_months,
            nagm_period_ip,
            nagm_cond_ip,
            nagm_period_issue,
            nagm_cond_issue,
            nagm_period_afis,
            nagm_period_afif,
            nagm_period_pr36,
            nagm_cond_pr36,
            nagm_period_coll_etmt,
            nagm_period_coll_real,
            nagm_period_coll_rate,
            nagm_cond_coll_rate,
            nagm_comp_money,
            agin_be_paid,
            agin_be_executing,
            agin_outlet_id,
            agin_outlet_ams_id,
            agin_from_date,
            agin_to_date,
            agin_position_code,
            agin_period_empl,
            agin_period_money,
            agin_comp_money,
            agem_be_paid,
            agem_be_executing,
            agem_outlet_id,
            agem_outlet_ams_id,
            agem_from_date,
            agem_to_date,
            agem_position_code,
            agem_period_fyc,
            agem_period_empl,
            agem_comp_ratio,
            agem_comp_money,
            agqr_be_paid,
            agqr_be_executing,
            agqr_outlet_id,
            agqr_outlet_ams_id,
            agqr_effective_date,
            agqr_from_date,
            agqr_to_date,
            agqr_period_fyc,
            agqr_period_fyp,
            agqr_period_afis,
            agqr_period_afif,
            agqr_period_pr36,
            agqr_period_coll_etmt,
            agqr_period_coll_real,
            agqr_period_coll_rate,
            agqr_cond_coll_rate,
            agqr_comp_ratio,
            agqr_comp_money,
            mnbs_be_paid,
            mnbs_be_executing,
            mnbs_position_code,
            mnbs_branch_id,
            mnbs_branch_ams_id,
            mnbs_period_fyp,
            mnbs_period_dire_fyc,
            mnbs_period_dire_fyc_calc,
            mnbs_period_indi_fyc,
            mnbs_period_indi_fyc_calc,
            mnbs_comp_dire_ratio,
            mnbs_comp_indi_ratio,
            mnbs_comp_money,
            mnqr_be_paid,
            mnqr_be_executing,
            mnqr_from_date,
            mnqr_to_date,
            mnqr_position_code,
            mnqr_position_date,
            mnqr_branch_id,
            mnqr_branch_ams_id,
            mnqr_period_fyc,
            mnqr_period_fyc_calc,
            mnqr_period_fyp,
            mnqr_period_empl,
            mnqr_period_qual,
            mnqr_period_afis,
            mnqr_period_afif,
            mnqr_period_pr36,
            mnqr_period_coll_etmt,
            mnqr_period_coll_real,
            mnqr_period_coll_rate,
            mnqr_comp_ratio,
            mnqr_comp_money,
            mnnu_be_paid,
            mnnu_be_executing,
            mnnu_position_code,
            mnnu_outlet_id,
            mnnu_outlet_ams_id,
            mnnu_buss_money,
            mnnu_comp_money,
            mnna_be_paid,
            mnna_be_executing,
            mnna_position_code,
            mnna_outlet_id,
            mnna_outlet_ams_id,
            mnna_period_fyp,
            mnna_deve_count,
            mnna_comp_money,
            comp_mmxii_nagm,
            comp_mmxii_mnnu,
            comp_mmxii_mnna,
            comp_money,
            create_user,
            update_user,
            create_datetime,
            update_datetime,
            --chinhlk 2/4/2013 them vao khi anh them phan mo rong vao cho no
            agqr_period_point,
            agqr_activity_coefficient,
            agqr_comp_money_calc,
            mnbs_period_point,
            mnbs_activity_coefficient,
            mnbs_comp_money_calc,
            mnqr_period_point,
            mnqr_activity_coefficient,
            mnqr_comp_money_calc
        )
        select  /*+ CARDINALITY(tmp, 100)*/
            tmp.outlet_id,
            tmp.outlet_ams_id,
            tmp.record_date,
            tmp.version_date,
            tmp.status_code,
            tmp.info_outlet_name,
            tmp.info_company_id,
            tmp.info_company_ams_id,
            tmp.info_company_name,
            tmp.info_office_id,
            tmp.info_office_ams_id,
            tmp.info_office_name,
            tmp.info_agency_id,
            tmp.info_agency_ams_id,
            tmp.info_agency_name,
            tmp.info_unit_id,
            tmp.info_unit_ams_id,
            tmp.info_unit_name,
            tmp.info_position_code,
            tmp.info_position_date,
            tmp.info_effective_date,
            tmp.info_terminative_date,
            tmp.info_senr_by_months,
            tmp.be_paid,
            tmp.be_executing,
            tmp.ousl_be_paid,
            tmp.ousl_be_executing,
            tmp.ousl_comp_money,
            tmp.oucl_be_paid,
            tmp.oucl_be_executing,
            tmp.oucl_outl_fixd_money,
            tmp.oucl_outl_soft_plus_money,
            tmp.oucl_outl_soft_minu_money,
            tmp.oucl_mana_fixd_money,
            tmp.oucl_mana_soft_money,
            tmp.oucl_comp_money,
            tmp.nagm_be_paid,
            tmp.nagm_be_executing,
            tmp.nagm_from_date,
            tmp.nagm_to_date,
            tmp.nagm_effective_date,
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
            tmp.agin_be_paid,
            tmp.agin_be_executing,
            tmp.agin_outlet_id,
            tmp.agin_outlet_ams_id,
            tmp.agin_from_date,
            tmp.agin_to_date,
            tmp.agin_position_code,
            tmp.agin_period_empl,
            tmp.agin_period_money,
            tmp.agin_comp_money,
            tmp.agem_be_paid,
            tmp.agem_be_executing,
            tmp.agem_outlet_id,
            tmp.agem_outlet_ams_id,
            tmp.agem_from_date,
            tmp.agem_to_date,
            tmp.agem_position_code,
            tmp.agem_period_fyc,
            tmp.agem_period_empl,
            tmp.agem_comp_ratio,
            tmp.agem_comp_money,
            tmp.agqr_be_paid,
            tmp.agqr_be_executing,
            tmp.agqr_outlet_id,
            tmp.agqr_outlet_ams_id,
            tmp.agqr_effective_date,
            tmp.agqr_from_date,
            tmp.agqr_to_date,
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
            tmp.agqr_comp_money,
            tmp.mnbs_be_paid,
            tmp.mnbs_be_executing,
            tmp.mnbs_position_code,
            tmp.mnbs_branch_id,
            tmp.mnbs_branch_ams_id,
            tmp.mnbs_period_fyp,
            tmp.mnbs_period_dire_fyc,
            tmp.mnbs_period_dire_fyc_calc,
            tmp.mnbs_period_indi_fyc,
            tmp.mnbs_period_indi_fyc_calc,
            tmp.mnbs_comp_dire_ratio,
            tmp.mnbs_comp_indi_ratio,
            tmp.mnbs_comp_money,
            tmp.mnqr_be_paid,
            tmp.mnqr_be_executing,
            tmp.mnqr_from_date,
            tmp.mnqr_to_date,
            tmp.mnqr_position_code,
            tmp.mnqr_position_date,
            tmp.mnqr_branch_id,
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
            tmp.mnqr_comp_ratio,
            tmp.mnqr_comp_money,
            tmp.mnnu_be_paid,
            tmp.mnnu_be_executing,
            tmp.mnnu_position_code,
            tmp.mnnu_outlet_id,
            tmp.mnnu_outlet_ams_id,
            tmp.mnnu_buss_money,
            tmp.mnnu_comp_money,
            tmp.mnna_be_paid,
            tmp.mnna_be_executing,
            tmp.mnna_position_code,
            tmp.mnna_outlet_id,
            tmp.mnna_outlet_ams_id,
            tmp.mnna_period_fyp,
            tmp.mnna_deve_count,
            tmp.mnna_comp_money,
            tmp.comp_mmxii_nagm,
            tmp.comp_mmxii_mnnu,
            tmp.comp_mmxii_mnna,
            tmp.comp_money,
            tmp.create_user,
            tmp.update_user,
            tmp.create_datetime,
            tmp.update_datetime,--chinhlk  18/3/2013 thay doi code do BVNT them yeu cau cap cua nhom
            tmp.agqr_period_point,
            tmp.agqr_activity_coefficient,
            tmp.agqr_comp_money_calc,
            tmp.mnbs_period_point,
            tmp.mnbs_activity_coefficient,
            tmp.mnbs_comp_money_calc,
            tmp.mnqr_period_point,
            tmp.mnqr_activity_coefficient,
            tmp.mnqr_comp_money_calc
        from ams.la_compensation_mmxiii_tmp tmp
        where tmp.record_date = trunc(valRecordDate, 'MM');
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_data_complete', 'do vao la_compensation_mmxiii');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;


        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_data_complete', 'gather_table_stats  la_compensation_mmxiii ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_data_complete: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_backup(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
        var_backup_time number(10) := null;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        dbms_stats.gather_table_stats(null, 'la_compensation_mmxiii', cascade => true);

        var_backup_time := dbms_utility.get_time;

        insert /*+ APPEND */ into ams.bak_la_compensation_mmxiii nologging
        (
            outlet_id,
            outlet_ams_id,
            record_date,
            version_date,
            status_code,
            info_outlet_name,
            info_company_id,
            info_company_ams_id,
            info_company_name,
            info_office_id,
            info_office_ams_id,
            info_office_name,
            info_agency_id,
            info_agency_ams_id,
            info_agency_name,
            info_unit_id,
            info_unit_ams_id,
            info_unit_name,
            info_position_code,
            info_position_date,
            info_effective_date,
            info_terminative_date,
            info_senr_by_months,
            be_paid,
            be_executing,
            ousl_be_paid,
            ousl_be_executing,
            ousl_comp_money,
            oucl_be_paid,
            oucl_be_executing,
            oucl_outl_fixd_money,
            oucl_outl_soft_plus_money,
            oucl_outl_soft_minu_money,
            oucl_mana_fixd_money,
            oucl_mana_soft_money,
            oucl_comp_money,
            nagm_be_paid,
            nagm_be_executing,
            nagm_from_date,
            nagm_to_date,
            nagm_effective_date,
            nagm_senr_by_months,
            nagm_period_ip,
            nagm_cond_ip,
            nagm_period_issue,
            nagm_cond_issue,
            nagm_period_afis,
            nagm_period_afif,
            nagm_period_pr36,
            nagm_cond_pr36,
            nagm_period_coll_etmt,
            nagm_period_coll_real,
            nagm_period_coll_rate,
            nagm_cond_coll_rate,
            nagm_comp_money,
            agin_be_paid,
            agin_be_executing,
            agin_outlet_id,
            agin_outlet_ams_id,
            agin_from_date,
            agin_to_date,
            agin_position_code,
            agin_period_empl,
            agin_period_money,
            agin_comp_money,
            agem_be_paid,
            agem_be_executing,
            agem_outlet_id,
            agem_outlet_ams_id,
            agem_from_date,
            agem_to_date,
            agem_position_code,
            agem_period_fyc,
            agem_period_empl,
            agem_comp_ratio,
            agem_comp_money,
            agqr_be_paid,
            agqr_be_executing,
            agqr_outlet_id,
            agqr_outlet_ams_id,
            agqr_effective_date,
            agqr_from_date,
            agqr_to_date,
            agqr_period_fyc,
            agqr_period_fyp,
            agqr_period_afis,
            agqr_period_afif,
            agqr_period_pr36,
            agqr_period_coll_etmt,
            agqr_period_coll_real,
            agqr_period_coll_rate,
            agqr_cond_coll_rate,
            agqr_comp_ratio,
            agqr_comp_money,
            mnbs_be_paid,
            mnbs_be_executing,
            mnbs_position_code,
            mnbs_branch_id,
            mnbs_branch_ams_id,
            mnbs_period_fyp,
            mnbs_period_dire_fyc,
            mnbs_period_dire_fyc_calc,
            mnbs_period_indi_fyc,
            mnbs_period_indi_fyc_calc,
            mnbs_comp_dire_ratio,
            mnbs_comp_indi_ratio,
            mnbs_comp_money,
            mnqr_be_paid,
            mnqr_be_executing,
            mnqr_from_date,
            mnqr_to_date,
            mnqr_position_code,
            mnqr_position_date,
            mnqr_branch_id,
            mnqr_branch_ams_id,
            mnqr_period_fyc,
            mnqr_period_fyc_calc,
            mnqr_period_fyp,
            mnqr_period_empl,
            mnqr_period_qual,
            mnqr_period_afis,
            mnqr_period_afif,
            mnqr_period_pr36,
            mnqr_period_coll_etmt,
            mnqr_period_coll_real,
            mnqr_period_coll_rate,
            mnqr_comp_ratio,
            mnqr_comp_money,
            mnnu_be_paid,
            mnnu_be_executing,
            mnnu_position_code,
            mnnu_outlet_id,
            mnnu_outlet_ams_id,
            mnnu_buss_money,
            mnnu_comp_money,
            mnna_be_paid,
            mnna_be_executing,
            mnna_position_code,
            mnna_outlet_id,
            mnna_outlet_ams_id,
            mnna_period_fyp,
            mnna_deve_count,
            mnna_comp_money,
            comp_mmxii_nagm,
            comp_mmxii_mnnu,
            comp_mmxii_mnna,
            comp_money,
            create_user,
            update_user,
            create_datetime,
            update_datetime,
            agqr_period_point,
            agqr_activity_coefficient,
            agqr_comp_money_calc,
            mnbs_period_point,
            mnbs_activity_coefficient,
            mnbs_comp_money_calc,
            mnqr_period_point,
            mnqr_activity_coefficient,
            mnqr_comp_money_calc,
            backup_time
        )
        select  /*+ CARDINALITY(tmp, 100)*/
            tmp.outlet_id,
            tmp.outlet_ams_id,
            tmp.record_date,
            tmp.version_date,
            tmp.status_code,
            tmp.info_outlet_name,
            tmp.info_company_id,
            tmp.info_company_ams_id,
            tmp.info_company_name,
            tmp.info_office_id,
            tmp.info_office_ams_id,
            tmp.info_office_name,
            tmp.info_agency_id,
            tmp.info_agency_ams_id,
            tmp.info_agency_name,
            tmp.info_unit_id,
            tmp.info_unit_ams_id,
            tmp.info_unit_name,
            tmp.info_position_code,
            tmp.info_position_date,
            tmp.info_effective_date,
            tmp.info_terminative_date,
            tmp.info_senr_by_months,
            tmp.be_paid,
            tmp.be_executing,
            tmp.ousl_be_paid,
            tmp.ousl_be_executing,
            tmp.ousl_comp_money,
            tmp.oucl_be_paid,
            tmp.oucl_be_executing,
            tmp.oucl_outl_fixd_money,
            tmp.oucl_outl_soft_plus_money,
            tmp.oucl_outl_soft_minu_money,
            tmp.oucl_mana_fixd_money,
            tmp.oucl_mana_soft_money,
            tmp.oucl_comp_money,
            tmp.nagm_be_paid,
            tmp.nagm_be_executing,
            tmp.nagm_from_date,
            tmp.nagm_to_date,
            tmp.nagm_effective_date,
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
            tmp.agin_be_paid,
            tmp.agin_be_executing,
            tmp.agin_outlet_id,
            tmp.agin_outlet_ams_id,
            tmp.agin_from_date,
            tmp.agin_to_date,
            tmp.agin_position_code,
            tmp.agin_period_empl,
            tmp.agin_period_money,
            tmp.agin_comp_money,
            tmp.agem_be_paid,
            tmp.agem_be_executing,
            tmp.agem_outlet_id,
            tmp.agem_outlet_ams_id,
            tmp.agem_from_date,
            tmp.agem_to_date,
            tmp.agem_position_code,
            tmp.agem_period_fyc,
            tmp.agem_period_empl,
            tmp.agem_comp_ratio,
            tmp.agem_comp_money,
            tmp.agqr_be_paid,
            tmp.agqr_be_executing,
            tmp.agqr_outlet_id,
            tmp.agqr_outlet_ams_id,
            tmp.agqr_effective_date,
            tmp.agqr_from_date,
            tmp.agqr_to_date,
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
            tmp.agqr_comp_money,
            tmp.mnbs_be_paid,
            tmp.mnbs_be_executing,
            tmp.mnbs_position_code,
            tmp.mnbs_branch_id,
            tmp.mnbs_branch_ams_id,
            tmp.mnbs_period_fyp,
            tmp.mnbs_period_dire_fyc,
            tmp.mnbs_period_dire_fyc_calc,
            tmp.mnbs_period_indi_fyc,
            tmp.mnbs_period_indi_fyc_calc,
            tmp.mnbs_comp_dire_ratio,
            tmp.mnbs_comp_indi_ratio,
            tmp.mnbs_comp_money,
            tmp.mnqr_be_paid,
            tmp.mnqr_be_executing,
            tmp.mnqr_from_date,
            tmp.mnqr_to_date,
            tmp.mnqr_position_code,
            tmp.mnqr_position_date,
            tmp.mnqr_branch_id,
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
            tmp.mnqr_comp_ratio,
            tmp.mnqr_comp_money,
            tmp.mnnu_be_paid,
            tmp.mnnu_be_executing,
            tmp.mnnu_position_code,
            tmp.mnnu_outlet_id,
            tmp.mnnu_outlet_ams_id,
            tmp.mnnu_buss_money,
            tmp.mnnu_comp_money,
            tmp.mnna_be_paid,
            tmp.mnna_be_executing,
            tmp.mnna_position_code,
            tmp.mnna_outlet_id,
            tmp.mnna_outlet_ams_id,
            tmp.mnna_period_fyp,
            tmp.mnna_deve_count,
            tmp.mnna_comp_money,
            tmp.comp_mmxii_nagm,
            tmp.comp_mmxii_mnnu,
            tmp.comp_mmxii_mnna,
            tmp.comp_money,
            tmp.create_user,
            tmp.update_user,
            tmp.create_datetime,
            tmp.update_datetime,
            --chinhlk  them
            tmp.agqr_period_point,
            tmp.agqr_activity_coefficient,
            tmp.agqr_comp_money_calc,
            tmp.mnbs_period_point,
            tmp.mnbs_activity_coefficient,
            tmp.mnbs_comp_money_calc,
            tmp.mnqr_period_point,
            tmp.mnqr_activity_coefficient,
            tmp.mnqr_comp_money_calc,
            var_backup_time
        from ams.la_compensation_mmxiii tmp
        where tmp.record_date = trunc(valRecordDate, 'MM');
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_backup', 'mmxiii_modl_backup  ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_backup: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

end AMS_MODL_COMP_MMXIII;
/
