drop table ams_ept_condition_ext_tmp;
create table ams_ept_condition_ext_tmp
(
  cond_condition_id  number(18) not null, 
  cond_user_id  varchar2(64),
  cond_store_id   number(18) not null,
  cond_group_id   number(18),  
  cond_index_id   number(18)  not null,
  cond_index_code  varchar2(128),
  cond_num_from number(18),
  cond_num_to  number(18), 
  cond_create_user      varchar2(64),
  cond_update_user      varchar2(64),
  cond_create_datetime  timestamp(6),
  cond_update_datetime  timestamp(6)
)  tablespace amsm_data;
alter table ams_ept_condition_ext_tmp
  add constraint ams_ept_condition_ext_tmp_pk primary key (cond_condition_id, cond_user_id); 
create index ams.ams_ept_condition_ext_tmp_i01 on ams.ams_ept_condition_ext_tmp (cond_store_id)
  tablespace amsm_indexes;  
create index ams.ams_ept_condition_ext_tmp_i02 on ams.ams_ept_condition_ext_tmp (cond_index_code)
  tablespace amsm_indexes;
create index ams.ams_ept_condition_ext_tmp_i03 on ams.ams_ept_condition_ext_tmp (cond_index_id)
  tablespace amsm_indexes;
comment on column ams_ept_condition_ext_tmp.cond_condition_id
  is 'Mã tự tăng'; 
comment on column ams_ept_condition_ext_tmp.cond_index_id
  is 'Mã chỉ tiêu mà cần ràng buộc nó  là mã chỉ tiêu cần ràng buộc cho nó. Là điều kiện thi đua lấy ở  bảng ept _index ở phía trên của nó';
comment on column ams_ept_condition_ext_tmp.cond_index_code
  is 'Mã chỉ tiêu của nó ví dụ là AFYP, FYP hay IP của nó có 3 chỉ tiêu này để rang buộc  Ví dụ như là đối với Hay ví dụ với ''ANA_DATE1'' thì làm như thế ';
 
