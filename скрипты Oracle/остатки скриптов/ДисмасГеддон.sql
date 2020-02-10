SELECT
*
FROM rsa2.SUBJECT_OSAGO so
JOIN rsa2.kbm_plus kp ON SO.SUBJ_OSAGO_REC_ID = KP.SUBJ_OSAGO_REC_ID
JOIN rsa2.SUBJ_DOC sd ON SO.SUBJ_OSAGO_DOC_REC_ID = SD.DOC_REC_ID
WHERE so.SUBJ_HASH = '502E50701BEE6647CDA58288E1D358E5005BE97151E430B56024109802EA09DB' AND SD.DOC_REC_ID = '35640531' ORDER BY kbm_plus_beg_date;

--subj_osago_rec_id = 69644370

SELECT 
*
FROM rsa2.KBM_PLUS kp 
WHERE KP.SUBJ_OSAGO_REC_ID = '69644370';

UPDATE rsa2.KBM_PLUS SET IS_ACTUAL = 0, disactual_date = SYSDATE WHERE subj_osago_rec_id = '69644370';
COMMIT;

SELECT SUBJ_OSAGO_REC_ID,SUBJ_OSAGO_UNQ_ID,INN
      FROM RSA1.SUBJECT_OSAGO
      WHERE SUBJ_OSAGO_UNQ_ID IN (SELECT SUBJ_OSAGO_UNQ_ID
            FROM (SELECT SUBJ_OSAGO_UNQ_ID,
                         COUNT(SUBJ_OSAGO_UNQ_ID)
                FROM (SELECT *
                    FROM RSA1.SUBJECT_OSAGO so
                    WHERE so.SUBJ_OSAGO_UNQ_ID IN (SELECT so.SUBJ_OSAGO_UNQ_ID
                          FROM RSA1.SUBJECT_OSAGO so
                            INNER JOIN RSA1.SUBJ_DOC sd
                              ON so.SUBJ_OSAGO_DOC_REC_ID = sd.DOC_REC_ID
                          WHERE so.IS_JURIDICAL = 1
                  AND so.INN IN 
--endregion 1
          (SELECT "tack".INN FROM rsa2.TEMP_AUTO_CALC_KBM_2019 "tack")))
--region 2
                GROUP BY SUBJ_OSAGO_UNQ_ID
                HAVING COUNT(*) > 1));

SELECT
*
FROM rsa1.SUBJECT_OSAGO "so" WHERE "so".INN IN (
SELECT "tack".INN FROM rsa2.TEMP_AUTO_CALC_KBM_2019 "tack" --WHERE "tack".STATUS != 'calculated'
);


SELECT
COUNT(inn)
FROM rsa1.SUBJECT_OSAGO "so" WHERE "so".INN IN (
SELECT "tack".INN FROM rsa2.TEMP_AUTO_CALC_KBM_2019 "tack" --WHERE "tack".STATUS != 'calculated'
);


--


BEGIN
  FOR rec IN (SELECT SUBJ_OSAGO_REC_ID
      FROM RSA1.SUBJECT_OSAGO
      WHERE SUBJ_OSAGO_UNQ_ID IN (SELECT SUBJ_OSAGO_UNQ_ID
            FROM (SELECT SUBJ_OSAGO_UNQ_ID,
                         COUNT(SUBJ_OSAGO_UNQ_ID)
                FROM (SELECT *
                    FROM RSA1.SUBJECT_OSAGO so
                    WHERE so.SUBJ_OSAGO_UNQ_ID IN (SELECT so.SUBJ_OSAGO_UNQ_ID
                          FROM RSA1.SUBJECT_OSAGO so
                            INNER JOIN RSA1.SUBJ_DOC sd
                              ON so.SUBJ_OSAGO_DOC_REC_ID = sd.DOC_REC_ID
                          WHERE so.IS_JURIDICAL = 1
                  AND so.INN IN 
--endregion 1
          (SELECT "tack".INN FROM rsa2.TEMP_AUTO_CALC_KBM_2019 "tack")))
--region 2
                GROUP BY SUBJ_OSAGO_UNQ_ID
                HAVING COUNT(*) > 1)))
  LOOP
    RSA1.PKG$SUBJECTS_UTIL.SEPARATE_SUBJECT_TO_NEW_UNIQ(
    rec.SUBJ_OSAGO_REC_ID,   -- первый параметр SUBJ_OSAGO_REC_ID
--endregion 2
           '16.01.20_DismasGeddon',     -- третий параметр Название секретной операции (номер заявки в SpiceWorks)
--region 3
    RSA1.TYP$NUMBER_15_COL() -- второй параметр - набор POLICY_SUBJ_INFO - куда вставить субъекта.
    );
    RSA1.PKG$SUBJECTS_UTIL.CHANGE_KBM_ENTITY_STATUS(rec.SUBJ_OSAGO_REC_ID); --параметр SUBJ_OSAGO_REC_ID
  END LOOP;
END;