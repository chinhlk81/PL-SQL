drop table ep_program_cost;
create table ep_program_cost
(
  prco_program_cost_id number(10)  not null,
  prco_record_date date,
  prco_company_ams_id  varchar2(10),
  prco_emule_type_id   number(4),
  prco_program_id      number(10),
  prco_type      number(4),  
  prco_month_1    number(18,2),
  prco_month_2    number(18,2),
  prco_month_3    number(18,2),
  prco_month_4    number(18,2),
  prco_month_5    number(18,2),        
  prco_month_6    number(18,2),
  prco_month_7    number(18,2),
  prco_month_8    number(18,2),
  prco_month_9    number(18,2),
  prco_month_10    number(18,2),
  prco_month_11    number(18,2),
  prco_month_12    number(18,2),
  prco_month_13    number(18,2),
  prco_month_all    number(18,2),
  prco_create_user     varchar2(64),
  prco_update_user     varchar2(64),
  prco_create_datetime timestamp(6),
  prco_update_datetime timestamp(6)
)  tablespace amsm_data;
alter table ep_program_cost
add constraint ep_program_cost_pk primary key (prco_program_cost_id)
  using index 
  tablespace amsm_indexes;
create index ams.ep_program_cost_i01 on ams.ep_program_cost (prco_program_id)
  tablespace amsm_indexes;
create index ams.ep_program_cost_i02 on ams.ep_program_cost (prco_company_ams_id)
  tablespace amsm_indexes;
create index ams.ep_program_cost_i03 on ams.ep_program_cost (prco_program_id, prco_emule_type_id)
  tablespace amsm_indexes;
create index ams.ep_program_cost_i04 on ams.ep_program_cost (prco_company_ams_id, prco_type, prco_program_id)
  tablespace amsm_indexes;
create index ams.ep_program_cost_i05 on ams.ep_program_cost (prco_emule_type_id)
  tablespace amsm_indexes;
create index ams.ep_program_cost_i06 on ams.ep_program_cost (prco_program_id, prco_type)
  tablespace amsm_indexes;
-- Add comments to the table 
comment on table ep_program_cost
  is 'Bảng lưu chi phí dự tính cho từng chương trình thi đua và theo từng công ty';
-- Add comments to the columns 
comment on column ep_program_cost.prco_record_date
  is 'Năm bao nhiêu ví dụ 1/1/2014 1/1/2015';
comment on column ep_program_cost.prco_company_ams_id
  is 'Mã công ty với cost như vậy.  Đối với tổng công ty thì là null hay mã tổng công ty ở đây cho nó';
comment on column ep_program_cost.prco_emule_type_id
  is 'Loại thi đua của nó để liệt kê ở đây, nếu là mức tổng công ty thì có chỉ cần ấy  tổng cộng ra cho theo ';
comment on column ep_program_cost.prco_program_id
  is 'Mã chương trình thi đua đã có ở phía trên ( Nếu có chương trình thi đua còn không thì là null tức là nó phân bổ cho loại thi đua đối với công ty đó, tức là theo tổng hợp và nó sẽ hiển thị dữ liệu ở file tổng hợp cho nó như thế';
comment on column ep_program_cost.prco_type
  is 'Loai 1 la ke hoach, 2 la thuc chi';   
comment on column ep_program_cost.prco_month_1
  is 'gia tri tháng 1 dua vao prco_type de tinh cho no '; 
