drop table ams_indx_locations;
create table ams_indx_locations
(
  data_date     date,
  data_code     varchar2(16),
  root_ams_id   varchar2(16),
  root_type     varchar2(16),
  root_name     varchar2(255),
  chil_ams_id   varchar2(16),
  chil_type     varchar2(16),
  chil_name     varchar2(255),
  indx_ext      varchar2(16),
  indx_code     varchar2(16),
  maintain_user varchar2(64),
  maintain_time timestamp(6)
) nologging
partition by range (data_date) interval(numtoyminterval(1, 'month'))
store in (amsm_data)
  (
    partition data_f values less than ('01-jan-2014') tablespace amsm_data
  );
