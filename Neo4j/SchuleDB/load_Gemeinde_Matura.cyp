LOAD CSV WITH HEADERS 
FROM 'file:///BDA6_SCHULE_Gemeinden_Matura.csv' AS line
FIELDTERMINATOR ','
MATCH (g:Gemeinde)
WHERE g.BFSNr=toInteger(line.GemeindeNummer)
SET g.MaturaQuote=toFloat(line.MaturaQuote),
    g.MaturaNote=toFloat(line.NoteDurchschnitt);