drop table ep_program_company_payment;
create table ep_program_company_payment
(
  prcp_program_id    number(10),
  prcp_company_ams_id varchar2(64), 
  prcp_create_user     varchar2(64),
  prcp_update_user     varchar2(64),
  prcp_create_datetime timestamp(6),
  prcp_update_datetime timestamp(6)
)  tablespace amsm_data;
create index ams.ep_program_company_payment_i01 on ams.ep_program_company_payment (prcp_program_id)
  tablespace amsm_indexes;
create index ams.ep_program_company_payment_i02 on ams.ep_program_company_payment (prcp_company_ams_id)
  tablespace amsm_indexes;
create index ams.ep_program_company_payment_i03 on ams.ep_program_company_payment (prcp_program_id, prcp_company_ams_id)
  tablespace amsm_indexes;
-- Add comments to the columns 
comment on column ep_program_company_payment.prcp_program_id
  is 'Mã chương trình thi đua';
comment on column ep_program_company_payment.prcp_company_ams_id
  is 'Duoc xu ly cho cong ty nao duoc tra thuong cho no'; 
