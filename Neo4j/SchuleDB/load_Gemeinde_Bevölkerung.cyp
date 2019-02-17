LOAD CSV WITH HEADERS 
FROM 'file:///Beobachter_Gemeinderating_2018.csv' AS line
FIELDTERMINATOR ';'
WITH line 
WHERE line.Label = 'BEVÖLKERUNG'
  AND line.Kanton = 'LU'
RETURN line;

LOAD CSV WITH HEADERS 
FROM 'file:///Beobachter_Gemeinderating_2018.csv' AS line
FIELDTERMINATOR ';'
WITH line 
WHERE line.Label = 'BEVÖLKERUNG' AND line.Kanton = 'LU'
MATCH (g:Gemeinde)
WHERE g.name = line.Gemeinde
RETURN g.name;

LOAD CSV WITH HEADERS 
FROM 'file:///Beobachter_Gemeinderating_2018.csv' AS line
FIELDTERMINATOR ';'
WITH line 
WHERE line.Label = 'BEVÖLKERUNG' AND line.Kanton = 'LU'
MATCH (g:Gemeinde)
WHERE g.name = line.Gemeinde
SET g.BevoelkerungRankIAZIOriginal = toInteger(line.Wert);

MATCH (g:Gemeinde)
WHERE EXISTS(g.BevoelkerungRankIAZIOriginal)
SET g.BevoelkerungRankIAZIKorrigiert=g.BevoelkerungRankIAZIOriginal;

MATCH (g:Gemeinde)-[r:istNachbarVon]-(a:Gemeinde)
WHERE NOT EXISTS(g.BevoelkerungRankIAZIOriginal) AND
      NOT EXISTS(g.BevoelkerungRankIAZIKorrigiert) AND
      EXISTS(a.BevoelkerungRankIAZIKorrigiert)
RETURN "MATCH (g:Gemeinde) WHERE g.BFSNr=" 
       + g.BFSNr 
       + " SET g.BevoelkerungRankIAZIKorrigiert=toInteger(" 
       + ROUND(AVG(a.BevoelkerungRankIAZIKorrigiert))+");"

MATCH (g:Gemeinde) WHERE g.BFSNr=1053 SET g.BevoelkerungRankIAZIKorrigiert=toInteger(403.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1025 SET g.BevoelkerungRankIAZIKorrigiert=toInteger(252.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1084 SET g.BevoelkerungRankIAZIKorrigiert=toInteger(146.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1039 SET g.BevoelkerungRankIAZIKorrigiert=toInteger(207.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1100 SET g.BevoelkerungRankIAZIKorrigiert=toInteger(404.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1091 SET g.BevoelkerungRankIAZIKorrigiert=toInteger(379.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1127 SET g.BevoelkerungRankIAZIKorrigiert=toInteger(410.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1123 SET g.BevoelkerungRankIAZIKorrigiert=toInteger(502.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1005 SET g.BevoelkerungRankIAZIKorrigiert=toInteger(696.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1066 SET g.BevoelkerungRankIAZIKorrigiert=toInteger(731.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1001 SET g.BevoelkerungRankIAZIKorrigiert=toInteger(762.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1004 SET g.BevoelkerungRankIAZIKorrigiert=toInteger(761.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1121 SET g.BevoelkerungRankIAZIKorrigiert=toInteger(452.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1041 SET g.BevoelkerungRankIAZIKorrigiert=toInteger(271.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1021 SET g.BevoelkerungRankIAZIKorrigiert=toInteger(271.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1022 SET g.BevoelkerungRankIAZIKorrigiert=toInteger(271.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1055 SET g.BevoelkerungRankIAZIKorrigiert=toInteger(488.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1057 SET g.BevoelkerungRankIAZIKorrigiert=toInteger(285.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1007 SET g.BevoelkerungRankIAZIKorrigiert=toInteger(771.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1132 SET g.BevoelkerungRankIAZIKorrigiert=toInteger(699.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1126 SET g.BevoelkerungRankIAZIKorrigiert=toInteger(455.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1142 SET g.BevoelkerungRankIAZIKorrigiert=toInteger(426.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1122 SET g.BevoelkerungRankIAZIKorrigiert=toInteger(426.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1147 SET g.BevoelkerungRankIAZIKorrigiert=toInteger(752.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1064 SET g.BevoelkerungRankIAZIKorrigiert=toInteger(360.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1129 SET g.BevoelkerungRankIAZIKorrigiert=toInteger(499.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1130 SET g.BevoelkerungRankIAZIKorrigiert=toInteger(530.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1056 SET g.BevoelkerungRankIAZIKorrigiert=toInteger(160.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1068 SET g.BevoelkerungRankIAZIKorrigiert=toInteger(160.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1135 SET g.BevoelkerungRankIAZIKorrigiert=toInteger(594.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1145 SET g.BevoelkerungRankIAZIKorrigiert=toInteger(629.0);

MATCH (g:Gemeinde)-[r:istNachbarVon]-(a:Gemeinde)
WHERE NOT EXISTS(g.BevoelkerungRankIAZIOriginal) AND
      NOT EXISTS(g.BevoelkerungRankIAZIKorrigiert) AND
      EXISTS(a.BevoelkerungRankIAZIKorrigiert)
RETURN "MATCH (g:Gemeinde) WHERE g.BFSNr=" 
       + g.BFSNr 
       + " SET g.BevoelkerungRankIAZIKorrigiert=toInteger(" 
       + ROUND(AVG(a.BevoelkerungRankIAZIKorrigiert))+");"

MATCH (g:Gemeinde) WHERE g.BFSNr=1131 SET g.BevoelkerungRankIAZIKorrigiert=toInteger(460.0);
