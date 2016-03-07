drop table ep_program_emule_type;
create table ep_program_emule_type
(
  pret_program_id      number(10),
  pret_emule_type_id  number(4),
  pret_create_user     varchar2(64),
  pret_update_user     varchar2(64),
  pret_create_datetime timestamp(6),
  pret_update_datetime timestamp(6)
)  tablespace amsm_data;
create index ams.ep_program_emule_type_i01 on ams.ep_program_emule_type (pret_program_id)
  tablespace amsm_indexes;
create index ams.ep_program_emule_type_i02 on ams.ep_program_emule_type (pret_emule_type_id)
  tablespace amsm_indexes;
-- Add comments to the columns 
comment on column ep_program_emule_type.pret_program_id
  is 'Mã chương trình thi đua ';
comment on column ep_program_emule_type.pret_emule_type_id
  is 'Loại thi đua mà chương trình  thuộc Tuyển dụng, Khai thác, Thu phí, Hội nghị khách hàng';
