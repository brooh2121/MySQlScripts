select * from event_log el
join event_type et on el.event_type_id = et.event_type_id
where application_id = '116085165' order by event_date;

select * from event_log el
join event_type et on el.event_type_id = et.event_type_id
where application_id = '116031238' order by event_date;

select * from email_notification;

select * from notification_channel_message;