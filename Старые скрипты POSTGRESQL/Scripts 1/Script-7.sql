select * from public."USER";

select * from public.ins_company; --where ins_company like '%Çåòòà%';

select * from public.user_role;
select * from public.role_access_data_msi;

commit;

select * from public.appeal_subject;

select * from public.appeal_policy_owner;

SELECT a.act_insurer_jour_id act_insurer_jour_id, a.create_date, d.*
FROM act_insurer_jour a
LEFT JOIN act_insurer_act_insurer_data_jour ad ON ad.act_insurer_jour_id = a.act_insurer_jour_id
LEFT JOIN act_insurer_data_jour d ON d.act_insurer_data_jour_id = ad.act_insurer_data_jour_id
WHERE 1=1 --a.ins_company_id = '13900000'
--AND a.create_date >= to_timestamp ('01.04.2019','dd.mm.yyyy')
--AND a.create_date < to_timestamp ('30.06.2019','dd.mm.yyyy')
--and d.report_number = 'ÁÑÈ0000000081/0000000072/02/19'
ORDER BY a.create_date, a.act_insurer_jour_id, d.report_number;

select * from public.databasechangelog order by dateexecuted desc;

select * from public.databasechangeloglock;

select * from rsamsipg.public.kladr;

select * from public.ins_company where ins_company_id = 254; -- áûë èíí 0000000072

select * from rsamsipg.public.act_insurer_jour;
select * from rsamsipg.public.act_insurer_data_jour where report_number = 'ÁÑÈ0000000081/0000000072/02/19';

select * from rsamsipg.public.ins_company ic where ins_company like '%ÑÅĞÂÈÑ%';

SELECT *
FROM act_insurer_jour
WHERE ins_company_id = ;

select * from databasechangelog order by dateexecuted desc;