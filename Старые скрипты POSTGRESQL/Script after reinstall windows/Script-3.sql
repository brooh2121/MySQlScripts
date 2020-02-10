select * from rsa_epg_web.ins_company where ins_company_id = 223;

select
ic.ins_company,
icd.*
from rsa_epg_web.ins_company_distribution icd
join rsa_epg_web.ins_company ic on icd.ins_company_id = ic.ins_company_id
where icd.ins_company_id = 222 and calculation_date >= date_trunc('week',current_date - 7);

select
* --count(el.event_log_id),to_char(el.event_date,'dd.mm.yyyy HH24:mi')
from rsa_epg_web.event_log el
join rsa_epg_web.event_type et on el.event_type_id = et.event_type_id
where event_date between to_timestamp('23.01.2020 9:30','dd.mm.yyyy hh24:mi') and to_timestamp('23.01.2020 10:30','dd.mm.yyyy hh24:mi') 
and et.event_type_id = 17
--and error_code = '7014'
--group by to_char(el.event_date,'dd.mm.yyyy HH24:mi')
--order by to_char(el.event_date,'dd.mm.yyyy HH24:mi')
;

select
ic.ins_company,
icd.*,
vpcj.application_id,
vpcj.create_date,
vpcj.vacant_policy_counter_id,
vpc.ins_company_distribution_id
from rsa_epg_web.vacant_policy_counter_jour vpcj
join rsa_epg_web.vacant_policy_counter vpc on vpcj.vacant_policy_counter_id = vpc.vacant_policy_counter_id
join rsa_epg_web.ins_company_distribution icd on vpc.ins_company_distribution_id = icd.ins_company_distribution_id
join rsa_epg_web.ins_company ic on icd.ins_company_id = ic.ins_company_id
where application_id in ('2848220882');


select
*
from rsa_epg_web.vacant_policy_counter vpc
join rsa_epg_web.vacant_policy_counter_jour vpcj on vpcj.vacant_policy_counter_id = vpc.vacant_policy_counter_id
where vpc.vacant_policy_counter_id = '282138';

select * from rsa_epg_web.vacant_policy_counter_hist vpch 
join rsa_epg_web.vacant_policy_counter_jour vpcj on vpch.vacant_policy_counter_id = vpcj.vacant_policy_counter_id
where vpch.vacant_policy_counter_id = '282138';

select
*
from rsa_epg_web.vacant_policy_counter vpc
join rsa_epg_web.vacant_policy_counter_jour vpcj on vpcj.vacant_policy_counter_id = vpc.vacant_policy_counter_id
where vpc.vacant_policy_counter_id = '106473'
and create_date >= to_timestamp('05.11.2019 14:28','dd.mm.yyyy hh24:mi:ss')
order by create_date desc;

select * from rsa_epg_web.vacant_policy_counter_hist vpch 
join rsa_epg_web.vacant_policy_counter_jour vpcj on vpch.vacant_policy_counter_id = vpcj.vacant_policy_counter_id
where vpch.vacant_policy_counter_id = '106473';

select * from rsa_epg_web.ins_company_distribution icd where calculation_date >= date_trunc('month',current_date);

select date_trunc('month',current_date);

select count(user_cabinet_id) from rsa_epg_web.user_cabinet;

select * from rsa_epg_web.vacant_policy_counter vpc where ins_company_id = 223 and is_used = 0;

select * from rsa_epg_web.vacant_policy_counter_hist where ins_company_id = 223;

select * from rsa_epg_web.vacant_policy_counter_exceed where ins_company_id = 222;

select * from rsa_epg_web.ins_company_distribution where ins_company_id = 222 and distribution_code = 1 order by calculation_date;

select * from rsa_epg_web.vacant_policy_counter_return where insurer_id = '02000000';
select * from rsa_epg_web.VACANT_POLICY_COUNTER_EXCEED where ins_company_id = 223;
select * from rsa_epg_web.vacant_policy_remaining_amount where ins_company_id = 223;

with EGARANT_RETURN as (
select 
vacant_policy_counter_id
from rsa_epg_web.vacant_policy_counter_jour
where application_id in (
'2376870779',
'2486368316',
'2297862808',
'2443024845',
'2299741229',
'2358835226',
'2464702298',
'2420251733',
'2437102561',
'2499160457',
'2414252815',
'2209302314',
'2337735889',
'2401437232',
'2317703294',
'2679222829',
'2492393389',
'2384039737',
'2285174387',
'2517388215',
'2314673931',
'2528556378',
'2392451281',
'2403564464',
'2430947034',
'2518622426',
'2508191220',
'2443093769',
'2535395691',
'2527193194',
'2389176156',
'2406385889',
'2709534700',
'2229930110',
'2403868806',
'2511886827',
'2319749248',
'2242559288',
'2400659564',
'2376686736',
'2299505852',
'2394146337',
'2405236442',
'2318512307',
'2301901591',
'2387751140',
'2474937150',
'2461750712',
'2476394722',
'2488801619',
'2245464554',
'2420063016',
'2203917360',
'2524688364',
'2347351756',
'2461534215',
'2383351425',
'2401361668',
'2485598522'
)
)
select
*
from egarant_return er 
join rsa_epg_web.vacant_policy_counter vpc on er.vacant_policy_counter_id = vpc.vacant_policy_counter_id
--join rsa_epg_web.vacant_policy_counter_jour vpcj on vpc.vacant_policy_counter_id = vpcj.vacant_policy_counter_id;