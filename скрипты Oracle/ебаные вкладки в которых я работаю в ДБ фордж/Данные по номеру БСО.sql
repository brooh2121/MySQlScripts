SELECT
  bpj.FILE_NAME, bpj.INS_REQ_ID, brj.MID, brj.IND_NUM, brj.BSO_SERIES, brj.BSO_NUMBER, 
  brj.NEW_BSO_STATUS_TYPE_ID, brj.REQ_STATUS_ID, brj.REQ_STATUS_MESSAGE,
  brj.BSO_STATE_ID, bs.BSO_STATUS_TYPE_ID
FROM RSA1.BSO_PACKAGE_JOURNAL bpj
  JOIN RSA1.BSO_REQUEST_JOURNAL brj ON bpj.BSO_PACKAGE_JOURNAL_ID = brj.BSO_PACKAGE_JOURNAL_ID
  LEFT JOIN RSA1.BSO_STATE bs ON brj.BSO_STATE_ID = bs.BSO_STATE_ID
WHERE bpj.FILE_NAME = 'bp_20170504184608_4.xml'
  AND brj.REQ_STATUS_ID <> '3';

SELECT * FROM RSA1.REQUEST_STATUS WHERE REQ_STATUS_ID= '5102';


SELECT 
  irj.*
FROM RSA1.INS_REQUEST_JUR irj 
WHERE irj.REQ_TYPE_ID = 12 -- Запрос о статусе пакета БСО
  AND irj.INS_COMPANY_ID = 267 -- ИД Компании
  -- Ограничить область поиска (по индексированному полю)
  -- Скорее всего статус запрашивался в тот же день
  AND irj.BEG_DATE BETWEEN TO_DATE('04.05.2017','DD.MM.YYYY')
                       AND TO_DATE('05.05.2017','DD.MM.YYYY')
  AND EXTRACTVALUE(XMLType(UTL_COMPRESS.LZ_UNCOMPRESS(irj.REQ_BODY), 
    nls_charset_id('UTF8')), 'BSOPackageStatusRequest/PackageID') = 'bp_20170504184608_4.xml';
