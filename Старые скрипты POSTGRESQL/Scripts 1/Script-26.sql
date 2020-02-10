select * from rsa_prices_11.ae_versions;

insert into public.ae_versions (
id,
date_start,
date_end,
description
) values (
11,
to_timestamp('01.06.2019 00:00:01','dd.mm.yyyy hh24:mi:ss'),
to_timestamp('30.11.2019 23:59:59','dd.mm.yyyy hh24:mi:ss'),
'Справочник цен c 2019-06-01'
);

commit;

select * from rsa_prices_11.ae_manufacturers;