drop table ams_ept_condition;
create table ams_ept_condition
(
  cond_condition_id    number(18) not null,
  cond_store_id        number(18),
  cond_group_id        number(18),
  cond_index_id        number(18),
  cond_index_code      varchar2(128),
  cond_date1_from      date,
  cond_date1_to        date,
  cond_date2_from      date,
  cond_date2_to        date,
  cond_create_user     varchar2(64),
  cond_update_user     varchar2(64),
  cond_create_datetime timestamp(6),
  cond_update_datetime timestamp(6)
) tablespace amsm_data; 
alter table ams_ept_condition
  add constraint ams_ept_condition_pk primary key (cond_condition_id);
create index ams_ept_condition_i01 on ams_ept_condition (cond_store_id)
  tablespace amsm_indexes;
create index ams_ept_condition_i02 on ams_ept_condition (cond_index_code)
  tablespace amsm_indexes;
create index ams_ept_condition_i03 on ams_ept_condition (cond_index_id)
  tablespace amsm_indexes;
comment on column ams_ept_condition.cond_condition_id
  is 'mã tự tăng';
comment on column ams_ept_condition.cond_index_id
  is 'mã chỉ tiêu mà cần ràng buộc nó  là mã chỉ tiêu cần ràng buộc cho nó. là điều kiện thi đua lấy ở  bảng ept _index ở phía trên của nó';
comment on column ams_ept_condition.cond_index_code
  is 'mã chỉ tiêu của nó ví dụ là afyp, fyp hay ip của nó có 3 chỉ tiêu này để rang buộc  ví dụ như là đối với hay ví dụ với ''ana_date1'' thì làm như thế ';
comment on column ams_ept_condition.cond_date1_from
  is 'cái này là ngày phát hành từ ngày này đến ngày này';
comment on column ams_ept_condition.cond_date2_from
  is 'cái này là ngày hiệu lực từ ngày này đến ngày này';  
