//  load data

LOAD CSV WITH HEADERS 
FROM 'file:///REL_bildetShape.csv' AS line
FIELDTERMINATOR ';'
MATCH (von:ShapeNode), (nach:ShapeNode)
WHERE von.KoordinateName=line.Koordinate
  AND von.ShapeID=toInteger(line.ShapeID)
  AND nach.KoordinateName=line.NaechsteKoordinate
  AND nach.ShapeID=toInteger(line.ShapeID)
CREATE (von)-[r:bildetShape]->(nach);

//  Checks

LOAD CSV WITH HEADERS 
FROM 'file:///Rel_bildetShape.csv' AS line
FIELDTERMINATOR ';'
MATCH (von:ShapeKoordinate), (nach:ShapeKoordinate)
WHERE von.name=line.Koordinate
  AND nach.name=line.NaechsteKoordinate
  AND von.ShapeID=nach.ShapeID
  AND von.ShapeID=toInteger(line.ShapeID)
RETURN COUNT(*);
// 71761
