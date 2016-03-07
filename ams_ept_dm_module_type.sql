drop table ams_ept_dm_module_type;
create table ams_ept_dm_module_type
(
  moty_type_id         number(4) not null,
  moty_type_name       varchar2(128) not null,
  moty_type_desc       varchar2(128),
  moty_create_user     varchar2(64),
  moty_update_user     varchar2(64),
  moty_create_datetime timestamp(6),
  moty_update_datetime timestamp(6)
) tablespace amsm_data; 
alter table ams_ept_dm_module_type
  add constraint ams_ept_dm_module_type_pk primary key (moty_type_id);
comment on column ams_ept_dm_module_type.moty_type_id
  is 'mã tự tăng';
comment on column ams_ept_dm_module_type.moty_type_name
  is 'tên ví dụ là module thu 1 thu 2';
