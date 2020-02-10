SELECT INSURER_ID "������������� ��",
       INS_COMPANY_NAME "������������ ��",
       REPORT_DATE_FS "���� ������, ������ ����",
       NVL(POLICY_COUNT_SUCCES_FS,0) "���. ���������, 3 ������",
       NVL(POLICY_COUNT_ERR_FS,0)  "���. ���������, 7 ������",
       NVL(COUNT_ERR_NOT_CRITICAL_FS,0) "� ��������, �� ������������",
       NVL(COUNT_ERR_CRITICAL_FS,0) "� �������� ������������",
       NVL(COUNT_ERR_OTHER_FS,0) "� ������� ��������",

       REPORT_DATE_SS "���� ������, ������ ���� (+15)",
       NVL(POLICY_COUNT_ERR_SS,0)  "���. ���������, 7 ������ (+15)",
       NVL(COUNT_ERR_NOT_CRITICAL_SS,0) "� ��������, �� ����. (+15)",
       NVL(COUNT_ERR_CRITICAL_SS,0) "� �������� ������������ (+15)",
       NVL(COUNT_ERR_OTHER_SS,0) "� ������� �������� (+15)"

FROM RSA_TPREP.BSI_01_REPORT_POLICY_160517 brp where REPORT_ID = '45' AND INS_COMPANY_ID ='19';


SELECT INSURER_ID "������������� ��",
       INS_COMPANY_NAME "������������ ��",
       REPORT_DATE_FS "���� ������, ������ ����",
       NVL(LOSS_COUNT_SUCCES_FS,0) "���. �������, 3 ������",
       NVL(LOSS_COUNT_ERR_FS,0)  "���. �������, 7 ������",
       NVL(COUNT_ERR_NOT_CRITICAL_FS,0) "� ��������, �� ������������",
       NVL(COUNT_ERR_CRITICAL_FS,0) "� �������� ������������",
       NVL(COUNT_ERR_OTHER_FS,0) "� ������� ��������",

       REPORT_DATE_SS "���� ������, ������ ���� (+15)",
       NVL(LOSS_COUNT_ERR_SS,0)  "���. �������, 7 ������ (+15)",
       NVL(COUNT_ERR_NOT_CRITICAL_SS,0) "� ��������, �� ����. (+15)",
       NVL(COUNT_ERR_CRITICAL_SS,0) "� �������� ������������ (+15)",
       NVL(COUNT_ERR_OTHER_SS,0) "� ������� �������� (+15)"

FROM RSA_TPREP.BSI_01_REPORT_LOSS_160517 brl WHERE REPORT_ID = '45' 
AND   INS_COMPANY_ID ='19';


select DISTINCT
                     bapd.INS_COMPANY_ID "�����. �� � ����",
                     bapd.INSURER_ID "�����. �� �� ���.����",
                     bapd.INS_COMPANY "������������ ��",
                     bapd.INS_COMP_POLICY_ID "����� ������ �� ��",
                     bapd.POLICY_NUMBER "����� ������",
                     bapd.POLICY_REC_ID "����� ������ � ����",
                     bapd.POLICY_AGGR_ID "�����. ���.����������",
                     bapd.REQ_STATUS_ID "������ ���������",
                     bapd.ERROR_ID "��� ������",
                    CASE WHEN bre.IS_CRITICAL = 1 THEN '���������'
                         WHEN bre.IS_CRITICAL = 0 THEN '�� ���������'
                         ELSE '������' END "������� �����������"

                    FROM BSI_01_ALL_POLICES_160517 bapd LEFT JOIN BSI_01_REPORT_ERRORS bre ON bre.ERROR_ID = bapd.ERROR_ID
                   WHERE bapd.INS_COMPANY_ID||bapd.INS_COMP_POLICY_ID||bapd.POLICY_AGGR_ID
                     in (SELECT b.INS_COMPANY_ID||b.INS_COMP_POLICY_ID||b.POLICY_AGGR_ID FROM BSI_01_REPORT_BAD_POLICY b WHERE b.STEP = 1
                                     AND b.REPORT_ID =  (SELECT MAX(m.REPORT_ID) from RSA_TPREP.BSI_01_REPORT_META m))
                    AND bapd.REQ_STATUS_ID = 7
                    AND bapd.HAS_VALIDATION_ERROR = 1
                    AND bapd.INS_COMPANY_ID = '19'
            AND bapd.ERROR_ID IS NOT NULL;


select DISTINCT
                     bald.INS_COMPANY_ID "�����. �� � ����",
                     bald.INSURER_ID "�����. �� �� ���.����",
                     bald.INS_COMPANY "������������ ��",
                     bald.INS_COMP_LOSS_ID "�����. ������ �� ��",
                     bald.LOSS_REC_ID "�����. ������ � ����",
                     bald.REQ_STATUS_ID "������ ��������",
                     bald.ERROR_ID "��� ������",
                     CASE WHEN bre.IS_CRITICAL = 1 THEN '���������'
                          WHEN bre.IS_CRITICAL = 0 THEN '�� ���������'
                          ELSE '������' END "������� �����������"
       FROM  BSI_01_ALL_LOSSES_160517 bald LEFT JOIN BSI_01_REPORT_ERRORS bre ON bre.ERROR_ID = bald.ERROR_ID
  WHERE bald.INS_COMPANY_ID||bald.INS_COMP_LOSS_ID in
                                       (SELECT brbl.INS_COMPANY_ID||brbl.INS_COMP_LOSS_ID FROM BSI_01_REPORT_BAD_LOSS brbl WHERE brbl.STEP = 1
                                              AND brbl.REPORT_ID =  (SELECT MAX(m.REPORT_ID) from RSA_TPREP.BSI_01_REPORT_META m))
      AND bald.REQ_STATUS_ID = 7
      AND bald.HAS_VALIDATION_ERROR = 1
      AND bald.INS_COMPANY_ID = '19' AND bald.ERROR_ID IS NOT NULL;