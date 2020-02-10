with NEW_GARANT as (
select
count(vacant_policy_counter_id) vpci,
ins_company_id,
distribution_code
from rsa_epg_web.vacant_policy_counter vpc
where 1=1 --ins_company_id = 257
group by
ins_company_id,
distribution_code
),
OLD_GARANT as (
select
count(vacant_policy_counter_id) vpci,
ins_company_id,
distribution_code
from rsa_epg_web.vacant_policy_counter_hist vpch
where 1=1 --ins_company_id = 257
group by
ins_company_id,
distribution_code
),
PRED_SUM as (
select vpci,ins_company_id,distribution_code from NEW_GARANT
union
select vpci,ins_company_id,distribution_code from OLD_GARANT
)
select
ic.insurer_id,
distribution_code,
sum(vpci)
from PRED_SUM
join rsa_epg_web.ins_company ic on PRED_SUM.ins_company_id = ic.ins_company_id
group by ic.insurer_id,distribution_code order by ic.insurer_id;
--group by ins_company_id,distribution_code;

select count(1) from rsa_epg_web.vacant_policy_counter where ins_company_id = 274;
select count(1) from rsa_epg_web.vacant_policy_counter_hist where ins_company_id = 274;

select * from rsa_epg_web.ins_company_distribution where ins_company_id = 274 and distribution_code = 1;