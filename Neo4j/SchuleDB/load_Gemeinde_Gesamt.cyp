LOAD CSV WITH HEADERS 
FROM 'file:///Beobachter_Gemeinderating_2018.csv' AS line
FIELDTERMINATOR ';'
WITH line 
WHERE line.Label = 'RANG'
  AND line.Kanton = 'LU'
RETURN line;

LOAD CSV WITH HEADERS 
FROM 'file:///Beobachter_Gemeinderating_2018.csv' AS line
FIELDTERMINATOR ';'
WITH line 
WHERE line.Label = 'RANG' AND line.Kanton = 'LU'
MATCH (g:Gemeinde)
WHERE g.name = line.Gemeinde
RETURN g.name;

LOAD CSV WITH HEADERS 
FROM 'file:///Beobachter_Gemeinderating_2018.csv' AS line
FIELDTERMINATOR ';'
WITH line 
WHERE line.Label = 'RANG' AND line.Kanton = 'LU'
MATCH (g:Gemeinde)
WHERE g.name = line.Gemeinde
SET g.GesamtRankIAZIOriginal = toInteger(line.Wert);

MATCH (g:Gemeinde)
WHERE EXISTS(g.GesamtRankIAZIOriginal)
SET g.GesamtRankIAZIKorrigiert=g.GesamtRankIAZIOriginal;

MATCH (g:Gemeinde)-[r:istNachbarVon]-(a:Gemeinde)
WHERE NOT EXISTS(g.GesamtRankIAZIOriginal) AND
      NOT EXISTS(g.GesamtRankIAZIKorrigiert) AND
      EXISTS(a.GesamtRankIAZIKorrigiert)
RETURN "MATCH (g:Gemeinde) WHERE g.BFSNr=" 
       + g.BFSNr 
       + " SET g.GesamtRankIAZIKorrigiert=toInteger(" 
       + ROUND(AVG(a.GesamtRankIAZIKorrigiert))+");"

MATCH (g:Gemeinde) WHERE g.BFSNr=1021 SET g.GesamtRankIAZIKorrigiert=toInteger(316.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1121 SET g.GesamtRankIAZIKorrigiert=toInteger(753.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1122 SET g.GesamtRankIAZIKorrigiert=toInteger(610.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1123 SET g.GesamtRankIAZIKorrigiert=toInteger(623.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1022 SET g.GesamtRankIAZIKorrigiert=toInteger(316.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1053 SET g.GesamtRankIAZIKorrigiert=toInteger(316.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1001 SET g.GesamtRankIAZIKorrigiert=toInteger(734.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1126 SET g.GesamtRankIAZIKorrigiert=toInteger(742.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1127 SET g.GesamtRankIAZIKorrigiert=toInteger(622.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1084 SET g.GesamtRankIAZIKorrigiert=toInteger(266.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1025 SET g.GesamtRankIAZIKorrigiert=toInteger(458.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1129 SET g.GesamtRankIAZIKorrigiert=toInteger(767.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1004 SET g.GesamtRankIAZIKorrigiert=toInteger(700.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1130 SET g.GesamtRankIAZIKorrigiert=toInteger(746.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1055 SET g.GesamtRankIAZIKorrigiert=toInteger(514.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1056 SET g.GesamtRankIAZIKorrigiert=toInteger(148.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1005 SET g.GesamtRankIAZIKorrigiert=toInteger(637.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1132 SET g.GesamtRankIAZIKorrigiert=toInteger(799.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1057 SET g.GesamtRankIAZIKorrigiert=toInteger(559.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1135 SET g.GesamtRankIAZIKorrigiert=toInteger(705.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1091 SET g.GesamtRankIAZIKorrigiert=toInteger(477.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1064 SET g.GesamtRankIAZIKorrigiert=toInteger(344.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1142 SET g.GesamtRankIAZIKorrigiert=toInteger(610.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1007 SET g.GesamtRankIAZIKorrigiert=toInteger(717.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1039 SET g.GesamtRankIAZIKorrigiert=toInteger(338.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1100 SET g.GesamtRankIAZIKorrigiert=toInteger(740.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1041 SET g.GesamtRankIAZIKorrigiert=toInteger(316.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1066 SET g.GesamtRankIAZIKorrigiert=toInteger(524.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1145 SET g.GesamtRankIAZIKorrigiert=toInteger(733.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1068 SET g.GesamtRankIAZIKorrigiert=toInteger(148.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1147 SET g.GesamtRankIAZIKorrigiert=toInteger(712.0);

MATCH (g:Gemeinde)-[r:istNachbarVon]-(a:Gemeinde)
WHERE NOT EXISTS(g.GesamtRankIAZIOriginal) AND
      NOT EXISTS(g.GesamtRankIAZIKorrigiert) AND
      EXISTS(a.GesamtRankIAZIKorrigiert)
RETURN "MATCH (g:Gemeinde) WHERE g.BFSNr=" 
       + g.BFSNr 
       + " SET g.GesamtRankIAZIKorrigiert=toInteger(" 
       + ROUND(AVG(a.GesamtRankIAZIKorrigiert))+");"

MATCH (g:Gemeinde) WHERE g.BFSNr=1131 SET g.GesamtRankIAZIKorrigiert=toInteger(706.0);
