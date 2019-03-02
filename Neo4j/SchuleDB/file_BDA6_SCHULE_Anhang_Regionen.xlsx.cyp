MATCH  (r:Region)
RETURN r.RegionCode AS RegionCode,
       r.name AS RegionName,
       r.RegionKuerzel AS RegionKuerzel
ORDER BY r.RegionCode