select * from ae_materials_v9;

select * from ae_mat_manufacturers_v9 mm join public.ae_materials_v9 m on mm.id = m.id_mat_manufacturers
where mm.id = 3;

select * from public.ae_mat_manufacturers_v8 amm
join public.ae_materials_v8 am on amm.id = am.id_mat_manufacturers
where am.id_mat_manufacturers = 3;

select * from ae_versions order by id;

commit;


select * from public.ae_manufactures_v9;

select * from public.ae_mat_manufacturers_v9;

/*
insert into public.ae_versions
(
id,
date_start,
date_end,
description
) values (
9,
to_timestamp('01.06.2018 00:00:01','dd.mm.yyyy hh24:mi:ss'),
to_timestamp('01.06.2018 23:59:59','dd.mm.yyyy hh24:mi:ss'),
'Справочник цен c 2018-06-01'
);

commit;
*/


select * from public.ae_economic_regions_v11 er;
select * from public.ae_repair_prices_v8;
select * from public.ae_rp_car_types_v8;
select * from public.ae_rp_man_car_types_v8;
select * from public.ae_manufactures_v11 order by "name";

select * from ae_manufactures_v%1$d order by name;

select
m."name",
rct."name",
er."name",
rr.price
from public.ae_manufactures_v11 m
join public.ae_rp_man_car_types_v11 rmct on m.id = rmct.rp_manufacture_id
join public.ae_rp_car_types_v11 rct on rmct.rp_car_type_id = rct.id
join public.ae_repair_prices_v11 rr on rmct.id = rr.rp_man_car_type_id
join public.ae_economic_regions_v11 er on rr.economic_region_id = er.id
where m.id = 34
order by
m."name";

select
m."name" as "Марка",
rct."name" as "Тип ТС",
er."name" as "Экономический регион",
rr.price as "Средняя стоимость"
from public.ae_manufactures_v11 m
left join public.ae_rp_man_car_types_v11 rmct on m.id = rmct.rp_manufacture_id
left join public.ae_rp_car_types_v11 rct on rmct.rp_car_type_id = rct.id
left join public.ae_repair_prices_v11 rr on rmct.id = rr.rp_man_car_type_id
left join public.ae_economic_regions_v11 er on rr.economic_region_id = er.id
where m.id = 29
order by m."name";

select * from public.ae_manufactures_v0 where name like '%BAW%';
select * from public.ae_rp_man_car_types_v9 rmct where rmct.id = 104;
select * from public.ae_rp_car_types_v9 rct where rct.id = 3;
select * from public.ae_manufactures_v10 order by "name";
select * from public.ae_mat_manufacturers_v11;

select * from rsa_prices_9.ae_manufacturers where name like '%BAW%';
select * from public.ae_manufactures_v8 where name like '%Higer%';
select * from public.ae_manufactures_v9 order by name;

select * from public.ae_manufactures_v8 order by name;

select * from public.ae_manufactures_v9 order by name;

select * from public.ae_settings;
select * from public.ae_versions;
select * from public.ae_rp_car_types_v11;

select * from public.ae_spare_prices_v11_r50 asp join public.ae_spares_v11 "as" on asp.spare_id = "as".id
where manufactures_id = 4;

select * from public.ae_spares_v11 where manufactures_id = 34;

select * from public.ae_repair_prices_v11 where price = '1140.00';

select m.name manufacture, er.name region, ct.name car, rp.price price
from ae_repair_prices_v11 rp
join ae_rp_man_car_types_v11 mc on mc.id = rp.rp_man_car_type_id
join ae_rp_manufactures_v11 m on m.id = mc.rp_manufacture_id
join ae_economic_regions_v11 er on er.id = rp.economic_region_id
join ae_rp_car_types_v11 ct on ct.id = mc.rp_car_type_id
where m.id = 29