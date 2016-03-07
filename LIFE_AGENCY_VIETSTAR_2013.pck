create or replace package ams.LIFE_AGENCY_VIETSTAR_2013 is
      MODULE_CODE VARCHAR2(16) := 'VIETSTAR_2013';

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

      STATUS_TERM varchar2(16) := 'TERM';
      STATUS_CURR varchar2(16) := 'CURR';

      STATUS_ROOT varchar2(16) := 'ROOT'; --day la cac dai ly thuoc ban nhom goc
      STATUS_DEVELOP varchar2(16) := 'DEVELOP'; --day la cac dai ly thuoc ban nhom duoc tach ra

      COMP_CODE_MMXIII_CV00 VARCHAR2(16) := 'CV00';
      COMP_CODE_MMXIII_CV01 VARCHAR2(16) := 'CV01';
      COMP_CODE_MMXIII_CV02 VARCHAR2(16) := 'CV02';
      COMP_CODE_MMXIII_CV03 VARCHAR2(16) := 'CV03';
      COMP_CODE_MMXIII_CV04 VARCHAR2(16) := 'CV04';
      COMP_CODE_MMXIII_CV05 VARCHAR2(16) := 'CV05';

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

      COMP_DATE_MMXIII_BEGN date := to_date('1-jan-2013');



      RECORD_MAX_DELETE number(10) := 50000;
      SYSTEM_USER varchar2(16) := 'SYSTEM';
      THEME_LANGUAGE VARCHAR2(16) := 'VN';
      OUTLET_INFO_TYPE_POSI VARCHAR2(16) := 'POSI';

      OBJECT_STATUS_ACTIVE VARCHAR2(16) := 'ACTI';
      OBJECT_STATUS_INACTIVE VARCHAR2(16) := 'INAT';
      OBJECT_STATUS_FREEZE VARCHAR2(16) := 'FRZE';

      FREQ_ONE_PAY number(4,2) := 0.1;

      SYSTEM_REFER_AMS CONSTANT varchar2(16) := 'AMS';
      SYSTEM_REFER_TALISMAN CONSTANT varchar2(16) := 'TAL';
      SYSTEM_REFER_BVLIFE CONSTANT varchar2(16) := 'BVL';

      procedure main;

      procedure vietstar(valRecordDate date := null);

      procedure vietstar_sync(valRecordDate date := null);

      procedure vietstar_fyp(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null);

      procedure vietstar_fyp_ex(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null);

      procedure vietstar_ip_trans(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null);

      procedure vietstar_ip_trans_ex(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null);

      procedure vietstar_afyp_iss(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null);

      procedure vietstar_afyp_inf(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null);

      procedure vietstar_afyp_iss_pr36(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null);

      procedure vietstar_afyp_inf_pr36(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null);

      procedure vietstar_bvl_poli_mana(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null);

      procedure vietstar_bvl_cont_mana(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null);


      procedure vietstar_bvl_cont_term(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null);
    /*
        Creater: Le Khac Chinh
        Date Create: 29/05/2013
        Version: 1.0
        Description: Lay so luong cac Hop dong dao han o BVL tuong ung voi tung dai ly
       Update:
    */
      procedure vietstar_bvl_poli_expire(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null);

      procedure vietstar_tal_poli_sync(valRecordDate date := null);

      procedure vietstar_tal_poli_import(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null);

      procedure vietstar_tal_poli_mana(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null);

      procedure vietstar_tal_cont_mana(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null);

      procedure vietstar_tal_cont_term(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null);

      procedure vietstar_syn_poli_mana(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null);

      procedure vietstar_syn_cont_mana(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null);

      procedure vietstar_syn_cont_term(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null);
    /*
        Creater: Le Khac Chinh
        Date Create: 29/05/2013
        Version: 1.0
        Description: Dong bo so luong cac Hop dong dao han o BVL va TAL tuong ung voi tung dai ly
       Update:
    */
      procedure vietstar_syn_poli_expire(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null);

      procedure run_vietstar(valRecordDate date := null,
          valKeyID number := null);

        procedure run_vietstar_gui(valRecordDate date := null,
            valReRun number := null,
            valRunDevelopment number := null);

      procedure run_vietstar_user(
          valReRun number := null,
          valRunDevelopment number := null);

      procedure export_outlet(valRecordDate date := null,
          valKeyID number := null);

      procedure export_outlet_syn(valRecordDate date := null);

      procedure upload_modl_unit_dev(valRecordDate date := null);

      procedure upload_psvs(valRecordDate date := null);

      procedure list_psvs_fyp(valRecordDate date := null);

      procedure list_psvs_fyp_ex(valRecordDate date := null);


      procedure list_psvs_afyp_issu(valRecordDate date := null);

      procedure list_psvs_afyp_info(valRecordDate date := null);

      procedure list_psvs_pers_rate(valRecordDate date := null);

      procedure list_psvs_coll_prem(valRecordDate date := null);

      procedure list_psvs_real_prem(valRecordDate date := null);

      procedure list_psvs_coll_rate(valRecordDate date := null);

      procedure upload_umvs(valRecordDate date := null);

      procedure list_umvs_temp(valRecordDate date := null);

      procedure list_umvs_fyp(valRecordDate date := null);

      procedure list_umvs_process(valRecordDate date := null);

      procedure list_umvs_pr36(valRecordDate date := null);

      procedure list_umvs_empl(valRecordDate date := null);

      procedure list_umvs_ip_60days(valRecordDate date := null);

      procedure list_umvs_numb_of_nagt(valRecordDate date := null);

      procedure list_umvs_ip(valRecordDate date := null);

      procedure upload_amvs(valRecordDate date := null);

      procedure list_amvs_temp(valRecordDate date := null);

      procedure list_amvs_fyp(valRecordDate date := null);

      procedure upload_coll_prepare(valRecordDate date := null);

      procedure upload_coll(valRecordDate date := null);

      procedure list_coll_fyp(valRecordDate date := null);

      procedure list_coll_numb_of_poli(valRecordDate date := null);

      procedure list_coll_coll_prem(valRecordDate date := null);

      procedure list_coll_real_prem(valRecordDate date := null);

      procedure list_coll_rate(valRecordDate date := null);

      procedure list_coll_cont_mang(valRecordDate date := null);

      procedure list_coll_cont_canc(valRecordDate date := null);

      procedure upload_cagv(valRecordDate date := null);

      procedure list_cagv_temp(valRecordDate date := null);

      procedure list_cagv_fyp(valRecordDate date := null);

      procedure list_cagv_numb_of_poli(valRecordDate date := null);

      procedure list_cagv_coll_prem(valRecordDate date := null);

      procedure list_cagv_real_prem(valRecordDate date := null);

      procedure list_cagv_coll_rate(valRecordDate date := null);

      procedure list_cagv_cont_mang(valRecordDate date := null);

      procedure list_cagv_cont_canc(valRecordDate date := null);

      procedure list_cagv_pers_rate(valRecordDate date := null);

      procedure upload_cumv(valRecordDate date := null);

      procedure list_cumv_temp(valRecordDate date := null);

      procedure list_cumv_clear_temp;

      procedure list_cumv_fyp(valRecordDate date := null);

      procedure list_cumv_fyp_bonus(valRecordDate date := null);

      procedure list_cumv_coll_prem(valRecordDate date := null);

      procedure list_cumv_real_prem(valRecordDate date := null);

      procedure list_cumv_coll_prem_avrg(valRecordDate date := null);

      procedure list_cumv_coll_rate_avrg(valRecordDate date := null);

      procedure list_cumv_cont_mang(valRecordDate date := null);

      procedure list_cumv_cont_canc(valRecordDate date := null);

      procedure list_cumv_pers_rate_avrg(valRecordDate date := null);

      procedure list_cumv_numb_of_agnt(valRecordDate date := null);

      procedure update_trans(valRecordDate date := null);

      procedure close_executing(valRecordDate date := null);

      procedure get_version_date(
          row_records out sys_refcursor);

      procedure get_sv01(valCompanyID number := null,
          row_records out sys_refcursor);

      procedure get_sv02(valCompanyID number := null,
          row_records out sys_refcursor);

      procedure get_sv03(valCompanyID number := null,
          row_records out sys_refcursor);

      procedure get_sv04(valCompanyID number := null,
          row_records out sys_refcursor);

      procedure get_sv05(valCompanyID number := null,
          row_records out sys_refcursor);

      procedure get_sv06(valCompanyID number := null,
          row_records out sys_refcursor);

      procedure get_sv07(valCompanyID number := null,
          row_records out sys_refcursor);

      procedure get_sv08(valCompanyID number := null,
          row_records out sys_refcursor);

      procedure get_sv09(valCompanyID number := null,
          row_records out sys_refcursor);

      procedure get_sv09_01(valCompanyID number := null,
          row_records out sys_refcursor);

      procedure get_sv10(valCompanyID number := null,
          row_records out sys_refcursor);

      procedure get_sv11(valCompanyID number := null,
          row_records out sys_refcursor);

      procedure get_sv12(valCompanyID number := null,
          row_records out sys_refcursor);

      procedure get_sv13(valCompanyID number := null,
          row_records out sys_refcursor);
  end LIFE_AGENCY_VIETSTAR_2013;
/
create or replace package body ams.LIFE_AGENCY_VIETSTAR_2013 is
      procedure main
      is
      begin
          null;
      end;

      ---------------------------------------------------------------------------
      -- VIETSTAR
      ---------------------------------------------------------------------------
      procedure vietstar(valRecordDate date := null)
      is
      begin
          null;
      end;

      procedure vietstar_sync(valRecordDate date := null)
      is
      begin
          --/* FYP: OK
          ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_fyp(
              'FYP',
              trunc(valRecordDate, 'MM'),
              trunc(sysdate, 'DD'),
              ams.LIFE_AGENCY_CODE.FREQUENCY_YEARLY,
              trunc(valRecordDate, 'YYYY'), --to_date('1-jan-2013'),
              add_months(trunc(valRecordDate, 'YYYY'), 11) - 1,  --to_date('30-nov-2013'),
              ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
              ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
          --*/


          --/* FYPE: OK
          ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_fyp_ex(
              'FYPE',
              trunc(valRecordDate, 'MM'),
              trunc(sysdate, 'DD'),
              ams.LIFE_AGENCY_CODE.FREQUENCY_YEARLY,
              trunc(valRecordDate, 'YYYY'),
              add_months(trunc(valRecordDate, 'YYYY'), 11) + 11, --to_date('12-dec-2013'),
              ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
              ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
          --*/
          dbms_stats.gather_table_stats(null, 'la_vietstar_trans_2012', cascade => true);

          --Lay so lieu IP theo giao dich cho no vao day
          ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_ip_trans(
              'IP',
              trunc(valRecordDate, 'MM'),
              trunc(sysdate, 'DD'),
              ams.LIFE_AGENCY_CODE.FREQUENCY_YEARLY,
              trunc(valRecordDate, 'YYYY'),
              add_months(trunc(valRecordDate, 'YYYY'), 11) - 1,  --30/11/2013
              ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
              ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
          --*/


          --/* FYPE: OK
          ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_ip_trans_ex(
              'IPE',
              trunc(valRecordDate, 'MM'),
              trunc(sysdate, 'DD'),
              ams.LIFE_AGENCY_CODE.FREQUENCY_YEARLY,
              add_months(trunc(valRecordDate, 'YYYY'), 11), --to_date('1-dec-2013'),
              add_months(trunc(valRecordDate, 'YYYY'), 11) + 11, --to_date('12-dec-2013'),
              ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
              ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
          --*/
          dbms_stats.gather_table_stats(null, 'la_vietstar_trans_ip', cascade => true);

          --/* AFYP ISSU: OK
          ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_afyp_iss(
              'AFYI',
              trunc(valRecordDate, 'MM'),
              trunc(sysdate, 'DD'),
              ams.LIFE_AGENCY_CODE.FREQUENCY_YEARLY,
              trunc(valRecordDate, 'YYYY'), --to_date('1-jan-2013'),
              add_months(trunc(valRecordDate, 'YYYY'), 11) - 1,  --to_date('30-nov-2013'),
              ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
              ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
          --*/

          --/* AFYP ISSU: OK
          ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_afyp_inf(
              'AFYE',
              trunc(valRecordDate, 'MM'),
              trunc(sysdate, 'DD'),
              ams.LIFE_AGENCY_CODE.FREQUENCY_YEARLY,
              trunc(valRecordDate, 'YYYY'), --to_date('1-jan-2013'),
              add_months(trunc(valRecordDate, 'YYYY'), 11) - 1,  --to_date('30-nov-2013'),
              ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
              ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
          --*/


/*          CHU Y cho nay la:
          Do no chay theo thang tu thang 1 cho den thang 11 va
          moi thang da lay ca dai ly con lam viec va nghi viec cho no roi nen chi can dung bang temp
          the la du roi khong phai thay doi gi ca*/

          --lay so lieu tu BVL len cho no
          --cho toan bo cac dai ly con dang lam viec cho den ngay
          for i in 0..10
          loop

              --/* POLI_MANA: OK So luong hop dong quan ly de tinh so luong hop dong quan ly
              ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_bvl_poli_mana(
                  'POLI_MANA',
                  add_months(trunc(valRecordDate, 'YYYY'), i),
                  trunc(sysdate, 'DD'),
                  ams.LIFE_AGENCY_CODE.FREQUENCY_MONTHLY,
                  add_months(trunc(valRecordDate, 'YYYY'), i),
                  (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                  ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
                  ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
              --*/

              --/* CONT_MANA: OK
              ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_bvl_cont_mana(
                  'CONT_MANA',
                  add_months(trunc(valRecordDate, 'YYYY'), i),
                  trunc(sysdate, 'DD'),
                  ams.LIFE_AGENCY_CODE.FREQUENCY_MONTHLY,
                  add_months(trunc(valRecordDate, 'YYYY'), i),
                  (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                  ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
                  ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
              --*/

              -- CONT_TERM: OK
              ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_bvl_cont_term(
                  'CONT_TERM',
                  add_months(trunc(valRecordDate, 'YYYY'), i),
                  trunc(sysdate, 'DD'),
                  ams.LIFE_AGENCY_CODE.FREQUENCY_MONTHLY,
                  add_months(trunc(valRecordDate, 'YYYY'), i),
                  (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                  ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
                  ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
              --

              --/* POLI_EXPI: OK So luong hop dong dao han
              ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_bvl_poli_expire(
                  'POLI_EXPI',
                  add_months(trunc(valRecordDate, 'YYYY'), i),
                  trunc(sysdate, 'DD'),
                  ams.LIFE_AGENCY_CODE.FREQUENCY_MONTHLY,
                  add_months(trunc(valRecordDate, 'YYYY'), i),
                  (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                  ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
                  ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
              --*/
          end loop;

          dbms_stats.gather_table_stats(null, 'la_outlet_bvlife', cascade => true);

          --lay so lieu tu TAL len cho no
          for i in 0..10
          loop
              --/* POLI_MANA: OK So luong hop dong quan ly de tinh so luong hop dong quan ly
              ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_tal_poli_mana(
                  'POLI_MANA',
                  add_months(trunc(valRecordDate, 'YYYY'), i),
                  trunc(sysdate, 'DD'),
                  ams.LIFE_AGENCY_CODE.FREQUENCY_MONTHLY,
                  add_months(trunc(valRecordDate, 'YYYY'), i),
                  (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                  ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
                  ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
              --*/

              --/* CONT_MANA: OK
              ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_tal_cont_mana(
                  'CONT_MANA',
                  add_months(trunc(valRecordDate, 'YYYY'), i),
                  trunc(sysdate, 'DD'),
                  ams.LIFE_AGENCY_CODE.FREQUENCY_MONTHLY,
                  add_months(trunc(valRecordDate, 'YYYY'), i),
                  (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                  ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
                  ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
              --*/

              -- CONT_TERM: OK
              ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_tal_cont_term(
                  'CONT_TERM',
                  add_months(trunc(valRecordDate, 'YYYY'), i),
                  trunc(sysdate, 'DD'),
                  ams.LIFE_AGENCY_CODE.FREQUENCY_MONTHLY,
                  add_months(trunc(valRecordDate, 'YYYY'), i),
                  (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                  ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
                  ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
              --
          end loop;

          dbms_stats.gather_table_stats(null, 'la_outlet_talisman', cascade => true);


          --sync du lieu cho no
          for i in 0..10
          loop

              --/* POLI_MANA: OK So luong hop dong quan ly de tinh so luong hop dong quan ly
              ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_syn_poli_mana(
                  'POLI_MANA',
                  add_months(trunc(valRecordDate, 'YYYY'), i),
                  trunc(sysdate, 'DD'),
                  ams.LIFE_AGENCY_CODE.FREQUENCY_MONTHLY,
                  add_months(trunc(valRecordDate, 'YYYY'), i),
                  (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                  ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
                  ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
              --*/

              --/* CONT_MANA: OK
              ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_syn_cont_mana(
                  'CONT_MANA',
                  add_months(trunc(valRecordDate, 'YYYY'), i),
                  trunc(sysdate, 'DD'),
                  ams.LIFE_AGENCY_CODE.FREQUENCY_MONTHLY,
                  add_months(trunc(valRecordDate, 'YYYY'), i),
                  (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                  ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
                  ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
              --*/

              --/* CONT_TERM: OK
              ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_syn_cont_term(
                  'CONT_TERM',
                  add_months(trunc(valRecordDate, 'YYYY'), i),
                  trunc(sysdate, 'DD'),
                  ams.LIFE_AGENCY_CODE.FREQUENCY_MONTHLY,
                  add_months(trunc(valRecordDate, 'YYYY'), i),
                  (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                  ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
                  ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);

              --/* POLI_EXPI: OK
              ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_syn_poli_expire(
                  'POLI_EXPI',
                  add_months(trunc(valRecordDate, 'YYYY'), i),
                  trunc(sysdate, 'DD'),
                  ams.LIFE_AGENCY_CODE.FREQUENCY_MONTHLY,
                  add_months(trunc(valRecordDate, 'YYYY'), i),
                  (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                  ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
                  ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);

              --*/
          end loop;

          dbms_stats.gather_table_stats(null, 'la_outlet_index', cascade => true);
      end;

      /* Kiem tra OK
      Hien tai thi ngay hieu luc chua xac dinh duoc va phai dua vao
      mod_data_policy.freq_date
      Chu y la san pham Tu ky nhom khong nam trong CSDL nay nen yen tam
      San pham 1010253 la san pham An gia Thinh Vuong 5 nam thi da loai tru di roi
      */
    /*
        Creater: Le Khac Chinh
        Date Create: 1/6/2013
        Version: 1.0
        Description: Lay cac du lieu ve FYP trong thoi gian thi dua
        Parameter:
            valTypeCode [varchar2]: Kieu du lieu
            valRecordDate [date]: Thang ghi nhan
            valVersionDate [date]: Ngay chay
            valTimeFrequency [varchar2]: Dinh ky
            valBeginDate [date]: Ngay bat dau
            valEndDate [date]: Ngay ket thuc
            valIndexCode [varchar2]: Ma chi tieu
            valRequestCode [varchar2]: Ma yeu cau
        Update:  Le Khac Chinh
            Version: 1.1
            Date Updated: 25/10/2013
            Note:  Fix lai chuong trinh theo yeu cau: ID 119821 cua BA
                      Tinh dung doi voi cac HD dong phi 1 lan chi tinh 10%
    */
      procedure vietstar_fyp(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          loop
              delete ams.la_outlet_index o
              where o.type_code = valTypeCode
                  and o.record_date = trunc(valRecordDate, 'YYYY')
                  and o.time_frequency = valTimeFrequency
                  and o.index_code = valIndexCode
                  and o.request_code = valRequestCode
                  and rownum < ams.LIFE_AGENCY_CODE.MAX_DELETE_NUMBER;
              exit when SQL%rowcount < ams.LIFE_AGENCY_CODE.MAX_DELETE_NUMBER - 1;
              commit;
          end loop;
          commit;

          execute immediate 'truncate table ams.la_vietstar_trans_2012';
          commit;

          /*lay ra toan bo cac giao dich o day*/
          insert /*+ APPEND */ into ams.la_vietstar_trans_2012 nologging
          (
              record_date,
              version_date,
              outlet_ams_id,
              transaction_code,
              transaction_date,
              policy_number,
              transaction_premium,
              transaction_fyp,
              data_source,
              update_datetime
          )
          select  /*+
                     CARDINALITY(key, 100)
                     CARDINALITY(indx, 100)
                     */
              trunc(valRecordDate, 'YYYY'),
              trunc(sysdate, 'DD'),
              indx.outlet_ams_id,
              indx.transaction_code,
              indx.processed_date,
              indx.policy_number,
              indx.transaction_premium,
              indx.transaction_fyp,
              indx.source_of_data,
              sysdate
          from
          (
              select
                  /*+
                  CARDINALITY(trans, 100)
                  CARDINALITY(pol, 100)
                  */
                  trans.outlet_ams_id,
                  trans.policy_number,
                  trans.processed_date,
                  trans.source_of_data,
                  decode(trans.trans_code,
                      'INIT', 'FREQ',
                      'FREQ', 'FREQ',
                      'LUMS', 'TOPU',
                      'CANC', 'RFRE',
                      'NA'
                  ) transaction_code,
                  sum(
                      case
                          when pol_detail.freq_per_annum = LIFE_AGENCY_VIETSTAR_2013.FREQ_ONE_PAY
                              and pol_detail.source_of_data = LIFE_AGENCY_VIETSTAR_2013.SYSTEM_REFER_BVLIFE
                          then 0.1 * nvl(trans.fyp, 0)
                          else nvl(trans.fyp, 0)
                      end
                  ) transaction_premium,
                  sum(
                      case
                          when pol_detail.freq_per_annum = LIFE_AGENCY_VIETSTAR_2013.FREQ_ONE_PAY
                              and pol_detail.source_of_data = LIFE_AGENCY_VIETSTAR_2013.SYSTEM_REFER_BVLIFE
                          then 0.1 * nvl(trans.fyp, 0)
                          else nvl(trans.fyp, 0)
                      end
                  ) transaction_fyp
              from
              (
                  select /*+ CARDINALITY(pol, 100)*/
                      pol.policy_number
                  from ams.mod_data_policy pol
                  where pol.record_date = trunc(valRecordDate, 'MM')
                      and pol.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and pol.changes_code = AMS_MODL_BUSSINESS.POLYC_CODE_PROC
                      and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      and pol.changes_date
                          between valBeginDate
                          and valEndDate
                      and pol.freq_date
                          between valBeginDate
                          and valEndDate
                      and pol.init_ams_id is not null
                      and nvl(pol.main_product_code, '0') not in
                          (
                              '1010369',
                              '1010253'
                          )
                  group by pol.policy_number
                  minus
                  select /*+ CARDINALITY(pol, 100)*/
                      pol.policy_number
                  from ams.mod_data_policy pol
                  where pol.record_date = trunc(valRecordDate, 'MM')
                      and pol.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and pol.changes_code = AMS_MODL_BUSSINESS.DATA_CODE_CANC
                      and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      and pol.changes_date
                          between valBeginDate
                          and (valEndDate + 26)
                      and pol.init_ams_id is not null
                      and nvl(pol.main_product_code, '0') not in
                          (
                              '1010369',
                              '1010253'
                          )
                  group by pol.policy_number
              ) pol
              join
              (
                  select /*+ CARDINALITY(pol, 100)*/
                      pol.policy_number,
                      pol.freq_per_annum,
                      pol.source_of_data
                  from ams.mod_data_policy pol
                  where pol.record_date = trunc(valRecordDate, 'MM')
                      and pol.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and pol.changes_code = AMS_MODL_BUSSINESS.POLYC_CODE_PROC
                      and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      and pol.changes_date
                          between valBeginDate
                          and valEndDate
                      and pol.freq_date
                          between valBeginDate
                          and valEndDate
                      and pol.init_ams_id is not null
                      and nvl(pol.main_product_code, '0') not in
                          (
                              '1010369',
                              '1010253'
                          )
              ) pol_detail
                  on pol_detail.policy_number = pol.policy_number
              join
              (
                  select /*+ CARDINALITY(tmp, 100)*/
                      tmp.outlet_ams_id,
                      tmp.policy_number,
                      tmp.fyp,
                      tmp.source_of_data,
                      tmp.trans_code,
                      tmp.processed_date
                  from ams.mod_data_fyp tmp
                  where tmp.record_date
                          between valBeginDate
                          /*
                          Update by: Le Khac Chinh Ban PTUD
                          Version: 1.7.5.121214
                          Note: Thay doi  tu valEndDate thanh add_months(valEndDate, 1) de truy van cac HD phat hanh muon
                          */
                          and add_months(valEndDate, 1)
                      and tmp.processed_date
                          between valBeginDate
                          and valEndDate
                      and tmp.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and tmp.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      and tmp.policy_number is not null
                      and tmp.outlet_ams_id is not null
              ) trans
                  on trans.policy_number = pol.policy_number
              group by trans.outlet_ams_id,
                  trans.policy_number,
                  trans.processed_date,
                  trans.source_of_data,
                  trans.trans_code
          ) indx;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, valRequestCode, 'vietstar_fyp_ex  - delete +' || valTypeCode || '+' || valTimeFrequency || '-' || to_char(valRecordDate, 'dd/mm/yyyy'));
          ams.life_agency_log.time_begin;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, valRequestCode, 'vietstar_fyp_ex  - delete +' || valTypeCode || '+' || valTimeFrequency || '-' || to_char(valRecordDate, 'dd/mm/yyyy'));
          ams.life_agency_log.time_begin;

          --tong cong vao cho giao dich
          --cho nay thi chi lay cac dai ly con lam viec va da nghi viec trong thang day la du roi
          insert /*+ APPEND */ into ams.la_outlet_index nologging
          select   /*+
                     CARDINALITY(key, 100)
                     CARDINALITY(indx, 100)
                     */
              key.outlet_id,
              valTypeCode,
              trunc(valRecordDate, 'YYYY'),
              valVersionDate,
              valTimeFrequency,
              valBeginDate,
              valEndDate,
              valIndexCode,
              nvl(indx.index_value, 0),
              null,
              null,
              valRequestCode,
              sysdate
          from
          (
              select /*+ CARDINALITY(outl, 100)*/
                  outl.outlet_id,
                  outl.outlet_ams_id
              from ams.la_vietstar_temp_outlet outl
              where outl.record_date = trunc(valRecordDate, 'MM')
                  and outl.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
          ) key
          left join
          (
              select /*+
                        CARDINALITY(trans, 100)
                        CARDINALITY(pol, 100)
                        */
                  trans.outlet_ams_id,
                  sum(
                      case
                          when pol_detail.freq_per_annum = LIFE_AGENCY_VIETSTAR_2013.FREQ_ONE_PAY
                              and pol_detail.source_of_data = LIFE_AGENCY_VIETSTAR_2013.SYSTEM_REFER_BVLIFE
                          then 0.1 * nvl(trans.fyp, 0)
                          else nvl(trans.fyp, 0)
                      end
                  ) index_value
              from
              (
                  select /*+ CARDINALITY(pol, 100)*/
                      pol.policy_number
                  from ams.mod_data_policy pol
                  where pol.record_date = trunc(valRecordDate, 'MM')
                      and pol.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and pol.changes_code = AMS_MODL_BUSSINESS.POLYC_CODE_PROC
                      and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      and pol.changes_date
                          between valBeginDate
                          and valEndDate
                      and pol.freq_date
                          between valBeginDate
                          and valEndDate
                      and pol.init_ams_id is not null
                      and nvl(pol.main_product_code, '0') not in
                          (
                              '1010369',
                              '1010253'
                          )
                  group by pol.policy_number
                  minus
                  select /*+ CARDINALITY(pol, 100)*/
                      pol.policy_number
                  from ams.mod_data_policy pol
                  where pol.record_date = trunc(valRecordDate, 'MM')
                      and pol.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and pol.changes_code = AMS_MODL_BUSSINESS.DATA_CODE_CANC
                      and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      and pol.changes_date
                          between valBeginDate
                          and (valEndDate + 26)
                      and pol.init_ams_id is not null
                      and nvl(pol.main_product_code, '0') not in
                          (
                              '1010369',
                              '1010253'
                          )
                  group by pol.policy_number
              ) pol
              join
              (
                  select /*+ CARDINALITY(pol, 100)*/
                      pol.policy_number,
                      pol.freq_per_annum,
                      pol.source_of_data
                  from ams.mod_data_policy pol
                  where pol.record_date = trunc(valRecordDate, 'MM')
                      and pol.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and pol.changes_code = AMS_MODL_BUSSINESS.POLYC_CODE_PROC
                      and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      and pol.changes_date
                          between valBeginDate
                          and valEndDate
                      and pol.freq_date
                          between valBeginDate
                          and valEndDate
                      and pol.init_ams_id is not null
                      and nvl(pol.main_product_code, '0') not in
                          (
                              '1010369',
                              '1010253'
                          )
              ) pol_detail
                  on pol_detail.policy_number = pol.policy_number
              join
              (
                  select /*+ CARDINALITY(tmp, 100)*/
                      tmp.outlet_ams_id,
                      tmp.policy_number,
                      tmp.fyp
                  from ams.mod_data_fyp tmp
                  where tmp.record_date
                          between valBeginDate
                          /*
                          Update by: Le Khac Chinh Ban PTUD
                          Version: 1.7.5.121214
                          Note: Thay doi  tu valEndDate thanh add_months(valEndDate, 1) de truy van cac HD phat hanh muon
                          */
                          and add_months(valEndDate, 1)
                      and tmp.processed_date
                          between valBeginDate
                          and valEndDate
                      and tmp.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and tmp.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      and tmp.policy_number is not null
                      and tmp.outlet_ams_id is not null
              ) trans
                  on trans.policy_number = pol.policy_number
              group by trans.outlet_ams_id
          ) indx
              on indx.outlet_ams_id = key.outlet_ams_id;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, valRequestCode, 'vietstar_fyp+' || valTypeCode || '+' || valTimeFrequency);
      end;


      /* cho nay phai dung outl.record_date = add_months(trunc(valRecordDate, 'YYYY'), 11)
      boi vi so lieu cua no chay trong thang 12 thi se ra dung duoc ket qua cho no
      lay ra phi dau tien
      Cho nay chi can la dong phi dau tien
      Chi can biet la phi dau tien thi se dua vao khong can biet la no dong vao ngay nao
      Chi can biet no la phat hanh hop dong vao.....
      */
    /*
        Creater: Le Khac Chinh
        Date Create: 1/6/2013
        Version: 1.0
        Description: Lay cac du lieu ve FYP trong thoi gian thi dua o thang 12
        Parameter:
            valTypeCode [varchar2]: Kieu du lieu
            valRecordDate [date]: Thang ghi nhan
            valVersionDate [date]: Ngay chay
            valTimeFrequency [varchar2]: Dinh ky
            valBeginDate [date]: Ngay bat dau
            valEndDate [date]: Ngay ket thuc
            valIndexCode [varchar2]: Ma chi tieu
            valRequestCode [varchar2]: Ma yeu cau
        Update:  Le Khac Chinh
            Version: 1.1
            Date Updated: 25/10/2013
            Note:  Fix lai chuong trinh theo yeu cau: ID 119821 cua BA
                      Tinh dung doi voi cac HD dong phi 1 lan chi tinh 10%
    */
      procedure vietstar_fyp_ex(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          loop
              delete ams.la_outlet_index o
              where o.type_code = valTypeCode
                  /*
                  Update by: Le Khac Chinh Ban PTUD
                  Version: 1.7.5.121214
                  Note: Thay record_date = trunc(valRecordDate, 'YYYY')  thay cho = valRecordDate
                           o doan duoi day
                  */
                  and o.record_date = trunc(valRecordDate, 'YYYY')
                  and o.time_frequency = valTimeFrequency
                  and o.index_code = valIndexCode
                  and o.request_code = valRequestCode
                  and rownum < ams.LIFE_AGENCY_CODE.MAX_DELETE_NUMBER;
              exit when SQL%rowcount < ams.LIFE_AGENCY_CODE.MAX_DELETE_NUMBER - 1;
              commit;
          end loop;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, valRequestCode, 'vietstar_fyp_ex  - delete +' || valTypeCode || '+' || valTimeFrequency || '-' || to_char(valRecordDate, 'dd/mm/yyyy'));
          ams.life_agency_log.time_begin;

          /*lay ra cac giao dich phi dau tien o day*/
          insert /*+ APPEND */ into ams.la_vietstar_trans_2012 nologging
          (
              record_date,
              version_date,
              outlet_ams_id,
              transaction_code,
              transaction_date,
              policy_number,
              transaction_premium,
              transaction_fyp,
              data_source,
              update_datetime
          )
          select  /*+
                     CARDINALITY(key, 100)
                     CARDINALITY(indx, 100)
                     */
              trunc(valRecordDate, 'YYYY'),
              trunc(sysdate, 'DD'),
              indx.outlet_ams_id,
              indx.transaction_code,
              indx.processed_date,
              indx.policy_number,
              indx.transaction_premium,
              indx.transaction_ip,
              indx.source_of_data,
              sysdate
          from
          (
              select
                  /*+
                  CARDINALITY(trans, 100)
                  CARDINALITY(pol, 100)
                  */
                  trans.outlet_ams_id,
                  trans.policy_number,
                  trans.processed_date,
                  trans.source_of_data,
                  'INIT' transaction_code,
                  sum(
                      case
                          when trans.freq_per_annum = LIFE_AGENCY_VIETSTAR_2013.FREQ_ONE_PAY
                              and trans.source_of_data = LIFE_AGENCY_VIETSTAR_2013.SYSTEM_REFER_BVLIFE
                          then 0.1 * nvl(trans.ip, 0)
                          else nvl(trans.ip, 0)
                      end
                  ) transaction_premium,
                  sum(
                      case
                          when trans.freq_per_annum = LIFE_AGENCY_VIETSTAR_2013.FREQ_ONE_PAY
                              and trans.source_of_data = LIFE_AGENCY_VIETSTAR_2013.SYSTEM_REFER_BVLIFE
                          then 0.1 * nvl(trans.ip, 0)
                          else nvl(trans.ip, 0)
                      end
                  ) transaction_ip
              from
              (
                  select /*+ CARDINALITY(pol, 100)*/
                      pol.policy_number
                  from ams.mod_data_policy pol
                  where pol.record_date = add_months(trunc(valRecordDate, 'YYYY'), 11)
                      and pol.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and pol.changes_code = AMS_MODL_BUSSINESS.POLYC_CODE_PROC
                      and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      --truong hop nay la dac biet
                      --ngay phat hanh tu 1/12/2013 den 12/12/2013
                      and pol.changes_date
                          between valBeginDate
                          and valEndDate
                      /*ngay hieu luc phai tu 1/1/2013 cho den 30/11/2013*/
                      /*khong duoc copy nham o day se la bi sai day nhe cho IP bi sai day nhe*/
                      and pol.freq_date
                          between trunc(valRecordDate, 'YYYY')
                          and ( add_months(trunc(valRecordDate, 'YYYY'), 11) - 1)
                      and pol.init_ams_id is not null
                      and nvl(pol.main_product_code, '0') not in
                          (
                              '1010369',
                              '1010253'
                          )
                  group by pol.policy_number
                  minus
                  select /*+ CARDINALITY(pol, 100)*/
                      pol.policy_number
                  from ams.mod_data_policy pol
                  where pol.record_date = add_months(trunc(valRecordDate, 'YYYY'), 11)
                      and pol.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and pol.changes_code = AMS_MODL_BUSSINESS.DATA_CODE_CANC
                      and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      /*ngay huy 14 ngay phai tu nam trong 1/12 den 12+14  thang 12*/
                      and pol.changes_date
                          between valBeginDate
                          and (valEndDate + 14)
                      and pol.init_ams_id is not null
                      and nvl(pol.main_product_code, '0') not in
                          (
                              '1010369',
                              '1010253'
                          )
                  group by pol.policy_number
              ) pol
              inner join
              (   /*lay ra phi dau tien
                  cho nay chua xac dinh duoc ngay nop phi dau tien vao la ngay nao
                  chua lam duoc do phai co xac dinh giao dich dau tien vao day cho no
                  khong can thiet do no tinh cong don cac giao dich vao
                  nhung ma no cung co the tach nhom  trong thoi gian do thi cung hoi kho tinh mot chut
                  nhung khong nen lam o day              */
                  select /*+ CARDINALITY(pol, 100)*/
                      pol.init_ams_id outlet_ams_id,
                      pol.policy_number,
                      pol.freq_date,
                      pol.changes_date processed_date,--tam thoi lay ngay phat hanh hop dong lam ngay xac dinh cac giao dich dong IP vao
                      pol.freq_premium ip,
                      pol.freq_per_annum,
                      pol.source_of_data
                  from ams.mod_data_policy pol
                  where pol.record_date = add_months(trunc(valRecordDate, 'YYYY'), 11)
                      and pol.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and pol.changes_code = AMS_MODL_BUSSINESS.POLYC_CODE_PROC
                      and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      and pol.changes_date
                          between valBeginDate
                          and valEndDate
                      /*ngay hieu luc phai tu 1/1/2013 cho den 30/11/2013*/
                      /*khong duoc copy nham o day se la bi sai day nhe cho IP bi sai day nhe*/
                      and pol.freq_date
                          between trunc(valRecordDate, 'YYYY')
                          and ( add_months(trunc(valRecordDate, 'YYYY'), 11) - 1)
                      and pol.init_ams_id is not null
              ) trans
                  on trans.policy_number = pol.policy_number
              group by trans.outlet_ams_id,
                  trans.policy_number,
                  trans.processed_date,
                  trans.source_of_data
          ) indx;
          commit;

          /*Cap nhat cac thong tin dai ly vao o cuoi cung luon cho tien do phai cap nhat nheiu lan vao 1 bang*/
          merge  /*+ CARDINALITY(o, 100)
                    CARDINALITY(upd, 100)
                    LEADING(o upd) */
              into ams.la_vietstar_trans_2012 o
          using
          (
                  select  /*+ CARDINALITY(o) , 100) */
                      o.outlet_ams_id,
                      max(o.outlet_id)  outlet_id,
                      max(o.outlet_name) outlet_name,
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
                  from ams.la_vietstar_temp_outlet_ext o
                  where o.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
                  group by o.outlet_ams_id
              ) upd
          on (
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
                      o.position_date  = upd.position_date;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, valRequestCode, 'vietstar_fyp_ex - 1 +' || valTypeCode || '+' || valTimeFrequency || '-' || to_char(valRecordDate, 'dd/mm/yyyy'));
          ams.life_agency_log.time_begin;

          insert /*+ APPEND */ into ams.la_outlet_index nologging
          select  /*+
                     CARDINALITY(key, 100)
                     CARDINALITY(indx, 100)
                     */
              key.outlet_id,
              valTypeCode,
              /*
              Update by: Le Khac Chinh Ban PTUD
              Version: 1.7.5.121214
              Note: Sua lai doan nay tu valRecordDate dung trunc(valRecordDate, 'YYYY')
                       o doan duoi day
             */
              trunc(valRecordDate, 'YYYY'),
              valVersionDate,
              valTimeFrequency,
              valBeginDate,
              valEndDate,
              valIndexCode,
              nvl(indx.index_value, 0),
              null,
              null,
              valRequestCode,
              sysdate
          from
          (
              select /*+ CARDINALITY(outl, 100)*/
                  outl.outlet_id,
                  outl.outlet_ams_id
              from ams.la_vietstar_temp_outlet outl
              where outl.record_date = valRecordDate
                  and outl.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
          ) key
          left join
          (
              select
                  /*+
                  CARDINALITY(trans, 100)
                  CARDINALITY(pol, 100)
                  */
                  trans.outlet_ams_id,
                  sum(
                      case
                          when trans.freq_per_annum = LIFE_AGENCY_VIETSTAR_2013.FREQ_ONE_PAY
                              and trans.source_of_data = LIFE_AGENCY_VIETSTAR_2013.SYSTEM_REFER_BVLIFE
                          then 0.1 * nvl(trans.transaction_ip, 0)
                          else nvl(trans.transaction_ip, 0)
                      end
                  ) index_value
              from
              (
                  select /*+ CARDINALITY(pol, 100)*/
                      pol.policy_number
                  from ams.mod_data_policy pol
                  where pol.record_date = add_months(trunc(valRecordDate, 'YYYY'), 11)
                      and pol.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and pol.changes_code = AMS_MODL_BUSSINESS.POLYC_CODE_PROC
                      and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      and pol.changes_date
                          between valBeginDate
                          and valEndDate
                      /*ngay hieu luc phai tu 1/1/2013 cho den 30/11/2013*/
                      /*khong duoc copy nham o day se la bi sai day nhe cho IP bi sai day nhe*/
                      and pol.freq_date
                          between trunc(valRecordDate, 'YYYY')
                          and ( add_months(trunc(valRecordDate, 'YYYY'), 11) - 1)
                      and pol.init_ams_id is not null
                      and nvl(pol.main_product_code, '0') not in
                          (
                              '1010369',
                              '1010253'
                          )
                  group by pol.policy_number
                  minus
                  select /*+ CARDINALITY(pol, 100)*/
                      pol.policy_number
                  from ams.mod_data_policy pol
                  where pol.record_date = add_months(trunc(valRecordDate, 'YYYY'), 11)
                      and pol.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and pol.changes_code = AMS_MODL_BUSSINESS.DATA_CODE_CANC
                      and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      /*ngay huy 14 ngay phai tu nam trong 1/12 den 12+14  thang 12*/
                      and pol.changes_date
                          between valBeginDate
                          and (valEndDate + 14)
                      and pol.init_ams_id is not null
                      and nvl(pol.main_product_code, '0') not in
                          (
                              '1010369',
                              '1010253'
                          )
                  group by pol.policy_number
              ) pol
              inner join
              (   /*lay ra phi dau tien*/
                  select  /*+ CARDINALITY(pol, 100)*/
                      pol.init_ams_id outlet_ams_id,
                      pol.policy_number,
                      pol.freq_premium transaction_ip,
                      pol.freq_per_annum,
                      pol.source_of_data
                  from ams.mod_data_policy pol
                  where pol.record_date = add_months(trunc(valRecordDate, 'YYYY'), 11)
                      and pol.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and pol.changes_code = AMS_MODL_BUSSINESS.POLYC_CODE_PROC
                      and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      and pol.changes_date
                          between valBeginDate
                          and valEndDate
                      /*ngay hieu luc phai tu 1/1/2013 cho den 30/11/2013*/
                      /*khong duoc copy nham o day se la bi sai day nhe cho IP bi sai day nhe*/
                      and pol.freq_date
                          between trunc(valRecordDate, 'YYYY')
                          and ( add_months(trunc(valRecordDate, 'YYYY'), 11) - 1)
                      and pol.init_ams_id is not null
              ) trans
                  on trans.policy_number = pol.policy_number
              group by trans.outlet_ams_id
          ) indx
              on indx.outlet_ams_id = key.outlet_ams_id;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, valRequestCode, 'vietstar_fyp_ex+' || valTypeCode || '+' || valTimeFrequency);
      end;

      /* Kiem tra OK
      Lay cac giao dich IP vao cho no de tinh cho de hon
      mod_data_policy.freq_date
      tinh cho chan thang cho no
      KHONG duoc copy nham nua nhe ngay hieu luc phai the nay
      khong la ngay hieu luc cua no la la nam 2011 thi la se bi sai day nhe
      --ngay hieu luc phai tu 1/1/2013 cho den 30/11/2013
      --khong duoc copy nham o day se la bi sai day nhe cho IP bi sai day nhe
      and pol.freq_date
          between trunc(valRecordDate, 'YYYY')
          and (add_months(trunc(valRecordDate, 'YYYY'), 11) - 1)
      */
    /*
        Creater: Le Khac Chinh
        Date Create: 1/6/2013
        Version: 1.0
        Description: Lay cac du lieu ve IP trong thoi gian thi dua
        Parameter:
            valTypeCode [varchar2]: Kieu du lieu
            valRecordDate [date]: Thang ghi nhan
            valVersionDate [date]: Ngay chay
            valTimeFrequency [varchar2]: Dinh ky
            valBeginDate [date]: Ngay bat dau
            valEndDate [date]: Ngay ket thuc
            valIndexCode [varchar2]: Ma chi tieu
            valRequestCode [varchar2]: Ma yeu cau
        Update:  Le Khac Chinh
            Version: 1.1
            Date Updated: 25/10/2013
            Note:  Fix lai chuong trinh theo yeu cau: ID 119821 cua BA
                      Tinh dung doi voi cac HD dong phi 1 lan chi tinh 10%
    */
      procedure vietstar_ip_trans(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          execute immediate 'truncate table ams.la_vietstar_trans_ip';
          commit;
          insert /*+ APPEND */ into ams.la_vietstar_trans_ip nologging
          (
              record_date,
              version_date,
              outlet_ams_id,
              transaction_code,
              transaction_date,
              policy_number,
              transaction_premium,
              transaction_fyp,
              data_source,
              update_datetime
                          )
          select  /*+
                     CARDINALITY(indx, 100)
                     */
              trunc(valRecordDate, 'YYYY'),
              trunc(sysdate, 'DD'),
              indx.outlet_ams_id,
              indx.transaction_code,
              indx.transaction_date,
              indx.policy_number,
              indx.transaction_premium,
              indx.transaction_ip,
              indx.source_of_data,
              sysdate
          from
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
                  sum(
                      case
                          when trans.freq_per_annum = LIFE_AGENCY_VIETSTAR_2013.FREQ_ONE_PAY
                              and trans.source_of_data = LIFE_AGENCY_VIETSTAR_2013.SYSTEM_REFER_BVLIFE
                          then 0.1 * nvl(trans.ip, 0)
                          else nvl(trans.ip, 0)
                      end
                  ) transaction_premium,
                  sum(
                      case
                          when trans.freq_per_annum = LIFE_AGENCY_VIETSTAR_2013.FREQ_ONE_PAY
                              and trans.source_of_data = LIFE_AGENCY_VIETSTAR_2013.SYSTEM_REFER_BVLIFE
                          then 0.1 * nvl(trans.ip, 0)
                          else nvl(trans.ip, 0)
                      end
                  ) transaction_ip
              from
              (
                  select /*+ CARDINALITY(pol, 100)*/
                      pol.policy_number
                  from ams.mod_data_policy pol
                  where pol.record_date = trunc(valRecordDate, 'MM')
                      and pol.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and pol.changes_code = AMS_MODL_BUSSINESS.POLYC_CODE_PROC
                      and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      and pol.changes_date
                          between valBeginDate
                          and valEndDate
                      /*ngay hieu luc phai tu 1/1/2013 cho den 30/11/2013*/
                      /*khong duoc copy nham o day se la bi sai day nhe cho IP bi sai day nhe*/
                      and pol.freq_date
                          between valBeginDate
                          and valEndDate
                      and pol.init_ams_id is not null
                      and nvl(pol.main_product_code, '0') not in
                          (
                              '1010369',
                              '1010253'
                          )
                  group by pol.policy_number
                  minus
                  select /*+ CARDINALITY(pol, 100)*/
                      pol.policy_number
                  from ams.mod_data_policy pol
                  where pol.record_date = trunc(valRecordDate, 'MM')
                      and pol.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and pol.changes_code = AMS_MODL_BUSSINESS.DATA_CODE_CANC
                      and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      /*ngay huy 14 ngay*/
                      and pol.changes_date
                          between valBeginDate
                          and (valEndDate + 26)
                      and pol.init_ams_id is not null
                      and nvl(pol.main_product_code, '0') not in
                          (
                              '1010369',
                              '1010253'
                          )
                  group by pol.policy_number
              ) pol
              inner join
              (   /*lay ra phi dau tien      */
                  select /*+ CARDINALITY(pol, 100)*/
                      pol.init_ams_id outlet_ams_id,
                      pol.policy_number,
                      pol.freq_date transaction_date,--tam thoi lay ngay hieu luc hop dong hop dong lam ngay xac dinh cac giao dich dong IP vao
                      pol.freq_premium ip,
                      pol.freq_per_annum,
                      pol.source_of_data
                  from ams.mod_data_policy pol
                  where pol.record_date = trunc(valRecordDate, 'MM')
                      and pol.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and pol.changes_code = AMS_MODL_BUSSINESS.POLYC_CODE_PROC
                      and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      and pol.changes_date
                          between valBeginDate
                          and valEndDate
                      /*ngay hieu luc phai tu 1/1/2013 cho den 30/11/2013*/
                      /*khong duoc copy nham o day se la bi sai day nhe cho IP bi sai day nhe*/
                      and pol.freq_date
                          between valBeginDate
                          and valEndDate
                      and pol.init_ams_id is not null
                      and nvl(pol.main_product_code, '0') not in
                          (
                              '1010369',
                              '1010253'
                          )
              ) trans
                  on trans.policy_number = pol.policy_number
              group by trans.outlet_ams_id,
                  trans.policy_number,
                  trans.transaction_date,
                  trans.source_of_data
          ) indx;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, valRequestCode, 'vietstar_ip_trans+' || valTypeCode || '+' || valTimeFrequency);
      end;

      /* Kiem tra OK
      Lay cac giao dich IP vao cho no de tinh cho de hon
      mod_data_policy.freq_date
      tinh cho tu 1/12 den 12/12 cho no
      can phai tinh them doan nay vi tinh IP co NGAY HIEU LUC trong thoi gian thi dua
      con ngay phat hanh o trong 1/12 den 12/12 cung duoc
      KHONG TINH CAC GIAO DICH NAY BOI VI CHI TINH CAC IP TRONG THOI GIAN THI DUA*/
    /*
        Creater: Le Khac Chinh
        Date Create: 1/6/2013
        Version: 1.0
        Description: Lay cac du lieu ve IP trong thang 12
        Parameter:
            valTypeCode [varchar2]: Kieu du lieu
            valRecordDate [date]: Thang ghi nhan
            valVersionDate [date]: Ngay chay
            valTimeFrequency [varchar2]: Dinh ky
            valBeginDate [date]: Ngay bat dau
            valEndDate [date]: Ngay ket thuc
            valIndexCode [varchar2]: Ma chi tieu
            valRequestCode [varchar2]: Ma yeu cau
        Update:  Le Khac Chinh
            Version: 1.1
            Date Updated: 25/10/2013
            Note:  Fix lai chuong trinh theo yeu cau: ID 119821 cua BA
                      Tinh dung doi voi cac HD dong phi 1 lan chi tinh 10%
    */
      procedure vietstar_ip_trans_ex(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;
          insert /*+ APPEND */ into ams.la_vietstar_trans_ip nologging
          (
              record_date,
              version_date,
              outlet_ams_id,
              transaction_code,
              transaction_date,
              policy_number,
              transaction_premium,
              transaction_fyp,
              data_source,
              update_datetime
          )
          select  /*+
                     CARDINALITY(indx, 100)
                     */
              trunc(valRecordDate, 'YYYY'),
              trunc(sysdate, 'DD'),
              indx.outlet_ams_id,
              indx.transaction_code,
              indx.transaction_date,
              indx.policy_number,
              indx.transaction_premium,
              indx.transaction_ip,
              indx.source_of_data,
              sysdate
          from
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
                  sum(
                      case
                          when trans.freq_per_annum = LIFE_AGENCY_VIETSTAR_2013.FREQ_ONE_PAY
                              and trans.source_of_data = LIFE_AGENCY_VIETSTAR_2013.SYSTEM_REFER_BVLIFE
                          then 0.1 * nvl(trans.ip, 0)
                          else nvl(trans.ip, 0)
                      end
                  ) transaction_premium,
                  sum(
                      case
                          when trans.freq_per_annum = LIFE_AGENCY_VIETSTAR_2013.FREQ_ONE_PAY
                              and trans.source_of_data = LIFE_AGENCY_VIETSTAR_2013.SYSTEM_REFER_BVLIFE
                          then 0.1 * nvl(trans.ip, 0)
                          else nvl(trans.ip, 0)
                      end
                  ) transaction_ip
              from
              (
                  select /*+ CARDINALITY(pol, 100)*/
                      pol.policy_number
                  from ams.mod_data_policy pol
                  --add_months(trunc(valRecordDate, 'YYYY'), 11) la dung boi vi
                  --cho nay phai la thang 12 boi vi phat hanh trong thang 12
                  where pol.record_date = add_months(trunc(valRecordDate, 'YYYY'), 11)
                      and pol.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and pol.changes_code = AMS_MODL_BUSSINESS.POLYC_CODE_PROC
                      and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      --phat hanh tu ngay '1-dec-2013' den ngay '12-dec-2013',
                      and pol.changes_date
                          between valBeginDate
                          and valEndDate
                      /*ngay hieu luc phai tu 1/1/2013 cho den 30/11/2013*/
                      /*khong duoc copy nham o day se la bi sai day nhe cho IP bi sai day nhe*/
                      and pol.freq_date
                          between trunc(valRecordDate, 'YYYY')
                          and (add_months(trunc(valRecordDate, 'YYYY'), 11) - 1)
                      and pol.init_ams_id is not null
                      and nvl(pol.main_product_code, '0') not in
                          (
                              '1010369',
                              '1010253'
                          )
                  group by pol.policy_number
                  minus
                  select /*+ CARDINALITY(pol, 100)*/
                      pol.policy_number
                  from ams.mod_data_policy pol
                  where pol.record_date = add_months(trunc(valRecordDate, 'YYYY'), 11)
                      and pol.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and pol.changes_code = AMS_MODL_BUSSINESS.DATA_CODE_CANC
                      and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      /*ngay huy 14 ngay phai tu nam trong 1/12 den 12+14  thang 12*/
                      and pol.changes_date
                          between valBeginDate
                          and (valEndDate + 14)
                      and pol.init_ams_id is not null
                      and nvl(pol.main_product_code, '0') not in
                          (
                              '1010369',
                              '1010253'
                          )
                  group by pol.policy_number
              ) pol
              inner join
              (   /*lay ra phi dau tien      */
                  select /*+ CARDINALITY(pol, 100)*/
                      pol.init_ams_id outlet_ams_id,
                      pol.policy_number,
                      pol.freq_date transaction_date,--tam thoi lay ngay hieu luc hop dong hop dong lam ngay xac dinh cac giao dich dong IP vao
                      pol.freq_premium ip,
                      pol.freq_per_annum,
                      pol.source_of_data
                  from ams.mod_data_policy pol
                  --add_months(trunc(valRecordDate, 'YYYY'), 11) la dung boi vi
                  --cho nay phai la thang 12 boi vi phat hanh trong thang 12
                  where pol.record_date = add_months(trunc(valRecordDate, 'YYYY'), 11)
                      and pol.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and pol.changes_code = AMS_MODL_BUSSINESS.POLYC_CODE_PROC
                      and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      --phat hanh tu ngay '1-dec-2013' den ngay '12-dec-2013' la dung roi
                      and pol.changes_date
                          between valBeginDate
                          and valEndDate
                      /*ngay hieu luc phai tu 1/1/2013 cho den 30/11/2013*/
                      /*khong duoc copy nham o day se la bi sai day nhe cho IP bi sai day nhe*/
                      and pol.freq_date
                          between trunc(valRecordDate, 'YYYY')
                          and (add_months(trunc(valRecordDate, 'YYYY'), 11) - 1)
                      and pol.init_ams_id is not null
                      and nvl(pol.main_product_code, '0') not in
                          (
                              '1010369',
                              '1010253'
                          )
              ) trans
                  on trans.policy_number = pol.policy_number
              group by trans.outlet_ams_id,
                  trans.policy_number,
                  trans.transaction_date,
                  trans.source_of_data
          ) indx;
          commit;


          /*Cap nhat cac thong tin dai ly vao o cuoi cung luon cho tien do phai cap nhat nheiu lan vao 1 bang*/
          merge  /*+ CARDINALITY(o, 100)
                    CARDINALITY(upd, 100)
                    LEADING(o upd) */
              into ams.la_vietstar_trans_ip o
          using
          (
                  select  /*+ CARDINALITY(o) , 100) */
                      o.outlet_ams_id,
                      max(o.outlet_id)  outlet_id,
                      max(o.outlet_name) outlet_name,
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
                  from ams.la_vietstar_temp_outlet_ext o
                  where o.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
                  group by o.outlet_ams_id
              ) upd
          on (
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
                      o.position_date  = upd.position_date;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, valRequestCode, 'vietstar_ip_trans_ex+' || valTypeCode || '+' || valTimeFrequency);
      end;

    /*
        Creater: Le Khac Chinh
        Date Create: 1/6/2013
        Version: 1.0
        Description: Lay cac du lieu ve AFYP phat hanh trong thoi gian thi dua
        Parameter:
            valTypeCode [varchar2]: Kieu du lieu
            valRecordDate [date]: Thang ghi nhan
            valVersionDate [date]: Ngay chay
            valTimeFrequency [varchar2]: Dinh ky
            valBeginDate [date]: Ngay bat dau
            valEndDate [date]: Ngay ket thuc
            valIndexCode [varchar2]: Ma chi tieu
            valRequestCode [varchar2]: Ma yeu cau
        Update:  Le Khac Chinh
            Version: 1.1
            Date Updated: 25/10/2013
            Note:  Fix lai chuong trinh theo yeu cau: ID 119821 cua BA
                      Tinh dung doi voi cac HD dong phi 1 lan chi tinh 10% tuc  AFYP = IP
        Update:  Le Khac Chinh
            Version: 1.2
            Date Updated: 14/11/2013
            Note:  Fix cho ID 121343 cong them AFYP phat hanh cua HD phat hanh tu 1/12 den 12/12
    */
      procedure vietstar_afyp_iss(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          loop
              delete ams.la_outlet_index o
              where o.type_code = valTypeCode
                  and o.record_date = trunc(valRecordDate, 'YYYY')
                  and o.time_frequency = valTimeFrequency
                  and o.index_code = valIndexCode
                  and o.request_code = valRequestCode
                  and rownum < ams.LIFE_AGENCY_CODE.MAX_DELETE_NUMBER;
              exit when SQL%rowcount < ams.LIFE_AGENCY_CODE.MAX_DELETE_NUMBER - 1;
              commit;
          end loop;
          commit;

          insert /*+ APPEND */ into ams.la_outlet_index nologging
          select  /*+
                     CARDINALITY(key, 100)
                     CARDINALITY(indx, 100)
                     */
              key.outlet_id,
              valTypeCode,
              trunc(valRecordDate, 'YYYY'),
              valVersionDate,
              valTimeFrequency,
              valBeginDate,
              valEndDate,
              valIndexCode,
              nvl(indx.index_value, 0) + nvl(indx_ex.index_value, 0),
              null,
              null,
              valRequestCode,
              sysdate
          from
          (
              select /*+ CARDINALITY(outl, 100)*/
                  outl.outlet_id,
                  outl.outlet_ams_id
              from ams.la_vietstar_temp_outlet outl
              where outl.record_date = trunc(valRecordDate, 'MM')
                  and outl.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
          ) key
          left join
          (
              select
                  /*+
                  CARDINALITY(trans, 100)
                  CARDINALITY(pol, 100)
                  */
                  trans.outlet_ams_id,
                  sum(trans.afis) index_value
              from
              (
                  select /*+ CARDINALITY(pol, 100)*/
                      pol.policy_number
                  from ams.mod_data_policy pol
                  where pol.record_date = trunc(valRecordDate, 'MM')
                      and pol.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and pol.changes_code = AMS_MODL_BUSSINESS.POLYC_CODE_PROC
                      and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      /*ngay phat hanh phai <= 30/11/2013*/
                      and pol.changes_date
                          between trunc(valRecordDate, 'YYYY')
                          and add_months(trunc(valRecordDate, 'YYYY'), 11) - 1
                      /*ngay hieu luc phai <= 30/11/2013*/
                      and pol.freq_date
                          between trunc(valRecordDate, 'YYYY')
                          and add_months(trunc(valRecordDate, 'YYYY'), 11) - 1
                      and pol.init_ams_id is not null
                      and nvl(pol.main_product_code, '0') not in
                          (
                              '1010369',
                              '1010253'
                          )
                  group by pol.policy_number
                  minus
                  select /*+ CARDINALITY(pol, 100)*/
                      pol.policy_number
                  from ams.mod_data_policy pol
                  where pol.record_date = trunc(valRecordDate, 'MM')
                      and pol.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and pol.changes_code = AMS_MODL_BUSSINESS.DATA_CODE_CANC
                      and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      /*ngay huy 14 ngay phai tu nam trong 1/1 den 26/12*/
                      and pol.changes_date
                          between trunc(valRecordDate, 'YYYY')
                          and add_months(trunc(valRecordDate, 'YYYY'), 11) - 1 + 26
                      and pol.init_ams_id is not null
                      and nvl(pol.main_product_code, '0') not in
                          (
                              '1010369',
                              '1010253'
                          )
                  group by pol.policy_number
              ) pol
              inner join
              (
                  select  /*+ CARDINALITY(pol, 100)*/
                      pol.init_ams_id outlet_ams_id,
                      pol.policy_number,
                      --neu la san pham NA31 thi tinh nhu the nay
                      case
                          when pol.source_of_data = LIFE_AGENCY_VIETSTAR_2013.SYSTEM_REFER_TALISMAN
                              and pol.freq_per_annum = LIFE_AGENCY_VIETSTAR_2013.FREQ_ONE_PAY
                          then nvl(pol.freq_premium, 0)
                          else nvl(pol.freq_premium, 0) * nvl(pol.freq_per_annum, 0)--cac san pham khac se van giu nguyen
                      end afis
                  from ams.mod_data_policy pol
                  where pol.record_date = trunc(valRecordDate, 'MM')
                      and pol.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and pol.changes_code = AMS_MODL_BUSSINESS.POLYC_CODE_PROC
                      and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      /*ngay phat hanh phai <= 30/11/2013*/
                      and pol.changes_date
                          between trunc(valRecordDate, 'YYYY')
                          and add_months(trunc(valRecordDate, 'YYYY'), 11) - 1
                      /*ngay hieu luc phai <= 30/11/2013*/
                      and pol.freq_date
                          between trunc(valRecordDate, 'YYYY')
                          and add_months(trunc(valRecordDate, 'YYYY'), 11) - 1
                      and pol.init_ams_id is not null
                      and nvl(pol.main_product_code, '0') not in
                          (
                              '1010369',
                              '1010253'
                          )
              ) trans
                  on trans.policy_number = pol.policy_number
              group by trans.outlet_ams_id
          ) indx
              on indx.outlet_ams_id = key.outlet_ams_id
          left join
          (   --lay du lieu afyp phat hanh tu 1/12 den 12/12
              select
                  /*+
                  CARDINALITY(trans, 100)
                  CARDINALITY(pol, 100)
                  */
                  trans.outlet_ams_id,
                  sum(trans.afis) index_value
              from
              (
                  select /*+ CARDINALITY(pol, 100)*/
                      pol.policy_number
                  from ams.mod_data_policy pol
                  where pol.record_date = add_months(trunc(valRecordDate, 'YYYY'), 11)
                      and pol.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and pol.changes_code = AMS_MODL_BUSSINESS.POLYC_CODE_PROC
                      and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      /*ngay phat hanh phai tu 1/12/2013 den 12/12/2013*/
                      and pol.changes_date
                          between add_months(trunc(valRecordDate, 'YYYY'), 11)   --to_date('1-dec-2013')
                          and add_months(trunc(valRecordDate, 'YYYY'), 11) + 11  --to_date('12-dec-2013')
                      /*ngay hieu luc phai <= 30/11/2013*/
                      and pol.freq_date
                          between trunc(valRecordDate, 'YYYY')
                          and add_months(trunc(valRecordDate, 'YYYY'), 11) - 1
                      and pol.init_ams_id is not null
                      and nvl(pol.main_product_code, '0') not in
                          (
                              '1010369',
                              '1010253'
                          )
                  group by pol.policy_number
                  minus
                  select /*+ CARDINALITY(pol, 100)*/
                      pol.policy_number
                  from ams.mod_data_policy pol
                  where pol.record_date = add_months(trunc(valRecordDate, 'YYYY'), 11)
                      and pol.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and pol.changes_code = AMS_MODL_BUSSINESS.DATA_CODE_CANC
                      and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      /*ngay huy 14 ngay phai tu nam trong 1/12 den 26/12*/
                      and pol.changes_date
                          between add_months(trunc(valRecordDate, 'YYYY'), 11)   --to_date('1-dec-2013')
                          and add_months(trunc(valRecordDate, 'YYYY'), 11) - 1 + 26
                      and pol.init_ams_id is not null
                      and nvl(pol.main_product_code, '0') not in
                          (
                              '1010369',
                              '1010253'
                          )
                  group by pol.policy_number
              ) pol
              inner join
              (
                  select  /*+ CARDINALITY(pol, 100)*/
                      pol.init_ams_id outlet_ams_id,
                      pol.policy_number,
                      --neu la san pham NA31 thi tinh nhu the nay
                      case
                          when pol.source_of_data = LIFE_AGENCY_VIETSTAR_2013.SYSTEM_REFER_TALISMAN
                              and pol.freq_per_annum = LIFE_AGENCY_VIETSTAR_2013.FREQ_ONE_PAY
                          then nvl(pol.freq_premium, 0)
                          else nvl(pol.freq_premium, 0) * nvl(pol.freq_per_annum, 0)--cac san pham khac se van giu nguyen
                      end afis
                  from ams.mod_data_policy pol
                  where pol.record_date = add_months(trunc(valRecordDate, 'YYYY'), 11)
                      and pol.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and pol.changes_code = AMS_MODL_BUSSINESS.POLYC_CODE_PROC
                      and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      /*ngay phat hanh phai tu 1/12/2013 den 12/12/2013*/
                      and pol.changes_date
                          between add_months(trunc(valRecordDate, 'YYYY'), 11)   --to_date('1-dec-2013')
                          and add_months(trunc(valRecordDate, 'YYYY'), 11) + 11  --to_date('12-dec-2013')
                      /*ngay hieu luc phai <= 30/11/2013*/
                      and pol.freq_date
                          between trunc(valRecordDate, 'YYYY')
                          and add_months(trunc(valRecordDate, 'YYYY'), 11) - 1
                      and pol.init_ams_id is not null
                      and nvl(pol.main_product_code, '0') not in
                          (
                              '1010369',
                              '1010253'
                          )
              ) trans
                  on trans.policy_number = pol.policy_number
              group by trans.outlet_ams_id
          ) indx_ex
              on indx_ex.outlet_ams_id = key.outlet_ams_id;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, valRequestCode, 'vietstar_afyp_iss+' || valTypeCode || '+' || valTimeFrequency);
      end;

    /*
        Creater: Le Khac Chinh
        Date Create: 1/6/2013
        Version: 1.0
        Description: Lay cac du lieu ve AFYP duy tri trong thoi gian thi dua
        Parameter:
            valTypeCode [varchar2]: Kieu du lieu
            valRecordDate [date]: Thang ghi nhan
            valVersionDate [date]: Ngay chay
            valTimeFrequency [varchar2]: Dinh ky
            valBeginDate [date]: Ngay bat dau
            valEndDate [date]: Ngay ket thuc
            valIndexCode [varchar2]: Ma chi tieu
            valRequestCode [varchar2]: Ma yeu cau
        Update:  Le Khac Chinh
            Version: 1.1
            Date Updated: 25/10/2013
            Note:  Fix lai chuong trinh theo yeu cau: ID 119821 cua BA
                      Tinh dung doi voi cac HD dong phi 1 lan chi tinh 10% tuc  AFYP = IP
        Update:  Le Khac Chinh
            Version: 1.2
            Date Updated: 14/11/2013
            Note:  Fix cho ID 121343 cong them AFYP hieu luc cua HD phat hanh tu 1/12 den 12/12
    */
      procedure vietstar_afyp_inf(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          loop
              delete ams.la_outlet_index o
              where o.type_code = valTypeCode
                  and o.record_date = trunc(valRecordDate, 'YYYY')
                  and o.time_frequency = valTimeFrequency
                  and o.index_code = valIndexCode
                  and o.request_code = valRequestCode
                  and rownum < ams.LIFE_AGENCY_CODE.MAX_DELETE_NUMBER;
              exit when SQL%rowcount < ams.LIFE_AGENCY_CODE.MAX_DELETE_NUMBER - 1;
              commit;
          end loop;
          commit;

          insert /*+ APPEND */ into ams.la_outlet_index nologging
          select  /*+
                     CARDINALITY(key, 100)
                     CARDINALITY(indx, 100)
                     */
              key.outlet_id,
              valTypeCode,
              trunc(valRecordDate, 'YYYY'),
              valVersionDate,
              valTimeFrequency,
              valBeginDate,
              valEndDate,
              valIndexCode,
              nvl(indx.index_value, 0) + nvl(indx_ex.index_value, 0),
              null,
              null,
              valRequestCode,
              sysdate
          from
          (
              select /*+ CARDINALITY(outl, 100)*/
                  outl.outlet_id,
                  outl.outlet_ams_id
              from ams.la_vietstar_temp_outlet outl
              where outl.record_date = valRecordDate
                  and outl.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
          ) key
          left join
          (
              select
                  /*+
                  CARDINALITY(trans, 100)
                  CARDINALITY(pol, 100)
                  */
                  trans.outlet_ams_id,
                  sum(trans.afis) index_value
              from
              (
                  select  /*+ CARDINALITY(pol, 100)*/
                      pol.policy_number
                  from ams.mod_data_policy pol
                  where pol.record_date = valRecordDate
                      and pol.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and pol.changes_code = AMS_MODL_BUSSINESS.POLYC_CODE_PROC
                      and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      /*ngay phat hanh phai <= 30/11/2013*/
                      and pol.changes_date
                          between trunc(valRecordDate, 'YYYY')
                          and add_months(trunc(valRecordDate, 'YYYY'), 11) - 1
                      /*ngay hieu luc phai <= 30/11/2013*/
                      and pol.freq_date
                          between trunc(valRecordDate, 'YYYY')
                          and add_months(trunc(valRecordDate, 'YYYY'), 11) - 1
                      and pol.init_ams_id is not null
                      and nvl(pol.main_product_code, '0') not in
                          (
                              '1010369',
                              '1010253'
                          )
                  group by pol.policy_number
                  minus
                  select /*+ CARDINALITY(pol, 100)*/
                      pol.policy_number
                  from ams.mod_data_policy pol
                  where pol.record_date = valRecordDate
                      and pol.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      and pol.changes_code in (
                           AMS_MODL_BUSSINESS.DATA_CODE_CANC,
                           AMS_MODL_BUSSINESS.DATA_CODE_TERM)
                      /*ngay huy 14 ngay va ngay huy phai tu nam trong 1/1 den 26/12*/
                      and pol.changes_date
                          between trunc(valRecordDate, 'YYYY')
                          and add_months(trunc(valRecordDate, 'YYYY'), 11) - 1 + 26
                      and pol.init_ams_id is not null
                      and nvl(pol.main_product_code, '0') not in
                          (
                              '1010369',
                              '1010253'
                          )
                  group by pol.policy_number
              ) pol
              inner join
              (
                  select /*+ CARDINALITY(pol, 100)*/
                      pol.init_ams_id outlet_ams_id,
                      pol.policy_number,
                      --neu la san pham NA31 thi tinh nhu the nay
                      case
                          when pol.source_of_data = LIFE_AGENCY_VIETSTAR_2013.SYSTEM_REFER_TALISMAN
                              and pol.freq_per_annum = LIFE_AGENCY_VIETSTAR_2013.FREQ_ONE_PAY
                          then nvl(pol.freq_premium, 0)
                          else nvl(pol.freq_premium, 0) * nvl(pol.freq_per_annum, 0)--cac san pham khac se van giu nguyen
                      end afis
                  from ams.mod_data_policy pol
                  where pol.record_date = valRecordDate
                      and pol.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and pol.changes_code = AMS_MODL_BUSSINESS.POLYC_CODE_PROC
                      and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      /*ngay phat hanh phai <= 30/11/2013*/
                      and pol.changes_date
                          between trunc(valRecordDate, 'YYYY')
                          and add_months(trunc(valRecordDate, 'YYYY'), 11) - 1
                      /*ngay hieu luc phai <= 30/11/2013*/
                      and pol.freq_date
                          between trunc(valRecordDate, 'YYYY')
                          and add_months(trunc(valRecordDate, 'YYYY'), 11) - 1
                      and pol.init_ams_id is not null
                      and nvl(pol.main_product_code, '0') not in
                          (
                              '1010369',
                              '1010253'
                          )
              ) trans
                  on trans.policy_number = pol.policy_number
              group by trans.outlet_ams_id
          ) indx
              on indx.outlet_ams_id = key.outlet_ams_id
          left join
          (   --lay du lieu afyp duy tri tu 1/12 den 12/12
              select
                  /*+
                  CARDINALITY(trans, 100)
                  CARDINALITY(pol, 100)
                  */
                  trans.outlet_ams_id,
                  sum(trans.afis) index_value
              from
              (
                  select /*+ CARDINALITY(pol, 100)*/
                      pol.policy_number
                  from ams.mod_data_policy pol
                  where pol.record_date = add_months(trunc(valRecordDate, 'YYYY'), 11)
                      and pol.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and pol.changes_code = AMS_MODL_BUSSINESS.POLYC_CODE_PROC
                      and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      /*ngay phat hanh phai tu 1/12/2013 den 12/12/2013*/
                      and pol.changes_date
                          between add_months(trunc(valRecordDate, 'YYYY'), 11)   --to_date('1-dec-2013')
                          and add_months(trunc(valRecordDate, 'YYYY'), 11) + 11  --to_date('12-dec-2013')
                      /*ngay hieu luc phai <= 30/11/2013*/
                      and pol.freq_date
                          between trunc(valRecordDate, 'YYYY')
                          and add_months(trunc(valRecordDate, 'YYYY'), 11) - 1
                      and pol.init_ams_id is not null
                      and nvl(pol.main_product_code, '0') not in
                          (
                              '1010369',
                              '1010253'
                          )
                  group by pol.policy_number
                  minus
                  select /*+ CARDINALITY(pol, 100)*/
                      pol.policy_number
                  from ams.mod_data_policy pol
                  where pol.record_date = add_months(trunc(valRecordDate, 'YYYY'), 11)
                      and pol.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      and pol.changes_code in (
                           AMS_MODL_BUSSINESS.DATA_CODE_CANC,
                           AMS_MODL_BUSSINESS.DATA_CODE_TERM)
                      /*ngay huy 14 ngay ngay huy phai tu nam trong 1/12 den 26/12*/
                      and pol.changes_date
                          between add_months(trunc(valRecordDate, 'YYYY'), 11)   --to_date('1-dec-2013')
                          and add_months(trunc(valRecordDate, 'YYYY'), 11) - 1 + 26
                      and pol.init_ams_id is not null
                      and nvl(pol.main_product_code, '0') not in
                          (
                              '1010369',
                              '1010253'
                          )
                  group by pol.policy_number
              ) pol
              inner join
              (
                  select  /*+ CARDINALITY(pol, 100)*/
                      pol.init_ams_id outlet_ams_id,
                      pol.policy_number,
                      --neu la san pham NA31 thi tinh nhu the nay
                      case
                          when pol.source_of_data = LIFE_AGENCY_VIETSTAR_2013.SYSTEM_REFER_TALISMAN
                              and pol.freq_per_annum = LIFE_AGENCY_VIETSTAR_2013.FREQ_ONE_PAY
                          then nvl(pol.freq_premium, 0)
                          else nvl(pol.freq_premium, 0) * nvl(pol.freq_per_annum, 0)--cac san pham khac se van giu nguyen
                      end afis
                  from ams.mod_data_policy pol
                  where pol.record_date = add_months(trunc(valRecordDate, 'YYYY'), 11)
                      and pol.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and pol.changes_code = AMS_MODL_BUSSINESS.POLYC_CODE_PROC
                      and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      /*ngay phat hanh phai tu 1/12/2013 den 12/12/2013*/
                      and pol.changes_date
                          between add_months(trunc(valRecordDate, 'YYYY'), 11)   --to_date('1-dec-2013')
                          and add_months(trunc(valRecordDate, 'YYYY'), 11) + 11  --to_date('12-dec-2013')
                      /*ngay hieu luc phai <= 30/11/2013*/
                      and pol.freq_date
                          between trunc(valRecordDate, 'YYYY')
                          and add_months(trunc(valRecordDate, 'YYYY'), 11) - 1
                      and pol.init_ams_id is not null
                      and nvl(pol.main_product_code, '0') not in
                          (
                              '1010369',
                              '1010253'
                          )
              ) trans
                  on trans.policy_number = pol.policy_number
              group by trans.outlet_ams_id
          ) indx_ex
              on indx_ex.outlet_ams_id = key.outlet_ams_id;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, valRequestCode, 'vietstar_afyp_inf+' || valTypeCode || '+' || valTimeFrequency);
      end;

    /*
        Creater: Le Khac Chinh
        Date Create: 8/11/2013
        Version: 1.0
        Description: Lay cac du lieu ve AFYP phat hanh trong thoi gian 36 thang de tinh thi dua truong nhom
                            Lay ca du lieu dai ly nghi viec vao roi sau do trong bang do thi se loai di la duoc
        Parameter:
            valTypeCode [varchar2]: Kieu du lieu
            valRecordDate [date]: Thang ghi nhan
            valVersionDate [date]: Ngay chay
            valTimeFrequency [varchar2]: Dinh ky
            valBeginDate [date]: Ngay bat dau
            valEndDate [date]: Ngay ket thuc
            valIndexCode [varchar2]: Ma chi tieu
            valRequestCode [varchar2]: Ma yeu cau
    */
      procedure vietstar_afyp_iss_pr36(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          loop
              delete ams.la_outlet_index o
              where o.type_code = valTypeCode
                  and o.record_date = trunc(valRecordDate, 'YYYY')
                  and o.time_frequency = valTimeFrequency
                  and o.index_code = valIndexCode
                  and o.request_code = valRequestCode
                  and rownum < ams.LIFE_AGENCY_CODE.MAX_DELETE_NUMBER;
              exit when SQL%rowcount < ams.LIFE_AGENCY_CODE.MAX_DELETE_NUMBER - 1;
              commit;
          end loop;
          commit;

          insert /*+ APPEND */ into ams.la_outlet_index nologging
          select  /*+
                     CARDINALITY(key, 100)
                     CARDINALITY(indx, 100)
                     */
              key.outlet_id,
              valTypeCode,
              trunc(valRecordDate, 'YYYY'),
              valVersionDate,
              valTimeFrequency,
              valBeginDate,
              valEndDate,
              valIndexCode,
              max(nvl(indx.index_value, 0)),
              null,
              null,
              valRequestCode,
              sysdate
          from
          (
              select /*+ CARDINALITY(outl, 100)*/
                  outl.outlet_id,
                  outl.outlet_ams_id
              from ams.la_vietstar_temp_outlet outl
              where outl.record_date = trunc(valRecordDate, 'MM')
                  and outl.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
          ) key
          join
          (
              select /*+ CARDINALITY(issu, 100)
                         CARDINALITY(info, 100) */
                  info.outlet_ams_id,
                  sum(nvl(info.afis, 0)) index_value
              from
              (
                  select /*+ CARDINALITY(tmp, 100) */
                      tmp.policy_number
                  from ams.mod_data_policy tmp
                  where tmp.record_date = trunc(valRecordDate, 'MM')
                      and tmp.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and tmp.changes_code = AMS_MODL_BUSSINESS.POLYC_CODE_PROC
                      and tmp.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      and tmp.changes_date
                          between add_months(trunc(valRecordDate, 'MM'), -35)
                          and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                  minus
                  select /*+ CARDINALITY(tmp, 100) */
                      tmp.policy_number
                  from ams.mod_data_policy tmp
                  where tmp.record_date = trunc(valRecordDate, 'MM')
                      and tmp.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and tmp.changes_code = AMS_MODL_BUSSINESS.DATA_CODE_CANC
                      and tmp.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      and tmp.changes_date
                          between add_months(trunc(valRecordDate, 'MM'), -35)
                          and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
              ) issu
              join
              (
                  select /*+ CARDINALITY(tmp, 100) */
                      tmp.init_ams_id outlet_ams_id,
                      tmp.policy_number,
                      case
                          when (
                                  tmp.source_of_data = LIFE_AGENCY_VIETSTAR_2013.SYSTEM_REFER_TALISMAN
                                  and
                                  tmp.freq_per_annum = LIFE_AGENCY_VIETSTAR_2013.FREQ_ONE_PAY
                              ) then
                              nvl(tmp.freq_premium, 0)
                          else
                              nvl(tmp.freq_premium, 0) * nvl(tmp.freq_per_annum, 0)
                      end afis
                  from ams.mod_data_policy tmp
                  where tmp.record_date = trunc(valRecordDate, 'MM')
                      and tmp.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and tmp.changes_code = AMS_MODL_BUSSINESS.POLYC_CODE_PROC
                      and tmp.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      and tmp.changes_date
                          between add_months(trunc(valRecordDate, 'MM'), -35)
                          and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
              ) info
                  on info.policy_number = issu.policy_number
              group by info.outlet_ams_id
          ) indx
              on indx.outlet_ams_id = key.outlet_ams_id
          group by key.outlet_id;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, valRequestCode, 'vietstar_afyp_iss_unit +' || valTypeCode || '+' || valTimeFrequency);
      end;


    /*
        Creater: Le Khac Chinh
        Date Create: 8/11/2013
        Version: 1.0
        Description: Lay cac du lieu ve AFYP duy tri trong thoi gian 36 thang de tinh thi dua truong nhom
                            Lay ca du lieu dai ly nghi viec vao roi sau do trong bang do thi se loai di la duoc
        Parameter:
            valTypeCode [varchar2]: Kieu du lieu
            valRecordDate [date]: Thang ghi nhan
            valVersionDate [date]: Ngay chay
            valTimeFrequency [varchar2]: Dinh ky
            valBeginDate [date]: Ngay bat dau
            valEndDate [date]: Ngay ket thuc
            valIndexCode [varchar2]: Ma chi tieu
            valRequestCode [varchar2]: Ma yeu cau
    */
      procedure vietstar_afyp_inf_pr36(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          loop
              delete ams.la_outlet_index o
              where o.type_code = valTypeCode
                  and o.record_date = trunc(valRecordDate, 'YYYY')
                  and o.time_frequency = valTimeFrequency
                  and o.index_code = valIndexCode
                  and o.request_code = valRequestCode
                  and rownum < ams.LIFE_AGENCY_CODE.MAX_DELETE_NUMBER;
              exit when SQL%rowcount < ams.LIFE_AGENCY_CODE.MAX_DELETE_NUMBER - 1;
              commit;
          end loop;
          commit;

          insert /*+ APPEND */ into ams.la_outlet_index nologging
          select  /*+
                     CARDINALITY(key, 100)
                     CARDINALITY(indx, 100)
                     */
              key.outlet_id,
              valTypeCode,
              trunc(valRecordDate, 'YYYY'),
              valVersionDate,
              valTimeFrequency,
              valBeginDate,
              valEndDate,
              valIndexCode,
              max(nvl(indx.index_value, 0)),
              null,
              null,
              valRequestCode,
              sysdate
          from
          (
              select /*+ CARDINALITY(outl, 100)*/
                  outl.outlet_id,
                  outl.outlet_ams_id
              from ams.la_vietstar_temp_outlet outl
              where outl.record_date = trunc(valRecordDate, 'MM')
                  and outl.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
          ) key
          join
          (
              select /*+ CARDINALITY(issu, 100)
                         CARDINALITY(info, 100) */
                  info.outlet_ams_id,
                  sum(nvl(info.afis, 0)) index_value
              from
              (
                  select /*+ CARDINALITY(tmp, 100) */
                      tmp.policy_number
                  from ams.mod_data_policy tmp
                  where tmp.record_date = trunc(valRecordDate, 'MM')
                      and tmp.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and tmp.changes_code = AMS_MODL_BUSSINESS.POLYC_CODE_PROC
                      and tmp.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      and tmp.changes_date
                          between add_months(trunc(valRecordDate, 'MM'), -35)
                          and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                  minus
                  select /*+ CARDINALITY(tmp, 100) */
                      tmp.policy_number
                  from ams.mod_data_policy tmp
                  where tmp.record_date = trunc(valRecordDate, 'MM')
                      and tmp.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and tmp.changes_code in (
                           AMS_MODL_BUSSINESS.DATA_CODE_CANC,
                           AMS_MODL_BUSSINESS.DATA_CODE_TERM)
                      and tmp.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      and tmp.changes_date
                          between add_months(trunc(valRecordDate, 'MM'), -35)
                          and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
              ) issu
              join
              (
                  select /*+ CARDINALITY(tmp, 100) */
                      tmp.init_ams_id outlet_ams_id,
                      tmp.policy_number,
                      case
                          when (
                                  tmp.source_of_data = LIFE_AGENCY_VIETSTAR_2013.SYSTEM_REFER_TALISMAN
                                  and
                                  tmp.freq_per_annum = LIFE_AGENCY_VIETSTAR_2013.FREQ_ONE_PAY
                              ) then
                              nvl(tmp.freq_premium, 0)
                          else
                              nvl(tmp.freq_premium, 0) * nvl(tmp.freq_per_annum, 0)
                      end afis
                  from ams.mod_data_policy tmp
                  where tmp.record_date = trunc(valRecordDate, 'MM')
                      and tmp.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and tmp.changes_code = AMS_MODL_BUSSINESS.POLYC_CODE_PROC
                      and tmp.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      and tmp.changes_date
                          between add_months(trunc(valRecordDate, 'MM'), -35)
                          and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
              ) info
                  on info.policy_number = issu.policy_number
              group by info.outlet_ams_id
          ) indx
              on indx.outlet_ams_id = key.outlet_ams_id
          group by key.outlet_id;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, valRequestCode, 'vietstar_afyp_iss_unit +' || valTypeCode || '+' || valTimeFrequency);
      end;


      /*lay ra so luong hop dong do no quan ly KHONG CAN DIEU KIEN LA PHAT HANH TRONG VONG 36 thang o day
      the thi moi ra duoc so luong HD ma no quan ly duoc cho no
      lay rieng biet so lieu cua BVL va Tal cho no o day o BVL chi lay cac san pham truyen thong ve Tal da do len tren day roi
      o BVL da kiem tra xong duoc so lieu cho no OK roi*/
      /*Cach xac dinh nhu sau:
      T?ng s? h?p d?ng thu ngbn vijn qu?n l} v` thu phm h`ng thang trong th?i gian thi dua
      Xac d?nh nhu sau:
      Cac h?p d?ng du?c giao qu?n l} v` crn hi?u l?c v`o ng`y cu?i thang T?c l` 31/1/2013
      C?ng v?i cac h?p d?ng h?t hi?u l?c t? ng`y 1/1/2013 d?n 30/1/2013
      tr? di cac h?p d?ng b? h?y 14 ng`y t? 1/1/2013 d?n 30/1/2013
      Nhu th? thl m?i cs th? ra du?c dzng s? li?u cho ns
      L` cach xac d?nh dzng du?c cho ns.*/
      --day la so luong hop dong ma no quan ly khong co dieu kien phat hanh trong vong 36 thang
      --khong xu ly SP UVL o day vi SP UVL da xu ly tren TAL roi
      procedure vietstar_bvl_poli_mana(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null)
      is
          var_query varchar(32000) := '';
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          loop
              delete ams.la_outlet_bvlife o
              where o.type_code = valTypeCode
                  and o.record_date = valRecordDate
                  and o.time_frequency = valTimeFrequency
                  and o.index_code = valIndexCode
                  and o.request_code = valRequestCode
                  and rownum < ams.LIFE_AGENCY_CODE.MAX_DELETE_NUMBER;
              exit when SQL%rowcount < ams.LIFE_AGENCY_CODE.MAX_DELETE_NUMBER - 1;
              commit;
          end loop;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, valRequestCode, 'vietstar_bvl_cont_mana - delete +' || valTypeCode || '+' || valTimeFrequency || '-' || to_char(valRecordDate, 'dd/mm/yyyy'));
          ams.life_agency_log.time_begin;

          /*CHU Y cho nay la:
          Do no chay theo thang tu thang 1 cho den thang 11 va
          moi thang da lay ca dai ly con lam viec va nghi viec cho no roi nen chi can dung bang temp
          the la du roi khong phai thay doi gi ca
          lay so lieu tu bang nay la du so lieu do no chay theo 10 thang cho no
              select
                  outl.outlet_id,
                  outl.outlet_ams_id
              from ams.la_vietstar_temp_outlet outl
              where outl.record_date = :valRecordDate
                  and outl.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
                  and substr(outl.company_ams_id, 2) = ' || list_databse.id || '
          */

          for list_databse in (
              select bvl.id,
                  bvl.schema,
                  bvl.link,
                  bvl.name
              from ams.sys_database_bvlife bvl
              where bvl.status = AMS_CORE_SYSTEM.SYSTEM_VALUE_YES
          )
          loop
              var_query := '
              begin
                  insert /*+ APPEND */ into ams.la_outlet_bvlife nologging
                  select  /*+
                             CARDINALITY(key, 100)
                             CARDINALITY(indx, 100)
                             */
                      key.outlet_id,
                      :valTypeCode,
                      :valRecordDate,
                      :valVersionDate,
                      :valTimeFrequency,
                      :valBeginDate,
                      :valEndDate,
                      :valIndexCode,
                      nvl(indx.index_value, 0),
                      null,
                      null,
                      :valRequestCode,
                      sysdate
                  from
                  (
                      select /*+ CARDINALITY(outl, 100)*/
                          outl.outlet_id,
                          outl.outlet_ams_id
                      from ams.la_vietstar_temp_outlet outl
                      where outl.record_date = :valRecordDate
                          and outl.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
                          and substr(outl.company_ams_id, 2) = ' || list_databse.id || '
                  ) key
                  left join
                  (
                      select  /*+ CARDINALITY(res, 100)*/
                          '||chr(39)||'D'||chr(39)||'||res.dl_id outlet_ams_id,
                          sum(res.amount) index_value
                      from
                      (
                          -- Cac hop dong (san pham truyen thong) dang quan ly con hieu luc tinh tai thoi diem cuoi thang
                          -- o thoi diem hien tinh va hien tai
                          select /*+ CARDINALITY(hd, 100)*/
                              hd.dl_id,
                              count(*) amount
                          from
                          (
                              select  /*+ CARDINALITY(tmp, 100)*/
                                  tmp.dl_id,
                                  tmp.hd_id
                              from nt_hopdong' || list_databse.link || ' tmp
                              where tmp.tt_hd like '||chr(39)||'0_________0%'||chr(39)||'
                                  and tmp.dk_nop <> '||chr(39)||'00'||chr(39)||'
                                  and tmp.ngayphanh <= (add_months(trunc(:valRecordDate, ''MM''), 1) - 1)
                                  and tmp.ngay_hluc <= (add_months(trunc(:valRecordDate, ''MM''), 1) - 1)
                                  and tmp.sf_id not in ('||chr(39)||'1010767'||chr(39)||', '||chr(39)||'1010794'||chr(39)||')
                              union
                              -- Cac hop dong (san pham truyen thong) dang quan ly va con hieu luc
                              -- o thoi diem tinh nhung da chuyen cho dai ly khac
                              -- o thoi diem hien tai
                              select  /*+ CARDINALITY(tmp, 100)*/
                                  tmp.dl_id,
                                  tmp.hd_id
                              from  nt_lshd' || list_databse.link || ' tmp
                              where tmp.tthd like '||chr(39)||'0_________0%'||chr(39)||'
                                  and tmp.dk_nop <> '||chr(39)||'00'||chr(39)||'
                                  and tmp.ngayqd >= (add_months(trunc(:valRecordDate, ''MM''), 1) - 1)
                                  and tmp.ngay_hluc < (add_months(trunc(:valRecordDate, ''MM''), 1) - 1)
                                  and tmp.sf_id not in ('||chr(39)||'1010767'||chr(39)||', '||chr(39)||'1010794'||chr(39)||')
                              union
                              --Cac hop dong (san pham truyen thong) HET HIEU LUC TRONG THANG (dau thang, ngay cuoi thang)
                              --tu ngay 1/1 den ngay 31/1
                              select /*+ CARDINALITY(tmp, 100)*/
                                  tmp.dl_id,
                                  tmp.hd_id
                              from nt_hopdong' || list_databse.link || ' tmp
                              where tmp.tt_hd like '||chr(39)||'1%'||chr(39)||'
                                  and tmp.dk_nop <> '||chr(39)||'00'||chr(39)||'
                                  and tmp.ngayphanh <= (add_months(trunc(:valRecordDate, ''MM''), 1) - 1)
                                  and tmp.ngay_hluc
                                      between (trunc(:valRecordDate, ''MM''))
                                      and (add_months(trunc(:valRecordDate, ''MM''), 1) - 1)
                                  and tmp.sf_id not in ('||chr(39)||'1010767'||chr(39)||', '||chr(39)||'1010794'||chr(39)||')
                              union
                              --Cac hop dong (san pham truyen thong) HET HIEU LUC TRONG THANG (dau thang, ngay cuoi thang -1)
                              --tu ngay 1/1 den ngay 30/1
                              --trong lich su hop dong
                              select /*+ CARDINALITY(tmp, 100)*/
                                  tmp.dl_id,
                                  tmp.hd_id
                              from nt_lshd' || list_databse.link || ' tmp
                              where tmp.tthd like '||chr(39)||'1%'||chr(39)||'
                                  and tmp.dk_nop <> '||chr(39)||'00'||chr(39)||'
                                  and tmp.ngayqd >= (add_months(trunc(:valRecordDate, ''MM''), 1) - 1)
                                  and tmp.ngay_hluc
                                      between (trunc(:valRecordDate, ''MM''))
                                      and (add_months(trunc(:valRecordDate, ''MM''), 1) - 1)
                                  and tmp.sf_id not in ('||chr(39)||'1010767'||chr(39)||', '||chr(39)||'1010794'||chr(39)||')
                          ) hd
                          group by hd.dl_id

                          union
                          -- Cac hop dong huy 14 ngay, Tru di cac hop dong bi huy 14 ngay
                          select /*+
                                     CARDINALITY(hdh, 100)
                                     */
                              hdh.dl_id,
                              -count(*) amount
                          from
                          (
                              select /*+
                                     CARDINALITY(hdgq, 100)
                                     CARDINALITY(yc, 100)
                                     CARDINALITY(ctgq, 100)
                                     */
                                  yc.dl_id,
                                  hdgq.hd_id
                              from
                              (
                                  select /*+ CARDINALITY(tmp, 100)*/
                                      *
                                  from nt_gqql' || list_databse.link || ' tmp
                                  where tmp.loaitd = '||chr(39)||'23'||chr(39)||'
                                      and tmp.ngayqd
                                          between (trunc(:valRecordDate, ''MM''))
                                          and (add_months(trunc(:valRecordDate, ''MM''), 1) - 1)
                              ) hdgq
                              inner join nt_yeucau' || list_databse.link || ' yc
                                  on yc.hd_id = hdgq.hd_id
                              inner join
                              (
                                  select /*+ CARDINALITY(tmp, 100)*/
                                      tmp.*
                                  from nt_ctgqql' || list_databse.link || ' tmp
                                  where tmp.sf_id not like '||chr(39)||'103%'||chr(39)||'
                                      and tmp.cgq_id in ('||chr(39)||'PHI'||chr(39)||', '||chr(39)||'PHI21'||chr(39)||')
                                      and tmp.thop_id = '||chr(39)||'HUY'||chr(39)||'
                              ) ctgq
                                  on ctgq.sohs = hdgq.so_hs
                          ) hdh
                          group by hdh.dl_id
                      ) res
                      group by res.dl_id
                  ) indx
                      on indx.outlet_ams_id = key.outlet_ams_id;
              end;
              ';

              execute immediate var_query
              using
                  valTypeCode,
                  valRecordDate,
                  valVersionDate,
                  valTimeFrequency,
                  valBeginDate,
                  valEndDate,
                  valIndexCode,
                  valRequestCode;
              commit;
              ams.life_agency_log.time_end;
              ams.life_agency_log.write_log(1000,
                  'vietstar_bvl_poli_mana insert: ' || list_databse.link || '  ' || to_char(valRecordDate, 'dd/mm/yyyy'),
                  'procedure was completed');
              ams.life_agency_log.time_begin;
          end loop;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, valRequestCode, 'vietstar_bvl_poli_mana+' || valTypeCode || '+' || valTimeFrequency || '-' || to_char(valRecordDate, 'dd/mm/yyyy'));
      end;


      /*
      DINH NGHIA
      so luong hop dong quan ly chi la tru di
      lay ra so luong hop dong do no quan ly
      lay rieng biet so lieu cua BVL va Tal cho no o day o BVL chi lay cac san pham truyen thong ve Tal da do len tren day roi
      o BVL da kiem tra xong duoc so lieu cho no OK roi*/
      /*Cach xac dinh nhu sau:
      T?ng s? h?p d?ng thu ngbn vijn qu?n l} v` thu phm h`ng thang trong th?i gian thi dua
      Xac d?nh nhu sau:
      Cac h?p d?ng du?c giao qu?n l} v` crn hi?u l?c v`o ng`y cu?i thang T?c l` 31/1/2013
      C?ng v?i cac h?p d?ng h?t hi?u l?c t? ng`y 1/1/2013 d?n 30/1/2013
      tr? di cac h?p d?ng b? h?y 14 ng`y t? 1/1/2013 d?n 30/1/2013
      Nhu th? thl m?i cs th? ra du?c dzng s? li?u cho ns
      L` cach xac d?nh dzng du?c cho ns.*/

      procedure vietstar_bvl_cont_mana(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null)
      is
          var_query varchar(32000) := '';
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          loop
              delete ams.la_outlet_bvlife o
              where o.type_code = valTypeCode
                  and o.record_date = valRecordDate
                  and o.time_frequency = valTimeFrequency
                  and o.index_code = valIndexCode
                  and o.request_code = valRequestCode
                  and rownum < ams.LIFE_AGENCY_CODE.MAX_DELETE_NUMBER;
              exit when SQL%rowcount < ams.LIFE_AGENCY_CODE.MAX_DELETE_NUMBER - 1;
              commit;
          end loop;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, valRequestCode, 'vietstar_bvl_cont_mana - delete +' || valTypeCode || '+' || valTimeFrequency || '-' || to_char(valRecordDate, 'dd/mm/yyyy'));
          ams.life_agency_log.time_begin;

  /*        delete from z_report;
          commit;*/

          for list_databse in (
              select bvl.id,
                  bvl.schema,
                  bvl.link,
                  bvl.name
              from ams.sys_database_bvlife bvl
              where bvl.status = AMS_CORE_SYSTEM.SYSTEM_VALUE_YES
                  --and bvl.id = 100100006
          )
          loop
              var_query := '
              begin
                  insert /*+ APPEND */ into ams.la_outlet_bvlife nologging
                  select  /*+
                             CARDINALITY(key, 100)
                             CARDINALITY(indx, 100)
                             */
                      key.outlet_id,
                      :valTypeCode,
                      :valRecordDate,
                      :valVersionDate,
                      :valTimeFrequency,
                      :valBeginDate,
                      :valEndDate,
                      :valIndexCode,
                      nvl(indx.index_value, 0),
                      null,
                      null,
                      :valRequestCode,
                      sysdate
                  from
                  (
                      select /*+ CARDINALITY(outl, 100)*/
                          outl.outlet_id,
                          outl.outlet_ams_id
                      from ams.la_vietstar_temp_outlet outl
                      where outl.record_date = :valRecordDate
                          and outl.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
                          and substr(outl.company_ams_id, 2) = ' || list_databse.id || '
                  ) key
                  left join
                  (
                      select  /*+ CARDINALITY(res, 100)*/
                          '||chr(39)||'D'||chr(39)||'||res.dl_id outlet_ams_id,
                          sum(res.amount) index_value
                      from
                      (
                          -- Cac hop dong (san pham truyen thong) dang quan ly con hieu luc tinh tai thoi diem cuoi thang
                          -- o thoi diem hien tinh va hien tai
                          select /*+ CARDINALITY(hd, 100)*/
                              hd.dl_id,
                              count(*) amount
                          from
                          (
                              select  /*+ CARDINALITY(tmp, 100)*/
                                  tmp.dl_id,
                                  tmp.hd_id
                              from nt_hopdong' || list_databse.link || ' tmp
                              where tmp.tt_hd like '||chr(39)||'0_________0%'||chr(39)||'
                                  and tmp.dk_nop <> '||chr(39)||'00'||chr(39)||'
                                  and tmp.ngayphanh
                                      between (add_months(trunc(:valRecordDate, ''MM''), -35) - 1)
                                      and (add_months(trunc(:valRecordDate, ''MM''), 1) - 1)
                                  and tmp.ngay_hluc <= (add_months(trunc(:valRecordDate, ''MM''), 1) - 1)
                                  and tmp.sf_id not in ('||chr(39)||'1010767'||chr(39)||', '||chr(39)||'1010794'||chr(39)||')
                              union
                              -- Cac hop dong (san pham truyen thong) dang quan ly va con hieu luc
                              -- o thoi diem tinh nhung da chuyen cho dai ly khac
                              -- o thoi diem hien tai
                              select  /*+ CARDINALITY(tmp, 100)*/
                                  tmp.dl_id,
                                  tmp.hd_id
                              from  nt_lshd' || list_databse.link || ' tmp
                              where tmp.tthd like '||chr(39)||'0_________0%'||chr(39)||'
                                  and tmp.dk_nop <> '||chr(39)||'00'||chr(39)||'
                                  and tmp.ngayqd >= (add_months(trunc(:valRecordDate, ''MM''), 1) - 1)
                                  and tmp.ngay_hluc < (add_months(trunc(:valRecordDate, ''MM''), 1) - 1)
                                  and tmp.sf_id not in ('||chr(39)||'1010767'||chr(39)||', '||chr(39)||'1010794'||chr(39)||')
                              union
                              --Cac hop dong (san pham truyen thong) HET HIEU LUC TRONG THANG (dau thang, ngay cuoi thang)
                              --tu ngay 1/1 den ngay 31/1
                              select /*+ CARDINALITY(tmp, 100)*/
                                  tmp.dl_id,
                                  tmp.hd_id
                              from nt_hopdong' || list_databse.link || ' tmp
                              where tmp.tt_hd like '||chr(39)||'1%'||chr(39)||'
                                  and tmp.dk_nop <> '||chr(39)||'00'||chr(39)||'
                                  and tmp.ngayphanh
                                      between (add_months(trunc(:valRecordDate, ''MM''), -35) - 1)
                                      and (add_months(trunc(:valRecordDate, ''MM''), 1) - 1)
                                  and tmp.ngay_hluc
                                      between (trunc(:valRecordDate, ''MM''))
                                      and (add_months(trunc(:valRecordDate, ''MM''), 1) - 1)
                                  and tmp.sf_id not in ('||chr(39)||'1010767'||chr(39)||', '||chr(39)||'1010794'||chr(39)||')
                              union
                              --Cac hop dong (san pham truyen thong) HET HIEU LUC TRONG THANG (dau thang, ngay cuoi thang -1)
                              --tu ngay 1/1 den ngay 30/1
                              --trong lich su hop dong
                              select /*+ CARDINALITY(tmp, 100)*/
                                  tmp.dl_id,
                                  tmp.hd_id
                              from  nt_lshd' || list_databse.link || ' tmp
                              where tmp.tthd like '||chr(39)||'1%'||chr(39)||'
                                  and tmp.dk_nop <> '||chr(39)||'00'||chr(39)||'
                                  and tmp.ngayqd >= (add_months(trunc(:valRecordDate, ''MM''), 1) - 1)
                                  and tmp.ngay_hluc
                                      between (trunc(:valRecordDate, ''MM''))
                                      and (add_months(trunc(:valRecordDate, ''MM''), 1) - 1)
                                  and tmp.sf_id not in ('||chr(39)||'1010767'||chr(39)||', '||chr(39)||'1010794'||chr(39)||')
                          ) hd
                          --chi lay cac hop dong truyen thong duoc phat hanh trong 36 thang ke tu ngay cuoi thang hien tai
                          inner join
                          (
                              select /*+ CARDINALITY(tmp, 100)*/
                                  tmp.dl_id,
                                  tmp.hd_id
                              from nt_hopdong' || list_databse.link || ' tmp
                              where tmp.ngayphanh
                                      between (add_months(trunc(:valRecordDate, ''MM''), -35) - 1)
                                      and (add_months(trunc(:valRecordDate, ''MM''), 1) - 1)
                                  and tmp.sf_id not in ('||chr(39)||'1010767'||chr(39)||', '||chr(39)||'1010794'||chr(39)||')
                          ) inf
                              on inf.hd_id = hd.hd_id
                          group by hd.dl_id

                          union
                          -- Cac hop dong huy 14 ngay, Tru di cac hop dong bi huy 14 ngay
                          select /*+
                                     CARDINALITY(hdh, 100)
                                     */
                              hdh.dl_id,
                              -count(*) amount
                          from
                          (
                              select /*+
                                     CARDINALITY(hdgq, 100)
                                     CARDINALITY(yc, 100)
                                     CARDINALITY(ctgq, 100)
                                     */
                                  yc.dl_id,
                                  hdgq.hd_id
                              from
                              (
                                  select /*+ CARDINALITY(tmp, 100)*/
                                      *
                                  from nt_gqql' || list_databse.link || ' tmp
                                  where tmp.loaitd = '||chr(39)||'23'||chr(39)||'
                                      and tmp.ngayqd
                                          between (trunc(:valRecordDate, ''MM''))
                                          and (add_months(trunc(:valRecordDate, ''MM''), 1) - 1)
                              ) hdgq
                              inner join nt_yeucau' || list_databse.link || ' yc
                                  on yc.hd_id = hdgq.hd_id
                              inner join
                              (
                                  select /*+ CARDINALITY(tmp, 100)*/
                                      tmp.*
                                  from nt_ctgqql' || list_databse.link || ' tmp
                                  where tmp.sf_id not like '||chr(39)||'103%'||chr(39)||'
                                      and tmp.cgq_id in ('||chr(39)||'PHI'||chr(39)||', '||chr(39)||'PHI21'||chr(39)||')
                                      and tmp.thop_id = '||chr(39)||'HUY'||chr(39)||'
                              ) ctgq
                                  on ctgq.sohs = hdgq.so_hs
                              --chi lay cac hop dong truyen thong duoc phat hanh trong 36 thang ke tu ngay cuoi thang hien tai
                              inner join
                              (
                                  select /*+ CARDINALITY(tmp, 100)*/
                                      tmp.dl_id,
                                      tmp.hd_id
                                  from nt_hopdong' || list_databse.link || ' tmp
                                  where tmp.ngayphanh
                                      between (add_months(trunc(:valRecordDate, ''MM''), -35) - 1)
                                      and (add_months(trunc(:valRecordDate, ''MM''), 1) - 1)
                                      and tmp.sf_id not in ('||chr(39)||'1010767'||chr(39)||', '||chr(39)||'1010794'||chr(39)||')
                              ) inf
                                  on inf.hd_id = hdgq.hd_id
                          ) hdh
                          group by hdh.dl_id
                      ) res
                      group by res.dl_id
                  ) indx
                      on indx.outlet_ams_id = key.outlet_ams_id;
              end;
              ';

              execute immediate var_query
              using
                  valTypeCode,
                  valRecordDate,
                  valVersionDate,
                  valTimeFrequency,
                  valBeginDate,
                  valEndDate,
                  valIndexCode,
                  valRequestCode;
              commit;
              ams.life_agency_log.time_end;
              ams.life_agency_log.write_log(1000,
                  'vietstar_bvl_cont_mana insert: ' || list_databse.link || '  ' || to_char(valRecordDate, 'dd/mm/yyyy'),
                  'procedure was completed');
              ams.life_agency_log.time_begin;
          end loop;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, valRequestCode, 'vietstar_bvl_cont_mana+' || valTypeCode || '+' || valTimeFrequency || '-' || to_char(valRecordDate, 'dd/mm/yyyy'));

      end;


      /*lay ra so luong hop dong bi huy sau 14 ngay
      huy vi du do KH yeu cau huy, huy do no phi
      cua cac hop dong o BVL cho no
      OK da kiem tra roi*/
      procedure vietstar_bvl_cont_term(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          loop
              delete ams.la_outlet_bvlife o
              where o.type_code = valTypeCode
                  and o.record_date = valRecordDate
                  and o.time_frequency = valTimeFrequency
                  and o.index_code = valIndexCode
                  and o.request_code = valRequestCode
                  and rownum < ams.LIFE_AGENCY_CODE.MAX_DELETE_NUMBER;
              exit when SQL%rowcount < ams.LIFE_AGENCY_CODE.MAX_DELETE_NUMBER - 1;
              commit;
          end loop;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, valRequestCode, 'vietstar_bvl_cont_term - delete+' || valTypeCode || '+' || valTimeFrequency || '-' || to_char(valRecordDate, 'dd/mm/yyyy'));
          ams.life_agency_log.time_begin;

          insert /*+ APPEND */ into ams.la_outlet_bvlife nologging
          select   /*+
                     CARDINALITY(key, 100)
                     CARDINALITY(indx, 100)
                     */
              key.outlet_id,
              valTypeCode,
              valRecordDate,
              valVersionDate,
              valTimeFrequency,
              valBeginDate,
              valEndDate,
              valIndexCode,
              nvl(indx.index_value, 0),
              null,
              null,
              valRequestCode,
              sysdate
          from
          (
              select /*+ CARDINALITY(outl, 100)*/
                  outl.outlet_id,
                  outl.outlet_ams_id
              from ams.la_vietstar_temp_outlet outl
              where outl.record_date = valRecordDate
                  and outl.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
          ) key
          left join
          (
              select /*+ CARDINALITY(pol, 100)*/
                  'D'||pol.serv_bvlife_id outlet_ams_id,
                  count(pol.policy_number) index_value
              from
              (
                  select /*+ CARDINALITY(pol, 100)*/
                      pol.serv_bvlife_id serv_bvlife_id,
                      pol.policy_number
                  from ams.mod_data_policy pol
                  where pol.record_date = valRecordDate
                      and pol.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      and pol.changes_code in (
                           AMS_MODL_BUSSINESS.DATA_CODE_TERM)
                      /*ngay huy phai tu nam trong thang do o day la tinh cho tung thang*/
                      and pol.changes_date
                          between valBeginDate
                          and valEndDate
                      and pol.init_ams_id is not null
                      and pol.source_of_data = 'BVL'
              ) pol
              inner join
              --chi lay cac hop dong duoc phat hanh tu 36 thang tro lai day cho no
              --NEU KHONG INNER JOIN VOI CAC HOP DONG PHAT HANH TRONG 36 thang the nay la SAI
              --VI SE LAY RAT NHIEU DAY NHE
              --khong can thiet them dieu kien la loai bo huy 14 ngay do dieu kien tren da loai truong hop do roi
              (
                  select /*+ CARDINALITY(pol, 100)*/
                      pol.policy_number
                  from ams.mod_data_policy pol
                  where pol.record_date = valRecordDate
                      and pol.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and pol.changes_code = AMS_MODL_BUSSINESS.POLYC_CODE_PROC
                      and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      /*phai duoc phat hanh trong vong 36 thang ke tu thang tinh tro ve truoc day*/
                      and pol.changes_date
                          between add_months(valBeginDate, -35)
                          and valEndDate
                      and pol.source_of_data = 'BVL'
                  group by pol.policy_number
              ) pol_issu
                  on pol_issu.policy_number = pol.policy_number
              group by pol.serv_bvlife_id
          ) indx
              on indx.outlet_ams_id = key.outlet_ams_id;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, valRequestCode, 'vietstar_bvl_cont_term+' || valTypeCode || '+' || valTimeFrequency || '-' || to_char(valRecordDate, 'dd/mm/yyyy'));
      end;

    /*
        Creater: Le Khac Chinh
        Date Create: 29/05/2013
        Version: 1.0
        Description: Lay so luong cac Hop dong dao han o BVL tuong ung voi tung dai ly
       Update:
    */
      procedure vietstar_bvl_poli_expire(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null)
      is
          var_query varchar(32000) := '';
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          loop
              delete ams.la_outlet_bvlife o
              where o.type_code = valTypeCode
                  and o.record_date = valRecordDate
                  and o.time_frequency = valTimeFrequency
                  and o.index_code = valIndexCode
                  and o.request_code = valRequestCode
                  and rownum < ams.LIFE_AGENCY_CODE.MAX_DELETE_NUMBER;
              exit when SQL%rowcount < ams.LIFE_AGENCY_CODE.MAX_DELETE_NUMBER - 1;
              commit;
          end loop;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, valRequestCode, 'vietstar_bvl_cont_mana - delete +' || valTypeCode || '+' || valTimeFrequency || '-' || to_char(valRecordDate, 'dd/mm/yyyy'));
          ams.life_agency_log.time_begin;
          for list_databse in (
              select bvl.id,
                  bvl.schema,
                  bvl.link,
                  bvl.name
              from ams.sys_database_bvlife bvl
              where bvl.status = AMS_CORE_SYSTEM.SYSTEM_VALUE_YES
          )
          loop
              var_query := '
              begin
                  insert /*+ APPEND */ into ams.la_outlet_bvlife nologging
                  select  /*+
                             CARDINALITY(key, 100)
                             CARDINALITY(indx, 100)
                             */
                      key.outlet_id,
                      :valTypeCode,
                      :valRecordDate,
                      :valVersionDate,
                      :valTimeFrequency,
                      :valBeginDate,
                      :valEndDate,
                      :valIndexCode,
                      nvl(indx.index_value, 0),
                      null,
                      null,
                      :valRequestCode,
                      sysdate
                  from
                  (
                      select /*+ CARDINALITY(outl, 100)*/
                          outl.outlet_id,
                          outl.outlet_ams_id
                      from ams.la_vietstar_temp_outlet outl
                      where outl.record_date = :valRecordDate
                          and outl.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
                          and substr(outl.company_ams_id, 2) = ' || list_databse.id || '
                  ) key
                  left join
                  (
                      select  /*+ CARDINALITY(tmp, 100)*/
                          '||chr(39)||'D'||chr(39)||'||tmp.dl_id outlet_ams_id,
                          count(tmp.hd_id) index_value
                      from nt_hopdong' || list_databse.link || ' tmp
                      where han_dh' || list_databse.link || '(tmp.hd_id, tmp.sf_id, (add_months(trunc(:valRecordDate, ''MM''), 1) - 1)) = 1
                      group by tmp.dl_id
                  ) indx
                      on indx.outlet_ams_id = key.outlet_ams_id;
              end;
              ';

              execute immediate var_query
              using
                  valTypeCode,
                  valRecordDate,
                  valVersionDate,
                  valTimeFrequency,
                  valBeginDate,
                  valEndDate,
                  valIndexCode,
                  valRequestCode;
              commit;
              ams.life_agency_log.time_end;
              ams.life_agency_log.write_log(1000,
                  'vietstar_bvl_poli_expire insert: ' || list_databse.link || '  ' || to_char(valRecordDate, 'dd/mm/yyyy'),
                  'procedure was completed');
              ams.life_agency_log.time_begin;
          end loop;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, valRequestCode, 'vietstar_bvl_poli_expire+' || valTypeCode || '+' || valTimeFrequency || '-' || to_char(valRecordDate, 'dd/mm/yyyy'));
      end;

      procedure vietstar_tal_poli_sync(valRecordDate date := null)
      is
      begin
          --lay so lieu tu TAL len cho no
          --lay so lieu ve cac hop dong con hieu luc cho den cuoi thang
          --xoa du lieu bang ve hop dong quan ly boi mot dai ly o 1 thang ra
          execute immediate 'truncate table ams.la_vietstar_policy';
          commit;

          for i in 0..10
          loop
              ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_tal_poli_import(
                  'POLI_MANA',
                  add_months(trunc(valRecordDate, 'YYYY'), i),
                  trunc(sysdate, 'DD'),
                  ams.LIFE_AGENCY_CODE.FREQUENCY_MONTHLY,
                  add_months(trunc(valRecordDate, 'YYYY'), i),
                  (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                  ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
                  ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
          end loop;
          dbms_stats.gather_table_stats(null, 'la_vietstar_policy', cascade => true);
      end;

      --thu tuc nay lay so lieu hop dong con hieu luc tinh den 1 ngay cuoi thang
      --de tinh hop dong quan ly cua dai ly
      procedure vietstar_tal_poli_import(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          insert /*+ APPEND */ into ams.la_vietstar_policy nologging
          select /*+ CARDINALITY(pol1, 100)
                     CARDINALITY(pol2, 100)
                    */
              valRecordDate,
              ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE,
              pol1.account_id,
              sysdate
          from
          (
              select  /*+ CARDINALITY(act1, 100)*/
                  act1.account_id,
                  max(act1.activity_id) activity_id
              from
              (
                  select  /*+ CARDINALITY(act1, 100)*/
                      act1.activity_id,
                      act1.account_id
                  from ods.activity act1
                  --cac dai ly con hieu luc cho den ngay cuoi thang
                  where trunc(greatest(act1.bus_processed_date, act1.effective_date)) <= valEndDate
                      and act1.is_reversed is not null
              ) act1
              left join
              (
                  select /*+ CARDINALITY(act2, 100)*/
                      act2.reversed_acti_id,
                      act2.account_id
                  from ods.activity act2
                  where trunc(greatest(act2.bus_processed_date, act2.effective_date)) < valEndDate
              ) act2
                  on act2.reversed_acti_id = act1.activity_id
                      and act2.account_id = act1.account_id
              --khong bi revert trong thoi gian do
              where act2.account_id is null
              group by act1.account_id
          ) pol1
          inner join
          (--con hieu luc
              select  /*+ CARDINALITY(act1, 100)*/
                  act1.account_id,
                  act1.activity_id
              from ods.activity act1
              where act1.status_code not in ('PIF','OF','PA')
          ) pol2
              on pol1.activity_id = pol2.activity_id;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, valRequestCode, 'vietstar_tal_poli_import 2+' || valTypeCode || '+' || valTimeFrequency || '-' || to_char(valRecordDate, 'dd/mm/yyyy'));
      end;

      /*OK: Lay tat ca cac hop dong KHONG TINH PHAT HANH TRONG 36 THANG
      CHO NAY CAN LAM LAI NGAY NHE
      Da kiem tra - lay ra so luong hop dong do no quan ly
      chu tru di cac hop dong bi huy 14 ngay
      tru di cac hop dong bi huy vao cac ngay truoc thang do
      da kiem tra o tren Talisman la can phan tru di nhu vay roi?
      */
      procedure vietstar_tal_poli_mana(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          loop
              delete  ams.la_outlet_talisman o
              where o.type_code = valTypeCode
                  and o.record_date = valRecordDate
                  and o.time_frequency = valTimeFrequency
                  and o.index_code = valIndexCode
                  and o.request_code = valRequestCode
                  and rownum < ams.LIFE_AGENCY_CODE.MAX_DELETE_NUMBER;
              exit when SQL%rowcount < ams.LIFE_AGENCY_CODE.MAX_DELETE_NUMBER - 1;
              commit;
          end loop;
          commit;

          insert /*+ APPEND */ into ams.la_outlet_talisman nologging
          select   /*+
                     CARDINALITY(pol, 100)
                     CARDINALITY(acc, 100)
                     CARDINALITY(key, 100)
                     */
              key.outlet_id,
              valTypeCode,
              valRecordDate,
              valVersionDate,
              valTimeFrequency,
              valBeginDate,
              valEndDate,
              valIndexCode,
              count(key.account_id),
              null,
              null,
              valRequestCode,
              sysdate
          from
          (   --lay tat ca cac hop dong con hieu luc cho den ngay cuoi thang
             select /*+ CARDINALITY(pol, 100)*/
                  pol.policy_id account_id
              from ams.la_vietstar_policy pol
              where pol.record_date = valRecordDate
              group by pol.policy_id
              /*cong them cac hop dong bi huy sau 14 ngay TRONG THANG  do*/
              union
              select
                  pol.account_id
              from
              (
                  select /*+ CARDINALITY(pol, 100)*/
                      pol.policy_number
                  from ams.mod_data_policy pol
                  where pol.record_date = valRecordDate
                      and pol.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      and pol.changes_code in (
                           AMS_MODL_BUSSINESS.DATA_CODE_TERM)
                      --huy vao thang do
                      and pol.changes_date between valBeginDate and valEndDate
                      and pol.source_of_data = 'TAL'
                  group by pol.policy_number
              ) canc
              inner join
              (
                  select /*+ CARDINALITY(tmp, 100)*/
                      tmp.account_id,
                      tmp.account_number policy_number
                  from ods.account tmp
              ) pol
                  on pol.policy_number = canc.policy_number
          ) pol
          /*lay them cac hop dong do dai ly do quan ly*/
          inner join --lay ra la no duoc quan ly vao thang tinh
          (
              select /*+ CARDINALITY(aor, 100)*/
                  aor.outlet_client_id outlet_id,
                  aor.account_id
              from ods.account_outlet_relationship aor
              where aor.relationship_type_code  = 'SERV'
                  and aor.effective_date <= (add_months(trunc(valBeginDate, 'MM'), 1) - 1)
                  and aor.account_outlet_id =
                  (
                      select max(aor_last.account_outlet_id)
                      from ods.account_outlet_relationship aor_last
                      where aor_last.account_id = aor.account_id
                          and aor_last.relationship_type_code  = 'SERV'
                          and aor_last.effective_date <= aor.effective_date
                  )
          ) key
              on key.account_id = pol.account_id
          group by key.outlet_id;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, valRequestCode, 'vietstar_tal_poli_mana+' || valTypeCode || '+' || valTimeFrequency || '-' || to_char(valRecordDate, 'dd/mm/yyyy'));
      end;



       /*
      Update by: Le Khac Chinh Ban PTUD
      Version: 1.1
      Note:  Fix lai chuong trinh theo yeu cau: #107278 cua BA
                 Tinh chinh xac so luong hop dong quan ly 36 thang khong lay tu bang mod_data_policy ma lay truc tiep tu ODS
      */
      procedure vietstar_tal_cont_mana(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          loop
              delete  ams.la_outlet_talisman o
              where o.type_code = valTypeCode
                  and o.record_date = valRecordDate
                  and o.time_frequency = valTimeFrequency
                  and o.index_code = valIndexCode
                  and o.request_code = valRequestCode
                  and rownum < ams.LIFE_AGENCY_CODE.MAX_DELETE_NUMBER;
              exit when SQL%rowcount < ams.LIFE_AGENCY_CODE.MAX_DELETE_NUMBER - 1;
              commit;
          end loop;
          commit;

          insert /*+ APPEND */ into ams.la_outlet_talisman nologging
          select   /*+
                     CARDINALITY(pol, 100)
                     CARDINALITY(acc, 100)
                     CARDINALITY(key, 100)
                     */
              key.outlet_id,
              valTypeCode,
              valRecordDate,
              valVersionDate,
              valTimeFrequency,
              valBeginDate,
              valEndDate,
              valIndexCode,
              count(key.account_id),
              null,
              null,
              valRequestCode,
              sysdate
          from
          (
              select /*+ CARDINALITY(aor, 100)*/
                  aor.outlet_client_id outlet_id,
                  aor.account_id
              from ods.account_outlet_relationship aor
              where aor.relationship_type_code  = 'SERV'
                  and aor.effective_date <= (add_months(trunc(valBeginDate, 'MM'), 1) - 1)
                  and aor.account_outlet_id =
                  (
                      select max(aor_last.account_outlet_id)
                      from ods.account_outlet_relationship aor_last
                      where aor_last.account_id = aor.account_id
                          and aor_last.relationship_type_code  = 'SERV'
                          and aor_last.effective_date <= aor.effective_date
                  )
          ) key
          join
          (
              select inf.account_id
              from
              (
                  select /*+ CARDINALITY(tmp, 100) */
                      tmp.activity_id
                  from ods.activity  tmp
                  where trunc(tmp.bus_processed_date, 'DD')
                          between add_months(valBeginDate, -35)
                          and valEndDate
                      and tmp.activity_code = 'A100'
                  minus
                  select /*+ CARDINALITY(tmp, 100) */
                      tmp.reversed_acti_id activity_id
                  from ods.activity  tmp
                  where trunc(tmp.bus_processed_date, 'DD')
                          between add_months(valBeginDate, -35)
                          and valEndDate
                      and tmp.activity_code = 'R100'
              ) pol
              join
              (
                  select /*+ CARDINALITY(tmp, 100) */
                      tmp.activity_id,
                      tmp.account_id
                  from ods.activity  tmp
                  where trunc(tmp.bus_processed_date, 'DD')
                          between add_months(valBeginDate, -35)
                          and valEndDate
                      and tmp.activity_code = 'A100'
              ) inf
                  on inf.activity_id = pol.activity_id
          ) issu
              on key.account_id = issu.account_id
          join
          (   --lay tat ca cac hop dong con hieu luc cho den ngay cuoi thang
             select /*+ CARDINALITY(pol, 100)*/
                  pol.policy_id account_id
              from ams.la_vietstar_policy pol
              where pol.record_date = valRecordDate
              group by pol.policy_id
              /*cong them cac hop dong bi huy sau 14 ngay TRONG THANG  do*/
              union
              select
                  pol.account_id
              from
              (
                  select /*+ CARDINALITY(pol, 100)*/
                      pol.policy_number
                  from ams.mod_data_policy pol
                  where pol.record_date = valRecordDate
                      and pol.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      and pol.changes_code in (
                           AMS_MODL_BUSSINESS.DATA_CODE_TERM)
                      --huy vao thang do
                      and pol.changes_date between valBeginDate and valEndDate
                      and pol.source_of_data = 'TAL'
                  group by pol.policy_number
              ) canc
              inner join
              (
                  select /*+ CARDINALITY(tmp, 100)*/
                      tmp.account_id,
                      tmp.account_number policy_number
                  from ods.account tmp
              ) pol
                  on pol.policy_number = canc.policy_number
          ) pol
             on pol.account_id = issu.account_id
          group by key.outlet_id;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, valRequestCode, 'vietstar_tal_cont_mana+' || valTypeCode || '+' || valTimeFrequency || '-' || to_char(valRecordDate, 'dd/mm/yyyy'));
      end;




    /*
        Creater: Le Khac Chinh
        Date Create: 1/6/2013
        Version: 1.0
        Description: Dem so luong hop dong quan ly 36 thang o Talisman bi huy trong thang
        Parameter:
            valTypeCode [varchar2]: Kieu du lieu
            valRecordDate [date]: Thang ghi nhan
            valVersionDate [date]: Ngay chay
            valTimeFrequency [varchar2]: Dinh ky
            valRecordDate [date]: Thang ghi nhan
            valBeginDate [date]: Ngay bat dau
            valEndDate [date]: Ngay ket thuc
            valIndexCode [varchar2]: Ma chi tieu
            valRequestCode [varchar2]: Ma yeu cau
        Update:  Le Khac Chinh
            Version: 1.1
            Date Updated: 4/7/2013
            Note:  Fix lai chuong trinh theo yeu cau: 109326 cua BA
                      Dem chinh xac so luong hop dong quan ly 36 thang va huy bo trong thang
                      va lay so luong hop dong quan ly 36 thang truc tiep tu ODS
            Version: 1.2
            Date Updated: 29/7/2013
            Note:  Fix lai chuong trinh theo yeu cau: 104156 cua BA
                      Sua lai do chuong trinh chay bi treo o doan lay so luong HD quan ly trong vong 36 thang truc tiep tu ODS
    */
      procedure vietstar_tal_cont_term(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          loop
              delete ams.la_outlet_talisman o
              where o.type_code = valTypeCode
                  and o.record_date = valRecordDate
                  and o.time_frequency = valTimeFrequency
                  and o.index_code = valIndexCode
                  and o.request_code = valRequestCode
                  and rownum < ams.LIFE_AGENCY_CODE.MAX_DELETE_NUMBER;
              exit when SQL%rowcount < ams.LIFE_AGENCY_CODE.MAX_DELETE_NUMBER - 1;
              commit;
          end loop;
          commit;

          insert /*+ APPEND */ into ams.la_outlet_talisman nologging
          select   /*+
                     CARDINALITY(indx, 100)
                     */
              indx.outlet_id,
              valTypeCode,
              valRecordDate,
              valVersionDate,
              valTimeFrequency,
              valBeginDate,
              valEndDate,
              valIndexCode,
              nvl(indx.index_value, 0),
              null,
              null,
              valRequestCode,
              sysdate
          from
          (
              select /*+ CARDINALITY(pol, 100)  CARDINALITY(acc, 100)  CARDINALITY(issu, 100)  CARDINALITY(key, 100) */
                  key.outlet_id,
                  count(key.account_id) index_value
              from
              (   /*danh sach cac hop dong bi huy sau 14 ngay trong thang*/
                  select /*+ CARDINALITY(pol, 100) */
                      pol.policy_number
                  from ams.mod_data_policy pol
                  where pol.record_date = valRecordDate
                      and pol.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      --cac hop dong huy nhu the nay la da dam bao duoc roi vi neu ma no khoi phuc thi
                      --status code se = INACTIVE cho no ngay va se khong tinh vao day
                      and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      and pol.changes_code in (
                           AMS_MODL_BUSSINESS.DATA_CODE_TERM)
                      /*ngay huy phai tu nam trong thang do o day la tinh cho tung thang*/
                      and pol.changes_date
                          between valBeginDate
                          and valEndDate
                      and pol.init_ams_id is not null
                      and pol.source_of_data = 'TAL'
              ) pol
              inner join
              (
                  select /*+ CARDINALITY(tmp, 100) */
                      tmp.account_id,
                      tmp.account_number policy_number
                  from ods.account tmp
              ) acc
                  on acc.policy_number = pol.policy_number
              join
              (  /*danh sach cac hop dong duoc phat hanh trong thoi gian 36 thang*/
                  select /*+ CARDINALITY(tmp, 100) */
                      tmp.account_id
                  from ods.activity   tmp
                  where trunc(tmp.bus_processed_date, 'DD')
                          between add_months(valBeginDate, -35)
                          and valEndDate
                      and tmp.activity_code = 'A100'
                      and tmp.is_reversed = 'N'
              ) issu
                  on issu.account_id = acc.account_id
              inner join --lay ra la no duoc quan ly vao thang tinh
              (
                  select  /*+ CARDINALITY(aor, 100) */
                      aor.outlet_client_id outlet_id,
                      aor.account_id
                  from ods.account_outlet_relationship aor
                  where aor.relationship_type_code  = 'SERV'
                      and aor.effective_date <= (add_months(trunc(valBeginDate, 'MM'), 1) - 1)
                      and aor.account_outlet_id =
                      (
                          select max(aor_last.account_outlet_id)
                          from ods.account_outlet_relationship aor_last
                          where aor_last.account_id = aor.account_id
                              and aor_last.relationship_type_code  = 'SERV'
                              and aor_last.effective_date <= aor.effective_date
                      )
              ) key
                  on key.account_id = acc.account_id
              group by key.outlet_id
          ) indx;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, valRequestCode, 'vietstar_tal_cont_term+' || valTypeCode || '+' || valTimeFrequency || '-' || to_char(valRecordDate, 'dd/mm/yyyy'));
      end;

      procedure vietstar_syn_poli_mana(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          loop
              delete ams.la_outlet_index o
              where o.type_code = valTypeCode
                  and o.record_date = valRecordDate
                  and o.time_frequency = valTimeFrequency
                  and o.index_code = valIndexCode
                  and o.request_code = valRequestCode
                  and rownum < ams.LIFE_AGENCY_CODE.MAX_DELETE_NUMBER;
              exit when SQL%rowcount < ams.LIFE_AGENCY_CODE.MAX_DELETE_NUMBER - 1;
              commit;
          end loop;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, valRequestCode, 'vietstar_syn_cont_mana - delete+' || valTypeCode || '+' || valTimeFrequency || '-' || to_char(valRecordDate, 'dd/mm/yyyy'));
          ams.life_agency_log.time_begin;

          insert /*+ APPEND */ into ams.la_outlet_index nologging
          select   /*+
                     CARDINALITY(key, 100)
                     CARDINALITY(indx, 100)
                     */
              key.outlet_id,
              valTypeCode,
              valRecordDate,
              valVersionDate,
              valTimeFrequency,
              valBeginDate,
              valEndDate,
              valIndexCode,
              /*Phai tru ca so luong hop dong dao han o day thi moi dung duoc*/
              nvl(indx.index_value, 0) - nvl(expi.index_value, 0),
              null,
              null,
              valRequestCode,
              sysdate
          from
          (
              select /*+ CARDINALITY(outl, 100)*/
                  outl.outlet_id
              from ams.la_vietstar_temp_outlet outl
              where outl.record_date = valRecordDate
                  and outl.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
          ) key
          left join
          (
              select /*+ CARDINALITY(u, 100)*/
                  u.outlet_id,
                  sum(nvl(u.index_number, 0)) index_value
              from
              (
                  select /*+ CARDINALITY(tmp, 100)*/
                      tmp.outlet_id,
                      tmp.index_number
                  from ams.la_outlet_bvlife tmp
                  where tmp.type_code = valTypeCode
                      and tmp.time_frequency = valTimeFrequency
                      and tmp.request_code = valRequestCode
                      and tmp.record_date = valRecordDate

                  union all

                  select  /*+ CARDINALITY(tmp, 100)*/
                      tmp.outlet_id,
                      tmp.index_number
                  from ams.la_outlet_talisman tmp
                  where tmp.type_code = valTypeCode
                      and tmp.time_frequency = valTimeFrequency
                      and tmp.request_code = valRequestCode
                      and tmp.record_date = valRecordDate
              ) u
              group by u.outlet_id
          ) indx
              on
              (
                  indx.outlet_id = key.outlet_id
              )
          /*Lay danh sach cac hop dong dao han vao de tru cho dung*/
          left join
          (
              select /*+ CARDINALITY(u, 100)*/
                  u.outlet_id,
                  sum(nvl(u.index_number, 0)) index_value
              from
              (
                  select /*+ CARDINALITY(tmp, 100)*/
                      tmp.outlet_id,
                      tmp.index_number
                  from ams.la_outlet_bvlife tmp
                  /*Lay danh sach cac hop dong dao han len o day*/
                  where tmp.type_code = 'POLI_EXPI'
                      and tmp.time_frequency = valTimeFrequency
                      and tmp.request_code = valRequestCode
                      and tmp.record_date = valRecordDate

                  union all

                  select  /*+ CARDINALITY(tmp, 100)*/
                      tmp.outlet_id,
                      tmp.index_number
                  from ams.la_outlet_talisman tmp
                  /*Lay danh sach cac hop dong dao han len o day*/
                  where tmp.type_code = 'POLI_EXPI'
                      and tmp.time_frequency = valTimeFrequency
                      and tmp.request_code = valRequestCode
                      and tmp.record_date = valRecordDate
              ) u
              group by u.outlet_id
          ) expi
              on
              (
                  expi.outlet_id = key.outlet_id
              );
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, valRequestCode, 'vietstar_syn_cont_mana+' || valTypeCode || '+' || valTimeFrequency);
      end;


      procedure vietstar_syn_cont_mana(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          loop
              delete ams.la_outlet_index o
              where o.type_code = valTypeCode
                  and o.record_date = valRecordDate
                  and o.time_frequency = valTimeFrequency
                  and o.index_code = valIndexCode
                  and o.request_code = valRequestCode
                  and rownum < ams.LIFE_AGENCY_CODE.MAX_DELETE_NUMBER;
              exit when SQL%rowcount < ams.LIFE_AGENCY_CODE.MAX_DELETE_NUMBER - 1;
              commit;
          end loop;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, valRequestCode, 'vietstar_syn_cont_mana - delete+' || valTypeCode || '+' || valTimeFrequency || '-' || to_char(valRecordDate, 'dd/mm/yyyy'));
          ams.life_agency_log.time_begin;

          insert /*+ APPEND */ into ams.la_outlet_index nologging
          select   /*+
                     CARDINALITY(key, 100)
                     CARDINALITY(indx, 100)
                     */
              key.outlet_id,
              valTypeCode,
              valRecordDate,
              valVersionDate,
              valTimeFrequency,
              valBeginDate,
              valEndDate,
              valIndexCode,
              nvl(indx.index_value, 0),
              null,
              null,
              valRequestCode,
              sysdate
          from
          (
              select /*+ CARDINALITY(outl, 100)*/
                  outl.outlet_id
              from ams.la_vietstar_temp_outlet outl
              where outl.record_date = valRecordDate
                  and outl.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
          ) key
          left join
          (
              select /*+ CARDINALITY(u, 100)*/
                  u.outlet_id,
                  sum(nvl(u.index_number, 0)) index_value
              from
              (
                  select /*+ CARDINALITY(tmp, 100)*/
                      tmp.outlet_id,
                      tmp.index_number
                  from ams.la_outlet_bvlife tmp
                  where tmp.type_code = valTypeCode
                      and tmp.time_frequency = valTimeFrequency
                      and tmp.request_code = valRequestCode
                      and tmp.record_date = valRecordDate

                  union all

                  select /*+ CARDINALITY(tmp, 100)*/
                      tmp.outlet_id,
                      tmp.index_number
                  from ams.la_outlet_talisman tmp
                  where tmp.type_code = valTypeCode
                      and tmp.time_frequency = valTimeFrequency
                      and tmp.request_code = valRequestCode
                      and tmp.record_date = valRecordDate
              ) u
              group by u.outlet_id
          ) indx
              on
              (
                  indx.outlet_id = key.outlet_id
              );
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, valRequestCode, 'vietstar_syn_cont_mana+' || valTypeCode || '+' || valTimeFrequency);
      end;

    /*
        Creater: Le Khac Chinh
        Date Create: 1/6/2013
        Version: 1.0
        Description: Dong bo du lieu ve so luong hop dong huy bo tu 2 nguon la Talisman va BVLife
        Parameter:
            valTypeCode [varchar2]: Kieu du lieu
            valRecordDate [date]: Thang ghi nhan
            valVersionDate [date]: Ngay chay
            valTimeFrequency [varchar2]: Dinh ky
            valRecordDate [date]: Thang ghi nhan
            valBeginDate [date]: Ngay bat dau
            valEndDate [date]: Ngay ket thuc
            valIndexCode [varchar2]: Ma chi tieu
            valRequestCode [varchar2]: Ma yeu cau
        Update:  Le Khac Chinh
            Version: 1.1
            Date Updated: 3/7/2013
            Note:  Fix lai chuong trinh theo yeu cau: #107278 cua BA
                      Cong them so luong hop dong huy bo cua cac SP UVL vao
    */
      procedure vietstar_syn_cont_term(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          loop
              delete ams.la_outlet_index o
              where o.type_code = valTypeCode
                  and o.record_date = valRecordDate
                  and o.time_frequency = valTimeFrequency
                  and o.index_code = valIndexCode
                  and o.request_code = valRequestCode
                  and rownum < ams.LIFE_AGENCY_CODE.MAX_DELETE_NUMBER;
              exit when SQL%rowcount < ams.LIFE_AGENCY_CODE.MAX_DELETE_NUMBER - 1;
              commit;
          end loop;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, valRequestCode, 'vietstar_syn_cont_term - delete+' || valTypeCode || '+' || valTimeFrequency || '-' || to_char(valRecordDate, 'dd/mm/yyyy'));
          ams.life_agency_log.time_begin;

          insert /*+ APPEND */ into ams.la_outlet_index nologging
          select /*+
                     CARDINALITY(key, 100)
                     CARDINALITY(indx, 100)
                     */
              key.outlet_id,
              valTypeCode,
              valRecordDate,
              valVersionDate,
              valTimeFrequency,
              valBeginDate,
              valEndDate,
              valIndexCode,
              nvl(indx.index_value, 0),
              null,
              null,
              valRequestCode,
              sysdate
          from
          (
              select /*+ CARDINALITY(outl, 100)*/
                  outl.outlet_id,
                  outl.outlet_ams_id
              from ams.la_vietstar_temp_outlet outl
              where outl.record_date = valRecordDate
                  and outl.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
          ) key
          left join
          (
              select u.outlet_id,
                  sum(nvl(u.index_number, 0)) index_value
              from
              (
                  select /*+ CARDINALITY(tmp, 100)*/
                      tmp.outlet_id,
                      tmp.index_number
                  from ams.la_outlet_bvlife tmp
                  where tmp.type_code = valTypeCode
                      and tmp.time_frequency = valTimeFrequency
                      and tmp.request_code = valRequestCode
                      and tmp.record_date = valRecordDate

                  union all

                  select /*+ CARDINALITY(tmp, 100)*/
                      tmp.outlet_id,
                      tmp.index_number
                  from ams.la_outlet_talisman tmp
                  where tmp.type_code = valTypeCode
                      and tmp.time_frequency = valTimeFrequency
                      and tmp.request_code = valRequestCode
                      and tmp.record_date = valRecordDate
              ) u
              group by u.outlet_id
          ) indx
              on
              (
                  indx.outlet_id = key.outlet_id
              );
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, valRequestCode, 'vietstar_syn_cont_term+' || valTypeCode || '+' || valTimeFrequency);
      end;


    /*
        Creater: Le Khac Chinh
        Date Create: 29/05/2013
        Version: 1.1
        Description: Dong bo so luong cac Hop dong dao han o BVL va TAL
                     tuong ung voi tung dai ly
        Parameter:
            valTypeCode [varchar2]: Ma thuc hien
            valRecordDate [date]: Thang xu ly
            valVersionDate [date]: Ngay ghi nhan
            valTimeFrequency [varchar2]: Tan xuat thuc hien
            valBeginDate [date]: Ngay bat dau
            valEndDate [date]: Ngay ket thuc
            valIndexCode [varchar2]: Code xu ly
            valRequestCode [varchar2]: Code yeu cau
        Update:
            Version 1.1
                Le Khac Chinh
                Fix loi dem so luong HD quan ly theo ID 107278

    */
      procedure vietstar_syn_poli_expire(valTypeCode varchar2 := null,
          valRecordDate date := null,
          valVersionDate date := null,
          valTimeFrequency varchar2 := null,
          valBeginDate date := null,
          valEndDate date := null,
          valIndexCode varchar2 := null,
          valRequestCode varchar2 := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          loop
              delete ams.la_outlet_index o
              where o.type_code = valTypeCode
                  and o.record_date = valRecordDate
                  and o.time_frequency = valTimeFrequency
                  and o.index_code = valIndexCode
                  and o.request_code = valRequestCode
                  and rownum < ams.LIFE_AGENCY_CODE.MAX_DELETE_NUMBER;
              exit when SQL%rowcount < ams.LIFE_AGENCY_CODE.MAX_DELETE_NUMBER - 1;
              commit;
          end loop;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, valRequestCode, 'vietstar_syn_cont_term - delete+' || valTypeCode || '+' || valTimeFrequency || '-' || to_char(valRecordDate, 'dd/mm/yyyy'));
          ams.life_agency_log.time_begin;

          insert /*+ APPEND */ into ams.la_outlet_index nologging
          select /*+
                     CARDINALITY(key, 100)
                     CARDINALITY(indx, 100)
                     */
              key.outlet_id,
              valTypeCode,
              valRecordDate,
              valVersionDate,
              valTimeFrequency,
              valBeginDate,
              valEndDate,
              valIndexCode,
              nvl(indx.index_value, 0),
              null,
              null,
              valRequestCode,
              sysdate
          from
          (
              select /*+ CARDINALITY(outl, 100)*/
                  outl.outlet_id,
                  outl.outlet_ams_id
              from ams.la_vietstar_temp_outlet outl
              where outl.record_date = valRecordDate
                  and outl.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
          ) key
          left join
          (
              select u.outlet_id,
                  sum(nvl(u.index_number, 0)) index_value
              from
              (
                  select /*+ CARDINALITY(tmp, 100)*/
                      tmp.outlet_id,
                      tmp.index_number
                  from ams.la_outlet_bvlife tmp
                  where tmp.type_code = valTypeCode
                      and tmp.time_frequency = valTimeFrequency
                      and tmp.request_code = valRequestCode
                      and tmp.record_date = valRecordDate

                  union all

                  select /*+ CARDINALITY(tmp, 100)*/
                      tmp.outlet_id,
                      tmp.index_number
                  from ams.la_outlet_talisman tmp
                  where tmp.type_code = valTypeCode
                      and tmp.time_frequency = valTimeFrequency
                      and tmp.request_code = valRequestCode
                      and tmp.record_date = valRecordDate
              ) u
              group by u.outlet_id
          ) indx
              on
              (
                  indx.outlet_id = key.outlet_id
              );
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, valRequestCode, 'vietstar_syn_poli_expire+' || valTypeCode || '+' || valTimeFrequency);
      end;

      procedure run_vietstar(valRecordDate date := null,
          valKeyID number := null)
      is
      begin
          --thuc hien do so lieu vao bang chua danh sach cac dai ly ke ca nghi viec de lay so lieu cho dung
          --ca o BVL va TAL
          ams.LIFE_AGENCY_VIETSTAR_2013.export_outlet_syn(valRecordDate);
          --xoa 2 bang
          execute immediate 'truncate table ams.la_vietstar_trans_2012';
          execute immediate 'truncate table ams.la_vietstar_trans_ip';



          commit;
          --neu ma chay cai nay thi phai chay truoc cho no thi moi duoc co nhe
          --do so lieu vao bang policy cho no
          --sau do thi moi chay cac cai kia thi moi co the do duoc so lieu len cho no chinh xac duoc lay so lieu moi nhat cua no
        --lay so lieu tu TAL len cho no
          --lay so lieu ve cac hop dong con hieu luc cho den cuoi thang
          --xoa du lieu bang ve hop dong quan ly boi mot dai ly o 1 thang ra
          ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_tal_poli_sync(valRecordDate);

          ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_sync(valRecordDate);


          --life_agency_outlet.export_outlet_vietstar(valRecordDate, valKeyID);
          --lay so lieu ve dai ly vao bang chinh cho no
          ams.LIFE_AGENCY_VIETSTAR_2013.export_outlet(valRecordDate, valKeyID);
          ams.LIFE_AGENCY_VIETSTAR_2013.upload_modl_unit_dev(valRecordDate);

          ams.LIFE_AGENCY_VIETSTAR_2013.upload_psvs(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_psvs_fyp(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_psvs_fyp_ex(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_psvs_afyp_issu(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_psvs_afyp_info(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_psvs_pers_rate(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_psvs_coll_prem(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_psvs_real_prem(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_psvs_coll_rate(valRecordDate);

          ams.LIFE_AGENCY_VIETSTAR_2013.upload_umvs(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_umvs_temp(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_umvs_fyp(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_umvs_pr36(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_umvs_empl(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_umvs_ip_60days(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_umvs_numb_of_nagt(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_umvs_ip(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_umvs_process(valRecordDate);

          ams.LIFE_AGENCY_VIETSTAR_2013.upload_amvs(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_amvs_temp(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_amvs_fyp(valRecordDate);

          ams.LIFE_AGENCY_VIETSTAR_2013.upload_coll_prepare(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.upload_coll(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_coll_fyp(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_coll_numb_of_poli(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_coll_coll_prem(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_coll_real_prem(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_coll_rate(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_coll_cont_mang(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_coll_cont_canc(valRecordDate);


          ams.LIFE_AGENCY_VIETSTAR_2013.upload_cagv(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cagv_temp(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cagv_fyp(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cagv_numb_of_poli(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cagv_coll_prem(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cagv_real_prem(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cagv_coll_rate(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cagv_cont_mang(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cagv_cont_canc(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cagv_pers_rate(valRecordDate);

          ams.LIFE_AGENCY_VIETSTAR_2013.upload_cumv(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cumv_temp(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cumv_fyp(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cumv_fyp_bonus(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cumv_coll_prem(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cumv_real_prem(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cumv_coll_prem_avrg(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cumv_coll_rate_avrg(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cumv_cont_mang(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cumv_cont_canc(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cumv_pers_rate_avrg(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cumv_numb_of_agnt(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.update_trans(valRecordDate);
          --LIFE_AGENCY_VIETSTAR_2013.close_executing(valRecordDate);
      end;

    /*
        Creater: Le Khac Chinh
        Date Create: 1/6/2013
        Version: 1.0
        Description: Lay cac du lieu ve AFYP duy tri trong thoi gian thi dua
        Parameter:
            valRecordDate [date]: Thang ghi nhan
            valReRun [number]: Chay lai
            valRunDevelopment [number]: Chay lai
        Update:  Le Khac Chinh
            Version: 1.1
            Date Updated: 25/10/2013
            Note:  Fix lai lai do chay sai chi tieu FYP phan chay tu 1/12 den 12/12
    */
      procedure run_vietstar_gui(valRecordDate date := null,
          valReRun number := null,
          valRunDevelopment number := null)
      is
      begin
         --thuc hien do so lieu vao bang chua danh sach cac dai ly ke ca nghi viec de lay so lieu cho dung
          --ca o BVL va TAL
          ams.LIFE_AGENCY_VIETSTAR_2013.export_outlet_syn(valRecordDate);
          --xoa 2 bang
          execute immediate 'truncate table ams.la_vietstar_trans_2012';
          execute immediate 'truncate table ams.la_vietstar_trans_ip';
          commit;
          --neu ma chay cai nay thi phai chay truoc cho no thi moi duoc co nhe
          --do so lieu vao bang policy cho no
          --sau do thi moi chay cac cai kia thi moi co the do duoc so lieu len cho no chinh xac duoc lay so lieu moi nhat cua no
        --lay so lieu tu TAL len cho no
          --lay so lieu ve cac hop dong con hieu luc cho den cuoi thang
          --xoa du lieu bang ve hop dong quan ly boi mot dai ly o 1 thang ra

          ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_tal_poli_sync(valRecordDate);



           --/* FYP: OK
          ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_fyp(
              'FYP',
              trunc(valRecordDate, 'MM'),
              trunc(sysdate, 'DD'),
              ams.LIFE_AGENCY_CODE.FREQUENCY_YEARLY,
              trunc(valRecordDate, 'YYYY'), --to_date('1-jan-2013'),
              add_months(trunc(valRecordDate, 'YYYY'), 11) - 1,  --to_date('30-nov-2013'),
              ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
              ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
          --*/


          --/* FYPE: OK
          ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_fyp_ex(
              'FYPE',
              trunc(valRecordDate, 'MM'),
              trunc(sysdate, 'DD'),
              ams.LIFE_AGENCY_CODE.FREQUENCY_YEARLY,
              add_months(trunc(valRecordDate, 'YYYY'), 11), --to_date('12-dec-2013'),
              add_months(trunc(valRecordDate, 'YYYY'), 11) + 11, --to_date('12-dec-2013'),
              ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
              ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
          --*/
          dbms_stats.gather_table_stats(null, 'la_vietstar_trans_2012', cascade => true);

          --Lay so lieu IP theo giao dich cho no vao day
          ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_ip_trans(
              'IP',
              trunc(valRecordDate, 'MM'),
              trunc(sysdate, 'DD'),
              ams.LIFE_AGENCY_CODE.FREQUENCY_YEARLY,
              trunc(valRecordDate, 'YYYY'),
              add_months(trunc(valRecordDate, 'YYYY'), 11) - 1,  --30/11/2013
              ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
              ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
          --*/


          --/* FYPE: OK
          ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_ip_trans_ex(
              'IPE',
              trunc(valRecordDate, 'MM'),
              trunc(sysdate, 'DD'),
              ams.LIFE_AGENCY_CODE.FREQUENCY_YEARLY,
              add_months(trunc(valRecordDate, 'YYYY'), 11), --to_date('1-dec-2013'),
              add_months(trunc(valRecordDate, 'YYYY'), 11) + 11, --to_date('12-dec-2013'),
              ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
              ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
          --*/
          dbms_stats.gather_table_stats(null, 'la_vietstar_trans_ip', cascade => true);

          --/* AFYP ISSU: OK
          ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_afyp_iss(
              'AFYI',
              trunc(valRecordDate, 'MM'),
              trunc(sysdate, 'DD'),
              ams.LIFE_AGENCY_CODE.FREQUENCY_YEARLY,
              trunc(valRecordDate, 'YYYY'), --to_date('1-jan-2013'),
              add_months(trunc(valRecordDate, 'YYYY'), 11) - 1,  --to_date('30-nov-2013'),
              ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
              ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
          --*/

          --/* AFYP ISSU: OK
          ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_afyp_inf(
              'AFYE',
              trunc(valRecordDate, 'MM'),
              trunc(sysdate, 'DD'),
              ams.LIFE_AGENCY_CODE.FREQUENCY_YEARLY,
              trunc(valRecordDate, 'YYYY'), --to_date('1-jan-2013'),
              add_months(trunc(valRecordDate, 'YYYY'), 11) - 1,  --to_date('30-nov-2013'),
              ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
              ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
          --*/

          --/* AFYP phat hanh tinh cho chi tieu PR36 cua truong nhom kinh doanh
          ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_afyp_iss_pr36(
              'AFYI_PR36',
              trunc(valRecordDate, 'MM'),
              trunc(sysdate, 'DD'),
              ams.LIFE_AGENCY_CODE.FREQUENCY_MONTHLY,
              trunc(valRecordDate, 'MM'), --to_date('1-jan-2013'),
              last_day(trunc(valRecordDate, 'MM')),  --to_date('30-nov-2013'),
              ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
              ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
          --*/

          --/* AFYP duy tri tinh cho chi tieu PR36 cua truong nhom kinh doanh
          ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_afyp_inf_pr36(
              'AFYE_PR36',
              trunc(valRecordDate, 'MM'),
              trunc(sysdate, 'DD'),
              ams.LIFE_AGENCY_CODE.FREQUENCY_MONTHLY,
              trunc(valRecordDate, 'MM'), --to_date('1-jan-2013'),
              last_day(trunc(valRecordDate, 'MM')),  --to_date('30-nov-2013'),
              ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
              ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
          --*/

          /*CHU Y cho nay la:
          Do no chay theo thang tu thang 1 cho den thang 11 va
          moi thang da lay ca dai ly con lam viec va nghi viec cho no roi nen chi can dung bang temp
          the la du roi khong phai thay doi gi ca*/

          if valReRun = 1 then
              --lay so lieu tu BVL len cho no
              --cho toan bo cac dai ly con dang lam viec cho den ngay
              for i in 0..10
              loop

                  --/* POLI_MANA: OK So luong hop dong quan ly de tinh so luong hop dong quan ly
                  ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_bvl_poli_mana(
                      'POLI_MANA',
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      trunc(sysdate, 'DD'),
                      ams.LIFE_AGENCY_CODE.FREQUENCY_MONTHLY,
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                      ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
                      ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
                  --*/

                  --/* CONT_MANA: OK
                  ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_bvl_cont_mana(
                      'CONT_MANA',
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      trunc(sysdate, 'DD'),
                      ams.LIFE_AGENCY_CODE.FREQUENCY_MONTHLY,
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                      ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
                      ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
                  --*/

                  -- CONT_TERM: OK
                  ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_bvl_cont_term(
                      'CONT_TERM',
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      trunc(sysdate, 'DD'),
                      ams.LIFE_AGENCY_CODE.FREQUENCY_MONTHLY,
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                      ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
                      ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);

                  --/* POLI_EXPI: OK So luong hop dong dao han
                  ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_bvl_poli_expire(
                      'POLI_EXPI',
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      trunc(sysdate, 'DD'),
                      ams.LIFE_AGENCY_CODE.FREQUENCY_MONTHLY,
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                      ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
                      ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
                      --
              end loop;

              dbms_stats.gather_table_stats(null, 'la_outlet_bvlife', cascade => true);

              --lay so lieu tu TAL len cho no
              for i in 0..10
              loop
                  --/* POLI_MANA: OK So luong hop dong quan ly de tinh so luong hop dong quan ly
                  ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_tal_poli_mana(
                      'POLI_MANA',
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      trunc(sysdate, 'DD'),
                      ams.LIFE_AGENCY_CODE.FREQUENCY_MONTHLY,
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                      ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
                      ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
                  --*/

                  --/* CONT_MANA: OK
                  ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_tal_cont_mana(
                      'CONT_MANA',
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      trunc(sysdate, 'DD'),
                      ams.LIFE_AGENCY_CODE.FREQUENCY_MONTHLY,
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                      ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
                      ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
                  --*/

                  -- CONT_TERM: OK
                  ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_tal_cont_term(
                      'CONT_TERM',
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      trunc(sysdate, 'DD'),
                      ams.LIFE_AGENCY_CODE.FREQUENCY_MONTHLY,
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                      ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
                      ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
                  --
              end loop;

              dbms_stats.gather_table_stats(null, 'la_outlet_talisman', cascade => true);


              --sync du lieu cho no
              for i in 0..10
              loop

                  --/* POLI_MANA: OK So luong hop dong quan ly de tinh so luong hop dong quan ly
                  ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_syn_poli_mana(
                      'POLI_MANA',
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      trunc(sysdate, 'DD'),
                      ams.LIFE_AGENCY_CODE.FREQUENCY_MONTHLY,
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                      ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
                      ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
                  --*/

                  --/* CONT_MANA: OK
                  ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_syn_cont_mana(
                      'CONT_MANA',
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      trunc(sysdate, 'DD'),
                      ams.LIFE_AGENCY_CODE.FREQUENCY_MONTHLY,
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                      ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
                      ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
                  --*/

                  --/* CONT_TERM: OK
                  ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_syn_cont_term(
                      'CONT_TERM',
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      trunc(sysdate, 'DD'),
                      ams.LIFE_AGENCY_CODE.FREQUENCY_MONTHLY,
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                      ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
                      ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
                  --*/
                  --/* POLI_EXPI: OK
                  ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_syn_poli_expire(
                      'POLI_EXPI',
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      trunc(sysdate, 'DD'),
                      ams.LIFE_AGENCY_CODE.FREQUENCY_MONTHLY,
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                      ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
                      ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
              end loop;

              dbms_stats.gather_table_stats(null, 'la_outlet_index', cascade => true);
          else
              --neu ma khong chay lai toan bo chi chay mot so phan thi se lam nhu sau
              --lay so lieu tu BVL len cho no
              --cho toan bo cac dai ly con dang lam viec cho den ngay
              for i in to_number(to_char(sysdate,'MM')) - 2 ..to_number(to_char(sysdate,'MM'))
              loop

                  --/* POLI_MANA: OK So luong hop dong quan ly de tinh so luong hop dong quan ly
                  ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_bvl_poli_mana(
                      'POLI_MANA',
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      trunc(sysdate, 'DD'),
                      ams.LIFE_AGENCY_CODE.FREQUENCY_MONTHLY,
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                      ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
                      ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
                  --*/

                  --/* CONT_MANA: OK
                  ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_bvl_cont_mana(
                      'CONT_MANA',
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      trunc(sysdate, 'DD'),
                      ams.LIFE_AGENCY_CODE.FREQUENCY_MONTHLY,
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                      ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
                      ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
                  --*/

                  -- CONT_TERM: OK
                  ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_bvl_cont_term(
                      'CONT_TERM',
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      trunc(sysdate, 'DD'),
                      ams.LIFE_AGENCY_CODE.FREQUENCY_MONTHLY,
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                      ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
                      ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
                  --

                  --/* POLI_EXPI: OK So luong hop dong dao han
                  ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_bvl_poli_expire(
                      'POLI_EXPI',
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      trunc(sysdate, 'DD'),
                      ams.LIFE_AGENCY_CODE.FREQUENCY_MONTHLY,
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                      ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
                      ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
                      --
              end loop;

              dbms_stats.gather_table_stats(null, 'la_outlet_bvlife', cascade => true);

              --lay so lieu tu TAL len cho no
              for i in to_number(to_char(sysdate,'MM')) - 2 ..to_number(to_char(sysdate,'MM'))
              loop
                  --/* POLI_MANA: OK So luong hop dong quan ly de tinh so luong hop dong quan ly
                  ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_tal_poli_mana(
                      'POLI_MANA',
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      trunc(sysdate, 'DD'),
                      ams.LIFE_AGENCY_CODE.FREQUENCY_MONTHLY,
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                      ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
                      ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
                  --*/

                  --/* CONT_MANA: OK
                  ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_tal_cont_mana(
                      'CONT_MANA',
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      trunc(sysdate, 'DD'),
                      ams.LIFE_AGENCY_CODE.FREQUENCY_MONTHLY,
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                      ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
                      ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
                  --*/

                  -- CONT_TERM: OK
                  ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_tal_cont_term(
                      'CONT_TERM',
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      trunc(sysdate, 'DD'),
                      ams.LIFE_AGENCY_CODE.FREQUENCY_MONTHLY,
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                      ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
                      ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
                  --
              end loop;

              dbms_stats.gather_table_stats(null, 'la_outlet_talisman', cascade => true);

              --sync du lieu cho no
              for i in to_number(to_char(sysdate,'MM')) - 2 ..to_number(to_char(sysdate,'MM'))
              loop
                  --/* POLI_MANA: OK So luong hop dong quan ly de tinh so luong hop dong quan ly
                  ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_syn_poli_mana(
                      'POLI_MANA',
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      trunc(sysdate, 'DD'),
                      ams.LIFE_AGENCY_CODE.FREQUENCY_MONTHLY,
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                      ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
                      ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
                  --*/

                  --/* CONT_MANA: OK
                  ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_syn_cont_mana(
                      'CONT_MANA',
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      trunc(sysdate, 'DD'),
                      ams.LIFE_AGENCY_CODE.FREQUENCY_MONTHLY,
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                      ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
                      ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
                  --*/

                  --/* CONT_TERM: OK
                  ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_syn_cont_term(
                      'CONT_TERM',
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      trunc(sysdate, 'DD'),
                      ams.LIFE_AGENCY_CODE.FREQUENCY_MONTHLY,
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                      ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
                      ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
                  --*/
                  --/* POLI_EXPI: OK
                  ams.LIFE_AGENCY_VIETSTAR_2013.vietstar_syn_poli_expire(
                      'POLI_EXPI',
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      trunc(sysdate, 'DD'),
                      ams.LIFE_AGENCY_CODE.FREQUENCY_MONTHLY,
                      add_months(trunc(valRecordDate, 'YYYY'), i),
                      (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                      ams.LIFE_AGENCY_CODE.INDEX_CODE_NUMBER,
                      ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE);
              end loop;

              dbms_stats.gather_table_stats(null, 'la_outlet_index', cascade => true);
          end if;

          --lay so lieu ve dai ly vao bang chinh cho no
          ams.LIFE_AGENCY_VIETSTAR_2013.export_outlet(valRecordDate, 0);

          --neu can chay lai cai Ngay thang thi moi lam nhu vay cho no thoi nhe

          ams.LIFE_AGENCY_VIETSTAR_2013.upload_modl_unit_dev(valRecordDate);


          ams.LIFE_AGENCY_VIETSTAR_2013.upload_psvs(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_psvs_fyp(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_psvs_fyp_ex(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_psvs_afyp_issu(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_psvs_afyp_info(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_psvs_pers_rate(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_psvs_coll_prem(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_psvs_real_prem(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_psvs_coll_rate(valRecordDate);

          ams.LIFE_AGENCY_VIETSTAR_2013.upload_umvs(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_umvs_temp(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_umvs_fyp(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_umvs_pr36(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_umvs_empl(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_umvs_ip_60days(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_umvs_numb_of_nagt(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_umvs_ip(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_umvs_process(valRecordDate);

          ams.LIFE_AGENCY_VIETSTAR_2013.upload_amvs(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_amvs_temp(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_amvs_fyp(valRecordDate);

          ams.LIFE_AGENCY_VIETSTAR_2013.upload_coll_prepare(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.upload_coll(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_coll_fyp(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_coll_numb_of_poli(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_coll_coll_prem(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_coll_real_prem(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_coll_rate(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_coll_cont_mang(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_coll_cont_canc(valRecordDate);
          --LIFE_AGENCY_VIETSTAR_2013.list_coll_pers_rate(valRecordDate);

          ams.LIFE_AGENCY_VIETSTAR_2013.upload_cagv(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cagv_temp(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cagv_fyp(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cagv_numb_of_poli(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cagv_coll_prem(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cagv_real_prem(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cagv_coll_rate(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cagv_cont_mang(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cagv_cont_canc(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cagv_pers_rate(valRecordDate);

          ams.LIFE_AGENCY_VIETSTAR_2013.upload_cumv(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cumv_temp(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cumv_fyp(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cumv_fyp_bonus(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cumv_coll_prem(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cumv_real_prem(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cumv_coll_prem_avrg(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cumv_coll_rate_avrg(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cumv_cont_mang(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cumv_cont_canc(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cumv_pers_rate_avrg(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.list_cumv_numb_of_agnt(valRecordDate);
          ams.LIFE_AGENCY_VIETSTAR_2013.update_trans(valRecordDate);
          --life_agency_vietstar_2013.close_executing(valRecordDate);
      end;



      procedure run_vietstar_user(
          valReRun number := null,
          valRunDevelopment number := null)
      is
          var_record_date date := trunc(sysdate, 'MM');
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;
          begin
              --lay cai nay de co the lay ra thang ma no co so lieu o serv_data_va FYP va policy
              --de lay so lieu ra cho dung
              select /*+ CARDINALITY(res, 100)*/
                  res.record_date
                      into var_record_date
              from
              (
                  select  /*+ CARDINALITY(tmp, 100)*/
                      tmp.record_date,
                      row_number() over (order by tmp.record_date desc)  as rowno
                  from ams.serv_outlet_data tmp
                  where tmp.record_date <= add_months(trunc(sysdate, 'YYYY'), 10)
                      and tmp.status_code = ams.AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
              ) res
              where res.rowno = 1;
          exception
              when others then
                  var_record_date := trunc(sysdate, 'MM');
                  if var_record_date > add_months(trunc(to_date('1-jan-2013'), 'YYYY'), 10)  then
                      var_record_date := add_months(trunc(to_date('1-jan-2013'), 'YYYY'), 10);
                  end if;
          end;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2013', 'run_vietstar_user chay k can dau vao la ngay thang');

          /*sau do thi chay cai o o duoi de cho nhanh*/
          ams.life_agency_vietstar_2013.run_vietstar_gui(var_record_date, valReRun,valRunDevelopment);
      end;

    /*
        Creater: Le Khac Chinh
        Date Create: 29/05/2013
        Version: 1.1
        Description: Do du lieu cac dai ly de hien thi len giao dien
        Parameter:
            valRecordDate [date]: Thang xu ly
            valKeyID [number]: Ma cong ty
        Update:  Le Khac Chinh
            Version: 1.1
            Date Updated: 4/9/2013
            Note: Loai bo cac dai ly thuoc cong ty Banca theo ID 107441

    */
      procedure export_outlet(valRecordDate date := null,
          valKeyID number := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;
          loop
              delete ams.la_vietstar_outlet_2012 tmp
              where tmp.record_date = trunc(valRecordDate, 'YYYY')
                  and tmp.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
                  and
                  (
                      tmp.company_id = nvl(valKeyID, 0)
                      or
                      nvl(valKeyID, 0) = 0
                  )
                  and rownum < ams.LIFE_AGENCY_CODE.MAX_DELETE_NUMBER;
              exit when SQL%rowcount < ams.LIFE_AGENCY_CODE.MAX_DELETE_NUMBER - 1;
              commit;
          end loop;
          commit;
          --Lay ca dai ly nghi viec vao day
          insert/*+ APPEND */ into ams.la_vietstar_outlet_2012 nologging(
              outlet_id,
              record_date,
              version_date,
              update_datetime,
              type_code,
              outlet_bvlife_id,
              outlet_talisman_id,
              outlet_number,
              outlet_ams_id,
              outlet_name,
              company_id,
              company_name,
              office_id,
              office_name,
              agency_id,
              agency_name,
              unit_id,
              unit_name,
              position_code,
              effective_date,
              terminative_date,
              status_code,
              be_paid,
              be_executing)
          select key.outlet_id,
              trunc(valRecordDate, 'YYYY'),
              trunc(sysdate, 'DD'),
              sysdate,
              ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE,
              substr(key.outlet_ams_id, 2),
              key.outlet_id,
              key.outlet_ams_id,
              key.outlet_ams_id,
              key.outlet_name,
              key.company_id,
              key.company_name,
              key.office_id,
              key.office_name,
              key.agency_id,
              key.agency_name,
              key.unit_id,
              key.unit_name,
              key.position_code,
              key.effective_date,
              key.terminative_date,
              case when key.terminative_date is not null then
                  ams.LIFE_AGENCY_VIETSTAR_2013.STATUS_TERM
              else
                  ams.LIFE_AGENCY_VIETSTAR_2013.STATUS_CURR
              end,
              ams.LIFE_AGENCY_CODE.OUTLET_PAID_YES,
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
          from
          (
              --lay tat ca moi dai ly vao day cho no
              --ke ca cac dai ly nghi viec trong thang vao day cho no
              select
                  outl.outlet_id,
                  outl.outlet_ams_id,
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
                  outl.unit_name
              from ams.serv_outlet_data outl
              where outl.record_date = trunc(valRecordDate, 'MM')
                  and outl.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE_MAIN
                  and outl.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                  and
                  (
                      outl.company_id = nvl(valKeyID, 0)
                      or
                      nvl(valKeyID, 0) = 0
                  )
                  --khong tinh cac dai ly Banca
                  and outl.agency_ams_id not in ('A107301004', 'A107301005', 'A107301006', 'A107302003', 'A107302004')
          ) key;
          commit;

          dbms_stats.gather_table_stats(null, 'la_vietstar_outlet_2012', cascade => true);

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VietStart', 'export_outlet');
      end;
      --do so lieu ve cac dai ly vao tam truoc de lay toan bo so lieu
      --trong BVL va TAL cho no dung da nhe KHONG LA do thieu so lieu thi se khong lay duoc so lieu cho minh

    /*
        Creater: Le Khac Chinh
        Date Create: 29/05/2013
        Version: 1.1
        Description: Do du lieu cac dai ly de xu ly
        Parameter:
            valRecordDate [date]: Thang xu ly
        Update:  Le Khac Chinh
            Version: 1.1
            Date Updated: 4/9/2013
            Note: Loai bo cac dai ly thuoc cong ty Banca theo ID 107441
    */
      procedure export_outlet_syn(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;
          /*thuc hien lay so lieu ve cac thang cua cac dai ly ke ca da nghi viec vao bang de co the join va chay cho nhanh
          de tinh FYP ke ca cua dai ly da nghi viec roi
          thuc hien the nay de chay nhanh hon*/
          execute immediate 'truncate table ams.la_vietstar_temp_outlet';
          commit;

          --phai lay so lieu den ca thang 12 nua boi vi con phan Ext phai lay so lieu cua thang 12 cho no
          for i in 0..11
          loop
              ams.life_agency_log.time_stop;
              ams.life_agency_log.time_begin;
              insert /*+ APPEND */ into ams.la_vietstar_temp_outlet nologging
              select /*+ CARDINALITY(outl, 100)*/
                  outl.outlet_id,
                  ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE,
                  add_months(trunc(valRecordDate, 'YYYY'), i),
                  trunc(sysdate, 'DD'),
                  ams.LIFE_AGENCY_VIETSTAR_2013.STATUS_CURR,
                  outl.outlet_ams_id,
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
                  ams.AMS_CORE_SYSTEM.SYSTEM_USER,
                  ams.AMS_CORE_SYSTEM.SYSTEM_USER,
                  sysdate,
                  sysdate
              from ams.serv_outlet_data outl
              where outl.record_date = add_months(trunc(valRecordDate, 'YYYY'), i)
                  and outl.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE_MAIN
                  and outl.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                  and outl.terminative_date is null
                  --khong tinh cac dai ly Banca
                  and outl.agency_ams_id not in ('A107301004', 'A107301005', 'A107301006', 'A107302003', 'A107302004');
              commit;
              --lay them ca cac dai ly da nghi viec trong thang vao
              --phai lay cac dai ly nghi viec tu dau nam cho den thang tinh thi moi dung duoc
              insert /*+ APPEND */ into ams.la_vietstar_temp_outlet nologging
              select /*+ CARDINALITY(outl, 100)*/
                  outl.outlet_id,
                  ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE,
                  add_months(trunc(valRecordDate, 'YYYY'), i),
                  trunc(sysdate, 'DD'),
                  ams.LIFE_AGENCY_VIETSTAR_2013.STATUS_TERM,
                  outl.outlet_ams_id,
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
                  ams.AMS_CORE_SYSTEM.SYSTEM_USER,
                  ams.AMS_CORE_SYSTEM.SYSTEM_USER,
                  sysdate,
                  sysdate
              from ams.serv_outlet_data outl
              --nghi viec ca trong thang thi cung se cho vao bang nay luon de cau truc no la giong nhau
              where outl.record_date = add_months(trunc(valRecordDate, 'YYYY'), i)
                  and outl.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE_MAIN
                  and outl.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                  and outl.terminative_date is not null
                  --khong tinh cac dai ly Banca
                  and outl.agency_ams_id not in ('A107301004', 'A107301005', 'A107301006', 'A107302003', 'A107302004');
                  --ngay nghi viec phai la trong nam 2013 >= '1-jan-2013'
                  --khong can dieu kien nay nua dau nhe boi vi no se chi nghi viec trong thang day thoi nhe
                  --and outl.terminative_date >= trunc(valRecordDate, 'YYYY');
              commit;
              ams.life_agency_log.time_end;
              ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2013', 'export_outlet_syn: ' || to_char(i));
          end loop;

          execute immediate 'truncate table ams.la_vietstar_temp_outlet_ext';
          commit;
          /*Do tat ca cac dai ly ke ca dai ly nghi viec tu dau nam vao mot bang mo rong de xu ly de hon*/
          insert /*+ APPEND */ into ams.la_vietstar_temp_outlet_ext nologging
          select /*+ CARDINALITY(o, 100)*/
              o.*
          from ams.la_vietstar_temp_outlet o
          where o.record_date = trunc(valRecordDate, 'MM')
              and o.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE;
          commit;

          insert /*+ APPEND */ into ams.la_vietstar_temp_outlet_ext nologging
          select /*+ CARDINALITY(o, 100)*/
              o.*
          from ams.la_vietstar_temp_outlet o
          where o.record_date
              between trunc(valRecordDate, 'YYYY')
              and add_months(trunc(valRecordDate, 'MM'), -1)
          and o.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
          and o.terminative_date is not null;
          commit;

          dbms_stats.gather_table_stats(null, 'la_vietstar_temp_outlet_ext', cascade => true);
          dbms_stats.gather_table_stats(null, 'la_vietstar_temp_outlet', cascade => true);

       /*exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_unit_dev: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);*/
    end;

    procedure upload_modl_unit_dev(valRecordDate date := null)
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

        execute immediate  'truncate table la_vietstar_temp_devu_des';
        execute immediate  'truncate table la_vietstar_unit_dev';
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'upload_modl_unit_dev', 'Xoa du lieu chi tiet thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 1;

        /* Cac truong nhom hien tai thi moi duoc tinh vao con neu khong thi khong dc  tinh
            Chu y: Ngay hieu luc cua phat trien nhom la ke tu khi ma truong nhom con chinh thuc len lam truong nhom
            tinh nhu the moi dung duoc
            Va chi xac dinh 1 LAN o day dung position_date
            KHONG merge o duoi kia boi vi nhu the thi se bi sai

            Sau khi da lay duoc ngay hieu luc roi thi
            for i = 0 to 5
            Neu ma thang do >= ngay hieu luc phat trien nhom thi nhom goc moi duoc an nhom day
            Boi vi chi tinh khi ma nhom da duoc phat trien len roi con truoc do thi khong duoc cong vao
            Da xem lai ngay 11/2/2012
        */

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'upload_modl_unit_dev', 'xoa du lieu thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 2;
        /*
        De lay ra cac nhom cap 2 thi se phai
        Chi lay ra danh sach cac NHOM MOI
        tuc ngay hieu luc chuc vu cua truong nhom moi nam trong thoi gian tu 1/1/2013 den 31/12/2013 thoi
        KHONG lay cac truong nhom cu vi da co cay thu muc tai thoi diem 1/1/2013 roi*/
        insert /*+ APPEND */ into ams.la_vietstar_unit_dev nologging (
            outlet_ams_id,
            record_date,
            version_date,
            agency_ams_id,
            unit_ams_id,
            unit_root_fyp,
            unit_root_new_outl_qty,
            position_date,
            umnm_be_paid,
            umnm_be_executing,
            devu_sernior_by_months,
            devu_percent,
            devu_root_fyp,
            devu_root_new_outl_qty,
            create_user,
            update_user,
            create_datetime,
            update_datetime
        )
        select /*+ CARDINALITY(data, 100)*/
            tmp.outlet_ams_id,
            trunc(valRecordDate, 'YYYY'),
            cast(trunc(sysdate, 'DD') as date),
            tmp.agency_ams_id,
            tmp.unit_ams_id,
            0,
            0,
            tmp.position_date,
            LIFE_AGENCY_VIETSTAR_2013.BE_PAID_NO,
            LIFE_AGENCY_VIETSTAR_2013.BE_EXECUTING_YES,
            --cho nay can phai them vao day cot ten la: tham nien ke tu 30/11/2013 cho den ngay do la bao nhieu thang?
            --co nen fix cung 30/11 cho den ngay do la bao nhieu thang o day khong?
            --CHO NAY TINH TU 30/11/2013 tro ve ngay phat trien nhom day de tinh he so cho dung hon
            round(months_between((add_months(trunc(valRecordDate, 'YYYY'), 10) - 1), tmp.position_date), 2),
            1,
            0,
            0,
            LIFE_AGENCY_VIETSTAR_2013.SYSTEM_USER,
            LIFE_AGENCY_VIETSTAR_2013.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.la_vietstar_temp_outlet tmp
        where tmp.record_date = trunc(valRecordDate, 'MM')
            and tmp.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
            and tmp.position_code = LIFE_AGENCY_VIETSTAR_2013.COMP_CODE_MMXIII_CV02--cac truong nhom hien tai
            /*Chi lay ra danh sach cac NHOM MOI
            tuc ngay hieu luc chuc vu cua truong nhom moi nam trong thoi gian tu 1/1/2013 den 31/12/2013 thoi
            KHONG lay cac truong nhom cu vi da co cay thu muc tai thoi diem 1/1/2013 roi
            Nhu the thi moi lay dung duoc cac he so vao cho no duoc*/
            --Cho nay dang lam bi sai o day roi day nhe
            --Ngay chuc vu ma no hien len nhu the nay la khong dung roi day nhe
           and tmp.position_date
                between trunc(valRecordDate, 'YYYY')
                --chi chay den thang nay ma no tinh thoi
                --and add_months(trunc(valRecordDate, 'YYYY'), 12) - 1;
                and last_day(trunc(valRecordDate, 'MM'));
        commit;

        dbms_stats.gather_table_stats(null, 'la_vietstar_unit_dev', cascade => true);


        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'upload_modl_unit_dev', 'Lay ra danh sach cac NHOM MOI thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 4;

        /* Xet trong vong quay lai 12 thang
        phai bat dau tu so 1 vi tim tien truong nhom o thang truoc day
        tuc la thang add_months(trunc(valRecordDate, 'MM'), -i) roi sau do tim ra duoc nhom da phat trien len
        */
        /*KHONG MERGE ngay hieu luc phat trien nhom o day*/
        for i in 0..11
        loop
            --xu ly o day neu ma cai thang chay THANG TINH nam trong khoang gioi han o tren kia da co roi thi moi duoc tinh o day cho no
            --con neu khong thi khong xu ly gi ca
            --Nhu the nay thi se chi lay so lieu nhung thang can quay tro lai thoi

            --chi xet trong vong va quay nguoc tro lai trong nam 2012 cho dai ly thoi de kiem tra
            if add_months(trunc(valRecordDate, 'MM'), -i)
                between trunc(valRecordDate, 'YYYY')
                and trunc(valRecordDate, 'MM') --chi cho chay den thang day thoi chu khong la lai chay nham
            then
                merge /*+ CARDINALITY(umdv, 100)*/
                    into ams.la_vietstar_unit_dev umdv
                using
                    (
                        select /*+ CARDINALITY(newu, 100)
                                   CARDINALITY(oldo, 100)
                                   CARDINALITY(oldu, 100) */
                            newu.outlet_ams_id,
                            oldu.unit_ams_id umnp_unit_ams_id
                        from
                        (  /*cac truong nhom o thoi diem hien tai*/
                            select /*+ CARDINALITY(umnm, 100)  */
                                umnm.outlet_ams_id,
                                umnm.unit_ams_id
                            from ams.la_vietstar_unit_dev umnm
                            where umnm.record_date = trunc(valRecordDate, 'YYYY')
                                and umnm.umnm_be_executing = LIFE_AGENCY_VIETSTAR_2013.BE_EXECUTING_YES
                        ) newu
                        join
                        (   /*lay ra o thang truong day add_months(trunc(valRecordDate, 'MM'), -i)
                            khi ma truong nhom day con la tien truong nhom
                            thi o nhom nao de tinh ra la trong thang day thi se tinh thuong cho nhom day them nguoi o thoi gian day*/
                            select /*+ CARDINALITY(data, 100)*/
                                data.record_date,
                                data.outlet_id,
                                data.outlet_ams_id,
                                data.unit_id,
                                data.unit_ams_id
                            from ams.la_vietstar_temp_outlet data
                            where data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                                and data.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
                                and data.position_code = LIFE_AGENCY_VIETSTAR_2013.COMP_CODE_MMXIII_CV01--cac truong nhom hien tai
                        ) oldo
                            on
                            (
                                oldo.outlet_ams_id = newu.outlet_ams_id
                            )
                        --neu ma no tach ra duoc tu nhom thi join voi ma truong nhom CV02 phai co so lieu
                        --con neu khong thi se xu ly o phia duoi de join voi ma truong ban CV04 de lay ra neu ma khong co ma truong nhom
                        --de lay ra ma so cho truong ban
                        join
                        (  /*lay ra ma nhom va truong nhom truoc huong vao thang truoc do neu ma tinh tach ra tu nhom do*/
                            select
                                data.outlet_id,
                                data.outlet_ams_id,
                                data.outlet_name,
                                data.unit_id,
                                data.unit_ams_id,
                                data.unit_name
                            from ams.la_vietstar_temp_outlet data
                            where data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                                and data.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
                                and data.position_code in
                                ( --co the se duoc tach ra tu 1 nhom CNTH truoc do nua theo confirm anh Cong Hoa  27/3/2013 khi nc voi anh Tuan
                                    LIFE_AGENCY_VIETSTAR_2013.COMP_CODE_MMXIII_CV02,--cac truong nhom khi ma nhom do duco tach ra
                                    LIFE_AGENCY_VIETSTAR_2013.COMP_CODE_MMXIII_CV03
                                )
                        ) oldu --lay ra nhom cu ma va ten truong nhom
                            on
                            (
                                oldu.unit_ams_id = oldo.unit_ams_id
                            )
                        where newu.unit_ams_id <> nvl(oldo.unit_ams_id, '')
                    ) upd
                on (--lay du lieu o thang day de cap nhat chu khong pahi la tat ca moi thang neu khong thi se sai
                    trunc(valRecordDate, 'YYYY') = umdv.record_date
                    and
                    upd.outlet_ams_id = umdv.outlet_ams_id
                    )
                when matched then
                    update
                        set
                            umdv.umnm_be_paid = LIFE_AGENCY_VIETSTAR_2013.BE_PAID_YES,
                            umdv.umnm_unit_ams_id = upd.umnp_unit_ams_id,
                            umdv.umnm_agency_status = 0;--tach ra tu nhom
                commit;

                /*Neu ma tach ra tu ban thi se xu ly cho no lay cac so lieu duoc tach ra tu ban cho no dung*/

                merge /*+ CARDINALITY(umdv, 100)*/
                    into ams.la_vietstar_unit_dev umdv
                using
                    (
                        select /*+ CARDINALITY(newu, 100)
                                   CARDINALITY(oldo, 100)
                                   CARDINALITY(oldu, 100) */
                            newu.outlet_ams_id,
                            old_agency.agency_ams_id umnp_unit_ams_id
                        from
                        (  /*cac truong nhom o thoi diem hien tai*/
                            select /*+ CARDINALITY(umnm, 100)  */
                                umnm.outlet_ams_id,
                                umnm.unit_ams_id
                            from ams.la_vietstar_unit_dev umnm
                            where umnm.record_date = trunc(valRecordDate, 'YYYY')
                                and umnm.umnm_be_executing = LIFE_AGENCY_VIETSTAR_2013.BE_EXECUTING_YES
                                --chi xu ly khi ma nhung cai phia tren ma khong co so lieu truong nhom thi se xu ly
                                and umnm.umnm_be_paid = LIFE_AGENCY_VIETSTAR_2013.BE_PAID_NO
                        ) newu
                        join
                        (   /*lay ra o thang truong day add_months(trunc(valRecordDate, 'MM'), -i)
                            khi ma truong nhom day con la tien truong nhom
                            thi o nhom nao de tinh ra la trong thang day thi se tinh thuong cho nhom day them nguoi o thoi gian day*/
                            select /*+ CARDINALITY(data, 100)*/
                                data.record_date,
                                data.outlet_id,
                                data.outlet_ams_id,
                                data.unit_id,
                                data.unit_ams_id,
                                data.agency_id,
                                data.agency_ams_id
                            from ams.la_vietstar_temp_outlet data
                            where data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                                and data.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
                                and data.position_code = LIFE_AGENCY_VIETSTAR_2013.COMP_CODE_MMXIII_CV01--cac truong nhom hien tai
                        ) oldo
                            on
                            (
                                oldo.outlet_ams_id = newu.outlet_ams_id
                            )
                        --neu ma no tach ra duoc tu ban thi join voi ma ma truong ban CV04 de lay ra
                        --de lay ra ma so cho truong ban
                        join
                        (  /*lay ra ma ban va truong ban truoc huong vao thang truoc do neu ma tinh tach ra tu nhom truc tiep cua ban do
                           Ma khong tach tu nhom*/
                            select
                                data.outlet_id,
                                data.outlet_ams_id,
                                data.outlet_name,
                                data.unit_id,
                                data.unit_ams_id,
                                data.agency_id,
                                data.agency_ams_id,
                                data.agency_name
                            from ams.la_vietstar_temp_outlet data
                            where data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                                and data.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
                                and data.position_code = LIFE_AGENCY_VIETSTAR_2013.COMP_CODE_MMXIII_CV04--cac truong nhom khi ma nhom do duco tach ra
                                and data.unit_ams_id is null --khong co ma nhom
                                and data.agency_ams_id is not null --chi co ma ban
                        ) old_agency --lay ra nhom cu ma va ten truong nhom
                            on
                            (
                                old_agency.agency_ams_id = oldo.agency_ams_id
                            )
                        left join
                        (  /*lay ra ma nhom va truong nhom truoc huong vao thang truoc do neu ma tinh tach ra tu nhom do*/
                            select
                                data.outlet_id,
                                data.outlet_ams_id,
                                data.unit_id,
                                data.unit_ams_id,
                                data.unit_name
                            from ams.la_vietstar_temp_outlet data
                            where data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                                and data.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
                                and data.position_code = LIFE_AGENCY_VIETSTAR_2013.COMP_CODE_MMXIII_CV02--cac truong nhom khi ma nhom do duco tach ra
                        ) oldu --lay ra nhom cu ma va ten truong nhom
                            on
                            (
                                oldu.unit_ams_id = oldo.unit_ams_id
                            )
                        where oldo.unit_ams_id is null --khong tach ra tu nhom ma tach tu nhom truc tiep cua truong ban
                    ) upd
                on (--lay du lieu o thang day de cap nhat chu khong pahi la tat ca moi thang neu khong thi se sai
                    trunc(valRecordDate, 'YYYY') = umdv.record_date
                    /*and --chi xu ly doi voi cac truong nhom duoc tach ra trong nam 2013
                    --doi voi nhom cap 2  de tinh ty le cho dung
                    1 =  umdv.umnm_status */
                    and
                    upd.outlet_ams_id = umdv.outlet_ams_id
                    )
                when matched then
                    update
                        set
                            umdv.umnm_be_paid = LIFE_AGENCY_VIETSTAR_2013.BE_PAID_YES,
                            umdv.umnm_unit_ams_id = upd.umnp_unit_ams_id,
                            umdv.umnm_agency_status = 1;--tach ra tu nhom  truc tiep cua ban
                commit;
            end if;
        end loop;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'upload_modl_unit_dev', 'Xet trong vong quay lai 12 thang thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 5;

        /*cap nhat neu khong co nhom goc taach ra
        thi chung to la no duoc tanh ra tu ban
        neu khong thi se sai cau truc
        xu ly cho moi truong hop o dau */
        update ams.la_vietstar_unit_dev umnm
        set umnm.umnm_unit_ams_id = umnm.agency_ams_id
        where umnm.record_date = trunc(valRecordDate, 'YYYY')
            and umnm.umnm_be_executing = LIFE_AGENCY_VIETSTAR_2013.BE_EXECUTING_YES
            --chi xac dinh doi voi cac cai ma no duoc thang tien nhu phia tren thi moi xu ly duoc cho no
            and umnm.umnm_be_paid = LIFE_AGENCY_VIETSTAR_2013.BE_PAID_YES
            --phai la no chua duoc cap nhat nhu the nay co nhe
            and umnm.umnm_unit_ams_id is null;
       commit;

       /*Khong xu ly cho truong hop neu khong ducc PAID*/
        update ams.la_vietstar_unit_dev umnm
        set umnm.umnm_be_executing = LIFE_AGENCY_VIETSTAR_2013.BE_EXECUTING_NO
        where umnm.record_date = trunc(valRecordDate, 'YYYY')
            and umnm.umnm_be_paid = LIFE_AGENCY_VIETSTAR_2013.BE_PAID_NO;
       commit;

        /*Day la cac ty le FYP duoc CONG THEM VAO khi co nhom tach ra thanh cong
        thuc hien thong ke o day luon so lieu cho no
        cap nhat cac khoang thoi gian duoc huong tien vao
        */
        update ams.la_vietstar_unit_dev tmp
        set tmp.devu_percent = 0.7
        where tmp.record_date = trunc(valRecordDate, 'YYYY')
            and tmp.umnm_be_executing = LIFE_AGENCY_VIETSTAR_2013.BE_EXECUTING_YES
            and tmp.umnm_be_paid = LIFE_AGENCY_VIETSTAR_2013.BE_PAID_YES
            and tmp.devu_sernior_by_months <= 3;
        commit;

        update ams.la_vietstar_unit_dev tmp
        set tmp.devu_percent = 0.4
        where tmp.record_date = trunc(valRecordDate, 'YYYY')
            and tmp.umnm_be_executing = LIFE_AGENCY_VIETSTAR_2013.BE_EXECUTING_YES
            and tmp.umnm_be_paid = LIFE_AGENCY_VIETSTAR_2013.BE_PAID_YES
            and tmp.devu_sernior_by_months > 3
            and tmp.devu_sernior_by_months < 6;
        commit;

        update ams.la_vietstar_unit_dev tmp
        set tmp.devu_percent = 0.3
        where tmp.record_date = trunc(valRecordDate, 'YYYY')
            and tmp.umnm_be_executing = LIFE_AGENCY_VIETSTAR_2013.BE_EXECUTING_YES
            and tmp.umnm_be_paid = LIFE_AGENCY_VIETSTAR_2013.BE_PAID_YES
            and tmp.devu_sernior_by_months >= 6;
        commit;
    end;

     procedure upload_psvs(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          update ams.la_vietstar_outlet_2012 o
          set
              o.psvs_be_paid = ams.LIFE_AGENCY_CODE.OUTLET_PAID_YES,
              o.psvs_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES,
              o.psvs_fyp = 0,
              o.psvs_ip_coup = 0,
              o.psvs_afyp_issu = 0,
              o.psvs_afyp_info = 0,
              o.psvs_pers_rate = 0,
              o.psvs_coll_prem = 0,
              o.psvs_real_prem = 0,
              o.psvs_coll_rate_avrg = 0,
              o.update_datetime = sysdate
          where o.record_date = trunc(valRecordDate, 'YYYY')
              and o.be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES;
          commit;
          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2013', 'upload_psvs');
      end;

      procedure list_psvs_fyp(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          merge
              into ams.la_vietstar_outlet_2012 o
          using
              (
                  select
                      i.outlet_id,
                      i.index_number
                  from ams.la_outlet_index i
                  where i.record_date = trunc(valRecordDate, 'YYYY')
                      and i.type_code = 'FYP'
                      and i.request_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
              ) upd
          on (
              upd.outlet_id = o.outlet_id
              )
          when matched then
              update
              set
                  o.psvs_fyp = upd.index_number,
                  o.update_datetime = sysdate;
          commit;
          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2013', 'list_psvs_fyp');
      end;

      procedure list_psvs_fyp_ex(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          merge
              into ams.la_vietstar_outlet_2012 o
          using
              (
                  select
                      i.outlet_id,
                      i.index_number
                  from ams.la_outlet_index i
                  where i.record_date = trunc(valRecordDate, 'YYYY')
                      and i.type_code = 'FYPE'
                      and i.request_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
              ) upd
          on (
              upd.outlet_id = o.outlet_id
              )
          when matched then
              update
              set
                  o.psvs_fyp_ex = upd.index_number,
                  o.update_datetime = sysdate;
          commit;
          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2013', 'list_psvs_fyp_ex');
      end;

      --kiem tra OK
      procedure list_psvs_afyp_issu(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          merge
              into ams.la_vietstar_outlet_2012 o
          using
              (
                  select
                      i.outlet_id,
                      i.index_number
                  from ams.la_outlet_index i
                  where i.record_date = trunc(valRecordDate, 'YYYY')
                      and i.type_code = 'AFYI'
                      and i.request_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
              ) upd
          on (
              upd.outlet_id = o.outlet_id
              )
          when matched then
              update
              set
                  o.psvs_afyp_issu = upd.index_number,
                  o.update_datetime = sysdate;
          commit;
          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2013', 'list_psvs_afyp_issu');
      end;

      procedure list_psvs_afyp_info(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          merge
              into ams.la_vietstar_outlet_2012 o
          using
              (
                  select /*+ CARDINALITY(u, 100)*/
                      u.outlet_id,
                      sum(u.index_number) index_number
                  from
                  (  --chi lay so lieu la AFYE la dat yeu cau roi
                      select
                          i.outlet_id,
                          i.index_number
                      from ams.la_outlet_index i
                      where i.record_date = trunc(valRecordDate, 'YYYY')
                          and i.type_code = 'AFYE'
                          and i.request_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
                  ) u
                  group by u.outlet_id
              ) upd
          on (
              upd.outlet_id = o.outlet_id
              )
          when matched then
              update
              set
                  o.psvs_afyp_info = upd.index_number,
                  o.update_datetime = sysdate;
          commit;
          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2013', 'list_psvs_afyp_info');
      end;

      procedure list_psvs_pers_rate(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          update ams.la_vietstar_outlet_2012 o
          set
              o.psvs_afyp_info = 0,
              o.update_datetime = sysdate
          where o.record_date = trunc(valRecordDate, 'YYYY')
              and o.psvs_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
              and o.psvs_afyp_info < 0;
          commit;

          update ams.la_vietstar_outlet_2012 o
          set
              o.psvs_pers_rate = round(
                  decode(
                      nvl(o.psvs_afyp_issu, 0),
                          0, 100,
                          nvl(o.psvs_afyp_info, 0) / nvl(o.psvs_afyp_issu, 0) * 100
                  ), 2
              ),
              o.update_datetime = sysdate
          where o.record_date = trunc(valRecordDate, 'YYYY')
              and o.psvs_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES;
          commit;
          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2013', 'list_psvs_pers_rate');
      end;

      /*Tong phi phai thu tinh tong cong cho ca 11 thang
      do phan coll da luu du lieu trong 11 thang chi tiet cua tung dai ly roi nen phan nay thi khong can phai luu lai*/
      procedure list_psvs_coll_prem(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          ams.LIFE_AGENCY_VIETSTAR_2013.list_cumv_clear_temp;

          insert /*+ APPEND */ into ams.la_vietstar_index_tmp nologging
          (
              branch_id,
              index_number
          )
          select  /*+ CARDINALITY(i, 100)*/
              i.agent_id outlet_id,
              sum(nvl(i.index_value_number, 0)) index_number
          from ams.la_index i
          where i.record_date between trunc(valRecordDate, 'YYYY') and add_months(trunc(valRecordDate, 'YYYY'), 10)
              and i.index_code = 'COLL_PREM'
              and i.group_code = 'COLL'
              and i.category_code = 'INDX'
              and i.time_frequency = 'MONTHLY'
              and i.type_data = 'OUTL'
         group by i.agent_id;
          commit;

          merge
              into ams.la_vietstar_outlet_2012 o
          using
              (
                  select  /*+ CARDINALITY(tmp, 100)*/
                      tmp.branch_id outlet_id,
                      tmp.index_number
                  from ams.la_vietstar_index_tmp tmp
              ) upd
          on (
              upd.outlet_id = o.outlet_id
              )
          when matched then
              update
              set
                  o.psvs_coll_prem = upd.index_number,
                  o.update_datetime = sysdate;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2013', 'list_psvs_coll_prem');
      end;

      /*Tong phi thuc thu tinh tong cong cho ca 11 thang
      do phan coll da luu du lieu trong 11 thang chi tiet cua tung dai ly roi nen phan nay thi khong can phai luu lai*/
      procedure list_psvs_real_prem(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          ams.LIFE_AGENCY_VIETSTAR_2013.list_cumv_clear_temp;

          insert /*+ APPEND */ into ams.la_vietstar_index_tmp nologging
          (
              branch_id,
              index_number
          )
          select  /*+ CARDINALITY(i, 100)*/
              i.agent_id outlet_id,
              sum(nvl(i.index_value_number, 0)) index_number
          from ams.la_index i
          where i.record_date between trunc(valRecordDate, 'YYYY') and add_months(trunc(valRecordDate, 'YYYY'), 10)
              and i.index_code = 'REAL_PREM'
              and i.group_code = 'COLL'
              and i.category_code = 'INDX'
              and i.time_frequency = 'MONTHLY'
              and i.type_data = 'OUTL'
          group by i.agent_id;
          commit;

          merge /*+ CARDINALITY(o, 100)
                    CARDINALITY(upd, 100)
                    LEADING(o upd) */
              into ams.la_vietstar_outlet_2012 o
          using
              (
                  select  /*+ CARDINALITY(tmp, 100)*/
                      tmp.branch_id outlet_id,
                      tmp.index_number
                  from ams.la_vietstar_index_tmp tmp
              ) upd
          on (
              upd.outlet_id = o.outlet_id
              )
          when matched then
              update
              set
                  o.psvs_real_prem = upd.index_number,
                  o.update_datetime = sysdate;
          commit;


          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2013', 'list_psvs_real_prem');
      end;

      procedure list_psvs_coll_rate(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          update ams.la_vietstar_outlet_2012 o
          set
              o.psvs_coll_rate_avrg = 0,
              o.update_datetime = sysdate
          where o.record_date = trunc(valRecordDate, 'YYYY')
              and o.psvs_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
              and o.psvs_coll_prem < 0;
          commit;

          update ams.la_vietstar_outlet_2012 o
          set
              o.psvs_coll_rate_avrg = round(
                  decode(
                      nvl(o.psvs_coll_prem, 0),
                          0, 100,
                          nvl(o.psvs_real_prem, 0) / nvl(o.psvs_coll_prem, 0) * 100
                  ), 2
              ),
              o.update_datetime = sysdate
          where o.record_date = trunc(valRecordDate, 'YYYY')
              and o.psvs_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES;
          commit;
          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2013', 'list_psvs_coll_rate');
      end;

      procedure upload_umvs(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          update ams.la_vietstar_outlet_2012 o
          set
              o.umvs_be_paid = ams.LIFE_AGENCY_CODE.OUTLET_PAID_YES,
              o.umvs_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES,
              o.umvs_effective_date = ams.LIFE_AGENCY_agent.positions_date(trunc(valRecordDate, 'MM'), o.outlet_id),
              o.umvs_outlet_id = o.outlet_id,
              o.umvs_branch_id = o.unit_id,
              o.umvs_bonus_percent = null,
              o.umvs_root_fyp = 0,
              o.umvs_bonus_fyp = 0,
              o.umvs_fyp = 0,
              o.umvs_root_nagt_qty = 0,
              o.umvs_bonus_nagt_qty = 0,
              o.umvs_numb_of_nagt = 0,
              o.update_datetime = sysdate
          where o.record_date = trunc(valRecordDate, 'YYYY')
              and o.be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
              and o.position_code in (
                  ams.LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_UM,
                  ams.LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_CUM
              );
          commit;

          --xet cho mot truong ban la truong nhom truc tiep cua  nhom day
          update ams.la_vietstar_outlet_2012 o
          set
              o.umvs_be_paid = ams.LIFE_AGENCY_CODE.OUTLET_PAID_YES,
              o.umvs_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES,
              o.umvs_effective_date = ams.LIFE_AGENCY_agent.positions_date(trunc(valRecordDate, 'MM'), o.outlet_id),
              o.umvs_outlet_id = o.outlet_id,
              o.umvs_branch_id = o.agency_id,
              o.umvs_bonus_percent = null, --day la ty le vi du co bao nhieu nhom tach ra thi no dc huong 90% cua 1.5 ty
              o.umvs_root_fyp = 0,
              o.umvs_bonus_fyp = 0,
              o.umvs_fyp = 0,
              o.umvs_root_nagt_qty = 0,
              o.umvs_bonus_nagt_qty = 0,
              o.umvs_numb_of_nagt = 0,
              o.update_datetime = sysdate
          where o.record_date = trunc(valRecordDate, 'YYYY')
              and o.be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
              and o.position_code in (
                  ams.LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_AM
              );
          commit;
          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2013', 'upload_umvs');
      end;

      --da xu ly cho truong hop nghi viec trong thang van tinh xong
      --doan nay cung da xu ly cho cac truong hop truong ban dong thoi la truong nhom truc tiep
      procedure list_umvs_temp(valRecordDate date := null)
      is
      begin
          execute immediate 'truncate table  ams.la_vietstar_umvs_2012';
          commit;

          /*lay so lieu cua tung thang cho no tat ca cac dai ly cua nhom
          trong thang do */
          for i in 0..10
          loop
              ams.life_agency_log.time_stop;
              ams.life_agency_log.time_begin;
              /*Luu y o day theo dinh nghia FYP cua tung nhom thi la da tinh dung duoc FYP
              cho theo tung nhom doc lap roi nen khong can quan tam den no o day nua
              khi nao phat trien duoc nhom thi tinh dung FYP cho nhom do la duoc thoi ma
              */

              --truong nhom do con lam viec cho den cuoi thang day nhe
              --thi moi tinh cho no
              /*select *
              from ams.tmp_block_outlet o
              where o.outlet_number like 'D%'
                  and o.from_date <> o.to_date
                  and (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1) >= o.from_date
                  and (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1) < o.to_date*/

              ams.LIFE_AGENCY_VIETSTAR_2013.list_cumv_clear_temp;

              insert /*+ APPEND */ into ams.la_vietstar_index_tmp nologging
              (
                  branch_id
              )
              select /*+ CARDINALITY(v, 100)    */
                  v.outlet_id
              from ams.la_vietstar_outlet_2012 v
              where v.record_date = trunc(valRecordDate, 'YYYY')
                  and v.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
                  and v.umvs_be_paid = ams.LIFE_AGENCY_CODE.OUTLET_PAID_YES
                  and v.umvs_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES;
              commit;

              insert /*+ APPEND */ into ams.la_vietstar_umvs_2012  nologging
              (
                  outlet_id,
                  record_date,
                  version_date,
                  update_datetime,
                  outlet_number,
                  outlet_name,
                  effective_date,
                  terminative_date,
                  status_code,
                  company_id,
                  company_name,
                  office_id,
                  office_name,
                  agency_id,
                  agency_name,
                  unit_id,
                  unit_name,
                  umvs_be_paid,
                  umvs_be_executing,
                  umvs_data_date,
                  umvs_outlet_id,
                  umvs_branch_id,
                  umvs_position_code,
                  umvs_type_code,
                  umvs_fyp
              )
              select /*+ CARDINALITY(key, 100)
                    CARDINALITY(outl, 100) */
                  outl.outlet_id,
                  trunc(valRecordDate, 'YYYY'),
                  trunc(sysdate, 'DD'),
                  sysdate,
                  outl.outlet_ams_id,
                  outl.outlet_name,
                  outl.effective_date,
                  outl.terminative_date,
                  outl.status_code,
                  outl.company_id,
                  outl.company_name,
                  outl.office_id,
                  outl.office_name,
                  outl.sales_agency_id,
                  outl.agency_name,
                  outl.sales_unit_id,
                  outl.unit_name,
                  ams.LIFE_AGENCY_CODE.OUTLET_PAID_OTHER,
                  ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES,
                  add_months(trunc(valRecordDate, 'YYYY'), i),
                  outl.outlet_id,
                  --Neu chuc vu tai thang day la truong nhom thi se lam nhu the nay
                  case
                      when outl.position_code
                                  in (ams.LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_UM,
                                      ams.LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_CUM)
                               then
                          outl.sales_unit_id
                      when outl.position_code = ams.LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_AM then
                          outl.sales_agency_id
                      else
                          null
                      end umvs_branch_id,
                  outl.position_code,
                  ams.LIFE_AGENCY_VIETSTAR_2013.STATUS_ROOT, --day la cac dai ly thuoc nhom goc
                  0
              from
              (
                  select /*+ CARDINALITY(tmp, 100) */
                      tmp.branch_id outlet_id
                  from ams.la_vietstar_index_tmp  tmp
              ) key
              join
              (
                  select /*+ CARDINALITY(outl, 100)    */
                      outl.outlet_id,
                      outl.outlet_ams_id,
                      outl.outlet_name,
                      outl.position_code,
                      outl.effective_date,
                      outl.terminative_date,
                      outl.status_code,
                      outl.company_id,
                      outl.company_name,
                      outl.office_id,
                      outl.office_name,
                      outl.agency_id sales_agency_id,
                      outl.agency_name,
                      outl.unit_id sales_unit_id,
                      outl.unit_name
                  from ams.la_vietstar_temp_outlet outl
                  --no khong nhan con index o day roi nhe?
                  --can phai dung vong for va phan tich tiep index o day di nhe
                  where outl.record_date = add_months(trunc(valRecordDate, 'YYYY'), i)
                      and outl.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
              ) outl
                  on outl.outlet_id = key.outlet_id;
              commit;


              ams.life_agency_log.time_end;
              ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2013', 'list_umvs_temp 1:' || to_char(i));
              ams.life_agency_log.time_stop;
              ams.life_agency_log.time_begin;

              /*xoa di cac dai ly ma khong co ma phong ban nhom di
                Tuc la vao thang day thi no van la dai ly thi no khong the co so lieu ve cac dai ly thuoc nhom do duo
              */
              delete ams.la_vietstar_umvs_2012  o
              where o.record_date = trunc(valRecordDate, 'YYYY')
                  and o.umvs_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                  and o.outlet_id = o.umvs_outlet_id
                  and o.umvs_data_date = add_months(trunc(valRecordDate, 'YYYY'), i)
                  and o.umvs_branch_id is null;
              commit;

              /*do them vao ca danh sach cac dai ly thuoc nhom do vao de xu ly cho no*/
              /*Luu y o day theo dinh nghia FYP cua tung nhom thi la da tinh dung duoc FYP
              cho theo tung nhom doc lap roi nen khong can quan tam den no o day nua
              khi nao phat trien duoc nhom thi tinh dung FYP cho nhom do la duoc thoi ma
              */

              ams.LIFE_AGENCY_VIETSTAR_2013.list_cumv_clear_temp;
              /*Lay danh sach cac truong nhom do ra*/
              insert /*+ APPEND */ into ams.la_vietstar_index_tmp nologging
              (
                  branch_id,
                  branch_ams_id,
                  index_number
              )
              select /*+ CARDINALITY(tmp, 100) */
                  tmp.outlet_id,
                  tmp.umvs_position_code,
                  tmp.umvs_branch_id
              from ams.la_vietstar_umvs_2012  tmp
              where tmp.record_date = trunc(valRecordDate, 'YYYY')
                  and tmp.umvs_data_date = add_months(trunc(valRecordDate, 'YYYY'), i)
                  and tmp.outlet_id = tmp.umvs_outlet_id;
              commit;

              insert /*+ APPEND */ into ams.la_vietstar_umvs_2012  nologging
              (
                  outlet_id,
                  record_date,
                  version_date,
                  update_datetime,
                  outlet_number,
                  outlet_name,
                  effective_date,
                  terminative_date,
                  status_code,
                  company_id,
                  company_name,
                  office_id,
                  office_name,
                  agency_id,
                  agency_name,
                  unit_id,
                  unit_name,
                  umvs_be_paid,
                  umvs_be_executing,
                  umvs_data_date,
                  umvs_outlet_id,
                  umvs_branch_id,
                  umvs_position_code,
                  umvs_type_code,
                  umvs_fyp
              )
              select /*+ CARDINALITY(key, 100)
                        CARDINALITY(outl, 100) */
                  outl.outlet_id,
                  trunc(valRecordDate, 'YYYY'),
                  trunc(sysdate, 'DD'),
                  sysdate,
                  outl.outlet_ams_id,
                  outl.outlet_name,
                  outl.effective_date,
                  outl.terminative_date,
                  outl.status_code,
                  outl.company_id,
                  outl.company_name,
                  outl.office_id,
                  outl.office_name,
                  outl.sales_agency_id,
                  outl.agency_name,
                  outl.sales_unit_id,
                  outl.unit_name,
                  ams.LIFE_AGENCY_CODE.OUTLET_PAID_OTHER,
                  ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES,
                  add_months(trunc(valRecordDate, 'YYYY'), i),
                  key.umvs_outlet_id umvs_outlet_id,
                  key.umvs_branch_id umvs_branch_id,
                  key.umvs_position_code,
                  ams.LIFE_AGENCY_VIETSTAR_2013.STATUS_ROOT, --day la cac dai ly thuoc nhom goc
                 0
              from
              (
                  select /*+ CARDINALITY(tmp, 100) */
                      tmp.branch_id outlet_id,
                      tmp.branch_id umvs_outlet_id,
                      tmp.branch_ams_id umvs_position_code,
                      tmp.index_number umvs_branch_id
                  from ams.la_vietstar_index_tmp  tmp
              ) key
              join
              (   --can phai lay ca dai ly da nghi viec ca trong thang nua vao day
                   --nhau vay khi do vao bang ams.la_vietstar_temp_outlet  da co ca dai ly da nghi viec trong thang la on roi nhe
                  select  /*+ CARDINALITY(outl, 100)    */
                      outl.outlet_id,
                      outl.outlet_ams_id,
                      outl.outlet_name,
                      outl.effective_date,
                      outl.terminative_date,
                      outl.status_code,
                      outl.company_id,
                      outl.company_name,
                      outl.office_id,
                      outl.office_name,
                      outl.agency_id sales_agency_id,
                      outl.agency_name,
                      outl.unit_id sales_unit_id,
                      outl.unit_name
                  from ams.la_vietstar_temp_outlet outl
                  where outl.record_date = add_months(trunc(valRecordDate, 'YYYY'), i)
                      and outl.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
                      --cho nay can lay trong 1 thang day thoi nhe the la du roi
                      --dai ly lam viec va nghi viec trong thang day dung tinh ca thang truoc vi nhu the la thua mat
                      --CHO NAY CHI CAN LAY  TRONG BANG SER_OUTLET_DATA
                      --la du roi trong 1 thang vi co du ca dai ly co mat trong thang day nhe
                      --khong can bang nay dau vi chay theo tung thang ma
              ) outl
                  on
                  (
                      (
                          (--lay cho ca truong ban la truong nhom truc tiep vao day de xu ly cho nhom do
                              outl.sales_agency_id = key.umvs_branch_id
                              and
                              outl.sales_unit_id is null
                          )
                          or --lay cho truong nhom cho no
                          outl.sales_unit_id = key.umvs_branch_id
                      )
                      and outl.outlet_id <> key.umvs_outlet_id
                  );
              commit;
              ams.life_agency_log.time_end;
              ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2013', 'list_umvs_temp 3:' || to_char(i));
          end loop;

          /*
          Update by: Le Khac Chinh Ban PTUD
          Version: 1.7.5.121220
          Note:  Fix lai chuong trinh theo yeu cau: #94667 cua phong PTDL
                    Them vao bang la_vietstar_umvs_2012  du lieu thang 12 nam 2013 danh sach dai ly cua cac nhom
                    De tu do co the tinh them FYP KTM trong thoi gian tu 1/12/2013 den 12/12/2013 cho chinh xac
          */
          insert /*+ APPEND */ into ams.la_vietstar_umvs_2012 nologging(
              outlet_id,
              record_date,
              version_date,
              update_datetime,
              outlet_number,
              outlet_name,
              effective_date,
              terminative_date,
              status_code,
              company_id,
              company_name,
              office_id,
              office_name,
              agency_id,
              agency_name,
              unit_id,
              unit_name,
              umvs_be_paid,
              umvs_be_executing,
              umvs_data_date,
              umvs_outlet_id,
              umvs_branch_id,
              umvs_position_code,
              umvs_type_code,
              umvs_fyp
          )
          select /*+  CARDINALITY(outl, 100) */
              outl.outlet_id,
              trunc(valRecordDate, 'YYYY'),
              trunc(sysdate, 'DD'),
              sysdate,
              outl.outlet_number,
              outl.outlet_name,
              outl.effective_date,
              outl.terminative_date,
              outl.status_code,
              outl.company_id,
              outl.company_name,
              outl.office_id,
              outl.office_name,
              outl.agency_id,
              outl.agency_name,
              outl.unit_id,
              outl.unit_name,
              ams.LIFE_AGENCY_CODE.OUTLET_PAID_OTHER,
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES,
              add_months(trunc(valRecordDate, 'YYYY'), 11), --data_date la thang 12
              outl.umvs_outlet_id,
              outl.umvs_branch_id,
              outl.umvs_position_code,
              outl.umvs_type_code,
              0
          from ams.la_vietstar_umvs_2012 outl
          where outl.record_date = trunc(valRecordDate, 'YYYY')
              and outl.umvs_data_date = add_months(trunc(valRecordDate, 'YYYY'), 10); --lay du lieu cua thang 11 boi vi chi lay danh sach cac dai ly cua thang 11 nam 2013 co hop dong PH tu 1/12 den 12/12
          commit;
          dbms_stats.gather_table_stats(null, 'la_vietstar_umvs_2012', cascade => true);


          execute immediate 'truncate table ams.la_vietstar_umvs_empl_2012';
          commit;

          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          insert /*+ APPEND */ into ams.la_vietstar_umvs_empl_2012 nologging
          select
              outl.outlet_id,
              trunc(valRecordDate, 'YYYY'),
              trunc(sysdate, 'DD'),
              sysdate,
              outl.outlet_ams_id,
              outl.outlet_name,
              outl.company_id,
              outl.company_name,
              outl.office_id,
              outl.office_name,
              outl.sales_agency_id,
              outl.agency_name,
              outl.sales_unit_id,
              outl.unit_name,
              outl.effective_date,--ngay bat dau lam viec
              ams.LIFE_AGENCY_CODE.OUTLET_PAID_YES,
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES,
              trunc(outl.effective_date, 'MM'),
              null,
              0,
              0,
              0
          from
              --dai ly nay con phai duy tri hop dong dai ly voi cong ty cho den ngay 30/11/2013
              --thi moi tinh duoc cho no
              --con neu khong thi khong duoc tinh tuc la tinh den cuoi thang thi no phai con lam viec cho no
              --xu ly cho no o doan nay luon roi day nhe ecordDate, 'MM'), 1) - 1) < o.to_date*/

               --khong lay dai ly da nghi viec vao day
               --su dung dieu kien nay de lay so lieu nhanh va chay nhanh hon
          (
              select
                  outl.outlet_id
              from ams.la_vietstar_temp_outlet outl
              where outl.record_date = trunc(valRecordDate, 'MM')
                  and outl.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
                  and outl.terminative_date is null
              minus
              /*tru di cac dai ly nghi viec vao thang 12 tuc phai con lam den 31/12/2013*/
              select
                  outl.outlet_id
              from ams.la_vietstar_temp_outlet outl
              where outl.record_date = add_months(trunc(valRecordDate, 'YYYY'), 11)
                  and outl.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
                  and outl.terminative_date is not null
         ) key
         join
         (
            select
                tmp.outlet_id,
                tmp.outlet_ams_id,
                tmp.outlet_name,
                tmp.effective_date,
                tmp.terminative_date,
                tmp.company_id,
                tmp.company_ams_id,
                tmp.company_name,
                tmp.office_id,
                tmp.office_ams_id,
                tmp.office_name,
                tmp.agency_id sales_agency_id,
                tmp.agency_ams_id,
                tmp.agency_name,
                tmp.unit_id sales_unit_id,
                tmp.unit_ams_id,
                tmp.unit_name
            from ams.la_vietstar_temp_outlet tmp
            where tmp.record_date = trunc(valRecordDate, 'MM')
                and tmp.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
                and tmp.terminative_date is null
                  --CHO NAY CAN PHAI THEM DIEU KIEN LA CON LAM VIEC DEN NGAY 31/12/2013
                  --THI MOI DUNG DUOC DAY NHE!!!!!KHONG LA LAI BI THIEU VA SAI DAY NHE!!!<<<<<<<<<<
                  --CAN PHAI XU LY THEM CHO NO O DAY
          ) outl
              on key.outlet_id = outl.outlet_id;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2013', 'list_umvs_temp 5');
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;
          --cho nay da dung cau lenh phia tren roi nen cho nay dung se bi cham di
  /*        merge
              into ams.la_vietstar_umvs_empl_2012 o
          using
              (
                  select lha.agent_id outlet_id,
                      to_date(lha.history_value, 'MON DD YYYY HH:MIAM') begin_working_date
                  from la_history_agent lha
                  where lha.type_code = 'AGSD'
                      and (add_months(trunc(valRecordDate, 'MM'), 1) - 1) >= lha.from_date
                      and (add_months(trunc(valRecordDate, 'MM'), 1) - 1) < nvl(lha.to_date, '1-jan-2099')
               ) upd
          on (
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.umvs_be_executing
              and
              upd.outlet_id = o.outlet_id
              )
          when matched then
              update
              set
                  o.begin_working_date = upd.begin_working_date,
                  \*CUC CHU Y O CHO NAY
                  umvs_data_date = trunc(upd.begin_working_date, 'MM')
                  tuc la lam tron thang cua thang ma dai ly do lam viec*\
                  o.umvs_data_date = trunc(upd.begin_working_date, 'MM'),
                  o.update_datetime = sysdate;
          commit;*/

          --xoa 2 truong hop nay
          delete ams.la_vietstar_umvs_empl_2012 o
          where o.record_date = trunc(valRecordDate, 'YYYY')
               and o.umvs_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
               and o.begin_working_date is null;
          commit;

          delete ams.la_vietstar_umvs_empl_2012 o
          where o.record_date = trunc(valRecordDate, 'YYYY')
               and o.umvs_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
               and o.begin_working_date < trunc(valRecordDate, 'YYYY');
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2013', 'list_umvs_temp 6');
      end;

      /*Luu y o day theo dinh nghia FYP cua tung nhom thi la da tinh dung duoc FYP
      cho theo tung nhom doc lap roi nen khong can quan tam den no o day nua
      khi nao phat trien duoc nhom thi tinh dung FYP cho nhom do la duoc thoi ma
      */
      procedure list_umvs_fyp(valRecordDate date := null)
      is
          v_percent number(5,2) := 1; /*ty le duoc huong*/
          v_count number(10) := 0;
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;
          /*
          Update by: Le Khac Chinh Ban PTUD
          Version: 1.7.5.121221
          Note:  Fix lai chuong trinh theo yeu cau: #94667 cua phong PTDL
                    Can phai gather lai de chay cho nhanh hon
          */
          dbms_stats.gather_table_stats(null, 'la_vietstar_umvs_2012', cascade => true);
          dbms_stats.gather_table_stats(null, 'la_vietstar_trans_2012', cascade => true);

          /*lay so lieu voi dieu kien :and tmp.transaction_date >= trunc(valRecordDate, 'MM')*/
          merge
              into ams.la_vietstar_umvs_2012  o
          using
              (
                  select
                      tmp.outlet_id,
                      trunc(tmp.transaction_date, 'MM') umvs_data_date,
                      sum(nvl(tmp.transaction_fyp, 0)) index_number
                  from ams.la_vietstar_trans_2012 tmp
                  where tmp.record_date = trunc(valRecordDate, 'YYYY')
                    --cho nay la ngay thang no < de tinh cho thang do va vao ngay nho hon de tinh cho no de
                    --duoi kia la >= thang do de co the tinh cho no de hon
                      and tmp.transaction_date < trunc(valRecordDate, 'MM')
                  group by tmp.outlet_id,
                      trunc(tmp.transaction_date, 'MM')
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.umvs_be_executing
              and
              upd.umvs_data_date = o.umvs_data_date
              and
              upd.outlet_id = o.outlet_id
              )
          when matched then
              update
              set
                  o.umvs_fyp = upd.index_number,
                  o.update_datetime = sysdate;
          commit;

          /*lay so lieu voi dieu kien :and tmp.transaction_date >= trunc(valRecordDate, 'MM')*/
          merge
              into ams.la_vietstar_umvs_2012  o
          using
              (
                  select
                      tmp.outlet_id,
                      trunc(valRecordDate, 'MM') umvs_data_date,
                      sum(nvl(tmp.transaction_fyp, 0)) index_number
                  from ams.la_vietstar_trans_2012 tmp
                  where tmp.record_date = trunc(valRecordDate, 'YYYY')
                      --voi dieu kien nay thi se de dang hon doi voi no
                      and tmp.transaction_date >= trunc(valRecordDate, 'MM')
                  group by tmp.outlet_id
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.umvs_be_executing
              and
              upd.umvs_data_date = o.umvs_data_date
              and
              upd.outlet_id = o.outlet_id
              )
          when matched then
              update
              set
                  o.umvs_fyp = upd.index_number,
                  o.update_datetime = sysdate;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2013', 'list_umvs_fyp 2 ');
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          --lay vao FYP cua nhom goc vao chi thuc hien tinh o nhom goc cho no roi se tinh tat ca toan bo
          /*Tong hop so lieu FYP vao trong bang chinh*/
          merge
              /*+
              CARDINALITY(o, 100)
              CARDINALITY(upd, 100)
              LEADING(o upd)
              */
              into ams.la_vietstar_outlet_2012 o
          using
              (
                  select /*+ CARDINALITY(tmp, 100) */
                      tmp.umvs_outlet_id outlet_id,
                      sum(nvl(tmp.umvs_fyp, 0)) index_number
                  from ams.la_vietstar_umvs_2012  tmp
                  where tmp.record_date = trunc(valRecordDate, 'YYYY')
                      and tmp.umvs_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                      and tmp.umvs_be_paid = ams.LIFE_AGENCY_CODE.OUTLET_PAID_OTHER
                      --o day phai la dai ly o nhom goc thi moi duoc tinh cho no
                      and tmp.umvs_type_code = ams.LIFE_AGENCY_VIETSTAR_2013.STATUS_ROOT
                      and tmp.outlet_id <> tmp.umvs_outlet_id
                  group by tmp.umvs_outlet_id
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE = o.type_code
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.umvs_be_executing
              and
              upd.outlet_id = o.outlet_id
              )
          when matched then
              update
              set
                  o.umvs_root_fyp = upd.index_number,
                  o.update_datetime = sysdate;
          commit;


          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2013', 'list_umvs_fyp 3');
      end;

      /*xay dung chi tieu ty le duy tri 36 thang cua nhom tai thoi diem cuoi thang
      de tinh chi tieu duy tri 36 thang cho no*/
      procedure list_umvs_pr36(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          execute immediate 'truncate table ams.la_vietstar_umvs_pr36';
          commit;
          /*do truoc vao danh sach cac truong nhom vao truoc da
          chay nhu the nay de cho no nhanh hon nhe
          chi  lay cac dai ly ma con lam viec den cuoi thang
          theo dinh nghia da duoc confirm phia anh Hai*/

          ams.LIFE_AGENCY_VIETSTAR_2013.list_cumv_clear_temp;

          insert /*+ APPEND */ into ams.la_vietstar_index_tmp nologging
          (
              branch_id
          )
          select /*+ CARDINALITY(v, 100)    */
              v.outlet_id
          from ams.la_vietstar_outlet_2012 v
          where v.record_date = trunc(valRecordDate, 'YYYY')
              and v.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
              and v.umvs_be_paid = ams.LIFE_AGENCY_CODE.OUTLET_PAID_YES
              and v.umvs_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES;
          commit;

          insert /*+ APPEND */ into ams.la_vietstar_umvs_pr36  nologging
          (
              outlet_id,
              outlet_ams_id,
              record_date,
              version_date,
              update_datetime,
              outlet_number,
              outlet_name,
              company_id,
              company_name,
              office_id,
              office_name,
              agency_id,
              agency_name,
              unit_id,
              unit_name,
              umvs_be_paid,
              umvs_be_executing,
              umvs_data_date,
              umvs_outlet_id,
              umvs_branch_id,
              umvs_afis,
              umvs_afif
          )
          select/*+ CARDINALITY(key, 100)  CARDINALITY(outl, 100) */
              outl.outlet_id,
              outl.outlet_ams_id,
              trunc(valRecordDate, 'YYYY'),
              trunc(sysdate, 'DD'),
              sysdate,
              outl.outlet_ams_id,
              outl.outlet_name,
              outl.company_id,
              outl.company_name,
              outl.office_id,
              outl.office_name,
              outl.sales_agency_id,
              outl.agency_name,
              outl.sales_unit_id,
              outl.unit_name,
              ams.LIFE_AGENCY_CODE.OUTLET_PAID_OTHER,
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES,
              trunc(valRecordDate, 'MM'),
              outl.outlet_id,
              /*den thoi diem cuoi thang do thi la o trong nhom nao*/
              case
                  when outl.position_code
                              in (ams.LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_UM,
                                  ams.LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_CUM)
                           then
                      outl.sales_unit_id
                  when outl.position_code = ams.LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_AM then
                      outl.sales_agency_id
                  else
                      null
                  end umvs_branch_id,
              0,
              0
          from
          (
              select /*+ CARDINALITY(tmp, 100) */
                  tmp.branch_id outlet_id
              from ams.la_vietstar_index_tmp  tmp
          ) key
          join
          (
              select /*+ CARDINALITY(outl, 100) */
                  outl.outlet_id,
                  outl.outlet_ams_id,
                  outl.outlet_name,
                  outl.position_code,
                  outl.company_id,
                  outl.company_name,
                  outl.office_id,
                  outl.office_name,
                  outl.agency_id sales_agency_id,
                  outl.agency_name,
                  outl.unit_id sales_unit_id,
                  outl.unit_name
              from ams.la_vietstar_temp_outlet outl
              where outl.record_date = trunc(valRecordDate, 'MM')
                  and outl.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
          ) outl
             on outl.outlet_id = key.outlet_id;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2013', 'list_umvs_pr36');
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

           /*xoa di cac dai ly ma khong co ma phong ban nhom di*/
          delete ams.la_vietstar_umvs_pr36 o
          where o.record_date = trunc(valRecordDate, 'YYYY')
              and o.umvs_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
              and o.outlet_id = o.umvs_outlet_id
              and o.umvs_data_date = trunc(valRecordDate, 'MM')
              and o.umvs_branch_id is null;
          commit;

          ams.LIFE_AGENCY_VIETSTAR_2013.list_cumv_clear_temp;

          insert /*+ APPEND */ into ams.la_vietstar_index_tmp nologging
          (
              branch_id,
              index_number
          )
          select /*+ CARDINALITY(tmp, 100) */
              tmp.outlet_id,
              tmp.umvs_branch_id
          from ams.la_vietstar_umvs_pr36  tmp
          where tmp.record_date = trunc(valRecordDate, 'YYYY');
          commit;

          /*do them vao ca danh sach cac dai ly thuoc nhom do vao de xu ly cho no*/
          insert /*+ APPEND */ into ams.la_vietstar_umvs_pr36 nologging
          select
              outl.outlet_id,
              outl.outlet_ams_id,
              trunc(valRecordDate, 'YYYY'),
              trunc(sysdate, 'DD'),
              sysdate,
              outl.outlet_ams_id,
              outl.outlet_name,
              outl.company_id,
              outl.company_name,
              outl.office_id,
              outl.office_name,
              outl.sales_agency_id,
              outl.agency_name,
              outl.sales_unit_id,
              outl.unit_name,
              ams.LIFE_AGENCY_CODE.OUTLET_PAID_OTHER,
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES,
              trunc(valRecordDate, 'MM'),
              key.umvs_outlet_id umvs_outlet_id,
              key.umvs_branch_id umvs_branch_id,
              0,
              0
          from
          (
              select /*+ CARDINALITY(tmp, 100) */
                  tmp.branch_id outlet_id,
                  tmp.branch_id umvs_outlet_id,
                  tmp.index_number umvs_branch_id
              from ams.la_vietstar_index_tmp  tmp
          ) key
          join
          (    --dung cau lenh nay de chay cho nhanh
               select
                  outl.outlet_id,
                  outl.outlet_ams_id,
                  outl.outlet_name,
                  outl.effective_date,
                  outl.terminative_date,
                  outl.company_id,
                  outl.company_ams_id,
                  outl.company_name,
                  outl.office_id,
                  outl.office_ams_id,
                  outl.office_name,
                  outl.agency_id sales_agency_id,
                  outl.agency_ams_id,
                  outl.agency_name,
                  outl.unit_id sales_unit_id,
                  outl.unit_ams_id,
                  outl.unit_name
              --dung bang nay thay cho bang serv_data_outlet qua nang roi
              from ams.la_vietstar_temp_outlet outl
              where outl.record_date = trunc(valRecordDate, 'MM')
                  and outl.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
                  and outl.terminative_date is null
          ) outl
              on
              (
                  (
                      (
                          outl.sales_agency_id = key.umvs_branch_id
                          and
                          outl.sales_unit_id is null
                      )
                      or
                      outl.sales_unit_id = key.umvs_branch_id
                  )
                  and outl.outlet_id <> key.umvs_outlet_id
              );
          commit;

          /*chi can nhu the la du duoc danh sach va khong can them cac dai ly ma do nhom do da phat trien
          do chi tinh den thoi diem vao cuoi thang do thoi*/
          --sau do se lay so lieu ve AFIS va AFIF 36 thang cua no vao day

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2013', 'list_umvs_pr36 2');
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          /*AFIS: AFYP phat hanh trong PR36*/
          merge  /*+ CARDINALITY(o, 100)
                    CARDINALITY(upd, 100)
                    LEADING(o upd) */
              into ams.la_vietstar_umvs_pr36 o
          using
              (
                  select /*+ CARDINALITY(i, 100) */
                      i.outlet_id,
                      i.index_number umvs_afis
                  from ams.la_outlet_index i
                  where i.record_date = trunc(valRecordDate, 'YYYY')
                      and i.type_code = 'AFYI_PR36'
                      and i.request_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.umvs_be_executing
              and
              trunc(valRecordDate, 'MM') = o.umvs_data_date
              and
              upd.outlet_id = o.outlet_id
              )
          when matched then
              update
              set
                  o.umvs_afis = upd.umvs_afis,
                  o.update_datetime = sysdate;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2013', 'list_umvs_pr36 3');
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          /*AFIF: AFYP Duy tri trong PR36*/
          merge  /*+ CARDINALITY(o, 100)
                    CARDINALITY(upd, 100)
                    LEADING(o upd) */
              into ams.la_vietstar_umvs_pr36 o
          using
              (
                  select /*+ CARDINALITY(i, 100) */
                      i.outlet_id,
                      i.index_number umvs_afif
                  from ams.la_outlet_index i
                  where i.record_date = trunc(valRecordDate, 'YYYY')
                      and i.type_code = 'AFYE_PR36'
                      and i.request_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.umvs_be_executing
              and
              trunc(valRecordDate, 'MM') = o.umvs_data_date
              and
              upd.outlet_id = o.outlet_id
              )
          when matched then
              update
              set
                  o.umvs_afif = upd.umvs_afif,
                  o.update_datetime = sysdate;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2013', 'list_umvs_pr36 4');
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          /*tinh tong AFIS va AFIF vao trong bang chinh*/
          merge  /*+ CARDINALITY(o, 100)
                    CARDINALITY(upd, 100)
                    LEADING(o upd) */
              into ams.la_vietstar_outlet_2012 o
          using
              (
                  select /*+ CARDINALITY(tmp, 100) */
                      tmp.umvs_outlet_id outlet_id,
                      sum(nvl(tmp.umvs_afis, 0)) umvs_afis,
                      sum(nvl(tmp.umvs_afif, 0)) umvs_afif
                  from ams.la_vietstar_umvs_pr36 tmp
                  where tmp.record_date = trunc(valRecordDate, 'YYYY')
                      and tmp.umvs_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                      and tmp.umvs_be_paid = ams.LIFE_AGENCY_CODE.OUTLET_PAID_OTHER
                      --tinh ca cua truong nhom vao day cho no
                  group by tmp.umvs_outlet_id
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE = o.type_code
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.umvs_be_executing
              and
              upd.outlet_id = o.outlet_id
              )
          when matched then
              update
              set
                  o.umvs_afis = upd.umvs_afis,
                  o.umvs_afif = upd.umvs_afif,
                  o.update_datetime = sysdate;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2013', 'list_umvs_pr36 5');
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          /*tong hop lai so lieu cho no*/
          update ams.la_vietstar_outlet_2012 o
          set
              o.umvs_pr36 = decode(
                  nvl(o.umvs_afis, 0), 0, 100,
                  (nvl(o.umvs_afif, 0) / nvl(o.umvs_afis, 0) * 100)),
              o.update_datetime = sysdate
          where o.record_date = trunc(valRecordDate, 'YYYY')
              and o.umvs_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2013', 'list_umvs_pr36 6');
      end;

      --cap nhat dai ly da tuyen dung cho dai ly do
      procedure list_umvs_empl(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          merge
              into ams.la_vietstar_umvs_empl_2012 o
          using
              (
                  select /*+ CARDINALITY(lha, 100)*/
                      lha.agent_id outlet_id,
                      lha.history_number empl_id
                  from la_history_agent lha
                  where lha.type_code = 'DLTD'
                      and lha.current_is = 'Y'
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.umvs_be_executing
              and
              upd.outlet_id = o.outlet_id
              )
          when matched then
              update
              set
                  o.umvs_empl_id = upd.empl_id,
                  o.update_datetime = sysdate;
          commit;
          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2013', 'list_umvs_emp');
      end;

      /*Cai nay khi do so lieu vao bang ams.la_vietstar_umvs
      thi khong tinh theo thang cuoi cung de tinh ma tinh luon vao thang nao ma dai ly do bat dau vao lam viec*/
      procedure list_umvs_ip_60days(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          merge
              into ams.la_vietstar_umvs_empl_2012 o
          using
              (
                  select /*+
                             CARDINALITY(outl, 100)
                             CARDINALITY(tran, 100)
                             */
                      outl.outlet_id,
                      sum(nvl(tran.transaction_fyp, 0)) index_number
                  from
                  (
                      select /*+ CARDINALITY(tmp, 100)*/
                          tmp.outlet_id,
                          (tmp.begin_working_date) begin_date,
                          (add_months(tmp.begin_working_date, 3) - 1) end_date
                      from ams.la_vietstar_umvs_empl_2012 tmp
                      where tmp.record_date = trunc(valRecordDate, 'YYYY')
                          and tmp.umvs_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                  ) outl
                  /*cho nay can lam la IP trong 60 ngay lam viec dau tien cua no
                  xet ngay hieu luc cho no
                  can kiem tra xem cho nay chay co lau khong?*/
                  join
                  (
                      select  /*+ CARDINALITY(tmp, 100)*/
                          tmp.outlet_id,
                          tmp.transaction_date,
                          tmp.transaction_fyp
                      from ams.la_vietstar_trans_ip tmp
                  ) tran
                      on
                      (
                          tran.outlet_id = outl.outlet_id
                          and
                          tran.transaction_date between outl.begin_date and outl.end_date
                      )
                  group by outl.outlet_id
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.umvs_be_executing
              and
              upd.outlet_id = o.outlet_id
              )
          when matched then
              update
              set
                  o.umvs_ip_60_days = upd.index_number,
                  o.update_datetime = sysdate;
          commit;
          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2013', 'list_umvs_ip_60days');
      end;

      /*Dem so luong dai ly dat tieu chuan la dai ly moi*/
      procedure list_umvs_numb_of_nagt(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;
          /*Neu dat dai ly moi thi cho = 1*/
          /*IP lon hon 8 tr thi moi duoc tinh*/
          update ams.la_vietstar_umvs_empl_2012 v
          set
              v.umvs_numb_of_nagt = 1,
              v.update_datetime = sysdate
          where v.record_date = trunc(valRecordDate, 'YYYY')
              and v.umvs_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
              and v.umvs_be_paid = ams.LIFE_AGENCY_CODE.OUTLET_PAID_YES
              and nvl(v.umvs_ip_60_days, 0) >= 8000000;
          commit;

          --cho nay lay cac so lieu tuyen  tinh theo tung thang cua cac  cai ly
    /*    and --tinh cho theo tung thang cho no
          outl.umvs_data_date = empl.umvs_data_date*/
          merge
              into ams.la_vietstar_outlet_2012 o
          using
              (  --dem tong cong theo ma dai ly la truong nhom cho no
                 --nhu vay voi dieu kien nay thi se ra duoc tong cong cac dai ly trong nam
                  select /*+
                             CARDINALITY(empl, 100)
                             CARDINALITY(outl, 100)
                             */
                      empl.umvs_outlet_id,
                      sum(nvl(outl.umvs_numb_of_nagt, 0)) index_number
                  from
                  (--chi can join voi so lieu cua thang duoi day
                    --va do nhom do tuyen dung vao la duoc roi
                      /*Lay ra danh sach cac dai ly dat la dai ly moi vao day*/
                      select /*+ CARDINALITY(v, 100)*/
                          v.umvs_empl_id,
                          v.outlet_id,
                          v.umvs_data_date,
                          v.umvs_numb_of_nagt
                      from ams.la_vietstar_umvs_empl_2012 v
                      where v.record_date = trunc(valRecordDate, 'YYYY')
                          and v.umvs_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                          and v.umvs_be_paid = ams.LIFE_AGENCY_CODE.OUTLET_PAID_YES
                          and v.umvs_numb_of_nagt = 1
                  ) outl
                  join
                  (   --do trong bang ams.la_vietstar_umvs_2012  chi chua du lieu cua cac
                       --dai ly cua nhom hien tai tuc la KHONG CHUA DU LIEU CUA NHOM DA PHAT TRIEN LEN
                       --chua du lieu cua tat ca cac dai ly CUA NHOM
                       --trong tung thang mot o day
                       --chi tiet
                      /*Lay ra danh sach cac truong nhom va cac ca nhan thuoc nhom do vao day*/
                      select /*+ CARDINALITY(v, 100)*/
                          v.outlet_id, --cho nay la tinh cho toan nhom tuyen duoc
                          v.umvs_data_date,
                          v.umvs_outlet_id
                      from ams.la_vietstar_umvs_2012  v
                      where v.record_date = trunc(valRecordDate, 'YYYY')
                          and v.umvs_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                          and v.umvs_be_paid = ams.LIFE_AGENCY_CODE.OUTLET_PAID_OTHER
                  ) empl
                      on
                      (/*Join theo dieu kien la duoc dai ly thuoc nhom do tuyen vao day
                          phai nhu the nay thi moi la dung duoc co nhe*/
                          outl.umvs_empl_id = empl.outlet_id
                          and
                          --tinh cho theo tung thang cho no la tuyen duoc bao nhieu nguoi
                          /*Tong hop so lieu theo tung thang de biet tuyen duoc bao nhieu nguoi*/
                          --empl.umvs_data_date chinh la ngay thang ma dai ly do vao lam viec lam chan thang cho no
                          /*CUC CHU Y O CHO NAY
                          umvs_data_date = trunc(upd.begin_working_date, 'MM')
                          tuc la lam tron thang cua thang ma dai ly do lam viec
                          o.umvs_data_date = trunc(upd.begin_working_date, 'MM'),
                          chinh bang thang umvs_data_date cua bang ams.la_vietstar_umvs
                          cho nay lay so lieu vao theo dieu kien cua thang do
                          */
                          outl.umvs_data_date = empl.umvs_data_date
                      )
                  group by empl.umvs_outlet_id
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE = o.type_code
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.umvs_be_executing
              and /*lay so lieu ra theo truong nhom la duoc*/
              upd.umvs_outlet_id = o.outlet_id
              )
          when matched then
              update
              set
                  o.umvs_root_nagt_qty = upd.index_number,
                  o.update_datetime = sysdate;
          commit;
          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2013', 'list_umvs_numb_of_nagt');
      end;

      /*thuc hien lay so lieu ve IP KTM cua cac dai ly moi duoc tuyen*/
      /*thu tuc nay da kiem tra lai va da OK 21/6/2013*/
      procedure list_umvs_ip(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;
          --doan code nay thuc hien lay tong IP cua cac dai ly khai thac moi vao day
          --da xac dinh duoc dung cho no
          --cho nay la no lay TONG IP cua no va cho vao bang nay
          merge
              into ams.la_vietstar_umvs_empl_2012 o
          using
              (
                  select /*+
                             CARDINALITY(outl, 100)
                             CARDINALITY(tran, 100)
                             */
                      outl.outlet_id,
                      sum(nvl(tran.transaction_fyp, 0)) index_number
                  from
                  (
                      select /*+ CARDINALITY(tmp, 100)*/
                          tmp.outlet_id
                      from ams.la_vietstar_umvs_empl_2012 tmp
                      where tmp.record_date = trunc(valRecordDate, 'YYYY')
                          and tmp.umvs_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                  ) outl
                  /*cho nay can lam la IP trong 60 ngay lam viec dau tien cua no
                  xet ngay hieu luc cho no
                  can kiem tra xem cho nay chay co lau khong?*/
                  join
                  (
                      select  /*+ CARDINALITY(tmp, 100)*/
                          tmp.outlet_id,
                          tmp.transaction_date,
                          tmp.transaction_fyp
                      from ams.la_vietstar_trans_ip tmp
                  ) tran
                      on
                      (
                          tran.outlet_id = outl.outlet_id
                      )
                  group by outl.outlet_id
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.umvs_be_executing
              and
              upd.outlet_id = o.outlet_id
              )
          when matched then
              update
              set/*thuc hien lay so lieu ve IP KTM cua cac dai ly moi duoc tuyen*/
                  o.umvs_ip = upd.index_number,
                  o.update_datetime = sysdate;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2013', 'list_umvs_ip');
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;


          --cho nay lay cac so lieu tuyen  tinh theo tung thang cua cac  cai ly
    /*    and --tinh cho theo tung thang cho no
          outl.umvs_data_date = empl.umvs_data_date*/
          merge/*+ CARDINALITY(o, 100)
                    CARDINALITY(upd, 100)
                    LEADING(o upd) */
              into ams.la_vietstar_outlet_2012 o
          using
              (  --dem tong cong theo ma dai ly la truong nhom cho no
                 --nhu vay voi dieu kien nay thi se ra duoc tong cong cac dai ly trong nam
                  select /*+
                             CARDINALITY(empl, 100)
                             CARDINALITY(outl, 100)
                             */
                      empl.umvs_outlet_id,
                      sum(nvl(outl.umvs_ip, 0)) index_number
                  from
                  (--chi can join voi so lieu cua thang duoi day
                    --va do nhom do tuyen dung vao la duoc roi
                      /*Lay ra danh sach cac dai ly dat la dai ly moi vao day*/
                      /*Lay ra toan bo cac dai ly o day va lay ra IP cua no o day
                      theo cach ma Quynh da lay thi moi dung duoc co nhe
                      khong la se tinh bi sai day nhe*/
                      select /*+ CARDINALITY(v, 100)*/
                          v.umvs_empl_id,
                          v.outlet_id,
                          v.umvs_data_date,
                          v.umvs_ip
                      from ams.la_vietstar_umvs_empl_2012 v
                      where v.record_date = trunc(valRecordDate, 'YYYY')
                          and v.umvs_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                          and v.umvs_be_paid = ams.LIFE_AGENCY_CODE.OUTLET_PAID_YES
                  ) outl
                  join
                  (   --do trong bang ams.la_vietstar_umvs_2012  chi chua du lieu cua cac
                       --dai ly cua nhom hien tai tuc la KHONG CHUA DU LIEU CUA NHOM DA PHAT TRIEN LEN
                       --chua du lieu cua tat ca cac dai ly CUA NHOM
                       --trong tung thang mot o day
                       --chi tiet
                      /*Lay ra danh sach cac truong nhom va cac ca nhan thuoc nhom do vao day*/
                      select /*+ CARDINALITY(v, 100)*/
                          v.outlet_id, --cho nay la tinh cho toan nhom tuyen duoc
                          v.umvs_data_date,
                          v.umvs_outlet_id
                      from ams.la_vietstar_umvs_2012  v
                      where v.record_date = trunc(valRecordDate, 'YYYY')
                          and v.umvs_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                          and v.umvs_be_paid = ams.LIFE_AGENCY_CODE.OUTLET_PAID_OTHER
                  ) empl
                      on
                      (/*Join theo dieu kien la duoc dai ly thuoc nhom do tuyen vao day
                          phai nhu the nay thi moi la dung duoc co nhe*/
                          outl.umvs_empl_id = empl.outlet_id
                          and
                          --tinh cho theo tung thang cho no la tuyen duoc bao nhieu nguoi
                          /*Tong hop so lieu theo tung thang de biet tuyen duoc bao nhieu nguoi*/
                          --empl.umvs_data_date chinh la ngay thang ma dai ly do vao lam viec lam chan thang cho no
                          /*CUC CHU Y O CHO NAY
                          umvs_data_date = trunc(upd.begin_working_date, 'MM')
                          tuc la lam tron thang cua thang ma dai ly do lam viec
                          o.umvs_data_date = trunc(upd.begin_working_date, 'MM'),
                          chinh bang thang umvs_data_date cua bang ams.la_vietstar_umvs
                          cho nay lay so lieu vao theo dieu kien cua thang do
                          */
                          outl.umvs_data_date = empl.umvs_data_date
                      )
                  group by empl.umvs_outlet_id
              ) upd
          on (/*
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE = o.type_code
              and*/
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.umvs_be_executing
              and /*lay so lieu ra theo truong nhom la duoc*/
              upd.umvs_outlet_id = o.outlet_id
              )
          when matched then
              update
              set
                  o.umvs_ip = upd.index_number,
                  o.update_datetime = sysdate;
          commit;
          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2013', 'list_umvs_numb_of_nagt');

      end;

      /*DA KIEM TRA XONG --23/5/2013*/
      /*phan xu ly quan trong xu ly FYP duoc nhan 30% 60% hay 90%*/
      /*XU LY CA DAI LY TUYEN DUNG DUOC CUA NHOM THUONG LUON VAO HAM NAY*/
      /*Truoc het merge so lieu vao bang ams.la_vietstar_temp_devu_detail
      de thuc hien xu ly bang vong loop cho no
      cap nhat cho nhom duoc tach ra truoc
      lay so lieu cua cac nhom ma duoc phat trien tu nhom day de co the
      tinh dung duoc so lieu cho no khi tinh FYP vi du
      Nhom 1000 tao ra nhom 1100  va duoc huong 90% tu nhom 1100 nay
      va FYP cua nhom 1100 la 1000 thi se duoc ghi luon vao trong truong
      bang ams.la_vietstar_outlet_2012  cot umvs_bonus_fyp  o la 900 sau do duoc cong vao

      Ghi vao nag ams.la_vietstar_temp_devu_des cot devu_fyp sau khi tinh toan sau do
      se duoc cong nguoc tro lai bang ams.la_vietstar_outlet_2012   cot umvs_bonus_fyp
      */
      procedure list_umvs_process(valRecordDate date := null)
      is
          var_error_pos  number(8, 2) := 0;
          v_percent number(5,2) := 1; /*ty le duoc huong*/
          v_count number(10) := 0;

          loop_counter   integer;
          highest_number integer;
          p_data_leaf    sys_refcursor;

          v_outl_branch_id number(10);
          v_devu_branch_id number(10);
          v_devu_percent   number(5,2);
          v_devu_percent_cond   number(5,2);
          v_outl_root_fyp  number(18, 2);
          v_devu_root_fyp  number(18, 2);
          --so luong dai ly duoc tuyen dung tu nhom goc
          v_outl_root_qty  number(18, 2);
          --so luong dai ly thuong do nhom phat trien tu nhom goc tuyen
          v_devu_root_qty  number(18, 2);

          v_level          number(1);
          v_devu_bonus_fyp       number(18, 2);  --day la FYP duoc cong them vao doi voi devu_branch_id duoctinh tu 90% cua nhung nhom duoc phat trien tu nhom do
          --day la so luong dai ly duoc tuyen duoc cong them vao doi voi devu_branch_id duoc tinh tu 90% cua nhung nhom duoc phat trien tu nhom do
          v_devu_bonus_qty       number(18, 2);

          --bien tam luu FYP cua no vi du = 90%(1000+ 1800)
          v_devu_fyp  number(18, 2);

          --bien tam luu so luong di tuyen dung cua no vi du = 90%( 12+ 18)
          v_devu_qty  number(18, 2);

          --bien tam luu ty le dieu kien cua no neu ma co ban nhom tach ra
          v_devu_cond_perc_row  number(5, 2) := 1;
          v_devu_temp_cond_percent  number(5, 2) := 1;
          v_devu_cond_percent_des  number(5, 2) := 1;

          v_devu_sernior_by_months number(5, 2) := 0;
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;


        /*De co the tao ra cay duoc thi can phai them cac nut la nut goc
        chi can truong outl_outlet_id voi cac nhom duoc sinh ra tu cac nhom goc nay de xu ly theo
        cay cho no dung hon KHONG can du lieu gi ve FYP o nhom nay ma no chi la cau truc de tien xu ly cho no*/
        /*lay so lieu cua no do so lieu vao voi bang da co vao*/
        /*can phai lay so lieu cua cac nhom la GOC vao de co the tinh duoc dung cho no*/
        insert /*+ APPEND */ into ams.la_vietstar_unit_dev nologging(
            /*outlet_id,*/
            outlet_ams_id,
            record_date,
            version_date,
            unit_ams_id,--chi them vao duy nhat cai con cho no nhu the nay thi moi dung
            umnm_agency_status,
            umnm_be_paid,
            umnm_be_executing,
            create_user,
            update_user,
            create_datetime,
            update_datetime
        )
        select  /*+ CARDINALITY(devu, 100)*/
            null,--tmp.outlet_ams_id,
            trunc(valRecordDate, 'YYYY'),
            cast(trunc(sysdate, 'DD') as date),
            devu.unit_ams_id,
            devu.umnm_agency_status,
            LIFE_AGENCY_VIETSTAR_2013.BE_PAID_YES,
            LIFE_AGENCY_VIETSTAR_2013.BE_EXECUTING_YES,
            LIFE_AGENCY_VIETSTAR_2013.SYSTEM_USER,
            LIFE_AGENCY_VIETSTAR_2013.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (   --lay ra toan bo cac ban nhom duoc phat trien len de co the tinh toan cho no dung hon
            select  /*+ CARDINALITY(dev, 100)*/
                dev.unit_ams_id,
                max(umnm_agency_status) umnm_agency_status
            from
            --chu y rang umnm_unit_ams_id  la do thang nao phat trien len
            --tru nhu the nay thi moi dung duoc cho no co nhe
            (  --lay danh sach cac dai ly ben trai la nhung dai ly phat trien
               --tru di nhung dai ly ben phai la nhung dai ly duoc phat trien tu nhung dai ly do
               --thuc hien xu ly theo nhom thi moi co the dung duoc cho no
                /*outl_branch_id  devu_branch_id
                1000  1100
                1000  1200
                1000  1300
                1200  1210
                1200  1220
                1000*/
                /*theo hinh ve o day thi se ra duoc no la nhom 1000 la nhom goc va can phai them vao de xu ly cho no*/
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.umnm_unit_ams_id unit_ams_id
                from ams.la_vietstar_unit_dev tmp
                where tmp.record_date = trunc(valRecordDate, 'YYYY')
                    and tmp.umnm_be_executing = LIFE_AGENCY_VIETSTAR_2013.BE_EXECUTING_YES
                    and tmp.umnm_be_paid = LIFE_AGENCY_VIETSTAR_2013.BE_PAID_YES
                    and tmp.unit_ams_id is not null
                group by tmp.umnm_unit_ams_id
                minus
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.unit_ams_id
                from ams.la_vietstar_unit_dev tmp
                where tmp.record_date = trunc(valRecordDate, 'YYYY')
                    and tmp.umnm_be_executing = LIFE_AGENCY_VIETSTAR_2013.BE_EXECUTING_YES
                    and tmp.umnm_be_paid = LIFE_AGENCY_VIETSTAR_2013.BE_PAID_YES
                    and tmp.umnm_unit_ams_id is not null
                group by tmp.unit_ams_id
            ) dev
            left join
            (  --lay danh sach cac dai ly ben trai la nhung dai ly phat trien
               --tru di nhung dai ly ben phai la nhung dai ly duoc phat trien tu nhung dai ly do
               --thuc hien xu ly theo nhom thi moi co the dung duoc cho no
                /*outl_branch_id  devu_branch_id
                1000  1100
                1000  1200
                1000  1300
                1200  1210
                1200  1220
                1000*/
                /*theo hinh ve o day thi se ra duoc no la nhom 1000 la nhom goc va can phai them vao de xu ly cho no*/
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.umnm_unit_ams_id,
                    max(tmp.umnm_agency_status) umnm_agency_status
                from ams.la_vietstar_unit_dev tmp
                where tmp.record_date = trunc(valRecordDate, 'YYYY')
                    and tmp.umnm_be_executing = LIFE_AGENCY_VIETSTAR_2013.BE_EXECUTING_YES
                    and tmp.umnm_be_paid = LIFE_AGENCY_VIETSTAR_2013.BE_PAID_YES
                    and tmp.unit_ams_id is not null
                group by tmp.umnm_unit_ams_id
            ) agency
                on agency.umnm_unit_ams_id = dev.unit_ams_id
            --where dev.unit_ams_id is not null
            group by dev.unit_ams_id
        ) devu;
        commit;

          /*Cap nhat cho nhom con duoc phat trien len*/
          /*Cap nhat ID cua cac nhom vao de tinh cho de hon*/
          merge
              into ams.la_vietstar_unit_dev des
          using
              (
                  select /*+ CARDINALITY(o, 100)*/
                      o.branch_id unit_branch_id,
                      o.branch_ams_id unit_ams_id
                  from ams.serv_branch_mapping o
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = des.record_date
              and
              upd.unit_ams_id = des.unit_ams_id
              )
          when matched then
              update
                    set des.unit_branch_id = upd.unit_branch_id;
          commit;

          /*Cap nhat cho nhom cha*/
          /*Cap nhat ID cua cac nhom vao de tinh cho de hon*/
          merge
              into ams.la_vietstar_unit_dev des
          using
              (
                  select /*+ CARDINALITY(o, 100)*/
                      o.branch_id umnm_unit_id,
                      o.branch_ams_id umnm_unit_ams_id
                  from ams.serv_branch_mapping o
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = des.record_date
              and
              upd.umnm_unit_ams_id = des.umnm_unit_ams_id
              )
          when matched then
              update
                    set des.umnm_unit_id = upd.umnm_unit_id;
          commit;

          /*Cap nhat cho nhom con*/
          /*PHAI doc lai comment o phia tren thi moi hieu duoc doan code nay lam gi*/
          --lay FYP cho nhom co cong phat trien nhom do len
          --lay luon ca so luong dai ly do nhom tuyen vao day luon
          merge
              into ams.la_vietstar_unit_dev des
          using
              (   --truong hop nay chi tinh nhung nhom CON LAM DEN 30/11/2012 theo anh Cong Hoa confirm
                  --Nhu vay la da lam duoc dung theo quy che thang tien roi day nhe
                  --Nhu the la da lam dung duoc cho no
                  select /*+ CARDINALITY(o, 100)*/
                      o.umvs_branch_id unit_branch_id,
                      o.umvs_root_fyp unit_root_fyp,
                      o.umvs_root_nagt_qty unit_root_new_outl_qty
                  from ams.la_vietstar_outlet_2012 o
                  where o.record_date = trunc(valRecordDate, 'YYYY')
                      and o.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
                      --phai them dieu kien nay nua
                      and o.umvs_be_executing = ams.LIFE_AGENCY_VIETSTAR_2013.BE_EXECUTING_YES
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = des.record_date
              and
              upd.unit_branch_id = des.unit_branch_id--cap nhat cho nhom duoc huong voi so lieu nhom phat trien len cua no
              )
          when matched then
              update
                  --cap nhat ca ma cua truong nhom duoc phat trien tu vao day cho no de tinh toan chinh xac hon
                  --Khong biet la bay gio no co con la truong nhom hay khong nua co??? thi tam thoi la nhu vay va bay gio thi no se la so lieu null
                  --Nhung ma hien tai la neu co phong ban nhom nao thi se cap nhat duoc ma cua truong nhom hien tai vao luon cho no o day
                  --TAT CA MOI CAI SO LIEU BAN NHOM PHAT TRIEN TU thi devu_root_fyp phai co so lieu khong la se bi tinh thieu cho no
                  set des.unit_root_fyp = nvl(upd.unit_root_fyp, 0),
                      des.unit_root_new_outl_qty = nvl(upd.unit_root_new_outl_qty, 0),
                      des.update_datetime = sysdate;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2012', 'list_umvs_process 1');
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          /*Cap nhat cho nhom cha*/
          merge
              into ams.la_vietstar_unit_dev des
          using
              (
                  select /*+ CARDINALITY(o, 100)*/
                      o.umvs_branch_id umnm_unit_id,
                      o.umvs_root_fyp devu_root_fyp,
                      o.umvs_root_nagt_qty devu_root_new_outl_qty
                  from ams.la_vietstar_outlet_2012 o
                  where o.record_date = trunc(valRecordDate, 'YYYY')
                      and o.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
                      --phai them dieu kien nay nua
                      and o.umvs_be_executing = ams.LIFE_AGENCY_VIETSTAR_2013.BE_EXECUTING_YES
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = des.record_date
              and
              upd.umnm_unit_id = des.umnm_unit_id--cap nhat cho nhom duoc huong voi so lieu nhom phat trien len cua no
              )
          when matched then
              update
                    /*Cap nhat cho nhom cha*/
                  --cap nhat ca ma cua truong nhom duoc phat trien tu vao day cho no de tinh toan chinh xac hon
                  --Khong biet la bay gio no co con la truong nhom hay khong nua co??? thi tam thoi la nhu vay va bay gio thi no se la so lieu null
                  --Nhung ma hien tai la neu co phong ban nhom nao thi se cap nhat duoc ma cua truong nhom hien tai vao luon cho no o day
                  --TAT CA MOI CAI SO LIEU BAN NHOM PHAT TRIEN TU thi devu_root_fyp phai co so lieu khong la se bi tinh thieu cho no
                  set des.devu_root_fyp = nvl(upd.devu_root_fyp, 0),
                      des.devu_root_new_outl_qty = nvl(upd.devu_root_new_outl_qty, 0),
                      des.update_datetime = sysdate;
          commit;

       --truoc het xu ly cho nhom duoc tach ra tu ban truoc da
       --sau do se thuc hien xu ly theo thuat toan da co
        --lay cap cao nhat cua cay
        select max(level)
            into highest_number
        from ams.la_vietstar_unit_dev tmp
        where tmp.record_date = trunc(valRecordDate, 'YYYY')
            and tmp.umnm_be_executing = LIFE_AGENCY_VIETSTAR_2013.BE_EXECUTING_YES
            and tmp.umnm_be_paid = LIFE_AGENCY_VIETSTAR_2013.BE_PAID_YES
        start with (tmp.umnm_agency_status = 1 and tmp.umnm_unit_ams_id is null)
        --lay theo dieu kien phat trien nhu the nay thi se duoc
        connect by nocycle prior tmp.unit_ams_id = tmp.umnm_unit_ams_id;


        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'upload_modl_unit_dev', 'Xoa du lieu chi tiet thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 9;

          if (highest_number > 1) then
              /*duyet theo tung cap tu cap lon den cap nho*/
              for loop_counter in reverse 1 .. highest_number
              loop
                  open p_data_leaf for
                      select /*+ CARDINALITY(t, 100)*/
                          distinct
                          --nhom cha cho vao truoc
                          t.umnm_unit_id,
                          --nhom con cho vao sau
                          t.unit_branch_id,
                          t.devu_percent,
                          --nhom cha truoc
                          t.devu_root_fyp  as parent_fyp,
                          --nhom con sau
                          t.unit_root_fyp  as child_fyp,
                          --so luong dai ly tuyen tu nhom goc
                          t.devu_root_new_outl_qty  as parent_qty,
                          --so luong dai ly tuyen tu nhom duoc phat trien tu nhom goc
                          t.unit_root_new_outl_qty  as child_qty,
                          t.devu_sernior_by_months  as sernior_by_months,
                          level as stt
                      from ams.la_vietstar_unit_dev t
                      where t.record_date = trunc(valRecordDate, 'YYYY')
                          and t.umnm_be_executing = LIFE_AGENCY_VIETSTAR_2013.BE_EXECUTING_YES
                          and t.umnm_be_paid = LIFE_AGENCY_VIETSTAR_2013.BE_PAID_YES
                          and level = loop_counter
                      --bi sai o day roi day nhe, lam o day la bi sai roi day nhe
                      start with (t.umnm_agency_status = 1 and t.umnm_unit_ams_id is null)
                      --lay theo dieu kien phat trien nhu the nay thi se duoc
                      connect by nocycle prior t.unit_ams_id = t.umnm_unit_ams_id;
                  loop
                      fetch p_data_leaf
                          --nhom cha cho vao truoc
                          into v_outl_branch_id,
                            --nhom con cho vao sau
                              v_devu_branch_id,
                              v_devu_percent,
                              --nhom cha truoc
                              v_outl_root_fyp,
                              --nhom con
                              v_devu_root_fyp,
                              --nhom cha truoc
                              v_outl_root_qty,
                              --nhom con sau
                              v_devu_root_qty,
                              v_devu_sernior_by_months,
                              v_level;
                      exit when p_data_leaf%notfound;
                      --lay FYP truoc cho no
                      --lay tong cong tu cac cai truoc sang neu so lieu da co san roi
                      --voi cai cap cao hon tu bang ams.la_vietstar_TEMP_DEVU_DES
                      --la bang chua ket qua truoc day da tinh roi
                      select sum(nvl(t.devu_fyp, 0))
                          into v_devu_bonus_fyp
                      from ams.la_vietstar_temp_devu_des t
                      where t.outl_level = (v_level + 1)
                          and t.outl_branch_id = v_devu_branch_id;

                      --lay tong cong tu cac cai truoc ams.la_vietstar_TEMP_DEVU_DES la cai da tinh ra duoc tu truoc sang neu so lieu da co san roi
                      --voi cai cap cao hon tu bang ams.la_vietstar_TEMP_DEVU_DES
                      --la bang chua ket qua truoc day da tinh roi
                      --doi voi so luong dai ly tuyen dung
                      select sum(nvl(t.devu_new_outl_qty, 0))
                          into v_devu_bonus_qty
                      from ams.la_vietstar_temp_devu_des t
                      where t.outl_level = (v_level + 1)
                          and t.outl_branch_id = v_devu_branch_id;

                      /*day la FYP duoc cong them vao doi voi devu_branch_id duoctinh tu 90% cua nhung nhom duoc phat trien tu nhom do
                      de tinh cac so lieu cua no cho dung
                      v_devu_bonus_fyp : bien de danh dau la co nhom con
                      neu ma no co nhom con duoc sinh ra tu nhom day thi can phai co mot bien de danh dau
                      de co the chi lay cac nhom co nhom con sau do merge len bang chinh
                      nhu the thi moi chinh xac duoc   */

                      /*neu ma o cap cao nhat la cap duoc tinh vao cap cao nhat
                      thi chi viec cong vao va khong phai nhan len he so gi ca*/
                      if v_devu_percent is null or v_devu_percent = 0 then
                          v_devu_fyp := (nvl(v_devu_bonus_fyp, 0) + nvl(v_devu_root_fyp, 0));
                          v_devu_qty := (nvl(v_devu_bonus_qty, 0) + nvl(v_devu_root_qty, 0));
                      else /*con neu khong thi nhan theo he  so theo dung cong thuc*/
                          v_devu_fyp := (nvl(v_devu_bonus_fyp, 0) +
                                        nvl(v_devu_root_fyp, 0)) * (nvl(v_devu_percent, 0));
                          /*tinh cho so luong dai ly moi tuyen cho no theo cong thuc da co*/
                          v_devu_qty := (nvl(v_devu_bonus_qty, 0) +
                                        nvl(v_devu_root_qty, 0)) * (nvl(v_devu_percent, 0));
                      end if;

                      --chua nghi ra duoc cach xu ly cho doan nay roi nhe
                      /*sau do thi moi tinh cho no ty le duoc huong cu nhan len thoi nhe
                      vi du la duoc 70% sau do lai tach ra duoc 90% nua
                      thi se duoc la 70%*90% vao cho ket qua la chi can >= dieu kien nay thi moi duoc huong
                      cho nay la nhan voi ca cai da lay ra cua no la nhu the*/

                      /*do so lieu vao bang chua ket qua cho no*/
                      insert /*+ APPEND */ into ams.la_vietstar_temp_devu_des nologging(
                          outl_level,
                          outl_branch_id,
                          devu_branch_id,
                          devu_fyp,
                          devu_bonus_fyp,
                          devu_new_outl_qty,
                          devu_bonus_new_outl_qty,
                          devu_sernior_by_months,
                          devu_percent,
                          update_datetime)
                      values (
                          v_level,
                          v_outl_branch_id,
                          v_devu_branch_id,
                          --day la so tien tong FYP cua no vi du  = 90% * (1000+ (90%*1000 + 90%*1000))
                          v_devu_fyp,
                          --day la chua so FYP duoc thuong  dua tren 2 nhom tach ra vi du FYP =(90%*1000 + 90%*1000)
                          v_devu_bonus_fyp,
                          --so luong dai ly tuyen dung sau khi cong toan bo  = 90% * (1000+ (90%*1000 + 90%*1000))
                          v_devu_qty,
                          --day la chua so dai ly tuyen duoc thuong  dua tren 2 nhom tach ra vi du  =(90%*1000 + 90%*1000)
                          v_devu_bonus_qty,
                          v_devu_sernior_by_months,
                          v_devu_percent,
                          sysdate);
                   end loop;
                  commit;
              end loop;
          end if;


          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(1000, 'upload_modl_unit_dev', 'Xoa du lieu chi tiet thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;
          var_error_pos := 10;
          --sau do se xu ly cho cac nhom con lai ma da biet rang phat trien tu ban khac va nhom khac cho no o day
          --khong xu ly cho cac dai ly da cho vao bang phia tren nua

          merge /*+ CARDINALITY(mnbs, 100)*/
              into ams.la_vietstar_unit_dev o
          using
              (
                  --lay nhom cha vao nen phai xu ly nhu the nay moi dung duoc
                  --lay nhom cha co ma la: tmp.devu_branch_id
                  select /*+ CARDINALITY(comp, 100)*/
                      tmp.outl_branch_id umnm_unit_id
                  from ams.la_vietstar_temp_devu_des tmp
                  where tmp.outl_branch_id is not null
                 group by tmp.outl_branch_id
              ) upd
              on (
                  trunc(valRecordDate, 'YYYY') = o.record_date
                  and--khi ma co ma day da xu ly roi thi se khong xay dung cay cho cac ban nhom day
                  --xu ly o nhom cha la umnm_unit_id thi moi dung duoc
                  upd.umnm_unit_id = o.umnm_unit_id
              )
          when matched then
              update
                  set
                      o.umnm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO,
                      o.umnm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_NO;
          commit;

          --cap nhat them mot lan nua
          merge /*+ CARDINALITY(mnbs, 100)*/
              into ams.la_vietstar_unit_dev o
          using
              (
                  --lay nhom cha vao nen phai xu ly nhu the nay moi dung duoc
                  --lay nhom cha co ma la: tmp.devu_branch_id
                  select /*+ CARDINALITY(comp, 100)*/
                      tmp.devu_branch_id unit_branch_id
                  from ams.la_vietstar_temp_devu_des tmp
                  where tmp.devu_branch_id is not null
                 group by tmp.devu_branch_id
              ) upd
              on (
                  trunc(valRecordDate, 'YYYY') = o.record_date
                  and--khi ma co ma day da xu ly roi thi se khong xay dung cay cho cac ban nhom day
                  --xu ly o nhom cha la umnm_unit_id thi moi dung duoc
                  upd.unit_branch_id = o.unit_branch_id
              )
          when matched then
              update
                  set
                      o.umnm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_NO,
                      o.umnm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_NO;
          commit;


          --khong duoc xu ly cho cac cai ma be executing = NO nua

          select max(level)
              into highest_number
          from ams.la_vietstar_unit_dev tmp
          where tmp.record_date = trunc(valRecordDate, 'YYYY')
              and tmp.umnm_be_executing = AMS_MODL_COMP_MMXIII.BE_EXECUTING_YES
              and tmp.umnm_be_paid = AMS_MODL_COMP_MMXIII.BE_PAID_YES
          start with (tmp.umnm_unit_ams_id is null)
          --lay theo dieu kien phat trien nhu the nay thi se duoc
          connect by nocycle prior tmp.unit_ams_id = tmp.umnm_unit_ams_id;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'upload_modl_unit_dev', 'Xoa du lieu chi tiet thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 9;

          if (highest_number >= 1) then
              /*duyet theo tung cap tu cap lon den cap nho*/
              for loop_counter in reverse 1 .. highest_number
              loop
                  open p_data_leaf for
                      select /*+ CARDINALITY(t, 100)*/
                          distinct
                          --nhom cha cho vao truoc
                          t.umnm_unit_id,
                          --nhom con cho vao sau
                          t.unit_branch_id,
                          t.devu_percent,
                          --nhom cha truoc
                          t.devu_root_fyp  as parent_fyp,
                          --nhom con sau
                          t.unit_root_fyp  as child_fyp,
                          --so luong dai ly tuyen tu nhom goc
                          t.devu_root_new_outl_qty  as parent_qty,
                          --so luong dai ly tuyen tu nhom duoc phat trien tu nhom goc
                          t.unit_root_new_outl_qty  as child_qty,
                          t.devu_sernior_by_months  as sernior_by_months,
                          level as stt
                      from ams.la_vietstar_unit_dev t
                      where t.record_date = trunc(valRecordDate, 'YYYY')
                          and t.umnm_be_executing = LIFE_AGENCY_VIETSTAR_2013.BE_EXECUTING_YES
                          and t.umnm_be_paid = LIFE_AGENCY_VIETSTAR_2013.BE_PAID_YES
                          and level = loop_counter
                          and level >= 1
                    start with t.umnm_unit_ams_id is null
                    connect by nocycle prior t.unit_ams_id = t.umnm_unit_ams_id;
                  loop
                      fetch p_data_leaf
                          --nhom cha cho vao truoc
                          into v_outl_branch_id,
                            --nhom con cho vao sau
                              v_devu_branch_id,
                              v_devu_percent,
                              --nhom cha truoc
                              v_outl_root_fyp,
                              --nhom con
                              v_devu_root_fyp,
                              --nhom cha truoc
                              v_outl_root_qty,
                              --nhom con sau
                              v_devu_root_qty,
                              v_devu_sernior_by_months,
                              v_level;
                      exit when p_data_leaf%notfound;
                      --lay FYP truoc cho no
                      --lay tong cong tu cac cai truoc sang neu so lieu da co san roi
                      --voi cai cap cao hon tu bang ams.la_vietstar_TEMP_DEVU_DES
                      --la bang chua ket qua truoc day da tinh roi
                      select sum(nvl(t.devu_fyp, 0))
                          into v_devu_bonus_fyp
                      from ams.la_vietstar_temp_devu_des t
                      where t.outl_level = (v_level + 1)
                          and t.outl_branch_id = v_devu_branch_id;

                      --lay tong cong tu cac cai truoc ams.la_vietstar_TEMP_DEVU_DES la cai da tinh ra duoc tu truoc sang neu so lieu da co san roi
                      --voi cai cap cao hon tu bang ams.la_vietstar_TEMP_DEVU_DES
                      --la bang chua ket qua truoc day da tinh roi
                      --doi voi so luong dai ly tuyen dung
                      select sum(nvl(t.devu_new_outl_qty, 0))
                          into v_devu_bonus_qty
                      from ams.la_vietstar_temp_devu_des t
                      where t.outl_level = (v_level + 1)
                          and t.outl_branch_id = v_devu_branch_id;

                      /*day la FYP duoc cong them vao doi voi devu_branch_id duoctinh tu 90% cua nhung nhom duoc phat trien tu nhom do
                      de tinh cac so lieu cua no cho dung
                      v_devu_bonus_fyp : bien de danh dau la co nhom con
                      neu ma no co nhom con duoc sinh ra tu nhom day thi can phai co mot bien de danh dau
                      de co the chi lay cac nhom co nhom con sau do merge len bang chinh
                      nhu the thi moi chinh xac duoc   */

                      /*neu ma o cap cao nhat la cap duoc tinh vao cap cao nhat
                      thi chi viec cong vao va khong phai nhan len he so gi ca*/
                      if v_devu_percent is null or v_devu_percent = 0 then
                          v_devu_fyp := (nvl(v_devu_bonus_fyp, 0) + nvl(v_devu_root_fyp, 0));
                          v_devu_qty := (nvl(v_devu_bonus_qty, 0) + nvl(v_devu_root_qty, 0));
                      else /*con neu khong thi nhan theo he  so theo dung cong thuc*/
                          v_devu_fyp := (nvl(v_devu_bonus_fyp, 0) +
                                        nvl(v_devu_root_fyp, 0)) * (nvl(v_devu_percent, 0));
                          /*tinh cho so luong dai ly moi tuyen cho no theo cong thuc da co*/
                          v_devu_qty := (nvl(v_devu_bonus_qty, 0) +
                                        nvl(v_devu_root_qty, 0)) * (nvl(v_devu_percent, 0));
                      end if;

                      --chua nghi ra duoc cach xu ly cho doan nay roi nhe
                      /*sau do thi moi tinh cho no ty le duoc huong cu nhan len thoi nhe
                      vi du la duoc 70% sau do lai tach ra duoc 90% nua
                      thi se duoc la 70%*90% vao cho ket qua la chi can >= dieu kien nay thi moi duoc huong
                      cho nay la nhan voi ca cai da lay ra cua no la nhu the*/

                      /*do so lieu vao bang chua ket qua cho no*/
                      insert /*+ APPEND */ into ams.la_vietstar_temp_devu_des nologging(
                          outl_level,
                          outl_branch_id,
                          devu_branch_id,
                          devu_fyp,
                          devu_bonus_fyp,
                          devu_new_outl_qty,
                          devu_bonus_new_outl_qty,
                          devu_sernior_by_months,
                          devu_percent,
                          update_datetime)
                      values (
                          v_level,
                          v_outl_branch_id,
                          v_devu_branch_id,
                          --day la so tien tong FYP cua no vi du  = 90% * (1000+ (90%*1000 + 90%*1000))
                          v_devu_fyp,
                          --day la chua so FYP duoc thuong  dua tren 2 nhom tach ra vi du FYP =(90%*1000 + 90%*1000)
                          v_devu_bonus_fyp,
                          --so luong dai ly tuyen dung sau khi cong toan bo  = 90% * (1000+ (90%*1000 + 90%*1000))
                          v_devu_qty,
                          --day la chua so dai ly tuyen duoc thuong  dua tren 2 nhom tach ra vi du  =(90%*1000 + 90%*1000)
                          v_devu_bonus_qty,
                          v_devu_sernior_by_months,
                          v_devu_percent,
                          sysdate);
                      commit;
                   end loop;
                  commit;
              end loop;
          end if;

          /*so luong FYP
          sau khi da tinh xong thi se lay so lieu vao bang chinh cho no
          cap nhat so lieu vao bang tinh cho no*/
          merge
              into ams.la_vietstar_outlet_2012 o
          using
              (   --cho nay chi lay danh sach cac nhom ma co nhom duoc phat trien tu nhom day thi moi dung duoc cho no con khong thi la sai khong lay
                   --lay theo devu_branch_id thi moi co the dung duoc cho no
                   --phai su dung the nay de kiem tra lai
                  select /*+ CARDINALITY(tmp, 100)*/
                      max(tmp.outl_level),
                      max(tmp.outl_branch_id),
                      tmp.devu_branch_id umvs_branch_id,
                      max(tmp.devu_bonus_fyp) index_number
                  from ams.la_vietstar_temp_devu_des tmp
                  where nvl(tmp.devu_bonus_fyp, 0) > 0
                  group by tmp.devu_branch_id
                  --dieu kien nay la dam bao rang chi can lay nhung ban nhom duoc thuong vao cho no duoc dung roi
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE = o.type_code
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.umvs_be_executing
              and
              upd.umvs_branch_id = o.umvs_branch_id
              )
          when matched then
              update
              set --ghi vao cot umvs_bonus_fyp
                  o.umvs_bonus_fyp = nvl(upd.index_number, 0),
                  o.update_datetime = sysdate;
          commit;
          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2013', 'list_umvs_fyp 8');
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;


          /*Cap nhat cho ca TRUONG NHOM CHUYEN THU THEO YEU CAU CUA ANH HAI
          FYP
          sau khi da tinh xong thi se lay so lieu vao bang chinh cho no
          cap nhat so lieu vao bang tinh cho no*/
          merge
              into ams.la_vietstar_outlet_2012 o
          using
              (   --cho nay chi lay danh sach cac nhom ma co nhom duoc phat trien tu nhom day thi moi dung duoc cho no con khong thi la sai khong lay
                   --lay theo devu_branch_id thi moi co the dung duoc cho no
                   --phai su dung the nay de kiem tra lai
                  select /*+ CARDINALITY(tmp, 100)*/
                      max(tmp.outl_level),
                      max(tmp.outl_branch_id),
                      tmp.devu_branch_id umvs_branch_id,
                      max(tmp.devu_bonus_fyp) index_number
                  from ams.la_vietstar_temp_devu_des tmp
                  where nvl(tmp.devu_bonus_fyp, 0) > 0
                  group by tmp.devu_branch_id
                  --dieu kien nay la dam bao rang chi can lay nhung ban nhom duoc thuong vao cho no duoc dung roi
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE = o.type_code
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.cumv_be_executing
              and
              upd.umvs_branch_id = o.umvs_branch_id
              )
          when matched then
              update
              set --ghi vao cot umvs_bonus_fyp
                  o.umvs_bonus_fyp = nvl(upd.index_number, 0),
                  o.update_datetime = sysdate;
          commit;
          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2013', 'list_umvs_fyp 8');
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          /*so luong dai ly tuyen dung moi
          sau khi da tinh xong thi se lay so lieu vao bang chinh cho no
          cap nhat so lieu vao bang tinh cho no*/
          merge
              into ams.la_vietstar_outlet_2012 o
          using
              (   --cho nay chi lay danh sach cac nhom ma co nhom duoc phat trien tu nhom day thi moi dung duoc cho no con khong thi la sai khong lay
                   --lay theo devu_branch_id thi moi co the dung duoc cho no
                   --phai su dung the nay de kiem tra lai
                  select /*+ CARDINALITY(tmp, 100)*/
                      max(tmp.outl_level),
                      max(tmp.outl_branch_id),
                      tmp.devu_branch_id umvs_branch_id,
                      max(tmp.devu_bonus_new_outl_qty) index_number
                  from ams.la_vietstar_temp_devu_des tmp
                  where nvl(tmp.devu_bonus_new_outl_qty, 0) > 0
                  group by tmp.devu_branch_id
                  --dieu kien nay la dam bao rang chi can lay nhung ban nhom duoc thuong vao cho no duoc dung roi
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE = o.type_code
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.umvs_be_executing
              and
              upd.umvs_branch_id = o.umvs_branch_id
              )
          when matched then
              update
              set
                  --ghi vao cot umvs_bonus_nagt_qty
                  ----so lieu cho nay la phai lam tron len cho no luon day nhe
                  o.umvs_bonus_nagt_qty = round(nvl(upd.index_number, 0)),
                  o.update_datetime = sysdate;
          commit;
          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2013', 'list_umvs_fyp 9');
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          --da kiem tra xong dieu kien nay roi
          /*ty le dieu kien cua FYP va tuyen dung moi neu co ban nhom tach ra
          sau khi da tinh xong thi se lay so lieu vao bang chinh cho no
          cap nhat so lieu vao bang tinh cho no*/

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2013', 'list_umvs_fyp 10');
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          /*cap nhat gia tri FYP thuc te tuc la tinh ca phan cong them vao cho no*/
          update ams.la_vietstar_outlet_2012 o
          set o.umvs_fyp = nvl(o.umvs_root_fyp, 0) +
                                      nvl(o.umvs_bonus_fyp, 0),
              o.umvs_numb_of_nagt = nvl(o.umvs_root_nagt_qty, 0) +
                                      nvl(o.umvs_bonus_nagt_qty, 0),
              o.update_datetime = sysdate
          where o.record_date = trunc(valRecordDate, 'YYYY')
              and o.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
              and o.umvs_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES;
          commit;
      end;

      /*Tinh cac chi tieu cho Truong ban*/
      procedure upload_amvs(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;
          /*Lay danh sach cho cac truong ban cho no*/
          update ams.la_vietstar_outlet_2012 o
          set
              o.amvs_be_paid = ams.LIFE_AGENCY_CODE.OUTLET_PAID_YES,
              o.amvs_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES,
              /*Lay ra ca ngay hieu luc len chuc truong ban luon o day*/
              o.amvs_effective_date = ams.LIFE_AGENCY_agent.positions_date(trunc(valRecordDate, 'MM'), o.outlet_id),
              o.amvs_outlet_id = o.outlet_id,
              o.amvs_branch_id = o.agency_id,
              o.amvs_fyp = 0,
              o.update_datetime = sysdate
          where o.record_date = trunc(valRecordDate, 'YYYY')
              and o.be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
              and o.position_code in (
                  ams.LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_AM
              );
          commit;
          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2013', 'upload_amvs');
      end;

      --da xu ly cho truongm hop nghi viec trong thang van tinh xong
      --do thoi gian thi dua la den 30/11 nen khong xu ly tach ban o day
      procedure list_amvs_temp(valRecordDate date := null)
      is
      begin
          execute immediate 'truncate table ams.la_vietstar_amvs_2012';
          commit;
          /*Nhap vao danh sach cac truong ban cho no
          Lay so lieu theo tung thang cho no nhe
          Code o cho nay the la dat duoc yeu cau roi day nhe
          chay trong 3 phut cho 10 thang*/
          for i in 0..10
          loop
              ams.life_agency_log.time_stop;
              ams.life_agency_log.time_begin;
              for list_agency in
              (
                  select
                      v.outlet_id,
                      v.amvs_outlet_id,
                      v.amvs_branch_id,
                      v.amvs_effective_date
                  from ams.la_vietstar_outlet_2012 v
                  where v.record_date = trunc(valRecordDate, 'YYYY')
                      and v.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
                      and v.amvs_be_paid = ams.LIFE_AGENCY_CODE.OUTLET_PAID_YES
                      and v.amvs_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                      and --them dieu kien nay len day
                      /*Lay so lieu tu cuoi thang do phai lon hon ngay hieu luc thi moi co the ra duoc so lieu cho no*/
                      /*Nhu the thi moi co duoc so lieu dung cho no*/
                      (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1) >= v.amvs_effective_date
                      and v.amvs_branch_id is not null
              )
              loop
                    insert /*+ APPEND */ into ams.la_vietstar_amvs_2012 nologging
                    --insert into ams.la_vietstar_amvs_2012
                    select
                        outl.outlet_id,
                        trunc(valRecordDate, 'YYYY'),
                        trunc(sysdate, 'DD'),
                        sysdate,
                        outl.outlet_ams_id,
                        outl.outlet_name,
                        outl.effective_date,
                        outl.terminative_date,
                        outl.status_code, --lay them ca trang thai da nghi viec cua dai ly do vao day luon nhe
                        outl.company_id,
                        outl.company_name,
                        outl.office_id,
                        outl.office_name,
                        outl.sales_agency_id,
                        outl.agency_name,
                        outl.sales_unit_id,
                        outl.unit_name,
                        ams.LIFE_AGENCY_CODE.OUTLET_PAID_OTHER,
                        ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES,
                        add_months(trunc(valRecordDate, 'YYYY'), i),
                        list_agency.outlet_id,
                        list_agency.amvs_branch_id,
                        0
                    from
                    (  --lay them ca dai ly da nghi viec trong thang nua thi moi du duoc
                        select
                            outl.outlet_id,
                            outl.outlet_ams_id,
                            outl.outlet_name,
                            outl.company_id,
                            outl.company_name,
                            outl.office_id,
                            outl.office_name,
                            outl.agency_id sales_agency_id,
                            outl.agency_name,
                            outl.unit_id sales_unit_id,
                            outl.unit_name,
                            outl.effective_date,
                            outl.terminative_date,
                            outl.status_code --trang thai cua dai ly
                        from ams.la_vietstar_temp_outlet outl
                        where outl.record_date = add_months(trunc(valRecordDate, 'YYYY'), i)
                            and outl.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
                            --chi lay o ban do vao thoi o day
                            and outl.agency_id = list_agency.amvs_branch_id
                    ) outl;
                    commit;
              end loop;
              ams.life_agency_log.time_end;
              ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2013', 'list_amvs_temp: ' || to_char(i));
          end loop;

          /*
          Update by: Le Khac Chinh Ban PTUD
          Version: 1.7.5.121220
          Note:  Fix lai chuong trinh theo yeu cau: #94667 cua phong PTDL
                    Them vao bang la_vietstar_amvs_2012  du lieu thang 12 nam 2013 danh sach dai ly cua cac ban
                    De tu do co the tinh them FYP KTM trong thoi gian tu 1/12/2013 den 12/12/2013 cho chinh xac
          */
          insert /*+ APPEND */ into ams.la_vietstar_amvs_2012 nologging
          select /*+  CARDINALITY(outl, 100) */
              outl.outlet_id,
              trunc(valRecordDate, 'YYYY'),
              trunc(sysdate, 'DD'),
              sysdate,
              outl.outlet_number,
              outl.outlet_name,
              outl.effective_date,
              outl.terminative_date,
              outl.status_code,
              outl.company_id,
              outl.company_name,
              outl.office_id,
              outl.office_name,
              outl.agency_id,
              outl.agency_name,
              outl.unit_id,
              outl.unit_name,
              ams.LIFE_AGENCY_CODE.OUTLET_PAID_OTHER,
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES,
              add_months(trunc(valRecordDate, 'YYYY'), 11), --data_date phai la cai nay thi moi duoc cong vao cac du lieu khac thi giong y het
              outl.amvs_outlet_id,
              outl.amvs_branch_id,
              0
          --cac so lieu dung giong het voi thang 11 da do vao vi do la cac dai ly da co mat thoi diem do
          from ams.la_vietstar_amvs_2012 outl
          where outl.record_date = trunc(valRecordDate, 'YYYY')
              --lay du lieu cac dai ly thang 11 vao cho thang 12 thi se tinh duoc
              and outl.amvs_data_date = add_months(trunc(valRecordDate, 'YYYY'), 10);
          commit;
          dbms_stats.gather_table_stats(null, 'la_vietstar_amvs_2012', cascade => true);
      end;

      procedure list_amvs_fyp(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;
          /*
          Update by: Le Khac Chinh Ban PTUD
          Version: 1.7.5.121221
          Note:  Fix lai chuong trinh theo yeu cau: #94667 cua phong PTDL
                    Can phai gather lai thi moi chay khong bi treo, neu khong gather lai se chay bi treo
          */
          dbms_stats.gather_table_stats(null, 'la_vietstar_amvs_2012', cascade => true);
          dbms_stats.gather_table_stats(null, 'la_vietstar_trans_2012', cascade => true);

          /*Lay tat ca cac giao dich theo ngay thang giong o ben tren kia cho no*/
          /*Group by theo thang de tinh dung cho no theo tung dai ly trong ban do */
          merge
              into ams.la_vietstar_amvs_2012 o
          using
              (
                  select
                      tmp.outlet_id,
                      trunc(tmp.transaction_date, 'MM') amvs_data_date,
                      sum(nvl(tmp.transaction_fyp, 0)) index_number
                  from ams.la_vietstar_trans_2012 tmp
                  where tmp.record_date = trunc(valRecordDate, 'YYYY')
                      and tmp.transaction_date < trunc(valRecordDate, 'MM')
                  group by tmp.outlet_id,
                      trunc(tmp.transaction_date, 'MM')
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.amvs_be_executing
              and
              upd.amvs_data_date = o.amvs_data_date
              and
              upd.outlet_id = o.outlet_id
              )
          when matched then
              update
              set
                  o.amvs_fyp = upd.index_number,
                  o.update_datetime = sysdate;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2013', 'list_amvs_fyp 1');
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          --Cho nay neu ma chay vao thang 11 thi no se lay duoc cho minh tat ca
          --cac FYP cua cac giao dich tu ngay 1/12 den 12/12 o day
          --va no cho vao giao dich thang 11/2013 cho no
          --Nhu vay la  tong cong giao dich o day la tu ngay dau cho den ngay chay o giao dich transaction day nhe
          --chu khong phai la tat ca dau nhe
          --FYP tu ngay 1/1 cho den ngay chay cai transaction do day nhe...
          --Chi co the tra cuu cho no la nhu the thi se dung duoc day nhe

          --vay la khi tim kiem thi DEN NGAY la ngay chay cai transaction day nhe

          merge
              into ams.la_vietstar_amvs_2012 o
          using
              (
                  select
                      tmp.outlet_id,
                      trunc(valRecordDate, 'MM') amvs_data_date,
                      sum(nvl(tmp.transaction_fyp, 0)) index_number
                  from ams.la_vietstar_trans_2012 tmp
                  where tmp.record_date = trunc(valRecordDate, 'YYYY')
                      and tmp.transaction_date >= trunc(valRecordDate, 'MM')
                  group by tmp.outlet_id
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.amvs_be_executing
              and/* >>>>>>>>Dieu kien nhom theo cai nay*/
              upd.amvs_data_date = o.amvs_data_date
              and
              upd.outlet_id = o.outlet_id
              )
          when matched then
              update
              set
                  o.amvs_fyp = upd.index_number,
                  o.update_datetime = sysdate;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2013', 'list_amvs_fyp 2');
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          /*tinh tong vao va cho vao trong bang chinh cho no*/

          for list_agency in
          (
              select
                  v.outlet_id,
                  v.amvs_outlet_id,
                  v.amvs_branch_id,
                  v.amvs_effective_date
              from ams.la_vietstar_outlet_2012 v
              where v.record_date = trunc(valRecordDate, 'YYYY')
                  and v.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
                  and v.amvs_be_paid = ams.life_agency_CODE.OUTLET_PAID_YES
                  and v.amvs_be_executing = ams.life_agency_CODE.OUTLET_EXECUTING_YES
                  and v.amvs_branch_id is not null
          )
          loop
              merge
                  into ams.la_vietstar_outlet_2012 o
              using
                  (
                      select
                          tmp.amvs_outlet_id outlet_id,
                          sum(nvl(tmp.amvs_fyp, 0)) index_number
                      from ams.la_vietstar_amvs_2012 tmp
                      where tmp.record_date = trunc(valRecordDate, 'YYYY')
                          and tmp.amvs_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                          and tmp.amvs_be_paid = ams.LIFE_AGENCY_CODE.OUTLET_PAID_OTHER
                          --khong tinh FYP cua Truong ban
                          and tmp.outlet_id <> tmp.amvs_outlet_id
                          and tmp.amvs_outlet_id =  list_agency.amvs_outlet_id
                      group by tmp.amvs_outlet_id
                  ) upd
              on (
                  trunc(valRecordDate, 'YYYY') = o.record_date
                  and
                  ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE = o.type_code
                  and
                  ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.amvs_be_executing
                  and
                  list_agency.amvs_outlet_id = o.outlet_id
                  )
              when matched then
                  update
                  set
                      o.amvs_fyp = upd.index_number,
                      o.update_datetime = sysdate;
              commit;
          end loop;
          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2013', 'list_amvs_fyp 3');
      end;

      /*Tinh cho dai ly thu phi */
      procedure upload_coll_prepare(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          execute immediate 'truncate table ams.la_vietstar_branch_tmp';
          execute immediate 'truncate table ams.la_vietstar_branch_am_tmp';
          commit;

          /*Du lieu truong nhom*/
          insert /*+ APPEND */ into ams.la_vietstar_branch_tmp nologging
          (
              outlet_id,
              cumv_outlet_id,
              cumv_branch_id,
              cumv_effective_date
          )
          select /*+ CARDINALITY(tmp, 100)*/
              tmp.outlet_id,
              tmp.outlet_id,
              tmp.unit_id,
              ams.life_agency_agent.positions_date(trunc(valRecordDate, 'MM'), tmp.outlet_id)
          from ams.la_vietstar_outlet_2012 tmp
          where tmp.record_date = trunc(valRecordDate, 'YYYY')
              and tmp.be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
              and tmp.unit_id is not null
              and tmp.position_code in (
                  ams.LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_UM,
                  ams.LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_CUM
              );
          commit;

          /*Du lieu truong ban*/
          insert /*+ APPEND */ into ams.la_vietstar_branch_am_tmp nologging
          (
              outlet_id,
              cumv_outlet_id,
              cumv_branch_id,
              cumv_effective_date
          )
          select /*+ CARDINALITY(tmp, 100)*/
              tmp.outlet_id,
              tmp.outlet_id,
              tmp.agency_id,
              ams.life_agency_agent.positions_date(trunc(valRecordDate, 'MM'), tmp.outlet_id)
          from ams.la_vietstar_outlet_2012 tmp
          where tmp.record_date = trunc(valRecordDate, 'YYYY')
              and tmp.be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
              and tmp.agency_id is not null
              and tmp.position_code = ams.LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_AM;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2012', 'upload_coll 2');
      end;
      procedure upload_coll(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2013', 'upload_coll');

          execute immediate 'truncate table ams.la_vietstar_coll';
          commit;
          /*Tinh cho dai ly thu phi
          Tinh so lieu cho ca 10 thang luon
          chi lay cac dai ly con lam viec cho den cuoi thang
          khong duoc boi vi tinh ca so lieu cua dai ly con lam viec cho den cuoi thang nua
          can phai tinh ca dai ly da nghi viec vao day*/
          for i in 0..10
          loop
              ams.life_agency_log.time_begin;
              insert /*+ APPEND */ into ams.la_vietstar_coll nologging(
                outlet_id,
                record_date,
                version_date,
                update_datetime,
                outlet_number,
                outlet_name,
                company_id,
                company_name,
                office_id,
                office_name,
                agency_id,
                agency_name,
                unit_id,
                unit_name,
                coll_be_paid,
                coll_be_executing,
                coll_data_date,
                coll_fyp,
                coll_numb_of_poli,
                coll_coll_prem,
                coll_real_prem,
                coll_coll_rate,
                coll_cont_mang,
                coll_cont_canc,
                coll_pers_rate,
                coll_effective_date
              )
              select
                  outl.outlet_id,
                  trunc(valRecordDate, 'YYYY'),
                  trunc(sysdate, 'DD'),
                  sysdate,
                  outl.outlet_ams_id,
                  outl.outlet_name,
                  outl.company_id,
                  outl.company_name,
                  outl.office_id,
                  outl.office_name,
                  outl.sales_agency_id,
                  outl.agency_name,
                  outl.sales_unit_id,
                  outl.unit_name,
                  ams.LIFE_AGENCY_CODE.OUTLET_PAID_OTHER,
                  ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES,
                  add_months(trunc(valRecordDate, 'YYYY'), i),
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null
              from
              (
                  select
                      outl.outlet_id,
                      outl.status_code,
                      outl.outlet_ams_id,
                      outl.outlet_name,
                      outl.position_code,
                      outl.position_date,
                      outl.effective_date,
                      outl.terminative_date,
                      outl.company_id,
                      outl.company_name,
                      outl.office_id,
                      outl.office_name,
                      outl.agency_id sales_agency_id,
                      outl.agency_name,
                      outl.unit_id sales_unit_id,
                      outl.unit_name
                  from ams.la_vietstar_temp_outlet outl
                  where outl.record_date = add_months(trunc(valRecordDate, 'YYYY'), i)
                      and outl.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
                      --lay so lieu ke ca da nghi viec o day de cho no duoc so lieu theo dung voi yeu cau
              ) outl;
              commit;
          end loop;

          /*
          Update by: Le Khac Chinh Ban PTUD
          Version: 1.7.5.121220
          Note:  Fix lai chuong trinh theo yeu cau: #94667 cua phong PTDL
                    Them vao bang la_vietstar_coll  du lieu thang 12 nam 2013 danh sach dai ly cua cac nhom
                    De tu do co the tinh them FYP KTM trong thoi gian tu 1/12/2013 den 12/12/2013 cho chinh xac
          */
          insert /*+ APPEND */ into ams.la_vietstar_coll nologging(
            outlet_id,
            record_date,
            version_date,
            update_datetime,
            outlet_number,
            outlet_name,
            company_id,
            company_name,
            office_id,
            office_name,
            agency_id,
            agency_name,
            unit_id,
            unit_name,
            coll_be_paid,
            coll_be_executing,
            coll_data_date,
            coll_fyp,
            coll_numb_of_poli,
            coll_coll_prem,
            coll_real_prem,
            coll_coll_rate,
            coll_cont_mang,
            coll_cont_canc,
            coll_pers_rate,
            coll_effective_date
          )
          select
              outl.outlet_id,
              trunc(valRecordDate, 'YYYY'),
              trunc(sysdate, 'DD'),
              sysdate,
              outl.outlet_number,
              outl.outlet_name,
              outl.company_id,
              outl.company_name,
              outl.office_id,
              outl.office_name,
              outl.agency_id,
              outl.agency_name,
              outl.unit_id,
              outl.unit_name,
              ams.LIFE_AGENCY_CODE.OUTLET_PAID_OTHER,
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES,
              add_months(trunc(valRecordDate, 'YYYY'), 11), --data_date la thang 12
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null
          from ams.la_vietstar_coll outl
          where outl.record_date = trunc(valRecordDate, 'YYYY')
              and outl.coll_data_date = add_months(trunc(valRecordDate, 'YYYY'), 10); --lay du lieu cua thang 11 boi vi chi lay danh sach cac dai ly cua thang 11 nam 2013 co hop dong PH tu 1/12 den 12/12
          commit;

          /*Cap nhat ngay hieu luc thanh lap nhom
          */
          merge /*+ CARDINALITY(o, 100)
                    CARDINALITY(upd, 100)
                    LEADING(o upd) */
              into ams.la_vietstar_coll o
          using
              (
                  select /*+ CARDINALITY(tmp, 100)*/
                      tmp.outlet_id,
                      tmp.cumv_outlet_id,
                      tmp.cumv_branch_id,
                      tmp.cumv_effective_date
                  from ams.la_vietstar_branch_tmp tmp
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.coll_be_executing
              /*Cap nhat cho cac dai ly no la thuoc 1 nhom truoc da*/
              and
              upd.cumv_branch_id = o.unit_id
              and /*nhom khong bi null*/
              o.unit_id is not null
              )
          when matched then
              update
              set
                  o.coll_effective_date = upd.cumv_effective_date;
          commit;

          /*Cap nhat ngay hieu luc thanh lap nhom voi nhom truc tiep cua truong ban
          */
          merge /*+ CARDINALITY(o, 100)
                    CARDINALITY(upd, 100)
                    LEADING(o upd) */
              into ams.la_vietstar_coll o
          using
              (
                  select /*+ CARDINALITY(tmp, 100)*/
                      tmp.outlet_id,
                      tmp.cumv_outlet_id,
                      tmp.cumv_branch_id,
                      tmp.cumv_effective_date
                  from ams.la_vietstar_branch_am_tmp tmp
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.coll_be_executing
              /*Cap nhat cho cac dai ly no la thuoc 1 nhom truoc da*/
              and
              upd.cumv_branch_id = o.agency_id
              and /*nhom la null tuc thuoc nhom truc tiep cua ban*/
              o.unit_id is null
              )
          when matched then
              update
              set
                  o.coll_effective_date = upd.cumv_effective_date;
          commit;

          /*
          Update by: Le Khac Chinh Ban PTUD
          Version: 1.7.5.121220
          Note:  Fix lai chuong trinh theo yeu cau: #94667 cua phong PTDL
                    Can phai gather lai bang la_vietstar_coll de chay khong bi treo
          */
          dbms_stats.gather_table_stats(null, 'la_vietstar_coll', cascade => true);

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2012', 'upload_coll 2');
      end;

      procedure list_coll_fyp(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;
          /*Tong hop so lieu FYP theo tung thang vao cho no*/
          merge
              into ams.la_vietstar_coll o
          using
              (
                  select
                      tmp.outlet_id,
                      trunc(tmp.transaction_date, 'MM') coll_data_date,
                      sum(nvl(tmp.transaction_fyp, 0)) index_number
                  from ams.la_vietstar_trans_2012 tmp
                  where tmp.record_date = trunc(valRecordDate, 'YYYY')
                      and tmp.transaction_date < trunc(valRecordDate, 'MM')
                  group by tmp.outlet_id,
                      trunc(tmp.transaction_date, 'MM')
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.coll_be_executing
              and
              upd.coll_data_date = o.coll_data_date
              and
              upd.outlet_id = o.outlet_id
              )
          when matched then
              update
              set
                  o.coll_fyp = upd.index_number,
                  o.update_datetime = sysdate;
          commit;

          merge
              into ams.la_vietstar_coll o
          using
              (
                  select
                      tmp.outlet_id,
                      trunc(valRecordDate, 'MM') coll_data_date,
                      sum(nvl(tmp.transaction_fyp, 0)) index_number
                  from ams.la_vietstar_trans_2012 tmp
                  where tmp.record_date = trunc(valRecordDate, 'YYYY')
                      and tmp.transaction_date >= trunc(valRecordDate, 'MM')
                  group by tmp.outlet_id
              ) upd
          on (/*
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.coll_be_executing
              and*/
              upd.coll_data_date = o.coll_data_date
              and
              upd.outlet_id = o.outlet_id
              )
          when matched then
              update
              set
                  o.coll_fyp = upd.index_number,
                  o.update_datetime = sysdate;
          commit;
          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2012', 'list_coll_fyp');
      end;
      --tinh ra so luong hop dong quan ly KHONG phai la 36 thang
      procedure list_coll_numb_of_poli(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          dbms_stats.gather_table_stats(null, 'la_outlet_index', cascade => true);

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2012', 'gather_table_stats la_outlet_index');
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          --moi thay doi lai mot chut de kiem tra cho tot hon
          --them 1 vai cai HINT cho no chay tot hon
          merge /*+ CARDINALITY(o, 100)
                    CARDINALITY(upd, 100)
                    LEADING(o upd) */
              into ams.la_vietstar_coll o
          using
              (
                  select /*+ CARDINALITY(i, 100) */
                      i.outlet_id,
                      i.record_date coll_data_date,
                      i.index_number
                  from ams.la_outlet_index i
                  where i.record_date between trunc(valRecordDate, 'YYYY') and add_months(trunc(valRecordDate, 'YYYY'), 10)
                      and i.type_code = 'POLI_MANA'
                      and i.request_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.coll_be_executing
              and
              upd.outlet_id = o.outlet_id
              and
              upd.coll_data_date = o.coll_data_date
              )
          when matched then
              update
              set
                  o.coll_numb_of_poli = upd.index_number,
                  o.update_datetime = sysdate;
          commit;
          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2012', 'list_coll_numb_of_poli');
      end;
      --Test = script tren production OK
      procedure list_coll_coll_prem(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          merge /*+ CARDINALITY(o, 100)
                    CARDINALITY(upd, 100)
                    LEADING(o upd) */
              into ams.la_vietstar_coll o
          using
              (
                  select/*+ CARDINALITY(i, 100) */
                      i.agent_id outlet_id,
                      i.record_date coll_data_date,
                      i.index_value_number index_number
                  from ams.la_index i
                  where i.record_date between trunc(valRecordDate, 'YYYY') and add_months(trunc(valRecordDate, 'YYYY'), 10)
                      and i.index_code = 'COLL_PREM'
                      and i.group_code = 'COLL'
                      and i.category_code = 'INDX'
                      and i.time_frequency = 'MONTHLY'
                      and i.type_data = 'OUTL'
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.coll_be_executing
              and
              upd.outlet_id = o.outlet_id
              and
              upd.coll_data_date = o.coll_data_date
              )
          when matched then
              update
              set
                  o.coll_coll_prem = upd.index_number,
                  o.update_datetime = sysdate;
          commit;
          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2012', 'list_coll_coll_prem');
      end;
      --Test = script tren production OK
      procedure list_coll_real_prem(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          merge
              into ams.la_vietstar_coll o
          using
              (
                  select
                      i.agent_id outlet_id,
                      i.record_date coll_data_date,
                      i.index_value_number index_number
                  from ams.la_index i
                  where i.record_date between trunc(valRecordDate, 'YYYY') and add_months(trunc(valRecordDate, 'YYYY'), 10)
                      and i.index_code = 'REAL_PREM'
                      and i.group_code = 'COLL'
                      and i.category_code = 'INDX'
                      and i.time_frequency = 'MONTHLY'
                      and i.type_data = 'OUTL'
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.coll_be_executing
              and
              upd.outlet_id = o.outlet_id
              and
              upd.coll_data_date = o.coll_data_date
              )
          when matched then
              update
              set
                  o.coll_real_prem = upd.index_number,
                  o.update_datetime = sysdate;
          commit;
          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2012', 'list_coll_real_prem');
      end;

     --cho nay tuy rang co lam nhung ma khong su dung boi vi no cong don cac cai vao cho no
      procedure list_coll_rate(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;
          --neu ma no <= 100% thi cap nhat vao cho dung nhu the
          merge
              into ams.la_vietstar_coll o
          using
              (   --cho nay do lay so lieu cho no nen la neu ma ty le > 100 thi se cho la 100 cho no dep
                  select
                      i.agent_id outlet_id,
                      i.record_date coll_data_date,
                      i.index_value_number index_number
                  from ams.la_index i
                  where i.record_date between trunc(valRecordDate, 'YYYY') and add_months(trunc(valRecordDate, 'YYYY'), 10)
                      and i.index_code = 'COLL_RATE'
                      and i.group_code = 'COLL'
                      and i.category_code = 'INDX'
                      and i.time_frequency = 'MONTHLY'
                      and i.type_data = 'OUTL'
                      and i.index_value_number <= 100
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.coll_be_executing
              and
              upd.outlet_id = o.outlet_id
              and
              upd.coll_data_date = o.coll_data_date
              )
          when matched then
              update
              set
                  o.coll_coll_rate = upd.index_number,
                  o.update_datetime = sysdate;
          commit;

          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;
          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2012', 'list_coll_rate: 1');


          merge  /*+ CARDINALITY(o, 100)
                    CARDINALITY(upd, 100)
                    LEADING(o upd) */
              into ams.la_vietstar_coll o
          using
              (   --cho nay do lay so lieu cho no nen la neu ma ty le > 100 thi se cho la 100 cho no dep
                  --thi cap nhat cho no la 100 luon cho no cho ty le no dep luon nhe
                  select  /*+ CARDINALITY(i, 100) */
                      i.agent_id outlet_id,
                      i.record_date coll_data_date,
                      100 index_number
                  from ams.la_index i
                  where i.record_date between trunc(valRecordDate, 'YYYY') and add_months(trunc(valRecordDate, 'YYYY'), 10)
                      and i.index_code = 'COLL_RATE'
                      and i.group_code = 'COLL'
                      and i.category_code = 'INDX'
                      and i.time_frequency = 'MONTHLY'
                      and i.type_data = 'OUTL'
                      and i.index_value_number > 100
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.coll_be_executing
              and
              upd.outlet_id = o.outlet_id
              and
              upd.coll_data_date = o.coll_data_date
              )
          when matched then
              update
              set
                  o.coll_coll_rate = upd.index_number,
                  o.update_datetime = sysdate;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2012', 'list_coll_rate');
      end;

      procedure list_coll_cont_mang(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          merge
              into ams.la_vietstar_coll o
          using
              (
                  select
                      i.outlet_id,
                      i.record_date coll_data_date,
                      i.index_number
                  from ams.la_outlet_index i
                  where i.record_date between trunc(valRecordDate, 'YYYY') and add_months(trunc(valRecordDate, 'YYYY'), 10)
                      and i.type_code = 'CONT_MANA'
                      and i.request_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.coll_be_executing
              and
              upd.outlet_id = o.outlet_id
              and
              upd.coll_data_date = o.coll_data_date
              )
          when matched then
              update
              set
                  o.coll_cont_mang = upd.index_number,
                  o.update_datetime = sysdate;
          commit;
          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2012', 'list_coll_cont_mang');
      end;
      /*So luong hop dong huy bo de tinh ra ty le duy tri */
      procedure list_coll_cont_canc(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          merge
              into ams.la_vietstar_coll o
          using
              (
                  select
                      i.outlet_id,
                      i.record_date coll_data_date,
                      i.index_number
                  from ams.la_outlet_index i
                  where i.record_date between trunc(valRecordDate, 'YYYY') and add_months(trunc(valRecordDate, 'YYYY'), 10)
                      and i.type_code = 'CONT_TERM'
                      and i.request_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.coll_be_executing
              and
              upd.outlet_id = o.outlet_id
              and
              upd.coll_data_date = o.coll_data_date
              )
          when matched then
              update
              set
                  o.coll_cont_canc = upd.index_number,
                  o.update_datetime = sysdate;
          commit;
          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2012', 'list_coll_cont_canc');
      end;

      procedure upload_cagv(valRecordDate date := null)
      is
         pv_end_date date := last_day(valRecordDate);
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          update ams.la_vietstar_outlet_2012 o
          set
              o.cagv_be_paid = ams.LIFE_AGENCY_CODE.OUTLET_PAID_YES,
              o.cagv_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES,
              o.cagv_fyp = 0,
              o.cagv_coll_rate_avrg = 0,
              o.cagv_pers_rate_avrg = 0,
              o.cagv_numb_of_poli = 0,
              o.update_datetime = sysdate
          where o.record_date = trunc(valRecordDate, 'YYYY')
              and o.be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES;
          commit;

          ams.LIFE_AGENCY_VIETSTAR_2013.list_cumv_clear_temp;
          insert /*+ APPEND */ into ams.la_vietstar_index_tmp nologging
          (
              branch_id,
              index_number
          )
          select  /*+ CARDINALITY(tmp, 100) */
              temp.agent_id outlet_id,
              1 as index_number
          from ams.la_history_agent temp
          where temp.type_code = 'OUTLET_TYPE_CODE'
              --den cuoi thang tinh thi no van la dai ly chuyen thu
              and pv_end_date >= temp.from_date
              and pv_end_date < nvl(temp.to_date, '1-jan-2099')
              and temp.history_value  =  'CNTH';  --no phai la dai ly chuyen nghiep tong hop thi moi tinh la dai ly chuyen thu
          commit;

          --cap nhat them la den cuoi thang tinh day no co phai la
          --dai ly chuyen thu hay khong thi moi tinh cho no
          merge /*+ CARDINALITY(o, 100)
                    CARDINALITY(upd, 100)
                    LEADING(o upd) */
              into ams.la_vietstar_outlet_2012 o
          using
              (
                  select  /*+ CARDINALITY(tmp, 100)*/
                      tmp.branch_id outlet_id,
                      tmp.index_number
                  from ams.la_vietstar_index_tmp tmp
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE = o.type_code
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.cagv_be_executing
              and
              upd.outlet_id = o.outlet_id
              )
          when matched then
              update
              set
                  o.cagv_is_coll = upd.index_number,
                  o.update_datetime = sysdate;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2012', 'upload_cagv');
      end;

      procedure list_cagv_temp(valRecordDate date := null)
      is
      begin
          null;
      end;

      procedure list_cagv_fyp(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          update ams.la_vietstar_outlet_2012 o
          set
              --cho nay phai cong tong cong cua ca 2 phan nua vao thi moi dung duoc
              o.cagv_fyp = (nvl(o.psvs_fyp, 0) + nvl(o.psvs_fyp_ex, 0)),
              o.update_datetime = sysdate
          where o.record_date = trunc(valRecordDate, 'YYYY')
              and o.cagv_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES;
          commit;
          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2012', 'list_cagv_fyp');
      end;

      --Test = script tren production OK da OK roi day nhe
      procedure list_cagv_numb_of_poli(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;
          /*Lay ra so luong so luong quan ly trung binh cua tung thang cho dai ly chuyen thu*/

         --merge vao bang chinh cho no
          merge  /*+ CARDINALITY(o, 100)
                    CARDINALITY(upd, 100)
                    LEADING(o upd) */
              into ams.la_vietstar_outlet_2012 o
          using
              (
                  select /*+ CARDINALITY(v, 100) */
                      v.outlet_id,
                      round(
                          decode(
                              count(v.outlet_id), 0, 0,
                              (sum(nvl(v.coll_numb_of_poli, 0)) / count(v.outlet_id)))
                          , 2) index_number
                  from ams.la_vietstar_coll v
                  where v.record_date = trunc(valRecordDate, 'YYYY')
                      and v.coll_data_date between trunc(valRecordDate, 'YYYY') and add_months(trunc(valRecordDate, 'YYYY'), 10)
                      and v.coll_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                  group by v.outlet_id
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = o.record_date
              /*and
              ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE = o.type_code
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.cagv_be_executing*/
              and
              upd.outlet_id = o.outlet_id
              )
          when matched then
              update
              set
                  o.cagv_numb_of_poli = upd.index_number,
                  o.update_datetime = sysdate;
          commit;
          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2012', 'list_cagv_numb_of_poli');
      end;

      /*Tinh ra so phi phai thu cua ca 11 thang tinh den cuoi thang do*/
      procedure list_cagv_coll_prem(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          --lay so lieu cua tung thang vao cho no nhe
          merge
              into ams.la_vietstar_outlet_2012 o
          using
              (
                  select
                      v.outlet_id,
                      sum(nvl(v.coll_coll_prem, 0)) index_number
                  from ams.la_vietstar_coll v
                  where v.record_date = trunc(valRecordDate, 'YYYY')
                      and v.coll_data_date between trunc(valRecordDate, 'YYYY') and add_months(trunc(valRecordDate, 'YYYY'), 10)
                      and v.coll_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                  group by v.outlet_id
              ) upd
          on (/*
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE = o.type_code
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.cagv_be_executing
              and*/
              upd.outlet_id = o.outlet_id
              )
          when matched then
              update
              set
                  o.cagv_coll_prem = upd.index_number,
                  o.update_datetime = sysdate;
          commit;
          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2012', 'list_cagv_coll_prem');
      end;
      /*Tinh ra so phi thuc thu cua ca 11 thang tinh den cuoi thang do*/
      --Test = script tren production OK
      procedure list_cagv_real_prem(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          merge
              into ams.la_vietstar_outlet_2012 o
          using
              (
                  select
                      v.outlet_id,
                      sum(nvl(v.coll_real_prem, 0)) index_number
                  from ams.la_vietstar_coll v
                  where v.record_date = trunc(valRecordDate, 'YYYY')
                      and v.coll_data_date between trunc(valRecordDate, 'YYYY') and add_months(trunc(valRecordDate, 'YYYY'), 10)
                      and v.coll_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                  group by v.outlet_id
              ) upd
          on (/*
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE = o.type_code
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.cagv_be_executing
              and*/
              upd.outlet_id = o.outlet_id
              )
          when matched then
              update
              set
                  o.cagv_real_prem = upd.index_number,
                  o.update_datetime = sysdate;
          commit;
          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2012', 'list_cagv_real_prem');
      end;
      /*Tinh ra ty le thu phi tinh den cuoi thang do*/
      procedure list_cagv_coll_rate(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          update ams.la_vietstar_outlet_2012 o
          set
              o.cagv_coll_rate_avrg = decode(
                  nvl(o.cagv_coll_prem, 0), 0, 100,
                  nvl(o.cagv_real_prem, 0) / nvl(o.cagv_coll_prem, 0) * 100),
              o.update_datetime = sysdate
          where o.record_date = trunc(valRecordDate, 'YYYY')
              and o.cagv_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES;
          commit;

          --cho nay nen cap nhat lai ty le thu phi neu > 100 thi se cap nhat cho no la 100
          update ams.la_vietstar_outlet_2012 o
          set
              o.cagv_coll_rate_avrg = 100,
              o.update_datetime = sysdate
          where o.record_date = trunc(valRecordDate, 'YYYY')
              and o.cagv_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
              and o.cagv_coll_rate_avrg > 100;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2012', 'list_cagv_coll_rate');
      end;
      --Tinh ra so luong HD quan ly
      --Test = script tren production OK
      procedure list_cagv_cont_mang(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          merge
              into ams.la_vietstar_outlet_2012 o
          using
              (
                  select
                      v.outlet_id,
                      sum(nvl(v.coll_cont_mang, 0)) index_number
                  from ams.la_vietstar_coll v
                  where v.record_date = trunc(valRecordDate, 'YYYY')
                      and v.coll_data_date between trunc(valRecordDate, 'YYYY') and add_months(trunc(valRecordDate, 'YYYY'), 10)
                      and v.coll_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                  group by v.outlet_id
              ) upd
          on (/*
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE = o.type_code
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.cagv_be_executing
              and*/
              upd.outlet_id = o.outlet_id
              )
          when matched then
              update
              set
                  o.cagv_cont_mang = upd.index_number,
                  o.update_datetime = sysdate;
          commit;
          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2012', 'list_cagv_cont_mang');
      end;

      --Tinh ra so luong HD huy bo
      --Test = script tren production OK
      procedure list_cagv_cont_canc(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          merge
              into ams.la_vietstar_outlet_2012 o
          using
              (
                  select
                      v.outlet_id,
                      sum(nvl(v.coll_cont_canc, 0)) index_number
                  from ams.la_vietstar_coll v
                  where v.record_date = trunc(valRecordDate, 'YYYY')
                      and v.coll_data_date between trunc(valRecordDate, 'YYYY') and add_months(trunc(valRecordDate, 'YYYY'), 10)
                      and v.coll_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                  group by v.outlet_id
              ) upd
          on (/*
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE = o.type_code
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.cagv_be_executing
              and*/
              upd.outlet_id = o.outlet_id
              )
          when matched then
              update
              set
                  o.cagv_cont_canc = upd.index_number,
                  o.update_datetime = sysdate;
          commit;
          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2012', 'list_cagv_cont_canc');
      end;
      --Tinh ra ty le duy tri cua no
      procedure list_cagv_pers_rate(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          update ams.la_vietstar_outlet_2012 o
          set
              o.cagv_pers_rate_avrg = decode(
                  nvl(o.cagv_cont_mang, 0), 0, 100,
                  (nvl(o.cagv_cont_mang, 0) - nvl(o.cagv_cont_canc, 0)) / nvl(o.cagv_cont_mang, 0) * 100),
              o.update_datetime = sysdate
          where o.record_date = trunc(valRecordDate, 'YYYY')
              and o.cagv_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES;
          commit;
          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2012', 'list_cagv_pers_rate');
      end;

      procedure upload_cumv(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          update ams.la_vietstar_outlet_2012 o
          set
              o.cumv_be_paid = ams.LIFE_AGENCY_CODE.OUTLET_PAID_YES,
              o.cumv_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES,
              o.cumv_effective_date = ams.LIFE_AGENCY_agent.positions_date(trunc(valRecordDate, 'MM'), o.outlet_id),
              o.cumv_outlet_id = o.outlet_id,
              o.cumv_branch_id = o.unit_id,
              o.cumv_root_fyp = 0,
              o.cumv_real_prem_avrg = 0,
              o.cumv_coll_rate_avrg = 0,
              o.cumv_pers_rate_avrg = 0,
              o.cumv_numb_of_agnt = 0,
              o.update_datetime = sysdate
          where o.record_date = trunc(valRecordDate, 'YYYY')
              and o.be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
              and o.position_code
                  in (ams.LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_UM,
                      ams.LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_CUM);
          commit;


          update ams.la_vietstar_outlet_2012 o
          set
              o.cumv_be_paid = ams.LIFE_AGENCY_CODE.OUTLET_PAID_YES,
              o.cumv_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES,
              o.cumv_effective_date = ams.LIFE_AGENCY_agent.positions_date(trunc(valRecordDate, 'MM'), o.outlet_id),
              o.cumv_outlet_id = o.outlet_id,
              o.cumv_branch_id = o.agency_id,
              o.cumv_root_fyp = 0,
              o.cumv_real_prem_avrg = 0,
              o.cumv_coll_rate_avrg = 0,
              o.cumv_pers_rate_avrg = 0,
              o.cumv_numb_of_agnt = 0,
              o.update_datetime = sysdate
          where o.record_date = trunc(valRecordDate, 'YYYY')
              and o.be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
              and o.position_code in (
                  ams.LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_AM
              );
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2012', 'upload_cumv');
      end;

      procedure list_cumv_temp(valRecordDate date := null)
      is
      begin
          null;
      end;

      procedure list_cumv_clear_temp
      is
      begin
          execute immediate 'truncate table ams.la_vietstar_index_tmp';
          commit;
      end;

    /*
        Creater: Le Khac Chinh
        Date Create: 1/6/2013
        Version: 1.0
        Description: Thuc hien cap nhat du lieu cua FYP cua nhom goc
        Parameter:
            valRecordDate [date]: Thang chay

        Update:  Le Khac Chinh
            Version: 1.1
            Date Updated: 3/7/2013
            Note:  Fix lai chuong trinh theo yeu cau: #108107 cua BA
                      Cap nhat lai FYP nhom goc cua Truong nhom khi tinh thi dua danh cho Truong nhom CNTH
                      bang dung voi FYP nhom goc cua Truong nhom Kinh doanh
    */
      procedure list_cumv_fyp(valRecordDate date := null)
      is
      begin
          /*cap nhat lai gia tri lay tu Truong nhom Kinh doanh*/
          update ams.la_vietstar_outlet_2012 o
          set o.cumv_root_fyp = nvl(o.umvs_root_fyp, 0)
          where o.record_date = trunc(valRecordDate, 'YYYY')
              and o.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
              and o.cumv_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES;
          commit;
      end;

    /*
        Creater: Le Khac Chinh
        Date Create: 1/6/2013
        Version: 1.0
        Description: Thuc hien cap nhat du lieu cua FYP thuong
        Parameter:
            valRecordDate [date]: Thang chay

        Update:  Le Khac Chinh
            Version: 1.1
            Date Updated: 3/7/2013
            Note: Bo cac comment khong can thiet
    */
      procedure list_cumv_fyp_bonus(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;
          merge
              into ams.la_vietstar_outlet_2012 o
          using
              (   --cho nay chi lay danh sach cac nhom ma co nhom duoc phat trien tu nhom day thi moi dung duoc cho no con khong thi la sai khong lay
                   --lay theo devu_branch_id thi moi co the dung duoc cho no
                  select /*+ CARDINALITY(tmp, 100)*/
                      tmp.outl_level,
                      tmp.outl_branch_id,
                      tmp.devu_branch_id cumv_branch_id,
                      tmp.devu_bonus_fyp index_number
                  from ams.la_vietstar_temp_devu_des tmp
                  where nvl(tmp.devu_bonus_fyp, 0) > 0
                  --dieu kien nay la dam bao rang chi can lay nhung ban nhom duoc thuong vao cho no duoc dung roi
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE = o.type_code
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.cumv_be_executing
              and
              upd.cumv_branch_id = o.cumv_branch_id
              )
          when matched then
              update
              set --ghi vao cot cumv_bonus_fyp
                  o.cumv_bonus_fyp = nvl(upd.index_number, 0),
                  o.update_datetime = sysdate;
          commit;
          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2012', 'list_cumv_fyp_bonus 1');
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          /*ty le dieu kien cua FYP va tuyen dung moi neu co ban nhom tach ra
          sau khi da tinh xong thi se lay so lieu vao bang chinh cho no
          cap nhat so lieu vao bang tinh cho no*/

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2012', 'list_cumv_fyp_bonus 2');
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          /*cap nhat gia tri FYP thuc te tuc la tinh ca phan cong them vao cho no*/
          update ams.la_vietstar_outlet_2012 o
          set o.cumv_fyp = nvl(o.cumv_root_fyp, 0) +
                                      nvl(o.cumv_bonus_fyp, 0),
              o.update_datetime = sysdate
          where o.record_date = trunc(valRecordDate, 'YYYY')
              and o.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
              and o.cumv_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES;
          commit;
          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2012', 'list_cumv_fyp_bonus 4');
      end;

      --Cho nay se lay duoc ca dai ly nghi viec vao cho no o day nhe
      procedure list_cumv_coll_prem(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          ams.LIFE_AGENCY_VIETSTAR_2013.list_cumv_clear_temp;

          insert /*+ APPEND */ into ams.la_vietstar_index_tmp nologging
          (
              branch_id,
              index_number
          )
          select /*+ CARDINALITY(cumv, 100) CARDINALITY(coll, 100)*/
              cumv.cumv_branch_id,
              sum(nvl(coll.index_number, 0))
          from
          (   /*lay du lieu tu bang tam*/
              select /*+ CARDINALITY(tmp, 100)*/
                  tmp.outlet_id,
                  tmp.cumv_outlet_id,
                  tmp.cumv_branch_id,
                  tmp.cumv_effective_date
              from ams.la_vietstar_branch_tmp tmp
          ) cumv
          join
          (--cho nay se lay duoc ca cua dai ly da nghi viec vao day cho no
              select /*+ CARDINALITY(v, 100)*/
                  v.unit_id cumv_branch_id,
                  v.coll_data_date,
                  sum(nvl(v.coll_coll_prem, 0)) index_number
              from ams.la_vietstar_coll v
              where v.record_date = trunc(valRecordDate, 'YYYY')
                  and v.coll_data_date between trunc(valRecordDate, 'YYYY') and add_months(trunc(valRecordDate, 'YYYY'), 10)
                  and v.coll_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                  and v.unit_id is not null
              group by v.unit_id,
                  v.coll_data_date
          ) coll
              on
              (
                  coll.cumv_branch_id = cumv.cumv_branch_id
                  and
                  coll.coll_data_date >= cumv.cumv_effective_date
                  /*Co tinh cua ca truong nhom*/
              )
          group by cumv.cumv_branch_id;
          commit;


          insert /*+ APPEND */ into ams.la_vietstar_index_tmp nologging
          (
              branch_id,
              index_number
          )
          select /*+ CARDINALITY(cumv, 100) CARDINALITY(coll, 100)*/
              cumv.cumv_branch_id,
              sum(nvl(coll.index_number, 0))
          from
          (   /*lay du lieu tu bang tam*/
              select /*+ CARDINALITY(tmp, 100)*/
                  tmp.outlet_id,
                  tmp.cumv_outlet_id,
                  tmp.cumv_branch_id,
                  tmp.cumv_effective_date
              from ams.la_vietstar_branch_am_tmp tmp
          ) cumv
          join
          (--cho nay se lay duoc ca cua dai ly da nghi viec vao day cho no
              select /*+ CARDINALITY(v, 100)*/
                  v.agency_id cumv_branch_id,
                  v.coll_data_date,
                  sum(nvl(v.coll_coll_prem, 0)) index_number
              from ams.la_vietstar_coll v
              where v.record_date = trunc(valRecordDate, 'YYYY')
                  and v.coll_data_date between trunc(valRecordDate, 'YYYY') and add_months(trunc(valRecordDate, 'YYYY'), 10)
                  and v.coll_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                  --chi lay thuoc nhom truc tiep cua Truong ban
                  and v.unit_id is null
                  and v.agency_id is not null
              group by v.agency_id,
                  v.coll_data_date
          ) coll
              on
              (
                  coll.cumv_branch_id = cumv.cumv_branch_id
                  and
                  coll.coll_data_date >= cumv.cumv_effective_date
                  /*Co tinh cua ca truong nhom*/
              )
          group by cumv.cumv_branch_id;
          commit;


          merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
              into ams.la_vietstar_outlet_2012 o
          using
              (
                  select  /*+ CARDINALITY(tmp, 100)*/
                      tmp.branch_id cumv_branch_id,
                      tmp.index_number
                  from ams.la_vietstar_index_tmp tmp
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE = o.type_code
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.cumv_be_executing
              and
              upd.cumv_branch_id = o.cumv_branch_id
              )
          when matched then
              update
              set
                  o.cumv_coll_prem = upd.index_number,
                  o.update_datetime = sysdate;
          commit;

          /*Xu ly luon doi voi truong nhom kinh doanh cung can phai co chi tieu nay de tinh*/
          merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
              into ams.la_vietstar_outlet_2012 o
          using
              (
                  select  /*+ CARDINALITY(tmp, 100)*/
                      tmp.branch_id cumv_branch_id,
                      tmp.index_number
                  from ams.la_vietstar_index_tmp tmp
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE = o.type_code
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.cumv_be_executing
              and
              upd.cumv_branch_id = o.umvs_branch_id
              )
          when matched then
              update
              set
                  o.umvs_coll_prem = upd.index_number,
                  o.update_datetime = sysdate;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2012', 'list_cumv_coll_prem');
      end;

      procedure list_cumv_real_prem(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          ams.LIFE_AGENCY_VIETSTAR_2013.list_cumv_clear_temp;

          insert /*+ APPEND */ into ams.la_vietstar_index_tmp nologging
          (
              branch_id,
              index_number
          )
          select /*+ CARDINALITY(cumv, 100) CARDINALITY(coll, 100)*/
              cumv.cumv_branch_id,
              sum(nvl(coll.index_number, 0))
          from
          (   /*lay du lieu tu bang tam*/
              select /*+ CARDINALITY(tmp, 100)*/
                  tmp.outlet_id,
                  tmp.cumv_outlet_id,
                  tmp.cumv_branch_id,
                  tmp.cumv_effective_date
              from ams.la_vietstar_branch_tmp tmp
          ) cumv
          join
          (--cho nay se lay duoc ca cua dai ly da nghi viec vao day cho no
              select /*+ CARDINALITY(v, 100)*/
                  v.unit_id cumv_branch_id,
                  v.coll_data_date,
                  sum(nvl(v.coll_real_prem, 0)) index_number
              from ams.la_vietstar_coll v
              where v.record_date = trunc(valRecordDate, 'YYYY')
                  and v.coll_data_date between trunc(valRecordDate, 'YYYY') and add_months(trunc(valRecordDate, 'YYYY'), 10)
                  and v.coll_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                  and v.unit_id is not null
              group by
                  v.unit_id,
                  v.coll_data_date
          ) coll
              on
              (
                  coll.cumv_branch_id = cumv.cumv_branch_id
                  and
                  coll.coll_data_date >= cumv.cumv_effective_date
                  /*Co tinh cua ca truong nhom*/
              )
          group by cumv.cumv_branch_id;
          commit;

          insert /*+ APPEND */ into ams.la_vietstar_index_tmp nologging
          (
              branch_id,
              index_number
          )
          select /*+ CARDINALITY(cumv, 100) CARDINALITY(coll, 100)*/
              cumv.cumv_branch_id,
              sum(nvl(coll.index_number, 0))
          from
          (   /*lay du lieu tu bang tam*/
              select /*+ CARDINALITY(tmp, 100)*/
                  tmp.outlet_id,
                  tmp.cumv_outlet_id,
                  tmp.cumv_branch_id,
                  tmp.cumv_effective_date
              from ams.la_vietstar_branch_am_tmp tmp
          ) cumv
          join
          (--cho nay se lay duoc ca cua dai ly da nghi viec vao day cho no
              select /*+ CARDINALITY(v, 100)*/
                  v.agency_id cumv_branch_id,
                  v.coll_data_date,
                  sum(nvl(v.coll_real_prem, 0)) index_number
              from ams.la_vietstar_coll v
              where v.record_date = trunc(valRecordDate, 'YYYY')
                  and v.coll_data_date between trunc(valRecordDate, 'YYYY') and add_months(trunc(valRecordDate, 'YYYY'), 10)
                  and v.coll_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                  --chi lay thuoc nhom truc tiep cua Truong ban
                  and v.unit_id is null
                  and v.agency_id is not null
              group by
                  v.agency_id,
                  v.coll_data_date
          ) coll
              on
              (
                  coll.cumv_branch_id = cumv.cumv_branch_id
                  and
                  coll.coll_data_date >= cumv.cumv_effective_date
                  /*Co tinh cua ca truong nhom*/
              )
          group by cumv.cumv_branch_id;
          commit;

          merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
              into ams.la_vietstar_outlet_2012 o
          using
              (
                  select  /*+ CARDINALITY(tmp, 100)*/
                      tmp.branch_id cumv_branch_id,
                      tmp.index_number
                  from ams.la_vietstar_index_tmp tmp
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE = o.type_code
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.cumv_be_executing
              and
              upd.cumv_branch_id = o.cumv_branch_id
              )
          when matched then
              update
              set
                  o.cumv_real_prem = upd.index_number,
                  o.update_datetime = sysdate;
          commit;

          /*Xu ly luon doi voi truong nhom kinh doanh cung can phai co chi tieu nay de tinh*/
          merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
              into ams.la_vietstar_outlet_2012 o
          using
              (
                  select  /*+ CARDINALITY(tmp, 100)*/
                      tmp.branch_id cumv_branch_id,
                      tmp.index_number
                  from ams.la_vietstar_index_tmp tmp
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE = o.type_code
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.cumv_be_executing
              and
              upd.cumv_branch_id = o.umvs_branch_id
              )
          when matched then
              update
              set
                  o.umvs_real_prem = upd.index_number,
                  o.update_datetime = sysdate;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2012', 'list_cumv_real_prem');
      end;
      --cho nay tinh theo phi PHAI THU khi confirm lai
      procedure list_cumv_coll_prem_avrg(valRecordDate date := null)
      is
          var_coll_prem number(18,2) := null;
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          --cho nay se xac dinh xem la trong thang truong nhom CNTH
          -- chay do- la_index co d? li?u trong thang tmnh ds khtng? dc ch?y LIMRA hay chua?
          begin
              select
                  count(*) into var_coll_prem
              from ams.la_index i
              where i.record_date = trunc(valRecordDate, 'MM')
                  and i.index_code = 'COLL_PREM'
                  and i.group_code = 'COLL'
                  and i.category_code = 'INDX'
                  and i.time_frequency = 'MONTHLY'
                  and i.type_data = 'OUTL';
          exception
              when others then
                  var_coll_prem := null;
          end;

          ams.LIFE_AGENCY_VIETSTAR_2013.list_cumv_clear_temp;

          /*neu ma so lieu bang null thi chung to
          chua chay so lieu cho no thi se tru di 1 thang nay tuc la da chay cho serv_outlet_data roi va se chay so lieu
          cho no va tru di 1 thang cho no */
          if nvl(var_coll_prem, -99) = -99 then
              insert /*+ APPEND */ into ams.la_vietstar_index_tmp nologging
              (
                  branch_id,
                  index_number
              )
              select /*+ CARDINALITY(grou, 100)*/
                  grou.cumv_branch_id,
                  decode(
                      (count(*) - 1),
                      0, sum(nvl(grou.coll_coll_prem, 0)),
                      sum(nvl(grou.coll_coll_prem, 0)) / (count(*) - 1)
                  ) index_number
              from
              (
                  select/*+ CARDINALITY(cumv, 100) CARDINALITY(coll, 100)*/
                      coll.cumv_branch_id,
                      coll.coll_data_date,
                      sum(coll.coll_coll_prem) coll_coll_prem
                  from
                  (   /*lay du lieu tu bang tam*/
                      select /*+ CARDINALITY(tmp, 100)*/
                          tmp.outlet_id,
                          tmp.cumv_outlet_id,
                          tmp.cumv_branch_id,
                          tmp.cumv_effective_date
                      from ams.la_vietstar_branch_tmp tmp
                  ) cumv
                  join
                  (
                      select/*+ CARDINALITY(v, 100)*/
                          v.outlet_id,
                          v.unit_id cumv_branch_id,
                          v.coll_data_date,
                          v.coll_coll_prem
                      from ams.la_vietstar_coll v
                      where v.record_date = trunc(valRecordDate, 'YYYY')
                          and v.coll_data_date between trunc(valRecordDate, 'YYYY') and add_months(trunc(valRecordDate, 'YYYY'), 10)
                          and v.coll_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                          and v.unit_id is not null
                  ) coll
                  on
                      (
                          coll.cumv_branch_id = cumv.cumv_branch_id
                          and
                          coll.coll_data_date >= cumv.cumv_effective_date
                          /*Co tinh cua ca truong nhom*/
                      )
                  group by coll.cumv_branch_id,
                      coll.coll_data_date
              ) grou
              group by grou.cumv_branch_id;
              commit;

              insert /*+ APPEND */ into ams.la_vietstar_index_tmp nologging
              (
                  branch_id,
                  index_number
              )
              select /*+ CARDINALITY(grou, 100)*/
                  grou.cumv_branch_id,
                  decode(
                      (count(*) - 1),
                      0, sum(nvl(grou.coll_coll_prem, 0)),
                      sum(nvl(grou.coll_coll_prem, 0)) / (count(*) - 1)
                  ) index_number
              from
              (
                  select/*+ CARDINALITY(cumv, 100) CARDINALITY(coll, 100)*/
                      coll.cumv_branch_id,
                      coll.coll_data_date,
                      sum(coll.coll_coll_prem) coll_coll_prem
                  from
                  (   /*lay du lieu tu bang tam*/
                      select /*+ CARDINALITY(tmp, 100)*/
                          tmp.outlet_id,
                          tmp.cumv_outlet_id,
                          tmp.cumv_branch_id,
                          tmp.cumv_effective_date
                      from ams.la_vietstar_branch_am_tmp tmp
                  ) cumv
                  join
                  (
                      select/*+ CARDINALITY(v, 100)*/
                          v.outlet_id,
                          v.agency_id cumv_branch_id,
                          v.coll_data_date,
                          v.coll_coll_prem
                      from ams.la_vietstar_coll v
                      where v.record_date = trunc(valRecordDate, 'YYYY')
                          and v.coll_data_date between trunc(valRecordDate, 'YYYY') and add_months(trunc(valRecordDate, 'YYYY'), 10)
                          and v.coll_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                          --chi lay thuoc nhom truc tiep cua Truong ban
                          and v.unit_id is null
                          and v.agency_id is not null
                  ) coll
                  on
                      (
                          coll.cumv_branch_id = cumv.cumv_branch_id
                          and
                          coll.coll_data_date >= cumv.cumv_effective_date
                          /*Co tinh cua ca truong nhom*/
                      )
                  group by coll.cumv_branch_id,
                      coll.coll_data_date
              ) grou
              group by grou.cumv_branch_id;
              commit;

          else
              /*neu ma la da chay thi cu chia cho so thang da chay va xu ly so lieu cho no
              nhu binh thuong van lam*/
              insert /*+ APPEND */ into ams.la_vietstar_index_tmp nologging
              (
                  branch_id,
                  index_number
              )
              select /*+ CARDINALITY(grou, 100)*/
                  grou.cumv_branch_id,
                  decode(
                      count(*),
                      0, sum(nvl(grou.coll_coll_prem, 0)),
                      sum(nvl(grou.coll_coll_prem, 0)) / count(*)
                  ) index_number
              from
              (
                  select/*+ CARDINALITY(cumv, 100) CARDINALITY(coll, 100)*/
                      coll.cumv_branch_id,
                      coll.coll_data_date,
                      sum(coll.coll_coll_prem) coll_coll_prem
                  from
                  (   /*lay du lieu tu bang tam*/
                      select /*+ CARDINALITY(tmp, 100)*/
                          tmp.outlet_id,
                          tmp.cumv_outlet_id,
                          tmp.cumv_branch_id,
                          tmp.cumv_effective_date
                      from ams.la_vietstar_branch_tmp tmp
                  ) cumv
                  join
                  (
                      select/*+ CARDINALITY(v, 100)*/
                          v.outlet_id,
                          v.unit_id cumv_branch_id,
                          v.coll_data_date,
                          v.coll_coll_prem
                      from ams.la_vietstar_coll v
                      where v.record_date = trunc(valRecordDate, 'YYYY')
                          and v.coll_data_date between trunc(valRecordDate, 'YYYY') and add_months(trunc(valRecordDate, 'YYYY'), 10)
                          and v.coll_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                          and v.unit_id is not null
                  ) coll
                  on
                      (
                          coll.cumv_branch_id = cumv.cumv_branch_id
                          and
                          coll.coll_data_date >= cumv.cumv_effective_date
                          /*Co tinh cua ca truong nhom*/
                      )
                  group by coll.cumv_branch_id,
                      coll.coll_data_date
              ) grou
              group by grou.cumv_branch_id;
              commit;

              insert /*+ APPEND */ into ams.la_vietstar_index_tmp nologging
              (
                  branch_id,
                  index_number
              )
              select /*+ CARDINALITY(grou, 100)*/
                  grou.cumv_branch_id,
                  decode(
                      count(*),
                      0, sum(nvl(grou.coll_coll_prem, 0)),
                      sum(nvl(grou.coll_coll_prem, 0)) / count(*)
                  ) index_number
              from
              (
                  select/*+ CARDINALITY(cumv, 100) CARDINALITY(coll, 100)*/
                      coll.cumv_branch_id,
                      coll.coll_data_date,
                      sum(coll.coll_coll_prem) coll_coll_prem
                  from
                  (   /*lay du lieu tu bang tam*/
                      select /*+ CARDINALITY(tmp, 100)*/
                          tmp.outlet_id,
                          tmp.cumv_outlet_id,
                          tmp.cumv_branch_id,
                          tmp.cumv_effective_date
                      from ams.la_vietstar_branch_am_tmp tmp
                  ) cumv
                  join
                  (
                      select/*+ CARDINALITY(v, 100)*/
                          v.outlet_id,
                          v.agency_id cumv_branch_id,
                          v.coll_data_date,
                          v.coll_coll_prem
                      from ams.la_vietstar_coll v
                      where v.record_date = trunc(valRecordDate, 'YYYY')
                          and v.coll_data_date between trunc(valRecordDate, 'YYYY') and add_months(trunc(valRecordDate, 'YYYY'), 10)
                          and v.coll_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                          --chi lay thuoc nhom truc tiep cua Truong ban
                          and v.unit_id is null
                          and v.agency_id is not null
                  ) coll
                  on
                      (
                          coll.cumv_branch_id = cumv.cumv_branch_id
                          and
                          coll.coll_data_date >= cumv.cumv_effective_date
                          /*Co tinh cua ca truong nhom*/
                      )
                  group by coll.cumv_branch_id,
                      coll.coll_data_date
              ) grou
              group by grou.cumv_branch_id;
              commit;
         end if;

          merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
              into ams.la_vietstar_outlet_2012 o
          using
              (
                  select  /*+ CARDINALITY(tmp, 100)*/
                      tmp.branch_id cumv_branch_id,
                      tmp.index_number
                  from ams.la_vietstar_index_tmp tmp
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE = o.type_code
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.cumv_be_executing
              and
              upd.cumv_branch_id = o.cumv_branch_id
              )
          when matched then
              update
              set
                  o.cumv_real_prem_avrg = upd.index_number,
                  o.update_datetime = sysdate;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2012', 'list_cumv_coll_prem_avrg');
      end;

      procedure list_cumv_coll_rate_avrg(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          update ams.la_vietstar_outlet_2012 o
          set
              o.cumv_coll_rate_avrg = round(decode(
                  nvl(o.cumv_coll_prem, 0), 0, 100,
                  nvl(o.cumv_real_prem, 0) / nvl(o.cumv_coll_prem, 0) * 100), 2),
              o.umvs_coll_rate_avrg = round(decode(
                  nvl(o.umvs_coll_prem, 0), 0, 100,
                  nvl(o.umvs_real_prem, 0) / nvl(o.umvs_coll_prem, 0) * 100), 2)
          where o.record_date = trunc(valRecordDate, 'YYYY');
              --and o.cumv_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES;
          commit;
      end;

      procedure list_cumv_cont_mang(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          ams.LIFE_AGENCY_VIETSTAR_2013.list_cumv_clear_temp;

          insert /*+ APPEND */ into ams.la_vietstar_index_tmp nologging
          (
              branch_id,
              index_number
          )
          select /*+ CARDINALITY(cumv, 100) CARDINALITY(coll, 100)*/
              coll.cumv_branch_id,
              sum(nvl(coll.coll_cont_mang, 0)) index_number
          from
          (   /*lay du lieu tu bang tam*/
              select /*+ CARDINALITY(tmp, 100)*/
                  tmp.outlet_id,
                  tmp.cumv_outlet_id,
                  tmp.cumv_branch_id,
                  tmp.cumv_effective_date
              from ams.la_vietstar_branch_tmp tmp
          ) cumv
          join
          (--chi lay dai ly con lam viec den cuoi thang do
              select /*+ CARDINALITY(outl, 100)*/
                  outl.outlet_id,
                  outl.outlet_ams_id,
                  outl.unit_id
              from ams.la_vietstar_temp_outlet outl
              where outl.record_date = trunc(valRecordDate, 'MM')
                  and outl.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
                  and outl.terminative_date is null
                  and outl.unit_id is not null
          ) outl
              on outl.unit_id = cumv.cumv_branch_id
          inner join
          (
              select
                  v.outlet_id,
                  v.unit_id cumv_branch_id,
                  v.coll_data_date,
                  v.coll_cont_mang
              from ams.la_vietstar_coll v
              where v.record_date = trunc(valRecordDate, 'YYYY')
                  and v.coll_data_date between trunc(valRecordDate, 'YYYY') and add_months(trunc(valRecordDate, 'YYYY'), 10)
                  and v.coll_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                  and v.unit_id is not null
                  --them dieu kien la dai ly do chua nghi viec tinh den cuoi thang do
                  --khi tinh ty le quan ly 36 thang
          ) coll
              on
                  coll.outlet_id  = outl.outlet_id
                  and
                  coll.coll_data_date >= cumv.cumv_effective_date
          group by coll.cumv_branch_id;
          commit;

          insert /*+ APPEND */ into ams.la_vietstar_index_tmp nologging
          (
              branch_id,
              index_number
          )
          select /*+ CARDINALITY(cumv, 100) CARDINALITY(coll, 100)*/
              cumv.cumv_branch_id,
              ind.index_number index_number
          from
          (   /*lay du lieu tu bang tam*/
              select /*+ CARDINALITY(tmp, 100)*/
                  tmp.outlet_id,
                  tmp.cumv_outlet_id,
                  tmp.cumv_branch_id,
                  tmp.cumv_effective_date
              from ams.la_vietstar_branch_am_tmp tmp
          ) cumv
          join
          (
              select  /*+ CARDINALITY(outl, 100)*/
                  outl.agency_id,
                  sum(nvl(coll.coll_cont_mang, 0)) index_number
              from
              (--chi lay dai ly con lam viec den cuoi thang do
                  select /*+ CARDINALITY(outl, 100)*/
                      outl.outlet_id,
                      outl.outlet_ams_id,
                      outl.agency_id
                  from ams.la_vietstar_temp_outlet outl
                  where outl.record_date = trunc(valRecordDate, 'MM')
                      and outl.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
                      and outl.terminative_date is null
                      --chi lay thuoc nhom truc tiep cua Truong ban
                      and outl.unit_id is null
                      and outl.agency_id is not null
              ) outl
              inner join
              (
                  select
                      v.outlet_id,
                      v.agency_id cumv_branch_id,
                      v.coll_data_date,
                      v.coll_cont_mang
                  from ams.la_vietstar_coll v
                  where v.record_date = trunc(valRecordDate, 'YYYY')
                      and v.coll_data_date between trunc(valRecordDate, 'YYYY') and add_months(trunc(valRecordDate, 'YYYY'), 10)
                      and v.coll_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                      --chi lay thuoc nhom truc tiep cua Truong ban
                      and v.unit_id is null
                      and v.agency_id is not null
                      --them ca dieu kien nay roi nhe
                      --neu ma no bi null tuc la nhom khong co truong nhom thi chac chan se khong tinh
                      and v.coll_data_date >= nvl(v.coll_effective_date, to_date('1-jan-1099'))
                      --them dieu kien la dai ly do chua nghi viec tinh den cuoi thang do
                      --khi tinh ty le quan ly 36 thang
              ) coll
                  on coll.outlet_id  = outl.outlet_id
              group by outl.agency_id
          ) ind
              on ind.agency_id =  cumv.cumv_branch_id;
          commit;

          merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
              into ams.la_vietstar_outlet_2012 o
          using
              (
                  select  /*+ CARDINALITY(tmp, 100)*/
                      tmp.branch_id cumv_branch_id,
                      tmp.index_number
                  from ams.la_vietstar_index_tmp tmp
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE = o.type_code
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.cumv_be_executing
              and
              upd.cumv_branch_id = o.cumv_branch_id
              )
          when matched then
              update
              set
                  o.cumv_cont_mang = upd.index_number,
                  o.update_datetime = sysdate;
          commit;
          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2012', 'list_cumv_cont_mang');
      end;

      procedure list_cumv_cont_canc(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          ams.LIFE_AGENCY_VIETSTAR_2013.list_cumv_clear_temp;

          insert /*+ APPEND */ into ams.la_vietstar_index_tmp nologging
          (
              branch_id,
              index_number
          )
          select /*+ CARDINALITY(cumv, 100) CARDINALITY(coll, 100)*/
              coll.cumv_branch_id,
              sum(nvl(coll.coll_cont_canc, 0)) index_number
          from
          (   /*lay du lieu tu bang tam*/
              select /*+ CARDINALITY(tmp, 100)*/
                  tmp.outlet_id,
                  tmp.cumv_outlet_id,
                  tmp.cumv_branch_id,
                  tmp.cumv_effective_date
              from ams.la_vietstar_branch_tmp tmp
          ) cumv
          --THIEU NHOM TRUC TIEP CUA TRUONG BAN O DAY ROI!!!
          join
          (--chi lay dai ly con lam viec den cuoi thang do
              select /*+ CARDINALITY(outl, 100)*/
                  outl.outlet_id,
                  outl.outlet_ams_id,
                  outl.unit_id
              from ams.la_vietstar_temp_outlet outl
              where outl.record_date = trunc(valRecordDate, 'MM')
                  and outl.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
                  and outl.terminative_date is null
                  and outl.unit_id is not null
          ) outl
              on outl.unit_id = cumv.cumv_branch_id
          inner join
          (
              select
                  v.outlet_id,
                  v.unit_id cumv_branch_id,
                  v.coll_data_date,
                  v.coll_cont_canc
              from ams.la_vietstar_coll v
              where v.record_date = trunc(valRecordDate, 'YYYY')
                  and v.coll_data_date between trunc(valRecordDate, 'YYYY') and add_months(trunc(valRecordDate, 'YYYY'), 10)
                  and v.coll_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                  --them dieu kien la dai ly do chua nghi viec tinh den cuoi thang do
                  --khi tinh ty le quan ly 36 thang
                  and v.unit_id is not null
          ) coll
              on
                  coll.outlet_id  = outl.outlet_id
                  and
                  coll.coll_data_date >= cumv.cumv_effective_date
          group by coll.cumv_branch_id;
          commit;

          insert /*+ APPEND */ into ams.la_vietstar_index_tmp nologging
          (
              branch_id,
              index_number
          )
          select /*+ CARDINALITY(cumv, 100) CARDINALITY(coll, 100)*/
              cumv.cumv_branch_id,
              ind.index_number index_number
          from
          (   /*lay du lieu tu bang tam*/
              select /*+ CARDINALITY(tmp, 100)*/
                  tmp.outlet_id,
                  tmp.cumv_outlet_id,
                  tmp.cumv_branch_id,
                  tmp.cumv_effective_date
              from ams.la_vietstar_branch_am_tmp tmp
          ) cumv
          join
          (
              select  /*+ CARDINALITY(outl, 100)*/
                  outl.agency_id,
                  sum(nvl(coll.coll_cont_canc, 0)) index_number
              from
              (--chi lay dai ly con lam viec den cuoi thang do
                  select /*+ CARDINALITY(outl, 100)*/
                      outl.outlet_id,
                      outl.outlet_ams_id,
                      outl.agency_id
                  from ams.la_vietstar_temp_outlet outl
                  where outl.record_date = trunc(valRecordDate, 'MM')
                      and outl.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
                      and outl.terminative_date is null
                      --chi lay thuoc nhom truc tiep cua Truong ban
                      and outl.unit_id is null
                      and outl.agency_id is not null
              ) outl
              inner join
              (
                  select
                      v.outlet_id,
                      v.agency_id cumv_branch_id,
                      v.coll_data_date,
                      v.coll_cont_canc
                  from ams.la_vietstar_coll v
                  where v.record_date = trunc(valRecordDate, 'YYYY')
                      and v.coll_data_date between trunc(valRecordDate, 'YYYY') and add_months(trunc(valRecordDate, 'YYYY'), 10)
                      and v.coll_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                      --them dieu kien la dai ly do chua nghi viec tinh den cuoi thang do
                      --khi tinh ty le quan ly 36 thang
                      --chi lay thuoc nhom truc tiep cua Truong ban
                      and v.unit_id is null
                      and v.agency_id is not null
                      --them ca dieu kien nay roi nhe
                      --neu ma no bi null tuc la nhom khong co truong nhom thi chac chan se khong tinh
                      and v.coll_data_date >= nvl(v.coll_effective_date, to_date('1-jan-1099'))
              ) coll
                  on coll.outlet_id  = outl.outlet_id
              group by outl.agency_id
          ) ind
              on ind.agency_id =  cumv.cumv_branch_id;
          commit;

          merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
              into ams.la_vietstar_outlet_2012 o
          using
              (
                  select  /*+ CARDINALITY(tmp, 100)*/
                      tmp.branch_id cumv_branch_id,
                      tmp.index_number
                  from ams.la_vietstar_index_tmp tmp
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE = o.type_code
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.cumv_be_executing
              and
              upd.cumv_branch_id = o.cumv_branch_id
              )
          when matched then
              update
              set
                  o.cumv_cont_canc = upd.index_number,
                  o.update_datetime = sysdate;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2012', 'list_cumv_cont_canc');
      end;

      --ty le duy tri hop dong 36 thang cua no tinh theo tong so luong hop dong quan ly tru di huy bo cua ca nhom thi se tinh nhu the nay cho no
      procedure list_cumv_pers_rate_avrg(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          update ams.la_vietstar_outlet_2012 o
          set
              o.cumv_pers_rate_avrg = decode(
                  nvl(o.cumv_cont_mang, 0), 0, 100,
                  (nvl(o.cumv_cont_mang, 0) - nvl(o.cumv_cont_canc, 0)) / nvl(o.cumv_cont_mang, 0) * 100),
              o.update_datetime = sysdate
          where o.record_date = trunc(valRecordDate, 'YYYY')
              and o.cumv_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES;
          commit;
          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2012', 'list_cumv_pers_rate_avrg');
      end;

      --CAU NAY CAN KHONG LAY TU BANG TMP_BLOCK_OUTLET NAY NUA DAU NHE CHAY CHAM LAM
      --da test performance OK
      procedure list_cumv_numb_of_agnt(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          ams.LIFE_AGENCY_VIETSTAR_2013.list_cumv_clear_temp;

          insert /*+ APPEND */ into ams.la_vietstar_index_tmp nologging
          (
              branch_id,
              index_number
          )
          select  /*+ CARDINALITY(curr, 100)
                          CARDINALITY(jan, 100) */
              curr.cumv_branch_id,
              round((nvl(curr.index_number, 0) + nvl(jan.index_number, 0)) / 2, 2) index_number
          from
          (
              select /*+ CARDINALITY(outl, 100)*/
                  outl.unit_id cumv_branch_id,
                  count(*) index_number
              from ams.la_vietstar_temp_outlet outl
              where outl.record_date = trunc(valRecordDate, 'MM')
                  and outl.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
                  and outl.unit_id is not null
                  and outl.terminative_date is null
              group by outl.unit_id
          ) curr
          left join
          (  /*chu y la cho nay la so dai ly DAU NAM tuc la vao thoi diem 1/1/2013 co so luong dai ly la bao nhieu day nhe
                hoi lai xem la doan lenh nay da dung duoc chua nhe*/
              select /*+ CARDINALITY(tmp, 100)*/
                  tmp.sales_unit_id cumv_branch_id,
                  count(tmp.outlet_id) index_number
              from ams.tmp_block_outlet tmp
              where tmp.outlet_number like 'D%'
                  and tmp.from_date <> tmp.to_date
                  and trunc(valRecordDate, 'YYYY') >= tmp.from_date
                  and trunc(valRecordDate, 'YYYY') < tmp.to_date
                  and tmp.sales_unit_id is not null
              group by tmp.sales_unit_id
          ) jan
              on jan.cumv_branch_id =  curr.cumv_branch_id;
          commit;

          insert /*+ APPEND */ into ams.la_vietstar_index_tmp nologging
          (
              branch_id,
              index_number
          )
          select  /*+ CARDINALITY(curr, 100)
                          CARDINALITY(jan, 100) */
              curr.cumv_branch_id,
              round((nvl(curr.index_number, 0) + nvl(jan.index_number, 0)) / 2, 2) index_number
          from
          (
              select /*+ CARDINALITY(outl, 100)*/
                  outl.agency_id cumv_branch_id,
                  count(*) index_number
              from ams.la_vietstar_temp_outlet outl
              where outl.record_date = trunc(valRecordDate, 'MM')
                  and outl.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
                  and outl.agency_id is not null
                  and outl.unit_id is null
                  and outl.terminative_date is null
              group by outl.agency_id
          ) curr
          left join
          (  /*chu y la cho nay la so dai ly DAU NAM tuc la vao thoi diem 1/1/2013 co so luong dai ly la bao nhieu day nhe
                hoi lai xem la doan lenh nay da dung duoc chua nhe*/
              select /*+ CARDINALITY(tmp, 100)*/
                  tmp.sales_agency_id cumv_branch_id,
                  count(tmp.outlet_id) index_number
              from ams.tmp_block_outlet tmp
              where tmp.outlet_number like 'D%'
                  and tmp.from_date <> tmp.to_date
                  and trunc(valRecordDate, 'YYYY') >= tmp.from_date
                  and trunc(valRecordDate, 'YYYY') < tmp.to_date
                  and tmp.sales_agency_id is not null
                  and tmp.sales_unit_id is null
              group by tmp.sales_agency_id
          ) jan
              on jan.cumv_branch_id =  curr.cumv_branch_id;
          commit;

          merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
              into ams.la_vietstar_outlet_2012 o
          using
              (
                  select  /*+ CARDINALITY(tmp, 100)*/
                      tmp.branch_id cumv_branch_id,
                      tmp.index_number
                  from ams.la_vietstar_index_tmp tmp
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE = o.type_code
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.cumv_be_executing
              and
              upd.cumv_branch_id = o.cumv_branch_id
              )
          when matched then
              update
              set
                  o.cumv_numb_of_agnt = upd.index_number,
                  o.update_datetime = sysdate;
          commit;
          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2012', 'list_cumv_numb_of_agnt');
      end;

    /*
        Creater: Le Khac Chinh
        Date Create: 29/05/2013
        Version: 1.0
        Description: Lay so luong cac Hop dong dao han o BVL tuong ung voi tung dai ly
        Parameter:
            valRecordDate [date]:  Thang chay
        Update:
    */
      procedure update_trans(valRecordDate date := null)
      is
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          execute immediate 'truncate table ams.la_vietstar_trans_2012_ext';
          commit;

          /*lay ra toan bo cac giao dich o day*/
          insert /*+ APPEND */ into ams.la_vietstar_trans_2012_ext nologging
          (
              outlet_id,
              record_date,
              version_date,
              outlet_ams_id,
              outlet_name,
              position_code,
              position_date,
              effective_date,
              terminative_date,
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
              transaction_code,
              transaction_date,
              policy_number,
              transaction_premium,
              transaction_fyp,
              data_source,
              update_datetime
          )
          select /*+ CARDINALITY(tmp, 100)*/
              tmp.outlet_id		,
              tmp.record_date,
              tmp.version_date,
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
              tmp.transaction_code,
              tmp.transaction_date,
              tmp.policy_number,
              tmp.transaction_premium,
              tmp.transaction_fyp,
              tmp.data_source,
              sysdate
          from ams.la_vietstar_trans_2012 tmp
          where tmp.record_date = trunc(valRecordDate, 'YYYY');
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2012', 'update_trans');
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;


          dbms_stats.gather_table_stats(null, 'la_vietstar_temp_outlet', cascade => true);


          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2012', 'gather_table_stats');
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          for i in 0..11
          loop
              if add_months(add_months(trunc(valRecordDate, 'YYYY'), 11), -i)
                   between trunc(valRecordDate, 'YYYY')
                   and add_months(trunc(valRecordDate, 'YYYY'), 11) then
                  merge
                      into ams.la_vietstar_trans_2012_ext  o
                  using
                      (
                          select  /*+ CARDINALITY(tmp, 100)*/
                              tmp.outlet_id,
                              tmp.record_date,
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
                              tmp.unit_name
                          from ams.la_vietstar_temp_outlet tmp
                          where tmp.record_date = add_months(add_months(trunc(valRecordDate, 'YYYY'), 11), -i)
                      ) upd
                  on (
                      trunc(valRecordDate, 'YYYY') = o.record_date
                      and
                      upd.outlet_id = o.outlet_id
                      and
                      /*Xu ly de thang xay ra giao dich thi lay o thoi gian cuoi thang khi chuyen sang nhom khac*/
                      trunc(o.transaction_date, 'MM') = upd.record_date
                      )
                  when matched then
                      update
                      set
                          o.org_company_id  =  upd.company_id,
                          o.org_company_ams_id  =  upd.company_ams_id,
                          o.org_company_name  =  upd.company_name,
                          o.org_office_id  =  upd.office_id,
                          o.org_office_ams_id  =  upd.office_ams_id,
                          o.org_office_name  =  upd.office_ams_id,
                          o.org_agency_id  =  upd.agency_id,
                          o.org_agency_ams_id  =  upd.agency_ams_id,
                          o.org_agency_name  =  upd.agency_name,
                          o.org_unit_id  =  upd.unit_id,
                          o.org_unit_ams_id  =  upd.unit_ams_id,
                          o.org_unit_name	=	upd.unit_name,
                          o.update_datetime = sysdate;
                  commit;
              end if;
          end loop;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(ams.LIFE_AGENCY_CODE.LOG_ID_INDEX, 'VIETSTAR_2012', 'update_trans merrge');
      end;

      procedure close_executing(valRecordDate date := null)
      is
      begin
          merge
              into ams.la_vietstar_outlet_2012 o
          using
              (
                  select
                      outl.outlet_id,
                      outl.outlet_ams_id,
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
                      outl.unit_name
                  from ams.serv_outlet_data outl
                  where outl.record_date = trunc(valRecordDate, 'MM')
                      and outl.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE_MAIN
                      and outl.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
              ) upd
          on (
              trunc(valRecordDate, 'YYYY') = o.record_date
              and
              ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE = o.type_code
              and
              ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.be_executing
              and
              upd.outlet_id = o.outlet_id
              )
          when matched then
              update
              set o.company_name = upd.company_name,
                  o.office_name = upd.office_name,
                  o.agency_name = upd.agency_name,
                  o.unit_name = upd.unit_name,
                  o.outlet_number = upd.outlet_ams_id,
                  o.outlet_name = upd.outlet_name,
                  o.update_datetime = sysdate;
          commit;

          /*update ams.la_vietstar_outlet_2012 o
          set
              o.be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_NO,
              o.update_datetime = sysdate
          where o.record_date = trunc(valRecordDate, 'YYYY')
              and o.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
              and o.be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES;
          commit;*/
      end;

      procedure get_version_date(
          row_records out sys_refcursor)
      is
      begin
          --lay ngay cap nhat so lieu o day la biet chot so lieu den ngay nao cho no roi nhe
          open row_records for
          select to_char(nvl(tmp.version_date - 1, sysdate), 'DD/MM/YYYY')
          from ams.la_vietstar_outlet_2012 tmp
          where rownum <= 1;
      end;

      --lay ra dai ly
      procedure get_sv01(valCompanyID number := null,
          row_records out sys_refcursor)
      is
          var_branch_id number(10) := nvl(valCompanyID, 0);
          var_record_date date := trunc(sysdate, 'YYYY');
      begin
        begin
            select /*+ CARDINALITY(tmp, 100) */
               tmp.record_date
               into var_record_date
            from ams.la_vietstar_outlet_2012 tmp
            where rownum <= 1;
        exception
         when others then
             var_record_date := trunc(sysdate, 'YYYY');
        end;
         --tra o muc cong ty co chon
          --tra o muc co chon cong ty va chon chi tiet den dai ly
          if valCompanyID is not null then
              open row_records for
              select  /*+
                  CARDINALITY(key, 100)
                  CARDINALITY(area, 100)
                  CARDINALITY(pos, 100)
                  */
                  row_number() over (order by area.area_code,
                  nlssort(key.company_name, 'nls_sort=Vietnamese'),
                  nlssort(key.agency_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.unit_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(key.outlet_ams_id, 'nls_sort=Vietnamese')
                  ) row_num,
                  area.area_name,
                  key.outlet_ams_id,
                  key.outlet_name,
                  key.outlet_id,
                  key.outlet_bvlife_id,
                  key.outlet_talisman_id,
                  key.company_id,
                  key.company_name,
                  key.office_id,
                  key.office_name,
                  key.agency_id,
                  key.agency_name,
                  key.unit_id,
                  key.unit_name,
                  key.position_code,
                  nvl(pos.position_name, pos_term.position_name) position_name,
                  key.status_code,
                  to_char(key.effective_date, 'DD/MM/YYYY') effective_date,
                  to_char(key.terminative_date, 'DD/MM/YYYY') terminative_date,
                  key.psvs_fyp,
                  key.psvs_fyp_ex,
                  (nvl(key.psvs_fyp, 0) + nvl(key.psvs_fyp_ex, 0)) psvs_fyp_total,
                  key.psvs_afyp_issu,
                  key.psvs_afyp_info,
                  key.psvs_pers_rate,
                  key.psvs_coll_prem,
                  key.psvs_real_prem,
                  key.psvs_coll_rate_avrg
              from
              (
                  select /*+ CARDINALITY(lre, 100)*/
                      lre.outlet_ams_id,
                      lre.outlet_name,
                      lre.outlet_id,
                      lre.type_code,
                      lre.outlet_bvlife_id,
                      lre.outlet_talisman_id,
                      lre.company_id,
                      lre.company_name,
                      lre.office_id,
                      lre.office_name,
                      lre.agency_id,
                      lre.agency_name,
                      lre.unit_id,
                      lre.unit_name,
                      lre.position_code,
                      lre.status_code,
                      lre.effective_date,
                      lre.terminative_date,
                      lre.psvs_fyp,
                      lre.psvs_fyp_ex,
                      lre.psvs_afyp_issu,
                      lre.psvs_afyp_info,
                      lre.psvs_pers_rate,
                      lre.psvs_coll_prem,
                      lre.psvs_real_prem,
                      lre.psvs_coll_rate_avrg
                  from ams.la_vietstar_outlet_2012 lre
                  where lre.record_date = var_record_date
                      and lre.company_id = var_branch_id
              ) key
              left join
              ( --lay ra ten khu vuc vao day luon
                  select  /*+ CARDINALITY(temp, 100)*/
                      temp.company_id,
                      temp.area_code,
                      temp.area_name
                  from ams.la_saoviet_company_area temp
              ) area
                  on area.company_id = key.company_id
              left join
              (
                  select /*+ CARDINALITY(code, 100)*/
                      code.code_code position_code,
                      code.code_value position_name
                  from ams.cla_codes code
                  where code.code_language = AMS_CORE_SYSTEM.THEME_LANGUAGE
                      and code.code_group = AMS_CORE_CODE.OUTLET_INFO_TYPE_POSI
                      and trunc(sysdate, 'DD')
                          between nvl(code.from_date, AMS_CORE_SYSTEM.DATE_MIN_VALUE)
                          and nvl(code.to_date, AMS_CORE_SYSTEM.DATE_MAX_VALUE)
              ) pos
                  on pos.position_code = key.position_code
              left join
              (
                  select lha.agent_id,
                      lha.history_value position_code
                  from ams.la_history_agent lha
                  where lha.type_code = 'CVDL_CODE'
                      and lha.current_is = 'Y'
              ) cv
                  on cv.agent_id = key.outlet_id
              left join
              (
                  select /*+ CARDINALITY(code, 100)*/
                      code.code_code position_code,
                      code.code_value position_name
                  from ams.cla_codes code
                  where code.code_language = AMS_CORE_SYSTEM.THEME_LANGUAGE
                      and code.code_group = AMS_CORE_CODE.OUTLET_INFO_TYPE_POSI
                      and trunc(sysdate, 'DD')
                          between nvl(code.from_date, AMS_CORE_SYSTEM.DATE_MIN_VALUE)
                          and nvl(code.to_date, AMS_CORE_SYSTEM.DATE_MAX_VALUE)
              ) pos_term
                  on pos_term.position_code = cv.position_code
              order by area.area_code,
                  nlssort(key.company_name, 'nls_sort=Vietnamese'),
                  nlssort(key.agency_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.unit_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(key.outlet_ams_id, 'nls_sort=Vietnamese');
          else
              --tra o muc tong cong ty
              open row_records for
              select  /*+
                  CARDINALITY(key, 100)
                  CARDINALITY(area, 100)
                  CARDINALITY(pos, 100)
                  */
                  row_number() over (order by area.area_code,
                  nlssort(key.company_name, 'nls_sort=Vietnamese'),
                  nlssort(key.agency_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.unit_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(key.outlet_ams_id, 'nls_sort=Vietnamese')
                  ) row_num,
                  area.area_name,
                  key.outlet_ams_id,
                  key.outlet_name,
                  key.outlet_id,
                  key.outlet_bvlife_id,
                  key.outlet_talisman_id,
                  key.company_id,
                  key.company_name,
                  key.office_id,
                  key.office_name,
                  key.agency_id,
                  key.agency_name,
                  key.unit_id,
                  key.unit_name,
                  key.position_code,
                  nvl(pos.position_name, pos_term.position_name) position_name,
                  key.status_code,
                  to_char(key.effective_date, 'DD/MM/YYYY') effective_date,
                  to_char(key.terminative_date, 'DD/MM/YYYY') terminative_date,
                  key.psvs_fyp,
                  key.psvs_fyp_ex,
                  (nvl(key.psvs_fyp, 0) + nvl(key.psvs_fyp_ex, 0)) psvs_fyp_total,
                  key.psvs_afyp_issu,
                  key.psvs_afyp_info,
                  key.psvs_pers_rate,
                  key.psvs_coll_prem,
                  key.psvs_real_prem,
                  key.psvs_coll_rate_avrg
              from
              (
                  select /*+ CARDINALITY(lre, 100)*/
                      lre.outlet_ams_id,
                      lre.outlet_name,
                      lre.outlet_id,
                      lre.type_code,
                      lre.outlet_bvlife_id,
                      lre.outlet_talisman_id,
                      lre.company_id,
                      lre.company_name,
                      lre.office_id,
                      lre.office_name,
                      lre.agency_id,
                      lre.agency_name,
                      lre.unit_id,
                      lre.unit_name,
                      lre.position_code,
                      lre.status_code,
                      lre.effective_date,
                      lre.terminative_date,
                      lre.psvs_fyp,
                      lre.psvs_fyp_ex,
                      lre.psvs_afyp_issu,
                      lre.psvs_afyp_info,
                      lre.psvs_pers_rate,
                      lre.psvs_coll_prem,
                      lre.psvs_real_prem,
                      lre.psvs_coll_rate_avrg
                  from ams.la_vietstar_outlet_2012 lre
                  where lre.record_date = var_record_date
              ) key
              left join
              ( --lay ra ten khu vuc vao day luon
                  select  /*+ CARDINALITY(temp, 100)*/
                      temp.company_id,
                      temp.area_code,
                      temp.area_name
                  from ams.la_saoviet_company_area temp
              ) area
                  on area.company_id = key.company_id
              left join
              (
                  select /*+ CARDINALITY(code, 100)*/
                      code.code_code position_code,
                      code.code_value position_name
                  from ams.cla_codes code
                  where code.code_language = AMS_CORE_SYSTEM.THEME_LANGUAGE
                      and code.code_group = AMS_CORE_CODE.OUTLET_INFO_TYPE_POSI
                      and trunc(sysdate, 'DD')
                          between nvl(code.from_date, AMS_CORE_SYSTEM.DATE_MIN_VALUE)
                          and nvl(code.to_date, AMS_CORE_SYSTEM.DATE_MAX_VALUE)
              ) pos
                  on pos.position_code = key.position_code
              left join
              (
                  select lha.agent_id,
                      lha.history_value position_code
                  from ams.la_history_agent lha
                  where lha.type_code = 'CVDL_CODE'
                      and lha.current_is = 'Y'
              ) cv
                  on cv.agent_id = key.outlet_id
              left join
              (
                  select /*+ CARDINALITY(code, 100)*/
                      code.code_code position_code,
                      code.code_value position_name
                  from ams.cla_codes code
                  where code.code_language = AMS_CORE_SYSTEM.THEME_LANGUAGE
                      and code.code_group = AMS_CORE_CODE.OUTLET_INFO_TYPE_POSI
                      and trunc(sysdate, 'DD')
                          between nvl(code.from_date, AMS_CORE_SYSTEM.DATE_MIN_VALUE)
                          and nvl(code.to_date, AMS_CORE_SYSTEM.DATE_MAX_VALUE)
              ) pos_term
                  on pos_term.position_code = cv.position_code
              order by area.area_code,
                  nlssort(key.company_name, 'nls_sort=Vietnamese'),
                  nlssort(key.agency_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.unit_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(key.outlet_ams_id, 'nls_sort=Vietnamese');
          end if;
      end;

      --lay ra truong nhom
      procedure get_sv02(valCompanyID number := null,
          row_records out sys_refcursor)
      is
          var_branch_id number(10) := nvl(valCompanyID, 0);
          var_record_date date := trunc(sysdate, 'YYYY');
      begin
        begin
            select /*+ CARDINALITY(tmp, 100) */
               tmp.record_date
               into var_record_date
            from ams.la_vietstar_outlet_2012 tmp
            where rownum <= 1;
        exception
         when others then
             var_record_date := trunc(sysdate, 'YYYY');
        end;
         --tra o muc cong ty co chon
          --tra o muc co chon cong ty va chon chi tiet den dai ly
          if valCompanyID is not null then
              open row_records for
              select  /*+
                  CARDINALITY(key, 100)
                  CARDINALITY(area, 100)
                  CARDINALITY(pos, 100)
                  */
                  row_number() over (order by area.area_code,
                  nlssort(key.company_name, 'nls_sort=Vietnamese'),
                  nlssort(key.agency_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.unit_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(key.outlet_ams_id, 'nls_sort=Vietnamese')
                  ) row_num,
                  area.area_name,
                  key.outlet_ams_id,
                  key.outlet_name,
                  key.outlet_id,
                  key.outlet_bvlife_id,
                  key.outlet_talisman_id,
                  key.company_id,
                  key.company_name,
                  key.office_id,
                  key.office_name,
                  key.agency_id,
                  key.agency_name,
                  key.unit_id,
                  key.unit_name,
                  key.position_code,
                  pos.position_name,
                  key.status_code,
                  to_char(key.effective_date, 'DD/MM/YYYY') effective_date,
                  to_char(key.terminative_date, 'DD/MM/YYYY') terminative_date,
                  to_char(key.umvs_effective_date, 'DD/MM/YYYY') umvs_effective_date,
                  key.umvs_bonus_percent, --ty le tuong ung voi 1.5 ty hay  2.5 ty
                  key.umvs_root_fyp,--FYP goc do nhom do tuyen vao
                  key.umvs_bonus_fyp,--FYP duoc thuong tu nhung nhom do nhom do phat trien len
                  key.umvs_fyp,  --FYP cuoi cung do nhom do tuyen vao
                  key.umvs_root_nagt_qty, --so luong dai ly tuyen dung goc ma nhom do tuyen duoc
                  key.umvs_bonus_nagt_qty,   --so luong dai ly tuyen dung duoc thuong them do phat trien nhom goc ma nhom do tuyen duoc
                  key.umvs_numb_of_nagt, --so luong dai y duoc tuyen final cuoi cung
                  key.umvs_ip, --Tong IP KTM cua cac dai ly moi tuyen trong nam
                  key.umvs_afis,
                  key.umvs_afif,
                  key.umvs_pr36,
                  key.umvs_coll_prem,
                  key.umvs_real_prem,
                  key.umvs_coll_rate_avrg
              from
              (
                  select /*+ CARDINALITY(lre, 100)*/
                      lre.outlet_ams_id,
                      lre.outlet_name,
                      lre.outlet_id,
                      lre.type_code,
                      lre.outlet_bvlife_id,
                      lre.outlet_talisman_id,
                      lre.company_id,
                      lre.company_name,
                      lre.office_id,
                      lre.office_name,
                      lre.agency_id,
                      lre.agency_name,
                      lre.unit_id,
                      lre.unit_name,
                      lre.position_code,
                      lre.status_code,
                      lre.effective_date,
                      lre.terminative_date,
                      lre.umvs_effective_date,
                      lre.umvs_bonus_percent, --ty le tuong ung voi 1.5 ty hay  2.5 ty
                      lre.umvs_root_fyp,--FYP goc do nhom do tuyen vao
                      lre.umvs_bonus_fyp,--FYP duoc thuong tu nhung nhom do nhom do phat trien len
                      lre.umvs_fyp,  --FYP cuoi cung do nhom do tuyen vao
                      lre.umvs_root_nagt_qty, --so luong dai ly tuyen dung goc ma nhom do tuyen duoc
                      lre.umvs_bonus_nagt_qty,   --so luong dai ly tuyen dung duoc thuong them do phat trien nhom goc ma nhom do tuyen duoc
                      lre.umvs_numb_of_nagt, --so luong dai y duoc tuyen final cuoi cung
                      lre.umvs_ip, --Tong IP KTM cua cac dai ly moi tuyen trong nam
                      lre.umvs_afis,
                      lre.umvs_afif,
                      lre.umvs_pr36,
                      lre.umvs_coll_prem,
                      lre.umvs_real_prem,
                      lre.umvs_coll_rate_avrg
                  from ams.la_vietstar_outlet_2012 lre
                  where lre.record_date = var_record_date
                      and lre.umvs_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                      and lre.company_id = var_branch_id
              ) key
              left join
              ( --lay ra ten khu vuc vao day luon
                  select  /*+ CARDINALITY(temp, 100)*/
                      temp.company_id,
                      temp.area_code,
                      temp.area_name
                  from ams.la_saoviet_company_area temp
              ) area
                  on area.company_id = key.company_id
              left join
              (
                  select /*+ CARDINALITY(code, 100)*/
                      code.code_code position_code,
                      code.code_value position_name
                  from ams.cla_codes code
                  where code.code_language = AMS_CORE_SYSTEM.THEME_LANGUAGE
                      and code.code_group = AMS_CORE_CODE.OUTLET_INFO_TYPE_POSI
                      and trunc(sysdate, 'DD')
                          between nvl(code.from_date, AMS_CORE_SYSTEM.DATE_MIN_VALUE)
                          and nvl(code.to_date, AMS_CORE_SYSTEM.DATE_MAX_VALUE)
              ) pos
                  on pos.position_code = key.position_code
              order by area.area_code,
                  nlssort(key.company_name, 'nls_sort=Vietnamese'),
                  nlssort(key.agency_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.unit_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(key.outlet_ams_id, 'nls_sort=Vietnamese');
          else
              --tra o muc tong cong ty
              open row_records for
              select  /*+
                  CARDINALITY(key, 100)
                  CARDINALITY(area, 100)
                  CARDINALITY(pos, 100)
                  */
                  row_number() over (order by area.area_code,
                  nlssort(key.company_name, 'nls_sort=Vietnamese'),
                  nlssort(key.agency_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.unit_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(key.outlet_ams_id, 'nls_sort=Vietnamese')
                  ) row_num,
                  area.area_name,
                  key.outlet_ams_id,
                  key.outlet_name,
                  key.outlet_id,
                  key.type_code,
                  key.outlet_bvlife_id,
                  key.outlet_talisman_id,
                  key.company_id,
                  key.company_name,
                  key.office_id,
                  key.office_name,
                  key.agency_id,
                  key.agency_name,
                  key.unit_id,
                  key.unit_name,
                  key.position_code,
                  pos.position_name,
                  key.status_code,
                  to_char(key.effective_date, 'DD/MM/YYYY') effective_date,
                  to_char(key.terminative_date, 'DD/MM/YYYY') terminative_date,
                  to_char(key.umvs_effective_date, 'DD/MM/YYYY') umvs_effective_date,
                  key.umvs_bonus_percent, --ty le tuong ung voi 1.5 ty hay  2.5 ty
                  key.umvs_root_fyp,--FYP goc do nhom do tuyen vao
                  key.umvs_bonus_fyp,--FYP duoc thuong tu nhung nhom do nhom do phat trien len
                  key.umvs_fyp,  --FYP cuoi cung do nhom do tuyen vao
                  key.umvs_root_nagt_qty, --so luong dai ly tuyen dung goc ma nhom do tuyen duoc
                  key.umvs_bonus_nagt_qty,   --so luong dai ly tuyen dung duoc thuong them do phat trien nhom goc ma nhom do tuyen duoc
                  key.umvs_numb_of_nagt, --so luong dai y duoc tuyen final cuoi cung
                  key.umvs_ip, --Tong IP KTM cua cac dai ly moi tuyen trong nam
                  key.umvs_afis,
                  key.umvs_afif,
                  key.umvs_pr36,
                  key.umvs_coll_prem,
                  key.umvs_real_prem,
                  key.umvs_coll_rate_avrg
              from
              (
                  select /*+ CARDINALITY(lre, 100)*/
                      lre.outlet_ams_id,
                      lre.outlet_name,
                      lre.outlet_id,
                      lre.type_code,
                      lre.outlet_bvlife_id,
                      lre.outlet_talisman_id,
                      lre.company_id,
                      lre.company_name,
                      lre.office_id,
                      lre.office_name,
                      lre.agency_id,
                      lre.agency_name,
                      lre.unit_id,
                      lre.unit_name,
                      lre.position_code,
                      lre.status_code,
                      lre.effective_date,
                      lre.terminative_date,
                      lre.umvs_effective_date,
                      lre.umvs_bonus_percent, --ty le tuong ung voi 1.5 ty hay  2.5 ty
                      lre.umvs_root_fyp,--FYP goc do nhom do tuyen vao
                      lre.umvs_bonus_fyp,--FYP duoc thuong tu nhung nhom do nhom do phat trien len
                      lre.umvs_fyp,  --FYP cuoi cung do nhom do tuyen vao
                      lre.umvs_root_nagt_qty, --so luong dai ly tuyen dung goc ma nhom do tuyen duoc
                      lre.umvs_bonus_nagt_qty,   --so luong dai ly tuyen dung duoc thuong them do phat trien nhom goc ma nhom do tuyen duoc
                      lre.umvs_numb_of_nagt, --so luong dai y duoc tuyen final cuoi cung
                      lre.umvs_ip, --Tong IP KTM cua cac dai ly moi tuyen trong nam
                      lre.umvs_afis,
                      lre.umvs_afif,
                      lre.umvs_pr36,
                      lre.umvs_coll_prem,
                      lre.umvs_real_prem,
                      lre.umvs_coll_rate_avrg
                  from ams.la_vietstar_outlet_2012 lre
                  where lre.record_date = var_record_date
                      and lre.umvs_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
              ) key
              left join
              ( --lay ra ten khu vuc vao day luon
                  select  /*+ CARDINALITY(temp, 100)*/
                      temp.company_id,
                      temp.area_code,
                      temp.area_name
                  from ams.la_saoviet_company_area temp
              ) area
                  on area.company_id = key.company_id
              left join
              (
                  select /*+ CARDINALITY(code, 100)*/
                      code.code_code position_code,
                      code.code_value position_name
                  from ams.cla_codes code
                  where code.code_language = AMS_CORE_SYSTEM.THEME_LANGUAGE
                      and code.code_group = AMS_CORE_CODE.OUTLET_INFO_TYPE_POSI
                      and trunc(sysdate, 'DD')
                          between nvl(code.from_date, AMS_CORE_SYSTEM.DATE_MIN_VALUE)
                          and nvl(code.to_date, AMS_CORE_SYSTEM.DATE_MAX_VALUE)
              ) pos
                  on pos.position_code = key.position_code
              order by area.area_code,
                  nlssort(key.company_name, 'nls_sort=Vietnamese'),
                  nlssort(key.agency_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.unit_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(key.outlet_ams_id, 'nls_sort=Vietnamese');
          end if;
      end;

      --lay ra truong ban
      procedure get_sv03(valCompanyID number := null,
          row_records out sys_refcursor)
      is
          var_branch_id number(10) := nvl(valCompanyID, 0);
          var_record_date date := trunc(sysdate, 'YYYY');
      begin
        begin
            select /*+ CARDINALITY(tmp, 100) */
               tmp.record_date
               into var_record_date
            from ams.la_vietstar_outlet_2012 tmp
            where rownum <= 1;
        exception
         when others then
             var_record_date := trunc(sysdate, 'YYYY');
        end;
         --tra o muc cong ty co chon
          --tra o muc co chon cong ty va chon chi tiet den dai ly
          if valCompanyID is not null then
              open row_records for
              select  /*+
                  CARDINALITY(key, 100)
                  CARDINALITY(area, 100)
                  CARDINALITY(pos, 100)
                  */
                  row_number() over (order by area.area_code,
                  nlssort(key.company_name, 'nls_sort=Vietnamese'),
                  nlssort(key.agency_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.unit_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(key.outlet_ams_id, 'nls_sort=Vietnamese')
                  ) row_num,
                  area.area_name,
                  key.outlet_ams_id,
                  key.outlet_name,
                  key.outlet_id,
                  key.outlet_bvlife_id,
                  key.outlet_talisman_id,
                  key.company_id,
                  key.company_name,
                  key.office_id,
                  key.office_name,
                  key.agency_id,
                  key.agency_name,
                  key.unit_id,
                  key.unit_name,
                  key.position_code,
                  pos.position_name,
                  key.status_code,
                  to_char(key.effective_date, 'DD/MM/YYYY') effective_date,
                  to_char(key.terminative_date, 'DD/MM/YYYY') terminative_date,
                  to_char(key.amvs_effective_date, 'DD/MM/YYYY') amvs_effective_date,
                  key.amvs_fyp
              from
              (
                  select /*+ CARDINALITY(lre, 100)*/
                      lre.outlet_ams_id,
                      lre.outlet_name,
                      lre.outlet_id,
                      lre.type_code,
                      lre.outlet_bvlife_id,
                      lre.outlet_talisman_id,
                      lre.company_id,
                      lre.company_name,
                      lre.office_id,
                      lre.office_name,
                      lre.agency_id,
                      lre.agency_name,
                      lre.unit_id,
                      lre.unit_name,
                      lre.position_code,
                      lre.status_code,
                      lre.effective_date,
                      lre.terminative_date,
                      lre.amvs_effective_date,
                      lre.amvs_fyp
                  from ams.la_vietstar_outlet_2012 lre
                  where lre.record_date = var_record_date
                      and lre.company_id = var_branch_id
                      and lre.position_code in (
                          ams.LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_AM
                      )
              ) key
              left join
              ( --lay ra ten khu vuc vao day luon
                  select  /*+ CARDINALITY(temp, 100)*/
                      temp.company_id,
                      temp.area_code,
                      temp.area_name
                  from ams.la_saoviet_company_area temp
              ) area
                  on area.company_id = key.company_id
              left join
              (
                  select /*+ CARDINALITY(code, 100)*/
                      code.code_code position_code,
                      code.code_value position_name
                  from ams.cla_codes code
                  where code.code_language = AMS_CORE_SYSTEM.THEME_LANGUAGE
                      and code.code_group = AMS_CORE_CODE.OUTLET_INFO_TYPE_POSI
                      and trunc(sysdate, 'DD')
                          between nvl(code.from_date, AMS_CORE_SYSTEM.DATE_MIN_VALUE)
                          and nvl(code.to_date, AMS_CORE_SYSTEM.DATE_MAX_VALUE)
              ) pos
                  on pos.position_code = key.position_code
              order by area.area_code,
                  nlssort(key.company_name, 'nls_sort=Vietnamese'),
                  nlssort(key.agency_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.unit_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(key.outlet_ams_id, 'nls_sort=Vietnamese');
          else
              --tra o muc tong cong ty
              open row_records for
              select  /*+
                  CARDINALITY(key, 100)
                  CARDINALITY(area, 100)
                  CARDINALITY(pos, 100)
                  */
                  row_number() over (order by area.area_code,
                  nlssort(key.company_name, 'nls_sort=Vietnamese'),
                  nlssort(key.agency_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.unit_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(key.outlet_ams_id, 'nls_sort=Vietnamese')
                  ) row_num,
                  area.area_name,
                  key.outlet_ams_id,
                  key.outlet_name,
                  key.outlet_id,
                  key.outlet_bvlife_id,
                  key.outlet_talisman_id,
                  key.company_id,
                  key.company_name,
                  key.office_id,
                  key.office_name,
                  key.agency_id,
                  key.agency_name,
                  key.unit_id,
                  key.unit_name,
                  key.position_code,
                  pos.position_name,
                  key.status_code,
                  to_char(key.effective_date, 'DD/MM/YYYY') effective_date,
                  to_char(key.terminative_date, 'DD/MM/YYYY') terminative_date,
                  to_char(key.amvs_effective_date, 'DD/MM/YYYY') amvs_effective_date,
                  key.amvs_fyp
              from
              (
                  select /*+ CARDINALITY(lre, 100)*/
                      lre.outlet_ams_id,
                      lre.outlet_name,
                      lre.outlet_id,
                      lre.type_code,
                      lre.outlet_bvlife_id,
                      lre.outlet_talisman_id,
                      lre.company_id,
                      lre.company_name,
                      lre.office_id,
                      lre.office_name,
                      lre.agency_id,
                      lre.agency_name,
                      lre.unit_id,
                      lre.unit_name,
                      lre.position_code,
                      lre.status_code,
                      lre.effective_date,
                      lre.terminative_date,
                      lre.amvs_effective_date,
                      lre.amvs_fyp
                  from ams.la_vietstar_outlet_2012 lre
                  where  lre.record_date = var_record_date
                      and lre.position_code in (
                          ams.LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_AM
                      )
              ) key
              left join
              ( --lay ra ten khu vuc vao day luon
                  select  /*+ CARDINALITY(temp, 100)*/
                      temp.company_id,
                      temp.area_code,
                      temp.area_name
                  from ams.la_saoviet_company_area temp
              ) area
                  on area.company_id = key.company_id
              left join
              (
                  select /*+ CARDINALITY(code, 100)*/
                      code.code_code position_code,
                      code.code_value position_name
                  from ams.cla_codes code
                  where code.code_language = AMS_CORE_SYSTEM.THEME_LANGUAGE
                      and code.code_group = AMS_CORE_CODE.OUTLET_INFO_TYPE_POSI
                      and trunc(sysdate, 'DD')
                          between nvl(code.from_date, AMS_CORE_SYSTEM.DATE_MIN_VALUE)
                          and nvl(code.to_date, AMS_CORE_SYSTEM.DATE_MAX_VALUE)
              ) pos
                  on pos.position_code = key.position_code
              order by area.area_code,
                  nlssort(key.company_name, 'nls_sort=Vietnamese'),
                  nlssort(key.agency_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.unit_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(key.outlet_ams_id, 'nls_sort=Vietnamese');
          end if;
      end;

      --lay ra ca nhan thu phi
      procedure get_sv04(valCompanyID number := null,
          row_records out sys_refcursor)
      is
          var_branch_id number(10) := nvl(valCompanyID, 0);
          var_record_date date := trunc(sysdate, 'YYYY');
      begin
        begin
            select /*+ CARDINALITY(tmp, 100) */
               tmp.record_date
               into var_record_date
            from ams.la_vietstar_outlet_2012 tmp
            where rownum <= 1;
        exception
         when others then
             var_record_date := trunc(sysdate, 'YYYY');
        end;
         --tra o muc cong ty co chon
          --tra o muc co chon cong ty va chon chi tiet den dai ly
          if valCompanyID is not null then
              open row_records for
              select  /*+
                  CARDINALITY(key, 100)
                  CARDINALITY(area, 100)
                  CARDINALITY(pos, 100)
                  */
                  row_number() over (order by area.area_code,
                  nlssort(key.company_name, 'nls_sort=Vietnamese'),
                  nlssort(key.agency_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.unit_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(key.outlet_ams_id, 'nls_sort=Vietnamese')
                  ) row_num,
                  area.area_name,
                  key.outlet_ams_id,
                  key.outlet_name,
                  key.outlet_id,
                  key.outlet_bvlife_id,
                  key.outlet_talisman_id,
                  key.company_id,
                  key.company_name,
                  key.office_id,
                  key.office_name,
                  key.agency_id,
                  key.agency_name,
                  key.unit_id,
                  key.unit_name,
                  key.position_code,
                  nvl(pos.position_name, pos_term.position_name) position_name,
                  key.status_code,
                  to_char(key.effective_date, 'DD/MM/YYYY') effective_date,
                  to_char(key.terminative_date, 'DD/MM/YYYY') terminative_date,
                  key.cagv_is_coll,
                  key.cagv_fyp,
                  key.cagv_numb_of_poli,
                  key.cagv_coll_prem,
                  key.cagv_real_prem,
                  key.cagv_coll_rate_avrg,
                  key.cagv_cont_mang,
                  key.cagv_cont_canc,
                  key.cagv_pers_rate_avrg
              from
              (
                  select /*+ CARDINALITY(lre, 100)*/
                      lre.outlet_ams_id,
                      lre.outlet_name,
                      lre.outlet_id,
                      lre.type_code,
                      lre.outlet_bvlife_id,
                      lre.outlet_talisman_id,
                      lre.company_id,
                      lre.company_name,
                      lre.office_id,
                      lre.office_name,
                      lre.agency_id,
                      lre.agency_name,
                      lre.unit_id,
                      lre.unit_name,
                      lre.position_code,
                      lre.status_code,
                      lre.effective_date,
                      lre.terminative_date,
                      lre.cagv_is_coll,
                      lre.cagv_fyp,
                      lre.cagv_numb_of_poli,
                      lre.cagv_coll_prem,
                      lre.cagv_real_prem,
                      lre.cagv_coll_rate_avrg,
                      lre.cagv_cont_mang,
                      lre.cagv_cont_canc,
                      lre.cagv_pers_rate_avrg
                  from ams.la_vietstar_outlet_2012 lre
                  where lre.record_date = var_record_date
                      and lre.company_id = var_branch_id
              ) key
              left join
              ( --lay ra ten khu vuc vao day luon
                  select  /*+ CARDINALITY(temp, 100)*/
                      temp.company_id,
                      temp.area_code,
                      temp.area_name
                  from ams.la_saoviet_company_area temp
              ) area
                  on area.company_id = key.company_id
              left join
              (
                  select /*+ CARDINALITY(code, 100)*/
                      code.code_code position_code,
                      code.code_value position_name
                  from ams.cla_codes code
                  where code.code_language = AMS_CORE_SYSTEM.THEME_LANGUAGE
                      and code.code_group = AMS_CORE_CODE.OUTLET_INFO_TYPE_POSI
                      and trunc(sysdate, 'DD')
                          between nvl(code.from_date, AMS_CORE_SYSTEM.DATE_MIN_VALUE)
                          and nvl(code.to_date, AMS_CORE_SYSTEM.DATE_MAX_VALUE)
              ) pos
                  on pos.position_code = key.position_code
              left join
              (
                  select lha.agent_id,
                      lha.history_value position_code
                  from ams.la_history_agent lha
                  where lha.type_code = 'CVDL_CODE'
                      and lha.current_is = 'Y'
              ) cv
                  on cv.agent_id = key.outlet_id
              left join
              (
                  select /*+ CARDINALITY(code, 100)*/
                      code.code_code position_code,
                      code.code_value position_name
                  from ams.cla_codes code
                  where code.code_language = AMS_CORE_SYSTEM.THEME_LANGUAGE
                      and code.code_group = AMS_CORE_CODE.OUTLET_INFO_TYPE_POSI
                      and trunc(sysdate, 'DD')
                          between nvl(code.from_date, AMS_CORE_SYSTEM.DATE_MIN_VALUE)
                          and nvl(code.to_date, AMS_CORE_SYSTEM.DATE_MAX_VALUE)
              ) pos_term
                  on pos_term.position_code = cv.position_code
              order by area.area_code,
                  nlssort(key.company_name, 'nls_sort=Vietnamese'),
                  nlssort(key.agency_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.unit_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(key.outlet_ams_id, 'nls_sort=Vietnamese');
          else
              --tra o muc tong cong ty
              open row_records for
              select  /*+
                  CARDINALITY(key, 100)
                  CARDINALITY(area, 100)
                  CARDINALITY(pos, 100)
                  */
                  row_number() over (order by area.area_code,
                  nlssort(key.company_name, 'nls_sort=Vietnamese'),
                  nlssort(key.agency_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.unit_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(key.outlet_ams_id, 'nls_sort=Vietnamese')
                  ) row_num,
                  area.area_name,
                  key.outlet_ams_id,
                  key.outlet_name,
                  key.outlet_id,
                  key.outlet_bvlife_id,
                  key.outlet_talisman_id,
                  key.company_id,
                  key.company_name,
                  key.office_id,
                  key.office_name,
                  key.agency_id,
                  key.agency_name,
                  key.unit_id,
                  key.unit_name,
                  key.position_code,
                  nvl(pos.position_name, pos_term.position_name) position_name,
                  key.status_code,
                  to_char(key.effective_date, 'DD/MM/YYYY') effective_date,
                  to_char(key.terminative_date, 'DD/MM/YYYY') terminative_date,
                  key.cagv_is_coll,
                  key.cagv_fyp,
                  key.cagv_numb_of_poli,
                  key.cagv_coll_prem,
                  key.cagv_real_prem,
                  key.cagv_coll_rate_avrg,
                  key.cagv_cont_mang,
                  key.cagv_cont_canc,
                  key.cagv_pers_rate_avrg
              from
              (
                  select /*+ CARDINALITY(lre, 100)*/
                      lre.outlet_ams_id,
                      lre.outlet_name,
                      lre.outlet_id,
                      lre.type_code,
                      lre.outlet_bvlife_id,
                      lre.outlet_talisman_id,
                      lre.company_id,
                      lre.company_name,
                      lre.office_id,
                      lre.office_name,
                      lre.agency_id,
                      lre.agency_name,
                      lre.unit_id,
                      lre.unit_name,
                      lre.position_code,
                      lre.status_code,
                      lre.effective_date,
                      lre.terminative_date,
                      lre.cagv_is_coll,
                      lre.cagv_fyp,
                      lre.cagv_numb_of_poli,
                      lre.cagv_coll_prem,
                      lre.cagv_real_prem,
                      lre.cagv_coll_rate_avrg,
                      lre.cagv_cont_mang,
                      lre.cagv_cont_canc,
                      lre.cagv_pers_rate_avrg
                  from ams.la_vietstar_outlet_2012 lre
                  where lre.record_date = var_record_date
              ) key
              left join
              ( --lay ra ten khu vuc vao day luon
                  select  /*+ CARDINALITY(temp, 100)*/
                      temp.company_id,
                      temp.area_code,
                      temp.area_name
                  from ams.la_saoviet_company_area temp
              ) area
                  on area.company_id = key.company_id
              left join
              (
                  select /*+ CARDINALITY(code, 100)*/
                      code.code_code position_code,
                      code.code_value position_name
                  from ams.cla_codes code
                  where code.code_language = AMS_CORE_SYSTEM.THEME_LANGUAGE
                      and code.code_group = AMS_CORE_CODE.OUTLET_INFO_TYPE_POSI
                      and trunc(sysdate, 'DD')
                          between nvl(code.from_date, AMS_CORE_SYSTEM.DATE_MIN_VALUE)
                          and nvl(code.to_date, AMS_CORE_SYSTEM.DATE_MAX_VALUE)
              ) pos
                  on pos.position_code = key.position_code
              left join
              (
                  select lha.agent_id,
                      lha.history_value position_code
                  from ams.la_history_agent lha
                  where lha.type_code = 'CVDL_CODE'
                      and lha.current_is = 'Y'
              ) cv
                  on cv.agent_id = key.outlet_id
              left join
              (
                  select /*+ CARDINALITY(code, 100)*/
                      code.code_code position_code,
                      code.code_value position_name
                  from ams.cla_codes code
                  where code.code_language = AMS_CORE_SYSTEM.THEME_LANGUAGE
                      and code.code_group = AMS_CORE_CODE.OUTLET_INFO_TYPE_POSI
                      and trunc(sysdate, 'DD')
                          between nvl(code.from_date, AMS_CORE_SYSTEM.DATE_MIN_VALUE)
                          and nvl(code.to_date, AMS_CORE_SYSTEM.DATE_MAX_VALUE)
              ) pos_term
                  on pos_term.position_code = cv.position_code
              order by area.area_code,
                  nlssort(key.company_name, 'nls_sort=Vietnamese'),
                  nlssort(key.agency_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.unit_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(key.outlet_ams_id, 'nls_sort=Vietnamese');
          end if;
      end;

    /*
        Creater: Le Khac Chinh
        Date Create: 1/6/2013
        Version: 1.0
        Description: Lay danh sach ket qua thi dua truong nhom thu phi
        Parameter:
            valCompanyID [number]: Ma cong ty
            row_records [cursor]: Du lieu tra ve
        Update:  Le Khac Chinh
            Version: 1.1
            Date Updated: 18/7/2013
            Note:  Fix lai chuong trinh theo yeu cau: #107701 cua BA
                      Hien thi ca truong ban vao bao cao
    */
      procedure get_sv05(valCompanyID number := null,
          row_records out sys_refcursor)
      is
          var_branch_id number(10) := nvl(valCompanyID, 0);
          var_record_date date := trunc(sysdate, 'YYYY');
      begin
        begin
            select /*+ CARDINALITY(tmp, 100) */
               tmp.record_date
               into var_record_date
            from ams.la_vietstar_outlet_2012 tmp
            where rownum <= 1;
        exception
         when others then
             var_record_date := trunc(sysdate, 'YYYY');
        end;
         --tra o muc cong ty co chon
          --tra o muc co chon cong ty va chon chi tiet den dai ly
          if valCompanyID is not null then
              open row_records for
              select  /*+
                  CARDINALITY(key, 100)
                  CARDINALITY(area, 100)
                  CARDINALITY(pos, 100)
                  */
                  row_number() over (order by area.area_code,
                  nlssort(key.company_name, 'nls_sort=Vietnamese'),
                  nlssort(key.agency_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.unit_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(key.outlet_ams_id, 'nls_sort=Vietnamese')
                  ) row_num,
                  area.area_name,
                  key.outlet_ams_id,
                  key.outlet_name,
                  key.outlet_id,
                  key.outlet_bvlife_id,
                  key.outlet_talisman_id,
                  key.company_id,
                  key.company_name,
                  key.office_id,
                  key.office_name,
                  key.agency_id,
                  key.agency_name,
                  key.unit_id,
                  key.unit_name,
                  key.position_code,
                  pos.position_name,
                  key.status_code,
                  to_char(key.effective_date, 'DD/MM/YYYY') effective_date,
                  to_char(key.terminative_date, 'DD/MM/YYYY') terminative_date,
                  to_char(key.cumv_effective_date, 'DD/MM/YYYY') cumv_effective_date,
                  key.cumv_root_fyp,
                  key.cumv_bonus_fyp,
                  key.cumv_fyp,
                  key.cumv_bonus_percent,
                  key.cumv_coll_prem,
                  key.cumv_real_prem,
                  key.cumv_real_prem_avrg,
                  key.cumv_coll_rate_avrg,
                  key.cumv_cont_mang,
                  key.cumv_cont_canc,
                  key.cumv_pers_rate_avrg,
                  key.cumv_numb_of_agnt
              from
              (
                  select /*+ CARDINALITY(lre, 100)*/
                      lre.outlet_ams_id,
                      lre.outlet_name,
                      lre.outlet_id,
                      lre.type_code,
                      lre.outlet_bvlife_id,
                      lre.outlet_talisman_id,
                      lre.company_id,
                      lre.company_name,
                      lre.office_id,
                      lre.office_name,
                      lre.agency_id,
                      lre.agency_name,
                      lre.unit_id,
                      lre.unit_name,
                      lre.position_code,
                      lre.status_code,
                      lre.effective_date,
                      lre.terminative_date,
                      lre.cumv_effective_date,
                      lre.cumv_root_fyp,
                      lre.cumv_bonus_fyp,
                      lre.cumv_fyp,
                      lre.cumv_bonus_percent,
                      lre.cumv_coll_prem,
                      lre.cumv_real_prem,
                      lre.cumv_real_prem_avrg,
                      lre.cumv_coll_rate_avrg,
                      lre.cumv_cont_mang,
                      lre.cumv_cont_canc,
                      lre.cumv_pers_rate_avrg,
                      lre.cumv_numb_of_agnt
                  from ams.la_vietstar_outlet_2012 lre
                  where lre.record_date = var_record_date
                      and lre.company_id = var_branch_id
                      and lre.position_code in (
                          ams.LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_UM,
                          ams.LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_CUM,
                          ams.LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_AM
                      )
              ) key
              left join
              ( --lay ra ten khu vuc vao day luon
                  select  /*+ CARDINALITY(temp, 100)*/
                      temp.company_id,
                      temp.area_code,
                      temp.area_name
                  from ams.la_saoviet_company_area temp
              ) area
                  on area.company_id = key.company_id
              left join
              (
                  select /*+ CARDINALITY(code, 100)*/
                      code.code_code position_code,
                      code.code_value position_name
                  from ams.cla_codes code
                  where code.code_language = AMS_CORE_SYSTEM.THEME_LANGUAGE
                      and code.code_group = AMS_CORE_CODE.OUTLET_INFO_TYPE_POSI
                      and trunc(sysdate, 'DD')
                          between nvl(code.from_date, AMS_CORE_SYSTEM.DATE_MIN_VALUE)
                          and nvl(code.to_date, AMS_CORE_SYSTEM.DATE_MAX_VALUE)
              ) pos
                  on pos.position_code = key.position_code
              order by area.area_code,
                  nlssort(key.company_name, 'nls_sort=Vietnamese'),
                  nlssort(key.agency_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.unit_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(key.outlet_ams_id, 'nls_sort=Vietnamese');
          else
              --tra o muc tong cong ty
              open row_records for
              select  /*+
                  CARDINALITY(key, 100)
                  CARDINALITY(area, 100)
                  CARDINALITY(pos, 100)
                  */
                  row_number() over (order by area.area_code,
                  nlssort(key.company_name, 'nls_sort=Vietnamese'),
                  nlssort(key.agency_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.unit_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(key.outlet_ams_id, 'nls_sort=Vietnamese')
                  ) row_num,
                  area.area_name,
                  key.outlet_ams_id,
                  key.outlet_name,
                  key.outlet_id,
                  key.type_code,
                  key.outlet_bvlife_id,
                  key.outlet_talisman_id,
                  key.company_id,
                  key.company_name,
                  key.office_id,
                  key.office_name,
                  key.agency_id,
                  key.agency_name,
                  key.unit_id,
                  key.unit_name,
                  key.position_code,
                  pos.position_name,
                  key.status_code,
                  to_char(key.effective_date, 'DD/MM/YYYY') effective_date,
                  to_char(key.terminative_date, 'DD/MM/YYYY') terminative_date,
                  to_char(key.cumv_effective_date, 'DD/MM/YYYY') cumv_effective_date,
                  key.cumv_root_fyp,
                  key.cumv_bonus_fyp,
                  key.cumv_fyp,
                  key.cumv_bonus_percent,
                  key.cumv_coll_prem,
                  key.cumv_real_prem,
                  key.cumv_real_prem_avrg,
                  key.cumv_coll_rate_avrg,
                  key.cumv_cont_mang,
                  key.cumv_cont_canc,
                  key.cumv_pers_rate_avrg,
                  key.cumv_numb_of_agnt
              from
              (
                  select /*+ CARDINALITY(lre, 100)*/
                      lre.outlet_ams_id,
                      lre.outlet_name,
                      lre.outlet_id,
                      lre.type_code,
                      lre.outlet_bvlife_id,
                      lre.outlet_talisman_id,
                      lre.company_id,
                      lre.company_name,
                      lre.office_id,
                      lre.office_name,
                      lre.agency_id,
                      lre.agency_name,
                      lre.unit_id,
                      lre.unit_name,
                      lre.position_code,
                      lre.status_code,
                      lre.effective_date,
                      lre.terminative_date,
                      lre.cumv_effective_date,
                      lre.cumv_root_fyp,
                      lre.cumv_bonus_fyp,
                      lre.cumv_fyp,
                      lre.cumv_bonus_percent,
                      lre.cumv_coll_prem,
                      lre.cumv_real_prem,
                      lre.cumv_real_prem_avrg,
                      lre.cumv_coll_rate_avrg,
                      lre.cumv_cont_mang,
                      lre.cumv_cont_canc,
                      lre.cumv_pers_rate_avrg,
                      lre.cumv_numb_of_agnt
                  from ams.la_vietstar_outlet_2012 lre
                  where  lre.record_date = var_record_date
                      and lre.position_code in (
                          ams.LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_UM,
                          ams.LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_CUM,
                          ams.LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_AM
                      )
              ) key
              left join
              ( --lay ra ten khu vuc vao day luon
                  select  /*+ CARDINALITY(temp, 100)*/
                      temp.company_id,
                      temp.area_code,
                      temp.area_name
                  from ams.la_saoviet_company_area temp
              ) area
                  on area.company_id = key.company_id
              left join
              (
                  select /*+ CARDINALITY(code, 100)*/
                      code.code_code position_code,
                      code.code_value position_name
                  from ams.cla_codes code
                  where code.code_language = AMS_CORE_SYSTEM.THEME_LANGUAGE
                      and code.code_group = AMS_CORE_CODE.OUTLET_INFO_TYPE_POSI
                      and trunc(sysdate, 'DD')
                          between nvl(code.from_date, AMS_CORE_SYSTEM.DATE_MIN_VALUE)
                          and nvl(code.to_date, AMS_CORE_SYSTEM.DATE_MAX_VALUE)
              ) pos
                  on pos.position_code = key.position_code
              order by area.area_code,
                  nlssort(key.company_name, 'nls_sort=Vietnamese'),
                  nlssort(key.agency_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.unit_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(key.outlet_ams_id, 'nls_sort=Vietnamese');
          end if;
      end;

      --lay ra thong tin phat trien nhom moi
      procedure get_sv06(valCompanyID number := null,
          row_records out sys_refcursor)
      is
          var_branch_id number(10) := nvl(valCompanyID, 0);
          valRecordDate date := trunc(sysdate - 1, 'MM');
          var_record_date date := trunc(sysdate, 'YYYY');
      begin
          begin
              select /*+ CARDINALITY(tmp, 100) */
                 tmp.record_date
                 into var_record_date
              from ams.la_vietstar_outlet_2012 tmp
              where rownum <= 1;
          exception
           when others then
               var_record_date := trunc(sysdate, 'YYYY');
          end;
          begin
              select max(tmp.record_date)
                  into valRecordDate
              from ams.la_vietstar_temp_outlet tmp;
              --neu ma no lay so lieu >= trunc(to_date('1-dec-2013'), 'MM') thi chuyen ve so lieu cuoi thang 11 nam 2013
              --boi vi nhu the thi moi dung trong thoi gian thi dua
              if trunc(valRecordDate, 'MM') >= trunc(to_date('1-dec-2013'), 'MM') then
                  valRecordDate := trunc(to_date('1-nov-2013'), 'MM');
              end if;
          exception
              when others then
                  valRecordDate := trunc(sysdate - 1, 'MM');
          end;

          --Truong hop nay la se xu ly duoc cho cau truc ban nhom day
          --lay tat ca tu bang la_vietstar_temp_devu_des
          --la se lay ra duoc du lieu cho no
          --tra o muc cong ty co chon
          --tra o muc co chon cong ty va chon chi tiet den dai ly
          if valCompanyID is not null then
              open row_records for
              select /*+ CARDINALITY(repo, 100)
                        CARDINALITY(outl, 100)
                        CARDINALITY(devu, 100)
                        */
                    repo.devu_branch_id,
                    bonus.company_name,
                    bonus.agency_name,
                    bonus.unit_name,
                    bonus.outlet_ams_id,
                    bonus.outlet_name,
                    bonus.umvs_root_fyp outl_root_fyp,
                    bonus.umvs_root_nagt_qty outl_root_new_outl_qty,
                    bonus.umvs_bonus_fyp outl_bonus_fyp,
                    bonus.umvs_bonus_nagt_qty outl_bonus_nagt_qty,
                    bonus.umvs_bonus_percent outl_bonus_percent,
                    devu.unit_name branch_name,
                    devu_pos.outlet_name new_outlet_name,
                    devu_pos.outlet_ams_id new_outlet_ams_id,
                    to_char(devu_pos.position_date, 'DD/MM/YYYY') effective_date,
                    repo.devu_sernior_by_months,
                    repo.devu_percent,
                    devu.umvs_root_fyp devu_root_fyp,
                    devu.umvs_root_nagt_qty devu_root_new_outl_qty,
                    repo.stt
              from
              (
                  select /*+ CARDINALITY(tmp, 100)*/
                      distinct
                      tmp.outl_outlet_id,
                      tmp.outl_branch_id,
                      tmp.devu_branch_id,
                      tmp.devu_fyp,
                      tmp.devu_bonus_fyp,
                      tmp.devu_new_outl_qty,
                      tmp.devu_bonus_new_outl_qty,
                      tmp.outl_level stt,
                      tmp.devu_percent,
                      tmp.devu_sernior_by_months
                  from ams.la_vietstar_temp_devu_des tmp
              ) repo
              left join
              (
                  select /*+ CARDINALITY(outl, 100)*/
                       outl.outlet_id,
                       outl.company_name,
                       outl.agency_name,
                      outl.unit_name,
                      outl.outlet_ams_id,
                      outl.outlet_name,
                      outl.umvs_root_fyp,
                      outl.umvs_bonus_fyp,
                      outl.umvs_root_nagt_qty,
                      outl.umvs_bonus_nagt_qty,
                      outl.umvs_bonus_percent,
                      case when  outl.position_code in  (
                        ams.LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_UM,
                        ams.LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_CUM)
                      then
                        outl.unit_id
                      when outl.position_code in  (ams.LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_AM)  then outl.agency_id
                      end branch_id
                  from ams.la_vietstar_outlet_2012 outl
                  where outl.record_date = trunc(valRecordDate, 'YYYY')
                      and outl.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
                      and outl.umvs_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                      and outl.company_id = var_branch_id
              ) bonus
                  on bonus.branch_id = repo.outl_branch_id
              left join /*lay ra nhom con truc thuoc cac thong tin cua nhom con*/
              (
                  select /*+ CARDINALITY(outl, 100)*/
                      outl.unit_id devu_branch_id,
                      outl.unit_name,
                      outl.outlet_name,
                      outl.umvs_root_fyp,
                      outl.umvs_root_nagt_qty
                  from ams.la_vietstar_outlet_2012 outl
                  where outl.record_date = trunc(valRecordDate, 'YYYY')
                      and outl.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
                     and outl.position_code in
                     (
                        ams.LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_UM,
                        ams.LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_CUM
                     )
                     and outl.company_id = var_branch_id
                     and outl.unit_id is not null
              ) devu
                  on devu.devu_branch_id = repo.devu_branch_id
              left join /*lay ra nhom con truc thuoc cac thong tin cua nhom con*/
              (
                  select /*+ CARDINALITY(outl, 100)*/
                      outl.unit_id devu_branch_id,
                      outl.position_date,
                      outl.outlet_name,
                      outl.outlet_ams_id
                  from ams.la_vietstar_temp_outlet outl
                  /*lay du lieu o thang cuoi cung cua no thi moi dung duoc*/
                  where outl.record_date = valRecordDate
                      and outl.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
                     and outl.position_code in
                     (
                        ams.LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_UM,
                        ams.LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_CUM
                     )
                     and outl.company_id = var_branch_id
                     and outl.unit_id is not null
              ) devu_pos
                  on devu_pos.devu_branch_id = repo.devu_branch_id
              where bonus.company_name is not null
              order by
                nlssort(bonus.company_name, 'nls_sort=Vietnamese'),
                nlssort(bonus.agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(bonus.unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(devu.unit_name, 'nls_sort=Vietnamese');
          else
              --tra o muc tong cong ty
              open row_records for
              select /*+ CARDINALITY(repo, 100)
                        CARDINALITY(outl, 100)
                        CARDINALITY(devu, 100)
                        */
                    repo.devu_branch_id,
                    bonus.company_name,
                    bonus.agency_name,
                    bonus.unit_name,
                    bonus.outlet_ams_id,
                    bonus.outlet_name,
                    bonus.umvs_root_fyp outl_root_fyp,
                    bonus.umvs_root_nagt_qty outl_root_new_outl_qty,
                    bonus.umvs_bonus_fyp outl_bonus_fyp,
                    bonus.umvs_bonus_nagt_qty outl_bonus_nagt_qty,
                    bonus.umvs_bonus_percent outl_bonus_percent,
                    devu.unit_name branch_name,
                    devu_pos.outlet_name new_outlet_name,
                    devu_pos.outlet_ams_id new_outlet_ams_id,
                    to_char(devu_pos.position_date, 'DD/MM/YYYY') effective_date,
                    repo.devu_sernior_by_months,
                    repo.devu_percent,
                    devu.umvs_root_fyp devu_root_fyp,
                    devu.umvs_root_nagt_qty devu_root_new_outl_qty,
                    repo.stt
              from
              (
                  select /*+ CARDINALITY(tmp, 100)*/
                      distinct
                      tmp.outl_outlet_id,
                      tmp.outl_branch_id,
                      tmp.devu_branch_id,
                      tmp.devu_fyp,
                      tmp.devu_bonus_fyp,
                      tmp.devu_new_outl_qty,
                      tmp.devu_bonus_new_outl_qty,
                      tmp.outl_level stt,
                      tmp.devu_percent,
                      tmp.devu_sernior_by_months
                  from ams.la_vietstar_temp_devu_des tmp
              ) repo
              left join
              (
                  select /*+ CARDINALITY(outl, 100)*/
                       outl.outlet_id,
                       outl.company_name,
                       outl.agency_name,
                      outl.unit_name,
                      outl.outlet_ams_id,
                      outl.outlet_name,
                      outl.umvs_root_fyp,
                      outl.umvs_bonus_fyp,
                      outl.umvs_root_nagt_qty,
                      outl.umvs_bonus_nagt_qty,
                      outl.umvs_bonus_percent,
                      case when  outl.position_code in  (
                        ams.LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_UM,
                        ams.LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_CUM)
                      then
                        outl.unit_id
                      when outl.position_code in  (ams.LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_AM)  then outl.agency_id
                      end branch_id
                  from ams.la_vietstar_outlet_2012 outl
                  where outl.record_date = trunc(valRecordDate, 'YYYY')
                      and outl.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
                      and outl.umvs_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
              ) bonus
                  on bonus.branch_id = repo.outl_branch_id
              left join /*lay ra nhom con truc thuoc cac thong tin cua nhom con*/
              (
                  select /*+ CARDINALITY(outl, 100)*/
                      outl.unit_id devu_branch_id,
                      outl.unit_name,
                      outl.outlet_name,
                      outl.umvs_root_fyp,
                      outl.umvs_root_nagt_qty
                  from ams.la_vietstar_outlet_2012 outl
                  where outl.record_date = trunc(valRecordDate, 'YYYY')
                      and outl.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
                     and outl.position_code in
                     (
                        ams.LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_UM,
                        ams.LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_CUM
                     )
                     and outl.unit_id is not null
              ) devu
                  on devu.devu_branch_id = repo.devu_branch_id
              left join /*lay ra nhom con truc thuoc cac thong tin cua nhom con*/
              (
                  select /*+ CARDINALITY(outl, 100)*/
                      outl.unit_id devu_branch_id,
                      outl.position_date,
                      outl.outlet_name,
                      outl.outlet_ams_id
                  from ams.la_vietstar_temp_outlet outl
                  /*lay du lieu o thang cuoi cung cua no thi moi dung duoc*/
                  where outl.record_date = valRecordDate
                      and outl.type_code = ams.LIFE_AGENCY_VIETSTAR_2013.MODULE_CODE
                     and outl.position_code in
                     (
                        ams.LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_UM,
                        ams.LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_CUM
                     )
                     and outl.unit_id is not null
              ) devu_pos
                  on devu_pos.devu_branch_id = repo.devu_branch_id
              where bonus.company_name is not null
              order by
                nlssort(bonus.company_name, 'nls_sort=Vietnamese'),
                nlssort(bonus.agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(bonus.unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(devu.unit_name, 'nls_sort=Vietnamese');
          end if;
      end;

      --lay ra toan bo thong tin ve cac dail ytuyen dung cua n
      procedure get_sv07(valCompanyID number := null,
          row_records out sys_refcursor)
      is
          var_branch_id number(10) := nvl(valCompanyID, 0);
          var_record_date date := trunc(sysdate, 'YYYY');
      begin
          begin
              select /*+ CARDINALITY(tmp, 100) */
                 tmp.record_date
                 into var_record_date
              from ams.la_vietstar_outlet_2012 tmp
              where rownum <= 1;
          exception
           when others then
               var_record_date := trunc(sysdate, 'YYYY');
          end;
         --tra o muc cong ty co chon
          --tra o muc co chon cong ty va chon chi tiet den dai ly
          if valCompanyID is not null then
              open row_records for
              select /*+ CARDINALITY(key, 100)*/
                  key.outlet_id,
                  key.outlet_number outlet_ams_id,
                  key.outlet_name,
                  key.company_id,
                  key.company_name,
                  key.office_id,
                  key.office_name,
                  key.agency_id,
                  key.agency_name,
                  key.unit_id,
                  key.unit_name,
                  to_char(key.begin_working_date, 'DD/MM/YYYY') begin_working_date,
                  key.umvs_be_paid,
                  key.umvs_be_executing,
                  key.umvs_data_date,
                  key.umvs_empl_id,
                  key.umvs_ip_60_days,
                  key.umvs_numb_of_nagt,
                  key.umvs_ip
              from la_vietstar_umvs_empl_2012 key
              where key.record_date = var_record_date
                  and key.company_id = var_branch_id
              order by
                  nlssort(key.company_name, 'nls_sort=Vietnamese'),
                  nlssort(key.agency_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.unit_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(key.outlet_number, 'nls_sort=Vietnamese');
          else
              --tra o muc tong cong ty
              open row_records for
              select /*+ CARDINALITY(key, 100)*/
                  key.outlet_id,
                  key.outlet_number outlet_ams_id,
                  key.outlet_name,
                  key.company_id,
                  key.company_name,
                  key.office_id,
                  key.office_name,
                  key.agency_id,
                  key.agency_name,
                  key.unit_id,
                  key.unit_name,
                  to_char(key.begin_working_date, 'DD/MM/YYYY') begin_working_date,
                  key.umvs_be_paid,
                  key.umvs_be_executing,
                  key.umvs_data_date,
                  key.umvs_empl_id,
                  key.umvs_ip_60_days,
                  key.umvs_numb_of_nagt,
                  key.umvs_ip
              from la_vietstar_umvs_empl_2012 key
              where key.record_date = var_record_date
              order by
                  nlssort(key.company_name, 'nls_sort=Vietnamese'),
                  nlssort(key.agency_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.unit_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(key.outlet_number, 'nls_sort=Vietnamese');
          end if;
      end;

      --chi tiet IP trong 60 ngay lam viec dau tien cua ban nhom do
      procedure get_sv08(valCompanyID number := null,
          row_records out sys_refcursor)
      is
          var_branch_id number(10) := nvl(valCompanyID, 0);
          var_record_date date := trunc(sysdate, 'YYYY');
      begin
          begin
              select /*+ CARDINALITY(tmp, 100) */
                 tmp.record_date
                 into var_record_date
              from ams.la_vietstar_outlet_2012 tmp
              where rownum <= 1;
          exception
           when others then
               var_record_date := trunc(sysdate, 'YYYY');
          end;
         --tra o muc cong ty co chon
          --tra o muc co chon cong ty va chon chi tiet den dai ly
          if valCompanyID is not null then
              open row_records for
              select /*+
                         CARDINALITY(outl, 100)
                         CARDINALITY(tran, 100)
                         CARDINALITY(trans_type, 100)
                         */
                  outl.outlet_id,
                  outl.outlet_number outlet_ams_id,
                  outl.outlet_name,
                  outl.company_id,
                  outl.company_name,
                  outl.office_id,
                  outl.office_name,
                  outl.agency_id,
                  outl.agency_name,
                  outl.unit_id,
                  outl.unit_name,
                  to_char(outl.begin_working_date, 'DD/MM/YYYY') begin_working_date,
                  outl.umvs_be_paid,
                  outl.umvs_be_executing,
                  to_char(outl.umvs_data_date, 'DD/MM/YYYY') umvs_data_date,
                  outl.umvs_empl_id,
                  outl.umvs_ip_60_days,
                  outl.umvs_numb_of_nagt,
                  outl.umvs_ip,
                  to_char(outl.begin_working_date, 'DD/MM/YYYY') begin_date,
                  to_char(add_months(outl.begin_working_date, 3) - 1 , 'DD/MM/YYYY') end_date,
                  nvl(trans_type.trans_name, tran.transaction_code) transaction_code,
                  to_char(tran.transaction_date, 'DD/MM/YYYY') transaction_date,
                  tran.policy_number,
                  tran.transaction_fyp,
                  tran.data_source
              from
              (
                  select /*+ CARDINALITY(tmp, 100)*/
                      tmp.outlet_id,
                      tmp.outlet_number,
                      tmp.outlet_name,
                      tmp.company_id,
                      tmp.company_name,
                      tmp.office_id,
                      tmp.office_name,
                      tmp.agency_id,
                      tmp.agency_name,
                      tmp.unit_id,
                      tmp.unit_name,
                      tmp.begin_working_date,
                      tmp.umvs_be_paid,
                      tmp.umvs_be_executing,
                      tmp.umvs_data_date,
                      tmp.umvs_empl_id,
                      tmp.umvs_ip_60_days,
                      tmp.umvs_numb_of_nagt,
                      tmp.umvs_ip,
                      (tmp.begin_working_date) begin_date,
                      (add_months(tmp.begin_working_date, 3) - 1) end_date
                  from ams.la_vietstar_umvs_empl_2012 tmp
                  where tmp.record_date = var_record_date
                      and tmp.umvs_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                      and tmp.company_id = var_branch_id
              ) outl
              /*cho nay can lam la IP trong 60 ngay lam viec dau tien cua no
              xet ngay hieu luc cho no
              can kiem tra xem cho nay chay co lau khong?*/
              join ams.la_vietstar_trans_ip tran
                  on
                  (
                      tran.outlet_id = outl.outlet_id
                      and
                      tran.transaction_date between outl.begin_date and outl.end_date
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
                  on trans_type.trans_code = tran.transaction_code
              order by
                  nlssort(outl.company_name, 'nls_sort=Vietnamese'),
                  nlssort(outl.agency_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(outl.unit_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(outl.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(outl.outlet_number, 'nls_sort=Vietnamese');
          else
              --tra o muc tong cong ty
              open row_records for
              select /*+
                         CARDINALITY(outl, 100)
                         CARDINALITY(tran, 100)
                         CARDINALITY(trans_type, 100)
                         */
                  outl.outlet_id,
                  outl.outlet_number outlet_ams_id,
                  outl.outlet_name,
                  outl.company_id,
                  outl.company_name,
                  outl.office_id,
                  outl.office_name,
                  outl.agency_id,
                  outl.agency_name,
                  outl.unit_id,
                  outl.unit_name,
                  to_char(outl.begin_working_date, 'DD/MM/YYYY') begin_working_date,
                  outl.umvs_be_paid,
                  outl.umvs_be_executing,
                  to_char(outl.umvs_data_date, 'DD/MM/YYYY') umvs_data_date,
                  outl.umvs_empl_id,
                  outl.umvs_ip_60_days,
                  outl.umvs_numb_of_nagt,
                  outl.umvs_ip,
                  to_char(outl.begin_working_date, 'DD/MM/YYYY') begin_date,
                  to_char(add_months(outl.begin_working_date, 3) - 1 , 'DD/MM/YYYY') end_date,
                  nvl(trans_type.trans_name, tran.transaction_code) transaction_code,
                  to_char(tran.transaction_date, 'DD/MM/YYYY') transaction_date,
                  tran.policy_number,
                  tran.transaction_fyp,
                  tran.data_source
              from
              (
                  select /*+ CARDINALITY(tmp, 100)*/
                      tmp.outlet_id,
                      tmp.outlet_number,
                      tmp.outlet_name,
                      tmp.company_id,
                      tmp.company_name,
                      tmp.office_id,
                      tmp.office_name,
                      tmp.agency_id,
                      tmp.agency_name,
                      tmp.unit_id,
                      tmp.unit_name,
                      tmp.begin_working_date,
                      tmp.umvs_be_paid,
                      tmp.umvs_be_executing,
                      tmp.umvs_data_date,
                      tmp.umvs_empl_id,
                      tmp.umvs_ip_60_days,
                      tmp.umvs_numb_of_nagt,
                      tmp.umvs_ip,
                      (tmp.begin_working_date) begin_date,
                      (add_months(tmp.begin_working_date, 3) - 1) end_date
                  from ams.la_vietstar_umvs_empl_2012 tmp
                  where tmp.record_date = var_record_date
                      and tmp.umvs_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
              ) outl
              /*cho nay can lam la IP trong 60 ngay lam viec dau tien cua no
              xet ngay hieu luc cho no
              can kiem tra xem cho nay chay co lau khong?*/
              join ams.la_vietstar_trans_ip tran
                  on
                  (
                      tran.outlet_id = outl.outlet_id
                      and
                      tran.transaction_date between outl.begin_date and outl.end_date
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
                  on trans_type.trans_code = tran.transaction_code
              order by
                  nlssort(outl.company_name, 'nls_sort=Vietnamese'),
                  nlssort(outl.agency_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(outl.unit_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(outl.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(outl.outlet_number, 'nls_sort=Vietnamese');
          end if;
      end;

      --lay ra toan bo thong tin ve FYP
      procedure get_sv09(valCompanyID number := null,
          row_records out sys_refcursor)
      is
          var_branch_id number(10) := nvl(valCompanyID, 0);
          valRecordDate date := trunc(sysdate - 2, 'MM');
          var_record_date date := trunc(sysdate, 'YYYY');
      begin
          begin
              select /*+ CARDINALITY(tmp, 100) */
                 tmp.record_date
                 into var_record_date
              from ams.la_vietstar_outlet_2012 tmp
              where rownum <= 1;
          exception
           when others then
               var_record_date := trunc(sysdate, 'YYYY');
          end;
          begin
              select max(tmp.record_date)
                  into valRecordDate
              from ams.mod_data_policy tmp
              where tmp.record_date <= add_months(trunc(sysdate, 'MM'), 1);
              --neu ma no lay so lieu >= trunc(to_date('1-dec-2013'), 'MM') thi chuyen ve so lieu thang 12 nam 2013
              --boi vi nhu the thi moi dung trong thoi gian thi dua
              if trunc(valRecordDate, 'MM') >= add_months(trunc(valRecordDate, 'YYYY'), 11) then
                  /*
                  Update by: Le Khac Chinh Ban PTUD
                  Version: 1.7.5.121214
                  Note: thay valRecordDate := trunc(to_date('1-dec-2013'), 'MM');
                           de lay so lieu moi nhat
                  */
                  valRecordDate := add_months(trunc(valRecordDate, 'YYYY'), 11);
              end if;
          exception
              when others then
                  valRecordDate := trunc(sysdate - 2, 'MM');
          end;
          --tra o muc cong ty co chon
          --tra o muc co chon cong ty va chon chi tiet den dai ly
          if valCompanyID is not null then
              open row_records for
              select  /*+ CARDINALITY(key, 100)
                          CARDINALITY(pol, 100)
                          CARDINALITY(freq, 100)
                          CARDINALITY(trans_type, 100)
                          */
                  key.outlet_ams_id,
                  key.outlet_name,
                  key.outlet_id,
                  key.position_code,
                  to_char(key.position_date, 'DD/MM/YYYY') position_date,
                  to_char(key.effective_date, 'DD/MM/YYYY') effective_date,
                  to_char(key.terminative_date, 'DD/MM/YYYY') terminative_date,
                  key.company_ams_id,
                  key.company_name,
                  key.office_ams_id,
                  key.office_name,
                  key.agency_ams_id,
                  key.agency_name,
                  key.unit_ams_id,
                  key.unit_name,
                  key.policy_number,
                  to_char(pol.freq_date, 'DD/MM/YYYY') freq_date,
                  to_char(pol.changes_date, 'DD/MM/YYYY') changes_date,
                  to_char(key.transaction_date, 'DD/MM/YYYY') transaction_date,
                  nvl(trans_type.trans_name, key.transaction_code) transaction_code,
                  freq.freq_name freq_name,
                  key.transaction_fyp,
                  key.data_source
              from
              (
                  select  /*+ CARDINALITY(tmp, 100)*/
                      tmp.outlet_ams_id,
                      tmp.outlet_name,
                      tmp.outlet_id,
                      tmp.position_code,
                      tmp.position_date,
                      tmp.effective_date,
                      tmp.terminative_date,
                      tmp.company_ams_id,
                      tmp.company_name,
                      tmp.office_ams_id,
                      tmp.office_name,
                      tmp.agency_ams_id,
                      tmp.agency_name,
                      tmp.unit_ams_id,
                      tmp.unit_name,
                      tmp.transaction_code,
                      tmp.transaction_date,
                      tmp.policy_number,
                      tmp.transaction_fyp,
                      tmp.data_source
                  from la_vietstar_trans_2012 tmp
                  where tmp.record_date = var_record_date
                      and tmp.company_id = var_branch_id
              ) key
              left join
              (
                  select /*+ CARDINALITY(pol, 100)*/
                      pol.policy_number,
                      pol.freq_date,
                      pol.freq_per_annum,
                      pol.changes_date
                  from ams.mod_data_policy pol
                  where pol.record_date = trunc(valRecordDate, 'MM')
                      and pol.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and pol.changes_code = AMS_MODL_BUSSINESS.POLYC_CODE_PROC
                      and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      and pol.changes_date
                          between var_record_date
                          and add_months(var_record_date, 12) - 1
                          --and to_date('31-dec-2013')
                      and pol.freq_date
                          between var_record_date
                          and add_months(var_record_date, 11) - 1
                          --and to_date('30-nov-2013')
                      and nvl(pol.main_product_code, '0') not in
                          (
                              '1010369',
                              '1010253'
                          )
              ) pol
                  on pol.policy_number = key.policy_number
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
                  on trans_type.trans_code = key.transaction_code
              left join
              (
                  select
                      code.code_code freq_code,
                      code.code_value freq_name
                  from ams.cla_codes code
                  where code.code_language = AMS_CORE_SYSTEM.THEME_LANGUAGE
                      and code.code_group = 'FREQ'
                      and trunc(sysdate, 'DD')
                          between nvl(code.from_date, AMS_CORE_SYSTEM.DATE_MIN_VALUE)
                          and nvl(code.to_date, AMS_CORE_SYSTEM.DATE_MAX_VALUE)
              ) freq
                  on to_number(freq.freq_code) = pol.freq_per_annum
              order by
                  nlssort(key.company_name, 'nls_sort=Vietnamese'),
                  nlssort(key.agency_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.unit_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(key.outlet_ams_id, 'nls_sort=Vietnamese'),
                  key.transaction_date,
                  key.policy_number;
          else
              --tra o muc tong cong ty
              open row_records for
              select  /*+ CARDINALITY(key, 100)
                          CARDINALITY(pol, 100)
                          CARDINALITY(freq, 100)
                          CARDINALITY(trans_type, 100)
                          */
                  key.outlet_ams_id,
                  key.outlet_name,
                  key.outlet_id,
                  key.position_code,
                  to_char(key.position_date, 'DD/MM/YYYY') position_date,
                  to_char(key.effective_date, 'DD/MM/YYYY') effective_date,
                  to_char(key.terminative_date, 'DD/MM/YYYY') terminative_date,
                  key.company_ams_id,
                  key.company_name,
                  key.office_ams_id,
                  key.office_name,
                  key.agency_ams_id,
                  key.agency_name,
                  key.unit_ams_id,
                  key.unit_name,
                  key.policy_number,
                  to_char(pol.freq_date, 'DD/MM/YYYY') freq_date,
                  to_char(pol.changes_date, 'DD/MM/YYYY') changes_date,
                  to_char(key.transaction_date, 'DD/MM/YYYY') transaction_date,
                  nvl(trans_type.trans_name, key.transaction_code) transaction_code,
                  freq.freq_name freq_name,
                  key.transaction_fyp,
                  key.data_source
              from
              (
                  select  /*+ CARDINALITY(tmp, 100)*/
                      tmp.outlet_ams_id,
                      tmp.outlet_name,
                      tmp.outlet_id,
                      tmp.position_code,
                      tmp.position_date,
                      tmp.effective_date,
                      tmp.terminative_date,
                      tmp.company_ams_id,
                      tmp.company_name,
                      tmp.office_ams_id,
                      tmp.office_name,
                      tmp.agency_ams_id,
                      tmp.agency_name,
                      tmp.unit_ams_id,
                      tmp.unit_name,
                      tmp.transaction_code,
                      tmp.transaction_date,
                      tmp.policy_number,
                      tmp.transaction_fyp,
                      tmp.data_source
                  from la_vietstar_trans_2012 tmp
                  where tmp.record_date = var_record_date
              ) key
              left join
              (
                  select /*+ CARDINALITY(pol, 100)*/
                      pol.policy_number,
                      pol.freq_date,
                      pol.freq_per_annum,
                      pol.changes_date
                  from ams.mod_data_policy pol
                  where pol.record_date = trunc(valRecordDate, 'MM')
                      and pol.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and pol.changes_code = AMS_MODL_BUSSINESS.POLYC_CODE_PROC
                      and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      and pol.changes_date
                          between var_record_date
                          and add_months(var_record_date, 12) - 1
                          --and to_date('31-dec-2013')
                      and pol.freq_date
                          between var_record_date
                          and add_months(var_record_date, 11) - 1
                          --and to_date('30-nov-2013')
                      and nvl(pol.main_product_code, '0') not in
                          (
                              '1010369',
                              '1010253'
                          )
              ) pol
                  on pol.policy_number = key.policy_number
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
                  on trans_type.trans_code = key.transaction_code
              left join
              (
                  select
                      code.code_code freq_code,
                      code.code_value freq_name
                  from ams.cla_codes code
                  where code.code_language = AMS_CORE_SYSTEM.THEME_LANGUAGE
                      and code.code_group = 'FREQ'
                      and trunc(sysdate, 'DD')
                          between nvl(code.from_date, AMS_CORE_SYSTEM.DATE_MIN_VALUE)
                          and nvl(code.to_date, AMS_CORE_SYSTEM.DATE_MAX_VALUE)
              ) freq
                  on to_number(freq.freq_code) = pol.freq_per_annum
              order by
                  nlssort(key.company_name, 'nls_sort=Vietnamese'),
                  nlssort(key.agency_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.unit_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(key.outlet_ams_id, 'nls_sort=Vietnamese'),
                  key.transaction_date,
                  key.policy_number;
          end if;
      end;

      --lay ra toan bo thong tin ve FYP
      procedure get_sv09_01(valCompanyID number := null,
          row_records out sys_refcursor)
      is
          var_branch_id number(10) := nvl(valCompanyID, 0);
          valRecordDate date := trunc(sysdate - 2, 'MM');
          var_record_date date := trunc(sysdate, 'YYYY');
      begin
          begin
              select /*+ CARDINALITY(tmp, 100) */
                 tmp.record_date
                 into var_record_date
              from ams.la_vietstar_outlet_2012 tmp
              where rownum <= 1;
          exception
           when others then
               var_record_date := trunc(sysdate, 'YYYY');
          end;
          begin
              select max(tmp.record_date)
                  into valRecordDate
              from ams.mod_data_policy tmp
              where tmp.record_date <= add_months(trunc(sysdate, 'MM'), 1);
              --neu ma no lay so lieu >= trunc(to_date('1-dec-2013'), 'MM') thi chuyen ve so lieu thang 12 nam 2013
              --boi vi nhu the thi moi dung trong thoi gian thi dua
              if trunc(valRecordDate, 'MM') >= add_months(trunc(valRecordDate, 'YYYY'), 11) then
                  /*
                  Update by: Le Khac Chinh Ban PTUD
                  Version: 1.7.5.121214
                  Note: thay valRecordDate := trunc(to_date('1-dec-2013'), 'MM');
                           de lay so lieu moi nhat
                  */
                  valRecordDate := add_months(trunc(valRecordDate, 'YYYY'), 11);
              end if;
          exception
              when others then
                  valRecordDate := trunc(sysdate - 2, 'MM');
          end;
          --tra o muc cong ty co chon
          --tra o muc co chon cong ty va chon chi tiet den dai ly
          if valCompanyID is not null then
              open row_records for
              select  /*+ CARDINALITY(key, 100)
                          CARDINALITY(pol, 100)
                          CARDINALITY(freq, 100)
                          CARDINALITY(trans_type, 100)
                          CARDINALITY(pos, 100)
                          CARDINALITY(cv, 100)
                          CARDINALITY(pos_term, 100)
                          */
                  key.outlet_ams_id,
                  key.outlet_name,
                  key.outlet_id,
                  nvl(pos.position_name, pos_term.position_name) position_name,
                  to_char(key.position_date, 'DD/MM/YYYY') position_date,
                  to_char(key.effective_date, 'DD/MM/YYYY') effective_date,
                  to_char(key.terminative_date, 'DD/MM/YYYY') terminative_date,
                  key.company_ams_id,
                  key.company_name,
                  key.office_ams_id,
                  key.office_name,
                  key.agency_ams_id,
                  key.agency_name,
                  case when  key.agency_ams_id <>  key.org_agency_ams_id then
                      key.org_agency_name
                  end org_agency_name,
                  key.unit_ams_id,
                  key.unit_name,
                  case when key.unit_ams_id <> key.org_unit_ams_id then
                      key.org_unit_name
                  end org_unit_name,
                  key.policy_number,
                  to_char(pol.freq_date, 'DD/MM/YYYY') freq_date,
                  to_char(pol.changes_date, 'DD/MM/YYYY') changes_date,
                  to_char(key.transaction_date, 'DD/MM/YYYY') transaction_date,
                  nvl(trans_type.trans_name, key.transaction_code) transaction_code,
                  freq.freq_name,
                  key.transaction_fyp,
                  key.data_source
              from
              (
                  select  /*+ CARDINALITY(tmp, 100)*/
                      tmp.outlet_ams_id,
                      tmp.outlet_name,
                      tmp.outlet_id,
                      tmp.position_code,
                      tmp.position_date,
                      tmp.effective_date,
                      tmp.terminative_date,
                      tmp.company_ams_id,
                      tmp.company_name,
                      tmp.office_ams_id,
                      tmp.office_name,
                      tmp.agency_ams_id,
                      tmp.agency_name,
                      tmp.org_agency_ams_id,
                      tmp.org_agency_name,
                      tmp.unit_ams_id,
                      tmp.unit_name,
                      tmp.org_unit_ams_id,
                      tmp.org_unit_name,
                      tmp.transaction_code,
                      tmp.transaction_date,
                      tmp.policy_number,
                      tmp.transaction_fyp,
                      tmp.data_source
                  from la_vietstar_trans_2012_ext tmp
                  where tmp.record_date = var_record_date
                      and tmp.company_id = var_branch_id
              ) key
              left join
              (
                  select /*+ CARDINALITY(pol, 100)*/
                      pol.policy_number,
                      pol.freq_date,
                      pol.freq_per_annum,
                      pol.changes_date
                  from ams.mod_data_policy pol
                  where pol.record_date = trunc(valRecordDate, 'MM')
                      and pol.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and pol.changes_code = AMS_MODL_BUSSINESS.POLYC_CODE_PROC
                      and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      and pol.changes_date
                          between var_record_date
                          and add_months(var_record_date, 12) - 1
                          --and to_date('31-dec-2013')
                      and pol.freq_date
                          between var_record_date
                          and add_months(var_record_date, 11) - 1
                          --and to_date('30-nov-2013')
                      and nvl(pol.main_product_code, '0') not in
                          (
                              '1010369',
                              '1010253'
                          )
              ) pol
                  on pol.policy_number = key.policy_number
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
                  on trans_type.trans_code = key.transaction_code
              left join
              (
                  select
                      code.code_code freq_code,
                      code.code_value freq_name
                  from ams.cla_codes code
                  where code.code_language = AMS_CORE_SYSTEM.THEME_LANGUAGE
                      and code.code_group = 'FREQ'
                      and trunc(sysdate, 'DD')
                          between nvl(code.from_date, AMS_CORE_SYSTEM.DATE_MIN_VALUE)
                          and nvl(code.to_date, AMS_CORE_SYSTEM.DATE_MAX_VALUE)
              ) freq
                  on to_number(freq.freq_code) = pol.freq_per_annum
              left join
              (
                  select /*+ CARDINALITY(code, 100)*/
                      code.code_code position_code,
                      code.code_value position_name
                  from ams.cla_codes code
                  where code.code_language = AMS_CORE_SYSTEM.THEME_LANGUAGE
                      and code.code_group = AMS_CORE_CODE.OUTLET_INFO_TYPE_POSI
                      and trunc(sysdate, 'DD')
                          between nvl(code.from_date, AMS_CORE_SYSTEM.DATE_MIN_VALUE)
                          and nvl(code.to_date, AMS_CORE_SYSTEM.DATE_MAX_VALUE)
              ) pos
                  on pos.position_code = key.position_code
              left join
              (
                  select  /*+ CARDINALITY(lha, 100)*/
                      lha.agent_id,
                      lha.history_value position_code
                  from ams.la_history_agent lha
                  where lha.type_code = 'CVDL_CODE'
                      and lha.current_is = 'Y'
              ) cv
                  on cv.agent_id = key.outlet_id
              left join
              (
                  select /*+ CARDINALITY(code, 100)*/
                      code.code_code position_code,
                      code.code_value position_name
                  from ams.cla_codes code
                  where code.code_language = AMS_CORE_SYSTEM.THEME_LANGUAGE
                      and code.code_group = AMS_CORE_CODE.OUTLET_INFO_TYPE_POSI
                      and trunc(sysdate, 'DD')
                          between nvl(code.from_date, AMS_CORE_SYSTEM.DATE_MIN_VALUE)
                          and nvl(code.to_date, AMS_CORE_SYSTEM.DATE_MAX_VALUE)
              ) pos_term
                  on pos_term.position_code = cv.position_code
              order by
                  nlssort(key.company_name, 'nls_sort=Vietnamese'),
                  nlssort(key.agency_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.unit_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(key.outlet_ams_id, 'nls_sort=Vietnamese'),
                  key.transaction_date,
                  key.policy_number;
          else
              --tra o muc tong cong ty
              open row_records for
              select  /*+ CARDINALITY(key, 100)
                          CARDINALITY(pol, 100)
                          CARDINALITY(freq, 100)
                          CARDINALITY(trans_type, 100)
                          CARDINALITY(pos, 100)
                          CARDINALITY(cv, 100)
                          CARDINALITY(pos_term, 100)
                          */
                  key.outlet_ams_id,
                  key.outlet_name,
                  key.outlet_id,
                  nvl(pos.position_name, pos_term.position_name) position_name,
                  to_char(key.position_date, 'DD/MM/YYYY') position_date,
                  to_char(key.effective_date, 'DD/MM/YYYY') effective_date,
                  to_char(key.terminative_date, 'DD/MM/YYYY') terminative_date,
                  key.company_ams_id,
                  key.company_name,
                  key.office_ams_id,
                  key.office_name,
                  key.agency_ams_id,
                  key.agency_name,
                  case when  key.agency_ams_id <>  key.org_agency_ams_id then
                      key.org_agency_name
                  end org_agency_name,
                  key.unit_ams_id,
                  key.unit_name,
                  case when key.unit_ams_id <> key.org_unit_ams_id then
                      key.org_unit_name
                  end org_unit_name,
                  key.policy_number,
                  to_char(pol.freq_date, 'DD/MM/YYYY') freq_date,
                  to_char(pol.changes_date, 'DD/MM/YYYY') changes_date,
                  to_char(key.transaction_date, 'DD/MM/YYYY') transaction_date,
                  nvl(trans_type.trans_name, key.transaction_code) transaction_code,
                  freq.freq_name,
                  key.transaction_fyp,
                  key.data_source
              from
              (
                  select  /*+ CARDINALITY(tmp, 100)*/
                      tmp.outlet_ams_id,
                      tmp.outlet_name,
                      tmp.outlet_id,
                      tmp.position_code,
                      tmp.position_date,
                      tmp.effective_date,
                      tmp.terminative_date,
                      tmp.company_ams_id,
                      tmp.company_name,
                      tmp.office_ams_id,
                      tmp.office_name,
                      tmp.agency_ams_id,
                      tmp.agency_name,
                      tmp.org_agency_ams_id,
                      tmp.org_agency_name,
                      tmp.unit_ams_id,
                      tmp.unit_name,
                      tmp.org_unit_ams_id,
                      tmp.org_unit_name,
                      tmp.transaction_code,
                      tmp.transaction_date,
                      tmp.policy_number,
                      tmp.transaction_fyp,
                      tmp.data_source
                  from la_vietstar_trans_2012_ext tmp
                  where tmp.record_date = var_record_date
              ) key
              left join
              (
                  select /*+ CARDINALITY(pol, 100)*/
                      pol.policy_number,
                      pol.freq_date,
                      pol.freq_per_annum,
                      pol.changes_date
                  from ams.mod_data_policy pol
                  where pol.record_date = trunc(valRecordDate, 'MM')
                      and pol.type_of_data = AMS_MODL_BUSSINESS.MODULE_CODE_MAIN
                      and pol.changes_code = AMS_MODL_BUSSINESS.POLYC_CODE_PROC
                      and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      and pol.changes_date
                          between var_record_date
                          and add_months(var_record_date, 12) - 1
                          --and to_date('31-dec-2013')
                      and pol.freq_date
                          between var_record_date
                          and add_months(var_record_date, 11) - 1
                          --and to_date('30-nov-2013')
                      and nvl(pol.main_product_code, '0') not in
                          (
                              '1010369',
                              '1010253'
                          )
              ) pol
                  on pol.policy_number = key.policy_number
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
                  on trans_type.trans_code = key.transaction_code
              left join
              (
                  select
                      code.code_code freq_code,
                      code.code_value freq_name
                  from ams.cla_codes code
                  where code.code_language = AMS_CORE_SYSTEM.THEME_LANGUAGE
                      and code.code_group = 'FREQ'
                      and trunc(sysdate, 'DD')
                          between nvl(code.from_date, AMS_CORE_SYSTEM.DATE_MIN_VALUE)
                          and nvl(code.to_date, AMS_CORE_SYSTEM.DATE_MAX_VALUE)
              ) freq
                  on to_number(freq.freq_code) = pol.freq_per_annum
              left join
              (
                  select /*+ CARDINALITY(code, 100)*/
                      code.code_code position_code,
                      code.code_value position_name
                  from ams.cla_codes code
                  where code.code_language = AMS_CORE_SYSTEM.THEME_LANGUAGE
                      and code.code_group = AMS_CORE_CODE.OUTLET_INFO_TYPE_POSI
                      and trunc(sysdate, 'DD')
                          between nvl(code.from_date, AMS_CORE_SYSTEM.DATE_MIN_VALUE)
                          and nvl(code.to_date, AMS_CORE_SYSTEM.DATE_MAX_VALUE)
              ) pos
                  on pos.position_code = key.position_code
              left join
              (
                  select  /*+ CARDINALITY(lha, 100)*/
                      lha.agent_id,
                      lha.history_value position_code
                  from ams.la_history_agent lha
                  where lha.type_code = 'CVDL_CODE'
                      and lha.current_is = 'Y'
              ) cv
                  on cv.agent_id = key.outlet_id
              left join
              (
                  select /*+ CARDINALITY(code, 100)*/
                      code.code_code position_code,
                      code.code_value position_name
                  from ams.cla_codes code
                  where code.code_language = AMS_CORE_SYSTEM.THEME_LANGUAGE
                      and code.code_group = AMS_CORE_CODE.OUTLET_INFO_TYPE_POSI
                      and trunc(sysdate, 'DD')
                          between nvl(code.from_date, AMS_CORE_SYSTEM.DATE_MIN_VALUE)
                          and nvl(code.to_date, AMS_CORE_SYSTEM.DATE_MAX_VALUE)
              ) pos_term
                  on pos_term.position_code = cv.position_code
              order by
                  nlssort(key.company_name, 'nls_sort=Vietnamese'),
                  nlssort(key.agency_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.unit_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(key.outlet_ams_id, 'nls_sort=Vietnamese'),
                  key.transaction_date,
                  key.policy_number;
          end if;
      end;

      --lay ra toan bo thong tin ve FYP cua nhom cua tung dai ly trong nhom
      procedure get_sv10(valCompanyID number := null,
          row_records out sys_refcursor)
      is
          var_branch_id number(10) := nvl(valCompanyID, 0);
          var_record_date date := trunc(sysdate, 'YYYY');
      begin
          begin
              select /*+ CARDINALITY(tmp, 100) */
                 tmp.record_date
                 into var_record_date
              from ams.la_vietstar_outlet_2012 tmp
              where rownum <= 1;
          exception
           when others then
               var_record_date := trunc(sysdate, 'YYYY');
          end;
         --tra o muc cong ty co chon
          --tra o muc co chon cong ty va chon chi tiet den dai ly
          if valCompanyID is not null then
              open row_records for
              select /*+ CARDINALITY(key, 100)*/
                  key.company_name,
                  key.office_name,
                  key.agency_name,
                  key.unit_name,
                  key.outlet_number outlet_ams_id,
                  key.outlet_name,
                  to_char(min(key.effective_date), 'DD/MM/YYYY') effective_date,
                  to_char(max(key.terminative_date), 'DD/MM/YYYY') terminative_date,
                  sum(nvl(key.umvs_fyp, 0)) umvs_fyp
              from ams.la_vietstar_umvs_2012 key
              where key.record_date = var_record_date
                  and key.umvs_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                  and key.umvs_be_paid = ams.LIFE_AGENCY_CODE.OUTLET_PAID_OTHER
                  and key.company_id = var_branch_id
                  --chi tinh truong nhom cho no de tinh dung cho no hon
                  and key.outlet_id <> key.umvs_outlet_id
              group by
                  key.company_name,
                  key.office_name,
                  key.agency_name,
                  key.unit_name,
                  key.outlet_number,
                  key.outlet_name
              order by
                  nlssort(key.company_name, 'nls_sort=Vietnamese'),
                  nlssort(key.agency_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.unit_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(key.outlet_number, 'nls_sort=Vietnamese');
          else
              --tra o muc tong cong ty
              open row_records for
              select /*+ CARDINALITY(key, 100)*/
                  key.company_name,
                  key.office_name,
                  key.agency_name,
                  key.unit_name,
                  key.outlet_number outlet_ams_id,
                  key.outlet_name,
                  to_char(min(key.effective_date), 'DD/MM/YYYY') effective_date,
                  to_char(max(key.terminative_date), 'DD/MM/YYYY') terminative_date,
                  sum(nvl(key.umvs_fyp, 0)) umvs_fyp
              from ams.la_vietstar_umvs_2012 key
              where key.record_date = var_record_date
                  and key.umvs_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                  and key.umvs_be_paid = ams.LIFE_AGENCY_CODE.OUTLET_PAID_OTHER
                  --chi tinh truong nhom cho no de tinh dung cho no hon
                  and key.outlet_id <> key.umvs_outlet_id
              group by
                  key.company_name,
                  key.office_name,
                  key.agency_name,
                  key.unit_name,
                  key.outlet_number,
                  key.outlet_name
              order by
                  nlssort(key.company_name, 'nls_sort=Vietnamese'),
                  nlssort(key.agency_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.unit_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(key.outlet_number, 'nls_sort=Vietnamese');
          end if;
      end;

      --lay ra toan bo thong tin ve FYP cua ban cua tung dai ly trong nhom
      procedure get_sv11(valCompanyID number := null,
          row_records out sys_refcursor)
      is
          var_branch_id number(10) := nvl(valCompanyID, 0);
          var_record_date date := trunc(sysdate, 'YYYY');
      begin
          begin
              select /*+ CARDINALITY(tmp, 100) */
                 tmp.record_date
                 into var_record_date
              from ams.la_vietstar_outlet_2012 tmp
              where rownum <= 1;
          exception
           when others then
               var_record_date := trunc(sysdate, 'YYYY');
          end;
         --tra o muc cong ty co chon
          --tra o muc co chon cong ty va chon chi tiet den dai ly
          if valCompanyID is not null then
              open row_records for
              select /*+ CARDINALITY(key, 100)*/
                  key.company_name,
                  key.office_name,
                  key.agency_name,
                  key.unit_name,
                  key.outlet_number outlet_ams_id,
                  key.outlet_name,
                  to_char(min(key.effective_date), 'DD/MM/YYYY') effective_date,
                  to_char(max(key.terminative_date), 'DD/MM/YYYY') terminative_date,
                  sum(nvl(key.amvs_fyp, 0)) amvs_fyp
              from ams.la_vietstar_amvs_2012 key
              where key.record_date = var_record_date
                  and key.amvs_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                  and key.amvs_be_paid = ams.LIFE_AGENCY_CODE.OUTLET_PAID_OTHER
                  and key.company_id = var_branch_id
                  --chi tinh truong nhom cho no de tinh dung cho no hon
                  and key.outlet_id <> key.amvs_outlet_id
              group by
                  key.company_name,
                  key.office_name,
                  key.agency_name,
                  key.unit_name,
                  key.outlet_number,
                  key.outlet_name
              order by
                  nlssort(key.company_name, 'nls_sort=Vietnamese'),
                  nlssort(key.agency_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.unit_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(key.outlet_number, 'nls_sort=Vietnamese');
          else
              --tra o muc tong cong ty
              open row_records for
              select /*+ CARDINALITY(key, 100)*/
                  key.company_name,
                  key.office_name,
                  key.agency_name,
                  key.unit_name,
                  key.outlet_number outlet_ams_id,
                  key.outlet_name,
                  to_char(min(key.effective_date), 'DD/MM/YYYY') effective_date,
                  to_char(max(key.terminative_date), 'DD/MM/YYYY') terminative_date,
                  sum(nvl(key.amvs_fyp, 0)) amvs_fyp
              from ams.la_vietstar_amvs_2012 key
              where key.record_date = var_record_date
                  and key.amvs_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                  and key.amvs_be_paid = ams.LIFE_AGENCY_CODE.OUTLET_PAID_OTHER
                  --chi tinh truong nhom cho no de tinh dung cho no hon
                  and key.outlet_id <> key.amvs_outlet_id
              group by
                  key.company_name,
                  key.office_name,
                  key.agency_name,
                  key.unit_name,
                  key.outlet_number,
                  key.outlet_name
              order by
                  nlssort(key.company_name, 'nls_sort=Vietnamese'),
                  nlssort(key.agency_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.unit_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(key.outlet_number, 'nls_sort=Vietnamese');
          end if;
      end;

      --chi tiet ty le PR36 cua cac dai ly trong nhom
      procedure get_sv12(valCompanyID number := null,
          row_records out sys_refcursor)
      is
          var_branch_id number(10) := nvl(valCompanyID, 0);
          var_record_date date := trunc(sysdate, 'YYYY');
      begin
          begin
              select /*+ CARDINALITY(tmp, 100) */
                 tmp.record_date
                 into var_record_date
              from ams.la_vietstar_outlet_2012 tmp
              where rownum <= 1;
          exception
           when others then
               var_record_date := trunc(sysdate, 'YYYY');
          end;
         --tra o muc cong ty co chon
          --tra o muc co chon cong ty va chon chi tiet den dai ly
          if valCompanyID is not null then
              open row_records for
              select /*+ CARDINALITY(key, 100)*/
                  key.outlet_ams_id,
                  key.outlet_name,
                  key.company_id,
                  key.company_name,
                  key.office_name,
                  key.agency_name,
                  key.unit_id,
                  key.unit_name,
                  key.umvs_afis,
                  key.umvs_afif
              from ams.la_vietstar_umvs_pr36 key
              where key.record_date = var_record_date
                  and key.umvs_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                  and key.company_id = var_branch_id
              order by
                  nlssort(key.company_name, 'nls_sort=Vietnamese'),
                  nlssort(key.agency_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.unit_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(key.outlet_ams_id, 'nls_sort=Vietnamese');
          else
              --tra o muc tong cong ty
              open row_records for
              select /*+ CARDINALITY(key, 100)*/
                  key.outlet_ams_id,
                  key.outlet_name,
                  key.company_id,
                  key.company_name,
                  key.office_name,
                  key.agency_name,
                  key.unit_id,
                  key.unit_name,
                  key.umvs_afis,
                  key.umvs_afif
              from ams.la_vietstar_umvs_pr36 key
              where key.record_date = var_record_date
                  and key.umvs_be_executing = ams.LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
              order by
                  nlssort(key.company_name, 'nls_sort=Vietnamese'),
                  nlssort(key.agency_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.unit_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(key.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(key.outlet_ams_id, 'nls_sort=Vietnamese');
          end if;
      end;
    /*
        Creater: Le Khac Chinh
        Date Create:
        Version: 1.0
        Description: Chi tiet tuyen dung dai ly
        Parameter:
            valCompanyID[number]: Ma cong ty
        Update:
    */
      --
      procedure get_sv13(valCompanyID number := null,
          row_records out sys_refcursor)
      is
          var_branch_id number(10) := nvl(valCompanyID, 0);
          var_record_date date := trunc(sysdate, 'YYYY');
      begin
          begin
              select /*+ CARDINALITY(tmp, 100) */
                 tmp.record_date
                 into var_record_date
              from ams.la_vietstar_outlet_2012 tmp
              where rownum <= 1;
          exception
           when others then
               var_record_date := trunc(sysdate, 'YYYY');
          end;
         --tra o muc cong ty co chon
          --tra o muc co chon cong ty va chon chi tiet den dai ly
          if valCompanyID is not null then
              open row_records for
              select /*+
                         CARDINALITY(empl, 100)
                         CARDINALITY(outl, 100)
                         */
                  empl.company_name,
                  empl.office_name,
                  empl.agency_name,
                  empl.unit_name,
                  empl.outlet_name,
                  empl.outlet_number,
                  pos.position_name,
                  outl.outlet_name new_outlet_name,
                  outl.outlet_number new_outlet_number,
                  to_char(outl.begin_working_date, 'DD/MM/YYYY') begin_working_date,
                  to_char(outl.umvs_data_date, 'DD/MM/YYYY') umvs_data_date,
                  outl.umvs_ip_60_days,
                  outl.umvs_numb_of_nagt,
                  outl.umvs_ip
              from
              (--chi can join voi so lieu cua thang duoi day
                --va do nhom do tuyen dung vao la duoc roi
                  /*Lay ra danh sach cac dai ly dat la dai ly moi vao day*/
                  select /*+ CARDINALITY(tmp, 100)*/
                      tmp.outlet_name,
                      tmp.outlet_number,
                      tmp.begin_working_date,
                      tmp.umvs_data_date,
                      tmp.umvs_ip_60_days,
                      tmp.umvs_numb_of_nagt,
                      tmp.umvs_empl_id,
                      tmp.umvs_ip
                  from ams.la_vietstar_umvs_empl_2012 tmp
                  where tmp.record_date = trunc(var_record_date, 'YYYY')
                      and tmp.umvs_be_paid = 'Y'
                      and tmp.company_id = var_branch_id
              ) outl
              join
              (
                  select /*+ CARDINALITY(tmp, 100)*/
                      tmp.company_name,
                      tmp.office_name,
                      tmp.agency_name,
                      tmp.unit_name,
                      tmp.outlet_name,
                      tmp.outlet_number,
                      tmp.umvs_position_code position_code,
                      tmp.outlet_id,
                      tmp.umvs_data_date
                  from ams.la_vietstar_umvs_2012  tmp
                  where tmp.record_date = trunc(var_record_date, 'YYYY')
                      and tmp.umvs_be_paid = 'O'
                      and tmp.company_id = var_branch_id
              ) empl
                  on
                  (/*Join theo dieu kien la duoc dai ly thuoc nhom do tuyen vao day
                      phai nhu the nay thi moi la dung duoc co nhe*/
                      outl.umvs_empl_id = empl.outlet_id
                      and
                      outl.umvs_data_date = empl.umvs_data_date
                  )
              left join
             (
                  select /*+ CARDINALITY(outl, 100)    */
                      outl.outlet_id,
                      outl.record_date,
                      outl.outlet_ams_id,
                      outl.outlet_name,
                      outl.position_code,
                      outl.effective_date,
                      outl.terminative_date,
                      outl.status_code,
                      outl.company_id,
                      outl.company_name,
                      outl.office_id,
                      outl.office_name,
                      outl.agency_id sales_agency_id,
                      outl.agency_name,
                      outl.unit_id sales_unit_id,
                      outl.unit_name
                  from ams.la_vietstar_temp_outlet outl
              ) pos_org
                  on
                  (/*Join theo dieu kien la duoc dai ly thuoc nhom do tuyen vao day
                      phai nhu the nay thi moi la dung duoc co nhe*/
                      pos_org.outlet_id = empl.outlet_id
                      and
                      outl.umvs_data_date = pos_org.record_date
                  )
              left join
              (
                  select /*+ CARDINALITY(code, 100)*/
                      code.code_code position_code,
                      code.code_value position_name
                  from ams.cla_codes code
                  where code.code_language = AMS_CORE_SYSTEM.THEME_LANGUAGE
                      and code.code_group = AMS_CORE_CODE.OUTLET_INFO_TYPE_POSI
                      and trunc(sysdate, 'DD')
                          between nvl(code.from_date, AMS_CORE_SYSTEM.DATE_MIN_VALUE)
                          and nvl(code.to_date, AMS_CORE_SYSTEM.DATE_MAX_VALUE)
              ) pos
                  on pos.position_code = pos_org.position_code
              order by
                  nlssort(empl.company_name, 'nls_sort=Vietnamese'),
                  nlssort(empl.agency_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(empl.unit_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(empl.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(empl.outlet_number, 'nls_sort=Vietnamese'),
                  nlssort(outl.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(outl.outlet_number, 'nls_sort=Vietnamese');
          else null;
              --tra o muc tong cong ty
              open row_records for
              select /*+
                         CARDINALITY(empl, 100)
                         CARDINALITY(outl, 100)
                         */
                  empl.company_name,
                  empl.office_name,
                  empl.agency_name,
                  empl.unit_name,
                  empl.outlet_name,
                  empl.outlet_number,
                  pos.position_name,
                  outl.outlet_name new_outlet_name,
                  outl.outlet_number new_outlet_number,
                  to_char(outl.begin_working_date, 'DD/MM/YYYY') begin_working_date,
                  to_char(outl.umvs_data_date, 'DD/MM/YYYY') umvs_data_date,
                  outl.umvs_ip_60_days,
                  outl.umvs_numb_of_nagt,
                  outl.umvs_ip
              from
              (--chi can join voi so lieu cua thang duoi day
                --va do nhom do tuyen dung vao la duoc roi
                  /*Lay ra danh sach cac dai ly dat la dai ly moi vao day*/
                  select /*+ CARDINALITY(tmp, 100)*/
                      tmp.outlet_name,
                      tmp.outlet_number,
                      tmp.begin_working_date,
                      tmp.umvs_data_date,
                      tmp.umvs_ip_60_days,
                      tmp.umvs_numb_of_nagt,
                      tmp.umvs_empl_id,
                      tmp.umvs_ip
                  from ams.la_vietstar_umvs_empl_2012 tmp
                  where tmp.record_date = trunc(var_record_date, 'YYYY')
                      and tmp.umvs_be_paid = 'Y'
              ) outl
              join
              (
                  select /*+ CARDINALITY(tmp, 100)*/
                      tmp.company_name,
                      tmp.office_name,
                      tmp.agency_name,
                      tmp.unit_name,
                      tmp.outlet_name,
                      tmp.outlet_number,
                      tmp.umvs_position_code position_code,
                      tmp.outlet_id,
                      tmp.umvs_data_date
                  from ams.la_vietstar_umvs_2012  tmp
                  where tmp.record_date = trunc(var_record_date, 'YYYY')
                      and tmp.umvs_be_paid = 'O'
              ) empl
                  on
                  (/*Join theo dieu kien la duoc dai ly thuoc nhom do tuyen vao day
                      phai nhu the nay thi moi la dung duoc co nhe*/
                      outl.umvs_empl_id = empl.outlet_id
                      and
                      outl.umvs_data_date = empl.umvs_data_date
                  )
              left join
              (
                  select /*+ CARDINALITY(outl, 100)    */
                      outl.outlet_id,
                      outl.record_date,
                      outl.outlet_ams_id,
                      outl.outlet_name,
                      outl.position_code,
                      outl.effective_date,
                      outl.terminative_date,
                      outl.status_code,
                      outl.company_id,
                      outl.company_name,
                      outl.office_id,
                      outl.office_name,
                      outl.agency_id sales_agency_id,
                      outl.agency_name,
                      outl.unit_id sales_unit_id,
                      outl.unit_name
                  from ams.la_vietstar_temp_outlet outl
              ) pos_org
                  on
                  (/*Join theo dieu kien la duoc dai ly thuoc nhom do tuyen vao day
                      phai nhu the nay thi moi la dung duoc co nhe*/
                      pos_org.outlet_id = empl.outlet_id
                      and
                      outl.umvs_data_date = pos_org.record_date
                  )
              left join
              (
                  select /*+ CARDINALITY(code, 100)*/
                      code.code_code position_code,
                      code.code_value position_name
                  from ams.cla_codes code
                  where code.code_language = AMS_CORE_SYSTEM.THEME_LANGUAGE
                      and code.code_group = AMS_CORE_CODE.OUTLET_INFO_TYPE_POSI
                      and trunc(sysdate, 'DD')
                          between nvl(code.from_date, AMS_CORE_SYSTEM.DATE_MIN_VALUE)
                          and nvl(code.to_date, AMS_CORE_SYSTEM.DATE_MAX_VALUE)
              ) pos
                  on pos.position_code = pos_org.position_code
              order by
                  nlssort(empl.company_name, 'nls_sort=Vietnamese'),
                  nlssort(empl.agency_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(empl.unit_name, 'nls_sort=Vietnamese') nulls first,
                  nlssort(empl.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(empl.outlet_number, 'nls_sort=Vietnamese'),
                  nlssort(outl.outlet_name, 'nls_sort=Vietnamese'),
                  nlssort(outl.outlet_number, 'nls_sort=Vietnamese');
          end if;
      end;

  end LIFE_AGENCY_VIETSTAR_2013;
/
