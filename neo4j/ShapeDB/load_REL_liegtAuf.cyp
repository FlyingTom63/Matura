LOAD CSV WITH HEADERS 
FROM 'file:///NODE_ShapeNode.csv' AS line
FIELDTERMINATOR ';'
MATCH (a:Koordinate), (b:ShapeNode)
WHERE a.name=line.Name
  AND b.ShapeNodeID=toInteger(line.RowNumber)
CREATE (a)<-[r:liegtAuf]-(b);