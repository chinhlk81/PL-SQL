create or replace package ams.AMS_MODL_DATA_TALISMAN is

    PACK_DATE date := to_date('09-jul-2011');

    MODULE_CODE_MAIN VARCHAR2(16) := 'MAIN';
    MODULE_CODE_PROM VARCHAR2(16) := 'PROM';
    MODULE_CODE_COMP VARCHAR2(16) := 'COMP';

    TRANS_CODE_INIT VARCHAR2(16) := 'INIT';
    TRANS_CODE_CANC VARCHAR2(16) := 'CANC';
    TRANS_CODE_FREQ VARCHAR2(16) := 'FREQ';
    TRANS_CODE_LUMS VARCHAR2(16) := 'LUMS';
    TRANS_CODE_LOAN VARCHAR2(16) := 'LOAN';
    TRANS_CODE_EXTR VARCHAR2(16) := 'EXTR';

    POLYC_CODE_INIT VARCHAR2(16) := 'INIT';
    POLYC_CODE_EFFE VARCHAR2(16) := 'EFFE';
    POLYC_CODE_PROC VARCHAR2(16) := 'PROC';
    POLYC_CODE_CANC VARCHAR2(16) := 'CANC';
    POLYC_CODE_TERM VARCHAR2(16) := 'TERM';
    POLYC_CODE_REIS VARCHAR2(16) := 'REIS';
    POLYC_CODE_EXIT VARCHAR2(16) := 'EXIT';

    TALISMAN_GOLIVE date := to_date('28-feb-2011');
    RECORD_MAX_DELETE number(10) := 50000;

    SYSTEM_USER varchar2(16) := 'SYSTEM';
    THEME_LANGUAGE VARCHAR2(16) := 'VN';

    OBJECT_STATUS_ACTIVE VARCHAR2(16) := 'ACTI';
    OBJECT_STATUS_INACTIVE VARCHAR2(16) := 'INAT';
    OBJECT_STATUS_FREEZE VARCHAR2(16) := 'FRZE';

    VERSION_DATE date := trunc(sysdate, 'DD');
    procedure main(valRecordDate date := null);

    procedure promotion(valRecordDate date := null);

    procedure get_app(valRecordDate date := null,
        valTypeOfData varchar2 := null,
        valMonths number := 0);

    procedure get_comm(valRecordDate date := null,
        valTypeOfData varchar2 := null);

    procedure get_fyp(valRecordDate date := null,
        valTypeOfData varchar2 := null);

    procedure get_policy(valRecordDate date := null,
        valTypeOfData varchar2 := null);

end AMS_MODL_DATA_TALISMAN;
/
create or replace package body ams.AMS_MODL_DATA_TALISMAN is

    procedure main(valRecordDate date := null)
    is
    begin
        /* APP*/
        AMS_MODL_DATA_TALISMAN.get_app(valRecordDate,
            AMS_MODL_DATA_TALISMAN.MODULE_CODE_MAIN,
            11);

        /* FYC*/
        AMS_MODL_DATA_TALISMAN.get_comm(valRecordDate,
            AMS_MODL_DATA_TALISMAN.MODULE_CODE_MAIN);

        /* FYP*/
        AMS_MODL_DATA_TALISMAN.get_fyp(valRecordDate,
            AMS_MODL_DATA_TALISMAN.MODULE_CODE_MAIN);

        /* POLICY*/
        AMS_MODL_DATA_TALISMAN.get_policy(valRecordDate,
            AMS_MODL_DATA_TALISMAN.MODULE_CODE_MAIN);

    end;

    procedure promotion(valRecordDate date := null)
    is
    begin
        /* FYC*/
        /*AMS_MODL_DATA_TALISMAN.get_comm(valRecordDate,
            AMS_MODL_DATA_TALISMAN.MODULE_CODE_PROM);*/

        /* FYP*/
        AMS_MODL_DATA_TALISMAN.get_fyp(valRecordDate,
            AMS_MODL_DATA_TALISMAN.MODULE_CODE_PROM);

        /* POLICY*/
        AMS_MODL_DATA_TALISMAN.get_policy(valRecordDate,
            AMS_MODL_DATA_TALISMAN.MODULE_CODE_PROM);

    end;

    procedure get_app(valRecordDate date := null,
        valTypeOfData varchar2 := null,
        valMonths number := 0)
    is
    begin
        /* Xoa du lieu APP trong bang mod_data_apps*/
        loop
            delete mod_data_apps del
            where del.record_date = trunc(valRecordDate, 'MM')
                and del.type_of_data = valTypeOfData
                and del.source_of_data = AMS_CORE_SYSTEM.SYSTEM_REFER_TALISMAN
                and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        /* Loai bo index*/
        --AMS_CORE_INDEX.unusable('MOD_DATA_APPS_I01');
        --AMS_CORE_INDEX.unusable('MOD_DATA_APPS_I02');
        --AMS_CORE_INDEX.unusable('MOD_DATA_APPS_I03');

        /* Cap nhat du lieu*/
        /* chinhlk 15/7/2014 theo yeu cau anh Hoa va anh Tuan tach ra */
        /*Truong hop voi cac status code khong la UNAP*/
        insert /*+ APPEND */ into mod_data_apps nologging
        select /*+ CARDINALITY(rcpt, 100)
                   CARDINALITY(app, 100)
                   CARDINALITY(acti, 100)
                   CARDINALITY(loca, 100)
                   CARDINALITY(issu, 100)
                   CARDINALITY(acc, 100)
                    */
            null,
            null,
            nvl(issu.outlet_client_id,
                nvl(rcpt.collection_agent_id, loca.outlet_client_id)) outlet_talisman_id,
            null,
            null,
            trunc(valRecordDate, 'MM'),
            cast(trunc(sysdate, 'DD') as date),
            AMS_CORE_SYSTEM.SYSTEM_REFER_TALISMAN,
            valTypeOfData,
            AMS_CORE_CODE.OBJECT_STATUS_ACTIVE,
            app.application_form_id,
            rcpt.application_form_number,
            rcpt.status_code,
            rcpt.cash_receipt_id,
            rcpt.receipt_number,
            cast(rcpt.status_code as varchar2(16)) as status_code, --rcpt.status_code,
            acc.account_number,
            acc.product_id,
            null,
            cast(trunc(rcpt.effective_date, 'DD') as date),
            cast(trunc(rcpt.date_entered, 'DD') as date),
            cast(trunc(rcpt.money_received_date, 'DD') as date),
            cast(trunc(issu.effective_date, 'DD') as date),
            acti.freq_per_annum,
            nvl(rcpt.amount, 0),
            null,
            null,
            null,
            null,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            select
                pr.cash_receipt_id,
                cr.receipt_number,
                pr.money_received_date,
                cr.effective_date,
                cr.date_entered,
                pr.amount,
                pr.status_code,
                pr.application_form_number,
                pr.account_id,
                cr.collection_agent_id,
                cr.location_id
            from ods.payment_received pr
            join ods.cash_receipt cr
                on cr.cash_receipt_id = pr.cash_receipt_id
            where pr.status_code not in ('SPLT', 'REVS')
                and trunc(pr.money_received_date, 'DD')
                    between add_months(trunc(valRecordDate, 'MM'), 0 - valMonths)
                    and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                and pr.account_id is not null
                and trunc(cr.date_entered, 'DD') >= AMS_CORE_SYSTEM.TALISMAN_GOLIVE
                --lay cac truong hop khac UNAP
                and pr.status_code <> 'UNAP'
        ) rcpt
        left join
        (
            select /*+ CARDINALITY(pol, 100) CARDINALITY(inf, 100) */
                inf.outlet_client_id,
                inf.account_id,
                inf.effective_date,
                inf.processed_date
            from
            (
                select /*+ CARDINALITY(tmp, 100) */
                    tmp.activity_id
                from ods.activity  tmp
                where tmp.activity_code = 'A100'
                    and trunc(tmp.bus_processed_date, 'DD') <= (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                minus
                select /*+ CARDINALITY(tmp, 100) */
                    tmp.reversed_acti_id activity_id
                from ods.activity  tmp
                where tmp.activity_code = 'R100'
                    and trunc(tmp.bus_processed_date, 'DD') <= (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
            ) pol
            join
            (
                select /*+ CARDINALITY(tmp, 100) */
                    tmp.activity_id,
                    tmp.outlet_client_id,
                    tmp.account_id,
                    tmp.effective_date,
                    tmp.first_created processed_date
                from ods.activity  tmp
                where tmp.activity_code = 'A100'
                    and trunc(tmp.bus_processed_date, 'DD') <= (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
            ) inf
                on inf.activity_id = pol.activity_id
        ) issu
            on issu.account_id = rcpt.account_id
        left join ods.application_form app
            on app.application_number = rcpt.application_form_number
        left join ods.activity  acti
            on acti.activity_id = app.activity_id
        left join ods.location loca
            on loca.location_id = rcpt.location_id
        left join ods.account  acc
            on acc.account_id = rcpt.account_id
        where
        (
            issu.account_id is null
            or
            rcpt.date_entered < issu.processed_date
        )
        ;
        commit;

        insert /*+ APPEND */ into mod_data_apps nologging
        select /*+ CARDINALITY(rcpt, 100)
                   CARDINALITY(app, 100)
                   CARDINALITY(acti, 100)
                   CARDINALITY(loca, 100)
                   CARDINALITY(issu, 100)
                   CARDINALITY(acc, 100)
                   CARDINALITY(actaf, 100)
                    */
            null,
            null,
            nvl(issu.outlet_client_id,
                nvl(rcpt.collection_agent_id, loca.outlet_client_id)) outlet_talisman_id,
            null,
            null,
            trunc(valRecordDate, 'MM'),
            cast(trunc(sysdate, 'DD') as date),
            AMS_CORE_SYSTEM.SYSTEM_REFER_TALISMAN,
            valTypeOfData,
            AMS_CORE_CODE.OBJECT_STATUS_ACTIVE,
            app.application_form_id,
            rcpt.application_form_number,
            --neu ma nam trong cac trang thai nay thi se xu ly cho no nhu the nay
            case
                when rcpt.status_code = 'UNAP' and actaf.activity_code in (
                    'P020', --Từ chối chấp nhận bảo hiểm vì lý do sức khỏe
                    'P018', --Từ chối chấp nhận bảo hiểm vì lý do tài chính
                    'P021', --Từ chối chấp nhận bảo hiểm vì lý do nghề nghiệp
                    'P022') --Từ chối chấp nhận bảo hiểm vì lý do khác
                 then 'REFU' --tu choi
                 when rcpt.status_code = 'UNAP' and actaf.activity_code in (
                    'P023',  --Trì hoãn chấp nhận bảo hiểm vì lý do sức khỏe
                    'P024')  --Trì hoãn chấp nhận bảo hiểm vì lý do khác
                 then 'DELA' -- tri hoan
                 when rcpt.status_code = 'UNAP' and actaf.activity_code in (
                    'NTUE')  --Ra quyết định hết hiệu lực bảo hiểm tạm thời
                 then 'HHLU' --  Het hieu luc
                 when rcpt.status_code = 'UNAP' and actaf.activity_code in (
                    'NTUW',--Hủy do không đủ điều kiện tham gia bảo hiểm
                    'NTU2', --Ra quyết định hủy bỏ yêu cầu do khách hàng yêu cầu
                    'NTUF',--Ra quyết định hủy hồ sơ YCBH theo yêu cầu của khách hàng (lý do tài chính)
                    'NTUM',--Ra quyết định hủy hồ sơ YCBH theo yêu cầu của khách hàng (lý do sức khỏe)
                    'NTU0' --Ra quyết định hủy bỏ yêu cầu do khách hàng yêu cầu (khách hàng là tổ chức)
                     )
                 then 'CANC' -- Huy bien lai tam thoi, da co trong khai bao roi
                 else--neu khong thi se lam theo cac status code nhu the nay
                 cast(rcpt.status_code as varchar2(16))
            end status_code,
            rcpt.cash_receipt_id,
            rcpt.receipt_number,
            rcpt.status_code,
            acc.account_number,
            acc.product_id,
            null,
            cast(trunc(rcpt.effective_date, 'DD') as date),
            cast(trunc(rcpt.date_entered, 'DD') as date),
            cast(trunc(rcpt.money_received_date, 'DD') as date),
            cast(trunc(issu.effective_date, 'DD') as date),
            acti.freq_per_annum,
            nvl(rcpt.amount, 0),
            null,
            null,
            null,
            null,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            select
                pr.cash_receipt_id,
                cr.receipt_number,
                pr.money_received_date,
                cr.effective_date,
                cr.date_entered,
                pr.amount,
                pr.status_code,
                pr.application_form_number,
                pr.account_id,
                cr.collection_agent_id,
                cr.location_id
            from ods.payment_received pr
            join ods.cash_receipt cr
                on cr.cash_receipt_id = pr.cash_receipt_id
            where pr.status_code not in ('SPLT', 'REVS')
                and trunc(pr.money_received_date, 'DD')
                    between add_months(trunc(valRecordDate, 'MM'), 0 - valMonths)
                    and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                and pr.account_id is not null
                and trunc(cr.date_entered, 'DD') >= AMS_CORE_SYSTEM.TALISMAN_GOLIVE
                --lay cac truong hop  la UNAP
                and pr.status_code = 'UNAP'
        ) rcpt
        left join
        (
            select /*+ CARDINALITY(pol, 100) CARDINALITY(inf, 100) */
                inf.outlet_client_id,
                inf.account_id,
                inf.effective_date,
                inf.processed_date
            from
            (
                select /*+ CARDINALITY(tmp, 100) */
                    tmp.activity_id
                from ods.activity  tmp
                where tmp.activity_code = 'A100'
                    and trunc(tmp.bus_processed_date, 'DD') <= (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                minus
                select /*+ CARDINALITY(tmp, 100) */
                    tmp.reversed_acti_id activity_id
                from ods.activity  tmp
                where tmp.activity_code = 'R100'
                    and trunc(tmp.bus_processed_date, 'DD') <= (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
            ) pol
            join
            (
                select /*+ CARDINALITY(tmp, 100) */
                    tmp.activity_id,
                    tmp.outlet_client_id,
                    tmp.account_id,
                    tmp.effective_date,
                    tmp.first_created processed_date
                from ods.activity  tmp
                where tmp.activity_code = 'A100'
                    and trunc(tmp.bus_processed_date, 'DD') <= (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
            ) inf
                on inf.activity_id = pol.activity_id
        ) issu
            on issu.account_id = rcpt.account_id
        left join ods.application_form app
            on app.application_number = rcpt.application_form_number
        left join ods.activity  acti
            on acti.activity_id = app.activity_id
        left join ods.location loca
            on loca.location_id = rcpt.location_id
        left join ods.account  acc
            on acc.account_id = rcpt.account_id
        left join  ods.activity actaf
            on actaf.account_id = rcpt.account_id
        where
        (
            issu.account_id is null
            or
            rcpt.date_entered < issu.processed_date
        )
        and   actaf.activity_id = (select /*+ CARDINALITY(aa, 100) */  max(aa.activity_id) from ods.activity aa
                                                         where  aa.account_id = rcpt.account_id
                                                             and trunc(aa.bus_processed_date, 'DD')
                                                                 between add_months(trunc(valRecordDate, 'MM'), 0 - valMonths)
                                                                 and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                                                              --Khong ton tai hanh dong Undo
                                                              and not exists (select /*+ CARDINALITY(b, 100) */   1 from ods.activity b
                                                                               where b.reversed_acti_id = aa.activity_id
                                                                                     and b.account_id = rcpt.account_id
                                                                                     and trunc(b.bus_processed_date, 'DD')
                                                                                         between add_months(trunc(valRecordDate, 'MM'), 0 - valMonths)
                                                                                         and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                                                                              )
                                                         )
        ;
        commit;

        insert /*+ APPEND */ into mod_data_apps nologging
        select /*+ CARDINALITY(rcpt, 100)
                   CARDINALITY(app, 100)
                   CARDINALITY(acti, 100)
                   CARDINALITY(loca, 100)
                   CARDINALITY(issu, 100)
                   CARDINALITY(acc, 100) */
            null,
            null,
            nvl(rcpt.collection_agent_id, loca.outlet_client_id) outlet_talisman_id,
            null,
            null,
            trunc(valRecordDate, 'MM'),
            cast(trunc(sysdate, 'DD') as date),
            AMS_CORE_SYSTEM.SYSTEM_REFER_TALISMAN,
            valTypeOfData,
            AMS_CORE_CODE.OBJECT_STATUS_ACTIVE,
            app.application_form_id,
            rcpt.application_form_number,
            rcpt.status_code,
            rcpt.cash_receipt_id,
            rcpt.receipt_number,
            rcpt.status_code,
            null,
            null,
            null,
            cast(trunc(rcpt.effective_date, 'DD') as date),
            cast(trunc(rcpt.date_entered, 'DD') as date),
            cast(trunc(rcpt.money_received_date, 'DD') as date),
            cast(trunc(rcpt.effective_date, 'DD') as date),
            null,
            nvl(rcpt.amount, 0),
            null,
            null,
            null,
            null,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            select
                pr.cash_receipt_id,
                cr.receipt_number,
                pr.money_received_date,
                cr.effective_date,
                cr.date_entered,
                pr.amount,
                pr.status_code,
                pr.application_form_number,
                pr.account_id,
                cr.collection_agent_id,
                cr.location_id
            from ods.payment_received pr
            join ods.cash_receipt cr
                on cr.cash_receipt_id = pr.cash_receipt_id
            where pr.status_code not in ('SPLT', 'REVS')
                and trunc(pr.money_received_date, 'DD')
                    between add_months(trunc(valRecordDate, 'MM'), 0 - valMonths)
                    and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                and trunc(cr.date_entered, 'DD') >= AMS_CORE_SYSTEM.TALISMAN_GOLIVE
                and pr.application_form_number is not null
                and pr.account_id is null
        ) rcpt
        left join ods.application_form app
            on app.application_number = rcpt.application_form_number
        left join ods.location loca
            on loca.location_id = rcpt.location_id;
        commit;

        /* Cap nhap ma AMS, Talisman, Bvlife*/
        merge /*+ CARDINALITY(apps, 100) */
            into mod_data_apps apps
        using
            (
                select /*+ CARDINALITY(outl, 100)*/
                    outl.outlet_client_id outlet_talisman_id,
                    outl.outlet_number outlet_ams_id
                from ods.outlet  outl
            ) upd
        on (
            trunc(valRecordDate, 'MM') = apps.record_date
            and
            AMS_CORE_SYSTEM.SYSTEM_REFER_TALISMAN = apps.source_of_data
            and
            valTypeOfData = apps.type_of_data
            and
            upd.outlet_talisman_id = apps.outlet_talisman_id
            )
        when matched then
            update
            set apps.outlet_ams_id = upd.outlet_ams_id,
                apps.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                apps.update_datetime = sysdate;
        commit;
    end;

    procedure get_comm(valRecordDate date := null,
        valTypeOfData varchar2 := null)
    is
    begin
        /* Xoa du lieu COMM trong bang mod_data_comm*/
        loop
            delete mod_data_comm del
            where del.record_date = trunc(valRecordDate, 'MM')
                and del.type_of_data = valTypeOfData
                and del.source_of_data = AMS_CORE_SYSTEM.SYSTEM_REFER_TALISMAN
                and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        /* Loai bo index*/
        --AMS_CORE_INDEX.unusable('MOD_DATA_COMM_I01');
        --AMS_CORE_INDEX.unusable('MOD_DATA_COMM_I02');
        --AMS_CORE_INDEX.unusable('MOD_DATA_COMM_I03');

        /* Tinh COMM va FYC sau ngay cap nhat 09-jul-2011*/
        /*Rieng cho SP NA31 co ma giao dich la COM0*/
        insert /*+ APPEND */ into ams.mod_data_comm nologging(
            outlet_ams_id,
            outlet_talisman_id,
            record_date,
            version_date,
            source_of_data,
            type_of_data,
            status_code,
            policy_number,
            processed_date,
            commission,
            fyc,
            system_id_of_billing,
            create_user,
            update_user,
            create_datetime,
            update_datetime
        )
        select /*+ CARDINALITY(outl, 100) CARDINALITY(comm, 100) */
            outl.outlet_talisman_id,
            outl.outlet_talisman_id,
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            AMS_CORE_SYSTEM.SYSTEM_REFER_TALISMAN,
            valTypeOfData,
            AMS_CORE_CODE.OBJECT_STATUS_ACTIVE,
            comm.account_number,
            cast(comm.processed_date as date),
            sum(comm.commission),
            sum(comm.fyc),
            comm.transaction_event_id,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            select
                o.outlet_number outlet_talisman_id,
                o.outlet_client_id
            from ods.outlet  o
        ) outl
        join
        (
            select
                tmp.outlet_client_id,
                tmp.transaction_event_id,
                trunc(nvl(tmp.bus_process_date, tmp.date_created), 'DD') processed_date,
                tmp.account_number,
                /*Chi tieu hoa hong khai thac van giu nguyen*/
                nvl(tmp.commission_amount, 0) commission,
                /*Chi tieu FYC thi chi tinh 10% tren hoa hong khai thac*/
                0.1*nvl(tmp.commission_amount, 0) fyc
            from ods.commission_payment_history  tmp
            where trunc(nvl(tmp.bus_process_date, tmp.date_created), 'DD')
                    between trunc(valRecordDate, 'MM')
                    and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                and trunc(nvl(tmp.bus_process_date, tmp.date_created), 'DD') >= AMS_CORE_SYSTEM.TALISMAN_GOLIVE
                and tmp.expense_type_code in (
                    'COM0',
                    'RCO0',
                    'CCM0',
                    'RCM0'
                )
        ) comm
            on comm.outlet_client_id = outl.outlet_client_id
        group by outl.outlet_talisman_id,
            comm.transaction_event_id,
            comm.processed_date,
            comm.account_number;
        commit;

        /* Tinh COMM va FYC sau ngay cap nhat 09-jul-2011
        Cho cac san pham khac*/
        insert /*+ APPEND */ into ams.mod_data_comm nologging(
            outlet_ams_id,
            outlet_talisman_id,
            record_date,
            version_date,
            source_of_data,
            type_of_data,
            status_code,
            policy_number,
            processed_date,
            commission,
            fyc,
            system_id_of_billing,
            create_user,
            update_user,
            create_datetime,
            update_datetime
        )
        select /*+ CARDINALITY(outl, 100) CARDINALITY(comm, 100) */
            outl.outlet_talisman_id,
            outl.outlet_talisman_id,
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            AMS_CORE_SYSTEM.SYSTEM_REFER_TALISMAN,
            valTypeOfData,
            AMS_CORE_CODE.OBJECT_STATUS_ACTIVE,
            comm.account_number,
            cast(comm.processed_date as date),
            sum(comm.commission),
            sum(comm.commission),
            comm.transaction_event_id,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            select
                o.outlet_number outlet_talisman_id,
                o.outlet_client_id
            from ods.outlet  o
        ) outl
        join
        (
            select
                tmp.outlet_client_id,
                tmp.transaction_event_id,
                trunc(nvl(tmp.bus_process_date, tmp.date_created), 'DD') processed_date,
                tmp.account_number,
                nvl(tmp.commission_amount, 0) commission
            from ods.commission_payment_history  tmp
            where trunc(nvl(tmp.bus_process_date, tmp.date_created), 'DD')
                    between trunc(valRecordDate, 'MM')
                    and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                and trunc(nvl(tmp.bus_process_date, tmp.date_created), 'DD') >= AMS_CORE_SYSTEM.TALISMAN_GOLIVE
                and tmp.expense_type_code in (
                    'COM1',
                    'RCO1',
                    'CCM1',
                    'RCM1'
                )
        ) comm
            on comm.outlet_client_id = outl.outlet_client_id
        group by outl.outlet_talisman_id,
            comm.transaction_event_id,
            comm.processed_date,
            comm.account_number;
        commit;

        /* FYC = 0 khi hoa hong khong nam trong nam thu nhat hop dong*/
        insert /*+ APPEND */ into ams.mod_data_comm nologging(
            outlet_ams_id,
            outlet_talisman_id,
            record_date,
            version_date,
            source_of_data,
            type_of_data,
            status_code,
            policy_number,
            processed_date,
            commission,
            fyc,
            system_id_of_billing,
            create_user,
            update_user,
            create_datetime,
            update_datetime
        )
        select /*+ CARDINALITY(outl, 100) CARDINALITY(comm, 100) */
            outl.outlet_talisman_id,
            outl.outlet_talisman_id,
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            AMS_CORE_SYSTEM.SYSTEM_REFER_TALISMAN,
            valTypeOfData,
            AMS_CORE_CODE.OBJECT_STATUS_ACTIVE,
            comm.account_number,
            cast(comm.processed_date as date),
            sum(comm.commission),
            0,
            comm.transaction_event_id,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            select o.outlet_number outlet_talisman_id,
                o.outlet_client_id
            from ods.outlet  o
        ) outl
        join
        (
            select tmp.outlet_client_id,
                tmp.transaction_event_id,
                trunc(nvl(tmp.bus_process_date, tmp.date_created), 'DD') processed_date,
                tmp.account_number,
                nvl(tmp.commission_amount, 0) commission
            from ods.commission_payment_history  tmp
            where trunc(nvl(tmp.bus_process_date, tmp.date_created), 'DD')
                    between trunc(valRecordDate, 'MM')
                    and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                and trunc(nvl(tmp.bus_process_date, tmp.date_created), 'DD') >= AMS_CORE_SYSTEM.TALISMAN_GOLIVE
                and tmp.expense_type_code in (
                    'COM2', 'COM3', 'COM4', 'COM5', 'COM6', 'COMS',
                    'RCO2', 'RCO3', 'RCO4', 'RCO5', 'RCO6', 'RCOS',
                    'CCM2', 'CCM3', 'CCM4', 'CCM5', 'CCM6', 'CCMS',
                    'RCM2', 'RCM3', 'RCM4', 'RCM5', 'RCM6', 'RCMS'
                )
        ) comm
            on comm.outlet_client_id = outl.outlet_client_id
        group by outl.outlet_talisman_id,
            comm.transaction_event_id,
            comm.processed_date,
            comm.account_number;
        commit;

        /* Fix loi config hoa hong nam 1 truoc ngay cap nhat 09-jul-2011*/
        if trunc(valRecordDate, 'MM') <= trunc(AMS_MODL_DATA_TALISMAN.PACK_DATE, 'MM') then
            /* Xoa du lieu tam tinh trong bang pak_data_taltrans*/
            AMS_CORE_TABLE.truncate('pak_data_talcomms');

            /* Cac hoa hong truoc ngay cap nhat 09-jul-2011*/
            insert /*+ APPEND */ into ams.pak_data_talcomms nologging(
                outlet_talisman_id,
                record_date,
                version_date,
                transaction_event_id,
                processed_date,
                commission,
                account_id,
                account_number,
                create_user,
                update_user,
                create_datetime,
                update_datetime
            )
            select /*+ CARDINALITY(outl, 100) CARDINALITY(comm, 100) */
                outl.outlet_talisman_id,
                trunc(valRecordDate, 'MM'),
                trunc(sysdate, 'DD'),
                comm.transaction_event_id,
                cast(comm.processed_date as date),
                comm.commission,
                comm.account_id,
                comm.account_number,
                AMS_CORE_SYSTEM.SYSTEM_USER,
                AMS_CORE_SYSTEM.SYSTEM_USER,
                sysdate,
                sysdate
            from
            (
                select o.outlet_number outlet_talisman_id,
                    o.outlet_client_id
                from ods.outlet  o
            ) outl
            join
            (
                select tmp.outlet_client_id,
                    tmp.transaction_event_id,
                    trunc(nvl(tmp.bus_process_date, tmp.date_created), 'DD') processed_date,
                    tmp.account_id,
                    tmp.account_number,
                    nvl(tmp.commission_amount, 0) commission
                from ods.commission_payment_history  tmp
                where trunc(nvl(tmp.bus_process_date, tmp.date_created), 'DD')
                        between trunc(valRecordDate, 'MM')
                        and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                    and trunc(nvl(tmp.bus_process_date, tmp.date_created), 'DD') >= AMS_CORE_SYSTEM.TALISMAN_GOLIVE
                    and tmp.expense_type_code in (
                        'COMM', 'RCOM',
                        'CLAW', 'RCLW'
                    )
            ) comm
                on comm.outlet_client_id = outl.outlet_client_id;
            commit;

            /* Cap nhat ngay phat hanh hop dong trong bang pak_data_talcomms */
            merge /*+ CARDINALITY(comm, 100) */
                into pak_data_talcomms comm
            using
                (
                    select /*+ CARDINALITY(pol, 100) CARDINALITY(inf, 100) */
                        pol.account_id,
                        cast(inf.issue_date as date) issue_date
                    from
                    (
                        select tmp.activity_id,
                            tmp.account_id
                        from ods.activity  tmp
                        where trunc(tmp.bus_processed_date, 'DD') <= (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                            and tmp.activity_code = 'A100'
                        minus
                        select tmp.reversed_acti_id activity_id,
                            tmp.account_id
                        from ods.activity  tmp
                        where trunc(tmp.bus_processed_date, 'DD') <= (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                            and tmp.activity_code = 'R100'
                    ) pol
                    join
                    (
                        select tmp.activity_id,
                            tmp.account_id,
                            trunc(tmp.bus_processed_date, 'DD') issue_date
                        from ods.activity  tmp
                        where trunc(tmp.bus_processed_date, 'DD') <= (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                            and tmp.activity_code = 'A100'
                    ) inf
                        on inf.activity_id = pol.activity_id
                ) upd
            on (
                upd.account_id = comm.account_id
                )
            when matched then
                update
                set comm.issue_date = upd.issue_date,
                    comm.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                    comm.update_datetime = sysdate;
            commit;

            /* Hoa hong va FYC */
            insert /*+ APPEND */ into ams.mod_data_comm nologging(
                outlet_ams_id,
                outlet_talisman_id,
                record_date,
                version_date,
                source_of_data,
                type_of_data,
                status_code,
                policy_number,
                processed_date,
                commission,
                fyc,
                system_id_of_billing,
                create_user,
                update_user,
                create_datetime,
                update_datetime
            )
            select
                comm.outlet_talisman_id,
                comm.outlet_talisman_id,
                trunc(valRecordDate, 'MM'),
                trunc(sysdate, 'DD'),
                AMS_CORE_SYSTEM.SYSTEM_REFER_TALISMAN,
                valTypeOfData,
                AMS_CORE_CODE.OBJECT_STATUS_ACTIVE,
                comm.account_number,
                comm.processed_date,
                sum(comm.commission),
                sum(comm.fyc),
                comm.transaction_event_id,
                AMS_CORE_SYSTEM.SYSTEM_USER,
                AMS_CORE_SYSTEM.SYSTEM_USER,
                sysdate,
                sysdate
            from
            (
                select tmp.outlet_talisman_id,
                    tmp.transaction_event_id,
                    tmp.processed_date,
                    tmp.commission,
                    case
                        when (add_months(tmp.processed_date, -12) < nvl(tmp.issue_date, AMS_CORE_SYSTEM.DATE_MIN_VALUE)) then
                            tmp.commission
                        else
                            0
                        end fyc,
                    tmp.account_number
                from pak_data_talcomms tmp
                where tmp.record_date = trunc(valRecordDate, 'MM')
            ) comm
            group by comm.outlet_talisman_id,
                comm.transaction_event_id,
                comm.processed_date,
                comm.account_number;
            commit;
        end if;

        /* Khoi dong lai index*/
        --AMS_CORE_INDEX.rebuild('MOD_DATA_COMM_I01');
        --AMS_CORE_INDEX.rebuild('MOD_DATA_COMM_I02');
        --AMS_CORE_INDEX.rebuild('MOD_DATA_COMM_I03');

        /* Cap nhap ma AMS, Talisman, Bvlife*/
        /*merge \*+ CARDINALITY(comm, 100)*\
            into mod_data_comm comm
        using
            (
                select m.outlet_ams_id,
                    m.outlet_talisman_id
                from ams.serv_outlet_mapping m
            ) upd
        on (
            trunc(valRecordDate, 'MM') = comm.record_date
            and
            AMS_CORE_SYSTEM.SYSTEM_REFER_TALISMAN = comm.source_of_data
            and
            valTypeOfData = comm.type_of_data
            and
            upd.outlet_talisman_id = comm.outlet_talisman_id
            )
        when matched then
            update
            set comm.outlet_ams_id = upd.outlet_ams_id,
                comm.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                comm.update_datetime = sysdate;
        commit;*/

    end;

    procedure get_fyp(valRecordDate date := null,
        valTypeOfData varchar2 := null)
    is
    begin
        /* Xoa du lieu FYP trong bang mod_data_fyp*/
        loop
            delete mod_data_fyp del
            where del.record_date = trunc(valRecordDate, 'MM')
                and del.type_of_data = valTypeOfData
                and del.source_of_data = AMS_CORE_SYSTEM.SYSTEM_REFER_TALISMAN
                and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        /* Loai bo index*/
        --AMS_CORE_INDEX.unusable('MOD_DATA_FYP_I01');
        --AMS_CORE_INDEX.unusable('MOD_DATA_FYP_I02');
        --AMS_CORE_INDEX.unusable('MOD_DATA_FYP_I03');

        /* Tinh FYP cua cac hoa don dinh ky sau ngay cap nhat 09-jul-2011
        cua SP NA31 co ma la PHI0,...*/
        insert /*+ APPEND */ into mod_data_fyp nologging(
            outlet_ams_id,
            outlet_talisman_id,
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
        select /*+ CARDINALITY(outl, 100) CARDINALITY(tran, 100) */
            outl.outlet_talisman_id,
            outl.outlet_talisman_id,
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            AMS_CORE_SYSTEM.SYSTEM_REFER_TALISMAN,
            valTypeOfData,
            AMS_CORE_CODE.OBJECT_STATUS_ACTIVE,
            tran.transaction_code,
            tran.account_number,
            cast(tran.processed_date as date),
            sum(tran.premium),
            tran.transaction_event_id,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            select
                o.outlet_number outlet_talisman_id,
                o.outlet_client_id
            from ods.outlet  o
        ) outl
        join
        (
            select /*+ CARDINALITY(fyp, 100) CARDINALITY(ext, 100) */
                fyp.outlet_client_id,
                fyp.transaction_event_id,
                fyp.account_number,
                fyp.processed_date,
                case
                    when nvl(ext.ratio_rate, 1) = 1 then
                        AMS_MODL_DATA_TALISMAN.TRANS_CODE_FREQ
                    else
                        AMS_MODL_DATA_TALISMAN.TRANS_CODE_LUMS
                    end transaction_code,
                nvl(fyp.premium, 0) * nvl(ext.ratio_rate, 1) premium
            from
            (
                select /*+ CARDINALITY(tmp, 100) */
                    tmp.outlet_client_id,
                    tmp.transaction_event_id,
                    tmp.account_number,
                    trunc(nvl(tmp.bus_process_date, tmp.date_created), 'DD') processed_date,
                    0.1*tmp.commission_amount premium  --xu ly cho no o day la 10%
                from ods.commission_payment_history  tmp
                where trunc(nvl(tmp.bus_process_date, tmp.date_created), 'DD')
                        between trunc(valRecordDate, 'MM')
                        and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                    and trunc(nvl(tmp.bus_process_date, tmp.date_created), 'DD') >= AMS_CORE_SYSTEM.TALISMAN_GOLIVE
                    and tmp.expense_type_code in (
                        'PHI0',
                        'RPI0',
                        'CPI0',
                        'RCP0'
                    )
            ) fyp
            left join
            (
                select /*+ CARDINALITY(tmp, 100) */
                    tmp.transaction_event_id,
                    0.1 ratio_rate
                from ods.account_transaction  tmp
                where trunc(tmp.processed_date, 'DD')
                        between add_months(trunc(valRecordDate, 'MM'), -1)
                        and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                    and trunc(tmp.processed_date, 'DD') >= AMS_CORE_SYSTEM.TALISMAN_GOLIVE
                    and tmp.transaction_type_code in (
                        'LS',
                        'RLS'
                    )
                group by tmp.transaction_event_id
            ) ext
                on ext.transaction_event_id = fyp.transaction_event_id
        ) tran
            on tran.outlet_client_id = outl.outlet_client_id
        group by outl.outlet_talisman_id,
            tran.account_number,
            tran.transaction_event_id,
            tran.transaction_code,
            tran.processed_date;
        commit;

        /* Tinh FYP cua cac hoa don dinh ky sau ngay cap nhat 09-jul-2011 cho cac san pham khac va co ma la PHI1,...*/
        insert /*+ APPEND */ into mod_data_fyp nologging(
            outlet_ams_id,
            outlet_talisman_id,
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
        select /*+ CARDINALITY(outl, 100) CARDINALITY(tran, 100) */
            outl.outlet_talisman_id,
            outl.outlet_talisman_id,
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            AMS_CORE_SYSTEM.SYSTEM_REFER_TALISMAN,
            valTypeOfData,
            AMS_CORE_CODE.OBJECT_STATUS_ACTIVE,
            tran.transaction_code,
            tran.account_number,
            cast(tran.processed_date as date),
            sum(tran.premium),
            tran.transaction_event_id,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            select
                o.outlet_number outlet_talisman_id,
                o.outlet_client_id
            from ods.outlet  o
        ) outl
        join
        (
            select /*+ CARDINALITY(fyp, 100) CARDINALITY(ext, 100) */
                fyp.outlet_client_id,
                fyp.transaction_event_id,
                fyp.account_number,
                fyp.processed_date,
                case
                    when nvl(ext.ratio_rate, 1) = 1 then
                        AMS_MODL_DATA_TALISMAN.TRANS_CODE_FREQ
                    else
                        AMS_MODL_DATA_TALISMAN.TRANS_CODE_LUMS
                    end transaction_code,
                nvl(fyp.premium, 0) * nvl(ext.ratio_rate, 1) premium
            from
            (
                select /*+ CARDINALITY(tmp, 100) */
                    tmp.outlet_client_id,
                    tmp.transaction_event_id,
                    tmp.account_number,
                    trunc(nvl(tmp.bus_process_date, tmp.date_created), 'DD') processed_date,
                    tmp.commission_amount premium
                from ods.commission_payment_history  tmp
                where trunc(nvl(tmp.bus_process_date, tmp.date_created), 'DD')
                        between trunc(valRecordDate, 'MM')
                        and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                    and trunc(nvl(tmp.bus_process_date, tmp.date_created), 'DD') >= AMS_CORE_SYSTEM.TALISMAN_GOLIVE
                    and tmp.expense_type_code in (
                        'PHI1',
                        'RPI1',
                        'CPI1',
                        'RCP1'
                    )
            ) fyp
            left join
            (
                select /*+ CARDINALITY(tmp, 100) */
                    tmp.transaction_event_id,
                    0.1 ratio_rate
                from ods.account_transaction  tmp
                where trunc(tmp.processed_date, 'DD')
                        between add_months(trunc(valRecordDate, 'MM'), -1)
                        and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                    and trunc(tmp.processed_date, 'DD') >= AMS_CORE_SYSTEM.TALISMAN_GOLIVE
                    and tmp.transaction_type_code in (
                        'LS',
                        'RLS'
                    )
                group by tmp.transaction_event_id
            ) ext
                on ext.transaction_event_id = fyp.transaction_event_id
        ) tran
            on tran.outlet_client_id = outl.outlet_client_id
        group by outl.outlet_talisman_id,
            tran.account_number,
            tran.transaction_event_id,
            tran.transaction_code,
            tran.processed_date;
        commit;

        /* Fix loi config phi nam 1 truoc ngay cap nhat 09-jul-2011*/
        if trunc(valRecordDate, 'MM') <= trunc(AMS_MODL_DATA_TALISMAN.PACK_DATE, 'MM') then
            /* Xoa du lieu tam tinh trong bang pak_data_taltrans*/
            AMS_CORE_TABLE.truncate('pak_data_taltrans');

            /* Cac giao dich truoc ngay cap nhat 09-jul-2011*/
            insert /*+ APPEND */ into pak_data_taltrans nologging(
                outlet_talisman_id,
                record_date,
                version_date,
                transaction_event_id,
                transaction_code,
                transaction_premium,
                processed_date,
                account_id,
                account_number,
                create_user,
                update_user,
                create_datetime,
                update_datetime
            )
            select /*+ CARDINALITY(outl, 100) CARDINALITY(tran, 100) */
                outl.outlet_talisman_id,
                trunc(valRecordDate, 'MM'),
                trunc(sysdate, 'DD'),
                tran.transaction_event_id,
                tran.transaction_type_code,
                tran.transaction_premium,
                cast(tran.processed_date as date),
                tran.account_id,
                tran.account_number,
                AMS_CORE_SYSTEM.SYSTEM_USER,
                AMS_CORE_SYSTEM.SYSTEM_USER,
                sysdate,
                sysdate
            from
            (
                select o.outlet_number outlet_talisman_id,
                    o.outlet_client_id
                from ods.outlet  o
            ) outl
            join
            (
                select /*+ CARDINALITY(pda, 100) CARDINALITY(fyp, 100) */
                    pda.outlet_client_id,
                    pda.transaction_event_id,
                    pda.account_id,
                    pda.account_number,
                    pda.processed_date,
                    fyp.transaction_type_code,
                    sum(fyp.transaction_premium) transaction_premium
                from
                (
                    select tmp.outlet_client_id,
                        tmp.transaction_event_id,
                        tmp.account_id,
                        tmp.account_number,
                        max(trunc(nvl(tmp.bus_process_date, tmp.date_created), 'DD')) processed_date
                    from ods.commission_payment_history  tmp
                    where trunc(nvl(tmp.bus_process_date, tmp.date_created), 'DD')
                            between AMS_CORE_SYSTEM.TALISMAN_GOLIVE
                            and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                        and tmp.expense_type_code = 'COMM'
                    group by tmp.outlet_client_id,
                        tmp.transaction_event_id,
                        tmp.account_id,
                        tmp.account_number
                ) pda
                join
                (
                    select tmp.transaction_event_id,
                        tmp.transaction_type_code,
                        sum(nvl(tmp.gross_amount, 0) * tmp.balance_effect_indicator) transaction_premium
                    from ods.account_transaction  tmp
                    where trunc(tmp.processed_date, 'DD')
                            between AMS_CORE_SYSTEM.TALISMAN_GOLIVE
                            and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                        and tmp.transaction_type_code in (
                            'PFSI',
                            'LS'
                        )
                    group by tmp.transaction_event_id,
                        tmp.transaction_type_code
                ) fyp
                    on fyp.transaction_event_id = pda.transaction_event_id
                group by pda.outlet_client_id,
                    pda.transaction_event_id,
                    pda.account_id,
                    pda.account_number,
                    pda.processed_date,
                    fyp.transaction_type_code
            ) tran
                on tran.outlet_client_id = outl.outlet_client_id;
            commit;

            insert /*+ APPEND */ into pak_data_taltrans nologging(
                outlet_talisman_id,
                record_date,
                version_date,
                transaction_event_id,
                transaction_code,
                transaction_premium,
                processed_date,
                account_id,
                account_number,
                create_user,
                update_user,
                create_datetime,
                update_datetime
            )
            select /*+ CARDINALITY(outl, 100) CARDINALITY(tran, 100) */
                outl.outlet_talisman_id,
                trunc(valRecordDate, 'MM'),
                trunc(sysdate, 'DD'),
                tran.transaction_event_id,
                tran.transaction_type_code,
                tran.transaction_premium,
                cast(tran.processed_date as date),
                tran.account_id,
                tran.account_number,
                AMS_CORE_SYSTEM.SYSTEM_USER,
                AMS_CORE_SYSTEM.SYSTEM_USER,
                sysdate,
                sysdate
            from
            (
                select o.outlet_number outlet_talisman_id,
                    o.outlet_client_id
                from ods.outlet  o
            ) outl
            join
            (
                select /*+ CARDINALITY(pda, 100) CARDINALITY(fyp, 100) */
                    pda.outlet_client_id,
                    pda.transaction_event_id,
                    pda.account_id,
                    pda.account_number,
                    pda.processed_date,
                    fyp.transaction_type_code,
                    sum(fyp.transaction_premium) transaction_premium
                from
                (
                    select /*+ CARDINALITY(tmp, 100) */
                        tmp.outlet_client_id,
                        tmp.transaction_event_id,
                        tmp.account_id,
                        tmp.account_number,
                        max(trunc(nvl(tmp.bus_process_date, tmp.date_created), 'DD')) processed_date
                    from ods.commission_payment_history  tmp
                    where trunc(nvl(tmp.bus_process_date, tmp.date_created), 'DD')
                            between AMS_CORE_SYSTEM.TALISMAN_GOLIVE
                            and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                        and tmp.expense_type_code = 'RCOM'
                    group by tmp.outlet_client_id,
                        tmp.transaction_event_id,
                        tmp.account_id,
                        tmp.account_number
                ) pda
                join
                (
                    select /*+ CARDINALITY(tmp, 100) */
                        tmp.transaction_event_id,
                        tmp.transaction_type_code,
                        sum(nvl(tmp.gross_amount, 0) * tmp.balance_effect_indicator) transaction_premium
                    from ods.account_transaction  tmp
                    where trunc(tmp.processed_date, 'DD')
                            between AMS_CORE_SYSTEM.TALISMAN_GOLIVE
                            and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                        and tmp.transaction_type_code in (
                            'RIPS',
                            'RLS'
                        )
                    group by tmp.transaction_event_id,
                        tmp.transaction_type_code
                ) fyp
                    on fyp.transaction_event_id = pda.transaction_event_id
                group by pda.outlet_client_id,
                    pda.transaction_event_id,
                    pda.account_id,
                    pda.account_number,
                    pda.processed_date,
                    fyp.transaction_type_code
            ) tran
                on tran.outlet_client_id = outl.outlet_client_id;
            commit;

            /* Cap nhat ngay phat hanh hop dong trong bang pak_data_taltrans */
            merge /*+ CARDINALITY(tran, 100) */
                into pak_data_taltrans tran
            using
                (
                    select /*+ CARDINALITY(pol, 100) CARDINALITY(inf, 100) */
                        pol.account_id,
                        cast(inf.issue_date as date) issue_date
                    from
                    (
                        select /*+ CARDINALITY(tmp, 100) */
                            tmp.activity_id,
                            tmp.account_id
                        from ods.activity  tmp
                        where trunc(tmp.bus_processed_date, 'DD') <= (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                            and tmp.activity_code = 'A100'
                        minus
                        select /*+ CARDINALITY(tmp, 100) */
                            tmp.reversed_acti_id activity_id,
                            tmp.account_id
                        from ods.activity  tmp
                        where trunc(tmp.bus_processed_date, 'DD') <= (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                            and tmp.activity_code = 'R100'
                    ) pol
                    join
                    (
                        select /*+ CARDINALITY(tmp, 100) */
                            tmp.activity_id,
                            tmp.account_id,
                            trunc(tmp.bus_processed_date, 'DD') issue_date
                        from ods.activity  tmp
                        where trunc(tmp.bus_processed_date, 'DD') <= (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                            and tmp.activity_code = 'A100'
                    ) inf
                        on inf.activity_id = pol.activity_id
                ) upd
            on (
                upd.account_id = tran.account_id
                )
            when matched then
                update
                set tran.issue_date = upd.issue_date,
                    tran.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                    tran.update_datetime = sysdate;
            commit;

            /* Cap nhat huy hop dong [trong thoi gian cho phep] trong bang pak_data_taltrans */
            merge /*+ CARDINALITY(tran, 100) */
                into pak_data_taltrans tran
            using
                (
                    select /*+ CARDINALITY(pol, 100) CARDINALITY(inf, 100) */
                        pol.account_id,
                        cast(inf.cancel_date as date) cancel_date
                    from
                    (
                        select /*+ CARDINALITY(tmp, 100) */
                            tmp.activity_id,
                            tmp.account_id
                        from ods.activity  tmp
                        where trunc(tmp.bus_processed_date, 'DD') <= (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                            and tmp.activity_code = 'P107'
                        minus
                        select /*+ CARDINALITY(tmp, 100) */
                            tmp.reversed_acti_id activity_id,
                            tmp.account_id
                        from ods.activity  tmp
                        where trunc(tmp.bus_processed_date, 'DD') <= (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                            and tmp.activity_code = 'R107'
                    ) pol
                    join
                    (
                        select /*+ CARDINALITY(tmp, 100) */
                            tmp.activity_id,
                            tmp.account_id,
                            trunc(tmp.bus_processed_date, 'DD') cancel_date
                        from ods.activity  tmp
                        where trunc(tmp.bus_processed_date, 'DD') <= (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                            and tmp.activity_code = 'P107'
                    ) inf
                        on inf.activity_id = pol.activity_id
                ) upd
            on (
                upd.account_id = tran.account_id
                )
            when matched then
                update
                set tran.cancel_date = upd.cancel_date,
                    tran.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                    tran.update_datetime = sysdate;
            commit;

            /* Tinh FYP cua cac hoa don dinh ky truoc ngay cap nhat 09-jul-2011*/
            insert /*+ APPEND */ into mod_data_fyp nologging(
                outlet_ams_id,
                outlet_talisman_id,
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
                tran.outlet_talisman_id,
                tran.outlet_talisman_id,
                trunc(valRecordDate, 'MM'),
                trunc(sysdate, 'DD'),
                AMS_CORE_SYSTEM.SYSTEM_REFER_TALISMAN,
                valTypeOfData,
                AMS_CORE_CODE.OBJECT_STATUS_ACTIVE,
                decode(tran.transaction_code,
                    'PFSI', AMS_MODL_DATA_TALISMAN.TRANS_CODE_FREQ,
                    'RIPS', AMS_MODL_DATA_TALISMAN.TRANS_CODE_FREQ,
                    'LS', AMS_MODL_DATA_TALISMAN.TRANS_CODE_LUMS,
                    'RLS', AMS_MODL_DATA_TALISMAN.TRANS_CODE_LUMS
                ),
                tran.account_number,
                tran.processed_date,
                tran.transaction_premium *
                    decode(tran.transaction_code,
                        'PFSI', 1,
                        'RIPS', 1,
                        'LS',   0.1,
                        'RLS',  0.1
                    ),
                tran.transaction_event_id,
                AMS_CORE_SYSTEM.SYSTEM_USER,
                AMS_CORE_SYSTEM.SYSTEM_USER,
                sysdate,
                sysdate
            from pak_data_taltrans tran
            where tran.record_date = trunc(valRecordDate, 'MM')
                and tran.processed_date
                    between trunc(valRecordDate, 'MM')
                    and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                and tran.issue_date is not null
                and tran.processed_date < add_months(tran.issue_date, 12);
            commit;

            /* Tinh FYP cua hop dong huy trong thoi
            gian cho phep co hoa don dinh ky nop truoc ngay cap nhat 09-jul-2011*/
            insert /*+ APPEND */ into mod_data_fyp nologging(
                outlet_ams_id,
                outlet_talisman_id,
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
                tran.outlet_talisman_id,
                tran.outlet_talisman_id,
                trunc(valRecordDate, 'MM'),
                trunc(sysdate, 'DD'),
                AMS_CORE_SYSTEM.SYSTEM_REFER_TALISMAN,
                valTypeOfData,
                AMS_CORE_CODE.OBJECT_STATUS_ACTIVE,
                decode(tran.transaction_code,
                    'PFSI', AMS_MODL_DATA_TALISMAN.TRANS_CODE_FREQ,
                    'RIPS', AMS_MODL_DATA_TALISMAN.TRANS_CODE_FREQ,
                    'LS', AMS_MODL_DATA_TALISMAN.TRANS_CODE_LUMS,
                    'RLS', AMS_MODL_DATA_TALISMAN.TRANS_CODE_LUMS
                ),
                tran.account_number,
                tran.processed_date,
                tran.transaction_premium * (-1) *
                    decode(tran.transaction_code,
                        'PFSI', 1,
                        'RIPS', 1,
                        'LS',   0.1,
                        'RLS',  0.1
                    ),
                tran.transaction_event_id,
                AMS_CORE_SYSTEM.SYSTEM_USER,
                AMS_CORE_SYSTEM.SYSTEM_USER,
                sysdate,
                sysdate
            from pak_data_taltrans tran
            where tran.record_date = trunc(valRecordDate, 'MM')
                and tran.cancel_date
                    between trunc(valRecordDate, 'MM')
                    and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                and tran.issue_date is not null;
            commit;

        end if;
    end;

    /*
    Nguoi tao:
    Ngay tao:
    Version: 1.1
    Noi dung: Cap nhat thong tin hop dong tu Talisman
    Thay doi
         Thay doi: Le Khac Chinh
         Ngay thay doi: 12/9/2013
         Version: 1.1
         Noi dung: Fix loi hop dong sau khi khoi phuc theo ID #107735
    */
    procedure get_policy(valRecordDate date := null,
        valTypeOfData varchar2 := null)
    is
    begin
        /* Xoa du lieu hop dong trong bang mod_data_policy*/
        loop
            delete mod_data_policy del
            where del.record_date = trunc(valRecordDate, 'MM')
                and del.type_of_data = valTypeOfData
                and del.source_of_data = AMS_CORE_SYSTEM.SYSTEM_REFER_TALISMAN
                and rownum < AMS_CORE_SYSTEM.RECORD_MAX_DELETE;
            exit when SQL%rowcount < AMS_CORE_SYSTEM.RECORD_MAX_DELETE - 1;
            commit;
        end loop;
        commit;

        /* Cac hop dong phat hanh tren Talisman tu ngay 28-feb-2011*/
        insert /*+ APPEND */ into mod_data_policy nologging(
            serv_ams_id,
            serv_talisman_id,
            init_ams_id,
            init_talisman_id,
            record_date,
            version_date,
            source_of_data,
            type_of_data,
            status_code,
            policy_number,
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
        select /*+ CARDINALITY(pol, 100)
               CARDINALITY(acc, 100)
               CARDINALITY(outl, 100) */
            null,
            null,
            outl.outlet_number,
            outl.outlet_number,
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            AMS_CORE_SYSTEM.SYSTEM_REFER_TALISMAN,
            valTypeOfData,
            AMS_CORE_CODE.OBJECT_STATUS_ACTIVE,
            acc.account_number,
            AMS_MODL_DATA_TALISMAN.POLYC_CODE_PROC,
            cast(pol.changes_date as date),
            cast(pol.freq_date as date),
            pol.freq_per_annum,
            pol.freq_premium,
            null,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            select /*+ CARDINALITY(pol, 100) CARDINALITY(inf, 100) */
                inf.outlet_client_id,
                inf.account_id,
                inf.changes_date,
                inf.freq_date,
                inf.freq_per_annum,
                inf.freq_premium
            from
            (
                select /*+ CARDINALITY(tmp, 100) */
                    tmp.activity_id
                from ods.activity  tmp
                where trunc(tmp.bus_processed_date, 'DD')
                        between add_months(trunc(valRecordDate, 'MM'), -35)
                        and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                    and trunc(tmp.bus_processed_date, 'DD') >= AMS_CORE_SYSTEM.TALISMAN_GOLIVE
                    and tmp.activity_code = 'A100'
                    and tmp.payment_frequency_code <> 'SING'
                minus
                select /*+ CARDINALITY(tmp, 100) */
                    tmp.reversed_acti_id activity_id
                from ods.activity  tmp
                where trunc(tmp.bus_processed_date, 'DD')
                        between add_months(trunc(valRecordDate, 'MM'), -35)
                        and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                    and trunc(tmp.bus_processed_date, 'DD') >= AMS_CORE_SYSTEM.TALISMAN_GOLIVE
                    and tmp.activity_code = 'R100'
            ) pol
            join
            (
                select /*+ CARDINALITY(tmp, 100) */
                    tmp.activity_id,
                    tmp.outlet_client_id,
                    tmp.account_id,
                    trunc(tmp.bus_processed_date, 'DD') changes_date,
                    trunc(tmp.effective_date, 'DD') freq_date,
                    tmp.freq_per_annum freq_per_annum,
                    tmp.regular_premium freq_premium
                from ods.activity  tmp
                where trunc(tmp.bus_processed_date, 'DD')
                        between add_months(trunc(valRecordDate, 'MM'), -35)
                        and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                    and trunc(tmp.bus_processed_date, 'DD') >= AMS_CORE_SYSTEM.TALISMAN_GOLIVE
                    and tmp.activity_code = 'A100'
                    and tmp.payment_frequency_code <> 'SING'
            ) inf
                on inf.activity_id = pol.activity_id
        ) pol
        left join
        (
            select  /*+ CARDINALITY(tmp, 100) */
                tmp.account_id,
                tmp.account_number
            from ods.account  tmp
        ) acc
            on acc.account_id = pol.account_id
        left join
        (
            select  /*+ CARDINALITY(tmp, 100) */
                tmp.outlet_client_id,
                tmp.outlet_number
            from ods.outlet  tmp
        ) outl
            on outl.outlet_client_id = pol.outlet_client_id;
        commit;

        insert /*+ APPEND */ into mod_data_policy nologging(
            serv_ams_id,
            serv_talisman_id,
            init_ams_id,
            init_talisman_id,
            record_date,
            version_date,
            source_of_data,
            type_of_data,
            status_code,
            policy_number,
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
        select /*+ CARDINALITY(pol, 100)
               CARDINALITY(acc, 100)
               CARDINALITY(outl, 100) */
            null,
            null,
            outl.outlet_number,
            outl.outlet_number,
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            AMS_CORE_SYSTEM.SYSTEM_REFER_TALISMAN,
            valTypeOfData,
            AMS_CORE_CODE.OBJECT_STATUS_ACTIVE,
            acc.account_number,
            AMS_MODL_DATA_TALISMAN.POLYC_CODE_PROC,
            cast(pol.changes_date as date),
            cast(pol.freq_date as date),
            pol.freq_per_annum,
            pol.freq_premium,
            null,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            select /*+ CARDINALITY(pol, 100) CARDINALITY(inf, 100) */
                inf.outlet_client_id,
                inf.account_id,
                inf.changes_date,
                inf.freq_date,
                inf.freq_per_annum,
                inf.freq_premium
            from
            (
                select /*+ CARDINALITY(tmp, 100) */
                    tmp.activity_id
                from ods.activity  tmp
                where trunc(tmp.bus_processed_date, 'DD')
                        between add_months(trunc(valRecordDate, 'MM'), -35)
                        and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                    and trunc(tmp.bus_processed_date, 'DD') >= AMS_CORE_SYSTEM.TALISMAN_GOLIVE
                    and tmp.activity_code = 'A100'
                    and tmp.payment_frequency_code = 'SING'
                minus
                select /*+ CARDINALITY(tmp, 100) */
                    tmp.reversed_acti_id activity_id
                from ods.activity  tmp
                where trunc(tmp.bus_processed_date, 'DD')
                        between add_months(trunc(valRecordDate, 'MM'), -35)
                        and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                    and trunc(tmp.bus_processed_date, 'DD') >= AMS_CORE_SYSTEM.TALISMAN_GOLIVE
                    and tmp.activity_code = 'R100'
            ) pol
            join
            (
                select /*+ CARDINALITY(tmp, 100) */
                    tmp.activity_id,
                    tmp.outlet_client_id,
                    tmp.account_id,
                    trunc(tmp.bus_processed_date, 'DD') changes_date,
                    trunc(tmp.effective_date, 'DD') freq_date,
                    0.1 freq_per_annum,
                    0.1 * tmp.instalment_premium freq_premium
                from ods.activity  tmp
                where trunc(tmp.bus_processed_date, 'DD')
                        between add_months(trunc(valRecordDate, 'MM'), -35)
                        and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                    and trunc(tmp.bus_processed_date, 'DD') >= AMS_CORE_SYSTEM.TALISMAN_GOLIVE
                    and tmp.activity_code = 'A100'
                    and tmp.payment_frequency_code = 'SING'
            ) inf
                on inf.activity_id = pol.activity_id
        ) pol
        left join
        (
            select  /*+ CARDINALITY(tmp, 100) */
                tmp.account_id,
                tmp.account_number
            from ods.account  tmp
        ) acc
            on acc.account_id = pol.account_id
        left join
        (
            select  /*+ CARDINALITY(tmp, 100) */
                tmp.outlet_client_id,
                tmp.outlet_number
            from ods.outlet  tmp
        ) outl
            on outl.outlet_client_id = pol.outlet_client_id;
        commit;

        insert /*+ APPEND */ into mod_data_policy nologging(
            serv_ams_id,
            serv_talisman_id,
            init_ams_id,
            init_talisman_id,
            record_date,
            version_date,
            source_of_data,
            type_of_data,
            status_code,
            policy_number,
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
        select /*+ CARDINALITY(pol, 100)
               CARDINALITY(acc, 100)
                   CARDINALITY(outl, 100) */
            null,
            null,
            outl.outlet_number,
            outl.outlet_number,
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            AMS_CORE_SYSTEM.SYSTEM_REFER_TALISMAN,
            valTypeOfData,
            AMS_CORE_CODE.OBJECT_STATUS_ACTIVE,
            acc.account_number,
            AMS_MODL_DATA_TALISMAN.POLYC_CODE_CANC,
            cast(pol.changes_date as date),
            null,
            null,
            null,
            null,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            select /*+ CARDINALITY(pol, 100)
                       CARDINALITY(inf, 100) */
                inf.outlet_client_id,
                inf.account_id,
                inf.changes_date
            from
            (
                select /*+ CARDINALITY(tmp, 100) */
                    tmp.activity_id
                from ods.activity  tmp
                where trunc(tmp.bus_processed_date, 'DD')
                        between add_months(trunc(valRecordDate, 'MM'), -35)
                        and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                    and trunc(tmp.bus_processed_date, 'DD') >= AMS_CORE_SYSTEM.TALISMAN_GOLIVE
                    and tmp.activity_code = 'P107'
                minus
                select /*+ CARDINALITY(tmp, 100) */
                    tmp.reversed_acti_id activity_id
                from ods.activity  tmp
                where trunc(tmp.bus_processed_date, 'DD')
                        between add_months(trunc(valRecordDate, 'MM'), -35)
                        and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                    and trunc(tmp.bus_processed_date, 'DD') >= AMS_CORE_SYSTEM.TALISMAN_GOLIVE
                    and tmp.activity_code = 'R107'
            ) pol
            join
            (
                select /*+ CARDINALITY(tmp, 100) */
                    tmp.activity_id,
                    tmp.outlet_client_id,
                    tmp.account_id,
                    trunc(tmp.bus_processed_date, 'DD') changes_date
                from ods.activity  tmp
                where trunc(tmp.bus_processed_date, 'DD')
                        between add_months(trunc(valRecordDate, 'MM'), -35)
                        and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                    and trunc(tmp.bus_processed_date, 'DD') >= AMS_CORE_SYSTEM.TALISMAN_GOLIVE
                    and tmp.activity_code = 'P107'
            ) inf
                on inf.activity_id = pol.activity_id
        ) pol
        left join ods.account  acc
            on acc.account_id = pol.account_id
        left join ods.outlet  outl
            on outl.outlet_client_id = pol.outlet_client_id;
        commit;

        insert /*+ APPEND */ into mod_data_policy nologging(
            serv_ams_id,
            serv_talisman_id,
            init_ams_id,
            init_talisman_id,
            record_date,
            version_date,
            source_of_data,
            type_of_data,
            status_code,
            policy_number,
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
        select /*+ CARDINALITY(pol, 100)
                   CARDINALITY(acc, 100)
                   CARDINALITY(outl, 100) */
            null,
            null,
            outl.outlet_number,
            outl.outlet_number,
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            AMS_CORE_SYSTEM.SYSTEM_REFER_TALISMAN,
            valTypeOfData,
            AMS_CORE_CODE.OBJECT_STATUS_ACTIVE,
            acc.account_number,
            AMS_MODL_DATA_TALISMAN.POLYC_CODE_REIS,
            cast(pol.changes_date as date),
            null,
            null,
            null,
            null,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            select /*+ CARDINALITY(pol, 100)
                       CARDINALITY(inf, 100) */
                inf.outlet_client_id,
                inf.account_id,
                inf.changes_date
            from
            (
                select /*+ CARDINALITY(tmp, 100) */
                    tmp.activity_id
                from ods.activity  tmp
                where trunc(tmp.bus_processed_date, 'DD')
                        between add_months(trunc(valRecordDate, 'MM'), -35)
                        and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                    and trunc(tmp.bus_processed_date, 'DD') >= AMS_CORE_SYSTEM.TALISMAN_GOLIVE
                    and tmp.activity_code in (
                        'IS03', -- Tu dong khoi phuc hop dong
                        'IS02' -- Khoi phuc theo yeu cau khach cua khach hang
                    )
                minus
                select /*+ CARDINALITY(tmp, 100) */
                    tmp.reversed_acti_id activity_id
                from ods.activity  tmp
                where trunc(tmp.bus_processed_date, 'DD')
                        between add_months(trunc(valRecordDate, 'MM'), -35)
                        and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                    and trunc(tmp.bus_processed_date, 'DD') >= AMS_CORE_SYSTEM.TALISMAN_GOLIVE
                    and tmp.activity_code in (
                        'RS03', -- Undo Tu dong khoi phuc hop dong
                        'RS02' -- Undo Khoi phuc theo yeu cau khach cua khach hang
                    )
            ) pol
            join
            (
                select /*+ CARDINALITY(tmp, 100) */
                    tmp.activity_id,
                    tmp.outlet_client_id,
                    tmp.account_id,
                    trunc(tmp.bus_processed_date, 'DD') changes_date
                from ods.activity  tmp
                where trunc(tmp.bus_processed_date, 'DD')
                        between add_months(trunc(valRecordDate, 'MM'), -35)
                        and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                    and trunc(tmp.bus_processed_date, 'DD') >= AMS_CORE_SYSTEM.TALISMAN_GOLIVE
                    and tmp.activity_code in (
                        'IS03',
                        'IS02'
                    )
            ) inf
                on inf.activity_id = pol.activity_id
        ) pol
        left join ods.account  acc
            on acc.account_id = pol.account_id
        left join ods.outlet  outl
            on outl.outlet_client_id = pol.outlet_client_id;
        commit;

        insert /*+ APPEND */ into mod_data_policy nologging(
            serv_ams_id,
            serv_talisman_id,
            init_ams_id,
            init_talisman_id,
            record_date,
            version_date,
            source_of_data,
            type_of_data,
            status_code,
            policy_number,
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
        select /*+ CARDINALITY(pol, 100)
                   CARDINALITY(acc, 100)
                   CARDINALITY(outl, 100) */
            null,
            null,
            outl.outlet_number,
            outl.outlet_number,
            trunc(valRecordDate, 'MM'),
            trunc(sysdate, 'DD'),
            AMS_CORE_SYSTEM.SYSTEM_REFER_TALISMAN,
            valTypeOfData,
            AMS_CORE_CODE.OBJECT_STATUS_ACTIVE,
            acc.account_number,
            AMS_MODL_DATA_TALISMAN.POLYC_CODE_TERM,
            cast(pol.changes_date as date),
            null,
            null,
            null,
            null,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            AMS_CORE_SYSTEM.SYSTEM_USER,
            sysdate,
            sysdate
        from
        (
            select /*+ CARDINALITY(pol, 100)
                       CARDINALITY(inf, 100) */
                inf.outlet_client_id,
                inf.account_id,
                inf.changes_date
            from
            (
                select /*+ CARDINALITY(tmp, 100) */
                    tmp.activity_id
                from ods.activity  tmp
                where trunc(tmp.bus_processed_date, 'DD')
                        between add_months(trunc(valRecordDate, 'MM'), -35)
                        and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                    and trunc(tmp.bus_processed_date, 'DD') >= AMS_CORE_SYSTEM.TALISMAN_GOLIVE
                    and tmp.activity_code in (
                        'CPOL', -- Huy bo hop dong bao hiem
                        'P108', -- Huy bo hop dong do no phi
                        'P112' -- Huy bo hop dong do no phi [tu dong]
                    )
                minus
                select /*+ CARDINALITY(tmp, 100) */
                    tmp.reversed_acti_id activity_id
                from ods.activity  tmp
                where trunc(tmp.bus_processed_date, 'DD')
                        between add_months(trunc(valRecordDate, 'MM'), -35)
                        and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                    and trunc(tmp.bus_processed_date, 'DD') >= AMS_CORE_SYSTEM.TALISMAN_GOLIVE
                    and tmp.activity_code in (
                        'RCAN', -- Undo Huy bo hop dong bao hiem
                        'R108', -- Undo Huy bo hop dong do no phi
                        'R112' -- Undo Huy bo hop dong do no phi [tu dong]
                    )
            ) pol
            join
            (
                select /*+ CARDINALITY(tmp, 100) */
                    tmp.activity_id,
                    tmp.outlet_client_id,
                    tmp.account_id,
                    trunc(tmp.bus_processed_date, 'DD') changes_date
                from ods.activity  tmp
                where trunc(tmp.bus_processed_date, 'DD')
                        between add_months(trunc(valRecordDate, 'MM'), -35)
                        and (add_months(trunc(valRecordDate, 'MM'), 1) - 1)
                    and trunc(tmp.bus_processed_date, 'DD') >= AMS_CORE_SYSTEM.TALISMAN_GOLIVE
                    and tmp.activity_code in (
                        'CPOL',
                        'P108',
                        'P112'
                    )
            ) inf
                on inf.activity_id = pol.activity_id
        ) pol
        left join ods.account  acc
            on acc.account_id = pol.account_id
        left join ods.outlet  outl
            on outl.outlet_client_id = pol.outlet_client_id;
        commit;

        /* Cap nhat trang thai hop dong khi xu ly khoi phuc hop dong*/
            update mod_data_policy pol
            set
            pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_INACTIVE
            where pol.record_date = trunc(valRecordDate, 'MM')
                and pol.type_of_data = valTypeOfData
                and pol.source_of_data = AMS_CORE_SYSTEM.SYSTEM_REFER_TALISMAN
                and pol.changes_code = AMS_MODL_DATA_TALISMAN.POLYC_CODE_TERM
                and pol.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                and exists (
                select /*+ CARDINALITY(pol, 1) */
                    *
                    from mod_data_policy tmp
                    where tmp.record_date = trunc(valRecordDate, 'MM')
                        and tmp.policy_number = pol.policy_number
                        and pol.changes_date <= tmp.changes_date
                        and tmp.type_of_data = valTypeOfData
                        and tmp.source_of_data = AMS_CORE_SYSTEM.SYSTEM_REFER_TALISMAN
                        and tmp.changes_code = AMS_MODL_DATA_TALISMAN.POLYC_CODE_REIS
                        and tmp.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
                );
            commit;
    end;

end AMS_MODL_DATA_TALISMAN;
/
