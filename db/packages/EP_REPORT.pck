create or replace package EP_REPORT is
    procedure main;

    procedure get_tree_reports(
        pv_par_code varchar2,
        pr_records out sys_refcursor);
    procedure get_report_informations(pv_report_code varchar2,
        pr_records out sys_refcursor);
  procedure repo_01(
       pr_year varchar2 := null,
       pr_company_ams_id varchar2 := null,
       row_records in out sys_refcursor);
  procedure repo_02(
       pr_month varchar2,
       pr_quarter  varchar2,
       pr_year  varchar2,
       pr_company_ams_id varchar2 := null,
       pr_program_id number := null,
       row_records in out sys_refcursor);
  --bao cao  chi tiet chi thuong thi dua
  procedure repo_03(
       pr_month varchar2 := null,
       pr_quarter  varchar2 := null,
       pr_year  varchar2 := null,
       pr_company_ams_id varchar2 := null,
       pr_program_id number := null,
       row_records in out sys_refcursor);
  --bao cao  tong hop chi thuong thi dua
  procedure repo_04(
       pr_month varchar2,
       pr_quarter  varchar2,
       pr_year  varchar2,
       pr_company_ams_id varchar2 := null,
       pr_program_id number := null,
       row_records in out sys_refcursor);
  --bao cao tien do nhap thi dua
  procedure repo_05(
       pr_year  varchar2,
       pr_company_ams_id varchar2 := null,
       row_records in out sys_refcursor);
  --bao cao  tong hop theo loai thi dua
  procedure repo_06(
       pr_month varchar2,
       pr_quarter  varchar2,
       pr_year  varchar2,
       pr_company_ams_id varchar2 := null,
       row_records in out sys_refcursor);
  procedure repo_07(
       pr_month varchar2,
       pr_quarter  varchar2,
       pr_year  varchar2,
       pr_company_ams_id varchar2 := null,
       row_records in out sys_refcursor);
end EP_REPORT;
/
create or replace package body EP_REPORT is
    procedure main
    is
    begin
        null;
    end;
    /*
        Creater: Le Khac Chinh
        Version: 1.0
        Date: 5/9/2013
        Description: Lay danh sach bao cao
        Parameter:
            pv_par_code [varchar2]: Code nhom tai lieu
            pr_records [out sys_refcursor]: Du lieu tra ve
    */
    procedure get_tree_reports(
        pv_par_code varchar2,
        pr_records out sys_refcursor)
    is
    begin
        open pr_records for
        select  /*+ CARDINALITY(drep, 10) */
            drep.*
        from ep_reports drep
        where drep.par_code = pv_par_code
            and drep.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
        order by drep.sort_order;
    end;

    /*
        Creater: Le Khac Chinh
        Version: 1.0
        Date: 5/9/2013
        Description: Lay danh sach kieu tai lieu
        Parameter:
            pv_par_code [varchar2]: Code nhom tai lieu
            pr_records [out sys_refcursor]: Du lieu tra ve
    */
    procedure get_report_informations(pv_report_code varchar2,
        pr_records out sys_refcursor)
    is
    begin
        open pr_records for
        select  /*+ CARDINALITY(drep, 10) */
            *
        from ep_reports drep
        where drep.report_code = pv_report_code
            and drep.status_code = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE;
    end;

  --bao cao Gant
  procedure repo_01(
       pr_year varchar2 := null,
       pr_company_ams_id varchar2 := null,
       row_records in out sys_refcursor)
  is
       var_year date := to_date('1-jan-'||pr_year);
  begin
     open row_records for
      with viewbc as
     (
     select   /*+ CARDINALITY(et, 10) CARDINALITY(et, 10) CARDINALITY(pro, 10) CARDINALITY(type1, 10) CARDINALITY(type2, 10)*/
          et.emty_type_id,
          et.emty_type_name,
          pro.prog_program_id,
          pro.prog_program_name,
          pro.prog_emule_object_name,
          pro.prog_target_object_name,
          pro.prog_from_date,
          pro.prog_to_date,
          type1.prco_month_1 type1_prco_month_1,
          type2.prco_month_1 type2_prco_month_1,
          type1.prco_month_2 type1_prco_month_2,
          type2.prco_month_2 type2_prco_month_2,
          type1.prco_month_3 type1_prco_month_3,
          type2.prco_month_3 type2_prco_month_3,
          type1.prco_month_4 type1_prco_month_4,
          type2.prco_month_4 type2_prco_month_4,
          type1.prco_month_5 type1_prco_month_5,
          type2.prco_month_5 type2_prco_month_5,
          type1.prco_month_6 type1_prco_month_6,
          type2.prco_month_6 type2_prco_month_6,
          type1.prco_month_7 type1_prco_month_7,
          type2.prco_month_7 type2_prco_month_7,
          type1.prco_month_8 type1_prco_month_8,
          type2.prco_month_8 type2_prco_month_8,
          type1.prco_month_9 type1_prco_month_9,
          type2.prco_month_9 type2_prco_month_9,
          type1.prco_month_10 type1_prco_month_10,
          type2.prco_month_10 type2_prco_month_10,
          type1.prco_month_11 type1_prco_month_11,
          type2.prco_month_11 type2_prco_month_11,
          type1.prco_month_12 type1_prco_month_12,
          type2.prco_month_12 type2_prco_month_12,
          type1.prco_month_13 type1_prco_month_13,
          type2.prco_month_13 type2_prco_month_13,
          type1.prco_month_all type1_prco_month_all,
          type2.prco_month_all type2_prco_month_all,
          null kehoachlaphangthang,
          null kehoachdaunamtruthuchien,
          null ngansachdaunam,
          4 ord
      from
      (
             select   /*+ CARDINALITY(a, 10)*/
                a.emty_type_id,
                a.emty_type_name
             from ep_dm_emule_type a
      )  et
      left join
      (
             select   /*+ CARDINALITY(a, 10)*/
                a.pret_program_id,
                a.pret_emule_type_id
             from ep_program_emule_type a
      ) pt
        on pt.pret_emule_type_id = et.emty_type_id
      join
     (
         select  /*+ CARDINALITY(pro, 10)*/
            pro.prog_program_id,
            pro.prog_program_name,
            pro.prog_doc_no,
            pro.prog_doc_date,
            pro.prog_status,
            pro.prog_emule_period_id,
            pro.prog_company_ams_id,
            pro.prog_emule_object_name,
            pro.prog_target_object_name,
            pro.prog_from_date,
            pro.prog_to_date
         from  ep_program pro
         where trunc(pro.prog_record_date, 'YYYY') = var_year
             and pro.prog_company_ams_id = pr_company_ams_id
     ) pro
        on pro.prog_program_id = pt.pret_program_id
      left join
     (   --ke hoach cua chuong trinh thi dua
         select   /*+ CARDINALITY(a, 10)*/
            a.prco_record_date,
            a.prco_company_ams_id,
            a.prco_emule_type_id,
            a.prco_program_id,
            a.prco_type,
            a.prco_month_1,
            a.prco_month_2,
            a.prco_month_3,
            a.prco_month_4,
            a.prco_month_5,
            a.prco_month_6,
            a.prco_month_7,
            a.prco_month_8,
            a.prco_month_9,
            a.prco_month_10,
            a.prco_month_11,
            a.prco_month_12,
            a.prco_month_13,
            a.prco_month_all
         from  ep_program_cost a
         where a.prco_company_ams_id = pr_company_ams_id
             and a.prco_type = 1
             and nvl(a.prco_program_id, 0) <> 0
     ) type1
        on type1.prco_program_id = pro.prog_program_id
            and type1.prco_emule_type_id = et.emty_type_id
      left join
     (   --thuc te cua chuong trinh thi dua
         select   /*+ CARDINALITY(a, 10)*/
            a.prco_record_date,
            a.prco_company_ams_id,
            a.prco_emule_type_id,
            a.prco_program_id,
            a.prco_type,
            a.prco_month_1,
            a.prco_month_2,
            a.prco_month_3,
            a.prco_month_4,
            a.prco_month_5,
            a.prco_month_6,
            a.prco_month_7,
            a.prco_month_8,
            a.prco_month_9,
            a.prco_month_10,
            a.prco_month_11,
            a.prco_month_12,
            a.prco_month_13,
            a.prco_month_all
         from  ep_program_cost a
         where a.prco_company_ams_id = pr_company_ams_id
             and a.prco_type = 2
             and nvl(a.prco_program_id, 0) <> 0
     ) type2
        on type2.prco_program_id = pro.prog_program_id
            and type2.prco_emule_type_id = et.emty_type_id
     where pro.prog_company_ams_id = pr_company_ams_id
   ),
   --view de hien thi tong cong tren phia dau cho no de hien thi cho no
   viewbc_chung as
     (
     select   /*+ CARDINALITY(et, 10) CARDINALITY(et, 10) CARDINALITY(type1, 10) CARDINALITY(pla, 10) CARDINALITY(type2, 10)*/
          et.emty_type_id,
          et.emty_type_name,
          null prog_program_id,
          null prog_program_name,
          null prog_emule_object_name,
          null prog_target_object_name,
          null prog_from_date,
          null prog_to_date,
          case when pla.prpp_month_1 = 1 then 0 else
            type1.prco_month_1
          end type1_prco_month_1,
          type2.prco_month_1 type2_prco_month_1,
          case when pla.prpp_month_2 = 1 then 0 else
            type1.prco_month_2
          end type1_prco_month_2,
          type2.prco_month_2 type2_prco_month_2,
          case when pla.prpp_month_3 = 1 then 0 else
            type1.prco_month_3
          end type1_prco_month_3,
          type2.prco_month_3 type2_prco_month_3,
          case when pla.prpp_month_4 = 1 then 0 else
            type1.prco_month_4
          end type1_prco_month_4,
          type2.prco_month_4 type2_prco_month_4,
          case when pla.prpp_month_5 = 1 then 0 else
            type1.prco_month_5
          end type1_prco_month_5,
          type2.prco_month_5 type2_prco_month_5,
          case when pla.prpp_month_6 = 1 then 0 else
            type1.prco_month_6
          end type1_prco_month_6,
          type2.prco_month_6 type2_prco_month_6,
          case when pla.prpp_month_7 = 1 then 0 else
            type1.prco_month_7
          end type1_prco_month_7,
          type2.prco_month_7 type2_prco_month_7,
          case when pla.prpp_month_8 = 1 then 0 else
            type1.prco_month_8
          end type1_prco_month_8,
          type2.prco_month_8 type2_prco_month_8,
          case when pla.prpp_month_9 = 1 then 0 else
            type1.prco_month_9
          end type1_prco_month_9,
          type2.prco_month_9 type2_prco_month_9,
          case when pla.prpp_month_10 = 1 then 0 else
            type1.prco_month_10
          end type1_prco_month_10,
          type2.prco_month_10 type2_prco_month_10,
          case when pla.prpp_month_11 = 1 then 0 else
            type1.prco_month_11
          end type1_prco_month_11,
          type2.prco_month_11 type2_prco_month_11,
          case when pla.prpp_month_12 = 1 then 0 else
            type1.prco_month_12
          end type1_prco_month_12,
          type2.prco_month_12 type2_prco_month_12,
          case when pla.prpp_month_13 = 1 then 0 else
            type1.prco_month_13
          end type1_prco_month_13,
          type2.prco_month_13 type2_prco_month_13,
          type1.prco_month_all  type1_prco_month_all,
          type2.prco_month_all type2_prco_month_all,
          null kehoachlaphangthang,
          null kehoachdaunamtruthuchien,
          null ngansachdaunam,
          4 ord
      from
      (
             select   /*+ CARDINALITY(a, 10)*/
                a.emty_type_id,
                a.emty_type_name
             from ep_dm_emule_type a
      )  et
      left join
     (   --ke hoach tu dau nam
         select   /*+ CARDINALITY(a, 10)*/
            a.prco_record_date,
            a.prco_company_ams_id,
            a.prco_emule_type_id,
            a.prco_program_id,
            a.prco_type,
            a.prco_month_1,
            a.prco_month_2,
            a.prco_month_3,
            a.prco_month_4,
            a.prco_month_5,
            a.prco_month_6,
            a.prco_month_7,
            a.prco_month_8,
            a.prco_month_9,
            a.prco_month_10,
            a.prco_month_11,
            a.prco_month_12,
            a.prco_month_13,
            a.prco_month_all
         from  ep_program_cost a
         where a.prco_company_ams_id = pr_company_ams_id
             and a.prco_type = 1
             and nvl(a.prco_program_id, 0) = 0
     ) type1
        on type1.prco_emule_type_id = et.emty_type_id
     left join --lay thang ma khong phat dong thi dua cho no
     (
         select    /*+ CARDINALITY(a, 10)*/
            a.prpp_record_date,
            a.prpp_company_ams_id company_ams_id,
            a.prpp_month_1,
            a.prpp_month_2,
            a.prpp_month_3,
            a.prpp_month_4,
            a.prpp_month_5,
            a.prpp_month_6,
            a.prpp_month_7,
            a.prpp_month_8,
            a.prpp_month_9,
            a.prpp_month_10,
            a.prpp_month_11,
            a.prpp_month_12,
            a.prpp_month_13
         from ams.ep_program_plan a
         where trunc(a.prpp_record_date, 'YYYY') = var_year
             and a.prpp_company_ams_id = pr_company_ams_id
     )  pla
         on pla.company_ams_id  = type1.prco_company_ams_id
      left join
     (   --thuc te cua chuong trinh thi dua da co o bang tren kia roi chia ra cho no
         select   /*+ CARDINALITY(a, 10)*/
              a.emty_type_id,
              a.emty_type_name,
              sum(nvl(a.type2_prco_month_1, 0)) prco_month_1,
              sum(nvl(a.type2_prco_month_2, 0)) prco_month_2,
              sum(nvl(a.type2_prco_month_3, 0)) prco_month_3,
              sum(nvl(a.type2_prco_month_4, 0)) prco_month_4,
              sum(nvl(a.type2_prco_month_5, 0)) prco_month_5,
              sum(nvl(a.type2_prco_month_6, 0)) prco_month_6,
              sum(nvl(a.type2_prco_month_7, 0)) prco_month_7,
              sum(nvl(a.type2_prco_month_8, 0)) prco_month_8,
              sum(nvl(a.type2_prco_month_9, 0)) prco_month_9,
              sum(nvl(a.type2_prco_month_10, 0)) prco_month_10,
              sum(nvl(a.type2_prco_month_11, 0)) prco_month_11,
              sum(nvl(a.type2_prco_month_12, 0)) prco_month_12,
              sum(nvl(a.type2_prco_month_13, 0)) prco_month_13,
              sum(nvl(a.type2_prco_month_all, 0)) prco_month_all
          from viewbc a
          group by a.emty_type_id,
              a.emty_type_name
     ) type2
        on type2.emty_type_id = et.emty_type_id
   ),
   tongtheoloai as
  (
      select   /*+ CARDINALITY(a, 10)*/
            a.emty_type_id,
            a.emty_type_name,
            a.type1_prco_month_1,
            a.type2_prco_month_1,
            a.type1_prco_month_2,
            a.type2_prco_month_2,
            a.type1_prco_month_3,
            a.type2_prco_month_3,
            a.type1_prco_month_4,
            a.type2_prco_month_4,
            a.type1_prco_month_5,
            a.type2_prco_month_5,
            a.type1_prco_month_6,
            a.type2_prco_month_6,
            a.type1_prco_month_7,
            a.type2_prco_month_7,
            a.type1_prco_month_8,
            a.type2_prco_month_8,
            a.type1_prco_month_9,
            a.type2_prco_month_9,
            a.type1_prco_month_10,
            a.type2_prco_month_10,
            a.type1_prco_month_11,
            a.type2_prco_month_11,
            a.type1_prco_month_12,
            a.type2_prco_month_12,
            a.type1_prco_month_13,
            a.type2_prco_month_13,
            a.type1_prco_month_all,
            a.type2_prco_month_all,
            nvl(a.type1_prco_month_1, 0) +
            nvl(a.type1_prco_month_2, 0) +
            nvl(a.type1_prco_month_3, 0) +
            nvl(a.type1_prco_month_4, 0) +
            nvl(a.type1_prco_month_5, 0) +
            nvl(a.type1_prco_month_6, 0) +
            nvl(a.type1_prco_month_7, 0) +
            nvl(a.type1_prco_month_8, 0) +
            nvl(a.type1_prco_month_9, 0) +
            nvl(a.type1_prco_month_10, 0) +
            nvl(a.type1_prco_month_11, 0) +
            nvl(a.type1_prco_month_12, 0) +
            nvl(a.type1_prco_month_13, 0) kehoach,
            nvl(a.type2_prco_month_1, 0) +
            nvl(a.type2_prco_month_2, 0) +
            nvl(a.type2_prco_month_3, 0) +
            nvl(a.type2_prco_month_4, 0) +
            nvl(a.type2_prco_month_5, 0) +
            nvl(a.type2_prco_month_6, 0) +
            nvl(a.type2_prco_month_7, 0) +
            nvl(a.type2_prco_month_8, 0) +
            nvl(a.type2_prco_month_9, 0) +
            nvl(a.type2_prco_month_10, 0) +
            nvl(a.type2_prco_month_11, 0) +
            nvl(a.type2_prco_month_12, 0) +
            nvl(a.type2_prco_month_13, 0) thuchien
           from viewbc_chung a
  ),
--view chenhlech
 viewchechlech as
(
     select   /*+ CARDINALITY(a, 10)*/
          a.emty_type_id,
          a.emty_type_name,
          null prog_program_id,
          null prog_program_name,
          null prog_emule_object_name,
          null prog_target_object_name,
          null type1_prco_month_1,
          sum(nvl(a.type1_prco_month_1, 0)) - sum(nvl(a.type2_prco_month_1, 0)) type2_prco_month_1,
          null type1_prco_month_2,
          sum(nvl(a.type1_prco_month_2, 0))- sum(nvl(a.type2_prco_month_2, 0)) type2_prco_month_2 ,
          null type1_prco_month_3,
          sum(nvl(a.type1_prco_month_3, 0)) - sum(nvl(a.type2_prco_month_3, 0)) type2_prco_month_3,
          null type1_prco_month_4,
          sum(nvl(a.type1_prco_month_4, 0)) - sum(nvl(a.type2_prco_month_4, 0)) type2_prco_month_4,
          null type1_prco_month_5,
          sum(nvl(a.type1_prco_month_5, 0)) - sum(nvl(a.type2_prco_month_5, 0)) type2_prco_month_5,
          null type1_prco_month_6,
          sum(nvl(a.type1_prco_month_6, 0)) - sum(nvl(a.type2_prco_month_6, 0)) type2_prco_month_6 ,
          null type1_prco_month_7,
          sum(nvl(a.type1_prco_month_7, 0)) - sum(nvl(a.type2_prco_month_7, 0)) type2_prco_month_7 ,
          null type1_prco_month_8,
          sum(nvl(a.type1_prco_month_8, 0)) - sum(nvl(a.type2_prco_month_8, 0)) type2_prco_month_8 ,
          null type1_prco_month_9,
          sum(nvl(a.type1_prco_month_9, 0)) - sum(nvl(a.type2_prco_month_9, 0)) type2_prco_month_9,
          null type1_prco_month_10,
          sum(nvl(a.type1_prco_month_10, 0)) - sum(nvl(a.type2_prco_month_10, 0)) type2_prco_month_10 ,
          null type1_prco_month_11,
          sum(nvl(a.type1_prco_month_11, 0)) - sum(nvl(a.type2_prco_month_11, 0)) type2_prco_month_11,
          null type1_prco_month_12,
          sum(nvl(a.type1_prco_month_12, 0)) -sum(nvl(a.type2_prco_month_12, 0)) type2_prco_month_12,
          null type1_prco_month_13,
          sum(nvl(a.type1_prco_month_13, 0)) - sum(nvl(a.type2_prco_month_13, 0)) type2_prco_month_13 ,
          null type1_prco_month_all,
          sum(nvl(a.type1_prco_month_all, 0)) - sum(nvl(a.type2_prco_month_all, 0)) type2_prco_month_all,
          sum(nvl(a.type1_prco_month_1, 0))- sum(nvl(a.type2_prco_month_1, 0)) +
          sum(nvl(a.type1_prco_month_2, 0))- sum(nvl(a.type2_prco_month_2, 0)) +
          sum(nvl(a.type1_prco_month_3, 0)) - sum(nvl(a.type2_prco_month_3, 0)) +
          sum(nvl(a.type1_prco_month_4, 0)) - sum(nvl(a.type2_prco_month_4, 0)) +
          sum(nvl(a.type1_prco_month_5, 0)) - sum(nvl(a.type2_prco_month_5, 0)) +
          sum(nvl(a.type1_prco_month_6, 0)) - sum(nvl(a.type2_prco_month_6, 0)) +
          sum(nvl(a.type1_prco_month_7, 0)) - sum(nvl(a.type2_prco_month_7, 0)) +
          sum(nvl(a.type1_prco_month_8, 0)) - sum(nvl(a.type2_prco_month_8, 0)) +
          sum(nvl(a.type1_prco_month_9, 0)) - sum(nvl(a.type2_prco_month_9, 0)) +
          sum(nvl(a.type1_prco_month_10, 0)) - sum(nvl(a.type2_prco_month_10, 0)) +
          sum(nvl(a.type1_prco_month_11, 0)) - sum(nvl(a.type2_prco_month_11, 0)) +
          sum(nvl(a.type1_prco_month_12, 0)) -sum(nvl(a.type2_prco_month_12, 0)) +
          sum(nvl(a.type1_prco_month_13, 0)) - sum(nvl(a.type2_prco_month_13, 0)) tongchechlech
      from tongtheoloai a
     group by
          a.emty_type_id,
          a.emty_type_name
)
--Lay du lieu ra cho bao cao
--tong theo tat ca
        select   /*+ CARDINALITY(repo, 10)*/
            --repo.emty_type_id,
            repo.emty_type_name,
            case    when repo.ord in (0,2) then  'KẾ HOẠCH  VÀ  NGÂN SÁCH'
             when   repo.ord  in (1,3) then  'CHÊNH LỆCH:(Kế hoạch- Thực chi)' end header,
            --repo.prog_program_id,
            repo.prog_program_name,
            repo.prog_emule_object_name,
            repo.prog_target_object_name,
            repo.prog_from_date,
            repo.prog_to_date,
            case when repo.type1_prco_month_1 = 0 then null else repo.type1_prco_month_1 end type1_prco_month_1,
            case when repo.type2_prco_month_1 = 0 then null else repo.type2_prco_month_1 end type2_prco_month_1,
            case when repo.type1_prco_month_2 = 0 then null else repo.type1_prco_month_2 end type1_prco_month_2,
            case when repo.type2_prco_month_2 = 0 then null else repo.type2_prco_month_2 end type2_prco_month_2,
            case when repo.type1_prco_month_3 = 0 then null else repo.type1_prco_month_3 end type1_prco_month_3,
            case when repo.type2_prco_month_3 = 0 then null else repo.type2_prco_month_3 end type2_prco_month_3,
            case when repo.type1_prco_month_4 = 0 then null else repo.type1_prco_month_4 end type1_prco_month_4,
            case when repo.type2_prco_month_4 = 0 then null else repo.type2_prco_month_4 end type2_prco_month_4,
            case when repo.type1_prco_month_5 = 0 then null else repo.type1_prco_month_5 end type1_prco_month_5,
            case when repo.type2_prco_month_5 = 0 then null else repo.type2_prco_month_5 end type2_prco_month_5,
            case when repo.type1_prco_month_6 = 0 then null else repo.type1_prco_month_6 end type1_prco_month_6,
            case when repo.type2_prco_month_6 = 0 then null else repo.type2_prco_month_6 end type2_prco_month_6,
            case when repo.type1_prco_month_7 = 0 then null else repo.type1_prco_month_7 end type1_prco_month_7,
            case when repo.type2_prco_month_7 = 0 then null else repo.type2_prco_month_7 end type2_prco_month_7,
            case when repo.type1_prco_month_8 = 0 then null else repo.type1_prco_month_8 end type1_prco_month_8,
            case when repo.type2_prco_month_8 = 0 then null else repo.type2_prco_month_8 end type2_prco_month_8,
            case when repo.type1_prco_month_9 = 0 then null else repo.type1_prco_month_9 end type1_prco_month_9,
            case when repo.type2_prco_month_9 = 0 then null else repo.type2_prco_month_9 end type2_prco_month_9,
            case when repo.type1_prco_month_10 = 0 then null else repo.type1_prco_month_10 end type1_prco_month_10,
            case when repo.type2_prco_month_10 = 0 then null else repo.type2_prco_month_10 end type2_prco_month_10,
            case when repo.type1_prco_month_11 = 0 then null else repo.type1_prco_month_11 end type1_prco_month_11,
            case when repo.type2_prco_month_11 = 0 then null else repo.type2_prco_month_11 end type2_prco_month_11,
            case when repo.type1_prco_month_12 = 0 then null else repo.type1_prco_month_12 end type1_prco_month_12,
            case when repo.type2_prco_month_12 = 0 then null else repo.type2_prco_month_12 end type2_prco_month_12,
            case when repo.type1_prco_month_13 = 0 then null else repo.type1_prco_month_13 end type1_prco_month_13,
            case when repo.type2_prco_month_13 = 0 then null else repo.type2_prco_month_13 end type2_prco_month_13,
            case when repo.type1_prco_month_all = 0 then null else repo.type1_prco_month_all end type1_prco_month_all,
            case when repo.type2_prco_month_all = 0 then null else repo.type2_prco_month_all end type2_prco_month_all,
            case when repo.kehoachlaphangthang = 0 then null else repo.kehoachlaphangthang end kehoachlaphangthang,
            case when repo.kehoachdaunamtruthuchien = 0 then null else repo.kehoachdaunamtruthuchien end kehoachdaunamtruthuchien,
            case when repo.ngansachdaunam = 0 then null else repo.ngansachdaunam end ngansachdaunam
            /*,
            repo.ord*/
from(
--tong theo tat ca
      select  /*+ CARDINALITY(tongtheoloai1, 10)*/
            null emty_type_id,
            null  emty_type_name,
            null prog_program_id,
            null prog_program_name,
            null prog_emule_object_name,
            null prog_target_object_name,
            null prog_from_date,
            null prog_to_date,
            sum(nvl(tongtheoloai1.type1_prco_month_1, 0)) type1_prco_month_1,
            sum(nvl(tongtheoloai1.type2_prco_month_1, 0)) type2_prco_month_1,
            sum(nvl(tongtheoloai1.type1_prco_month_2, 0)) type1_prco_month_2,
            sum(nvl(tongtheoloai1.type2_prco_month_2, 0)) type2_prco_month_2,
            sum(nvl(tongtheoloai1.type1_prco_month_3, 0)) type1_prco_month_3,
            sum(nvl(tongtheoloai1.type2_prco_month_3, 0)) type2_prco_month_3,
            sum(nvl(tongtheoloai1.type1_prco_month_4, 0)) type1_prco_month_4,
            sum(nvl(tongtheoloai1.type2_prco_month_4, 0)) type2_prco_month_4,
            sum(nvl(tongtheoloai1.type1_prco_month_5, 0)) type1_prco_month_5,
            sum(nvl(tongtheoloai1.type2_prco_month_5, 0)) type2_prco_month_5,
            sum(nvl(tongtheoloai1.type1_prco_month_6, 0)) type1_prco_month_6,
            sum(nvl(tongtheoloai1.type2_prco_month_6, 0)) type2_prco_month_6 ,
            sum(nvl(tongtheoloai1.type1_prco_month_7, 0)) type1_prco_month_7,
            sum(nvl(tongtheoloai1.type2_prco_month_7, 0)) type2_prco_month_7,
            sum(nvl(tongtheoloai1.type1_prco_month_8, 0)) type1_prco_month_8,
            sum(nvl(tongtheoloai1.type2_prco_month_8, 0)) type2_prco_month_8,
            sum(nvl(tongtheoloai1.type1_prco_month_9, 0)) type1_prco_month_9,
            sum(nvl(tongtheoloai1.type2_prco_month_9, 0)) type2_prco_month_9,
            sum(nvl(tongtheoloai1.type1_prco_month_10, 0)) type1_prco_month_10,
            sum(nvl(tongtheoloai1.type2_prco_month_10, 0)) type2_prco_month_10 ,
            sum(nvl(tongtheoloai1.type1_prco_month_11, 0)) type1_prco_month_11,
            sum(nvl(tongtheoloai1.type2_prco_month_11, 0)) type2_prco_month_11,
            sum(nvl(tongtheoloai1.type1_prco_month_12, 0)) type1_prco_month_12,
            sum(nvl(tongtheoloai1.type2_prco_month_12, 0)) type2_prco_month_12 ,
            sum(nvl(tongtheoloai1.type1_prco_month_13, 0)) type1_prco_month_13,
            sum(nvl(tongtheoloai1.type2_prco_month_13, 0)) type2_prco_month_13,
            sum(nvl(tongtheoloai1.type1_prco_month_all, 0)) type1_prco_month_all,
            sum(nvl(tongtheoloai1.type2_prco_month_all, 0)) type2_prco_month_all,
            sum(nvl(tongtheoloai1.kehoach, 0)) kehoachlaphangthang, --hai ca nay bang nhau
            null kehoachdaunamtruthuchien,
            sum(nvl(tongtheoloai1.kehoach, 0)) ngansachdaunam,
            0 ord
      from
      (
             --tong theo moi loai
             select    /*+ CARDINALITY(a, 10)*/
                a.*
             from tongtheoloai a
      ) tongtheoloai1
  union all
       --chenh lech theo tung loai
      select    /*+ CARDINALITY(chechlech, 10)   CARDINALITY(tongtheoloai, 10)  */
          null emty_type_id,
          null emty_type_name,
          null prog_program_id,
          null prog_program_name,
          null prog_emule_object_name,
          null prog_target_object_name,
          null prog_from_date,
          null prog_to_date,
          null type1_prco_month_1,
          sum(nvl(chechlech.type2_prco_month_1, 0)),
          null type1_prco_month_2,
          sum(nvl(chechlech.type2_prco_month_2, 0)),
          null type1_prco_month_3,
          sum(nvl(chechlech.type2_prco_month_3, 0)),
          null type1_prco_month_4,
          sum(nvl(chechlech.type2_prco_month_4, 0)),
          null type1_prco_month_5,
          sum(nvl(chechlech.type2_prco_month_5, 0)),
          null type1_prco_month_6,
          sum(nvl(chechlech.type2_prco_month_6, 0)),
          null type1_prco_month_7,
          sum(nvl(chechlech.type2_prco_month_7, 0)),
          null type1_prco_month_8,
          sum(nvl(chechlech.type2_prco_month_8, 0)),
          null type1_prco_month_9,
          sum(nvl(chechlech.type2_prco_month_9, 0)),
          null type1_prco_month_10,
          sum(nvl(chechlech.type2_prco_month_10, 0)),
          null type1_prco_month_11,
          sum(nvl(chechlech.type2_prco_month_11, 0)),
          null type1_prco_month_12,
          sum(nvl(chechlech.type2_prco_month_12, 0)),
          null type1_prco_month_13,
          sum(nvl(chechlech.type2_prco_month_13, 0)),
          null type1_prco_month_all,
          sum(nvl(chechlech.type2_prco_month_all, 0)),
          sum(nvl(chechlech.tongchechlech, 0))  chenhlech,
          sum(nvl(tongtheoloai.kehoach, 0) - nvl(tongtheoloai.kehoach, 0) + nvl(chechlech.tongchechlech, 0)) kehoachdaunamtruthuchien,
          null ngansachdaunam,
          1 ord
     from
     (
         select   /*+ CARDINALITY(a, 10)*/
                  a.*
        from viewchechlech a
     ) chechlech
    left join
    (
           --tong theo moi loai
           select    /*+ CARDINALITY(a, 10)*/
              a.*
           from tongtheoloai a
    ) tongtheoloai
       on tongtheoloai.emty_type_id = chechlech.emty_type_id

  union all
             select /*+ CARDINALITY(res, 10) */
                res.emty_type_id,
                res.emty_type_name,
                res.prog_program_id,
                res.prog_program_name,
                res.prog_emule_object_name,
                res.prog_target_object_name,
                res.prog_from_date,
                res.prog_to_date,
                res.type1_prco_month_1,
                res.type2_prco_month_1,
                res.type1_prco_month_2,
                res.type2_prco_month_2,
                res.type1_prco_month_3,
                res.type2_prco_month_3,
                res.type1_prco_month_4,
                res.type2_prco_month_4,
                res.type1_prco_month_5,
                res.type2_prco_month_5,
                res.type1_prco_month_6,
                res.type2_prco_month_6,
                res.type1_prco_month_7,
                res.type2_prco_month_7,
                res.type1_prco_month_8,
                res.type2_prco_month_8,
                res.type1_prco_month_9,
                res.type2_prco_month_9,
                res.type1_prco_month_10,
                res.type2_prco_month_10,
                res.type1_prco_month_11,
                res.type2_prco_month_11,
                res.type1_prco_month_12,
                res.type2_prco_month_12,
                res.type1_prco_month_13,
                res.type2_prco_month_13,
                res.type1_prco_month_all,
                res.type2_prco_month_all,
                res.kehoachlaphangthang,
                res.kehoachdaunamtruthuchien,
                res.ngansachdaunam,
                res.ord
         from
         (
             --tong theo moi loai
             select   /*+ CARDINALITY(tongtheoloai1, 10) */
                tongtheoloai1.emty_type_id,
                tongtheoloai1.emty_type_name,
                null prog_program_id,
                null prog_program_name,
                null prog_emule_object_name,
                null prog_target_object_name,
                null prog_from_date,
                null prog_to_date,
                tongtheoloai1.type1_prco_month_1,
                tongtheoloai1.type2_prco_month_1,
                tongtheoloai1.type1_prco_month_2,
                tongtheoloai1.type2_prco_month_2,
                tongtheoloai1.type1_prco_month_3,
                tongtheoloai1.type2_prco_month_3,
                tongtheoloai1.type1_prco_month_4,
                tongtheoloai1.type2_prco_month_4,
                tongtheoloai1.type1_prco_month_5,
                tongtheoloai1.type2_prco_month_5,
                tongtheoloai1.type1_prco_month_6,
                tongtheoloai1.type2_prco_month_6,
                tongtheoloai1.type1_prco_month_7,
                tongtheoloai1.type2_prco_month_7,
                tongtheoloai1.type1_prco_month_8,
                tongtheoloai1.type2_prco_month_8,
                tongtheoloai1.type1_prco_month_9,
                tongtheoloai1.type2_prco_month_9,
                tongtheoloai1.type1_prco_month_10,
                tongtheoloai1.type2_prco_month_10,
                tongtheoloai1.type1_prco_month_11,
                tongtheoloai1.type2_prco_month_11,
                tongtheoloai1.type1_prco_month_12,
                tongtheoloai1.type2_prco_month_12,
                tongtheoloai1.type1_prco_month_13,
                tongtheoloai1.type2_prco_month_13,
                tongtheoloai1.type1_prco_month_all,
                tongtheoloai1.type2_prco_month_all,
                tongtheoloai1.kehoach kehoachlaphangthang,
                null kehoachdaunamtruthuchien,
                tongtheoloai1.kehoach  ngansachdaunam,
                2 ord
      from  tongtheoloai tongtheoloai1
   union all
       --chenh lech theo tung loai
      select    /*+ CARDINALITY(chechlech, 10)  CARDINALITY(tongtheoloai, 10)  */
                chechlech.emty_type_id,
                chechlech.emty_type_name,
                null prog_program_id,
                null prog_program_name,
                null prog_emule_object_name,
                null prog_target_object_name,
                null prog_from_date,
                null prog_to_date,
                sum(nvl(chechlech.type1_prco_month_1, 0)) type1_prco_month_1,
                sum(nvl(chechlech.type2_prco_month_1, 0)) type2_prco_month_1,
                sum(nvl(chechlech.type1_prco_month_2, 0)) type1_prco_month_2,
                sum(nvl(chechlech.type2_prco_month_2, 0)) type2_prco_month_2,
                sum(nvl(chechlech.type1_prco_month_3, 0)) type1_prco_month_3 ,
                sum(nvl(chechlech.type2_prco_month_3, 0)) type2_prco_month_3 ,
                sum(nvl(chechlech.type1_prco_month_4, 0)) type1_prco_month_4,
                sum(nvl(chechlech.type2_prco_month_4, 0)) type2_prco_month_4 ,
                sum(nvl(chechlech.type1_prco_month_5, 0)) type1_prco_month_5,
                sum(nvl(chechlech.type2_prco_month_5, 0)) type2_prco_month_5,
                sum(nvl(chechlech.type1_prco_month_6, 0)) type1_prco_month_6,
                sum(nvl(chechlech.type2_prco_month_6, 0)) type2_prco_month_6 ,
                sum(nvl(chechlech.type1_prco_month_7, 0)) type1_prco_month_7,
                sum(nvl(chechlech.type2_prco_month_7, 0)) type2_prco_month_7,
                sum(nvl(chechlech.type1_prco_month_8, 0)) type1_prco_month_8,
                sum(nvl(chechlech.type2_prco_month_8, 0)) type2_prco_month_8,
                sum(nvl(chechlech.type1_prco_month_9, 0)) type1_prco_month_9,
                sum(nvl(chechlech.type2_prco_month_9, 0)) type2_prco_month_9,
                sum(nvl(chechlech.type1_prco_month_10, 0)) type1_prco_month_10 ,
                sum(nvl(chechlech.type2_prco_month_10, 0)) type2_prco_month_10,
                sum(nvl(chechlech.type1_prco_month_11, 0)) type1_prco_month_11 ,
                sum(nvl(chechlech.type2_prco_month_11, 0)) type2_prco_month_11,
                sum(nvl(chechlech.type1_prco_month_12, 0)) type1_prco_month_12 ,
                sum(nvl(chechlech.type2_prco_month_12, 0)) type2_prco_month_12,
                sum(nvl(chechlech.type1_prco_month_13, 0)) type1_prco_month_13 ,
                sum(nvl(chechlech.type2_prco_month_13, 0)) type2_prco_month_13 ,
                sum(nvl(chechlech.type1_prco_month_all, 0)) type1_prco_month_all ,
                sum(nvl(chechlech.type2_prco_month_all, 0)) type2_prco_month_all ,
                sum(nvl(chechlech.tongchechlech, 0))  kehoachlaphangthang,
                sum(nvl(tongtheoloai.kehoach, 0) - nvl(tongtheoloai.kehoach, 0) + nvl(chechlech.tongchechlech, 0)) kehoachdaunamtruthuchien,
                null ngansachdaunam,
                3 ord
   from
   (
       select   /*+ CARDINALITY(a, 10)*/
                a.*
      from viewchechlech a
   ) chechlech
    left join
    (
           --tong theo moi loai
           select    /*+ CARDINALITY(a, 10)*/
              a.*
           from tongtheoloai a
    ) tongtheoloai
       on tongtheoloai.emty_type_id = chechlech.emty_type_id
   group by chechlech.emty_type_id,
      chechlech.emty_type_name
  union all
     --theo tung loai 1
     select   /*+ CARDINALITY(a, 10)*/
          a.emty_type_id,
          a.emty_type_name,
          a.prog_program_id,
          a.prog_program_name,
          a.prog_emule_object_name,
          a.prog_target_object_name,
          to_char(a.prog_from_date, 'DD/MM/YYYY')  prog_from_date,
          to_char(a.prog_to_date, 'DD/MM/YYYY')  prog_to_date,
          a.type1_prco_month_1,
          a.type2_prco_month_1,
          a.type1_prco_month_2,
          a.type2_prco_month_2,
          a.type1_prco_month_3,
          a.type2_prco_month_3,
          a.type1_prco_month_4,
          a.type2_prco_month_4,
          a.type1_prco_month_5,
          a.type2_prco_month_5,
          a.type1_prco_month_6,
          a.type2_prco_month_6,
          a.type1_prco_month_7,
          a.type2_prco_month_7,
          a.type1_prco_month_8,
          a.type2_prco_month_8,
          a.type1_prco_month_9,
          a.type2_prco_month_9,
          a.type1_prco_month_10,
          a.type2_prco_month_10,
          a.type1_prco_month_11,
          a.type2_prco_month_11,
          a.type1_prco_month_12,
          a.type2_prco_month_12,
          a.type1_prco_month_13,
          a.type2_prco_month_13,
          a.type1_prco_month_all,
          a.type2_prco_month_all,
          null kehoachlaphangthang,
          null kehoachdaunamtruthuchien,
          null ngansachdaunam,
          4 ord
      from viewbc a
      ) res
) repo
  order by  emty_type_id nulls first, ord;
  end;

  --bao cao  tien do chi thuong
  procedure repo_02(
       pr_month varchar2,
       pr_quarter  varchar2,
       pr_year  varchar2,
       pr_company_ams_id varchar2 := null,
       pr_program_id number := null,
       row_records in out sys_refcursor)
  is
       var_record_date date := add_months(trunc(sysdate, 'MM'), -1);
       var_year date := to_date('01-jan-'||pr_year);
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
         select   /*+ CARDINALITY(pro, 10) CARDINALITY(com, 10) CARDINALITY(pay, 10) CARDINALITY(com_pay, 10) CARDINALITY(comp, 10)*/
            comp.branch_name,
            pro.prog_program_id,
            pro.prog_program_name,
            pro.prog_doc_no,
            case when pay.prst_calculate_date is not null then to_char(pay.prst_calculate_date, 'DD/MM/YYYY') end calculate_date,
            case when pay.prst_transfer_date is not null then to_char(pay.prst_transfer_date, 'DD/MM/YYYY') end transfer_date,
            case when com_pay.prcp_company_ams_id is not null and pay.prst_cac_verify_date is not null then
                to_char(pay.prst_cac_verify_date, 'DD/MM/YYYY')
            end cac_verify_date
         from
         (
             select   /*+ CARDINALITY(a, 10)*/
                a.prog_program_id,
                a.prog_company_ams_id,
                a.prog_program_name,
                a.prog_doc_no
             from ams.ep_program a
            where trunc(a.prog_record_date, 'YYYY') = var_year
                and a.prog_month_arr like nvl(pr_month, '%')
                and a.prog_quarter_arr like nvl(pr_quarter, '%')
                 --cong ty tham gia bat buoc phai co neu khong thi khong the dung duoc
                 and
                 (
                     nvl(pr_company_ams_id, '0') = '0'
                     or
                     a.prog_company_ams_id = pr_company_ams_id
                 )
                 and  --chuong trinh thi dua
                 (
                     nvl(pr_program_id, 0) = 0
                     or
                     (
                         nvl(pr_program_id, 0) <> 0
                         and a.prog_program_id = pr_program_id
                     )
                 )
         ) pro
         join --lay danh sach cac cong ty tham gia trong chuong trinh thi dua cho no
         (
             select    /*+ CARDINALITY(a, 10)*/
                 a.prco_program_id,
                 a.prco_company_ams_id
             from ams.ep_program_company a
             where nvl(pr_program_id, 0) = 0
                   or
                   (
                       pr_program_id <> 0
                       and a.prco_program_id = pr_program_id
                   )
             group by
                 a.prco_program_id,
                 a.prco_company_ams_id
         ) com
             on com.prco_program_id = pro.prog_program_id
         left join --lay ngay trang thai ra cho no
         (
             select    /*+ CARDINALITY(a, 10)*/
                 a.prst_program_id,
                 a.prst_calculate_date,
                 a.prst_transfer_date,
                 a.prst_cac_verify_date
             from ams.ep_program_status a
         )  pay
             on pay.prst_program_id  = pro.prog_program_id
         left join --lay danh sach cac cong ty da duoc  chi tien ra cho no
         (
             select   /*+ CARDINALITY(a, 10)*/
                 a.prcp_program_id,
                 a.prcp_company_ams_id
             from ams.ep_program_company_payment a
             group by
                 a.prcp_program_id,
                 a.prcp_company_ams_id
         )  com_pay
             on com_pay.prcp_program_id = pro.prog_program_id
                and com_pay.prcp_company_ams_id  = com.prco_company_ams_id
        left join
        (
            select   /*+ CARDINALITY(a, 10)*/
                a.outlet_ams_id branch_ams_id,
                replace(a.outlet_name, 'Bảo Việt Nhân Thọ', '') branch_name,
                1 ord
            from ams.dbw_outl_informations a
            where a.outlet_type = 'CTTV'
                and a.dbw_code = 'MAIN'
                and a.dbw_time = 'MONT'
                and a.record_date = var_record_date
            union all
            select
                 'T100000007' branch_ams_id,
                 'TCT Bảo Việt Nhân Thọ' branch_name,
                 0 ord
            from dual
            where 'T100000007' = pr_company_ams_id
               or nvl(pr_company_ams_id, '0') = '0'
        ) comp
           on comp.branch_ams_id = com.prco_company_ams_id
      order by
          nlssort(pro.prog_program_name, 'nls_sort=Vietnamese') nulls first,
          nlssort(comp.branch_name, 'nls_sort=Vietnamese') nulls first;
    end;

  --bao cao  chi tiet chi thuong thi dua
  procedure repo_03(
       pr_month varchar2 := null,
       pr_quarter  varchar2 := null,
       pr_year  varchar2 := null,
       pr_company_ams_id varchar2 := null,
       pr_program_id number := null,
       row_records in out sys_refcursor)
  is
       var_record_date date := add_months(trunc(sysdate, 'MM'), -1);
       var_year date := null;
  begin
     --neu pr_program_id is not null tuc khong chon chinh xac ma chuong trinh thi dua thi se lay ra7
      if nvl(pr_program_id, -99) = -99 or pr_program_id = 0 then
             var_year  := to_date('01-jan-'||pr_year);
             open row_records for
             select   /*+ CARDINALITY(pro, 10) CARDINALITY(pay, 10)*/
                pay.resu_company_name branch_name,
                pro.prog_program_id,
                pro.prog_program_name program_name,
                pro.prog_doc_no doc_no,
                pay.resu_outlet_ams_id outlet_ams_id,
                pay.resu_outlet_name outlet_name,
                pay.resu_money money
             from
             (
                 select  /*+ CARDINALITY(a, 10)*/
                    a.prog_program_id,
                    a.prog_company_ams_id,
                    a.prog_program_name,
                    a.prog_doc_no
                 from ams.ep_program a
                where trunc(a.prog_record_date, 'YYYY') = var_year
                     and a.prog_month_arr like nvl(pr_month, '%')
                     and a.prog_quarter_arr like nvl(pr_quarter, '%')
                     --cong ty tham gia bat buoc phai co neu khong thi khong the dung duoc
                     and
                     (
                         nvl(pr_company_ams_id, '0') = '0'
                         or
                         a.prog_company_ams_id = pr_company_ams_id
                     )
                     and  --chuong trinh thi dua
                     (
                         nvl(pr_program_id, 0) = 0
                         or
                         (
                             nvl(pr_program_id, 0) <> 0
                             and a.prog_program_id = pr_program_id
                         )
                     )
             ) pro
             join --lay ngay trang thai ra cho no
             (
                 select  /*+ CARDINALITY(a, 10)*/
                     a.resu_program_id,
                     a.resu_company_ams_id, --cong ty nhap chi thuong vao cho no
                     a.resu_outlet_ams_id,
                     a.resu_outlet_name,
                     a.resu_company_name,
                     a.resu_money
                 from ams.ep_program_result a
                 where  --chuong trinh thi dua
                 (
                     nvl(pr_program_id, 0) = 0
                     or
                     (
                         nvl(pr_program_id, 0) <> 0
                         and a.resu_program_id = pr_program_id
                     )
                 )
             )  pay
                 on pay.resu_program_id  = pro.prog_program_id
          order by
              nlssort(pay.resu_company_name, 'nls_sort=Vietnamese') nulls first,
              nlssort(pro.prog_program_name, 'nls_sort=Vietnamese') nulls first,
              nlssort(pay.resu_outlet_name, 'nls_sort=Vietnamese') nulls first;
     else  --neu nhap chinh xac chuong trinh thi dua vao
             open row_records for
             select   /*+ CARDINALITY(pro, 10) CARDINALITY(pay, 10)*/
                pay.resu_company_name branch_name,
                pro.prog_program_id,
                pro.prog_program_name program_name,
                pro.prog_doc_no doc_no,
                pay.resu_outlet_ams_id outlet_ams_id,
                pay.resu_outlet_name outlet_name,
                pay.resu_money money
             from
             (
                select  /*+ CARDINALITY(a, 10)*/
                    a.prog_program_id,
                    a.prog_company_ams_id,
                    a.prog_program_name,
                    a.prog_doc_no
                from ams.ep_program a
                where a.prog_program_id = pr_program_id
             ) pro
             join --lay ngay trang thai ra cho no
             ( 
                 select  /*+ CARDINALITY(a, 10)*/
                     a.resu_program_id,
                     a.resu_company_ams_id, --cong ty nhap chi thuong vao cho no
                     a.resu_outlet_ams_id,
                     a.resu_outlet_name,
                     a.resu_company_name,
                     a.resu_money
                 from ams.ep_program_result a
                 where a.resu_program_id = pr_program_id
                     --lay chinh xac ma cua cong ty do vao de chi hien thi cua cong ty do vao thoi
                     and   
                     (   
                         pr_company_ams_id is null --neu khong chon cong ty thi thoi con khong thi se lay nhu the nay
                         or
                         pr_company_ams_id =  'T100000007'  --neu chon tong cong ty thi cung cho hien tat ca
                         or                         
                         a.resu_company_ams_id = pr_company_ams_id                     
                     )
             )  pay
                 on pay.resu_program_id  = pro.prog_program_id
          order by
              nlssort(pay.resu_company_name, 'nls_sort=Vietnamese') nulls first,
              nlssort(pro.prog_program_name, 'nls_sort=Vietnamese') nulls first,
              nlssort(pay.resu_outlet_name, 'nls_sort=Vietnamese') nulls first;
     end if;
    end;

  --bao cao  tong hop chi thuong thi dua
  procedure repo_04(
       pr_month varchar2,
       pr_quarter  varchar2,
       pr_year  varchar2,
       pr_company_ams_id varchar2 := null,
       pr_program_id number := null,
       row_records in out sys_refcursor)
  is
       var_record_date date := add_months(trunc(sysdate, 'MM'), -1);
       var_year date := to_date('01-jan-'||pr_year);
  begin
         open row_records for
         select  /*+ CARDINALITY(pro, 10) CARDINALITY(pay, 10) CARDINALITY(comp, 10)*/
            max(pay.resu_company_name) branch_name,
            pay.resu_outlet_ams_id outlet_ams_id,
            pay.resu_outlet_name outlet_name,
            sum(nvl(pay.resu_money, 0)) money
         from
         (
             select    /*+ CARDINALITY(a, 10)*/
                a.prog_program_id,
                a.prog_company_ams_id,
                a.prog_program_name,
                a.prog_doc_no
             from ams.ep_program a
             where trunc(a.prog_record_date, 'YYYY') = var_year
                 and a.prog_month_arr like nvl(pr_month, '%')
                 and a.prog_quarter_arr like nvl(pr_quarter, '%')
                 --cong ty tham gia bat buoc phai co neu khong thi khong the dung duoc
                 and
                 (
                     nvl(pr_company_ams_id, '0') = '0'
                     or
                     a.prog_company_ams_id = pr_company_ams_id
                 )
                 and  --chuong trinh thi dua
                 (
                     nvl(pr_program_id, 0) = 0
                     or
                     (
                         nvl(pr_program_id, 0) <> 0
                         and a.prog_program_id = pr_program_id
                     )
                 )
         ) pro
         left join --lay ngay trang thai ra cho no
         (
             select   /*+ CARDINALITY(a, 10)*/
                 a.resu_program_id,
                 a.resu_company_ams_id, --cong ty nhap chi thuong vao cho no
                 a.resu_outlet_ams_id,
                 a.resu_outlet_name,
                 a.resu_company_name,
                 a.resu_money
             from ams.ep_program_result a
         )  pay
             on pay.resu_program_id  = pro.prog_program_id
       where pay.resu_outlet_ams_id is not null
       group by pay.resu_outlet_ams_id,
            pay.resu_outlet_name
      order by
          nlssort(max(pay.resu_company_name), 'nls_sort=Vietnamese') nulls first,
          nlssort(pay.resu_outlet_name, 'nls_sort=Vietnamese') nulls first;
    end;
  --bao cao tien do nhap thi dua
  procedure repo_05(
       pr_year  varchar2,
       pr_company_ams_id varchar2 := null,
       row_records in out sys_refcursor)
  is
       var_record_date date := add_months(trunc(sysdate, 'MM'), -1);
       var_year date := to_date('01-jan-'||pr_year);
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
        select /*+ CARDINALITY(a, 10) */
            nvl(comp.branch_name, 'TCT Bảo Việt Nhân Thọ') branch_name,
            case --neu có tich vao thi la khong co
               when pla.prpp_month_1 = 1 then 'Không có'
               --neu thang do co chuong trinh thi dua thi la co 'X' tuc co ke hoach
               when res.plan_month_1 > 0 then 'X'
               else ''
           end plan_month_1,
           case --neu có tich vao thi la khong co
               when pla.prpp_month_1 = 1 then 'Không có'
                --neu ma da nhap ket qua vao thi la co 'X'
               when res.exe_month_1 > 0 then 'X'
                 --con khong thi de trong cho no
               else ''
           end exe_month_1,
            case
               when pla.prpp_month_2 = 1 then 'Không có'
               when res.plan_month_2 > 0 then 'X'
               else ''
           end plan_month_2,
           case
               when pla.prpp_month_2 = 1 then 'Không có'
               when res.exe_month_2 > 0 then 'X'
               else ''
           end exe_month_2,
            case
               when pla.prpp_month_3 = 1 then 'Không có'
               when res.plan_month_3 > 0 then 'X'
               else ''
           end plan_month_3,
           case
               when pla.prpp_month_3 = 1 then 'Không có'
               when res.exe_month_3 > 0 then 'X'
               else ''
           end exe_month_3,
            case
               when pla.prpp_month_4 = 1 then 'Không có'
               when res.plan_month_4 > 0 then 'X'
               else ''
           end plan_month_4,
           case
               when pla.prpp_month_4 = 1 then 'Không có'
               when res.exe_month_4 > 0 then 'X'
               else ''
           end exe_month_4,
            case
               when pla.prpp_month_5 = 1 then 'Không có'
               when res.plan_month_5 > 0 then 'X'
               else ''
           end plan_month_5,
           case
               when pla.prpp_month_5 = 1 then 'Không có'
               when res.exe_month_5 > 0 then 'X'
               else ''
           end exe_month_5,
            case
               when pla.prpp_month_6 = 1 then 'Không có'
               when res.plan_month_6 > 0 then 'X'
               else ''
           end plan_month_6,
           case
               when pla.prpp_month_6 = 1 then 'Không có'
               when res.exe_month_6 > 0 then 'X'
               else ''
           end exe_month_6,
            case
               when pla.prpp_month_7 = 1 then 'Không có'
               when res.plan_month_7 > 0 then 'X'
               else ''
           end plan_month_7,
           case
               when pla.prpp_month_7 = 1 then 'Không có'
               when res.exe_month_7 > 0 then 'X'
               else ''
           end exe_month_7,
            case
               when pla.prpp_month_8 = 1 then 'Không có'
               when res.plan_month_8 > 0 then 'X'
               else ''
           end plan_month_8,
           case
               when pla.prpp_month_8 = 1 then 'Không có'
               when res.exe_month_8 > 0 then 'X'
               else ''
           end exe_month_8,
            case
               when pla.prpp_month_9 = 1 then 'Không có'
               when res.plan_month_9 > 0 then 'X'
               else ''
           end plan_month_9,
           case
               when pla.prpp_month_9 = 1 then 'Không có'
               when res.exe_month_9 > 0 then 'X'
               else ''
           end exe_month_9,
            case
               when pla.prpp_month_10 = 1 then 'Không có'
               when res.plan_month_10 > 0 then 'X'
               else ''
           end plan_month_10,
           case
               when pla.prpp_month_10 = 1 then 'Không có'
               when res.exe_month_10 > 0 then 'X'
               else ''
           end exe_month_10,
            case
               when pla.prpp_month_11 = 1 then 'Không có'
               when res.plan_month_11 > 0 then 'X'
               else ''
           end plan_month_11,
           case
               when pla.prpp_month_11 = 1 then 'Không có'
               when res.exe_month_11 > 0 then 'X'
               else ''
           end exe_month_11,
            case
               when pla.prpp_month_12 = 1 then 'Không có'
               when res.plan_month_12 > 0 then 'X'
               else ''
           end plan_month_12,
           case
               when pla.prpp_month_12 = 1 then 'Không có'
               when res.exe_month_12 > 0 then 'X'
               else ''
           end exe_month_12,
            case
               when pla.prpp_month_13 = 1 then 'Không có'
               when res.plan_month_13 > 0 then 'X'
               else ''
           end plan_month_13,
           case
               when pla.prpp_month_13 = 1 then 'Không có'
               when res.exe_month_13 > 0 then 'X'
               else ''
           end exe_month_13
         from
        (
            select /*+ CARDINALITY(a, 10) */
                a.outlet_ams_id company_ams_id,
                replace(a.outlet_name, 'Bảo Việt Nhân Thọ', '') branch_name
            from ams.dbw_outl_informations a
            where a.outlet_type = 'CTTV'
                and a.dbw_code = 'MAIN'
                and a.dbw_time = 'MONT'
                and a.record_date = var_record_date
                and
                (
                   nvl(pr_company_ams_id, '0') = '0'
                   or
                   a.outlet_ams_id = pr_company_ams_id
                )
           union all
            select
                 'T100000007' branch_ams_id,
                 'TCT Bảo Việt Nhân Thọ' branch_name
            from dual
            where 'T100000007' = pr_company_ams_id
               or nvl(pr_company_ams_id, '0') = '0'
        ) comp
         left join --lay thang ma khong phat dong thi dua cho no
         (
             select  /*+ CARDINALITY(a, 10) */
                a.prpp_record_date,
                a.prpp_company_ams_id company_ams_id,
                a.prpp_month_1,
                a.prpp_month_2,
                a.prpp_month_3,
                a.prpp_month_4,
                a.prpp_month_5,
                a.prpp_month_6,
                a.prpp_month_7,
                a.prpp_month_8,
                a.prpp_month_9,
                a.prpp_month_10,
                a.prpp_month_11,
                a.prpp_month_12,
                a.prpp_month_13
             from ams.ep_program_plan a
              where trunc(a.prpp_record_date, 'YYYY') = var_year
         )  pla
             on pla.company_ams_id  = comp.company_ams_id
         left join
         (
              select   /*+ CARDINALITY(comp, 10)  CARDINALITY(pro, 10)  CARDINALITY(pay, 10) */
                  comp.company_ams_id,
                  sum(
                      case
                         when pro.month_name = '01' and pro.program_id is not null then 1
                         else 0
                     end) plan_month_1,
                  sum(
                      case
                         when pro.month_name = '01' and pay.program_id is not null then 1
                         else 0
                 end) exe_month_1,
                  sum(
                      case
                         when pro.month_name = '02' and pro.program_id is not null then 1
                         else 0
                     end) plan_month_2,
                  sum(
                      case
                         when pro.month_name = '02' and pay.program_id is not null then 1
                         else 0
                 end) exe_month_2,
                  sum(
                      case
                         when pro.month_name = '03' and pro.program_id is not null then 1
                         else 0
                     end) plan_month_3,
                  sum(
                      case
                         when pro.month_name = '03' and pay.program_id is not null then 1
                         else 0
                 end) exe_month_3,
                  sum(
                      case
                         when pro.month_name = '04' and pro.program_id is not null then 1
                         else 0
                     end) plan_month_4,
                  sum(
                      case
                         when pro.month_name = '04' and pay.program_id is not null then 1
                         else 0
                 end) exe_month_4,
                  sum(
                      case
                         when pro.month_name = '05' and pro.program_id is not null then 1
                         else 0
                     end) plan_month_5,
                  sum(
                      case
                         when pro.month_name = '05' and pay.program_id is not null then 1
                         else 0
                 end) exe_month_5,
                  sum(
                      case
                         when pro.month_name = '06' and pro.program_id is not null then 1
                         else 0
                     end) plan_month_6,
                  sum(
                      case
                         when pro.month_name = '06' and pay.program_id is not null then 1
                         else 0
                 end) exe_month_6,
                  sum(
                      case
                         when pro.month_name = '07' and pro.program_id is not null then 1
                         else 0
                     end) plan_month_7,
                  sum(
                      case
                         when pro.month_name = '07' and pay.program_id is not null then 1
                         else 0
                 end) exe_month_7,
                  sum(
                      case
                         when pro.month_name = '08' and pro.program_id is not null then 1
                         else 0
                     end) plan_month_8,
                  sum(
                      case
                         when pro.month_name = '08' and pay.program_id is not null then 1
                         else 0
                 end) exe_month_8,
                  sum(
                      case
                         when pro.month_name = '09' and pro.program_id is not null then 1
                         else 0
                     end) plan_month_9,
                  sum(
                      case
                         when pro.month_name = '09' and pay.program_id is not null then 1
                         else 0
                 end) exe_month_9,
                  sum(
                      case
                         when pro.month_name = '10' and pro.program_id is not null then 1
                         else 0
                     end) plan_month_10,
                  sum(
                      case
                         when pro.month_name = '10' and pay.program_id is not null then 1
                         else 0
                 end) exe_month_10,
                  sum(
                      case
                         when pro.month_name = '11' and pro.program_id is not null then 1
                         else 0
                     end) plan_month_11,
                  sum(
                      case
                         when pro.month_name = '11' and pay.program_id is not null then 1
                         else 0
                 end) exe_month_11,
                  sum(
                      case
                         when pro.month_name = '12' and pro.program_id is not null then 1
                         else 0
                     end) plan_month_12,
                  sum(
                      case
                         when pro.month_name = '12' and pay.program_id is not null then 1
                         else 0
                 end) exe_month_12,
                  sum(
                      case
                         when pro.month_name = '13' and pro.program_id is not null then 1
                         else 0
                     end) plan_month_13,
                  sum(
                      case
                         when pro.month_name = '13' and pay.program_id is not null then 1
                         else 0
                 end) exe_month_13
            from
            (
                select /*+ CARDINALITY(a, 10) */
                    a.outlet_ams_id company_ams_id,
                    replace(a.outlet_name, 'Bảo Việt Nhân Thọ', '') branch_name
                from ams.dbw_outl_informations a
                where a.outlet_type = 'CTTV'
                    and a.dbw_code = 'MAIN'
                    and a.dbw_time = 'MONT'
                    and a.record_date = var_record_date
               union all
                select
                     'T100000007' branch_ams_id,
                     'TCT Bảo Việt Nhân Thọ' branch_name
                from dual
            ) comp
            left join
            (
                   select /*+ CARDINALITY(a, 10) */
                      a.prog_program_id program_id,
                      a.prog_company_ams_id company_ams_id,
                      to_char(a.prog_record_date, 'MM') month_name
                   from ams.ep_program a
                  where trunc(a.prog_record_date, 'YYYY') = var_year
                       --cong ty tham gia bat buoc phai co neu khong thi khong the dung duoc
             ) pro
                 on pro.company_ams_id  = comp.company_ams_id
             left join --lay ngay trang thai ra cho no
             (
                 select  /*+ CARDINALITY(a, 10) */
                     a.resu_program_id program_id
                 from ams.ep_program_result a
                 group by a.resu_program_id
             )  pay
                 on pay.program_id  = pro.program_id
             group by
                comp.company_ams_id
        ) res
             on res.company_ams_id  = comp.company_ams_id
      order by
          nlssort(comp.branch_name, 'nls_sort=Vietnamese') nulls first;
    end;

  --bao cao  tong hop theo loai thi dua
  procedure repo_06(
       pr_month varchar2,
       pr_quarter  varchar2,
       pr_year  varchar2,
       pr_company_ams_id varchar2 := null,
       row_records in out sys_refcursor)
  is
       var_record_date date := add_months(trunc(sysdate, 'MM'), -1);
       var_year date := to_date('01-jan-'||pr_year);
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
       open row_records for--tinh tong tien cho no theo loai nay
       select /*+ CARDINALITY(res, 10) CARDINALITY(comp, 10)*/
          nvl(comp.branch_name, 'TCT Bảo Việt Nhân Thọ') branch_name,
          round(sum(case when res.emule_type_id = 1 then nvl(res.money, 0) end), 2) tuyendung,
          round(sum(case when res.emule_type_id = 2 then nvl(res.money, 0) end), 2) khaithac,
          round(sum(case when res.emule_type_id = 3 then nvl(res.money, 0) end), 2)  thuphi,
          round(sum(case when res.emule_type_id = 4 then nvl(res.money, 0) end), 2)  hnkh,
          round(sum( nvl(res.money, 0)), 2)  tatca
       from
        (
            select /*+ CARDINALITY(a, 10) */
                a.outlet_ams_id branch_ams_id,
                replace(a.outlet_name, 'Bảo Việt Nhân Thọ', '') branch_name
            from ams.dbw_outl_informations a
            where a.outlet_type = 'CTTV'
                and a.dbw_code = 'MAIN'
                and a.dbw_time = 'MONT'
                and a.record_date = var_record_date
                and
                (
                   nvl(pr_company_ams_id, '0') = '0'
                   or
                   a.outlet_ams_id = pr_company_ams_id
                )
                union all
                select
                     'T100000007' branch_ams_id,
                     'TCT Bảo Việt Nhân Thọ' branch_name
                from dual
                where 'T100000007' = pr_company_ams_id
                   or nvl(pr_company_ams_id, '0') = '0'
        ) comp
        join
        (
             select  /*+ CARDINALITY(pro, 10) CARDINALITY(pay, 10) CARDINALITY(emule, 10) CARDINALITY(emule_type, 10) */
                    pro.prog_program_id,
                    pro.prog_company_ams_id,
                    emule.pret_emule_type_id emule_type_id, --dem theo cac loai thi dua nay moi loai thi dua co bao nhie tien
                    decode(emule_type.qty, 0, 0, pay.resu_money/emule_type.qty) money
             from
             (
                 select   /*+ CARDINALITY(a, 10) */
                    a.prog_program_id,
                    a.prog_company_ams_id
                 from ams.ep_program a
                 where  trunc(a.prog_record_date, 'YYYY') = var_year
                     and a.prog_month_arr like nvl(pr_month, '%')
                     and a.prog_quarter_arr like nvl(pr_quarter, '%')
                     --Bach bao ngay 6 /11 khong can thuc chi qua ke toan cung duoc
                     --and a.prog_status = 4 --da thuc chi qua ke toan thi moi tinh vao
                     and
                     (
                         nvl(pr_company_ams_id, '0') = '0'
                         or
                         a.prog_company_ams_id = pr_company_ams_id
                     )
             ) pro
             join --lay ra tong so tien chi thuong cho no
             (
                 select    /*+ CARDINALITY(a, 10) */
                     a.resu_program_id,
                     sum(nvl(a.resu_money, 0)) resu_money
                 from ams.ep_program_result a
                 group by
                     a.resu_program_id
             )  pay
                 on pay.resu_program_id  = pro.prog_program_id
             join --lay danh sach loai thi dua
             (
                 select    /*+ CARDINALITY(a, 10) */
                     a.pret_program_id,
                     a.pret_emule_type_id
                 from ams.ep_program_emule_type a
                 group by
                     a.pret_program_id,
                     a.pret_emule_type_id
             ) emule
                 on emule.pret_program_id = pro.prog_program_id
             join --lay tong loai thi dua cho no
             (
                 select    /*+ CARDINALITY(a, 10) */
                     a.pret_program_id,
                     nvl(count(a.pret_emule_type_id), 0) qty
                 from ams.ep_program_emule_type a
                 group by
                     a.pret_program_id
             ) emule_type
                 on emule_type.pret_program_id = pro.prog_program_id
         ) res
             on res.prog_company_ams_id = comp.branch_ams_id
         group by comp.branch_name
         order by
            nlssort(comp.branch_name, 'nls_sort=Vietnamese') nulls first;
    end;

  --bao cao  tong hop theo chuc danh dai ly
  procedure repo_07(
       pr_month varchar2,
       pr_quarter  varchar2,
       pr_year  varchar2,
       pr_company_ams_id varchar2 := null,
       row_records in out sys_refcursor)
  is
       var_record_date date := add_months(trunc(sysdate, 'MM'), -1);
       var_year date := to_date('01-jan-'||pr_year);
  begin
      begin
          select
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
       select /*+ CARDINALITY(res, 10) CARDINALITY(comp, 10)*/
          nvl(comp.branch_name, 'TCT Bảo Việt Nhân Thọ') branch_name,
          round(sum(case when res.outlet_type_id = 1 then nvl(res.money, 0) end), 2) outlet_type_1,
          round(sum(case when res.outlet_type_id = 2 then nvl(res.money, 0) end), 2) outlet_type_2,
          round(sum(case when res.outlet_type_id = 3 then nvl(res.money, 0) end), 2) outlet_type_3,
          round(sum(case when res.outlet_type_id = 4 then nvl(res.money, 0) end), 2) outlet_type_4,
          round(sum(case when res.outlet_type_id = 5 then nvl(res.money, 0) end), 2) outlet_type_5
       from
        (
            select  /*+ CARDINALITY(a, 10) */
                a.outlet_ams_id branch_ams_id,
                replace(a.outlet_name, 'Bảo Việt Nhân Thọ', '') branch_name
            from ams.dbw_outl_informations a
            where a.outlet_type = 'CTTV'
                and a.dbw_code = 'MAIN'
                and a.dbw_time = 'MONT'
                and a.record_date = var_record_date
                and
                (
                   nvl(pr_company_ams_id, '0') = '0'
                   or
                   a.outlet_ams_id = pr_company_ams_id
                )
             union all
              select
                   'T100000007' branch_ams_id,
                   'TCT Bảo Việt Nhân Thọ' branch_name
              from dual
              where 'T100000007' = pr_company_ams_id
                 or nvl(pr_company_ams_id, '0') = '0'
        ) comp
        join
        (
             select /*+ CARDINALITY(pro, 10) CARDINALITY(pay, 10) CARDINALITY(emule, 10) CARDINALITY(emule_type, 10) */
                    pro.prog_program_id,
                    pro.prog_company_ams_id,
                    outl_detail.outlet_type_id,
                    decode(outl_type.qty, 0, 0, pay.resu_money/outl_type.qty) money
             from
             (
                 select   /*+ CARDINALITY(a, 10) */
                    a.prog_program_id,
                    a.prog_company_ams_id
                 from ams.ep_program a
                 where trunc(a.prog_record_date, 'YYYY') = var_year
                     and a.prog_month_arr like nvl(pr_month, '%')
                     and a.prog_quarter_arr like nvl(pr_quarter, '%')
                     --Bach bao ngay 6 /11 khong can thuc chi qua ke toan cung duoc
                     --and a.prog_status = 4 --da thuc chi qua ke toan thi moi tinh vao
                     and
                     (
                         nvl(pr_company_ams_id, '0') = '0'
                         or
                         a.prog_company_ams_id = pr_company_ams_id
                     )
             ) pro
             join
             (
                 select   /*+ CARDINALITY(a, 10) */
                     a.resu_program_id,
                     sum(nvl(a.resu_money, 0)) resu_money
                 from ams.ep_program_result a
                 group by
                     a.resu_program_id
             )  pay
                 on pay.resu_program_id  = pro.prog_program_id
             join --lay loai dai ly
             (
                 select  /*+ CARDINALITY(a, 10) */
                     a.prot_program_id,
                     a.prot_outlet_type_id outlet_type_id
                 from ams.ep_program_outlet_type a
                 where a.prot_type = 1
                 group by a.prot_program_id,
                     a.prot_outlet_type_id
             ) outl_detail
                 on outl_detail.prot_program_id = pro.prog_program_id
             join --lay danh sach loai thi dua
             (
                 select  /*+ CARDINALITY(a, 10) */
                     a.prot_program_id,
                     nvl(count(a.prot_outlet_type_id), 0) qty
                 from ams.ep_program_outlet_type a
                 where a.prot_type = 1
                 group by
                     a.prot_program_id
             ) outl_type
                 on outl_type.prot_program_id = pro.prog_program_id
         ) res
             on res.prog_company_ams_id = comp.branch_ams_id
         group by comp.branch_name
         order by
            nlssort(comp.branch_name, 'nls_sort=Vietnamese') nulls first;
    end;


end EP_REPORT;
/
