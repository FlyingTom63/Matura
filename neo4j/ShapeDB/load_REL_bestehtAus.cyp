LOAD CSV WITH HEADERS 
FROM 'file:///NODE_ShapeNode.csv' AS line
FIELDTERMINATOR ';'
MATCH (a:Shape), (b:ShapeNode)
WHERE a.ShapeID=toInteger(line.ShapeID)
  AND b.ShapeNodeID=toInteger(line.RowNumber)
CREATE (a)<-[r:bestehtAus]-(b);