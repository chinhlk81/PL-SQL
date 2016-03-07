drop table ams_indx_dtransactions;
create table ams_indx_dtransactions
(
  data_date               date,
  data_code               varchar2(16),
  outlet_ams_id           varchar2(16),
  account_number          varchar2(32),
  acc_effective_date      date,
  acc_issue_date          date,
  acc_begin_date          date,
  acc_trans_date          date,
  acc_fix_date            date,
  acc_premium             number(16,2),
  acc_first_year_premium  number(16,2),
  acc_source_code         varchar2(16),
  maintain_user           varchar2(64),
  maintain_time           timestamp(6)
) nologging
partition by range (data_date) interval(numtoyminterval(1, 'month'))
store in (amsm_data)
  (
    partition data_f values less than ('01-jan-2014') tablespace amsm_data
  );
