//  load data

LOAD CSV WITH HEADERS 
FROM 'file:///REL_bildetShape.csv' AS line
FIELDTERMINATOR ';'
MATCH (von:ShapeNode), (nach:ShapeNode)
WHERE von.KoordinateName=line.Koordinate
  AND von.ShapeID=toInteger(line.ShapeID)
  AND nach.KoordinateName=line.NaechsteKoordinate
  AND nach.ShapeID=toInteger(line.ShapeID)
CREATE (von)-[r:bildetShapeMit]->(nach);