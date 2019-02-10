//  load data
LOAD CSV WITH HEADERS 
FROM 'file:///NODE_ShapeNode.csv' AS line
FIELDTERMINATOR ';'
CREATE (a:ShapeNode {name:line.ShapeID + ' / ' + line.Name,
                     ShapeNodeID:toInteger(line.RowNumber),
                     ShapeID:toInteger(line.ShapeID),
                     KoordinateName:line.Name});


//  unique constraints
CREATE CONSTRAINT ON (a:ShapeNode) ASSERT a.name IS UNIQUE;
CREATE CONSTRAINT ON (a:ShapeNode) ASSERT a.ShapeNodeID IS UNIQUE;

CREATE INDEX ON :ShapeNode(KoordinateName);
