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
ic.INSURER_ID,
icd.INS_COMPANY_ID,
icd.AMOUNT_POLICY_GARANT 
FROM RSA_EOSAGO.ins_company_distribution icd
JOIN RSA_EOSAGO.INS_COMPANY ic ON ic.INS_COMPANY_ID = icd.ins_company_id
WHERE distribution_date >= TRUNC(SYSDATE)
--AND ic.INS_COMPANY_ID = 210
AND icd.DISTRIBUTION_CODE = 1
ORDER by ic.INSURER_ID;


UPDATE RSA_EOSAGO.INS_COMPANY_DISTRIBUTION SET AMOUNT_POLICY_GARANT = 34 WHERE INS_COMPANY_ID = 18 AND DISTRIBUTION_CODE = 1 AND DISTRIBUTION_DATE >= TRUNC(sysdate);

SELECT * FROM RSA_EOSAGO.INS_COMPANY ic WHERE ic.INSURER_ID IN (
'20400000'
) ORDER BY ic.INSURER_ID;


/* ���� ������� ��� ����

262	�� "����������������"	00300000
206	��� "���"	00800000
20	���� "����������"	01400000
19	�� "����"	01900000
269	���� "����-��������"	02900000
10	��� �� "�����������"	03000000
244	��� "�������"	09300000
254	��� "����� �����������"	09400000
12	�� "������ ��������� �����������"	11000000
229	��� "�����������"	19500000
281	�� "�������� �����������"	19900000
352	��� "�� "������"	20600000
359	��� �� "�����"	21300000

*/

/*
 INSERT INTO ins_company_distribution
      (ins_company_distribution_id
      ,principal_unq_id
      ,ins_company_id
      ,amount_policy_garant
      ,distribution_code
      ,distribution_date)
    VALUES
      (seq_ins_comp_distr.nextval
      ,61
      ,359
      ,0
      ,1
      ,to_date('22.04.2019 16:07:53','dd.mm.yyyy hh24:mi:ss')
	  );
  */
