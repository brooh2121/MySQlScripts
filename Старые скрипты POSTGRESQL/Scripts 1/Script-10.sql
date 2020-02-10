SELECT ae_prices.price
FROM rsa_prices_10.ae_prices
JOIN rsa_prices_10.ae_spares ON ae_spares.id = ae_prices.spare_id
JOIN rsa_prices_10.ae_mfa_aliases ON ae_mfa_aliases.mfa_id = ae_spares.manufacturer_id
JOIN rsa_prices_10.ae_regions ON ae_regions.raion_id = ae_prices.raion_id
WHERE
       ae_mfa_aliases.name = UPPER('√‡Á')
       AND ae_spares.search = '27056300015'
       AND ae_regions.code = 77;