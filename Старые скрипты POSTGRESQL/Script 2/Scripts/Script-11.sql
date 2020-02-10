select * from event_log el
join event_type et on el.event_type_id = et.event_type_id
where application_id = '1431294898' order by event_date;--754307496

select * from user_cabinet where application_id = '1431294898';

select * from user_cabinet where application_id = '1429071568';