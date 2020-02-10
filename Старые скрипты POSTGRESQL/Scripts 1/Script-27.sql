select count(1) from ae_manufactures_v9; --order by name;
select count(1) from ae_manufactures_v11;
select count(1) from ae_mfn_aliases_v9; --order by name;
select * from ae_mfn_aliases_v11;
SELECT t.* 
FROM ae_rp_car_types_v11 t
JOIN ae_rp_man_car_types_v11 bt ON bt.rp_car_type_id = t.id
WHERE bt.rp_manufacture_id=34
ORDER BY t.id

select * from ae_rp_man_car_types_v11;


select m.name manufacture, er.name region, ct.name car, rp.price price
from ae_repair_prices_v11 rp
join ae_rp_man_car_types_v11 mc on mc.id = rp.rp_man_car_type_id
join ae_rp_manufactures_v11 m on m.id = mc.rp_manufacture_id
join ae_economic_regions_v11 er on er.id = rp.economic_region_id
join ae_rp_car_types_v10 ct on ct.id = mc.rp_car_type_id
where m.id = 29
and rp.economic_region_id = 50
--and ct.id = " + carTypeId

select sp.search, sp.article, sp.name, pr.price, brand.name as brand_name
from ae_spare_prices_v11_r50 pr
left join ae_spares_v11 sp on pr.spare_id = sp.id
inner join ae_manufactures_v11 brand on brand.id=sp.manufactures_id
where pr.economic_region_id = 50 and brand.id = 34 and sp.search = 'LELU364BNA';

select * from ae_rp_manufactures_v11 where "name" = 'Jaguar';
select * from ae_manufactures_v11 where "name" = 'Jaguar';

select * from public.ae_manufactures_v11 except select * from public.ae_manufactures_v10;

select * from public.ae_rp_manufactures_v11 except select * from public.ae_rp_manufactures_v10;

select * from public.ae_rp_manufactures_v11 where "name" in (
'Jaguar',
'Datsun',
'Acura',
'Saab',
'FAW',
'BYD',
'Mini',
'BAW',
'Hino',
'SEAT',
'Cadillac'
)

SELECT * FROM ae_versions ORDER BY date_start;

select m.name manufacture, er.name region, ct.name car, rp.price price
from ae_repair_prices_v11 rp
join ae_rp_man_car_types_v11 mc on mc.id = rp.rp_man_car_type_id
join ae_rp_manufactures_v11 m on m.id = mc.rp_manufacture_id
join ae_economic_regions_v11 er on er.id = rp.economic_region_id
join ae_rp_car_types_v11 ct on ct.id = mc.rp_car_type_id
where m.id = 29;
--and rp.economic_region_id = 50
except
select m.name manufacture, er.name region, ct.name car, rp.price price
from ae_repair_prices_v10 rp
join ae_rp_man_car_types_v10 mc on mc.id = rp.rp_man_car_type_id
join ae_rp_manufactures_v10 m on m.id = mc.rp_manufacture_id
join ae_economic_regions_v10 er on er.id = rp.economic_region_id
join ae_rp_car_types_v10 ct on ct.id = mc.rp_car_type_id
--where m.id = 29
--and rp.economic_region_id = 50

select sp.search, sp.article, sp.name, pr.price, brand.name as brand_name
from ae_spare_prices_v11_r50 pr
left join ae_spares_v11 sp on pr.spare_id = sp.id
inner join ae_manufactures_v11 brand on brand.id=sp.manufactures_id
where pr.economic_region_id = 50 and brand.id = 34 and sp.search = 'LELU364BNA';

select * from ae_manufactures_v10 where upper("name") in (
'ACURA',
'FAW',
'BYD',
'SAAB',
'BAW',
'MINI',
'DATSUN',
'CADILLAC',
'SEAT',
'JAGUAR'
);


select version_id, upper(name), id as mfa_id
from public.ae_manufactures_v11
where not exists (
select id
from rsa_prices_11.ae_mfa_aliases
where ae_mfa_aliases.mfa_id = ae_manufacturers_11.id
);

select count(1) from rsa_prices_11.ae_mfa_aliases;
select * from public.ae_manufactures_v11 where id = 34;

select * from rsa_prices_11.ae_mfa_aliases;