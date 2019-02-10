//  load data
LOAD CSV WITH HEADERS 
FROM 'file:///NODE_UferpunkteTemp.csv' AS line
FIELDTERMINATOR ';'
CREATE (
   :UferpunktTemp {
      UferpunktID:toInteger(line.UferpunktID),
      X:toFloat(line.X),
      Y:toFloat(line.Y),
      SeeuferSteigung:toFloat(line.SeeuferSteigung),
      SeeSeite:line.SeeSeite,
      SeeName:line.SeeName,
      Gemeinde1:line.Gemeinde1,
      Gemeinde2:line.Gemeinde2}
);


//  unique constraints
CREATE CONSTRAINT ON (a:UferpunktTemp) ASSERT a.UferpunktID IS UNIQUE;
