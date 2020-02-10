SELECT
  COUNT(irj.INS_REQ_ID),
  TO_CHAR(irj.BEG_DATE,'yyyy.mm.dd hh24:mi')
  FROM RSA1.INS_REQUEST_JUR irj 
  WHERE irj.REQ_TYPE_ID IN (1)
  AND irj.INS_COMPANY_ID = 10
  AND irj.BEG_DATE>= TRUNC(SYSDATE)
GROUP BY TO_CHAR(irj.BEG_DATE,'yyyy.mm.dd hh24:mi');

SELECT
  COUNT(irj.INS_REQ_ID)--,
  --TO_CHAR(irj.BEG_DATE,'yyyy.mm.dd hh24:mi')
  FROM RSA1.INS_REQUEST_JUR irj 
  WHERE irj.REQ_TYPE_ID IN (1)
  AND irj.INS_COMPANY_ID = 12
  AND irj.BEG_DATE>= TO_DATE('26.10.2018 14:00:00','dd.mm.yyyy hh24:mi:ss')
  AND irj.BEG_DATE < TO_DATE('26.10.2018 16:00:00','dd.mm.yyyy hh24:mi:ss')
--GROUP BY TO_CHAR(irj.BEG_DATE,'yyyy.mm.dd hh24:mi')
;

SELECT SYSDATE + INTERVAL '10' MINUTE FROM DUAL d;

SELECT MOD(EXTRACT(minute)) FROM DUAL;

SELECT TRUNC(sysdate - 10*1/24/60,'mi') from dual;

SELECT 
    --DATEBEG + 1/24/60*(LEVEL - 1) AS DATEREP--,LEVEL
  DATEBEG + 10/24/60 *(LEVEL - 1) AS DATEREP--
  FROM 
    (
    SELECT
      TRUNC(SYSTIMESTAMP) AS DATEBEG,
      TRUNC(SYSTIMESTAMP) AS DATEEND
    FROM DUAL
    ) CONNECT BY LEVEL <= (DATEEND - DATEBEG + 1) * 24 * 60 + 1
ORDER by DATEREP;

SELECT ((SYSDATE- 1) - SYSDATE + 1) * 24 * 60 FROM DUAL;

SELECT SYSTIMESTAMP + 1/24/60 * 10 FROM DUAL;

select *
from   (select level from dual connect by level < 10);

SELECT
RDH.DATEREP,
NVL(zapr.iri,0) TT1 --,
--SUM(zapr.iri) OVER (PARTITION BY TRUNC(RDH.daterep) ORDER by RDH.DATEREP) AS tt1
FROM (
SELECT 
    DATEBEG + 1/24/6 *(LEVEL - 1) AS DATEREP
  FROM 
    (
    SELECT
      TRUNC(SYSDATE) AS DATEBEG,
      TRUNC(SYSDATE) AS DATEEND
    FROM DUAL
    ) CONNECT BY LEVEL <= (DATEEND - DATEBEG + 1) * 24 * 6 --+ 1
) RDH,
(
SELECT
  COUNT(irj.INS_REQ_ID) iri,
  TRUNC(irj.BEG_DATE,'mi') DB
  --TO_CHAR(irj.BEG_DATE,'yyyy.mm.dd hh24:mi') DB
  FROM RSA1.INS_REQUEST_JUR irj 
  WHERE irj.REQ_TYPE_ID IN (1)
  AND irj.INS_COMPANY_ID = 12
  --AND irj.BEG_DATE >= TRUNC(SYSDATE)
  --AND irj.BEG_DATE < TRUNC(SYSDATE) + 1
  AND irj.BEG_DATE>= TO_DATE('26.10.2018 14:00:00','dd.mm.yyyy hh24:mi:ss')
  AND irj.BEG_DATE < TO_DATE('26.10.2018 16:00:00','dd.mm.yyyy hh24:mi:ss')
  --AND irj.BEG_DATE>= TO_DATE('16.10.2018 00:00:00','dd.mm.yyyy hh24:mi:ss')
  --AND irj.BEG_DATE < TO_DATE('17.10.2018 00:00:00','dd.mm.yyyy hh24:mi:ss')
  GROUP BY TRUNC(irj.BEG_DATE,'mi')
--GROUP BY TO_CHAR(irj.BEG_DATE,'yyyy.mm.dd hh24:mi')
)zapr
WHERE RDH.DATEREP = zapr.DB(+)
ORDER BY RDH.DATEREP;

SELECT SYSDATE + 1/24/60 from DUAL;

SELECT LEVEL FROM DUAL CONNECT BY LEVEL < (1 * 24 * 60 + 1);

select
  trunc(sysdate, 'mi')
  - mod(EXTRACT(minute FROM cast(sysdate as timestamp)), 10) / (24 * 60)
from dual;


SELECT
  COUNT(irj.INS_REQ_ID) iri,
  trunc(irj.BEG_DATE, 'mi') - mod(EXTRACT(minute FROM irj.BEG_DATE), 10) / (24 * 60) DB
  --TRUNC(irj.BEG_DATE,'mi') DB
  FROM RSA1.INS_REQUEST_JUR irj 
  WHERE irj.REQ_TYPE_ID IN (1)
  AND irj.INS_COMPANY_ID = 10
  AND irj.BEG_DATE >= TRUNC(SYSDATE)
  AND irj.BEG_DATE < TRUNC(SYSDATE) + 1
  GROUP by 
  trunc(irj.BEG_DATE, 'mi') - mod(EXTRACT(minute FROM irj.BEG_DATE), 10) / (24 * 60)
  ORDER by 
  trunc(irj.BEG_DATE, 'mi') - mod(EXTRACT(minute FROM irj.BEG_DATE), 10) / (24 * 60);
  --GROUP BY TRUNC(irj.BEG_DATE,'mi')

SELECT
  COUNT(irj.INS_REQ_ID),
  TO_CHAR(irj.BEG_DATE,'yyyy.mm.dd hh24:mi')
  FROM RSA1.INS_REQUEST_JUR irj 
  WHERE irj.REQ_TYPE_ID IN (1)
  AND irj.INS_COMPANY_ID = 10
  AND irj.BEG_DATE>= TRUNC(SYSDATE)
GROUP BY TO_CHAR(irj.BEG_DATE,'yyyy.mm.dd hh24:mi')
ORDER by TO_CHAR(irj.BEG_DATE,'yyyy.mm.dd hh24:mi');

select
  count(1)                                             cc
  ,EXTRACT(hour FROM beg_date)
  ,round(EXTRACT(minute FROM beg_date)/10)
from RSA1.INS_REQUEST_JUR
where BEG_dAte > sysdate - 2 /24
group by EXTRACT(hour FROM beg_date), round(EXTRACT(minute FROM beg_date)/10)
order by 2;

with irji as (
SELECT
  irj.INS_REQ_ID iri,
  irj.req_status_id,
  trunc(irj.BEG_DATE, 'mi') - mod(EXTRACT(minute FROM irj.BEG_DATE), 10) / (24 * 60) DB--,
  --irj.req_type_id
  FROM RSA1.INS_REQUEST_JUR irj 
  WHERE 1=1
  AND irj.INS_COMPANY_ID = 219
  AND irj.REQ_TYPE_ID = 1
  AND irj.BEG_DATE>= TO_DATE('01.04.2019 00:00:00','dd.mm.yyyy hh24:mi:ss')
  AND irj.BEG_DATE < TO_DATE('01.04.2019 18:00:00','dd.mm.yyyy hh24:mi:ss')
  --AND irj.BEG_DATE >= TRUNC(SYSDATE,'IW')
  --AND irj.BEG_DATE < TRUNC(SYSDATE,'IW') + 2
)
select * from irji pivot ( COUNT(iri) /*FOR(REQ_TYPE_ID) IN (1,2,3,4,5) */ FOR (req_status_id) IN (3,200,1199,613)
) order by DB;

SELECT * FROM RSA1.REQUEST_TYPE rt ORDER by rt.REQ_TYPE_ID;

SELECT TRUNC(SYSDATE,'IW') FROM DUAL;