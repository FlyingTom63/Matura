//  load data
LOAD CSV WITH HEADERS 
FROM 'file:///NODE_Shape.csv' AS line
FIELDTERMINATOR ';'
MATCH (g:ShapeGemeinde), (s:Shape)
WHERE g.BFSNr=toInteger(line.BFSNr)
  AND s.ShapeID=toInteger(line.ShapeID)
CREATE (g)<-[r:istTeilVon]-(s);
