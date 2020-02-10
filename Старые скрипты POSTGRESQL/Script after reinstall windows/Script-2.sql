select * from rsa_epg_web.amount_policy_counter_jour apcj where apcj.create_date >= TO_TIMESTAMP('30.12.2019','dd.mm.yyyy');

select * from rsa_epg_web.user_cabinet uc 
join rsa_epg_web.user_cabinet_status ucs on uc.status_id = ucs.id
where uc.login = 'proskurninav@yandex.ru';
--where application_id = '2724604788';

--55	GET_INSURERS_LIST	Получение/обновление списка страховых компаний для выбора Обеспечивающего страховщика
--34	INC_OR_DEC_VPC	Вызов процедуры увеличения и уменьшения количества договоров из доп. распределения, доступных для заключения
select
*
from rsa_epg_web.event_log el join rsa_epg_web.event_type et on el.event_type_id = et.event_type_id
where 1=1--el.event_date between to_timestamp('09.01.2020 15:54:47','dd.mm.yyyy hh24:mi:ss') and to_timestamp('09.01.2020 15:55:48','dd.mm.yyyy hh24:mi:ss')
and el.event_log_id = 34;

select * from rsa_epg_web.event_type order by event_type_id;


select * from timer_counter where application_id = '2704785937';

select * from rsa_epg_web.event_log el
join rsa_epg_web.event_type et on el.event_type_id = et.event_type_id
where application_id = '2848220882' order by el.event_date;

select * from extra_vacant_policy_number_for_equal;

select * from rsa_epg_web.timer_counter tc
join rsa_epg_web.timer_type tt on tc.timer_type_id = tt.timer_type_id
where application_id = '2780884201';

select login,application_id,create_date,brief,text from rsa_epg_web.user_cabinet uc 
left join rsa_epg_web.user_cabinet_status ucs on uc.status_id = ucs.id
where application_id IN (
'2780884201'
);

select
count(vacant_policy_counter_id) "Остаток свободных",
ic.ins_company "Наименование СК",
ic.ins_company_id "ID СК",
ic.insurer_id "INSURER",
distribution_code "ОБщий Регион",
current_timestamp
from rsa_epg_web.vacant_policy_counter vpc
join rsa_epg_web.ins_company ic on vpc.ins_company_id = ic.ins_company_id
--join rsa_epg_web.vacant_policy_counter_jour  vpcj on vpc.vacant_policy_counter_id = vpcj.vacant_policy_counter_id
and vpc.is_used = 0
and ic.ins_company_id = 222
group by
ic.ins_company,
ic.ins_company_id,
ic.insurer_id,
distribution_code
order by ic.ins_company;

select * from rsa_epg_web.ins_company where lower(ins_company) like '%югория%';

rollback;


select ic.ins_company,icd.* from rsa_epg_web.ins_company_distribution icd
join rsa_epg_web.ins_company ic on icd.ins_company_id = ic.ins_company_id
where principal_unq_id = (select max(principal_unq_id) from rsa_epg_web.ins_company_distribution);

select ic.ins_company,icd.* from rsa_epg_web.ins_company_distribution icd 
join rsa_epg_web.ins_company ic on icd.ins_company_id = ic.ins_company_id
where 1=1/*principal_unq_id = 521*/ and ic.ins_company_id = 206;

select * from rsa_epg_web.user_cabinet uc where login like '%mogushkov%';

select
*
from rsa_epg_web.ins_company_distribution icd
join rsa_epg_web.ins_company ic on icd.ins_company_id = ic.ins_company_id
where calculation_date >= to_timestamp ('28.10.2019','dd.mm.yyyy')
and distribution_code = 1;

select current_date - 1;

--driga1971@bk.ru	$2a$10$8racl1WzKFZLMrxqsqZ0luuu6itjVYJa2VL4UbJ7HPtEhnwL9pk5u	2704785937

DO $$
DECLARE
  v_var NUMERIC(1);
  cur   CURSOR FOR
    WITH distr14 AS
     (SELECT d.*, row_number() over(PARTITION BY d.ins_company_id, distribution_code ORDER BY d.create_date) rn
        FROM ins_company_distribution d
       WHERE d.principal_unq_id = 564
         AND d.period_beg_date = to_timestamp('14.10.2019', 'dd.mm.yyyy')),
    distr15 AS
     (SELECT d.*, row_number() over(PARTITION BY d.ins_company_id, distribution_code ORDER BY d.create_date) rn
        FROM ins_company_distribution d
       WHERE d.principal_unq_id = 564
         AND d.period_beg_date = to_timestamp('15.10.2019', 'dd.mm.yyyy'))
    SELECT d14.ins_company_distribution_id old_id, d15.ins_company_distribution_id new_id
      FROM distr14 d14
      JOIN distr15 d15
        ON d15.ins_company_id = d14.ins_company_id
       AND d14.distribution_code = d15.distribution_code;

BEGIN

  FOR rec IN cur
  LOOP
    UPDATE vacant_policy_counter
       SET ins_company_distribution_id = rec.new_id
     WHERE ins_company_distribution_id = rec.old_id;

    DELETE FROM ins_company_distribution WHERE ins_company_distribution_id = rec.old_id;
  END LOOP;

  INSERT INTO amount_policy_counter_jour
    (principal_unq_id
    ,distribution_code
    ,create_date)
  VALUES
    (564
    ,1
    ,to_timestamp('15.10.2019 11:29:39','dd.mm.yyyy hh24:mi:ss'));

END
$$ language 'plpgsql';

select * from rsa_epg_web.user_cabinet;


select * from rsa_epg_web.amount_policy_counter_jour;

select * from rsa_epg_web.vacant_policy_counter_jour where application_id = '2773720109';

select
* 
from rsa_epg_web.vacant_policy_counter
where vacant_policy_counter_id = '106473';

select * from rsa_epg_web.ins_company_distribution where ins_company_distribution_id = 421;

select * from rsa_epg_web.amount_policy_counter_jour where create_date >= to_timestamp('05.11.2019','dd.mm.yyyy');

select * from rsa_epg_web.egarant_settings;

select * from rsa_epg_web.ins_company_distribution where ins_company_id = 222 and calculation_date >= date_trunc('year',current_date);

select * from rsa_epg_web.extra_vacant_policy_number_for_equal;
select * from rsa_epg_web.extra_vpn_by_appl;

select * from rsa_epg_web.event_type et order by et.event_type_id;