select distinct length(code) from rsa_eosago.street;

select * from rsa_eosago.nsi_vehicle_category;
select * from rsa_eosago.nsi_vehicle_type nvt;
select * from rsa_eosago.nsi_vehicle_prod nvp;
select * from rsa_eosago.nsi_use_tc;

select * from rsa_eosago.policy_process_jour ppj where ppj.ins_comp_draft_policy_id = '1554281761' order by ppj.proc_queue_date;

select * from rsa_eosago.ins_company_risk_group where ins_company_id = 20;

--update rsa_eosago.ins_company_risk_group set nsi_risk_group_id = 2 where ins_company_risk_group_id = '472';

select * from rsa_eosago.ins_request_jour irj where irj.ins_req_jour_id = '1511448682';
select
*
from rsa_eosago.check_owner_request_jour corj 
join rsa_eosago.check_request_jour crj on corj.check_req_id = crj.check_req_id
where crj.ins_req_jour_id = '1511448682';

select * from rsa_eosago.ins_company_risk_group where ins_company_id = '206';
select * from rsa_eosago.ins_company where ins_company_id = '206';

select * from rsa_eosago.INS_COMPANY_CHARACT where ins_company_id = 206;
--update rsa_eosago.ins_company_risk_group set nsi_risk_group_id = 2 where ins_company_risk_group_id = '627';
--commit;
select * from rsa_eosago.policy_process_jour ppj where policy_proc_id in (
select policy_proc_id from rsa_eosago.epolicy e where e.is_trans_car = 1 and policy_state_id = 3 and policy_create_date >= trunc(sysdate,'mm')
);