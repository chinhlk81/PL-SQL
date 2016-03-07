drop table ams_rep_pmbs_2016_data;
create table ams_rep_pmbs_2016_data
(
  record_date     date,
  outlet_ams_id   varchar2(16),
  outlet_name     varchar2(255),
  branch_ams_id   varchar2(16),
  branch_name     varchar2(255),
  agency_ams_id   varchar2(16),
  agency_name     varchar2(255),
  unit_ams_id     varchar2(16),
  unit_name       varchar2(255),
  location_ams_id varchar2(16),
  regency_code    varchar2(32),
  regency_date    date,
  effe_date       date,
  term_date       date,
  empl_ams_id     varchar2(16),
  empl_ddate      date,
  drempl          varchar2(1),
  period_fyp      number(18,2),
  period_fyc      number(18,2),
  comp_fyc        number(18,2)
) nologging
partition by range (record_date) interval(numtoyminterval(1, 'month'))
store in (amsm_data)
  (
    partition data_f values less than ('01-jan-2014') tablespace amsm_data
  );
