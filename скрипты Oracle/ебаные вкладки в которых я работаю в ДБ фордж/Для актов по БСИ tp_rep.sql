SELECT INSURER_ID "Идентификатор СК",
       INS_COMPANY_NAME "Наименование СК",
       REPORT_DATE_FS "Дата отчета, первый этап",
       NVL(POLICY_COUNT_SUCCES_FS,0) "Кол. договором, 3 статус",
       NVL(POLICY_COUNT_ERR_FS,0)  "Кол. договором, 7 статус",
       NVL(COUNT_ERR_NOT_CRITICAL_FS,0) "С ошибками, не критическими",
       NVL(COUNT_ERR_CRITICAL_FS,0) "С ошибками критическими",
       NVL(COUNT_ERR_OTHER_FS,0) "С другими ошибками",

       REPORT_DATE_SS "Дата отчета, второй этап (+15)",
       NVL(POLICY_COUNT_ERR_SS,0)  "Кол. договором, 7 статус (+15)",
       NVL(COUNT_ERR_NOT_CRITICAL_SS,0) "С ошибками, не крит. (+15)",
       NVL(COUNT_ERR_CRITICAL_SS,0) "С ошибками критическими (+15)",
       NVL(COUNT_ERR_OTHER_SS,0) "С другими ошибками (+15)"

FROM RSA_TPREP.BSI_01_REPORT_POLICY_160517 brp where REPORT_ID = '45' AND INS_COMPANY_ID ='19';


SELECT INSURER_ID "Идентификатор СК",
       INS_COMPANY_NAME "Наименование СК",
       REPORT_DATE_FS "Дата отчета, первый этап",
       NVL(LOSS_COUNT_SUCCES_FS,0) "Кол. убытков, 3 статус",
       NVL(LOSS_COUNT_ERR_FS,0)  "Кол. убытков, 7 статус",
       NVL(COUNT_ERR_NOT_CRITICAL_FS,0) "С ошибками, не критическими",
       NVL(COUNT_ERR_CRITICAL_FS,0) "С ошибками критическими",
       NVL(COUNT_ERR_OTHER_FS,0) "С другими ошибками",

       REPORT_DATE_SS "Дата отчета, второй этап (+15)",
       NVL(LOSS_COUNT_ERR_SS,0)  "Кол. убытков, 7 статус (+15)",
       NVL(COUNT_ERR_NOT_CRITICAL_SS,0) "С ошибками, не крит. (+15)",
       NVL(COUNT_ERR_CRITICAL_SS,0) "С ошибками критическими (+15)",
       NVL(COUNT_ERR_OTHER_SS,0) "С другими ошибками (+15)"

FROM RSA_TPREP.BSI_01_REPORT_LOSS_160517 brl WHERE REPORT_ID = '45' 
AND   INS_COMPANY_ID ='19';


select DISTINCT
                     bapd.INS_COMPANY_ID "Идент. СК в ЕАИС",
                     bapd.INSURER_ID "Идент. СК от Гос.знак",
                     bapd.INS_COMPANY "Наименование СК",
                     bapd.INS_COMP_POLICY_ID "Идент полиса от СК",
                     bapd.POLICY_NUMBER "Номер полиса",
                     bapd.POLICY_REC_ID "Идент полиса в ЕАИС",
                     bapd.POLICY_AGGR_ID "Идент. доп.соглашения",
                     bapd.REQ_STATUS_ID "Статус обработки",
                     bapd.ERROR_ID "Код ошибки",
                    CASE WHEN bre.IS_CRITICAL = 1 THEN 'Критичная'
                         WHEN bre.IS_CRITICAL = 0 THEN 'Не критичная'
                         ELSE 'Другая' END "Признак критичности"

                    FROM BSI_01_ALL_POLICES_160517 bapd LEFT JOIN BSI_01_REPORT_ERRORS bre ON bre.ERROR_ID = bapd.ERROR_ID
                   WHERE bapd.INS_COMPANY_ID||bapd.INS_COMP_POLICY_ID||bapd.POLICY_AGGR_ID
                     in (SELECT b.INS_COMPANY_ID||b.INS_COMP_POLICY_ID||b.POLICY_AGGR_ID FROM BSI_01_REPORT_BAD_POLICY b WHERE b.STEP = 1
                                     AND b.REPORT_ID =  (SELECT MAX(m.REPORT_ID) from RSA_TPREP.BSI_01_REPORT_META m))
                    AND bapd.REQ_STATUS_ID = 7
                    AND bapd.HAS_VALIDATION_ERROR = 1
                    AND bapd.INS_COMPANY_ID = '19'
            AND bapd.ERROR_ID IS NOT NULL;


select DISTINCT
                     bald.INS_COMPANY_ID "Идент. СК в ЕАИС",
                     bald.INSURER_ID "Идент. СК от Гос.знак",
                     bald.INS_COMPANY "Наименование СК",
                     bald.INS_COMP_LOSS_ID "Идент. убытка от СК",
                     bald.LOSS_REC_ID "Идент. убытка в ЕАИС",
                     bald.REQ_STATUS_ID "Статус загрузки",
                     bald.ERROR_ID "Код ошибки",
                     CASE WHEN bre.IS_CRITICAL = 1 THEN 'Критичная'
                          WHEN bre.IS_CRITICAL = 0 THEN 'Не критичная'
                          ELSE 'Другая' END "Признак критичности"
       FROM  BSI_01_ALL_LOSSES_160517 bald LEFT JOIN BSI_01_REPORT_ERRORS bre ON bre.ERROR_ID = bald.ERROR_ID
  WHERE bald.INS_COMPANY_ID||bald.INS_COMP_LOSS_ID in
                                       (SELECT brbl.INS_COMPANY_ID||brbl.INS_COMP_LOSS_ID FROM BSI_01_REPORT_BAD_LOSS brbl WHERE brbl.STEP = 1
                                              AND brbl.REPORT_ID =  (SELECT MAX(m.REPORT_ID) from RSA_TPREP.BSI_01_REPORT_META m))
      AND bald.REQ_STATUS_ID = 7
      AND bald.HAS_VALIDATION_ERROR = 1
      AND bald.INS_COMPANY_ID = '19' AND bald.ERROR_ID IS NOT NULL;