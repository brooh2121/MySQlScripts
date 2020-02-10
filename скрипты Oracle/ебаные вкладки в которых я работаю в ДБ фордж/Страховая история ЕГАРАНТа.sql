WITH egarant_policy AS (
SELECT
  dp.INS_COMPANY_ID,
  dp.APPLICATION_ID,
  dp.DRAFT_POLICY_ID,
  dp.VEHICLE_NON_IDENTIFYING_REC_ID,
  dp.USE_TC_ID,
  dp.POLICY_SERIAL,
  dp.POLICY_NUMBER,
  dp.INS_COMP_DRAFT_POLICY_ID,
  dp.POLICY_CREATE_DATE,
  dp.POLICY_BEG_DATE,
  dp.POLICY_END_DATE,
  dp.BEG_PERIOD_1,
  dp.END_PERIOD_1,
  dp.BEG_PERIOD_2,
  dp.END_PERIOD_2,
  dp.BEG_PERIOD_3,
  dp.END_PERIOD_3,
  dp.IS_TRANS_CAR,
  --dp.KBM_CALC,
  dp.TRAILER_KPR,
  dp.END_DATE
  FROM RSA_EGARANT.DRAFT_POLICY dp
  WHERE dp.DRAFT_POLICY_ID IN (
  SELECT DISTINCT psi.DRAFT_POLICY_ID 
  FROM RSA_EGARANT.PERSONAL_INFO pi 
  JOIN RSA_EGARANT.SUBJECT_OSAGO so ON pi.PERSONAL_INFO_ID = so.PERSONAL_INFO_ID
  JOIN RSA_EGARANT.POLICY_SUBJ_INFO psi ON so.SUBJ_OSAGO_REC_ID = psi.SUBJ_OSAGO_REC_ID
  WHERE dp.APPLICATION_ID = '2735076436'
  --WHERE LOWER(pi.LAST_NAME) = LOWER(TRIM('�����'))
  --AND LOWER(pi.FIRST_NAME) = LOWER(TRIM('��������'))
  --AND LOWER(pi.MIDDLE_NAMES) = LOWER(trim('�������������'))
  --AND pi.BIRTH_DATE = TO_DATE ('04.05.1961','dd.mm.yyyy')
  AND psi.END_DATE = TO_DATE('01.01.9000 00:00:00','dd.mm.yyyy hh24:mi:ss')
  AND so.END_DATE = TO_DATE('01.01.9000 00:00:00','dd.mm.yyyy hh24:mi:ss')
  )
  AND dp.END_DATE = TO_DATE('01.01.9000 00:00:00','dd.mm.yyyy hh24:mi:ss')
),
oplata AS (
SELECT
  cip.DRAFT_POLICY_ID,
  cip.TB,
  cip.KT,
  cip.KBM,
  cip.KVS,
  cip.KS,
  cip.KP,
  cip.KM,
  cip.KPR,
  cip.KN,
  cip.PREMIUM
  FROM egarant_policy ep 
  JOIN RSA_EGARANT.CALCULATED_INS_PREMIUM cip ON ep.DRAFT_POLICY_ID = cip.DRAFT_POLICY_ID
  LEFT JOIN rsa_egarant.PAYMENT_JOUR pj ON cip.CALCULATED_INS_PREMIUM_ID = pj.CALCULATED_INS_PREMIUM_ID
  LEFT JOIN RSA_EGARANT.PAID_INS_PREMIUM pip ON cip.CALCULATED_INS_PREMIUM_ID = pip.CALC_INS_PREMIUM_ID
  JOIN RSA_EGARANT.INS_PREM_CALC_FORMULA ipcf ON cip.INS_PREM_CALC_FORMULA_ID = ipcf.INS_PREM_CALC_FORMULA_ID
),
TS AS (
SELECT
  ep.VEHICLE_NON_IDENTIFYING_REC_ID,
  vni.VEH_CATEGORY,
  nm.NAME,
  nb.BRAND_NAME,
  vni.OTHER_MODEL_NAME,
  vni.OTHER_BRAND_NAME,
  v.VIN_ORIGIN,
  v.BODY_NUMBER_ORIGIN,
 v.LICENSE_PLATE_ORIGIN,
  v.CHASSIS_NUMBER_ORIGIN,
  vni.YEAR_ISSUE,
  vni.ENGINE_POWER,
  vni.MAX_WEIGHT,
  vni.CNT_PAS_PLACE,
  vni.VEH_DOC_SERIAL_ORIGIN,
  vni.VEH_DOC_NUMBER_ORIGIN,
  vni.VEH_DOC_DATE,
  vni.TO_DIAG_CARD_NUMBER,
  vni.TO_DIAG_CARD_DATE,
  nut.USE_TC
  FROM egarant_policy ep
  JOIN RSA_EGARANT.VEHICLE_NON_IDENTIFYING vni ON ep.VEHICLE_NON_IDENTIFYING_REC_ID = vni.VEHICLE_NON_IDENTIFYING_REC_ID
  join RSA_EGARANT.VEHICLE v ON vni.VEHICLE_REC_ID = v.VEHICLE_REC_ID
  JOIN RSA_EGARANT.NSI_DIRECTORY_MOD_MODEL ndmm ON vni.MARK_MODEL_ID = ndmm.MOD_MODEL_ID
  JOIN RSA_EGARANT.NSI_MODEL nm ON ndmm.MODEL_ID = nm.MODEL_ID
  JOIN RSA_EGARANT.NSI_BRAND nb ON nm.BRAND_ID = nb.BRAND_ID
  JOIN (
  SELECT 
  MAX(v.BEG_DATE) bd,
  v.VEHICLE_REC_ID
  FROM RSA_EGARANT.VEHICLE v
  GROUP BY v.VEHICLE_REC_ID
  ) MAXVEH ON vni.VEHICLE_REC_ID = MAXVEH.VEHICLE_REC_ID
  JOIN RSA_EGARANT.NSI_DIRECTORY_MOD_MODEL ndmm ON vni.MARK_MODEL_ID = ndmm.MOD_MODEL_ID
  JOIN RSA_EGARANT.NSI_MODEL nm ON ndmm.MODEL_ID = nm.MODEL_ID
  JOIN RSA_EGARANT.NSI_BRAND nb ON nm.BRAND_ID = nb.BRAND_ID
  join RSA_EGARANT.NSI_USE_TC nut ON ep.USE_TC_ID = nut.USE_TC_ID
  where vni.END_DATE = TO_DATE('01.01.9000 00:00:00','dd.mm.yyyy hh24:mi:ss')
  AND v.BEG_DATE = MAXVEH.bd
),
strahovatel AS (
SELECT 
  psi.DRAFT_POLICY_ID,
  pi.FIRST_NAME,
pi.MIDDLE_NAMES,
  pi.LAST_NAME,
  pi.BIRTH_DATE,
  pi."HASH",
  psi.ADDRESS,
  psi.MOBILE_NUMBER,
  sd.DOC_SERIAL_ORIGIN,
  sd.DOC_NUMBER_ORIGIN
  FROM RSA_EGARANT.PERSONAL_INFO pi 
  JOIN RSA_EGARANT.SUBJECT_OSAGO so ON pi.PERSONAL_INFO_ID = so.PERSONAL_INFO_ID
  LEFT JOIN RSA_EGARANT.SUBJ_DOC sd ON so.DOC_REC_ID = sd.DOC_REC_ID
  LEFT JOIN RSA_EGARANT.DOC_TYPE dt ON sd.DOC_TYPE_ID = dt.DOC_TYPE_ID
  JOIN RSA_EGARANT.POLICY_SUBJ_INFO psi ON so.SUBJ_OSAGO_REC_ID = psi.SUBJ_OSAGO_REC_ID
  JOIN egarant_policy ep ON psi.DRAFT_POLICY_ID = ep.DRAFT_POLICY_ID
  WHERE psi.IS_POLICY_OWNER = 1
  AND psi.END_DATE = TO_DATE('01.01.9000 00:00:00','dd.mm.yyyy hh24:mi:ss')
  AND so.END_DATE = TO_DATE('01.01.9000 00:00:00','dd.mm.yyyy hh24:mi:ss')
),
sobstvenik AS (
SELECT 
  psi.DRAFT_POLICY_ID,
  pi.FIRST_NAME,
  pi.MIDDLE_NAMES,
  pi.LAST_NAME,
  pi.BIRTH_DATE,
  pi."HASH",
  psi.ORG_NAME_ORIGIN,
  so.INN,
  dt.DOC_TYPE,
  sd.DOC_SERIAL_ORIGIN,
  sd.DOC_NUMBER_ORIGIN,
  psi.ADDRESS
  FROM RSA_EGARANT.PERSONAL_INFO pi 
  JOIN RSA_EGARANT.SUBJECT_OSAGO so ON pi.PERSONAL_INFO_ID = so.PERSONAL_INFO_ID
  LEFT JOIN RSA_EGARANT.SUBJ_DOC sd ON so.DOC_REC_ID = sd.DOC_REC_ID
  LEFT JOIN RSA_EGARANT.DOC_TYPE dt ON sd.DOC_TYPE_ID = dt.DOC_TYPE_ID
  JOIN RSA_EGARANT.POLICY_SUBJ_INFO psi ON so.SUBJ_OSAGO_REC_ID = psi.SUBJ_OSAGO_REC_ID
  JOIN egarant_policy ep ON psi.DRAFT_POLICY_ID = ep.DRAFT_POLICY_ID
  WHERE psi.IS_CAR_OWNER = 1
  AND psi.END_DATE = TO_DATE('01.01.9000 00:00:00','dd.mm.yyyy hh24:mi:ss')
  AND so.END_DATE = TO_DATE('01.01.9000 00:00:00','dd.mm.yyyy hh24:mi:ss')
),
voditel AS (
SELECT 
  psi.DRAFT_POLICY_ID,
  pi.FIRST_NAME,
  pi.MIDDLE_NAMES,
  pi.LAST_NAME,
  pi.BIRTH_DATE,
  pi."HASH",
  psi.ADDRESS,
  sd.DOC_SERIAL_ORIGIN,
  sd.DOC_NUMBER_ORIGIN,
  psi.PHY_EXPERIENCE,
  psi.DRV_FRST_DATE
  FROM RSA_EGARANT.PERSONAL_INFO pi 
  JOIN RSA_EGARANT.SUBJECT_OSAGO so ON pi.PERSONAL_INFO_ID = so.PERSONAL_INFO_ID
  LEFT JOIN RSA_EGARANT.SUBJ_DOC sd ON so.DOC_REC_ID = sd.DOC_REC_ID
  LEFT JOIN RSA_EGARANT.DOC_TYPE dt ON sd.DOC_TYPE_ID = dt.DOC_TYPE_ID
  JOIN RSA_EGARANT.POLICY_SUBJ_INFO psi ON so.SUBJ_OSAGO_REC_ID = psi.SUBJ_OSAGO_REC_ID
  JOIN egarant_policy ep ON psi.DRAFT_POLICY_ID = ep.DRAFT_POLICY_ID
  WHERE psi.IS_DRIVER = 1
  AND psi.END_DATE = TO_DATE('01.01.9000 00:00:00','dd.mm.yyyy hh24:mi:ss')
  AND so.END_DATE = TO_DATE('01.01.9000 00:00:00','dd.mm.yyyy hh24:mi:ss')  
)



SELECT DISTINCT
ic.INS_COMPANY_ID,
ic.INS_COMPANY,
ep.POLICY_SERIAL "����� ������",
ep.POLICY_NUMBER "����� ������",
ep.INS_COMP_DRAFT_POLICY_ID,
ep.POLICY_CREATE_DATE "���� ���������� ������",
ep.POLICY_BEG_DATE "���� ������ ��������",
ep.POLICY_END_DATE "���� ��������� ��������",
ep.BEG_PERIOD_1 "���� ������ ������� 1",
ep.END_PERIOD_1 "���� ��������� ������� 1",
ep.BEG_PERIOD_2 "���� ������ ������� 2",
ep.END_PERIOD_2 "���� ��������� ������� 2",
ep.BEG_PERIOD_3 "���� ������ ������� 3",
ep.END_PERIOD_3 "���� ��������� ������� 3",
ep.IS_TRANS_CAR "������� ����������� ��",
--ep.KBM_CALC "����� ���",
ep.TRAILER_KPR "������� ���������� � ��������",
ep.END_DATE,
o.TB,
o.KT,
o.KBM,
o.KVS,
o.KS,
o.KP,
o.KM,
o.KPR,
o.KN,
o.PREMIUM "������ �� ��������",
t.VEH_CATEGORY "��������� ��",
t.NAME "������������ ������",
t.BRAND_NAME "������������ �����",
t.OTHER_MODEL_NAME "������ ������",
t.OTHER_BRAND_NAME "������ �����",
t.VIN_ORIGIN "VIN",
t.BODY_NUMBER_ORIGIN "����� ������",
t.LICENSE_PLATE_ORIGIN "���. �����",
t.CHASSIS_NUMBER_ORIGIN "����� �����",
t.YEAR_ISSUE "��� �������",
t.ENGINE_POWER "��������",
t.MAX_WEIGHT "����.���������� ���",
t.CNT_PAS_PLACE "���-�� ����.����",
t.VEH_DOC_SERIAL_ORIGIN "����� ��������� ��",
t.VEH_DOC_NUMBER_ORIGIN "����� ��������� ��",
t.VEH_DOC_DATE "���� ��������� ��",
t.TO_DIAG_CARD_NUMBER "����� ��������������� �����",
t.TO_DIAG_CARD_DATE "���� ��������������� �����",
t.USE_TC "������� ������������� ��",
s.FIRST_NAME "��� ������������",
s.MIDDLE_NAMES "�������� ������������",
s.LAST_NAME "������� ������������",
s.BIRTH_DATE "���� �������� ������������",
s."HASH" "��� ������������",
s.ADDRESS "����� ������������",
s.MOBILE_NUMBER "���. ����� ������������",
s.DOC_SERIAL_ORIGIN "����� ��������� ������������",
s.DOC_NUMBER_ORIGIN "����� ��������� ������������",
s1.FIRST_NAME "��� ������������",
s1.MIDDLE_NAMES "�������� ������������",
s1.LAST_NAME "������� ������������",
s1.BIRTH_DATE "���� �������� ������������",
s1."HASH" "��� ������������",
s1.ORG_NAME_ORIGIN "������������ ��.����",
s1.INN "���",
s1.DOC_TYPE "��� ��������� ������������",
s1.DOC_SERIAL_ORIGIN "����� ��������� ������������",
s1.DOC_NUMBER_ORIGIN "����� ��������� ������������",
s1.ADDRESS "����� ������������",
v.FIRST_NAME "��� ��������",
v.MIDDLE_NAMES "�������� ��������",
v.LAST_NAME "������� ��������",
v.BIRTH_DATE "���� �������� ��������",
v."HASH" "��� ��������",
v.ADDRESS "����� ��������",
v.DOC_SERIAL_ORIGIN "����� �/�",
v.DOC_NUMBER_ORIGIN "����� �/�",
v.PHY_EXPERIENCE "����",
v.DRV_FRST_DATE "���� ������ �������������"
  FROM egarant_policy ep
  JOIN RSA_EGARANT.INS_COMPANY ic ON ep.INS_COMPANY_ID = ic.INS_COMPANY_ID
  LEFT JOIN oplata o ON ep.DRAFT_POLICY_ID = o.DRAFT_POLICY_ID
  LEFT JOIN TS t ON ep.VEHICLE_NON_IDENTIFYING_REC_ID = t.VEHICLE_NON_IDENTIFYING_REC_ID
  LEFT JOIN strahovatel s ON ep.DRAFT_POLICY_ID = s.DRAFT_POLICY_ID
  LEFT JOIN sobstvenik s1 ON ep.DRAFT_POLICY_ID = s1.DRAFT_POLICY_ID
  LEFT JOIN voditel v ON ep.DRAFT_POLICY_ID = v.DRAFT_POLICY_ID
ORDER by ep.END_DATE;


SELECT DISTINCT VERSION FROM RSA_EGARANT.nsi_kt;