drop table ep_program_outlet_type;
create table ep_program_outlet_type
(
  prot_program_id      number(10),
  prot_outlet_type_id  number(4),
  prot_type           number(1),
  prot_create_user     varchar2(64),
  prot_update_user     varchar2(64),
  prot_create_datetime timestamp(6),
  prot_update_datetime timestamp(6)
)  tablespace amsm_data;
create index ams.ep_program_outlet_type_i01 on ams.ep_program_outlet_type (prot_program_id)
  tablespace amsm_indexes;
create index ams.ep_program_outlet_type_i02 on ams.ep_program_outlet_type (prot_outlet_type_id)
  tablespace amsm_indexes;
-- Add comments to the columns 
comment on column ep_program_outlet_type.prot_program_id
  is 'Mã chương trình thi đua';
comment on column ep_program_outlet_type.prot_outlet_type_id
  is 'Loại đại lý tham gia có thể có nhiều đại lý tham gia trong chương trình thi đua này cho nó';
comment on column ep_program_outlet_type.prot_type
  is 'Loại đại lý để có thể  lấy ra số lượng cho nó 1: Đối tượng thi đua 2. Đối tượng nhắm tới ';
