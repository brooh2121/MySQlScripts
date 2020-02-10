SELECT ic.INS_COMPANY "Страховая компания",
       rs.REQ_STATUS "Статус",
       rs.REQ_STATUS_ID "ID статуса",
       rt.REQ_TYPE "Тип запроса",
       COUNT(irj.INS_REQ_ID) "Количество ошибочных загрузок"
  FROM BSI1.INS_REQUEST_JOUR irj
    JOIN BSI1.REQUEST_TYPE rt
      ON irj.REQ_TYPE_ID = rt.REQ_TYPE_ID
    JOIN BSI1.REQUEST_STATUS rs
      ON irj.REQ_STATUS_ID = rs.REQ_STATUS_ID
    JOIN BSI1.INS_COMPANY ic
      ON irj.INS_COMPANY_ID = ic.INS_COMPANY_ID
  WHERE irj.BEG_DATE BETWEEN TO_TIMESTAMP('18.02.2019 00:00:00', 'dd.mm.yyyy hh24:mi:ss') AND TO_TIMESTAMP('18.02.2019 23:59:59', 'dd.mm.yyyy hh24:mi:ss')--BETWEEN TRUNC(SYSDATE - 1, 'dd') AND TRUNC(SYSDATE, 'dd') - 1 / 24 / 60 / 60
    AND irj.REQ_STATUS_ID != 1
    AND irj.REQ_STATUS_ID != 2
    AND irj.REQ_STATUS_ID != 3
    AND irj.REQ_STATUS_ID != 619
    AND irj.INS_COMPANY_ID = 1018
  GROUP BY ic.INS_COMPANY,
           rs.REQ_STATUS,
           rs.REQ_STATUS_ID,
           rt.REQ_TYPE
  ORDER BY 5 DESC;


SELECT * FROM BSI1.SESSIONS s WHERE s.INS_COMPANY_ID = 1018;