create or replace package ams.AMS_MODL_DATA_BVLIFE is

    MODULE_CODE_MAIN VARCHAR2(16) := 'MAIN';
    MODULE_CODE_PROM VARCHAR2(16) := 'PROM';
    MODULE_CODE_COMP VARCHAR2(16) := 'COMP';

    APPS_CODE_UNAP VARCHAR2(16) := 'UNAP';
    APPS_CODE_CANC VARCHAR2(16) := 'CANC';
    APPS_CODE_APPL VARCHAR2(16) := 'APPL';
    APPS_CODE_RFND VARCHAR2(16) := 'RFND';
    APPS_CODE_ERRO VARCHAR2(16) := 'ERRO';

    TRANS_CODE_INIT VARCHAR2(16) := 'INIT';
    TRANS_CODE_CANC VARCHAR2(16) := 'CANC';
    TRANS_CODE_FREQ VARCHAR2(16) := 'FREQ';
    TRANS_CODE_LOAN VARCHAR2(16) := 'LOAN';
    TRANS_CODE_EXTR VARCHAR2(16) := 'EXTR';

    POLYC_CODE_INIT VARCHAR2(16) := 'INIT';
    POLYC_CODE_EFFE VARCHAR2(16) := 'EFFE';
    POLYC_CODE_PROC VARCHAR2(16) := 'PROC';
    POLYC_CODE_CANC VARCHAR2(16) := 'CANC';
    POLYC_CODE_TERM VARCHAR2(16) := 'TERM';
    POLYC_CODE_EXIT VARCHAR2(16) := 'EXIT';

    procedure main(valRecordDate date := null,
        valCompanyBvlifeID varchar2 := null);

    procedure promotion(valRecordDate date := null,
        valCompanyBvlifeID varchar2 := null);

    procedure bussiness(valRecordDate date := null,
        valCompanyBvlifeID varchar2 := null);

    procedure get_app(valRecordDate date := null,
        valCompanyBvlifeID varchar2 := null,
        valTypeOfData varchar2 := null,
        valMonths number := 0);

    procedure get_comm(valRecordDate date := null,
        valCompanyBvlifeID varchar2 := null,
        valTypeOfData varchar2 := null);

    procedure get_fyp(valRecordDate date := null,
        valCompanyBvlifeID varchar2 := null,
        valTypeOfData varchar2 := null);

    procedure get_policy(valRecordDate date := null,
        valCompanyBvlifeID varchar2 := null,
        valTypeOfData varchar2 := null);

end AMS_MODL_DATA_BVLIFE;
/
create or replace package body ams.AMS_MODL_DATA_BVLIFE is

    procedure main(valRecordDate date := null,
        valCompanyBvlifeID varchar2 := null)
    is
        var_query varchar(4096) := '';
    begin
        /* Xoa du lieu COMM trong bang mod_data_bvltrans*/
        loop
            delete mod_data_bvlcomms del
            where del.record_date = trunc(valRecordDate, 'MM')
                and del.type_of_data = AMS_MODL_DATA_BVLIFE.MODULE_CODE_MAIN
                and del.company_bvlife_id = valCompanyBvlifeID
                and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        /* Xoa du lieu FYP trong bang mod_data_bvltrans*/
        loop
            delete mod_data_bvltrans del
            where del.record_date = trunc(valRecordDate, 'MM')
                and del.type_of_data = AMS_MODL_DATA_BVLIFE.MODULE_CODE_MAIN
                and del.company_bvlife_id = valCompanyBvlifeID
                and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        /* Xoa du lieu POLICY trong bang mod_data_bvlpolicy*/
        loop
            delete mod_data_bvlpolicy del
            where del.record_date = trunc(valRecordDate, 'MM')
                and del.type_of_data = AMS_MODL_DATA_BVLIFE.MODULE_CODE_MAIN
                and del.company_bvlife_id = valCompanyBvlifeID
                and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        for list_databse in (
            select bvl.id,
                bvl.schema,
                bvl.link
            from sys_database_bvlife bvl
            where bvl.status = AMS_CORE_SYSTEM.SYSTEM_VALUE_YES
                and bvl.id = valCompanyBvlifeID
        )
        loop
            var_query :=
                'begin ' || list_databse.schema || 'AMS_MODL_DATA.main' || list_databse.link ||
                '(to_date(''' || to_char(trunc(valRecordDate, 'MM'), 'DD-MON-YYYY') || '''), ' ||
                '''' || list_databse.id || '''' || ');
                end;';

            execute immediate var_query;
            commit;
        end loop;

        AMS_MODL_DATA_BVLIFE.get_app(valRecordDate,
            valCompanyBvlifeID,
            AMS_MODL_DATA_BVLIFE.MODULE_CODE_MAIN,
            11);

        AMS_MODL_DATA_BVLIFE.get_comm(valRecordDate,
            valCompanyBvlifeID,
            AMS_MODL_DATA_BVLIFE.MODULE_CODE_MAIN);

        AMS_MODL_DATA_BVLIFE.get_fyp(valRecordDate,
            valCompanyBvlifeID,
            AMS_MODL_DATA_BVLIFE.MODULE_CODE_MAIN);

        AMS_MODL_DATA_BVLIFE.get_policy(valRecordDate,
            valCompanyBvlifeID,
            AMS_MODL_DATA_BVLIFE.MODULE_CODE_MAIN);
    end;

    procedure promotion(valRecordDate date := null,
        valCompanyBvlifeID varchar2 := null)
    is
        var_query varchar(4096) := '';
    begin
        /* Xoa du lieu FYP trong bang mod_data_bvltrans*/
        loop
            delete mod_data_bvltrans del
            where del.record_date = trunc(valRecordDate, 'MM')
                and del.type_of_data = AMS_MODL_DATA_BVLIFE.MODULE_CODE_PROM
                and del.company_bvlife_id = valCompanyBvlifeID
                and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        /* Xoa du lieu POLICY trong bang mod_data_bvlpolicy*/
        loop
            delete mod_data_bvlpolicy del
            where del.record_date = trunc(valRecordDate, 'MM')
                and del.type_of_data = AMS_MODL_DATA_BVLIFE.MODULE_CODE_PROM
                and del.company_bvlife_id = valCompanyBvlifeID
                and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        for list_databse in (
            select bvl.id,
                bvl.schema,
                bvl.link
            from sys_database_bvlife bvl
            where bvl.status = AMS_CORE_SYSTEM.SYSTEM_VALUE_YES
                and bvl.id = valCompanyBvlifeID
        )
        loop
            var_query :=
                'begin ' || list_databse.schema || 'AMS_MODL_DATA.promotion' || list_databse.link ||
                '(to_date(''' || to_char(trunc(valRecordDate, 'MM'), 'DD-MON-YYYY') || '''), ' ||
                '''' || list_databse.id || ''', ' ||
                '''' || AMS_MODL_DATA_BVLIFE.MODULE_CODE_PROM || '''' ||
                '); end;';

            execute immediate var_query;
            commit;
        end loop;

        AMS_MODL_DATA_BVLIFE.get_fyp(valRecordDate,
            valCompanyBvlifeID,
            AMS_MODL_DATA_BVLIFE.MODULE_CODE_PROM);

        AMS_MODL_DATA_BVLIFE.get_policy(valRecordDate,
            valCompanyBvlifeID,
            AMS_MODL_DATA_BVLIFE.MODULE_CODE_PROM);
    end;

    procedure bussiness(valRecordDate date := null,
        valCompanyBvlifeID varchar2 := null)
    is
        var_query varchar(4096) := '';
    begin
        /* Xoa du lieu bien lai tam thoi trong bang mod_data_bvlapps*/
        loop
            delete mod_data_bvlapps del
            where del.record_date = trunc(valRecordDate, 'MM')
                and del.type_of_data = AMS_CORE_MODULE.MODULE_CODE_BUSS
                and del.company_bvlife_id = valCompanyBvlifeID
                and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        for list_databse in (
            select bvl.id,
                bvl.schema,
                bvl.link
            from sys_database_bvlife bvl
            where bvl.status = AMS_CORE_SYSTEM.SYSTEM_VALUE_YES
                and bvl.id = valCompanyBvlifeID
        )
        loop
            var_query :=
                'begin ' || list_databse.schema || 'AMS_MODL_DATA.bussiness' || list_databse.link ||
                '(to_date(''' || to_char(trunc(valRecordDate, 'MM'), 'DD-MON-YYYY') || '''), ' ||
                '''' || list_databse.id || ''', ' ||
                '''' || AMS_CORE_MODULE.MODULE_CODE_BUSS || '''' ||
                '); end;';

            execute immediate var_query;
            commit;
        end loop;
    end;

    procedure get_app(valRecordDate date := null,
        valCompanyBvlifeID varchar2 := null,
        valTypeOfData varchar2 := null,
        valMonths number := 0)
    is
        var_query varchar(4000) := '';
    begin
        for list_databse in (
            select bvl.id,
                bvl.schema,
                bvl.link
            from sys_database_bvlife bvl
            where bvl.status = AMS_CORE_SYSTEM.SYSTEM_VALUE_YES
                and bvl.id = valCompanyBvlifeID
        )
        loop
            ---------------------------------------------------------
            /* BVLIFE */
            ---------------------------------------------------------
            /* Tinh trang giay yeu cau
              [NULL: Bao hiem tam thoi]
              [0: Tu choi]
              [1: Chap nhan]
              [2: Dang kiem tra suc khoe]
              [3: Het hieu luc bao hiem tam thoi]
              [4: Tu choi co hoan phi]
              [5: Tri hoan bao hiem]*/
            /* Loai bien lai tam thoi
               [00114: Phat hanh hop dong]
               [00118: Phat hanh them dieu khoan rieng]
               [00126: Khoi phuc hop dong]*/
            ---------------------------------------------------------
            begin
                /* DELETE: mod_data_bvlapps*/
                loop
                    delete mod_data_bvlapps del
                    where del.record_date = trunc(valRecordDate, 'MM')
                        and del.type_of_data = valTypeOfData
                        and del.company_bvlife_id = valCompanyBvlifeID
                        and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                    exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                    commit;
                end loop;
                commit;

                /* INSERT: mod_data_bvlapps*/
                /* AnhNH sua so giay yeu cau theo ID: 102971
                   Date: 07/06/2013
                */
                var_query := '
                begin
                insert /*+ APPEND */ into mod_data_bvlapps nologging
                select
                    rec.dl_id,
                    rec.cty_id,
                    trunc(:valRecordDate, ''MM''),
                    cast(trunc(sysdate, ''DD'') as date),
                    :valTypeOfData,
                    AMS_CORE_CODE.OBJECT_STATUS_ACTIVE,
                    app.yc_id,
                    app.so_yc,
                    app.tt_yc,
                    rec.sophieu,
                    rec.sobltt,
                    rec.dk_id,
                    app.hd_id,
                    app.sf_id,
                    app.sohddt,
                    rec.ngaykh,
                    rec.ngaykt,
                    rec.ngaykh,
                    app.ngay_dk,
                    nvl(rec.dk_nop, ''00''),
                    nvl(rec.stienvn, 0),
                    rec.tgia_id,
                    null,
                    rec.bh_id,
                    null,
                    AMS_CORE_SYSTEM.SYSTEM_USER,
                    AMS_CORE_SYSTEM.SYSTEM_USER,
                    sysdate,
                    sysdate
                from
                (
                    select *
                    from nt_bltt' || list_databse.link || ' bl
                    where bl.ngaykt
                            between add_months(trunc(:valRecordDate, ''MM''), 0 - :valMonths)
                            and (add_months(trunc(:valRecordDate, ''MM''), 1) - 1)
                        and bl.cty_id = :valCompanyBvlifeID
                ) rec
                left join
                (
                    select *
                    from nt_yeucau' || list_databse.link || ' yc
                ) app
                    on app.yc_id = rec.yc_id;
                end;';

                begin
                    execute immediate var_query
                    using
                        valRecordDate,
                        valTypeOfData,
                        valMonths,
                        valCompanyBvlifeID;
                    commit;
                exception
                    when others then
                        AMS_CORE_LOGS.message(valCompanyBvlifeID,
                            'AMS_MODL_DATA_BVLIFE',
                            SQLERRM,
                            AMS_CORE_LOGS.LOG_STATUS_FAIL,
                            AMS_CORE_SYSTEM.SYSTEM_USER);
                        exit;
                end;
            end;

            ---------------------------------------------------------
            /* AMS */
            ---------------------------------------------------------
            begin
                /* DELETE: mod_data_apps*/
                loop
                    delete mod_data_apps del
                    where del.record_date = trunc(valRecordDate, 'MM')
                        and del.type_of_data = valTypeOfData
                        and del.source_of_data = AMS_CORE_SYSTEM.SYSTEM_REFER_BVLIFE
                        and del.company_bvlife_id = valCompanyBvlifeID
                        and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                    exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                    commit;
                end loop;
                commit;

                /* PENDING: mod_data_apps*/
                insert /*+ APPEND */ into mod_data_apps nologging
                select
                    null,
                    case
                        when app.outlet_bvlife_id is not null then
                            'D' || app.outlet_bvlife_id
                        end,
                    null,
                    outlet_bvlife_id,
                    company_bvlife_id,
                    trunc(valRecordDate, 'MM'),
                    cast(trunc(sysdate, 'DD') as date),
                    AMS_CORE_SYSTEM.SYSTEM_REFER_BVLIFE,
                    valTypeOfData,
                    AMS_CORE_CODE.OBJECT_STATUS_ACTIVE,
                    application_id,
                    application_number,
                    AMS_MODL_DATA_BVLIFE.APPS_CODE_UNAP,
                    receipt_id,
                    receipt_number,
                    receipt_status,
                    policy_number,
                    product_id,
                    no_of_billing,
                    effective_date,
                    processed_date,
                    entered_date,
                    frequency_date,
                    12 /
                        (
                            decode(nvl(to_number(freq_by_months), 0),
                                0, 120,
                                nvl(to_number(freq_by_months), 0)
                                )
                        ),
                    premium,
                    holder_id,
                    holder_name,
                    insured_person_id,
                    insured_person_name,
                    AMS_CORE_SYSTEM.SYSTEM_USER,
                    AMS_CORE_SYSTEM.SYSTEM_USER,
                    sysdate,
                    sysdate
                from mod_data_bvlapps app
                where app.record_date = trunc(valRecordDate, 'MM')
                    and app.type_of_data = valTypeOfData
                    and app.company_bvlife_id = valCompanyBvlifeID
                    and app.receipt_status in
                        (
                            '00118',
                            '00114'
                        )
                    and (
                        app.application_code is null
                        or
                        app.application_code in
                        (
                            '2',
                            --'5', -- Chuyển sang mục từ chối
                            -- Thêm tình trạng : '6' , Thông báo chấp nhận bảo hiểm có điều kiện)
                            '6'
                        )
                    );
                commit;

                /* OUTFORCE: mod_data_apps*/
                insert /*+ APPEND */ into mod_data_apps nologging
                select
                    null,
                    case
                        when app.outlet_bvlife_id is not null then
                            'D' || app.outlet_bvlife_id
                        end,
                    null,
                    outlet_bvlife_id,
                    company_bvlife_id,
                    trunc(valRecordDate, 'MM'),
                    cast(trunc(sysdate, 'DD') as date),
                    AMS_CORE_SYSTEM.SYSTEM_REFER_BVLIFE,
                    valTypeOfData,
                    AMS_CORE_CODE.OBJECT_STATUS_ACTIVE,
                    application_id,
                    application_number,
                    AMS_MODL_DATA_BVLIFE.APPS_CODE_RFND,
                    receipt_id,
                    receipt_number,
                    receipt_status,
                    policy_number,
                    product_id,
                    no_of_billing,
                    effective_date,
                    processed_date,
                    entered_date,
                    frequency_date,
                    12 /
                        (
                            decode(nvl(to_number(freq_by_months), 0),
                                0, 120,
                                nvl(to_number(freq_by_months), 0)
                                )
                        ),
                    premium,
                    holder_id,
                    holder_name,
                    insured_person_id,
                    insured_person_name,
                    AMS_CORE_SYSTEM.SYSTEM_USER,
                    AMS_CORE_SYSTEM.SYSTEM_USER,
                    sysdate,
                    sysdate
                from mod_data_bvlapps app
                where app.record_date = trunc(valRecordDate, 'MM')
                    and app.type_of_data = valTypeOfData
                    and app.company_bvlife_id = valCompanyBvlifeID
                    and app.receipt_status in
                        (
                            '00118',
                            '00114'
                        )
                    and app.application_code in
                        (
                            '0',
                            '3',
                            '4',
                            '5', --(chuyển đến từ mục chờ phát hành)
                            '7'	--(Thêm tình trạng khách hàng có thông báo hủy yêu cầu: '7')
                        );
                commit;

                /* INFORCE: mod_data_apps*/
                insert /*+ APPEND */ into mod_data_apps nologging
                select
                    null,
                    case
                        when app.outlet_bvlife_id is not null then
                            'D' || app.outlet_bvlife_id
                        end,
                    null,
                    outlet_bvlife_id,
                    company_bvlife_id,
                    trunc(valRecordDate, 'MM'),
                    cast(trunc(sysdate, 'DD') as date),
                    AMS_CORE_SYSTEM.SYSTEM_REFER_BVLIFE,
                    valTypeOfData,
                    AMS_CORE_CODE.OBJECT_STATUS_ACTIVE,
                    application_id,
                    application_number,
                    AMS_MODL_DATA_BVLIFE.APPS_CODE_APPL,
                    receipt_id,
                    receipt_number,
                    receipt_status,
                    policy_number,
                    product_id,
                    no_of_billing,
                    effective_date,
                    processed_date,
                    entered_date,
                    frequency_date,
                    12 /
                        (
                            decode(nvl(to_number(freq_by_months), 0),
                                0, 120,
                                nvl(to_number(freq_by_months), 0)
                                )
                        ),
                    premium,
                    holder_id,
                    holder_name,
                    insured_person_id,
                    insured_person_name,
                    AMS_CORE_SYSTEM.SYSTEM_USER,
                    AMS_CORE_SYSTEM.SYSTEM_USER,
                    sysdate,
                    sysdate
                from mod_data_bvlapps app
                where app.record_date = trunc(valRecordDate, 'MM')
                    and app.type_of_data = valTypeOfData
                    and app.company_bvlife_id = valCompanyBvlifeID
                    and app.receipt_status in
                        (
                            '00118',
                            '00114'
                        )
                    --Bổ sung thêm tình trạng '8' chấp nhận bảo hiểm có điều kiện
                    and app.application_code in ('1', '8');
                commit;
            end;

            ---------------------------------------------------------
            /* UPDATE */
            ---------------------------------------------------------
            /*merge \*+ CARDINALITY(app, 100)*\
                into mod_data_apps app
            using
                (
                    select \*+ CARDINALITY(mapp, 100)*\
                        mapp.outlet_ams_id,
                        mapp.outlet_bvlife_id
                    from ams.serv_outlet_mapping mapp
                ) upd
            on (
                trunc(valRecordDate, 'MM') = app.record_date
                and
                AMS_CORE_SYSTEM.SYSTEM_REFER_BVLIFE = app.source_of_data
                and
                valTypeOfData = app.type_of_data
                and
                valCompanyBvlifeID = app.company_bvlife_id
                and
                upd.outlet_bvlife_id = app.outlet_bvlife_id
                )
            when matched then
                update
                set
                    app.outlet_ams_id = upd.outlet_ams_id,
                    app.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                    app.update_datetime = sysdate;
            commit;*/

            /*update mod_data_apps app
            set
                app.application_code = AMS_MODL_DATA_BVLIFE.APPS_CODE_ERRO,
                app.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                app.update_datetime = sysdate
            where app.record_date = trunc(valRecordDate, 'MM')
                and app.type_of_data = valTypeOfData
                and app.source_of_data = AMS_CORE_SYSTEM.SYSTEM_REFER_BVLIFE
                and app.company_bvlife_id = valCompanyBvlifeID
                and app.outlet_ams_id is null;
            commit;*/
        end loop;
    end;

    procedure get_comm(valRecordDate date := null,
        valCompanyBvlifeID varchar2 := null,
        valTypeOfData varchar2 := null)
    is
    begin
        /* Xoa du lieu COMM trong bang mod_data_comm*/
        loop
            delete mod_data_comm del
            where del.record_date = trunc(valRecordDate, 'MM')
                and del.type_of_data = valTypeOfData
                and del.source_of_data = AMS_CORE_SYSTEM.SYSTEM_REFER_BVLIFE
                and del.company_bvlife_id = valCompanyBvlifeID
                and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        /* Du lieu COMM va FYC tu Bvlife*/
        insert into mod_data_comm(
            outlet_ams_id,
            outlet_bvlife_id,
            company_bvlife_id,
            record_date,
            version_date,
            source_of_data,
            type_of_data,
            status_code,
            commission,
            fyc,
            create_user,
            update_user,
            create_datetime,
            update_datetime
        )
        select
            case
                when comm.outlet_bvlife_id is not null then
                    'D' || comm.outlet_bvlife_id
                end,
            comm.outlet_bvlife_id,
            comm.company_bvlife_id,
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            AMS_CORE_SYSTEM.SYSTEM_REFER_BVLIFE,
            valTypeOfData,
            AMS_CORE_CODE.OBJECT_STATUS_ACTIVE,
            sum(comm.commission),
            sum(comm.commission),
            AMS_CORE_SYSTEM.SYSTEM_USER,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            sysdate,
            sysdate
        from mod_data_bvlcomms comm
        where comm.record_date = trunc(valRecordDate, 'MM')
            and comm.company_bvlife_id = valCompanyBvlifeID
            and comm.type_of_data = valTypeOfData
            and comm.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
            and nvl(comm.years, 0) in (0, 1)
        group by comm.outlet_bvlife_id,
            comm.company_bvlife_id;
        commit;

        /* FYC = 0 khi hop dong tu nam thu hai*/
        insert into mod_data_comm(
            outlet_ams_id,
            outlet_bvlife_id,
            company_bvlife_id,
            record_date,
            version_date,
            source_of_data,
            type_of_data,
            status_code,
            commission,
            fyc,
            create_user,
            update_user,
            create_datetime,
            update_datetime
        )
        select
            case
                when comm.outlet_bvlife_id is not null then
                    'D' || comm.outlet_bvlife_id
                end,
            comm.outlet_bvlife_id,
            comm.company_bvlife_id,
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            AMS_CORE_SYSTEM.SYSTEM_REFER_BVLIFE,
            valTypeOfData,
            AMS_CORE_CODE.OBJECT_STATUS_ACTIVE,
            sum(comm.commission),
            0,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            sysdate,
            sysdate
        from mod_data_bvlcomms comm
        where comm.record_date = trunc(valRecordDate, 'MM')
            and comm.company_bvlife_id = valCompanyBvlifeID
            and comm.type_of_data = valTypeOfData
            and comm.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
            and nvl(comm.years, 0) not in (0, 1)
        group by comm.outlet_bvlife_id,
            comm.company_bvlife_id;
        commit;

        /* Cap nhap ma AMS, Talisman, Bvlife*/
        /*merge \*+ CARDINALITY(comm, 100)*\
            into mod_data_comm comm
        using
            (
                select m.outlet_ams_id,
                    m.outlet_bvlife_id
                from ams.serv_outlet_mapping m
            ) upd
        on (
            trunc(valRecordDate, 'MM') = comm.record_date
            and
            AMS_CORE_SYSTEM.SYSTEM_REFER_BVLIFE = comm.source_of_data
            and
            valTypeOfData = comm.type_of_data
            and
            valCompanyBvlifeID = comm.company_bvlife_id
            and
            upd.outlet_bvlife_id = comm.outlet_bvlife_id
            )
        when matched then
            update
            set comm.outlet_ams_id = upd.outlet_ams_id,
                comm.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                comm.update_datetime = sysdate;
        commit;*/
    end;

    procedure get_fyp(valRecordDate date := null,
        valCompanyBvlifeID varchar2 := null,
        valTypeOfData varchar2 := null)
    is
    begin
        /* Xoa du lieu FYP trong bang mod_data_fyp*/
        loop
            delete mod_data_fyp del
            where del.record_date = trunc(valRecordDate, 'MM')
                and del.type_of_data = valTypeOfData
                and del.source_of_data = AMS_CORE_SYSTEM.SYSTEM_REFER_BVLIFE
                and del.company_bvlife_id = valCompanyBvlifeID
                and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        /* FYP tinh tu hoa don nop phi lan dau tien*/
        insert into mod_data_fyp(
            outlet_ams_id,
            outlet_bvlife_id,
            company_bvlife_id,
            record_date,
            version_date,
            source_of_data,
            type_of_data,
            status_code,
            trans_code,
            policy_number,
            processed_date,
            fyp,
            system_id_of_billing,
            create_user,
            update_user,
            create_datetime,
            update_datetime
        )
        select
            case
                when tran.init_bvlife_id is not null then
                    'D' || tran.init_bvlife_id
                end,
            tran.init_bvlife_id,
            tran.company_bvlife_id,
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            AMS_CORE_SYSTEM.SYSTEM_REFER_BVLIFE,
            valTypeOfData,
            AMS_CORE_CODE.OBJECT_STATUS_ACTIVE,
            tran.trans_code,
            tran.policy_number,
            tran.processed_date,
            tran.freq_premium,
            tran.system_id_of_billing,
            tran.create_user,
            tran.update_user,
            tran.create_datetime,
            tran.update_datetime
        from mod_data_bvltrans tran
        where tran.record_date = trunc(valRecordDate, 'MM')
            and tran.company_bvlife_id = valCompanyBvlifeID
            and tran.type_of_data = valTypeOfData
            and tran.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
            and tran.trans_code = AMS_MODL_DATA_BVLIFE.TRANS_CODE_INIT;
        commit;

        /* FYP tinh tu hop dong huy trong thoi gian cho phep*/
        insert into mod_data_fyp(
            outlet_ams_id,
            outlet_bvlife_id,
            company_bvlife_id,
            record_date,
            version_date,
            source_of_data,
            type_of_data,
            status_code,
            trans_code,
            policy_number,
            processed_date,
            fyp,
            system_id_of_billing,
            create_user,
            update_user,
            create_datetime,
            update_datetime
        )
        select
            case
                when tran.init_bvlife_id is not null then
                    'D' || tran.init_bvlife_id
                end,
            tran.init_bvlife_id,
            tran.company_bvlife_id,
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            AMS_CORE_SYSTEM.SYSTEM_REFER_BVLIFE,
            valTypeOfData,
            AMS_CORE_CODE.OBJECT_STATUS_ACTIVE,
            tran.trans_code,
            tran.policy_number,
            tran.processed_date,
            tran.freq_premium,
            tran.system_id_of_billing,
            tran.create_user,
            tran.update_user,
            tran.create_datetime,
            tran.update_datetime
        from mod_data_bvltrans tran
        where tran.record_date = trunc(valRecordDate, 'MM')
            and tran.company_bvlife_id = valCompanyBvlifeID
            and tran.type_of_data = valTypeOfData
            and tran.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
            and tran.trans_code = AMS_MODL_DATA_BVLIFE.TRANS_CODE_CANC;
        commit;

        /* FYP tinh tu hoa don nop phi dinh ky cho hop dong*/
        insert into mod_data_fyp(
            outlet_ams_id,
            outlet_bvlife_id,
            company_bvlife_id,
            record_date,
            version_date,
            source_of_data,
            type_of_data,
            status_code,
            trans_code,
            policy_number,
            processed_date,
            fyp,
            system_id_of_billing,
            create_user,
            update_user,
            create_datetime,
            update_datetime
        )
        select /*+ CARDINALITY(tran, 100) CARDINALITY(pol, 100) */
            case
                when tran.init_bvlife_id is not null then
                    'D' || tran.init_bvlife_id
                end,
            tran.init_bvlife_id,
            tran.company_bvlife_id,
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            AMS_CORE_SYSTEM.SYSTEM_REFER_BVLIFE,
            valTypeOfData,
            AMS_CORE_CODE.OBJECT_STATUS_ACTIVE,
            tran.trans_code,
            tran.policy_number,
            tran.processed_date,
            tran.freq_premium,
            tran.system_id_of_billing,
            tran.create_user,
            tran.update_user,
            tran.create_datetime,
            tran.update_datetime
        from
        (
            select /*+ CARDINALITY(tmp, 100)*/
                *
            from mod_data_bvltrans tmp
            where tmp.record_date = trunc(valRecordDate, 'MM')
                and tmp.company_bvlife_id = valCompanyBvlifeID
                and tmp.type_of_data = valTypeOfData
                and tmp.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                and tmp.trans_code = AMS_MODL_DATA_BVLIFE.TRANS_CODE_FREQ
        ) tran
        join
        (
            select /*+ CARDINALITY(tmp, 100)*/
                tmp.policy_number,
                tmp.freq_date
            from mod_data_bvlpolicy tmp
            where tmp.record_date = trunc(valRecordDate, 'MM')
                and tmp.company_bvlife_id = valCompanyBvlifeID
                and tmp.type_of_data = valTypeOfData
                and tmp.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                and tmp.changes_code = AMS_MODL_DATA_BVLIFE.POLYC_CODE_PROC
        ) pol
            on pol.policy_number = tran.policy_number
        where add_months(trunc(pol.freq_date, 'MM'), 12) >= trunc(tran.frequency_to_date, 'MM');
        commit;

        insert into mod_data_fyp(
            outlet_ams_id,
            outlet_bvlife_id,
            company_bvlife_id,
            record_date,
            version_date,
            source_of_data,
            type_of_data,
            status_code,
            trans_code,
            policy_number,
            processed_date,
            fyp,
            system_id_of_billing,
            create_user,
            update_user,
            create_datetime,
            update_datetime
        )
        select /*+ CARDINALITY(tran, 100) CARDINALITY(pol, 100) */
            case
                when tran.init_bvlife_id is not null then
                    'D' || tran.init_bvlife_id
                end,
            tran.init_bvlife_id,
            tran.company_bvlife_id,
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            AMS_CORE_SYSTEM.SYSTEM_REFER_BVLIFE,
            valTypeOfData,
            AMS_CORE_CODE.OBJECT_STATUS_ACTIVE,
            tran.trans_code,
            tran.policy_number,
            tran.processed_date,
            round(tran.freq_premium *
                case
                    when nvl(months_between(
                            trunc(tran.frequency_to_date, 'MM'),
                            trunc(tran.frequency_from_date, 'MM')
                        ), 0) > 0 then
                        months_between(
                            add_months(trunc(pol.freq_date, 'MM'), 12),
                            trunc(tran.frequency_from_date, 'MM')
                        ) /
                        months_between(
                            trunc(tran.frequency_to_date, 'MM'),
                            trunc(tran.frequency_from_date, 'MM')
                        )
                end, 2),
            tran.system_id_of_billing,
            tran.create_user,
            tran.update_user,
            tran.create_datetime,
            tran.update_datetime
        from
        (
            select /*+ CARDINALITY(tmp, 100)*/
                *
            from mod_data_bvltrans tmp
            where tmp.record_date = trunc(valRecordDate, 'MM')
                and tmp.company_bvlife_id = valCompanyBvlifeID
                and tmp.type_of_data = valTypeOfData
                and tmp.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                and tmp.trans_code = AMS_MODL_DATA_BVLIFE.TRANS_CODE_FREQ
        ) tran
        join
        (
            select /*+ CARDINALITY(tmp, 100)*/
                tmp.policy_number,
                tmp.freq_date
            from mod_data_bvlpolicy tmp
            where tmp.record_date = trunc(valRecordDate, 'MM')
                and tmp.company_bvlife_id = valCompanyBvlifeID
                and tmp.type_of_data = valTypeOfData
                and tmp.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                and tmp.changes_code = AMS_MODL_DATA_BVLIFE.POLYC_CODE_PROC
        ) pol
            on pol.policy_number = tran.policy_number
        where add_months(trunc(pol.freq_date, 'MM'), 12) < trunc(tran.frequency_to_date, 'MM')
            and add_months(trunc(pol.freq_date, 'MM'), 12) > trunc(tran.frequency_from_date, 'MM');
        commit;

        /* FYP tinh tu cac hoa don vay phi tu dong*/
        insert into mod_data_fyp(
            outlet_ams_id,
            outlet_bvlife_id,
            company_bvlife_id,
            record_date,
            version_date,
            source_of_data,
            type_of_data,
            status_code,
            trans_code,
            policy_number,
            processed_date,
            fyp,
            system_id_of_billing,
            create_user,
            update_user,
            create_datetime,
            update_datetime
        )
        select /*+ CARDINALITY(tran, 100) CARDINALITY(pol, 100) */
            case
                when tran.init_bvlife_id is not null then
                    'D' || tran.init_bvlife_id
                end,
            tran.init_bvlife_id,
            tran.company_bvlife_id,
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            AMS_CORE_SYSTEM.SYSTEM_REFER_BVLIFE,
            valTypeOfData,
            AMS_CORE_CODE.OBJECT_STATUS_ACTIVE,
            tran.trans_code,
            tran.policy_number,
            tran.processed_date,
            tran.freq_premium,
            tran.system_id_of_billing,
            tran.create_user,
            tran.update_user,
            tran.create_datetime,
            tran.update_datetime
        from
        (
            select /*+ CARDINALITY(tmp, 100)*/
                *
            from mod_data_bvltrans tmp
            where tmp.record_date = trunc(valRecordDate, 'MM')
                and tmp.company_bvlife_id = valCompanyBvlifeID
                and tmp.type_of_data = valTypeOfData
                and tmp.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                and tmp.trans_code = AMS_MODL_DATA_BVLIFE.TRANS_CODE_LOAN
        ) tran
        join
        (
            select /*+ CARDINALITY(tmp, 100)*/
                tmp.policy_number,
                tmp.freq_date
            from mod_data_bvlpolicy tmp
            where tmp.record_date = trunc(valRecordDate, 'MM')
                and tmp.company_bvlife_id = valCompanyBvlifeID
                and tmp.type_of_data = valTypeOfData
                and tmp.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                and tmp.changes_code = AMS_MODL_DATA_BVLIFE.POLYC_CODE_PROC
        ) pol
            on pol.policy_number = tran.policy_number
        where add_months(trunc(pol.freq_date, 'MM'), 12) >= trunc(tran.frequency_to_date, 'MM');
        commit;

        insert into mod_data_fyp(
            outlet_ams_id,
            outlet_bvlife_id,
            company_bvlife_id,
            record_date,
            version_date,
            source_of_data,
            type_of_data,
            status_code,
            trans_code,
            policy_number,
            processed_date,
            fyp,
            system_id_of_billing,
            create_user,
            update_user,
            create_datetime,
            update_datetime
        )
        select /*+ CARDINALITY(tran, 100) CARDINALITY(pol, 100) */
            case
                when tran.init_bvlife_id is not null then
                    'D' || tran.init_bvlife_id
                end,
            tran.init_bvlife_id,
            tran.company_bvlife_id,
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            AMS_CORE_SYSTEM.SYSTEM_REFER_BVLIFE,
            valTypeOfData,
            AMS_CORE_CODE.OBJECT_STATUS_ACTIVE,
            tran.trans_code,
            tran.policy_number,
            tran.processed_date,
            round(tran.freq_premium *
                case
                    when nvl(months_between(
                            trunc(tran.frequency_to_date, 'MM'),
                            trunc(tran.frequency_from_date, 'MM')
                        ), 0) > 0 then
                        months_between(
                            add_months(trunc(pol.freq_date, 'MM'), 12),
                            trunc(tran.frequency_from_date, 'MM')
                        ) /
                        months_between(
                            trunc(tran.frequency_to_date, 'MM'),
                            trunc(tran.frequency_from_date, 'MM')
                        )
                end, 2),
            tran.system_id_of_billing,
            tran.create_user,
            tran.update_user,
            tran.create_datetime,
            tran.update_datetime
        from
        (
            select /*+ CARDINALITY(tmp, 100)*/
                *
            from mod_data_bvltrans tmp
            where tmp.record_date = trunc(valRecordDate, 'MM')
                and tmp.company_bvlife_id = valCompanyBvlifeID
                and tmp.type_of_data = valTypeOfData
                and tmp.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                and tmp.trans_code = AMS_MODL_DATA_BVLIFE.TRANS_CODE_LOAN
        ) tran
        join
        (
            select /*+ CARDINALITY(tmp, 100)*/
                tmp.policy_number,
                tmp.freq_date
            from mod_data_bvlpolicy tmp
            where tmp.record_date = trunc(valRecordDate, 'MM')
                and tmp.company_bvlife_id = valCompanyBvlifeID
                and tmp.type_of_data = valTypeOfData
                and tmp.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                and tmp.changes_code = AMS_MODL_DATA_BVLIFE.POLYC_CODE_PROC
        ) pol
            on pol.policy_number = tran.policy_number
        where add_months(trunc(pol.freq_date, 'MM'), 12) < trunc(tran.frequency_to_date, 'MM')
            and add_months(trunc(pol.freq_date, 'MM'), 12) > trunc(tran.frequency_from_date, 'MM');
        commit;

        /* FYP tinh tu khoan nop truoc cua hop dong. Truong hop nay
        duoc tinh dung sau khi chay lai ke hoach*/
        insert into mod_data_fyp(
            outlet_ams_id,
            outlet_bvlife_id,
            company_bvlife_id,
            record_date,
            version_date,
            source_of_data,
            type_of_data,
            status_code,
            trans_code,
            policy_number,
            processed_date,
            fyp,
            system_id_of_billing,
            create_user,
            update_user,
            create_datetime,
            update_datetime
        )
        select /*+ CARDINALITY(tran, 100) CARDINALITY(pol, 100) */
            case
                when tran.init_bvlife_id is not null then
                    'D' || tran.init_bvlife_id
                end,
            tran.init_bvlife_id,
            tran.company_bvlife_id,
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            AMS_CORE_SYSTEM.SYSTEM_REFER_BVLIFE,
            valTypeOfData,
            AMS_CORE_CODE.OBJECT_STATUS_ACTIVE,
            tran.trans_code,
            tran.policy_number,
            tran.processed_date,
            tran.freq_premium,
            tran.system_id_of_billing,
            tran.create_user,
            tran.update_user,
            tran.create_datetime,
            tran.update_datetime
        from
        (
            select /*+ CARDINALITY(tmp, 100)*/
                *
            from mod_data_bvltrans tmp
            where tmp.record_date = trunc(valRecordDate, 'MM')
                and tmp.company_bvlife_id = valCompanyBvlifeID
                and tmp.type_of_data = valTypeOfData
                and tmp.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                and tmp.trans_code = AMS_MODL_DATA_BVLIFE.TRANS_CODE_EXTR
        ) tran
        join
        (
            select /*+ CARDINALITY(tmp, 100)*/
                tmp.policy_number,
                tmp.freq_date
            from mod_data_bvlpolicy tmp
            where tmp.record_date = trunc(valRecordDate, 'MM')
                and tmp.company_bvlife_id = valCompanyBvlifeID
                and tmp.type_of_data = valTypeOfData
                and tmp.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                and tmp.changes_code = AMS_MODL_DATA_BVLIFE.POLYC_CODE_PROC
        ) pol
            on pol.policy_number = tran.policy_number
        where add_months(trunc(pol.freq_date, 'MM'), 12) >= trunc(tran.frequency_to_date, 'MM');
        commit;

        insert into mod_data_fyp(
            outlet_ams_id,
            outlet_bvlife_id,
            company_bvlife_id,
            record_date,
            version_date,
            source_of_data,
            type_of_data,
            status_code,
            trans_code,
            policy_number,
            processed_date,
            fyp,
            system_id_of_billing,
            create_user,
            update_user,
            create_datetime,
            update_datetime
        )
        select /*+ CARDINALITY(tran, 100) CARDINALITY(pol, 100) */
            case
                when tran.init_bvlife_id is not null then
                    'D' || tran.init_bvlife_id
                end,
            tran.init_bvlife_id,
            tran.company_bvlife_id,
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            AMS_CORE_SYSTEM.SYSTEM_REFER_BVLIFE,
            valTypeOfData,
            AMS_CORE_CODE.OBJECT_STATUS_ACTIVE,
            tran.trans_code,
            tran.policy_number,
            tran.processed_date,
            round(tran.freq_premium *
                case
                    when nvl(months_between(
                            trunc(tran.frequency_to_date, 'MM'),
                            trunc(tran.frequency_from_date, 'MM')
                        ), 0) > 0 then
                        months_between(
                            add_months(trunc(pol.freq_date, 'MM'), 12),
                            trunc(tran.frequency_from_date, 'MM')
                        ) /
                        months_between(
                            trunc(tran.frequency_to_date, 'MM'),
                            trunc(tran.frequency_from_date, 'MM')
                        )
                end, 2),
            tran.system_id_of_billing,
            tran.create_user,
            tran.update_user,
            tran.create_datetime,
            tran.update_datetime
        from
        (
            select /*+ CARDINALITY(tmp, 100)*/
                *
            from mod_data_bvltrans tmp
            where tmp.record_date = trunc(valRecordDate, 'MM')
                and tmp.company_bvlife_id = valCompanyBvlifeID
                and tmp.type_of_data = valTypeOfData
                and tmp.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                and tmp.trans_code = AMS_MODL_DATA_BVLIFE.TRANS_CODE_EXTR
        ) tran
        join
        (
            select /*+ CARDINALITY(tmp, 100)*/
                tmp.policy_number,
                tmp.freq_date
            from mod_data_bvlpolicy tmp
            where tmp.record_date = trunc(valRecordDate, 'MM')
                and tmp.company_bvlife_id = valCompanyBvlifeID
                and tmp.type_of_data = valTypeOfData
                and tmp.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                and tmp.changes_code = AMS_MODL_DATA_BVLIFE.POLYC_CODE_PROC
        ) pol
            on pol.policy_number = tran.policy_number
        where add_months(trunc(pol.freq_date, 'MM'), 12) < trunc(tran.frequency_to_date, 'MM')
            and add_months(trunc(pol.freq_date, 'MM'), 12) > trunc(tran.frequency_from_date, 'MM');
        commit;

        /*\* Cap nhap ma AMS, Talisman, Bvlife*\
        merge \*+ CARDINALITY(fyp, 100)*\
            into mod_data_fyp fyp
        using
            (
                select
                    m.outlet_ams_id,
                    m.outlet_bvlife_id
                from ams.serv_outlet_mapping m
            ) upd
        on (
            trunc(valRecordDate, 'MM') = fyp.record_date
            and
            AMS_CORE_SYSTEM.SYSTEM_REFER_BVLIFE = fyp.source_of_data
            and
            valTypeOfData = fyp.type_of_data
            and
            valCompanyBvlifeID = fyp.company_bvlife_id
            and
            upd.outlet_bvlife_id = fyp.outlet_bvlife_id
            )
        when matched then
            update
            set fyp.outlet_ams_id = upd.outlet_ams_id,
                fyp.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                fyp.update_datetime = sysdate;
        commit;*/
    end;

    procedure get_policy(valRecordDate date := null,
        valCompanyBvlifeID varchar2 := null,
        valTypeOfData varchar2 := null)
    is
    begin
        /* Xoa du lieu hop dong trong bang mod_data_policy*/
        loop
            delete mod_data_policy del
            where del.record_date = trunc(valRecordDate, 'MM')
                and del.type_of_data = valTypeOfData
                and del.source_of_data = AMS_CORE_SYSTEM.SYSTEM_REFER_BVLIFE
                and del.company_bvlife_id = valCompanyBvlifeID
                and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        /* Cac hop dong phat hanh tren Bvlife*/
        insert into mod_data_policy (
            serv_ams_id,
            serv_bvlife_id,
            init_ams_id,
            init_bvlife_id,
            company_bvlife_id,
            record_date,
            version_date,
            source_of_data,
            type_of_data,
            status_code,
            policy_number,
            main_product_code,
            changes_code,
            changes_date,
            freq_date,
            freq_per_annum,
            freq_premium,
            isrc_premium,
            create_user,
            update_user,
            create_datetime,
            update_datetime
        )
        select
            case
                when pol.serv_bvlife_id is not null then
                    'D' || pol.serv_bvlife_id
                end,
            pol.serv_bvlife_id,
            case
                when pol.init_bvlife_id is not null then
                    'D' || pol.init_bvlife_id
                end,
            pol.init_bvlife_id,
            pol.company_bvlife_id,
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            AMS_CORE_SYSTEM.SYSTEM_REFER_BVLIFE,
            pol.type_of_data,
            pol.status_code,
            pol.policy_number,
            pol.main_product_code,
            pol.changes_code,
            pol.changes_date,
            pol.freq_date,
            12 /
                (
                    decode(nvl(to_number(pol.freq_by_months), 0),
                        0, 120,
                        nvl(to_number(pol.freq_by_months), 0)
                        )
                ),
            pol.freq_premium,
            pol.isrc_premium,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            sysdate,
            sysdate
        from mod_data_bvlpolicy pol
        where pol.record_date = trunc(valRecordDate, 'MM')
            and pol.type_of_data = valTypeOfData
            and pol.company_bvlife_id = valCompanyBvlifeID
            and pol.changes_code = AMS_MODL_DATA_BVLIFE.POLYC_CODE_PROC;
        commit;

        /* Cac thay doi hop dong khac tren Bvlife*/
        insert into mod_data_policy (
            serv_ams_id,
            serv_bvlife_id,
            init_ams_id,
            init_bvlife_id,
            company_bvlife_id,
            record_date,
            version_date,
            source_of_data,
            type_of_data,
            status_code,
            policy_number,
            main_product_code,
            changes_code,
            changes_date,
            freq_date,
            freq_per_annum,
            freq_premium,
            isrc_premium,
            create_user,
            update_user,
            create_datetime,
            update_datetime
        )
        select
            case
                when pol.serv_bvlife_id is not null then
                    'D' || pol.serv_bvlife_id
                end,
            pol.serv_bvlife_id,
            case
                when pol.init_bvlife_id is not null then
                    'D' || pol.init_bvlife_id
                end,
            pol.init_bvlife_id,
            pol.company_bvlife_id,
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            AMS_CORE_SYSTEM.SYSTEM_REFER_BVLIFE,
            pol.type_of_data,
            pol.status_code,
            pol.policy_number,
            pol.main_product_code,
            pol.changes_code,
            pol.changes_date,
            pol.freq_date,
            null,
            pol.freq_premium,
            pol.isrc_premium,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            sysdate,
            sysdate
        from mod_data_bvlpolicy pol
        where pol.record_date = trunc(valRecordDate, 'MM')
            and pol.type_of_data = valTypeOfData
            and pol.company_bvlife_id = valCompanyBvlifeID
            and pol.changes_code not in (AMS_MODL_DATA_BVLIFE.POLYC_CODE_PROC);
        commit;

        /*\* Cap nhap ma AMS, Talisman, Bvlife*\
        merge \*+ CARDINALITY(pol, 100)*\
            into mod_data_policy pol
        using
            (
                select m.outlet_ams_id,
                    m.outlet_bvlife_id
                from ams.serv_outlet_mapping m
            ) upd
        on (
            trunc(valRecordDate, 'MM') = pol.record_date
            and
            AMS_CORE_SYSTEM.SYSTEM_REFER_BVLIFE = pol.source_of_data
            and
            valTypeOfData = pol.type_of_data
            and
            valCompanyBvlifeID = pol.company_bvlife_id
            and
            upd.outlet_bvlife_id = pol.init_bvlife_id
            )
        when matched then
            update
            set pol.init_ams_id = upd.outlet_ams_id,
                pol.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                pol.update_datetime = sysdate;
        commit;*/
    end;

end AMS_MODL_DATA_BVLIFE;
/
