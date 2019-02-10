MATCH (k:Koordinate)<-[r1:liegtAuf]-(n:ShapeNode)<-[r2:hatEckpunkt]-(s:Shape)-[r3:istTeilVon]->(g:Gemeinde),
      (u:UferpunktTemp)
WHERE k.X < u.X + 20 AND k.X > u.X - 20
  AND k.Y < u.Y + 20 AND k.Y > u.Y - 25
RETURN u.UferpunktID, 
       MAX(k.name) AS Koordinate, 
       u.Gemeinde1 AS Gemeinde1_Temp,
       u.Gemeinde2 AS Gemeinde2_Temp,
       MIN(g.name) AS Gemeinde1,
       MAX(g.name) AS Gemeinde2
ORDER BY u.UferpunktID;