create or replace package ams.LIFE_AGENCY_INVOICE_REPORT is
    SYSTEM_REFER_AMS varchar2(16) := 'AMS';
    SYSTEM_REFER_TALISMAN varchar2(16) := 'TAL';
    SYSTEM_REFER_BVLIFE varchar2(16) := 'BVL';
    procedure main;
    procedure get_invoice01(valRecordDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor);

    procedure get_invoice02(valRecordDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor);
end LIFE_AGENCY_INVOICE_REPORT;
/
create or replace package body ams.LIFE_AGENCY_INVOICE_REPORT is
    procedure main
    is
    begin
        null;
    end;

    /*
        Creater: Le Khac Chinh
        Date Create: 12/10/2012
        Version: 1.0
        Description: Hien thi du lieu chi tiet bao cao no phi
        Parameter:
            valRecordDate [date]: Thang can lay du lieu
            valBranchID [number]: Ma cong ty
            valAgentID [number]: Ma dai ly
            row_records [sys_refcursor]: du lieu tra ve
        Update:  Le Khac Chinh
            Version: 1.1
            Date Updated: 1/11/2013
            Note:  Fix theo ID: 113056 Lay ca cac hoa don vay phi, hien thi cot so hoa don thuc thu can cu vao ngay thuc thu de khong phai sua phan chay du lieu        Update:  Le Khac Chinh
        Update:  Le Khac Chinh
            Version: 1.2
            Date Updated: 13/12/2013
            Note:  Fix theo ID: 123671 khong lay cac hop dong vay phi va tra vay
    */
    procedure get_invoice01(valRecordDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor)
    is
        var_record_date date := trunc(valRecordDate, 'MM');
        var_branch_id number(10) := nvl(valBranchID, 0);
        var_agent_id number(10) := nvl(valAgentID, 0);
    begin
        if var_agent_id <> 0 then
            open row_records for
            select /*+ CARDINALITY(res, 100)
                */
                res.company_name,
                res.office_ams_id,
                res.office_name,
                res.agency_ams_id,
                res.agency_name,
                res.unit_ams_id,
                res.unit_name,
                res.outlet_id,
                res.outlet_ams_id,
                res.outlet_name,
                res.position_name,
                to_char(res.position_date, 'DD/MM/YYYY') position_date,
                to_char(res.effective_date, 'DD/MM/YYYY') effective_date,
                to_char(res.terminative_date, 'DD/MM/YYYY') terminative_date,
                res.status_code,
                res.account_number,
                res.barcode,
                res.holder_name,
                res.holder_address,
                res.phone,
                res.invoice_number,
                /*Neu la Talisman thi lay o invoice
                Neu la BVL thi lay truong create_user luon de do phai tao cot nhieu*/
                case
                    when res.real_premium is not null and res.source_of_data = LIFE_AGENCY_INVOICE_REPORT.SYSTEM_REFER_TALISMAN then
                        res.invoice_number
                    else null
                end real_invoice_number,
                res.status_invoice_code,
                res.coll_premium,
                res.real_premium,
                to_char(res.from_date, 'DD/MM/YYYY') from_date,
                to_char(res.to_date, 'DD/MM/YYYY') to_date,
                to_char(res.print_date, 'DD/MM/YYYY') print_date,
                --o TAL khi thuc thu thi moi hien thi ngay thuc thu cho no
                case
                    when res.real_premium is not null and res.source_of_data = LIFE_AGENCY_INVOICE_REPORT.SYSTEM_REFER_TALISMAN then
                        to_char(res.collected_date, 'DD/MM/YYYY')
                    when res.source_of_data = LIFE_AGENCY_INVOICE_REPORT.SYSTEM_REFER_BVLIFE then
                        to_char(res.collected_date, 'DD/MM/YYYY')
                end collected_date,
                res.data_type_name,
                case when res.is_loan = 1  then 'X' end is_loan,
                res.source_of_data
            from ams.la_inv_invoice res
            where res.record_date = var_record_date
                and res.outlet_id = var_agent_id
                and res.pay_loan is null
                and nvl(res.is_loan, 0) = 0
            order by
                nlssort(res.company_name, 'nls_sort=Vietnamese'),
                nlssort(res.office_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese'),
                res.from_date;
       elsif var_branch_id <> 0 then
            open row_records for
            select /*+ CARDINALITY(res, 100)
                */
                res.company_name,
                res.office_ams_id,
                res.office_name,
                res.agency_ams_id,
                res.agency_name,
                res.unit_ams_id,
                res.unit_name,
                res.outlet_id,
                res.outlet_ams_id,
                res.outlet_name,
                res.position_name,
                to_char(res.position_date, 'DD/MM/YYYY') position_date,
                to_char(res.effective_date, 'DD/MM/YYYY') effective_date,
                to_char(res.terminative_date, 'DD/MM/YYYY') terminative_date,
                res.status_code,
                res.account_number,
                res.barcode,
                res.holder_name,
                res.holder_address,
                res.phone,
                res.invoice_number,
                /*Neu la Talisman thi lay o invoice
                Neu la BVL thi lay truong create_user luon de do phai tao cot nhieu*/
                case
                    when res.real_premium is not null and res.source_of_data = LIFE_AGENCY_INVOICE_REPORT.SYSTEM_REFER_TALISMAN then
                        res.invoice_number
                    else null
                end real_invoice_number,
                res.status_invoice_code,
                res.coll_premium,
                res.real_premium,
                to_char(res.from_date, 'DD/MM/YYYY') from_date,
                to_char(res.to_date, 'DD/MM/YYYY') to_date,
                to_char(res.print_date, 'DD/MM/YYYY') print_date,
                --o TAL khi thuc thu thi moi hien thi ngay thuc thu cho no
                case
                    when res.real_premium is not null and res.source_of_data = LIFE_AGENCY_INVOICE_REPORT.SYSTEM_REFER_TALISMAN then
                        to_char(res.collected_date, 'DD/MM/YYYY')
                    when res.source_of_data = LIFE_AGENCY_INVOICE_REPORT.SYSTEM_REFER_BVLIFE then
                        to_char(res.collected_date, 'DD/MM/YYYY')
                end collected_date,
                res.data_type_name,
                case when res.is_loan = 1  then 'X' end is_loan,
                res.source_of_data
            from ams.la_inv_invoice res
            where res.record_date = var_record_date
                and var_branch_id in
                (
                    res.company_id,
                    res.office_id,
                    res.agency_id,
                    res.unit_id
                )
                and res.pay_loan is null
                and nvl(res.is_loan, 0) = 0
            order by
                nlssort(res.company_name, 'nls_sort=Vietnamese'),
                nlssort(res.office_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese'),
                res.from_date;
       elsif var_branch_id = 0 then
            open row_records for
            select /*+ CARDINALITY(res, 100)
                */
                res.company_name,
                res.office_ams_id,
                res.office_name,
                res.agency_ams_id,
                res.agency_name,
                res.unit_ams_id,
                res.unit_name,
                res.outlet_id,
                res.outlet_ams_id,
                res.outlet_name,
                res.position_name,
                to_char(res.position_date, 'DD/MM/YYYY') position_date,
                to_char(res.effective_date, 'DD/MM/YYYY') effective_date,
                to_char(res.terminative_date, 'DD/MM/YYYY') terminative_date,
                res.status_code,
                res.account_number,
                res.barcode,
                res.holder_name,
                res.holder_address,
                res.phone,
                res.invoice_number,
                /*Neu la Talisman thi lay o invoice
                Neu la BVL thi lay truong create_user luon de do phai tao cot nhieu*/
                case
                    when res.real_premium is not null and res.source_of_data = LIFE_AGENCY_INVOICE_REPORT.SYSTEM_REFER_TALISMAN then
                        res.invoice_number
                    else null
                end real_invoice_number,
                res.status_invoice_code,
                res.coll_premium,
                res.real_premium,
                to_char(res.from_date, 'DD/MM/YYYY') from_date,
                to_char(res.to_date, 'DD/MM/YYYY') to_date,
                to_char(res.print_date, 'DD/MM/YYYY') print_date,
                --o TAL khi thuc thu thi moi hien thi ngay thuc thu cho no
                case
                    when res.real_premium is not null and res.source_of_data = LIFE_AGENCY_INVOICE_REPORT.SYSTEM_REFER_TALISMAN then
                        to_char(res.collected_date, 'DD/MM/YYYY')
                    when res.source_of_data = LIFE_AGENCY_INVOICE_REPORT.SYSTEM_REFER_BVLIFE then
                        to_char(res.collected_date, 'DD/MM/YYYY')
                end collected_date,
                res.data_type_name,
                case when res.is_loan = 1  then 'X' end is_loan,
                res.source_of_data
            from ams.la_inv_invoice res
            where res.record_date = var_record_date
                and res.pay_loan is null
                and nvl(res.is_loan, 0) = 0
            order by
                nlssort(res.company_name, 'nls_sort=Vietnamese'),
                nlssort(res.office_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese'),
                res.from_date;
        end if;
    end;

    procedure get_invoice02(valRecordDate date := null,
        valBranchID number := null,
        valAgentID number := null,
        row_records out sys_refcursor)
    is
        var_record_date date := trunc(valRecordDate, 'MM');
        var_branch_id number(10) := nvl(valBranchID, 0);
        var_agent_id number(10) := nvl(valAgentID, 0);
    begin
        if var_agent_id <> 0 then
            open row_records for
            select /*+ CARDINALITY(repo, 100) CARDINALITY(bvl, 100) CARDINALITY(ods, 100)
                */
                repo.company_name,
                repo.office_ams_id,
                repo.office_name,
                repo.agency_ams_id,
                repo.agency_name,
                repo.unit_ams_id,
                repo.unit_name,
                repo.outlet_id,
                repo.outlet_ams_id,
                repo.outlet_name,
                repo.position_name,
                repo.effective_date,
                repo.terminative_date,
                repo.invoice_qty,
                bvl.coll_premium bvl_coll_premium,
                bvl.real_premium bvl_real_premium,
                bvl.coll_rate bvl_coll_rate,
                ods.coll_premium ods_coll_premium,
                ods.real_premium ods_real_premium,
                ods.coll_rate ods_coll_rate,
                repo.coll_premium,
                repo.real_premium,
                repo.coll_rate
            from
            (
                select /*+ CARDINALITY(res, 100)
                    */
                    max(res.company_name) company_name,
                    max(res.office_ams_id) office_ams_id,
                    max(res.office_name) office_name,
                    max(res.agency_ams_id) agency_ams_id,
                    max(res.agency_name) agency_name,
                    max(res.unit_ams_id) unit_ams_id,
                    max(res.unit_name) unit_name,
                    max(res.outlet_id) outlet_id,
                    res.outlet_ams_id,
                    max(res.outlet_name) outlet_name,
                    max(res.position_name) position_name,
                    max(to_char(res.effective_date, 'DD/MM/YYYY')) effective_date,
                    max(to_char(res.terminative_date, 'DD/MM/YYYY')) terminative_date,
                    nvl(count(res.account_number), 0) invoice_qty,
                    sum(nvl(res.coll_premium, 0)) coll_premium,
                    sum(nvl(res.real_premium, 0)) real_premium,
                    round(decode(sum(nvl(res.coll_premium, 0)),
                        0, 1,
                        sum(nvl(res.real_premium, 0)) / sum(nvl(res.coll_premium, 0))
                    )* 100,
                    2)  coll_rate
                from ams.la_inv_invoice res
                where res.record_date = var_record_date
                    and nvl(res.is_loan, 0) = 0
                    and res.outlet_id = var_agent_id
                group by res.outlet_ams_id
            ) repo
            left join
            (
                select /*+ CARDINALITY(res, 100)
                    */
                    res.outlet_ams_id,
                    sum(nvl(res.coll_premium, 0)) coll_premium,
                    sum(nvl(res.real_premium, 0)) real_premium,
                    round(decode(sum(nvl(res.coll_premium, 0)),
                        0, 1,
                        sum(nvl(res.real_premium, 0)) / sum(nvl(res.coll_premium, 0))
                    ) * 100,
                    2)  coll_rate
                from ams.la_inv_invoice res
                where res.record_date = var_record_date
                    and res.source_of_data = ams.LIFE_AGENCY_INVOICE_REPORT.SYSTEM_REFER_BVLIFE
                    and nvl(res.is_loan, 0) = 0
                    and res.outlet_id = var_agent_id
                group by res.outlet_ams_id
            ) bvl
                on bvl.outlet_ams_id = repo.outlet_ams_id
            left join
            (
                select /*+ CARDINALITY(res, 100)
                    */
                    res.outlet_ams_id,
                    sum(nvl(res.coll_premium, 0)) coll_premium,
                    sum(nvl(res.real_premium, 0)) real_premium,
                    round(decode(sum(nvl(res.coll_premium, 0)),
                        0, 1,
                        sum(nvl(res.real_premium, 0)) / sum(nvl(res.coll_premium, 0))
                    ) * 100,
                    2)  coll_rate
                from ams.la_inv_invoice res
                where res.record_date = var_record_date
                    and res.source_of_data = ams.LIFE_AGENCY_INVOICE_REPORT.SYSTEM_REFER_TALISMAN
                    and nvl(res.is_loan, 0) = 0
                    and res.outlet_id = var_agent_id
                group by res.outlet_ams_id
            ) ods
                on ods.outlet_ams_id = repo.outlet_ams_id
            order by
                nlssort(repo.company_name, 'nls_sort=Vietnamese'),
                nlssort(repo.office_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(repo.agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(repo.unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(repo.outlet_name, 'nls_sort=Vietnamese'),
                nlssort(repo.outlet_ams_id, 'nls_sort=Vietnamese');
       elsif var_branch_id <> 0 then
            open row_records for
            select /*+ CARDINALITY(repo, 100) CARDINALITY(bvl, 100) CARDINALITY(ods, 100)
                */
                repo.company_name,
                repo.office_ams_id,
                repo.office_name,
                repo.agency_ams_id,
                repo.agency_name,
                repo.unit_ams_id,
                repo.unit_name,
                repo.outlet_id,
                repo.outlet_ams_id,
                repo.outlet_name,
                repo.position_name,
                repo.effective_date,
                repo.terminative_date,
                repo.invoice_qty,
                bvl.coll_premium bvl_coll_premium,
                bvl.real_premium bvl_real_premium,
                bvl.coll_rate bvl_coll_rate,
                ods.coll_premium ods_coll_premium,
                ods.real_premium ods_real_premium,
                ods.coll_rate ods_coll_rate,
                repo.coll_premium,
                repo.real_premium,
                repo.coll_rate
            from
            (
                select /*+ CARDINALITY(res, 100)
                    */
                    max(res.company_name) company_name,
                    max(res.office_ams_id) office_ams_id,
                    max(res.office_name) office_name,
                    max(res.agency_ams_id) agency_ams_id,
                    max(res.agency_name) agency_name,
                    max(res.unit_ams_id) unit_ams_id,
                    max(res.unit_name) unit_name,
                    max(res.outlet_id) outlet_id,
                    res.outlet_ams_id,
                    max(res.outlet_name) outlet_name,
                    max(res.position_name) position_name,
                    max(to_char(res.effective_date, 'DD/MM/YYYY')) effective_date,
                    max(to_char(res.terminative_date, 'DD/MM/YYYY')) terminative_date,
                    nvl(count(res.account_number), 0) invoice_qty,
                    sum(nvl(res.coll_premium, 0)) coll_premium,
                    sum(nvl(res.real_premium, 0)) real_premium,
                    round(decode(sum(nvl(res.coll_premium, 0)),
                        0, 1,
                        sum(nvl(res.real_premium, 0)) / sum(nvl(res.coll_premium, 0))
                    ) * 100,
                    2)  coll_rate
                from ams.la_inv_invoice res
                where res.record_date = var_record_date
                    and nvl(res.is_loan, 0) = 0
                    and var_branch_id in
                    (
                        res.company_id,
                        res.office_id,
                        res.agency_id,
                        res.unit_id
                    )
                group by res.outlet_ams_id
            ) repo
            left join
            (
                select /*+ CARDINALITY(res, 100)
                    */
                    res.outlet_ams_id,
                    sum(nvl(res.coll_premium, 0)) coll_premium,
                    sum(nvl(res.real_premium, 0)) real_premium,
                    round(decode(sum(nvl(res.coll_premium, 0)),
                        0, 1,
                        sum(nvl(res.real_premium, 0)) / sum(nvl(res.coll_premium, 0))
                    ) * 100,
                    2)  coll_rate
                from ams.la_inv_invoice res
                where res.record_date = var_record_date
                    and res.source_of_data = ams.LIFE_AGENCY_INVOICE_REPORT.SYSTEM_REFER_BVLIFE
                    and nvl(res.is_loan, 0) = 0
                    and var_branch_id in
                    (
                        res.company_id,
                        res.office_id,
                        res.agency_id,
                        res.unit_id
                    )
                group by res.outlet_ams_id
            ) bvl
                on bvl.outlet_ams_id = repo.outlet_ams_id
            left join
            (
                select /*+ CARDINALITY(res, 100)
                    */
                    res.outlet_ams_id,
                    sum(nvl(res.coll_premium, 0)) coll_premium,
                    sum(nvl(res.real_premium, 0)) real_premium,
                    round(decode(sum(nvl(res.coll_premium, 0)),
                        0, 1,
                        sum(nvl(res.real_premium, 0)) / sum(nvl(res.coll_premium, 0))
                    ) * 100,
                    2)  coll_rate
                from ams.la_inv_invoice res
                where res.record_date = var_record_date
                    and res.source_of_data = ams.LIFE_AGENCY_INVOICE_REPORT.SYSTEM_REFER_TALISMAN
                    and nvl(res.is_loan, 0) = 0
                    and var_branch_id in
                    (
                        res.company_id,
                        res.office_id,
                        res.agency_id,
                        res.unit_id
                    )
                group by res.outlet_ams_id
            ) ods
                on ods.outlet_ams_id = repo.outlet_ams_id
            order by
                nlssort(repo.company_name, 'nls_sort=Vietnamese'),
                nlssort(repo.office_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(repo.agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(repo.unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(repo.outlet_name, 'nls_sort=Vietnamese'),
                nlssort(repo.outlet_ams_id, 'nls_sort=Vietnamese');
       else
            open row_records for
            select /*+ CARDINALITY(repo, 100) CARDINALITY(bvl, 100) CARDINALITY(ods, 100)
                */
                repo.company_name,
                repo.office_ams_id,
                repo.office_name,
                repo.agency_ams_id,
                repo.agency_name,
                repo.unit_ams_id,
                repo.unit_name,
                repo.outlet_id,
                repo.outlet_ams_id,
                repo.outlet_name,
                repo.position_name,
                repo.effective_date,
                repo.terminative_date,
                repo.invoice_qty,
                bvl.coll_premium bvl_coll_premium,
                bvl.real_premium bvl_real_premium,
                bvl.coll_rate bvl_coll_rate,
                ods.coll_premium ods_coll_premium,
                ods.real_premium ods_real_premium,
                ods.coll_rate ods_coll_rate,
                repo.coll_premium,
                repo.real_premium,
                repo.coll_rate
            from
            (
                select /*+ CARDINALITY(res, 100)
                    */
                    max(res.company_name) company_name,
                    max(res.office_ams_id) office_ams_id,
                    max(res.office_name) office_name,
                    max(res.agency_ams_id) agency_ams_id,
                    max(res.agency_name) agency_name,
                    max(res.unit_ams_id) unit_ams_id,
                    max(res.unit_name) unit_name,
                    max(res.outlet_id) outlet_id,
                    res.outlet_ams_id,
                    max(res.outlet_name) outlet_name,
                    max(res.position_name) position_name,
                    max(to_char(res.effective_date, 'DD/MM/YYYY')) effective_date,
                    max(to_char(res.terminative_date, 'DD/MM/YYYY')) terminative_date,
                    nvl(count(res.account_number), 0) invoice_qty,
                    sum(nvl(res.coll_premium, 0)) coll_premium,
                    sum(nvl(res.real_premium, 0)) real_premium,
                    round(decode(sum(nvl(res.coll_premium, 0)),
                        0, 1,
                        sum(nvl(res.real_premium, 0)) / sum(nvl(res.coll_premium, 0))
                    ) * 100,
                    2)  coll_rate
                from ams.la_inv_invoice res
                where res.record_date = var_record_date
                    and nvl(res.is_loan, 0) = 0
                group by res.outlet_ams_id
            ) repo
            left join
            (
                select /*+ CARDINALITY(res, 100)
                    */
                    res.outlet_ams_id,
                    sum(nvl(res.coll_premium, 0)) coll_premium,
                    sum(nvl(res.real_premium, 0)) real_premium,
                    round(decode(sum(nvl(res.coll_premium, 0)),
                        0, 100,
                        sum(nvl(res.real_premium, 0)) / sum(nvl(res.coll_premium, 0))
                    ) * 1,
                    2)  coll_rate
                from ams.la_inv_invoice res
                where res.record_date = var_record_date
                    and res.source_of_data = ams.LIFE_AGENCY_INVOICE_REPORT.SYSTEM_REFER_BVLIFE
                    and nvl(res.is_loan, 0) = 0
                group by res.outlet_ams_id
            ) bvl
                on bvl.outlet_ams_id = repo.outlet_ams_id
            left join
            (
                select /*+ CARDINALITY(res, 100)
                    */
                    res.outlet_ams_id,
                    sum(nvl(res.coll_premium, 0)) coll_premium,
                    sum(nvl(res.real_premium, 0)) real_premium,
                    round(decode(sum(nvl(res.coll_premium, 0)),
                        0, 1,
                        sum(nvl(res.real_premium, 0)) / sum(nvl(res.coll_premium, 0))
                    ) * 100,
                    2)  coll_rate
                from ams.la_inv_invoice res
                where res.record_date = var_record_date
                    and res.source_of_data = ams.LIFE_AGENCY_INVOICE_REPORT.SYSTEM_REFER_TALISMAN
                    and nvl(res.is_loan, 0) = 0
                group by res.outlet_ams_id
            ) ods
                on ods.outlet_ams_id = repo.outlet_ams_id
            order by
                nlssort(repo.company_name, 'nls_sort=Vietnamese'),
                nlssort(repo.office_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(repo.agency_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(repo.unit_name, 'nls_sort=Vietnamese') nulls first,
                nlssort(repo.outlet_name, 'nls_sort=Vietnamese'),
                nlssort(repo.outlet_ams_id, 'nls_sort=Vietnamese');
        end if;
    end;

end LIFE_AGENCY_INVOICE_REPORT;
/
