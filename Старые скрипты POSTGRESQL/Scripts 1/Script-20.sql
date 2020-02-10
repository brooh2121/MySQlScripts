select distinct ins_company_distribution_id from rsa_epg_web.vacant_policy_counter order by ins_company_distribution_id;

select * from rsa_epg_web.ins_company_distribution where period_beg_date < to_date('08.04.2019','dd.mm.yyyy');

select ins_company_distribution_id from rsa_epg_web.ins_company_distribution where period_beg_date >= to_date('08.04.2019','dd.mm.yyyy');

select distinct period_beg_date from rsa_epg_web.ins_company_distribution;

select
count(1) 
from rsa_epg_web.ins_company_distribution icd
join rsa_epg_web.vacant_policy_counter vpc on vpc.ins_company_distribution_id = icd.ins_company_distribution_id
where period_beg_date = to_date('14.05.2019','dd.mm.yyyy')
and is_used = 0;

select
count(1) 
from rsa_epg_web.ins_company_distribution icd
join rsa_epg_web.vacant_policy_counter vpc on vpc.ins_company_distribution_id = icd.ins_company_distribution_id
--join rsa_epg_web.vacant_policy_counter_jour vpcj on vpc.vacant_policy_counter_id = vpcj.vacant_policy_counter_id
where period_beg_date = to_date('14.05.2019','dd.mm.yyyy')
and is_used = 1;

select
MAX(vpcj.vacant_policy_counter_jour_id), vpc.vacant_policy_counter_id
from rsa_epg_web.ins_company_distribution icd
join rsa_epg_web.vacant_policy_counter vpc on vpc.ins_company_distribution_id = icd.ins_company_distribution_id
join rsa_epg_web.vacant_policy_counter_jour vpcj on vpc.vacant_policy_counter_id = vpcj.vacant_policy_counter_id
where period_beg_date = to_date('02.04.2019','dd.mm.yyyy')
and is_used = 1
group by vpc.vacant_policy_counter_id;

select
count(1) 
from rsa_epg_web.ins_company_distribution icd
join rsa_epg_web.vacant_policy_counter vpc on vpc.ins_company_distribution_id = icd.ins_company_distribution_id
where period_beg_date = to_date('02.04.2019','dd.mm.yyyy');

select
count(1) 
from rsa_epg_web.ins_company_distribution icd
join rsa_epg_web.vacant_policy_counter vpc on vpc.ins_company_distribution_id = icd.ins_company_distribution_id
where period_beg_date = to_date('09.04.2019','dd.mm.yyyy')
and is_used = 0;

select sum(amount_policy_garant) from rsa_epg_web.ins_company_distribution where period_beg_date = to_date('02.04.2019','dd.mm.yyyy');

select max(vacant_policy_counter_jour_id) from rsa_epg_web.vacant_policy_counter_jour where vacant_policy_counter_id= '33374' and application_id is not null;
select * from rsa_epg_web.vacant_policy_counter order by vacant_policy_counter_id desc;
select * from rsa_epg_web.vacant_policy_counter_jour;

with TT1 as (
select
MAX(vpcj.vacant_policy_counter_jour_id) vpccji, vpc.vacant_policy_counter_id
from rsa_epg_web.ins_company_distribution icd
join rsa_epg_web.vacant_policy_counter vpc on vpc.ins_company_distribution_id = icd.ins_company_distribution_id
join rsa_epg_web.vacant_policy_counter_jour vpcj on vpc.vacant_policy_counter_id = vpcj.vacant_policy_counter_id
where period_beg_date = to_date('02.04.2019','dd.mm.yyyy')
and is_used = 1
group by vpc.vacant_policy_counter_id
)
select vpcj.application_id from rsa_epg_web.vacant_policy_counter_jour vpcj where vacant_policy_counter_jour_id in (
select vpccji from TT1
);
