/* Name: ams.2.9.0.1.sql*/

/* 0. Iscript*/

/* 1. Tables*/
@"..\tables\ep_dm_code.sql";
@"..\tables\ep_dm_company.sql";
@"..\tables\ep_dm_emule_type.sql";
@"..\tables\ep_dm_outlet_type.sql";
@"..\tables\ep_dm_period_type.sql";
@"..\tables\ep_file_attach.sql";
@"..\tables\ep_log.sql";
@"..\tables\ep_program.sql";
@"..\tables\ep_program_company.sql";
@"..\tables\ep_program_company_payment.sql";
@"..\tables\ep_program_cost.sql";
@"..\tables\ep_program_emule_type.sql";
@"..\tables\ep_program_outlet_type.sql";
@"..\tables\ep_program_plan.sql";
@"..\tables\ep_program_result.sql";
@"..\tables\ep_program_status.sql";
@"..\tables\ep_reports.sql"; 

/* 2. Sequences*/
@"..\sequences\ep_program_seq.sql";
@"..\sequences\ep_cost_seq.sql";
@"..\sequences\ep_file_attach_seq.sql";
@"..\sequences\ep_program_plan_seq.sql";
@"..\sequences\ep_program_result_seq.sql";
@"..\sequences\ep_file_attach_name_seq.sql";

/* 3. Triggers*/

/* 4. Indexes*/ 

/* 5. Functions*/

/* 6. Procedures*/

/* 7. Packages*/ 
@@"..\packages\EP_EMULATE.pck";
@@"..\packages\EP_EMULATE_PROCESS.pck";
@@"..\packages\EP_REPORT.pck"; 
/* 8. Init data*/
delete from ams.mod_menus a
where a.menu_id like 'NODE_EMULATE%';
commit;
insert into ams.mod_menus (MENU_ID, MENU_TYPE, MENU_PERMISSION, MENU_NAME, MENU_HREF, MENU_PARENT, STATUS_CODE, DESCRIPTION, SORT_ORDER, CREATE_USER, UPDATE_USER, CREATE_DATETIME, UPDATE_DATETIME)
values ('NODE_EMULATE', 'NODE', 'AMSM_EPAD,AMSM_EPPR,AMSM_EPAC', 'Thi đua tập trung', '', 'ROOT', 'ACTI', '', 10, 'SYSTEM', 'SYSTEM', '', '');
insert into ams.mod_menus (MENU_ID, MENU_TYPE, MENU_PERMISSION, MENU_NAME, MENU_HREF, MENU_PARENT, STATUS_CODE, DESCRIPTION, SORT_ORDER, CREATE_USER, UPDATE_USER, CREATE_DATETIME, UPDATE_DATETIME)
values ('NODE_EMULATE_PROGRAM', 'FUNC', 'AMSM_EPAD,AMSM_EPPR', 'Main - Quản lý Chương trình thi đua', 'Modules/Emulate/Form/MainEmulate.aspx', 'NODE_EMULATE', 'ACTI', '', 1, '', '', '', '');
insert into ams.mod_menus (MENU_ID, MENU_TYPE, MENU_PERMISSION, MENU_NAME, MENU_HREF, MENU_PARENT, STATUS_CODE, DESCRIPTION, SORT_ORDER, CREATE_USER, UPDATE_USER, CREATE_DATETIME, UPDATE_DATETIME)
values ('NODE_EMULATE_ESTI', 'FUNC', 'AMSM_EPAD,AMSM_EPPR', 'Kế hoạch thi đua và chi phí năm', 'Modules/Emulate/Form/CostYear.aspx', 'NODE_EMULATE', 'ACTI', '', 2, '', '', '', ''); 
insert into ams.mod_menus (MENU_ID, MENU_TYPE, MENU_PERMISSION, MENU_NAME, MENU_HREF, MENU_PARENT, STATUS_CODE, DESCRIPTION, SORT_ORDER, CREATE_USER, UPDATE_USER, CREATE_DATETIME, UPDATE_DATETIME)
values ('NODE_EMULATE_BANNER', 'FUNC', 'AMSM_EPAD', 'Quản lý banner tổng thể', 'Modules/Emulate/Form/PosterUpload.aspx', 'NODE_EMULATE', 'ACTI', '', 3, '', '', '', '');
insert into ams.mod_menus (MENU_ID, MENU_TYPE, MENU_PERMISSION, MENU_NAME, MENU_HREF, MENU_PARENT, STATUS_CODE, DESCRIPTION, SORT_ORDER, CREATE_USER, UPDATE_USER, CREATE_DATETIME, UPDATE_DATETIME)
values ('NODE_EMULATE_CAC', 'FUNC', 'AMSM_EPAC', 'Quản lý chi phí (kế toán)', 'Modules/Emulate/Form/CACEmulate.aspx', 'NODE_EMULATE', 'ACTI', '', 4, '', '', '', '');
insert into ams.mod_menus (MENU_ID, MENU_TYPE, MENU_PERMISSION, MENU_NAME, MENU_HREF, MENU_PARENT, STATUS_CODE, DESCRIPTION, SORT_ORDER, CREATE_USER, UPDATE_USER, CREATE_DATETIME, UPDATE_DATETIME)
values ('NODE_EMULATE_REPORT', 'FUNC', 'AMSM_EPAD,AMSM_EPPR,AMSM_EPAC', 'Báo cáo', 'Modules/Emulate/Form/EmulateReport.aspx', 'NODE_EMULATE', 'ACTI', '', 5, '', '', '', ''); 
commit; 
delete from ams.ep_dm_code;
commit;
insert into ep_dm_code (dmco_code, dmco_value, dmco_desc, dmco_status, dmco_create_user, dmco_update_user, dmco_create_datetime, dmco_update_datetime)
values ('TSC_BVNT', 'T100000007', 'TCT BVNT - Phòng HTĐL', 'ACTI', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_code (dmco_code, dmco_value, dmco_desc, dmco_status, dmco_create_user, dmco_update_user, dmco_create_datetime, dmco_update_datetime)
values ('PRO_STATUS', '1', 'Chưa tính thưởng', 'ACTI', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_code (dmco_code, dmco_value, dmco_desc, dmco_status, dmco_create_user, dmco_update_user, dmco_create_datetime, dmco_update_datetime)
values ('PRO_STATUS', '2', 'Đã tính thưởng', 'ACTI', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_code (dmco_code, dmco_value, dmco_desc, dmco_status, dmco_create_user, dmco_update_user, dmco_create_datetime, dmco_update_datetime)
values ('PRO_STATUS', '3', 'Đã chuyển hồ sơ', 'ACTI', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_code (dmco_code, dmco_value, dmco_desc, dmco_status, dmco_create_user, dmco_update_user, dmco_create_datetime, dmco_update_datetime)
values ('PRO_STATUS', '4', 'Đã chi thưởng', 'ACTI', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_code (dmco_code, dmco_value, dmco_desc, dmco_status, dmco_create_user, dmco_update_user, dmco_create_datetime, dmco_update_datetime)
values ('POSTER', '1', 'Chiều dọc', 'ACTI', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_code (dmco_code, dmco_value, dmco_desc, dmco_status, dmco_create_user, dmco_update_user, dmco_create_datetime, dmco_update_datetime)
values ('POSTER', '2', 'Chiều ngang', 'ACTI', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_code (dmco_code, dmco_value, dmco_desc, dmco_status, dmco_create_user, dmco_update_user, dmco_create_datetime, dmco_update_datetime)
values ('POSTER_ACTI', '1', 'Hiện poster', 'ACTI', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_code (dmco_code, dmco_value, dmco_desc, dmco_status, dmco_create_user, dmco_update_user, dmco_create_datetime, dmco_update_datetime)
values ('POSTER_ACTI', '0', 'Ẩn poster', 'ACTI', 'admin', 'admin', sysdate, sysdate);
commit;
delete from ams.ep_dm_emule_type;
commit;
insert into ams.ep_dm_emule_type (emty_type_id, emty_type_name, emty_type_desc, emty_type_order, emty_create_user, emty_update_user, emty_create_datetime, emty_update_datetime)
values (1, 'Tuyển dụng', 'Tuyển dụng', 1, 'admin', 'admin', sysdate, sysdate);
insert into ams.ep_dm_emule_type (emty_type_id, emty_type_name, emty_type_desc, emty_type_order, emty_create_user, emty_update_user, emty_create_datetime, emty_update_datetime)
values (2, 'Khai thác', 'Khai thác', 2, 'admin', 'admin', sysdate, sysdate);
insert into ams.ep_dm_emule_type (emty_type_id, emty_type_name, emty_type_desc, emty_type_order, emty_create_user, emty_update_user, emty_create_datetime, emty_update_datetime)
values (3, 'Thu phí', 'Thu phí', 3,  'admin', 'admin', sysdate, sysdate);
insert into ams.ep_dm_emule_type (emty_type_id, emty_type_name, emty_type_desc, emty_type_order, emty_create_user, emty_update_user, emty_create_datetime, emty_update_datetime)
values (4, 'Hội nghị khách hàng', 'Hội nghị khách hàng', 4, 'admin', 'admin', sysdate, sysdate);
commit;
delete from ams.ep_dm_outlet_type;
commit;
insert into ep_dm_outlet_type (outy_outlet_type_id, outy_outlet_type_name, outy_outlet_desc, outy_outlet_type_order, outy_create_user, outy_update_user, outy_create_datetime, outy_update_datetime)
values (1, 'Trưởng ban/ Trưởng nhóm', 'Trưởng ban/ Trưởng nhóm', 1, 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_outlet_type (outy_outlet_type_id, outy_outlet_type_name, outy_outlet_desc, outy_outlet_type_order, outy_create_user, outy_update_user, outy_create_datetime, outy_update_datetime)
values (2, 'Tiền trưởng nhóm', 'Tiền trưởng nhóm', 2, 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_outlet_type (outy_outlet_type_id, outy_outlet_type_name, outy_outlet_desc, outy_outlet_type_order, outy_create_user, outy_update_user, outy_create_datetime, outy_update_datetime)
values (3, 'Tư vấn viên', 'Tư vấn viên', 3, 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_outlet_type (outy_outlet_type_id, outy_outlet_type_name, outy_outlet_desc, outy_outlet_type_order, outy_create_user, outy_update_user, outy_create_datetime, outy_update_datetime)
values (4, 'PA', 'PA', 4, 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_outlet_type (outy_outlet_type_id, outy_outlet_type_name, outy_outlet_desc, outy_outlet_type_order, outy_create_user, outy_update_user, outy_create_datetime, outy_update_datetime)
values (5, 'Tư vấn viên mới', 'Tư vấn viên mới', 5,  'admin', 'admin', sysdate, sysdate);
commit; 
delete from ep_dm_period_type;
commit;
insert into ep_dm_period_type (pety_period_type_id, pety_period_type_name, pety_period_type_desc, pety_create_user, pety_update_user, pety_create_datetime, pety_update_datetime)
values (1, 'Dưới 1 tháng', 'Dưới 1 tháng', 'admin', 'admin', sysdate, sysdate); 
insert into ep_dm_period_type (pety_period_type_id, pety_period_type_name, pety_period_type_desc, pety_create_user, pety_update_user, pety_create_datetime, pety_update_datetime)
values (2, 'Tháng', 'Tháng', 'admin', 'admin', sysdate, sysdate); 
insert into ep_dm_period_type (pety_period_type_id, pety_period_type_name, pety_period_type_desc, pety_create_user, pety_update_user, pety_create_datetime, pety_update_datetime)
values (3, 'Dài hạn (từ 2 đến 6 tháng)', 'Dài hạn (từ 2 đến 6 tháng)', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_period_type (pety_period_type_id, pety_period_type_name, pety_period_type_desc, pety_create_user, pety_update_user, pety_create_datetime, pety_update_datetime)
values (4, 'Trên 6 tháng', 'Trên 6 tháng', 'admin', 'admin', sysdate, sysdate);
commit; 
delete from ep_reports ;
commit;
insert into ep_reports (REPORT_TYPE, REPORT_CODE, REPORT_NAME, REPORT_FILE, REPORT_PERMISSION, PAR_CODE, SORT_ORDER, STATUS_CODE, CREATE_USER, UPDATE_USER, CREATE_DATETIME, UPDATE_DATETIME)
values ('REPORT', 'REPO_EP01', 'EP01 - Báo cáo sơ đồ Gant', 'Báo cáo sơ đồ Gant', 'AMSM_EPAD,AMSM_EPPR', 'ROOT', 1, 'ACTI', 'admin', 'admin', sysdate, sysdate);
commit;  
insert into ep_reports (REPORT_TYPE, REPORT_CODE, REPORT_NAME, REPORT_FILE, REPORT_PERMISSION, PAR_CODE, SORT_ORDER, STATUS_CODE, CREATE_USER, UPDATE_USER, CREATE_DATETIME, UPDATE_DATETIME)
values ('REPORT', 'REPO_EP02', 'EP02 - Báo cáo chi tiết chi thưởng thi đua', 'Báo cáo chi tiết chi thưởng thi đua', 'AMSM_EPAD,AMSM_EPPR', 'ROOT', 2, 'ACTI', 'admin', 'admin', sysdate, sysdate);
commit;
insert into ep_reports (REPORT_TYPE, REPORT_CODE, REPORT_NAME, REPORT_FILE, REPORT_PERMISSION, PAR_CODE, SORT_ORDER, STATUS_CODE, CREATE_USER, UPDATE_USER, CREATE_DATETIME, UPDATE_DATETIME)
values ('REPORT', 'REPO_EP03', 'EP03 - Báo cáo tổng hợp chi thưởng thi đua', 'Báo cáo tổng hợp chi thưởng thi đua', 'AMSM_EPAD,AMSM_EPPR', 'ROOT', 3, 'ACTI', 'admin', 'admin', sysdate, sysdate);
commit;
insert into ep_reports (REPORT_TYPE, REPORT_CODE, REPORT_NAME, REPORT_FILE, REPORT_PERMISSION, PAR_CODE, SORT_ORDER, STATUS_CODE, CREATE_USER, UPDATE_USER, CREATE_DATETIME, UPDATE_DATETIME)
values ('REPORT', 'REPO_EP04', 'EP04 - Báo cáo theo dõi tiến độ cập nhật thi đua', 'Báo cáo theo dõi tiến độ cập nhật thi đua', 'AMSM_EPAD,AMSM_EPPR', 'ROOT', 4, 'ACTI', 'admin', 'admin', sysdate, sysdate);
commit; 
insert into ep_reports (REPORT_TYPE, REPORT_CODE, REPORT_NAME, REPORT_FILE, REPORT_PERMISSION, PAR_CODE, SORT_ORDER, STATUS_CODE, CREATE_USER, UPDATE_USER, CREATE_DATETIME, UPDATE_DATETIME)
values ('REPORT', 'REPO_EP05', 'EP05 - Báo cáo chi thưởng theo loại thi đua', 'Báo cáo chi thưởng theo loại thi đua', 'AMSM_EPAD,AMSM_EPPR', 'ROOT', 5, 'ACTI', 'admin', 'admin', sysdate, sysdate);
commit;  
insert into ep_reports (REPORT_TYPE, REPORT_CODE, REPORT_NAME, REPORT_FILE, REPORT_PERMISSION, PAR_CODE, SORT_ORDER, STATUS_CODE, CREATE_USER, UPDATE_USER, CREATE_DATETIME, UPDATE_DATETIME)
values ('REPORT', 'REPO_EP06', 'EP06 - Báo cáo chi thưởng theo chức danh', 'Báo cáo chi thưởng theo chức danh', 'AMSM_EPAD,AMSM_EPPR', 'ROOT', 6, 'ACTI', 'admin', 'admin', sysdate, sysdate);
insert into ep_reports (REPORT_TYPE, REPORT_CODE, REPORT_NAME, REPORT_FILE, REPORT_PERMISSION, PAR_CODE, SORT_ORDER, STATUS_CODE, CREATE_USER, UPDATE_USER, CREATE_DATETIME, UPDATE_DATETIME)
values ('REPORT', 'REPO_EP07', 'EP07 - Báo cáo tiến độ chi thưởng thi đua', 'Báo cáo tiến độ chi thưởng thi đua', 'AMSM_EPAD,AMSM_EPPR,AMSM_EPAC', 'ROOT', 7, 'ACTI', 'admin', 'admin', sysdate, sysdate);
commit;
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B104100004', '41000', '211', 'An Giang', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B102600005', '26000', '212', 'Bà Rịa - Vũng Tàu', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B102900002', '29000', '213', 'Bạc Liêu', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B103500003', '35000', '215', 'Bắc Giang', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B105600006', '56000', '216', 'Bắc Ninh', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B103200006', '32000', '217', 'Bến Tre', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B103800000', '38000', '218', 'Bình Dương', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B102400007', '24000', '219', 'Bình Định', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B106500004', '65000', '220', 'Bình Phước', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B102500006', '25000', '221', 'Bình Thuận', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B102800003', '28000', '222', 'Cà Mau', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B100300004', '03000', '223', 'Cao Bằng', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B105700005', '57000', '224', 'Cần Thơ', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B102000001', '20000', '225', 'Đà Nẵng', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B100800009', '08000', '227', 'Đắc Lắc', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B106400005', '64000', '228', 'Điện Biên', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B105400008', '54000', '235', 'Đông Đô', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B103900009', '39000', '229', 'Đồng Nai', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B102700004', '27000', '230', 'Đồng Tháp', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B104900006', '49000', '231', 'Gia Lai', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B105100001', '51000', '232', 'Hà Giang', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B106600003', '66000', '233', 'Hà Nam', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B100100006', '01000', '234', 'Hà nội', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B105300009', '53000', '236', 'Hà Tĩnh', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B103400004', '34000', '237', 'Hải Dương', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B104300002', '43000', '238', 'Hải Phòng', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B105500007', '55000', '240', 'Hoà Bình', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B106700002', '67000', '241', 'Hưng Yên', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B102100000', '21000', '242', 'Khánh Hoà', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B103700001', '37000', '243', 'Kiên Giang', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B104800007', '48000', '244', 'Kon Tum', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B106300006', '63000', '246', 'Lạng Sơn', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B104700008', '47000', '247', 'Lào Cai', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B100900008', '09000', '248', 'Lâm Đồng', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B103600002', '36000', '249', 'Long An', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B106200007', '62000', '251', 'Nam Định', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B105200000', '52000', '252', 'Nghệ An', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B103300005', '33000', '253', 'Ninh Bình', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B106100008', '61000', '254', 'Ninh Thuận', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B101100003', '11000', '255', 'Phú Thọ', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B102300008', '23000', '256', 'Phú Yên', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B101400000', '14000', '257', 'Quảng Bình', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B106900000', '69000', '258', 'Quảng Nam', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B102200009', '22000', '259', 'Quảng Ngãi', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B101800006', '18000', '260', 'Quảng Ninh', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B101300001', '13000', '261', 'Quảng Trị', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B100200005', '02000', '250', 'Sài Gòn', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B105800004', '58000', '262', 'Sóc Trăng', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B100400003', '04000', '263', 'Sơn La', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B101500009', '15000', '264', 'Tây Ninh', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B104000005', '40000', '265', 'Thái Bình', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B101000004', '10000', '266', 'Thái Nguyên', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B101600008', '16000', '267', 'Thanh Hoá', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B101900005', '19000', '270', 'Thừa Thiên Huế', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B103100007', '31000', '268', 'Tiền Giang', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B106000009', '60000', '269', 'Trà Vinh', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B105000002', '50000', '271', 'Tuyên Quang', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B105900003', '59000', '272', 'Vĩnh Long', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B106800001', '68000', '273', 'Vĩnh Phúc', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B104600009', '46000', '274', 'Yên Bái', 'admin', 'admin', sysdate, sysdate);
insert into ep_dm_company (dmcm_company_ams_id, dmcm_company_tal, dmcm_company_account, dmcm_company_name, dmcm_create_user, dmcm_update_user, dmcm_create_datetime, dmcm_update_datetime)
values ('B107300009', '73000', '275', 'Tổng công ty BVNT', 'admin', 'admin', sysdate, sysdate);
commit;

/* 9. Scripts*/

