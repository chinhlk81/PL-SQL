drop table ep_file_attach;
create table ep_file_attach
(
  fiat_attach_id       number(10),
  fiat_program_id      number(10),
  fiat_file_name       varchar2(256),
  fiat_file_desc       varchar2(512), 
  fiat_url             varchar2(512),
  fiat_type            number(1),
  fiat_file_size       number(18),
  fiat_acti            number(1),
  fiat_create_user     varchar2(64),
  fiat_update_user     varchar2(64),
  fiat_create_datetime timestamp(6),
  fiat_update_datetime timestamp(6)
)  tablespace amsm_data;
alter table ep_file_attach
  add constraint ep_file_attach_pk primary key (fiat_attach_id);
create index ams.ep_file_attach_i01 on ams.ep_file_attach (fiat_program_id)
  tablespace amsm_indexes;
create index ams.ep_file_attach_i02 on ams.ep_file_attach (fiat_type)
  tablespace amsm_indexes;
create index ams.ep_file_attach_i03 on ams.ep_file_attach (fiat_acti)
  tablespace amsm_indexes;
-- Add comments to the columns 
comment on column ep_file_attach.fiat_program_id
  is 'Mã chương trình thi đua đã có ở phía trên lấy ở trên cho nó để xác định file công văn thuộc chương trình nào. Nếu mà cái program id bằng null tức là cái file đưa lên cho  lo go cho nó';
comment on column ep_file_attach.fiat_type
  is 'fiat_type  =1 la dua len trang chu phia ngang =2 la dua len theo kieu doc cho no, null la cong van thi dua cho no ';
comment on column ep_file_attach.fiat_acti
  is 'fiat_acti  =1 poster acti cho no hien thi len ';
comment on column ep_file_attach.fiat_file_size
  is 'file_size ';
