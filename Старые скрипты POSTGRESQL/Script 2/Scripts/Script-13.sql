select * from dkbmpg3.public.webrequest_journal wj order by 1 desc;

select * from dkbmpg3.public.req_access_kbm_to_jur ractoj order by ractoj.beg_date desc;

select * from dkbmpg3.public.settings;

select * from dkbmpg3.public.webrequest_journal wj where wj.webrequest_journal_id IN ('102607354','102607627');


SELECT * 
FROM req_access_kbm_to_jur 
WHERE IS_RESPONSE=1 
ORDER BY REQ_ACCESS_ID DESC 
LIMIT 1;

select
* 
from dkbmpg3.public.webrequest_type wt
join dkbmpg3.public.webrequest_journal wj on wt.webrequest_type_id = wj.webrequest_type_id
where wt.webrequest_type_id = 5
--and wj.webrequest_date >date_trunc('day',current_date);
--and wj.webrequest_date > to_timestamp('14.01.2019','dd.mm.yyyy')
and wj.webrequest_date > date_trunc('day',current_date)
order by wj.webrequest_date desc;

select * from dkbmpg3.public.databasechangelog order by dateexecuted desc;