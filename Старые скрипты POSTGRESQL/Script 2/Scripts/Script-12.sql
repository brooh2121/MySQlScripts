select * from glonassdb.glonass.ck where "name" like '%Ингос%';

--252	04800000	e0v8acNuIt1	ПАО "АСКО-СТРАХОВАНИЕ"

select * from glonassdb.glonass.dkbm_request_journal;

select * from glonassdb.glonass.ck;


select
distinct
c.name
from glonassdb.glonass.ck_request_journal crj
join glonassdb.glonass.ck c on crj.ck_id = c.id
where c.id not in (9999);

select
* 
from glonassdb.glonass.ck c
left join glonassdb.glonass.ck_request_journal crj on c.id = crj.ck_id
where c.id in (254,262);

--254 Зетта
--262 АЛьфа

select * from glonassdb.glonass.ck_request_journal crj where crj.ck_id in (254,262);