SELECT
po.INS_COMP_POLICY_ID,
po.POLICY_AGGR_ID,
ppj.HANDLE_TYPE_ID,
po.BSO_FULL_NUM,
po.BSO_FULL_NUM_ORIGIN,
po.policy_create_date,
po.POLICY_BEG_DATE,
po.POLICY_END_DATE,
po.AGR_CREATE_DATE,
po.AGR_BEG_DATE,
terpol.POLICY_TERMIN_DATE"TERMINATION_DATE",
po.DATE_REVISION "DATE_REVISION",
polrec.TRIP_DATE "Recall_Date",
agrrec.TRIP_DATE "RecallAddAgr_Date",
po.PREMIUM,
NVL (ppe.error_id,0)"ERROR_ID",
NVL (ppe.MESSAGE,0) MESSAGE,
ppj.HAS_VALIDATION_ERROR,
ppj.IS_ALLOW_KBM,
ppj.REQ_STATUS_ID,
tij.TRIP_DATE,
ppj.proc_beg_date,
ppj.PROC_END_DATE,
SYSDATE "EXP_DATE"
FROM RSA1.POLICY_OSAGO po
JOIN RSA1.INS_COMPANY ic ON po.INS_COMPANY_ID = ic.INS_COMPANY_ID
JOIN RSA1.POLICY_PROCESS_JUR ppj ON po.POLICY_REC_ID = ppj.POLICY_REC_ID
LEFT JOIN RSA1.POLICY_PROCESS_ERR ppe ON ppj.POLICY_PROC_ID = ppe.POLICY_PROC_ID
JOIN RSA1.TRIP_IMP_JUR tij ON ppj.TRIP_ID = tij.TRIP_ID
--JOIN (
--SELECT po.bso_number,po.DATE_REVISION AS date_revision, po.ins_company_id,po.ins_comp_policy_id
--FROM RSA1.POLICY_OSAGO po
--where po.ins_company_id = '243'
--)revis ON po.INS_COMP_POLICY_ID = revis.INS_COMP_POLICY_ID
LEFT join (
SELECT po.bso_number as bso_number, po.POLICY_TERMIN_DATE as policy_termin_date,po.ins_company_id as ins_company_id,po.ins_comp_policy_id as ins_comp_policy_id
FROM RSA1.POLICY_OSAGO po
where po.ins_company_id = '358' AND po.INS_COMP_POLICY_ID LIKE '%-U'
and po.policy_termin_date IS NOT null
)terpol on po.ins_comp_policy_id = terpol.ins_comp_policy_id
LEFT join (
SELECT po.BSO_NUMBER as bso_number, tij.TRIP_DATE AS trip_date,po.INS_COMPANY_ID as ins_company_id,po.ins_comp_policy_id as ins_comp_policy_id,po.POLICY_REC_ID
FROM RSA1.POLICY_OSAGO po
JOIN RSA1.POLICY_PROCESS_JUR ppj ON po.POLICY_REC_ID = ppj.POLICY_REC_ID
join rsa1.trip_imp_jur tij on ppj.trip_id = tij.trip_id
where ppj.handle_type_id = 3
and ppj.ins_company_id = '358' AND po.INS_COMP_POLICY_ID LIKE '%-U'
AND po.POLICY_AGGR_ID = '0') polrec
ON po.POLICY_REC_ID = polrec.POLICY_REC_ID
LEFT JOIN (
SELECT po.BSO_NUMBER as bso_number,tij.TRIP_DATE AS trip_date, po.INS_COMPANY_ID as ins_company_id, po.ins_comp_policy_id as ins_comp_policy_id,po.POLICY_REC_ID
FROM RSA1.POLICY_OSAGO po
JOIN RSA1.POLICY_PROCESS_JUR ppj ON po.POLICY_REC_ID = ppj.POLICY_REC_ID
join rsa1.trip_imp_jur tij on ppj.trip_id = tij.trip_id
where ppj.handle_type_id = 7
and ppj.ins_company_id = '358'
AND po.POLICY_AGGR_ID != '0') agrrec
ON po.POLICY_REC_ID = agrrec.POLICY_REC_ID
WHERE tij.TRIP_DATE between to_date ('27.03.2017 00:00:00','dd.mm.yyyy hh24:mi:ss') and to_date ('02.05.2017 23:59:59','dd.mm.yyyy hh24:mi:ss')
AND ppj.INS_COMPANY_ID = '358'
AND po.INS_COMP_POLICY_ID LIKE '%-U'
ORDER BY tij.TRIP_DATE ASC, po.BSO_NUMBER;


SELECT * FROM RSA1.POLICY_PROCESS_JUR ppj
JOIN RSA1.TRIP_IMP_JUR tij ON ppj.TRIP_ID = tij.TRIP_ID  
  WHERE ppj.INS_COMPANY_ID = '358' AND ppj.INS_COMP_POLICY_ID LIKE '%-U' AND ppj.PROC_QUEUE_DATE >= to_date ('27.03.2017 00:00:00','dd.mm.yyyy hh24:mi:ss');