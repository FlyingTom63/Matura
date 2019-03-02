MATCH (r:Region) 
SET   r.RegionKuerzel=
      CASE r.RegionCode
         WHEN 1 THEN 'LUZ'
         WHEN 2 THEN 'AGK'
         WHEN 3 THEN 'AGG'
         WHEN 4 THEN 'ROR'
         WHEN 5 THEN 'SUR'
         WHEN 6 THEN 'MIC'
         WHEN 7 THEN 'WIG'
         WHEN 8 THEN 'WIL'
         WHEN 9 THEN 'ENT'
         WHEN 10 THEN 'ROW'
         WHEN 11 THEN 'SEE'
      END;