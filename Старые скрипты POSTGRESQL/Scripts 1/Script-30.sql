select * from rsa_epg_web.ins_company_distribution where principal_unq_id = (select MAX(principal_unq_id) from rsa_epg_web.ins_company_distribution) and distribution_code = 1;
select MAX(principal_unq_id) from rsa_epg_web.ins_company_distribution;

select * from rsa_epg_web.ins_company ic where insurer_id = '00000007';

/*
insert into ins_company (
ins_company_id,
ins_company,
insurer_id,
create_date,
change_date,
sys_corr_date
)
values (
777,
'“≈—“ ≈√¿–¿Õ“ — ',
'00000007',
to_date('28.03.2019','dd.mm.yyyy'),
to_date('28.03.2019','dd.mm.yyyy'),
to_date('28.03.2019','dd.mm.yyyy')
);

select to_date('28.03.2019','dd.mm.yyyy');

commit;
*/

select * from databasechangelog order by dateexecuted desc;