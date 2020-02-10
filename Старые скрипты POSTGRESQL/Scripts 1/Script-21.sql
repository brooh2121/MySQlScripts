select * from rsa_epg_web.amount_policy_counter_jour;

select
count(1),icd.distribution_code
from rsa_epg_web.ins_company_distribution icd
join rsa_epg_web.vacant_policy_counter vpc on vpc.ins_company_distribution_id = icd.ins_company_distribution_id
--join rsa_epg_web.vacant_policy_counter_jour vpcj on vpc.vacant_policy_counter_id = vpcj.vacant_policy_counter_id
and is_used = 1
group by icd.distribution_code;

select
count(1),icd.distribution_code
from rsa_epg_web.ins_company_distribution icd
join rsa_epg_web.vacant_policy_counter vpc on vpc.ins_company_distribution_id = icd.ins_company_distribution_id
--join rsa_epg_web.vacant_policy_counter_jour vpcj on vpc.vacant_policy_counter_id = vpcj.vacant_policy_counter_id
where period_beg_date = to_date('09.04.2019','dd.mm.yyyy')
and is_used = 1 
group by icd.distribution_code;

select
sum(amount_policy_garant)
from ins_company_distribution
where  period_beg_date = to_date('02.04.2019','dd.mm.yyyy') and distribution_code = 2 group by distribution_code;
select * from rsa_epg_web.ins_company_distribution;

with TT1 as (
select
MAX(vpcj.vacant_policy_counter_jour_id) vpccji, vpc.vacant_policy_counter_id
from rsa_epg_web.ins_company_distribution icd
join rsa_epg_web.vacant_policy_counter vpc on vpc.ins_company_distribution_id = icd.ins_company_distribution_id
join rsa_epg_web.vacant_policy_counter_jour vpcj on vpc.vacant_policy_counter_id = vpcj.vacant_policy_counter_id
where /*period_beg_date = to_date('02.04.2019','dd.mm.yyyy')
and*/ is_used = 1 and icd.ins_company_id = 274 --and  vpcj.application_id = '2210932930'
group by vpc.vacant_policy_counter_id
),
TT2 as (
select
vpcj.application_id,vpcj
from rsa_epg_web.vacant_policy_counter_jour vpcj where vacant_policy_counter_jour_id in (
select vpccji from TT1
)
)

select
application_id
from rsa_epg_web.user_cabinet uc
join rsa_epg_web.user_cabinet_status ucs on uc.status_id = ucs.id
where application_id in (select application_id from TT2) and ucs.id = 7 
/*and application_id in (
'2223052204',
'2222300801',
'2220836898',
'2220512459',
'2216976611',
'2216199492',
'2214228384',
'2212673353',
'2211866073'
)*/
;

select
* 
from rsa_epg_web.user_cabinet uc
join rsa_epg_web.user_cabinet_status ucs on uc.status_id = ucs.id;

select * from rsa_epg_web.user_cabinet_status;

select
*
from rsa_epg_web.ins_company_distribution icd where ins_company_id = 257 and distribution_code = 1;

select * from rsa_epg_web.vacant_policy_counter_jour where application_id = '2210932930';