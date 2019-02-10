//  load data
LOAD CSV WITH HEADERS 
FROM 'file:///NODE_Gemeinde.csv' AS line
FIELDTERMINATOR ';'
CREATE (
   :Gemeinde {
      name:line.Name,
      BFSNr:toInteger(line.BFSNr)}
);


//  unique constraints
CREATE CONSTRAINT ON (a:Gemeinde) ASSERT a.name IS UNIQUE;
CREATE CONSTRAINT ON (a:Gemeinde) ASSERT a.BFSNr IS UNIQUE;
