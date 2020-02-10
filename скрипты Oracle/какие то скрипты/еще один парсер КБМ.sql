SELECT
  * 
  FROM rsa1.ins_request_jur irj
  WHERE irj.INS_COMPANY_ID = 10
  AND irj.REQ_TYPE_ID = 2
  and irj.BEG_DATE >= TO_DATE('20.02.2019 13:00','dd.mm.yyyy hh24:mi')
  ORDER by irj.BEG_DATE;

SELECT * FROM RSA1.REQUEST_TYPE rt ORDER by rt.REQ_TYPE_ID;

WITH KBMPARSE as (
SELECT
ic.INS_COMPANY,
irj.INS_REQ_ID,
irj.REQ_STATUS_ID,
irj.beg_date,
irj.END_DATE,
EXTRACTVALUE(value(TT1),'PhysicalPerson/PersonalDataInfo/Surname') HS,
EXTRACTVALUE(VALUE(TT1),'PhysicalPerson/PersonalDataInfo/Name')SERIAL,
EXTRACTVALUE(VALUE(TT1),'PhysicalPerson/PersonalDataInfo/Patronymic')NUMB
FROM RSA1.INS_REQUEST_JUR irj
JOIN RSA1.INS_COMPANY ic ON irj.INS_COMPANY_ID = ic.INS_COMPANY_ID  
,
TABLE(XMLSEQUENCE(EXTRACT(XMLTYPE(UTL_COMPRESS.LZ_UNCOMPRESS(irj.req_body),NLS_CHARSET_ID('AL32UTF8')),'*:CalcRequest/CalcRequestValue/CalcKBMRequest/PhysicalPersons/PhysicalPerson')))TT1
--WHERE irj.BEG_DATE >= TRUNC(SYSDATE,'hh')
WHERE irj.BEG_DATE >= TO_DATE ('03.07.2019 00:00:00','dd.mm.yyyy hh24:mi:ss')
AND irj.BEG_DATE < TO_DATE ('04.07.2019 23:59:59','dd.mm.yyyy hh24:mi:ss')
AND irj.REQ_TYPE_ID = 1
--and irj.req_status_id = 3
AND ic.INS_COMPANY_ID = 269
)
SELECT
* 
from KBMPARSE k
--WHERE LOWER(k.NUMB) = LOWER('Âàëåðüåâíà')
  where LOWER(k.HS) = LOWER('ÑÀÁËÈÍÀ')
  AND LOWER(k.SERIAL)=LOWER('ÀËÈÍÀ')
  AND LOWER(k.NUMB)=LOWER('ÑÅÐÃÅÅÂÍÀ')
ORDER by k.BEG_DATE;

SELECT * FROM RSA2.KBM_JOUR kj WHERE kj.INS_REQ_ID = '7531816586';