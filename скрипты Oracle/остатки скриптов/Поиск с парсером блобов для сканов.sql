SELECT * FROM RSA_EOSAGO.INS_REQUEST_JOUR irj
WHERE irj.INS_REQ_JOUR_ID IN (
SELECT ins_req_jour_id FROM ( SELECT ins_req_jour_id FROM RSA_EOSAGO.INS_REQUEST_JOUR irj 
JOIN RSA_EOSAGO.INS_COMPANY ic ON irj.INS_COMPANY_ID = ic.INS_COMPANY_ID
WHERE ic.INSURER_ID = '20400000'--irj.INS_COMPANY_ID = '359' 
AND irj.REQ_TYPE_ID in ('72') AND irj.REQ_STATUS_ID = 3 ORDER BY irj.INS_REQ_JOUR_ID DESC) WHERE --ROWNUM < 1000
beg_date >= TO_DATE ('03.12.2019 00:00:00','dd.mm.yyyy hh24:mi:ss')
and beg_date <= TO_DATE ('04.12.2019 23:59:59','dd.mm.yyyy hh24:mi:ss')
)
AND IRJ.REQ_BODY IS NOT NULL
AND EXTRACTVALUE(XMLTYPE(UTL_COMPRESS.LZ_UNCOMPRESS(irj.req_body),NLS_CHARSET_ID('UTF8')),'*:AcceptScanRequest/ListAppScanRequest/ApplicationData/EpolicyID')= 2844225005;--[text()=1281822222]

SELECT * FROM RSA_EOSAGO.INS_REQUEST_JOUR irj
WHERE irj.INS_REQ_JOUR_ID IN (
SELECT ins_req_jour_id FROM ( SELECT ins_req_jour_id FROM RSA_EOSAGO.INS_REQUEST_JOUR irj WHERE irj.INS_COMPANY_ID = '359' AND irj.REQ_TYPE_ID in ('71') ORDER BY irj.INS_REQ_JOUR_ID DESC) WHERE --ROWNUM < 1000
beg_date >= TO_DATE ('12.11.2019 09:16:00','dd.mm.yyyy hh24:mi:ss') --AND REQ_STATUS_id NOT IN ('6')
and beg_date <= TO_DATE ('13.11.2019 10:40:00','dd.mm.yyyy hh24:mi:ss')
)
AND EXTRACTVALUE(XMLTYPE(UTL_COMPRESS.LZ_UNCOMPRESS(irj.req_body),NLS_CHARSET_ID('UTF8')),'*:CheckScanDataRequest/EpolicyID')= 2798473657;

SELECT * FROM RSA_EOSAGO.INS_REQUEST_JOUR irj
WHERE irj.INS_REQ_JOUR_ID IN (
SELECT ins_req_jour_id FROM ( SELECT ins_req_jour_id FROM RSA_EOSAGO.INS_REQUEST_JOUR irj WHERE irj.INS_COMPANY_ID = '26' AND irj.REQ_TYPE_ID in ('70') ORDER BY irj.INS_REQ_JOUR_ID DESC) WHERE --ROWNUM < 1000
beg_date >= TO_DATE ('12.11.2019 09:16:00','dd.mm.yyyy hh24:mi:ss') --AND REQ_STATUS_id NOT IN ('6')
and beg_date <= TO_DATE ('13.11.2019 10:40:00','dd.mm.yyyy hh24:mi:ss')
)
AND EXTRACTVALUE(XMLTYPE(UTL_COMPRESS.LZ_UNCOMPRESS(irj.resp_body),NLS_CHARSET_ID('UTF8')),'*:CheckScanResponse/ListApplicationID/EpolicyID')= 2798473657;


SELECT * FROM RSA_EOSAGO.INS_REQUEST_JOUR irj
WHERE irj.INS_REQ_JOUR_ID IN (
SELECT ins_req_jour_id FROM ( SELECT ins_req_jour_id FROM RSA_EOSAGO.INS_REQUEST_JOUR irj WHERE irj.INS_COMPANY_ID = '26' AND irj.REQ_TYPE_ID in ('40') ORDER BY irj.INS_REQ_JOUR_ID DESC) WHERE --ROWNUM < 1000
beg_date >= TO_DATE ('30.10.2019 15:58:00','dd.mm.yyyy hh24:mi:ss') --AND REQ_STATUS_id NOT IN ('6')
and beg_date <= TO_DATE ('30.10.2019 16:00:00','dd.mm.yyyy hh24:mi:ss')
)
AND EXTRACTVALUE(XMLTYPE(UTL_COMPRESS.LZ_UNCOMPRESS(irj.req_body),NLS_CHARSET_ID('UTF8')),'*:PolicyEOSAGOStatusRequest/PolicyTitle/TripNumber')= '34174401543569978';

SELECT * FROM RSA_EOSAGO.REQUEST_TYPE rt ORDER by rt.REQ_TYPE_ID;

SELECT irj.INS_COMPANY_ID,irj.INS_REQ_JOUR_ID,irj.REQ_STATUS_ID,irj.BEG_DATE,irj.REQ_BODY 
  FROM RSA_EOSAGO.INS_REQUEST_JOUR irj 
  WHERE irj.REQ_TYPE_ID = 72
  AND irj.INS_COMPANY_ID = '26'
  --AND irj.BEG_DATE >= TRUNC(SYSDATE)
  AND irj.BEG_DATE >= TO_DATE('30.10.2019 15:58:00','dd.mm.yyyy hh24:mi:ss')
  AND irj.BEG_DATE < TO_DATE('30.10.2019 16:00:00','dd.mm.yyyy hh24:mi:ss')
;


SELECT * FROM RSA_EOSAGO.REQUEST_TYPE rt ORDER by rt.REQ_TYPE_ID;

SELECT  * FROM RSA_EOSAGO.INS_REQUEST_JOUR irj WHERE irj.REQ_TYPE_ID = 72 AND irj.INS_COMPANY_ID = 217 AND irj.BEG_DATE >= TRUNC(sysdate);

SELECT
  * 
  FROM RSA_EOSAGO.INS_REQUEST_JOUR irj
  WHERE irj.INS_COMPANY_ID = 12
  --AND irj.BEG_DATE >= TRUNC(SYSDATE,'hh')
  AND irj.BEG_DATE>= TO_DATE('01.06.2019 10:30', 'dd.mm.yyyy hh24:mi')
  AND irj.BEG_DATE < TO_DATE('01.06.2019 11:00','dd.mm.yyyy hh24:mi')
  AND irj.REQ_TYPE_ID = 72;

WITH SCANPARSE AS (
SELECT
ins_company_id,
irj.INS_REQ_JOUR_ID,
irj.req_status_id,
irj.BEG_DATE,
irj.END_DATE,
EXTRACTVALUE(VALUE(TT1),'EpolicyID') EPOLICYID
FROM RSA_EOSAGO.INS_REQUEST_JOUR irj
,
TABLE(XMLSEQUENCE(EXTRACT(XMLTYPE(UTL_COMPRESS.LZ_UNCOMPRESS(irj.resp_body),NLS_CHARSET_ID('AL32UTF8')),'*:CheckScanResponse/ListApplicationID/EpolicyID'))) TT1
WHERE irj.INS_COMPANY_ID = '359' AND irj.REQ_TYPE_ID in ('70')
AND beg_date >= TO_DATE ('12.11.2019 09:16:00','dd.mm.yyyy hh24:mi:ss')
and beg_date <= TO_DATE ('13.12.2019 11:00:00','dd.mm.yyyy hh24:mi:ss')
AND irj.REQ_STATUS_ID = 3
)
SELECT
*
FROM SCANPARSE where EPOLICYID = '2798473657';