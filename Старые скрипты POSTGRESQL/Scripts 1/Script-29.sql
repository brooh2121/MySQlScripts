select ic.* from rsa_epg_web.ins_company_distribution icd
join rsa_epg_web.ins_company ic on icd.ins_company_id = ic.ins_company_id
where distribution_code = 2;
