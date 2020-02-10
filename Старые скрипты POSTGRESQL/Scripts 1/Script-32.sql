insert into rsa_epg_web.vacant_policy_counter_jour_prtbck
select distinct vpcj.* from rsa_epg_web.vacant_policy_counter vpc
join rsa_epg_web.vacant_policy_counter_jour vpcj on vpcj.vacant_policy_counter_id = vpc.vacant_policy_counter_id
where vpc.ins_company_id = 274
and vpc.is_used = 0;

insert into rsa_epg_web.vacant_policy_counter_prtbck  
select * from rsa_epg_web.vacant_policy_counter vpc
where vpc.ins_company_id = 274
and vpc.is_used = 0;

commit;

delete from rsa_epg_web.vacant_policy_counter_jour vpj
where vpj.vacant_policy_counter_jour_id in (select vpjbck.vacant_policy_counter_jour_id from rsa_epg_web.vacant_policy_counter_jour_prtbck vpjbck)
;

delete from rsa_epg_web.vacant_policy_counter vpc
where vpc.vacant_policy_counter_id in (select vpcbck.vacant_policy_counter_id from rsa_epg_web.vacant_policy_counter_prtbck vpcbck) 
;