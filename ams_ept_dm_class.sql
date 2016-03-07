drop table ams_ept_dm_class;
create table ams_ept_dm_class
(
  clas_class_id        number(4) not null,
  clas_class_name      varchar2(128) not null,
  clas_class_desc      varchar2(128),
  clas_create_user     varchar2(64),
  clas_update_user     varchar2(64),
  clas_create_datetime timestamp(6),
  clas_update_datetime timestamp(6)
) tablespace amsm_data; 
alter table ams_ept_dm_class
  add constraint ams_ept_dm_class_pk primary key (clas_class_id);
comment on column ams_ept_dm_class.clas_class_id
  is 'mã tự tăng';
comment on column ams_ept_dm_class.clas_class_name
  is 'tên hạng ví dụ là lớp hợp đồng a b c d e f';
