drop table ep_program_company;
create table ep_program_company
(
  prco_program_id    number(10),
  prco_company_ams_id varchar2(64), 
  prco_create_user     varchar2(64),
  prco_update_user     varchar2(64),
  prco_create_datetime timestamp(6),
  prco_update_datetime timestamp(6)
)  tablespace amsm_data;
create index ams.ep_program_company_i01 on ams.ep_program_company (prco_program_id)
  tablespace amsm_indexes;
create index ams.ep_program_company_i02 on ams.ep_program_company (prco_company_ams_id)
  tablespace amsm_indexes;
-- Add comments to the columns 
comment on column ep_program_company.prco_program_id
  is 'Mã chương trình thi đua';
comment on column ep_program_company.prco_company_ams_id
  is 'Cong ty tham gia có thể có nhiều Cong ty tham gia trong chương trình thi đua này cho nó'; 
