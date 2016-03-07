drop table ams_indx_onewbussiness;
create table ams_indx_onewbussiness
(
  data_date               date,
  data_code               varchar2(16),
  data_view               varchar2(16),
  outl_branch_ams_id      varchar2(16),
  outl_branch_name        varchar2(255),
  outl_sub_branch_ams_id  varchar2(16),
  outl_sub_branch_name    varchar2(255),
  outl_agency_ams_id      varchar2(16),
  outl_agency_name        varchar2(255),
  outl_unit_ams_id        varchar2(16),
  outl_unit_name          varchar2(255),
  outl_outlet_ams_id      varchar2(16),
  outl_outlet_name        varchar2(255),
  outl_begin_date         date,
  outl_terminal_date      date,
  empl_outlet_ams_id      varchar2(16),
  empl_outlet_name        varchar2(255),
  account_number          varchar2(32),
  acc_effective_date      date,
  acc_issue_date          date,
  acc_begin_date          date,
  acc_cancel_date         date,
  acc_terminal_date       date,
  acc_freq_premium        number(16,2),
  acc_freq_per_annum      number(5,2),
  acc_ls_premium          number(16,2),
  acc_death_sum_insured   number(16,2),
  acc_annual_rate         number(5,2),
  acc_annual_premium      number(16,2),
  acc_source_code         varchar2(16),
  maintain_user           varchar2(64),
  maintain_time           timestamp(6)
) nologging
partition by range (data_date) interval(numtoyminterval(1, 'month'))
store in (amsm_data)
  (
    partition data_f values less than ('01-jan-2014') tablespace amsm_data
  );
