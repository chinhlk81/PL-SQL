create or replace package ams.LIFE_AGENCY_VIETSTAR is

    procedure main;

    procedure run_vietstar(valRecordDate date := null,
        valKeyID number := null);

    procedure export_outlet(valRecordDate date := null,
        valKeyID number := null);

    procedure upload_devu_temp(valRecordDate date := null);

    procedure upload_psvs(valRecordDate date := null);

    procedure list_psvs_fyp(valRecordDate date := null);

    procedure list_psvs_fyp_ex(valRecordDate date := null);

    procedure list_psvs_ip_coup(valRecordDate date := null);

    procedure list_psvs_afyp_issu(valRecordDate date := null);

    procedure list_psvs_afyp_info(valRecordDate date := null);

    procedure list_psvs_pers_rate(valRecordDate date := null);

    procedure upload_umvs(valRecordDate date := null);

    procedure list_umvs_temp(valRecordDate date := null);

    procedure list_umvs_fyp(valRecordDate date := null);

    procedure list_umvs_empl(valRecordDate date := null);

    procedure list_umvs_fyp_60days(valRecordDate date := null);

    procedure list_umvs_numb_of_nagt(valRecordDate date := null);

    procedure upload_amvs(valRecordDate date := null);

    procedure list_amvs_temp(valRecordDate date := null);

    procedure list_amvs_fyp(valRecordDate date := null);

    procedure upload_coll(valRecordDate date := null);

    procedure list_coll_fyp(valRecordDate date := null);

    procedure list_coll_numb_of_poli(valRecordDate date := null);

    procedure list_coll_coll_prem(valRecordDate date := null);

    procedure list_coll_real_prem(valRecordDate date := null);

    procedure list_coll_rate(valRecordDate date := null);

    procedure list_coll_cont_mang(valRecordDate date := null);

    procedure list_coll_cont_canc(valRecordDate date := null);

    procedure list_coll_pers_rate(valRecordDate date := null);

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

    procedure list_cumv_fyp(valRecordDate date := null);

    procedure list_cumv_coll_prem(valRecordDate date := null);

    procedure list_cumv_real_prem(valRecordDate date := null);

    procedure list_cumv_real_prem_avrg(valRecordDate date := null);

    procedure list_cumv_coll_rate_avrg(valRecordDate date := null);

    procedure list_cumv_cont_mang(valRecordDate date := null);

    procedure list_cumv_cont_canc(valRecordDate date := null);

    procedure list_cumv_pers_rate_avrg(valRecordDate date := null);

    procedure list_cumv_numb_of_agnt(valRecordDate date := null);

    procedure close_executing(valRecordDate date := null);

end LIFE_AGENCY_VIETSTAR;
/
create or replace package body ams.LIFE_AGENCY_VIETSTAR is

    procedure main
    is
    begin
        null;
    end;

    procedure run_vietstar(valRecordDate date := null,
        valKeyID number := null)
    is
    begin
        life_agency_table.truncate_table('la_vietstar_trans');
        life_agency_bvlife.vietstar(valRecordDate);
        life_agency_talisman.vietstar(valRecordDate);
        life_agency_outlet.vietstar(valRecordDate);

        life_agency_outlet.export_outlet_vietstar(valRecordDate, valKeyID);
        life_agency_vietstar.export_outlet(valRecordDate, valKeyID);
        life_agency_vietstar.upload_devu_temp(valRecordDate);

        life_agency_vietstar.upload_psvs(valRecordDate);
        life_agency_vietstar.list_psvs_fyp(valRecordDate);
        life_agency_vietstar.list_psvs_fyp_ex(valRecordDate);
        life_agency_vietstar.list_psvs_ip_coup(valRecordDate);
        life_agency_vietstar.list_psvs_afyp_issu(valRecordDate);
        life_agency_vietstar.list_psvs_afyp_info(valRecordDate);
        life_agency_vietstar.list_psvs_pers_rate(valRecordDate);

        life_agency_vietstar.upload_umvs(valRecordDate);
        life_agency_vietstar.list_umvs_temp(valRecordDate);
        life_agency_vietstar.list_umvs_fyp(valRecordDate);
        life_agency_vietstar.list_umvs_empl(valRecordDate);
        life_agency_vietstar.list_umvs_fyp_60days(valRecordDate);
        life_agency_vietstar.list_umvs_numb_of_nagt(valRecordDate);

        life_agency_vietstar.upload_amvs(valRecordDate);
        life_agency_vietstar.list_amvs_temp(valRecordDate);
        life_agency_vietstar.list_amvs_fyp(valRecordDate);

        life_agency_vietstar.upload_coll(valRecordDate);
        life_agency_vietstar.list_coll_fyp(valRecordDate);
        life_agency_vietstar.list_coll_numb_of_poli(valRecordDate);
        life_agency_vietstar.list_coll_coll_prem(valRecordDate);
        life_agency_vietstar.list_coll_real_prem(valRecordDate);
        life_agency_vietstar.list_coll_rate(valRecordDate);
        life_agency_vietstar.list_coll_cont_mang(valRecordDate);
        life_agency_vietstar.list_coll_cont_canc(valRecordDate);
        life_agency_vietstar.list_coll_pers_rate(valRecordDate);

        life_agency_vietstar.upload_cagv(valRecordDate);
        life_agency_vietstar.list_cagv_temp(valRecordDate);
        life_agency_vietstar.list_cagv_fyp(valRecordDate);
        life_agency_vietstar.list_cagv_numb_of_poli(valRecordDate);
        life_agency_vietstar.list_cagv_coll_prem(valRecordDate);
        life_agency_vietstar.list_cagv_real_prem(valRecordDate);
        life_agency_vietstar.list_cagv_coll_rate(valRecordDate);
        life_agency_vietstar.list_cagv_cont_mang(valRecordDate);
        life_agency_vietstar.list_cagv_cont_canc(valRecordDate);
        life_agency_vietstar.list_cagv_pers_rate(valRecordDate);

        life_agency_vietstar.upload_cumv(valRecordDate);
        life_agency_vietstar.list_cumv_temp(valRecordDate);
        life_agency_vietstar.list_cumv_fyp(valRecordDate);
        life_agency_vietstar.list_cumv_coll_prem(valRecordDate);
        life_agency_vietstar.list_cumv_real_prem(valRecordDate);
        life_agency_vietstar.list_cumv_real_prem_avrg(valRecordDate);
        life_agency_vietstar.list_cumv_coll_rate_avrg(valRecordDate);
        life_agency_vietstar.list_cumv_cont_mang(valRecordDate);
        life_agency_vietstar.list_cumv_cont_canc(valRecordDate);
        life_agency_vietstar.list_cumv_pers_rate_avrg(valRecordDate);
        life_agency_vietstar.list_cumv_numb_of_agnt(valRecordDate);

        life_agency_vietstar.close_executing(valRecordDate);
    end;

    procedure export_outlet(valRecordDate date := null,
        valKeyID number := null)
    is
    begin
        loop
            delete la_vietstar_outlet tmp
            where tmp.record_date = trunc(valRecordDate, 'YYYY')
                and tmp.type_code = 'VIETSTAR'
                and
                (
                    tmp.company_id = nvl(valKeyID, 0)
                    or
                    nvl(valKeyID, 0) = 0
                )
                and rownum < LIFE_AGENCY_CODE.MAX_DELETE_NUMBER;
            exit when SQL%rowcount < LIFE_AGENCY_CODE.MAX_DELETE_NUMBER - 1;
            commit;
        end loop;
        commit;

        insert into la_vietstar_outlet (
            outlet_id,
            record_date,
            version_date,
            update_datetime,
            type_code,
            outlet_bvlife_id,
            outlet_talisman_id,
            company_id,
            office_id,
            agency_id,
            unit_id,
            position_code,
            be_paid,
            be_executing)
        select key.outlet_id,
            trunc(valRecordDate, 'YYYY'),
            trunc(sysdate, 'DD'),
            sysdate,
            'VIETSTAR',
            key.outlet_bvlife_id,
            key.outlet_talisman_id,
            key.company_id,
            key.sales_office_id,
            key.sales_agency_id,
            key.sales_unit_id,
            key.outlet_posistion_code,
            LIFE_AGENCY_CODE.OUTLET_PAID_YES,
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
        from
        (
            select *
            from la_outlet_key tmp
            where tmp.key_code = nvl(valKeyID, 0)
                and tmp.record_date = trunc(valRecordDate, 'YYYY')
                and tmp.request_code = 'VIETSTAR'
        ) key;
        commit;
    end;

    procedure upload_devu_temp(valRecordDate date := null)
    is
    begin
        execute immediate 'truncate table la_vietstar_temp_devu';
        commit;

        for i in 0..10
        loop
            insert into la_vietstar_temp_devu
            select LIFE_AGENCY_CODE.OUTLET_PAID_OTHER,
                add_months(trunc(valRecordDate, 'YYYY'), i),
                devu.devu_outlet_id,
                null,
                devu.effective_date,
                devu.devu_unit_branch_id,
                devu.devu_position_code
            from
            (
                select
                    -- Ca nhan phat trien nhom
                    life_agency_branch.get_leader_of_branch(
                        life_agency_branch.get_branch_of_agent(
                            lha.agent_id,
                            life_agency_agent.positions_date(
                                (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                                lha.agent_id) - 1,
                                'NHOM'),
                        life_agency_agent.positions_date(
                                (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                                lha.agent_id) - 1) devu_outlet_id,
                    -- Nhom duoc phat trien
                    life_agency_branch.get_branch_of_agent(
                        lha.agent_id,
                        (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                        'NHOM') devu_unit_branch_id,
                    -- Ngay hieu luc phat trien
                    life_agency_agent.positions_date(
                        (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                        lha.agent_id) effective_date,
                    -- Chuc vu Tu van vien truoc khi tro thanh truong nhom moi
                    life_agency_agent.outlet_posistion(
                        life_agency_agent.positions_date(
                            (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                            lha.agent_id) - 1,
                        lha.agent_id) devu_position_code
                from la_history_agent lha
                where lha.type_code = 'CVDL_CODE'
                    and (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1) >= lha.from_date
                    and (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1) < nvl(lha.to_date, '1-jan-2099')
                    and lha.history_value in (
                        LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_UM
                    )
            ) devu
            where devu.effective_date > trunc(valRecordDate, 'YYYY')
                and devu.devu_outlet_id is not null
                and devu.devu_unit_branch_id is not null
                and devu.devu_position_code = LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_PUM;
            commit;
        end loop;
    end;

    procedure upload_psvs(valRecordDate date := null)
    is
    begin
        update la_vietstar_outlet o
        set
            o.psvs_be_paid = LIFE_AGENCY_CODE.OUTLET_PAID_YES,
            o.psvs_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES,
            o.psvs_fyp = 0,
            o.psvs_ip_coup = 0,
            o.psvs_afyp_issu = 0,
            o.psvs_afyp_info = 0,
            o.psvs_pers_rate = 0,
            o.update_datetime = sysdate
        where o.record_date = trunc(valRecordDate, 'YYYY')
            and o.be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES;
        commit;
    end;

    procedure list_psvs_fyp(valRecordDate date := null)
    is
    begin
        merge
            into la_vietstar_outlet o
        using
            (
                select i.outlet_id,
                    i.index_number
                from la_outlet_index i
                where i.record_date = trunc(valRecordDate, 'YYYY')
                    and i.type_code = 'FYP'
                    and i.request_code = 'VIETSTAR'
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            'VIETSTAR' = o.type_code
            and
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.psvs_be_executing
            and
            upd.outlet_id = o.outlet_id
            )
        when matched then
            update
            set
                o.psvs_fyp = upd.index_number,
                o.update_datetime = sysdate;
        commit;
    end;

    procedure list_psvs_fyp_ex(valRecordDate date := null)
    is
    begin
        merge
            into la_vietstar_outlet o
        using
            (
                select i.outlet_id,
                    i.index_number
                from la_outlet_index i
                where i.record_date = trunc(valRecordDate, 'YYYY')
                    and i.type_code = 'FYPE'
                    and i.request_code = 'VIETSTAR'
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            'VIETSTAR' = o.type_code
            and
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.psvs_be_executing
            and
            upd.outlet_id = o.outlet_id
            )
        when matched then
            update
            set
                o.psvs_fyp_ex = upd.index_number,
                o.update_datetime = sysdate;
        commit;
    end;

    procedure list_psvs_ip_coup(valRecordDate date := null)
    is
    begin
        merge
            into la_vietstar_outlet o
        using
            (
                select i.outlet_id,
                    i.index_number
                from la_outlet_index i
                where i.record_date = trunc(valRecordDate, 'YYYY')
                    and i.type_code = 'IPN'
                    and i.request_code = 'VIETSTAR'
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            'VIETSTAR' = o.type_code
            and
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.psvs_be_executing
            and
            upd.outlet_id = o.outlet_id
            and
            o.company_id in
                (
                    select a.company_id
                    from la_vietstar_area a
                    where a.area_id = 1
                )
            )
        when matched then
            update
            set
                o.psvs_ip_coup = upd.index_number,
                o.update_datetime = sysdate;
        commit;

        merge
            into la_vietstar_outlet o
        using
            (
                select i.outlet_id,
                    i.index_number
                from la_outlet_index i
                where i.record_date = trunc(valRecordDate, 'YYYY')
                    and i.type_code = 'IPC'
                    and i.request_code = 'VIETSTAR'
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            'VIETSTAR' = o.type_code
            and
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.psvs_be_executing
            and
            upd.outlet_id = o.outlet_id
            and
            o.company_id in
                (
                    select a.company_id
                    from la_vietstar_area a
                    where a.area_id = 2
                )
            )
        when matched then
            update
            set
                o.psvs_ip_coup = upd.index_number,
                o.update_datetime = sysdate;
        commit;

        merge
            into la_vietstar_outlet o
        using
            (
                select i.outlet_id,
                    i.index_number
                from la_outlet_index i
                where i.record_date = trunc(valRecordDate, 'YYYY')
                    and i.type_code = 'IPS'
                    and i.request_code = 'VIETSTAR'
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            'VIETSTAR' = o.type_code
            and
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.psvs_be_executing
            and
            upd.outlet_id = o.outlet_id
            and
            o.company_id in
                (
                    select a.company_id
                    from la_vietstar_area a
                    where a.area_id = 3
                )
            )
        when matched then
            update
            set
                o.psvs_ip_coup = upd.index_number,
                o.update_datetime = sysdate;
        commit;
    end;

    procedure list_psvs_afyp_issu(valRecordDate date := null)
    is
    begin
        merge
            into la_vietstar_outlet o
        using
            (
                select i.outlet_id,
                    i.index_number
                from la_outlet_index i
                where i.record_date = trunc(valRecordDate, 'YYYY')
                    and i.type_code = 'AFYI'
                    and i.request_code = 'VIETSTAR'
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            'VIETSTAR' = o.type_code
            and
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.psvs_be_executing
            and
            upd.outlet_id = o.outlet_id
            )
        when matched then
            update
            set
                o.psvs_afyp_issu = upd.index_number,
                o.update_datetime = sysdate;
        commit;
    end;

    procedure list_psvs_afyp_info(valRecordDate date := null)
    is
    begin
        merge
            into la_vietstar_outlet o
        using
            (
                select u.outlet_id,
                    sum(u.index_number) index_number
                from
                (
                    select i.outlet_id,
                        i.index_number
                    from la_outlet_index i
                    where i.record_date = trunc(valRecordDate, 'YYYY')
                        and i.type_code = 'AFYI'
                        and i.request_code = 'VIETSTAR'
                    union all
                    select i.outlet_id,
                        -i.index_number index_number
                    from la_outlet_index i
                    where i.record_date = trunc(valRecordDate, 'YYYY')
                        and i.type_code = 'AFYE'
                        and i.request_code = 'VIETSTAR'
                ) u
                group by u.outlet_id
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            'VIETSTAR' = o.type_code
            and
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.psvs_be_executing
            and
            upd.outlet_id = o.outlet_id
            )
        when matched then
            update
            set
                o.psvs_afyp_info = upd.index_number,
                o.update_datetime = sysdate;
        commit;
    end;

    procedure list_psvs_pers_rate(valRecordDate date := null)
    is
    begin
        update la_vietstar_outlet o
        set
            o.psvs_afyp_info = 0,
            o.update_datetime = sysdate
        where o.record_date = trunc(valRecordDate, 'YYYY')
            and o.psvs_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
            and o.psvs_afyp_info < 0;
        commit;

        update la_vietstar_outlet o
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
            and o.psvs_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES;
        commit;
    end;

    procedure upload_umvs(valRecordDate date := null)
    is
    begin
        update la_vietstar_outlet o
        set
            o.umvs_be_paid = LIFE_AGENCY_CODE.OUTLET_PAID_YES,
            o.umvs_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES,
            o.umvs_effective_date = life_agency_agent.positions_date(trunc(valRecordDate, 'MM'), o.outlet_id),
            o.umvs_outlet_id = o.outlet_id,
            o.umvs_branch_id = o.unit_id,
            o.umvs_fyp = 0,
            o.umvs_numb_of_nagt = 0,
            o.update_datetime = sysdate
        where o.record_date = trunc(valRecordDate, 'YYYY')
            and o.be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
            and o.position_code in (
                LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_UM
            );
        commit;
    end;

    procedure list_umvs_temp(valRecordDate date := null)
    is
    begin
        execute immediate 'truncate table la_vietstar_umvs';
        commit;

        for i in 0..10
        loop
            insert /*+ APPEND */ into la_vietstar_umvs nologging
            select key.outlet_id,
                trunc(valRecordDate, 'YYYY'),
                trunc(sysdate, 'DD'),
                sysdate,
                outl.outlet_number,
                outl.outlet_name,
                outl.company_id,
                outl.company_name,
                outl.sales_office_id,
                outl.sales_office_name,
                outl.sales_agency_id,
                outl.sales_agency_name,
                outl.sales_unit_id,
                outl.sales_unit_name,
                LIFE_AGENCY_CODE.OUTLET_PAID_OTHER,
                LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES,
                add_months(trunc(valRecordDate, 'YYYY'), i),
                key.outlet_id umvs_outlet_id,
                case
                    when
                        life_agency_agent.outlet_posistion(
                            (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                            key.outlet_id) = LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_UM then
                        outl.sales_unit_id
                    when
                        life_agency_agent.outlet_posistion(
                            (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1),
                            key.outlet_id) = LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_AM then
                        outl.sales_agency_id
                    else
                        null
                    end umvs_branch_id,
                0
            from
            (
                select v.outlet_id
                from la_vietstar_outlet v
                where v.record_date = trunc(valRecordDate, 'YYYY')
                    and v.type_code = 'VIETSTAR'
                    and v.umvs_be_paid = LIFE_AGENCY_CODE.OUTLET_PAID_YES
                    and v.umvs_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
            ) key
            join
            (
                select *
                from tmp_block_outlet o
                where o.outlet_number like 'D%'
                    and o.from_date <> o.to_date
                    and (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1) >= o.from_date
                    and (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1) < o.to_date
            ) outl
                on outl.outlet_id = key.outlet_id;
            commit;

            delete la_vietstar_umvs o
            where o.record_date = trunc(valRecordDate, 'YYYY')
                and o.umvs_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                and o.outlet_id = o.umvs_outlet_id
                and o.umvs_data_date = add_months(trunc(valRecordDate, 'YYYY'), i)
                and o.umvs_branch_id is null;
            commit;

            insert /*+ APPEND */ into la_vietstar_umvs nologging
            select outl.outlet_id,
                trunc(valRecordDate, 'YYYY'),
                trunc(sysdate, 'DD'),
                sysdate,
                outl.outlet_number,
                outl.outlet_name,
                outl.company_id,
                outl.company_name,
                outl.sales_office_id,
                outl.sales_office_name,
                outl.sales_agency_id,
                outl.sales_agency_name,
                outl.sales_unit_id,
                outl.sales_unit_name,
                LIFE_AGENCY_CODE.OUTLET_PAID_OTHER,
                LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES,
                add_months(trunc(valRecordDate, 'YYYY'), i),
                key.umvs_outlet_id umvs_outlet_id,
                key.umvs_branch_id umvs_branch_id,
                0
            from
            (
                select tmp.outlet_id,
                    tmp.umvs_outlet_id,
                    tmp.umvs_branch_id
                from la_vietstar_umvs tmp
                where tmp.umvs_data_date = add_months(trunc(valRecordDate, 'YYYY'), i)
                    and tmp.outlet_id = tmp.umvs_outlet_id
            ) key
            join
            (
                select *
                from tmp_block_outlet tmp
                where tmp.outlet_number like 'D%'
                    and tmp.from_date <> tmp.to_date
                    and (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1) >= tmp.from_date
                    and (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1) < tmp.to_date
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

            insert /*+ APPEND */ into la_vietstar_umvs nologging
            select outl.outlet_id,
                trunc(valRecordDate, 'YYYY'),
                trunc(sysdate, 'DD'),
                sysdate,
                outl.outlet_number,
                outl.outlet_name,
                outl.company_id,
                outl.company_name,
                outl.sales_office_id,
                outl.sales_office_name,
                outl.sales_agency_id,
                outl.sales_agency_name,
                outl.sales_unit_id,
                outl.sales_unit_name,
                LIFE_AGENCY_CODE.OUTLET_PAID_OTHER,
                LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES,
                add_months(trunc(valRecordDate, 'YYYY'), i),
                key.umvs_outlet_id umvs_outlet_id,
                key.umvs_branch_id umvs_branch_id,
                0
            from
            (
                select tmp.outlet_id,
                    tmp.umvs_outlet_id,
                    tmp.umvs_branch_id
                from la_vietstar_umvs tmp
                where tmp.umvs_data_date = add_months(trunc(valRecordDate, 'YYYY'), i)
                    and tmp.outlet_id = tmp.umvs_outlet_id
            ) key
            join
            (
                select tmp.outlet_id,
                    tmp.devu_branch_id
                from la_vietstar_temp_devu tmp
                where tmp.record_date = add_months(trunc(valRecordDate, 'YYYY'), i)
            ) devu
                on
                (
                    devu.outlet_id = key.umvs_outlet_id
                )
            join
            (
                select *
                from tmp_block_outlet tmp
                where tmp.outlet_number like 'D%'
                    and tmp.from_date <> tmp.to_date
                    and (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1) >= tmp.from_date
                    and (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1) < tmp.to_date
            ) outl
                on
                (
                    outl.sales_unit_id = devu.devu_branch_id
                    and
                    outl.outlet_id <> key.umvs_outlet_id
                );
            commit;
        end loop;

        execute immediate 'truncate table la_vietstar_umvs_empl';
        commit;

        insert /*+ APPEND */ into la_vietstar_umvs_empl nologging
        select outl.outlet_id,
            trunc(valRecordDate, 'YYYY'),
            trunc(sysdate, 'DD'),
            sysdate,
            outl.outlet_number,
            outl.outlet_name,
            outl.company_id,
            outl.company_name,
            outl.sales_office_id,
            outl.sales_office_name,
            outl.sales_agency_id,
            outl.sales_agency_name,
            outl.sales_unit_id,
            outl.sales_unit_name,
            null,
            LIFE_AGENCY_CODE.OUTLET_PAID_YES,
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES,
            null,
            null,
            0,
            0
        from
        (
            select *
            from tmp_block_outlet o
            where o.outlet_number like 'D%'
                and o.from_date <> o.to_date
                and (add_months(trunc(valRecordDate, 'MM'), 1) - 1) >= o.from_date
                and (add_months(trunc(valRecordDate, 'MM'), 1) - 1) < o.to_date
        ) outl;
        commit;

        merge
            into la_vietstar_umvs_empl o
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
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.umvs_be_executing
            and
            upd.outlet_id = o.outlet_id
            )
        when matched then
            update
            set
                o.begin_working_date = upd.begin_working_date,
                o.umvs_data_date = trunc(upd.begin_working_date, 'MM'),
                o.update_datetime = sysdate;
        commit;

        delete la_vietstar_umvs_empl o
        where o.record_date = trunc(valRecordDate, 'YYYY')
             and o.umvs_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
             and (
                 o.begin_working_date is null
                 or
                 o.begin_working_date < trunc(valRecordDate, 'YYYY')
             );
        commit;
    end;

    procedure list_umvs_fyp(valRecordDate date := null)
    is
    begin
        merge
            into la_vietstar_umvs o
        using
            (
                select tmp.outlet_id,
                    trunc(tmp.transaction_date, 'MM') umvs_data_date,
                    sum(nvl(tmp.transaction_fyp, 0)) index_number
                from la_vietstar_trans tmp
                where tmp.record_date = trunc(valRecordDate, 'YYYY')
                    and tmp.transaction_date < trunc(valRecordDate, 'MM')
                group by tmp.outlet_id,
                    trunc(tmp.transaction_date, 'MM')
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.umvs_be_executing
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

        merge
            into la_vietstar_umvs o
        using
            (
                select tmp.outlet_id,
                    trunc(valRecordDate, 'MM') umvs_data_date,
                    sum(nvl(tmp.transaction_fyp, 0)) index_number
                from la_vietstar_trans tmp
                where tmp.record_date = trunc(valRecordDate, 'YYYY')
                    and tmp.transaction_date >= trunc(valRecordDate, 'MM')
                group by tmp.outlet_id
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.umvs_be_executing
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

        merge
            into la_vietstar_outlet o
        using
            (
                select tmp.umvs_outlet_id outlet_id,
                    sum(nvl(tmp.umvs_fyp, 0)) index_number
                from la_vietstar_umvs tmp
                where tmp.record_date = trunc(valRecordDate, 'YYYY')
                    and tmp.umvs_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                    and tmp.umvs_be_paid = LIFE_AGENCY_CODE.OUTLET_PAID_OTHER
                    and tmp.outlet_id <> tmp.umvs_outlet_id
                group by tmp.umvs_outlet_id
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            'VIETSTAR' = o.type_code
            and
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.umvs_be_executing
            and
            upd.outlet_id = o.outlet_id
            )
        when matched then
            update
            set
                o.umvs_fyp = upd.index_number,
                o.update_datetime = sysdate;
        commit;
    end;

    procedure list_umvs_empl(valRecordDate date := null)
    is
    begin
        merge
            into la_vietstar_umvs_empl o
        using
            (
                select lha.agent_id outlet_id,
                    lha.history_number empl_id
                from la_history_agent lha
                where lha.type_code = 'DLTD'
                    and lha.current_is = 'Y'
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.umvs_be_executing
            and
            upd.outlet_id = o.outlet_id
            )
        when matched then
            update
            set
                o.umvs_empl_id = upd.empl_id,
                o.update_datetime = sysdate;
        commit;
    end;

    procedure list_umvs_fyp_60days(valRecordDate date := null)
    is
    begin
        merge
            into la_vietstar_umvs_empl o
        using
            (
                select outl.outlet_id,
                    sum(tran.transaction_fyp) index_number
                from
                (
                    select tmp.outlet_id,
                        (tmp.begin_working_date) begin_date,
                        (tmp.begin_working_date + 59) end_date
                    from la_vietstar_umvs_empl tmp
                    where tmp.record_date = trunc(valRecordDate, 'YYYY')
                        and tmp.umvs_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                ) outl
                join la_vietstar_trans tran
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
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.umvs_be_executing
            and
            upd.outlet_id = o.outlet_id
            )
        when matched then
            update
            set
                o.umvs_fyp_60_days = upd.index_number,
                o.update_datetime = sysdate;
        commit;
    end;

    procedure list_umvs_numb_of_nagt(valRecordDate date := null)
    is
    begin
        update la_vietstar_umvs_empl v
        set
            v.umvs_numb_of_nagt = 1,
            v.update_datetime = sysdate
        where v.record_date = trunc(valRecordDate, 'YYYY')
            and v.umvs_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
            and v.umvs_be_paid = LIFE_AGENCY_CODE.OUTLET_PAID_YES
            and nvl(v.umvs_fyp_60_days, 0) >= 6000000;
        commit;

        merge
            into la_vietstar_outlet o
        using
            (
                select empl.umvs_outlet_id,
                    sum(outl.umvs_numb_of_nagt) index_number
                from
                (
                    select v.outlet_id,
                        v.umvs_data_date,
                        v.umvs_outlet_id
                    from la_vietstar_umvs v
                    where v.record_date = trunc(valRecordDate, 'YYYY')
                        and v.umvs_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                        and v.umvs_be_paid = LIFE_AGENCY_CODE.OUTLET_PAID_OTHER
                ) empl
                join
                (
                    select v.umvs_empl_id,
                        v.outlet_id,
                        v.umvs_data_date,
                        v.umvs_numb_of_nagt
                    from la_vietstar_umvs_empl v
                    where v.record_date = trunc(valRecordDate, 'YYYY')
                        and v.umvs_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                        and v.umvs_be_paid = LIFE_AGENCY_CODE.OUTLET_PAID_YES
                        and v.umvs_numb_of_nagt = 1
                ) outl
                    on
                    (
                        outl.umvs_empl_id = empl.outlet_id
                        and
                        outl.umvs_data_date = empl.umvs_data_date
                    )
                group by empl.umvs_outlet_id
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            'VIETSTAR' = o.type_code
            and
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.umvs_be_executing
            and
            upd.umvs_outlet_id = o.outlet_id
            )
        when matched then
            update
            set
                o.umvs_numb_of_nagt = upd.index_number,
                o.update_datetime = sysdate;
        commit;
    end;

    procedure upload_amvs(valRecordDate date := null)
    is
    begin
        update la_vietstar_outlet o
        set
            o.amvs_be_paid = LIFE_AGENCY_CODE.OUTLET_PAID_YES,
            o.amvs_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES,
            o.amvs_effective_date = life_agency_agent.positions_date(trunc(valRecordDate, 'MM'), o.outlet_id),
            o.amvs_outlet_id = o.outlet_id,
            o.amvs_branch_id = o.agency_id,
            o.amvs_fyp = 0,
            o.update_datetime = sysdate
        where o.record_date = trunc(valRecordDate, 'YYYY')
            and o.be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
            and o.position_code in (
                LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_AM
            );
        commit;
    end;

    procedure list_amvs_temp(valRecordDate date := null)
    is
    begin
        execute immediate 'truncate table la_vietstar_amvs';
        commit;

        for i in 0..10
        loop
            insert /*+ APPEND */ into la_vietstar_amvs nologging
            select outl.outlet_id,
                trunc(valRecordDate, 'YYYY'),
                trunc(sysdate, 'DD'),
                sysdate,
                outl.outlet_number,
                outl.outlet_name,
                outl.company_id,
                outl.company_name,
                outl.sales_office_id,
                outl.sales_office_name,
                outl.sales_agency_id,
                outl.sales_agency_name,
                outl.sales_unit_id,
                outl.sales_unit_name,
                LIFE_AGENCY_CODE.OUTLET_PAID_OTHER,
                LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES,
                add_months(trunc(valRecordDate, 'YYYY'), i),
                key.outlet_id amvs_outlet_id,
                key.amvs_branch_id,
                0
            from
            (
                select v.outlet_id,
                    v.amvs_outlet_id,
                    v.amvs_branch_id,
                    v.amvs_effective_date
                from la_vietstar_outlet v
                where v.record_date = trunc(valRecordDate, 'YYYY')
                    and v.type_code = 'VIETSTAR'
                    and v.amvs_be_paid = LIFE_AGENCY_CODE.OUTLET_PAID_YES
                    and v.amvs_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
            ) key
            join
            (
                select *
                from tmp_block_outlet tmp
                where tmp.outlet_number like 'D%'
                    and tmp.from_date <> tmp.to_date
                    and (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1) >= tmp.from_date
                    and (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1) < tmp.to_date
            ) outl
                on
                (
                    outl.sales_agency_id = key.amvs_branch_id
                    and
                    (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1) >= key.amvs_effective_date
                );
            commit;
        end loop;
    end;

    procedure list_amvs_fyp(valRecordDate date := null)
    is
    begin
        merge
            into la_vietstar_amvs o
        using
            (
                select tmp.outlet_id,
                    trunc(tmp.transaction_date, 'MM') amvs_data_date,
                    sum(nvl(tmp.transaction_fyp, 0)) index_number
                from la_vietstar_trans tmp
                where tmp.record_date = trunc(valRecordDate, 'YYYY')
                    and tmp.transaction_date < trunc(valRecordDate, 'MM')
                group by tmp.outlet_id,
                    trunc(tmp.transaction_date, 'MM')
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.amvs_be_executing
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

        merge
            into la_vietstar_amvs o
        using
            (
                select tmp.outlet_id,
                    trunc(valRecordDate, 'MM') amvs_data_date,
                    sum(nvl(tmp.transaction_fyp, 0)) index_number
                from la_vietstar_trans tmp
                where tmp.record_date = trunc(valRecordDate, 'YYYY')
                    and tmp.transaction_date >= trunc(valRecordDate, 'MM')
                group by tmp.outlet_id
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.amvs_be_executing
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

        merge
            into la_vietstar_outlet o
        using
            (
                select tmp.amvs_outlet_id outlet_id,
                    sum(nvl(tmp.amvs_fyp, 0)) index_number
                from la_vietstar_amvs tmp
                where tmp.record_date = trunc(valRecordDate, 'YYYY')
                    and tmp.amvs_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                    and tmp.amvs_be_paid = LIFE_AGENCY_CODE.OUTLET_PAID_OTHER
                    and tmp.outlet_id <> tmp.amvs_outlet_id
                group by tmp.amvs_outlet_id
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            'VIETSTAR' = o.type_code
            and
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.amvs_be_executing
            and
            upd.outlet_id = o.outlet_id
            )
        when matched then
            update
            set
                o.amvs_fyp = upd.index_number,
                o.update_datetime = sysdate;
        commit;
    end;

    procedure upload_coll(valRecordDate date := null)
    is
    begin
        execute immediate 'truncate table la_vietstar_coll';
        commit;

        for i in 0..10
        loop
            insert /*+ APPEND */ into la_vietstar_coll nologging
            select outl.outlet_id,
                trunc(valRecordDate, 'YYYY'),
                trunc(sysdate, 'DD'),
                sysdate,
                outl.outlet_number,
                outl.outlet_name,
                outl.company_id,
                outl.company_name,
                outl.sales_office_id,
                outl.sales_office_name,
                outl.sales_agency_id,
                outl.sales_agency_name,
                outl.sales_unit_id,
                outl.sales_unit_name,
                LIFE_AGENCY_CODE.OUTLET_PAID_OTHER,
                LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES,
                add_months(trunc(valRecordDate, 'YYYY'), i),
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
                select *
                from tmp_block_outlet o
                where o.outlet_number like 'D%'
                    and o.from_date <> o.to_date
                    and (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1) >= o.from_date
                    and (add_months(trunc(valRecordDate, 'YYYY'), i + 1) - 1) < o.to_date
            ) outl;
            commit;
        end loop;
    end;

    procedure list_coll_fyp(valRecordDate date := null)
    is
    begin
        merge
            into la_vietstar_coll o
        using
            (
                select tmp.outlet_id,
                    trunc(tmp.transaction_date, 'MM') coll_data_date,
                    sum(nvl(tmp.transaction_fyp, 0)) index_number
                from la_vietstar_trans tmp
                where tmp.record_date = trunc(valRecordDate, 'YYYY')
                    and tmp.transaction_date < trunc(valRecordDate, 'MM')
                group by tmp.outlet_id,
                    trunc(tmp.transaction_date, 'MM')
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.coll_be_executing
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
            into la_vietstar_coll o
        using
            (
                select tmp.outlet_id,
                    trunc(valRecordDate, 'MM') coll_data_date,
                    sum(nvl(tmp.transaction_fyp, 0)) index_number
                from la_vietstar_trans tmp
                where tmp.record_date = trunc(valRecordDate, 'YYYY')
                    and tmp.transaction_date >= trunc(valRecordDate, 'MM')
                group by tmp.outlet_id
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.coll_be_executing
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
    end;

    procedure list_coll_numb_of_poli(valRecordDate date := null)
    is
    begin
        merge
            into la_vietstar_coll o
        using
            (
                select i.agent_id outlet_id,
                    i.record_date coll_data_date,
                    i.index_value_number index_number
                from la_index i
                where i.record_date between trunc(valRecordDate, 'YYYY') and add_months(trunc(valRecordDate, 'YYYY'), 10)
                    and i.index_code = 'CONT_MANG_FIXD'
                    and i.group_code = 'COLL'
                    and i.category_code = 'INDX'
                    and i.time_frequency = 'MONTHLY'
                    and i.type_data = 'OUTL'
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.coll_be_executing
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
    end;

    procedure list_coll_coll_prem(valRecordDate date := null)
    is
    begin
        merge
            into la_vietstar_coll o
        using
            (
                select i.agent_id outlet_id,
                    i.record_date coll_data_date,
                    i.index_value_number index_number
                from la_index i
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
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.coll_be_executing
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
    end;

    procedure list_coll_real_prem(valRecordDate date := null)
    is
    begin
        merge
            into la_vietstar_coll o
        using
            (
                select i.agent_id outlet_id,
                    i.record_date coll_data_date,
                    i.index_value_number index_number
                from la_index i
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
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.coll_be_executing
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
    end;

    procedure list_coll_rate(valRecordDate date := null)
    is
    begin
        merge
            into la_vietstar_coll o
        using
            (
                select i.agent_id outlet_id,
                    i.record_date coll_data_date,
                    i.index_value_number index_number
                from la_index i
                where i.record_date between trunc(valRecordDate, 'YYYY') and add_months(trunc(valRecordDate, 'YYYY'), 10)
                    and i.index_code = 'COLL_RATE'
                    and i.group_code = 'COLL'
                    and i.category_code = 'INDX'
                    and i.time_frequency = 'MONTHLY'
                    and i.type_data = 'OUTL'
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.coll_be_executing
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
    end;

    procedure list_coll_cont_mang(valRecordDate date := null)
    is
    begin
        merge
            into la_vietstar_coll o
        using
            (
                select i.agent_id outlet_id,
                    i.record_date coll_data_date,
                    i.index_value_number index_number
                from la_index i
                where i.record_date between trunc(valRecordDate, 'YYYY') and add_months(trunc(valRecordDate, 'YYYY'), 10)
                    and i.index_code = 'CONT_MANG'
                    and i.group_code = 'COLL'
                    and i.category_code = 'INDX'
                    and i.time_frequency = 'MONTHLY'
                    and i.type_data = 'OUTL'
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.coll_be_executing
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
    end;

    procedure list_coll_cont_canc(valRecordDate date := null)
    is
    begin
        merge
            into la_vietstar_coll o
        using
            (
                select i.agent_id outlet_id,
                    i.record_date coll_data_date,
                    i.index_value_number index_number
                from la_index i
                where i.record_date between trunc(valRecordDate, 'YYYY') and add_months(trunc(valRecordDate, 'YYYY'), 10)
                    and i.index_code = 'CONT_CANC'
                    and i.group_code = 'COLL'
                    and i.category_code = 'INDX'
                    and i.time_frequency = 'MONTHLY'
                    and i.type_data = 'OUTL'
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.coll_be_executing
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
    end;

    procedure list_coll_pers_rate(valRecordDate date := null)
    is
    begin
        merge
            into la_vietstar_coll o
        using
            (
                select i.agent_id outlet_id,
                    i.record_date coll_data_date,
                    i.index_value_number index_number
                from la_index i
                where i.record_date between trunc(valRecordDate, 'YYYY') and add_months(trunc(valRecordDate, 'YYYY'), 10)
                    and i.index_code = 'PSTC_RATE'
                    and i.group_code = 'COLL'
                    and i.category_code = 'INDX'
                    and i.time_frequency = 'MONTHLY'
                    and i.type_data = 'OUTL'
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.coll_be_executing
            and
            upd.outlet_id = o.outlet_id
            and
            upd.coll_data_date = o.coll_data_date
            )
        when matched then
            update
            set
                o.coll_pers_rate = upd.index_number,
                o.update_datetime = sysdate;
        commit;
    end;

    procedure upload_cagv(valRecordDate date := null)
    is
    begin
        update la_vietstar_outlet o
        set
            o.cagv_be_paid = LIFE_AGENCY_CODE.OUTLET_PAID_YES,
            o.cagv_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES,
            o.cagv_fyp = 0,
            o.cagv_coll_rate_avrg = 0,
            o.cagv_pers_rate_avrg = 0,
            o.cagv_numb_of_poli = 0,
            o.update_datetime = sysdate
        where o.record_date = trunc(valRecordDate, 'YYYY')
            and o.be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES;
        commit;
    end;

    procedure list_cagv_temp(valRecordDate date := null)
    is
    begin
        null;
    end;

    procedure list_cagv_fyp(valRecordDate date := null)
    is
    begin
        update la_vietstar_outlet o
        set
            o.cagv_fyp = o.psvs_fyp,
            o.update_datetime = sysdate
        where o.record_date = trunc(valRecordDate, 'YYYY')
            and o.cagv_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES;
        commit;
    end;

    procedure list_cagv_numb_of_poli(valRecordDate date := null)
    is
    begin
        merge
            into la_vietstar_outlet o
        using
            (
                select v.outlet_id,
                    (sum(nvl(v.coll_numb_of_poli, 0)) / count(*)) index_number
                from la_vietstar_coll v
                where v.record_date = trunc(valRecordDate, 'YYYY')
                    and v.coll_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                group by v.outlet_id
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            'VIETSTAR' = o.type_code
            and
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.cagv_be_executing
            and
            upd.outlet_id = o.outlet_id
            )
        when matched then
            update
            set
                o.cagv_numb_of_poli = upd.index_number,
                o.update_datetime = sysdate;
        commit;
    end;

    procedure list_cagv_coll_prem(valRecordDate date := null)
    is
    begin
        merge
            into la_vietstar_outlet o
        using
            (
                select v.outlet_id,
                    sum(nvl(v.coll_coll_prem, 0)) index_number
                from la_vietstar_coll v
                where v.record_date = trunc(valRecordDate, 'YYYY')
                    and v.coll_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                group by v.outlet_id
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            'VIETSTAR' = o.type_code
            and
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.cagv_be_executing
            and
            upd.outlet_id = o.outlet_id
            )
        when matched then
            update
            set
                o.cagv_coll_prem = upd.index_number,
                o.update_datetime = sysdate;
        commit;
    end;

    procedure list_cagv_real_prem(valRecordDate date := null)
    is
    begin
        merge
            into la_vietstar_outlet o
        using
            (
                select v.outlet_id,
                    sum(nvl(v.coll_real_prem, 0)) index_number
                from la_vietstar_coll v
                where v.record_date = trunc(valRecordDate, 'YYYY')
                    and v.coll_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                group by v.outlet_id
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            'VIETSTAR' = o.type_code
            and
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.cagv_be_executing
            and
            upd.outlet_id = o.outlet_id
            )
        when matched then
            update
            set
                o.cagv_real_prem = upd.index_number,
                o.update_datetime = sysdate;
        commit;
    end;

    procedure list_cagv_coll_rate(valRecordDate date := null)
    is
    begin
        update la_vietstar_outlet o
        set
            o.cagv_coll_rate_avrg = decode(
                nvl(o.cagv_coll_prem, 0), 0, 100,
                nvl(o.cagv_real_prem, 0) / nvl(o.cagv_coll_prem, 0) * 100),
            o.update_datetime = sysdate
        where o.record_date = trunc(valRecordDate, 'YYYY')
            and o.cagv_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES;
        commit;
    end;

    procedure list_cagv_cont_mang(valRecordDate date := null)
    is
    begin
        merge
            into la_vietstar_outlet o
        using
            (
                select v.outlet_id,
                    sum(nvl(v.coll_cont_mang, 0)) index_number
                from la_vietstar_coll v
                where v.record_date = trunc(valRecordDate, 'YYYY')
                    and v.coll_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                group by v.outlet_id
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            'VIETSTAR' = o.type_code
            and
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.cagv_be_executing
            and
            upd.outlet_id = o.outlet_id
            )
        when matched then
            update
            set
                o.cagv_cont_mang = upd.index_number,
                o.update_datetime = sysdate;
        commit;
    end;

    procedure list_cagv_cont_canc(valRecordDate date := null)
    is
    begin
        merge
            into la_vietstar_outlet o
        using
            (
                select v.outlet_id,
                    sum(nvl(v.coll_cont_canc, 0)) index_number
                from la_vietstar_coll v
                where v.record_date = trunc(valRecordDate, 'YYYY')
                    and v.coll_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                group by v.outlet_id
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            'VIETSTAR' = o.type_code
            and
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.cagv_be_executing
            and
            upd.outlet_id = o.outlet_id
            )
        when matched then
            update
            set
                o.cagv_cont_canc = upd.index_number,
                o.update_datetime = sysdate;
        commit;
    end;

    procedure list_cagv_pers_rate(valRecordDate date := null)
    is
    begin
        update la_vietstar_outlet o
        set
            o.cagv_pers_rate_avrg = decode(
                nvl(o.cagv_cont_mang, 0), 0, 100,
                (nvl(o.cagv_cont_mang, 0) - nvl(o.cagv_cont_canc, 0)) / nvl(o.cagv_cont_mang, 0) * 100),
            o.update_datetime = sysdate
        where o.record_date = trunc(valRecordDate, 'YYYY')
            and o.cagv_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES;
        commit;
    end;

    procedure upload_cumv(valRecordDate date := null)
    is
    begin
        update la_vietstar_outlet o
        set
            o.cumv_be_paid = LIFE_AGENCY_CODE.OUTLET_PAID_YES,
            o.cumv_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES,
            o.cumv_effective_date = life_agency_agent.positions_date(trunc(valRecordDate, 'MM'), o.outlet_id),
            o.cumv_outlet_id = o.outlet_id,
            o.cumv_branch_id = o.unit_id,
            o.cumv_fyp = 0,
            o.cumv_real_prem_avrg = 0,
            o.cumv_coll_rate_avrg = 0,
            o.cumv_pers_rate_avrg = 0,
            o.cumv_numb_of_agnt = 0,
            o.update_datetime = sysdate
        where o.record_date = trunc(valRecordDate, 'YYYY')
            and o.be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
            and o.position_code in (
                LIFE_AGENCY_CODE.OUTLET_TYPE_CODE_CUM
            );
        commit;
    end;

    procedure list_cumv_temp(valRecordDate date := null)
    is
    begin
        null;
    end;

    procedure list_cumv_fyp(valRecordDate date := null)
    is
    begin
        merge
            into la_vietstar_outlet o
        using
            (
                select cumv.cumv_branch_id,
                    sum(coll.coll_fyp) index_number
                from
                (
                    select tmp.outlet_id,
                        tmp.cumv_outlet_id,
                        tmp.cumv_branch_id,
                        tmp.cumv_effective_date
                    from la_vietstar_outlet tmp
                    where tmp.record_date = trunc(valRecordDate, 'YYYY')
                        and tmp.cumv_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                ) cumv
                join
                (
                    select v.outlet_id,
                        v.unit_id cumv_branch_id,
                        v.coll_data_date,
                        v.coll_fyp
                    from la_vietstar_coll v
                    where v.record_date = trunc(valRecordDate, 'YYYY')
                        and v.coll_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                ) coll
                    on
                    (
                        coll.cumv_branch_id = cumv.cumv_branch_id
                        and
                        coll.coll_data_date >= cumv.cumv_effective_date
                    )
                group by cumv.cumv_branch_id
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            'VIETSTAR' = o.type_code
            and
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.cumv_be_executing
            and
            upd.cumv_branch_id = o.cumv_branch_id
            )
        when matched then
            update
            set
                o.cumv_fyp = upd.index_number,
                o.update_datetime = sysdate;
        commit;
    end;

    procedure list_cumv_coll_prem(valRecordDate date := null)
    is
    begin
        merge
            into la_vietstar_outlet o
        using
            (
                select cumv.cumv_branch_id,
                    sum(coll.coll_coll_prem) index_number
                from
                (
                    select tmp.outlet_id,
                        tmp.cumv_outlet_id,
                        tmp.cumv_branch_id,
                        tmp.cumv_effective_date
                    from la_vietstar_outlet tmp
                    where tmp.record_date = trunc(valRecordDate, 'YYYY')
                        and tmp.cumv_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                ) cumv
                join
                (
                    select v.outlet_id,
                        v.unit_id cumv_branch_id,
                        v.coll_data_date,
                        v.coll_coll_prem
                    from la_vietstar_coll v
                    where v.record_date = trunc(valRecordDate, 'YYYY')
                        and v.coll_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                ) coll
                    on
                    (
                        coll.cumv_branch_id = cumv.cumv_branch_id
                        and
                        coll.coll_data_date >= cumv.cumv_effective_date
                    )
                group by cumv.cumv_branch_id
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            'VIETSTAR' = o.type_code
            and
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.cumv_be_executing
            and
            upd.cumv_branch_id = o.cumv_branch_id
            )
        when matched then
            update
            set
                o.cumv_coll_prem = upd.index_number,
                o.update_datetime = sysdate;
        commit;
    end;

    procedure list_cumv_real_prem(valRecordDate date := null)
    is
    begin
        merge
            into la_vietstar_outlet o
        using
            (
                select cumv.cumv_branch_id,
                    sum(coll.coll_real_prem) index_number
                from
                (
                    select tmp.outlet_id,
                        tmp.cumv_outlet_id,
                        tmp.cumv_branch_id,
                        tmp.cumv_effective_date
                    from la_vietstar_outlet tmp
                    where tmp.record_date = trunc(valRecordDate, 'YYYY')
                        and tmp.cumv_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                ) cumv
                join
                (
                    select v.outlet_id,
                        v.unit_id cumv_branch_id,
                        v.coll_data_date,
                        v.coll_real_prem
                    from la_vietstar_coll v
                    where v.record_date = trunc(valRecordDate, 'YYYY')
                        and v.coll_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                ) coll
                    on
                    (
                        coll.cumv_branch_id = cumv.cumv_branch_id
                        and
                        coll.coll_data_date >= cumv.cumv_effective_date
                    )
                group by cumv.cumv_branch_id
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            'VIETSTAR' = o.type_code
            and
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.cumv_be_executing
            and
            upd.cumv_branch_id = o.cumv_branch_id
            )
        when matched then
            update
            set
                o.cumv_real_prem = upd.index_number,
                o.update_datetime = sysdate;
        commit;
    end;

    procedure list_cumv_real_prem_avrg(valRecordDate date := null)
    is
    begin
        merge
            into la_vietstar_outlet o
        using
            (
                select grou.cumv_branch_id,
                    sum(grou.coll_real_prem) / count(*) index_number
                from
                (
                    select cumv.cumv_branch_id,
                        coll.coll_data_date,
                        sum(coll.coll_real_prem) coll_real_prem
                    from
                    (
                        select tmp.outlet_id,
                            tmp.cumv_outlet_id,
                            tmp.cumv_branch_id,
                            tmp.cumv_effective_date
                        from la_vietstar_outlet tmp
                        where tmp.record_date = trunc(valRecordDate, 'YYYY')
                            and tmp.cumv_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                    ) cumv
                    join
                    (
                        select v.outlet_id,
                            v.unit_id cumv_branch_id,
                            v.coll_data_date,
                            v.coll_real_prem
                        from la_vietstar_coll v
                        where v.record_date = trunc(valRecordDate, 'YYYY')
                            and v.coll_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                    ) coll
                        on
                        (
                            coll.cumv_branch_id = cumv.cumv_branch_id
                            and
                            coll.coll_data_date >= cumv.cumv_effective_date
                        )
                    group by cumv.cumv_branch_id,
                        coll.coll_data_date
                ) grou
                group by grou.cumv_branch_id
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            'VIETSTAR' = o.type_code
            and
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.cumv_be_executing
            and
            upd.cumv_branch_id = o.cumv_branch_id
            )
        when matched then
            update
            set
                o.cumv_real_prem_avrg = upd.index_number,
                o.update_datetime = sysdate;
        commit;
    end;

    procedure list_cumv_coll_rate_avrg(valRecordDate date := null)
    is
    begin
        update la_vietstar_outlet o
        set
            o.cumv_coll_rate_avrg = decode(
                nvl(o.cumv_coll_prem, 0), 0, 100,
                nvl(o.cumv_real_prem, 0) / nvl(o.cumv_coll_prem, 0) * 100),
            o.update_datetime = sysdate
        where o.record_date = trunc(valRecordDate, 'YYYY')
            and o.cumv_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES;
        commit;
    end;

    procedure list_cumv_cont_mang(valRecordDate date := null)
    is
    begin
        merge
            into la_vietstar_outlet o
        using
            (
                select cumv.cumv_branch_id,
                    sum(coll.coll_cont_mang) index_number
                from
                (
                    select tmp.outlet_id,
                        tmp.cumv_outlet_id,
                        tmp.cumv_branch_id,
                        tmp.cumv_effective_date
                    from la_vietstar_outlet tmp
                    where tmp.record_date = trunc(valRecordDate, 'YYYY')
                        and tmp.cumv_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                ) cumv
                join
                (
                    select v.outlet_id,
                        v.unit_id cumv_branch_id,
                        v.coll_data_date,
                        v.coll_cont_mang
                    from la_vietstar_coll v
                    where v.record_date = trunc(valRecordDate, 'YYYY')
                        and v.coll_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                ) coll
                    on
                    (
                        coll.cumv_branch_id = cumv.cumv_branch_id
                        and
                        coll.coll_data_date >= cumv.cumv_effective_date
                    )
                group by cumv.cumv_branch_id
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            'VIETSTAR' = o.type_code
            and
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.cumv_be_executing
            and
            upd.cumv_branch_id = o.cumv_branch_id
            )
        when matched then
            update
            set
                o.cumv_cont_mang = upd.index_number,
                o.update_datetime = sysdate;
        commit;
    end;

    procedure list_cumv_cont_canc(valRecordDate date := null)
    is
    begin
        merge
            into la_vietstar_outlet o
        using
            (
                select cumv.cumv_branch_id,
                    sum(coll.coll_cont_canc) index_number
                from
                (
                    select tmp.outlet_id,
                        tmp.cumv_outlet_id,
                        tmp.cumv_branch_id,
                        tmp.cumv_effective_date
                    from la_vietstar_outlet tmp
                    where tmp.record_date = trunc(valRecordDate, 'YYYY')
                        and tmp.cumv_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                ) cumv
                join
                (
                    select v.outlet_id,
                        v.unit_id cumv_branch_id,
                        v.coll_data_date,
                        v.coll_cont_canc
                    from la_vietstar_coll v
                    where v.record_date = trunc(valRecordDate, 'YYYY')
                        and v.coll_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES
                ) coll
                    on
                    (
                        coll.cumv_branch_id = cumv.cumv_branch_id
                        and
                        coll.coll_data_date >= cumv.cumv_effective_date
                    )
                group by cumv.cumv_branch_id
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            'VIETSTAR' = o.type_code
            and
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.cumv_be_executing
            and
            upd.cumv_branch_id = o.cumv_branch_id
            )
        when matched then
            update
            set
                o.cumv_cont_canc = upd.index_number,
                o.update_datetime = sysdate;
        commit;
    end;

    procedure list_cumv_pers_rate_avrg(valRecordDate date := null)
    is
    begin
        update la_vietstar_outlet o
        set
            o.cumv_pers_rate_avrg = decode(
                nvl(o.cumv_cont_mang, 0), 0, 100,
                (nvl(o.cumv_cont_mang, 0) - nvl(o.cumv_cont_canc, 0)) / nvl(o.cumv_cont_mang, 0) * 100),
            o.update_datetime = sysdate
        where o.record_date = trunc(valRecordDate, 'YYYY')
            and o.cumv_be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES;
        commit;
    end;

    procedure list_cumv_numb_of_agnt(valRecordDate date := null)
    is
    begin
        merge
            into la_vietstar_outlet o
        using
            (
                select tmp.sales_unit_id cumv_branch_id,
                    count(*) index_number
                from tmp_block_outlet tmp
                where tmp.outlet_number like 'D%'
                    and tmp.from_date <> tmp.to_date
                    and (add_months(trunc(valRecordDate, 'MM'), 1) - 1) >= tmp.from_date
                    and (add_months(trunc(valRecordDate, 'MM'), 1) - 1) < tmp.to_date
                    and tmp.sales_unit_id is not null
                group by tmp.sales_unit_id
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            'VIETSTAR' = o.type_code
            and
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.cumv_be_executing
            and
            upd.cumv_branch_id = o.cumv_branch_id
            )
        when matched then
            update
            set
                o.cumv_numb_of_agnt = upd.index_number,
                o.update_datetime = sysdate;
        commit;
    end;

    procedure close_executing(valRecordDate date := null)
    is
    begin
        merge
            into la_vietstar_outlet o
        using
            (
                select *
                from tmp_block_outlet tmp
                where (add_months(trunc(valRecordDate, 'MM'), 1) - 1) >= tmp.from_date
                    and (add_months(trunc(valRecordDate, 'MM'), 1) - 1) < tmp.to_date
            ) upd
        on (
            trunc(valRecordDate, 'YYYY') = o.record_date
            and
            'VIETSTAR' = o.type_code
            and
            LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES = o.be_executing
            and
            upd.outlet_id = o.outlet_id
            )
        when matched then
            update
            set o.company_name = upd.company_name,
                o.office_name = upd.sales_office_name,
                o.agency_name = upd.sales_agency_name,
                o.unit_name = upd.sales_unit_name,
                o.outlet_number = upd.outlet_number,
                o.outlet_name = upd.outlet_name,
                o.update_datetime = sysdate;
        commit;

        /*update la_vietstar_outlet o
        set
            o.be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_NO,
            o.update_datetime = sysdate
        where o.record_date = trunc(valRecordDate, 'YYYY')
            and o.type_code = 'VIETSTAR'
            and o.be_executing = LIFE_AGENCY_CODE.OUTLET_EXECUTING_YES;
        commit;*/
    end;

end LIFE_AGENCY_VIETSTAR;
/
