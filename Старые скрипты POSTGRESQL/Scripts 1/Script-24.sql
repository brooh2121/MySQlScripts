select * from rsamsipg.public.ins_company ic where lower(ins_company) = lower('�������');

-- ��������� ����������� ������������ � �� ������ ��������� �����������
-- ����� ������������ � ������
-- ������-���� ������������ � ����-�����������
-- ����� ������������ � ������������
-- �������� ������������ � ������
-- ������������ ��������� ������ ������������ � �������� �����������
-- ������� ����� ������������ � �������
-- ��� ������������ � ������������ ��������� ������
-- �����. ����������� ��������� ���������� ������������ � ����
-- ���� ������������ � ����-����

-- ������� �� ����� �� ��� ���������

select * from rsamsipg.public.ins_company ic where ins_company_id = '1079';

select max(ins_company_id) from rsamsipg.public.ins_company ic;

select * from rsamsipg.public.ins_company ic where insurer_id = '70000086';

insert into rsamsipg.public.ins_company (
ins_company_id,
ins_company,
insurer_id,
is_insurer,
start_date,
end_date,
number_company_egrssd,
inn,
kpp,
create_date,
change_date
)
values (
1097,
'����� ��',
'70000093',
1,
current_date,
current_date,
0000,
'7803034240',
0000,
current_date,
current_date
);

commit;

select * from ins_company order by insurer_id;
select * from "USER";
select * from role_access_data_msi;
select * from user_role;
select * from ins