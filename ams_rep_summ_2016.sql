drop table ams_rep_summ_2016;
create table ams_rep_summ_2016
(
  record_date     date,
  branch_ams_id   varchar2(16),
  branch_name     varchar2(255),
  agency_ams_id   varchar2(16),
  agency_name     varchar2(255),
  unit_ams_id     varchar2(16),
  unit_name       varchar2(255),
  outlet_ams_id   varchar2(16),
  outlet_name     varchar2(255),
  regency_code    varchar2(16),
  regency_date    date,
  rp_comm         number(18,2),
  rp_coll         number(18,2),
  rp_comm_total   number(18,2),
  rp_agdn         number(18,2),
  rp_agqr         number(18,2),
  rp_agat         number(18,2),
  rp_agin         number(18,2),
  rp_agem         number(18,2),
  rp_mnbs         number(18,2),
  rp_devu         number(18,2),
  rp_unit         number(18,2),
  rp_deva         number(18,2),
  rp_agency       number(18,2),
  rp_agea         number(18,2),
  rp_remu_total   number(18,2),
  rp_total        number(18,2),
  update_user     varchar2(256),
  update_datetime timestamp(6)
) nologging
partition by range (record_date) interval(numtoyminterval(1, 'month'))
store in (amsm_data)
  (
    partition data_f values less than ('01-jan-2014') tablespace amsm_data
  );
