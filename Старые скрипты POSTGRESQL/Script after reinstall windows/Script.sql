select * from rsa_epg_web.amount_policy_counter_jour apcj where apcj.create_date >= TO_TIMESTAMP('28.09.2019','dd.mm.yyyy') order by apcj.create_date desc;

select * from nsi_comp_distribution_type;
select * from ins_company_distribution icd where ins_company_id = 206;
select * from nsi_comp_distribution_settings;

select * from rsa_epg_web.user_cabinet uc 
--join rsa_epg_web.user_cabinet_status ucs on uc.status_id = ucs.id
where application_id = '176256150';

select
*
from rsa_epg_web.event_log el
join rsa_epg_web.event_type et on el.event_type_id = et.event_type_id
where application_id = '1517037992' order by event_date;

select * from rsa_epg_web.timer_counter tc
join rsa_epg_web.timer_type tt on tc.timer_type_id = tt.timer_type_id
where application_id = '1516822179';

select * from rsa_epg_web.ins_company_distribution icd where ins_company_id = 241;
select max(calculation_date) from rsa_epg_web.ins_company_distribution;

select * from rsa_epg_web.ins_company_distribution icd where calculation_date = (select max(calculation_date) from rsa_epg_web.ins_company_distribution);

--2019-09-23 00:00:00

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
--and vpc.distribution_code = 2
--and ic.ins_company_id = 241
group by
ic.ins_company,
ic.ins_company_id,
ic.insurer_id,
distribution_code
order by ic.ins_company;

/*
insert into rsa_epg_web.ins_company_distribution (
ins_company_distribution_id,
principal_unq_id,
ins_company_id,
amount_policy_garant,
distribution_code,
calculation_date,
period_beg_date,
create_date
) values (
nextval('seq_ins_company_distribution'),-- сиквенс для первичного ключа таблицы
199,-- идентификатор распределения
241, -- ИД СК
10,-- количество гарантов
2,--код региона не крым
to_date('30.09.2019 00:00:00','dd.mm.yyyy hh24:mi:ss'),--дата распределения
to_date('01.10.2019 00:00:00','dd.mm.yyyy hh24:mi:ss'),--период вступления в силу распределения
to_date('30.09.2019 23:50:00','dd.mm.yyyy hh24:mi:ss')--судя по всему дата создания записи
);
*/
rollback;
commit;

select * from rsa_epg_web.databasechangelog order by dateexecuted desc;

select * from rsa_epg_web.ins_company_distribution icd where calculation_date >= to_timestamp ('14.10.2019','dd.mm.yyyy');

update rsa_epg_web.ins_company_distribution icd set period_beg_date = current_date - 1 where principal_unq_id = 221;

select * from rsa_epg_web.timer_counter tc where application_id = '176256150';

select * from rsa_epg_web.ins_company_distribution where ins_company_id = 48;
--select * from rsa_epg_web.ins_company_distribution where ins_company_id = 241;