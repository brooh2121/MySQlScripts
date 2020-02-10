select 
ic.ins_company, count(1) "Использованных для заключения",icd.distribution_code "Регион",icd.principal_unq_id "ID распределения"
from rsa_epg_web.ins_company_distribution icd
join rsa_epg_web.ins_company ic on icd.ins_company_id = ic.ins_company_id
join rsa_epg_web.vacant_policy_counter vpc on vpc.ins_company_distribution_id = icd.ins_company_distribution_id
where 1=1 --is_used = 1
and icd.ins_company_id = 274
group by icd.distribution_code,principal_unq_id,ic.ins_company
order by principal_unq_id;

with TT1 as (
select
MAX(vpcj.vacant_policy_counter_jour_id) vpccji, vpc.vacant_policy_counter_id
from rsa_epg_web.ins_company_distribution icd
join rsa_epg_web.vacant_policy_counter vpc on vpc.ins_company_distribution_id = icd.ins_company_distribution_id
join rsa_epg_web.vacant_policy_counter_jour vpcj on vpc.vacant_policy_counter_id = vpcj.vacant_policy_counter_id
where /*period_beg_date = to_date('02.04.2019','dd.mm.yyyy')
and*/ is_used = 1 and icd.ins_company_id = 257 --and  vpcj.application_id = '2210932930'
group by vpc.vacant_policy_counter_id
)
select
vpcj.application_id,vpcj
from rsa_epg_web.vacant_policy_counter_jour vpcj where vacant_policy_counter_jour_id in (
select vpccji from TT1
) and vpcj.vacant_policy_counter_id = '35533';

select
*
from rsa_epg_web.ins_company_distribution icd
join rsa_epg_web.vacant_policy_counter vpc on vpc.ins_company_distribution_id = icd.ins_company_distribution_id
join rsa_epg_web.vacant_policy_counter_jour vpcj on vpc.vacant_policy_counter_id = vpcj.vacant_policy_counter_id
where /*period_beg_date = to_date('02.04.2019','dd.mm.yyyy')
and*/ is_used = 1 and icd.ins_company_id = 257 --and  vpcj.application_id = '2210932930'
/*and vpcj.vacant_policy_counter_id = '35533'*/ and vpcj.application_id is not null;


with tt1 as (
select
application_id,vacant_policy_counter_id 
from rsa_epg_web.vacant_policy_counter_jour vpcj
where vacant_policy_counter_id in (
select vacant_policy_counter_id
from rsa_epg_web.vacant_policy_counter_jour 
where application_id in (
'2210932930',
'2220836898',
'2246120121',
'2254090349',
'2258157689')
)
)

select
login,uc.application_id,text,create_date,tt1.vacant_policy_counter_id
from rsa_epg_web.user_cabinet uc
join rsa_epg_web.user_cabinet_status ucs on uc.status_id = ucs.id
join tt1 on uc.application_id = tt1.application_id
where ucs.id in (7,8)
;

select
insurer_name,login,uc.application_id,uc.create_date,brief,text
from user_cabinet uc
join lock_pts lp on uc.application_id = lp.application_id
join user_cabinet_status ucs on uc.status_Id = ucs.id
where uc.application_id in ('2220836898','2246120121','2254090349','2258157689');


select
ins_company_id,
principal_unq_id,
amount_policy_garant,
icd.distribution_code
from rsa_epg_web.ins_company_distribution icd
where icd.ins_company_id = 257
order by icd.ins_company_id,principal_unq_id;


WITH ic_list AS
 (SELECT ic.ins_company_id, ic.ins_company, ic.insurer_id, d.distribution_code
    FROM ins_company ic
    JOIN (SELECT 1 distribution_code UNION ALL SELECT 2) d
      ON 1 = 1
   WHERE ic.ins_company_id IN (10,
                               12,
                               18,
                               19,
                               20,
                               201,
                               202,
                               203,
                               206,
                               209,
                               212,
                               213,
                               214,
                               217,
                               219,
                               222,
                               223,
                               226,
                               227,
                               228,
                               230,
                               232,
                               237,
                               242,
                               244,
                               245,
                               251,
                               252,
                               254,
                               257,
                               26,
                               262,
                               263,
                               265,
                               267,
                               269,
                               271,
                               274,
                               281,
                               285,
                               287,
                               352)),
distr_by_appl AS
 (SELECT src.application_id, c.distribution_code
    FROM (SELECT j.*
                ,row_number() over(PARTITION BY j.vacant_policy_counter_id ORDER BY j.create_date) row_num
                ,COUNT(*) over(PARTITION BY j.vacant_policy_counter_id) cnt_num
            FROM vacant_policy_counter_jour j) src
    JOIN vacant_policy_counter c
      ON c.vacant_policy_counter_id = src.vacant_policy_counter_id
   WHERE src.cnt_num = src.row_num)
 
SELECT ic.*
      ,CASE
         WHEN gen.cnt IS NULL THEN
          0
         ELSE
          gen.cnt
       END gen_cnt
      ,CASE
         WHEN free.cnt IS NULL THEN
          0
         ELSE
          free.cnt
       END free_cnt
      ,CASE
         WHEN used_in_lk.cnt IS NULL THEN
          0
         ELSE
          used_in_lk.cnt
       END used_in_lk_cnt
        
      ,NULL
      ,CASE
         WHEN extra.cnt IS NULL THEN
          0
         ELSE
          extra.cnt
       END extra_cnt
      ,CASE
         WHEN exceed_vpn.cnt_exceed IS NULL THEN
          0
         ELSE
          cnt_exceed
       END cnt_exceed
 
  FROM ic_list ic
 
  LEFT JOIN (SELECT SUM(d.amount_policy_garant) cnt, d.ins_company_id, j.distribution_code
               FROM amount_policy_counter_jour j
               JOIN ins_company_distribution d
                 ON d.principal_unq_id = j.principal_unq_id
                AND d.distribution_code = j.distribution_code
              GROUP BY d.ins_company_id, j.distribution_code) gen
    ON gen.ins_company_id = ic.ins_company_id
   AND gen.distribution_code = ic.distribution_code
 
  LEFT JOIN (SELECT COUNT(*) cnt, c.ins_company_id, c.distribution_code
               FROM vacant_policy_counter c
              WHERE c.is_used = 0
              GROUP BY c.ins_company_id, c.distribution_code) free
    ON free.ins_company_id = ic.ins_company_id
   AND free.distribution_code = ic.distribution_code
 
  LEFT JOIN (SELECT COUNT(*) cnt, ic.ins_company_id, d.distribution_code
               FROM lock_pts l
               JOIN ins_company ic
                 ON ic.insurer_id = l.insurer_id
               JOIN distr_by_appl d
                 ON d.application_id = l.application_id
               LEFT JOIN user_cabinet c
                 ON l.application_id = c.application_id
               LEFT JOIN user_cabinet_status cs
                 ON cs.id = c.status_id
              WHERE l.is_active = 1
                AND (c.user_cabinet_id IS NULL OR c.user_cabinet_id IS NOT NULL AND cs.is_final = 0)
              GROUP BY ic.ins_company_id, d.distribution_code) used_in_lk
    ON used_in_lk.ins_company_id = ic.ins_company_id
   AND used_in_lk.distribution_code = ic.distribution_code
 
  LEFT JOIN (SELECT COUNT(*) cnt, e.ins_company_id, e.distr_code distribution_code
               FROM extra_vpn_by_appl e
              WHERE e.is_processed = 0
              GROUP BY e.ins_company_id, e.distr_code) extra
    ON extra.ins_company_id = ic.ins_company_id
   AND extra.distribution_code = ic.distribution_code
 
  LEFT JOIN (SELECT COUNT(*) cnt_exceed, e.ins_company_id, e.distribution_code, e.create_date
               FROM vacant_policy_counter_exceed e
              GROUP BY e.ins_company_id, e.distribution_code, e.create_date) exceed_vpn
    ON exceed_vpn.ins_company_id = ic.ins_company_id
   AND exceed_vpn.distribution_code = ic.distribution_code
   and exceed_vpn.create_date >= to_date('01.07.2019 00:00', 'dd.mm.yyyy hh24:mi')
   where ic.ins_company_id = 271
 ORDER BY ic.distribution_code, CAST(ic.ins_company_id AS VARCHAR);

 select * from rsa_epg_web.ins_company_distribution icd 
