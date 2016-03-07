drop table ep_program_status;
create table ep_program_status
(
  prst_program_id      number(10)  not null,
  prst_add_date      timestamp(6),
  prst_add_user      varchar2(64), 
  prst_calculate_date      timestamp(6),
  prst_calculate_user      varchar2(64), 
  prst_transfer_date      timestamp(6),
  prst_transfer_user      varchar2(64),  
  prst_cac_verify_date      timestamp(6),
  prst_cac_verify_user      varchar2(64), 
  prst_create_user     varchar2(64),
  prst_update_user     varchar2(64),
  prst_create_datetime timestamp(6),
  prst_update_datetime timestamp(6)
)  tablespace amsm_data;
alter table ep_program_status
  add constraint ep_program_status_pk primary key (prst_program_id);
-- Add comments to the columns 
comment on column ep_program_status.prst_program_id
  is 'Mã chương trình thi đua'; 
