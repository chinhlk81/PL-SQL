drop table ams_ept_dm_reward_type;
create table ams_ept_dm_reward_type
(
  rety_type_id         number(4) not null,
  rety_type_name       varchar2(128) not null,
  rety_type_desc       varchar2(128),
  rety_type_index      number(18,2),
  rety_create_user     varchar2(64),
  rety_update_user     varchar2(64),
  rety_create_datetime timestamp(6),
  rety_update_datetime timestamp(6)
) tablespace amsm_data; 
alter table ams_ept_dm_reward_type
  add constraint ams_ept_dm_reward_type_pk primary key (rety_type_id);
comment on column ams_ept_dm_reward_type.rety_type_id
  is 'mã tự tăng';
comment on column ams_ept_dm_reward_type.rety_type_name
  is 'tên ví dụ là không, cố định, hay theo phần trăm ip afyp';
comment on column ams_ept_dm_reward_type.rety_type_index
  is 'chi so vi du neu la khong thi = 0 cong neu cac cai khac thi = 1, de xac dinh khi nhan vao cho no';
