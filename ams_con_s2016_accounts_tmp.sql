drop table ams_con_s2016_accounts_tmp;
create table ams_con_s2016_accounts_tmp
(
  account_id       varchar2(32),
  outlet_ams_id    varchar2(16),
  outlet_name    varchar2(255),
  agency_ams_id varchar2(16),
  agency_name varchar2(255),
  unit_ams_id   varchar2(16),
  unit_name   varchar2(255),
  branch_ams_id varchar2(16),
  branch_name   varchar2(255),
  regency_code  varchar2(32),
  effe_date     date,
  term_date     date,  
  in_agency_ams_id varchar2(16),
  in_unit_ams_id   varchar2(16),
  edate            date,
  idate            date,
  cdate            date,
  tdate            date,
  freq_premium     number(18,2),
  freq_per_annum   number(5,2),
  topup_premium     number(18,2),
  cycle     number(5),          
  customer_id varchar2(32),                        
  customer_name varchar2(255),                     
  is_exist number(1),
  maintain_user    varchar2(64),
  maintain_time    timestamp(6)
) tablespace amsm_data nologging; 
create index ams_con_s2016_accounts_tmp_i01 on ams_con_s2016_accounts_tmp (outlet_ams_id)
  tablespace amsm_indexes;
create index ams_con_s2016_accounts_tmp_i02 on ams_con_s2016_accounts_tmp (account_id)
  tablespace amsm_indexes; 
create index ams_con_s2016_accounts_tmp_i03 on ams_con_s2016_accounts_tmp (customer_id)
  tablespace amsm_indexes;
