select el.event_type_id,event_date,application_id,et.brief,et."text" from event_log el
join event_type et on el.event_type_id = et.event_type_id
where application_id = '2537398910' order by event_date;--754307496

select * from event_type et order by event_type_id;

select * from event_log el
join event_type et on el.event_type_id = et.event_type_id;
select * from event_type et order by event_type_id;

select * from email_notification;

select * from notification_channel_message;

select count(user_cabinet_id) from user_cabinet;

select * from event_log where error_code is not null;

select * from sms_notification;

select * from notification_policy_jour;

select * from email_notification;

select * from notification_channel_message;

select * from notification_policy_jour;

select * from lock_pts where application_id = '2407920610';
select * from lock_pts where application_id = '1475488482';


select * from user_cabinet where pts = '63мх';
select * from user_cabinet where pts = '77РЈРђ973431';
select * from user_cabinet where pts = '63РќРћ486144';
select * from user_cabinet where application_id = '2540187955';
select * from user_cabinet where login = ' dolov54@bk.ru';
select * from user_cabinet uc
join user_cabinet_status ucs on uc.status_id = ucs.id
--join user_cabinet_status_history ucsh on ucsh.user_cabinet_id = uc.user_cabinet_id
--join user_cabinet_status ucs1 on ucsh.status_id = ucs1.id
where mobile_number like '%79686367197%';

select * from user_cabinet where pts like '%656126%';
select * from lock_pts where pts = '61РњРќ771867';

select * from user_cabinet where login like '%murtuz03@mail.ru%';

select count(uc.user_cabinet_id),uc.status_id,ucs.text,uc.pts
from user_cabinet uc
join lock_pts lp on uc.application_id = lp.application_id
join user_cabinet_status ucs on uc.status_Id = ucs.id 
where lp.create_date > to_date ('25.10.2017', 'dd.mm.yyyy')
group by uc.status_id,ucs.text,uc.pts
having count(uc.user_cabinet_id) > 1;

SELECT COUNT(1)
  FROM rsa_epg_web.user_cabinet
WHERE user_cabinet_id IN
       (SELECT c.user_cabinet_id
          FROM rsa_epg_web.user_cabinet c
          JOIN rsa_epg_web.lock_pts p
            ON p.application_id = c.application_id
         WHERE /*p.create_date > to_date('25.10.2017 00:00:00', 'dd.mm.yyyy hh24:mi:ss') and*/ p.create_date > to_date ('25.10.2017', 'dd.mm.yyyy')
           AND c.status_id NOT IN (6, 7) -- 6=LOCKED , 7=SUCCES_PAY 
        );

SELECT COUNT(1)
  FROM rsa_epg_web.user_cabinet
WHERE user_cabinet_id IN
       (SELECT c.user_cabinet_id
          FROM rsa_epg_web.user_cabinet c
          JOIN rsa_epg_web.lock_pts p
            ON p.application_id = c.application_id
         WHERE p.create_date > to_date('24.10.2017 00:00:00', 'dd.mm.yyyy') and p.create_date < to_date ('25.10.2017', 'dd.mm.yyyy')
           AND c.status_id NOT IN (6, 7) -- 6=LOCKED , 7=SUCCES_PAY 
        );


select * from user_cabinet uc
join lock_pts lp on uc.application_id = lp.application_id
join user_cabinet_status ucs on uc.status_Id = ucs.id
where uc.pts = '2220836898';

select *
/*login,application_id,create_date,brief,text*/
from user_cabinet uc
--join lock_pts lp on uc.application_id = lp.application_id
join user_cabinet_status ucs on uc.status_Id = ucs.id
--join user_cabinet_status_history ucsh on ucs.id = ucsh.status_id
where uc.application_id in (
'2422588053'
);

select
* 
from user_cabinet_status_history ucsh join user_cabinet_status ucs on ucsh.status_id = ucs.id
where user_cabinet_id = '7140315';

--select * from rsa_epg_web.lock_pts_status_history;

select * from databasechangelog order by dateexecuted desc;

select * from databasechangeloglock;

select * from rsa_epg_web.event_log where error_code = '7019';


select
count(uc.application_id),
to_char(uc.create_date,'dd.mm.yyyy hh24')
from user_cabinet uc
join lock_pts lp on uc.application_id = lp.application_id
join user_cabinet_status ucs on uc.status_Id = ucs.id
where uc.create_date >= to_timestamp('26.04.2019','dd.mm.yyyy')
group by 
to_char(uc.create_date,'dd.mm.yyyy hh24')
order by
to_char(uc.create_date,'dd.mm.yyyy hh24');



select
count() 
from event_log el
join event_type et on el.event_type_id = et.event_type_id
where event_date >= to_date('30.05.2018 00:00:00', 'dd.mm.yyyy')
and el.error_text = 'РџСЂРµРІС‹С€РµРЅРѕ РІСЂРµРјСЏ РѕР¶РёРґР°РЅРёСЏ РѕС‚РІРµС‚Р° РѕС‚ СЃРµСЂРІРµСЂР° РѕС‡РµСЂРµРґРµР№ СЃРѕРѕР±С‰РµРЅРёР№'
order by event_date;


select
lp.insurer_name,
count(uc.application_id),
to_char(uc.create_date,'dd.mm.yyyy')
from user_cabinet uc
join lock_pts lp on uc.application_id = lp.application_id
join user_cabinet_status ucs on uc.status_Id = ucs.id
where uc.create_date >= to_timestamp('28.05.2018','dd.mm.yyyy')
and lp.insurer_id = '09300000'
group by 
to_char(uc.create_date,'dd.mm.yyyy'),
lp.insurer_name
order by
to_char(uc.create_date,'dd.mm.yyyy'),
lp.insurer_name;
--09300000

select * from user_cabinet uc
join user_cabinet_status ucs on uc.status_id = ucs.id
where login = 'nanda00brothers@mail.ru';

select
* 
from event_log el join event_type et on el.event_type_id = et.event_type_id
where el.event_type_id = 34
and el.event_date between to_timestamp('28.01.2019 13:34:00', 'dd.mm.yyyy hh24:mi:ss') and to_timestamp ('28.01.2019 13:35:00', 'dd.mm.yyyy hh24:mi:ss');


select * from user_cabinet limit 1;

select * from user_cabinet_status ucs order by ucs.id; 

select * from lock_pts limit 1;
 
select * from lock_pts_status lps order by lps.id;

with USCAB as (
select
login,
count(uc.application_id)
from user_cabinet uc
join lock_pts lp on lp.application_id = uc.application_id
where lp.insurer_id = '14800000'
and uc.status_id = 7
and uc.create_date between to_timestamp('01.01.2018 00:00:00', 'dd.mm.yyyy hh24:mi:ss') and to_timestamp ('01.01.2019 00:00:00', 'dd.mm.yyyy hh24:mi:ss')
group by login
having count(uc.application_id) >= 4
)
select
login,
uc.application_id,
uc.create_date
from user_cabinet uc 
join lock_pts lp on lp.application_id = uc.application_id 
where login in (
select login from USCAB
)
and uc.create_date between to_timestamp('01.01.2018 00:00:00', 'dd.mm.yyyy hh24:mi:ss') and to_timestamp ('01.01.2019 00:00:00', 'dd.mm.yyyy hh24:mi:ss')
and lp.insurer_id = '14800000'
and uc.status_id = 7
order by login
;

select
*
from user_cabinet uc
join lock_pts lp on uc.application_id = lp.application_id
join user_cabinet_status ucs on uc.status_Id = ucs.id
where uc.create_date >= to_timestamp('01.04.2019 00','dd.mm.yyyy hh24');

select * from ins_company_distribution idc order by ins_company_distribution_id desc;
select sum(amount_policy_garant) from ins_company_distribution idc where ins_company_id = 10;
select count(1) from vacant_policy_counter where is_used = 0 and ins_company_id = 10;
select * from vacant_policy_counter_jour;
select * from vacant_policy_counter_hist;

--delete from rsa_epg_web.ins_company_distribution where distribution_code = 1;

--delete from rsa_epg_web.vacant_policy_counter where 1=1;
--commit;

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
1,-- идентификатор распределения
248, -- ИД СК
1,-- количество гарантов
1,--код региона не крым
to_date('26.03.2019 03:00:00','dd.mm.yyyy hh24:mi:ss'),--дата распределения
to_date('27.03.2019 03:00:00','dd.mm.yyyy hh24:mi:ss'),--период вступления в силу распределения
to_date('26.03.2019 13:40:00','dd.mm.yyyy hh24:mi:ss')--судя по всему дата создания записи
);

select  * from rsa_epg_web.vacant_policy_counter where ins_company_id = 206;

commit;

select nextval('seq_ins_company_distribution');

/*
insert into rsa_epg_web.vacant_policy_counter (
vacant_policy_counter_id,
ins_company_distribution_id,
ins_company_id,
distribution_code,
is_used
) values (
nextval('seq_vacant_policy_counter'),
1,
258,
1,
0
);
*/


select * from ins_company_distribution;
select * from amount_policy_counter_jour order by amount_policy_counter_jour_id;
select * from ins_company where legal_address is not null;
select count(vacant_policy_counter_id) from vacant_policy_counter; --where distribution_code = 2;


select * from rsa_epg_web.databasechangelog order by dateexecuted desc;
select * from rsa_epg_web.ins_company ic order by insurer_id;

select * from event_log el
join event_type et on el.event_type_id = et.event_type_id
where event_date >=to_timestamp('02.04.2019 02','dd.mm.yyyy hh24');

select
count(vacant_policy_counter_id) "Остаток свободных",
ic.ins_company "Наименование СК",
ic.ins_company_id "ID СК",
ic.insurer_id "INSURER",
distribution_code "ОБщий Регион"
from rsa_epg_web.vacant_policy_counter vpc
join rsa_epg_web.ins_company ic on vpc.ins_company_id = ic.ins_company_id
--join rsa_epg_web.vacant_policy_counter_jour  vpcj on vpc.vacant_policy_counter_id = vpcj.vacant_policy_counter_id
and is_used = 0
group by
ic.ins_company,
ic.ins_company_id,
ic.insurer_id,
distribution_code
order by ic.ins_company;

select * from rsa_epg_web.vacant_policy_counter vpc;

select * from rsa_epg_web.amount_policy_counter_jour; /*where distribution_code = 2*/  /*order by create_date*/;

select * from rsa_epg_web.vacant_policy_counter_jour where application_id is null;

select * from rsa_epg_web.user_cabinet_status;

--6	LOCKED	Заблокирован

select
lp.insurer_name,
count(uc.application_id),
to_char(uc.create_date,'dd.mm.yyyy')
from user_cabinet uc
join lock_pts lp on uc.application_id = lp.application_id
join user_cabinet_status ucs on uc.status_Id = ucs.id
where uc.create_date >= to_timestamp('24.07.2019','dd.mm.yyyy')
--and lp.insurer_id = '14800000'
group by 
to_char(uc.create_date,'dd.mm.yyyy'),
lp.insurer_name
order by
to_char(uc.create_date,'dd.mm.yyyy'),
lp.insurer_name;

select
uc.application_id
from user_cabinet uc
join lock_pts lp on uc.application_id = lp.application_id
join user_cabinet_status ucs on uc.status_Id = ucs.id
where uc.create_date >= to_timestamp('02.04.2019','dd.mm.yyyy')
and lp.insurer_id = '14800000';

select
count(1),to_char(create_date,'dd.mm.yyyy'), distribution_code
from rsa_epg_web.amount_policy_counter_jour apcj
--join rsa_epg_web.vacant_policy_counter vpc on apcj.
where distribution_code in (1,2) group by to_char(create_date,'dd.mm.yyyy'),distribution_code  order by to_char(create_date,'dd.mm.yyyy');


select * from rsa_epg_web.vacant_policy_counter where vacant_policy_counter_id in (
select MAX(vacant_policy_counter_id) from rsa_epg_web.vacant_policy_counter where is_used = 1
);

select * from rsa_epg_web.ins_company_distribution where period_beg_date < to_date('08.04.2019','dd.mm.yyyy');
select * from rsa_epg_web.vacant_policy_counter_hist;

select * from rsa_epg_web.amount_policy_counter_jour;

select
count(amount_policy_counter_jour_id) pcji,
to_char(create_date,'yyyy.mm.dd') cd,
distribution_code
from rsa_epg_web.amount_policy_counter_jour apcj
where create_date >= to_timestamp ('02.04.2019','dd.mm.yyyy')
and create_date < to_timestamp ('09.04.2019','dd.mm.yyyy')
group by 
to_char(create_date,'yyyy.mm.dd'),
distribution_code
order by to_char(create_date,'yyyy.mm.dd')
;

select
count(amount_policy_counter_jour_id) pcji,
distribution_code,
apcj.principal_unq_id
from rsa_epg_web.amount_policy_counter_jour apcj
where create_date >= to_timestamp ('02.04.2019','dd.mm.yyyy')
and create_date < to_timestamp ('09.04.2019','dd.mm.yyyy')
group by
distribution_code,
apcj.principal_unq_id
order by
distribution_code,
apcj.principal_unq_id;

select date_trunc('year',current_date);

select distinct date_trunc('week',create_date) from rsa_epg_web.amount_policy_counter_jour;



select distinct min(to_char(create_date,'dd.mm.yyyy')),principal_unq_id from rsa_epg_web.amount_policy_counter_jour group by principal_unq_id;

select
count(amount_policy_counter_jour_id) pcji,
distribution_code,
apcj.principal_unq_id
from rsa_epg_web.amount_policy_counter_jour apcj
where create_date >= to_timestamp ('02.04.2019','dd.mm.yyyy')
and create_date < to_timestamp ('09.04.2019','dd.mm.yyyy')
group by
distribution_code,
apcj.principal_unq_id
order by
distribution_code,
apcj.principal_unq_id;

select
count(amount_policy_counter_jour_id) pcji,
distribution_code,
apcj.principal_unq_id
from rsa_epg_web.amount_policy_counter_jour apcj
where create_date >= to_timestamp ('09.04.2019','dd.mm.yyyy')
and create_date < to_timestamp ('16.04.2019','dd.mm.yyyy')
group by
distribution_code,
apcj.principal_unq_id
order by
distribution_code,
apcj.principal_unq_id;

select
count(amount_policy_counter_jour_id) pcji,
distribution_code,
apcj.principal_unq_id
from rsa_epg_web.amount_policy_counter_jour apcj
where create_date >= to_timestamp ('16.04.2019','dd.mm.yyyy')
and create_date < to_timestamp ('18.04.2019','dd.mm.yyyy')
group by
distribution_code,
apcj.principal_unq_id
order by
distribution_code,
apcj.principal_unq_id;



with TT1 as (
select distinct min(to_char(create_date,'yyyy.mm.dd')) MIN_DATE_RPOBROS,
principal_unq_id 
from rsa_epg_web.amount_policy_counter_jour
group by principal_unq_id
)
select 
tt1.MIN_DATE_RPOBROS,
tt2.pcji "Кол-во пробросов",
tt2.distribution_code "Регион"
from tt1 join (
select
count(amount_policy_counter_jour_id) pcji,
distribution_code,
apcj.principal_unq_id
from rsa_epg_web.amount_policy_counter_jour apcj
where create_date >= to_timestamp ('02.04.2019','dd.mm.yyyy')
and distribution_code = 2
and create_date < to_timestamp ('08.07.2019','dd.mm.yyyy')
group by
distribution_code,
apcj.principal_unq_id
order by
distribution_code,
apcj.principal_unq_id
)tt2 on tt1.principal_unq_id = tt2.principal_unq_id
order by MIN_DATE_RPOBROS
;

commit;

select * from rsa_epg_web.ins_company_distribution /*where ins_company_id = 280*/ where principal_unq_id = 161 order by ins_company_id desc;

select * from rsa_epg_web.ins_company where ins_company_id = 202  order by ins_company; --where ins_company_id = 280;

select * from rsa_epg_web.databasechangelog order by dateexecuted desc;

select * from rsa_epg_web.request_status order by req_status_id;

select * from rsa_epg_web.amount_policy_counter_jour where create_date >= to_timestamp('18.06.2019','dd.mm.yyyy') and distribution_code = 1;

select * from rsa_epg_web.vacant_policy_counter_jour;

select * from rsa_epg_web.vacant_policy_counter_jour where vacant_policy_counter_id in ('96263');

select * from rsa_epg_web.vacant_policy_counter_jour where vacant_policy_counter_id = '111733';

select vacant_policy_counter_id, min (create_date) from rsa_epg_web.vacant_policy_counter_jour where vacant_policy_counter_id > 96261 and vacant_policy_counter_id < 96267 group by vacant_policy_counter_id;

select * from rsa_epg_web.vacant_policy_counter_jour order by vacant_policy_counter_jour_id desc;
select * from rsa_epg_web.vacant_policy_counter_hist where vacant_policy_counter_id = '96261';
select * from rsa_epg_web.vacant_policy_counter_hist where vacant_policy_counter_id = '96262';

select * from rsa_epg_web.ins_company;

select * from rsa_epg_web.amount_policy_counter_jour where /*principal_unq_id = 1 and*/ distribution_code = 1;
where calculation_date >= to_timestamp('13.05.2019','dd.mm.yyyy')
and calculation_date < to_timestamp('14.05.2019','dd.mm.yyyy');

/*select * from rsa_epg_web.VACANT_POLICY_COUNTER_jour where vacant_policy_counter_id = '188249';
select * from rsa_epg_web.vacant_policy_counter where vacant_policy_counter_id = '188249';
select * from rsa_epg_web.vacant_policy_counter_hist where vacant_policy_counter_id = '188249';*/

select
*
from rsa_epg_web.ins_company_distribution icd
where icd.period_beg_date >= to_timestamp('10.06.2019','dd.mm.yyyy')
--and icd.distribution_code = 1
order by principal_unq_id;

select * from rsa_epg_web.amount_policy_counter_jour where create_date >= to_date('01.09.2019 00:00','dd.mm.yyyy hh24:mi') /*and distribution_code = 2*/;

select * from rsa_epg_web.ins_company_distribution where principal_unq_id = 201;

select
vpcj.application_id,vpc.vacant_policy_counter_id
from rsa_epg_web.vacant_policy_counter vpc
join rsa_epg_web.vacant_policy_counter_jour vpcj on vpc.vacant_policy_counter_id = vpcj.vacant_policy_counter_id
where ins_company_distribution_id in (
select ins_company_distribution_id from rsa_epg_web.ins_company_distribution where principal_unq_id = 1
) and vpcj.application_id is not null
union all
select
vpcj.application_id,vpc.vacant_policy_counter_id
from rsa_epg_web.vacant_policy_counter_hist vpc
join rsa_epg_web.vacant_policy_counter_jour vpcj on vpc.vacant_policy_counter_id = vpcj.vacant_policy_counter_id
where ins_company_distribution_id in (
select ins_company_distribution_id from rsa_epg_web.ins_company_distribution where principal_unq_id = 1
) and vpcj.application_id is not null;


select * from rsa_epg_web.vacant_policy_counter vpc where vpc.vacant_policy_counter_id = '224756';

select * from rsa_epg_web.ins_company_distribution where ins_company_distribution_id = '852';

select * from rsa_epg_web.vacant_policy_counter_hist where vacant_policy_counter_id = '224756';

select * from rsa_epg_web.vacant_policy_counter_jour where vacant_policy_counter_id = '224756';

select * from rsa_epg_web.vacant_policy_counter_jour where application_id = '2421399590';

select distinct principal_unq_id from rsa_epg_web.ins_company_distribution order by principal_unq_id;


select
count(vpcj.application_id)--,vpc.vacant_policy_counter_id
from rsa_epg_web.vacant_policy_counter vpc
join rsa_epg_web.vacant_policy_counter_jour vpcj on vpc.vacant_policy_counter_id = vpcj.vacant_policy_counter_id
where ins_company_distribution_id in (
--select ins_company_distribution_id from rsa_epg_web.ins_company_distribution where principal_unq_id = 201
select
icd.ins_company_distribution_id
from rsa_epg_web.ins_company_distribution icd
where icd.period_beg_date <= to_timestamp('10.06.2019','dd.mm.yyyy')
--and icd.distribution_code = 1
order by principal_unq_id
) and vpcj.application_id is not null
union all
select
count(vpcj.application_id)--vpcj.application_id,vpc.vacant_policy_counter_id
from rsa_epg_web.vacant_policy_counter_hist vpc
join rsa_epg_web.vacant_policy_counter_jour vpcj on vpc.vacant_policy_counter_id = vpcj.vacant_policy_counter_id
where ins_company_distribution_id in (
--select ins_company_distribution_id from rsa_epg_web.ins_company_distribution where principal_unq_id = 201
select
icd.ins_company_distribution_id
from rsa_epg_web.ins_company_distribution icd
where icd.period_beg_date <= to_timestamp('10.06.2019','dd.mm.yyyy')
--and icd.distribution_code = 1
order by principal_unq_id
) and vpcj.application_id is not null;

select ic.ins_company,ic.insurer_id,ic.ins_company_id,amount_policy_garant from ins_company_distribution icd
join ins_company ic on icd.ins_company_id = ic.ins_company_id
where distribution_code = 2 and principal_unq_id = 261 order by insurer_id;

select * from rsa_epg_web.databasechangeloglock;

truncate rsa_epg_web.databasechangeloglock;

select * from pg_stat_activity where state = 'active';

select max(calculation_date) from rsa_epg_web.ins_company_distribution; --where principal_unq_id = 261 and distribution_code = 2;
select * from rsa_epg_web.ins_company_distribution where calculation_date >= to_timestamp('08.07.2019','dd.mm.yyyy') and ins_company_id = 206;
/*
update rsa_epg_web.ins_company_distribution set amount_policy_garant = 0 where principal_unq_id = 261 and distribution_code = 2;
commit;
*/

select * from extra_vpn_by_appl;

select * from amount_policy_counter_jour;

select
*
from user_cabinet where application_id in (
'2540187955',
'2540189750',
'2543038012',
'2549466303',
'2549469853',
'2552575385',
'2555566455'
);

select * from databasechangelog order by dateexecuted desc;