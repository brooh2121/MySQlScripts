WITH TT1 AS (
SELECT
  rrj.INS_REQ_ID,
  ic.INS_COMPANY,
  rrj.SIGN_OPERATION,
  case 
  when rrj.sign_operation = 1
  then 'Успешно'
  else 'Не успешно'
  END as "Получение отчета",
  rrj.DATE_REQUEST,
  sysdate
  FROM BSI1.REPORT_REQUEST_JOUR rrj
  JOIN BSI1.INS_COMPANY ic ON rrj.INS_COMPANY_ID = ic.INS_COMPANY_ID
  --WHERE rrj.DATE_REQUEST >= TRUNC(SYSDATE)
  --WHERE rrj.DATE_REQUEST >= TO_DATE('01.07.2019','dd.mm.yyyy')
  WHERE rrj.DATE_REQUEST > TO_DATE('20.06.2019','dd.mm.yyyy')
  --AND rrj.DATE_REQUEST < TO_DATE('30.06.2019','dd.mm.yyyy')
)
SELECT 
COUNT(TT1.INS_REQ_ID) "Кол-во",
TT1.INS_COMPANY "Наименование СК",
TT1."Получение отчета",
TO_CHAR(TT1.DATE_REQUEST,'yyyy.mm') "год и месяц отчета",
SYSDATE "Дата отчета"
FROM TT1
--WHERE "Получение отчета" = 'Успешно'
GROUP BY
TT1.INS_COMPANY,
TT1."Получение отчета",
TO_CHAR(TT1.DATE_REQUEST,'yyyy.mm')
ORDER by INS_COMPANY, TO_CHAR(TT1.DATE_REQUEST,'yyyy.mm');


SELECT * FROM BSI1.INS_REQUEST_JOUR irj WHERE irj.REQ_TYPE_ID IN (47,48,49) AND irj.BEG_DATE >= TRUNC(sysdate);

SELECT
ic.INS_COMPANY,pj.*
FROM BSI1.PREPAYMENT_JOUR pj
JOIN BSI1.INS_COMPANY ic ON pj.INS_COMPANY_ID = ic.INS_COMPANY_ID;

WITH prepay AS (
SELECT
SUM(pj.PAYMENT_AMOUNT) PAYMENT_AMOUNT,
pj.INS_COMPANY_ID 
FROM BSI1.PREPAYMENT_JOUR pj GROUP by pj.INS_COMPANY_ID
),
COST_REPORT as (
SELECT sum(nsic.COST_REPORT) SUM_COST_REPORT,r.INS_COMPANY_ID
FROM BSI1.REPORT_REQUEST_JOUR r
JOIN BSI1.NSI_COST_REPORT_COMPANY nsic on nsic.nsi_cost_report_company_id = r.NSI_COST_REPORT_COMPANY_ID
WHERE 1=1
AND r.SIGN_OPERATION = 1
GROUP by r.INS_COMPANY_ID
)
SELECT
ic.INS_COMPANY,
--p.PAYMENT_AMOUNT,
--cr.SUM_COST_REPORT,
NVL(p.PAYMENT_AMOUNT - cr.SUM_COST_REPORT,'0') "oстатки",
SYSDATE
FROM BSI1.INS_COMPANY ic
JOIN prepay p ON ic.INS_COMPANY_ID = p.INS_COMPANY_ID
LEFT JOIN  COST_REPORT cr ON ic.INS_COMPANY_ID = cr.INS_COMPANY_ID
ORDER by "oстатки" desc;

SELECT * FROM BSI1.INS_COMPANY ic
  JOIN BSI1."USER" u ON ic.INS_COMPANY_ID = u.INS_COMPANY_ID
  WHERE ic.INS_COMPANY_ID = 254;


SELECT sum(nsic.COST_REPORT) SUM_COST_REPORT,r.INS_COMPANY_ID
FROM BSI1.REPORT_REQUEST_JOUR r
JOIN BSI1.NSI_COST_REPORT_COMPANY nsic on nsic.nsi_cost_report_company_id = r.NSI_COST_REPORT_COMPANY_ID
WHERE 1=1
AND r.SIGN_OPERATION = 1
GROUP by r.INS_COMPANY_ID;


SELECT * FROM BSI1.NSI_COST_REPORT_company ncr;

SELECT ic.INS_COMPANY,pj.*
  FROM BSI1.INS_COMPANY ic
  JOIN BSI1.PREPAYMENT_JOUR pj ON ic.INS_COMPANY_ID = pj.INS_COMPANY_ID;
  --GROUP by ic.INS_COMPANY;
--ORDER BY pj.CREATE_DATE;

  SELECT *
  FROM BSI1.REPORT_REQUEST_JOUR rrj
  JOIN BSI1.INS_COMPANY ic ON rrj.INS_COMPANY_ID = ic.INS_COMPANY_ID
  --WHERE rrj.DATE_REQUEST >= TRUNC(SYSDATE)
  WHERE rrj.DATE_REQUEST >= TO_DATE('20.06.2019','dd.mm.yyyy')
  AND rrj.DATE_REQUEST < TO_DATE('30.06.2019','dd.mm.yyyy')
  AND rrj.SIGN_OPERATION = 1
  AND ic.INS_COMPANY_ID = 254;

  SELECT * FROM BSI1.KLADR k;

  SELECT 
  COUNT(irj.INS_REQ_JOUR_ID),
  TO_CHAR(irj.BEG_DATE,'dd.mm.yyyy hh24'),
  irj.REQ_TYPE_ID
  FROM RSA_EOSAGO.INS_REQUEST_JOUR irj
  WHERE irj.INS_COMPANY_ID = 203
  --and irj.BEG_DATE >= TRUNC(SYSDATE,'hh')
  and BEG_DATE > TO_DATE('12.07.2019 15:00' ,'dd.mm.yyyy hh24:mi')
  AND irj.REQ_TYPE_ID IN (30,31,32,33,34,35)
  GROUP BY TO_CHAR(irj.BEG_DATE,'dd.mm.yyyy hh24'),irj.REQ_TYPE_ID
  ORDER by TO_CHAR(irj.BEG_DATE,'dd.mm.yyyy hh24'),irj.REQ_TYPE_ID;


  SELECT *
    --irj.INS_REQ_JOUR_ID
  --COUNT(irj.INS_REQ_JOUR_ID),
  --TO_CHAR(irj.BEG_DATE,'dd.mm.yyyy hh24'),
  --irj.REQ_TYPE_ID
  FROM RSA_EOSAGO.INS_REQUEST_JOUR irj
  WHERE irj.INS_COMPANY_ID = 203
  --and irj.BEG_DATE >= TRUNC(SYSDATE,'hh')
  and BEG_DATE > TO_DATE('12.07.2019 15:00' ,'dd.mm.yyyy hh24:mi')
  AND irj.REQ_TYPE_ID IN (30,31,32,33,34,35)
  --GROUP BY TO_CHAR(irj.BEG_DATE,'dd.mm.yyyy hh24'),irj.REQ_TYPE_ID
  --ORDER by TO_CHAR(irj.BEG_DATE,'dd.mm.yyyy hh24'),irj.REQ_TYPE_ID;

select * from RSA_EOSAGO.INS_COMPANY ic WHERE ic.INS_COMPANY LIKE '%Два%';

SELECT * FROM RSA_EOSAGO.REQUEST_TYPE rt ORDER by rt.REQ_TYPE_ID;

--30	Запрос на проверку субъекта – страхователя/собственника ТС
--31	Запрос статуса обр. запр. на пров. суб.–стр-ля/собств. ТС
--32	Запрос на проверку субъекта – ЛДУ
--33	Запрос статуса обработки запроса на проверку субъекта – ЛДУ
--34	Запрос на проверку ТС
--35	Запрос статуса обработки запроса на проверку ТС

