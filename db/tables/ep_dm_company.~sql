drop table tel_dm_company;
create table tel_dm_company
( 
  dmcm_company_ams_id    varchar2(32),
  dmcm_company_tal     varchar2(32),
  dmcm_company_name      varchar2(256),
  dmcm_create_user     varchar2(64),
  dmcm_update_user     varchar2(64),
  dmcm_create_datetime timestamp(6),
  dmcm_update_datetime timestamp(6)
) tablespace amsm_data;
create index tel_dm_company_i01
  on tel_dm_company (dmcm_company_ams_id)
  tablespace amsm_indexes;
