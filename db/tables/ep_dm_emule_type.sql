drop table ep_dm_emule_type;
create table ep_dm_emule_type
(
  emty_type_id         number(4),
  emty_type_name       varchar2(128),
  emty_type_desc       varchar2(128),
  emty_type_order       number(4),
  emty_create_user     varchar2(64),
  emty_update_user     varchar2(64),
  emty_create_datetime timestamp(6),
  emty_update_datetime timestamp(6)
) tablespace amsm_data;
create index ep_dm_emule_type_i01
  on ep_dm_emule_type (emty_type_id)
  tablespace amsm_indexes;
-- add comments to the columns 
comment on column ep_dm_emule_type.emty_type_name
  is 'tên loại thi đua';
comment on column ep_dm_emule_type.emty_type_desc
  is 'mô tả thêm ';
comment on column ep_dm_emule_type.emty_type_order
  is 'thu tu ';
