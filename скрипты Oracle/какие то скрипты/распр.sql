SELECT
ic.INS_COMPANY "������������ ��",
ic.INSURER_ID "INSURER",
icd.ins_company_id "ID ��������",
icd.amount_policy_garant "�����",
icd.distribution_code "��� �������",
icd.distribution_date "���� �������������" 
FROM RSA_EOSAGO.ins_company_distribution icd
JOIN RSA_EOSAGO.INS_COMPANY ic ON ic.INS_COMPANY_ID = icd.ins_company_id
WHERE distribution_date >= TRUNC(SYSDATE)
AND icd.DISTRIBUTION_CODE = 1
ORDER by ic.INSURER_ID;
SELECT
ic.INS_COMPANY "������������ ��",
ic.INSURER_ID "INSURER",
icd.ins_company_id "ID ��������",
icd.amount_policy_garant "�����",
icd.distribution_code "��� �������",
icd.distribution_date "���� �������������" 
FROM RSA_EOSAGO.ins_company_distribution icd
JOIN RSA_EOSAGO.INS_COMPANY ic ON ic.INS_COMPANY_ID = icd.ins_company_id
WHERE distribution_date >= TRUNC(SYSDATE)
AND icd.DISTRIBUTION_CODE = 2
ORDER by ic.INSURER_ID;

/* ���� ������� ��� ����

*/
/*
INSERT INTO ins_company_distribution
(
 ins_company_distribution_id
,principal_unq_id
,ins_company_id
,amount_policy_garant
,distribution_code
,DISTRIBUTION_DATE
)
VALUES
(seq_ins_comp_distr.nextval
,61
,359
,0
,2
,to_date('22.04.2019 16:07:53','dd.mm.yyyy hh24:mi:ss')
);
*/

SELECT
ic.INS_COMPANY "������������ ��",
icd.PRINCIPAL_UNQ_ID "����� �������������",
icd.AMOUNT_POLICY_GARANT "�����",
icd.DISTRIBUTION_CODE "������",
icd.DISTRIBUTION_DATE "���� �������������"
FROM RSA_EOSAGO.INS_COMPANY_DISTRIBUTION icd
JOIN RSA_EOSAGO.INS_COMPANY ic ON icd.INS_COMPANY_ID = ic.INS_COMPANY_ID
WHERE icd.INS_COMPANY_ID = 257 AND icd.DISTRIBUTION_CODE = 1 ORDER by icd.DISTRIBUTION_DATE;