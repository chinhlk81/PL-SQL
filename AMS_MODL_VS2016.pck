create or replace package ams.AMS_MODL_VS2016 is



    -----------------------------------------------------------------
    /* BEGIN VARIABLE*/
    -----------------------------------------------------------------
    -----------------------------------------------------------------
    /* END VARIABLE*/
    -----------------------------------------------------------------

    procedure main;
    procedure run;

    -----------------------------------------------------------------
    /* BEGIN PROCEDURE*/
    -----------------------------------------------------------------
    /*
        Creater: Le Khac Chinh
        Date Create: 08/01/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure modl_prepare(
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Le Khac Chinh
        Date Create: 08/01/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure modl_prepare_open(
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Le Khac Chinh
        Date Create: 08/01/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure modl_prepare_data(
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Le Khac Chinh
        Date Create: 08/01/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure modl_done_comp(
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Le Khac Chinh
        Date Create: 08/01/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure modl_done_final(
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Le Khac Chinh
        Date Create: 08/01/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure modl_done_close(
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);


    /*
        Creater: Le Khac Chinh
        Date Create: 08/01/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure modl_stg_prepare(
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Le Khac Chinh
        Date Create: 08/01/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure modl_stg_pers_data(
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Le Khac Chinh
        Date Create: 08/01/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure modl_stg1_pers_data(
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Le Khac Chinh
        Date Create: 08/01/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure modl_stg2_pers_data(
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Le Khac Chinh
        Date Create: 08/01/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure modl_stg3_pers_data(
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Le Khac Chinh
        Date Create: 08/01/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure modl_stg4_pers_data(
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    /*
        Creater: Le Khac Chinh
        Date Create: 08/01/2015
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure modl_pers_comp(
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER);

    -----------------------------------------------------------------
    /* END PROCEDURE*/
    -----------------------------------------------------------------

    -----------------------------------------------------------------
    /* BEGIN FUNCTION*/
    -----------------------------------------------------------------
    -----------------------------------------------------------------
    /* END FUNCTION*/
    -----------------------------------------------------------------


end AMS_MODL_VS2016;
/
create or replace package body ams.AMS_MODL_VS2016 is
procedure main
    is
    begin
        null;
    end;

    procedure run
    is
        var_date date := null;
    begin
        var_date := trunc(sysdate, 'DD');
        if trunc(var_date, 'DD') >= '30-nov-2016' then
            var_date := '30-nov-2016';
        end if;
        ams_modl_vs2016.modl_prepare(null,
                                                                   var_date,
                                                                   'admin');
    end;


    -----------------------------------------------------------------
    /* BEGIN PROCEDURE*/
    -----------------------------------------------------------------
    /*
        Creater: Le Khac Chinh
        Date Create: 08/01/2016
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure modl_prepare(
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
    begin
        AMS_MODL_VS2016.modl_prepare_open(pv_outlet_ams_id, pd_realize_date, pv_user);
        AMS_MODL_VS2016.modl_prepare_data(pv_outlet_ams_id, pd_realize_date, pv_user);
        AMS_MODL_VS2016.modl_done_comp(pv_outlet_ams_id, pd_realize_date, pv_user);
        AMS_MODL_VS2016.modl_stg_prepare(pv_outlet_ams_id, pd_realize_date, pv_user);
        /*chay cham nen cho chay cuoi*/
        AMS_MODL_VS2016.modl_done_final(pv_outlet_ams_id, pd_realize_date, pv_user);

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 08/01/2016
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure modl_prepare_open(
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
        var_bdate date := trunc(AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/INCT/S2016/INFO/BDATE'), 'MM');
        var_edate date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/INCT/S2016/INFO/EDATE');
        var_real_date date := trunc(pd_realize_date, 'MM');
        var_cond_date date := least(var_edate, var_real_date);
    begin
        -- Buoc 01: Xoa du lieu neu da ton tai
        begin
            loop
                delete /*+ NOLOGGING */ ams_rep_s2016_personal del
                where rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
                exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;

        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_VS2016.modl_prepare_open] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 02: Ghi nhan du lieu duoc xu ly
        begin
            -- Buoc 02.B: Chi tiet du lieu dai ly xet thi dua ca nhan
            insert /*+ APPEND */ into ams_rep_s2016_personal nologging (
                record_date,
                outlet_ams_id,
                outlet_name,
                branch_ams_id,
                branch_name,
                agency_ams_id,
                agency_name,
                unit_ams_id,
                unit_name,
                regency_code,
                effe_date,
                term_date,
                maintain_user,
                maintain_time
            )
            select /*+ CARDINALITY(dbw, 10)*/
                var_edate,
                dbw.outlet_ams_id,
                dbw.outlet_name,
                dbw.branch_ams_id,
                dbw.branch_name,
                dbw.agency_ams_id,
                dbw.agency_name,
                dbw.unit_ams_id,
                dbw.unit_name,
                dbw.regency_code,
                dbw.effective_date,
                dbw.terminal_date,
                pv_user,
                sysdate
            from dbw_outl_informations dbw
            where dbw.dbw_code = 'MAIN'
                and dbw.dbw_time = 'MONT'
                and dbw.outlet_type = 'OUTL'
                and dbw.record_date = var_cond_date
                and dbw.terminal_date is null;
            commit;

        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_VS2016.modl_prepare_open] ' || SQLERRM);
                goto procedure_end;
        end;
        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;


    /*
        Creater: Le Khac Chinh
        Date Create: 08/01/2016
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure modl_prepare_data(
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
        var_bdate date := trunc(AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/INCT/S2016/INFO/BDATE'), 'MM');
        var_edate date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/INCT/S2016/INFO/EDATE');
        var_real_date date := trunc(pd_realize_date, 'MM');

        var_cond_date date := least(var_edate, var_real_date);
        var_end_year date := add_months(trunc(var_edate, 'YYYY'), 12) - 1; --1/1/2017

        var_end_issue_date date := last_day(var_cond_date);

        var_sbdate_s1 date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/INCT/S2016/S1/TIME/BDATE');
        var_sedate_s1 date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/INCT/S2016/S1/TIME/EDATE');
        var_swdate_s1 date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/INCT/S2016/S1/TIME/EISS');

        var_sbdate_s2 date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/INCT/S2016/S2/TIME/BDATE');
        var_sedate_s2 date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/INCT/S2016/S2/TIME/EDATE');
        var_swdate_s2 date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/INCT/S2016/S2/TIME/EISS');
        var_mthan_s2 date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/INCT/S2016/S2/TIME/MTHAN');
        var_mbeg_s2 date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/INCT/S2016/S2/TIME/MBEG');
        var_mend_s2 date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/INCT/S2016/S2/TIME/MEND');

        var_sbdate_s3 date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/INCT/S2016/S3/TIME/BDATE');
        var_sedate_s3 date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/INCT/S2016/S3/TIME/EDATE');
        var_swdate_s3 date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/INCT/S2016/S3/TIME/EISS');
        var_mthan_s3 date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/INCT/S2016/S3/TIME/MTHAN');
        var_mbeg_s3 date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/INCT/S2016/S3/TIME/MBEG');
        var_mend_s3 date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/INCT/S2016/S3/TIME/MEND');

        var_sbdate_s4 date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/INCT/S2016/S4/TIME/BDATE');
        var_sedate_s4 date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/INCT/S2016/S4/TIME/EDATE');
        var_swdate_s4 date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/INCT/S2016/S4/TIME/EISS');
        var_mthan_s4 date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/INCT/S2016/S4/TIME/MTHAN');
        var_mbeg_s4 date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/INCT/S2016/S4/TIME/MBEG');
        var_mend_s4 date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/INCT/S2016/S4/TIME/MEND');

    begin
        -- Buoc 01: Xoa du lieu neu da ton tai
        begin
            AMS_CORE_TABLE.truncate('ams_con_s2016_accounts_tmp');
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_VS2016.modl_prepare_data] ' || SQLERRM);
                goto procedure_end;
        end;


        -- Buoc 01.A: Xu ly cua den ngay khi issue neu ma la o thang cuoi cua chang thi den ngay issue se tinh khac la den cuoi chang
        --Dam bao neu chay vao 30/11/2015 thi se lay duoc phat hanh den 12/12/2015
        begin
           var_end_issue_date := last_day(var_cond_date);
           if month(var_cond_date) = month(var_sedate_s1) then
                var_end_issue_date := var_swdate_s1;
           elsif month(var_cond_date) = month(var_sedate_s2) then
                var_end_issue_date := var_swdate_s2;
           elsif month(var_cond_date) = month(var_sedate_s3) then
                var_end_issue_date := var_swdate_s3;
           elsif month(var_cond_date) = month(var_sedate_s4) then
                var_end_issue_date := var_swdate_s4;
           end if;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_VS2016.modl_prepare_data 1] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 02: Ghi nhan cac du lieu chung
        begin
            -- Buoc 02.A: Ghi nhan cac du lieu hop dong
            insert /*+ APPEND */ into ams_con_s2016_accounts_tmp nologging (
                account_id,
                outlet_ams_id,
                edate,
                idate,
                freq_premium,
                freq_per_annum,
                maintain_time,
                maintain_user
            )
            select /*+ CARDINALITY(i, 10)
                       CARDINALITY(e, 10)
                       CARDINALITY(p, 10) */
                i.account_id,
                i.outlet_ams_id,
                e.edate,
                i.idate,
                p.acc_freq_premium,
                p.acc_freq_per_annum,
                sysdate,
                pv_user
            from
            (
                select /*+ CARDINALITY(ad, 10)*/
                    ad.account_id,
                    ad.outlet_ams_id,
                    ad.dbw_date idate
                from dbw_acc_dates ad
                where ad.dbw_date
                        between var_bdate
                        and var_end_issue_date
                    and var_end_issue_date
                        between ad.acc_fdate
                        and ad.acc_tdate
                    and ad.dbw_code = 'ISSU'
            ) i
            join
            (
                select /*+ CARDINALITY(ad, 10)*/
                    ad.account_id,
                    ad.acc_date edate
                from dbw_acc_dates ad
                where ad.dbw_code = 'EFFE'
                    and ad.acc_date
                        between var_bdate
                        and var_edate
                    and var_end_issue_date
                        between ad.acc_fdate
                        and ad.acc_tdate
            ) e
                on e.account_id = i.account_id
            join
            (
                select /*+ CARDINALITY(ap, 10)*/
                    ap.account_id,
                    ap.acc_freq_per_annum,
                    ap.acc_freq_premium
                from dbw_acc_premiums ap
                where ap.dbw_date
                        between var_bdate
                        and var_end_issue_date
                    and var_end_issue_date
                        between ap.acc_fdate
                        and ap.acc_tdate
            ) p
                on p.account_id = i.account_id;
            commit;

        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_VS2016.modl_prepare_data 8] ' || SQLERRM);
                goto procedure_end;
        end;
/*       -- Buoc 2A: Merge cac dai ly con lam viec den thoi diem 30/11
        begin
            merge \*+ CARDINALITY(pers, 10)
                     CARDINALITY(upd, 10)*\
               into ams_con_s2016_accounts_tmp pers
            using
                (
                    select    \*+ CARDINALITY(dbw, 10)*\
                        dbw.outlet_ams_id
                    from dbw_outl_informations dbw
                    where dbw.dbw_code = 'MAIN'
                        and dbw.dbw_time = 'MONT'
                        and dbw.outlet_type = 'OUTL'
                        and dbw.record_date = var_cond_date
                        and dbw.terminal_date is null
                ) upd
            on (
                upd.outlet_ams_id = pers.outlet_ams_id
            )
            when matched then
              update \*+ NOLOGGING *\
                  set
                      pers.is_exist = 1;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_VS2016.modl_prepare_data 7] ' || SQLERRM);
                goto procedure_end;
        end;    */

/*       -- Buoc 2B : Merge thong tin huy 14 ngay
        delete from ams_con_s2016_accounts_tmp a
        where a.is_exist is null;
        commit;*/

       -- Buoc 2C : Xoa hop dong An Gia Thịnh Vượng có thời hạn 5 năm
        delete from ams_con_s2016_accounts_tmp a
        where a.account_id like '025%';
        commit;

       -- Buoc 3 : Merge thong tin huy 14 ngay
        begin
            merge /*+ CARDINALITY(pers, 10)
                     CARDINALITY(upd, 10)*/
               into ams_con_s2016_accounts_tmp pers
            using
                (
                    select /*+ CARDINALITY(ad, 10)*/
                        ad.account_id,
                        ad.acc_date cdate
                    from dbw_acc_dates ad
                    where ad.dbw_date
                            between var_bdate
                            and var_end_year
                        and var_end_year
                            between ad.acc_fdate
                            and ad.acc_tdate
                        and ad.dbw_code = 'COF'
                ) upd
            on (
                upd.account_id = pers.account_id
            )
            when matched then
              update /*+ NOLOGGING */
                  set
                      pers.cdate = upd.cdate;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_VS2016.modl_prepare_data 2] ' || SQLERRM);
                goto procedure_end;
        end;

       -- Buoc 4 : Merge thong tin huy sau 14 ngay
        begin
            merge /*+ CARDINALITY(pers, 10)
                     CARDINALITY(upd, 10)*/
               into ams_con_s2016_accounts_tmp pers
            using
                (
                     select /*+ CARDINALITY(ad, 10)*/
                          ad.account_id,
                          ad.acc_date tdate
                      from dbw_acc_dates ad
                      where ad.dbw_date
                              between var_bdate
                              and var_end_year
                          and var_end_year
                              between ad.acc_fdate
                              and ad.acc_tdate
                          and ad.dbw_code = 'TOF'
                ) upd
            on (
                upd.account_id = pers.account_id
            )
            when matched then
              update /*+ NOLOGGING */
                  set
                      pers.tdate = upd.tdate;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_VS2016.modl_prepare_data 3] ' || SQLERRM);
                goto procedure_end;
        end;

       -- Buoc 5 : Nhom tai thoi diem phat hanh
        begin
            merge /*+ CARDINALITY(pers, 10)
                     CARDINALITY(upd, 10)*/
               into ams_con_s2016_accounts_tmp pers
            using
                (
                    select /*+ CARDINALITY(l, 10)*/
                        l.outlet_ams_id,
                        l.pr_outlet_ams_id unit_ams_id,
                        l.pr_outlet_name  unit_name,
                        l.from_date,
                        l.to_date
                    from cla_outlet_location l
                    where l.outlet_type_code = 'OUTL'
                        and l.pr_outlet_type_code = 'NHOM'
                ) upd
            on (
                upd.outlet_ams_id = pers.outlet_ams_id
                and
                    pers.edate
                       between upd.from_date
                       and upd.to_date
            )
            when matched then
              update /*+ NOLOGGING */
                  set
                      pers.unit_ams_id = upd.unit_ams_id,
                      pers.unit_name = upd.unit_name;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_VS2016.modl_prepare_data 4] ' || SQLERRM);
                goto procedure_end;
        end;

       -- Buoc 6: Ban tai thoi diem phat hanh
        begin
            merge /*+ CARDINALITY(pers, 10)
                     CARDINALITY(upd, 10)*/
               into ams_con_s2016_accounts_tmp pers
            using
                (
                    select /*+ CARDINALITY(l, 10)*/
                        l.outlet_ams_id,
                        l.pr_outlet_ams_id agency_ams_id,
                        l.pr_outlet_name agency_name,
                        l.from_date,
                        l.to_date
                    from cla_outlet_location l
                    where l.outlet_type_code = 'NHOM'
                        and l.pr_outlet_type_code = 'BAN'
                ) upd
            on (
                upd.outlet_ams_id = pers.unit_ams_id
                and
                    pers.edate
                       between upd.from_date
                       and upd.to_date
            )
            when matched then
              update /*+ NOLOGGING */
                  set
                      pers.agency_ams_id = upd.agency_ams_id,
                      pers.agency_name = upd.agency_name;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_VS2016.modl_prepare_data 5] ' || SQLERRM);
                goto procedure_end;
        end;

       -- Buoc 7 : truong hop dai ly thuoc truc tiep ban
        begin
            merge /*+ CARDINALITY(pers, 10)
                     CARDINALITY(upd, 10)*/
               into ams_con_s2016_accounts_tmp pers
            using
                (
                    select /*+ CARDINALITY(l, 10)*/
                        l.outlet_ams_id,
                        l.outlet_name,
                        l.pr_outlet_ams_id agency_ams_id,
                        l.pr_outlet_name agency_name,
                        l.from_date,
                        l.to_date
                    from cla_outlet_location l
                    where l.outlet_type_code = 'OUTL'
                        and l.pr_outlet_type_code = 'BAN'
                ) upd
            on (
                upd.outlet_ams_id = pers.outlet_ams_id
                and
                    pers.edate
                       between upd.from_date
                       and upd.to_date
            )
            when matched then
              update /*+ NOLOGGING */
                  set
                      pers.agency_ams_id =
                          case when ( pers.agency_ams_id is null and pers.unit_ams_id is null) then
                                upd.agency_ams_id
                           end,
                      pers.agency_name =
                          case when ( pers.agency_name is null and pers.unit_name is null) then
                                upd.agency_name
                           end
                           ;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_VS2016.modl_prepare_data 6] ' || SQLERRM);
                goto procedure_end;
        end;

       -- Buoc 8 : Merge cac thong tin bo sung them
        begin
            merge /*+ CARDINALITY(pers, 10)
                     CARDINALITY(upd, 10)*/
               into ams_con_s2016_accounts_tmp pers
            using
                (
                    select    /*+ CARDINALITY(dbw, 10)*/
                        dbw.outlet_ams_id,
                        dbw.record_date,
                        dbw.branch_ams_id,
                        dbw.branch_name,
                        dbw.outlet_name,
                        dbw.regency_code,
                        dbw.effective_date,
                        dbw.terminal_date
                    from dbw_outl_informations dbw
                    where dbw.dbw_code = 'MAIN'
                        and dbw.dbw_time = 'MONT'
                        and dbw.outlet_type = 'OUTL'
                        and dbw.record_date
                            between var_bdate
                            and var_edate
                ) upd
            on (
                upd.outlet_ams_id = pers.outlet_ams_id
                and
                upd.record_date = trunc(pers.edate, 'MM')
            )
            when matched then
              update /*+ NOLOGGING */
                  set
                      pers.outlet_name = upd.outlet_name,
                      pers.branch_ams_id = upd.branch_ams_id,
                      pers.branch_name = upd.branch_name,
                      pers.regency_code = upd.regency_code,
                      pers.effe_date = upd.effective_date,
                      pers.term_date = upd.terminal_date;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_VS2016.modl_prepare_data 7] ' || SQLERRM);
                goto procedure_end;
        end;

       -- Buoc 9 : Merge chang
        update ams_con_s2016_accounts_tmp a
        set a.cycle =
            case
                when  a.edate between var_sbdate_s1 and var_sedate_s1
                      and a.idate between var_sbdate_s1 and var_swdate_s1
                then 1
                when
                      (
                          a.edate between var_sbdate_s2 and var_sedate_s2
                          and a.idate between var_sbdate_s2 and var_swdate_s2
                      )
                      or
                      (
                          a.edate between var_bdate and var_mthan_s2
                          and a.idate between var_mbeg_s2 and var_mend_s2
                      )
                then 2
                when
                      (
                          a.edate between var_sbdate_s3 and var_sedate_s3
                          and a.idate between var_sbdate_s3 and var_swdate_s3
                      )
                      or
                      (
                          a.edate between var_bdate and var_mthan_s3
                          and a.idate between var_mbeg_s3 and var_mend_s3
                      )
                then 3
                when
                      (
                          a.edate between var_sbdate_s4 and var_sedate_s4
                          and a.idate between var_sbdate_s4 and var_swdate_s4
                      )
                      or
                      (
                          a.edate between var_bdate and var_mthan_s4
                          and a.idate between var_mbeg_s4 and var_mend_s4
                      )
                then 4
             end
         where 1=1;
        commit;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 08/01/2016
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure modl_done_comp(
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
        var_edate date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/INCT/S2016/INFO/EDATE');
    begin
        -- Buoc 01: Xoa du lieu neu da ton tai
        begin
            AMS_CORE_TABLE.truncate('ams_con_s2016_accounts');
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_VS2016.modl_done_comp] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 02: Xay dung bao cao theo ky thi dua
        begin
            insert /*+ APPEND */ into ams_con_s2016_accounts nologging (
                account_id,
                outlet_ams_id,
                in_agency_ams_id,
                in_unit_ams_id,
                edate,
                idate,
                cdate,
                tdate,
                freq_premium,
                freq_per_annum,
                cycle,
                maintain_user,
                maintain_time
            )
            select /*+ CARDINALITY(tmp, 10)*/
                tmp.account_id,
                tmp.outlet_ams_id,
                tmp.agency_ams_id,
                tmp.unit_ams_id,
                tmp.edate,
                tmp.idate,
                tmp.cdate,
                tmp.tdate,
                tmp.freq_premium,
                tmp.freq_per_annum,
                tmp.cycle,
                pv_user,
                sysdate
            from ams_con_s2016_accounts_tmp tmp;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_VS2016.modl_done_comp 2] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 08/01/2016
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure modl_done_final(
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
        var_edate date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/INCT/S2016/INFO/EISS');
    begin
        -- Buoc 01: Xoa du lieu neu da ton tai
        begin
            AMS_CORE_TABLE.truncate('ams_con_s2016_customer_tmp');
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_VS2016.modl_done_final] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 01A: Do du lieu tam de xu ly cho nhanh
        begin
            insert /*+ APPEND */ into ams_con_s2016_customer_tmp nologging (
                account_id,
                customer_id,
                customer_name,
                maintain_time
            )
            select /*+ CARDINALITY(a, 10) CARDINALITY(pays, 10)
                       CARDINALITY(cusm, 10)
                       LEADING( a pays cusm)
                       INDEX(cusm dbw_acc_customers_i01)*/
                pays.account_id,
                max(cusm.customer_id) customer_id,
                max(cusm.customer_name) customer_name,
                sysdate
            from
            (
                select /*+ CARDINALITY(a, 10) */
                   a.account_id
                from ams_con_s2016_accounts_tmp  a
            ) a
            join
            (
                select /*+ CARDINALITY(c, 10) */
                    c.account_id,
                    max(c.dbw_core) KEEP (DENSE_RANK LAST order by c.acc_fdate) dbw_core,
                    max(c.customer_db) KEEP (DENSE_RANK LAST order by c.acc_fdate) customer_db,
                    max(c.customer_id) KEEP (DENSE_RANK LAST order by c.acc_fdate) customer_id
                from dbw_acc_cdbs c
                where c.dbw_code = 'LIFE'
                    and var_edate
                        between c.acc_fdate
                        and c.acc_tdate
                group by c.account_id
            ) pays
                on a.account_id = pays.account_id
            inner join ams.dbw_acc_customers cusm
                on
                (
                    cusm.dbw_core = pays.dbw_core
                    and
                    cusm.dbw_code = pays.customer_db
                    and
                    cusm.customer_id = pays.customer_id
                )
            group by pays.account_id;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_VS2016.modl_done_final 2] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 01C: Merge du lieu

        begin
            merge /*+ CARDINALITY(pers, 10)
                     CARDINALITY(upd, 10)*/
               into ams_con_s2016_accounts_tmp pers
            using
                (
                    select /*+ CARDINALITY(a, 10) */
                        a.account_id,
                        a.customer_name
                    from ams_con_s2016_customer_tmp a
                ) upd
            on (
                upd.account_id = pers.account_id
            )
            when matched then
              update /*+ NOLOGGING */
                  set
                      pers.customer_name = upd.customer_name;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_VS2016.modl_done_final 3] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 02: Xoa du lieu neu da ton tai
        begin
            AMS_CORE_TABLE.truncate('ams_rep_s2016_accounts');
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_VS2016.modl_done_comp] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Buoc 02A: Xay dung bang de ve sau tinh du lieu
        begin
            insert /*+ APPEND */ into ams_rep_s2016_accounts nologging (
                record_date,
                in_branch_ams_id,
                in_branch_name,
                in_agency_ams_id,
                in_agency_name,
                in_unit_ams_id,
                in_unit_name,
                in_outlet_ams_id,
                in_outlet_name,
                in_regency_code,
                in_effe_date,
                in_term_date,
                account_id,
                edate,
                idate,
                cdate,
                tdate,
                rp_freq,
                rp_ip,
                rp_fyp,
                rp_afyp,
                rp_topup,
                rp_cycle,
                rp_insured_name,
                maintain_user,
                maintain_time
            )
            select /*+ CARDINALITY(tmp, 10)*/
                var_edate,
                tmp.branch_ams_id,
                replace(tmp.branch_name, 'Bảo Việt Nhân Thọ ', ''),
                tmp.agency_ams_id,
                tmp.agency_name,
                tmp.unit_ams_id,
                tmp.unit_name,
                tmp.outlet_ams_id,
                tmp.outlet_name,
                tmp.regency_code,
                tmp.effe_date,
                tmp.term_date,
                tmp.account_id,
                tmp.edate,
                tmp.idate,
                tmp.cdate,
                tmp.tdate,
                tmp.freq_per_annum,
                tmp.freq_premium,
                null,
                (tmp.freq_premium * tmp.freq_per_annum),
                null,
                cycle,
                tmp.customer_name,
                pv_user,
                sysdate
            from ams_con_s2016_accounts_tmp tmp;
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_VS2016.modl_done_comp 1] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 08/01/2016
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure modl_done_close(
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
    begin
        begin
            AMS_CORE_TABLE.truncate('ams_con_s2016_accounts_tmp');
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_VS2016.modl_done_close] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;


    /*
        Creater: Le Khac Chinh
        Date Create: 08/01/2016
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure modl_stg_prepare(
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
    begin

        AMS_MODL_VS2016.modl_stg_pers_data(pv_outlet_ams_id, pd_realize_date, pv_user);
        AMS_MODL_VS2016.modl_stg1_pers_data(pv_outlet_ams_id, pd_realize_date, pv_user);
        AMS_MODL_VS2016.modl_stg2_pers_data(pv_outlet_ams_id, pd_realize_date, pv_user);
        AMS_MODL_VS2016.modl_stg3_pers_data(pv_outlet_ams_id, pd_realize_date, pv_user);
        AMS_MODL_VS2016.modl_stg4_pers_data(pv_outlet_ams_id, pd_realize_date, pv_user);

        AMS_MODL_VS2016.modl_pers_comp(pv_outlet_ams_id, pd_realize_date, pv_user);
        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 08/01/2016
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure modl_stg_pers_data(
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
        var_bdate date := trunc(AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/INCT/S2016/INFO/BDATE'), 'MM');
        var_edate date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/INCT/S2016/INFO/EDATE');
        var_real_date date := trunc(pd_realize_date, 'MM');

        var_cond_date date := least(var_edate, var_real_date);

        var_sbdate date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/INCT/S2016/INFO/BDATE');
        var_sedate date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/INCT/S2016/INFO/EDATE');
        var_swdate date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/INCT/S2016/INFO/EISS');
    begin
        -- Buoc 01: Chi tiet chi tieu
        begin
            merge /*+ CARDINALITY(pers, 10)
                     CARDINALITY(upd, 10)*/
               into ams_rep_s2016_personal pers
            using
                (
                    select /*+ CARDINALITY(acc, 10)*/
                        acc.outlet_ams_id,
                        sum(acc.freq_premium * acc.freq_per_annum) indx_afyp
                    from ams_con_s2016_accounts acc
                    where acc.edate
                            between var_sbdate
                            and var_sedate
                        and acc.idate
                            between var_sbdate
                            and var_swdate
                        and acc.cdate is null
                        and acc.tdate is null
                    group by acc.outlet_ams_id
                ) upd
            on (
                upd.outlet_ams_id = pers.outlet_ams_id
            )
            when matched then
              update /*+ NOLOGGING */
                  set
                      pers.s_indx = nvl(upd.indx_afyp, 0);
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_VS2016.modl_stg_pers_data] ' || SQLERRM);
                goto procedure_end;
        end;
        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;


    /*
        Creater: Le Khac Chinh
        Date Create: 08/01/2016
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure modl_stg1_pers_data(
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
    begin
        -- Buoc 01: Chi tiet chi tieu
        begin
            merge /*+ CARDINALITY(pers, 10)
                     CARDINALITY(upd, 10)*/
               into ams_rep_s2016_personal pers
            using
                (
                    select /*+ CARDINALITY(acc, 10)*/
                        acc.outlet_ams_id,
                        sum(acc.freq_premium * acc.freq_per_annum) indx_afyp
                    from ams_con_s2016_accounts acc
                    where acc.cycle = 1
                        and acc.cdate is null
                        and acc.tdate is null
                    group by acc.outlet_ams_id
                ) upd
            on (
                upd.outlet_ams_id = pers.outlet_ams_id
            )
            when matched then
              update /*+ NOLOGGING */
                  set
                      pers.s1_indx = nvl(upd.indx_afyp, 0);
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_VS2016.modl_stg1_pers_data] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 08/01/2016
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure modl_stg2_pers_data(
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
    begin
        -- Buoc 01: Chi tiet chi tieu
        begin
            merge /*+ CARDINALITY(pers, 10)
                     CARDINALITY(upd, 10)*/
               into ams_rep_s2016_personal pers
            using
                (
                    select /*+ CARDINALITY(acc, 10)*/
                        acc.outlet_ams_id,
                        sum(acc.freq_premium * acc.freq_per_annum) indx_afyp
                    from ams_con_s2016_accounts acc
                    where acc.cycle = 2
                        and acc.cdate is null
                        and acc.tdate is null
                    group by acc.outlet_ams_id
                ) upd
            on (
                upd.outlet_ams_id = pers.outlet_ams_id
            )
            when matched then
              update /*+ NOLOGGING */
                  set
                      pers.s2_indx = nvl(upd.indx_afyp, 0);
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_VS2016.modl_stg2_pers_data] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 08/01/2016
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure modl_stg3_pers_data(
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
    begin
        -- Buoc 01: Chi tiet chi tieu
        begin
            merge /*+ CARDINALITY(pers, 10)
                     CARDINALITY(upd, 10)*/
               into ams_rep_s2016_personal pers
            using
                (
                    select /*+ CARDINALITY(acc, 10)*/
                        acc.outlet_ams_id,
                        sum(acc.freq_premium * acc.freq_per_annum) indx_afyp
                    from ams_con_s2016_accounts acc
                    where acc.cycle = 3
                        and acc.cdate is null
                        and acc.tdate is null
                    group by acc.outlet_ams_id
                ) upd
            on (
                upd.outlet_ams_id = pers.outlet_ams_id
            )
            when matched then
              update /*+ NOLOGGING */
                  set
                      pers.s3_indx = nvl(upd.indx_afyp, 0);
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_VS2016.modl_stg3_pers_data] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;
    /*
        Creater: Le Khac Chinh
        Date Create: 08/01/2016
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure modl_stg4_pers_data(
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
    begin
        -- Buoc 01: Chi tiet chi tieu
        begin
            merge /*+ CARDINALITY(pers, 10)
                     CARDINALITY(upd, 10)*/
               into ams_rep_s2016_personal pers
            using
                (
                    select /*+ CARDINALITY(acc, 10)*/
                        acc.outlet_ams_id,
                        sum(acc.freq_premium * acc.freq_per_annum) indx_afyp
                    from ams_con_s2016_accounts acc
                    where acc.cycle = 4
                        and acc.cdate is null
                        and acc.tdate is null
                    group by acc.outlet_ams_id
                ) upd
            on (
                upd.outlet_ams_id = pers.outlet_ams_id
            )
            when matched then
              update /*+ NOLOGGING */
                  set
                      pers.s4_indx = nvl(upd.indx_afyp, 0);
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_VS2016.modl_stg4_pers_data] ' || SQLERRM);
                goto procedure_end;
        end;

        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 08/01/2016
        Version: 1.0
        Description:
        Parameter:
        Update:
    */
    procedure modl_pers_comp(
        pv_outlet_ams_id varchar2,
        pd_realize_date date,
        pv_user varchar2 default AMS_CORE_SYSTEM.SYSTEM_USER)
    is
        var_bdate date := trunc(AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/INCT/S2016/INFO/BDATE'), 'MM');
        var_edate date := AMS_MODL_VARIABLE.get_dvar_by_code('/GLOBAL/INCT/S2016/INFO/EDATE');
        var_real_date date := trunc(pd_realize_date, 'MM');
        var_cond_date date := least(var_edate, var_real_date);

    begin
        begin
            update  /*+ NOLOGGING */
                ams_rep_s2016_personal pers
            set pers.sum_indx =
                nvl(pers.s1_indx, 0) +
                nvl(pers.s2_indx, 0) +
                nvl(pers.s3_indx, 0) +
                nvl(pers.s4_indx, 0)
            where 1=1;
            commit;

            merge /*+ CARDINALITY(pers, 100)
                     CARDINALITY(upd, 100)*/
               into ams_rep_s2016_personal pers
            using
                (
                    select /*+ CARDINALITY(outl, 100)
                                   CARDINALITY(sbil, 100)
                                   CARDINALITY(spay, 100)
                                   CARDINALITY(ubil, 100)
                                   CARDINALITY(upay, 100)
                                   LEADING(outl)
                                   NO_MERGE(sbil)
                                   NO_MERGE(spay)
                                   NO_MERGE(ubil)
                                   NO_MERGE(upay)
                                   */
                        outl.outlet_ams_id,
                        decode(nvl(sbil.indx_sbil, 0),
                            0, 100,
                            round(
                                nvl(spay.indx_spay, 0) / nvl(sbil.indx_sbil, 0) * 100,
                                2
                            )
                        ) indx_srate,
                        decode(nvl(ubil.indx_ubil, 0),
                            0, 100,
                            round(
                                nvl(upay.indx_upay, 0) / nvl(ubil.indx_ubil, 0) * 100,
                                2
                            )
                        ) indx_urate,
                        decode(nvl(sbil.indx_sbil, 0) + nvl(ubil.indx_ubil, 0),
                            0, 100,
                            round(
                                (nvl(spay.indx_spay, 0) + nvl(upay.indx_upay, 0)) / (nvl(sbil.indx_sbil, 0) + nvl(ubil.indx_ubil, 0) ) * 100,
                                2
                            )
                        ) indx_rate
                    from
                    (
                        select /*+ CARDINALITY(tmp, 10)*/
                            tmp.outlet_ams_id
                        from ams_rep_s2016_personal tmp
                    ) outl
                    left join
                    (
                        select /*+ CARDINALITY(indx, 10)*/
                            indx.outlet_ams_id,
                            sum(indx.indx_number) indx_sbil
                        from ams_indx_outlets indx
                        where indx.data_main = 'MONT'
                            and indx.data_date
                                between var_bdate
                                and var_cond_date
                            and indx.data_code = 'SBIL'
                        group by indx.outlet_ams_id
                    ) sbil
                        on sbil.outlet_ams_id = outl.outlet_ams_id
                    left join
                    (
                        select /*+ CARDINALITY(indx, 10)*/
                            indx.outlet_ams_id,
                            sum(indx.indx_number) indx_spay
                        from ams_indx_outlets indx
                        where indx.data_main = 'MONT'
                            and indx.data_date
                                between var_bdate
                                and var_cond_date
                            and indx.data_code = 'SPAY'
                        group by indx.outlet_ams_id
                    ) spay
                        on spay.outlet_ams_id = outl.outlet_ams_id
                    left join
                    (
                        select /*+ CARDINALITY(indx, 10)*/
                            indx.outlet_ams_id,
                            sum(indx.indx_number) indx_ubil
                        from ams_indx_outlets indx
                        where indx.data_main = 'MONT'
                            and indx.data_date
                                between var_bdate
                                and var_cond_date
                            and indx.data_code = 'UBIL'
                        group by indx.outlet_ams_id
                    ) ubil
                        on ubil.outlet_ams_id = outl.outlet_ams_id
                    left join
                    (
                        select /*+ CARDINALITY(indx, 10)*/
                            indx.outlet_ams_id,
                            sum(indx.indx_number) indx_upay
                        from ams_indx_outlets indx
                        where indx.data_main = 'MONT'
                            and indx.data_date
                                between var_bdate
                                and var_cond_date
                            and indx.data_code = 'UPAY'
                        group by indx.outlet_ams_id
                    ) upay
                        on upay.outlet_ams_id = outl.outlet_ams_id
                ) upd
            on (
                upd.outlet_ams_id = pers.outlet_ams_id
            )
            when matched then
              update /*+ NOLOGGING */
                  set
                      pers.s_crate = least(upd.indx_srate, 100),
                      pers.s_urate = least(upd.indx_urate, 100),
                      pers.s_rate = least(upd.indx_rate, 100);
            commit;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_VS2016_boprc.modl_pers_comp] ' || SQLERRM);
                goto procedure_end;
        end;
        -- Xay ra loi khong mong muon
        <<procedure_end>>
            null;
    end;

    -----------------------------------------------------------------
    /* END PROCEDURE*/
    -----------------------------------------------------------------

    -----------------------------------------------------------------
    /* BEGIN FUNCTION*/
    -----------------------------------------------------------------
    -----------------------------------------------------------------
    /* END FUNCTION*/
    -----------------------------------------------------------------
end AMS_MODL_VS2016;
/
