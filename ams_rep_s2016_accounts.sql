drop table ams_rep_s2016_accounts;
create table ams_rep_s2016_accounts
(
  record_date      date,
  in_branch_ams_id varchar2(16),
  in_branch_name   varchar2(255),
  in_agency_ams_id varchar2(16),
  in_agency_name   varchar2(255),
  in_unit_ams_id   varchar2(16),
  in_unit_name     varchar2(255),
  in_outlet_ams_id varchar2(16),
  in_outlet_name   varchar2(255),
  in_regency_code  varchar2(32),
  in_effe_date     date,
  in_term_date     date,
  account_id       varchar2(32),
  edate            date,
  idate            date,
  cdate            date,
  tdate            date,
  rp_freq          number(5,2),
  rp_ip            number(18,2),
  rp_fyp           number(18,2),
  rp_afyp          number(18,2),
  rp_topup         number(18,2),
  rp_cycle        number(5),
  rp_insured_name varchar2(255),
  maintain_user    varchar2(64),
  maintain_time    timestamp(6)
) tablespace amsm_data nologging;
create index ams_rep_s2016_accounts_i01 on ams_rep_s2016_accounts (in_outlet_ams_id)
  tablespace amsm_indexes; 
create index ams_rep_s2016_accounts_i02 on ams_rep_s2016_accounts (account_id)
  tablespace amsm_indexes;  
