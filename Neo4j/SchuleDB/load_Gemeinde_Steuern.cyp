LOAD CSV WITH HEADERS 
FROM 'file:///Beobachter_Gemeinderating_2018.csv' AS line
FIELDTERMINATOR ';'
WITH line 
WHERE line.Label = 'STEUERBELASTUNG' AND line.Kanton = 'LU'
RETURN line;

LOAD CSV WITH HEADERS 
FROM 'file:///Beobachter_Gemeinderating_2018.csv' AS line
FIELDTERMINATOR ';'
WITH line 
WHERE line.Label = 'STEUERBELASTUNG' AND line.Kanton = 'LU'
MATCH (g:Gemeinde)
WHERE g.name = line.Gemeinde
RETURN g.name;

LOAD CSV WITH HEADERS 
FROM 'file:///Beobachter_Gemeinderating_2018.csv' AS line
FIELDTERMINATOR ';'
WITH line 
WHERE line.Label = 'STEUERBELASTUNG' AND line.Kanton = 'LU'
MATCH (g:Gemeinde)
WHERE g.name = line.Gemeinde
SET g.SteuerRankIAZIOriginal = toInteger(line.Wert);

MATCH (g:Gemeinde)
WHERE EXISTS(g.SteuerRankIAZIOriginal)
SET g.SteuerRankIAZIKorrigiert=g.SteuerRankIAZIOriginal;

MATCH (g:Gemeinde)-[r:istNachbarVon]-(a:Gemeinde)
WHERE NOT EXISTS(g.SteuerRankIAZIOriginal) AND
      NOT EXISTS(g.SteuerRankIAZIKorrigiert) AND
      EXISTS(a.SteuerRankIAZIKorrigiert)
RETURN "MATCH (g:Gemeinde) WHERE g.BFSNr=" 
       + g.BFSNr 
       + " SET g.SteuerRankIAZIKorrigiert=toInteger(" 
       + ROUND(AVG(a.SteuerRankIAZIKorrigiert))+");"

MATCH (g:Gemeinde)-[r:istNachbarVon]-(a:Gemeinde)
WHERE NOT EXISTS(g.SteuerRankIAZIOriginal) AND
      NOT EXISTS(g.SteuerRankIAZIKorrigiert) AND
      EXISTS(a.SteuerRankIAZIKorrigiert)
RETURN "MATCH (g:Gemeinde) WHERE g.BFSNr=" 
       + g.BFSNr 
       + " SET g.SteuerRankIAZIKorrigiert=toInteger(" 
       + ROUND(AVG(a.SteuerRankIAZIKorrigiert))+");"

