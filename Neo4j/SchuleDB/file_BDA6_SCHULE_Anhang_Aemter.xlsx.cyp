MATCH  (a:Amt)
RETURN a.name AS AmtName,
       a.AmtKuerzel AS AmtKuerzel
ORDER BY a.name