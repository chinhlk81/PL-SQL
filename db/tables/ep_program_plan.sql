drop table ep_program_plan;
create table ep_program_plan
(
  prpp_program_plan_id number(10)  not null,
  prpp_record_date date,
  prpp_company_ams_id  varchar2(10),
  prpp_month_1    number(1),
  prpp_month_2    number(1),
  prpp_month_3    number(1),
  prpp_month_4    number(1),
  prpp_month_5    number(1),        
  prpp_month_6    number(1),
  prpp_month_7    number(1),
  prpp_month_8    number(1),
  prpp_month_9    number(1),
  prpp_month_10    number(1),
  prpp_month_11    number(1),
  prpp_month_12    number(1),
  prpp_month_13    number(1),
  prpp_create_user     varchar2(64),
  prpp_update_user     varchar2(64),
  prpp_create_datetime timestamp(6),
  prpp_update_datetime timestamp(6)
)  tablespace amsm_data;
alter table ep_program_plan
  add constraint ep_program_plan_pk primary key (prpp_program_plan_id);
create index ams.ep_program_plan_i01 on ams.ep_program_plan (prpp_company_ams_id)
  tablespace amsm_indexes;
create index ams.ep_program_plan_i02 on ams.ep_program_plan (prpp_record_date)
  tablespace amsm_indexes;
create index ams.ep_program_plan_i03 on ams.ep_program_plan (trunc(prpp_record_date, 'YYYY'))
  tablespace amsm_indexes;
-- Add comments to the table 
comment on table ep_program_plan
  is 'Bảng lưu thang 1 co phat dong thi dua khong';
-- Add comments to the columns 
comment on column ep_program_plan.prpp_record_date
  is 'Năm bao nhiêu ví dụ 1/1/2014 1/1/2015';
comment on column ep_program_plan.prpp_company_ams_id
  is 'Mã công ty với plan như vậy.  Đối với tổng công ty thì là null hay mã tổng công ty ở đây cho nó';
comment on column ep_program_plan.prpp_month_1
  is 'gia tri tháng 1 dua vao prpp_type de tinh cho no '; 
