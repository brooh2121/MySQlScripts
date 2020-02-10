SELECT * FROM RSA1.INS_COMPANY ic
LEFT JOIN RSA1."USER" u ON ic.INS_COMPANY_ID = u.INS_COMPANY_ID
--WHERE LOWER(ic.INS_COMPANY) LIKE '%�����%';
WHERE ic.INS_COMPANY_ID = '222';
--WHERE ic.INSURER_ID = '00400000';

SELECT * FROM RSA1.POLICY_OSAGO po WHERE po.BSO_NUMBER = '5025955430' AND po.RECALL_POLICY_UNQ_ID = 0 AND po.IS_TECH_COR = 0;
SELECT * FROM RSA1.POLICY_OSAGO po WHERE po.BSO_NUMBER = '0004829373' AND po.RECALL_POLICY_UNQ_ID = 0 AND po.IS_TECH_COR = 0;
SELECT * FROM RSA1.POLICY_OSAGO po WHERE po.INS_COMP_POLICY_ID = 'RSA_2243914258_15042019144323000' AND po.RECALL_POLICY_UNQ_ID = 0 AND po.IS_TECH_COR = 0;
select * from rsa1.policy_osago po where po.policy_aggr_id = '100976976';


SELECT * FROM RSA1.POLICY_OSAGO po WHERE po.POLICY_REC_ID = '559281';
SELECT * FROM RSA1.POLICY_PROCESS_JUR ppj WHERE ppj.INS_COMP_POLICY_ID = '-119417';

SELECT * FROM RSA1.POLICY_PROCESS_JUR ppj JOIN RSA1.TRIP_IMP_JUR tij ON ppj.TRIP_ID = tij.TRIP_ID
LEFT JOIN RSA1.POLICY_PROCESS_ERR ppe ON ppj.POLICY_PROC_ID = ppe.POLICY_PROC_ID
WHERE ppj.INS_COMP_POLICY_ID IN (SELECT po.INS_COMP_POLICY_ID FROM RSA1.POLICY_OSAGO po WHERE po.BSO_NUMBER = '3005018476') --AND ppj.INS_COMPANY_ID = '232'
--AND ppj.REQ_STATUS_ID = '3'
ORDER BY ppj.PROC_QUEUE_DATE;

SELECT * FROM RSA1.POLICY_PROCESS_JUR ppj JOIN  RSA1.TRIP_IMP_JUR tij ON ppj.TRIP_ID = tij.TRIP_ID
LEFT JOIN RSA1.POLICY_PROCESS_ERR ppe ON ppj.POLICY_PROC_ID = ppe.POLICY_PROC_ID
WHERE ppj.BSO_NUMBER = '3005018476' ORDER BY ppj.PROC_QUEUE_DATE;

SELECT DISTINCT po.INS_COMPANY_ID,po.BSO_NUMBER,psi.SYS_CORR_DATE FROM rsa1.SUBJECT_OSAGO so JOIN RSA1.SUBJ_DOC sd ON so.SUBJ_OSAGO_DOC_REC_ID = sd.DOC_REC_ID
JOIN RSA1.POLICY_SUBJ_INFO psi ON so.SUBJ_OSAGO_REC_ID = psi.SUBJ_OSAGO_REC_ID
JOIN RSA1.POLICY_OSAGO po ON psi.POLICY_REC_ID = po.POLICY_REC_ID
WHERE so.SUBJ_HASH ='8EF8E84FF449BFB8E3BAE2F8757C69AF17E33BD3C4EC73632114161B30DAFD92' AND sd.DOC_FULL_NUM = '6711157083' /*AND psi.IS_CAR_OWNER = 1*/ ORDER BY psi.SYS_CORR_DATE;

SELECT * FROM RSA1.REQUEST_STATUS rs ORDER BY rs.REQ_STATUS_ID;

SELECT * FROM RSA1.TRIP_IMP_JUR tij WHERE tij.TRIP_NUM = '361815872';

SELECT * 
from rsa1.bso_status_type bst
join rsa1.bso_state bs on bs.bso_status_type_id = bst.bso_status_type_id
left join rsa1.bso b on bs.bso_id = b.BSO_ID
WHERE b.BSO_NUMBER = '3005018476' /*AND bs.RECALL_BSO_STATE_ID = 0*/;

SELECT * FROM rsa1.BSO b WHERE b.BSO_NUMBER = '3005018476';

SELECT 
*
FROM RSA1.POLICY_PROCESS_JUR ppj JOIN RSA1.TRIP_IMP_JUR tij ON ppj.TRIP_ID = tij.TRIP_ID
LEFT JOIN RSA1.POLICY_PROCESS_ERR ppe ON ppj.POLICY_PROC_ID = ppe.POLICY_PROC_ID
WHERE  tij.TRIP_NUM = '506052964103'
--WHERE ppj.INS_COMP_POLICY_ID = '1221773381'
--AND ppj.BSO_NUMBER = '1014459323'
ORDER BY ppj.PROC_QUEUE_DATE
;

SELECT * FROM ( SELECT irj.INS_REQ_ID,irj.BEG_DATE,irj.END_DATE FROM RSA1.INS_REQUEST_JUR irj WHERE /*irj.INS_COMPANY_ID = '197' and*/ irj.REQ_TYPE_ID = '14' ORDER BY irj.INS_REQ_ID DESC) 
WHERE beg_date  BETWEEN TO_DATE ('28.11.2017 00:00:00','dd.mm.yyyy hh24:mi:ss') AND TO_DATE('28.11.2017 23:00:00','dd.mm.yyyy hh24:mi:ss')
and 
ROWNUM < 1000 
ORDER by END_DATE DESC;
SELECT COUNT (*) FROM RSA1.QUEUE_2 q;

SELECT * FROM RSA1.SUBJECT_OSAGO so JOIN RSA1.SUBJ_DOC sd ON so.SUBJ_OSAGO_DOC_REC_ID = sd.DOC_REC_ID
JOIN RSA1.POLICY_SUBJ_INFO psi ON so.SUBJ_OSAGO_REC_ID = psi.SUBJ_OSAGO_REC_ID
WHERE so.SUBJ_HASH = 'FCF36B60889D0783A1F0FA346A9DCAB8671CB5023EE52244CD406F505F44CCB8' AND sd.DOC_FULL_NUM = '6609502870'
AND psi.ADDRESS_KLADR = '0' ORDER BY psi.SYS_CORR_DATE;



SELECT * FROM RSA1.POLICY_OSAGO po JOIN RSA1.VEHICLE_NON_IDENTIFYING vni ON po.VEHICLE_NON_IDENTIFYING_REC_ID = vni.VEHICLE_NON_IDENTIFYING_REC_ID
JOIN RSA1.VEHICLE v ON vni.VEHICLE_REC_ID = v.VEHICLE_REC_ID
WHERE po.BSO_NUMBER = '0378098758';

SELECT * FROM RSA1.INS_REQUEST_JUR irj WHERE irj.INS_REQ_ID = '1011251796';

SELECT * FROM RSA1.REQUEST_TYPE rt ORDER by rt.REQ_TYPE_ID;

SELECT * FROM RSA1.TRIP_IMP_JUR tij WHERE tij.TRIP_NUM ='20170317162733_000000000004891';

SELECT * FROM RSA1.VEHICLE v WHERE v.VEHICLE_REC_ID = '168442779';

SELECT DISTINCT
ic.INS_COMPANY "������������ ��",
b.BSO_SERIES "����� ���",
b.bso_number "����� ���",
bst.BSO_NAME "������������ ��������� ���",
bst.BSO_STATUS "C����� ���",
bs.CHANGE_DATE "���� ���. ������� ���"
FROM rsa1.bso_status_type bst
JOIN rsa1.bso_state bs ON bs.bso_status_type_id = bst.bso_status_type_id
JOIN rsa1.bso b ON bs.bso_id = b.BSO_ID
JOIN RSA1.INS_COMPANY ic ON b.INS_COMPANY_ID = ic.INS_COMPANY_ID
JOIN
(
SELECT 
BSO_NUMBER,
MAX(CHANGE_DATE)AS change_date FROM (SELECT
b.BSO_NUMBER,
bs.CHANGE_DATE
FROM rsa1.bso_status_type bst
JOIN rsa1.bso_state bs ON bs.bso_status_type_id = bst.bso_status_type_id
JOIN rsa1.bso b ON bs.bso_id = b.BSO_ID
WHERE b.INS_COMPANY_ID = '248' -- �� ��
AND bs.RECALL_BSO_STATE_ID = '0'
)
GROUP BY
BSO_NUMBER
) maxchange ON bs.change_date = maxchange.change_date
AND  b.INS_COMPANY_ID = '248' -- �� ��
AND bs.RECALL_BSO_STATE_ID = '0'
AND b.BSO_NUMBER = maxchange.BSO_NUMBER
--WHERE bs.CHANGE_DATE BETWEEN TO_DATE ('01.10.2015 00:00:00','dd.mm.yyyy hh24:mi:ss') AND TO_DATE('31.12.2015 23:59:59','dd.mm.yyyy hh24:mi:ss')
--AND bst.BSO_STATUS ('001','002')
and b.BSO_NUMBER IN 
(
'1007585689',
'1007583966',
'1007583224',
'1007586948',
'1007586533',
'1007583852',
'1007582375',
'1007583358',
'1007586437',
'1007585618',
'1007585598',
'1007584227',
'1007583223',
'1007585599',
'1007584986',
'1007584020',
'1007583735',
'1007583965',
'1007583232',
'1007586129',
'1007582186',
'1007586438',
'1007586851',
'1007585690',
'1007586128',
'1007584158',
'1007585691',
'1007583208',
'1007584520',
'1007586082',
'1007583502',
'1007585545',
'1007583931',
'1007583063',
'1007586834',
'1007583615',
'1007583617',
'1007586712',
'1007586398',
'1007585887',
'1007584354',
'1007585774',
'1007583907',
'1007586244',
'1007586878',
'1007584358',
'1007584357',
'1007586293',
'1007584356',
'1007584355',
'1007583616',
'1007585846',
'1007585844',
'1007583638',
'1007585897',
'1007584519',
'1007583076',
'1007586099',
'1007583231',
'1007586243',
'1007583207',
'1007583248',
'1007583249',
'1007583522',
'1007584607',
'1007584353',
'1007583614',
'1007584965',
'1007583682',
'1007583622',
'1007583777',
'1007583918',
'1007583919',
'1007583887',
'1007586751',
'1007586711',
'1007585773',
'1007583296',
'1007583357',
'1007585831',
'1007586466',
'1007583295',
'1007586222',
'1007585860',
'1007583294',
'1007582355',
'1007582011',
'1007584845',
'1007582152',
'1007584617',
'1007583898',
'1007583356',
'1007582012',
'1007583976',
'1007582607',
'1007584844',
'1007584344',
'1007583899',
'1007583293',
'1007582406'  
)
ORDER BY b.BSO_NUMBER,bs.CHANGE_DATE;

SELECT * FROM RSA1.BSO_STATUS_TYPE bst;

SELECT
ic.INS_COMPANY "������������ ��",
COUNT (DISTINCT b.BSO_NUMBER) "����� ���-�� ������� ���",
bst.BSO_NAME "������������ ��������� ���",
bst.BSO_STATUS "C����� ���"
FROM rsa1.bso_status_type bst
JOIN rsa1.bso_state bs ON bs.bso_status_type_id = bst.bso_status_type_id
JOIN rsa1.bso b ON bs.bso_id = b.BSO_ID
JOIN RSA1.INS_COMPANY ic ON b.INS_COMPANY_ID = ic.INS_COMPANY_ID
JOIN
(
SELECT 
BSO_NUMBER,
MAX(CHANGE_DATE)AS change_date FROM (SELECT
b.BSO_NUMBER,
bs.CHANGE_DATE
FROM rsa1.bso_status_type bst
JOIN rsa1.bso_state bs ON bs.bso_status_type_id = bst.bso_status_type_id
JOIN rsa1.bso b ON bs.bso_id = b.BSO_ID
WHERE b.INS_COMPANY_ID = '208' -- �� ��
AND bs.RECALL_BSO_STATE_ID = '0'
)
GROUP BY
BSO_NUMBER
) maxchange ON bs.change_date = maxchange.change_date
AND  b.INS_COMPANY_ID = '208' -- �� ��
AND bs.RECALL_BSO_STATE_ID = '0'
AND b.BSO_NUMBER = maxchange.BSO_NUMBER
--WHERE bs.CHANGE_DATE BETWEEN TO_DATE ('01.10.2015 00:00:00','dd.mm.yyyy hh24:mi:ss') AND TO_DATE('31.12.2015 23:59:59','dd.mm.yyyy hh24:mi:ss')
AND bst.BSO_STATUS IN ('001','002')
GROUP BY 
ic.INS_COMPANY,
bst.BSO_NAME,
bst.BSO_STATUS;

SELECT * --DISTINCT nvc.NAME_SHORT 
from rsa1.NSI_VEHICLE_CATEGORY nvc
JOIN RSA1.CATEGORIES_DRIVER_DOC cdd ON nvc.VEHICLE_CATEGORY_ID = cdd.CATEGORY_DRIVER_DOC JOIN RSA1.SUBJ_DOC sd ON cdd.DOC_REC_ID = sd.DOC_REC_ID
JOIN RSA1.NSI_DIRECTORY_MOD_MODEL ndmm ON nvc.VEHICLE_CATEGORY_ID = ndmm.VEHICLE_CATEGORY_ID
JOIN VEHICLE v ON ndmm.MOD_MODEL_ID = v.MARK_MODEL_ID
JOIN RSA1.MARK_MODEL mm ON v.MARK_MODEL_ID = mm.MARK_MODEL_ID
WHERE v.MARK_MODEL_ID = '819000002';

SELECT * FROM RSA1.INS_REQUEST_JUR irj WHERE irj.INS_REQ_ID = '1621658607';
SELECT * FROM RSA1.INS_REQUEST_JUR irj WHERE irj.INS_REQ_ID = '4124487868';

SELECT * FROM (SELECT * FROM  RSA1.TO_JUR tj ORDER BY tj.TO_JUR_ID DESC) WHERE ROWNUM < 1000 ORDER BY end_req;

SELECT COUNT(*) FROM RSA1.QUEUE_2 q;

SELECT * FROM RSA1.SUBJECT_OSAGO so WHERE so.INN = '3123081284';

SELECT * FROM RSA1.POLICY_PROCESS_JUR ppj WHERE ppj.HANDLE_TYPE_ID = '9' AND ROWNUM = 1 AND ppj.REQ_STATUS_ID = 3;

SELECT * FROM RSA1.POLICY_PROCESS_JUR ppj JOIN RSA1.TRIP_IMP_JUR tij ON ppj.TRIP_ID = tij.TRIP_ID
WHERE tij.TRIP_NUM = '0001144255' ORDER BY ppj.PROC_END_DATE;

SELECT * FROM RSA1.POLICY_PROCESS_JUR ppj
JOIN RSA1.TRIP_IMP_JUR tij ON ppj.TRIP_ID = tij.TRIP_ID
WHERE ppj.HANDLE_TYPE_ID = '7' AND ppj.REQ_STATUS_ID = '3' AND ppj.PROC_QUEUE_DATE >= TO_DATE ('20.04.2017 00:00:00','dd.mm.yyyy hh24:mi:ss') ;


 select * from rsa1.HANDLE_TYPE ht ORDER BY ht.HANDLE_TYPE_ID;

SELECT * FROM RSA1.POLICY_OSAGO po
  WHERE  po.POLICY_CREATE_DATE >= TO_DATE ('29.04.2017 00:00:00','dd.mm.yyyy hh24:mi:ss');

SELECT COUNT(DISTINCT po.POLICY_REC_ID) FROM RSA1.POLICY_PROCESS_JUR ppj
JOIN RSA1.POLICY_OSAGO po ON ppj.POLICY_REC_ID = po.POLICY_REC_ID  
JOIN RSA1.TRIP_IMP_JUR tij ON ppj.TRIP_ID = tij.TRIP_ID
WHERE ppj.HANDLE_TYPE_ID in ('0')
AND ppj.PROC_QUEUE_DATE >= TO_DATE ('29.04.2017 00:00:00','dd.mm.yyyy hh24:mi:ss')
AND po.POLICY_CREATE_DATE >= TO_DATE ('29.04.2017 00:00:00','dd.mm.yyyy hh24:mi:ss')
AND po.IS_TECH_COR = 0 AND po.RECALL_POLICY_UNQ_ID = 0
AND po.RECALL_ADD_AGR_REC_ID = 0;

SELECT * FROM rsa1.KLADR WHERE CODE = '7700000200000';

SELECT 
coun,
rt.REQ_TYPE
FROM (
SELECT COUNT(*) coun,req_type_id FROM ( SELECT * FROM RSA1.INS_REQUEST_JUR irj /*WHERE irj.INS_COMPANY_ID = '217' and irj.REQ_TYPE_ID = '1'*/ ORDER BY irj.INS_REQ_ID DESC) 
WHERE beg_date  BETWEEN TO_DATE('02.06.2017 00:00:00','dd.mm.yyyy hh24:mi:ss') AND TO_DATE('02.06.2017 23:59:59','dd.mm.yyyy hh24:mi:ss')
--AND ins_company_id = '10'
group BY req_type_id
order BY req_type_id
)COUNT_request
JOIN RSA1.REQUEST_TYPE rt ON COUNT_request.req_type_id = rt.REQ_TYPE_ID
--JOIN RSA1.INS_COMPANY ic ON COUNT_request.ins_company_id = ic.INS_COMPANY_ID
;

SELECT 
coun,
rt.REQ_TYPE
FROM (
SELECT COUNT(*) coun,req_type_id FROM ( SELECT * FROM RSA1.INS_REQUEST_JUR irj /*WHERE irj.INS_COMPANY_ID = '217' and irj.REQ_TYPE_ID = '1'*/ ORDER BY irj.INS_REQ_ID DESC) 
WHERE beg_date  BETWEEN TO_DATE ('01.06.2017 00:00:00','dd.mm.yyyy hh24:mi:ss') AND TO_DATE('01.06.2017 23:59:59','dd.mm.yyyy hh24:mi:ss')
--AND ins_company_id = '10'
group BY req_type_id
order BY req_type_id
)COUNT_request
JOIN RSA1.REQUEST_TYPE rt ON COUNT_request.req_type_id = rt.REQ_TYPE_ID
;
SELECT 
coun,
rt.REQ_TYPE
FROM (
SELECT COUNT(*) coun,req_type_id FROM ( SELECT * FROM RSA1.INS_REQUEST_JUR irj /*WHERE irj.INS_COMPANY_ID = '217' and irj.REQ_TYPE_ID = '1'*/ ORDER BY irj.INS_REQ_ID DESC) 
WHERE beg_date  BETWEEN TO_DATE ('31.05.2017 00:00:00','dd.mm.yyyy hh24:mi:ss') AND TO_DATE('31.05.2017 23:59:59','dd.mm.yyyy hh24:mi:ss')
--AND ins_company_id = '10'
group BY req_type_id
order BY req_type_id
)COUNT_request
JOIN RSA1.REQUEST_TYPE rt ON COUNT_request.req_type_id = rt.REQ_TYPE_ID;


SELECT * FROM RSA1.REQUEST_STATUS rs WHERE rs.REQ_STATUS_ID = '5102';

SELECT * FROM RSA1.BSO_STATUS_TYPE bst ORDER by bst.BSO_STATUS_TYPE_ID;

SELECT * FROM RSA1.VEHICLE v WHERE v.VIN = 'OTCYTCTBYET';

SELECT * FROM RSA1.REQUEST_STATUS rs WHERE rs.REQ_STATUS_ID in ('401','422','420');

SELECT * FROM RSA1.NSI_COUNTRY_CAR ncc;

SELECT * FROM RSA1.INS_REQUEST_JUR irj WHERE irj.INS_REQ_ID = '4229179716';

SELECT * FROM RSA1.NSI_COUNTRY_CAR ncc;

SELECT * FROM RSA1.LOSS_PROCESS_JUR lpj JOIN RSA1.TRIP_IMP_JUR tij ON lpj.TRIP_ID = tij.TRIP_ID
  WHERE lpj.INS_COMP_LOSS_ID = '506052964103' ORDER by lpj.PROC_QUEUE_DATE;

SELECT
  
*
FROM RSA1.BSO b
JOIN RSA1.BSO_STATE bs ON b.BSO_ID = bs.BSO_ID
JOIN RSA1.BSO_STATUS_TYPE bst ON bs.BSO_STATUS_TYPE_ID = bst.BSO_STATUS_TYPE_ID
  WHERE b.BSO_NUMBER = '6000612848';


SELECT * FROM RSA1.NSI_COUNTRY_CAR ncc;

SELECT * FROM RSA1.INS_REQUEST_JUR irj WHERE irj.INS_REQ_ID = '2726366342';

SELECT * FROM RSA1.LOSS l WHERE l.INS_COMP_LOSS_ID = '550082174503';

SELECT * FROM rsa1.ALLOWABLE_SYMBOL as1;

SELECT * FROM RSA1.HANDLE_TYPE ht;

SELECT MIN(lpj.PROC_QUEUE_DATE) FROM RSA1.LOSS_PROCESS_JUR lpj WHERE lpj.HANDLE_TYPE_ID = 8;


SELECT MIN(lpj.PROC_QUEUE_DATE) FROM RSA1.LOSS_PROCESS_JUR lpj WHERE lpj.LOSS_DECISION_ID IS NOT NULL;

--04.08.2015 23:00:14
--8	AddDecision 	���������� ������� �� ���������� ������

SELECT * FROM RSA1.INS_REQUEST_JUR irj WHERE irj.REQ_TYPE_ID = 1 AND irj.BEG_DATE >= TRUNC(SYSDATE,'hh') AND irj.REQ_STATUS_ID !=3;

SELECT * FROM RSA1.INS_COMPANY ic WHERE ic.INS_COMPANY_ID = 197;

SELECT * FROM RSA1.INS_REQUEST_JUR irj WHERE irj.INS_COMPANY_ID = 197 AND irj.BEG_DATE >= TRUNC(sysdate);

SELECT COUNT(1) FROM RSA1.REQUEST_TYPE rt;

SELECT
*
FROM rsa1.request_type rt ORDER BY req_type_id;

SELECT 
*
FROM RSA1.INS_REQUEST_JUR irj WHERE irj.INS_REQ_ID = '7771805107';

SELECT * FROM rsa1.vehicle v WHERE vin = 'SALGA3FE5HA341327';