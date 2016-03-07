drop table ams.ams_ept_lpermission;
create table ams.ams_ept_lpermission
(
  user_group_id   varchar2(16),
  data_group_id   varchar2(16),
  perm_code       varchar2(16),
  is_read         number(1),
  is_write        number(1),
  is_execute      number(1),
  code_permission varchar2(3),
  maintain_user   varchar2(64),
  maintain_time   timestamp(6)
) tablespace amsm_data;
create index ams.ams_ept_lpermission01 on ams.ams_ept_lpermission (user_group_id)
  tablespace amsm_indexes;   
