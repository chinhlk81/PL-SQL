drop table ams_rep_umbs_2016;
create table ams_rep_umbs_2016
(
  data_date              date,
  data_ams_id            varchar2(16),
  data_branch_ams_id     varchar2(16),
  data_branch_name       varchar2(255),
  data_agency_ams_id     varchar2(16),
  data_agency_name       varchar2(255),
  data_unit_ams_id       varchar2(16),
  data_unit_name         varchar2(255),
  data_outlet_ams_id     varchar2(16),
  data_outlet_name       varchar2(255),
  outlet_regency_code    varchar2(32),
  outlet_regency_date    date,
  outlet_effective_date  date,
  outlet_terminal_date   date,
  unit_fyp               number(16,2),
  more_fyp               number(16,2),
  indx_fyp               number(16,2),
  unit_fyc               number(16,2),
  more_fyc               number(16,2),
  indx_fyc               number(16,2),
  comp_ratio             number(5,2),
  comp_money             number(18,2),
  comp_p                 number(5),
  comp_c                 number(5,2),
  income_money           number(16,2),
  maintain_user          varchar2(64),
  maintain_time          timestamp(6)
) nologging
partition by range (data_date) interval(numtoyminterval(1, 'month'))
store in (amsm_data)
  (
    partition data_f values less than ('01-jan-2014') tablespace amsm_data
  );
