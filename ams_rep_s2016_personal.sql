drop table ams_rep_s2016_personal;
create table ams_rep_s2016_personal
(
  record_date   date,
  outlet_ams_id varchar2(16),
  outlet_name   varchar2(255),
  branch_ams_id varchar2(16),
  branch_name   varchar2(255),
  agency_ams_id varchar2(16),
  agency_name   varchar2(255),
  unit_ams_id   varchar2(16),
  unit_name     varchar2(255),
  regency_code  varchar2(32),
  effe_date     date,
  term_date     date,
  s_indx       number(16,2),
  s1_indx       number(16,2),
  s2_indx       number(16,2),
  s3_indx       number(16,2),
  s4_indx       number(16,2),
  sum_indx       number(16,2),
  s_crate       number(5,2),
  s_urate       number(5,2),
  s_rate       number(5,2),
  maintain_user varchar2(64),
  maintain_time timestamp(6)
) tablespace amsm_data nologging;
create index ams_rep_s2016_personal_i01 on ams_rep_s2016_personal (branch_ams_id, agency_ams_id, unit_ams_id)
  tablespace amsm_indexes;
create index ams_rep_s2016_personal_i02 on ams_rep_s2016_personal (outlet_ams_id)
  tablespace amsm_indexes;
