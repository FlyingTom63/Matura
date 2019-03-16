LOAD CSV WITH HEADERS 
FROM 'file:///je-d-21.03.01_nur_LU.csv' AS line
FIELDTERMINATOR ';'
MATCH (g:Gemeinde)
WHERE g.BFSNr = toInteger(line.Gemeindecode)
SET g.AuslaenderAnteil = toFloat(replace(line.Auslaenderanteil,',','.'))