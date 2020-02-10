select * from event_log el
join event_type et on el.event_type_id = et.event_type_id
where application_id = '953694108' order by event_date;--754307496

select * from user_cabinet uc
join lock_pts lp on uc.application_id = lp.application_id
join user_cabinet_status ucs on uc.status_Id = ucs.id
--where uc.pts = '54OK843192';
where uc.pts like '%228976%' order by uc.create_date;

select * from user_cabinet uc
join lock_pts lp on uc.application_id = lp.application_id
join user_cabinet_status ucs on uc.status_Id = ucs.id
--where uc.pts = '54OK843192';
where uc.pts like '%317641%' order by uc.create_date;

select * from user_cabinet uc
join lock_pts lp on uc.application_id = lp.application_id
join user_cabinet_status ucs on uc.status_Id = ucs.id
where uc.application_id = '821323122';

select * from lock_pts lp where pts like '%940784%';