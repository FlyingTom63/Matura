//  load data
LOAD CSV WITH HEADERS 
FROM 'file:///NODE_ShapeGemeinde.csv' AS line
FIELDTERMINATOR ';'
CREATE (
   :ShapeGemeinde {
      name:line.Name,
      BFSNr:toInteger(line.BFSNr)}
);


//  unique constraints
CREATE CONSTRAINT ON (a:Gemeinde) ASSERT a.name IS UNIQUE;
CREATE CONSTRAINT ON (a:Gemeinde) ASSERT a.BFSNr IS UNIQUE;

//  checks

LOAD CSV WITH HEADERS 
FROM 'file:///NODE_ShapeGemeinde.csv' AS line
FIELDTERMINATOR ';'
RETURN COUNT(*);
// = 83 

