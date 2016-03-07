drop table ams_rep_ambs_data_2016;
create table ams_rep_ambs_data_2016
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
  period_fyc      number(18,2),
  ratio_fyc       number(5,2),
  comp_fyc        number(18,2),
  lvunit          number(5),
  ratio_comp      number(5,2),
  comp_money      number(18,2),
  maintain_user   varchar2(64),
  maintain_time   timestamp(6)
) nologging
partition by range (record_date) interval(numtoyminterval(1, 'month'))
store in (amsm_data)
  (
    partition data_f values less than ('01-jan-2014') tablespace amsm_data
  );
