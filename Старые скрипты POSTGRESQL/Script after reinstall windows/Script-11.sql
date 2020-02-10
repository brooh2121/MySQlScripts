select
d.dtp_id,
user_information,
photo_relative_position_1,
photo_relative_position_2,
photo_relative_position_3,
gps_position_width,
gps_position_longitude,
position_adrress,
date_dtp,
date_send_data,
photo_closeup,
photo_general
from glonass.dtp d
join glonass.dtp_damaged_part ddp on ddp.dtp_id = d.dtp_id
--join glonass.other_photos op on d.dtp_id = op.dtp_id
where d.dtp_id = '86';
--union all
select
d.dtp_id,
user_information,
photo_relative_position_1,
photo_relative_position_2,
photo_relative_position_3,
gps_position_width,
gps_position_longitude,
position_adrress,
date_dtp,
date_send_data,
other_photo
from glonass.dtp d
join glonass.other_photos op on d.dtp_id = op.dtp_id
where d.dtp_id = '86'
;

select * from glonass.dtp_files where file_id in (
1366,
1378,
1379,
1323,
1321,
1319,
1317,
1315,
1312,
1310,
1308,
1340,
1338,
1336,
1334,
1332,
1330,
1328,
1323,
1321,
1319,
1317,
1315,
1312,
1310,
1308,
1340,
1338,
1336,
1334,
1332,
1330,
1328
);

select * from glonass.tc;

select * from glonass.other_photos where dtp_id = 86;

select * from glonass.dtp_damaged_part where dtp_id = 86;