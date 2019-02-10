MATCH (c:Gemeinde)<-[g:istTeilVon]-(a:Shape)<-[r:bestehtAus]-(b:ShapeNode)-[l:bildetShape]->()
RETURN a.ShapeID AS ShapeID, 
       c.name AS Gemeinde,
       COUNT(DISTINCT(b)) AS AnzahlNodes,
       COUNT(DISTINCT(l)) AS AnzahlKanten,
       ROUND(SUM(l.Length)) AS LaengeKanten, 
       ROUND(a.Length) AS LaengeShape, 
       ROUND(SUM(l.Length))-ROUND(a.Length) AS LaengeDiff 
ORDER BY a.ShapeID;