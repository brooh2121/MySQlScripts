select * from rsamsipg.public.ins_company ic where lower(ins_company) = lower('УРАЛСИБ');

-- РЕНЕССАНС СТРАХОВАНИЕ переименован в АО Группа Ренессанс Страхование
-- ИТИЛЬ переименован в АРМЕЕЦ
-- ЮЖУРАЛ-АСКО переименован в АСКО-СТРАХОВАНИЕ
-- ДИАНА переименован в СОЛИДАРНОСТЬ
-- ЕВРОПЛАН переименован в ИНТЕРИ
-- Строительная Страховая Группа переименован в Трудовое страхование
-- РЕСПЕКТ ПОЛИС переименован в Респект
-- НСГ переименован в Национальная Страховая Группа
-- Внешн. Сахалинская страховая Ассоциация переименован в ВССА
-- ШАНС переименован в РЕСО-Шанс

-- Добавил СК ЮНИТИ РЕ как отдельную

select * from rsamsipg.public.ins_company ic where ins_company_id = '1079';

select max(ins_company_id) from rsamsipg.public.ins_company ic;

select * from rsamsipg.public.ins_company ic where insurer_id = '70000086';

insert into rsamsipg.public.ins_company (
ins_company_id,
ins_company,
insurer_id,
is_insurer,
start_date,
end_date,
number_company_egrssd,
inn,
kpp,
create_date,
change_date
)
values (
1097,
'ЮНИТИ РЕ',
'70000093',
1,
current_date,
current_date,
0000,
'7803034240',
0000,
current_date,
current_date
);

commit;

select * from ins_company order by insurer_id;
select * from "USER";
select * from role_access_data_msi;
select * from user_role;
select * from ins