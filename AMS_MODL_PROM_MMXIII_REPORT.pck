create or replace package ams.AMS_MODL_PROM_MMXIII_REPORT is

    POSITION_CODE_CV00 VARCHAR2(16) := 'CV00';
    POSITION_CODE_CV01 VARCHAR2(16) := 'CV01';
    POSITION_CODE_CV02 VARCHAR2(16) := 'CV02';
    POSITION_CODE_CV03 VARCHAR2(16) := 'CV03';
    POSITION_CODE_CV04 VARCHAR2(16) := 'CV04';
    POSITION_CODE_CV05 VARCHAR2(16) := 'CV05';

    DATA_GENR NVARCHAR2(64) := 'Tổng hợp';
    DATA_DETL NVARCHAR2(64) := 'Chi tiết';

    POSITION_TITL_CV00 NVARCHAR2(64) := 'Tư vấn viên';
    POSITION_TITL_CV01 NVARCHAR2(64) := 'Tiền trưởng nhóm';
    POSITION_TITL_CV02 NVARCHAR2(64) := 'Trưởng nhóm';
    POSITION_TITL_CV03 NVARCHAR2(64) := 'Trưởng nhóm CNTH';
    POSITION_TITL_CV04 NVARCHAR2(64) := 'Trưởng ban';
    POSITION_TITL_CV05 NVARCHAR2(64) := 'Tư vấn viên';

    AMST_PROM VARCHAR2(1) := 'P';
    AMST_DEPO VARCHAR2(1) := 'D';
    AMST_MAIN VARCHAR2(1) := 'M';
    AMST_ERRO VARCHAR2(1) := 'E';

    AMST_TITL_PROM NVARCHAR2(64) := 'Thăng tiến';
    AMST_TITL_DEPO NVARCHAR2(64) := 'Hạ bậc';
    AMST_TITL_MAIN NVARCHAR2(64) := 'Duy trì';
    AMST_TITL_ERRO NVARCHAR2(64) := 'Lỗi dữ liệu';

    BE_EXECUTING_YES VARCHAR2(1) := 'Y';
    BE_EXECUTING_NO VARCHAR2(1) := 'N';
    BE_EXECUTING_DEL VARCHAR2(1) := 'D';
    DATE_MAX_VALUE date := to_date('31-dec-9999');
    DATE_MIN_VALUE date := to_date('1-jan-1900');
    OUTLET_INFO_TYPE_POSI VARCHAR2(16) := 'POSI';
    SYSTEM_USER varchar2(16) := 'SYSTEM';
    THEME_LANGUAGE VARCHAR2(16) := 'VN';

    BE_PAID_YES VARCHAR2(1) := 'Y';
    BE_PAID_NO VARCHAR2(1) := 'N';
    BE_PAID_DTL VARCHAR2(1) := 'D';
    BE_PAID_SPC VARCHAR2(1) := 'S';
    BE_PAID_TERM VARCHAR2(1) := 'T';

    procedure main;

    /* Bao cao tong hop thang tien*/
    procedure mmxiii_get_rp01(valDate date := null,
        valCompanyID varchar2 := null,
        row_records out sys_refcursor);
    procedure mmxiii_get_prom_export(valDate date := null,
        valCompanyID varchar2 := null,
        row_records out sys_refcursor);
    procedure mmxiii_get_pupm01(valDate date := null,
        valCompanyID varchar2 := null,
        row_records out sys_refcursor);
end AMS_MODL_PROM_MMXIII_REPORT;
/
create or replace package body ams.AMS_MODL_PROM_MMXIII_REPORT is
    /*chinhlk 22/2/2013 sua lai cho ngay hieu luc chuc vu moi len theo yeu cau anh Huu Hoa*/
    procedure main
    is
    begin
        null;
    end;

    procedure mmxiii_get_rp01(valDate date := null,
        valCompanyID varchar2 := null,
        row_records out sys_refcursor)
    is
    begin
        open row_records for
        select /*+ CARDINALITY(p, 100)*/
            -- Thong tin dai ly
            p.info_company_name,
            p.info_office_name,
            p.info_agency_name,
            p.info_unit_name,
            p.outlet_ams_id,
            p.outlet_name,
            case
                when p.info_position_code = AMS_MODL_PROM_MMXIII_REPORT.POSITION_CODE_CV00 then
                    AMS_MODL_PROM_MMXIII_REPORT.POSITION_TITL_CV00
                when p.info_position_code = AMS_MODL_PROM_MMXIII_REPORT.POSITION_CODE_CV01 then
                    AMS_MODL_PROM_MMXIII_REPORT.POSITION_TITL_CV01
                when p.info_position_code = AMS_MODL_PROM_MMXIII_REPORT.POSITION_CODE_CV02 then
                    AMS_MODL_PROM_MMXIII_REPORT.POSITION_TITL_CV02
                when p.info_position_code = AMS_MODL_PROM_MMXIII_REPORT.POSITION_CODE_CV03 then
                    AMS_MODL_PROM_MMXIII_REPORT.POSITION_TITL_CV03
                when p.info_position_code = AMS_MODL_PROM_MMXIII_REPORT.POSITION_CODE_CV04 then
                    AMS_MODL_PROM_MMXIII_REPORT.POSITION_TITL_CV04
                when p.info_position_code = AMS_MODL_PROM_MMXIII_REPORT.POSITION_CODE_CV05 then
                    AMS_MODL_PROM_MMXIII_REPORT.POSITION_TITL_CV05
                end position_title,
            to_char(p.info_effective_date, 'DD/MM/YYYY') info_effective_date,

            -- Tu van vien thang tien len Tien truong nhom
            p.agep_senr_by_months,
            p.agep_period_fyp,
            p.agep_period_cont_issue,
            --null agep_asmt,
            --null agep_effe_code,
            --null agep_effe_date,
            --
            case
                when p.agep_asmt = AMS_MODL_PROM_MMXIII_REPORT.AMST_PROM then
                    AMS_MODL_PROM_MMXIII_REPORT.AMST_TITL_PROM
                when p.agep_asmt = AMS_MODL_PROM_MMXIII_REPORT.AMST_ERRO then
                    AMS_MODL_PROM_MMXIII_REPORT.AMST_TITL_ERRO
                end agep_asmt,
            case
                when p.agep_effe_code = AMS_MODL_PROM_MMXIII_REPORT.POSITION_CODE_CV00 then
                    AMS_MODL_PROM_MMXIII_REPORT.POSITION_TITL_CV00
                when p.agep_effe_code = AMS_MODL_PROM_MMXIII_REPORT.POSITION_CODE_CV01 then
                    AMS_MODL_PROM_MMXIII_REPORT.POSITION_TITL_CV01
                when p.agep_effe_code = AMS_MODL_PROM_MMXIII_REPORT.POSITION_CODE_CV02 then
                    AMS_MODL_PROM_MMXIII_REPORT.POSITION_TITL_CV02
                when p.agep_effe_code = AMS_MODL_PROM_MMXIII_REPORT.POSITION_CODE_CV03 then
                    AMS_MODL_PROM_MMXIII_REPORT.POSITION_TITL_CV03
                when p.agep_effe_code = AMS_MODL_PROM_MMXIII_REPORT.POSITION_CODE_CV04 then
                    AMS_MODL_PROM_MMXIII_REPORT.POSITION_TITL_CV04
                when p.agep_effe_code = AMS_MODL_PROM_MMXIII_REPORT.POSITION_CODE_CV05 then
                    AMS_MODL_PROM_MMXIII_REPORT.POSITION_TITL_CV05
                end agep_effe_code,
            to_char(p.agep_effe_date, 'DD/MM/YYYY') agep_effe_date,
            --null agep_effe_date,

            -- Duy tri Tien truong nhom va Tien truong nhom thang tien len Truong nhom
            to_char(p.pump_effective_date, 'DD/MM/YYYY') pump_effective_date,
            p.pump_numb_asmt,
            p.pump_period_fyp,
            p.pump_period_empl,
            p.pump_period_pr36,
            p.pump_period_acti,
            --null pump_asmt,
            --null pump_effe_code,
            --null pump_effe_date,
            --
            case
                when p.pump_asmt = AMS_MODL_PROM_MMXIII_REPORT.AMST_PROM then
                    AMS_MODL_PROM_MMXIII_REPORT.AMST_TITL_PROM
                when p.pump_asmt = AMS_MODL_PROM_MMXIII_REPORT.AMST_DEPO then
                    AMS_MODL_PROM_MMXIII_REPORT.AMST_TITL_DEPO
                when p.pump_asmt = AMS_MODL_PROM_MMXIII_REPORT.AMST_MAIN then
                    AMS_MODL_PROM_MMXIII_REPORT.AMST_TITL_MAIN
                when p.pump_asmt = AMS_MODL_PROM_MMXIII_REPORT.AMST_ERRO then
                    AMS_MODL_PROM_MMXIII_REPORT.AMST_TITL_ERRO
                end pump_asmt,
            case
                when p.pump_effe_code = AMS_MODL_PROM_MMXIII_REPORT.POSITION_CODE_CV00 then
                    AMS_MODL_PROM_MMXIII_REPORT.POSITION_TITL_CV00
                when p.pump_effe_code = AMS_MODL_PROM_MMXIII_REPORT.POSITION_CODE_CV01 then
                    AMS_MODL_PROM_MMXIII_REPORT.POSITION_TITL_CV01
                when p.pump_effe_code = AMS_MODL_PROM_MMXIII_REPORT.POSITION_CODE_CV02 then
                    AMS_MODL_PROM_MMXIII_REPORT.POSITION_TITL_CV02
                when p.pump_effe_code = AMS_MODL_PROM_MMXIII_REPORT.POSITION_CODE_CV03 then
                    AMS_MODL_PROM_MMXIII_REPORT.POSITION_TITL_CV03
                when p.pump_effe_code = AMS_MODL_PROM_MMXIII_REPORT.POSITION_CODE_CV04 then
                    AMS_MODL_PROM_MMXIII_REPORT.POSITION_TITL_CV04
                when p.pump_effe_code = AMS_MODL_PROM_MMXIII_REPORT.POSITION_CODE_CV05 then
                    AMS_MODL_PROM_MMXIII_REPORT.POSITION_TITL_CV05
                end pump_effe_code,
            to_char(p.pump_effe_date, 'DD/MM/YYYY') pump_effe_date,
            --null pump_effe_date,

            -- Duy tri Truong nhom
            to_char(p.umnm_effective_date, 'DD/MM/YYYY') umnm_effective_date,
            p.umnm_senr_by_months,
            p.umnm_agts,
            p.umnm_period_fyp,
            p.umnm_period_empl,
            p.umnm_period_acti,
            --null umnm_asmt,
            --null umnm_effe_code,
            --null umnm_effe_date,
            --
            case
                when p.umnm_asmt = AMS_MODL_PROM_MMXIII_REPORT.AMST_PROM then
                    AMS_MODL_PROM_MMXIII_REPORT.AMST_TITL_PROM
                when p.umnm_asmt = AMS_MODL_PROM_MMXIII_REPORT.AMST_DEPO then
                    AMS_MODL_PROM_MMXIII_REPORT.AMST_TITL_DEPO
                when p.umnm_asmt = AMS_MODL_PROM_MMXIII_REPORT.AMST_MAIN then
                    AMS_MODL_PROM_MMXIII_REPORT.AMST_TITL_MAIN
                when p.umnm_asmt = AMS_MODL_PROM_MMXIII_REPORT.AMST_ERRO then
                    AMS_MODL_PROM_MMXIII_REPORT.AMST_TITL_ERRO
                end umnm_asmt,
            case
                when p.umnm_effe_code = AMS_MODL_PROM_MMXIII_REPORT.POSITION_CODE_CV00 then
                    AMS_MODL_PROM_MMXIII_REPORT.POSITION_TITL_CV00
                when p.umnm_effe_code = AMS_MODL_PROM_MMXIII_REPORT.POSITION_CODE_CV01 then
                    AMS_MODL_PROM_MMXIII_REPORT.POSITION_TITL_CV01
                when p.umnm_effe_code = AMS_MODL_PROM_MMXIII_REPORT.POSITION_CODE_CV02 then
                    AMS_MODL_PROM_MMXIII_REPORT.POSITION_TITL_CV02
                when p.umnm_effe_code = AMS_MODL_PROM_MMXIII_REPORT.POSITION_CODE_CV03 then
                    AMS_MODL_PROM_MMXIII_REPORT.POSITION_TITL_CV03
                when p.umnm_effe_code = AMS_MODL_PROM_MMXIII_REPORT.POSITION_CODE_CV04 then
                    AMS_MODL_PROM_MMXIII_REPORT.POSITION_TITL_CV04
                when p.umnm_effe_code = AMS_MODL_PROM_MMXIII_REPORT.POSITION_CODE_CV05 then
                    AMS_MODL_PROM_MMXIII_REPORT.POSITION_TITL_CV05
                end umnm_effe_code,
            to_char(p.umnm_effe_date, 'DD/MM/YYYY') umnm_effe_date,
            --null umnm_effe_date,

            -- Truong nhom thang tien len Truong ban
            to_char(p.umnp_effective_date, 'DD/MM/YYYY') umnp_effective_date,
            p.umnp_senr_by_months,
            p.umnp_numb_dev_unit,
            p.umnp_period_fyp,
            p.umnp_period_pr36,
            p.umnp_period_acti,
            --null umnp_asmt,
            --null umnp_effe_code,
            --null umnp_effe_date,
            --
            case
                when p.umnp_asmt = AMS_MODL_PROM_MMXIII_REPORT.AMST_PROM then
                    AMS_MODL_PROM_MMXIII_REPORT.AMST_TITL_PROM
                when p.umnp_asmt = AMS_MODL_PROM_MMXIII_REPORT.AMST_DEPO then
                    AMS_MODL_PROM_MMXIII_REPORT.AMST_TITL_DEPO
                when p.umnp_asmt = AMS_MODL_PROM_MMXIII_REPORT.AMST_MAIN then
                    AMS_MODL_PROM_MMXIII_REPORT.AMST_TITL_MAIN
                when p.umnp_asmt = AMS_MODL_PROM_MMXIII_REPORT.AMST_ERRO then
                    AMS_MODL_PROM_MMXIII_REPORT.AMST_TITL_ERRO
                end umnp_asmt,
            case
                when p.umnp_effe_code = AMS_MODL_PROM_MMXIII_REPORT.POSITION_CODE_CV00 then
                    AMS_MODL_PROM_MMXIII_REPORT.POSITION_TITL_CV00
                when p.umnp_effe_code = AMS_MODL_PROM_MMXIII_REPORT.POSITION_CODE_CV01 then
                    AMS_MODL_PROM_MMXIII_REPORT.POSITION_TITL_CV01
                when p.umnp_effe_code = AMS_MODL_PROM_MMXIII_REPORT.POSITION_CODE_CV02 then
                    AMS_MODL_PROM_MMXIII_REPORT.POSITION_TITL_CV02
                when p.umnp_effe_code = AMS_MODL_PROM_MMXIII_REPORT.POSITION_CODE_CV03 then
                    AMS_MODL_PROM_MMXIII_REPORT.POSITION_TITL_CV03
                when p.umnp_effe_code = AMS_MODL_PROM_MMXIII_REPORT.POSITION_CODE_CV04 then
                    AMS_MODL_PROM_MMXIII_REPORT.POSITION_TITL_CV04
                when p.umnp_effe_code = AMS_MODL_PROM_MMXIII_REPORT.POSITION_CODE_CV05 then
                    AMS_MODL_PROM_MMXIII_REPORT.POSITION_TITL_CV05
                end umnp_effe_code,
            to_char(p.umnp_effe_date, 'DD/MM/YYYY') umnp_effe_date,
            --null umnp_effe_date,

            -- Duy tri Truong ban
            to_char(p.amnm_effective_date, 'DD/MM/YYYY') amnm_effective_date,
            p.amnm_senr_by_months,
            p.amnm_unts,
            p.amnm_grand_unts,
            p.amnm_period_fyp,
            p.amnm_period_agen_empl,
            p.amnm_period_pers_empl,
            p.amnm_period_acti,
            --null amnm_asmt,
            --null amnm_effe_code,
            --null amnm_effe_date
            --
            case
                when p.amnm_asmt = AMS_MODL_PROM_MMXIII_REPORT.AMST_PROM then
                    AMS_MODL_PROM_MMXIII_REPORT.AMST_TITL_PROM
                when p.amnm_asmt = AMS_MODL_PROM_MMXIII_REPORT.AMST_DEPO then
                    AMS_MODL_PROM_MMXIII_REPORT.AMST_TITL_DEPO
                when p.amnm_asmt = AMS_MODL_PROM_MMXIII_REPORT.AMST_MAIN then
                    AMS_MODL_PROM_MMXIII_REPORT.AMST_TITL_MAIN
                when p.amnm_asmt = AMS_MODL_PROM_MMXIII_REPORT.AMST_ERRO then
                    AMS_MODL_PROM_MMXIII_REPORT.AMST_TITL_ERRO
                end amnm_asmt,
            case
                when p.amnm_effe_code = AMS_MODL_PROM_MMXIII_REPORT.POSITION_CODE_CV00 then
                    AMS_MODL_PROM_MMXIII_REPORT.POSITION_TITL_CV00
                when p.amnm_effe_code = AMS_MODL_PROM_MMXIII_REPORT.POSITION_CODE_CV01 then
                    AMS_MODL_PROM_MMXIII_REPORT.POSITION_TITL_CV01
                when p.amnm_effe_code = AMS_MODL_PROM_MMXIII_REPORT.POSITION_CODE_CV02 then
                    AMS_MODL_PROM_MMXIII_REPORT.POSITION_TITL_CV02
                when p.amnm_effe_code = AMS_MODL_PROM_MMXIII_REPORT.POSITION_CODE_CV03 then
                    AMS_MODL_PROM_MMXIII_REPORT.POSITION_TITL_CV03
                when p.amnm_effe_code = AMS_MODL_PROM_MMXIII_REPORT.POSITION_CODE_CV04 then
                    AMS_MODL_PROM_MMXIII_REPORT.POSITION_TITL_CV04
                when p.amnm_effe_code = AMS_MODL_PROM_MMXIII_REPORT.POSITION_CODE_CV05 then
                    AMS_MODL_PROM_MMXIII_REPORT.POSITION_TITL_CV05
                end amnm_effe_code,
            to_char(p.amnm_effe_date, 'DD/MM/YYYY') amnm_effe_date
            --null amnm_effe_date

        from ams.la_promotion_mmxiii p
        where p.record_date = trunc(valDate, 'MM')
            and (
                p.info_company_id = valCompanyID
                or
                nvl(valCompanyID, 0) = 0
            )
        order by
            nlssort(p.info_company_name, 'nls_sort=Vietnamese'),
            nlssort(p.info_office_name, 'nls_sort=Vietnamese'),
            nlssort(p.info_agency_name, 'nls_sort=Vietnamese'),
            nlssort(p.info_unit_name, 'nls_sort=Vietnamese') nulls first,
            nlssort(p.outlet_name, 'nls_sort=Vietnamese');
    end;

    procedure mmxiii_get_prom_export(valDate date := null,
        valCompanyID varchar2 := null,
        row_records out sys_refcursor)
    is
    begin
        open row_records for
        select
            -- Thong tin dai ly
            p.info_company_name,
            --p.outlet_bvlife_id,
            substr(p.outlet_ams_id, 2) outlet_bvlife_id,
            p.outlet_ams_id,
            p.outlet_name,
            p.info_position_code,
            --lay ra no duoc thang tien hay ha bac hay duy tri o day
            --lay theo thu tu dung duoc cai nao thi se lay so lieu cho no la cai do
            case
                /*neu la dai ly binh thuong thi se lay ket qua cua dai ly binh thuong ra*/
                when p.agep_be_executing =  ams.AMS_REPO_PROMOTION.BE_EXECUTING_NO then
                    p.agep_asmt
                /*truong hop nao bi loi thi se cho no la duy tri cho no luon o day theo code o phai tren cua no*/
                when p.pump_be_executing = ams.AMS_REPO_PROMOTION.BE_EXECUTING_NO then
                    p.pump_asmt
                /*neu ma la truong nhom thi se neu ma no duoc thang tien roi thi se la thang tien con neu khong thi la duy tri hay ha bac cho no*/
                /*neu ma no duoc thang tien thi se lay ra ket qua thang tien cho truong nhom va thoat luon ra*/
                when p.umnp_be_executing = ams.AMS_REPO_PROMOTION.BE_EXECUTING_NO
                    and p.umnp_asmt = ams.AMS_REPO_PROMOTION.AMST_PROM then
                        ams.AMS_REPO_PROMOTION.AMST_PROM
                /*neu ma no chi duoc duy tri truong nhom thi se cho no la duy tri truong nhom*/
                when p.umnm_be_executing = ams.AMS_REPO_PROMOTION.BE_EXECUTING_NO
                    and p.umnm_asmt = ams.AMS_REPO_PROMOTION.AMST_MAIN then
                        ams.AMS_REPO_PROMOTION.AMST_MAIN
                /*neu truong nhom bi ha bac thi se xu ly cho no nhu sau*/
                when p.umnm_be_executing = ams.AMS_REPO_PROMOTION.BE_EXECUTING_NO
                    and p.umnm_asmt = ams.AMS_REPO_PROMOTION.AMST_DEPO then
                        ams.AMS_REPO_PROMOTION.AMST_DEPO
                /*xet duy tri cho truong ban*/
                when p.amnm_be_executing = ams.AMS_REPO_PROMOTION.BE_EXECUTING_NO then
                        p.amnm_asmt
            end promotion_result,

            --lay ra no duoc thang tien hay ha bac hay duy tri o day
            --lay theo thu tu dung duoc cai nao thi se lay so lieu cho no la cai do
            case
                /*neu la dai ly binh thuong thi se lay ket qua cua dai ly binh thuong ra*/
                when p.agep_be_executing = ams.AMS_REPO_PROMOTION.BE_EXECUTING_NO
                    and p.agep_asmt = ams.AMS_REPO_PROMOTION.AMST_PROM then
                    p.agep_effe_code
                /*neu ma khong thang tien hay ha bac thi van la cai cu*/
                when p.agep_be_executing = ams.AMS_REPO_PROMOTION.BE_EXECUTING_NO
                    and p.agep_asmt = ams.AMS_REPO_PROMOTION.AMST_MAIN then
                    p.info_position_code
                /*truong hop nao bi loi thi se cho no la duy tri cho no luon o day theo code o phai tren cua no*/
                when p.pump_be_executing = ams.AMS_REPO_PROMOTION.BE_EXECUTING_NO
                    /*neu ma no khong phai la duy tri thi thang tien hay ha bac thi lay so lieu ra cho no*/
                    and p.pump_asmt <> ams.AMS_REPO_PROMOTION.AMST_MAIN then
                    p.pump_effe_code
                /*neu ma khong thang tien hay ha bac thi van la cai cu*/
                when p.pump_be_executing = ams.AMS_REPO_PROMOTION.BE_EXECUTING_NO
                    /*neu ma no khong phai la duy tri thi thang tien hay ha bac thi lay so lieu ra cho no*/
                    and p.pump_asmt = ams.AMS_REPO_PROMOTION.AMST_MAIN then
                    p.info_position_code
                /*neu ma la truong nhom thi se neu ma no duoc thang tien roi thi se la thang tien con neu khong thi la duy tri hay ha bac cho no*/
                /*neu ma no duoc thang tien thi se lay ra ket qua thang tien cho truong nhom va thoat luon ra*/
                when p.umnp_be_executing = ams.AMS_REPO_PROMOTION.BE_EXECUTING_NO
                    and p.umnp_asmt <> ams.AMS_REPO_PROMOTION.AMST_MAIN then
                        p.umnp_effe_code
                /*neu ma khong thang tien hay ha bac thi van la cai cu*/
                when p.umnp_be_executing = ams.AMS_REPO_PROMOTION.BE_EXECUTING_NO
                    and p.umnp_asmt = ams.AMS_REPO_PROMOTION.AMST_MAIN then
                        p.info_position_code
                /*neu ma no chi duoc duy tri truong nhom thi se cho no la duy tri truong nhom*/
                when p.umnm_be_executing = ams.AMS_REPO_PROMOTION.BE_EXECUTING_NO
                    and p.umnm_asmt <> ams.AMS_REPO_PROMOTION.AMST_MAIN then
                        p.umnm_effe_code
                /*neu ma khong thang tien hay ha bac thi van la cai cu*/
                when p.umnm_be_executing = ams.AMS_REPO_PROMOTION.BE_EXECUTING_NO
                    and p.umnm_asmt = ams.AMS_REPO_PROMOTION.AMST_MAIN then
                        p.info_position_code
                /*neu khong duy tri duoc truong ban thi cho no la hang moi la hang gi*/
                when p.amnm_be_executing = ams.AMS_REPO_PROMOTION.BE_EXECUTING_NO
                    and p.amnm_asmt <> ams.AMS_REPO_PROMOTION.AMST_MAIN then
                        p.amnm_effe_code
                when p.amnm_be_executing = ams.AMS_REPO_PROMOTION.BE_EXECUTING_NO
                    and p.amnm_asmt = ams.AMS_REPO_PROMOTION.AMST_MAIN then
                        p.info_position_code
            end new_position_code
        from ams.la_promotion_mmxiii p
        where p.record_date = trunc(valDate, 'MM')
            and (
                p.info_company_id = valCompanyID
                or
                nvl(valCompanyID, 0) = 0
            )
        order by
            nlssort(p.info_company_name, 'nls_sort=Vietnamese'),
            nlssort(p.info_agency_name, 'nls_sort=Vietnamese'),
            nlssort(p.info_unit_name, 'nls_sort=Vietnamese') nulls first,
            nlssort(p.outlet_name, 'nls_sort=Vietnamese');
    end;

    procedure mmxiii_get_pupm01(valDate date := null,
        valCompanyID varchar2 := null,
        row_records out sys_refcursor)
    is
    begin
        open row_records for
          select /*+ CARDINALITY(res, 100)*/
            case
                when res.type_of_data = 0 then
                    rank() over (
                        partition by res.type_of_data
                        order by nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
                            nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
                            nlssort(res.info_unit_name, 'nls_sort=Vietnamese') nulls first,
                            nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
                            nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese')
                    )
                end noid,
            case
                when res.type_of_data = 0 then
                    res.info_company_name
                end info_company_name,
            case
                when res.type_of_data = 0 then
                    res.info_office_name
                end info_office_name,
            case
                when res.type_of_data = 0 then
                    res.info_agency_name
                end info_agency_name,
            case
                when res.type_of_data = 0 then
                    res.info_unit_name
                end info_unit_name,
            case
                when res.type_of_data = 0 then
                    res.outlet_ams_id
                end outlet_ams_id,
            case
                when res.type_of_data = 0 then
                    res.outlet_name
                end outlet_name,
            res.info_position_name,
            to_char(res.info_position_date, 'DD/MM/YYYY') info_position_date,
            to_char(res.info_effective_date, 'DD/MM/YYYY') info_effective_date,
            to_char(res.info_terminative_date, 'DD/MM/YYYY') info_terminative_date,
            res.pump_outlet_ams_id,
            res.pump_outlet_name,
            to_char(res.pump_effective_date, 'DD/MM/YYYY') pump_effective_date,
            to_char(res.pump_terminative_date, 'DD/MM/YYYY') pump_terminative_date,
            to_char(res.pump_data_date, 'DD/MM/YYYY') pump_data_date,
            res.pump_numb_asmt,
            res.pump_period_fyp,
            res.pump_period_empl,
            case
                when res.type_of_data = 0 then
                    AMS_MODL_PROM_MMXIII_REPORT.DATA_GENR
                else AMS_MODL_PROM_MMXIII_REPORT.DATA_DETL
            end type_of_data
        from
        (
            select /*+ CARDINALITY(outl, 100) CARDINALITY(posi, 100)*/
                outl.outlet_ams_id,
                outl.outlet_name,
                outl.info_company_ams_id,
                outl.info_company_name,
                outl.info_office_name,
                outl.info_agency_ams_id,
                outl.info_agency_name,
                outl.info_unit_ams_id,
                outl.info_unit_name,
                posi.position_name info_position_name,
                outl.info_position_date,
                outl.info_effective_date,
                outl.info_terminative_date,
                outl.pump_outlet_ams_id,
                outl.pump_outlet_name,
                outl.pump_effective_date,
                outl.pump_terminative_date,
                outl.pump_data_date,
                outl.pump_numb_asmt,
                outl.pump_period_fyp,
                outl.pump_period_empl,
                0 type_of_data
            from
            (
                select /*+ CARDINALITY(comp, 100)*/
                    comp.outlet_ams_id,
                    comp.outlet_name,
                    comp.info_company_ams_id,
                    comp.info_company_name,
                    comp.info_office_name,
                    comp.info_agency_ams_id,
                    comp.info_agency_name,
                    comp.info_unit_ams_id,
                    comp.info_unit_name,
                    comp.info_effective_date,
                    comp.info_terminative_date,
                    comp.info_position_code,
                    comp.info_position_date,
                    null pump_outlet_ams_id,
                    null pump_outlet_name,
                    null pump_effective_date,
                    null pump_terminative_date,
                    comp.record_date pump_data_date,
                    comp.pump_numb_asmt,
                    comp.pump_period_fyp,
                    comp.pump_period_empl
                from ams.la_promotion_mmxiii comp
                where comp.record_date = trunc(valDate, 'MM')
                    and comp.pump_be_executing = AMS_MODL_PROM_MMXIII_REPORT.BE_EXECUTING_NO
                    and comp.pump_be_paid = AMS_MODL_PROM_MMXIII_REPORT.BE_PAID_YES
                    and
                    (
                        comp.info_company_id = nvl(valCompanyID, 0)
                        or
                        nvl(valCompanyID, 0) = 0
                    )
              ) outl
              left join
              (
                  select code.code_code position_code,
                      code.code_value position_name
                  from ams.cla_codes code
                  where code.code_language = AMS_MODL_PROM_MMXIII_REPORT.THEME_LANGUAGE
                      and code.code_group = AMS_MODL_PROM_MMXIII_REPORT.OUTLET_INFO_TYPE_POSI
                      and trunc(valDate, 'MM')
                          between nvl(code.from_date, AMS_MODL_PROM_MMXIII_REPORT.DATE_MIN_VALUE)
                          and nvl(code.to_date, AMS_MODL_PROM_MMXIII_REPORT.DATE_MAX_VALUE)
              ) posi
                  on posi.position_code = outl.info_position_code

              union all

              select /*+ CARDINALITY(outl, 100) CARDINALITY(pupm, 100)*/
                  outl.outlet_ams_id,
                  outl.outlet_name,
                  outl.info_company_ams_id,
                  outl.info_company_name,
                  outl.info_office_name,
                  outl.info_agency_ams_id,
                  outl.info_agency_name,
                  outl.info_unit_ams_id,
                  outl.info_unit_name,
                  null info_effective_date,
                  null info_terminative_date,
                  null info_position_code,
                  null info_position_date,
                  pupm.outlet_ams_id pump_outlet_ams_id,
                  pupm.outlet_name pump_outlet_name,
                  case
                      when pupm.pump_be_paid = AMS_MODL_PROM_MMXIII_REPORT.BE_PAID_YES then
                          pupm.effective_date
                      end pump_effective_date,
                  case
                      when pupm.pump_be_paid = AMS_MODL_PROM_MMXIII_REPORT.BE_PAID_YES then
                          pupm.terminative_date
                      end pump_terminative_date,
                  pupm.pump_data_date,
                  null pump_numb_asmt,
                  pupm.pump_period_fyp,
                  case
                      when pupm.pump_be_paid = AMS_MODL_PROM_MMXIII_REPORT.BE_PAID_YES then
                          pupm.pump_period_empl
                      end pump_period_empl,
                  case
                      when pupm.pump_be_paid = AMS_MODL_PROM_MMXIII_REPORT.BE_PAID_YES then
                          1
                      when  pupm.pump_be_paid = AMS_MODL_PROM_MMXIII_REPORT.BE_PAID_DTL  then
                          2
                      end type_of_data
              from
              (
                  select /*+ CARDINALITY(comp, 100)*/
                      comp.outlet_ams_id,
                      comp.outlet_name,
                      comp.info_company_ams_id,
                      comp.info_company_name,
                      comp.info_office_name,
                      comp.info_agency_ams_id,
                      comp.info_agency_name,
                      comp.info_unit_ams_id,
                      comp.info_unit_name
                  from ams.la_promotion_mmxiii comp
                  where comp.record_date = trunc(valDate, 'MM')
                      and
                      (
                          comp.info_company_id = nvl(valCompanyID, 0)
                          or
                          nvl(valCompanyID, 0) = 0
                      )
              ) outl
              join
              (
                  select /*+ CARDINALITY(tmp, 100)*/
                      tmp.outlet_ams_id,
                      tmp.outlet_name,
                      tmp.pump_be_paid,
                      tmp.effective_date,
                      tmp.terminative_date,
                      tmp.pump_outlet_ams_id,
                      tmp.pump_data_date,
                      tmp.pump_numb_asmt,
                      tmp.pump_period_fyp,
                      tmp.pump_period_empl
                  from ams.la_prom_mmxiii_pump tmp
                  where tmp.record_date = trunc(valDate, 'MM')
                      and tmp.pump_be_paid in
                      (
                          AMS_MODL_PROM_MMXIII_REPORT.BE_PAID_YES
                      )
                      and tmp.outlet_ams_id <> tmp.pump_outlet_ams_id --khong liet ke thang truong nhom day ra
              ) pupm
                  on pupm.pump_outlet_ams_id = outl.outlet_ams_id
        ) res
        order by nlssort(res.info_company_name, 'nls_sort=Vietnamese'),
            nlssort(res.info_agency_name, 'nls_sort=Vietnamese') nulls first,
            nlssort(res.info_unit_name, 'nls_sort=Vietnamese') nulls first,
            nlssort(res.outlet_name, 'nls_sort=Vietnamese'),
            nlssort(res.outlet_ams_id, 'nls_sort=Vietnamese'),
            res.type_of_data,
            res.pump_effective_date;
    end;

end AMS_MODL_PROM_MMXIII_REPORT;
/
