drop table ams_ept_group;
create table ams_ept_group
(
  grou_group_id        number(18) not null,
  grou_name            varchar2(128),
  grou_status          varchar2(128),
  grou_create_user     varchar2(32),
  grou_update_user     varchar2(32),
  grou_create_datetime timestamp(6),
  grou_update_datetime timestamp(6)
) tablespace amsm_data;
alter table ams_ept_group
  add constraint ams_ept_group_pk primary key (grou_group_id);
comment on column ams_ept_group.grou_group_id
  is 'mã tu tang ';
comment on column ams_ept_group.grou_name
  is 'ten group';
