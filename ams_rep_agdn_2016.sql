drop table ams_rep_agdn_2016;
create table ams_rep_agdn_2016 
(
    record_date       date, 
    data_date         date, 
    branch_ams_id     varchar2(32), 
    branch_name       varchar2(256),
    agency_ams_id     varchar2(32),
    agency_name       varchar2(256),
    unit_ams_id       varchar2(32),
    unit_name         varchar2(256), 
    outlet_ams_id     varchar2(32),
    outlet_name       varchar2(256),
    effe_date         date, 
    term_date         date,
    seniority         number(10,2),
    outlet_return_id  varchar2(32), 
    fyp               number(18,2), 
    policy_ktm        number(10), 
    pr2               number(5,2),       
    coll_rate         number(5,2),
    comp_money        number(18,2), 
    create_user       varchar2(256), 
    update_user       varchar2(256), 
    create_datetime   timestamp (6), 
    update_datetime   timestamp (6)
) nologging
partition by range (record_date) interval(numtoyminterval(1, 'month'))
store in (amsm_data)
  (
    partition data_f values less than ('01-jan-2014') tablespace amsm_data
  );
   
