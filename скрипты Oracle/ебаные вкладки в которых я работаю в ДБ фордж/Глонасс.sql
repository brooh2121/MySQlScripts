--��� 680.

SELECT * FROM DTP d,USERS u
  WHERE d.DTP_ID = 680
AND d.USER_ID = u.USER_ID;

SELECT * FROM USERS u
  where u.LICENSE_PLATE = 'C197mt177' AND u.USER_ID = '115';

SELECT * FROM ACCELERATION a;

select * from dtp d;


select om.LOGIN as "������������",
tc.id as "ID �� � �� ��-�������",
comm.DATE_FROM as "���� ������ ��������",
tc.vin as "VIN",
tc.CREATION_DATE as "���� �������� ������ � ��",
st.DATETIME_ACT as "���� ������������ ��",
st.POSITION_ADRRESS as "����� ���",
st.POSITION_LATITUDE as "������ ���",
st.POSITION_LONGITUDE as "������� ���",
st.SPEED_TC as "�������� �� � ������ ���",
a.ACCELERATION_X as "��������� ��� �",
a.ACCELERATION_Y as "��������� ��� Y",
a.ACCELERATION_Z as "��������� ��� Z"

from OPERATOR_MS om
join CONTRACT_OPERATOR_MS comm on comm.OPERATOR_MS_ID=om.ID
join tc tc on tc.ID=comm.TC_ID
join STATUS_TC st on st.TC_ID=tc.id
join ACCELERATION a on a.STATUS_TC_ID=st.TC_ID
where om.ID=680
order by tc.id;
;


SELECT * FROM OPERATOR_MS om;
SELECT * FROM CONTRACT_OPERATOR_MS com;
SELECT * FROM TC t;
SELECT * FROM STATUS_TC st;
SELECT * FROM ACCELERATION a;