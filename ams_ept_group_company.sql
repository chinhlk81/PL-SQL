drop table ams_ept_group_company;
create table ams_ept_group_company
(
  grco_group_id        number(18) not null,
  grco_company_ams_id  varchar2(32) not null,
  grco_location_ams_id varchar2(32) not null,
  grco_location_type   varchar2(32),
  grco_direct_type     varchar2(32),
  grco_location_name   varchar2(256),
  grco_create_user     varchar2(32),
  grco_update_user     varchar2(32),
  grco_create_datetime timestamp(6),
  grco_update_datetime timestamp(6)
) tablespace amsm_data; 
alter table ams_ept_group_company
  add constraint ams_ept_group_company_pk primary key (grco_group_id, grco_company_ams_id, grco_location_ams_id);
create index ams_ept_group_company_i01 on ams_ept_group_company (grco_company_ams_id)
  tablespace amsm_indexes;
comment on column ams_ept_group_company.grco_group_id
  is 'mã nhóm tự tăng';
comment on column ams_ept_group_company.grco_location_ams_id
  is 'mã phong ban nhom';
comment on column ams_ept_group_company.grco_location_type
  is 'la phong ban hay nhom';
comment on column ams_ept_group_company.grco_direct_type
  is '= y  la nhom truc tiep, = n hay = null  la toan ban';
