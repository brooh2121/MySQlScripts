select * from report.ins_company;

select * from report.dtp_notice_request_data where vin = 'XW8ZZZ4MXJG002334';
select * from report.dtp_notice_response_data;
select * from report.process_jour where create_date >= date_trunc('day',current_date);

select * from report.ins_company;

select * from mp.mobile_app;