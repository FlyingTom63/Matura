//  load data
LOAD CSV WITH HEADERS 
FROM 'file:///NODE_Koordinate.csv' AS line
FIELDTERMINATOR ';'
CREATE (:Koordinate {name:line.Name, 
                     KoordinateID:toInteger(line.KoordinateID),
                     X:toFloat(line.X),
                     Y:toFloat(line.Y)});


//  unique constraints
CREATE CONSTRAINT ON (a:Koordinate) ASSERT a.name IS UNIQUE;
CREATE CONSTRAINT ON (a:Koordinate) ASSERT a.KoordinateID IS UNIQUE;
