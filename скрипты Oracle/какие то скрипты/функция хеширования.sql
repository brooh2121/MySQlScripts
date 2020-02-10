--region ХЭШирование 
  SELECT UPPER(PK_HASH.STR2HEX(PK_HASH.GOST_R34_11_94(CONVERT(NORMALIZESTR(
--endregion 

  'Наумкина Валерия Юрьевна 13.02.1983'

--region .  
  ), 'UTF8')))) AS "ХЭШ" FROM DUAL d ;  

--endregion


