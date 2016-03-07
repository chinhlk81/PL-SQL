create or replace package ams.AMS_MODL_BILOCATION is
     /*
        Creater: Le Khac Chinh
        Date Create: 1/12/2015
        Version: 1.0
        Description: Them moi nhom
        Parameter:
        Update:
    */
     procedure group_add(
       pr_result_id  in out number,
       pr_group_name varchar2 := null,
       pr_user varchar2);
   /*
      Creater: Le Khac Chinh
      Date Create: 1/12/2015
      Version: 1.0
      Description: Cap nhat nhom
      Parameter:
      Update:
  */
  procedure group_update(
       pr_group_id number := null,
       pr_group_name varchar2 := null,
       pr_user varchar2);

   /*
      Creater: Le Khac Chinh
      Date Create: 1/12/2015
      Version: 1.0
      Description: Xoa nhom
      Parameter:
      Update:
  */
  procedure group_delete(
       pr_group_id number := null,
       pr_user varchar2);
   /*
      Creater: Le Khac Chinh
      Date Create: 1/12/2015
      Version: 1.0
      Description: Xoa het locaton trong 1 nhom
      Parameter:
      Update:
  */
  procedure group_sub_delete(
       pr_group_id number := null,
       pr_user varchar2);

   /*
      Creater: Le Khac Chinh
      Date Create: 1/12/2015
      Version: 1.0
      Description: Xoa 1 locaton
      Parameter:
      Update:
  */
  procedure group_sub_delete_location(
       pr_group_id number := null,
       pr_location_ams_id varchar2 := null,
       pr_user varchar2);

   /*
      Creater: Le Khac Chinh
      Date Create: 1/12/2015
      Version: 1.0
      Description: Lay danh sach cac nhom
      Parameter:
      Update:
  */
  procedure get_group_all(
       pr_user varchar2,
       row_records in out sys_refcursor);

   /*
      Creater: Le Khac Chinh
      Date Create: 1/12/2015
      Version: 1.0
      Description: Lay chi tiet 1 nhom
      Parameter:
      Update:
  */
  procedure get_group(
       pr_group_id number := null,
       pr_user varchar2,
       row_records in out sys_refcursor);
  procedure get_company(
       row_records in out sys_refcursor);
   /*
      Creater: Le Khac Chinh
      Date Create: 1/12/2015
      Version: 1.0
      Description:  Luu location thuoc 1 nhom
      Parameter:
      Update:
  */
  procedure location_save(
       pn_group_id number := null,
       pv_location_ams_id varchar2 := null,
       pv_location_name varchar2 := null,
       pv_user varchar2);
   /*
      Creater: Le Khac Chinh
      Date Create: 1/12/2015
      Version: 1.0
      Description:  lay danh sach cac location thuoc 1 nhom
      Parameter:
      Update:
  */
  procedure get_group_sub(
       pr_group_id number := null,
       pr_user varchar2,
       row_records in out sys_refcursor);
   /*
      Creater: Le Khac Chinh
      Date Create: 1/12/2015
      Version: 1.0
      Description:  Chon nhom truc tiep thuoc ban
      Parameter:
      Update:
  */
   procedure location_save_direct(
       pn_group_id number := null,
       pv_location_ams_id varchar2 := null,
       pn_direct number := null,
       pv_user varchar2);
end AMS_MODL_BILOCATION;
/
create or replace package body ams.AMS_MODL_BILOCATION is
     /*
        Creater: Le Khac Chinh
        Date Create: 1/12/2015
        Version: 1.0
        Description: Them moi nhom
        Parameter:
        Update:
    */
     procedure group_add(
       pr_result_id  in out number,
       pr_group_name varchar2 := null,
       pr_user varchar2)
  is
      var_company_group_seq number(18) := 0;
  begin
      pr_result_id := 0;
      var_company_group_seq := ept_group_company_seq.nextval;

      insert /*+ APPEND */ into  ams_ept_group nologging (
          grou_group_id,
          grou_name,
          grou_status,
          grou_create_user,
          grou_update_user,
          grou_create_datetime,
          grou_update_datetime
      )
      values (
          var_company_group_seq,
          pr_group_name,
          AMS_CORE_CODE.OBJECT_STATUS_INACTIVE,
          pr_user,
          pr_user,
          sysdate,
          sysdate
      );
      commit;

      insert into ams_ept_lpermission nologging (
          user_group_id,
          data_group_id,
          is_read,
          is_write,
          is_execute,
          code_permission,
          maintain_user,
          maintain_time
      )
      select /*+ CARDINALITY(up, 10) */
          up.group_id,
          var_company_group_seq,
          1,
          1,
          1,
          '111',
          pr_user,
          sysdate
      from cla_user_permission up
      where up.user_name = pr_user;
      commit;
      pr_result_id := var_company_group_seq;
      exception
          when others then
              rollback;
              pr_result_id := 0;
  end;
   /*
      Creater: Le Khac Chinh
      Date Create: 1/12/2015
      Version: 1.0
      Description: Cap nhat nhom
      Parameter:
      Update:
  */
  procedure group_update(
       pr_group_id number := null,
       pr_group_name varchar2 := null,
       pr_user varchar2)
  is
      var_status_code varchar2(10):=null;
  begin
      if (pr_user is null) then
          goto procedure_end;
      end if;
      -- Buoc 01: Cap nhat ten nhom
      update ams_ept_group a
      set a.grou_name = pr_group_name,
         a.grou_update_user = pr_user,
         a.grou_update_datetime = sysdate
      where a.grou_group_id = pr_group_id;

      -- Buoc 03: Cap nhat trang thai thanh active neu dang la inactive
      begin
          select a.grou_status
              into var_status_code
          from ams_ept_group a
          where a.grou_group_id =  pr_group_id;
      exception
          when others then
              var_status_code := AMS_CORE_CODE.OBJECT_STATUS_INACTIVE;
      end;
      if var_status_code = AMS_CORE_CODE.OBJECT_STATUS_INACTIVE then
          update ams_ept_group a
          set  a.grou_status = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE,
              a.grou_update_user = pr_user,
              a.grou_update_datetime = sysdate
          where a.grou_group_id =  pr_group_id
              and a.grou_status = AMS_CORE_CODE.OBJECT_STATUS_INACTIVE;
          commit;
      end if;
      <<procedure_end>>
          null;
      exception
          when others then
              rollback;
  end;

   /*
      Creater: Le Khac Chinh
      Date Create: 1/12/2015
      Version: 1.0
      Description: Xoa nhom
      Parameter:
      Update:
  */
  procedure group_delete(
       pr_group_id number := null,
       pr_user varchar2)
  is
  begin
      if (pr_user is null) then
          goto procedure_end;
      end if;
      delete
      from ams_ept_group_company a
      where a.grco_group_id = pr_group_id;
      commit;
      delete
      from ams_ept_group a
      where a.grou_group_id = pr_group_id;
      commit;
      <<procedure_end>>
          null;
      exception
          when others then
              rollback;
  end;


   /*
      Creater: Le Khac Chinh
      Date Create: 1/12/2015
      Version: 1.0
      Description: Xoa het locaton trong 1 nhom
      Parameter:
      Update:
  */
  procedure group_sub_delete(
       pr_group_id number := null,
       pr_user varchar2)
  is
  begin
      if (pr_user is null) then
          goto procedure_end;
      end if;
      delete
      from ams_ept_group_company a
      where a.grco_group_id = pr_group_id;
      commit;
      <<procedure_end>>
          null;
      exception
          when others then
              rollback;
  end;

   /*
      Creater: Le Khac Chinh
      Date Create: 1/12/2015
      Version: 1.0
      Description: Xoa 1 locaton
      Parameter:
      Update:
  */
  procedure group_sub_delete_location(
       pr_group_id number := null,
       pr_location_ams_id varchar2 := null,
       pr_user varchar2)
  is
  begin
      if (pr_user is null) then
          goto procedure_end;
      end if;
      delete
      from ams_ept_group_company a
      where a.grco_group_id = pr_group_id
          and a.grco_location_ams_id = pr_location_ams_id;
      commit;
      <<procedure_end>>
          null;
      exception
          when others then
              rollback;
  end;

   /*
      Creater: Le Khac Chinh
      Date Create: 1/12/2015
      Version: 1.0
      Description: Lay danh sach cac nhom
      Parameter:
      Update:
  */
  procedure get_group_all(
       pr_user varchar2,
       row_records in out sys_refcursor)
  is
  begin
        if (pr_user is null) then
            goto procedure_end;
        end if;
       open row_records for
       select  /*+ CARDINALITY(main, 10)  CARDINALITY(grop, 10) */
          grop.group_id,
          grop.grou_name,
          grop.create_datetime create_datetime
        from
        (
            select /*+ CARDINALITY(us, 10) CARDINALITY(lper, 10) */
                lper.data_group_id
            from
            (
                select /*+ CARDINALITY(up, 10) */
                    *
                from cla_user_permission up
                where up.user_name = pr_user
            ) us
            join
            (
                select   /*+ CARDINALITY(lp, 10) */
                    *
                from ams_ept_lpermission lp
                where lp.code_permission like '1__'
            ) lper
                on lper.user_group_id = us.group_id
           group by lper.data_group_id
       ) main
       join
       (
           select /*+ CARDINALITY(a, 10) */
              eg.grou_group_id group_id,
              eg.grou_name grou_name,
              eg.grou_create_datetime create_datetime
           from ams.ams_ept_group eg
           where eg.grou_status = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
        ) grop
          on grop.group_id = main.data_group_id
       order by
          nlssort( grop.grou_name, 'nls_sort=Vietnamese') nulls first;
        <<procedure_end>>
            null;
  end;

   /*
      Creater: Le Khac Chinh
      Date Create: 1/12/2015
      Version: 1.0
      Description: Lay chi tiet 1 nhom
      Parameter:
      Update:
  */
  procedure get_group(
       pr_group_id number := null,
       pr_user varchar2,
       row_records in out sys_refcursor)
  is
  begin
      if (pr_user is null) then
          goto procedure_end;
      end if;
       open row_records for
       select
          grop.group_id,
          grop.grou_name,
          grop.grou_status
        from
        (
            select /*+ CARDINALITY(up, 10) */
                *
            from cla_user_permission up
            where up.user_name = pr_user
        ) us
        join
        (
            select   /*+ CARDINALITY(lp, 10) */
                *
            from ams_ept_lpermission lp
            where lp.code_permission like '1__'
        ) lper
            on lper.user_group_id = us.group_id
       join
       (
           select /*+ CARDINALITY(a, 10) */
              eg.grou_group_id group_id,
              eg.grou_name grou_name,
              eg.grou_status
           from ams.ams_ept_group eg
           where eg.grou_group_id = pr_group_id
               and eg.grou_status = AMS_CORE_CODE.OBJECT_STATUS_ACTIVE
        ) grop
          on grop.group_id = lper.data_group_id;
        <<procedure_end>>
            null;
  end;

  procedure get_company(
       row_records in out sys_refcursor)
  is
  begin
       open row_records for
       select  /*+ CARDINALITY(a, 10) */
           a.dmcm_company_ams_id company_ams_id,
           a.dmcm_company_name company_name
       from ep_dm_company a
      order by
          nlssort(a.dmcm_company_name, 'nls_sort=Vietnamese') nulls first;
  end;
   /*
      Creater: Le Khac Chinh
      Date Create: 1/12/2015
      Version: 1.0
      Description:  Luu location thuoc 1 nhom
      Parameter:
      Update:
  */
  procedure location_save(
       pn_group_id number := null,
       pv_location_ams_id varchar2 := null,
       pv_location_name varchar2 := null,
       pv_user varchar2)
  is
  begin
      if pn_group_id > 0 and pv_user is not null then
          insert /*+ APPEND */ into ams_ept_group_company nologging (
              grco_group_id,
              grco_company_ams_id, --can phai xoa bo cot nay di thi se duoc nhe
              grco_location_ams_id,
              grco_location_name,
              grco_location_type,
              grco_create_user,
              grco_update_user,
              grco_create_datetime,
              grco_update_datetime
          )
          select /*+ CARDINALITY(a, 10) */
              pn_group_id,
              pv_location_ams_id,
              pv_location_ams_id,
              pv_location_name,
              case substr(pv_location_ams_id, 1, 1)
                  when 'B' then 'CTTV'
                  when 'S' then 'VPDD'
                  when 'A' then 'BAN'
                  when 'U' then 'NHOM'
              end,
              pv_user,
              pv_user,
              sysdate,
              sysdate
          from
          (
              select pv_location_ams_id location_ams_id
              from dual
              minus
              select a.grco_location_ams_id location_ams_id
              from ams_ept_group_company a
              where a.grco_group_id = pn_group_id
          )
          commit;
      end if;
        exception
            when others then
                AMS_MODL_LOGS.error_detail(AMS_MODL_LOGS.LOG_TYPE_TIME,
                    '[AMS_MODL_BILOCATION.location_save] ' || '  ' || pv_location_ams_id ||  '  '  || to_char(pn_group_id) ||  '  ' || SQLERRM);
  end;


   /*
      Creater: Le Khac Chinh
      Date Create: 1/12/2015
      Version: 1.0
      Description:  lay danh sach cac location thuoc 1 nhom
      Parameter:
      Update:
  */
  procedure get_group_sub(
       pr_group_id number := null,
       pr_user varchar2,
       row_records in out sys_refcursor)
  is
  begin
      if (pr_user is null) then
          goto procedure_end;
      end if;
       open row_records for
       select /*+ CARDINALITY(a, 10)   */
          a.grco_location_ams_id location_ams_id,
          case substr(a.grco_location_ams_id, 1, 1)
              when 'B' then 'CTTV'
              when 'S' then 'VPDD'
              when 'A' then 'BAN'
              when 'U' then 'NHOM'
          end type_code,
          a.grco_location_name  location_name,
          decode(a.grco_direct_type, 'Y', 1, 0) direct_type
       from ams.ams_ept_group_company  a
       where a.grco_group_id = pr_group_id
       order by
          nlssort(a.grco_location_name, 'nls_sort=Vietnamese') nulls first;
      <<procedure_end>>
          null;
  end;

   /*
      Creater: Le Khac Chinh
      Date Create: 1/12/2015
      Version: 1.0
      Description:  Chon nhom truc tiep thuoc ban
      Parameter:
      Update:
  */
   procedure location_save_direct(
       pn_group_id number := null,
       pv_location_ams_id varchar2 := null,
       pn_direct number := null,
       pv_user varchar2)
  is
  begin
      --B1:cap nhat lai trang thai active  cho no
       update ams_ept_group_company a
       set a.grco_direct_type = decode(pn_direct, 1, 'Y', null),
           a.grco_update_datetime = sysdate,
           a.grco_update_user = pv_user
       where  a.grco_group_id = pn_group_id
          and a.grco_location_ams_id = pv_location_ams_id
          and a.grco_location_type = 'BAN';
       commit;
  end;
end AMS_MODL_BILOCATION;
/
