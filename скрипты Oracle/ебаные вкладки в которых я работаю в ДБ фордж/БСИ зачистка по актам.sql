SELECT 
  MAX(REPORT_ID) 
  FROM rsa_tprep.bsi_01_report_meta;

DELETE FROM RSA_TPREP.BSI_01_REPORT_META brm WHERE brm.REPORT_ID = 50;

COMMIT;

SELECT * FROM RSA_TPREP.BSI_01_REPORT_BAD_POLICY brbp WHERE brbp.REPORT_ID = (SELECT MAX(REPORT_ID) FROM rsa_tprep.bsi_01_report_meta);

SELECT * FROM RSA_TPREP.BSI_01_REPORT_POLICY_160517 brp WHERE brp.REPORT_ID = (SELECT MAX(REPORT_ID) FROM rsa_tprep.bsi_01_report_meta);

SELECT * FROM RSA_TPREP.BSI_01_REPORT_BAD_LOSS brbl WHERE brbl.REPORT_ID = (SELECT MAX(REPORT_ID) FROM rsa_tprep.bsi_01_report_meta);

SELECT * FROM RSA_TPREP.BSI_01_REPORT_LOSS_160517 brl WHERE brl.report_id = (SELECT MAX(REPORT_ID) FROM rsa_tprep.bsi_01_report_meta);


WITH frst AS
  (SELECT pk.INS_COMPANY_ID,
          pk.INS_COMP_POLICY_ID,
          MAX(pk.POLICY_REC_ID) mpri
      FROM POLICY_KASKO@DBL_ONL_BSI.RSA.LOCAL pk
      WHERE pk.RECALL_POLICY_UNQ_ID = 0
        AND pk.IS_TECH_COR = 0
        AND pk.RECALL_ADD_AGR_REC_ID = 0
        AND pk.is_secret = 0
      GROUP BY pk.INS_COMPANY_ID,
               pk.INS_COMP_POLICY_ID),
  secnd AS
  (SELECT ppj.INS_COMPANY_ID,
          ic.INSURER_ID,
          ic.INS_COMPANY,
          ppj.INS_COMP_POLICY_ID,
          ppj.POLICY_NUMBER,
          ppj.REQ_STATUS_ID,
          ppj.HAS_VALIDATION_ERROR,
          ppe.ERROR_ID,
          ppj.POLICY_REC_ID,
          ppj.POLICY_AGGR_ID
      FROM POLICY_PROCESS_JOUR@DBL_ONL_BSI.RSA.LOCAL ppj
        INNER JOIN frst fr
          ON fr.mpri = ppj.POLICY_REC_ID
        LEFT JOIN POLICY_PROCESS_ERR@DBL_ONL_BSI.RSA.LOCAL ppe
          ON ppj.POLICY_PROC_ID = ppe.POLICY_PROC_ID
        INNER JOIN INS_COMPANY@DBL_ONL_BSI.RSA.LOCAL ic ON ppj.INS_COMPANY_ID = ic.INS_COMPANY_ID
        join POLICY_KASKO@DBL_ONL_BSI.RSA.LOCAL pk ON fr.mpri = pk.policy_rec_id
      WHERE ppj.PROC_END_DATE >= to_date('01.01.2018') and ppj.PROC_END_DATE < to_date('02.01.2018')
        AND pk.POLICY_CREATE_DATE >= to_date('01.08.2015')
        and pk.RECALL_POLICY_UNQ_ID = 0
        AND pk.IS_TECH_COR = 0
        AND pk.is_secret = 0
        AND pk.RECALL_ADD_AGR_REC_ID = 0
        AND fr.INS_COMPANY_ID||fr.INS_COMP_POLICY_ID not IN(SELECT brbp.ins_company_id||brbp.ins_comp_policy_id FROM BSI_01_REPORT_BAD_POLICY brbp)
)

SELECT *
FROM secnd s;