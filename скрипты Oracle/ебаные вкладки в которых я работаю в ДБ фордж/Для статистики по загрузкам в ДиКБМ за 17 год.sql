WITH IRJI AS (
SELECT
  TRUNC(irj.beg_date,'mm') mm,
  COUNT(1) c1,
  irj.REQ_TYPE_ID,
  irj.REQ_STATUS_ID
  FROM rsa1.INS_REQUEST_JUR irj 
  WHERE irj.BEG_DATE BETWEEN TO_TIMESTAMP('01032018','ddmmyyyy') AND TO_TIMESTAMP('02052018','ddmmyyyy')
  GROUP BY 
  TRUNC(irj.beg_date,'mm'),
  irj.REQ_TYPE_ID,
  irj.REQ_STATUS_ID
),
ALL_REQUEST AS (
SELECT
  mm,
  SUM(c1) sc1
  FROM IRJI
  GROUP BY mm
),
REQ_SUCCESS AS (
SELECT
  mm,
  SUM(c1) sc2
  FROM IRJI
  WHERE IRJI.REQ_STATUS_ID = 3
  GROUP BY mm
),
REQ_ERROR AS (
SELECT
  mm,
  SUM(c1) sc3
  FROM IRJI
  WHERE IRJI.REQ_STATUS_ID IN (
8,
200,
208,
416,
417,
602,
603,
607,
610,
611,
612,
613,
614,
617,
805,
850,
852,
1108,
1199,
5000,
5007,
5009,
5011,
5100,
5114,
5121,
5122
)
  GROUP BY mm
),
REQ_KBM as (
SELECT
  mm,
  SUM(c1) sc4
  FROM IRJI
  WHERE IRJI.REQ_TYPE_ID = 1
  GROUP BY mm
),
ALL_OSAGO AS (
SELECT
  TRUNC(po.POLICY_CREATE_DATE,'mm') mm,
  COUNT(po.policy_rec_id) cpri 
  FROM POLICY_OSAGO po
  WHERE po.RECALL_POLICY_UNQ_ID = 0
  AND po.IS_TECH_COR = 0
  AND po.POLICY_AGGR_ID = '0'
  AND po.POLICY_CREATE_DATE BETWEEN TO_TIMESTAMP('01032018', 'ddmmyyyy') AND TO_TIMESTAMP('02052018', 'ddmmyyyy')
  GROUP BY TRUNC(po.POLICY_CREATE_DATE,'mm')
),
ALL_AGGR AS (
SELECT
  TRUNC(po.AGR_CREATE_DATE,'mm') mm,
  COUNT(po.policy_rec_id) cpri1
  FROM POLICY_OSAGO po
  WHERE po.IS_TECH_COR = 0
  AND po.POLICY_AGGR_ID != '0'
  AND po.RECALL_ADD_AGR_REC_ID = 0
  AND po.AGR_CREATE_DATE BETWEEN TO_TIMESTAMP('01032018', 'ddmmyyyy') AND TO_TIMESTAMP('02052018', 'ddmmyyyy')
  group by TRUNC(po.AGR_CREATE_DATE,'mm')
),
RES AS (
SELECT
  ar.mm,
  ar.sc1,
  NVL(rs.sc2, '0') sc2,
  NVL(re.sc3,'0') sc3,
  NVL(rk.sc4,'0') sc4,
  NVL(ao.cpri,'0') cpri,
  NVL(aa.cpri1,'0') cpri1
  FROM ALL_REQUEST ar
  LEFT JOIN REQ_SUCCESS rs ON ar.mm = rs.mm
  LEFT JOIN REQ_ERROR re ON ar.mm = re.mm
  LEFT JOIN REQ_KBM rk ON ar.mm = rk.mm
  LEFT JOIN ALL_OSAGO ao ON ar.mm = ao.mm
  LEFT JOIN ALL_AGGR aa ON ar.mm = aa.mm
  WHERE ar.sc1 is not null
)SELECT
  mm "Месяц",
  sc1 "Всего запросов",
  sc2 "Успешно запросов",
  sc3 "Запросов с ошибками",
  sc4 "Запросов КБМ Всего",
  cpri "Заключено договоров в ДиКБМ",
  cpri1 "Заключено ДС в ДиКБМ"
 FROM RES ORDER BY mm;


--SELECT * from ALL_AGGR;
--SELECT * FROM REQ_SUCCESS;


--SELECT * FROM IRJI;

--2772793

