select
nj.*,
regexp_matches(nj.notification_data,'0101166717')
from notif_pg.notification_jour nj
where create_date >= to_timestamp('01.09.2019','dd.mm.yyyy');
--where create_date >= date_trunc('month', current_date);
--where regexp_matches(notification_data,'[<span class="underLined">]+','\w');

select * from notif_pg.notification_jour where email = 'e828eh07@mail.ru';
