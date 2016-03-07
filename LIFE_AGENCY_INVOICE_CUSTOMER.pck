create or replace package ams.LIFE_AGENCY_INVOICE_CUSTOMER is

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

    procedure get_customer(valRecordDate date := null,
        valReRun number := null);

    procedure tal_get_customer(
        valSessionId number := null);

    procedure bvl_get_customer_gui(valRecordDate date := null,
        valReRun number := null,
        row_records out sys_refcursor);

    function tcvn2utf8_new(p_tcvn char) return  nvarchar2;

end LIFE_AGENCY_INVOICE_CUSTOMER;
/
create or replace package body ams.LIFE_AGENCY_INVOICE_CUSTOMER is

    procedure get_customer(valRecordDate date := null,
        valReRun number := null)
    is
        row_records sys_refcursor;
    begin
        ams.LIFE_AGENCY_INVOICE_CUSTOMER.bvl_get_customer_gui(valRecordDate, valReRun, row_records);
    end;
    /*
        Creater: Le Khac Chinh
        Date Create: 1/10/2012
        Version: 1.0
        Description: Thu tuc  do du lieu khach hang vao 1 bang tu TAL
        Parameter:
            valSessionId [number]: Session ID
        Update:  Le Khac Chinh
            Version: 1.1
            Date Updated: 18/9/2013
            Note:  Fix theo ID: 113056 lay so dien thoai khach hang vao
    */
    procedure tal_get_customer(
        valSessionId number := null)
    is
        var_error_pos  number(8, 2) := null;

        var_version_date date := trunc(sysdate, 'DD');
        var_run_begin_time date := sysdate;
        var_run_end_time date := sysdate;
        var_session_id number(14) := 0;
    begin
        var_session_id := valSessionId;
        /* Xoa du lieu hoa don
        trong 1 thang di da*/
        var_run_begin_time := sysdate;
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 0;

        execute immediate 'truncate table ams.la_inv_tal_customer';
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'tal_get_customer', 'truncate  vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 1;

        insert /*+ APPEND */ into ams.la_inv_tal_customer nologging
        (
            session_id,
            version_date,
            company_id,
            company_ams_id,
            source_of_data,
            account_id,
            account_number,
            holder_name,
            holder_address,
            insured_name,
            phone,
            create_user,
            update_user,
            create_datetime,
            update_datetime
        )
        select /*+ CARDINALITY(tmp, 100)*/
            var_session_id,
            var_version_date,
            null,
            null,
            LIFE_AGENCY_INVOICE_CUSTOMER.SYSTEM_REFER_TALISMAN,
            tmp.account_id,
            tmp.account_number,
            null,  --holder_name
            null,   --holder_address
            null,  --insured_name
            null,  --phone
            LIFE_AGENCY_INVOICE_CUSTOMER.SYSTEM_USER,
            LIFE_AGENCY_INVOICE_CUSTOMER.SYSTEM_USER,
            sysdate,
            sysdate
        from ods.account  tmp;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'tal_get_customer', 'truncate  vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 2;

        /*lay ra ten nguoi tham gia*/
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_inv_tal_customer o
        using
            (
                select  /*+
                                  CARDINALITY(car_nguoithamgia, 100)
                                 CARDINALITY(cln_nguoithamgia, 100)*/
                    car_nguoithamgia.account_id,
                    max(cln_nguoithamgia.name) holder_name,
                    max(cln_nguoithamgia.phone) phone
                from
                (
                    select  /*+ CARDINALITY(tmp, 100)*/
                        tmp.account_id,
                        tmp.client_id
                    from ods.client_account_relationship tmp
                    where tmp.relationship_type_code = 'OWNR'
                        and tmp.primary_relationship_flag = 'Y'
                ) car_nguoithamgia
                left join
                (
                    select /*+ CARDINALITY(clt, 100)*/
                        clt.name,
                        clt.client_id,
                        trim(clt.mobile_phone_number ||clt.home_phone_number ||clt.business_phone_number) phone
                    from
                    (
                        select /*+ CARDINALITY(tmp, 100)*/
                            tmp.name,
                            tmp.client_id,
                            case when concat(tmp.mobile_phone_number, 'N/A') <> 'N/A' then
                               to_char(tmp.mobile_phone_number) || ' ; '   end mobile_phone_number,
                            case when concat(tmp.home_phone_number, 'N/A') <> 'N/A' then
                               to_char(tmp.home_phone_number) || ' ; '   end home_phone_number,
                            case when concat(tmp.business_phone_number, 'N/A') <> 'N/A' then
                               to_char(tmp.business_phone_number)  end business_phone_number
                        from ods.client tmp
                    ) clt
                ) cln_nguoithamgia
                  on cln_nguoithamgia.client_id = car_nguoithamgia.client_id
               group by car_nguoithamgia.account_id
            ) upd
        on (
            var_session_id =  o.session_id
            and
            ams.LIFE_AGENCY_INVOICE_CUSTOMER.SYSTEM_REFER_TALISMAN = o.source_of_data
            and
            upd.account_id = o.account_id
        )
        when matched then
            update
                set
                    o.holder_name = upd.holder_name,
                    o.phone = upd.phone,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'tal_get_customer', 'lay ra ten nguoi tham gia  vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 3;

        /*lay ra ten nguoi duoc bao hiem*/
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_inv_tal_customer o
        using
            (
                select  /*+
                     CARDINALITY(car_nguoiduocbaohiem, 100)
                     CARDINALITY(cln_nguoiduocbaohiem, 100)*/
                    car_nguoiduocbaohiem.account_id,
                    max(cln_nguoiduocbaohiem.name) insured_name
                from
                (
                    select  /*+ CARDINALITY(tmp, 100)*/
                        tmp.account_id,
                        tmp.client_id
                    from ods.client_account_relationship tmp
                    where tmp.relationship_type_code = 'LIFE'
                        and tmp.primary_relationship_flag = 'Y'
                ) car_nguoiduocbaohiem
                left join
                (
                    select /*+ CARDINALITY(tmp, 100)*/
                        tmp.name,
                        tmp.client_id
                    from ods.client tmp
                ) cln_nguoiduocbaohiem
                  on cln_nguoiduocbaohiem.client_id = car_nguoiduocbaohiem.client_id
                group by car_nguoiduocbaohiem.account_id
            ) upd
        on (
            var_session_id =  o.session_id
            and
            ams.LIFE_AGENCY_INVOICE_CUSTOMER.SYSTEM_REFER_TALISMAN = o.source_of_data
            and
            upd.account_id = o.account_id
        )
        when matched then
            update
                set
                    o.insured_name = upd.insured_name,
                    o.update_datetime = sysdate;
        commit;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'tal_get_customer', 'ten nguoi duoc bao hiem  vi tri : ' || to_char(var_error_pos));
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;
        var_error_pos := 4;

        /*lay ra dia chi*/
        merge  /*+ CARDINALITY(o, 100)
                  CARDINALITY(upd, 100)
                  LEADING(o upd) */
            into ams.la_inv_tal_customer o
        using
            (
                select  /*+ CARDINALITY(res, 100) */
                    res.account_id,
                    max(res.address_line_1   || ' ' || res.suburb  || ' ' || res.city  || ' ' || res.state_description) holder_address
                from
                (
                    select  /*+
                          CARDINALITY(car_nguoithamgia, 100)
                         CARDINALITY(addr, 100)*/
                        car_nguoithamgia.account_id,
                        addr.address_line_1,
                        addr.suburb,
                        addr.city,
                        addr.state_description
                    from
                    (
                        select  /*+ CARDINALITY(tmp, 100)*/
                            tmp.account_id,
                            tmp.client_id
                        from ods.client_account_relationship tmp
                        where tmp.relationship_type_code = 'OWNR'
                            and tmp.primary_relationship_flag = 'Y'
                    ) car_nguoithamgia
                    left join
                    (
                        select /*+ CARDINALITY(tmp, 100)*/
                            tmp.client_id,
                            tmp.address_line_1,
                            tmp.suburb,
                            tmp.city,
                            tmp.state_description
                        from ods.address tmp
                        where tmp.primary_address_flag = 'Y'
                    ) addr
                       on addr.client_id = car_nguoithamgia.client_id
                ) res
                group by res.account_id
            ) upd
        on (
            var_session_id =  o.session_id
            and
            ams.LIFE_AGENCY_INVOICE_CUSTOMER.SYSTEM_REFER_TALISMAN = o.source_of_data
            and
            upd.account_id = o.account_id
        )
        when matched then
            update
                set
                    o.holder_address = upd.holder_address,
                    o.update_datetime = sysdate;
        commit;

        --dbms_stats.gather_table_stats(null, 'la_inv_tal_customer', cascade => true);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'tal_get_customer', 'dia chi vi tri : ' || to_char(var_error_pos));
        var_run_end_time := sysdate;
        ams.life_agency_log.time_log(1001, 'Thoi gian chay', var_run_begin_time, var_run_end_time);
        exception
            when others then
                rollback;
                life_agency_log.write_log(1000,
                    'tal_get_customer: loi thu tuc tal_get_customer  vi tri: ' || to_char(var_error_pos) ,
                    sqlerrm,
                    sqlcode);
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 1/10/2012
        Version: 1.0
        Description: Thu tuc  do du lieu khach hang vao 1 bang
        Parameter:
            valRecordDate [date]: Thang ghi nhan
            valReRun [number]: Ma cong ty
            row_records [sys_refcursor]: Du lieu tra ra
        Update:  Le Khac Chinh
            Version: 1.1
            Date Updated: 18/9/2013
            Note:  Fix theo ID: 113056 lay so dien thoai khach hang vao
    */
    procedure bvl_get_customer_gui(valRecordDate date := null,
        valReRun number := null,
        row_records out sys_refcursor)
    is
        var_error_pos  number(8, 2) := null;
        var_version_date date := trunc(sysdate, 'DD');

        var_query varchar(32000) := '';
        var_company_name nvarchar2(64) := null;
        var_run_begin_time date := sysdate;
        var_run_end_time date := sysdate;
        var_session_id number(14) := 0;

        var_error_message varchar2(3000) := null;
        var_rerun number(1) := 0;

        --lay du lieu thang day
        var_record_date date := trunc(valRecordDate, 'MM');
        var_from_date date := add_months(var_record_date, -1);
        var_to_date date := add_months(var_record_date, 2) - 1;
        var_str_from_date varchar2(100) := to_char(var_from_date, 'DD-MON-YYYY');
        var_str_to_date varchar2(100) := to_char(var_to_date, 'DD-MON-YYYY');
    begin
        /* Xoa du lieu hoa don
        trong 1 thang di da*/
        var_run_begin_time := sysdate;
        --chay du lieu Talisman truoc cho no da
        --cho mac dinh session id = 1

        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        ams.LIFE_AGENCY_INVOICE_CUSTOMER.tal_get_customer(1);

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE_CUSTOMER', ' chay thu tuc ams.LIFE_AGENCY_INVOICE_CUSTOMER.tal_get_customer');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        var_rerun := nvl(valReRun, 0);

        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        var_error_pos := 1;
        if var_rerun = 1 then
          --neu la chay lai thi se lay lai tat ca cac du lieu cho no phat hanh trong moi thang
/*            var_str_from_date :=  '1-jan-1980';
            var_str_to_date :=  '1-jan-2099';  */
            var_str_from_date := to_char(add_months(sysdate, -1000), 'DD-MON-YYYY');
            var_str_to_date :=  to_char(add_months(sysdate, 6), 'DD-MON-YYYY');
            execute immediate 'truncate table ams.la_inv_bvl_customer';
            commit;
        else
            --xoa du lieu cua ban can xoa truoc khi thuc hien
            --chi xoa trong 2 thang gan nhat cho no
            --va do lai 2 thang day
            loop
                delete ams.la_inv_bvl_customer del
                where del.record_date
                    between var_from_date
                        and var_to_date
                    and del.source_of_data = LIFE_AGENCY_INVOICE_CUSTOMER.SYSTEM_REFER_BVLIFE
                    and rownum < ams.LIFE_AGENCY_INVOICE_CUSTOMER.RECORD_MAX_DELETE;
                exit when SQL%rowcount < LIFE_AGENCY_INVOICE_CUSTOMER.RECORD_MAX_DELETE - 1;
                commit;
            end loop;
            commit;
        end if;

        ams.life_agency_log.time_end;
        ams.life_agency_log.write_log(1000, 'LIFE_AGENCY_INVOICE_CUSTOMER', ' xoa dl kh ');
        ams.life_agency_log.time_stop;
        ams.life_agency_log.time_begin;

        var_session_id := 1;

        for list_databse in (
            select bvl.id,
                bvl.schema,
                bvl.link,
                bvl.name
            from ams.sys_database_bvlife bvl
            where bvl.status = LIFE_AGENCY_INVOICE_CUSTOMER.SYSTEM_VALUE_YES
        )
        loop
            var_company_name := list_databse.name;
            var_error_pos := 1;
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            --xoa du lieu cua mot bang truoc da
            execute immediate 'truncate table ams.la_inv_bvl_customer_tmp';
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'bvl_get_customer_gui', ' truncate la_inv_bvl_invoice_tmp cty : '|| var_company_name || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;
            var_error_pos := 1.1;

            var_query := ' begin
            insert /*+ APPEND */ into ams.la_inv_bvl_customer_tmp nologging
            (
                session_id,
                record_date,
                version_date,
                source_of_data,
                company_bvl_id,
                account_number,
                holder_id,
                holder_name,
                holder_address,
                holder_ward_id,
                holder_ward_name,
                holder_district_id,
                holder_district_name,
                insured_id,
                insured_name,
                address,
                create_user,
                update_user,
                create_datetime,
                update_datetime,
                phone
            )
            select /*+  CARDINALITY(hd,100)
                CARDINALITY(yc,100)
                CARDINALITY(tgia,100)
                CARDINALITY(bh,100)
                CARDINALITY(phuong,100)
                CARDINALITY(huyen,100) */ '  ||
                var_session_id || ',
                trunc(hd.ngayphanh, ''MM''),
                to_date(' ||chr(39) || var_version_date || chr(39) || '),
                ams.LIFE_AGENCY_INVOICE_CUSTOMER.SYSTEM_REFER_BVLIFE,'
                || chr(39) || list_databse.id || chr(39) || ',
                yc.hd_id,
                yc.tgia_id,--
                tgia.ten,--holder_name         nvarchar2(255),
                null,--holder_address       nvarchar2(255),
                null,--holder_ward_id     varchar2(16),
                phuong.ten,--holder_ward_name     nvarchar2(128),
                null,--holder_district_id     varchar2(16),
                huyen.ten,--holder_district_name     nvarchar2(128),
                yc.bh_id,--                varchar2(64),
                bh.ten,--insured_name         nvarchar2(255),
                tgia.diachi || '||chr(39)||' '||chr(39)||'  || phuong.ten || '||chr(39)||' '||chr(39)||'  || huyen.ten,
                ams.LIFE_AGENCY_INVOICE_CUSTOMER.SYSTEM_USER,
                ams.LIFE_AGENCY_INVOICE_CUSTOMER.SYSTEM_USER,
                sysdate,
                sysdate,
                replace(tgia.dthoai || '||chr(39)||';'||chr(39)||'  || tgia.dthoai_dd || '||chr(39)||';'||chr(39)||'  || tgia.dthoai_cq , '';;'' ,'''')
            from
            (
                select  /*+
                           CARDINALITY(hd, 100)
                           */
                    hd.hd_id,
                    hd.ngayphanh
                from  '|| list_databse.schema || 'nt_hopdong' || list_databse.link || '  hd
                where hd.ngayphanh between to_date(' ||chr(39) || var_str_from_date || chr(39) || ') and to_date(' ||chr(39) || var_str_to_date || chr(39) || ')
                   and hd.cty_id = '|| chr(39) || list_databse.id || chr(39) ||'
                   and hd.sf_id not in ('||chr(39)||'1010767'||chr(39)||', '||chr(39)||'1010794'||chr(39)||')
            ) hd
            inner join
            (
                select /*+  CARDINALITY(tmp,100) */
                    tmp.hd_id,
                    tmp.tgia_id,
                    tmp.bh_id
                from '|| list_databse.schema || 'nt_yeucau' || list_databse.link || ' tmp
                where tmp.hd_id is not null
            ) yc
                on hd.hd_id = yc.hd_id
            left join
            (
                select  /*+  CARDINALITY(tmp,100) */
                    tmp.kh_id,
                    tmp.ten,
                    tmp.phuong_id,
                    tmp.kvhc_id,
                    tmp.diachi,
                    tmp.dthoai,
                    tmp.dthoai_dd,
                    tmp.dthoai_cq
                from '|| list_databse.schema || 'nt_khach' || list_databse.link || ' tmp
            ) tgia
                on tgia.kh_id = yc.tgia_id
            left join
            (
                select  /*+  CARDINALITY(tmp,100) */
                    tmp.kh_id,
                    tmp.ten
                from '|| list_databse.schema || 'nt_khach' || list_databse.link || ' tmp
            ) bh
                on bh.kh_id = yc.bh_id
            left join
            (
                select  /*+  CARDINALITY(tmp,100) */
                    tmp.kvhc_id,
                    tmp.ten
                from '|| list_databse.schema || 'nt_kvhc' || list_databse.link || ' tmp
            ) phuong
                on phuong.kvhc_id = tgia.phuong_id
            left join
            (
                select  /*+  CARDINALITY(tmp,100) */
                    tmp.kvhc_id,
                    tmp.ten
                from '|| list_databse.schema || 'nt_kvhc' || list_databse.link || ' tmp
            ) huyen
                on huyen.kvhc_id = tgia.kvhc_id;
            end;
            ';

            execute immediate var_query;
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'bvl_get_customer_gui', ' so lieu cty : '|| var_company_name || ' vi tri : ' || to_char(var_error_pos));
            ams.life_agency_log.time_stop;
            ams.life_agency_log.time_begin;

            var_error_pos := 2;
            --cap nhat font Unicode cho du lieu da co
            --convert theo session id cho no
            update ams.la_inv_bvl_customer_tmp tmp
            set tmp.address = ams.LIFE_AGENCY_INVOICE_CUSTOMER.tcvn2utf8_new(tmp.address) || ' ' || list_databse.name, --them ca ten cong ty o day cho dung
                tmp.holder_name = ams.LIFE_AGENCY_INVOICE_CUSTOMER.tcvn2utf8_new(tmp.holder_name),  -- || ' ' || v_cty.database_name
                tmp.insured_name = ams.LIFE_AGENCY_INVOICE_CUSTOMER.tcvn2utf8_new(tmp.insured_name),  -- || ' ' || v_cty.database_name
                tmp.update_user = AMS_CORE_SYSTEM.SYSTEM_USER,
                tmp.update_datetime = sysdate
            where tmp.session_id = var_session_id
                and tmp.source_of_data = ams.LIFE_AGENCY_INVOICE_CUSTOMER.SYSTEM_REFER_BVLIFE
                and tmp.company_bvl_id = list_databse.id;
            commit;

            --sau do se do du lieu len bang chinh cho no
            insert /*+ APPEND */ into ams.la_inv_bvl_customer nologging
            (
                session_id,
                record_date,
                version_date,
                source_of_data,
                company_bvl_id,
                account_number,
                holder_id,
                holder_name,
                holder_address,
                holder_ward_id,
                holder_ward_name,
                holder_district_id,
                holder_district_name,
                insured_id,
                insured_name,
                address,
                create_user,
                update_user,
                create_datetime,
                update_datetime,
                phone
            )
            select /*+ CARDINALITY(tmp, 100)*/
                tmp.session_id,
                tmp.record_date,
                tmp.version_date,
                tmp.source_of_data,
                tmp.company_bvl_id,
                tmp.account_number,
                tmp.holder_id,
                tmp.holder_name,
                tmp.holder_address,
                tmp.holder_ward_id,
                tmp.holder_ward_name,
                tmp.holder_district_id,
                tmp.holder_district_name,
                tmp.insured_id,
                tmp.insured_name,
                tmp.address,
                tmp.create_user,
                tmp.update_user,
                tmp.create_datetime,
                tmp.update_datetime,
                tmp.phone
            from ams.la_inv_bvl_customer_tmp tmp
            where tmp.session_id = var_session_id
                and tmp.source_of_data = ams.LIFE_AGENCY_INVOICE_CUSTOMER.SYSTEM_REFER_BVLIFE
                and tmp.company_bvl_id = list_databse.id;
            commit;

            ams.life_agency_log.time_end;
            ams.life_agency_log.write_log(1000, 'bvl_get_customer_gui', ' unicode cty : '|| var_company_name || ' vi tri : ' || to_char(var_error_pos));
        end loop;

        --dbms_stats.gather_table_stats(null, 'la_inv_bvl_customer', cascade => true);

        var_run_end_time := sysdate;
        ams.life_agency_log.time_log(1001, 'Thoi gian chay bvl_get_customer_gui', var_run_begin_time, var_run_end_time);
        open row_records for
        select '1' from dual;
    exception
        when others then
            rollback;
            life_agency_log.write_log(-999,
                'loi tai thu tuc: daily_invoice_gui  o so thu tu: ' || to_char(var_error_pos),
                sqlerrm,
                sqlcode);
            var_error_message := sqlerrm;
            open row_records for
            select var_error_message from dual;
    end;

    function tcvn2utf8_new(p_tcvn char) return  nvarchar2
    is
    -- Created 18/09/2009
    -- TMH
    -- Convert from tcvn sang unicode
    -- Loc bo sung truong hop null
        Result nvarchar2(10000);
        TYPE t_utf8 IS VARRAY(233) OF number(10);
        v_utf8 t_utf8 ;
        TYPE t_tcvn3 IS VARRAY(233) OF number(10);
        v_tcvn3 t_tcvn3 ;
        v_found number :=0;
    begin
        v_utf8 := t_utf8(50081,50080,14793379,50083,14793377,50307,14793391,14793393,14793395,14793397,
                        14793399,50082,14793381,14793383,14793385,14793387,14793389,50089,50088,14793403,
                        14793405,14793401,50090,14793407,14793601,14793603,14793605,14793607,50093,50092,
                        14793609,50345,14793611,50099,50098,14793615,50101,14793613,50100,14793617,
                        14793619,14793621,14793623,14793625,50849,14793627,14793629,14793631,14793633,14793635,
                        50106,50105,14793639,50601,14793637,50864,14793641,14793643,14793645,14793647,
                        14793649,50109,14793651,14793655,14793657,14793653,50321,50049,50048,14793378,
                        50051,14793376,50306,14793390,14793392,14793394,14793396,14793398,50050,14793380,
                        14793382,14793384,14793386,14793388,50057,50056,14793402,14793404,14793400,50058,
                        14793406,14793600,14793602,14793604,14793606,50061,50060,14793608,50344,14793610,
                        50067,50066,14793614,50069,14793612,50068,14793616,14793618,14793620,14793622,
                        14793624,50848,14793626,14793628,14793630,14793632,14793634,50074,50073,14793638,
                        50600,14793636,50863,14793640,14793642,14793644,14793646,14793648,50077,14793650,
                        14793654,14793656,14793652,50320);

      v_tcvn3 := t_tcvn3(49848,49845,49846,49847,49849,
                        49832,49854,49851,49852,49853,50054,
                        49833,50058,50055,50056,50057,50059,
                        50064,50060,50062,50063,50065,
                        49834,50069,50066,50067,50068,50070,
                        50077,50071,50072,50076,50078,
                        50083,50079,50081,50082,50084,
                        49835,50088,50085,50086,50087,50089,
                        49836,50093,50090,50091,50092,50094,
                        50099,50095,50097,50098,50100,
                        49837,50104,50101,50102,50103,50105,
                        50109,50106,50107,50108,50110,
                        49838,
                        16824,16821,16822,16823,16825,161,41406,41403,41404,
                        41405,41414,162,41674,41671,41672,41673,41675,17872,
                        17868,17870,17871,17873,163,41941,41938,41939,41940,
                        41942,18909,18903,18904,18908,18910,20451,20447,20449,20450,
                        20452,164,42216,42213,42214,42215,42217,165,42477,42474,
                        42475,42476,42478,22003,21999,22001,22002,22004,166,42744,
                        42741,42742,42743,42745,23037,23034,23035,23036,23038,49831);

        if P_tcvn is not null then
        for i in 1..length(P_tcvn) loop
            v_found :=0;
           for j in 1..v_tcvn3.count loop
               if v_tcvn3(j) = ascii(substr(P_tcvn,i,1)) then
                   result := result || chr(v_utf8(j));
                   v_found := 1;
                   exit;
                end if;
            end loop;
            if v_found = 0 then
               result:= result || substr(P_tcvn,i,1);
            end if;
        end loop;
        else
            result:=null;
        end if;
        return result;
    end;

end LIFE_AGENCY_INVOICE_CUSTOMER;
/
