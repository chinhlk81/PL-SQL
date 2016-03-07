drop table ams_rep_pmem_2016;
create table ams_rep_pmem_2016
(
  data_date            date,
  data_type            varchar2(16),
  data_pays            varchar2(16),
  data_branch_ams_id   varchar2(16),
  data_branch_name     varchar2(255),
  data_agency_ams_id   varchar2(16),
  data_agency_name     varchar2(255),
  data_unit_ams_id     varchar2(16),
  data_unit_name       varchar2(255),
  data_outlet_ams_id   varchar2(16),
  data_outlet_name     varchar2(255),
  data_effective_date  date,
  data_regency_code    varchar2(32),
  data_regency_date    date,
  data_employment_date date,
  empl_outlet_ams_id   varchar2(16),
  empl_outlet_name     varchar2(255),
  empl_effe_date       date,
  empl_term_date       date,
  indx_d90             number(5),
  indx_fyc             number(16,2),
  indx_rate            number(5,2),
  indx_money           number(16,2),
  maintain_user        varchar2(64),
  maintain_time        timestamp(6)
) nologging
partition by range (data_date) interval(numtoyminterval(1, 'month'))
store in (amsm_data)
  (
    partition data_f values less than ('01-jan-2014') tablespace amsm_data
  );
