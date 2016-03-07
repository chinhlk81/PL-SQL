drop table ams_ept_index;
create table ams_ept_index
(
  inde_index_id        number(18) not null,
  inde_index_code      varchar2(32),
  inde_index_name      varchar2(128),
  inde_create_user     varchar2(64),
  inde_update_user     varchar2(64),
  inde_create_datetime timestamp(6),
  inde_update_datetime timestamp(6)
) tablespace amsm_data; 
alter table ams_ept_index
  add constraint ams_ept_index_pk primary key (inde_index_id);
create index ams_ept_index_i01 on ams_ept_index (inde_index_code)
  tablespace amsm_indexes; 
