select * from rsa_eosago.request_type rt where req_type like '%расч%';

--55	Запрос на расчет доли СК на рынке ОСАГО

select * from rsa_eosago.ins_request_jour irj where irj.req_type_id = '55' order by beg_date desc;

select
*
from rsa_eosago.ins_company ic
join rsa_eosago."USER" u on ic.ins_company_id = u.ins_company_id
where ic.ins_company_id = '197';

SELECT
ic.INS_COMPANY "Наименование СК",
ic.INSURER_ID "INSURER",
icd.ins_company_id "ID Компании",
icd.amount_policy_garant "Квота",
icd.distribution_code "Код региона",
icd.distribution_date "Дата распределения" 
FROM RSA_EOSAGO.ins_company_distribution icd
JOIN RSA_EOSAGO.INS_COMPANY ic ON ic.INS_COMPANY_ID = icd.ins_company_id
WHERE distribution_date >= TRUNC(SYSDATE)
AND icd.DISTRIBUTION_CODE = 1
--and insurer_id = '16100000'
ORDER by ic.INSURER_ID;

select
ic.ins_company,
ic.insurer_id,
pcs.*
from rsa_eosago.principal_calculation_share pcs
join rsa_eosago.ins_company ic on pcs.ins_company_id = ic.ins_company_id
where pcs.calculation_date >= trunc(sysdate) /*and insurer_id = '16100000'*/;


select * from rsa_eosago.ins_company ic where ic.insurer_id = '16100000';


UPDATE RSA_EOSAGO.INS_COMPANY_DISTRIBUTION
SET AMOUNT_POLICY_GARANT = 0 WHERE  DISTRIBUTION_CODE = 2 AND DISTRIBUTION_DATE >= TRUNC(sysdate);

select * from rsa_eosago.ins_company_distribution
WHERE  DISTRIBUTION_CODE = 2 AND DISTRIBUTION_DATE >= TRUNC(sysdate);

commit;

select * from rsa_eosago.epolicy where ins_company_id = 245 and is_egarant = 1 and policy_state_id = 1 and policy_create_date >= to_date('06.09.2019','dd.mm.yyyy');

select * from rsa_eosago.epolicy e where policy_create_date >= trunc(sysdate,'hh') and is_egarant = 1 and policy_state_id = 1;

select policy_rec_id from rsa_eosago.epolicy e where e.is_trans_car = 1 and policy_state_id = 3 and policy_create_date >= trunc(sysdate,'mm');
select * from rsa_eosago.policy_process_jour ppj where policy_proc_id in (
select policy_proc_id from rsa_eosago.epolicy e where e.is_trans_car = 1 and policy_state_id = 3 and policy_create_date >= trunc(sysdate)
);
