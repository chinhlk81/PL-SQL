drop table ams_indx_outlets;
create table ams_indx_outlets
(
  data_date     date,
  data_main     varchar2(16),
  data_code     varchar2(16),
  outlet_ams_id varchar2(16),
  indx_number   number(16,2),
  indx_text     varchar2(64),
  indx_date     date,
  maintain_user varchar2(64),
  maintain_time timestamp(6)
) nologging
partition by range (data_date) interval(numtoyminterval(1, 'month'))
store in (amsm_data)
  (
    partition data_f values less than ('01-jan-2014') tablespace amsm_data
  );
