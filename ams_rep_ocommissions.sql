drop table ams_rep_ocommissions;
create table ams_rep_ocommissions
(
  data_date                   date,
  data_code                   varchar2(16),
  data_view                   varchar2(16),
  outl_branch_ams_id          varchar2(16),
  outl_branch_name            varchar2(255),
  outl_sub_branch_ams_id      varchar2(16),
  outl_sub_branch_name        varchar2(255),
  outl_agency_ams_id          varchar2(16),
  outl_agency_name            varchar2(255),
  outl_unit_ams_id            varchar2(16),
  outl_unit_name              varchar2(255),
  outl_outlet_ams_id          varchar2(16),
  outl_outlet_name            varchar2(255),
  outl_regency_code           varchar2(32),
  outl_channel_code           varchar2(32),
  outl_issue_number           number(5),
  outl_ecommision             date,
  outl_dcommision             date,
  outl_pay_code               varchar2(32),
  outl_commission             number(16,2),
  maintain_user               varchar2(64),
  maintain_time               timestamp(6)
) nologging
partition by range (data_date) interval(numtoyminterval(1, 'month'))
store in (amsm_data)
  (
    partition data_f values less than ('01-jan-2014') tablespace amsm_data
  );
