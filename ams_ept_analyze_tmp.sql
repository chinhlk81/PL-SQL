drop table ams_ept_analyze_tmp;
create table ams_ept_analyze_tmp
(
  anal_analyze_id        number(18) not null,
  anal_user_id           varchar2(64) not null,
  anal_store_id          number(18) not null,
  anal_group_id          number(18) not null,
  anal_data_code         varchar2(16),
  anal_data_num          number(18),
  anal_class_id          number(4),
  anal_ip_from           number(18,2),
  anal_ip_to             number(18,2),
  anal_afyp_from         number(18,2),
  anal_afyp_to           number(18,2),
  anal_fyp_from          number(18,2),
  anal_fyp_to            number(18,2),
  anal_reward_type_id    number(4),
  anal_reward_value      number(18,2),
  anal_active            number(1),
  anal_policy_qty        number(18),
  anal_ip                number(18,2),
  anal_afyp              number(18,2),
  anal_fyp               number(18,2),
  anal_policy_total      number(18),
  anal_ip_total          number(18,2),
  anal_afyp_total        number(18,2),
  anal_fyp_total         number(18,2),
  anal_policy_prc        number(8,2),
  anal_ip_prc            number(8,2),
  anal_afyp_prc          number(8,2),
  anal_fyp_prc           number(8,2),
  anal_est_policy_qty    number(18),
  anal_est_ip            number(18,2),
  anal_est_afyp          number(18,2),
  anal_est_fyp           number(18,2),
  anal_est_money         number(18,2),
  anal_coefficient       number(18,2),
  anal_real_policy_qty   number(18),
  anal_real_ip           number(18,2),
  anal_real_afyp         number(18,2),
  anal_real_fyp          number(18,2),
  anal_real_policy_total number(18),
  anal_real_ip_total     number(18,2),
  anal_real_afyp_total   number(18,2),
  anal_real_fyp_total    number(18,2),
  anal_real_policy_prc   number(8,2),
  anal_real_ip_prc       number(8,2),
  anal_real_afyp_prc     number(8,2),
  anal_real_fyp_prc      number(8,2),
  anal_real_money        number(18,2),
  anal_create_user       varchar2(64),
  anal_update_user       varchar2(64),
  anal_create_datetime   timestamp(6),
  anal_update_datetime   timestamp(6)
) tablespace amsm_data;
alter table ams_ept_analyze_tmp
  add constraint ams_ept_analyze_tmp_pk primary key (anal_analyze_id, anal_user_id);
comment on column ams_ept_analyze_tmp.anal_data_code
  is '1: la chi tiet, 2: la tong hop tat ca, 3: la tong cua ty trong thi dua, lam nhu the de k phai tao bang them';
comment on column ams_ept_analyze_tmp.anal_class_id
  is 'mã class định nghĩ ví dụ là hạng a';
comment on column ams_ept_analyze_tmp.anal_ip_from
  is 'ip từ  các trưởng này dùng để quét mà lấy ra được số liệu ra cho nó  quét từ các cái này để lấy ra được dữ liệu cho nó';
comment on column ams_ept_analyze_tmp.anal_ip_to
  is 'ip tới các trưởng này dùng để quét mà lấy ra được số liệu ra cho nó  quét từ các cái này để lấy ra được dữ liệu cho nó';
comment on column ams_ept_analyze_tmp.anal_afyp_from
  is 'afyp từ  các trưởng này dùng để quét mà lấy ra được số liệu ra cho nó  quét từ các cái này để lấy ra được dữ liệu cho nó';
comment on column ams_ept_analyze_tmp.anal_afyp_to
  is 'afyp tới các trưởng này dùng để quét mà lấy ra được số liệu ra cho nó  quét từ các cái này để lấy ra được dữ liệu cho nó';
comment on column ams_ept_analyze_tmp.anal_active
  is '1 tức là được chọn được tích vào , 0 tức là không được tích vào cho nó để tính tỷ lệ phần trăm cho nó';
comment on column ams_ept_analyze_tmp.anal_policy_qty
  is 'tổng số hợp đồng tương ứng với điều kiện nhập vào của ip từ đến,…';
comment on column ams_ept_analyze_tmp.anal_ip
  is 'tổng ip tương ứng với điều kiện nhập vào của ip từ đến,…';
comment on column ams_ept_analyze_tmp.anal_afyp
  is 'tổng afyp tương ứng với điều kiện nhập vào của ip từ đến,…';
comment on column ams_ept_analyze_tmp.anal_policy_prc
  is 'tỷ trọng của số hợp đồng tương ứng mà các hạng được tích vào';
comment on column ams_ept_analyze_tmp.anal_ip_prc
  is 'tỷ trọng của ip tương ứng mà các hạng được tích vào';
comment on column ams_ept_analyze_tmp.anal_afyp_prc
  is 'tỷ trọng của afyp tương ứng mà các hạng được tích vào';
comment on column ams_ept_analyze_tmp.anal_est_policy_qty
  is 'dự đoán tổng số hợp đồng là bao nhiêu khi lấy dữ liệu mẫu so sánh';
comment on column ams_ept_analyze_tmp.anal_est_ip
  is 'dự đoán ip là bao nhiêu '; 
