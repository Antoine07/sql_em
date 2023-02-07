SELECT 
    UPPER(name) as NameUpperPilot,
    LOWER(name) as NameLowerPilot,
    SUBSTRING(name, 1, 2) as NameSubPilot,
    LENGTH(name) as LnNamePilot,
    REPLACE(name, 'e', 'A') as ReplaceNamePilot
FROM pilots;