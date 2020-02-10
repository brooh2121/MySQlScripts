---четкий договор
select * from event_log el
join event_type et on el.event_type_id = et.event_type_id
where application_id = '723053223' order by event_date;
---145370345
---четкий договор
select * from event_log el
join event_type et on el.event_type_id = et.event_type_id
where application_id = '145370345' order by event_date;
----
select * from event_log el
join event_type et on el.event_type_id = et.event_type_id
where application_id = '149127400' order by event_date;




--select * from event_type where event_type_id in ('13','34','35');
select * from databasechangelog;

select * from email_notification;

select * from user_cabinet where pts = '23ЕЕ101280';