SELECT
ROWNUM "№ п/п",
"Наименование страховщика",
"Сумма аванса",
"Год оплаты аванса",
"Месяц оплаты аванса",
"Дата оплаты"
FROM 
(
SELECT
  ic.INS_COMPANY "Наименование страховщика",
  pj.CASH_BALANCE "Сумма аванса",
  TO_CHAR(pj.CREATE_DATE,'yyyy') "Год оплаты аванса",
  TO_CHAR(pj.CREATE_DATE,'mm') "Месяц оплаты аванса",
  TO_CHAR(pj.CREATE_DATE,'dd') "Дата оплаты"
  FROM BSI1.PREPAYMENT_JOUR pj
  JOIN BSI1.INS_COMPANY ic ON pj.INS_COMPANY_ID = ic.INS_COMPANY_ID
ORDER BY 
  TO_CHAR(pj.CREATE_DATE,'yyyy'),
  TO_CHAR(pj.CREATE_DATE,'mm'),
  TO_CHAR(pj.CREATE_DATE,'dd') 
);

--SELECT * FROM PREPAYMENT_JOUR pj;

SELECT
ROWNUM "№ п/п",
"Наименование страховщика",
"Количество отчетов",
"Год представления отчета",
"Месяц Представления отчета",
"Дата отчета"
FROM 
(
SELECT
  ic.INS_COMPANY "Наименование страховщика",
  COUNT(irj.INS_REQ_ID) "Количество отчетов",
  TO_CHAR(irj.BEG_DATE,'yyyy') "Год представления отчета",
  TO_CHAR(irj.BEG_DATE,'mm') "Месяц Представления отчета",
  TO_CHAR(irj.BEG_DATE,'dd') "Дата отчета"
  FROM BSI1.INS_REQUEST_JOUR irj
  JOIN BSI1.INS_COMPANY ic ON irj.INS_COMPANY_ID = ic.INS_COMPANY_ID
  WHERE irj.REQ_TYPE_ID = 49
  AND irj.BEG_DATE >= TO_DATE('01.08.2015' ,'dd.mm.yyyy')
  AND irj.REQ_STATUS_ID = 3
  GROUP by 
  ic.INS_COMPANY,
  TO_CHAR(irj.BEG_DATE,'yyyy'),
  TO_CHAR(irj.BEG_DATE,'mm'),
  TO_CHAR(irj.BEG_DATE,'dd')
  ORDER BY 
  TO_CHAR(irj.BEG_DATE,'yyyy'),
  TO_CHAR(irj.BEG_DATE,'mm'),
  TO_CHAR(irj.BEG_DATE,'dd')
);
