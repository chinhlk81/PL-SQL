drop table ep_program;
create table ep_program
(
  prog_program_id         number(10) not null,
  prog_company_ams_id   varchar2(16),
  prog_record_date      date,
  prog_doc_no           varchar2(64) not null,
  prog_doc_date         date,
  prog_program_name     varchar2(256) not null,
  prog_program_desc     varchar2(256),
  prog_from_date        date,
  prog_to_date          date,
  prog_emule_role       number(1),
  prog_emule_period_id    number(4),
  prog_emule_object_name varchar2(400),
  prog_target_object_name varchar2(400),
  prog_status           number(1),
  prog_month_arr     varchar2(64),
  prog_quarter_arr        varchar2(64),
  prog_create_user      varchar2(64),
  prog_update_user      varchar2(64),
  prog_create_datetime  timestamp(6),
  prog_update_datetime  timestamp(6)
) nologging
  partition by range (prog_doc_date) interval(numtoyminterval(1, 'month'))
  store in (amsm_data)
    (
      partition data_f values less than ('01-jan-2010') tablespace amsm_data
    );    
alter table ep_program
  add constraint ep_program_pk primary key (prog_program_id);
create index ams.ep_program_i01 on ams.ep_program (prog_company_ams_id)
  tablespace amsm_indexes;
create index ams.ep_program_i02 on ams.ep_program (prog_record_date)
  tablespace amsm_indexes;
create index ams.ep_program_i03 on ams.ep_program ( trunc(prog_record_date, 'YYYY'))
  tablespace amsm_indexes;  
-- add comments to the columns 
comment on column ep_program.prog_program_id
  is 'tự tăng';
comment on column ep_program.prog_company_ams_id
  is 'mã của công ty ra chương trình thi đua';
comment on column ep_program.prog_record_date
  is 'là tháng đưa chương trình thi đua vào là thuộc tháng nào làm tròn tháng ở đây';
comment on column ep_program.prog_doc_no
  is 'số công văn';
comment on column ep_program.prog_doc_date
  is 'ngày ra công văn';
comment on column ep_program.prog_program_name
  is 'tên chương trình thi đua';
comment on column ep_program.prog_program_desc
  is 'mô tả thêm';
comment on column ep_program.prog_from_date
  is 'thời gian thi đua từ ngày';
comment on column ep_program.prog_to_date
  is 'thời gian thi đua  đến ngày';
comment on column ep_program.prog_emule_role
  is '1: là chương trình của tct, 2: là chương trình của cttv';
comment on column ep_program.prog_emule_object_name
  is 'thi đua dành cho loại đại lý nào ở đây';
comment on column ep_program.prog_target_object_name
  is 'thi đua nhắm tới sử dụng kết quả của đối  tượng nào ở đây';
comment on column ep_program.prog_status
  is '1: chưa tổng kết ( chưa upload file) 2.đã tổng kết (đã upload file)';
