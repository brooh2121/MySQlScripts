select 
irj.*,
XMLTYPE(UTL_COMPRESS.LZ_UNCOMPRESS(irj.req_body),NLS_CHARSET_ID('UTF8'))
from rsa_egarant.ins_request_jour irj where req_status_id = 3 order by beg_date desc;

select * from rsa_egarant.nsi_vehicle_category_extended;

select * from rsa_egarant.ins_company ic where ins_company_id = '10';
--select * from rsa_egarant.nsi_tariff_base where insurer_id = '02900000' and kladr = '7700000000000';
--select * from rsa_egarant.nsi_tariff_base_new_formula where insurer_id = '02900000' and kladr = '7800000000000';
--select * from rsa_egarant.street s where code = '77000000000283600';

select * from rsa_egarant.ins_company ic where ins_company_id = '12';
--206	ÑÀÎ "ÂÑÊ"	00800000
--12	ÎÎÎ "Ãðóïïà Ðåíåññàíñ Ñòðàõîâàíèå"
select * from rsa_egarant.nsi_tariff_base where insurer_id = '00800000' and category_ts = 'BP' and kladr = '7700000000000';
select * from rsa_egarant.nsi_tariff_base where insurer_id = '00800000' and kladr = '7700000000000' order by sys_corr_date desc;
select * from rsa_egarant.nsi_tariff_base where insurer_id = '11000000' and category_ts = 'BP' and kladr = '7700000000000';

update rsa_egarant.nsi_tariff_base set is_active = 1 where nsi_tariff_base_id = '33794';
commit;
/*
update rsa_egarant.nsi_tariff_base set kladr = '7700000000000' where insurer_id = '00800000' and category_ts = 'BP';
commit;
*/

select
*
from rsa_egarant.nsi_directory_mod_model ndmm
JOIN rsa_egarant.nsi_model nm on ndmm.model_id = nm.model_id
join rsa_egarant.nsi_brand nb on nm.brand_id = nb.brand_id
where nm.model_id = '125006385';

select * from rsa_egarant.kladr k where code = '0204400100000';

select length(41000002000000000) from dual;
select length(7700000200000000001) from dual;
select * from rsa_egarant.street s where code = '77000000000024000';
select count(1) from rsa_egarant.doma d where code like '770000020000000%' and end_date = to_date('01.01.9000');

select * from rsa_egarant.street s where code like '7700000200000%';
select * from rsa_egarant.doma d where code like '770000020000000%';

select * from rsa_egarant.nsi_tariff_base where kladr = '7700000200000';

select * from rsa_egarant.ins_company ic where insurer_id = '01400000';

select * from rsa_egarant.nsi_tariff_base where category_ts = 'BP' and insurer_id = '01400000';

update rsa_egarant.nsi_tariff_base set kladr = '7700000200000' where insurer_id = '01400000' and category_ts = 'BP' and nsi_tariff_base_id = 26774;

select * from RSA1.databasechangelog order by dateexecuted desc;

update rsa_egarant.nsi_tariff_base set tariff = '4118' where insurer_id = '01400000' and category_ts = 'BP' and nsi_tariff_base_id = 26774;
--commit;

select * from rsa_eosago.ins_company_distribution where ins_company_id = '20';

select * from rsa_egarant.ins_company ic where lower(ins_company) like '%þæóðàë%';

--252	ÏÀÎ "ÑÊ ÞÆÓÐÀË-ÀÑÊÎ"	04800000

select * from rsa_egarant."USER" where ins_company_id = '206';

select irj.*
/*,
XMLTYPE(UTL_COMPRESS.LZ_UNCOMPRESS(irj.req_body),NLS_CHARSET_ID('UTF8'))*/ from rsa_egarant.ins_request_jour irj where ins_company_id = '252' order by beg_date desc;

/*
SELECT get_tariff_xml(p_insurer_id     => '00800000',
                      p_schema_version => '1.0',
                      p_date_start     => to_date('12.09.2019 00:00:00', 'dd.mm.yyyy hh24:mi:ss'),
                      p_tariff_a       => 1000,
                      p_tariff_bp      => 3000,
                      p_tariff_bt      => 4200,
                      p_tariff_bu      => 2100,
                      p_tariff_c15     => 3000,
                      p_tariff_c16     => 4300,
                      p_tariff_d15     => 3000,
                      p_tariff_d16     => 3000,
                      p_tariff_dt      => 5000,
                      p_tariff_t       => 1000,
                      p_tariff_tb      => 2300,
                      p_tariff_tm      => 1500)
  FROM dual;*/
  
select * from  rsa_eosago.NSI_COMP_DISTRIBUTION_TYPE;

select * from rsa_egarant.NSI_TARIFF_BASE_NEW_FORMULA where insurer_id = '00800000' and category_ts = 'BP' and kladr = '7700000000000';
