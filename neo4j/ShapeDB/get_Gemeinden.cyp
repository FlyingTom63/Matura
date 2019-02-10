MATCH (c:Gemeinde)<-[g:istTeilVon]-(a:Shape)<-[r:bestehtAus]-(b:ShapeNode)-[l:bildetShape]->()
RETURN c.name AS Gemeinde,
       COUNT(DISTINCT(a)) AS AnzahlShapes,
       COUNT(DISTINCT(b)) AS AnzahlNodes,
       COUNT(DISTINCT(l)) AS AnzahlKanten,
       ROUND(SUM(l.Length)) AS LaengeKanten,
       ROUND(SUM(DISTINCT(l.Length))) AS LaengeShapes,
       ROUND(SUM(l.Length))-ROUND(SUM(DISTINCT(l.Length))) AS LaengeDiff
ORDER BY c.name;
