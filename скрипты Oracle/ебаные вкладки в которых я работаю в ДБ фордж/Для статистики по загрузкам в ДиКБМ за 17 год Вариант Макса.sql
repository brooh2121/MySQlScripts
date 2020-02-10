WITH ALL_REQ AS (SELECT TRUNC(irj.BEG_DATE, 'mm') dd,
                        COUNT(*) c1
      FROM INS_REQUEST_JUR irj
      WHERE irj.BEG_DATE BETWEEN TO_TIMESTAMP('01012017', 'ddmmyyyy') AND TO_TIMESTAMP('30062017', 'ddmmyyyy')
      GROUP BY TRUNC(irj.BEG_DATE, 'mm')),
  REQ_SUC AS (SELECT TRUNC(irj.BEG_DATE, 'mm') dd,
                     COUNT(irj.INS_REQ_ID) c2
      FROM INS_REQUEST_JUR irj
    JOIN REQUEST_STATUS rs1 ON irj.REQ_STATUS_ID = rs1.REQ_STATUS_ID
    JOIN REQUEST_TYPE rt ON irj.REQ_TYPE_ID = rt.REQ_TYPE_ID
      WHERE irj.BEG_DATE BETWEEN TO_TIMESTAMP('01012017', 'ddmmyyyy') AND TO_TIMESTAMP('30062017', 'ddmmyyyy')
        AND irj.REQ_STATUS_ID IN (3)
      GROUP BY TRUNC(irj.BEG_DATE, 'mm')),
  all_osago AS (SELECT trunc(po.POLICY_CREATE_DATE, 'mm') dd,
                        COUNT(po.POLICY_REC_ID) c5
      FROM POLICY_OSAGO po
      WHERE po.RECALL_POLICY_UNQ_ID = 0
        AND po.IS_TECH_COR = 0
        AND po.POLICY_AGGR_ID = '0'
        AND po.POLICY_CREATE_DATE BETWEEN TO_TIMESTAMP('01012017', 'ddmmyyyy') AND TO_TIMESTAMP('30062017', 'ddmmyyyy')
      GROUP BY trunc(po.POLICY_CREATE_DATE, 'mm')),
  all_agr AS (SELECT trunc(po.AGR_CREATE_DATE, 'mm') dd,
                     COUNT(po.POLICY_REC_ID) c6
      FROM POLICY_OSAGO po
      WHERE po.RECALL_POLICY_UNQ_ID = 0
        AND po.IS_TECH_COR = 0
        AND po.POLICY_AGGR_ID != '0'
        AND po.RECALL_ADD_AGR_REC_ID = 0
       AND po.AGR_CREATE_DATE BETWEEN TO_TIMESTAMP('01012017', 'ddmmyyyy') AND TO_TIMESTAMP('30062017', 'ddmmyyyy')
      GROUP BY trunc(po.AGR_CREATE_DATE, 'mm')),
  req_err AS
  (SELECT TRUNC(irj.BEG_DATE, 'mm') dd,
          COUNT(irj.INS_REQ_ID) c4
      FROM INS_REQUEST_JUR irj
      WHERE irj.BEG_DATE BETWEEN TO_TIMESTAMP('01012017', 'ddmmyyyy') AND TO_TIMESTAMP('30062017', 'ddmmyyyy')
        AND irj.REQ_STATUS_ID IN (
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
5122)
      GROUP BY TRUNC(irj.BEG_DATE, 'mm')),
  req_kbm AS 
  (SELECT TRUNC(irj.BEG_DATE, 'mm') dd,
          COUNT(irj.INS_REQ_ID) c7 FROM INS_REQUEST_JUR irj
           WHERE irj.BEG_DATE BETWEEN TO_TIMESTAMP('01012017', 'ddmmyyyy') AND TO_TIMESTAMP('30062017', 'ddmmyyyy')
           AND irj.REQ_TYPE_ID = 1
           GROUP BY TRUNC(irj.BEG_DATE, 'mm')),
  res AS (SELECT 
                 ar.dd dd,
                 ar.c1 all_r,
                 CASE WHEN rs.c2 IS NULL THEN 0 ELSE rs.c2 END good_r,
                 CASE WHEN re.c4 IS NULL THEN 0 ELSE re.c4 END bad_r,
                 CASE WHEN rk.c7 IS NULL THEN 0 ELSE rk.c7 END kbm_vsego,
                 CASE WHEN ao.c5 IS NULL THEN 0 ELSE ao.c5 END osago,
                 CASE WHEN aa.c6 IS NULL THEN 0 ELSE aa.c6 END agreem

      FROM ALL_REQ ar
        LEFT JOIN REQ_SUC rs
          ON rs.dd = ar.dd
        LEFT JOIN req_err re
          ON re.dd = ar.dd
       LEFT JOIN req_kbm rk
          ON rk.dd = ar.dd
        LEFT JOIN all_osago ao
          ON ao.dd = ar.dd
        LEFT JOIN all_agr aa
          ON aa.dd = ar.dd
      WHERE ar.c1 IS NOT NULL
   )
SELECT 
       r.dd     "Дата",
       r.all_r  "Всего запросов",
       r.good_r "Успешно запросов",
       r.bad_r  "Запросов с ошибками",
       r.kbm_vsego "Запросов КБМ Всего",
       r.osago  "Заключено договоров в ДиКБМ",
       r.agreem "Заключено ДС в ДиКБМ"
  FROM res r;
