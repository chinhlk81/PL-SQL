drop table ams_con_s2016_customer_tmp;
create table ams_con_s2016_customer_tmp
(
  account_id       varchar2(32),
  customer_id varchar2(32),                        
  customer_name varchar2(255),
  maintain_time    timestamp(6)
) tablespace amsm_data nologging; 
create index ams_con_s2016_customer_tmp_i01 on ams_con_s2016_customer_tmp (account_id)
  tablespace amsm_indexes; 
