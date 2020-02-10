SELECT d.distribution_code
          ,d.ins_company_id
          ,ic.ins_company
          ,d.amount_policy_garant
          ,c_used.cnt cnt_used
          ,c_free.cnt cnt_free
          ,MAX(CEIL(c_used.cnt / d.amount_policy_garant)) over(PARTITION BY d.distribution_code) max_ceil_by_dc
          ,(c_free.cnt + c_used.cnt - MAX(CEIL(c_used.cnt / d.amount_policy_garant))
            over(PARTITION BY d.distribution_code) * d.amount_policy_garant) delta_cnt_free
      FROM ins_company_distribution d
      JOIN (SELECT c.distribution_code, c.ins_company_id, COUNT(1) cnt
              FROM vacant_policy_counter c
             WHERE c.is_used = 1
             GROUP BY c.distribution_code, c.ins_company_id) c_used
        ON c_used.distribution_code = d.distribution_code
       AND c_used.ins_company_id = d.ins_company_id
      JOIN (SELECT c.distribution_code, c.ins_company_id, COUNT(1) cnt
              FROM vacant_policy_counter c
             WHERE c.is_used = 0
             GROUP BY c.distribution_code, c.ins_company_id) c_free
        ON c_free.distribution_code = d.distribution_code
       AND c_free.ins_company_id = d.ins_company_id
      JOIN ins_company ic
        ON ic.ins_company_id = d.ins_company_id
     WHERE d.ins_company_id != 213
     ORDER BY d.distribution_code, CEIL(c_used.cnt / d.amount_policy_garant) DESC;
     
    select * from rsa_epg_web.ins_company where ins_company_id = '213';
   
   
   