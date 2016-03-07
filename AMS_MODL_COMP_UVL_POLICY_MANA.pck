create or replace package ams.AMS_MODL_COMP_UVL_POLICY_MANA is

    MODULE_CODE_COMP VARCHAR2(16) := 'MAIN';
    SYSTEM_USER varchar2(16) := 'SYSTEM';
    THEME_LANGUAGE VARCHAR2(16) := 'VN';
    SESSION_ID number(1) := 1;

    VERSION_DATE date := trunc(sysdate, 'DD');

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

    MAX_DELETE_NUMBER number(10) := 50000;
    --lay tat ca la cai nay de do so lieu vao cho no nhanh va de hon nhe
    VAR_SESSION_ID number(1) := 1;

    OBJECT_STATUS_ACTIVE VARCHAR2(16) := 'ACTI';
    OBJECT_STATUS_INACTIVE VARCHAR2(16) := 'INAT';
    OBJECT_STATUS_FREEZE VARCHAR2(16) := 'FRZE';

    procedure main(valRecordDate date := null);
    procedure poli_tal_import(valRecordDate date := null);
    procedure poli_tal_mana(valRecordDate date := null);
    function outlet_of_account(valDate date := null,
        valAccountID number := null,
        valTypeOfOutlet varchar2 := null) return number;
end AMS_MODL_COMP_UVL_POLICY_MANA;
/
create or replace package body ams.AMS_MODL_COMP_UVL_POLICY_MANA is
    /*chinhlk 2/5/2013 sua lay theo ngay hieu luc cua hop dong*/
    procedure main(valRecordDate date := null)
    is
    begin
        AMS_MODL_COMP_UVL_POLICY_MANA.poli_tal_import(valRecordDate);
        AMS_MODL_COMP_UVL_POLICY_MANA.poli_tal_mana(valRecordDate);
    end;

    --thu tuc nay lay so lieu hop dong con hieu luc tinh den 1 ngay cuoi thang
    --de tinh hop dong quan ly cua dai ly
    procedure poli_tal_import(valRecordDate date := null)
    is
       var_record_date date := trunc(valRecordDate, 'MM');
       var_end_date date := last_day(valRecordDate);
       var_error_pos  number(8, 2) := 0;
    begin
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        loop
            delete ams.la_comp_policy_inforce c
            where c.record_date = var_record_date
                and rownum < ams.AMS_MODL_COMP_UVL_POLICY_MANA.MAX_DELETE_NUMBER;
            exit when SQL%rowcount < ams.AMS_MODL_COMP_UVL_POLICY_MANA.MAX_DELETE_NUMBER - 1;
            commit;
        end loop;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'poli_tal_import', 'Xoa du lieu thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 1;

        insert /*+ APPEND */ into ams.la_comp_policy_inforce nologging(
            record_date,
            policy_id,
            issue_date,
            year_of_policy
        )
        select /*+ CARDINALITY(pol1, 100)
                   CARDINALITY(pol2, 100)
                    CARDINALITY(pol, 100) CARDINALITY(act, 100)  CARDINALITY(acc, 100)  CARDINALITY(prod, 100)
                  */
            var_record_date,
            act.account_id,
            trunc(act.effective_date, 'DD'), --lay theo ngay hieu luc
            --cho tham nien nay da confirm theo y anh Huu Hoa 29/3/2012
            months_between(var_end_date, trunc(act.effective_date, 'DD')) /12
        from
        (
            select  /*+ CARDINALITY(act1, 100) CARDINALITY(act2, 100)*/
                act1.account_id,
                max(act1.activity_id) activity_id
            from
            (
                select  /*+ CARDINALITY(act1, 100)*/
                    act1.activity_id,
                    act1.account_id
                from ods.activity act1
                --cac dai ly con hieu luc cho den ngay cuoi thang
                where trunc(greatest(act1.bus_processed_date, act1.effective_date)) <= var_end_date
                    and act1.is_reversed is not null
            ) act1
            left join
            (
                select /*+ CARDINALITY(act2, 100)*/
                    act2.reversed_acti_id,
                    act2.account_id
                from ods.activity act2
                where trunc(greatest(act2.bus_processed_date, act2.effective_date)) < var_end_date
            ) act2
                on act2.reversed_acti_id = act1.activity_id
                    and act2.account_id = act1.account_id
            --khong bi revert trong thoi gian do
            where act2.account_id is null
            group by act1.account_id
        ) pol1
        inner join--lay theo chi lay cac hop dong con hieu luc
        (--con hieu luc
            select  /*+ CARDINALITY(act1, 100)*/
                act1.account_id,
                act1.activity_id
            from ods.activity act1
            where act1.status_code not in ('PIF','OF','PA')
        ) pol2
            on pol1.activity_id = pol2.activity_id
        join
        (
            select /*+ CARDINALITY(tmp, 100) */
                tmp.activity_id,
                tmp.account_id
            from ods.activity tmp
            where trunc(tmp.bus_processed_date, 'DD')  <= var_end_date
                and tmp.activity_code = 'A100'
            minus
            select /*+ CARDINALITY(tmp, 100) */
                tmp.reversed_acti_id activity_id,
                tmp.account_id
            from ods.activity tmp
            where trunc(tmp.bus_processed_date, 'DD') <=  var_end_date
                and tmp.activity_code = 'R100'
        ) pol
        on pol.account_id = pol2.account_id
        join
        (   /*chinhlk 25/4.2013 sua lai cho dung code*/
            select /*+ CARDINALITY(tmp, 100) */
                tmp.effective_date,
                tmp.account_id,
                tmp.activity_id
            from ods.activity tmp
            where trunc(tmp.bus_processed_date, 'DD')  <= var_end_date
                and tmp.activity_code = 'A100'
        ) act
            on pol.activity_id = act.activity_id;
        commit;


        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'poli_tal_import', 'Do du lieu la_comp_policy_inforce thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 2;

        execute immediate 'truncate table ams.la_comp_policy_tal_account_tmp';
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'poli_tal_import', 'truncate la_comp_policy_tal_account_tmp');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 3;

        /*insert la_comp_policy_tal_account_tmp */
        insert /*+ APPEND */ into ams.la_comp_policy_tal_account_tmp nologging
        (
            account_id,
            account_number,
            product_id,
            record_date
        )
        select  /*+ CARDINALITY(tmp, 100) */
            tmp.account_id,
            tmp.account_number,
            tmp.product_id,
            var_record_date
        from ods.account tmp;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'poli_tal_import', 'insert la_comp_policy_tal_account_tmp');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 3;

        /* Cap nhat ma hop dong*/
        merge /*+ CARDINALITY(pol, 100)
                  CARDINALITY(upd, 100)
                  LEADING(pol upd) */
            into ams.la_comp_policy_inforce pol
        using
            (
                select  /*+ CARDINALITY(tmp, 100) */
                    tmp.account_id policy_id,
                    tmp.account_number policy_number,
                    tmp.product_id
                from ams.la_comp_policy_tal_account_tmp tmp
                where tmp.record_date = var_record_date
            ) upd
        on (
            var_record_date = pol.record_date
            and
            upd.policy_id = pol.policy_id
            )
        when matched then
            update
            set pol.policy_number = upd.policy_number,
               pol.product_id = upd.product_id;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'poli_tal_import', 'cap nhat ma hop dong');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 3;

        /* Cap nhat dai ly khai thac*/
        update ams.la_comp_policy_inforce tmp
        set tmp.init_outlet_id = ams_modl_comp_uvl_policy_mana.outlet_of_account(var_end_date,
                                        tmp.policy_id,
                                        'INIT')
        where  tmp.record_date = var_record_date;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'poli_tal_import', 'Cap nhat dai ly khai thac ');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 6;

        /* Cap nhat dai ly thu phi*/
        update ams.la_comp_policy_inforce tmp
        set tmp.serv_outlet_id = ams_modl_comp_uvl_policy_mana.outlet_of_account(var_end_date,
                                        tmp.policy_id,
                                        'SERV')
        where  tmp.record_date = var_record_date;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'poli_tal_import', 'Cap nhat dai ly thu phi ' || to_char(var_record_date, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 9;

        /* Cap nhat nam con hoa hong khai thac*/
        merge /*+ CARDINALITY(pol, 100)
                  CARDINALITY(upd, 100)
                  LEADING(pol upd) */
            into ams.la_comp_policy_inforce pol
        using
            (
                select  /*+ CARDINALITY(pro, 100)  CARDINALITY(comm, 100) */
                    pro.product_id,
                    pro.product_code,
                    comm.init_comm_duration
                from
                (
                    select  /*+ CARDINALITY(tmp, 100) */
                        tmp.product_id,
                        tmp.product_code
                    from ods.product tmp
                ) pro
                left join
                (
                    select /*+ CARDINALITY(tmp, 100) */
                        tmp.product_code,
                        max(nvl(tmp.prod_commission_duration,0)) init_comm_duration
                    from ams.la_comp_policy_product tmp
                    group by tmp.product_code
                ) comm
                    on comm.product_code = pro.product_code
            ) upd
        on (
            var_record_date = pol.record_date
            and
            upd.product_id = pol.product_id
            )
        when matched then
            update
            set pol.init_comm_duration = upd.init_comm_duration,
                pol.product_code = upd.product_code;
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'poli_tal_import', 'gather la_comp_policy_tal_outlet_tmp ' || to_char(var_record_date, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 9;

        /*Cap nhat con hoa hong khai thac hay khong?*/
        /*Neu da het hoa hong Khai thac*/
        update ams.la_comp_policy_inforce tmp
        set tmp.init_comm_status = 0
        where tmp.record_date = var_record_date
           and nvl(tmp.year_of_policy, 0) > nvl(tmp.init_comm_duration, 0); --Lon hon 4 nam thi het hoa hong khai thac
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'poli_tal_import', 'Cap nhat con hoa hong khai thac hay khong ' || to_char(var_record_date, 'dd/mm/yyyy'));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos  := 9;

        /*Con hoa hong khai thac khong?*/
        update ams.la_comp_policy_inforce tmp
        set tmp.init_comm_status = 1
        where tmp.record_date = var_record_date
           and nvl(tmp.year_of_policy, 0) <= nvl(tmp.init_comm_duration, 0); --trong vong 4 nam thi van con hoa hong khai thac cho no
        commit;
        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'poli_tal_import', 'Con hoa hong khai thac khong ' || to_char(var_record_date, 'dd/mm/yyyy'));

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'poli_tal_import', 'poli_tal_import da lay xong so lieu hop dong con hieu luc o UVL thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    exception
    when others then
        rollback;
        life_agency_log.write_log(1000,
            'poli_tal_import: loi thu tuc vi tri: ' || to_char(var_error_pos),
            sqlerrm,
            sqlcode);
    end;

      /*OK: Lay tat ca cac hop dong
      */
      procedure poli_tal_mana(valRecordDate date := null)
      is
       var_record_date date := trunc(valRecordDate, 'MM');
       var_end_date date := last_day(valRecordDate);
       var_error_pos  number(8, 2) := 0;
      begin
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;
          --xoa du lieu truoc da;
          loop
              delete ams.la_comp_policy_collection c
              where c.record_date = var_record_date
                  and c.index_code = 'CONT_MANG_FIXD'
                  and c.group_code = 'COLL'
                  and c.category_code = 'INDX'
                  and c.type_data = 'ODS'
                  and rownum < ams.AMS_MODL_COMP_UVL_POLICY_MANA.MAX_DELETE_NUMBER;
              exit when SQL%rowcount < ams.AMS_MODL_COMP_UVL_POLICY_MANA.MAX_DELETE_NUMBER - 1;
              commit;
          end loop;
          commit;

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(1000, 'poli_tal_mana', 'Xoa du lieu thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
          ams.life_agency_log.time_stop;
          ams.life_agency_log.time_begin;

          /* Chuyen so luon hop dong quan ly (duoc huong phan cung) ve trung tam */
          insert /*+ APPEND */ into ams.la_comp_policy_collection nologging(
              agent_id,
              record_date,
              index_code,
              group_code,
              category_code,
              brvr_value_number,--cho vao gia tri nay
              update_datetime,
              begin_date,
              end_date,
              type_data)
          select   /*+
                     CARDINALITY(pol, 100)
                     */
              pol.serv_outlet_id,
              var_record_date,
              'CONT_MANG_FIXD',
              'COLL',
              'INDX',
              nvl(count(pol.policy_id), 0),
              sysdate,
              var_record_date,
              var_end_date,
              'ODS'
          from ams.la_comp_policy_inforce pol
          where pol.record_date = var_record_date
              and
              (
                  (
                      pol.init_comm_status = 0 --het hoa hong khai thac
                      --thi chi can lay dai ly thu phi ra cho no la se lay ra duoc so luon hop dong quan ly
                  )
                  or --hay con hoa hong khai thac nhung dai ly thu phi khac dai ly khai thac la OK
                  (
                      pol.init_comm_status = 1 --con hoa hong khai thac
                      and --va dai ly thu phi khac dai ly khai thac thi tinh cho dai ly di thu phi
                      pol.init_outlet_id <> pol.serv_outlet_id
                  )
              )
          group by pol.serv_outlet_id;
          commit;

          --hoac la con hieu luc tinh den thoi diem cuoi thang do
          --con hoa hong khai thac
          --va dai ly khai thac = dai ly thu phi

          ams.life_agency_log.time_end;
          ams.life_agency_log.write_log(1000, 'poli_tal_mana', 'poli_tal_mana da lay xong so lieu hop dong con hieu luc o UVL thang ' || to_char(valRecordDate, 'dd/mm/yyyy'));
    exception
    when others then
        rollback;
        life_agency_log.write_log(1000,
            'poli_tal_mana: loi thu tuc vi tri: ' || to_char(var_error_pos),
            sqlerrm,
            sqlcode);
      end;

    function outlet_of_account(valDate date := null,
        valAccountID number := null,
        valTypeOfOutlet varchar2 := null) return number
    is
        var_outlet_id number (10) := null;
        var_date date := null;
        var_account_outlet_id number(10) := 0;
    begin
        begin
            select max(trunc(acc_out_rel.account_outlet_id)) into var_account_outlet_id
            from ods.account_outlet_relationship acc_out_rel
            where acc_out_rel.account_id = valAccountID
                and acc_out_rel.relationship_type_code = valTypeOfOutlet
                and trunc(acc_out_rel.effective_date) <= valDate;
        exception
            when others then
                var_account_outlet_id := 0;
        end;

        begin
            select acc_out_rel.outlet_client_id into var_outlet_id
            from ods.account_outlet_relationship acc_out_rel
            where acc_out_rel.account_id = valAccountID
                and acc_out_rel.relationship_type_code = valTypeOfOutlet
                and acc_out_rel.account_outlet_id = var_account_outlet_id;

        exception
            when others then
                var_outlet_id := 0;
        end;

        return var_outlet_id;
    end;

end AMS_MODL_COMP_UVL_POLICY_MANA;
/
