﻿SELECT * FROM rsa_eosago.POLICY_PROCESS_JOUR ppj WHERE PPJ.POLICY_NUMBER = '0102245924';
SELECT * FROM RSA_EOSAGO.POLICY_PROCESS_JOUR ppj WHERE ppj.INS_COMP_DRAFT_POLICY_ID = '5952896822-1';
SELECT * FROM RSA_EOSAGO.CHANGE_POLICY_STATUS_JOUR cpsj WHERE CPSJ.POLICY_NUMBER = '0101705738';

SELECT * FROM RSA_EOSAGO.SUBJECT_OSAGO "so";

SELECT
*
FROM RSA_EOSAGO.PERSONAL_INFO pi
WHERE lower(pi.FIRST_NAME) = lower('Дмитрий')
AND lower(PI.MIDDLE_NAMES) = lower('Владимирович')
AND lower(pi.LAST_NAME) = lower('Иванченков')
AND PI.BIRTH_DATE = TO_DATE('15.03.1990','dd.mm.yyyy');

SELECT * FROM RSA_EOSAGO.SUBJECT_OSAGO so 
JOIN RSA_EOSAGO.SUBJ_DOC sd ON SO.DOC_REC_ID = SD.DOC_REC_ID
WHERE SO.SUBJ_HASH = 'C72D0AE5743E646276A06D267492F175F0A70489C81089645A0419BE72D934BC';

SELECT * FROM RSA_EOSAGO.SUBJ_DOC sd WHERE SD.DOC_REC_ID = '45835756';

--UPDATE RSA_EOSAGO.SUBJ_DOC sd SET SD.DOC_SERIAL = 'BAE',SD.DOC_NUMBER ='612018', SD.DOC_SERIAL_ORIGIN = 'ВАЕ',sd.DOC_NUMBER_ORIGIN ='612018' WHERE SD.DOC_REC_ID = '30586326';

UPDATE RSA_EOSAGO.SUBJ_DOC sd SET /*SD.DOC_SERIAL = 'KPA',SD.DOC_NUMBER ='236021',*/ SD.DOC_SERIAL_ORIGIN = '0703',sd.DOC_FULL_NUM_ORIGIN ='0703130331' WHERE SD.DOC_REC_ID = '45835756';

COMMIT;

SELECT * FROM RSA_EGARANT.INS_COMPANY ic
JOIN RSA_EGARANT."USER" "u" ON ic.INS_COMPANY_ID = "u".INS_COMPANY_ID
WHERE IC.INSURER_ID = '03000000';

SELECT * FROM RSA_EGARANT.NSI_TARIFF_BASE "ntb" WHERE "ntb".INSURER_ID = '03000000' AND "ntb".BEG_DATE >= TRUNC(SYSDATE);

SELECT * FROM RSA_EOSAGO.NSI_OKSM "no" WHERE "no".OKSM_CODE = 276;

SELECT * FROM RSA_EOSAGO.DOC_TYPE "dt";

SELECT * FROM RSA_EOSAGO.VALIDATION_SETTINGS "vs" WHERE "vs".VALIDATION_ERROR_ID = 2351;