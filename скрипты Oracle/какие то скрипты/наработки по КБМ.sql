SELECT * FROM RSA2.KBM_JOUR kj
  JOIN RSA2.KBM_JURIDICAL_PERSON_CALC kjpc ON kj.KBM_JURIDICAL_PERSON_CALC_ID = kjpc.KBM_JURIDICAL_PERSON_CALC_ID
  JOIN RSA2.KBM_ENTITY_STATUS kes ON kjpc.KBM_JURIDICAL_PERSON_CALC_ID = kes.KBM_JURIDICAL_PERSON_CALC_ID
  JOIN RSA2.SUBJECT_OSAGO so ON kj.MAIN_SUBJ_OSAGO_REC_ID = so.SUBJ_OSAGO_REC_ID
  LEFT JOIN RSA2.KBM_CHANGE_STATUS_DATA kcsd ON kj.KBM_JOUR_ID = kcsd.KBM_JOUR_ID
  WHERE INN = '5049016628' ORDER BY kcsd.CREATE_DATE;
  --WHERE kj.INS_REQ_ID = '7138010488';

SELECT * FROM RSA1.SUBJECT_OSAGO so WHERE so.SUBJ_OSAGO_REC_ID = '292538600';

SELECT * FROM RSA2.TEMP_AUTO_CALC_KBM_2019 tack WHERE tack.INN = '5049016628';

SELECT * FROM RSA2.TEMP_AUTO_CALC_KBM_2019 tack WHERE tack.KBM_JURIDICAL_PERSON_CALC_ID = '1274303';


WITH
LAST_STATUS AS (
SELECT
*
FROM RSA2.KBM_ENTITY_STATUS kes WHERE kes.KBM_ENTITY_STATUS_ID IN (
SELECT MAX(KBM_ENTITY_STATUS_ID) AS KBM_ENTITY_STATUS_ID
FROM RSA2.KBM_ENTITY_STATUS
WHERE KBM_JURIDICAL_PERSON_CALC_ID IN (
SELECT DISTINCT kes.KBM_JURIDICAL_PERSON_CALC_ID FROM RSA2.KBM_JOUR kj
JOIN RSA2.KBM_JURIDICAL_PERSON_CALC kjpc ON kj.KBM_JURIDICAL_PERSON_CALC_ID = kjpc.KBM_JURIDICAL_PERSON_CALC_ID
JOIN RSA2.KBM_ENTITY_STATUS kes ON kjpc.KBM_JURIDICAL_PERSON_CALC_ID = kes.KBM_JURIDICAL_PERSON_CALC_ID
JOIN RSA2.SUBJECT_OSAGO so ON kj.MAIN_SUBJ_OSAGO_REC_ID = so.SUBJ_OSAGO_REC_ID
LEFT JOIN RSA2.KBM_CHANGE_STATUS_DATA kcsd ON kj.KBM_JOUR_ID = kcsd.KBM_JOUR_ID
WHERE INN = '5049016628'
GROUP BY kes.KBM_JURIDICAL_PERSON_CALC_ID
    )
  )
)
SELECT
KES.KBM_ENTITY_STATUS_ID,
KES.STATUS,
KES.KBM_CHANGE_STATUS_DATA_ID,
KES.KBM_JURIDICAL_PERSON_CALC_ID,
KES.KBM_PHYSICAL_PERSON_CALC_ID,
KJPC.KBM_PERIOD_ID,
KJPC.ARITHMETIC_MEAN_KBM,
KCSD.POLICY_REC_ID,
KCSD.LOSS_ID,
KCSD.LOSS_DECISION_ID,
KCSD.KBM_PLUS_ID,
KCSD.KBM_JOUR_ID,
KCSD.IS_DECOUPLE_SUBJECT,
KCSD.POLICY_KASKO_REC_ID
FROM RSA2.KBM_ENTITY_STATUS KES
JOIN LAST_STATUS LS ON LS.KBM_ENTITY_STATUS_ID = KES.KBM_ENTITY_STATUS_ID
JOIN RSA2.KBM_JURIDICAL_PERSON_CALC KJPC ON KJPC.KBM_JURIDICAL_PERSON_CALC_ID = KES.KBM_JURIDICAL_PERSON_CALC_ID
LEFT JOIN RSA2.KBM_CHANGE_STATUS_DATA KCSD ON KCSD.KBM_CHANGE_STATUS_DATA_ID = KES.KBM_CHANGE_STATUS_DATA_ID
;

SELECT * FROM RSA1.INS_REQUEST_JUR irj WHERE irj.INS_REQ_ID IN (
  7138010488,7108363145,7108120105
)