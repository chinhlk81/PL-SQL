drop table ams_ept_condition_ext;
create table ams_ept_condition_ext
(
  cond_condition_id    number(18) not null,
  cond_store_id        number(18) not null,
  cond_group_id        number(18),
  cond_index_id        number(18) not null,
  cond_index_code      varchar2(128),
  cond_num_from        number(18),
  cond_num_to          number(18),
  cond_create_user     varchar2(64),
  cond_update_user     varchar2(64),
  cond_create_datetime timestamp(6),
  cond_update_datetime timestamp(6)
) tablespace amsm_data; 
alter table ams_ept_condition_ext
  add constraint ams_ept_condition_ext_pk primary key (cond_condition_id);
create index ams_ept_condition_ext_i01 on ams_ept_condition_ext (cond_store_id)
  tablespace amsm_indexes;
create index ams_ept_condition_ext_i02 on ams_ept_condition_ext (cond_index_code)
  tablespace amsm_indexes;
create index ams_ept_condition_ext_i03 on ams_ept_condition_ext (cond_index_id)
  tablespace amsm_indexes;
comment on column ams_ept_condition_ext.cond_condition_id
  is 'mã tự tăng';
comment on column ams_ept_condition_ext.cond_index_id
  is 'mã chỉ tiêu mà cần ràng buộc nó  là mã chỉ tiêu cần ràng buộc cho nó. là điều kiện thi đua lấy ở  bảng ept _index ở phía trên của nó';
comment on column ams_ept_condition_ext.cond_index_code
  is 'mã chỉ tiêu của nó ví dụ là afyp, fyp hay ip của nó có 3 chỉ tiêu này để rang buộc  ví dụ như là đối với hay ví dụ với ''ana_date1'' thì làm như thế ';
