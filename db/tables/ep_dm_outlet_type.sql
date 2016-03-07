drop table ep_dm_outlet_type;
create table ep_dm_outlet_type
(
  outy_outlet_type_id   number(4),
  outy_outlet_type_name varchar2(128),
  outy_outlet_type_order number(2),
  outy_outlet_desc      varchar2(128),
  outy_create_user      varchar2(64),
  outy_update_user      varchar2(64),
  outy_create_datetime  timestamp(6),
  outy_update_datetime  timestamp(6)
) tablespace amsm_data;
-- add comments to the columns 
comment on column ep_dm_outlet_type.outy_outlet_type_name
  is 'tên loại đại lý';
create index ep_dm_outlet_type_i01
  on ep_dm_outlet_type (outy_outlet_type_id)
  tablespace amsm_indexes;
