drop table ep_log;
create table ep_log
(
  class_name    varchar2(1024),
  function_name varchar2(1024),
  message       varchar2(1024),
  create_user     varchar2(64),
  create_datetime  timestamp(6)
) tablespace amsm_data; 
