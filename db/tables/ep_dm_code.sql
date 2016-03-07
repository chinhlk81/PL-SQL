drop table ep_dm_code;
create table ep_dm_code
( 
  dmco_code       varchar2(128),
  dmco_value       varchar2(128),
  dmco_desc       varchar2(256),
  dmco_status       varchar2(128),
  dmco_create_user     varchar2(64),
  dmco_update_user     varchar2(64),
  dmco_create_datetime timestamp(6),
  dmco_update_datetime timestamp(6)
) tablespace amsm_data;
create index ep_dm_code_i01
  on ep_dm_code (dmco_code)
  tablespace amsm_indexes;
-- add comments to the columns 
comment on column ep_dm_code.dmco_code
  is 'Mã';
comment on column ep_dm_code.dmco_value
  is 'giá trị';
comment on column ep_dm_code.dmco_desc
  is 'mô tả thêm ';
