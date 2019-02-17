LOAD CSV WITH HEADERS 
FROM 'file:///Beobachter_Gemeinderating_2018.csv' AS line
FIELDTERMINATOR ';'
WITH line 
WHERE line.Label = 'SICHERHEIT'
  AND line.Kanton = 'LU'
RETURN line;

LOAD CSV WITH HEADERS 
FROM 'file:///Beobachter_Gemeinderating_2018.csv' AS line
FIELDTERMINATOR ';'
WITH line 
WHERE line.Label = 'SICHERHEIT' AND line.Kanton = 'LU'
MATCH (g:Gemeinde)
WHERE g.name = line.Gemeinde
RETURN g.name;

LOAD CSV WITH HEADERS 
FROM 'file:///Beobachter_Gemeinderating_2018.csv' AS line
FIELDTERMINATOR ';'
WITH line 
WHERE line.Label = 'SICHERHEIT' AND line.Kanton = 'LU'
MATCH (g:Gemeinde)
WHERE g.name = line.Gemeinde
SET g.SicherheitRankIAZIOriginal = toInteger(line.Wert);

MATCH (g:Gemeinde)
WHERE EXISTS(g.SicherheitRankIAZIOriginal)
SET g.SicherheitRankIAZIKorrigiert=g.SicherheitRankIAZIOriginal;

MATCH (g:Gemeinde)-[r:istNachbarVon]-(a:Gemeinde)
WHERE NOT EXISTS(g.SicherheitRankIAZIOriginal) AND
      NOT EXISTS(g.SicherheitRankIAZIKorrigiert) AND
      EXISTS(a.SicherheitRankIAZIKorrigiert)
RETURN "MATCH (g:Gemeinde) WHERE g.BFSNr=" 
       + g.BFSNr 
       + " SET g.SicherheitRankIAZIKorrigiert=toInteger(" 
       + ROUND(AVG(a.SicherheitRankIAZIKorrigiert))+");"

MATCH (g:Gemeinde) WHERE g.BFSNr=1021 SET g.SicherheitRankIAZIKorrigiert=toInteger(177.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1121 SET g.SicherheitRankIAZIKorrigiert=toInteger(10.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1122 SET g.SicherheitRankIAZIKorrigiert=toInteger(10.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1123 SET g.SicherheitRankIAZIKorrigiert=toInteger(10.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1022 SET g.SicherheitRankIAZIKorrigiert=toInteger(177.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1053 SET g.SicherheitRankIAZIKorrigiert=toInteger(273.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1001 SET g.SicherheitRankIAZIKorrigiert=toInteger(20.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1126 SET g.SicherheitRankIAZIKorrigiert=toInteger(10.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1127 SET g.SicherheitRankIAZIKorrigiert=toInteger(10.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1084 SET g.SicherheitRankIAZIKorrigiert=toInteger(73.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1025 SET g.SicherheitRankIAZIKorrigiert=toInteger(125.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1129 SET g.SicherheitRankIAZIKorrigiert=toInteger(10.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1004 SET g.SicherheitRankIAZIKorrigiert=toInteger(20.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1130 SET g.SicherheitRankIAZIKorrigiert=toInteger(10.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1055 SET g.SicherheitRankIAZIKorrigiert=toInteger(225.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1056 SET g.SicherheitRankIAZIKorrigiert=toInteger(273.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1005 SET g.SicherheitRankIAZIKorrigiert=toInteger(20.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1132 SET g.SicherheitRankIAZIKorrigiert=toInteger(10.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1057 SET g.SicherheitRankIAZIKorrigiert=toInteger(177.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1135 SET g.SicherheitRankIAZIKorrigiert=toInteger(10.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1091 SET g.SicherheitRankIAZIKorrigiert=toInteger(46.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1064 SET g.SicherheitRankIAZIKorrigiert=toInteger(273.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1142 SET g.SicherheitRankIAZIKorrigiert=toInteger(10.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1007 SET g.SicherheitRankIAZIKorrigiert=toInteger(17.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1039 SET g.SicherheitRankIAZIKorrigiert=toInteger(135.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1100 SET g.SicherheitRankIAZIKorrigiert=toInteger(73.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1041 SET g.SicherheitRankIAZIKorrigiert=toInteger(177.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1066 SET g.SicherheitRankIAZIKorrigiert=toInteger(189.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1145 SET g.SicherheitRankIAZIKorrigiert=toInteger(10.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1068 SET g.SicherheitRankIAZIKorrigiert=toInteger(273.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1147 SET g.SicherheitRankIAZIKorrigiert=toInteger(10.0);

MATCH (g:Gemeinde)-[r:istNachbarVon]-(a:Gemeinde)
WHERE NOT EXISTS(g.SicherheitRankIAZIOriginal) AND
      NOT EXISTS(g.SicherheitRankIAZIKorrigiert) AND
      EXISTS(a.SicherheitRankIAZIKorrigiert)
RETURN "MATCH (g:Gemeinde) WHERE g.BFSNr=" 
       + g.BFSNr 
       + " SET g.SicherheitRankIAZIKorrigiert=toInteger(" 
       + ROUND(AVG(a.SicherheitRankIAZIKorrigiert))+");"

MATCH (g:Gemeinde) WHERE g.BFSNr=1131 SET g.SicherheitRankIAZIKorrigiert=toInteger(10.0);
