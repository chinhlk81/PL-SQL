drop table ams_rep_agep_2016;
create table ams_rep_agep_2016
(
  record_date         date,
  outlet_ams_id       varchar2(16),
  outlet_name         varchar2(255),
  branch_ams_id       varchar2(16),
  branch_name         varchar2(255),
  sub_branch_ams_id   varchar2(16),
  sub_branch_name     varchar2(255),
  agency_ams_id       varchar2(16),
  agency_name         varchar2(255),
  unit_ams_id         varchar2(16),
  unit_name           varchar2(255),
  regency_code        varchar2(16),
  regency_date        date,
  effe_date           date,
  term_date           date,
  seniority           number(10,2),
  period_fyp          number(18,2),
  pile_pis            number(5),
  succ_certificate    varchar2(16),
  module_busi         varchar2(16),
  agep_asmt           varchar2(16),
  new_regency_date    date,
  new_regency_code    varchar2(16),
  maintain_user       varchar2(64),
  maintain_time       timestamp(6)
) nologging
partition by range (record_date) interval(numtoyminterval(1, 'month'))
store in (amsm_data)
  (
    partition data_f values less than ('01-jan-2014') tablespace amsm_data
  );
