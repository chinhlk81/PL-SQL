drop table ams_ept_condition_result;
create table ams_ept_condition_result
(
  core_store_id        number(18) not null,
  core_group_id        number(18) not null,
  core_condition_id    number(18) not null,
  core_policy_qty      number(18),
  core_ip              number(18,2),
  core_afyp            number(18,2),
  core_fyp             number(18,2),
  core_active          number(1),
  core_create_user     varchar2(64),
  core_update_user     varchar2(64),
  core_create_datetime timestamp(6),
  core_update_datetime timestamp(6)
) tablespace amsm_data; 
alter table ams_ept_condition_result
  add constraint ams_ept_condition_result_pk primary key (core_store_id, core_group_id, core_condition_id);
create index ams_ept_condition_result_i01 on ams_ept_condition_result (core_store_id)
  tablespace amsm_indexes;
comment on column ams_ept_condition_result.core_condition_id
  is 'mã tự tăng của nó lên đối với điều kiện ràng buộc  cond_condition_id ở phía trên thì sẽ có kết quả như thế này để hiển thị lên trên giao diện cho nó';
comment on column ams_ept_condition_result.core_policy_qty
  is 'số lượng hợp đồng được phát hành';
comment on column ams_ept_condition_result.core_ip
  is 'tổng phí đầu tiên';
comment on column ams_ept_condition_result.core_afyp
  is 'tổng afyp';
comment on column ams_ept_condition_result.core_active
  is 'thang chon'; 
