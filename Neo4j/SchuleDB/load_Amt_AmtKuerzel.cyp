MATCH  (r:Amt)
SET r.AmtKuerzel=
    CASE r.name
       WHEN 'Amt Entlebuch' THEN 'EN'
       WHEN 'Amt Sursee' THEN 'SU'
       WHEN 'Amt Hochdorf' THEN 'HO'
       WHEN 'Amt Luzern' THEN 'LU'
       WHEN 'Amt Willisau' THEN 'WI'
    END;