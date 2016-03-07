drop table ams_rep_umbs_2016_data;
create table ams_rep_umbs_2016_data
(
  data_date             date,
  data_code             varchar2(16),
  data_ams_id           varchar2(16),
  data_branch_ams_id    varchar2(16),
  data_branch_name      varchar2(255),
  data_agency_ams_id    varchar2(16),
  data_agency_name      varchar2(255),
  data_unit_ams_id      varchar2(16),
  data_unit_name        varchar2(255),
  data_outlet_ams_id    varchar2(16),
  data_outlet_name      varchar2(255),
  outlet_regency_code   varchar2(32),
  outlet_regency_date   date,
  outlet_effective_date date,
  outlet_terminal_date  date,
  indx_urate            number(5,2),
  indx_fyp              number(16,2),
  indx_fyc              number(16,2),
  indx_ufyc             number(16,2),
  maintain_user         varchar2(64),
  maintain_time         timestamp(6)
) nologging
partition by range (data_date) interval(numtoyminterval(1, 'month'))
store in (amsm_data)
  (
    partition data_f values less than ('01-jan-2014') tablespace amsm_data
  );
