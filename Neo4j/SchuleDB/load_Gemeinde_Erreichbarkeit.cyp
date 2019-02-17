LOAD CSV WITH HEADERS 
FROM 'file:///Beobachter_Gemeinderating_2018.csv' AS line
FIELDTERMINATOR ';'
WITH line 
WHERE line.Label = 'ERREICHBARKEIT' AND line.Kanton = 'LU'
RETURN line;

LOAD CSV WITH HEADERS 
FROM 'file:///Beobachter_Gemeinderating_2018.csv' AS line
FIELDTERMINATOR ';'
WITH line 
WHERE line.Label = 'ERREICHBARKEIT' AND line.Kanton = 'LU'
MATCH (g:Gemeinde)
WHERE g.name = line.Gemeinde
RETURN g.name;

LOAD CSV WITH HEADERS 
FROM 'file:///Beobachter_Gemeinderating_2018.csv' AS line
FIELDTERMINATOR ';'
WITH line 
WHERE line.Label = 'ERREICHBARKEIT' AND line.Kanton = 'LU'
MATCH (g:Gemeinde)
WHERE g.name = line.Gemeinde
SET g.ErreichbarkeitRankIAZIOriginal = toInteger(line.Wert);

MATCH (g:Gemeinde)
WHERE EXISTS(g.ErreichbarkeitRankIAZIOriginal)
SET g.ErreichbarkeitRankIAZIKorrigiert=g.ErreichbarkeitRankIAZIOriginal;

MATCH (g:Gemeinde)-[r:istNachbarVon]-(a:Gemeinde)
WHERE NOT EXISTS(g.ErreichbarkeitRankIAZIOriginal) AND
      NOT EXISTS(g.ErreichbarkeitRankIAZIKorrigiert) AND
      EXISTS(a.ErreichbarkeitRankIAZIKorrigiert)
RETURN "MATCH (g:Gemeinde) WHERE g.BFSNr=" 
       + g.BFSNr 
       + " SET g.ErreichbarkeitRankIAZIKorrigiert=toInteger(" 
       + ROUND(AVG(a.ErreichbarkeitRankIAZIKorrigiert))+");"

MATCH (g:Gemeinde) WHERE g.BFSNr=1021 SET g.ErreichbarkeitRankIAZIKorrigiert=toInteger(812.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1121 SET g.ErreichbarkeitRankIAZIKorrigiert=toInteger(855.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1122 SET g.ErreichbarkeitRankIAZIKorrigiert=toInteger(745.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1123 SET g.ErreichbarkeitRankIAZIKorrigiert=toInteger(480.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1022 SET g.ErreichbarkeitRankIAZIKorrigiert=toInteger(812.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1053 SET g.ErreichbarkeitRankIAZIKorrigiert=toInteger(513.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1001 SET g.ErreichbarkeitRankIAZIKorrigiert=toInteger(834.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1126 SET g.ErreichbarkeitRankIAZIKorrigiert=toInteger(585.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1127 SET g.ErreichbarkeitRankIAZIKorrigiert=toInteger(663.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1084 SET g.ErreichbarkeitRankIAZIKorrigiert=toInteger(807.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1025 SET g.ErreichbarkeitRankIAZIKorrigiert=toInteger(833.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1129 SET g.ErreichbarkeitRankIAZIKorrigiert=toInteger(829.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1004 SET g.ErreichbarkeitRankIAZIKorrigiert=toInteger(852.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1130 SET g.ErreichbarkeitRankIAZIKorrigiert=toInteger(850.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1055 SET g.ErreichbarkeitRankIAZIKorrigiert=toInteger(594.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1056 SET g.ErreichbarkeitRankIAZIKorrigiert=toInteger(817.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1005 SET g.ErreichbarkeitRankIAZIKorrigiert=toInteger(848.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1132 SET g.ErreichbarkeitRankIAZIKorrigiert=toInteger(884.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1057 SET g.ErreichbarkeitRankIAZIKorrigiert=toInteger(726.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1135 SET g.ErreichbarkeitRankIAZIKorrigiert=toInteger(892.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1091 SET g.ErreichbarkeitRankIAZIKorrigiert=toInteger(753.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1064 SET g.ErreichbarkeitRankIAZIKorrigiert=toInteger(521.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1142 SET g.ErreichbarkeitRankIAZIKorrigiert=toInteger(745.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1007 SET g.ErreichbarkeitRankIAZIKorrigiert=toInteger(847.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1039 SET g.ErreichbarkeitRankIAZIKorrigiert=toInteger(806.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1100 SET g.ErreichbarkeitRankIAZIKorrigiert=toInteger(834.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1041 SET g.ErreichbarkeitRankIAZIKorrigiert=toInteger(812.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1066 SET g.ErreichbarkeitRankIAZIKorrigiert=toInteger(646.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1145 SET g.ErreichbarkeitRankIAZIKorrigiert=toInteger(868.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1068 SET g.ErreichbarkeitRankIAZIKorrigiert=toInteger(817.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1147 SET g.ErreichbarkeitRankIAZIKorrigiert=toInteger(323.0);

MATCH (g:Gemeinde)-[r:istNachbarVon]-(a:Gemeinde)
WHERE NOT EXISTS(g.ErreichbarkeitRankIAZIOriginal) AND
      NOT EXISTS(g.ErreichbarkeitRankIAZIKorrigiert) AND
      EXISTS(a.ErreichbarkeitRankIAZIKorrigiert)
RETURN "MATCH (g:Gemeinde) WHERE g.BFSNr=" 
       + g.BFSNr 
       + " SET g.ErreichbarkeitRankIAZIKorrigiert=toInteger(" 
       + ROUND(AVG(a.ErreichbarkeitRankIAZIKorrigiert))+");"

MATCH (g:Gemeinde) WHERE g.BFSNr=1131 SET g.ErreichbarkeitRankIAZIKorrigiert=toInteger(720.0);