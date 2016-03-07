drop table ams_ept_analyze_store_tmp;
create table ams_ept_analyze_store_tmp
(
  anal_user_id         varchar2(64) not null,
  anal_store_id        number(16) not null,
  anal_group_id        number(16),
  anal_company_ams_id  varchar2(16),
  anal_name            varchar2(256),
  anal_doc_no          varchar2(64),
  anal_module_type_id  number(5),
  anal_program_id      number(16),
  anal_code            varchar2(16),
  anal_create_user     varchar2(64),
  anal_update_user     varchar2(64),
  anal_create_datetime timestamp(6),
  anal_update_datetime timestamp(6)
) tablespace amsm_data;
alter table ams_ept_analyze_store_tmp
  add constraint ams_ept_analyze_store_tmp_pk primary key (anal_store_id, anal_user_id);   
comment on column ams_ept_analyze_store_tmp.anal_store_id
  is 'mã tự tăng của nó lên đối với điều kiện ràng buộc';
comment on column ams_ept_analyze_store_tmp.anal_company_ams_id
  is 'ma cong ty cua user de cho cong ty xem';
comment on column ams_ept_analyze_store_tmp.anal_name
  is 'ten cua group';
comment on column ams_ept_analyze_store_tmp.anal_doc_no
  is 'so cong van';
