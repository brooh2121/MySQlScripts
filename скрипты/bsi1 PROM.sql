/*
BEGIN 
  PKG_ANTI_FRAUD_DISMAS.FIND_FRAUDS(TRUNC(SYSDATE) - 1, TRUNC(SYSDATE)); 
END;
*/
select * from bsi1.check_info_req_jour where complete_date >= trunc(sysdate);
select * from bsi1.anti_fraud_checking_jour order by beg_date desc;

select * from bsi1.check_info_jour order by create_date desc;

select * from bsi1.log_anti_fraud_checking lafc /*where log_time >= to_date('09.09.2019','dd.mm.yyyy') and log_time <= to_date('10.09.2019','dd.mm.yyyy')*/ order by log_time desc;

select * from bsi1.log_anti_fraud_checking lafc order by log_time desc;

select * from bsi1.ins_company where lower(ins_company) like '%витал%';

--1028	ВИТАЛ-Полис	70000027

select * from bsi1.ins_request_jour where ins_company_id = 1028 and beg_date >= trunc(sysdate,'mm');