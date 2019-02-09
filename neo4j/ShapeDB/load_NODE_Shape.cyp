//  load data
LOAD CSV WITH HEADERS 
FROM 'file:///NODE_Shape.csv' AS line
FIELDTERMINATOR ';'
CREATE (
   :Shape {
      name:'Shape-' + line.ShapeID,
      ShapeID:toInteger(line.ShapeID),
      Length:toFloat(line.Length),
      Area:toFloat(line.Area)}
);


//  unique constraints
CREATE CONSTRAINT ON (a:Shape) ASSERT a.name IS UNIQUE;
CREATE CONSTRAINT ON (a:Shape) ASSERT a.ShapeID IS UNIQUE;

//  checks

LOAD CSV WITH HEADERS 
FROM 'file:///NODE_Shape.csv' AS line
FIELDTERMINATOR ';'
RETURN COUNT(*);
// = 89  

