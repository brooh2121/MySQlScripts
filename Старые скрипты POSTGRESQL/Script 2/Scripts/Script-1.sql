select * from event_log el
join event_type et on el.event_type_id = et.event_type_id
where application_id = '1839566824' order by event_date;--754307496

select * from event_log el
join event_type et on el.event_type_id = et.event_type_id
where application_id = '885010845' order by event_date;
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

select * from lock_pts where application_id = '1795221793';
select * from lock_pts where application_id = '739475075';

select * from user_cabinet where pts = '099123';-- По заявке от Хоски
select * from user_cabinet where pts = '77УА973431';-- Мерцалов
select * from user_cabinet where pts = '63НО486144';--СК МАКС

select * from user_cabinet where pts like '%600800%';

select * from lock_pts where pts = '61МН771867';

FROM rsa_epg_web.user_cabinet c
          JOIN rsa_epg_web.lock_pts p
            ON p.application_id = c.application_id
         WHERE p.create_date > to_date('24.10.2017 00:00:00', 'dd.mm.yyyy') and p.create_date < to_date ('25.10.2017', 'dd.mm.yyyy')
           AND c.status_id NOT IN (6, 7) -- 6=LOCKED , 7=SUCCES_PAY 
        ;


select * from user_cabinet uc
join lock_pts lp on uc.application_id = lp.application_id
join user_cabinet_status ucs on uc.status_Id = ucs.id
where uc.pts = '25УМ876863';

select * from user_cabinet uc
join lock_pts lp on uc.application_id = lp.application_id
join user_cabinet_status ucs on uc.status_Id = ucs.id
where uc.pts like '%314796%';

select * from user_cabinet uc
join lock_pts lp on uc.application_id = lp.application_id
join user_cabinet_status ucs on uc.status_Id = ucs.id
where uc.login = 'gni22408@gmail.com';--ivan111ivanov10@inbox.ru

select * from user_cabinet uc
join lock_pts lp on uc.application_id = lp.application_id
join user_cabinet_status ucs on uc.status_Id = ucs.id
where uc.application_id = '1601638649';


select * from databasechangelog order by dateexecuted desc;

select * from databasechangeloglock;

select * from rsa_epg_web.event_log where error_code = '7019';


select
count(uc.application_id) "Кол-во ЛК",
to_char(uc.create_date,'mm.yyyy') "Месяц.Год"
from user_cabinet uc
join lock_pts lp on uc.application_id = lp.application_id
join user_cabinet_status ucs on uc.status_Id = ucs.id
where uc.create_date >= to_timestamp('01.01.2018','dd.mm.yyyy')
group by 
to_char(uc.create_date,'mm.yyyy')
order by
to_char(uc.create_date,'mm.yyyy');

select
count() 
from event_log el
join event_type et on el.event_type_id = et.event_type_id
where event_date >= to_date('30.05.2018 00:00:00', 'dd.mm.yyyy')
and el.error_text = 'Превышено время ожидания ответа от сервера очередей сообщений'
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

SELECT *
FROM user_cabinet x
WHERE x.login = 'somebit@mail.ru'
AND LOWER(x.pts) = LOWER('78НО715381')
AND x.doc_type_ts_id = 30
AND status_id in (2,3,4,5,7);

SELECT *
FROM user_cabinet c
WHERE c.user_cabinet_id = (SELECT src.user_cabinet_id
FROM (SELECT x.user_cabinet_id
FROM user_cabinet x
WHERE x.login = 'somebit@mail.ru'
AND LOWER(x.pts) = LOWER('78НО715381')
AND x.doc_type_ts_id = 30
AND status_id in (2,3,4,5,7)
ORDER BY x.application_id DESC) src
limit 1);

select
count(distinct el.application_id),
to_char(el.event_date,'mm.yyyy')
from rsa_epg_web.event_log el
where el.error_code = '7018'
--and el.application_id = '1331112699'
--and to_timestamp(current_time,'mm')
--and date_trunc('month',current_date)
and el.event_date >= (select date_trunc('month',current_date))
group by to_char(el.event_date,'mm.yyyy');

select
--distinct el.application_id
count(distinct el.application_id) "Кол-во заявлений"--,
--to_char(el.event_date,'mm.yyyy') "месяц.год"
from rsa_epg_web.event_log el
where el.error_code = '7018'
--and el.event_date >= (select date_trunc('month',current_date))
and el.event_date between to_timestamp('01.07.2018','dd.mm.yyyy') and to_timestamp('01.10.2018','dd.mm.yyyy')
--and el.application_id = '1477172519'
--group by to_char(el.event_date,'mm.yyyy')
--group by el.application_id
--having count(el.application_id) > 1
;

select date_trunc('month',current_date)

select * from event_type et order by event_type_id;

select
distinct uc.application_id
from event_log el join user_cabinet uc on el.application_id = uc.application_id
where el.client_info like '109.201.133.235%';

