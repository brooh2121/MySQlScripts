SELECT
ROWNUM "� �/�",
"������������ �����������",
"����� ������",
"��� ������ ������",
"����� ������ ������",
"���� ������"
FROM 
(
SELECT
  ic.INS_COMPANY "������������ �����������",
  pj.CASH_BALANCE "����� ������",
  TO_CHAR(pj.CREATE_DATE,'yyyy') "��� ������ ������",
  TO_CHAR(pj.CREATE_DATE,'mm') "����� ������ ������",
  TO_CHAR(pj.CREATE_DATE,'dd') "���� ������"
  FROM BSI1.PREPAYMENT_JOUR pj
  JOIN BSI1.INS_COMPANY ic ON pj.INS_COMPANY_ID = ic.INS_COMPANY_ID
ORDER BY 
  TO_CHAR(pj.CREATE_DATE,'yyyy'),
  TO_CHAR(pj.CREATE_DATE,'mm'),
  TO_CHAR(pj.CREATE_DATE,'dd') 
);

--SELECT * FROM PREPAYMENT_JOUR pj;

SELECT
ROWNUM "� �/�",
"������������ �����������",
"���������� �������",
"��� ������������� ������",
"����� ������������� ������",
"���� ������"
FROM 
(
SELECT
  ic.INS_COMPANY "������������ �����������",
  COUNT(irj.INS_REQ_ID) "���������� �������",
  TO_CHAR(irj.BEG_DATE,'yyyy') "��� ������������� ������",
  TO_CHAR(irj.BEG_DATE,'mm') "����� ������������� ������",
  TO_CHAR(irj.BEG_DATE,'dd') "���� ������"
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
