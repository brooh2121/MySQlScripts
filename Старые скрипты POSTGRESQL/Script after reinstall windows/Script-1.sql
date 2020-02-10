select * from notif_pg.notification_jour 
where 1=1 --create_date >= to_timestamp('13.09.2019 16:29','dd.mm.yyyy hh24:mi')
--and create_date < to_timestamp('13.09.2019 16:30','dd.mm.yyyy hh24:mi')
and email = 'fiksagirl@mail.ru';

select * from notif_pg.notification_process_jour limit 1;

select * from notif_pg.notification_status_request limit 1;