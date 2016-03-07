drop table ams_con_s2016_accounts;
create table ams_con_s2016_accounts
(
  account_id       varchar2(32),
  outlet_ams_id    varchar2(16),
  in_agency_ams_id varchar2(16),
  in_unit_ams_id   varchar2(16),
  edate            date,
  idate            date,
  cdate            date,
  tdate            date,
  freq_premium     number(18,2),
  freq_per_annum   number(5,2),
  cycle number(5),
  maintain_user    varchar2(64),
  maintain_time    timestamp(6)
) tablespace amsm_data nologging; 
create index ams_con_s2016_accounts_i01 on ams_con_s2016_accounts (outlet_ams_id)
  tablespace amsm_indexes;
create index ams_con_s2016_accounts_i02 on ams_con_s2016_accounts (account_id)
  tablespace amsm_indexes;
