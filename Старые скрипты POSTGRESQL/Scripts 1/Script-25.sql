select * from rsa_epg_web.user_cabinet_status;

--6	LOCKED	Заблокирован

--8	SCAN_LOCKED	Не загружены копии документов на проверку

select * from rsa_epg_web.lock_pts where insurer_id = '20300000' and create_date >= current_date;

select * from rsa_epg_web.user_cabinet uc
join rsa_epg_web.user_cabinet_status ucs on uc.status_id = ucs.id
join rsa_epg_web.lock_pts lp on uc.application_id = lp.application_id
where insurer_id = '20300000'
and uc.create_date >= to_timestamp('01.04.2019','dd.mm.yyyy')
and uc.status_id = 8 order by uc.create_date desc;

select now();

select * from rsa_epg_db.rsa_epg_web.vacant_policy_counter;

select * from rsa_epg_db.rsa_epg_web.ins_company where ins_company_id = 24;

select * from rsa_epg_db.rsa_epg_web.ins_company_distribution where ins_company_id = 24;

select * from rsa_epg_db.rsa_epg_web.vacant_policy_counter where ins_company_id = 24 and is_used = 0;

select
* 
from rsa_epg_db.rsa_epg_web.vacant_policy_counter_jour
where vacant_policy_counter_id in (
select
vacant_policy_counter_id
from rsa_epg_db.rsa_epg_web.vacant_policy_counter
where ins_company_id = 274
and is_used = 0
);

select
vacant_policy_counter_id
from rsa_epg_db.rsa_epg_web.vacant_policy_counter
where ins_company_id = 24
and is_used = 0;

select distinct vpcj.* from rsa_epg_web.vacant_policy_counter vpc
join rsa_epg_web.vacant_policy_counter_jour vpcj on vpcj.vacant_policy_counter_id = vpc.vacant_policy_counter_id
where vpc.ins_company_id = 24
and vpc.is_used = 0;

select * from rsa_epg_web.vacant_policy_counter_jour_prtbck;
/*
insert into rsa_epg_web.vacant_policy_counter_jour_prtbck
select distinct vpcj.* from rsa_epg_web.vacant_policy_counter vpc
join rsa_epg_web.vacant_policy_counter_jour vpcj on vpcj.vacant_policy_counter_id = vpc.vacant_policy_counter_id
where vpc.ins_company_id = 24
and vpc.is_used = 0;

insert into rsa_epg_web.vacant_policy_counter_prtbck  
select * from rsa_epg_web.vacant_policy_counter vpc
where vpc.ins_company_id = 24
and vpc.is_used = 0;

commit;

delete from rsa_epg_web.vacant_policy_counter_jour vpj
where vpj.vacant_policy_counter_jour_id in (select vpjbck.vacant_policy_counter_jour_id from rsa_epg_web.vacant_policy_counter_jour_prtbck vpjbck)
;

commit;

delete from rsa_epg_web.vacant_policy_counter vpc
where vpc.vacant_policy_counter_id in (select vpcbck.vacant_policy_counter_id from rsa_epg_web.vacant_policy_counter_prtbck vpcbck) 
;

commit;
*/

select ic.ins_company,icd.* from rsa_epg_web.ins_company_distribution icd
join rsa_epg_web.ins_company ic on icd.ins_company_id = ic.ins_company_id
where calculation_date >= to_timestamp('26.08.2019','dd.mm.yyyy') and distribution_code = 1;
--274

select * from rsa_epg_web.ins_company_distribution where ins_company_id = 274 and calculation_date >= to_timestamp('26.08.2019','dd.mm.yyyy') and distribution_code = 1;

update rsa_epg_web.ins_company_distribution
set amount_policy_garant = 0
where ins_company_id = 274
and calculation_date >= to_timestamp('26.08.2019','dd.mm.yyyy')
and distribution_code = 1;

select distinct vpcj.* from rsa_epg_web.vacant_policy_counter vpc
join rsa_epg_web.vacant_policy_counter_jour vpcj on vpcj.vacant_policy_counter_id = vpc.vacant_policy_counter_id
where vpc.ins_company_id = 274
and vpc.is_used = 0;

select *
from rsa_epg_web.vacant_policy_counter_jour vpj
where vpj.vacant_policy_counter_jour_id in (select vpjbck.vacant_policy_counter_jour_id from rsa_epg_web.vacant_policy_counter_jour_prtbck vpjbck);
;

select * from rsa_epg_web.vacant_policy_counter vpc
where vpc.ins_company_id = 274
and vpc.is_used = 0;
