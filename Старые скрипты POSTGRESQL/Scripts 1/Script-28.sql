select * from rsa_epg_web.ins_company where ins_company_id = '262';

--262	"АльфаСтрахование" АО	00300000


select
count(vacant_policy_counter_id) "Остаток свободных",
ic.ins_company "Наименование СК",
ic.ins_company_id "ID СК",
ic.insurer_id "INSURER",
distribution_code "ОБщий Регион",
current_timestamp
from rsa_epg_web.vacant_policy_counter vpc
join rsa_epg_web.ins_company ic on vpc.ins_company_id = ic.ins_company_id
--join rsa_epg_web.vacant_policy_counter_jour  vpcj on vpc.vacant_policy_counter_id = vpcj.vacant_policy_counter_id
and vpc.is_used = 0
and ic.ins_company_id = 206
group by
ic.ins_company,
ic.ins_company_id,
ic.insurer_id,
distribution_code
order by ic.ins_company;

select * from rsa_epg_web.amount_policy_counter_jour apcj where distribution_code = 1;

with TT1 as (
SELECT
vpcj.application_id 
from rsa_epg_web.vacant_policy_counter_hist vpch
join rsa_epg_web.vacant_policy_counter_jour vpcj on vpch.vacant_policy_counter_id = vpch.vacant_policy_counter_id
where vpch.ins_company_distribution_id = '507' and ins_company_id = 262 and vpcj.application_id is NOT NULL
)
select count(application_id) from rsa_epg_web.user_cabinet uc where uc.application_id in (
select application_id from tt1
)
and uc.status_id = 7
;


select * from rsa_epg_web.ins_company_distribution where ins_company_id = 274 and distribution_code = 1;