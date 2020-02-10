select
*
from sms_notif_pg.sms_notification_process_jour snpj
join sms_notif_pg.sms_notification_process_err snpe on snpj.sms_notification_process_jour_id = snpe.notification_process_jour_id
join sms_notif_pg.sms_notification_jour  snj on snpj.sms_notification_jour_id = snj.sms_notification_jour_id

select * from sms_notif_pg.sms_notification_jour;

