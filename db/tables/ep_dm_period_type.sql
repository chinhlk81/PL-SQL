drop table ep_dm_period_type;
create table ep_dm_period_type
(
  pety_period_type_id   number(4),
  pety_period_type_name varchar2(128),
  pety_period_type_desc varchar2(128),
  pety_create_user      varchar2(64),
  pety_update_user      varchar2(64),
  pety_create_datetime  timestamp(6),
  pety_update_datetime  timestamp(6)
) tablespace amsm_data;
create index ep_dm_period_type_i01
  on ep_dm_period_type (pety_period_type_id)
  tablespace amsm_indexes;
-- add comments to the columns 
comment on column ep_dm_period_type.pety_period_type_name
  is ' tên loại thi đua vì dụ trong các loại thi đua đã có ở phía trên cho nó'; 
