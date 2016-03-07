create or replace package EP_EMULATE is
   procedure get_catalog_by_code(
        pr_catalog_code varchar2,
        row_records out sys_refcursor);
   procedure get_catalog_by_code_limit(
        pr_catalog_code varchar2,
        pr_qty number,
        row_records out sys_refcursor);
    procedure get_company(
        row_records out sys_refcursor);
   procedure get_company_by_code(
        pr_branch_code varchar2,
        row_records out sys_refcursor);
   procedure get_company_ams_id_by_code(
        pr_branch_code varchar2,
        row_records out sys_refcursor);
    procedure get_target_company_by_program(
         prProgramId number := null,
         row_records in out sys_refcursor);
    procedure get_target_company_by_pro_cac(
         prProgramId number := null,
         row_records in out sys_refcursor) ;
    procedure get_cac_company_by_program(
         prProgramId number := null,
         row_records in out sys_refcursor) ;
    procedure get_emulate_type(
         row_records in out sys_refcursor);
    procedure get_emulate_type_by_program(
         prProgramId number := null,
         row_records in out sys_refcursor);
    procedure get_period_type(
         row_records in out sys_refcursor);
    procedure get_outlet_type(
         row_records in out sys_refcursor);
    procedure get_outlet_type_by_program(
         prProgramId number := null,
         prType number := null,
         row_records in out sys_refcursor);
  procedure get_program(
       prMonth varchar2 := null,
       prYear varchar2 := null,
       prCompanyArr varchar2 := null,
       prDocNo varchar2 := null,
       prDocNoLike number := null,
       prEmulateTypeArr varchar2 := null,
       prPeriodType varchar2 := null,
       prEmulateObjectArr varchar2 := null,
       prStatus varchar2 := null,
       prLocationCode varchar2 := null,
       prAllCompany number := null,
       row_records in out sys_refcursor);
  procedure get_program_first_time(
       prLocationCode varchar2 := null,
       row_records in out sys_refcursor);
  procedure get_program_cac_first_time(
       row_records in out sys_refcursor);
  procedure get_program_by_id(
       prProgramId number := null,
       row_records in out sys_refcursor);
  procedure get_program_by_tsc(
       row_records in out sys_refcursor);
  procedure get_program_by_company_ams_id(
       pr_company_ams_id varchar2 := null,
       pr_year varchar2 := null,
       row_records in out sys_refcursor);
  procedure get_check_doc_no(
       prReturnValue  in out number,
       pr_program_name varchar2 := null,
       pr_doc_no varchar2 := null,
       pr_program_id number := null
       );
  procedure get_cost_by_program_id(
       prProgramId number := null,
       prType number := null,
       pr_company_ams_id varchar2 := null,
       row_records in out sys_refcursor);
  procedure get_validate_program_id(
       prReturnValue  in out number,
       pr_program_id number ,
       pr_company_ams_id varchar2,
       pr_from_date  date,
       pr_to_date  date
       );
  procedure get_program_by_company_combo(
       pr_company_ams_id varchar2 := null,
       pr_year varchar2 := null,
       row_records in out sys_refcursor);
  procedure get_qty_by_program_id(
       prReturnValue  in out number,
       pr_program_cost_id number := null,
       pr_program_id number := null,
       pr_type number := null,
       pr_emule_type_id number := null,
       pr_company_ams_id varchar2 := null
       );
  procedure get_qty_cost_by_year(
       prReturnValue  in out number,
       pr_program_cost_id number := null,
       pr_type number := null,
       pr_emule_type_id number := null,
       pr_company_ams_id varchar2 := null,
       pr_record_date  varchar2
       );
  procedure get_cost_by_cost_id(
       pr_program_cost_id number := null,
       row_records in out sys_refcursor);
  --lay du tinh cua thi dua theo nam va du tinh vao dau nam
    procedure get_all_cost_by_year(
       pr_year varchar2 := null,
       pr_company_arr varchar2 := null,
       pr_emulate_type_arr varchar2 := null,
       pr_type number := null,
       row_records in out sys_refcursor);
    procedure get_all_cost_by_year_for_lan(
       pr_year varchar2 := null,
       pr_company_arr varchar2 := null,
       pr_type number := null,
       row_records in out sys_refcursor);       
  procedure get_file_by_program_id(
       prProgramId number := null,
       row_records in out sys_refcursor);
  procedure get_file_by_file_id(
       pr_attach_id number := null,
       row_records in out sys_refcursor);
  --lay cac poster len cho no
  procedure get_poster_all(
       pr_type number := null,
       row_records in out sys_refcursor);
  procedure get_banner(
       pr_type number := null,
       pr_program_id number := null,
       row_records in out sys_refcursor);
  procedure get_qty_valid_poster(
       prReturnValue  in out number);
  --kiem tra xem la co bao nhieu loai la loai 1 de lam cho no dung
  procedure get_qty_type_1(
       prReturnValue  in out number,
       pr_file_attach_arr varchar2 := null);
  procedure get_company_account_id(
      pr_company_ams_id  varchar2,
      row_records in out sys_refcursor);       
  procedure get_program_result(
      pr_program_id number,
      pr_company_ams_id  varchar2,
       row_records in out sys_refcursor);
  procedure get_program_result_byid(
       pr_program_result_id number,
       row_records in out sys_refcursor);
  procedure get_program_plan(
       pr_year varchar2 := null,
       pr_company_ams_id  varchar2,
       row_records in out sys_refcursor);
   procedure get_permission_by_menu(
        pv_menu_code varchar2,
        row_records out sys_refcursor);
   function get_sequence_id return number;
end EP_EMULATE;
/
create or replace package body EP_EMULATE is

   procedure get_catalog_by_code(
        pr_catalog_code varchar2,
        row_records out sys_refcursor)
    is
    begin
        open row_records for
        select  /*+ CARDINALITY(a, 10) */
            a.dmco_value catalog_id,
            a.dmco_desc catalog_desc
        from ams.ep_dm_code a
        where upper(a.dmco_code) = upper(pr_catalog_code)
        order by a.dmco_value;
    end;

   procedure get_catalog_by_code_limit(
        pr_catalog_code varchar2,
        pr_qty number,
        row_records out sys_refcursor)
    is
    begin
        open row_records for
        select /*+ CARDINALITY(res, 10) */
            res.catalog_id,
            res.catalog_desc
        from
        (
            select  /*+ CARDINALITY(a, 10) */
                row_number() over (order by a.dmco_value)  num,
                a.dmco_value catalog_id,
                a.dmco_desc catalog_desc
            from ams.ep_dm_code a
            where upper(a.dmco_code) = upper(pr_catalog_code)
        ) res
        where res.num <= pr_qty
        order by res.catalog_id;
    end;

    procedure get_company(
        row_records out sys_refcursor)
    is
       var_record_date date := add_months(trunc(sysdate, 'MM'), -1);
    begin
        begin
            select /*+ result_cache */
                max(a.record_date)
                into var_record_date
            from ams.dbw_outl_informations a
            where a.outlet_type = 'CTTV'
            and a.dbw_code = 'MAIN'
            and a.dbw_time = 'MONT';
        exception
         when others then
             var_record_date := add_months(trunc(sysdate, 'MM'), -1);
        end;

        open row_records for
        select /*+ CARDINALITY(res, 10) */
            res.*
        from
        (
            select /*+ CARDINALITY(a, 10) */
                a.outlet_ams_id branch_ams_id,
                replace(a.outlet_name, 'Bảo Việt Nhân Thọ', 'BVNT') branch_name,
                --substr(a.outlet_ams_id, 4, 5)  branch_code,
                1 ord
            from ams.dbw_outl_informations a
            where a.outlet_type = 'CTTV'
                and a.dbw_code = 'MAIN'
                and a.dbw_time = 'MONT'
                and a.record_date = var_record_date
/*            union all
            select  \*+ result_cache *\
                a.dmco_value branch_ams_id,
                a.dmco_desc branch_name,
                --'00000'  branch_code,
                0 ord
            from ams.ep_dm_code a
            where a.dmco_code = 'TSC_BVNT' --doi tuong thi dua*/
        ) res
        order by res.ord,
        nlssort(res.branch_name, 'nls_sort=Vietnamese');
   end;

   procedure get_company_by_code(
        pr_branch_code varchar2,
        row_records out sys_refcursor)
    is
       var_record_date date := add_months(trunc(sysdate, 'MM'), -1);
    begin
        begin
            select /*+ result_cache */
                max(a.record_date)
                into var_record_date
            from ams.dbw_outl_informations a
            where a.outlet_type = 'CTTV'
            and a.dbw_code = 'MAIN'
            and a.dbw_time = 'MONT';
        exception
         when others then
             var_record_date := add_months(trunc(sysdate, 'MM'), -1);
        end;

        open row_records for
        select  /*+ CARDINALITY(res, 10) */
            res.*
        from
        (
            select /*+ CARDINALITY(a, 10) */
                a.outlet_ams_id branch_ams_id,
                replace(a.outlet_name, 'Bảo Việt Nhân Thọ', 'BVNT') branch_name,
                --substr(a.outlet_ams_id, 4, 5)  branch_code,
                1 ord
            from ams.dbw_outl_informations a
            where a.outlet_type = 'CTTV'
                and a.dbw_code = 'MAIN'
                and a.dbw_time = 'MONT'
                and a.record_date = var_record_date
                and substr(a.outlet_ams_id, 4, 5) = pr_branch_code
            /*union all
            select \*+ result_cache *\
                'T100000007' branch_ams_id,
                'Tổng Công ty Bảo Việt Nhân thọ - Phòng HTĐL' branch_name,
                --'00000'  branch_code,
                0 ord
            from dual*/
        ) res
        order by res.ord,
        nlssort(res.branch_name, 'nls_sort=Vietnamese');
    end;


   procedure get_company_ams_id_by_code(
        pr_branch_code varchar2,
        row_records out sys_refcursor)
    is
       var_record_date date := add_months(trunc(sysdate, 'MM'), -1);
    begin
        begin
            select /*+ CARDINALITY(a, 10) */
                max(a.record_date)
                into var_record_date
            from ams.dbw_outl_informations a
            where a.outlet_type = 'CTTV'
            and a.dbw_code = 'MAIN'
            and a.dbw_time = 'MONT';
        exception
         when others then
             var_record_date := add_months(trunc(sysdate, 'MM'), -1);
        end;

        open row_records for
        select  /*+ CARDINALITY(res, 10) */
            res.*
        from
        (
            select /*+ CARDINALITY(a, 10) */
                a.outlet_ams_id branch_ams_id,
                a.outlet_name branch_name,
                2 type,
                --substr(a.outlet_ams_id, 4, 5)  branch_code,
                1 ord
            from ams.dbw_outl_informations a
            where a.outlet_type = 'CTTV'
                and a.dbw_code = 'MAIN'
                and a.dbw_time = 'MONT'
                and a.record_date = var_record_date
                and substr(a.outlet_ams_id, 4, 5) = pr_branch_code
            union all
            select
                'T100000007' branch_ams_id,
                'Tổng Công ty Bảo Việt Nhân thọ - Phòng HTĐL' branch_name,
                --'00000'  branch_code,
                1 type,
                0 ord
            from dual
            where '00000'  = pr_branch_code
        ) res
        order by res.ord,
        nlssort(res.branch_name, 'nls_sort=Vietnamese');
    end;

    --lay danh sach cong ty tham du theo chuong trinh thi dua
    procedure get_target_company_by_program(
         prProgramId number := null,
         row_records in out sys_refcursor)
    as
    begin
        open row_records for
         select  /*+ CARDINALITY(a, 10) */
             a.prco_company_ams_id
         from ams.ep_program_company a
         where a.prco_program_id = prProgramId
         group by
            a.prco_company_ams_id
        order by a.prco_company_ams_id;
    end;

    --lay danh sach cong ty tham du theo chuong trinh thi dua
    procedure get_target_company_by_pro_cac(
         prProgramId number := null,
         row_records in out sys_refcursor)
    as
       var_record_date date := add_months(trunc(sysdate, 'MM'), -1);
    begin
        begin
            select /*+ CARDINALITY(a, 10) */
                max(a.record_date)
                into var_record_date
            from ams.dbw_outl_informations a
            where a.outlet_type = 'CTTV'
            and a.dbw_code = 'MAIN'
            and a.dbw_time = 'MONT';
        exception
         when others then
             var_record_date := add_months(trunc(sysdate, 'MM'), -1);
        end;

        open row_records for
        select /*+ CARDINALITY(res, 10) */
            res.*
        from
        (
             select  /*+ CARDINALITY(a, 10) */
                 a.prco_company_ams_id company_ams_id
             from ams.ep_program_company a
             where a.prco_program_id = prProgramId
             group by
                a.prco_company_ams_id
        ) pro
        join
        (
            select /*+ CARDINALITY(a, 10) */
                a.outlet_ams_id branch_ams_id,
                replace(a.outlet_name, 'Bảo Việt Nhân Thọ', 'BVNT') branch_name,
                1 ord
            from ams.dbw_outl_informations a
            where a.outlet_type = 'CTTV'
                and a.dbw_code = 'MAIN'
                and a.dbw_time = 'MONT'
                and a.record_date = var_record_date
        ) res
           on res.branch_ams_id = pro.company_ams_id
        order by nlssort(res.branch_name, 'nls_sort=Vietnamese');
    end;

    --lay danh sach cong ty da duoc thuc thi
    procedure get_cac_company_by_program(
         prProgramId number := null,
         row_records in out sys_refcursor)
    as
    begin
        open row_records for
         select  /*+ CARDINALITY(a, 10) */
             a.prcp_company_ams_id company_ams_id
         from ams.ep_program_company_payment a
         where a.prcp_program_id = prProgramId
         group by
            a.prcp_company_ams_id
        order by a.prcp_company_ams_id;
    end;

    procedure get_emulate_type(
         row_records in out sys_refcursor)
    as
    begin
        open row_records for
        select /*+ result_cache */
            emty_type_id,
            emty_type_name
        from ep_dm_emule_type a
        order by a.emty_type_order;
    end;

    procedure get_emulate_type_by_program(
         prProgramId number := null,
         row_records in out sys_refcursor)
    as
    begin
        open row_records for
        select /*+ CARDINALITY(typ, 10) */
            typ.emty_type_id,
            typ.emty_type_name,
            typ.emty_type_order
         from
         (
             select  /*+ CARDINALITY(a, 10) */
                 a.pret_emule_type_id
             from ams.ep_program_emule_type a
             where a.pret_program_id = prProgramId
             group by
                a.pret_emule_type_id
         )  pro
         left join
          (
              select  /*+ CARDINALITY(a, 10) */
                  a.emty_type_id,
                  a.emty_type_name,
                  a.emty_type_order
              from ep_dm_emule_type a
          ) typ
              on typ.emty_type_id = pro.pret_emule_type_id
          order by typ.emty_type_order;
    end;

    procedure get_period_type(
         row_records in out sys_refcursor)
    as
    begin
        open row_records for
        select /*+ result_cache */
            a.pety_period_type_id,
            a.pety_period_type_name
        from ep_dm_period_type a
        order by a.pety_period_type_id;
    end;

    procedure get_outlet_type(
         row_records in out sys_refcursor)
    as
    begin
        open row_records for
        select /*+ result_cache */
             a.*
        from ep_dm_outlet_type a
        order by a.outy_outlet_type_id;
    end;

    procedure get_outlet_type_by_program(
         prProgramId number := null,
         prType number := null,
         row_records in out sys_refcursor)
    as
    begin
        open row_records for
        select  /*+ CARDINALITY(typ, 10) */
            typ.outy_outlet_type_id,
            typ.outy_outlet_type_name,
            typ.outy_outlet_type_order
         from
         (
             select  /*+ CARDINALITY(a, 10) */
                 a.prot_outlet_type_id
             from ams.ep_program_outlet_type a
             where a.prot_program_id = prProgramId
                 and a.prot_type = prType
             group by
                a.prot_outlet_type_id
         )  pro
         left join
          (
              select  /*+ CARDINALITY(a, 10) */
                  a.outy_outlet_type_id,
                  a.outy_outlet_type_name,
                  a.outy_outlet_type_order
              from ep_dm_outlet_type a
          ) typ
              on typ.outy_outlet_type_id = pro.prot_outlet_type_id
          order by typ.outy_outlet_type_order;
    end;

  procedure get_program(
       prMonth varchar2 := null,
       prYear varchar2 := null,
       prCompanyArr varchar2 := null,
       prDocNo varchar2 := null,
       prDocNoLike number := null,
       prEmulateTypeArr varchar2 := null,
       prPeriodType varchar2 := null,
       prEmulateObjectArr varchar2 := null,
       prStatus varchar2 := null,
       prLocationCode varchar2 := null,
       prAllCompany number := null,
       row_records in out sys_refcursor)
  is
     var_record_date date := add_months(trunc(sysdate, 'MM'), -1);
  begin
      begin
          select /*+ CARDINALITY(a, 10) */
              max(a.record_date)
              into var_record_date
          from ams.dbw_outl_informations a
          where a.outlet_type = 'CTTV'
          and a.dbw_code = 'MAIN'
          and a.dbw_time = 'MONT';
      exception
       when others then
           var_record_date := add_months(trunc(sysdate, 'MM'), -1);
      end;
     if  (prLocationCode = '0') then
        --tong cong ty thi cho xem het
         open row_records for
         select /*+ CARDINALITY(res, 10) CARDINALITY(comp, 10) CARDINALITY(sta, 10)*/
              res.prog_program_id,
              res.prog_program_name,
              res.prog_doc_no,
              res.prog_doc_date,
              res.prog_emule_role,
              res.prog_status,
              sta.prog_status_name,
              comp.branch_name prog_company_name
         from
         (
             select  /*+ CARDINALITY(pro, 10)  CARDINALITY(typ, 10) CARDINALITY(oul, 10)*/
                pro.prog_program_id,
                pro.prog_program_name,
                pro.prog_doc_no,
                pro.prog_doc_date,
                pro.prog_status,
                pro.prog_emule_role,
                pro.prog_company_ams_id
             from
             (
                 select  /*+ CARDINALITY(a, 10)*/
                    a.*
                 from ams.ep_program a
                 where nvl(to_char(a.prog_record_date, 'MM'), '%') like nvl(prMonth, '%')
                     and nvl(to_char(a.prog_record_date, 'YYYY'), '%') like nvl(prYear, '%')
                     --cong ty tham gia bat buoc phai co neu khong thi khong the dung duoc
                     and
                     (    --chon tat de xem tat cho nhanh
                         nvl(prAllCompany, 9) = 0
                         or
                         ( --chi chon o 1 vao cong ty da co truoc
                             nvl(prAllCompany, 9) <> 0
                             and
                             a.prog_company_ams_id in
                                     (select * from table(ams_core_common.f_split_to_varchar(prCompanyArr)))
                         )
                    )
                    and --so cong van
                     (
                         (
                             prDocNoLike is not null
                             and a.prog_doc_no like nvl(prDocNo, '%')
                         )
                         or
                         (
                            prDocNoLike is null
                            and  a.prog_doc_no like nvl(prDocNo, '%')
                         )
                     )
                      and  --thoi gian thi dua
                     (
                         prPeriodType = 0
                         or
                         (
                             prPeriodType <> 0
                             and a.prog_emule_period_id = prPeriodType
                         )
                     )
                     --trang thai
                     and  a.prog_status in
                             (select * from table(ams_core_common.f_split_to_number(prStatus)))
             ) pro
             join
             (
                 select  /*+ CARDINALITY(a, 10) */
                     a.pret_program_id
                 from ams.ep_program_emule_type a
                 where a.pret_emule_type_id in--loai thi dua
                 (select * from table(ams_core_common.f_split_to_number(prEmulateTypeArr)))
                 group by
                    a.pret_program_id
             )  typ
                 on typ.pret_program_id = pro.prog_program_id
             join
             (
                 select   /*+ CARDINALITY(a, 10) */
                     a.prot_program_id
                 from ams.ep_program_outlet_type a
                 where a.prot_type = 1 --doi tuong thi dua
                 and a.prot_outlet_type_id in
                 (select * from table(ams_core_common.f_split_to_number(prEmulateObjectArr)))
                 group by
                    a.prot_program_id
             )  oul
                 on oul.prot_program_id  = pro.prog_program_id
             group by
                pro.prog_program_id,
                pro.prog_program_name,
                pro.prog_doc_no,
                pro.prog_doc_date,
                pro.prog_status,
                pro.prog_company_ams_id,
                pro.prog_emule_role
         ) res
         left join
         (
              select  /*+ CARDINALITY(a, 10) */
                  a.outlet_ams_id branch_ams_id,
                  a.outlet_name branch_name
              from ams.dbw_outl_informations a
              where a.outlet_type = 'CTTV'
                  and a.dbw_code = 'MAIN'
                  and a.dbw_time = 'MONT'
                  and a.record_date = var_record_date
              union all
              select
                  a.dmco_value branch_ams_id,
                  a.dmco_desc branch_name
              from ams.ep_dm_code a
              where a.dmco_code = 'TSC_BVNT' --doi tuong thi dua
          ) comp
             on comp.branch_ams_id  = res.prog_company_ams_id
         left join
         (
             select   /*+ CARDINALITY(a, 10) */
                 to_number(a.dmco_value) prog_status,
                 a.dmco_desc prog_status_name
             from ams.ep_dm_code a
             where a.dmco_code = 'PRO_STATUS' --doi tuong thi dua
         )  sta
             on sta.prog_status  = res.prog_status
          order by
              res.prog_program_id desc,
              res.prog_doc_date desc,
              nlssort(res.prog_program_name, 'nls_sort=Vietnamese') nulls first;
      else
         --cong ty thanh vien vao thi chi cho xem cua cong ty do thoi
         open row_records for
         select /*+ CARDINALITY(res, 10) CARDINALITY(comp, 10) CARDINALITY(sta, 10)*/
              res.prog_program_id,
              res.prog_program_name,
              res.prog_doc_no,
              res.prog_doc_date,
              res.prog_emule_role,
              res.prog_status,
              sta.prog_status_name,
              comp.branch_name prog_company_name
         from
         (
             select  /*+ CARDINALITY(pro, 10)  CARDINALITY(typ, 10) CARDINALITY(oul, 10)*/
                pro.prog_program_id,
                pro.prog_program_name,
                pro.prog_doc_no,
                pro.prog_doc_date,
                pro.prog_status,
                pro.prog_emule_role,
                pro.prog_company_ams_id
             from
             (
                 select    /*+ CARDINALITY(a, 10)*/
                    a.*
                 from ams.ep_program a
                 where nvl(to_char(a.prog_record_date, 'MM'), '%') like nvl(prMonth, '%')
                     and nvl(to_char(a.prog_record_date, 'YYYY'), '%') like nvl(prYear, '%')
                     --cong ty tham gia bat buoc phai co neu khong thi khong the dung duoc
                     and  a.prog_company_ams_id in
                             (select * from table(ams_core_common.f_split_to_varchar(prCompanyArr)))
                    and --so cong van
                     (
                         (
                             prDocNoLike is not null
                             and a.prog_doc_no like nvl(prDocNo, '%')
                         )
                         or
                         (
                            prDocNoLike is null
                            and  a.prog_doc_no like nvl(prDocNo, '%')
                         )
                     )
                      and  --thoi gian thi dua
                     (
                         prPeriodType = 0
                         or
                         (
                             prPeriodType <> 0
                             and a.prog_emule_period_id = prPeriodType
                         )
                     )
                     --trang thai
                     and  a.prog_status in
                             (select * from table(ams_core_common.f_split_to_number(prStatus)))
             ) pro
             join--chi co cac cong ty duoc quyen vao thi moi vao duoc thoi, duoc phan vao day thi moi duoc vao thoi
             (
                 select  /*+ CARDINALITY(a, 10) */
                     a.prco_program_id
                 from ams.ep_program_company a
                 where a.prco_company_ams_id = prLocationCode
                 group by
                    a.prco_program_id
             )  comp
                 on comp.prco_program_id = pro.prog_program_id
             join
             (
                 select  /*+ CARDINALITY(a, 10) */
                     a.pret_program_id
                 from ams.ep_program_emule_type a
                 where a.pret_emule_type_id in--loai thi dua
                 (select * from table(ams_core_common.f_split_to_number(prEmulateTypeArr)))
                 group by
                    a.pret_program_id
             )  typ
                 on typ.pret_program_id = pro.prog_program_id
             join
             (
                 select   /*+ CARDINALITY(a, 10) */
                     a.prot_program_id
                 from ams.ep_program_outlet_type a
                 where a.prot_type = 1 --doi tuong thi dua
                 and a.prot_outlet_type_id in
                 (select * from table(ams_core_common.f_split_to_number(prEmulateObjectArr)))
                 group by
                    a.prot_program_id
             )  oul
                 on oul.prot_program_id  = pro.prog_program_id
             group by
                pro.prog_program_id,
                pro.prog_program_name,
                pro.prog_doc_no,
                pro.prog_doc_date,
                pro.prog_status,
                pro.prog_company_ams_id,
                pro.prog_emule_role
         ) res
         left join
         (
              select  /*+ CARDINALITY(a, 10) */
                  a.outlet_ams_id branch_ams_id,
                  a.outlet_name branch_name
              from ams.dbw_outl_informations a
              where a.outlet_type = 'CTTV'
                  and a.dbw_code = 'MAIN'
                  and a.dbw_time = 'MONT'
                  and a.record_date = var_record_date
              union all
              select /*+ CARDINALITY(a, 10) */
                  a.dmco_value branch_ams_id,
                  a.dmco_desc branch_name
              from ams.ep_dm_code a
              where a.dmco_code = 'TSC_BVNT' --doi tuong thi dua
          ) comp
             on comp.branch_ams_id  = res.prog_company_ams_id
         left join
         (
             select   /*+ CARDINALITY(a, 10) */
                 to_number(a.dmco_value) prog_status,
                 a.dmco_desc prog_status_name
             from ams.ep_dm_code a
             where a.dmco_code = 'PRO_STATUS' --trang thai
         )  sta
             on sta.prog_status  = res.prog_status
          order by
              res.prog_program_id desc,
              res.prog_doc_date desc,
              nlssort(res.prog_program_name, 'nls_sort=Vietnamese') nulls first;
      end if;
  end;
  procedure get_program_first_time(
       prLocationCode varchar2 := null,
       row_records in out sys_refcursor)
  is
     var_record_date date := add_months(trunc(sysdate, 'MM'), -1);
  begin
      begin
          select /*+ CARDINALITY(a, 10) */
              max(a.record_date)
              into var_record_date
          from ams.dbw_outl_informations a
          where a.outlet_type = 'CTTV'
          and a.dbw_code = 'MAIN'
          and a.dbw_time = 'MONT';
      exception
       when others then
           var_record_date := add_months(trunc(sysdate, 'MM'), -1);
       end;

     --neu la account cua tong cong ty thi se nhu sau
     if  (nvl(prLocationCode, '0') = '0') then
         open row_records for
         select   /*+ CARDINALITY(res, 10) CARDINALITY(sta, 10)*/
              res.prog_program_id,
              res.prog_program_name,
              res.prog_doc_no,
              res.prog_doc_date,
              res.prog_emule_role,
              res.prog_status,
              sta.prog_status_name,
              res.branch_name prog_company_name
         from
         (
             select   /*+ CARDINALITY(rp, 10)*/
                  rp.prog_program_id,
                  rp.prog_program_name,
                  rp.prog_doc_no,
                  rp.prog_doc_date,
                  rp.prog_status,
                  rp.prog_emule_role,
                  rp.branch_name
             from
             (
                 select  /*+ CARDINALITY(repo, 10)*/
                      row_number() over (order by prog_program_id desc) r,
                      repo.prog_program_id,
                      repo.prog_program_name,
                      repo.prog_doc_no,
                      repo.prog_doc_date,
                      repo.prog_status,
                      repo.prog_emule_role,
                      repo.branch_name
                 from
                 (
                     select  /*+ CARDINALITY(comp, 10) CARDINALITY(pro, 10)*/
                        pro.prog_program_id,
                        pro.prog_program_name,
                        pro.prog_doc_no,
                        pro.prog_doc_date,
                        pro.prog_status,
                        pro.prog_emule_role,
                        comp.branch_name
                     from
                     (
                          select   /*+ CARDINALITY(a, 10)*/
                              a.dmco_value branch_ams_id,
                              a.dmco_desc branch_name
                          from ams.ep_dm_code a
                          where a.dmco_code = 'TSC_BVNT' --doi tuong thi dua
                      ) comp
                      join
                     (
                         select    /*+ CARDINALITY(a, 10)*/
                            a.*
                         from ams.ep_program a
                     ) pro
                         on pro.prog_company_ams_id = comp.branch_ams_id
                     group by
                        pro.prog_program_id,
                        pro.prog_program_name,
                        pro.prog_doc_no,
                        pro.prog_doc_date,
                        pro.prog_status,
                        pro.prog_emule_role,
                        comp.branch_name
                 ) repo
             ) rp
             where r <= 10
         ) res
         left join
         (
             select    /*+ CARDINALITY(a, 10)*/
                 to_number(a.dmco_value) prog_status,
                 a.dmco_desc prog_status_name
             from ams.ep_dm_code a
             where a.dmco_code = 'PRO_STATUS' --doi tuong thi dua
         )  sta
             on sta.prog_status  = res.prog_status
          order by
              res.prog_program_id desc;
      else
         open row_records for
         select   /*+ CARDINALITY(res, 10) CARDINALITY(sta, 10)*/
              res.prog_program_id,
              res.prog_program_name,
              res.prog_doc_no,
              res.prog_doc_date,
              res.prog_emule_role,
              res.prog_status,
              sta.prog_status_name,
              res.branch_name prog_company_name
         from
         (
             select   /*+ CARDINALITY(rp, 10)*/
                  rp.prog_program_id,
                  rp.prog_program_name,
                  rp.prog_doc_no,
                  rp.prog_doc_date,
                  rp.prog_status,
                  rp.prog_emule_role,
                  rp.branch_name
             from
             (
                 select  /*+ CARDINALITY(repo, 10)*/
                      row_number() over (order by prog_program_id desc) r,
                      repo.prog_program_id,
                      repo.prog_program_name,
                      repo.prog_doc_no,
                      repo.prog_doc_date,
                      repo.prog_status,
                      repo.prog_emule_role,
                      repo.branch_name
                 from
                 (
                     select  /*+ CARDINALITY(comp, 10) CARDINALITY(pro, 10)*/
                        pro.prog_program_id,
                        pro.prog_program_name,
                        pro.prog_doc_no,
                        pro.prog_doc_date,
                        pro.prog_status,
                        pro.prog_emule_role,
                        comp.branch_name
                     from
                     (
                          select   /*+ CARDINALITY(a, 10)*/
                              a.dmco_value branch_ams_id,
                              a.dmco_desc branch_name
                          from ams.ep_dm_code a
                          where a.dmco_code = 'TSC_BVNT' --doi tuong thi dua
                      ) comp
                      join
                     (
                         select    /*+ CARDINALITY(a, 10)*/
                            a.*
                         from ams.ep_program a
                     ) pro
                         on pro.prog_company_ams_id = comp.branch_ams_id
                     join--chi co cac cong ty duoc quyen vao thi moi vao duoc thoi, duoc phan vao day thi moi duoc vao thoi
                     (
                         select  /*+ CARDINALITY(a, 10) */
                             a.prco_program_id
                         from ams.ep_program_company a
                         where a.prco_company_ams_id = prLocationCode
                         group by
                            a.prco_program_id
                     )  comp
                         on comp.prco_program_id = pro.prog_program_id
                     group by
                        pro.prog_program_id,
                        pro.prog_program_name,
                        pro.prog_doc_no,
                        pro.prog_doc_date,
                        pro.prog_status,
                        pro.prog_emule_role,
                        comp.branch_name
                 ) repo
             ) rp
             where r <= 10
         ) res
         left join
         (
             select    /*+ CARDINALITY(a, 10)*/
                 to_number(a.dmco_value) prog_status,
                 a.dmco_desc prog_status_name
             from ams.ep_dm_code a
             where a.dmco_code = 'PRO_STATUS' --doi tuong thi dua
         )  sta
             on sta.prog_status  = res.prog_status
          order by
              res.prog_program_id desc;
      end if;
  end;

  --lay 10 chuong trinh ma da chuyen ho so moi nhat cho phong  tckt
  procedure get_program_cac_first_time(
       row_records in out sys_refcursor)
  is
     var_record_date date := add_months(trunc(sysdate, 'MM'), -1);
  begin
      begin
          select /*+ CARDINALITY(a, 10) */
              max(a.record_date)
              into var_record_date
          from ams.dbw_outl_informations a
          where a.outlet_type = 'CTTV'
          and a.dbw_code = 'MAIN'
          and a.dbw_time = 'MONT';
      exception
       when others then
           var_record_date := add_months(trunc(sysdate, 'MM'), -1);
       end;
     open row_records for
     select   /*+ CARDINALITY(res, 10) CARDINALITY(sta, 10) CARDINALITY(comp, 10)*/
          res.prog_program_id,
          res.prog_program_name,
          res.prog_doc_no,
          res.prog_doc_date,
          res.prog_emule_role,
          res.prog_status,
          sta.prog_status_name,
          comp.branch_name prog_company_name
     from
     (
         select   /*+ CARDINALITY(rp, 10)*/
              rp.prog_program_id,
              rp.prog_program_name,
              rp.prog_doc_no,
              rp.prog_doc_date,
              rp.prog_status,
              rp.prog_emule_role,
              rp.company_ams_id
         from
         (
             select  /*+ CARDINALITY(repo, 10)*/
                  row_number() over (order by prog_program_id desc) r,
                  repo.prog_program_id,
                  repo.prog_program_name,
                  repo.prog_doc_no,
                  repo.prog_doc_date,
                  repo.prog_status,
                  repo.prog_emule_role,
                  repo.company_ams_id
             from
             (
                 select  /*+CARDINALITY(pro, 10)*/
                    pro.prog_program_id,
                    pro.prog_program_name,
                    pro.prog_doc_no,
                    pro.prog_doc_date,
                    pro.prog_status,
                    pro.prog_emule_role,
                    pro.prog_company_ams_id company_ams_id
                 from ams.ep_program pro
                 where pro.prog_status = 3 --da chuyen ho so
                 group by
                    pro.prog_program_id,
                    pro.prog_program_name,
                    pro.prog_doc_no,
                    pro.prog_doc_date,
                    pro.prog_status,
                    pro.prog_emule_role,
                    pro.prog_company_ams_id
             ) repo
         ) rp
         where r <= 10
     ) res
     left join
     (
         select    /*+ CARDINALITY(a, 10)*/
             to_number(a.dmco_value) prog_status,
             a.dmco_desc prog_status_name
         from ams.ep_dm_code a
         where a.dmco_code = 'PRO_STATUS' --doi tuong thi dua
     )  sta
         on sta.prog_status  = res.prog_status
     left join
     (
          select  /*+ CARDINALITY(a, 10) */
              a.outlet_ams_id branch_ams_id,
              a.outlet_name branch_name
          from ams.dbw_outl_informations a
          where a.outlet_type = 'CTTV'
              and a.dbw_code = 'MAIN'
              and a.dbw_time = 'MONT'
              and a.record_date = var_record_date
          union all
          select   /*+ CARDINALITY(a, 10) */
              a.dmco_value branch_ams_id,
              a.dmco_desc branch_name
          from ams.ep_dm_code a
          where a.dmco_code = 'TSC_BVNT' --doi tuong thi dua
      ) comp
         on comp.branch_ams_id  = res.company_ams_id
      order by
          res.prog_program_id desc;
  end;

  procedure get_program_by_id(
       prProgramId number := null,
       row_records in out sys_refcursor)
  is
  begin
       open row_records for
       select   /*+ CARDINALITY(a, 10)*/
          a.*,
          to_char(a.prog_record_date, 'YYYY_MM') record_date_string
       from ams.ep_program a
       where prog_program_id = prProgramId;
  end;

  procedure get_program_by_tsc(
       row_records in out sys_refcursor)
  is
  begin
     open row_records for
     select  /*+ CARDINALITY(pro, 10)*/
        pro.prog_program_id,
        pro.prog_program_name,
        pro.prog_program_name || '(' || pro.prog_doc_no || ' - ' || to_char(pro.prog_doc_date, 'DD/MM/YYYY') || ')' prog_program_desc
    from ams.ep_program pro
    where pro.prog_company_ams_id = 'T100000007'
    order by
        pro.prog_doc_date desc,
        nlssort(pro.prog_program_name, 'nls_sort=Vietnamese') nulls first;
  end;

  procedure get_program_by_company_ams_id(
       pr_company_ams_id varchar2 := null,
       pr_year varchar2 := null,
       row_records in out sys_refcursor)
  is
  begin
     open row_records for
     select  /*+ CARDINALITY(pro, 10)*/
        pro.prog_program_id,
        pro.prog_program_name || '(' || pro.prog_doc_no || ' - ' || to_char(pro.prog_doc_date, 'DD/MM/YYYY') || ')' prog_program_desc,
        pro.prog_program_name        /*,
        pro.prog_doc_no || ' (' || to_char(pro.prog_doc_date, 'DD/MM/YYYY') || ')' prog_desc
        pro.prog_doc_no,
        to_char(pro.prog_doc_date, 'DD/MM/YYYY') prog_doc_date*/
    from ams.ep_program pro
    where
       (
            pro.prog_company_ams_id = pr_company_ams_id
            or
            nvl(pr_company_ams_id, '0') = '0'
        )
        and nvl(to_char(pro.prog_record_date, 'YYYY'), '%') like nvl(pr_year, '%')
    order by
        pro.prog_doc_date desc,
        nlssort(pro.prog_program_name, 'nls_sort=Vietnamese') nulls first;
  end;

  procedure get_program_by_company_combo(
       pr_company_ams_id varchar2 := null,
       pr_year varchar2 := null,
       row_records in out sys_refcursor)
  is
  begin
     open row_records for
     select  /*+ CARDINALITY(pro, 10)*/
        pro.prog_program_id,
        pro.prog_program_name,
        pro.prog_doc_no || ' (' || to_char(pro.prog_doc_date, 'DD/MM/YYYY') || ')' prog_desc
    from ams.ep_program pro
    where pro.prog_company_ams_id = pr_company_ams_id
        and nvl(to_char(pro.prog_record_date, 'YYYY'), '%') like nvl(pr_year, '%')
    order by
        pro.prog_doc_date desc,
        nlssort(pro.prog_program_name, 'nls_sort=Vietnamese') nulls first;
  end;

  --Kiem tra neu ma khai bao khong nhap phan mem trong thang do thi se khong cho nhap thi dua 1 thang va duoi 1 thang
  procedure get_validate_program_id(
       prReturnValue  in out number,
       pr_program_id number ,
       pr_company_ams_id varchar2,
       pr_from_date  date,
       pr_to_date  date
       )
  is
      var_year date := trunc(pr_from_date, 'YYYY');
      var_from_month number(4) := 1;
      var_to_month number(4) := 1;
      var_qty number(4) := 0;
      var_company_ams_id varchar2(64) := pr_company_ams_id;
      var_month_across number(4) := 0;
  begin
      prReturnValue := 0;
      --neu ma them moi thi lay luon cty dau vao
      if nvl(pr_program_id, -1) = -1 or  nvl(pr_program_id, -1) = 0 then
          var_company_ams_id := pr_company_ams_id;
      else--neu cap nhat thi lay tu cong ty da co
          begin
              select /*+ CARDINALITY(a, 10) */
                 a.prog_company_ams_id
                 into var_company_ams_id
              from ep_program a
              where a.prog_program_id = pr_program_id
                  and rownum <= 1
              group by a.prog_company_ams_id;
          exception
           when others then
               var_company_ams_id := pr_company_ams_id;
                life_agency_log.write_log(1000,
                    'EP_EMULATE.get_validate_program_id: loi thu tuc lay tu cong ty da co: ' || to_char(pr_program_id),
                    sqlerrm,
                    sqlcode);
      end;
      end if;
      select
          extract(month from pr_from_date)
          into var_from_month
      from dual;
      select
          extract(month from pr_to_date)
          into var_to_month
      from dual;
      if var_from_month <> var_to_month then
          var_month_across := 1;
      end if;

      if var_month_across = 1 then
         prReturnValue := 1;
      end if;
  end;


  --Neu da co loai do trong CSDL roi thi khong dc them hay doi nua
  procedure get_check_doc_no(
       prReturnValue  in out number,
       pr_program_name varchar2 := null,
       pr_doc_no varchar2 := null,
       pr_program_id number := null
       )
  is
      var_name_qty number(4) := 0;
      var_doc_qty number(4) := 0;
  begin
      prReturnValue := 0;
      --them moi
      if nvl(pr_program_id, 0) = 0 then
          begin
             select  /*+ CARDINALITY(a, 10) */
                count(a.prog_program_id)
                into var_name_qty
             from ams.ep_program a
             where prog_program_name = pr_program_name;
          exception
              when others then
              var_name_qty := 1;
          end;

          begin
             select  /*+ CARDINALITY(a, 10) */
                count(a.prog_program_id)
                into var_doc_qty
             from ams.ep_program a
             where a.prog_doc_no = pr_doc_no;
          exception
              when others then
              var_doc_qty := 1;
          end;
          --neu da co loai day thi se khong dc them moi vao
          if var_name_qty > 0 then
              prReturnValue := 1;
          end if;
          if var_doc_qty > 0 then
              prReturnValue := 2;
          end if;
          if var_name_qty > 0  and var_doc_qty > 0 then
              prReturnValue := 3;
          end if;
      end if;

      --cap nhat
      if nvl(pr_program_id, 0) <> 0 then
          begin
             select  /*+ CARDINALITY(a, 10) */
                count(a.prog_program_id)
                into var_name_qty
             from ams.ep_program a
             where prog_program_name = pr_program_name
                 and a.prog_program_id <> pr_program_id;
          exception
              when others then
              var_name_qty := 2;
          end;

          begin
             select  /*+ CARDINALITY(a, 10) */
                count(a.prog_program_id)
                into var_doc_qty
             from ams.ep_program a
             where a.prog_doc_no = pr_doc_no
                 and a.prog_program_id <> pr_program_id;
          exception
              when others then
              var_doc_qty := 2;
          end;
          --neu da co loai day thi se khong dc them moi vao
          --neu lon hon hay bang 2 thi moi tinh vao cho no co nhe
          if var_name_qty >= 1 then
              prReturnValue := 1;
          end if;
          if var_doc_qty >= 1 then
              prReturnValue := 2;
          end if;
          if var_name_qty >= 1  and var_doc_qty >=1  then
              prReturnValue := 3;
          end if;
      end if;

  exception
   when others then
        prReturnValue := 3;
        life_agency_log.write_log(1000,
            'EP_EMULATE.get_check_doc_no',
            sqlerrm,
            sqlcode);
  end;
  procedure get_cost_by_program_id(
       prProgramId number := null,
       prType number := null,
       pr_company_ams_id varchar2 := null,
       row_records in out sys_refcursor)
  is
  begin
       open row_records for
       select     /*+ CARDINALITY(cost, 10) CARDINALITY(typ, 10)*/
            cost.prco_program_cost_id,
            cost.prco_record_date,
            cost.prco_company_ams_id,
            typ.emty_type_name,
            cost.prco_program_id,
            cost.prco_type,
            cost.prco_month_1,
            cost.prco_month_2,
            cost.prco_month_3,
            cost.prco_month_4,
            cost.prco_month_5,
            cost.prco_month_6,
            cost.prco_month_7,
            cost.prco_month_8,
            cost.prco_month_9,
            cost.prco_month_10,
            cost.prco_month_11,
            cost.prco_month_12,
            cost.prco_month_13,
            cost.prco_month_all
       from
       (
           select   /*+ CARDINALITY(tmp, 10)*/
                tmp.prco_program_cost_id,
                tmp.prco_record_date,
                tmp.prco_company_ams_id,
                tmp.prco_emule_type_id,
                tmp.prco_program_id,
                tmp.prco_type,
                tmp.prco_month_1,
                tmp.prco_month_2,
                tmp.prco_month_3,
                tmp.prco_month_4,
                tmp.prco_month_5,
                tmp.prco_month_6,
                tmp.prco_month_7,
                tmp.prco_month_8,
                tmp.prco_month_9,
                tmp.prco_month_10,
                tmp.prco_month_11,
                tmp.prco_month_12,
                tmp.prco_month_13,
                tmp.prco_month_all
           from ams.ep_program_cost tmp
           where tmp.prco_program_id = prProgramId
               and tmp.prco_type = prType
       ) cost
       left join
        (
            select  /*+ CARDINALITY(a, 10)*/
                a.emty_type_id,
                a.emty_type_name,
                a.emty_type_order
            from ep_dm_emule_type a
        ) typ
            on typ.emty_type_id = cost.prco_emule_type_id
        order by typ.emty_type_order;
  end;

  --Neu da co loai do trong CSDL roi thi khong dc them hay doi nua
  procedure get_qty_by_program_id(
       prReturnValue  in out number,
       pr_program_cost_id number := null,
       pr_program_id number := null,
       pr_type number := null,
       pr_emule_type_id number := null,
       pr_company_ams_id varchar2 := null
       )
  is
      var_exist_qty number(4) := 0;
      var_company_ams_id varchar(100):= pr_company_ams_id;
  begin
      prReturnValue := 0;
     --lay ma cong ty ra
      begin
         select  /*+ CARDINALITY(a, 10) */
            a.prog_company_ams_id
            into var_company_ams_id
         from ams.ep_program a
         where prog_program_id = pr_program_id
             and rownum <= 1
         group by a.prog_company_ams_id;
      exception
          when others then
          var_company_ams_id := pr_company_ams_id;
      end;


      --neu la them moi thi khong duoc trung voi cai da co roi
      if pr_program_cost_id = 0 then
          begin
              --Neu ma da khong co thi phai la them moi vao cho no
              select /*+ CARDINALITY(tmp, 10) */
                  nvl(count(distinct tmp.prco_emule_type_id) , 0)
                  into var_exist_qty
              from ams.ep_program_cost tmp
              where nvl(tmp.prco_program_id, 0) = nvl(pr_program_id, 0)
                  and tmp.prco_type = pr_type
                  and tmp.prco_emule_type_id = pr_emule_type_id
                  and tmp.prco_company_ams_id = var_company_ams_id;
          exception
              when others then
              var_exist_qty := 0;
              life_agency_log.write_log(1000,
                  'EP_EMULATE.get_qty_by_program_id: kiem tra cai program da co chua: CTTD:  ' || to_char(pr_program_id),
                  sqlerrm,
                  sqlcode);
          end;
          --neu da co loai day thi se khong dc them moi vao
          if var_exist_qty > 0 then
              prReturnValue := 1;
          end if;
      end if;

      var_exist_qty := 0;
      --neu la sua thi khong duoc trung voi cai da co roi
      --kiem tra cac cai ma khac voi cai dang xu ly da co loai thi dua do chua
      --neu co loai do roi thi thoi khong dc cho vao luon
      if pr_program_cost_id > 0 then
          begin
              select  /*+ CARDINALITY(tmp, 10) */
                  nvl(count(distinct tmp.prco_emule_type_id) , 0)
                  into var_exist_qty
              from ams.ep_program_cost tmp
              where nvl(tmp.prco_program_id, 0) = nvl(pr_program_id, 0)
                  and tmp.prco_type = pr_type
                  and tmp.prco_emule_type_id = pr_emule_type_id
                  and tmp.prco_company_ams_id = var_company_ams_id
                  --khac voi cai do
                  and tmp.prco_program_cost_id <> pr_program_cost_id;
          exception
              when others then
              var_exist_qty := 0;
              life_agency_log.write_log(1000,
                  'EP_EMULATE.get_qty_by_program_id: kiem tra cai program da co chua: CTTD:  ' || to_char(pr_program_id),
                  sqlerrm,
                  sqlcode);
          end;
          --neu da co loai day thi se khong dc them moi vao
          if var_exist_qty > 0 then
              prReturnValue := 1;
          end if;
      end if;
  exception
   when others then
        life_agency_log.write_log(1000,
            'EP_EMULATE.get_qty_by_program_id: kiem tra cai program da co chua: CTTD:  ' || to_char(pr_program_id),
            sqlerrm,
            sqlcode);
  end;

  --Doi voi chi phi du kien cua nam neu da co loai do trong CSDL roi thi khong dc them hay doi nua
  procedure get_qty_cost_by_year(
       prReturnValue  in out number,
       pr_program_cost_id number := null,
       pr_type number := null,
       pr_emule_type_id number := null,
       pr_company_ams_id varchar2 := null,
       pr_record_date  varchar2
       )
  is
      var_exist_qty number(4) := 0;
      var_company_ams_id varchar(100):= pr_company_ams_id;
      var_year date := trunc(sysdate ,'YYYY');
  begin
      prReturnValue := 0;

      select   /*+ CARDINALITY(a, 10) */
          to_date('1-jan-'||pr_record_date)
          into var_year
      from dual;

      --neu la them moi thi khong duoc trung voi cai da co roi
      if pr_program_cost_id = 0 then
          begin
              --Neu ma da khong co thi phai la them moi vao cho no
              select /*+ CARDINALITY(tmp, 10) */
                  nvl(count(distinct tmp.prco_emule_type_id) , 0)
                  into var_exist_qty
              from ams.ep_program_cost tmp
              where tmp.prco_program_id is null
                  and tmp.prco_type = pr_type
                  and tmp.prco_emule_type_id = pr_emule_type_id
                  and tmp.prco_company_ams_id = var_company_ams_id
                  and tmp.prco_record_date = var_year;
          exception
              when others then
                  var_exist_qty := 0;
                      life_agency_log.write_log(1000,
                          'EP_EMULATE.get_qty_cost_by_year:  cty:  ' || pr_company_ams_id,
                          sqlerrm,
                          sqlcode);
          end;
          --neu da co loai day thi se khong dc them moi vao
          if var_exist_qty > 0 then
              prReturnValue := 1;
          end if;
      end if;

      var_exist_qty := 0;
      --neu la sua thi khong duoc trung voi cai da co roi
      --kiem tra cac cai ma khac voi cai dang xu ly da co loai thi dua do chua
      --neu co loai do roi thi thoi khong dc cho vao luon
      if pr_program_cost_id > 0 then
          begin
              select  /*+ CARDINALITY(tmp, 10) */
                  nvl(count(distinct tmp.prco_emule_type_id) , 0)
                  into var_exist_qty
              from ams.ep_program_cost tmp
              where tmp.prco_program_id is null
                  and tmp.prco_type = pr_type
                  and tmp.prco_emule_type_id = pr_emule_type_id
                  and tmp.prco_company_ams_id = var_company_ams_id
                  --khac voi cai do
                  and tmp.prco_program_cost_id <> pr_program_cost_id
                  --trong nam do
                  and tmp.prco_record_date = var_year;
          exception
              when others then
                  var_exist_qty := 0;
                      life_agency_log.write_log(1000,
                          'EP_EMULATE.get_qty_cost_by_year:  cty:  ' || pr_company_ams_id,
                          sqlerrm,
                          sqlcode);
          end;
          --neu da co loai day thi se khong dc them moi vao
          if var_exist_qty > 0 then
              prReturnValue := 1;
          end if;
      end if;
  exception
   when others then
      life_agency_log.write_log(1000,
          'EP_EMULATE.get_qty_cost_by_year:  cty:  ' || pr_company_ams_id,
          sqlerrm,
          sqlcode);
  end;

  procedure get_cost_by_cost_id(
       pr_program_cost_id number := null,
       row_records in out sys_refcursor)
  is
  begin
       open row_records for
       select      /*+ CARDINALITY(cost, 10) CARDINALITY(typ, 10) */
            cost.prco_program_cost_id,
            cost.prco_record_date,
            to_char(cost.prco_record_date, 'YYYY') cost_year,
            cost.prco_company_ams_id,
            cost.prco_emule_type_id,
            typ.emty_type_name,
            cost.prco_program_id,
            cost.prco_type,
            cost.prco_month_1,
            cost.prco_month_2,
            cost.prco_month_3,
            cost.prco_month_4,
            cost.prco_month_5,
            cost.prco_month_6,
            cost.prco_month_7,
            cost.prco_month_8,
            cost.prco_month_9,
            cost.prco_month_10,
            cost.prco_month_11,
            cost.prco_month_12,
            cost.prco_month_13,
            cost.prco_month_all
       from
       (
           select   /*+ CARDINALITY(tmp, 10) */
                tmp.prco_program_cost_id,
                tmp.prco_record_date,
                tmp.prco_company_ams_id,
                tmp.prco_emule_type_id,
                tmp.prco_program_id,
                tmp.prco_type,
                tmp.prco_month_1,
                tmp.prco_month_2,
                tmp.prco_month_3,
                tmp.prco_month_4,
                tmp.prco_month_5,
                tmp.prco_month_6,
                tmp.prco_month_7,
                tmp.prco_month_8,
                tmp.prco_month_9,
                tmp.prco_month_10,
                tmp.prco_month_11,
                tmp.prco_month_12,
                tmp.prco_month_13,
                tmp.prco_month_all
           from ams.ep_program_cost tmp
           where tmp.prco_program_cost_id = pr_program_cost_id
       ) cost
       left join
        (
            select  /*+ CARDINALITY(a, 10) */
                a.emty_type_id,
                a.emty_type_name,
                a.emty_type_order
            from ep_dm_emule_type a
        ) typ
            on typ.emty_type_id = cost.prco_emule_type_id;
  end;

  --lay du tinh cua thi dua theo nam va du tinh vao dau nam
    procedure get_all_cost_by_year(
       pr_year varchar2 := null,
       pr_company_arr varchar2 := null,
       pr_emulate_type_arr varchar2 := null,
       pr_type number := null,
       row_records in out sys_refcursor)
  is
     var_record_date date := add_months(trunc(sysdate, 'MM'), -1);
  begin
        begin
            select /*+ CARDINALITY(a, 10) */
                max(a.record_date)
                into var_record_date
            from ams.dbw_outl_informations a
            where a.outlet_type = 'CTTV'
            and a.dbw_code = 'MAIN'
            and a.dbw_time = 'MONT';
        exception
         when others then
             var_record_date := add_months(trunc(sysdate, 'MM'), -1);
        end;

       open row_records for
       select  /*+ CARDINALITY(cost, 10) CARDINALITY(typ, 10) */
            cost.prco_program_cost_id,
            cost.prco_record_date,
            to_char(cost.prco_record_date, 'YYYY') record_date,
            cost.prco_company_ams_id,
            comp.branch_name,
            typ.emty_type_name,
            cost.prco_type,
            cost.prco_month_1,
            cost.prco_month_2,
            cost.prco_month_3,
            cost.prco_month_4,
            cost.prco_month_5,
            cost.prco_month_6,
            cost.prco_month_7,
            cost.prco_month_8,
            cost.prco_month_9,
            cost.prco_month_10,
            cost.prco_month_11,
            cost.prco_month_12,
            cost.prco_month_13,
            cost.prco_month_all
       from
       (
           select   /*+ CARDINALITY(tmp, 10)*/
                tmp.prco_program_cost_id,
                tmp.prco_record_date,
                tmp.prco_company_ams_id,
                tmp.prco_emule_type_id,
                tmp.prco_program_id,
                tmp.prco_type,
                tmp.prco_month_1,
                tmp.prco_month_2,
                tmp.prco_month_3,
                tmp.prco_month_4,
                tmp.prco_month_5,
                tmp.prco_month_6,
                tmp.prco_month_7,
                tmp.prco_month_8,
                tmp.prco_month_9,
                tmp.prco_month_10,
                tmp.prco_month_11,
                tmp.prco_month_12,
                tmp.prco_month_13,
                tmp.prco_month_all
           from ams.ep_program_cost tmp
           --nam nay
           where nvl(to_char(tmp.prco_record_date, 'YYYY'), '%') like nvl(pr_year, '%')
               and tmp.prco_program_id is null
               and tmp.prco_type = pr_type
               --cong ty tham gia bat buoc phat chon de sua
               and tmp.prco_company_ams_id in
               (select * from table(ams_core_common.f_split_to_varchar(pr_company_arr)))
               and tmp.prco_emule_type_id in--loai thi dua trong cac loai sau
                 (select * from table(ams_core_common.f_split_to_number(pr_emulate_type_arr)))
       ) cost
       left join
      (
          select /*+ CARDINALITY(a, 10) */
              a.outlet_ams_id branch_ams_id,
              replace(a.outlet_name, 'Bảo Việt Nhân Thọ', 'BVNT') branch_name,
              1 ord
          from ams.dbw_outl_informations a
          where a.outlet_type = 'CTTV'
              and a.dbw_code = 'MAIN'
              and a.dbw_time = 'MONT'
              and a.record_date = var_record_date
          union all
          select  /*+ CARDINALITY(a, 10) */
              a.dmco_value branch_ams_id,
              a.dmco_desc branch_name,
              0 ord
          from ams.ep_dm_code a
          where a.dmco_code = 'TSC_BVNT' --doi tuong thi dua
       ) comp
           on comp.branch_ams_id =  cost.prco_company_ams_id
       left join
        (
            select   /*+ CARDINALITY(a, 10) */
                a.emty_type_id,
                a.emty_type_name,
                a.emty_type_order
            from ep_dm_emule_type a
        ) typ
            on typ.emty_type_id = cost.prco_emule_type_id
      order by
        comp.ord,
        nlssort(comp.branch_name, 'nls_sort=Vietnamese') nulls first,
        typ.emty_type_order;
  end;

    procedure get_all_cost_by_year_for_lan(
       pr_year varchar2 := null,
       pr_company_arr varchar2 := null,
       pr_type number := null,
       row_records in out sys_refcursor)
  is
     var_record_date date := add_months(trunc(sysdate, 'MM'), -1);
  begin 
       open row_records for
       select  /*+ CARDINALITY(cost, 10) */
            cost.prco_program_cost_id,
            cost.prco_record_date,
            to_char(cost.prco_record_date, 'YYYY') record_date,
            cost.prco_company_ams_id,
            cost.prco_type,
            cost.prco_month_1,
            cost.prco_month_2,
            cost.prco_month_3,
            cost.prco_month_4,
            cost.prco_month_5,
            cost.prco_month_6,
            cost.prco_month_7,
            cost.prco_month_8,
            cost.prco_month_9,
            cost.prco_month_10,
            cost.prco_month_11,
            cost.prco_month_12,
            cost.prco_month_13,
            cost.prco_month_all
       from
       (
           select   /*+ CARDINALITY(tmp, 10)*/
                tmp.prco_program_cost_id,
                tmp.prco_record_date,
                tmp.prco_company_ams_id,
                tmp.prco_emule_type_id,
                tmp.prco_program_id,
                tmp.prco_type,
                tmp.prco_month_1,
                tmp.prco_month_2,
                tmp.prco_month_3,
                tmp.prco_month_4,
                tmp.prco_month_5,
                tmp.prco_month_6,
                tmp.prco_month_7,
                tmp.prco_month_8,
                tmp.prco_month_9,
                tmp.prco_month_10,
                tmp.prco_month_11,
                tmp.prco_month_12,
                tmp.prco_month_13,
                tmp.prco_month_all
           from ams.ep_program_cost tmp
           --nam nay
           where nvl(to_char(tmp.prco_record_date, 'YYYY'), '%') like nvl(pr_year, '%')
               and tmp.prco_program_id is null
               and tmp.prco_type = pr_type
               --cong ty tham gia bat buoc phat chon de sua
               and tmp.prco_company_ams_id  = pr_company_arr          
       ) cost;
  end;

  procedure get_file_by_program_id(
       prProgramId number := null,
       row_records in out sys_refcursor)
  is
      var_program_id number(10) := -1;
  begin
       if prProgramId <= 0 or nvl(prProgramId, -99) = -99 then
           var_program_id := -1;
       else
           var_program_id := prProgramId;
       end if;
       open row_records for
       select /*+ CARDINALITY(tmp, 10) */
            tmp.fiat_attach_id,
            tmp.fiat_file_name,
            tmp.fiat_url
       from ams.ep_file_attach tmp
       where tmp.fiat_program_id = var_program_id
           and tmp.fiat_type is null --la file doc uple khong phai la file poster
       order by tmp.fiat_attach_id;
  end;

  procedure get_file_by_file_id(
       pr_attach_id number := null,
       row_records in out sys_refcursor)
  is
  begin
       open row_records for
       select /*+ CARDINALITY(tmp, 10) */
            tmp.fiat_attach_id,
            tmp.fiat_file_name,
            tmp.fiat_url
       from ams.ep_file_attach tmp
       where tmp.fiat_attach_id = pr_attach_id;
  end;
  --lay cac poster len cho no
  procedure get_poster_all(
       pr_type number := null,
       row_records in out sys_refcursor)
  is
  begin
       open row_records for
       select /*+ CARDINALITY(res, 10)  CARDINALITY(prog, 10)  CARDINALITY(dm, 10)  CARDINALITY(acti, 10) */
            res.fiat_attach_id,
            res.fiat_file_name,
            prog.prog_program_name,
            res.fiat_type,
            res.fiat_url,
            res.fiat_update_datetime,
           dm.dmco_desc,
           acti.dmco_desc fiat_acti,
           case when  res.fiat_program_id is null or res.fiat_program_id = 0 then res.fiat_acti end fiat_status
       from
       (
           select  /*+ CARDINALITY(tmp, 10) */
                tmp.fiat_attach_id,
                tmp.fiat_file_name,
                tmp.fiat_program_id,
                tmp.fiat_type,
                tmp.fiat_url,
                nvl(tmp.fiat_acti, 0) fiat_acti,
                to_char(tmp.fiat_update_datetime, 'DD/MM/YYYY HH24:MI:SS') fiat_update_datetime
           from ams.ep_file_attach tmp
           --chieu ngang hay chieu doc cua no phai khac null thi duoc
           where tmp.fiat_type is not null
               and --chuong trinh thi dua nao
               (
                   tmp.fiat_program_id = 0
                   or tmp.fiat_program_id is null
               )
               and
               (
                   pr_type = 0
                   or tmp.fiat_type = pr_type
               )
       ) res
       left join
       (
           select /*+ CARDINALITY(pro, 10) */
              pro.prog_program_id,
              pro.prog_program_name
          from ams.ep_program pro
          where pro.prog_company_ams_id = 'T100000007'
       ) prog
           on res.fiat_program_id =  prog.prog_program_id
       left join
       (
          select  /*+ CARDINALITY(a, 10) */
              a.dmco_value,
              a.dmco_desc
          from ams.ep_dm_code a
          where a.dmco_code = 'POSTER'
       ) dm
           on dm.dmco_value =  res.fiat_type
       left join
       (
          select  /*+ CARDINALITY(a, 10) */
              a.dmco_value,
              a.dmco_desc
          from ams.ep_dm_code a
          where a.dmco_code = 'POSTER_ACTI'
       ) acti
           on acti.dmco_value =  res.fiat_acti
       order by res.fiat_attach_id desc;
  end;

  --lay theo chuong trinh va voi khong lay theo chuong trinh chieu ngang va chieu doc
  procedure get_banner(
       pr_type number := null,
       pr_program_id number := null,
       row_records in out sys_refcursor)
  is
  begin
       open row_records for
       select /*+ CARDINALITY(tmp, 10) */
            tmp.fiat_attach_id,
            tmp.fiat_file_name,
            tmp.fiat_program_id,
            tmp.fiat_type,
            tmp.fiat_url
       from ams.ep_file_attach tmp
       --chieu ngang hay chieu doc cua no phai khac null thi duoc
       where tmp.fiat_type is not null
           and tmp.fiat_type = pr_type
           and --doi voi banner thi xu ly nhu sau
           (
               ( --doi voi banner chinh o bang chinh thi lam nhu sau
                   nvl(pr_program_id, 0) = 0
                   and tmp.fiat_acti = 1 --duoc acti = 1 thi tuc la acti
               )
               or
               ( --doi voi tung chuong trinh thi dua thi lam nhu sau
                   nvl(pr_program_id, 0) <> 0
                   and tmp.fiat_program_id = pr_program_id
               )
           )
       order by tmp.fiat_create_datetime desc;
  end;

  --kiem tra co du loai poster duoc dua vao khong?
  procedure get_qty_valid_poster(
       prReturnValue  in out number)
  is
      var_type_1 number(4) := 0;
      var_type_2 number(4) := 0;
  begin
      prReturnValue := 1;
      begin
          select   /*+ CARDINALITY(a, 10) */
              nvl(count(a.fiat_attach_id) , 0)
              into var_type_1
          from ams.ep_file_attach a
          where a.fiat_type = 1
              and a.fiat_program_id is null;
      exception
          when others then
              var_type_1 := 0;
      end;

      begin
          select   /*+ CARDINALITY(a, 10) */
              nvl(count(a.fiat_attach_id) , 0)
              into var_type_2
          from ams.ep_file_attach a
          where a.fiat_type = 2
              and a.fiat_program_id is null;
      exception
          when others then
              var_type_2 := 0;
      end;

      if var_type_1 <> 1 or var_type_2 <> 1 then
          prReturnValue := 0;
      end if;
  end;

  --kiem tra xem la co bao nhieu loai la loai 1 de lam cho no dung
  procedure get_qty_type_1(
       prReturnValue  in out number,
       pr_file_attach_arr varchar2 := null)
  is
      var_type_1 number(4) := 0;
  begin
      prReturnValue := 1;
      begin
           select   /*+ CARDINALITY(a, 10) */
              nvl(count(a.fiat_attach_id) , 0)
              into var_type_1
           from ams.ep_file_attach a
           where a.fiat_attach_id in
           (select * from table(ams_core_common.f_split_to_number(pr_file_attach_arr)))
           and a.fiat_type = 1 --loai nay la chieu doc
           and a.fiat_program_id is null;
      exception
          when others then
              var_type_1 := 0;
      end;
      --neu >= 2 thi no la bi loi cho no
      if var_type_1 >= 2 then
          prReturnValue := 0;
      end if;
  end;
  --lay ma ke toan cua cong ty
  procedure get_company_account_id(
      pr_company_ams_id  varchar2,
      row_records in out sys_refcursor)
  is
  begin
     open row_records for
     select /*+ CARDINALITY(a, 10) */
        a.dmcm_company_account
    from ams.ep_dm_company a
    where a.dmcm_company_ams_id = pr_company_ams_id;
  end;
  
  procedure get_program_result(
      pr_program_id number,
      pr_company_ams_id  varchar2,
       row_records in out sys_refcursor)
  is
  begin
     open row_records for
     select /*+ CARDINALITY(pro, 10) */
        pro.resu_program_result_id,
        pro.resu_program_id,
        pro.resu_company_ams_id,
        pro.resu_outlet_ams_id,
        pro.resu_outlet_name,
        pro.resu_company_name,
        pro.resu_money
    from ams.ep_program_result pro
    where pro.resu_program_id = pr_program_id
        and
        (
            pr_company_ams_id is null
            or pro.resu_company_ams_id = pr_company_ams_id
        )
    order by nlssort(pro.resu_company_name, 'nls_sort=Vietnamese') nulls first,
        nlssort(pro.resu_outlet_name, 'nls_sort=Vietnamese') nulls first,
        pro.resu_outlet_ams_id;
  end;

  procedure get_program_result_byid(
       pr_program_result_id number,
       row_records in out sys_refcursor)
  is
  begin
     open row_records for
     select  /*+ CARDINALITY(pro, 10)*/
        pro.resu_program_result_id,
        pro.resu_program_id,
        pro.resu_company_ams_id,
        pro.resu_outlet_ams_id,
        pro.resu_outlet_name,
        pro.resu_company_name,
        pro.resu_money
    from ams.ep_program_result pro
    where pro.resu_program_result_id = pr_program_result_id;
  end;

  --danh sach cac ke hoach thi dua nam
  procedure get_program_plan(
       pr_year varchar2 := null,
       pr_company_ams_id  varchar2,
       row_records in out sys_refcursor)
  is
       var_record_date date := to_date('1-jan-'||pr_year);
  begin
     open row_records for
     select   /*+ CARDINALITY(tmp, 10)*/
          tmp.prpp_program_plan_id,
          tmp.prpp_record_date,
          to_char(tmp.prpp_record_date, 'YYYY') prpp_year,
          tmp.prpp_company_ams_id,
          tmp.prpp_month_1,
          tmp.prpp_month_2,
          tmp.prpp_month_3,
          tmp.prpp_month_4,
          tmp.prpp_month_5,
          tmp.prpp_month_6,
          tmp.prpp_month_7,
          tmp.prpp_month_8,
          tmp.prpp_month_9,
          tmp.prpp_month_10,
          tmp.prpp_month_11,
          tmp.prpp_month_12,
          tmp.prpp_month_13
    from ep_program_plan tmp
    where tmp.prpp_company_ams_id = pr_company_ams_id
        and tmp.prpp_record_date = var_record_date;
  end;
   --lay nhom quyen
   procedure get_permission_by_menu(
        pv_menu_code varchar2,
        row_records out sys_refcursor)
    is
    begin
        open row_records for
        select  /*+ CARDINALITY(a, 10) */
            a.menu_permission permissioncode
        from ams.mod_menus a
        where upper(a.menu_id) = upper(pv_menu_code)
            and rownum <= 1;
    end;
    
   function get_sequence_id return number is
   v_session_id number;
   begin
            select ep_file_attach_name_seq.nextval into v_session_id from dual;
            return v_session_id;
   end;    
end EP_EMULATE;
/
