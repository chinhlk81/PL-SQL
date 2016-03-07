create or replace package ams.AMS_MODL_PROM_MMXIII is

    COMPANY_ALL VARCHAR2(16) := 'ALL';

    MODULE_CODE_MAIN VARCHAR2(16) := 'MAIN';
    MODULE_CODE_PROM VARCHAR2(16) := 'PROM';
    MODULE_CODE_COMP VARCHAR2(16) := 'COMP';

    DATA_CODE_COMM VARCHAR2(16) := 'COMM';
    DATA_CODE_FYC VARCHAR2(16) := 'FYC';
    DATA_CODE_FYP VARCHAR2(16) := 'FYP';
    DATA_CODE_IP VARCHAR2(16) := 'IP';
    DATA_CODE_AFIS VARCHAR2(16) := 'AFIS';
    DATA_CODE_AFIF VARCHAR2(16) := 'AFIF';
    DATA_CODE_ISSU VARCHAR2(16) := 'ISSU';
    DATA_CODE_CANC VARCHAR2(16) := 'CANC';
    DATA_CODE_TERM VARCHAR2(16) := 'TERM';
    DATA_CODE_TMFY VARCHAR2(16) := 'TMFY';

    MODULE_PROM_MMXI VARCHAR2(16) := 'PROM_MMXI';
    MODULE_PROM_MMXII VARCHAR2(16) := 'PROM_MMXII';

    PROM_DATE_MMXI date := to_date('1-jan-2011');
    --PROM_DATE_MMXII date := to_date('1-jan-2012');
    PROM_DATE_MMXIII date := to_date('1-jan-2013');

    BE_PAID_YES VARCHAR2(1) := 'Y';
    BE_PAID_NO VARCHAR2(1) := 'N';
    BE_PAID_DTL VARCHAR2(1) := 'D';
    BE_PAID_SPC VARCHAR2(1) := 'S';
    BE_PAID_EMP VARCHAR2(1) := 'E';

    BE_EXECUTING_YES VARCHAR2(1) := 'Y';
    BE_EXECUTING_NO VARCHAR2(1) := 'N';
    BE_EXECUTING_DEL VARCHAR2(1) := 'D';

    AMST_PROM VARCHAR2(1) := 'P';
    AMST_DEPO VARCHAR2(1) := 'D';
    AMST_MAIN VARCHAR2(1) := 'M';
    AMST_ERRO VARCHAR2(1) := 'E';

    /* Truc tiep*/
    DATA_DIRE VARCHAR2(16) := 'DIRE';
    /* Gian tiep*/
    DATA_INDI VARCHAR2(16) := 'INDI';

    POSITION_CODE_MMXIII_CV00 VARCHAR2(16) := 'CV00';
    POSITION_CODE_MMXIII_CV01 VARCHAR2(16) := 'CV01';
    POSITION_CODE_MMXIII_CV02 VARCHAR2(16) := 'CV02';
    POSITION_CODE_MMXIII_CV03 VARCHAR2(16) := 'CV03';
    POSITION_CODE_MMXIII_CV04 VARCHAR2(16) := 'CV04';
    POSITION_CODE_MMXIII_CV05 VARCHAR2(16) := 'CV05';

    --khong dung cho nay nua
    MMXII_PROM_AGEP VARCHAR2(16) := 'MMXII_PROM_AGEP';
    MMXII_PROM_PUMP VARCHAR2(16) := 'MMXII_PROM_PUMP';
    MMXII_PROM_UMNM VARCHAR2(16) := 'MMXII_PROM_UMNM';
    MMXII_PROM_UMNP VARCHAR2(16) := 'MMXII_PROM_UMNP';
    MMXII_PROM_AMNM VARCHAR2(16) := 'MMXII_PROM_AMNM';

    MMXIII_PROM_AGEP VARCHAR2(16) := 'MMXIII_PROM_AGEP';
    MMXIII_PROM_PUMP VARCHAR2(16) := 'MMXIII_PROM_PUMP';
    MMXIII_PROM_UMNM VARCHAR2(16) := 'MMXIII_PROM_UMNM';
    MMXIII_PROM_UMNP VARCHAR2(16) := 'MMXIII_PROM_UMNP';
    MMXIII_PROM_AMNM VARCHAR2(16) := 'MMXIII_PROM_AMNM';

    OBJECT_STATUS_ACTIVE VARCHAR2(16) := 'ACTI';
    OBJECT_STATUS_INACTIVE VARCHAR2(16) := 'INAT';
    OBJECT_STATUS_FREEZE VARCHAR2(16) := 'FRZE';


    MMXIII_PROM_ROOT VARCHAR2(16) := 'ROOT';
    MMXIII_PROM_DEVE VARCHAR2(16) := 'DEVE';

    --day la lan xet thang tien thu bat nhieu
    MMXIII_PROM_ASMT_1  NUMBER(1) := 1;
    MMXIII_PROM_ASMT_2  NUMBER(1) := 2;
    MMXIII_PROM_ASMT_3  NUMBER(1) := 3;
    RECORD_MAX_DELETE number(10) := 50000;
    SYSTEM_USER varchar2(16) := 'SYSTEM';
    THEME_LANGUAGE VARCHAR2(16) := 'VN';

    DATE_MAX_VALUE date := to_date('31-dec-9999');
    DATE_MIN_VALUE date := to_date('1-jan-1900');

    DATA_CODE_NET_ISSU VARCHAR2(16) := 'NET_ISSU';


    procedure main;

    -----------------------------------------------------------------
    /* Thang tien 2013*/
    -----------------------------------------------------------------
    procedure mmxiii_modl_run(valRecordDate date := null,
        valCompanyID number := null);
    procedure mmxiii_modl_data_prepare(valRecordDate date := null);
    /* Trich xuat du lieu dai ly*/
    procedure mmxiii_modl_exp(valRecordDate date := null,
        valCompanyID number := null);
    /* Xet duyet thang tien*/
    procedure mmxiii_modl_exe(valRecordDate date := null);

    /*Xet cap cua cac nhom con*/
    procedure mmxiii_modl_unit_dev(valRecordDate date := null);
    /* Thang tien: Tu van vien -> Tien truong nhom*/
    procedure mmxiii_modl_agep(valRecordDate date := null);
    procedure mmxiii_modl_agep_open(valRecordDate date := null);
    procedure mmxiii_modl_agep_data(valRecordDate date := null);
    procedure mmxiii_modl_agep_asmt(valRecordDate date := null);
    procedure mmxiii_modl_agep_close(valRecordDate date := null);

    /* Thang tien: Tien truong nhom -> Truong nhom*/
    procedure mmxiii_modl_pump(valRecordDate date := null);
    procedure mmxiii_modl_pump_open(valRecordDate date := null);
    procedure mmxiii_modl_pump_data(valRecordDate date := null);
    procedure mmxiii_modl_pump_asmt(valRecordDate date := null);
    procedure mmxiii_modl_pump_close(valRecordDate date := null);

    /* Duy tri: Truong nhom*/
    procedure mmxiii_modl_umnm(valRecordDate date := null);
    procedure mmxiii_modl_umnm_open(valRecordDate date := null);
    procedure mmxiii_modl_umnm_data(valRecordDate date := null);
    procedure mmxiii_modl_umnm_asmt(valRecordDate date := null);
    procedure mmxiii_modl_umnm_close(valRecordDate date := null);

    /*Thang tien: len truong ban*/
    procedure mmxiii_modl_umnp(valRecordDate date := null);
    procedure mmxiii_modl_umnp_open(valRecordDate date := null);
    procedure mmxiii_modl_umnp_data(valRecordDate date := null);
    procedure mmxiii_modl_umnp_asmt(valRecordDate date := null);
    procedure mmxiii_modl_umnp_close(valRecordDate date := null);

    /* Duy tri: Truong ban*/
    procedure mmxiii_modl_amnm(valRecordDate date := null);
    procedure mmxiii_modl_amnm_open(valRecordDate date := null);
    procedure mmxiii_modl_amnm_data(valRecordDate date := null);
    procedure mmxiii_modl_amnm_asmt(valRecordDate date := null);
    procedure mmxiii_modl_amnm_close(valRecordDate date := null);

    /* Ket thuc xet duyet thang tien*/
    procedure mmxiii_modl_close(valRecordDate date := null);

end AMS_MODL_PROM_MMXIII;
/
create or replace package body ams.AMS_MODL_PROM_MMXIII is
    /*chinhlk 22/2/2013 sua mmxiii_modl_pump_data
                  chi tieu hop dong KTM thuan KHONG tru di cac hop dong bi huy trong nam dau tien cua hop dong ma lam giong nhu em Hoa da lam roi
                  lam giong nhu Quynh da lam hoi truoc
                  dong thoi lay luon tu chi tieu DATA_CODE_NET_ISSU cho tien
                  23/2/2013 them vao truong hop huy cho no tot hon tuc neu truoc 1/6/2013 thi se xu ly cho no tot
      chinhlk 25/2/2013 sua lai tuc la neu dot thang tien lan 3 vao thang 3 nam 2013 thi chi lay lai 3 thang va FYP >= 50 tr
                  khong nhu cai cu da lam
                  */
    procedure main
    is
    begin
        null;
    end;

    procedure mmxiii_modl_run(valRecordDate date := null,
        valCompanyID number := null)
    is
        var_run_from_time date := sysdate;
        var_run_to_time date := sysdate;
    begin
        AMS_MODL_PROM_MMXIII.mmxiii_modl_data_prepare(valRecordDate);
        AMS_MODL_PROM_MMXIII.mmxiii_modl_exp(valRecordDate, valCompanyID);
        AMS_MODL_PROM_MMXIII.mmxiii_modl_exe(valRecordDate);
        var_run_to_time := sysdate;
        ams.life_agency_log.time_log(1000, 'Thoi gian chay thang tien nam  2013 thang ' || to_char(valRecordDate, 'dd/mm/yyyy')  || ' cua cong ty: ' || to_char(valCompanyID), var_run_from_time, var_run_to_time);
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_run: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy'),
                sqlerrm,
                sqlcode);
    end;

    /*Khoi dong du lieu*/
    procedure mmxiii_modl_data_prepare(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
        var_record_date date:= trunc(valRecordDate, 'MM');
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /*Truncate bang bang la_prom_history_agent_tmp de do du lieu tu bang inp_data_outlet vao cho bang do*/
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

    procedure mmxiii_modl_exp(valRecordDate date := null,
        valCompanyID number := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Xoa du lieu dai ly*/
        loop
            delete ams.la_promotion_mmxiii del
            where del.record_date = trunc(valRecordDate, 'MM')
                and
                (
                    del.info_company_id = nvl(valCompanyID, 0)
                    or
                    nvl(valCompanyID, 0) = 0
                )
                and rownum < AMS_MODL_PROM_MMXIII.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_MODL_PROM_MMXIII.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_exp', ' Xoa du lieu dai ly thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        insert /*+ APPEND */ into ams.la_promotion_mmxiii nologging (
            outlet_id,
            outlet_ams_id,
            record_date,
            version_date,
            be_paid,
            be_executing,
            outlet_name,
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
            create_user,
            update_user,
            create_datetime,
            update_datetime
        )
        select /*+ CARDINALITY(outl, 100)*/
            outl.outlet_id,
            outl.outlet_ams_id,
            trunc(valRecordDate, 'MM'),
            cast(trunc(sysdate, 'DD') as date),
            AMS_MODL_PROM_MMXIII.BE_PAID_YES,
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
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
            AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.inp_data_outlet outl
        where outl.record_date = trunc(valRecordDate, 'MM')
            and outl.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
            and outl.status_code = AMS_MODL_PROM_MMXIII.OBJECT_STATUS_ACTIVE
            and
            (
                outl.company_id = nvl(valCompanyID, 0)
                or
                nvl(valCompanyID, 0) = 0
            )
            and outl.terminative_date is null;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_exp', ' da chay xong');
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_exp: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_exe(valRecordDate date := null)
    is
    begin
        /* Tinh toan thang tien va duy tri theo quy che 2013*/
        AMS_MODL_PROM_MMXIII.mmxiii_modl_unit_dev(valRecordDate);
        AMS_MODL_PROM_MMXIII.mmxiii_modl_agep(valRecordDate);
        AMS_MODL_PROM_MMXIII.mmxiii_modl_pump(valRecordDate);
        AMS_MODL_PROM_MMXIII.mmxiii_modl_umnm(valRecordDate);
        AMS_MODL_PROM_MMXIII.mmxiii_modl_umnp(valRecordDate);
        AMS_MODL_PROM_MMXIII.mmxiii_modl_amnm(valRecordDate);

        AMS_MODL_PROM_MMXIII.mmxiii_modl_close(valRecordDate);
    end;

    /*
        Update: Vu Duc Thong
        Date Update: 07/11/2013
        Version: 1.1
        Description: Xet cap nhom cua cac nhom
        Parameter:
    */
    procedure mmxiii_modl_unit_dev(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* Xoa du lieu chi tiet*/
        loop
            delete ams.la_prom_mmxiii_unit_dev del
            where rownum < AMS_MODL_PROM_MMXIII.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_MODL_PROM_MMXIII.RECORD_MAX_DELETE - 1;
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
        insert /*+ APPEND */ into ams.la_prom_mmxiii_unit_dev nologging (
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
            AMS_MODL_PROM_MMXIII.BE_PAID_NO,
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
            AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.inp_data_outlet tmp
        where tmp.record_date = trunc(valRecordDate, 'MM')
            and tmp.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
            and tmp.position_code = AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV02
            and tmp.status_code = AMS_MODL_PROM_MMXIII.OBJECT_STATUS_ACTIVE
            and tmp.position_date
                between trunc(valRecordDate, 'YYYY')
                and last_day(trunc(valRecordDate, 'MM'));
        commit;

        dbms_stats.gather_table_stats(null, 'la_prom_mmxiii_unit_dev', cascade => true);


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
                    into ams.la_prom_mmxiii_unit_dev umdv
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
                            from ams.la_prom_mmxiii_unit_dev umnm
                            where umnm.record_date = trunc(valRecordDate, 'MM')
                                and umnm.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                        ) newu
                        join
                        (
                            select /*+ CARDINALITY(data, 100)*/
                                data.record_date,
                                data.outlet_id,
                                data.outlet_ams_id,
                                data.unit_id,
                                data.unit_ams_id
                            from ams.inp_data_outlet data
                            where data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                                and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                                and data.position_code = AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV01
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
                                data.unit_name
                            from ams.inp_data_outlet data
                            where data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                                and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                                and data.position_code in
                                (
                                    AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV02,
                                    AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV03
                                )
                                and data.status_code = AMS_MODL_PROM_MMXIII.OBJECT_STATUS_ACTIVE
                                and data.outlet_ams_id not in
                                    (
                                      select outl.outlet_ams_id
                                      from inp_data_outlet outl
                                      where outl.record_date = trunc(valRecordDate, 'MM')
                                        and outl.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                                        and outl.status_code = AMS_MODL_PROM_MMXIII.OBJECT_STATUS_ACTIVE
                                        and outl.position_code = AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV04
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
                            umdv.umnm_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES,
                            umdv.umnm_unit_ams_id = upd.umnp_unit_ams_id,
                            umdv.umnm_agency_status = 0;
                commit;

                merge /*+ CARDINALITY(umdv, 100)*/
                    into ams.la_prom_mmxiii_unit_dev umdv
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
                            from ams.la_prom_mmxiii_unit_dev umnm
                            where umnm.record_date = trunc(valRecordDate, 'MM')
                                and umnm.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                                and umnm.umnm_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_NO
                        ) newu
                        join
                        (
                            select /*+ CARDINALITY(data, 100)*/
                                data.record_date,
                                data.outlet_id,
                                data.outlet_ams_id,
                                data.unit_id,
                                data.unit_ams_id
                            from ams.inp_data_outlet data
                            where data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                                and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                                and data.position_code = AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV01
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
                                data.unit_name
                            from ams.inp_data_outlet data
                            where data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                                and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                                and data.position_code in
                                (
                                    AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV02,
                                    AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV03
                                )
                                and data.status_code = AMS_MODL_PROM_MMXIII.OBJECT_STATUS_ACTIVE
                                and data.outlet_ams_id in
                                    (
                                      select outl.outlet_ams_id
                                      from inp_data_outlet outl
                                      where outl.record_date = trunc(valRecordDate, 'MM')
                                        and outl.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                                        and outl.status_code = AMS_MODL_PROM_MMXIII.OBJECT_STATUS_ACTIVE
                                        and outl.position_code = AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV04
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
                            umdv.umnm_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES,
                            umdv.umnm_unit_ams_id = upd.agency_ams_id,
                            umdv.umnm_agency_status = 1;
                commit;

                merge /*+ CARDINALITY(umdv, 100)*/
                    into ams.la_prom_mmxiii_unit_dev umdv
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
                            from ams.la_prom_mmxiii_unit_dev umnm
                            where umnm.record_date = trunc(valRecordDate, 'MM')
                                and umnm.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                                and umnm.umnm_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_NO
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
                            from ams.inp_data_outlet data
                            where data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                                and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                                and data.position_code = AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV01
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
                            from ams.inp_data_outlet data
                            where data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                                and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                                and data.position_code = AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV04
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
                            from ams.inp_data_outlet data
                            where data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                                and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                                and data.position_code = AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV02
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
                            umdv.umnm_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES,
                            umdv.umnm_unit_ams_id = upd.umnp_unit_ams_id,
                            umdv.umnm_agency_status = 1;
                commit;

                merge /*+ CARDINALITY(umdv, 100)*/
                    into ams.la_prom_mmxiii_unit_dev umdv
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
                            from ams.la_prom_mmxiii_unit_dev umnm
                            where umnm.record_date = trunc(valRecordDate, 'MM')
                                and umnm.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                                and umnm.umnm_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_NO
                        ) newu
                        join
                        (
                            select /*+ CARDINALITY(data, 100)*/
                                data.record_date,
                                data.outlet_id,
                                data.outlet_ams_id,
                                data.unit_id,
                                data.unit_ams_id
                            from ams.inp_data_outlet data
                            where data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                                and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                                and data.position_code = AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV01
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
                                data.unit_name
                            from ams.inp_data_outlet data
                            where data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                                and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                                and data.position_code = AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV01
                                and data.status_code = AMS_MODL_PROM_MMXIII.OBJECT_STATUS_ACTIVE
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
                            umdv.umnm_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES,
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

        update ams.la_prom_mmxiii_unit_dev umnm
        set umnm.umnm_unit_ams_id = umnm.agency_ams_id
        where umnm.record_date = trunc(valRecordDate, 'MM')
            and umnm.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            and umnm.umnm_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
            and umnm.umnm_unit_ams_id is null;
       commit;

       /*Khong xu ly cho truong hop neu khong ducc PAID*/
        update ams.la_prom_mmxiii_unit_dev umnm
        set umnm.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_NO
        where umnm.record_date = trunc(valRecordDate, 'MM')
            and umnm.umnm_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_NO;
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

        insert /*+ APPEND */ into ams.la_prom_mmxiii_unit_dev nologging(
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
            AMS_MODL_PROM_MMXIII.BE_PAID_YES,
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
            AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            AMS_MODL_PROM_MMXIII.SYSTEM_USER,
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
                from ams.la_prom_mmxiii_unit_dev tmp
                where tmp.record_date = trunc(valRecordDate, 'MM')
                    and tmp.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                    and tmp.umnm_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
                    and tmp.umnm_agency_status = 0
                    and tmp.unit_ams_id is not null
                group by tmp.umnm_unit_ams_id
                minus
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.unit_ams_id
                from ams.la_prom_mmxiii_unit_dev tmp
                where tmp.record_date = trunc(valRecordDate, 'MM')
                    and tmp.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                    and tmp.umnm_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
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
            delete ams.la_prom_mmxiii_unit_des_agency del
            where del.record_date = trunc(valRecordDate, 'MM')
                and rownum < AMS_MODL_PROM_MMXIII.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_MODL_PROM_MMXIII.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_unit_dev', 'Xoa du lieu chi tiet thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 9;

        insert /*+ APPEND */ into ams.la_prom_mmxiii_unit_des_agency  nologging(
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
            AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.la_prom_mmxiii_unit_dev tmp
        where tmp.record_date = trunc(valRecordDate, 'MM')
            and tmp.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            and tmp.umnm_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
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
            delete ams.la_prom_mmxiii_unit_des_source del
            where del.record_date = trunc(valRecordDate, 'MM')
                and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        insert /*+ APPEND */ into ams.la_prom_mmxiii_unit_des_source  nologging(
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
            AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.la_prom_mmxiii_unit_des_agency tmp
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

    procedure mmxiii_modl_agep(valRecordDate date := null)
    is
    begin
        if (
            AMS_CORE_MODULE.is_active(
                AMS_MODL_PROM_MMXIII.MMXIII_PROM_AGEP,
                trunc(valRecordDate, 'MM')
            ) = AMS_CORE_MODULE.IS_YES
        ) then
            /*for var_result in (
                select
                    prom_date.promotion_date
                from ams.mod_prom_date prom_date
                where prom_date.module_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_PROM
                    and prom_date.sub_code = AMS_MODL_PROM_MMXIII.MMXIII_PROM_AGEP
                    and prom_date.status_code = AMS_MODL_PROM_MMXIII.OBJECT_STATUS_ACTIVE
                    and prom_date.promotion_date = trunc(valRecordDate, 'MM')
                group by prom_date.promotion_date
            ) loop*/
                AMS_MODL_PROM_MMXIII.mmxiii_modl_agep_open(valRecordDate);
                AMS_MODL_PROM_MMXIII.mmxiii_modl_agep_data(valRecordDate);
                AMS_MODL_PROM_MMXIII.mmxiii_modl_agep_asmt(valRecordDate);
                AMS_MODL_PROM_MMXIII.mmxiii_modl_agep_close(valRecordDate);
            /*end loop;*/
        end if;
    end;

    procedure mmxiii_modl_agep_open(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
        var_agep_from_date date := add_months(trunc(valRecordDate, 'MM'), -5);
        var_agep_to_date date := valRecordDate;
        var_agep_record_to_date date := valRecordDate;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Len danh sach dai ly xet thang tien tien truong nhom*/
        update la_promotion_mmxiii prom
        set
            prom.agep_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES,
            prom.agep_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
            prom.agep_senr_by_months = round(
                months_between(
                    trunc(valRecordDate, 'MM'),
                    nvl(trunc(prom.info_effective_date, 'MM'), AMS_MODL_PROM_MMXIII.DATE_MIN_VALUE)
                )) + 1,
            prom.agep_period_fyp = 0,
            prom.agep_period_cont_issue = 0,
            prom.agep_asmt = AMS_MODL_PROM_MMXIII.AMST_MAIN,
            prom.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            prom.update_datetime = sysdate
        where prom.record_date = trunc(valRecordDate, 'MM')
            and prom.be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            and prom.info_position_code in (
                AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV00,
                AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV05
            );
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agep_open', 'xoa thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* Loai bo cac truong hop loi du lieu*/
        update la_promotion_mmxiii prom
        set
            prom.agep_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_NO,
            prom.agep_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_NO,
            prom.agep_asmt = AMS_MODL_PROM_MMXIII.AMST_ERRO,
            prom.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            prom.update_datetime = sysdate
        where prom.record_date = trunc(valRecordDate, 'MM')
            and prom.agep_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            and prom.info_effective_date is null;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agep_open', 'Loai bo cac truong hop loi du lieu thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* Loai bo cac dai ly co tham nien duoi 6 thang */
        /*update la_promotion_mmxiii prom
        set
            prom.agep_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_NO,
            prom.agep_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_NO,
            prom.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            prom.update_datetime = sysdate
        where prom.record_date = trunc(valRecordDate, 'MM')
            and prom.agep_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            and prom.agep_senr_by_months < 6;
        commit;*/

        /* Len danh sach du lieu chi tiet can xoa*/
        merge /*+ CARDINALITY(agep, 100)*/
            into la_prom_mmxiii_agep agep
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.info_company_id company_id
                from ams.la_promotion_mmxiii tmp
                where tmp.record_date = trunc(valRecordDate, 'MM')
                    and tmp.agep_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                group by tmp.info_company_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = agep.record_date
            and
            upd.company_id = agep.company_id
            )
        when matched then
            update
                set
                    agep.agep_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_DEL;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agep_open', 'Len danh sach du lieu chi tiet can xoa thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* Xoa du lieu chi tiet*/
        loop
            delete ams.la_prom_mmxiii_agep del
            where del.record_date = trunc(valRecordDate, 'MM')
                and del.agep_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_DEL
                and rownum < AMS_MODL_PROM_MMXIII.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_MODL_PROM_MMXIII.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agep_open', ' Xoa du lieu chi tiet thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /*Neu ma chay tu 1/1 den 1/2 thi den ngay se la ngay 28/2/2013 tuc la cuoi thang xet*/
        /*Con tu ngay thi se phau tinh can cu dua vao lan xet nay la lan xet thu bao nhieu thi se phai xu ly cho no*/
        --Ngay cuoi cung chay luon la cuoi thang do
        var_agep_to_date := trunc(last_day(trunc(valRecordDate, 'MM')), 'DD');
        if trunc(valRecordDate, 'MM') --chay o thang 12 nam 2012 thi van co the dap ung duoc
            <= trunc(to_date('1-feb-2013'), 'DD') then
            --lay ra thang cua den ngay do thi chay moi dung duoc khi tinh tu ngay la ngay nao khi quay lai bao nhieu thang
            var_agep_record_to_date  := trunc(to_date('1-feb-2013'), 'DD');
        /*Neu ma chay tu 1/3 den 31/5 thi den ngay la 31/5 va ngay record_date = 1/5*/
        elsif trunc(valRecordDate, 'MM')
            between trunc(to_date('1-mar-2013'), 'DD')
            and trunc(to_date('1-may-2013'), 'DD') then
            --lay ra thang cua den ngay do thi chay moi dung duoc khi tinh tu ngay la ngay nao khi quay lai bao nhieu thang
            var_agep_record_to_date  := trunc(to_date('1-may-2013'), 'DD');
        /*Neu ma chay tu 1/6 den 31/8 thi den ngay la 31/8 va ngay record_date = 1/8*/
        elsif trunc(valRecordDate, 'MM')
            between trunc(to_date('1-jun-2013'), 'DD')
            and trunc(to_date('1-aug-2013'), 'DD') then
            --lay ra thang cua den ngay do thi chay moi dung duoc khi tinh tu ngay la ngay nao khi quay lai bao nhieu thang
            var_agep_record_to_date  := trunc(to_date('1-aug-2013'), 'DD');
        /*Neu ma chay tu 1/9 den 30/11 thi den ngay la 30/11 va ngay record_date = 1/11*/
        elsif trunc(valRecordDate, 'MM')
            between trunc(to_date('1-sep-2013'), 'DD')
            and trunc(to_date('1-nov-2013'), 'DD') then
            --lay ra thang cua den ngay do thi chay moi dung duoc khi tinh tu ngay la ngay nao khi quay lai bao nhieu thang
            var_agep_record_to_date  := trunc(to_date('1-nov-2013'), 'DD');
        /*Neu ma chay >= 1/12 thi den ngay la 31/12 va ngay record_date = 1/12*/
        elsif trunc(valRecordDate, 'MM') >= trunc(to_date('1-dec-2013'), 'DD') then
            --lay ra thang cua den ngay do thi chay moi dung duoc khi tinh tu ngay la ngay nao khi quay lai bao nhieu thang
            var_agep_record_to_date  := trunc(to_date('1-feb-2014'), 'DD');
        end if;
        /* Len danh sach chi tiet cua dai ly*/
        /*Quay lai du lieu 6 thang truoc cho dai ly voi record_date ngay cuoi cung bat dau tu ngay var_agep_record_to_date o phia tren*/
        var_agep_from_date := add_months(var_agep_record_to_date, -5);
        /*Voi to_date la cai thang chay do ma da biet roi*/
        for i in 0..5
        loop
            --Neu thang chay nam trong khoang thoi gian xac dinh o tren
            --thi moi insert vao du lieu con neu khong thi thoi
            if add_months(trunc(valRecordDate, 'MM'), -i)
                between var_agep_from_date
                and var_agep_to_date
            then
                insert /*+ APPEND */ into ams.la_prom_mmxiii_agep nologging (
                    outlet_id,
                    outlet_ams_id,
                    record_date,
                    version_date,
                    type_code,
                    outlet_name,
                    company_id,
                    agep_be_paid,
                    agep_be_executing,
                    agep_data_date,
                    agep_period_fyp,
                    agep_period_cont_issue,
                    create_user,
                    update_user,
                    create_datetime,
                    update_datetime
                )
                select prom.outlet_id,
                    prom.outlet_ams_id,
                    trunc(valRecordDate, 'MM'),
                    cast(trunc(sysdate, 'DD') as date),
                    AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN,
                    prom.outlet_name,
                    prom.info_company_id,
                    AMS_MODL_PROM_MMXIII.BE_PAID_DTL,
                    AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
                    add_months(trunc(valRecordDate, 'MM'), -i),
                    0,
                    0,
                    AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    sysdate,
                    sysdate
                from ams.la_promotion_mmxiii prom
                where prom.record_date = trunc(valRecordDate, 'MM')
                    and prom.agep_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES;
                commit;
            end if;
        end loop;

        dbms_stats.gather_table_stats(null, 'la_prom_mmxiii_agep', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agep_open', ' Len danh sach chi tiet cua dai ly da chay xong');
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_agep_open: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_agep_data(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
        var_agep_from_date date := add_months(trunc(valRecordDate, 'MM'), -5);
        var_agep_to_date date := valRecordDate;
        var_agep_record_to_date date := valRecordDate;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        var_agep_to_date := trunc(last_day(trunc(valRecordDate, 'MM')), 'DD');
        if trunc(valRecordDate, 'MM') --chay o thang 12 nam 2012 thi van co the dap ung duoc
            <= trunc(to_date('1-feb-2013'), 'DD') then
            --lay ra thang cua den ngay do thi chay moi dung duoc khi tinh tu ngay la ngay nao khi quay lai bao nhieu thang
            var_agep_record_to_date  := trunc(to_date('1-feb-2013'), 'DD');
        /*Neu ma chay tu 1/3 den 31/5 thi den ngay la 31/5 va ngay record_date = 1/5*/
        elsif trunc(valRecordDate, 'MM')
            between trunc(to_date('1-mar-2013'), 'DD')
            and trunc(to_date('1-may-2013'), 'DD') then
            --lay ra thang cua den ngay do thi chay moi dung duoc khi tinh tu ngay la ngay nao khi quay lai bao nhieu thang
            var_agep_record_to_date  := trunc(to_date('1-may-2013'), 'DD');
        /*Neu ma chay tu 1/6 den 31/8 thi den ngay la 31/8 va ngay record_date = 1/8*/
        elsif trunc(valRecordDate, 'MM')
            between trunc(to_date('1-jun-2013'), 'DD')
            and trunc(to_date('1-aug-2013'), 'DD') then
            --lay ra thang cua den ngay do thi chay moi dung duoc khi tinh tu ngay la ngay nao khi quay lai bao nhieu thang
            var_agep_record_to_date  := trunc(to_date('1-aug-2013'), 'DD');
        /*Neu ma chay tu 1/9 den 30/11 thi den ngay la 30/11 va ngay record_date = 1/11*/
        elsif trunc(valRecordDate, 'MM')
            between trunc(to_date('1-sep-2013'), 'DD')
            and trunc(to_date('1-nov-2013'), 'DD') then
            --lay ra thang cua den ngay do thi chay moi dung duoc khi tinh tu ngay la ngay nao khi quay lai bao nhieu thang
            var_agep_record_to_date  := trunc(to_date('1-nov-2013'), 'DD');
        /*Neu ma chay >= 1/12 thi den ngay la 31/12 va ngay record_date = 1/12*/
        elsif trunc(valRecordDate, 'MM') >= trunc(to_date('1-dec-2013'), 'DD') then
            --lay ra thang cua den ngay do thi chay moi dung duoc khi tinh tu ngay la ngay nao khi quay lai bao nhieu thang
            var_agep_record_to_date  := trunc(to_date('1-feb-2014'), 'DD');
        end if;

        /*Quay lai du lieu 6 thang truoc cho dai ly voi record_date ngay cuoi cung bat dau tu ngay var_agep_record_to_date o phia tren*/
        var_agep_from_date := add_months(var_agep_record_to_date, -5);

        /* FYP trong 6 thang gan nhat*/
        merge /*+ CARDINALITY(agep, 100)*/
            into ams.la_prom_mmxiii_agep agep
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_ams_id,
                    data.record_date,
                    data.data_value
                from ams.mod_data data
                where data.record_date--chi quay lai voi cac thang da xac dinh o phia tren
                        between var_agep_from_date
                        and var_agep_to_date
                    and data.module_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                    and data.data_code = AMS_MODL_PROM_MMXIII.DATA_CODE_FYP
            ) upd
        on (
            trunc(valRecordDate, 'MM') = agep.record_date
            and
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = agep.agep_be_executing
            and
            upd.outlet_ams_id = agep.outlet_ams_id
            and
            upd.record_date = agep.agep_data_date
            )
        when matched then
            update
                set
                    agep.agep_period_fyp = nvl(upd.data_value, 0),
                    agep.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    agep.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agep_data', 'FYP trong 6 thang gan nhat thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;


        /* Lay chi tiet POLICY Issue trong 6 thang gan nhat
        HD thuan khai thac moi chinhlk thay doi theo dinh nghia moi duoc ban hanh
        o day da tru di cac hop dong huy 14 ngay o dinh nghia NET ISSUE roi nen khong lo nua*/

        merge /*+ CARDINALITY(agep, 100)*/
            into ams.la_prom_mmxiii_agep agep
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_ams_id,
                    data.record_date,
                    data.data_value
                from mod_data data
                where data.record_date
                        between var_agep_from_date
                        and var_agep_to_date
                    and data.module_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                    and data.data_code = AMS_MODL_PROM_MMXIII.DATA_CODE_NET_ISSU
            ) upd
        on (
            trunc(valRecordDate, 'MM') = agep.record_date
            and
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = agep.agep_be_executing
            and
            upd.outlet_ams_id = agep.outlet_ams_id
            and
            upd.record_date = agep.agep_data_date
            )
        when matched then
            update
                set
                    agep.agep_period_cont_issue = nvl(upd.data_value, 0),
                    agep.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    agep.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agep_data', 'Lay chi tiet POLICY Issue trong 6 thang gan nhat thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        dbms_stats.gather_table_stats(null, 'la_prom_mmxiii_agep', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agep_data', 'gather_table_stats la_prom_mmxiii_agep thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        execute immediate 'truncate table ams.la_prom_mmxiii_agep_tmp';
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agep_data', 'truncate la_prom_mmxiii_agep thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        insert /*+ APPEND */ into ams.la_prom_mmxiii_agep_tmp nologging (
            outlet_ams_id,
            record_date,
            agep_period_fyp,
            agep_period_cont_issue
        )
        select /*+ CARDINALITY(agep, 100)*/
            agep.outlet_ams_id,
            trunc(valRecordDate, 'MM'),
            nvl(sum(agep.agep_period_fyp), 0) agep_period_fyp,
            nvl(sum(agep.agep_period_cont_issue), 0) agep_period_cont_issue
        from ams.la_prom_mmxiii_agep agep
        where agep.record_date = trunc(valRecordDate, 'MM')
            and agep.agep_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            and agep.agep_data_date
                between var_agep_from_date
                and var_agep_to_date
        group by agep.outlet_ams_id;
        commit;

        dbms_stats.gather_table_stats(null, 'la_prom_mmxiii_agep_tmp', cascade => true);
        dbms_stats.gather_table_stats(null, 'la_promotion_mmxiii', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agep_data', 'do du lieu vao bang la_prom_mmxiii_agep_tmp thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* Tong hop du lieu danh gia*/
        merge   /*+ CARDINALITY(prom, 100)
                      CARDINALITY(upd, 100)
                      LEADING(o prom) */
            into ams.la_promotion_mmxiii prom
        using
            (
                select /*+ CARDINALITY(agep, 100)*/
                    agep.outlet_ams_id,
                    agep.agep_period_fyp,
                    agep.agep_period_cont_issue
                from ams.la_prom_mmxiii_agep_tmp agep
                where agep.record_date = trunc(valRecordDate, 'MM')
            ) upd
        on (
            trunc(valRecordDate, 'MM') = prom.record_date
            and
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = prom.agep_be_executing
            and
            upd.outlet_ams_id = prom.outlet_ams_id
            )
        when matched then
            update
                set
                    prom.agep_period_fyp = upd.agep_period_fyp,
                    prom.agep_period_cont_issue = upd.agep_period_cont_issue;
        commit;

/*        \* Tong hop du lieu danh gia*\
        merge \*+ CARDINALITY(prom, 100)*\
            into ams.la_promotion_mmxiii prom
        using
            (
                select \*+ CARDINALITY(agep, 100)*\
                    agep.outlet_ams_id,
                    nvl(sum(agep.agep_period_fyp), 0) agep_period_fyp,
                    nvl(sum(agep.agep_period_cont_issue), 0) agep_period_cont_issue
                from la_prom_mmxiii_agep agep
                where agep.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                    and agep.record_date = trunc(valRecordDate, 'MM')
                    and agep.agep_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                    and agep.agep_data_date
                        between add_months(trunc(valRecordDate, 'MM'), -5)
                        and trunc(valRecordDate, 'MM')
                group by agep.outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = prom.record_date
            and
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = prom.agep_be_executing
            and
            upd.outlet_ams_id = prom.outlet_ams_id
            )
        when matched then
            update
                set
                    prom.agep_period_fyp = upd.agep_period_fyp,
                    prom.agep_period_cont_issue = upd.agep_period_cont_issue,
                    prom.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    prom.update_datetime = sysdate;
        commit;*/
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agep_data', ' Tong hop du lieu danh gia chay xong');
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_agep_data: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_agep_asmt(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
        var_effective_date date := add_months(trunc(valRecordDate, 'MM'), 1);
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /*Neu ma chay tu 1/1 den truoc ngay 1/3 thi ngay hieu luc moi se la 1/3*/
        if trunc(valRecordDate, 'MM')
            <= trunc(to_date('1-mar-2013'), 'DD') - 1 then
            /*between trunc(to_date('1-jan-2013'), 'DD')
            and*/
            var_effective_date := trunc(to_date('1-mar-2013'), 'DD');
        /*Neu ma chay tu 1/3 den truoc ngay 1/6 thi ngay hieu luc moi se la 1/6*/
        elsif trunc(valRecordDate, 'MM')
            between trunc(to_date('1-mar-2013'), 'DD')
            and trunc(to_date('1-jun-2013'), 'DD') - 1 then
            var_effective_date := trunc(to_date('1-jun-2013'), 'DD');
        /*Neu ma chay tu 1/6 den truoc ngay 1/9 thi ngay hieu luc moi se la 1/9*/
        elsif trunc(valRecordDate, 'MM')
            between trunc(to_date('1-jun-2013'), 'DD')
            and trunc(to_date('1-sep-2013'), 'DD') - 1 then
            var_effective_date := trunc(to_date('1-sep-2013'), 'DD');
        /*Neu ma chay tu 1/9 den truoc ngay 1/12 thi ngay hieu luc moi se la 1/12*/
        elsif trunc(valRecordDate, 'MM')
            between trunc(to_date('1-sep-2013'), 'DD')
            and trunc(to_date('1-dec-2013'), 'DD') - 1 then
            var_effective_date := trunc(to_date('1-dec-2013'), 'DD');
        elsif trunc(valRecordDate, 'MM') >= trunc(to_date('1-dec-2013'), 'DD') then
            var_effective_date := trunc(to_date('1-mar-2014'), 'DD');
        end if;

        /* Chi tieu thang tien:
           SENIORITY: 6 thang
           PERIOD FYP: 70.000.000
           PERIOD ISSUE: 8*/
        update la_promotion_mmxiii prom
        set
            prom.agep_asmt = AMS_MODL_PROM_MMXIII.AMST_PROM,
            prom.agep_effe_date = var_effective_date,
            prom.agep_effe_code = AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV01,
            prom.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            prom.update_datetime = sysdate
        where prom.record_date = trunc(valRecordDate, 'MM')
            and prom.agep_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            and prom.agep_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
            and prom.agep_senr_by_months >= 6
            and prom.agep_period_fyp >= 70000000
            and prom.agep_period_cont_issue >= 8;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agep_asmt', ' Chi tieu thang tien chay xong');
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_agep_asmt: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_agep_close(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        update la_prom_mmxiii_agep agep
        set
            agep.agep_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_NO,
            agep.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            agep.update_datetime = sysdate
        where agep.record_date = trunc(valRecordDate, 'MM')
            and agep.agep_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES;
        commit;

        update la_promotion_mmxiii prom
        set
            prom.agep_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_NO,
            prom.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            prom.update_datetime = sysdate
        where prom.record_date = trunc(valRecordDate, 'MM')
            and prom.agep_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_agep_close', ' da chay xong');
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_agep_close: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_pump(valRecordDate date := null)
    is
    begin
        if (
            AMS_CORE_MODULE.is_active(
                AMS_MODL_PROM_MMXIII.MMXIII_PROM_PUMP,
                trunc(valRecordDate, 'MM')
            ) = AMS_CORE_MODULE.IS_YES
        ) then
            /*for var_result in (
                select
                    prom_date.promotion_date
                from ams.mod_prom_date prom_date
                where prom_date.module_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_PROM
                    and prom_date.sub_code = AMS_MODL_PROM_MMXIII.MMXIII_PROM_PUMP
                    and prom_date.status_code = AMS_MODL_PROM_MMXIII.OBJECT_STATUS_ACTIVE
                    and prom_date.promotion_date = trunc(valRecordDate, 'MM')
                group by prom_date.promotion_date
            ) loop*/
                AMS_MODL_PROM_MMXIII.mmxiii_modl_pump_open(valRecordDate);
                AMS_MODL_PROM_MMXIII.mmxiii_modl_pump_data(valRecordDate);
                AMS_MODL_PROM_MMXIII.mmxiii_modl_pump_asmt(valRecordDate);
                AMS_MODL_PROM_MMXIII.mmxiii_modl_pump_close(valRecordDate);
            /*end loop;*/
        end if;
    end;

    /*Tu tien truong nhom len truong nhom*/
    procedure mmxiii_modl_pump_open(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
        var_effective_date date := add_months(trunc(valRecordDate, 'MM'), 1);
        var_pump_from_date date := add_months(trunc(valRecordDate, 'MM'), -5);
        var_pump_to_date date := valRecordDate;
        var_pump_record_to_date date := valRecordDate;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* Len danh sach tien truong nhom duoc xet len truong nhom*/
        update ams.la_promotion_mmxiii prom
        set
            prom.pump_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES,
            prom.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
            /*Cap nhat ngay hieu luc chuc vu luon o day*/
            prom.pump_effective_date = prom.info_position_date,
            prom.pump_numb_asmt = null,
            prom.pump_period_fyp= 0,
            prom.pump_period_empl = 0,
            prom.pump_period_pr36 = 0,
            prom.pump_period_acti = 0,
            prom.pump_asmt = AMS_MODL_PROM_MMXIII.AMST_MAIN,
            prom.pump_effe_date = null,
            prom.pump_effe_code = null,
            prom.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            prom.update_datetime = sysdate
        where prom.record_date = trunc(valRecordDate, 'MM')
            and prom.be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            and prom.info_position_code in (
                AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV01
            );
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_pump_open', 'Len danh sach tien truong nhom duoc xet len truong nhom thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 1;
        /*
        Dem so lan xet thang tien cua nhung Tien truong nhom
        pump_numb_asmt la cot the hien lan xet thu may cua Tien truong nhom
        -----
        Phan nay rat quan trong
        Neu ma co ngay hieu luc ke tu ngay 01-OCT-2011 cho den 1/1/2012 thi
        chi cong voi so lan da xet thang tien trong nam 2012 thoi

        Neu ma co ngay hieu luc ke tu ngay 1/7/2011 den 30/9/2011 thi
        tuc la da duoc xet thang tien 1 lan roi nen phai cong them 1  (do da xet thang tien cua nam 2011)
        vao so lan da duoc xet thang tien cua nam 2012

        Neu ma co ngay hieu luc truoc ngay 30/6/2011
        tuc la da duoc xet thang tien 2 lan roi nen phai cong them 2  (do da xet thang tien cua nam 2011)
        vao so lan da duoc xet thang tien cua nam 2012

        Nhu vay la se ra duoc so lan xet thang tien trong nam de biet rang co con duoc xet thang tien hay khong
        */

        /*
        Dem so lan xet thang tien cua Tien truong nhom
        Co ngay hieu luc ke tu ngay 01/12/2012
        Neu ma co ngay hieu luc ke tu ngay 01/12/2012 cho den 1/1/2012 thi
        chi cong voi so lan da xet thang tien trong nam 2013 da xet
        Khong cong them voi so lan da xet thang tien trong thang truoc
        */
        /*pump_numb_asmt la cot the hien day la lan xet thu may
        cua Tien truong nhom*/

        --DOC GIAI THICH O DAY MOI HIEU
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

        --Nhu vay la cac doan code nay da code hoan toan chinh xac roii
        --DOC GIAI THICH O DAY MOI HIEU
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
        update ams.la_promotion_mmxiii prom
        set
            prom.pump_numb_asmt =
                (
                    select count(*)
                    from mod_prom_date d
                    where d.module_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_PROM
                        and d.sub_code = AMS_MODL_PROM_MMXIII.MMXIII_PROM_PUMP
                        and d.status_code = AMS_MODL_PROM_MMXIII.OBJECT_STATUS_ACTIVE
                        and d.promotion_date
                            between greatest(AMS_MODL_PROM_MMXIII.PROM_DATE_MMXIII, prom.pump_effective_date)
                            and add_months(trunc(valRecordDate, 'MM'), 1) --cho den thang tinh nay cong them 1 thi se biet duoc da chay thang tien tu dau nam la bao nhieu lan roi
                        /*can phai them dieu kien o day thi moi duoc dung cho no phai nho hon nhu the nay thi moi tinh duoc chinh xac*/
                        and greatest(AMS_MODL_PROM_MMXIII.PROM_DATE_MMXIII, prom.pump_effective_date)
                            <= add_months(trunc(valRecordDate, 'MM'), 1)
                ),
            prom.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            prom.update_datetime = sysdate
        where prom.record_date = trunc(valRecordDate, 'MM')
            and prom.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            and prom.pump_effective_date >= trunc(to_date('1-dec-2012'), 'DD');
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_pump_open', ' Dem so lan xet thang tien cua Tien truong nhom thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 2;

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
        update ams.la_promotion_mmxiii prom
        set
            prom.pump_numb_asmt =
                (
                    select count(*) + 1
                    from mod_prom_date d
                    where d.module_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_PROM
                        and d.sub_code = AMS_MODL_PROM_MMXIII.MMXIII_PROM_PUMP
                        and d.status_code = AMS_MODL_PROM_MMXIII.OBJECT_STATUS_ACTIVE
                        and d.promotion_date
                            between AMS_MODL_PROM_MMXIII.PROM_DATE_MMXIII
                            and add_months(trunc(valRecordDate, 'MM'), 1)
                        /*can phai them dieu kien o day thi moi duoc dung cho no phai nho hon nhu the nay thi moi tinh duoc chinh xac*/
                        and AMS_MODL_PROM_MMXIII.PROM_DATE_MMXIII <= add_months(trunc(valRecordDate, 'MM'), 1)
                ),
            prom.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            prom.update_datetime = sysdate
        where prom.record_date = trunc(valRecordDate, 'MM')
            and prom.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            --chinhlk fix lai neu thang tien tu 1/9/2012 den 30/11/2012 thi se thuc hien theo yeu cau cua anh Huu Hoa
            and prom.pump_effective_date
                between trunc(to_date('1-sep-2012'), 'DD')
                and trunc(to_date('30-nov-2012'), 'DD');
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_pump_open', 'Neu ma co ngay hieu luc ke tu ngay 1/9/2012  den 30/11/2012  thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 3;

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
        update ams.la_promotion_mmxiii prom
        set
            prom.pump_numb_asmt =
                (
                    select count(*) + 2
                    from mod_prom_date d
                    where d.module_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_PROM
                        and d.sub_code = AMS_MODL_PROM_MMXIII.MMXIII_PROM_PUMP
                        and d.status_code = AMS_MODL_PROM_MMXIII.OBJECT_STATUS_ACTIVE
                        and d.promotion_date
                            between AMS_MODL_PROM_MMXIII.PROM_DATE_MMXIII
                            and add_months(trunc(valRecordDate, 'MM'), 1)
                        /*can phai them dieu kien o day thi moi duoc dung cho no phai nho hon nhu the nay thi moi tinh duoc chinh xac*/
                        and AMS_MODL_PROM_MMXIII.PROM_DATE_MMXIII <= add_months(trunc(valRecordDate, 'MM'), 1)
                ),
            prom.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            prom.update_datetime = sysdate
        where prom.record_date = trunc(valRecordDate, 'MM')
            and prom.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            --chinhlk fix lai neu thang tien tu 1/9/2012 den 30/11/2012 thi se thuc hien theo yeu cau cua anh Huu Hoa
            and prom.pump_effective_date
                between trunc(to_date('1-jun-2012'), 'DD')
                and trunc(to_date('31-aug-2012'), 'DD');
        commit;

        --chinhlk 23/2/2013 them doan nay de theo yeu cau anh Huu Hoa
        --xu ly them truong hop nay nhe
        update ams.la_promotion_mmxiii prom
        set
            prom.pump_numb_asmt =
                (
                    select count(*) + 3
                    from mod_prom_date d
                    where d.module_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_PROM
                        and d.sub_code = AMS_MODL_PROM_MMXIII.MMXIII_PROM_PUMP
                        and d.status_code = AMS_MODL_PROM_MMXIII.OBJECT_STATUS_ACTIVE
                        and d.promotion_date
                            between AMS_MODL_PROM_MMXIII.PROM_DATE_MMXIII
                            and add_months(trunc(valRecordDate, 'MM'), 1)
                        /*can phai them dieu kien o day thi moi duoc dung cho no phai nho hon nhu the nay thi moi tinh duoc chinh xac*/
                        and AMS_MODL_PROM_MMXIII.PROM_DATE_MMXIII <= add_months(trunc(valRecordDate, 'MM'), 1)
                ),
            prom.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            prom.update_datetime = sysdate
        where prom.record_date = trunc(valRecordDate, 'MM')
            and prom.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            and prom.pump_effective_date < trunc(to_date('1-jun-2012'), 'DD'); --neu nho hon 1 thang 6 thi coi nhu se la lan thu 3 roi
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_pump_open', 'co ngay hieu luc truoc ngay 30/8/2012  thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 4;

        /* Loai bo cac tien truong nhom da xet hon 3 lan
        vi neu duoc xet hon 3 lan thi chung to da bi ha bac roi
        day la 1 truong hop bi loi
        */
        /*lay ngay hieu luc trong truong hop bi loi*/
        /*Neu ma chay tu 1/1 den truoc ngay 1/3 thi ngay hieu luc moi se la 1/3*/
/*        if trunc(valRecordDate, 'MM')
            between trunc(to_date('1-jan-2013'), 'DD')
            and trunc(to_date('1-mar-2013'), 'DD') - 1 then*/
        if trunc(valRecordDate, 'MM') --chay o thang 12 nam 2012 thi van co the dap ung duoc
            <= trunc(to_date('1-feb-2013'), 'DD') then
            var_effective_date := trunc(to_date('1-mar-2013'), 'DD');
        /*Neu ma chay tu 1/3 den truoc ngay 1/6 thi ngay hieu luc moi se la 1/6*/
        elsif trunc(valRecordDate, 'MM')
            between trunc(to_date('1-mar-2013'), 'DD')
            and trunc(to_date('1-jun-2013'), 'DD') - 1 then
            var_effective_date := trunc(to_date('1-jun-2013'), 'DD');
        /*Neu ma chay tu 1/6 den truoc ngay 1/9 thi ngay hieu luc moi se la 1/9*/
        elsif trunc(valRecordDate, 'MM')
            between trunc(to_date('1-jun-2013'), 'DD')
            and trunc(to_date('1-sep-2013'), 'DD') - 1 then
            var_effective_date := trunc(to_date('1-sep-2013'), 'DD');
        /*Neu ma chay tu 1/9 den truoc ngay 1/12 thi ngay hieu luc moi se la 1/12*/
        elsif trunc(valRecordDate, 'MM')
            between trunc(to_date('1-sep-2013'), 'DD')
            and trunc(to_date('1-dec-2013'), 'DD') - 1 then
            var_effective_date := trunc(to_date('1-dec-2013'), 'DD');
        elsif trunc(valRecordDate, 'MM')>= trunc(to_date('1-dec-2013'), 'DD') then
            var_effective_date := trunc(to_date('1-mar-2014'), 'DD');
        end if;

        /*sua lai theo comment cua anh Huu Hoa
        neu ma qua 4 lan thi se sua cho no dung la bi ha bac*/
        update ams.la_promotion_mmxiii prom
        set
            prom.pump_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_NO,
            prom.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_NO,
            prom.pump_asmt = AMS_MODL_PROM_MMXIII.AMST_DEPO,--cap nhat cho nay bi ha bac cho no
            prom.pump_effe_date = var_effective_date,
            prom.pump_effe_code = AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV05,
            prom.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            prom.update_datetime = sysdate
        where prom.record_date = trunc(valRecordDate, 'MM')
            and prom.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            and nvl(prom.pump_numb_asmt, 0) > 3;
        commit;


        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_pump_open', 'Loai bo cac tien truong nhom da xet hon 3 lan  thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 5;

        /* Len danh sach du lieu chi tiet can xoa*/
        merge /*+ CARDINALITY(pump, 100)*/
            into ams.la_prom_mmxiii_pump pump
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.info_company_id company_id
                from ams.la_promotion_mmxiii tmp
                where tmp.record_date = trunc(valRecordDate, 'MM')
                    and tmp.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                group by tmp.info_company_id
            ) upd
        on (
            AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN = pump.type_code
            and
            trunc(valRecordDate, 'MM') = pump.record_date
            and
            upd.company_id = pump.company_id
            )
        when matched then
            update
                set
                    pump.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_DEL;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_pump_open', 'Len danh sach du lieu chi tiet can xoa thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 6;

        /* Xoa du lieu chi tiet*/
        loop
            delete ams.la_prom_mmxiii_pump del
            where del.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                and del.record_date = trunc(valRecordDate, 'MM')
                and del.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_DEL
                and rownum < AMS_MODL_PROM_MMXIII.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_MODL_PROM_MMXIII.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_pump_open', 'Xoa du lieu chi tiet thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 7;

        dbms_stats.gather_table_stats(null, 'la_prom_history_agent_tmp', cascade => true);

        /*Can phai lay chinh xac ngay chay la ngay nao o day thi so lieu moi dung duoc*/
        /*Neu ma chay tu 1/1 den 1/2 thi den ngay se la ngay 28/2/2013 tuc la cuoi thang xet*/
        /*Con tu ngay thi se phau tinh can cu dua vao lan xet nay la lan xet thu bao nhieu thi se phai xu ly cho no*/

        --Lay ngay chay den chinh la thang chay thi moi dung duoc
        var_pump_to_date := trunc(last_day(trunc(valRecordDate, 'MM')), 'DD');
        if trunc(valRecordDate, 'MM')
            /*between trunc(to_date('1-jan-2013'), 'DD')
            and*/ <= trunc(to_date('1-feb-2013'), 'DD') then
            --lay ra thang cua den ngay do thi chay moi dung duoc khi tinh tu ngay la ngay nao khi quay lai bao nhieu thang
            var_pump_record_to_date  := trunc(to_date('1-feb-2013'), 'DD');
        /*Neu ma chay tu 1/3 den 31/5 thi den ngay la 31/5 va ngay record_date = 1/5*/
        elsif trunc(valRecordDate, 'MM')
            between trunc(to_date('1-mar-2013'), 'DD')
            and trunc(to_date('1-may-2013'), 'DD') then
            --lay ra thang cua den ngay do thi chay moi dung duoc khi tinh tu ngay la ngay nao khi quay lai bao nhieu thang
            var_pump_record_to_date  := trunc(to_date('1-may-2013'), 'DD');
        /*Neu ma chay tu 1/6 den 31/8 thi den ngay la 31/8 va ngay record_date = 1/8*/
        elsif trunc(valRecordDate, 'MM')
            between trunc(to_date('1-jun-2013'), 'DD')
            and trunc(to_date('1-aug-2013'), 'DD') then
            --lay ra thang cua den ngay do thi chay moi dung duoc khi tinh tu ngay la ngay nao khi quay lai bao nhieu thang
            var_pump_record_to_date  := trunc(to_date('1-aug-2013'), 'DD');
        /*Neu ma chay tu 1/9 den 30/11 thi den ngay la 30/11 va ngay record_date = 1/11*/
        elsif trunc(valRecordDate, 'MM')
            between trunc(to_date('1-sep-2013'), 'DD')
            and trunc(to_date('1-nov-2013'), 'DD') then
            --lay ra thang cua den ngay do thi chay moi dung duoc khi tinh tu ngay la ngay nao khi quay lai bao nhieu thang
            var_pump_record_to_date  := trunc(to_date('1-nov-2013'), 'DD');
        /*Neu ma chay >= 1/12 thi den ngay la 31/12 va ngay record_date = 1/12*/
        elsif trunc(valRecordDate, 'MM') >= trunc(to_date('1-dec-2013'), 'DD') then
            --lay ra thang cua den ngay do thi chay moi dung duoc khi tinh tu ngay la ngay nao khi quay lai bao nhieu thang
            var_pump_record_to_date  := trunc(to_date('1-feb-2014'), 'DD');
        end if;

        /* Xoa du lieu chi tiet o bang chi thang duoc tuyen khi la TVV thanh cong
        la_prom_mmxiii_pump_time*/
        loop
            delete ams.la_prom_mmxiii_pump_time del
            where del.record_date = trunc(valRecordDate, 'MM')
                and rownum < AMS_MODL_PROM_MMXIII.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_MODL_PROM_MMXIII.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_pump_open', 'Xoa du lieu chi tiet o bang chi thang duoc tuyen khi la TVV thanh cong la_prom_mmxiii_pump_time thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 7.1;

        /* Do du lieu cho no*/
        insert /*+ APPEND */ into ams.la_prom_mmxiii_pump_time nologging (
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
            pump_be_paid,
            pump_be_executing,
            pump_effective_date,
            pump_numb_asmt,
            pump_from_date,
            pump_to_date,
            create_user,
            update_user,
            create_datetime,
            update_datetime
        )
        select /*+ CARDINALITY(data, 100)*/
            tmp.outlet_id,
            tmp.outlet_ams_id,
            trunc(valRecordDate, 'MM'),
            cast(trunc(sysdate, 'DD') as date),
            tmp.outlet_name,
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
            AMS_MODL_PROM_MMXIII.BE_PAID_NO,--dau tien la khong duoc de xac dinh them nua thi moi co the duoc la YES
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
            tmp.pump_effective_date,--ngay thang tien len lam tien truong nhom
            tmp.pump_numb_asmt,
            null,
            null,
            AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.la_promotion_mmxiii tmp
        where tmp.record_date = trunc(valRecordDate, 'MM')
            and tmp.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            and tmp.pump_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
            and tmp.pump_numb_asmt between 1 and 3; --neu day la lan xet thang tien thu 1 va 3
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_pump_open', 'Do du lieu cho la_prom_mmxiii_pump_time thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 7.2;

        /*CHUA XU LY DUOC PHAN NEU KHONG CO QUYEN TUYEN DUNG VAO NGAY len tien truong nhom - 1 thi k dc
        cong dai ly nao ca*/

        --phai duoc quyen tuyen dung vao ngay truoc ngay thang tien lam tien truong nhom
        --thi moi tinh con khong thi khong tinh cho no
        --anh Hoa da confirm 14/3/2013
        merge /*+ CARDINALITY(umdv, 100)*/
            into ams.la_prom_mmxiii_pump_time umdv
        using
            (
                select  /*+ CARDINALITY(outl, 100) CARDINALITY(rig, 100)*/
                    outl.outlet_ams_id
                from
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_ams_id,
                        --ngay truoc khi len lam tien truong nhom
                        tmp.pump_effective_date - 1 to_date
                    from ams.la_prom_mmxiii_pump_time tmp
                    where tmp.record_date = trunc(valRecordDate, 'MM')
                ) outl
                join
                (
                    select  /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_ams_id,
                        --chay tung thang va lay thang dat duoc yeu cau vao trong bang do
                        --i tu 0 den 6
                        tmp.right_from_date from_date,
                        tmp.right_to_date to_date
                    from ams.la_employment_rights_2013 tmp
                ) rig
                   on rig.outlet_ams_id = outl.outlet_ams_id
                      --ngay thang tien len lam tien truong nhom - 1 phai nam trong khoang thoi gian TVV thanh cong thi moi duoc tinh con khong thi thoi luon
                       and outl.to_date between rig.from_date and rig.to_date
                group by outl.outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = umdv.record_date
            and
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = umdv.pump_be_executing
            and
            upd.outlet_ams_id = umdv.outlet_ams_id
            )
        when matched then
            update
                set
                    umdv.pump_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_pump_open', 'Do du lieu cho la_prom_mmxiii_pump_time thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 7.3;
        --xoa het du lieu khi ma no bi NO di boi vi nhu the la khong hop le
/*        delete
        from ams.la_prom_mmxiii_pump_time tmp
        where tmp.record_date = trunc(valRecordDate, 'MM')
            and tmp.pump_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_NO;
        commit;*/

        /* Xet trong vong quay lai 6 thang
        phai bat dau tu so 1 vi tim tien truong nhom o thang truoc day
        tuc la thang add_months(trunc(valRecordDate, 'MM'), -i) roi sau do tim ra duoc nhom da phat trien len
        */
        --quay nguoc tro lai mot khoang thoi gian de lay ra duoc ngay duoc quyen tuyen dung tu ngay nao den ngay nao
        --thong thuong la quay vong lai 6 thang
        for i in 0..6
        loop
            --quay
            merge /*+ CARDINALITY(umdv, 100)*/
                into ams.la_prom_mmxiii_pump_time umdv
            using
                (
                    select outl.outlet_ams_id,
                        --gia tri nho nhat cua tu ngay nao
                        min(rig.from_date) pump_from_date,
                        --gia tri lon nhat luon co dinh da co roi
                        max(outl.to_date) pump_to_date
                    from
                    (
                        select /*+ CARDINALITY(tmp, 100)*/
                            tmp.outlet_ams_id,
                            --quay lai 6 thang ke tu khi len lam tien truong nhom
                            add_months(tmp.pump_effective_date, -6) from_date,
                            --ngay truoc khi len lam tien truong nhom
                            tmp.pump_effective_date - 1 to_date,
                            tmp.pump_effective_date
                        from ams.la_prom_mmxiii_pump_time tmp
                        where tmp.record_date = trunc(valRecordDate, 'MM')
                            and tmp.pump_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
                    ) outl
                    join
                    (
                        select tmp.outlet_ams_id,
                            --chay tung thang va lay thang dat duoc yeu cau vao trong bang do
                            --i tu 0 den 6
                            add_months(trunc(tmp.right_to_date, 'MM'), -i) from_date
                        from ams.la_employment_rights_2013 tmp
                        --chu y la cac du lieu nay thi thang chay day phai nam trong
                        --khoang thoi gian duoc phep quyen dung
                        --nhu the thi moi dam bao chinh xac duoc du lieu va chay it du lieu
                        --chu y cho nay phai nhu the nay thi moi chinh xac duoc co nhe
                        where add_months(trunc(tmp.right_to_date, 'MM'), -i)
                            between tmp.right_from_date
                            and tmp.right_to_date
                    ) rig
                       on rig.outlet_ams_id = outl.outlet_ams_id
                          --ngay co quyen tuyen dung nam tu ngay, den ngay nay thi moi dung duoc
                           and rig.from_date between outl.from_date and outl.to_date
                    group by outl.outlet_ams_id
                ) upd
            on (
                trunc(valRecordDate, 'MM') = umdv.record_date
                and
                AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = umdv.pump_be_executing
                and--chi lay duoc tra thoi con khong thi thoi
                AMS_MODL_PROM_MMXIII.BE_PAID_YES = umdv.pump_be_paid
                and
                upd.outlet_ams_id = umdv.outlet_ams_id
                )
            when matched then
                update
                    set
                        umdv.pump_from_date = upd.pump_from_date,
                        umdv.pump_to_date = upd.pump_to_date;
            commit;
        end loop;


        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_pump_open', 'Quay nguoc tro lai mot khoang thoi gian de lay ra duoc ngay duoc quyen tuyen dung tu ngay nao den ngay nao thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 7.4;

        /* Len danh sach chi tiet cua dai ly*/
        /*Doan code nay co the lam ngan gon hon nhung da lam roi thi thoi va khong xu ly nua*/
        /*Neu day la lan xet thang tien thu nhat thi se lay quay lai 3 thang de lam cho nhanh
        chia thanh tung thang de lam cho nhanh va xu ly khong bi loi
        de debug hon
        */
        /*Truong hop 1 neu day la lan xet thang tien thu 1 thi se quay lai 3 thang truoc*/

        for i in 0..2
        loop
            var_error_pos := i;
            /*Neu ma thang do nam trong thang can chay so lieu thi moi tinh con khong thi thoi
            de so lieu dung cho no*/
            /*Chi quay lai 2 thang cho no*/
            var_pump_from_date := add_months(var_pump_record_to_date, -2);
            --Neu nam trong khoang thoi gian xac dinh o tren thi moi insert vao du lieu con neu khong thi thoi
            if add_months(trunc(valRecordDate, 'MM'), -i)
                between var_pump_from_date
                and var_pump_to_date
            then
                /* Cac dai ly do Tien truong nhom tuyen*/
                insert /*+ APPEND */ into ams.la_prom_mmxiii_pump nologging (
                    outlet_id,
                    outlet_ams_id,
                    record_date,
                    version_date,
                    type_code,
                    outlet_name,
                    company_id,
                    effective_date,
                    terminative_date,
                    pump_outlet_id,
                    pump_numb_asmt,
                    pump_be_paid,
                    pump_be_executing,
                    pump_data_date,
                    pump_period_fyp,
                    pump_period_empl,
                    pump_period_afis,
                    pump_period_afif,
                    pump_period_pr36,
                    pump_period_issu,
                    pump_period_acti,
                    create_user,
                    update_user,
                    create_datetime,
                    update_datetime
                )
                select /*+ CARDINALITY(empl, 100) CARDINALITY(outl, 100)*/
                    outl.outlet_id,
                    outl.outlet_ams_id,
                    trunc(valRecordDate, 'MM'),
                    cast(trunc(sysdate, 'DD') as date),
                    AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN,
                    outl.outlet_name,
                    outl.company_id,
                    outl.effective_date,
                    outl.terminative_date,
                    empl.empl_id,
                    pum.pump_numb_asmt,
                    AMS_MODL_PROM_MMXIII.BE_PAID_DTL,
                    AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
                    add_months(trunc(valRecordDate, 'MM'), -i),
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    sysdate,
                    sysdate
                from
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.pump_effective_date,
                        tmp.pump_numb_asmt --so lan nay la lan xet thu may?
                    from ams.la_promotion_mmxiii tmp
                    where tmp.record_date = trunc(valRecordDate, 'MM')
                        and tmp.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                        and tmp.pump_numb_asmt = 1 --neu day la lan xet thang tien thu 1 thi se quay lai 3  thang truoc
                ) pum
                join
                (
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
                        data.outlet_id,
                        data.outlet_ams_id,
                        data.outlet_name,
                        data.company_id,
                        data.effective_date,
                        data.terminative_date
                    from ams.inp_data_outlet data
                    where data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                        and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                        and data.status_code = AMS_MODL_PROM_MMXIII.OBJECT_STATUS_ACTIVE
                ) outl
                    on outl.outlet_id = empl.outlet_id
                        and outl.effective_date >= pum.pump_effective_date;
                commit;
                ams.life_agency_log.time_end;
                ams.life_agency_log.write_log(1000, 'mmxiii_modl_pump_open', ' Xet lan 1 Cac dai ly do Tien truong nhom tuyen Len danh sach chi tiet cua dai ly thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' chi tiet thang ' || to_char(add_months(trunc(valRecordDate, 'MM'), -i), 'dd/mm/yyyy'));
                ams.life_agency_log.time_stop;
                ams.life_agency_log.time_begin;

                /*Cong them danh sach cac dai ly duoc tuyen khi lam TVV thanh cong
                trong vong cac  thang da xac dinh o bang la_prom_mmxiii_pump_time truoc khi lam tien truong nhom*/
                insert /*+ APPEND */ into ams.la_prom_mmxiii_pump nologging (
                    outlet_id,
                    outlet_ams_id,
                    record_date,
                    version_date,
                    type_code,
                    outlet_name,
                    company_id,
                    effective_date,
                    terminative_date,
                    pump_outlet_id,
                    pump_numb_asmt,
                    pump_be_paid,
                    pump_be_executing,
                    pump_data_date,
                    pump_period_fyp,
                    pump_period_empl,
                    pump_period_afis,
                    pump_period_afif,
                    pump_period_pr36,
                    pump_period_issu,
                    pump_period_acti,
                    create_user,
                    update_user,
                    create_datetime,
                    update_datetime
                )
                select /*+ CARDINALITY(empl, 100) CARDINALITY(outl, 100)*/
                    outl.outlet_id,
                    outl.outlet_ams_id,
                    trunc(valRecordDate, 'MM'),
                    cast(trunc(sysdate, 'DD') as date),
                    AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN,
                    outl.outlet_name,
                    outl.company_id,
                    outl.effective_date,
                    outl.terminative_date,
                    empl.empl_id,
                    pum.pump_numb_asmt,
                    AMS_MODL_PROM_MMXIII.BE_PAID_DTL,
                    AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
                    add_months(trunc(valRecordDate, 'MM'), -i),
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    sysdate,
                    sysdate
                from
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.pump_effective_date,
                        tmp.pump_numb_asmt --so lan nay la lan xet thu may?
                    from ams.la_promotion_mmxiii tmp
                    where tmp.record_date = trunc(valRecordDate, 'MM')
                        and tmp.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                        and tmp.pump_numb_asmt = 1 --neu day la lan xet thang tien thu 1 thi se quay lai 3  thang truoc
                ) pum
                join
                (  --lay ra duoc thoi gian khi con la tu van vien thanh cong va duoc phep tuyen dung o phia tren
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_ams_id,
                        tmp.pump_from_date,
                        tmp.pump_to_date
                    from ams.la_prom_mmxiii_pump_time tmp
                    where tmp.record_date = trunc(valRecordDate, 'MM')
                        and tmp.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                        and tmp.pump_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
                ) tim
                    on tim.outlet_ams_id = pum.outlet_ams_id
                join
                (
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
                        data.outlet_id,
                        data.outlet_ams_id,
                        data.outlet_name,
                        data.company_id,
                        data.effective_date,
                        data.terminative_date
                    from ams.inp_data_outlet data
                    where data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                        and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                        and data.status_code = AMS_MODL_PROM_MMXIII.OBJECT_STATUS_ACTIVE
                ) outl
                    on outl.outlet_id = empl.outlet_id
                        and outl.effective_date --tuyen duoc trong giai doan da xac dinh phia tren roi
                           between tim.pump_from_date and tim.pump_to_date;
                commit;

                ams.life_agency_log.time_end;
                ams.life_agency_log.write_log(1000, 'mmxiii_modl_pump_open', ' Cong them danh sach cac dai ly duoc tuyen khi lam TVV thanh cong' || ' chi tiet thang ' || to_char(add_months(trunc(valRecordDate, 'MM'), -i), 'dd/mm/yyyy'));
                ams.life_agency_log.time_stop;
                ams.life_agency_log.time_begin;

                var_error_pos := -i;
                /* Ban than Tien truong nhom*/
                insert /*+ APPEND */ into ams.la_prom_mmxiii_pump nologging (
                    outlet_id,
                    outlet_ams_id,
                    record_date,
                    version_date,
                    type_code,
                    outlet_name,
                    company_id,
                    effective_date,
                    terminative_date,
                    pump_outlet_id,
                    pump_numb_asmt,
                    pump_be_paid,
                    pump_be_executing,
                    pump_data_date,
                    pump_period_fyp,
                    pump_period_empl,
                    pump_period_afis,
                    pump_period_afif,
                    pump_period_pr36,
                    pump_period_issu,
                    pump_period_acti,
                    create_user,
                    update_user,
                    create_datetime,
                    update_datetime
                )
                select /*+ CARDINALITY(data, 100)*/
                    outl.outlet_id,
                    outl.outlet_ams_id,
                    trunc(valRecordDate, 'MM'),
                    cast(trunc(sysdate, 'DD') as date),
                    AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN,
                    outl.outlet_name,
                    outl.company_id,
                    outl.effective_date,
                    outl.terminative_date,
                    outl.outlet_id,
                    pump.pump_numb_asmt,
                    AMS_MODL_PROM_MMXIII.BE_PAID_DTL,
                    AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
                    add_months(trunc(valRecordDate, 'MM'), -i),
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    sysdate,
                    sysdate
                from
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.pump_effective_date,
                        tmp.pump_numb_asmt --so lan nay la lan xet thu may?
                    from ams.la_promotion_mmxiii tmp
                    where tmp.record_date = trunc(valRecordDate, 'MM')
                        and tmp.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                        and tmp.pump_numb_asmt = 1 --neu day la lan xet thang tien thu 1 thi se quay lai 3 thang truoc
                ) pump
                join
                (
                    select /*+ CARDINALITY(data, 100)*/
                        data.outlet_id,
                        data.outlet_ams_id,
                        data.outlet_name,
                        data.company_id,
                        data.effective_date,
                        data.terminative_date
                    from ams.inp_data_outlet data
                    --lay du lieu o thang nay vao cho no thi moi dung duoc
                    --boi vi no phai con lam viec o cac thang nay thi moi dung duoc cho no co nhe
                    where data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                        and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                        and data.status_code = AMS_MODL_PROM_MMXIII.OBJECT_STATUS_ACTIVE
                ) outl
                    on outl.outlet_id = pump.outlet_id;
                commit;
                ams.life_agency_log.time_end;
                ams.life_agency_log.write_log(1000, 'mmxiii_modl_pump_open', 'Ban than Tien truong nhom Xet lan 1 Len danh sach chi tiet cua dai ly thang ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' chi tiet thang ' || to_char(add_months(trunc(valRecordDate, 'MM'), -i), 'dd/mm/yyyy'));
            end if;
        end loop;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_pump_open', 'Xet lan 1 Len danh sach chi tiet cua dai ly thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 8;

        /*Truong hop 2 neu day la lan xet thang tien thu 2  thi se quay lai 6 thang truoc*/
        for i in 0..5
        loop
            /*Chi quay lai 6 thang cho no*/
            var_pump_from_date := add_months(var_pump_record_to_date, -5);
            if add_months(trunc(valRecordDate, 'MM'), -i)
                between var_pump_from_date
                and var_pump_to_date
            then
                /* Cac dai ly do Tien truong nhom tuyen*/
                insert /*+ APPEND */ into ams.la_prom_mmxiii_pump nologging (
                    outlet_id,
                    outlet_ams_id,
                    record_date,
                    version_date,
                    type_code,
                    outlet_name,
                    company_id,
                    effective_date,
                    terminative_date,
                    pump_outlet_id,
                    pump_numb_asmt,
                    pump_be_paid,
                    pump_be_executing,
                    pump_data_date,
                    pump_period_fyp,
                    pump_period_empl,
                    pump_period_afis,
                    pump_period_afif,
                    pump_period_pr36,
                    pump_period_issu,
                    pump_period_acti,
                    create_user,
                    update_user,
                    create_datetime,
                    update_datetime
                )
                select /*+ CARDINALITY(empl, 100) CARDINALITY(outl, 100)*/
                    outl.outlet_id,
                    outl.outlet_ams_id,
                    trunc(valRecordDate, 'MM'),
                    cast(trunc(sysdate, 'DD') as date),
                    AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN,
                    outl.outlet_name,
                    outl.company_id,
                    outl.effective_date,
                    outl.terminative_date,
                    empl.empl_id,
                    pum.pump_numb_asmt,
                    AMS_MODL_PROM_MMXIII.BE_PAID_DTL,
                    AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
                    add_months(trunc(valRecordDate, 'MM'), -i),
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    sysdate,
                    sysdate
                from
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.pump_effective_date,
                        tmp.pump_numb_asmt --so lan nay la lan xet thu may?
                    from ams.la_promotion_mmxiii tmp
                    where tmp.record_date = trunc(valRecordDate, 'MM')
                        and tmp.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                        and tmp.pump_numb_asmt = 2 --neu day la lan xet thang tien thu 2 thi se quay lai 6 thang truoc
                ) pum
                join
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_id,
                        tmp.empl_id
                    from ams.la_prom_history_agent_tmp tmp
                    where tmp.record_date = trunc(valRecordDate, 'MM')
                ) empl
                    on empl.empl_id = pum.outlet_id
                join
                (
                    select/*+ CARDINALITY(data, 100)*/
                        data.outlet_id,
                        data.outlet_ams_id,
                        data.outlet_name,
                        data.company_id,
                        data.effective_date,
                        data.terminative_date
                    from ams.inp_data_outlet data
                    where data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                        and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                        and data.status_code = AMS_MODL_PROM_MMXIII.OBJECT_STATUS_ACTIVE
                ) outl
                    on outl.outlet_id = empl.outlet_id
                        and outl.effective_date >= pum.pump_effective_date;
                commit;

                /*Cong them danh sach cac dai ly duoc tuyen khi lam TVV thanh cong
                trong vong cac  thang da xac dinh o bang la_prom_mmxiii_pump_time truoc khi lam tien truong nhom*/
                insert /*+ APPEND */ into ams.la_prom_mmxiii_pump nologging (
                    outlet_id,
                    outlet_ams_id,
                    record_date,
                    version_date,
                    type_code,
                    outlet_name,
                    company_id,
                    effective_date,
                    terminative_date,
                    pump_outlet_id,
                    pump_numb_asmt,
                    pump_be_paid,
                    pump_be_executing,
                    pump_data_date,
                    pump_period_fyp,
                    pump_period_empl,
                    pump_period_afis,
                    pump_period_afif,
                    pump_period_pr36,
                    pump_period_issu,
                    pump_period_acti,
                    create_user,
                    update_user,
                    create_datetime,
                    update_datetime
                )
                select /*+ CARDINALITY(empl, 100) CARDINALITY(outl, 100)*/
                    outl.outlet_id,
                    outl.outlet_ams_id,
                    trunc(valRecordDate, 'MM'),
                    cast(trunc(sysdate, 'DD') as date),
                    AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN,
                    outl.outlet_name,
                    outl.company_id,
                    outl.effective_date,
                    outl.terminative_date,
                    empl.empl_id,
                    pum.pump_numb_asmt,
                    AMS_MODL_PROM_MMXIII.BE_PAID_DTL,
                    AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
                    add_months(trunc(valRecordDate, 'MM'), -i),
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    sysdate,
                    sysdate
                from
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.pump_effective_date,
                        tmp.pump_numb_asmt --so lan nay la lan xet thu may?
                    from ams.la_promotion_mmxiii tmp
                    where tmp.record_date = trunc(valRecordDate, 'MM')
                        and tmp.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                        and tmp.pump_numb_asmt = 2 --neu day la lan xet thang tien thu 2 thi se quay lai 6  thang truoc
                ) pum
                join
                (  --lay ra duoc thoi gian khi con la tu van vien thanh cong va duoc phep tuyen dung o phia tren
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_ams_id,
                        tmp.pump_from_date,
                        tmp.pump_to_date
                    from ams.la_prom_mmxiii_pump_time tmp
                    where tmp.record_date = trunc(valRecordDate, 'MM')
                        and tmp.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                        and tmp.pump_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
                ) tim
                    on tim.outlet_ams_id = pum.outlet_ams_id
                join
                (
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
                        data.outlet_id,
                        data.outlet_ams_id,
                        data.outlet_name,
                        data.company_id,
                        data.effective_date,
                        data.terminative_date
                    from ams.inp_data_outlet data
                    where data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                        and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                        and data.status_code = AMS_MODL_PROM_MMXIII.OBJECT_STATUS_ACTIVE
                ) outl
                    on outl.outlet_id = empl.outlet_id
                        and outl.effective_date --tuyen duoc trong giai doan da xac dinh phia tren roi
                           between tim.pump_from_date and tim.pump_to_date;
                commit;


                ams.life_agency_log.time_end;
                ams.life_agency_log.write_log(1000, 'mmxiii_modl_pump_open', ' Cong them danh sach cac dai ly duoc tuyen khi lam TVV thanh cong' || ' chi tiet thang ' || to_char(add_months(trunc(valRecordDate, 'MM'), -i), 'dd/mm/yyyy'));
                ams.life_agency_log.time_stop;
                ams.life_agency_log.time_begin;

                /* Ban than Tien truong nhom*/
                insert /*+ APPEND */ into ams.la_prom_mmxiii_pump nologging (
                    outlet_id,
                    outlet_ams_id,
                    record_date,
                    version_date,
                    type_code,
                    outlet_name,
                    company_id,
                    effective_date,
                    terminative_date,
                    pump_outlet_id,
                    pump_numb_asmt,
                    pump_be_paid,
                    pump_be_executing,
                    pump_data_date,
                    pump_period_fyp,
                    pump_period_empl,
                    pump_period_afis,
                    pump_period_afif,
                    pump_period_pr36,
                    pump_period_issu,
                    pump_period_acti,
                    create_user,
                    update_user,
                    create_datetime,
                    update_datetime
                )
                select /*+ CARDINALITY(data, 100)*/
                    outl.outlet_id,
                    outl.outlet_ams_id,
                    trunc(valRecordDate, 'MM'),
                    cast(trunc(sysdate, 'DD') as date),
                    AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN,
                    outl.outlet_name,
                    outl.company_id,
                    outl.effective_date,
                    outl.terminative_date,
                    outl.outlet_id,
                    pump.pump_numb_asmt,
                    AMS_MODL_PROM_MMXIII.BE_PAID_DTL,
                    AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
                    add_months(trunc(valRecordDate, 'MM'), -i),
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    sysdate,
                    sysdate
                from
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.pump_effective_date,
                        tmp.pump_numb_asmt --so lan nay la lan xet thu may?
                    from ams.la_promotion_mmxiii tmp
                    where tmp.record_date = trunc(valRecordDate, 'MM')
                        and tmp.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                        and tmp.pump_numb_asmt = 2 --neu day la lan xet thang tien thu 2 thi se quay lai 6 thang truoc
                ) pump
                join
                (
                    select /*+ CARDINALITY(data, 100)*/
                        data.outlet_id,
                        data.outlet_ams_id,
                        data.outlet_name,
                        data.company_id,
                        data.effective_date,
                        data.terminative_date
                    from ams.inp_data_outlet data
                    where data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                        and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                        and data.status_code = AMS_MODL_PROM_MMXIII.OBJECT_STATUS_ACTIVE
                ) outl
                    on outl.outlet_id = pump.outlet_id;
                commit;
            end if;
        end loop;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_pump_open', 'Xet lan 2 Len danh sach chi tiet cua dai ly  thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 9;

        /*Truong hop 3 neu day la lan xet thang tien thu 3  thi se quay lai 9 thang truoc
        */
        --neu day la lan xet thang tien thu 3  va thang khong phai la dot thang tien
        --thang 3 nam 2013 thi se quay lai 9 thang truoc va theo dung nhu quy che
        if (add_months(trunc(valRecordDate, 'MM'), 1) <> add_months(AMS_MODL_PROM_MMXIII.PROM_DATE_MMXIII, 2)) then
            for i in 0..8
            loop
                /*Chi quay lai 9 thang cho no*/
                var_pump_from_date := add_months(var_pump_record_to_date, -8);
                if add_months(trunc(valRecordDate, 'MM'), -i)
                    between var_pump_from_date
                    and var_pump_to_date
                then
                    /* Cac dai ly do Tien truong nhom tuyen*/
                    insert /*+ APPEND */ into ams.la_prom_mmxiii_pump nologging (
                        outlet_id,
                        outlet_ams_id,
                        record_date,
                        version_date,
                        type_code,
                        outlet_name,
                        company_id,
                        effective_date,
                        terminative_date,
                        pump_outlet_id,
                        pump_numb_asmt,
                        pump_be_paid,
                        pump_be_executing,
                        pump_data_date,
                        pump_period_fyp,
                        pump_period_empl,
                        pump_period_afis,
                        pump_period_afif,
                        pump_period_pr36,
                        pump_period_issu,
                        pump_period_acti,
                        create_user,
                        update_user,
                        create_datetime,
                        update_datetime
                    )
                    select /*+ CARDINALITY(empl, 100) CARDINALITY(outl, 100)*/
                        outl.outlet_id,
                        outl.outlet_ams_id,
                        trunc(valRecordDate, 'MM'),
                        cast(trunc(sysdate, 'DD') as date),
                        AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN,
                        outl.outlet_name,
                        outl.company_id,
                        outl.effective_date,
                        outl.terminative_date,
                        empl.empl_id,
                        pum.pump_numb_asmt,
                        AMS_MODL_PROM_MMXIII.BE_PAID_DTL,
                        AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
                        add_months(trunc(valRecordDate, 'MM'), -i),
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                        AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                        sysdate,
                        sysdate
                    from
                    (
                        select /*+ CARDINALITY(tmp, 100)*/
                            tmp.outlet_id,
                            tmp.outlet_ams_id,
                            tmp.pump_effective_date,
                            tmp.pump_numb_asmt --so lan nay la lan xet thu may?
                        from ams.la_promotion_mmxiii tmp
                        where tmp.record_date = trunc(valRecordDate, 'MM')
                            and tmp.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                            and tmp.pump_numb_asmt = 3 --neu day la lan xet thang tien thu 3 thi se quay lai 9 thang truoc
                    ) pum
                    join
                    (
                        select /*+ CARDINALITY(tmp, 100)*/
                            tmp.outlet_id,
                            tmp.empl_id
                        from ams.la_prom_history_agent_tmp tmp
                        where tmp.record_date = trunc(valRecordDate, 'MM')
                    ) empl
                        on empl.empl_id = pum.outlet_id
                    join
                    (
                        select/*+ CARDINALITY(data, 100)*/
                            data.outlet_id,
                            data.outlet_ams_id,
                            data.outlet_name,
                            data.company_id,
                            data.effective_date,
                            data.terminative_date
                        from ams.inp_data_outlet data
                        where data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                            and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                            and data.status_code = AMS_MODL_PROM_MMXIII.OBJECT_STATUS_ACTIVE
                    ) outl
                        on outl.outlet_id = empl.outlet_id
                            and outl.effective_date >= pum.pump_effective_date;
                    commit;

                    /*Cong them danh sach cac dai ly duoc tuyen khi lam TVV thanh cong
                    trong vong cac  thang da xac dinh o bang la_prom_mmxiii_pump_time truoc khi lam tien truong nhom*/
                    insert /*+ APPEND */ into ams.la_prom_mmxiii_pump nologging (
                        outlet_id,
                        outlet_ams_id,
                        record_date,
                        version_date,
                        type_code,
                        outlet_name,
                        company_id,
                        effective_date,
                        terminative_date,
                        pump_outlet_id,
                        pump_numb_asmt,
                        pump_be_paid,
                        pump_be_executing,
                        pump_data_date,
                        pump_period_fyp,
                        pump_period_empl,
                        pump_period_afis,
                        pump_period_afif,
                        pump_period_pr36,
                        pump_period_issu,
                        pump_period_acti,
                        create_user,
                        update_user,
                        create_datetime,
                        update_datetime
                    )
                    select /*+ CARDINALITY(empl, 100) CARDINALITY(outl, 100)*/
                        outl.outlet_id,
                        outl.outlet_ams_id,
                        trunc(valRecordDate, 'MM'),
                        cast(trunc(sysdate, 'DD') as date),
                        AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN,
                        outl.outlet_name,
                        outl.company_id,
                        outl.effective_date,
                        outl.terminative_date,
                        empl.empl_id,
                        pum.pump_numb_asmt,
                        AMS_MODL_PROM_MMXIII.BE_PAID_DTL,
                        AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
                        add_months(trunc(valRecordDate, 'MM'), -i),
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                        AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                        sysdate,
                        sysdate
                    from
                    (
                        select /*+ CARDINALITY(tmp, 100)*/
                            tmp.outlet_id,
                            tmp.outlet_ams_id,
                            tmp.pump_effective_date,
                            tmp.pump_numb_asmt --so lan nay la lan xet thu may?
                        from ams.la_promotion_mmxiii tmp
                        where tmp.record_date = trunc(valRecordDate, 'MM')
                            and tmp.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                            and tmp.pump_numb_asmt = 3 --neu day la lan xet thang tien thu 3 thi se quay lai 9 thang truoc
                    ) pum
                    join
                    (  --lay ra duoc thoi gian khi con la tu van vien thanh cong va duoc phep tuyen dung o phia tren
                        select /*+ CARDINALITY(tmp, 100)*/
                            tmp.outlet_ams_id,
                            tmp.pump_from_date,
                            tmp.pump_to_date
                        from ams.la_prom_mmxiii_pump_time tmp
                        where tmp.record_date = trunc(valRecordDate, 'MM')
                            and tmp.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                            and tmp.pump_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
                    ) tim
                        on tim.outlet_ams_id = pum.outlet_ams_id
                    join
                    (
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
                            data.outlet_id,
                            data.outlet_ams_id,
                            data.outlet_name,
                            data.company_id,
                            data.effective_date,
                            data.terminative_date
                        from ams.inp_data_outlet data
                        where data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                            and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                            and data.status_code = AMS_MODL_PROM_MMXIII.OBJECT_STATUS_ACTIVE
                    ) outl
                        on outl.outlet_id = empl.outlet_id
                            and outl.effective_date --tuyen duoc trong giai doan da xac dinh phia tren roi
                               between tim.pump_from_date and tim.pump_to_date;
                    commit;

                    ams.life_agency_log.time_end;
                    ams.life_agency_log.write_log(1000, 'mmxiii_modl_pump_open', ' Cong them danh sach cac dai ly duoc tuyen khi lam TVV thanh cong' || ' chi tiet thang ' || to_char(add_months(trunc(valRecordDate, 'MM'), -i), 'dd/mm/yyyy'));
                    ams.life_agency_log.time_stop;
                    ams.life_agency_log.time_begin;

                    /* Ban than Tien truong nhom*/
                    insert /*+ APPEND */ into ams.la_prom_mmxiii_pump nologging (
                        outlet_id,
                        outlet_ams_id,
                        record_date,
                        version_date,
                        type_code,
                        outlet_name,
                        company_id,
                        effective_date,
                        terminative_date,
                        pump_outlet_id,
                        pump_numb_asmt,
                        pump_be_paid,
                        pump_be_executing,
                        pump_data_date,
                        pump_period_fyp,
                        pump_period_empl,
                        pump_period_afis,
                        pump_period_afif,
                        pump_period_pr36,
                        pump_period_issu,
                        pump_period_acti,
                        create_user,
                        update_user,
                        create_datetime,
                        update_datetime
                    )
                    select /*+ CARDINALITY(data, 100)*/
                        outl.outlet_id,
                        outl.outlet_ams_id,
                        trunc(valRecordDate, 'MM'),
                        cast(trunc(sysdate, 'DD') as date),
                        AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN,
                        outl.outlet_name,
                        outl.company_id,
                        outl.effective_date,
                        outl.terminative_date,
                        outl.outlet_id,
                        pump.pump_numb_asmt,
                        AMS_MODL_PROM_MMXIII.BE_PAID_DTL,
                        AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
                        add_months(trunc(valRecordDate, 'MM'), -i),
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                        AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                        sysdate,
                        sysdate
                    from
                    (
                        select /*+ CARDINALITY(tmp, 100)*/
                            tmp.outlet_id,
                            tmp.outlet_ams_id,
                            tmp.pump_effective_date,
                            tmp.pump_numb_asmt --so lan nay la lan xet thu may?
                        from ams.la_promotion_mmxiii tmp
                        where tmp.record_date = trunc(valRecordDate, 'MM')
                            and tmp.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                            and tmp.pump_numb_asmt = 3 --neu day la lan xet thang tien thu 3 thi se quay lai 9 thang truoc
                    ) pump
                    join
                    (
                        select /*+ CARDINALITY(data, 100)*/
                            data.outlet_id,
                            data.outlet_ams_id,
                            data.outlet_name,
                            data.company_id,
                            data.effective_date,
                            data.terminative_date
                        from ams.inp_data_outlet data
                        where data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                            and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                            and data.status_code = AMS_MODL_PROM_MMXIII.OBJECT_STATUS_ACTIVE
                    ) outl
                        on outl.outlet_id = pump.outlet_id;
                    commit;
                end if;
            end loop;
        else --khong xu ly o day do truong hop nay da fix cung roi
             /*Neu ma thang tien lan 3 va dot xet thang 3 nam 2013 thi se
             chi quay lai 3 thang va chi can cac chi tieu FYP >= 50 tr,
             tuyen thuan >= 4, PR36>=85%, Ty le HD >= 30*/
            for i in 0..2
            loop
                /* Cac dai ly do Tien truong nhom tuyen*/
                insert /*+ APPEND */ into ams.la_prom_mmxiii_pump nologging (
                    outlet_id,
                    outlet_ams_id,
                    record_date,
                    version_date,
                    type_code,
                    outlet_name,
                    company_id,
                    effective_date,
                    terminative_date,
                    pump_outlet_id,
                    pump_numb_asmt,
                    pump_be_paid,
                    pump_be_executing,
                    pump_data_date,
                    pump_period_fyp,
                    pump_period_empl,
                    pump_period_afis,
                    pump_period_afif,
                    pump_period_pr36,
                    pump_period_issu,
                    pump_period_acti,
                    create_user,
                    update_user,
                    create_datetime,
                    update_datetime
                )
                select /*+ CARDINALITY(empl, 100) CARDINALITY(outl, 100)*/
                    outl.outlet_id,
                    outl.outlet_ams_id,
                    trunc(valRecordDate, 'MM'),
                    cast(trunc(sysdate, 'DD') as date),
                    AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN,
                    outl.outlet_name,
                    outl.company_id,
                    outl.effective_date,
                    outl.terminative_date,
                    empl.empl_id,
                    pum.pump_numb_asmt,
                    AMS_MODL_PROM_MMXIII.BE_PAID_DTL,
                    AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
                    add_months(trunc(valRecordDate, 'MM'), -i),
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    sysdate,
                    sysdate
                from
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.pump_effective_date,
                        tmp.pump_numb_asmt --so lan nay la lan xet thu may?
                    from ams.la_promotion_mmxiii tmp
                    where tmp.record_date = trunc(valRecordDate, 'MM')
                        and tmp.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                        and tmp.pump_numb_asmt = 3 --neu day la lan xet thang tien thu 3 thi se quay lai 9 thang truoc
                ) pum
                join
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_id,
                        tmp.empl_id
                    from ams.la_prom_history_agent_tmp tmp
                    where tmp.record_date = trunc(valRecordDate, 'MM')
                ) empl
                    on empl.empl_id = pum.outlet_id
                join
                (
                    select/*+ CARDINALITY(data, 100)*/
                        data.outlet_id,
                        data.outlet_ams_id,
                        data.outlet_name,
                        data.company_id,
                        data.effective_date,
                        data.terminative_date
                    from ams.inp_data_outlet data
                    where data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                        and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                        and data.status_code = AMS_MODL_PROM_MMXIII.OBJECT_STATUS_ACTIVE
                ) outl
                    on outl.outlet_id = empl.outlet_id
                        and outl.effective_date >= pum.pump_effective_date;
                commit;

                /*Cong them danh sach cac dai ly duoc tuyen khi lam TVV thanh cong
                trong vong cac  thang da xac dinh o bang la_prom_mmxiii_pump_time truoc khi lam tien truong nhom*/
                insert /*+ APPEND */ into ams.la_prom_mmxiii_pump nologging (
                    outlet_id,
                    outlet_ams_id,
                    record_date,
                    version_date,
                    type_code,
                    outlet_name,
                    company_id,
                    effective_date,
                    terminative_date,
                    pump_outlet_id,
                    pump_numb_asmt,
                    pump_be_paid,
                    pump_be_executing,
                    pump_data_date,
                    pump_period_fyp,
                    pump_period_empl,
                    pump_period_afis,
                    pump_period_afif,
                    pump_period_pr36,
                    pump_period_issu,
                    pump_period_acti,
                    create_user,
                    update_user,
                    create_datetime,
                    update_datetime
                )
                select /*+ CARDINALITY(empl, 100) CARDINALITY(outl, 100)*/
                    outl.outlet_id,
                    outl.outlet_ams_id,
                    trunc(valRecordDate, 'MM'),
                    cast(trunc(sysdate, 'DD') as date),
                    AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN,
                    outl.outlet_name,
                    outl.company_id,
                    outl.effective_date,
                    outl.terminative_date,
                    empl.empl_id,
                    pum.pump_numb_asmt,
                    AMS_MODL_PROM_MMXIII.BE_PAID_DTL,
                    AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
                    add_months(trunc(valRecordDate, 'MM'), -i),
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    sysdate,
                    sysdate
                from
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.pump_effective_date,
                        tmp.pump_numb_asmt --so lan nay la lan xet thu may?
                    from ams.la_promotion_mmxiii tmp
                    where tmp.record_date = trunc(valRecordDate, 'MM')
                        and tmp.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                        and tmp.pump_numb_asmt = 3 --neu day la lan xet thang tien thu 3 thi se quay lai 9 thang truoc
                ) pum
                join
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_id,
                        tmp.empl_id
                    from ams.la_prom_history_agent_tmp tmp
                    where tmp.record_date = trunc(valRecordDate, 'MM')
                ) empl
                    on empl.empl_id = pum.outlet_id
                join
                (  --lay ra duoc thoi gian khi con la tu van vien thanh cong va duoc phep tuyen dung o phia tren
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_ams_id,
                        tmp.pump_from_date,
                        tmp.pump_to_date
                    from ams.la_prom_mmxiii_pump_time tmp
                    where tmp.record_date = trunc(valRecordDate, 'MM')
                ) tim
                    on tim.outlet_ams_id = pum.outlet_ams_id
                join
                (
                    select /*+ CARDINALITY(data, 100)*/
                        data.outlet_id,
                        data.outlet_ams_id,
                        data.outlet_name,
                        data.company_id,
                        data.effective_date,
                        data.terminative_date
                    from ams.inp_data_outlet data
                    where data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                        and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                        and data.status_code = AMS_MODL_PROM_MMXIII.OBJECT_STATUS_ACTIVE
                ) outl
                    on outl.outlet_id = empl.outlet_id
                        and outl.effective_date --tuyen duoc trong giai doan da xac dinh phia tren roi
                           between tim.pump_from_date and tim.pump_to_date;
                commit;

                /* Ban than Tien truong nhom*/
                insert /*+ APPEND */ into ams.la_prom_mmxiii_pump nologging (
                    outlet_id,
                    outlet_ams_id,
                    record_date,
                    version_date,
                    type_code,
                    outlet_name,
                    company_id,
                    effective_date,
                    terminative_date,
                    pump_outlet_id,
                    pump_numb_asmt,
                    pump_be_paid,
                    pump_be_executing,
                    pump_data_date,
                    pump_period_fyp,
                    pump_period_empl,
                    pump_period_afis,
                    pump_period_afif,
                    pump_period_pr36,
                    pump_period_issu,
                    pump_period_acti,
                    create_user,
                    update_user,
                    create_datetime,
                    update_datetime
                )
                select /*+ CARDINALITY(data, 100)*/
                    outl.outlet_id,
                    outl.outlet_ams_id,
                    trunc(valRecordDate, 'MM'),
                    cast(trunc(sysdate, 'DD') as date),
                    AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN,
                    outl.outlet_name,
                    outl.company_id,
                    outl.effective_date,
                    outl.terminative_date,
                    outl.outlet_id,
                    pump.pump_numb_asmt,
                    AMS_MODL_PROM_MMXIII.BE_PAID_DTL,
                    AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
                    add_months(trunc(valRecordDate, 'MM'), -i),
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    sysdate,
                    sysdate
                from
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_id,
                        tmp.outlet_ams_id,
                        tmp.pump_effective_date,
                        tmp.pump_numb_asmt --so lan nay la lan xet thu may?
                    from ams.la_promotion_mmxiii tmp
                    where tmp.record_date = trunc(valRecordDate, 'MM')
                        and tmp.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                        and tmp.pump_numb_asmt = 3 --neu day la lan xet thang tien thu 3 thi se quay lai 9 thang truoc
                ) pump
                join
                (
                    select /*+ CARDINALITY(data, 100)*/
                        data.outlet_id,
                        data.outlet_ams_id,
                        data.outlet_name,
                        data.company_id,
                        data.effective_date,
                        data.terminative_date
                    from ams.inp_data_outlet data
                    where data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                        and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                        and data.status_code = AMS_MODL_PROM_MMXIII.OBJECT_STATUS_ACTIVE
                ) outl
                    on outl.outlet_id = pump.outlet_id;
                commit;
            end loop;
        end if;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_pump_open', 'Xet lan 3 Len danh sach chi tiet cua dai ly  thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 10;

        /* So lieu tong hop*/
        insert /*+ APPEND */ into ams.la_prom_mmxiii_pump nologging (
            outlet_id,
            outlet_ams_id,
            record_date,
            version_date,
            type_code,
            outlet_name,
            company_id,
            effective_date,
            terminative_date,
            pump_outlet_id,
            pump_numb_asmt,
            pump_be_paid,
            pump_be_executing,
            pump_data_date,
            pump_period_fyp,
            pump_period_empl,
            pump_period_afis,
            pump_period_afif,
            pump_period_pr36,
            pump_period_issu,
            pump_period_acti,
            create_user,
            update_user,
            create_datetime,
            update_datetime
        )
        select pump.outlet_id,
            pump.outlet_ams_id,
            trunc(valRecordDate, 'MM'),
            cast(trunc(sysdate, 'DD') as date),
            AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN,
            max(pump.outlet_name),
            max(pump.company_id),
            min(pump.effective_date),
            max(pump.terminative_date),
            pump.pump_outlet_id,
            max(pump.pump_numb_asmt),
            AMS_MODL_PROM_MMXIII.BE_PAID_YES,
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
            trunc(valRecordDate, 'MM'),
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.la_prom_mmxiii_pump pump
        where pump.record_date = trunc(valRecordDate, 'MM')
            and pump.pump_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_DTL
            and pump.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
        group by pump.outlet_id,
            pump.outlet_ams_id,
            pump.pump_outlet_id;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_pump_open', 'So lieu tong hop thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 11;

        /* Ghi nhan outlet ams id*/
        merge /*+ CARDINALITY(pump, 100)*/
            into ams.la_prom_mmxiii_pump pump
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_client_id outlet_id,
                    max(tmp.outlet_number) outlet_ams_id
                from ods.outlet tmp
                group by tmp.outlet_client_id
            ) upd
        on (
            AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN = pump.type_code
            and
            trunc(valRecordDate, 'MM') = pump.record_date
            and
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = pump.pump_be_executing
            and
            upd.outlet_id = pump.pump_outlet_id
            )
        when matched then
            update
                set
                    pump.pump_outlet_ams_id = upd.outlet_ams_id,
                    pump.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    pump.update_datetime = sysdate;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_pump_open', ' da chay xong');
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_pump_open: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_pump_data(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
        var_qty_mon number(2) := -2;
        var_pump_from_date date := add_months(trunc(valRecordDate, 'MM'), -5);
        var_pump_to_date date := valRecordDate;
        var_pump_record_to_date date := valRecordDate;
    begin
        /*Neu ma chay tu 1/1 den 1/2 thi den ngay se la ngay 28/2/2013 tuc la cuoi thang xet*/
        /*Con tu ngay thi se phau tinh can cu dua vao lan xet nay la lan xet thu bao nhieu thi se phai xu ly cho no*/

        var_pump_to_date := trunc(last_day(valRecordDate), 'DD');
/*        if trunc(valRecordDate, 'MM')
            between trunc(to_date('1-jan-2013'), 'DD')
            and trunc(to_date('1-feb-2013'), 'DD') then*/
        if trunc(valRecordDate, 'MM') --chay o thang 12 nam 2012 thi van co the dap ung duoc
            <= trunc(to_date('1-feb-2013'), 'DD') then
            --lay ra thang cua den ngay do thi chay moi dung duoc khi tinh tu ngay la ngay nao khi quay lai bao nhieu thang
            var_pump_record_to_date  := trunc(to_date('1-feb-2013'), 'DD');
        /*Neu ma chay tu 1/3 den 31/5 thi den ngay la 31/5 va ngay record_date = 1/5*/
        elsif trunc(valRecordDate, 'MM')
            between trunc(to_date('1-mar-2013'), 'DD')
            and trunc(to_date('1-may-2013'), 'DD') then
            --lay ra thang cua den ngay do thi chay moi dung duoc khi tinh tu ngay la ngay nao khi quay lai bao nhieu thang
            var_pump_record_to_date  := trunc(to_date('1-may-2013'), 'DD');
        /*Neu ma chay tu 1/6 den 31/8 thi den ngay la 31/8 va ngay record_date = 1/8*/
        elsif trunc(valRecordDate, 'MM')
            between trunc(to_date('1-jun-2013'), 'DD')
            and trunc(to_date('1-aug-2013'), 'DD') then
            --lay ra thang cua den ngay do thi chay moi dung duoc khi tinh tu ngay la ngay nao khi quay lai bao nhieu thang
            var_pump_record_to_date  := trunc(to_date('1-aug-2013'), 'DD');
        /*Neu ma chay tu 1/9 den 30/11 thi den ngay la 30/11 va ngay record_date = 1/11*/
        elsif trunc(valRecordDate, 'MM')
            between trunc(to_date('1-sep-2013'), 'DD')
            and trunc(to_date('1-nov-2013'), 'DD') then
            --lay ra thang cua den ngay do thi chay moi dung duoc khi tinh tu ngay la ngay nao khi quay lai bao nhieu thang
            var_pump_record_to_date  := trunc(to_date('1-nov-2013'), 'DD');
        /*Neu ma chay >= 1/12 thi den ngay la 31/12 va ngay record_date = 1/12*/
        elsif trunc(valRecordDate, 'MM') >= trunc(to_date('1-dec-2013'), 'DD') then
            --lay ra thang cua den ngay do thi chay moi dung duoc khi tinh tu ngay la ngay nao khi quay lai bao nhieu thang
            var_pump_record_to_date  := trunc(to_date('1-feb-2014'), 'DD');
        end if;

        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
       /*Cac chi tieu se xet duyet theo day la lan thang tien thu 1 thu 2 hay thu 3
       neu la lan xet thu 1 thi quay lai 1*(-3) + 1 = -2
       neu la thu xet thu 2 thi quay lai 2*(-3) + 1 = -5
       neu la thu xet thu 3 thi quay lai 3*(-3) + 1 = -8*/

       /*Neu ma thang tien lan 3 va dot thang 3 nam 2013 thi se
       chi quay lai 3 thang va chi can cac chi tieu FYP >= 50 tr, tuyen thuan >= 4, PR36>=85%, Ty le HD >= 30*/
        /*con khong thi se theo cac chi tieu nhu da co*/
         for i in 1..3
         loop
              /*theo quy tac tren thi se lay ra duoc so thang quay lai cho no*/
              var_qty_mon := i*(-3) + 1;
              /*neu day la lan thang tien thu 3 va xu ly thang tien cho lan chay thang 3 nam 2013
              thi se xu ly nhu sau:
              cho quay lai 3 thang ke tu thang chay la thang nay
              du lieu o tren cung da xu ly chi lay cho 3 thang*/
              if (i = 3) and --va chay vao thang 3 nam 2013 thi chi back lai 3 thang
                  (add_months(trunc(valRecordDate, 'MM'), 1) = add_months(AMS_MODL_PROM_MMXIII.PROM_DATE_MMXIII, 2))
              then
                  var_qty_mon := -2;
              end if;

              /*Sau khi tinh toan xong duoc so thang back lai thi se tinh ra tu ngay la ngay nao, can cu dua vao den ngay da tinh o phan tren roi*/
              /*Sau khi biet la quay lai bao nhieu thang sau can cu vao var_qty_mon khi biet quay lai bao nhieu thang o tren*/
              var_pump_from_date := add_months(var_pump_record_to_date, var_qty_mon);

              ams.life_agency_log.time_stop;
              ams.life_agency_log.time_begin;


              -------------------------------------------------------------
              /* FYP */
              -------------------------------------------------------------
              /* Lay chi tiet FYP trong cac thang gan nhat*/
              merge /*+ CARDINALITY(pump, 100)*/
                  into ams.la_prom_mmxiii_pump pump
              using
                  (
                      select /*+ CARDINALITY(data, 100)*/
                          data.outlet_ams_id,
                          data.record_date,
                          nvl(data.data_value, 0) pump_period_fyp
                      from ams.mod_data data
                      where data.record_date
                              between var_pump_from_date
                              and var_pump_to_date
                          and data.module_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                          and data.data_code = AMS_MODL_PROM_MMXIII.DATA_CODE_FYP
                  ) upd
              on (
                  AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN = pump.type_code
                  and
                  trunc(valRecordDate, 'MM') = pump.record_date
                  and
                  AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = pump.pump_be_executing
                  and
                  AMS_MODL_PROM_MMXIII.BE_PAID_DTL = pump.pump_be_paid
                  and --lay them vao day dieu kien day la lan xet thu may trong nam
                  i = pump.pump_numb_asmt
                  and
                  upd.outlet_ams_id = pump.outlet_ams_id
                  and
                  upd.record_date = pump.pump_data_date
                  )
              when matched then
                  update
                      set
                          pump.pump_period_fyp = upd.pump_period_fyp,
                          pump.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                          pump.update_datetime = sysdate;
              commit;

              ams.life_agency_log.time_end;
              ams.life_agency_log.write_log(1000, 'mmxiii_modl_pump_data', 'Lay chi tiet FYP  voi voi xet thang tien lan ' || to_char(i) ||' thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
              ams.life_agency_log.time_stop;
              ams.life_agency_log.time_begin;

              /* Tong cong FYP ca nhan*/
              merge /*+ CARDINALITY(pump, 100)*/
                  into ams.la_prom_mmxiii_pump pump
              using
                  (
                      select /*+ CARDINALITY(data, 100)*/
                          data.outlet_ams_id,
                          nvl(sum(data.pump_period_fyp), 0) period_fyp
                      from ams.la_prom_mmxiii_pump data
                      where data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                          and data.record_date = trunc(valRecordDate, 'MM')
                          and data.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                          and data.pump_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_DTL
                          and data.pump_data_date
                              between var_pump_from_date
                              and var_pump_to_date
                      group by data.outlet_ams_id
                  ) upd
              on (
                  trunc(valRecordDate, 'MM') = pump.record_date
                  and
                  AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = pump.pump_be_executing
                  and
                  AMS_MODL_PROM_MMXIII.BE_PAID_YES = pump.pump_be_paid
                  and
                  i = pump.pump_numb_asmt
                  and
                  upd.outlet_ams_id = pump.outlet_ams_id
                  )
              when matched then
                  update
                      set
                          pump.pump_period_fyp = upd.period_fyp,
                          pump.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                          pump.update_datetime = sysdate;
              commit;

              ams.life_agency_log.time_end;
              ams.life_agency_log.write_log(1000, 'mmxiii_modl_pump_data', ' Tong cong FYP ca nhan lan ' || to_char(i) ||' thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
              ams.life_agency_log.time_stop;
              ams.life_agency_log.time_begin;

              /* FYP Tien truong nhom trong ky danh gia*/
              merge /*+ CARDINALITY(prom, 100)*/
                  into ams.la_promotion_mmxiii prom
              using
                  (
                      select /*+ CARDINALITY(pump, 100)*/
                          pump.pump_outlet_ams_id,
                          nvl(sum(pump.pump_period_fyp), 0) period_fyp
                      from ams.la_prom_mmxiii_pump pump
                      where pump.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                          and pump.record_date = trunc(valRecordDate, 'MM')
                          and pump.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                          and pump.pump_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_DTL
                          and pump.outlet_ams_id <> pump.pump_outlet_ams_id --khong tinh FYP cua ca nhan truong nhom
                          and pump.pump_data_date
                              between var_pump_from_date
                              and var_pump_to_date
                         and pump.pump_numb_asmt = i
                      group by pump.pump_outlet_ams_id
                  ) upd
              on (
                  trunc(valRecordDate, 'MM') = prom.record_date
                  and
                  AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = prom.pump_be_executing
                  and
                  i = prom.pump_numb_asmt
                  and
                  upd.pump_outlet_ams_id = prom.outlet_ams_id
                  )
              when matched then
                  update
                      set
                          prom.pump_period_fyp = upd.period_fyp,
                          prom.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                          prom.update_datetime = sysdate;
              commit;

              ams.life_agency_log.time_end;
              ams.life_agency_log.write_log(1000, 'mmxiii_modl_pump_data', 'FYP Tien truong nhom trong ky danh gia  lan ' || to_char(i) ||' thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
              ams.life_agency_log.time_stop;
              ams.life_agency_log.time_begin;

              -------------------------------------------------------------
              /* EMPL */
              -------------------------------------------------------------
              /* Dai ly moi tuyen thuan trong ky*/
              update ams.la_prom_mmxiii_pump pump
              set
                  pump.pump_period_empl = 1,
                  pump.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                  pump.update_datetime = sysdate
              where pump.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                  and pump.record_date = trunc(valRecordDate, 'MM')
                  and pump.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                  and pump.pump_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
                  and pump.outlet_ams_id <> pump.pump_outlet_ams_id
                  and pump.effective_date
                      between var_pump_from_date
                      and var_pump_to_date
                  and pump.pump_numb_asmt = i
                  and pump.terminative_date is null;
              commit;

              ams.life_agency_log.time_end;
              ams.life_agency_log.write_log(1000, 'mmxiii_modl_pump_data', ' Dai ly moi tuyen thuan trong ky  lan ' || to_char(i) ||' thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
              ams.life_agency_log.time_stop;
              ams.life_agency_log.time_begin;

              /* Tuyen thuan trong ky danh gia*/
              merge /*+ CARDINALITY(prom, 100)*/
                  into ams.la_promotion_mmxiii prom
              using
                  (
                      select /*+ CARDINALITY(data, 100)*/
                          data.pump_outlet_ams_id,
                          nvl(sum(data.pump_period_empl), 0) period_empl
                      from ams.la_prom_mmxiii_pump data
                      where data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                          and data.record_date = trunc(valRecordDate, 'MM')
                          and data.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                          and data.pump_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
                          and data.outlet_ams_id <> data.pump_outlet_ams_id
                          and data.pump_numb_asmt = i
                      group by data.pump_outlet_ams_id
                  ) upd
              on (
                  trunc(valRecordDate, 'MM') = prom.record_date
                  and
                  AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = prom.pump_be_executing
                  and
                  upd.pump_outlet_ams_id = prom.outlet_ams_id
                  and
                  i = prom.pump_numb_asmt
                  )
              when matched then
                  update
                      set
                          prom.pump_period_empl = upd.period_empl,
                          prom.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                          prom.update_datetime = sysdate;
              commit;

              ams.life_agency_log.time_end;
              ams.life_agency_log.write_log(1000, 'mmxiii_modl_pump_data', 'Tuyen thuan trong ky danh gia  lan ' || to_char(i) ||' thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
              ams.life_agency_log.time_stop;
              ams.life_agency_log.time_begin;

              -------------------------------------------------------------
              /* PR36 */
              -------------------------------------------------------------
              /* Lay chi tiet AFIS trong thang hien tai*/
              merge /*+ CARDINALITY(pump, 100)*/
                  into ams.la_prom_mmxiii_pump pump
              using
                  (
                      select /*+ CARDINALITY(data, 100)*/
                          data.outlet_ams_id,
                          data.record_date,
                          nvl(data.data_value, 0) period_afis
                      from ams.mod_data data
                      where data.record_date = trunc(valRecordDate, 'MM')
                          and data.module_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                          and data.data_code = AMS_MODL_PROM_MMXIII.DATA_CODE_AFIS
                  ) upd
              on (
                  AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN = pump.type_code
                  and
                  trunc(valRecordDate, 'MM') = pump.record_date
                  and
                  AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = pump.pump_be_executing
                  and
                  AMS_MODL_PROM_MMXIII.BE_PAID_DTL = pump.pump_be_paid
                  and
                  i = pump.pump_numb_asmt
                  and
                  upd.outlet_ams_id = pump.outlet_ams_id
                  and
                  trunc(valRecordDate, 'MM') = pump.pump_data_date
                  )
              when matched then
                  update
                      set pump.pump_period_afis = upd.period_afis,
                      pump.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                      pump.update_datetime = sysdate;
              commit;

              ams.life_agency_log.time_end;
              ams.life_agency_log.write_log(1000, 'mmxiii_modl_pump_data', 'Lay chi tiet AFIS trong thang hien tai  lan ' || to_char(i) ||' thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
              ams.life_agency_log.time_stop;
              ams.life_agency_log.time_begin;

              /* Lay chi tiet AFIF trong thang hien tai*/
              merge /*+ CARDINALITY(pump, 100)*/
                  into ams.la_prom_mmxiii_pump pump
              using
                  (
                      select /*+ CARDINALITY(data, 100)*/
                          data.outlet_ams_id,
                          data.record_date,
                          nvl(data.data_value, 0) period_afif
                      from ams.mod_data data
                      where data.record_date = trunc(valRecordDate, 'MM')
                          and data.module_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                          and data.data_code = AMS_MODL_PROM_MMXIII.DATA_CODE_AFIF
                  ) upd
              on (
                  AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN = pump.type_code
                  and
                  trunc(valRecordDate, 'MM') = pump.record_date
                  and
                  AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = pump.pump_be_executing
                  and
                  AMS_MODL_PROM_MMXIII.BE_PAID_DTL = pump.pump_be_paid
                  and
                  i = pump.pump_numb_asmt
                  and
                  upd.outlet_ams_id = pump.outlet_ams_id
                  and
                  trunc(valRecordDate, 'MM') = pump.pump_data_date
                  )
              when matched then
                  update
                      set
                          pump.pump_period_afif = upd.period_afif,
                          pump.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                          pump.update_datetime = sysdate;
              commit;

              ams.life_agency_log.time_end;
              ams.life_agency_log.write_log(1000, 'mmxiii_modl_pump_data', ' Lay chi tiet AFIF trong thang hien tai  lan ' || to_char(i) ||' thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
              ams.life_agency_log.time_stop;
              ams.life_agency_log.time_begin;

              /* PR36 nhom cua Tien truong nhom trong ky danh gia*/
              merge /*+ CARDINALITY(prom, 100)*/
                  into ams.la_promotion_mmxiii prom
              using
                  (
                      select /*+ CARDINALITY(data, 100)*/
                          data.pump_outlet_ams_id,
                          sum(data.pump_period_afif) period_afif,
                          sum(data.pump_period_afis) period_afis
                      from ams.la_prom_mmxiii_pump data
                      where data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                          and data.record_date = trunc(valRecordDate, 'MM')
                          and data.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                          and data.pump_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_DTL
                          and data.pump_data_date = trunc(valRecordDate, 'MM')
                          and data.pump_numb_asmt = i
                      group by data.pump_outlet_ams_id
                  ) upd
              on (
                  trunc(valRecordDate, 'MM') = prom.record_date
                  and
                  AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = prom.pump_be_executing
                  and
                  upd.pump_outlet_ams_id = prom.outlet_ams_id
                  and
                  i = prom.pump_numb_asmt
                  )
              when matched then
                  update
                      set
                          prom.pump_period_pr36 =
                                decode(nvl(upd.period_afis, 0),
                                    0, 100,
                                    round(nvl(upd.period_afif, 0) / nvl(upd.period_afis, 0) * 100, 2)),
                          prom.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                          prom.update_datetime = sysdate;
              commit;

              ams.life_agency_log.time_end;
              ams.life_agency_log.write_log(1000, 'mmxiii_modl_pump_data', 'PR36 nhom cua Tien truong nhom trong ky danh gia  lan ' || to_char(i) ||' thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
              ams.life_agency_log.time_stop;
              ams.life_agency_log.time_begin;

              -------------------------------------------------------------
              /* ACTION Ty le hoat dong co thay doi do phai tru di ca cac hop dong bi huy trong nam thu nhat cua hop dong
              nen se khac so voi code cu*/
              -------------------------------------------------------------
              /* Lay chi tiet hop dong phat hanh thuan tung thang*/
              merge /*+ CARDINALITY(pump, 100)*/
                  into ams.la_prom_mmxiii_pump pump
              using
                  (
                      --chinhlk 22/2/2013 KHONG tru di cac hop dong bi huy trong nam dau tien cua hop dong ma lam giong nhu em Hoa da lam roi
                      --lam giong nhu Quynh da lam hoi truoc
                      --dong thoi lay luon tu chi tieu DATA_CODE_NET_ISSU cho tien
                      select /*+ CARDINALITY(data, 100)*/
                          data.outlet_ams_id,
                          data.record_date,
                          nvl(data.data_value, 0) period_issu
                      from mod_data data
                      where data.record_date
                              between var_pump_from_date
                              and var_pump_to_date
                          and data.module_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                          and data.data_code = AMS_MODL_PROM_MMXIII.DATA_CODE_NET_ISSU
                  ) upd
              on (/* --khong duoc dung dieu kien nay o day neu khong la se bi treo
                  AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN = pump.type_code
                  and    */
                  trunc(valRecordDate, 'MM') = pump.record_date
                  and
                  AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = pump.pump_be_executing
                  and
                  AMS_MODL_PROM_MMXIII.BE_PAID_DTL = pump.pump_be_paid
                  and
                  i = pump.pump_numb_asmt
                  and
                  upd.outlet_ams_id = pump.outlet_ams_id
                  and
                  upd.record_date = pump.pump_data_date
                  )
              when matched then
                  update
                      set
                          pump.pump_period_issu = upd.period_issu,
                          pump.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                          pump.update_datetime = sysdate;
              commit;

              ams.life_agency_log.time_end;
              ams.life_agency_log.write_log(1000, 'mmxiii_modl_pump_data', 'Lay chi tiet hop dong phat hanh thuan tung thang  lan ' || to_char(i) ||' thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
              ams.life_agency_log.time_stop;
              ams.life_agency_log.time_begin;

              /* Xac dinh luot  dai ly hoat dong trong tung thang*/
              update ams.la_prom_mmxiii_pump pump
              set pump.pump_period_acti = 1,
                  pump.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                  pump.update_datetime = sysdate
              where pump.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                  and pump.record_date = trunc(valRecordDate, 'MM')
                  and pump.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                  and pump.pump_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_DTL
                  and pump.pump_data_date
                      between var_pump_from_date
                      and var_pump_to_date
                  and pump.pump_numb_asmt = i
                  and nvl(pump.pump_period_issu, 0) > 0;
              commit;

              ams.life_agency_log.time_end;
              ams.life_agency_log.write_log(1000, 'mmxiii_modl_pump_data', ' Xac dinh dai ly hoat dong trong tung thang lan ' || to_char(i) ||' thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
              ams.life_agency_log.time_stop;
              ams.life_agency_log.time_begin;

              /* Ty le hoat dong cua nhom cua tien truong nhom lam giong nhu code nam 2012*/
              merge /*+ CARDINALITY(prom, 100)*/
                  into ams.la_promotion_mmxiii prom
              using
                  (
                      select /*+ CARDINALITY(gro, 100)*/
                          gro.pump_outlet_ams_id,
                          decode(count(*),
                              0, 100,
                              round(sum(nvl(gro.month_acti, 0)) / count(*), 2)) period_acti
                      from
                      (
                          select pump.pump_outlet_ams_id,
                              pump.pump_data_date,
                              decode(count(*),
                                  0, 100,
                                  round(sum(nvl(pump.pump_period_acti, 0)) / count(*) * 100, 2)) month_acti
                          from ams.la_prom_mmxiii_pump pump
                          where pump.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                              and pump.record_date = trunc(valRecordDate, 'MM')
                              and pump.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                              and pump.pump_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_DTL
                              and pump.pump_data_date
                                  between var_pump_from_date
                                  and var_pump_to_date
                              and pump.pump_numb_asmt = i
                              and (
                                  pump.terminative_date is null
                                  or
                                  pump.terminative_date >= add_months(trunc(pump.pump_data_date, 'MM'), 1)
                              )
                          group by pump.pump_outlet_ams_id,
                              pump.pump_data_date
                      ) gro
                      group by gro.pump_outlet_ams_id
                  ) upd
              on (
                  trunc(valRecordDate, 'MM') = prom.record_date
                  and
                  AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = prom.pump_be_executing
                  and
                  upd.pump_outlet_ams_id = prom.outlet_ams_id
                  and
                  i = prom.pump_numb_asmt
                  )
              when matched then
                  update
                      set
                          prom.pump_period_acti = nvl(upd.period_acti, 0);
              commit;

              ams.life_agency_log.time_end;
              ams.life_agency_log.write_log(1000, 'mmxiii_modl_pump_data', 'Ty le hoat dong cua nhom cua tien truong nhom  lan ' || to_char(i) ||' thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
          end loop;


        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_pump_data', ' da chay xong');
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_pump_data: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;


    procedure mmxiii_modl_pump_asmt(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
        var_effective_date date := add_months(trunc(valRecordDate, 'MM'), 1);
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /*Neu ma chay tu 1/1 den truoc ngay 1/3 thi ngay hieu luc moi se la 1/3*/
/*        if trunc(valRecordDate, 'MM')
            between trunc(to_date('1-jan-2013'), 'DD')
            and trunc(to_date('1-mar-2013'), 'DD') - 1 then*/
        if trunc(valRecordDate, 'MM') --chay o thang 12 nam 2012 thi van co the dap ung duoc
            <= trunc(to_date('1-mar-2013'), 'DD') - 1 then
            var_effective_date := trunc(to_date('1-mar-2013'), 'DD');
        /*Neu ma chay tu 1/3 den truoc ngay 1/6 thi ngay hieu luc moi se la 1/6*/
        elsif trunc(valRecordDate, 'MM')
            between trunc(to_date('1-mar-2013'), 'DD')
            and trunc(to_date('1-jun-2013'), 'DD') - 1 then
            var_effective_date := trunc(to_date('1-jun-2013'), 'DD');
        /*Neu ma chay tu 1/6 den truoc ngay 1/9 thi ngay hieu luc moi se la 1/9*/
        elsif trunc(valRecordDate, 'MM')
            between trunc(to_date('1-jun-2013'), 'DD')
            and trunc(to_date('1-sep-2013'), 'DD') - 1 then
            var_effective_date := trunc(to_date('1-sep-2013'), 'DD');
        /*Neu ma chay tu 1/9 den truoc ngay 1/12 thi ngay hieu luc moi se la 1/12*/
        elsif trunc(valRecordDate, 'MM')
            between trunc(to_date('1-sep-2013'), 'DD')
            and trunc(to_date('1-dec-2013'), 'DD') - 1 then
            var_effective_date := trunc(to_date('1-dec-2013'), 'DD');
        elsif trunc(valRecordDate, 'MM') >=  trunc(to_date('1-dec-2013'), 'DD') then
            var_effective_date := trunc(to_date('1-mar-2014'), 'DD');
        end if;

        /* Chi tieu thang tien:
           PERIOD FYP: 30.000.000 [Dot xet 01/03/2012], 50.000.000 [Dot xet sau 01/03/2012]
           EMPL: 4
           PR36: 85
           ACTI: 30*/

        /* Chi tieu thang tien doi voi lan xet thang tien thu 1
        Quay lai 3 thang
        PERIOD FYP: 80.000.000
        Tuyen thuan : 4
        PR36: 85
        ACTI: 30*/
        update la_promotion_mmxiii prom
        set
            prom.pump_asmt = AMS_MODL_PROM_MMXIII.AMST_PROM,
            prom.pump_effe_date = var_effective_date,
            prom.pump_effe_code = AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV02,
            prom.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            prom.update_datetime = sysdate
        where prom.record_date = trunc(valRecordDate, 'MM')
            and prom.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            and prom.pump_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
            and prom.pump_numb_asmt = AMS_MODL_PROM_MMXIII.MMXIII_PROM_ASMT_1
            and prom.pump_period_fyp >= 80000000
            and prom.pump_period_empl >= 4
            and prom.pump_period_pr36 >= 85
            and prom.pump_period_acti >= 30;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_pump_asmt', 'Chi tieu thang tien doi voi lan xet thang tien thu 1 thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* Chi tieu thang tien doi voi lan xet thang tien thu 2
        Quay lai 6 thang
        PERIOD FYP: 120.000.000
        Tuyen thuan :7
        PR36: 85
        ACTI: 30*/
        update la_promotion_mmxiii prom
        set
            prom.pump_asmt = AMS_MODL_PROM_MMXIII.AMST_PROM,
            prom.pump_effe_date = var_effective_date,
            prom.pump_effe_code = AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV02,
            prom.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            prom.update_datetime = sysdate
        where prom.record_date = trunc(valRecordDate, 'MM')
            and prom.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            and prom.pump_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
            and prom.pump_numb_asmt = AMS_MODL_PROM_MMXIII.MMXIII_PROM_ASMT_2
            and prom.pump_period_fyp >= 120000000
            and prom.pump_period_empl >= 7
            and prom.pump_period_pr36 >= 85
            and prom.pump_period_acti >= 30;
        commit;


        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_pump_asmt', 'Chi tieu thang tien doi voi lan xet thang tien thu 2 thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

       /*Neu ma thang tien lan 3 va dot thang 3 nam 2013 thi se
       chi quay lai 3 thang va chi can cac chi tieu FYP >= 50 tr, tuyen thuan >= 4, PR36>=85%, Ty le HD >= 30*/
        /*con khong thi se theo cac chi tieu nhu da co*/
        if (add_months(trunc(valRecordDate, 'MM'), 1)
           --neu ma chay nam trong khoang tu 1/12/2012 den 1/2/2013 thi se xu ly rieng cho thang tien lan thu 3
            between add_months(AMS_MODL_PROM_MMXIII.PROM_DATE_MMXIII, -1)
            and add_months(AMS_MODL_PROM_MMXIII.PROM_DATE_MMXIII, 2)) then
            /* Chi tieu thang tien doi voi lan xet thang tien thu 3 dot xet thang 3 nam 2013
            Quay lai 3 thang
            PERIOD FYP: 50.000.000
            Tuyen thuan : 4
            PR36: 85
            ACTI: 30*/
            update la_promotion_mmxiii prom
            set
                prom.pump_asmt = AMS_MODL_PROM_MMXIII.AMST_PROM,
                prom.pump_effe_date = var_effective_date,
                prom.pump_effe_code = AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV02,
                prom.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                prom.update_datetime = sysdate
            where prom.record_date = trunc(valRecordDate, 'MM')
                and prom.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                and prom.pump_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
                and prom.pump_numb_asmt = AMS_MODL_PROM_MMXIII.MMXIII_PROM_ASMT_3
                and prom.pump_period_fyp >= 50000000
                and prom.pump_period_empl >= 4
                and prom.pump_period_pr36 >= 85
                and prom.pump_period_acti >= 30;
            commit;
        else --neu khong thi la cac dot xet sau ngay 1/3/2012 thi se lam nhu cong van
            /* Chi tieu thang tien doi voi lan xet thang tien thu 3
            Quay lai 9 thang
            PERIOD FYP: 150.000.000
            Tuyen thuan : 10
            PR36: 85
            ACTI: 30*/
            update la_promotion_mmxiii prom
            set
                prom.pump_asmt = AMS_MODL_PROM_MMXIII.AMST_PROM,
                prom.pump_effe_date = var_effective_date,
                prom.pump_effe_code = AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV02,
                prom.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                prom.update_datetime = sysdate
            where prom.record_date = trunc(valRecordDate, 'MM')
                and prom.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                and prom.pump_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
                and prom.pump_numb_asmt = AMS_MODL_PROM_MMXIII.MMXIII_PROM_ASMT_3
                and prom.pump_period_fyp >= 150000000
                and prom.pump_period_empl >= 10
                and prom.pump_period_pr36 >= 85
                and prom.pump_period_acti >= 30;
            commit;
        end if;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_pump_asmt', 'Chi tieu thang tien doi voi lan xet thang tien thu 3 thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

/*        if (add_months(trunc(valRecordDate, 'MM'), 1) = add_months(AMS_MODL_PROM_MMXIII.PROM_DATE_MMXIII, 2)) then
            update la_promotion_mmxiii prom
            set
                prom.pump_asmt = AMS_MODL_PROM_MMXIII.AMST_PROM,
                prom.pump_effe_date = add_months(trunc(valRecordDate, 'MM'), 1),
                prom.pump_effe_code = AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV02,
                prom.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                prom.update_datetime = sysdate
            where prom.record_date = trunc(valRecordDate, 'MM')
                and prom.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                and prom.pump_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
                and prom.pump_period_fyp >= 30000000
                and prom.pump_period_empl >= 4
                and prom.pump_period_pr36 >= 85
                and prom.pump_period_acti >= 30;
            commit;
        \* is not 01/03/2012*\
        else
            update la_promotion_mmxiii prom
            set
                prom.pump_asmt = AMS_MODL_PROM_MMXIII.AMST_PROM,
                prom.pump_effe_date = add_months(trunc(valRecordDate, 'MM'), 1),
                prom.pump_effe_code = AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV02,
                prom.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                prom.update_datetime = sysdate
            where prom.record_date = trunc(valRecordDate, 'MM')
                and prom.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                and prom.pump_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
                and prom.pump_numb_asmt <= 3
                and prom.pump_period_fyp >= 50000000
                and prom.pump_period_empl >= 4
                and prom.pump_period_pr36 >= 85
                and prom.pump_period_acti >= 30;
            commit;
        end if;
*/
        /* Xu ly ha bac tien truong nhom
            Neu ma day la dot xet thang tien lan thu 3 ma khong duoc thang tien len thi se bi ha bac o day
            Doan
            ASMT: 3*/
        update la_promotion_mmxiii prom
        set
            prom.pump_asmt = AMS_MODL_PROM_MMXIII.AMST_DEPO,
            prom.pump_effe_date = var_effective_date,
            prom.pump_effe_code = AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV05,
            prom.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            prom.update_datetime = sysdate
        where prom.record_date = trunc(valRecordDate, 'MM')
            and prom.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            and prom.pump_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
            and prom.pump_numb_asmt = 3  --day la lan thu 3 xet thang tien len
            and prom.pump_asmt = AMS_MODL_PROM_MMXIII.AMST_MAIN; --ma van chi la duy tri va khong duoc thang tien thi se bi ha bac
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_pump_asmt', 'Xu ly ha bac tien truong nhom thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        /* Truong hop loi thi cung se ghi la ha bac cho no
        theo commen anh Hoa ngay 27/2/2013*/
        update la_promotion_mmxiii prom
        set
            prom.pump_asmt = AMS_MODL_PROM_MMXIII.AMST_DEPO,
            prom.pump_effe_date = var_effective_date,
            prom.pump_effe_code = AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV05,
            prom.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            prom.update_datetime = sysdate
        where prom.record_date = trunc(valRecordDate, 'MM')
            and prom.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            and prom.pump_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
            and prom.pump_numb_asmt > 3
            and prom.pump_asmt = AMS_MODL_PROM_MMXIII.AMST_MAIN;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_pump_asmt', ' da chay xong');
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_pump_asmt: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_pump_close(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* */
        update la_prom_mmxiii_pump pump
        set
            pump.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_NO,
            pump.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            pump.update_datetime = sysdate
        where pump.record_date = trunc(valRecordDate, 'MM')
            and pump.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES;
        commit;

        /* */
        update la_promotion_mmxiii prom
        set
            prom.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_NO,
            prom.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            prom.update_datetime = sysdate
        where prom.record_date = trunc(valRecordDate, 'MM')
            and prom.pump_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_pump_close', ' da chay xong');
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_pump_close: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_umnm(valRecordDate date := null)
    is
    begin
        if (
            AMS_CORE_MODULE.is_active(
                AMS_MODL_PROM_MMXIII.MMXIII_PROM_UMNM,
                trunc(valRecordDate, 'MM')
            ) = AMS_CORE_MODULE.IS_YES
        ) then
            /*for var_result in (
                select
                    prom_date.promotion_date
                from ams.mod_prom_date prom_date
                where prom_date.module_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_PROM
                    and prom_date.sub_code = AMS_MODL_PROM_MMXIII.MMXIII_PROM_UMNM
                    and prom_date.status_code = AMS_MODL_PROM_MMXIII.OBJECT_STATUS_ACTIVE
                    and prom_date.promotion_date = trunc(valRecordDate, 'MM')
                group by prom_date.promotion_date
            ) loop*/
                AMS_MODL_PROM_MMXIII.mmxiii_modl_umnm_open(valRecordDate);
                AMS_MODL_PROM_MMXIII.mmxiii_modl_umnm_data(valRecordDate);
                AMS_MODL_PROM_MMXIII.mmxiii_modl_umnm_asmt(valRecordDate);
                AMS_MODL_PROM_MMXIII.mmxiii_modl_umnm_close(valRecordDate);
            /*end loop;*/
        end if;
    end;

/*    --can phai chay lai 6 thang ke tu thang 3 nam 2013 de
    --co the lay du lieu so luot dai ly hoat dong vao cho dung
    --de tinh so luot dai ly hoat dong cho no dung
    ams_modl_input_data.inp_data_outlet('1-mar-2013',
        'MAIN');
    ams_modl_input_data.inp_data_outlet_comp('1-mar-2013',
        'MAIN',
        0);*/
    /*
        Creater: Le Khac Chinh
        Date Create: 1/2/2013
        Version: 1.0
        Description: Thu tuc tinh toan dau vao cho duy tri truong nhom
        Parameter:
            valRecordDate [date]: Thang chay
        Update:  Le Khac Chinh
            Version: 1.1
            Date Updated: 26/12/2013
            Note:  Fix lai chuong trinh theo yeu cau: 124502 cua SME
                      Dem chinh xac so luong tuyen dung thuan cua truong nhom
    */
    procedure mmxiii_modl_umnm_open(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
        var_effective_date date := add_months(trunc(valRecordDate, 'MM'), 1);
        var_umnm_from_date date := add_months(trunc(valRecordDate, 'MM'), -5);
        var_umnm_to_date date := valRecordDate;
        var_qty  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /*Neu ma chay tu 1/1 den 30/6 thi ngay hieu luc moi se la 1/7*/
        if trunc(valRecordDate, 'MM') --chay o thang 12 nam 2012 thi van co the dap ung duoc
            <= trunc(to_date('1-jun-2013'), 'DD') then
            var_effective_date := trunc(to_date('1-jul-2013'), 'DD');
        /*Neu ma chay tu 1/7 den 30/11 thi ngay hieu luc moi se la 1/1/2014*/
        elsif trunc(valRecordDate, 'MM')
            between trunc(to_date('1-jul-2013'), 'DD')
            and trunc(to_date('1-dec-2013'), 'DD') then
            var_effective_date := trunc(to_date('1-jan-2014'), 'DD');
        end if;

        /*doan nay rat quan trong de xet du lieu cho no quay lai 6 thang ke tu thoi diem cuoi xet
        Neu ma chay o thang 3 thi chi LAY DU LIEU thang 1 thang 2 thang 3 cho no de chay du lieu
        Neu ma chay o thang 9 thi chi lay du lieu o thang 7 8 9 cho no de chay du lieu
        Neu khong thi se lay sai du lieu cho no o day
        Dung cac gioi han ngay de xu ly cho no o day thi se tot nhat*/
        var_umnm_to_date := trunc(last_day(valRecordDate), 'DD');
        if trunc(valRecordDate, 'MM')
            between trunc(to_date('1-jan-2013'), 'DD')
            and trunc(to_date('1-jun-2013'), 'DD') then
            var_umnm_from_date := trunc(to_date('1-jan-2013'), 'DD');
        /*Neu ma chay tu 1/7 den 30/11 thi ngay hieu luc moi se la 1/1/2014*/
        elsif trunc(valRecordDate, 'MM')
            between trunc(to_date('1-jul-2013'), 'DD')
            and trunc(to_date('1-dec-2013'), 'DD') then
            var_umnm_from_date := trunc(to_date('1-jul-2013'), 'DD');
        end if;

        var_error_pos := 1;
        /* Len danh sach truong nhom duoc xet duy tri chuc vu*/
        update ams.la_promotion_mmxiii prom
        set
            prom.umnm_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES,
            prom.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
            prom.umnm_outlet_id = prom.outlet_id,
            prom.umnm_outlet_ams_id = prom.outlet_ams_id,
            /*cap nhat ngay hieu luc chuc vu luon o day*/
            prom.umnm_effective_date = prom.info_position_date,
            prom.umnm_unit_id = prom.info_unit_id,
            prom.umnm_unit_ams_id = prom.info_unit_ams_id,
            prom.umnm_senr_by_months = 0,
            prom.umnm_agts = 0,
            prom.umnm_period_fyp = 0,
            prom.umnm_period_empl = 0,
            prom.umnm_period_acti = 0,
            prom.umnm_asmt = AMS_MODL_PROM_MMXIII.AMST_MAIN,
            prom.umnm_effe_date = null,
            prom.umnm_effe_code = null,
            prom.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            prom.update_datetime = sysdate
        where prom.record_date = trunc(valRecordDate, 'MM')
            and prom.be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            and prom.info_position_code in (
                AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV02
            );
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_umnm_open', 'Len danh sach truong nhom duoc xet duy tri chuc vu thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 2;

        /* Loai bo cac truong hop loi du lieu*/
        update ams.la_promotion_mmxiii prom
        set
            prom.umnm_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_NO,
            prom.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_NO,
            prom.umnm_asmt = AMS_MODL_PROM_MMXIII.AMST_ERRO,
            prom.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            prom.update_datetime = sysdate
        where prom.record_date = trunc(valRecordDate, 'MM')
            and prom.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            and prom.umnm_effective_date is null;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_umnm_open', 'Loai bo cac truong hop loi du lieu thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 3;

        /* Cap nhat tham nien chuc vu
        chinhlk sua lai 23/2/2013 theo yeu cau anh Huu Hoa
        tham nien phai tinh tu ngay du lien len chuc vu moi quay nguoc tro lai ngay len lam truong nhom thi xu ly moi dung duoc*/
        update ams.la_promotion_mmxiii prom
        set
            prom.umnm_senr_by_months = round(
                months_between(
                    var_effective_date, --chinh sua lay lai o day theo y kien cua anh Huu Hoa 23/2/2012
                    nvl(trunc(prom.umnm_effective_date, 'MM'), AMS_MODL_PROM_MMXIII.DATE_MIN_VALUE)
                )) + 1,
            prom.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            prom.update_datetime = sysdate
        where prom.record_date = trunc(valRecordDate, 'MM')
            and prom.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_umnm_open', 'Cap nhat tham nien chuc vu thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 4;

        /* Loai bo cac truong nhom co tham nien chua du 12 thang*/
        update la_promotion_mmxiii prom
        set
            prom.umnm_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_NO,
            prom.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_NO,
            prom.umnm_asmt = AMS_MODL_PROM_MMXIII.AMST_MAIN,
            prom.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            prom.update_datetime = sysdate
        where prom.record_date = trunc(valRecordDate, 'MM')
            and prom.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            and prom.umnm_senr_by_months < 12;
        commit;


        /*Do so lieu vao bang chua danh sach phat trien nhom trong vong 6 thang gan nhat
        de lay do lieu cua cac nhom da tach ra khoi nhom
        de cong vao cho nhom goc theo quy che thi tinh cho FYP can 120 tr va so luot hoat dong can 25 luot*/

        /*Xoa di lieu luon cho nhanh*/
        execute immediate 'truncate table ams.la_prom_mmxiii_umnm_dv';
        commit;
        dbms_stats.gather_table_stats(null, 'la_prom_mmxiii_umnm_dv', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_umnm_open', ' truncate la_prom_mmxiii_umnm_dv thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 5;

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
        insert /*+ APPEND */ into ams.la_prom_mmxiii_umnm_dv nologging (
            outlet_id,
            outlet_ams_id,
            unit_id,
            unit_ams_id,
            unit_name,
            record_date,
            version_date,
            type_code,
            effective_date,
            umnm_be_paid,
            umnm_be_executing,
            create_user,
            update_user,
            create_datetime,
            update_datetime
        )
        select /*+ CARDINALITY(data, 100)*/
            data.outlet_id,
            data.outlet_ams_id,
            data.unit_id,
            data.unit_ams_id,
            data.unit_name,
            trunc(valRecordDate, 'MM'),
            cast(trunc(sysdate, 'DD') as date),
            AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN,
            data.position_date,
            AMS_MODL_PROM_MMXIII.BE_PAID_NO,
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
            AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.inp_data_outlet data
        where data.record_date = trunc(valRecordDate, 'MM')
            and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
            and data.position_code = AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV02--cac truong nhom hien tai
            and data.status_code = AMS_MODL_PROM_MMXIII.OBJECT_STATUS_ACTIVE;
        commit;
        dbms_stats.gather_table_stats(null, 'la_prom_mmxiii_umnm_dv', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_umnm_open', ' do la_prom_mmxiii_umnm_dv thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 6;

        /* Xet trong vong quay lai 6 thang
        phai bat dau tu so 1 vi tim tien truong nhom o thang truoc day
        tuc la thang add_months(trunc(valRecordDate, 'MM'), -i) roi sau do tim ra duoc nhom da phat trien len
        */
        /*KHONG MERGE ngay hieu luc phat trien nhom o day*/
        for i in 1..5
        loop
            --xu ly o day neu ma cai thang chay THANG TINH nam trong khoang gioi han o tren kia da co roi thi moi duoc tinh o day cho no
            --con neu khong thi khong xu ly gi ca
            --Nhu the nay thi se chi lay so lieu nhung thang can quay tro lai thoi
            if add_months(trunc(valRecordDate, 'MM'), -i)
                between var_umnm_from_date
                and var_umnm_to_date
            then
                merge /*+ CARDINALITY(umdv, 100)*/
                    into ams.la_prom_mmxiii_umnm_dv umdv
                using
                    (
                        select /*+ CARDINALITY(newu, 100)
                                   CARDINALITY(oldo, 100)
                                   CARDINALITY(oldu, 100) */
                            newu.outlet_ams_id,
                            oldu.outlet_id umnp_outlet_id,
                            oldu.outlet_ams_id umnp_outlet_ams_id,
                            oldu.unit_id umnp_unit_id,
                            oldu.unit_ams_id umnp_unit_ams_id
                        from
                        (  /*cac truong nhom o thoi diem hien tai*/
                            select /*+ CARDINALITY(umnm, 100)  */
                                umnm.outlet_id,
                                umnm.outlet_ams_id,
                                umnm.unit_id,
                                umnm.unit_ams_id
                            from ams.la_prom_mmxiii_umnm_dv umnm
                            where umnm.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                                and umnm.record_date = trunc(valRecordDate, 'MM')
                                and umnm.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
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
                            from ams.inp_data_outlet data
                            where data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                                and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                                and data.position_code = AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV01--cac truong nhom hien tai
                                and data.status_code = AMS_MODL_PROM_MMXIII.OBJECT_STATUS_ACTIVE
                        ) oldo
                            on
                            (
                                oldo.outlet_id = newu.outlet_id
                            )
                        join
                        (  /*lay ra ma nhom va truong nhom truoc huong vao thang truoc do neu ma tinh tach ra tu nhom do*/
                            select
                                data.outlet_id,
                                data.outlet_ams_id,
                                data.unit_id,
                                data.unit_ams_id
                            from ams.inp_data_outlet data
                            where data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                                and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                                and data.position_code = AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV02--cac truong nhom khi ma nhom do duco tach ra
                                and data.status_code = AMS_MODL_PROM_MMXIII.OBJECT_STATUS_ACTIVE
                        ) oldu --lay ra nhom cu ma va ten truong nhom
                            on
                            (
                                oldu.unit_ams_id = oldo.unit_ams_id
                            )
                        where newu.unit_ams_id <> nvl(oldo.unit_ams_id, '')
                    ) upd
                on (
                    upd.outlet_ams_id = umdv.outlet_ams_id
                    )
                when matched then
                    update
                        set
                            umdv.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
                            umdv.umnm_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES,
                            umdv.umnm_outlet_id = upd.umnp_outlet_id,
                            umdv.umnm_outlet_ams_id = upd.umnp_outlet_ams_id,
                            umdv.umnm_unit_id = upd.umnp_unit_id,
                            umdv.umnm_unit_ams_id = upd.umnp_unit_ams_id,
                            umdv.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                            umdv.update_datetime = sysdate;
                commit;
            end if;
        end loop;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_umnm_open', 'merge  ams.la_prom_mmxiii_umnm_dv de xoa thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 7;

        /* Len danh sach du lieu chi tiet can xoa*/
        merge /*+ CARDINALITY(umnm, 100)*/
            into ams.la_prom_mmxiii_umnm umnm
        using
            (
                select /*+ CARDINALITY(umnm, 100)*/
                    data.info_company_id company_id
                from ams.la_promotion_mmxiii data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                group by data.info_company_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = umnm.record_date
            and
            upd.company_id = umnm.company_id
            )
        when matched then
            update
                set
                    umnm.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_DEL;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_umnm_open', 'merge de xoa thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 8;

        /* Xoa du lieu chi tiet*/
        loop
            delete la_prom_mmxiii_umnm del
            where del.record_date = trunc(valRecordDate, 'MM')
                and del.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_DEL
                and rownum < AMS_MODL_PROM_MMXIII.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_MODL_PROM_MMXIII.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_umnm_open', 'Xoa du lieu chi tiet* thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 9;

        /*Quay lai 6 thang gan nhat ke tu thang tinh*/
        for i in 0..5
        loop
            --xu ly o day neu ma cai thang chay THANG TINH nam trong khoang gioi han o tren kia da co roi thi moi duoc tinh o day cho no
            --con neu khong thi khong xu ly gi ca
            --Nhu the nay thi se chi lay so lieu nhung thang can quay tro lai thoi
            if add_months(trunc(valRecordDate, 'MM'), -i)
                between var_umnm_from_date
                and var_umnm_to_date
            then
                ams.life_agency_log.time_stop;
                ams.life_agency_log.time_begin;
                var_error_pos := 10;
                /* Cac dai ly con lam viec trong thang*/
                insert /*+ APPEND */ into ams.la_prom_mmxiii_umnm nologging (
                    outlet_id,
                    outlet_ams_id,
                    company_id,
                    record_date,
                    version_date,
                    type_code,
                    outlet_name,
                    effective_date,
                    terminative_date,
                    umnm_outlet_id,
                    umnm_outlet_ams_id,
                    umnm_unit_id,
                    umnm_unit_ams_id,
                    umnm_be_paid,
                    umnm_be_executing,
                    umnm_data_date,
                    umnm_period_fyp,
                    umnm_period_empl,
                    umnm_period_issu,
                    umnm_period_acti,
                    create_user,
                    update_user,
                    create_datetime,
                    update_datetime
                )
                select /*+ CARDINALITY(prom, 100) CARDINALITY(outl, 100)*/
                    outl.outlet_id,
                    outl.outlet_ams_id,
                    outl.company_id,
                    trunc(valRecordDate, 'MM'),
                    cast(trunc(sysdate, 'DD') as date),
                    AMS_MODL_PROM_MMXIII.MMXIII_PROM_ROOT, --day la du lieu nhom goc
                    outl.outlet_name,
                    outl.effective_date,
                    outl.terminative_date,
                    prom.umnm_outlet_id,
                    prom.umnm_outlet_ams_id,
                    prom.umnm_unit_id,
                    prom.umnm_unit_ams_id,
                    AMS_MODL_PROM_MMXIII.BE_PAID_DTL,
                    AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
                    add_months(trunc(valRecordDate, 'MM'), -i),
                    0,
                    0,
                    0,
                    0,
                    AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    sysdate,
                    sysdate
                from
                (
                    select
                        tmp.umnm_outlet_id,
                        tmp.umnm_outlet_ams_id,
                        tmp.umnm_unit_id,
                        tmp.umnm_unit_ams_id
                    from ams.la_promotion_mmxiii tmp
                    where tmp.record_date = trunc(valRecordDate, 'MM')
                        and tmp.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                ) prom
                join
                (
                    select
                        data.outlet_id,
                        data.outlet_ams_id,
                        data.outlet_name,
                        data.company_id,
                        data.unit_id,
                        data.unit_ams_id,
                        data.unit_name,
                        data.effective_date,
                        data.terminative_date
                    from ams.inp_data_outlet data
                    where data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                        and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                        and data.status_code = AMS_MODL_PROM_MMXIII.OBJECT_STATUS_ACTIVE
                        and (
                            data.terminative_date is null
                            or
                            data.terminative_date >= add_months(trunc(valRecordDate, 'MM'), -i + 1)
                        )
                ) outl
                    on outl.unit_ams_id = prom.umnm_unit_ams_id;
                commit;

                ams.life_agency_log.time_end;
                ams.life_agency_log.write_log(1000, 'mmxiii_modl_umnm_open', 'Cac dai ly con lam viec trong thang thang ' || to_char(valRecordDate, 'dd/mm/yyyy')|| ' chi tiet  ' ||to_char(add_months(trunc(valRecordDate, 'MM'), -i), 'dd/mm/yyyy'));
                ams.life_agency_log.time_stop;
                ams.life_agency_log.time_begin;
                var_error_pos := 11;

                /* Cac dai ly nghi viec trong thang*/
                insert /*+ APPEND */ into ams.la_prom_mmxiii_umnm nologging (
                    outlet_id,
                    outlet_ams_id,
                    company_id,
                    record_date,
                    version_date,
                    type_code,
                    outlet_name,
                    effective_date,
                    terminative_date,
                    umnm_outlet_id,
                    umnm_outlet_ams_id,
                    umnm_unit_id,
                    umnm_unit_ams_id,
                    umnm_be_paid,
                    umnm_be_executing,
                    umnm_data_date,
                    umnm_period_fyp,
                    umnm_period_empl,
                    umnm_period_issu,
                    umnm_period_acti,
                    create_user,
                    update_user,
                    create_datetime,
                    update_datetime
                )
                select /*+ CARDINALITY(prom, 100) CARDINALITY(outl, 100)*/
                    outl.outlet_id,
                    outl.outlet_ams_id,
                    outl.company_id,
                    trunc(valRecordDate, 'MM'),
                    cast(trunc(sysdate, 'DD') as date),
                    AMS_MODL_PROM_MMXIII.MMXIII_PROM_ROOT, --day la du lieu nhom goc
                    outl.outlet_name,
                    outl.effective_date,
                    outl.terminative_date,
                    prom.umnm_outlet_id,
                    prom.umnm_outlet_ams_id,
                    prom.umnm_unit_id,
                    prom.umnm_unit_ams_id,
                    AMS_MODL_PROM_MMXIII.BE_PAID_SPC,
                    AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
                    add_months(trunc(valRecordDate, 'MM'), -i),
                    0,
                    0,
                    0,
                    0,
                    AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    sysdate,
                    sysdate
                from
                (
                    select /*+ CARDINALITY(tmp, 100) */
                        tmp.umnm_outlet_id,
                        tmp.umnm_outlet_ams_id,
                        tmp.umnm_unit_id,
                        tmp.umnm_unit_ams_id
                    from ams.la_promotion_mmxiii tmp
                    where tmp.record_date = trunc(valRecordDate, 'MM')
                        and tmp.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                ) prom
                join
                (
                    select /*+ CARDINALITY(data, 100) */
                        data.outlet_id,
                        data.outlet_ams_id,
                        data.outlet_name,
                        data.company_id,
                        data.unit_id,
                        data.unit_ams_id,
                        data.unit_name,
                        data.effective_date,
                        data.terminative_date
                    from ams.inp_data_outlet data
                    where data.record_date = add_months(trunc(valRecordDate, 'MM'), -i)
                        and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                        and data.status_code = AMS_MODL_PROM_MMXIII.OBJECT_STATUS_ACTIVE
                        and (
                            data.terminative_date is not null
                            and
                            data.terminative_date
                                between add_months(trunc(valRecordDate, 'MM'), -i)
                                and (add_months(trunc(valRecordDate, 'MM'), -i + 1) - 1)
                        )
                ) outl
                    on outl.unit_ams_id = prom.umnm_unit_ams_id;
                commit;

                ams.life_agency_log.time_end;
                ams.life_agency_log.write_log(1000, 'mmxiii_modl_umnm_open', 'Cac dai ly nghi viec trong thang thang ' || to_char(valRecordDate, 'dd/mm/yyyy')|| ' chi tiet  ' ||to_char(add_months(trunc(valRecordDate, 'MM'), -i), 'dd/mm/yyyy'));
                ams.life_agency_log.time_stop;
                ams.life_agency_log.time_begin;
                var_error_pos := 12;


                /* Cac dai ly thuoc nhom phat trien lam viec trong tung thang cac
                nhom dc tach ra tu nhom do vao day*/
                insert /*+ APPEND */ into ams.la_prom_mmxiii_umnm nologging (
                    outlet_id,
                    outlet_ams_id,
                    company_id,
                    record_date,
                    version_date,
                    type_code,
                    outlet_name,
                    effective_date,
                    terminative_date,
                    umnm_outlet_id,
                    umnm_outlet_ams_id,
                    umnm_unit_id,
                    umnm_unit_ams_id,
                    umnm_be_paid,
                    umnm_be_executing,
                    umnm_data_date,
                    umnm_period_fyp,
                    umnm_period_empl,
                    umnm_period_issu,
                    umnm_period_acti,
                    create_user,
                    update_user,
                    create_datetime,
                    update_datetime
                )
                select /*+ CARDINALITY(prom, 100) CARDINALITY(umdv, 100) CARDINALITY(outl, 100)*/
                    outl.outlet_id,
                    outl.outlet_ams_id,
                    outl.company_id,
                    trunc(valRecordDate, 'MM'),
                    cast(trunc(sysdate, 'DD') as date),
                    AMS_MODL_PROM_MMXIII.MMXIII_PROM_DEVE, --day la du lieu nhom con duoc phat trien len
                    outl.outlet_name,
                    outl.effective_date,
                    outl.terminative_date,
                    prom.umnm_outlet_id,
                    prom.umnm_outlet_ams_id,
                    prom.umnm_unit_id,
                    prom.umnm_unit_ams_id,
                    case
                        when outl.terminative_date is not null then
                            AMS_MODL_PROM_MMXIII.BE_PAID_SPC
                        else
                            AMS_MODL_PROM_MMXIII.BE_PAID_DTL
                        end,
                    AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
                    add_months(trunc(valRecordDate, 'MM'), -i),
                    0,
                    0,
                    0,
                    0,
                    AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    sysdate,
                    sysdate
                from
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.umnm_outlet_id,
                        tmp.umnm_outlet_ams_id,
                        tmp.umnm_unit_id,
                        tmp.umnm_unit_ams_id
                    from ams.la_promotion_mmxiii tmp
                    where tmp.record_date = trunc(valRecordDate, 'MM')
                        and tmp.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                ) prom
                join /*lay du lieu ve nhom ma dai ly tren co cong phat trien len*/
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.unit_ams_id,
                        tmp.effective_date,
                        tmp.umnm_outlet_ams_id
                    from ams.la_prom_mmxiii_umnm_dv tmp
                    where tmp.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                        and tmp.record_date = trunc(valRecordDate, 'MM')
                        and tmp.umnm_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
                ) umdv
                    on umdv.umnm_outlet_ams_id = prom.umnm_outlet_ams_id
                join /*lay du lieu ve dai ly thuoc nhom ma dai ly tren co cong phat trien len*/
                (
                    select /*+ CARDINALITY(data, 100)*/
                        data.record_date,
                        data.outlet_id,
                        data.outlet_ams_id,
                        data.outlet_name,
                        data.company_id,
                        data.agency_id,
                        data.agency_ams_id,
                        data.agency_name,
                        data.unit_id,
                        data.unit_ams_id,
                        data.unit_name,
                        data.effective_date,
                        data.terminative_date
                    from ams.inp_data_outlet data
                    where data.record_date = add_months(trunc(valRecordDate, 'MM'), -i) --cho nay la de lay tu thang -5 cho den thang 0 la thang hien tai tuc la - i thi moi dung duoc
                        and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                        --and data.record_date = add_months(trunc(valRecordDate, 'MM'), -5 + i) --cho nay la de lay tu thang -5 cho den thang 0 la thang hien tai
                        and data.status_code = AMS_MODL_PROM_MMXIII.OBJECT_STATUS_ACTIVE
                ) outl
                    on outl.unit_ams_id = umdv.unit_ams_id
                --khi ma thoi gian phat trien nhom lon hon so voi thoi gian nhu the
                --thi se dua vao la dung
                /*chay theo tung thang nhu the nay thi moi dung duoc co nhe*/
                where add_months(trunc(valRecordDate, 'MM'),  -i) >= umdv.effective_date;
                --where add_months(trunc(valRecordDate, 'MM'), -5 + i) >= umdv.effective_date;
                commit;

                ams.life_agency_log.time_end;
                ams.life_agency_log.write_log(1000, 'mmxiii_modl_umnm_open', ' Them ca nhan vien cua nhom con dc tach tu nhom goc thang ' ||to_char(valRecordDate, 'dd/mm/yyyy')|| ' chi tiet  ' ||to_char(add_months(trunc(valRecordDate, 'MM'), -i), 'dd/mm/yyyy'));
            end if;
        end loop;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_umnm_open', 'xoa thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 13;

        /* So lieu tong hop*/

        insert /*+ APPEND */ into ams.la_prom_mmxiii_umnm nologging (
            outlet_id,
            outlet_ams_id,
            company_id,
            record_date,
            version_date,
            outlet_name,
            effective_date,
            terminative_date,
            umnm_outlet_id,
            umnm_outlet_ams_id,
            umnm_unit_id,
            umnm_unit_ams_id,
            umnm_be_paid,
            umnm_be_executing,
            umnm_data_date,
            umnm_period_fyp,
            umnm_period_empl,
            umnm_period_issu,
            umnm_period_acti,
            create_user,
            update_user,
            create_datetime,
            update_datetime
        )
        select/*+ CARDINALITY(umnm, 100) */
            umnm.outlet_id,
            umnm.outlet_ams_id,
            max(umnm.company_id),
            trunc(valRecordDate, 'MM'),
            cast(trunc(sysdate, 'DD') as date),
            max(umnm.outlet_name),
            max(umnm.effective_date),
            max(umnm.terminative_date),
            umnm.umnm_outlet_id,
            umnm.umnm_outlet_ams_id,
            umnm.umnm_unit_id,
            umnm.umnm_unit_ams_id,
            AMS_MODL_PROM_MMXIII.BE_PAID_YES,
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
            trunc(valRecordDate, 'MM'),
            0,
            0,
            0,
            0,
            AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.la_prom_mmxiii_umnm umnm
        where umnm.record_date = trunc(valRecordDate, 'MM')
            and umnm.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            and umnm.umnm_be_paid in
                (
                    AMS_MODL_PROM_MMXIII.BE_PAID_DTL,
                    AMS_MODL_PROM_MMXIII.BE_PAID_SPC
                )
        group by umnm.outlet_id,
            umnm.outlet_ams_id,
            umnm.umnm_outlet_id,
            umnm.umnm_outlet_ams_id,
            umnm.umnm_unit_id,
            umnm.umnm_unit_ams_id;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_umnm_open', 'So lieu tong hop thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 14;

        --begin
        /*Xy ly theo cac nhom cua cac truong nhom do OK*/
        for unit_rec in
          (
              select /*+ CARDINALITY(tmp, 100)*/
                  tmp.umnm_outlet_ams_id umnm_outlet_ams_id,
                  tmp.umnm_unit_ams_id unit_ams_id
              from ams.la_promotion_mmxiii tmp
              where tmp.record_date = trunc(valRecordDate, 'MM')
                  and tmp.umnm_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
                  and tmp.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                  and tmp.umnm_outlet_ams_id is not null
              --group by tmp.umnm_outlet_ams_id
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
                    /*Danh sach cac dai ly moi do truong nhom do tuyen vao*/
                    select /*+ CARDINALITY(key, 100) CARDINALITY(empl, 100) CARDINALITY(outl, 100)*/
                        outl.outlet_ams_id
                    from
                    (
                        select /*+ CARDINALITY(tmp, 100)*/
                            tmp.outlet_id
                        from ams.la_promotion_mmxiii tmp
                        where tmp.record_date = trunc(valRecordDate, 'MM')
                            and tmp.umnm_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
                            and tmp.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                            and tmp.umnm_outlet_ams_id = unit_rec.umnm_outlet_ams_id
                        group by tmp.outlet_id
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
                     join /*Lay cac dai ly moi vao lam viec trong 6 thang*/
                     (
                        select /*+ CARDINALITY(outl, 100)*/
                            outl.outlet_id,
                            outl.outlet_ams_id,
                            outl.unit_id,
                            outl.unit_ams_id
                        from ams.inp_data_outlet outl
                        where outl.record_date = trunc(valRecordDate, 'MM')
                            and outl.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                            and outl.status_code = AMS_MODL_PROM_MMXIII.OBJECT_STATUS_ACTIVE
                            and outl.effective_date
                                between var_umnm_from_date
                                and var_umnm_to_date
                            and outl.terminative_date is null
                     ) outl
                        on outl.outlet_id = empl.outlet_id
                    /*tru di danh sach cac dai ly co trong nhom do da co*/
                    minus
                    select/*+ CARDINALITY(umnm, 100) */
                        umnm.outlet_ams_id
                    from ams.la_prom_mmxiii_umnm umnm
                    where umnm.record_date = trunc(valRecordDate, 'MM')
                        and umnm.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                        and umnm.umnm_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
                        and umnm.umnm_outlet_ams_id = unit_rec.umnm_outlet_ams_id
                    group by umnm.outlet_ams_id
               ) res
               group by res.outlet_ams_id
           ) repo;
            /*Neu so luong dai ly dat dieu kien tim kiem >0 thi moi insert vao*/
            if var_qty > 0 then
                /*Duyet tung nhom neu ma co nhom khong co chua dai ly thi se phai insert vao neu thieu*/
                insert /*+ APPEND */ into ams.la_prom_mmxiii_umnm nologging (
                    outlet_id,
                    outlet_ams_id,
                    company_id,
                    record_date,
                    version_date,
                    type_code,
                    outlet_name,
                    effective_date,
                    terminative_date,
                    umnm_outlet_id,
                    umnm_outlet_ams_id,
                    umnm_unit_id,
                    umnm_unit_ams_id,
                    umnm_be_paid,
                    umnm_be_executing,
                    umnm_data_date,
                    umnm_empl_id,
                    umnm_period_fyp,
                    umnm_period_empl,
                    umnm_period_issu,
                    umnm_period_acti,
                    create_user,
                    update_user,
                    create_datetime,
                    update_datetime
                )
                select /*+ CARDINALITY(key, 100) CARDINALITY(outl, 100) CARDINALITY(empl, 100) */
                    distinct
                    outl.outlet_id,
                    outl.outlet_ams_id,
                    outl.company_id,
                    trunc(valRecordDate, 'MM'),
                    cast(trunc(sysdate, 'DD') as date),
                    AMS_MODL_PROM_MMXIII.BE_PAID_EMP,
                    outl.outlet_name,
                    outl.effective_date,
                    outl.terminative_date,
                    empl.empl_id,--prom.umnm_outlet_id,
                    null,--prom.umnm_outlet_ams_id,
                    null,--prom.umnm_unit_id,
                    unit_rec.unit_ams_id,
                    AMS_MODL_PROM_MMXIII.BE_PAID_EMP,
                    AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
                    trunc(valRecordDate, 'MM'),
                    empl.empl_id, --umnm_empl_id
                    0, --umnm_period_fyp
                    0, --umnm_period_empl
                    0, --umnm_period_issu
                    0, --umnm_period_acti
                    AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    sysdate,
                    sysdate
                from
                (
                    select  /*+ CARDINALITY(res, 100)*/
                        res.outlet_ams_id
                    from
                    (
                        /*Danh sach cac dai ly moi do truong nhom do tuyen vao
                        doi dieu kien nay thi la phai la dai ly do truong nhom tuyen vao chu khong the la dai ly tuyen vao duoc*/
                        select /*+ CARDINALITY(key, 100) CARDINALITY(empl, 100) CARDINALITY(outl, 100)*/
                            outl.outlet_ams_id
                        from
                        (
                            select /*+ CARDINALITY(tmp, 100)*/
                                tmp.outlet_id
                            from ams.la_promotion_mmxiii tmp
                            where tmp.record_date = trunc(valRecordDate, 'MM')
                                and tmp.umnm_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
                                and tmp.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                                and tmp.umnm_outlet_ams_id = unit_rec.umnm_outlet_ams_id
                            group by tmp.outlet_id
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
                         join /*Lay cac dai ly moi vao lam viec trong 6 thang*/
                         (
                            select /*+ CARDINALITY(outl, 100)*/
                                outl.outlet_id,
                                outl.outlet_ams_id,
                                outl.unit_id,
                                outl.unit_ams_id
                            from ams.inp_data_outlet outl
                            where outl.record_date = trunc(valRecordDate, 'MM')
                                and outl.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                                and outl.status_code = AMS_MODL_PROM_MMXIII.OBJECT_STATUS_ACTIVE
                                and outl.effective_date
                                    between var_umnm_from_date
                                    and var_umnm_to_date
                                and outl.terminative_date is null
                         ) outl
                            on outl.outlet_id = empl.outlet_id
                        /*tru di danh sach cac dai ly co trong nhom do da co*/
                        minus
                        select/*+ CARDINALITY(umnm, 100) */
                            umnm.outlet_ams_id
                        from ams.la_prom_mmxiii_umnm umnm
                        where umnm.record_date = trunc(valRecordDate, 'MM')
                            and umnm.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                            and umnm.umnm_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
                            --and umnm.umnm_unit_ams_id = unit_rec.unit_ams_id
                            and umnm.umnm_outlet_ams_id = unit_rec.umnm_outlet_ams_id
                        group by umnm.outlet_ams_id
                   ) res
                   group by res.outlet_ams_id
               ) key
                join
                (
                    select /*+ CARDINALITY(data, 100)*/
                        data.outlet_id,
                        data.outlet_ams_id,
                        data.outlet_name,
                        data.company_id,
                        data.agency_id,
                        data.agency_ams_id,
                        data.agency_name,
                        data.unit_id,
                        data.unit_ams_id,
                        data.unit_name,
                        data.effective_date,
                        data.terminative_date
                    from ams.inp_data_outlet data
                    where data.record_date = trunc(valRecordDate, 'MM')
                        and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                        and data.status_code = AMS_MODL_PROM_MMXIII.OBJECT_STATUS_ACTIVE
                        and data.effective_date
                            between var_umnm_from_date
                            and var_umnm_to_date
                        and data.terminative_date is null
                ) outl
                    on outl.outlet_ams_id = key.outlet_ams_id
                join --lay ra danh sach cac dai ly duoc cac ca nhan tren tuyen vao
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.outlet_id,
                        tmp.empl_id
                    from ams.la_prom_history_agent_tmp tmp
                    where tmp.record_date = trunc(valRecordDate, 'MM')
                ) empl
                    on empl.outlet_id = outl.outlet_id;
                commit;
            end if;
        end loop;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_umnm_open', 'Cap nhat ma truong nhom ghi nhan da tuyen dai ly nay thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 16;

        /* Cap nhat ma truong nhom ghi nhan da tuyen dai ly nay
        outlet_ams_id dai ly tuyen dung co phan tuyen moi rieng biet*/
        merge /*+ CARDINALITY(umnm, 100)*/
            into ams.la_prom_mmxiii_umnm umnm
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    outl.outlet_id,
                    max(outl.outlet_ams_id) outlet_ams_id
                from ams.inp_data_outlet outl
                where outl.record_date = trunc(valRecordDate, 'MM')
                    and outl.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                    and outl.status_code = AMS_MODL_PROM_MMXIII.OBJECT_STATUS_ACTIVE
                    and outl.terminative_date is null
                group by outl.outlet_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = umnm.record_date
            and
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = umnm.umnm_be_executing
            and--cho phan dai ly tuyen dung BE_PAID_EMPL
            AMS_MODL_PROM_MMXIII.BE_PAID_EMP = umnm.umnm_be_paid
            and
            upd.outlet_id = umnm.umnm_outlet_id
            )
        when matched then
            update
                set
                    umnm.umnm_outlet_ams_id = upd.outlet_ams_id,
                    umnm.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    umnm.update_datetime = sysdate;
        commit;
        --end

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_umnm_open', 'Cap nhat ma truong nhom ghi nhan da tuyen dai ly nay  thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 16;

        /* Cap nhat dai ly tuyen dung*/
        merge /*+ CARDINALITY(umnm, 100)*/
            into ams.la_prom_mmxiii_umnm umnm
        using
            (
                select /*+ CARDINALITY(tmp, 100)*/
                    tmp.outlet_id,
                    max(tmp.empl_id) empl_id
                from ams.la_prom_history_agent_tmp tmp
                where tmp.record_date = trunc(valRecordDate, 'MM')
                group by tmp.outlet_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = umnm.record_date
            and
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = umnm.umnm_be_executing
            and
            AMS_MODL_PROM_MMXIII.BE_PAID_YES = umnm.umnm_be_paid
            and
            upd.outlet_id = umnm.outlet_id
            )
        when matched then
            update
                set
                    umnm.umnm_empl_id = upd.empl_id,
                    umnm.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    umnm.update_datetime = sysdate;
        commit;

        dbms_stats.gather_table_stats(null, 'la_prom_mmxiii_umnm', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_umnm', ' Cap nhat dai ly tuyen dung chay xong');
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_umnm_open: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 1/2/2013
        Version: 1.0
        Description: Thu tuc tinh toan cac chi tieu cho duy tri truong nhom
        Parameter:
            valRecordDate [date]: Thang chay
        Update:  Le Khac Chinh
            Version: 1.1
            Date Updated: 26/12/2013
            Note:  Fix lai chuong trinh theo yeu cau: 124502 cua SME
                      Dem chinh xac so luong tuyen dung thuan cua truong nhom
    */
    procedure mmxiii_modl_umnm_data(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
        var_umnm_from_date date := add_months(trunc(valRecordDate, 'MM'), -5);
        var_umnm_to_date date := valRecordDate;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /*doan nay rat quan trong de xet du lieu cho no quay lai 6 thang ke tu thoi diem cuoi xet
        Neu ma chay o thang 3 thi chi LAY DU LIEU thang 1 thang 2 thang 3 cho no de chay du lieu
        Neu ma chay o thang 9 thi chi lay du lieu o thang 7 8 9 cho no de chay du lieu
        Neu khong thi se lay sai du lieu cho no o day
        Dung cac gioi han ngay de xu ly cho no o day thi se tot nhat*/
        var_umnm_to_date := trunc(last_day(valRecordDate), 'DD');
        if trunc(valRecordDate, 'MM')
            between trunc(to_date('1-jan-2013'), 'DD')
            and trunc(to_date('1-jun-2013'), 'DD') then
            var_umnm_from_date := trunc(to_date('1-jan-2013'), 'DD');
        /*Neu ma chay tu 1/7 den 30/11 thi ngay hieu luc moi se la 1/1/2014*/
        elsif trunc(valRecordDate, 'MM')
            between trunc(to_date('1-jul-2013'), 'DD')
            and trunc(to_date('1-dec-2013'), 'DD') then
            var_umnm_from_date := trunc(to_date('1-jul-2013'), 'DD');
        end if;
        -------------------------------------------------------------
        /* AGENCIES */
        -------------------------------------------------------------
        /* Cap nhat quy mo nhom*/
        merge /*+ CARDINALITY(prom, 100)*/
            into ams.la_promotion_mmxiii prom
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.umnm_unit_ams_id,
                    nvl(count(*), 0) agts
                from ams.la_prom_mmxiii_umnm data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                    and data.umnm_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_DTL
                    and data.umnm_data_date = trunc(valRecordDate, 'MM')
                    and data.terminative_date is null
                    and data.umnm_unit_ams_id is not null
                group by data.umnm_unit_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = prom.record_date
            and
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = prom.umnm_be_executing
            and
            AMS_MODL_PROM_MMXIII.BE_PAID_YES = prom.umnm_be_paid
            and
            upd.umnm_unit_ams_id = prom.umnm_unit_ams_id
            )
        when matched then
            update
                set
                    prom.umnm_agts = upd.agts,
                    prom.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    prom.update_datetime = sysdate;
        commit;


        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_umnm_data', 'Cap nhat quy mo nhom  thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 1;
        -------------------------------------------------------------
        /* FYP */
        -------------------------------------------------------------
        /* Lay chi tiet FYP trong 6 thang gan nhat*/
        merge /*+ CARDINALITY(umnm, 100)*/
            into ams.la_prom_mmxiii_umnm umnm
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_ams_id,
                    data.record_date,
                    nvl(data.data_value, 0) period_fyp
                from ams.mod_data data
                where data.record_date
                        between var_umnm_from_date
                        and var_umnm_to_date
                    and data.module_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                    and data.data_code = AMS_MODL_PROM_MMXIII.DATA_CODE_FYP
            ) upd
        on (
            trunc(valRecordDate, 'MM') = umnm.record_date
            and
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = umnm.umnm_be_executing
            and --lay ca dai ly da nghi viec nua vao day la dung roi
            umnm.umnm_be_paid in
                (
                    AMS_MODL_PROM_MMXIII.BE_PAID_DTL,
                    AMS_MODL_PROM_MMXIII.BE_PAID_SPC
                )
            and
            upd.outlet_ams_id = umnm.outlet_ams_id
            and
            upd.record_date = umnm.umnm_data_date
            )
        when matched then
            update
                set
                    umnm.umnm_period_fyp = upd.period_fyp,
                    umnm.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    umnm.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_umnm_data', ' Lay chi tiet FYP trong 6 thang gan nhat  thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 2;
        /* Tong cong FYP*/
        merge /*+ CARDINALITY(umnm, 100)*/
            into ams.la_prom_mmxiii_umnm umnm
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_ams_id,
                    nvl(sum(data.umnm_period_fyp), 0) period_fyp
                from ams.la_prom_mmxiii_umnm data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                    and data.umnm_be_paid in
                        (
                            AMS_MODL_PROM_MMXIII.BE_PAID_DTL,
                            AMS_MODL_PROM_MMXIII.BE_PAID_SPC
                        )
                    and data.umnm_data_date
                        between var_umnm_from_date
                        and var_umnm_to_date
                group by data.outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = umnm.record_date
            and
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = umnm.umnm_be_executing
            and
            AMS_MODL_PROM_MMXIII.BE_PAID_YES = umnm.umnm_be_paid
            and
            upd.outlet_ams_id = umnm.outlet_ams_id
            )
        when matched then
            update
                set
                    umnm.umnm_period_fyp = upd.period_fyp,
                    umnm.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    umnm.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_umnm_data', 'Tong cong FYP  thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 3;

        /* FYP trong ky danh gia*/
        merge /*+ CARDINALITY(prom, 100)*/
            into ams.la_promotion_mmxiii prom
        using
            (
                select /*+ CARDINALITY(umnm, 100)*/
                    umnm.umnm_unit_ams_id,
                    nvl(sum(umnm.umnm_period_fyp), 0) period_fyp
                from ams.la_prom_mmxiii_umnm umnm
                where umnm.record_date = trunc(valRecordDate, 'MM')
                    and umnm.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                    and umnm.umnm_be_paid in /*chi duy nhat chi tieu FYP thi moi tinh dai ly nghi viec vao con cac chi tieu khac thi khong*/
                        (
                            AMS_MODL_PROM_MMXIII.BE_PAID_DTL,
                            AMS_MODL_PROM_MMXIII.BE_PAID_SPC
                        )
                    and umnm.outlet_ams_id <> umnm.umnm_outlet_ams_id
                    and umnm.umnm_data_date
                        between var_umnm_from_date
                        and var_umnm_to_date
                    and umnm.umnm_unit_ams_id is not null
                group by umnm.umnm_unit_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = prom.record_date
            and
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = prom.umnm_be_executing
            and
            upd.umnm_unit_ams_id = prom.umnm_unit_ams_id
            )
        when matched then
            update
                set
                    prom.umnm_period_fyp = upd.period_fyp,
                    prom.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    prom.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_umnm_data', 'FYP trong ky danh gia  thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 4;

        -------------------------------------------------------------
        /* EMPL */
        -------------------------------------------------------------
        /* Dai ly moi tuyen thuan trong ky*/
        update ams.la_prom_mmxiii_umnm umnm
        set
            umnm.umnm_period_empl = 1,
            umnm.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            umnm.update_datetime = sysdate
        where umnm.record_date = trunc(valRecordDate, 'MM')
            and umnm.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            and umnm.umnm_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
            and umnm.outlet_ams_id <> umnm.umnm_outlet_ams_id
            and umnm.effective_date
                between var_umnm_from_date
                and var_umnm_to_date
            and umnm.terminative_date is null;
        commit;

        /* Dai ly moi tuyen thuan trong ky doi voi cac dai ly tuyen moi chuyen di xet rieng ra*/
        update ams.la_prom_mmxiii_umnm umnm
        set
            umnm.umnm_period_empl = 1,
            umnm.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            umnm.update_datetime = sysdate
        where umnm.record_date = trunc(valRecordDate, 'MM')
            and umnm.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            and umnm.umnm_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_EMP
            and umnm.outlet_ams_id <> umnm.umnm_outlet_ams_id
            and umnm.effective_date
                between var_umnm_from_date
                and var_umnm_to_date
            and umnm.terminative_date is null;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_umnm_data', 'Dai ly moi tuyen thuan trong ky  thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 5;

        dbms_stats.gather_table_stats(null, 'la_prom_mmxiii_umnm', cascade => true);


        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_umnm_data', 'gather_table_stats la_prom_mmxiii_umnm thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 6;

        execute immediate 'truncate table ams.la_prom_mmxiii_umnm_tmp';
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_umnm_data', 'truncate la_prom_mmxiii_umnm_tmp thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 7;

        insert /*+ APPEND */ into ams.la_prom_mmxiii_umnm_tmp nologging (
            record_date,
            umnm_unit_ams_id,
            umnm_period_empl
        )
        select /*+ CARDINALITY(umnm, 100)*/
            trunc(valRecordDate, 'MM'),
            umnm.umnm_unit_ams_id,
            sum(nvl(umnm.umnm_period_empl, 0))
        from ams.la_prom_mmxiii_umnm umnm
        where umnm.record_date = trunc(valRecordDate, 'MM')
            and umnm.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            and umnm.umnm_be_paid in (
                AMS_MODL_PROM_MMXIII.BE_PAID_YES,
                AMS_MODL_PROM_MMXIII.BE_PAID_EMP)
            and umnm.outlet_ams_id <> umnm.umnm_outlet_ams_id
            and umnm.umnm_unit_ams_id is not null
            and umnm.umnm_empl_id is not null
            and umnm.umnm_outlet_id = umnm.umnm_empl_id --do truong nhom tuyen vao
        group by umnm.umnm_unit_ams_id;
        commit;

        dbms_stats.gather_table_stats(null, 'la_prom_mmxiii_umnm_tmp', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_umnm_data', 'do du lieu vao bang la_prom_mmxiii_umnm_tmp thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 8;

        /* Tuyen thuan cua ca nhan truong nhom trong ky danh gia*/
        merge /*+ CARDINALITY(prom, 100)*/
            into ams.la_promotion_mmxiii prom
        using
            (
                select /*+ CARDINALITY(umnm, 100)*/
                    umnm.umnm_unit_ams_id,
                    sum(nvl(umnm.umnm_period_empl, 0)) umnm_period_empl
                from ams.la_prom_mmxiii_umnm_tmp umnm
                where umnm.record_date = trunc(valRecordDate, 'MM')
                group by umnm.umnm_unit_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = prom.record_date
            and
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = prom.umnm_be_executing
            and
            upd.umnm_unit_ams_id = prom.umnm_unit_ams_id
            )
        when matched then
            update
                set prom.umnm_period_empl = nvl(upd.umnm_period_empl, 0),
                prom.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                prom.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_umnm_data', 'Tuyen thuan cua nhom trong ky danh gia  thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 9;

        -------------------------------------------------------------
        /* So luot hoat dong chinhlk modify theo chinh sach moi
        cung da ap dung theo so luot dai ly hoat dong theo phan tich
        cua anh Tuan
        */
        -------------------------------------------------------------
        /* Lay chi tiet hop dong phat hanh thuan tung thang*/
        merge /*+ CARDINALITY(umnm, 100)*/
            into ams.la_prom_mmxiii_umnm umnm
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_ams_id,
                    data.record_date,
                    data.data_value umnm_period_issu
                from mod_data data
                where data.record_date
                        between var_umnm_from_date
                        and var_umnm_to_date
                    and data.module_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                    and data.data_code = AMS_MODL_PROM_MMXIII.DATA_CODE_NET_ISSU
            ) upd
        on (
            trunc(valRecordDate, 'MM') = umnm.record_date
            and
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = umnm.umnm_be_executing
            and
            umnm.umnm_be_paid in
                (
                    AMS_MODL_PROM_MMXIII.BE_PAID_DTL
                )
            and
            upd.outlet_ams_id = umnm.outlet_ams_id
            and
            upd.record_date = umnm.umnm_data_date
            )
        when matched then
            update
                set
                    umnm.umnm_period_issu = nvl(upd.umnm_period_issu, 0),
                    umnm.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    umnm.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_umnm_data', 'Lay chi tiet hop dong phat hanh thuan tung thang  thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 10;

        /* Xac dinh so luot dai ly hoat dong trong tung thang
        Neu ma so hop dong khai thac moi thuan >0 thi se duoc xac dinh la so luot dai ly hoat dong trong thang*/
        update ams.la_prom_mmxiii_umnm umnm
        set umnm.umnm_period_acti = 1,
            umnm.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            umnm.update_datetime = sysdate
        where umnm.record_date = trunc(valRecordDate, 'MM')
            and umnm.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            and umnm.umnm_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_DTL
            and umnm.umnm_data_date
                between var_umnm_from_date
                and var_umnm_to_date
            and nvl(umnm.umnm_period_issu, 0) > 0;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_umnm_data', 'Xac dinh so luot dai ly hoat dong trong tung thang  thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 11;

        /* Tong so luot hoat dong trong ky danh gia
            chi tinh  dai ly con lam viec den cuoi thang vi chi FYP moi tinh ca nghi trong thang
        */
        merge /*+ CARDINALITY(prom, 100)*/
            into ams.la_promotion_mmxiii prom
        using
            (
                /*tinh ra tong so luot dai ly hoat dong trong giai doan xet  tuc tinh tong so
                luot dai ly hoat dong trong vong 6 thang*/
                select  /*+ CARDINALITY(umnm, 100)*/
                    umnm.umnm_unit_ams_id,
                    sum(nvl(umnm.umnm_period_acti, 0)) period_acti
                from ams.la_prom_mmxiii_umnm umnm
                where umnm.record_date = trunc(valRecordDate, 'MM')
                    and umnm.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                    and umnm.umnm_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_DTL
                    and umnm.umnm_data_date
                        between var_umnm_from_date
                        and var_umnm_to_date
                    and (
                        umnm.terminative_date is null
                        or
                        umnm.terminative_date >= add_months(trunc(umnm.umnm_data_date, 'MM'), 1)
                    )
                    and umnm.umnm_unit_ams_id is not null
                group by umnm.umnm_unit_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = prom.record_date
            and
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = prom.umnm_be_executing
            and
            upd.umnm_unit_ams_id = prom.umnm_unit_ams_id
            )
        when matched then
            update
                set
                    prom.umnm_period_acti = nvl(upd.period_acti, 0),
                    prom.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
                    prom.update_datetime = sysdate;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_umnm_data', ' Ty le hoat dong trong ky danh gia da chay xong');
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_umnm_data: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_umnm_asmt(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
        var_effective_date date := add_months(trunc(valRecordDate, 'MM'), 1);
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /*Neu ma chay tu 1/1 den 30/6 thi ngay hieu luc moi se la 1/7*/
        if trunc(valRecordDate, 'MM')
            between trunc(to_date('1-jan-2013'), 'DD')
            and trunc(to_date('1-jun-2013'), 'DD') then
            var_effective_date := trunc(to_date('1-jul-2013'), 'DD');
        /*Neu ma chay tu 1/7 den 31/12 thi ngay hieu luc moi se la 1/1/2014*/
        elsif trunc(valRecordDate, 'MM')
            between trunc(to_date('1-jul-2013'), 'DD')
            and trunc(to_date('1-dec-2013'), 'DD') then
            var_effective_date := trunc(to_date('1-jan-2014'), 'DD');
        end if;

        /* Chi tieu duy tri:
           SENIORITY: 12 thang
           AGENTIES: 12
           PERIOD FYP: 120.000.000
           EMPL: 3
           ACTI: 25*/

        /* 01/06/2013, 01/12/2013*/
        update ams.la_promotion_mmxiii prom
        set
            prom.umnm_asmt = AMS_MODL_PROM_MMXIII.AMST_DEPO,
            prom.umnm_effe_date = var_effective_date,
            prom.umnm_effe_code = AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV05,
            prom.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            prom.update_datetime = sysdate
        where prom.record_date = trunc(valRecordDate, 'MM')
            and prom.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            and prom.umnm_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
            and
            (
                prom.umnm_agts < 12
                or
                prom.umnm_period_fyp < 120000000
                or
                prom.umnm_period_empl < 3
                or
                prom.umnm_period_acti < 25
            )
            and prom.umnm_asmt = AMS_MODL_PROM_MMXIII.AMST_MAIN;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_umnm_asmt', ' da chay xong');
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_umnm_asmt: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    procedure mmxiii_modl_umnm_close(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* */
        update la_prom_mmxiii_umnm umnm
        set
            umnm.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_NO,
            umnm.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            umnm.update_datetime = sysdate
        where umnm.record_date = trunc(valRecordDate, 'MM')
            and umnm.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES;
        commit;

        /* */
        update la_promotion_mmxiii prom
        set
            prom.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_NO,
            prom.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            prom.update_datetime = sysdate
        where prom.record_date = trunc(valRecordDate, 'MM')
            and prom.umnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_umnm_close', ' da chay xong');
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_close: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

    /*
        Creater: Vu Duc Thong
        Date Create: 22/07/2013
        Version: 1.0
        Description: Thang tien len truong ban
        Parameter:
            valRecordDate [date]: Kieu ngay thang tien
        Update: Vu Duc Thong
        Date Update: 04/11/2013
        Version: 1.1
        Description: Sua khoang thoi gian lay nhom tach ra
        Parameter:
            valRecordDate [date]: Kieu ngay thang tien

        Update: Vu Duc Thong
        Date Update: 20/11/2013
        Version: 1.2
        Description: Sua khoang thoi gian lay nhom tach ra
        Parameter:
            valRecordDate [date]: Kieu ngay thang tien
    */

    procedure mmxiii_modl_umnp(valRecordDate date := null)
    is
    begin
        if (
            AMS_CORE_MODULE.is_active(
                AMS_MODL_PROM_MMXIII.MMXIII_PROM_UMNP,
                trunc(valRecordDate, 'MM')
            ) = AMS_CORE_MODULE.IS_YES
        ) then
                AMS_MODL_PROM_MMXIII.mmxiii_modl_umnp_open(valRecordDate);
                AMS_MODL_PROM_MMXIII.mmxiii_modl_umnp_data(valRecordDate);
                AMS_MODL_PROM_MMXIII.mmxiii_modl_umnp_asmt(valRecordDate);
                AMS_MODL_PROM_MMXIII.mmxiii_modl_umnp_close(valRecordDate);
        end if;
    end;


    procedure mmxiii_modl_umnp_open(valRecordDate date := null)
    is
       var_from_date date;
       var_to_date date;
       var_from_date_dev date;
       var_senr_by_months date;
    begin
        var_from_date := add_months(trunc(valRecordDate, 'YYYY'), -1);
        var_to_date := last_day(add_months(trunc(valRecordDate, 'YYYY'), + 10));
        var_from_date_dev := add_months(trunc(valRecordDate, 'YYYY'), -7);
        var_senr_by_months := add_months(trunc(valRecordDate, 'YYYY'), + 11);

        /* Cap nhat ngay hieu luc chuc vu*/
        merge /*+ CARDINALITY(prom, 100)*/
            into ams.la_promotion_mmxiii prom
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_ams_id,
                    data.position_date
                from ams.inp_data_outlet data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                    and data.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
            ) upd
        on (
            trunc(valRecordDate, 'MM') = prom.record_date
            and
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = prom.be_executing
            and
            AMS_MODL_PROM_MMXIII.BE_PAID_YES = prom.be_paid
            and
            AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV02 = prom.info_position_code
            and
            upd.outlet_ams_id = prom.outlet_ams_id
            )
        when matched then
            update
                set
                    prom.umnp_effective_date = upd.position_date,
                    prom.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                    prom.update_datetime = sysdate;
        commit;

        /* Len danh sach truong nhom duoc xet thang tien chuc vu*/
        update ams.la_promotion_mmxiii prom
        set
            prom.umnp_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES,
            prom.umnp_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
            prom.umnp_outlet_id = prom.outlet_id,
            prom.umnp_outlet_ams_id = prom.outlet_ams_id,
            prom.umnp_unit_id = prom.info_unit_id,
            prom.umnp_unit_ams_id = prom.info_unit_ams_id,
            prom.umnp_senr_by_months = 0,
            prom.umnp_numb_dev_unit = 0,
            prom.umnp_period_fyp = 0,
            prom.umnp_period_pr36 = 0,
            prom.umnp_period_acti = 0,
            prom.umnp_asmt = AMS_MODL_PROM_MMXIII.AMST_MAIN,
            prom.umnp_effe_date = null,
            prom.umnp_effe_code = null,
            prom.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
            prom.update_datetime = sysdate
        where prom.record_date = trunc(valRecordDate, 'MM')
            and prom.be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            and prom.info_position_code in (
                AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV02
            );
        commit;

        /* Loai bo cac truong hop loi du lieu*/
        update ams.la_promotion_mmxiii prom
        set
            prom.umnp_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_NO,
            prom.umnp_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_NO,
            prom.umnp_asmt = AMS_MODL_PROM_MMXIII.AMST_ERRO,
            prom.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
            prom.update_datetime = sysdate
        where prom.record_date = trunc(valRecordDate, 'MM')
            and prom.umnp_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            and prom.umnp_effective_date is null;
        commit;

        /* Khong xet cac nhom khong du dieu kien duy tri*/
        update ams.la_promotion_mmxiii prom
        set
            prom.umnp_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_NO,
            prom.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
            prom.update_datetime = sysdate
        where prom.record_date = trunc(valRecordDate, 'MM')
            and prom.umnp_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            and prom.umnp_asmt = AMS_MODL_PROM_MMXIII.AMST_DEPO;
        commit;

        /* Cap nhat tham nien chuc vu*/
        update ams.la_promotion_mmxiii prom
        set
            prom.umnp_senr_by_months = round(
                months_between(
                    var_senr_by_months,
                    nvl(trunc(prom.umnp_effective_date, 'MM'), AMS_CORE_SYSTEM.DATE_MIN_VALUE)
                )) + 1,
            prom.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
            prom.update_datetime = sysdate
        where prom.record_date = trunc(valRecordDate, 'MM')
            and prom.umnp_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            ;
        commit;

        /* Len danh sach du lieu chi tiet phat trien nhom can xoa*/
        merge /*+ CARDINALITY(umdv, 100)*/
            into ams.la_prom_mmxiii_umdv umdv
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    max(data.record_date) record_date
                from ams.la_promotion_mmxiii data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.umnp_be_executing = AMS_MODL_PROMOTION.BE_EXECUTING_YES
            ) upd
        on (
            trunc(valRecordDate, 'MM') = umdv.record_date
            )
        when matched then
            update
                set
                    umdv.umnp_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_DEL;
        commit;

        /* Xoa du lieu chi tiet phat trien nhom*/
        loop
            delete ams.la_prom_mmxiii_umdv del
            where del.record_date = trunc(valRecordDate, 'MM')
                and del.umnp_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_DEL
                and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        /* Cac truong nhom hien tai*/
        insert into la_prom_mmxiii_umdv (
            outlet_id,
            outlet_ams_id,
            unit_id,
            unit_ams_id,
            unit_name,
            record_date,
            version_date,
            effective_date,
            umnp_be_paid,
            umnp_be_executing,
            create_user,
            update_user,
            create_datetime,
            update_datetime
        )
        select
            data.outlet_id,
            data.outlet_ams_id,
            data.unit_id,
            data.unit_ams_id,
            data.unit_name,
            trunc(valRecordDate, 'MM'),
            cast(trunc(sysdate, 'DD') as date),
            data.position_date,
            AMS_MODL_PROM_MMXIII.BE_PAID_NO,
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.inp_data_outlet data
        where data.record_date = trunc(valRecordDate, 'MM')
            and data.position_code = AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV02
            and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
            and data.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE;
        commit;

        /*Sua khoang thoi gian tach nhom*/
        /* Xet trong vong 18 thang*/
        for i in 0..17
        loop
          if add_months(trunc(valRecordDate, 'MM'), -i)
                between var_from_date_dev
                and var_to_date
            then
              merge /*+ CARDINALITY(umdv, 100)*/
                  into ams.la_prom_mmxiii_umdv umdv
              using
                  (
                      select /*+ CARDINALITY(newu, 100)
                                 CARDINALITY(oldo, 100)
                                 CARDINALITY(oldu, 100) */
                          newu.outlet_ams_id,
                          oldu.outlet_id umnp_outlet_id,
                          oldu.outlet_ams_id umnp_outlet_ams_id,
                          oldu.unit_id umnp_unit_id,
                          oldu.unit_ams_id umnp_unit_ams_id
                      from
                      (
                          select
                              umdv.outlet_id,
                              umdv.outlet_ams_id,
                              umdv.unit_id,
                              umdv.unit_ams_id
                          from ams.la_prom_mmxiii_umdv umdv
                          where umdv.record_date = trunc(valRecordDate, 'MM')
                              and umdv.umnp_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                      ) newu
                      join
                      (
                          select /*+ CARDINALITY(data, 100)*/
                              data.record_date,
                              data.outlet_id,
                              data.outlet_ams_id,
                              data.unit_id,
                              data.unit_ams_id
                          from ams.inp_data_outlet data
                          where data.record_date = add_months(trunc(valRecordDate, 'MM'), -18 +i)
                              and data.position_code = AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV01
                              and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                              and data.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      ) oldo
                          on
                          (
                              oldo.outlet_id = newu.outlet_id
                          )
                      join
                      (
                          select
                              data.outlet_id,
                              data.outlet_ams_id,
                              data.unit_id,
                              data.unit_ams_id
                          from ams.inp_data_outlet data
                          where data.record_date = add_months(trunc(valRecordDate, 'MM'), -18 +i)
                              and data.position_code = AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV02
                              and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                              and data.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      ) oldu
                          on
                          (
                              oldu.unit_ams_id = oldo.unit_ams_id
                          )
                      where newu.unit_ams_id <> nvl(oldo.unit_ams_id, '')
                  ) upd
              on (
                  upd.outlet_ams_id = umdv.outlet_ams_id
                  )
              when matched then
                  update
                      set
                          umdv.umnp_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
                          umdv.umnp_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES,
                          umdv.umnp_outlet_id = upd.umnp_outlet_id,
                          umdv.umnp_outlet_ams_id = upd.umnp_outlet_ams_id,
                          umdv.umnp_unit_id = upd.umnp_unit_id,
                          umdv.umnp_unit_ams_id = upd.umnp_unit_ams_id,
                          umdv.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                          umdv.update_datetime = sysdate;
              commit;
            end if;
        end loop;

        /* Len danh sach du lieu chi tiet thang tien can xoa*/
        merge /*+ CARDINALITY(umnp, 100)*/
            into la_prom_mmxiii_umnp umnp
        using
            (
                select
                    tmp.outlet_id,
                    tmp.record_date
                from la_promotion_mmxiii tmp
                where tmp.record_date = trunc(valRecordDate, 'MM')
                    and tmp.umnp_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            ) upd
        on (
            trunc(valRecordDate, 'MM') = umnp.record_date
            and
            upd.outlet_id = umnp.umnp_outlet_id
            )
        when matched then
            update
                set umnp.umnp_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_DEL;
        commit;

        /* Xoa du lieu chi tiet thang tien truong ban*/
        loop
            delete la_prom_mmxiii_umnp umnp
            where umnp.record_date = trunc(valRecordDate, 'MM')
                and umnp.umnp_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_DEL
                and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        for i in 0..12
        loop
          if add_months(trunc(valRecordDate, 'MM'), -i)
                between var_from_date
                and var_to_date
            then
            /* Cac dai ly truc tiep lam viec trong tung thang*/
                insert into la_prom_mmxiii_umnp (
                    outlet_id,
                    outlet_ams_id,
                    record_date,
                    version_date,
                    outlet_name,
                    agency_id,
                    agency_ams_id,
                    agency_name,
                    unit_id,
                    unit_ams_id,
                    unit_name,
                    effective_date,
                    terminative_date,
                    umnp_be_paid,
                    umnp_be_executing,
                    umnp_outlet_id,
                    umnp_outlet_ams_id,
                    umnp_unit_id,
                    umnp_unit_ams_id,
                    umnp_data_date,
                    umnp_data_type,
                    umnp_period_fyp,
                    umnp_period_afis,
                    umnp_period_afif,
                    umnp_period_issu,
                    umnp_period_acti,
                    create_user,
                    update_user,
                    create_datetime,
                    update_datetime
                )
                select /*+ CARDINALITY(prom, 100)
                           CARDINALITY(outl, 100) */
                    outl.outlet_id,
                    outl.outlet_ams_id,
                    trunc(valRecordDate, 'MM'),
                    trunc(sysdate, 'DD'),
                    outl.outlet_name,
                    outl.agency_id,
                    outl.agency_ams_id,
                    outl.agency_name,
                    outl.unit_id,
                    outl.unit_ams_id,
                    outl.unit_name,
                    outl.effective_date,
                    outl.terminative_date,
                    case
                        when outl.terminative_date is not null then
                            AMS_MODL_PROM_MMXIII.BE_PAID_SPC
                        else
                            AMS_MODL_PROM_MMXIII.BE_PAID_DTL
                        end,
                    AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
                    prom.umnp_outlet_id,
                    prom.umnp_outlet_ams_id,
                    prom.umnp_unit_id,
                    prom.umnp_unit_ams_id,
                    add_months(trunc(valRecordDate, 'MM'), - i),
                    AMS_MODL_PROM_MMXIII.DATA_DIRE,
                    0,
                    0,
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
                        tmp.umnp_outlet_id,
                        tmp.umnp_outlet_ams_id,
                        tmp.umnp_unit_id,
                        tmp.umnp_unit_ams_id
                    from la_promotion_mmxiii tmp
                    where tmp.record_date = trunc(valRecordDate, 'MM')
                        and tmp.umnp_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                ) prom
                join
                (
                    select /*+ CARDINALITY(data, 100)*/
                        data.record_date,
                        data.outlet_id,
                        data.outlet_ams_id,
                        data.outlet_name,
                        data.agency_id,
                        data.agency_ams_id,
                        data.agency_name,
                        data.unit_id,
                        data.unit_ams_id,
                        data.unit_name,
                        data.effective_date,
                        data.terminative_date
                    from ams.inp_data_outlet data
                    where data.record_date = add_months(trunc(valRecordDate, 'MM'), - i)
                        and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                        and data.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                ) outl
                    on outl.unit_ams_id = prom.umnp_unit_ams_id;
                commit;

                /* Cac dai ly thuoc nhom phat trien lam viec trong tung thang*/
                insert into la_prom_mmxiii_umnp (
                    outlet_id,
                    outlet_ams_id,
                    record_date,
                    version_date,
                    outlet_name,
                    agency_id,
                    agency_ams_id,
                    agency_name,
                    unit_id,
                    unit_ams_id,
                    unit_name,
                    effective_date,
                    terminative_date,
                    umnp_be_paid,
                    umnp_be_executing,
                    umnp_outlet_id,
                    umnp_outlet_ams_id,
                    umnp_unit_id,
                    umnp_unit_ams_id,
                    umnp_data_date,
                    umnp_data_type,
                    umnp_period_fyp,
                    umnp_period_afis,
                    umnp_period_afif,
                    umnp_period_issu,
                    umnp_period_acti,
                    create_user,
                    update_user,
                    create_datetime,
                    update_datetime
                )
                select /*+ CARDINALITY(prom, 100) CARDINALITY(umdv, 100)
                           CARDINALITY(outl, 100) */
                    outl.outlet_id,
                    outl.outlet_ams_id,
                    trunc(valRecordDate, 'MM'),
                    trunc(sysdate, 'DD'),
                    outl.outlet_name,
                    outl.agency_id,
                    outl.agency_ams_id,
                    outl.agency_name,
                    outl.unit_id,
                    outl.unit_ams_id,
                    outl.unit_name,
                    outl.effective_date,
                    outl.terminative_date,
                    case
                        when outl.terminative_date is not null then
                            AMS_MODL_PROM_MMXIII.BE_PAID_SPC
                        else
                            AMS_MODL_PROM_MMXIII.BE_PAID_DTL
                        end,
                    AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
                    prom.umnp_outlet_id,
                    prom.umnp_outlet_ams_id,
                    prom.umnp_unit_id,
                    prom.umnp_unit_ams_id,
                    add_months(trunc(valRecordDate, 'MM'), - i),
                    AMS_MODL_PROM_MMXIII.DATA_INDI,
                    0,
                    0,
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
                        tmp.umnp_outlet_id,
                        tmp.umnp_outlet_ams_id,
                        tmp.umnp_unit_id,
                        tmp.umnp_unit_ams_id
                    from la_promotion_mmxiii tmp
                    where tmp.record_date = trunc(valRecordDate, 'MM')
                        and tmp.umnp_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                ) prom
                join
                (
                    select
                        tmp.unit_ams_id,
                        tmp.effective_date,
                        tmp.umnp_outlet_ams_id
                    from la_prom_mmxiii_umdv tmp
                    where tmp.record_date = trunc(valRecordDate, 'MM')
                        and tmp.umnp_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
                        and tmp.effective_date
                            /*Sua khoang thoi gian lay nhom tach ra*/
                            between var_from_date_dev
                            and var_to_date
                        --and add_months(trunc(valRecordDate, 'MM'), - i) >= tmp.effective_date
                ) umdv
                    on umdv.umnp_outlet_ams_id = prom.umnp_outlet_ams_id
                join
                (
                    select /*+ CARDINALITY(data, 100)*/
                        data.record_date,
                        data.outlet_id,
                        data.outlet_ams_id,
                        data.outlet_name,
                        data.agency_id,
                        data.agency_ams_id,
                        data.agency_name,
                        data.unit_id,
                        data.unit_ams_id,
                        data.unit_name,
                        data.effective_date,
                        data.terminative_date
                    from ams.inp_data_outlet data
                    where data.record_date = add_months(trunc(valRecordDate, 'MM'), - i)
                        and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                        and data.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                ) outl
                    on outl.unit_ams_id = umdv.unit_ams_id
                where add_months(trunc(valRecordDate, 'MM'), - i) >= umdv.effective_date;
                commit;
            end if;
        end loop;

        /* So lieu tong hop*/
        insert into la_prom_mmxiii_umnp (
            outlet_id,
            outlet_ams_id,
            record_date,
            version_date,
            outlet_name,
            effective_date,
            terminative_date,
            umnp_be_paid,
            umnp_be_executing,
            umnp_outlet_id,
            umnp_outlet_ams_id,
            umnp_unit_id,
            umnp_unit_ams_id,
            umnp_data_date,
            umnp_period_fyp,
            umnp_period_afis,
            umnp_period_afif,
            umnp_period_issu,
            umnp_period_acti,
            create_user,
            update_user,
            create_datetime,
            update_datetime
        )
        select umnp.outlet_id,
            umnp.outlet_ams_id,
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            max(umnp.outlet_name),
            max(umnp.effective_date),
            max(umnp.terminative_date),
            AMS_MODL_PROM_MMXIII.BE_PAID_YES,
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
            umnp.umnp_outlet_id,
            umnp.umnp_outlet_ams_id,
            umnp.umnp_unit_id,
            umnp.umnp_unit_ams_id,
            trunc(valRecordDate, 'MM'),
            0,
            0,
            0,
            0,
            0,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            sysdate,
            sysdate
        from la_prom_mmxiii_umnp umnp
        where umnp.record_date = trunc(valRecordDate, 'MM')
            and umnp.umnp_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            and umnp.umnp_be_paid in
                (
                    AMS_MODL_PROM_MMXIII.BE_PAID_DTL,
                    AMS_MODL_PROM_MMXIII.BE_PAID_SPC
                )
        group by umnp.outlet_id,
            umnp.outlet_ams_id,
            umnp.umnp_outlet_id,
            umnp.umnp_outlet_ams_id,
            umnp.umnp_unit_id,
            umnp.umnp_unit_ams_id;
        commit;
    end;

    procedure mmxiii_modl_umnp_data(valRecordDate date := null)
    is
       var_from_date date;
       var_to_date date;
    begin
       var_from_date := add_months(trunc(valRecordDate, 'YYYY'), -1);
       var_to_date := last_day(add_months(trunc(valRecordDate, 'YYYY'), + 10));
        -------------------------------------------------------------
        /* UNITS */
        -------------------------------------------------------------
        /* So nhom gian tiep*/
        merge /*+ CARDINALITY(prom, 100)*/
            into ams.la_promotion_mmxiii prom
        using
            (
                select
                    s.umnp_unit_ams_id,
                    nvl(sum(s.units), 0) umnp_numb_dev_unit
                from
                (
                    select /*+ CARDINALITY(data, 100)*/
                        umdv.umnp_unit_ams_id,
                        nvl(count(*), 0) units
                    from ams.la_prom_mmxiii_umdv umdv
                    where umdv.record_date = trunc(valRecordDate, 'MM')
                        and umdv.umnp_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
                        and umdv.umnp_unit_ams_id is not null
                    group by umdv.umnp_unit_ams_id

                    union all

                    select /*+ CARDINALITY(prom, 100)*/
                        prom.info_unit_ams_id umnp_unit_ams_id,
                        nvl(count(*), 0) units
                    from ams.la_promotion_mmxiii prom
                    where prom.record_date = trunc(valRecordDate, 'MM')
                        and prom.pump_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
                        and prom.pump_asmt = AMS_MODL_PROM_MMXIII.AMST_PROM
                    group by prom.info_unit_ams_id

                    union all

                    select /*+ CARDINALITY(dev, 100)
                               CARDINALITY(depo, 100)*/
                        dev.umnp_unit_ams_id umnp_unit_ams_id,
                        -nvl(count(*), 0) units
                    from
                    (
                        select
                            umdv.outlet_ams_id,
                            umdv.umnp_unit_ams_id
                        from ams.la_prom_mmxiii_umdv umdv
                        where umdv.record_date = trunc(valRecordDate, 'MM')
                            and umdv.umnp_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
                            and umdv.umnp_unit_ams_id is not null
                    ) dev
                    join
                    (
                        select
                            prom.outlet_ams_id
                        from ams.la_promotion_mmxiii prom
                        where prom.record_date = trunc(valRecordDate, 'MM')
                            and prom.umnp_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
                            and prom.umnp_asmt = AMS_MODL_PROM_MMXIII.AMST_DEPO
                    ) depo
                        on depo.outlet_ams_id = dev.outlet_ams_id
                    group by dev.umnp_unit_ams_id
                ) s
                group by s.umnp_unit_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = prom.record_date
            and
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = prom.umnp_be_executing
            and
            AMS_MODL_PROM_MMXIII.BE_PAID_YES = prom.umnp_be_paid
            and
            upd.umnp_unit_ams_id = prom.umnp_unit_ams_id
            )
        when matched then
            update
                set
                    prom.umnp_numb_dev_unit = upd.umnp_numb_dev_unit,
                    prom.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                    prom.update_datetime = sysdate;
        commit;

        -------------------------------------------------------------
        /* FYP */
        -------------------------------------------------------------
        /* Lay chi tiet FYP trong 12 thang gan nhat*/
        merge /*+ CARDINALITY(umnp, 100)*/
            into ams.la_prom_mmxiii_umnp umnp
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_ams_id,
                    data.record_date,
                    nvl(data.data_value, 0) period_fyp
                from ams.mod_data data
                where data.record_date
                        between var_from_date
                        and var_to_date
                    and data.module_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                    and data.data_code = AMS_MODL_PROM_MMXIII.DATA_CODE_FYP
            ) upd
        on (
            trunc(valRecordDate, 'MM') = umnp.record_date
            and
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = umnp.umnp_be_executing
            and
            umnp.umnp_be_paid in
                (
                    AMS_MODL_PROM_MMXIII.BE_PAID_DTL,
                    AMS_MODL_PROM_MMXIII.BE_PAID_SPC
                )
            and
            upd.outlet_ams_id = umnp.outlet_ams_id
            and
            upd.record_date = umnp.umnp_data_date
            )
        when matched then
            update
                set
                    umnp.umnp_period_fyp = upd.period_fyp,
                    umnp.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                    umnp.update_datetime = sysdate;
        commit;

        /* Tong cong FYP*/
        merge /*+ CARDINALITY(umnp, 100)*/
            into ams.la_prom_mmxiii_umnp umnp
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_ams_id,
                    nvl(sum(data.umnp_period_fyp), 0) period_fyp
                from ams.la_prom_mmxiii_umnp data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.umnp_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                    and data.umnp_be_paid in
                        (
                            AMS_MODL_PROM_MMXIII.BE_PAID_DTL,
                            AMS_MODL_PROM_MMXIII.BE_PAID_SPC
                        )
                    and data.umnp_data_date
                        between var_from_date
                        and var_to_date
                group by data.outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = umnp.record_date
            and
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = umnp.umnp_be_executing
            and
            AMS_MODL_PROM_MMXIII.BE_PAID_YES = umnp.umnp_be_paid
            and
            upd.outlet_ams_id = umnp.outlet_ams_id
            )
        when matched then
            update
                set
                    umnp.umnp_period_fyp = upd.period_fyp,
                    umnp.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                    umnp.update_datetime = sysdate;
        commit;

        /* FYP trong ky danh gia*/
        merge /*+ CARDINALITY(prom, 100)*/
            into ams.la_promotion_mmxiii prom
        using
            (
                select /*+ CARDINALITY(umnm, 100)*/
                    umnp.umnp_outlet_ams_id,
                    nvl(sum(umnp.umnp_period_fyp), 0) period_fyp
                from ams.la_prom_mmxiii_umnp umnp
                where umnp.record_date = trunc(valRecordDate, 'MM')
                    and umnp.umnp_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                    and umnp.umnp_be_paid in
                        (
                            AMS_MODL_PROM_MMXIII.BE_PAID_DTL,
                            AMS_MODL_PROM_MMXIII.BE_PAID_SPC
                        )
                    and umnp.outlet_ams_id <> umnp.umnp_outlet_ams_id
                    and umnp.umnp_data_date
                        between var_from_date
                        and var_to_date
                    and umnp.umnp_outlet_ams_id is not null
                group by umnp.umnp_outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = prom.record_date
            and
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = prom.umnp_be_executing
            and
            upd.umnp_outlet_ams_id = prom.umnp_outlet_ams_id
            )
        when matched then
            update
                set
                    prom.umnp_period_fyp = upd.period_fyp,
                    prom.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                    prom.update_datetime = sysdate;
        commit;

        -------------------------------------------------------------
        /* PR36 */
        -------------------------------------------------------------
        /* Lay chi tiet AFIS trong thang hien tai*/
        merge /*+ CARDINALITY(umnp, 100)*/
            into ams.la_prom_mmxiii_umnp umnp
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_ams_id,
                    data.record_date,
                    nvl(data.data_value, 0) umnp_period_afis
                from ams.mod_data data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.module_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                    and data.data_code = AMS_MODL_PROM_MMXIII.DATA_CODE_AFIS
            ) upd
        on (
            trunc(valRecordDate, 'MM') = umnp.record_date
            and
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = umnp.umnp_be_executing
            and
            AMS_MODL_PROM_MMXIII.BE_PAID_DTL = umnp.umnp_be_paid
            and
            AMS_MODL_PROM_MMXIII.DATA_DIRE = umnp.umnp_data_type
            and
            upd.outlet_ams_id = umnp.outlet_ams_id
            and
            least(trunc(valRecordDate, 'MM'), trunc(var_to_date, 'MM')) = umnp.umnp_data_date
            )
        when matched then
            update
                set umnp.umnp_period_afis = upd.umnp_period_afis,
                umnp.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                umnp.update_datetime = sysdate;
        commit;

        /* Lay chi tiet AFIF trong thang hien tai*/
        merge /*+ CARDINALITY(umnp, 100)*/
            into ams.la_prom_mmxiii_umnp umnp
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_ams_id,
                    data.record_date,
                    nvl(data.data_value, 0) umnp_period_afif
                from ams.mod_data data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.module_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                    and data.data_code = AMS_MODL_PROM_MMXIII.DATA_CODE_AFIF
            ) upd
        on (
            trunc(valRecordDate, 'MM') = umnp.record_date
            and
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = umnp.umnp_be_executing
            and
            AMS_MODL_PROM_MMXIII.BE_PAID_DTL = umnp.umnp_be_paid
            and
            AMS_MODL_PROM_MMXIII.DATA_DIRE = umnp.umnp_data_type
            and
            upd.outlet_ams_id = umnp.outlet_ams_id
            and
            least(trunc(valRecordDate, 'MM'), trunc(var_to_date, 'MM')) = umnp.umnp_data_date
            )
        when matched then
            update
                set umnp.umnp_period_afif = upd.umnp_period_afif,
                umnp.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                umnp.update_datetime = sysdate;
        commit;

        /* PR36 nhom truc tiep cua Truong nhom trong ky danh gia*/
        merge /*+ CARDINALITY(prom, 100)*/
            into ams.la_promotion_mmxiii prom
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.umnp_outlet_ams_id,
                    sum(data.umnp_period_afif) umnp_period_afif,
                    sum(data.umnp_period_afis) umnp_period_afis
                from ams.la_prom_mmxiii_umnp data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.umnp_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                    and data.umnp_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_DTL
                    and data.umnp_data_date = least(trunc(valRecordDate, 'MM'), trunc(var_to_date, 'MM'))
                    and data.umnp_data_type = AMS_MODL_PROM_MMXIII.DATA_DIRE
                group by data.umnp_outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = prom.record_date
            and
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = prom.umnp_be_executing
            and
            upd.umnp_outlet_ams_id = prom.outlet_ams_id
            )
        when matched then
            update
                set
                    prom.umnp_period_pr36 =
                          decode(nvl(upd.umnp_period_afis, 0),
                              0, 100,
                              round(nvl(upd.umnp_period_afif, 0) / nvl(upd.umnp_period_afis, 0) * 100, 2)),
                    prom.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                    prom.update_datetime = sysdate;
        commit;

        -------------------------------------------------------------
        /* ACTION */
        -------------------------------------------------------------
        /* Lay chi tiet hop dong phat hanh thuan tung thang*/
        merge /*+ CARDINALITY(umnp, 100)*/
            into ams.la_prom_mmxiii_umnp umnp
        using
            (
                select /*+ CARDINALITY(grou, 100)*/
                    grou.outlet_ams_id,
                    grou.record_date,
                    nvl(sum(grou.data_value), 0) period_issu
                from
                (
                    select /*+ CARDINALITY(data, 100)*/
                        data.outlet_ams_id,
                        data.record_date,
                        data.data_value
                    from ams.mod_data data
                    where data.record_date
                            between var_from_date
                            and var_to_date
                        and data.module_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                        and data.data_code = AMS_MODL_PROM_MMXIII.DATA_CODE_ISSU
                    union all
                    select /*+ CARDINALITY(data, 100)*/
                        data.outlet_ams_id,
                        data.record_date,
                        -data.data_value data_value
                    from ams.mod_data data
                    where data.record_date
                            between var_from_date
                            and var_to_date
                        and data.module_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                        and data.data_code = AMS_MODL_PROM_MMXIII.DATA_CODE_CANC
                ) grou
                group by grou.outlet_ams_id,
                    grou.record_date
            ) upd
        on (
            trunc(valRecordDate, 'MM') = umnp.record_date
            and
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = umnp.umnp_be_executing
            and
            AMS_MODL_PROM_MMXIII.BE_PAID_DTL = umnp.umnp_be_paid
            and
            AMS_MODL_PROM_MMXIII.DATA_DIRE = umnp.umnp_data_type
            and
            upd.outlet_ams_id = umnp.outlet_ams_id
            and
            upd.record_date = umnp.umnp_data_date
            )
        when matched then
            update
                set
                    umnp.umnp_period_issu = upd.period_issu,
                    umnp.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                    umnp.update_datetime = sysdate;
        commit;

        /* Xac dinh dai ly hoat dong trong tung thang*/
        update ams.la_prom_mmxiii_umnp umnp
        set umnp.umnp_period_acti = 1,
            umnp.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
            umnp.update_datetime = sysdate
        where umnp.record_date = trunc(valRecordDate, 'MM')
            and umnp.umnp_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            and umnp.umnp_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_DTL
            and umnp.umnp_data_type = AMS_MODL_PROM_MMXIII.DATA_DIRE
            and umnp.umnp_data_date
                between var_from_date
                and var_to_date
            and nvl(umnp.umnp_period_issu, 0) > 0;
        commit;

        /* Ty le hoat dong nhom truc tiep cua Truong nhom trong ky danh gia*/
        merge /*+ CARDINALITY(prom, 100)*/
            into ams.la_promotion_mmxiii prom
        using
            (
                select /*+ CARDINALITY(gro, 100)*/
                    gro.umnp_outlet_ams_id,
                    decode(count(*),
                        0, 0,
                        sum(nvl(gro.month_acti, 0))) period_acti
                from
                (
                    select
                        umnp.umnp_outlet_ams_id,
                        umnp.umnp_data_date,
                        decode(count(*),
                            0, 0,
                            sum(nvl(umnp.umnp_period_acti, 0))) month_acti
                    from ams.la_prom_mmxiii_umnp umnp
                    where umnp.record_date = trunc(valRecordDate, 'MM')
                        and umnp.umnp_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                        and umnp.umnp_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_DTL
                        and umnp.umnp_data_type = AMS_MODL_PROM_MMXIII.DATA_DIRE
                        and umnp.umnp_data_date
                            between var_from_date
                            and var_to_date
                        and (
                            umnp.terminative_date is null
                            or
                            umnp.terminative_date >= add_months(trunc(umnp.umnp_data_date, 'MM'), 1)
                        )
                    group by umnp.umnp_outlet_ams_id,
                        umnp.umnp_data_date
                ) gro
                group by gro.umnp_outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = prom.record_date
            and
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = prom.umnp_be_executing
            and
            upd.umnp_outlet_ams_id = prom.outlet_ams_id
            )
        when matched then
            update
                set
                    prom.umnp_period_acti = nvl(upd.period_acti, 0),
                    prom.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                    prom.update_datetime = sysdate;
        commit;
    end;

    procedure mmxiii_modl_umnp_asmt(valRecordDate date := null)
    is
    begin
        /* Chi tieu thang tien:
           UNITS: 3
           PERIOD FYP: 2.400.000.000
           PR36: 80
           ACTI: 80
           tham niem: 12 thang
           */

        /* 01/12/2013*/
        update la_promotion_mmxiii prom
        set
            prom.umnp_asmt = AMS_MODL_PROM_MMXIII.AMST_PROM,
            prom.umnp_effe_date = add_months(trunc(valRecordDate, 'MM'), 1),
            prom.umnp_effe_code = AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV04,
            prom.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
            prom.update_datetime = sysdate
        where prom.record_date = trunc(valRecordDate, 'MM')
            and prom.umnp_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            and prom.umnp_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
            and
            (
                prom.umnp_numb_dev_unit >= 3
                and
                prom.umnp_period_fyp >= 2400000000
                and
                prom.umnp_period_pr36 >= 80
                and
                prom.umnp_period_acti >= 80
                and
                prom.umnp_senr_by_months >=12
            )
            and prom.umnp_asmt = AMS_MODL_PROM_MMXIII.AMST_MAIN;
        commit;
    end;

    procedure mmxiii_modl_umnp_close(valRecordDate date := null)
    is
    begin
        update la_prom_mmxiii_umdv umdv
        set
            umdv.umnp_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_NO,
            umdv.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
            umdv.update_datetime = sysdate
        where umdv.record_date = trunc(valRecordDate, 'MM')
            and umdv.umnp_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES;
        commit;

        update la_prom_mmxiii_umnp umnp
        set
            umnp.umnp_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_NO,
            umnp.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
            umnp.update_datetime = sysdate
        where umnp.record_date = trunc(valRecordDate, 'MM')
            and umnp.umnp_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES;
        commit;

        update la_promotion_mmxiii prom
        set
            prom.umnp_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_NO,
            prom.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
            prom.update_datetime = sysdate
        where prom.record_date = trunc(valRecordDate, 'MM')
            and prom.umnp_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES;
        commit;
    end;

    /*
        Creater: Vu Duc Thong
        Date Create: 22/07/2013
        Version: 1.0
        Description: Duy tri ha bac truong ban
        Parameter:
            valRecordDate [date]: Kieu ngay duy tri, ha bac
         */
   /*
        Update: Vu Duc Thong
        Date Update: 29/11/2013
        Version: 1.1
        Description: Xet lai cap cua cac nhom chau
        Parameter:
            valRecordDate [date]: Kieu ngay duy tri, ha bac
         */

   /*
        Update: Vu Duc Thong
        Date Update: 26/12/2013
        Version: 1.2
        Description: Cập nhật thêm dltd của bản thân trưởng ban
        Parameter:
            valRecordDate [date]: Kieu ngay duy tri, ha bac
         */

    procedure mmxiii_modl_amnm(valRecordDate date := null)
    is
    begin
        /*if (
            AMS_CORE_MODULE.is_active(
                AMS_MODL_PROM_MMXIII.MMXIII_PROM_AMNM,
                trunc(valRecordDate, 'MM')
            ) = AMS_CORE_MODULE.IS_YES
        ) then*/
                AMS_MODL_PROM_MMXIII.mmxiii_modl_amnm_open(valRecordDate);
                AMS_MODL_PROM_MMXIII.mmxiii_modl_amnm_data(valRecordDate);
                AMS_MODL_PROM_MMXIII.mmxiii_modl_amnm_asmt(valRecordDate);
                AMS_MODL_PROM_MMXIII.mmxiii_modl_amnm_close(valRecordDate);
        --end if;
    end;

    procedure mmxiii_modl_amnm_open(valRecordDate date := null)
    is
      var_error_pos  number(8, 2) := 0;
      cursor cur_unit is
      select *
      from ams.la_prom_mmxiii_unit_amnm amnm
      where amnm.outlet_unit_level_ams_id is not null;

      cursor cur_agency is
      select *
      from ams.la_prom_mmxiii_unit_amnm amnm
      where amnm.outlet_unit_ams_id is not null;

      V_UNIT_AMS_ID varchar2(32) := null;
      V_OUTLET_AMS_ID varchar2(32) := null;
      V_AGENCY_AMS_ID varchar2(32) := null;

      var_from_date date;
      var_to_date date;
      var_senr_by_months date;
    begin
        var_from_date := trunc(valRecordDate, 'YYYY');
        var_to_date := trunc(valRecordDate, 'MM');
        var_senr_by_months := add_months(trunc(valRecordDate, 'YYYY'), 11);

        /* Cap nhat ngay hieu luc chuc vu*/
        merge /*+ CARDINALITY(prom, 100)*/
            into ams.la_promotion_mmxiii prom
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_ams_id,
                    data.position_date
                from ams.inp_data_outlet data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                    and data.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
            ) upd
        on (
            trunc(valRecordDate, 'MM') = prom.record_date
            and
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = prom.be_executing
            and
            AMS_MODL_PROM_MMXIII.BE_PAID_YES = prom.be_paid
            and
            AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV04 = prom.info_position_code
            and
            upd.outlet_ams_id = prom.outlet_ams_id
            )
        when matched then
            update
                set
                    prom.amnm_effective_date = upd.position_date,
                    prom.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                    prom.update_datetime = sysdate;
        commit;

        /* Len danh sach truong ban duoc xet duy tri chuc vu*/
        update ams.la_promotion_mmxiii prom
        set
            prom.amnm_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES,
            prom.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
            prom.amnm_outlet_id = prom.outlet_id,
            prom.amnm_outlet_ams_id = prom.outlet_ams_id,
            prom.amnm_agency_id = prom.info_agency_id,
            prom.amnm_agency_ams_id = prom.info_agency_ams_id,
            prom.amnm_senr_by_months = 0,
            prom.amnm_unts = 0,
            prom.amnm_period_fyp = 0,
            prom.amnm_period_agen_empl = 0,
            prom.amnm_period_pers_empl = 0,
            prom.amnm_period_acti = 0,
            prom.amnm_asmt = AMS_MODL_PROM_MMXIII.AMST_MAIN,
            prom.amnm_effe_date = null,
            prom.amnm_effe_code = null,
            prom.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
            prom.update_datetime = sysdate
        where prom.record_date = trunc(valRecordDate, 'MM')
            and prom.be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            and prom.info_position_code in (
                AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV04
            );
        commit;

        /* Loai bo cac truong hop loi du lieu*/
        update ams.la_promotion_mmxiii prom
        set
            prom.amnm_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_NO,
            prom.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_NO,
            prom.amnm_asmt = AMS_MODL_PROM_MMXIII.AMST_ERRO,
            prom.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
            prom.update_datetime = sysdate
        where prom.record_date = trunc(valRecordDate, 'MM')
            and prom.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            and prom.amnm_effective_date is null;
        commit;

        /* Cap nhat tham nien chuc vu*/
        update ams.la_promotion_mmxiii prom
        set
            prom.amnm_senr_by_months = round(
                months_between(
                    var_senr_by_months,
                    nvl(trunc(prom.amnm_effective_date, 'MM'), AMS_CORE_SYSTEM.DATE_MIN_VALUE)
                )) + 1,
            prom.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
            prom.update_datetime = sysdate
        where prom.record_date = trunc(valRecordDate, 'MM')
            and prom.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES;
        commit;

        /* Loai bo cac truong ban có tham nien chua du 12 thang*/
        update ams.la_promotion_mmxiii prom
        set
            prom.amnm_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_NO,
            prom.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_NO,
            prom.amnm_asmt = AMS_MODL_PROM_MMXIII.AMST_MAIN,
            prom.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
            prom.update_datetime = sysdate
        where prom.record_date = trunc(valRecordDate, 'MM')
            and prom.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            and prom.amnm_senr_by_months < 12;
        commit;

        /* Len danh sach du lieu chi tiet phat trien ban can xoa*/
        merge /*+ CARDINALITY(amdv, 100)*/
            into ams.la_prom_mmxiii_amdv amdv
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.amnm_outlet_id,
                    data.amnm_agency_ams_id,
                    data.record_date
                from ams.la_promotion_mmxiii data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            ) upd
        on (
            trunc(valRecordDate, 'MM') = amdv.record_date
            and
            upd.amnm_outlet_id = amdv.amnm_outlet_id
            )
        when matched then
            update
                set
                    amdv.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_DEL;
        commit;

        /* Xoa du lieu chi tiet phat trien ban*/
        loop
            delete ams.la_prom_mmxiii_amdv del
            where del.record_date = trunc(valRecordDate, 'MM')
                and del.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_DEL
                and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        /* Phat trien ban*/
        for i in 0..11
        loop
          if add_months(trunc(valRecordDate, 'MM'), -i)
                between var_from_date
                and var_to_date
          then
              insert into ams.la_prom_mmxiii_amdv (
                  agency_id,
                  agency_ams_id,
                  record_date,
                  version_date,
                  agency_name,
                  effective_date,
                  terminative_date,
                  amnm_be_paid,
                  amnm_be_executing,
                  amnm_data_date,
                  amnm_outlet_id,
                  amnm_outlet_ams_id,
                  amnm_agency_id,
                  amnm_agency_ams_id,
                  create_user,
                  update_user,
                  create_datetime,
                  update_datetime
              )
              select /*+ CARDINALITY(outl, 100) CARDINALITY(adev, 100)*/
                  adev.agency_id,
                  adev.agency_ams_id,
                  trunc(valRecordDate, 'MM'),
                  cast(trunc(sysdate, 'DD') as date),
                  adev.agency_name,
                  adev.position_date,
                  null,
                  AMS_MODL_PROM_MMXIII.BE_PAID_YES,
                  AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
                  add_months(trunc(valRecordDate, 'MM'), 0 - i),
                  outl.amnm_outlet_id,
                  outl.amnm_outlet_ams_id,
                  outl.amnm_agency_id,
                  outl.amnm_agency_ams_id,
                  AMS_CORE_SYSTEM.SYSTEM_USER,
                  AMS_CORE_SYSTEM.SYSTEM_USER,
                  sysdate,
                  sysdate
              from
              (
                  select
                      prom.amnm_outlet_id,
                      prom.amnm_outlet_ams_id,
                      prom.amnm_agency_id,
                      prom.amnm_agency_ams_id
                  from ams.la_promotion_mmxiii prom
                  where prom.record_date = trunc(valRecordDate, 'MM')
                      and prom.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                      and prom.amnm_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
              ) outl
              join
              (
                  select
                      data.outlet_id,
                      data.outlet_ams_id,
                      data.agency_id,
                      data.agency_ams_id,
                      data.agency_name,
                      data.position_date,
                      (
                          select max(tmp.agency_id)
                          from inp_data_outlet tmp
                          where tmp.record_date = add_months(trunc(data.position_date, 'MM'), -1)
                              and tmp.outlet_ams_id = data.outlet_ams_id
                              and tmp.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                              and tmp.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                              and tmp.position_code = AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV02
                      ) amnm_agency_id
                  from ams.inp_data_outlet data
                  where data.record_date = add_months(trunc(valRecordDate, 'MM'), 0 - i)
                      and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                      and data.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      and data.position_code = AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV04
                      and data.position_date >= var_from_date
              ) adev
                  on adev.amnm_agency_id = outl.amnm_agency_id
              where outl.amnm_outlet_ams_id <> adev.outlet_ams_id;
              commit;
           end if;
        end loop;

        /* Len danh sach du lieu chi tiet xet duy tri ban can xoa*/
        merge /*+ CARDINALITY(amnm, 100)*/
            into ams.la_prom_mmxiii_amnm amnm
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.amnm_agency_ams_id,
                    data.record_date
                from ams.la_promotion_mmxiii data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            ) upd
        on (
            trunc(valRecordDate, 'MM') = amnm.record_date
            and
            upd.amnm_agency_ams_id = amnm.amnm_agency_ams_id
            )
        when matched then
            update
                set
                    amnm.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_DEL;
        commit;

        /* Xoa du lieu chi tiet xet duy tri ban*/
        loop
            delete ams.la_prom_mmxiii_amnm del
            where del.record_date = trunc(valRecordDate, 'MM')
                and del.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_DEL
                and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        /* Du lieu chi tiet xet duy tri ban*/
        for i in 0..11
        loop
          if add_months(trunc(valRecordDate, 'MM'), -i)
                between var_from_date
                and var_to_date
          then
              /* Cac dai ly truc thuoc ban lam viec trong thang*/
              insert into ams.la_prom_mmxiii_amnm (
                  outlet_id,
                  outlet_ams_id,
                  record_date,
                  version_date,
                  outlet_name,
                  agency_id,
                  agency_ams_id,
                  agency_name,
                  unit_id,
                  unit_ams_id,
                  unit_name,
                  effective_date,
                  terminative_date,
                  employment_id,
                  employment_ams_id,
                  amnm_outlet_id,
                  amnm_outlet_ams_id,
                  amnm_agency_id,
                  amnm_agency_ams_id,
                  amnm_be_paid,
                  amnm_be_executing,
                  amnm_data_date,
                  amnm_period_fyp,
                  amnm_period_empl,
                  amnm_period_issu,
                  amnm_period_acti,
                  amnm_unts,
                  create_user,
                  update_user,
                  create_datetime,
                  update_datetime
              )
              select /*+ CARDINALITY(prom, 1000) CARDINALITY(outl, 100)*/
                  outl.outlet_id,
                  outl.outlet_ams_id,
                  trunc(valRecordDate, 'MM'),
                  cast(trunc(sysdate, 'DD') as date),
                  outl.outlet_name,
                  outl.agency_id,
                  outl.agency_ams_id,
                  outl.agency_name,
                  outl.unit_id,
                  outl.unit_ams_id,
                  outl.unit_name,
                  outl.effective_date,
                  outl.terminative_date,
                  null,
                  null,
                  prom.amnm_outlet_id,
                  prom.amnm_outlet_ams_id,
                  prom.amnm_agency_id,
                  prom.amnm_agency_ams_id,
                  AMS_MODL_PROM_MMXIII.BE_PAID_DTL,
                  AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
                  add_months(trunc(valRecordDate, 'MM'), -i),
                  0,
                  0,
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
                      tmp.amnm_outlet_id,
                      tmp.amnm_outlet_ams_id,
                      tmp.amnm_agency_id,
                      tmp.amnm_agency_ams_id
                  from ams.la_promotion_mmxiii tmp
                  where tmp.record_date = trunc(valRecordDate, 'MM')
                      and tmp.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
              ) prom
              join
              (
                  select
                      data.outlet_id,
                      data.outlet_ams_id,
                      data.outlet_name,
                      data.effective_date,
                      data.terminative_date,
                      data.agency_id,
                      data.agency_ams_id,
                      data.agency_name,
                      data.unit_id,
                      data.unit_ams_id,
                      data.unit_name
                  from ams.inp_data_outlet data
                  where data.record_date = add_months(trunc(valRecordDate, 'MM'), 0 - i)
                      and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                      and data.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      and (
                          data.terminative_date is null
                          or
                          data.terminative_date > (add_months(trunc(valRecordDate, 'MM'), 1 - i) - 1)
                      )
              ) outl
                  on outl.agency_ams_id = prom.amnm_agency_ams_id;
              commit;

              /* Cac dai ly truc thuoc ban tach ra lam viec trong thang*/
              insert into ams.la_prom_mmxiii_amnm (
                  outlet_id,
                  outlet_ams_id,
                  record_date,
                  version_date,
                  outlet_name,
                  agency_id,
                  agency_ams_id,
                  agency_name,
                  unit_id,
                  unit_ams_id,
                  unit_name,
                  effective_date,
                  terminative_date,
                  employment_id,
                  employment_ams_id,
                  amnm_outlet_id,
                  amnm_outlet_ams_id,
                  amnm_agency_id,
                  amnm_agency_ams_id,
                  amnm_be_paid,
                  amnm_be_executing,
                  amnm_data_date,
                  amnm_period_fyp,
                  amnm_period_empl,
                  amnm_period_issu,
                  amnm_period_acti,
                  amnm_unts,
                  create_user,
                  update_user,
                  create_datetime,
                  update_datetime
              )
              select /*+ CARDINALITY(prom, 100) CARDINALITY(adev, 100) CARDINALITY(outl, 100)*/
                  outl.outlet_id,
                  outl.outlet_ams_id,
                  trunc(valRecordDate, 'MM'),
                  cast(trunc(sysdate, 'DD') as date),
                  outl.outlet_name,
                  outl.agency_id,
                  outl.agency_ams_id,
                  outl.agency_name,
                  outl.unit_id,
                  outl.unit_ams_id,
                  outl.unit_name,
                  outl.effective_date,
                  outl.terminative_date,
                  null,
                  null,
                  prom.amnm_outlet_id,
                  prom.amnm_outlet_ams_id,
                  prom.amnm_agency_id,
                  prom.amnm_agency_ams_id,
                  AMS_MODL_PROM_MMXIII.BE_PAID_DTL,
                  AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
                  add_months(trunc(valRecordDate, 'MM'), -i),
                  0,
                  0,
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
                      tmp.amnm_outlet_id,
                      tmp.amnm_outlet_ams_id,
                      tmp.amnm_agency_id,
                      tmp.amnm_agency_ams_id
                  from ams.la_promotion_mmxiii tmp
                  where tmp.record_date = trunc(valRecordDate, 'MM')
                      and tmp.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
              ) prom
              join
              (
                  select
                      amdv.agency_id,
                      amdv.agency_ams_id,
                      amdv.amnm_outlet_id,
                      amdv.amnm_outlet_ams_id,
                      amdv.amnm_agency_id,
                      amdv.amnm_agency_ams_id
                  from ams.la_prom_mmxiii_amdv amdv
                  where amdv.record_date = trunc(valRecordDate, 'MM')
                      and amdv.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                      and amdv.amnm_data_date = add_months(trunc(valRecordDate, 'MM'), 0 - i)
              ) adev
                  on adev.amnm_outlet_ams_id = prom.amnm_outlet_ams_id
              join
              (
                  select
                      data.outlet_id,
                      data.outlet_ams_id,
                      data.outlet_name,
                      data.effective_date,
                      data.terminative_date,
                      data.agency_id,
                      data.agency_ams_id,
                      data.agency_name,
                      data.unit_id,
                      data.unit_ams_id,
                      data.unit_name
                  from ams.inp_data_outlet data
                  where data.record_date = add_months(trunc(valRecordDate, 'MM'), 0 - i)
                      and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                      and data.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      and (
                          data.terminative_date is null
                          or
                          data.terminative_date > (add_months(trunc(valRecordDate, 'MM'), 1 - i) - 1)
                      )
              ) outl
                  on outl.agency_ams_id = adev.agency_ams_id;
              commit;

              /* Cac dai ly truc thuoc ban nghi viec trong thang*/
              insert into la_prom_mmxiii_amnm (
                  outlet_id,
                  outlet_ams_id,
                  record_date,
                  version_date,
                  outlet_name,
                  agency_id,
                  agency_ams_id,
                  agency_name,
                  unit_id,
                  unit_ams_id,
                  unit_name,
                  effective_date,
                  terminative_date,
                  employment_id,
                  employment_ams_id,
                  amnm_outlet_id,
                  amnm_outlet_ams_id,
                  amnm_agency_id,
                  amnm_agency_ams_id,
                  amnm_be_paid,
                  amnm_be_executing,
                  amnm_data_date,
                  amnm_period_fyp,
                  amnm_period_empl,
                  amnm_period_issu,
                  amnm_period_acti,
                  amnm_unts,
                  create_user,
                  update_user,
                  create_datetime,
                  update_datetime
              )
              select /*+ CARDINALITY(prom, 100) CARDINALITY(outl, 100)*/
                  outl.outlet_id,
                  outl.outlet_ams_id,
                  trunc(valRecordDate, 'MM'),
                  cast(trunc(sysdate, 'DD') as date),
                  outl.outlet_name,
                  outl.agency_id,
                  outl.agency_ams_id,
                  outl.agency_name,
                  outl.unit_id,
                  outl.unit_ams_id,
                  outl.unit_name,
                  outl.effective_date,
                  outl.terminative_date,
                  null,
                  null,
                  prom.amnm_outlet_id,
                  prom.amnm_outlet_ams_id,
                  prom.amnm_agency_id,
                  prom.amnm_agency_ams_id,
                  AMS_MODL_PROM_MMXIII.BE_PAID_SPC,
                  AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
                  add_months(trunc(valRecordDate, 'MM'), -i),
                  0,
                  0,
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
                      tmp.amnm_outlet_id,
                      tmp.amnm_outlet_ams_id,
                      tmp.amnm_agency_id,
                      tmp.amnm_agency_ams_id
                  from ams.la_promotion_mmxiii tmp
                  where tmp.record_date = trunc(valRecordDate, 'MM')
                      and tmp.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
              ) prom
              join
              (
                  select
                      data.outlet_id,
                      data.outlet_ams_id,
                      data.outlet_name,
                      data.effective_date,
                      data.terminative_date,
                      data.agency_id,
                      data.agency_ams_id,
                      data.agency_name,
                      data.unit_id,
                      data.unit_ams_id,
                      data.unit_name
                  from ams.inp_data_outlet data
                  where data.record_date = add_months(trunc(valRecordDate, 'MM'), 0 - i)
                      and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                      and data.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      and (
                          data.terminative_date is not null
                          and
                          data.terminative_date
                              between add_months(trunc(valRecordDate, 'MM'), 0 - i)
                              and (add_months(trunc(valRecordDate, 'MM'), 1 - i) - 1)
                      )
              ) outl
                  on outl.agency_ams_id = prom.amnm_agency_ams_id;
              commit;

              /* Cac dai ly truc thuoc ban tach ra nghi viec trong thang*/
              insert into ams.la_prom_mmxiii_amnm (
                  outlet_id,
                  outlet_ams_id,
                  record_date,
                  version_date,
                  outlet_name,
                  agency_id,
                  agency_ams_id,
                  agency_name,
                  unit_id,
                  unit_ams_id,
                  unit_name,
                  effective_date,
                  terminative_date,
                  employment_id,
                  employment_ams_id,
                  amnm_outlet_id,
                  amnm_outlet_ams_id,
                  amnm_agency_id,
                  amnm_agency_ams_id,
                  amnm_be_paid,
                  amnm_be_executing,
                  amnm_data_date,
                  amnm_period_fyp,
                  amnm_period_empl,
                  amnm_period_issu,
                  amnm_period_acti,
                  amnm_unts,
                  create_user,
                  update_user,
                  create_datetime,
                  update_datetime
              )
              select /*+ CARDINALITY(prom, 100)
                         CARDINALITY(adev, 100)
                         CARDINALITY(outl, 100)*/
                  outl.outlet_id,
                  outl.outlet_ams_id,
                  trunc(valRecordDate, 'MM'),
                  cast(trunc(sysdate, 'DD') as date),
                  outl.outlet_name,
                  outl.agency_id,
                  outl.agency_ams_id,
                  outl.agency_name,
                  outl.unit_id,
                  outl.unit_ams_id,
                  outl.unit_name,
                  outl.effective_date,
                  outl.terminative_date,
                  null,
                  null,
                  prom.amnm_outlet_id,
                  prom.amnm_outlet_ams_id,
                  prom.amnm_agency_id,
                  prom.amnm_agency_ams_id,
                  AMS_MODL_PROM_MMXIII.BE_PAID_SPC,
                  AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
                  add_months(trunc(valRecordDate, 'MM'), -i),
                  0,
                  0,
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
                      tmp.amnm_outlet_id,
                      tmp.amnm_outlet_ams_id,
                      tmp.amnm_agency_id,
                      tmp.amnm_agency_ams_id
                  from ams.la_promotion_mmxiii tmp
                  where tmp.record_date = trunc(valRecordDate, 'MM')
                      and tmp.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
              ) prom
              join
              (
                  select
                      amdv.agency_id,
                      amdv.agency_ams_id,
                      amdv.amnm_outlet_id,
                      amdv.amnm_outlet_ams_id,
                      amdv.amnm_agency_id,
                      amdv.amnm_agency_ams_id
                  from ams.la_prom_mmxiii_amdv amdv
                  where amdv.record_date = trunc(valRecordDate, 'MM')
                      and amdv.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                      and amdv.amnm_data_date = add_months(trunc(valRecordDate, 'MM'), 0 - i)
              ) adev
                  on adev.amnm_outlet_ams_id = prom.amnm_outlet_ams_id
              join
              (
                  select
                      data.outlet_id,
                      data.outlet_ams_id,
                      data.outlet_name,
                      data.effective_date,
                      data.terminative_date,
                      data.agency_id,
                      data.agency_ams_id,
                      data.agency_name,
                      data.unit_id,
                      data.unit_ams_id,
                      data.unit_name
                  from ams.inp_data_outlet data
                  where data.record_date = add_months(trunc(valRecordDate, 'MM'), 0 - i)
                      and data.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                      and data.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                      and (
                          data.terminative_date is not null
                          and
                          data.terminative_date
                              between add_months(trunc(valRecordDate, 'MM'), 0 - i)
                              and (add_months(trunc(valRecordDate, 'MM'), 1 - i) - 1)
                      )
              ) outl
                  on outl.agency_ams_id = adev.agency_ams_id;
              commit;

              /* Update cap cua cac nhom va ti le*/
              merge /*+ CARDINALITY(amnm, 100)*/
                  into ams.la_prom_mmxiii_amnm amnm
              using
                  (
                      select /*+ CARDINALITY(tmp, 100)*/
                          tmp.record_date,
                          tmp.unit_ams_id,
                          tmp.umnm_unit_level,
                          tmp.umnm_unit_ratio
                      from ams.la_prom_mmxiii_unit_des_source tmp
                      where tmp.record_date = add_months(trunc(valRecordDate, 'MM'), 0 - i)
                  ) upd
              on (
                  trunc(valRecordDate, 'MM') = amnm.record_date
                  and
                  AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = amnm.amnm_be_executing
                  and
                  amnm.amnm_be_paid in
                      (
                          AMS_MODL_PROM_MMXIII.BE_PAID_DTL,
                          AMS_MODL_PROM_MMXIII.BE_PAID_SPC
                      )
                  and
                  amnm.unit_ams_id is not null
                  and
                  upd.unit_ams_id = amnm.unit_ams_id
                  and
                  upd.record_date = amnm.amnm_data_date
                  )
              when matched then
                  update
                      set
                          amnm.amnm_unit_level = upd.umnm_unit_level,
                          amnm.amnm_unit_ratio = upd.umnm_unit_ratio;
              commit;
           end if;
        end loop;


        /* Cap nhat dai ly tuyen dung*/
        merge /*+ CARDINALITY(amnm, 100)*/
            into ams.la_prom_mmxiii_amnm amnm
        using
            (
                select /*+ CARDINALITY(lha, 100)*/
                    lha.agent_id outlet_id,
                    max(lha.history_number) employment_id
                from ams.la_history_agent lha
                where lha.type_code = 'DLTD'
                    and lha.current_is = 'Y'
                group by lha.agent_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = amnm.record_date
            and
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = amnm.amnm_be_executing
            and
            upd.outlet_id = amnm.outlet_id
            )
        when matched then
            update
                set
                    amnm.employment_id = upd.employment_id,
                    amnm.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                    amnm.update_datetime = sysdate;
        commit;

        merge /*+ CARDINALITY(amnm, 100)*/
            into ams.la_prom_mmxiii_amnm amnm
        using
            (
                select /*+ CARDINALITY(mapp, 100)*/
                    mapp.outlet_id,
                    mapp.outlet_ams_id
                from ams.serv_outlet_mapping mapp
            ) upd
        on (
            trunc(valRecordDate, 'MM') = amnm.record_date
            and
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = amnm.amnm_be_executing
            and
            upd.outlet_id = amnm.employment_id
            )
        when matched then
            update
                set
                    amnm.employment_ams_id = upd.outlet_ams_id,
                    amnm.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                    amnm.update_datetime = sysdate;
        commit;

        /*Cập nhật thêm dltd đã chuyển ban của trưởng ban*/
        for p_empl in
          (
              select *
              from ams.la_promotion_mmxiii prom
              where prom.record_date = trunc(valRecordDate, 'MM')
                and prom.amnm_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
                and prom.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                and prom.amnm_agency_ams_id is not null
          )
        loop
            insert into ams.la_prom_mmxiii_amnm (
                outlet_id,
                outlet_ams_id,
                record_date,
                version_date,
                outlet_name,
                agency_id,
                agency_ams_id,
                agency_name,
                unit_id,
                unit_ams_id,
                unit_name,
                effective_date,
                terminative_date,
                employment_id,
                employment_ams_id,
                amnm_outlet_id,
                amnm_outlet_ams_id,
                amnm_agency_id,
                amnm_agency_ams_id,
                amnm_be_paid,
                amnm_be_executing,
                amnm_data_date,
                amnm_period_fyp,
                amnm_period_empl,
                amnm_period_issu,
                amnm_period_acti,
                amnm_unts,
                create_user,
                update_user,
                create_datetime,
                update_datetime
            )
            select
                inse.outlet_id,
                inse.outlet_ams_id,
                trunc(valRecordDate, 'MM'),
                cast(trunc(sysdate, 'DD') as date),
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                inse.effective_date,
                inse.terminative_date,
                null,
                null,
                inse.outlet_id,
                inse.outlet_ams_id,
                p_empl.amnm_agency_id,
                p_empl.amnm_agency_ams_id,
                AMS_MODL_PROM_MMXIII.BE_PAID_EMP,
                AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
                trunc(valRecordDate, 'MM'),
                0,
                0,
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
                        emplo.outlet_id,
                        emplo.outlet_ams_id,
                        emplo.effective_date,
                        emplo.terminative_date
                    from
                        (
                           select
                                outl.outlet_id,
                                outl.outlet_ams_id,
                                outl.effective_date,
                                outl.terminative_date
                           from
                               (
                                  select /*+ CARDINALITY(lha, 100)*/
                                      lha.agent_id outlet_id,
                                      lha.history_number employment_id
                                  from ams.la_history_agent lha
                                  where lha.type_code = 'DLTD'
                                    and lha.current_is = 'Y'
                                    and lha.history_number in
                                     (
                                        select max(amnm.amnm_outlet_id) amnm_outlet_id
                                        from ams.la_prom_mmxiii_amnm amnm
                                        where amnm.record_date = trunc(valRecordDate, 'MM')
                                          and amnm.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                                          and amnm.amnm_agency_ams_id = p_empl.amnm_agency_ams_id
                                        group by amnm.amnm_agency_ams_id
                                     )

                               ) empl
                            join
                            (
                                select /*+ CARDINALITY(outl, 100)*/
                                    outl.outlet_id,
                                    outl.outlet_ams_id,
                                    outl.effective_date,
                                    outl.terminative_date
                                    from ams.inp_data_outlet outl
                                    where outl.record_date = trunc(valRecordDate, 'MM')
                                        and outl.type_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                                        and outl.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                                        and outl.effective_date
                                            between add_months(trunc(valRecordDate, 'MM'), -11)
                                            and last_day(trunc(valRecordDate, 'MM'))
                                        and outl.terminative_date is null
                                 ) outl
                                    on outl.outlet_id = empl.outlet_id
                             ) emplo
                          minus
                          select
                               amnm.outlet_id,
                               amnm.outlet_ams_id,
                               max(amnm.effective_date) effective_date,
                               max(amnm.terminative_date) terminative_date
                          from ams.la_prom_mmxiii_amnm amnm
                          where amnm.record_date = trunc(valRecordDate, 'MM')
                            and amnm.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_PAID_YES
                            and amnm.amnm_agency_ams_id = p_empl.amnm_agency_ams_id
                          group by amnm.outlet_id,
                                   amnm.outlet_ams_id
                    ) inse;
                commit;
        end loop;

        /* Cap nhat dai ly tuyen dung*/
        merge /*+ CARDINALITY(amnm, 100)*/
            into ams.la_prom_mmxiii_amnm amnm
        using
            (
                select /*+ CARDINALITY(lha, 100)*/
                    lha.agent_id outlet_id,
                    max(lha.history_number) employment_id
                from ams.la_history_agent lha
                where lha.type_code = 'DLTD'
                    and lha.current_is = 'Y'
                group by lha.agent_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = amnm.record_date
            and
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = amnm.amnm_be_executing
            and
            AMS_MODL_PROM_MMXIII.BE_PAID_EMP = amnm.amnm_be_paid
            and
            upd.outlet_id = amnm.outlet_id
            )
        when matched then
            update
                set
                    amnm.employment_id = upd.employment_id,
                    amnm.amnm_outlet_id = upd.employment_id,
                    amnm.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                    amnm.update_datetime = sysdate;
        commit;

        merge /*+ CARDINALITY(amnm, 100)*/
            into ams.la_prom_mmxiii_amnm amnm
        using
            (
                select /*+ CARDINALITY(mapp, 100)*/
                    mapp.outlet_id,
                    mapp.outlet_ams_id
                from ams.serv_outlet_mapping mapp
            ) upd
        on (
            trunc(valRecordDate, 'MM') = amnm.record_date
            and
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = amnm.amnm_be_executing
            and
            AMS_MODL_PROM_MMXIII.BE_PAID_EMP = amnm.amnm_be_paid
            and
            upd.outlet_id = amnm.employment_id
            )
        when matched then
            update
                set
                    amnm.employment_ams_id = upd.outlet_ams_id,
                    amnm.amnm_outlet_ams_id = upd.outlet_ams_id,
                    amnm.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                    amnm.update_datetime = sysdate;
        commit;


        /* Cap nhat nhom chau*/
        insert into ams.la_prom_mmxiii_unit_amnm (
            outlet_ams_id,
            record_date,
            version_date,
            outlet_agency_ams_id,
            outlet_unit_ams_id,
            outlet_unit_level_ams_id,
            position_code,
            position_date,
            create_user,
            update_user,
            create_datetime,
            update_datetime
         )
         select distinct
            data.outlet_ams_id,
            trunc(valRecordDate, 'MM'),
            cast(trunc(sysdate, 'DD') as date),
            '',
            '',
            data.outlet_ams_id,
            data.position_code,
            data.position_date,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            sysdate,
            sysdate
         from ams.inp_data_outlet data
         where data.record_date = trunc(valRecordDate, 'MM')
            and data.position_date
                between var_from_date
                and var_to_date
            and data.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
            and data.position_code = AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV02;
         commit;

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
            and inp.record_date = trunc(valRecordDate, 'MM')
            and inp.position_code = AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV02
            and inp.outlet_ams_id is not null;
            exception
            when NO_DATA_FOUND
            then
            V_OUTLET_AMS_ID := null;
          end;

          update ams.la_prom_mmxiii_unit_amnm amnm
          set amnm.outlet_unit_ams_id = V_OUTLET_AMS_ID
          where amnm.outlet_unit_level_ams_id = p_unit.outlet_unit_level_ams_id;
          commit;

          V_UNIT_AMS_ID  := null;
          V_OUTLET_AMS_ID := null;
          commit;
        end loop;

        for p_agency in cur_agency
        loop
          begin
            select distinct data.agency_ams_id into V_AGENCY_AMS_ID
            from ams.inp_data_outlet data
            where data.outlet_ams_id = p_agency.outlet_unit_ams_id
            and data.record_date = trunc(valRecordDate, 'MM')
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
            and inp.record_date = trunc(valRecordDate, 'MM')
            and inp.position_code = AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV04
            and inp.outlet_ams_id is not null;
            exception
            when NO_DATA_FOUND
            then
            V_OUTLET_AMS_ID := null;
          end;

          update ams.la_prom_mmxiii_unit_amnm amnm
          set amnm.outlet_agency_ams_id = V_OUTLET_AMS_ID
          where amnm.outlet_unit_ams_id = p_agency.outlet_unit_ams_id;
          commit;

          V_AGENCY_AMS_ID  := null;
          V_OUTLET_AMS_ID := null;
        end loop;

        /* So lieu tong hop*/
        insert into ams.la_prom_mmxiii_amnm (
            outlet_id,
            outlet_ams_id,
            record_date,
            version_date,
            outlet_name,
            effective_date,
            terminative_date,
            employment_id,
            employment_ams_id,
            amnm_outlet_id,
            amnm_outlet_ams_id,
            amnm_agency_id,
            amnm_agency_ams_id,
            amnm_be_paid,
            amnm_be_executing,
            amnm_data_date,
            amnm_period_fyp,
            amnm_period_empl,
            amnm_period_issu,
            amnm_period_acti,
            amnm_unts,
            create_user,
            update_user,
            create_datetime,
            update_datetime
        )
        select amnm.outlet_id,
            amnm.outlet_ams_id,
            trunc(valRecordDate, 'MM'),
            cast(trunc(sysdate, 'DD') as date),
            max(amnm.outlet_name),
            max(amnm.effective_date),
            max(amnm.terminative_date),
            max(amnm.employment_id),
            max(amnm.employment_ams_id),
            amnm.amnm_outlet_id,
            amnm.amnm_outlet_ams_id,
            amnm.amnm_agency_id,
            amnm.amnm_agency_ams_id,
            AMS_MODL_PROM_MMXIII.BE_PAID_YES,
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES,
            trunc(valRecordDate, 'MM'),
            0,
            0,
            0,
            0,
            0,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            sysdate,
            sysdate
        from ams.la_prom_mmxiii_amnm amnm
        where amnm.record_date = trunc(valRecordDate, 'MM')
            and amnm.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            and amnm.amnm_be_paid in
                (
                    AMS_MODL_PROM_MMXIII.BE_PAID_DTL,
                    AMS_MODL_PROM_MMXIII.BE_PAID_SPC
                )
        group by amnm.outlet_id,
            amnm.outlet_ams_id,
            amnm.amnm_outlet_id,
            amnm.amnm_outlet_ams_id,
            amnm.amnm_agency_id,
            amnm.amnm_agency_ams_id;
        commit;
    end;

    procedure mmxiii_modl_amnm_data(valRecordDate date := null)
    is
       var_to_date date;
       var_from_date date;
       var_to_empl_date date;
    begin
       var_from_date := trunc(valRecordDate, 'YYYY');
       var_to_date := trunc(valRecordDate, 'MM');
       var_to_empl_date := last_day(trunc(valRecordDate, 'MM'));

       /* Tinh nhom chau cua Truong ban*/
        delete from ams.la_prom_mmxiii_unit_amnm amnm
        where amnm.outlet_agency_ams_id is null;
        commit;

        /* Cap nhat so nhom chau cua Truong ban*/
        update ams.la_promotion_mmxiii prom
        set
              prom.amnm_grand_unts = 0
        where prom.record_date = trunc(valRecordDate, 'MM')
          and prom.amnm_be_paid = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
          and prom.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES;
        commit;


        merge /*+ CARDINALITY(prom, 100)*/
            into ams.la_promotion_mmxiii prom
        using
            (
                select /*+ CARDINALITY(grou, 100)*/
                    grou.outlet_agency_ams_id,
                    nvl(count(grou.outlet_unit_level_ams_id), 0) grand_unts
                from ams.la_prom_mmxiii_unit_amnm grou
                where grou.outlet_agency_ams_id is not null
                group by grou.outlet_agency_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = prom.record_date
            and
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = prom.amnm_be_executing
            and
            AMS_MODL_PROM_MMXIII.BE_PAID_YES = prom.amnm_be_paid
            and
            upd.outlet_agency_ams_id = prom.outlet_ams_id
            )
        when matched then
            update
                set prom.amnm_grand_unts = nvl(upd.grand_unts, 0),
                prom.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                prom.update_datetime = sysdate;
        commit;

        -------------------------------------------------------------
        /* UNITS */
        -------------------------------------------------------------
        /* Cap nhat so luong quan ly
         [-] cac truong nhom khong duy tri chuc vu
         [+] cac tien truong nhom thang tien*/
        merge /*+ CARDINALITY(prom, 100)*/
            into ams.la_promotion_mmxiii prom
        using
            (
                select /*+ CARDINALITY(grou, 100)*/
                    grou.amnm_agency_ams_id,
                    nvl(sum(grou.units), 0) unts
                from
                (
                    select
                        tmp.info_agency_ams_id amnm_agency_ams_id,
                        1 units
                    from ams.la_promotion_mmxiii tmp
                    where tmp.record_date = trunc(valRecordDate, 'MM')
                        and tmp.pump_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
                        and tmp.pump_asmt = AMS_MODL_PROM_MMXIII.AMST_PROM
                        and tmp.info_agency_ams_id is not null

                    union all

                    select
                        tmp.info_agency_ams_id amnm_agency_ams_id,
                        -1 units
                    from ams.la_promotion_mmxiii tmp
                    where tmp.record_date = trunc(valRecordDate, 'MM')
                        and tmp.umnm_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
                        and tmp.umnm_asmt = AMS_MODL_PROM_MMXIII.AMST_DEPO
                        and tmp.info_agency_ams_id is not null

                    union all

                    select
                        bran.amnm_agency_ams_id,
                        nvl(count(*), 0) units
                    from
                    (
                        select
                            tmp.amnm_agency_ams_id,
                            tmp.unit_ams_id
                        from ams.la_prom_mmxiii_amnm tmp
                        where tmp.record_date = trunc(valRecordDate, 'MM')
                            and tmp.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                            and tmp.amnm_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_DTL
                            and tmp.amnm_data_date = trunc(valRecordDate, 'MM')
                            and tmp.unit_ams_id is not null
                        group by tmp.amnm_agency_ams_id,
                            tmp.unit_ams_id
                    ) bran
                    group by bran.amnm_agency_ams_id
                ) grou
                group by grou.amnm_agency_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = prom.record_date
            and
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = prom.amnm_be_executing
            and
            AMS_MODL_PROM_MMXIII.BE_PAID_YES = prom.amnm_be_paid
            and
            upd.amnm_agency_ams_id = prom.amnm_agency_ams_id
            )
        when matched then
            update
                set prom.amnm_unts = upd.unts,
                prom.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                prom.update_datetime = sysdate;
        commit;

        /* Tinh them ban than nhom truc tiep*/
        update ams.la_promotion_mmxiii prom
        set
            prom.amnm_unts = nvl(prom.amnm_unts, 0) + 1,
            prom.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
            prom.update_datetime = sysdate
        where prom.record_date = trunc(valRecordDate, 'MM')
            and prom.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES;
        commit;

        /*Tru di cac nhom chau cua truong ban */
        update ams.la_promotion_mmxiii prom
        set
            prom.amnm_unts = nvl(prom.amnm_unts, 0) - nvl(prom.amnm_grand_unts,0),
            prom.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
            prom.update_datetime = sysdate
        where prom.record_date = trunc(valRecordDate, 'MM')
            and prom.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES;
        commit;

        -------------------------------------------------------------
        /* FYP */
        -------------------------------------------------------------
        /* Lay chi tiet FYP trong 12 thang gan nhat*/
        merge /*+ CARDINALITY(amnm, 100)*/
            into ams.la_prom_mmxiii_amnm amnm
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_ams_id,
                    data.record_date,
                    nvl(data.data_value, 0) period_fyp
                from ams.mod_data data
                where data.record_date
                        between var_from_date
                        and var_to_date
                    and data.module_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                    and data.data_code = AMS_MODL_PROM_MMXIII.DATA_CODE_FYP
            ) upd
        on (
            trunc(valRecordDate, 'MM') = amnm.record_date
            and
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = amnm.amnm_be_executing
            and
            amnm.amnm_be_paid in
                (
                    AMS_MODL_PROM_MMXIII.BE_PAID_DTL,
                    AMS_MODL_PROM_MMXIII.BE_PAID_SPC
                )
            and
            upd.outlet_ams_id = amnm.outlet_ams_id
            and
            upd.record_date = amnm.amnm_data_date
            )
        when matched then
            update
                set
                    amnm.amnm_period_fyp = upd.period_fyp,
                    amnm.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                    amnm.update_datetime = sysdate;
        commit;

        /*Cap nhat FYP sau khi dieu chinh nhan voi he so 1/n*/
        update ams.la_prom_mmxiii_amnm amnm
        set
            amnm.amnm_period_fyp_calc =  nvl(amnm.amnm_period_fyp, 0) * nvl(amnm.amnm_unit_ratio, 100) / 100
        where amnm.record_date = trunc(valRecordDate, 'MM')
            and amnm.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            and amnm.amnm_be_paid in
                (
                    AMS_MODL_PROM_MMXIII.BE_PAID_DTL,
                    AMS_MODL_PROM_MMXIII.BE_PAID_SPC
                );
        commit;

        /* Tong cong FYP*/
        merge /*+ CARDINALITY(amnm, 100)*/
            into ams.la_prom_mmxiii_amnm amnm
        using
            (
                select /*+ CARDINALITY(data, 100)*/
                    data.outlet_ams_id,
                    nvl(sum(data.amnm_period_fyp_calc), 0) period_fyp
                from ams.la_prom_mmxiii_amnm data
                where data.record_date = trunc(valRecordDate, 'MM')
                    and data.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                    and data.amnm_be_paid in
                        (
                            AMS_MODL_PROM_MMXIII.BE_PAID_DTL,
                            AMS_MODL_PROM_MMXIII.BE_PAID_SPC
                        )
                    and data.amnm_data_date
                        between var_from_date
                        and var_to_date
                group by data.outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = amnm.record_date
            and
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = amnm.amnm_be_executing
            and
            AMS_MODL_PROM_MMXIII.BE_PAID_YES = amnm.amnm_be_paid
            and
            upd.outlet_ams_id = amnm.outlet_ams_id
            )
        when matched then
            update
                set
                    amnm.amnm_period_fyp = upd.period_fyp,
                    amnm.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                    amnm.update_datetime = sysdate;
        commit;

        /* FYP ban trong ky danh gia*/
        merge /*+ CARDINALITY(prom, 100)*/
            into la_promotion_mmxiii prom
        using
            (
                select /*+ CARDINALITY(amnm, 100)*/
                    amnm.amnm_agency_ams_id,
                    nvl(sum(amnm.amnm_period_fyp_calc), 0) period_fyp
                from ams.la_prom_mmxiii_amnm amnm
                where amnm.record_date = trunc(valRecordDate, 'MM')
                    and amnm.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                    and amnm.amnm_be_paid in
                        (
                            AMS_MODL_PROM_MMXIII.BE_PAID_DTL,
                            AMS_MODL_PROM_MMXIII.BE_PAID_SPC
                        )
                    and amnm.outlet_ams_id <> amnm.amnm_outlet_ams_id
                    and amnm.amnm_data_date
                        between var_from_date
                        and var_to_date
                    and amnm.amnm_agency_ams_id is not null
                group by amnm.amnm_agency_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = prom.record_date
            and
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = prom.amnm_be_executing
            and
            upd.amnm_agency_ams_id = prom.amnm_agency_ams_id
            )
        when matched then
            update
                set
                    prom.amnm_period_fyp = upd.period_fyp,
                    prom.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                    prom.update_datetime = sysdate;
        commit;

        -------------------------------------------------------------
        /* EMPL */
        -------------------------------------------------------------
        /* Dai ly moi tuyen thuan trong ky*/
        update ams.la_prom_mmxiii_amnm amnm
        set
            amnm.amnm_period_empl = 1,
            amnm.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
            amnm.update_datetime = sysdate
        where amnm.record_date = trunc(valRecordDate, 'MM')
            and amnm.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            and amnm.amnm_be_paid in
                 (
                   AMS_MODL_PROM_MMXIII.BE_PAID_YES,
                   AMS_MODL_PROM_MMXIII.BE_PAID_EMP
                 )
            and amnm.outlet_ams_id <> amnm.amnm_outlet_ams_id
            and amnm.effective_date
                between var_from_date
                and var_to_empl_date
            and amnm.terminative_date is null;
        commit;

        /* Tuyen thuan trong ky danh gia*/
        merge /*+ CARDINALITY(prom, 100)*/
            into la_promotion_mmxiii prom
        using
            (
                select /*+ CARDINALITY(amnm, 100)*/
                    amnm.amnm_agency_ams_id,
                    nvl(sum(amnm.amnm_period_empl), 0) period_empl
                from ams.la_prom_mmxiii_amnm amnm
                where amnm.record_date = trunc(valRecordDate, 'MM')
                    and amnm.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                    and amnm.amnm_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
                    and amnm.outlet_ams_id <> amnm.amnm_outlet_ams_id
                    and amnm.amnm_agency_ams_id is not null
                group by amnm.amnm_agency_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = prom.record_date
            and
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = prom.amnm_be_executing
            and
            upd.amnm_agency_ams_id = prom.amnm_agency_ams_id
            )
        when matched then
            update
                set
                    prom.amnm_period_agen_empl = upd.period_empl,
                    prom.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                    prom.update_datetime = sysdate;
        commit;

        /* Tuyen thuan do ban than Truong ban*/
        merge /*+ CARDINALITY(prom, 100)*/
            into ams.la_promotion_mmxiii prom
        using
            (
                select /*+ CARDINALITY(amnm, 100)*/
                    amnm.amnm_outlet_ams_id,
                    nvl(sum(amnm.amnm_period_empl), 0) period_pers_empl
                from ams.la_prom_mmxiii_amnm amnm
                where amnm.record_date = trunc(valRecordDate, 'MM')
                    and amnm.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                    and amnm.amnm_be_paid in
                        (
                          AMS_MODL_PROM_MMXIII.BE_PAID_YES,
                          AMS_MODL_PROM_MMXIII.BE_PAID_EMP
                        )
                    and amnm.employment_ams_id = amnm.amnm_outlet_ams_id
                    and amnm.amnm_outlet_ams_id is not null
                group by amnm.amnm_outlet_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = prom.record_date
            and
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = prom.amnm_be_executing
            and
            upd.amnm_outlet_ams_id = prom.amnm_outlet_ams_id
            )
        when matched then
            update
                set
                prom.amnm_period_pers_empl = upd.period_pers_empl,
                prom.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                prom.update_datetime = sysdate;
        commit;

        -------------------------------------------------------------
        /* ACTION */
        -------------------------------------------------------------
        /* Lay chi tiet hop dong phat hanh thuan tung thang*/
        merge /*+ CARDINALITY(amnm, 100)*/
            into ams.la_prom_mmxiii_amnm amnm
        using
            (
                select /*+ CARDINALITY(grou, 100)*/
                    grou.outlet_ams_id,
                    grou.record_date,
                    nvl(sum(grou.data_value), 0) period_issu
                from
                (
                    select
                        data.outlet_ams_id,
                        data.record_date,
                        data.data_value
                    from ams.mod_data data
                    where data.record_date
                            between var_from_date
                            and var_to_date
                        and data.module_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                        and data.data_code = AMS_MODL_PROM_MMXIII.DATA_CODE_ISSU
                    union all
                    select
                        data.outlet_ams_id,
                        data.record_date,
                        -data.data_value data_value
                    from mod_data data
                    where data.record_date
                            between var_from_date
                            and var_to_date
                        and data.module_code = AMS_MODL_PROM_MMXIII.MODULE_CODE_MAIN
                        and data.data_code = AMS_MODL_PROM_MMXIII.DATA_CODE_CANC
                ) grou
                group by grou.outlet_ams_id,
                    grou.record_date
            ) upd
        on (
            trunc(valRecordDate, 'MM') = amnm.record_date
            and
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = amnm.amnm_be_executing
            and
            amnm.amnm_be_paid in
                (
                    AMS_MODL_PROM_MMXIII.BE_PAID_DTL
                )
            and
            upd.outlet_ams_id = amnm.outlet_ams_id
            and
            upd.record_date = amnm.amnm_data_date
            )
        when matched then
            update
                set amnm.amnm_period_issu = upd.period_issu,
                amnm.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                amnm.update_datetime = sysdate;
        commit;

        /* Xac dinh dai ly hoat dong trong tung thang*/
        update ams.la_prom_mmxiii_amnm amnm
        set amnm.amnm_period_acti = 1,
            amnm.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
            amnm.update_datetime = sysdate
        where amnm.record_date = trunc(valRecordDate, 'MM')
            and amnm.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            and amnm.amnm_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_DTL
            and amnm.amnm_data_date
                between var_from_date
                and var_to_date
            and nvl(amnm.amnm_period_issu, 0) > 0;
        commit;

        /* Ty le hoat dong cua ban trong ky danh gia*/
        merge /*+ CARDINALITY(prom, 100)*/
            into ams.la_promotion_mmxiii prom
        using
            (
                select /*+ CARDINALITY(gro, 100)*/
                    gro.amnm_agency_ams_id,
                    decode(count(*),
                        0, 100,
                        round(sum(nvl(gro.month_acti, 0)) / count(*), 2)) period_acti
                from
                (
                    select /*+ CARDINALITY(amnm, 100)*/
                        amnm.amnm_agency_ams_id,
                        amnm.amnm_data_date,
                        decode(count(*),
                            0, 100,
                            round(sum(nvl(amnm.amnm_period_acti, 0)) / count(*) * 100, 2)) month_acti
                    from ams.la_prom_mmxiii_amnm amnm
                    where amnm.record_date = trunc(valRecordDate, 'MM')
                        and amnm.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
                        and amnm.amnm_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_DTL
                        and amnm.amnm_data_date
                            between var_from_date
                            and var_to_date
                        and (
                            amnm.terminative_date is null
                            or
                            amnm.terminative_date >= add_months(trunc(amnm.amnm_data_date, 'MM'), 1)
                        )
                        and amnm.amnm_agency_ams_id is not null
                    group by amnm.amnm_agency_ams_id,
                        amnm.amnm_data_date
                ) gro
                group by gro.amnm_agency_ams_id
            ) upd
        on (
            trunc(valRecordDate, 'MM') = prom.record_date
            and
            AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES = prom.amnm_be_executing
            and
            upd.amnm_agency_ams_id = prom.amnm_agency_ams_id
            )
        when matched then
            update
                set prom.amnm_period_acti = nvl(upd.period_acti, 0),
                prom.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                prom.update_datetime = sysdate;
        commit;
    end;

    procedure mmxiii_modl_amnm_asmt(valRecordDate date := null)
    is
       var_effe_date date;
    begin
       var_effe_date := add_months(trunc(valRecordDate, 'YYYY'), 12);

        /* Chi tieu duy tri:
           SENIORITY: 12 thang
           UNITS: 3
           PERIOD FYP: 1.800.000.000
           AGENCY EMPL: 15
           PERSONAL EMPL: 5
           Nhom chau: 1
           ACTI: 28*/

        /* 01/01/2014*/
        update ams.la_promotion_mmxiii prom
        set
            prom.amnm_asmt = AMS_MODL_PROM_MMXIII.AMST_DEPO,
            prom.amnm_effe_date = var_effe_date,
            prom.amnm_effe_code = AMS_MODL_PROM_MMXIII.POSITION_CODE_MMXIII_CV02,
            prom.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
            prom.update_datetime = sysdate
        where prom.record_date = trunc(valRecordDate, 'MM')
            and prom.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES
            and prom.amnm_be_paid = AMS_MODL_PROM_MMXIII.BE_PAID_YES
            and
            (
                prom.amnm_unts < 3
                or
                prom.amnm_period_fyp < 1800000000
                or
                prom.amnm_period_agen_empl < 15
                or
                prom.amnm_period_pers_empl < 5
                or
                prom.amnm_period_acti < 28
                or
                prom.amnm_grand_unts < 1
            )
            and prom.amnm_asmt = AMS_MODL_PROM_MMXIII.AMST_MAIN;
        commit;
    end;

    procedure mmxiii_modl_amnm_close(valRecordDate date := null)
    is
    begin
        /* */
        update ams.la_prom_mmxiii_amdv amdv
        set
            amdv.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_NO,
            amdv.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
            amdv.update_datetime = sysdate
        where amdv.record_date = trunc(valRecordDate, 'MM')
            and amdv.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES;
        commit;

        /* */
        update ams.la_prom_mmxiii_amnm amnm
        set
            amnm.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_NO,
            amnm.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
            amnm.update_datetime = sysdate
        where amnm.record_date = trunc(valRecordDate, 'MM')
            and amnm.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES;
        commit;

        /* */
        update ams.la_promotion_mmxiii prom
        set
            prom.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_NO,
            prom.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
            prom.update_datetime = sysdate
        where prom.record_date = trunc(valRecordDate, 'MM')
            and prom.amnm_be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES;
        commit;

        /* */
        delete from ams.la_prom_mmxiii_unit_amnm;
        commit;
    end;

    procedure mmxiii_modl_close(valRecordDate date := null)
    is
        var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        /* */
        update ams.la_promotion_mmxiii prom
        set
            prom.be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_NO,
            prom.update_user = AMS_MODL_PROM_MMXIII.SYSTEM_USER,
            prom.update_datetime = sysdate
        where prom.record_date = trunc(valRecordDate, 'MM')
            and prom.be_executing = AMS_MODL_PROM_MMXIII.BE_EXECUTING_YES;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'mmxiii_modl_close', ' da chay xong tat ca');
    exception
        when others then
            rollback;
            life_agency_log.write_log(1000,
                'mmxiii_modl_exp: loi thu tuc ' || to_char(valRecordDate, 'dd/mm/yyyy') || ' vi tri: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
    end;

end AMS_MODL_PROM_MMXIII;
/
