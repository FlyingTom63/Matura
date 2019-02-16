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

MATCH (g:Gemeinde)<-[r3:istTeilVon]-
      (s:Shape)-[r1:hatEckpunkt]->
      (n:ShapeNode)-[r2:liegtAuf]->(k:Koordinate),
      (n:ShapeNode)-[r4:bildetShapeMit]->(m:ShapeNode)-[r5:liegtAuf]->(k2:Koordinate)
WHERE EXISTS(k.UferpunktID)
RETURN k.UferpunktID AS UferpunkID,
       g.name AS Gemeinde,
       s.ShapeID AS ShapeID,
       k.name + ' / ' + k2.name AS Koordinate,
       (r4.Slope > k.SeeuferSteigung AND k.SeeSeite = '+') 
         OR
         (r4.Slope < k.SeeuferSteigung AND k.SeeSeite = '-') 
       AS imSee,
       k.SeeuferSteigung, k.SeeSeite, ROUND(r4.Slope*100)/100
ORDER BY k.UferpunktID,
         g.name,
         s.ShapeID;