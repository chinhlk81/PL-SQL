drop table ams_rep_agep_2016_data;
create table ams_rep_agep_2016_data
(
  record_date     date,
  data_date       date,
  branch_ams_id   varchar2(16),
  outlet_ams_id   varchar2(16),
  effe_date       date,
  term_date       date,
  period_fyp      number(18,2),
  pile_pis        number(5)
) nologging
partition by range (record_date) interval(numtoyminterval(1, 'month'))
store in (amsm_data)
  (
    partition data_f values less than ('01-jan-2014') tablespace amsm_data
  );
