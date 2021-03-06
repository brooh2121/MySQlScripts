SELECT
dp.DRAFT_POLICY_ID,
dp.APPLICATION_ID,
dp.POLICY_NUMBER,
cl.CHECK_REQ_ID,
cl.IS_FOUND,
cl.IS_CHECKED,
cl.FAILED_TEST_FIELDS,
ct.TEXT,
cids.BRIEF,
cids.TEXT,
cidsl.create_date,
cidsl.CHANGE_DATE,
--cidsl.CHECK_SCAN_EVENT_LOG_ID,
--cidsl.CHECK_INS_DOC_STATUS_LOG_ID,
nrrs.TEXT,
--rrj.NSI_REASON_REJECTION_ID,
nrr.TEXT,
id.DOC_GUID
FROM RSA_EGARANT.CHECK_INS_DOC_STATUS_LOG cidsl 
JOIN RSA_EGARANT.CHECK_INS_DOC_STATUS cids ON cidsl.CHECK_INS_DOC_STATUS_ID = cids.CHECK_INS_DOC_STATUS_ID
JOIN RSA_EGARANT.DRAFT_POLICY dp ON cidsl.DRAFT_POLICY_ID = dp.DRAFT_POLICY_ID
JOIN RSA_EGARANT.CHECK_LOG cl ON cidsl.CHECK_LOG_ID = cl.CHECK_LOG_ID
JOIN RSA_EGARANT.CHECK_TYPE ct ON cl.CHECK_TYPE_ID = ct.CHECK_TYPE_ID
JOIN RSA_EGARANT.INSUREE_DOC id ON cidsl.CHECK_INS_DOC_STATUS_LOG_ID = id.CHECK_INS_DOC_STATUS_LOG_ID
JOIN RSA_EGARANT.NSI_REASON_REJECT_SUMMARY nrrs ON cidsl.NSI_REASON_REJECT_SUMMARY_ID = nrrs.NSI_REASON_REJECT_SUMMARY_ID
LEFT JOIN RSA_EGARANT.REASON_REJECTION_JOUR rrj ON cidsl.CHECK_INS_DOC_STATUS_LOG_ID = rrj.CHECK_INS_DOC_STATUS_LOG_ID
LEFT JOIN RSA_EGARANT.NSI_REASON_REJECTION nrr ON rrj.NSI_REASON_REJECTION_ID = nrr.NSI_REASON_REJECTION_ID
WHERE dp.APPLICATION_ID = '2195795436' AND dp.END_DATE = TO_DATE('01.01.9000 00:00:00','dd.mm.yyyy hh24:mi:ss')
--AND ct.TEXT LIKE '�������� ��(������������� ���������)' 
ORDER by cidsl.CREATE_DATE;

WITH APLICATION AS (
SELECT
dp.APPLICATION_ID
FROM RSA_EGARANT.DRAFT_POLICY dp
WHERE dp.INS_COMPANY_ID = 19
AND dp.END_DATE = TO_DATE('01.01.9000 00:00:00','dd.mm.yyyy hh24:mi:ss')
AND dp.BEG_DATE >= TO_DATE('02.04.2019','dd.mm.yyyy')
),
MAX_REJECTION AS (
SELECT
MAX(cidsl.CHECK_SCAN_EVENT_LOG_ID) MAXCSELI,
dp.APPLICATION_ID
FROM RSA_EGARANT.CHECK_LOG cl JOIN RSA_EGARANT.CHECK_INS_DOC_STATUS_LOG cidsl ON cl.CHECK_LOG_ID = cidsl.CHECK_LOG_ID
JOIN RSA_EGARANT.CHECK_INS_DOC_STATUS cids ON cidsl.CHECK_INS_DOC_STATUS_ID = cids.CHECK_INS_DOC_STATUS_ID
JOIN RSA_EGARANT.DRAFT_POLICY dp ON cidsl.DRAFT_POLICY_ID = dp.DRAFT_POLICY_ID
WHERE dp.END_DATE = TO_DATE('01.01.9000 00:00:00','dd.mm.yyyy hh24:mi:ss')
AND cids.BRIEF= 'REJECTED'
AND dp.APPLICATION_ID IN (
 SELECT APPLICATION_ID FROM APLICATION 
 )
  group BY
dp.APPLICATION_ID
),
MAX_SCAN_EVENT AS (
SELECT
MAX(cidsl.CHECK_SCAN_EVENT_LOG_ID) MAXCSELI,
dp.APPLICATION_ID
FROM RSA_EGARANT.CHECK_LOG cl JOIN RSA_EGARANT.CHECK_INS_DOC_STATUS_LOG cidsl ON cl.CHECK_LOG_ID = cidsl.CHECK_LOG_ID
JOIN RSA_EGARANT.CHECK_INS_DOC_STATUS cids ON cidsl.CHECK_INS_DOC_STATUS_ID = cids.CHECK_INS_DOC_STATUS_ID
JOIN RSA_EGARANT.DRAFT_POLICY dp ON cidsl.DRAFT_POLICY_ID = dp.DRAFT_POLICY_ID
WHERE dp.END_DATE = TO_DATE('01.01.9000 00:00:00','dd.mm.yyyy hh24:mi:ss')
--AND cids.BRIEF= 'REJECTED'
AND dp.APPLICATION_ID IN (
 SELECT APPLICATION_ID FROM APLICATION 
 )
  group BY
dp.APPLICATION_ID
)
SELECT
a.APPLICATION_ID,mj.MAXCSELI
FROM APLICATION a
JOIN MAX_REJECTION mj ON a.APPLICATION_ID = mj.APPLICATION_ID
JOIN MAX_SCAN_EVENT MSE ON mj.MAXCSELI = MSE.MAXCSELI ORDER by a.APPLICATION_ID;