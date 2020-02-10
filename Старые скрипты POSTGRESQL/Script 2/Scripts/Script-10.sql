select
  'D:\doc_folder\'||folder_level_1||'\'||folder_level_2||'\'||folder_level_3 as filepath,
  uuid, file_name as file_name, mime_type, file_size
from rsa_epg_fs.metainfo where uuid in (
'70939746-5371-43a4-b7ac-1f7083255421',
'037f4146-e4a2-4667-8600-e4268365d7a9',
'492b6429-9d29-4773-b0e5-c8a06528d600',
'0a612af8-5512-440a-8ee7-d0033fbe1dfa'
);
--где S: - \\172.19.3.45\doc_folder
