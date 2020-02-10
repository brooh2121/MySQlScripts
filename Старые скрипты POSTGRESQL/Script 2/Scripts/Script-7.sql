select * from public."USER" order by user_id;

select nextval('public."USER_user_id_seq"');-- рабочий селект сиквенса

select public.USER_user_seq.nextval from;

insert into public."USER" (user_id, login, password, user_role_id)
values(1000004,'rozhkovav','qazqwe',4);

/*insert into public."USER" (user_id, login, password, user_role_id)
values(1000002,'turinka','0809yy6',4);*/

commit;

select * from public.user_role;


select * from public.role_access_data_msi;

select
apo.*
from public.appeal_policy_owner apo join public.appeal_subject "as" on apo.policy_owner_id = "as".appeal_subject_id
where policy_owner_id in (12,13);

select * from public.appeal_subject order by appeal_subject_id;

select * from public.appeal_policy_owner apo;

commit;

select * from public.payment_jour;

rollback;

SELECT a.act_insurer_jour_id act_insurer_jour_id, a.create_date, d.*
FROM act_insurer_jour a
LEFT JOIN act_insurer_act_insurer_data_jour ad ON ad.act_insurer_jour_id = a.act_insurer_jour_id
LEFT JOIN act_insurer_data_jour d ON d.act_insurer_data_jour_id = ad.act_insurer_data_jour_id
WHERE a.ins_company_id = '19'
AND a.create_date >= to_timestamp('01.07.2018','dd.mm.yyyy')
AND a.create_date < to_timestamp('03.10.2018','dd.mm.yyyy')
--ORDER BY a.create_date, a.act_insurer_jour_id, d.report_number;
order by act_insurer_jour_id;

select * from public.act_insurer_jour where ins_company_id = 19 order by create_date;

select * from public.act_insurer_data_jour aidj order by date_request;

select * from public.act_insurer_act_insurer_data_jour;

SELECT DISTINCT ins_company_id
FROM act_insurer_jour
WHERE ins_company_id = 19
AND create_date >= to_timestamp('01.07.2018','dd.mm.yyyy')
AND create_date < to_timestamp('02.10.2018','dd.mm.yyyy');

select * from public.ins_company where ins_company_id = '1094';

select * from public.ins_company ic
where ic.ins_company = 'ПАРИ';

commit;

select * from public.report;