drop table ep_program_result;
create table ep_program_result
(
  resu_program_result_id number(10)  not null,
  resu_program_id       number(10),
  resu_company_ams_id   varchar2(16),
  resu_company_account_id   varchar2(128),
  resu_record_date  date,
  resu_outlet_ams_id   varchar2(16),
  resu_outlet_name  varchar2(128),
  resu_company_name   varchar2(256),
  resu_money   number(18,2),
  resu_create_user      varchar2(64),
  resu_update_user      varchar2(64),
  resu_create_datetime  timestamp(6),
  resu_update_datetime  timestamp(6)
)  nologging tablespace amsm_data;
alter table ep_program_result
  add constraint ep_program_result_pk primary key (resu_program_result_id);
create index ams.ep_program_result_i01 on ams.ep_program_result (resu_outlet_ams_id)
  tablespace amsm_indexes; 
create index ams.ep_program_result_i02 on ams.ep_program_result (resu_program_id)
  tablespace amsm_indexes; 
create index ams.ep_program_result_i03 on ams.ep_program_result (resu_company_ams_id)
  tablespace amsm_indexes; 
