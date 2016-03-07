drop table ams_ept_prc_detail_tmp;
create table ams_ept_prc_detail_tmp
(
  prc_store_id        number(10),
  prc_group_id        number(10),
  prc_condition_id    number(10),
  prc_user_id         varchar2(32),
  prc_account_id      varchar2(16),
  prc_ams_outlet_id   varchar2(16),
  ip                  number(18,2),
  afyp                number(18,2),
  fyp                 number(18,2),
  prc_create_user     varchar2(64),
  prc_update_user     varchar2(64),
  prc_create_datetime timestamp(6),
  prc_update_datetime timestamp(6),
  cancel_date         date,
  terminal_date       date,
  prc_ams_agency_id   varchar2(16),
  prc_ams_unit_id     varchar2(16),
  prc_module          number(2)
) tablespace amsm_data; 
comment on column ams_ept_prc_detail_tmp.cancel_date
  is 'huy 14 ngay';
comment on column ams_ept_prc_detail_tmp.terminal_date
  is 'ngay dai ly nghi viec';
comment on column ams_ept_prc_detail_tmp.prc_ams_agency_id
  is 'ban tai thoi diem khai thac';
comment on column ams_ept_prc_detail_tmp.prc_ams_unit_id
  is 'nhom taij thoi diem khai thac';
comment on column ams_ept_prc_detail_tmp.prc_module
  is 'module';
