drop table ep_reports;
create table ep_reports
(
  report_type       varchar2(64),
  report_code       varchar2(64),
  report_name       varchar2(255),
  report_file       varchar2(255),
  report_permission varchar2(255),
  par_code          varchar2(64),
  sort_order        number(5),
  status_code       varchar2(64),
  create_user       varchar2(64),
  update_user       varchar2(64),
  create_datetime   timestamp(6),
  update_datetime   timestamp(6)
) tablespace amsm_data;
create index ams.ep_reports_i01 on ams.ep_reports (report_code)
  tablespace amsm_indexes;
comment on column ams_doc_reports.report_type
  is 'kiểu báo cáo';
comment on column ams_doc_reports.report_code
  is 'code báo cáo';
comment on column ams_doc_reports.report_name
  is 'tên báo cáo';
comment on column ams_doc_reports.report_file
  is 'tên file báo cáo';
comment on column ams_doc_reports.report_permission
  is 'quyền xử lý báo cáo';
comment on column ams_doc_reports.par_code
  is 'cấp trên báo cáo';
comment on column ams_doc_reports.sort_order
  is 'sắp xếp báo cáo';
comment on column ams_doc_reports.status_code
  is 'tình trạng bản ghi';
comment on column ams_doc_reports.create_user
  is 'user khởi tạo bản ghi';
comment on column ams_doc_reports.update_user
  is 'user thay đổi bản ghi';
comment on column ams_doc_reports.create_datetime
  is 'thời gian khởi tạo bản ghi';
comment on column ams_doc_reports.update_datetime
  is 'thời gian thay đổi bản ghi';
