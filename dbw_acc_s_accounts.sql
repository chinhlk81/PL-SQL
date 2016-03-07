drop table dbw_acc_s_accounts;
create table dbw_acc_s_accounts
(
  dbw_date         date,
  dbw_core         varchar2(16),
  account_id       varchar2(16),
  in_outlet_ams_id varchar2(16),
  in_branch_ams_id varchar2(16),
  in_agency_ams_id varchar2(16),
  in_unit_ams_id   varchar2(16),
  idate            date,
  edate            date,
  cdate            date,
  tdate            date,
  ip               number(18,2),
  afyp             number(18,2),
  maintain_user    varchar2(64),
  maintain_time    timestamp(6)
) tablespace amsm_data; 
