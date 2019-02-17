LOAD CSV WITH HEADERS 
FROM 'file:///Beobachter_Gemeinderating_2018.csv' AS line
FIELDTERMINATOR ';'
WITH line 
WHERE line.Label = 'WOHNEN'
  AND line.Kanton = 'LU'
RETURN line;

LOAD CSV WITH HEADERS 
FROM 'file:///Beobachter_Gemeinderating_2018.csv' AS line
FIELDTERMINATOR ';'
WITH line 
WHERE line.Label = 'WOHNEN' AND line.Kanton = 'LU'
MATCH (g:Gemeinde)
WHERE g.name = line.Gemeinde
RETURN g.name;

LOAD CSV WITH HEADERS 
FROM 'file:///Beobachter_Gemeinderating_2018.csv' AS line
FIELDTERMINATOR ';'
WITH line 
WHERE line.Label = 'WOHNEN' AND line.Kanton = 'LU'
MATCH (g:Gemeinde)
WHERE g.name = line.Gemeinde
SET g.WohnenRankIAZIOriginal = toInteger(line.Wert);

MATCH (g:Gemeinde)
WHERE EXISTS(g.WohnenRankIAZIOriginal)
SET g.WohnenRankIAZIKorrigiert=g.WohnenRankIAZIOriginal;

MATCH (g:Gemeinde)-[r:istNachbarVon]-(a:Gemeinde)
WHERE NOT EXISTS(g.WohnenRankIAZIOriginal) AND
      NOT EXISTS(g.WohnenRankIAZIKorrigiert) AND
      EXISTS(a.WohnenRankIAZIKorrigiert)
RETURN "MATCH (g:Gemeinde) WHERE g.BFSNr=" 
       + g.BFSNr 
       + " SET g.WohnenRankIAZIKorrigiert=toInteger(" 
       + ROUND(AVG(a.WohnenRankIAZIKorrigiert))+");"

MATCH (g:Gemeinde) WHERE g.BFSNr=1021 SET g.WohnenRankIAZIKorrigiert=toInteger(503.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1121 SET g.WohnenRankIAZIKorrigiert=toInteger(615.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1122 SET g.WohnenRankIAZIKorrigiert=toInteger(288.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1123 SET g.WohnenRankIAZIKorrigiert=toInteger(537.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1022 SET g.WohnenRankIAZIKorrigiert=toInteger(503.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1053 SET g.WohnenRankIAZIKorrigiert=toInteger(343.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1001 SET g.WohnenRankIAZIKorrigiert=toInteger(366.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1126 SET g.WohnenRankIAZIKorrigiert=toInteger(623.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1127 SET g.WohnenRankIAZIKorrigiert=toInteger(592.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1084 SET g.WohnenRankIAZIKorrigiert=toInteger(143.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1025 SET g.WohnenRankIAZIKorrigiert=toInteger(379.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1129 SET g.WohnenRankIAZIKorrigiert=toInteger(632.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1004 SET g.WohnenRankIAZIKorrigiert=toInteger(645.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1130 SET g.WohnenRankIAZIKorrigiert=toInteger(559.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1055 SET g.WohnenRankIAZIKorrigiert=toInteger(491.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1056 SET g.WohnenRankIAZIKorrigiert=toInteger(41.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1005 SET g.WohnenRankIAZIKorrigiert=toInteger(502.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1132 SET g.WohnenRankIAZIKorrigiert=toInteger(620.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1057 SET g.WohnenRankIAZIKorrigiert=toInteger(789.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1135 SET g.WohnenRankIAZIKorrigiert=toInteger(413.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1091 SET g.WohnenRankIAZIKorrigiert=toInteger(407.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1064 SET g.WohnenRankIAZIKorrigiert=toInteger(181.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1142 SET g.WohnenRankIAZIKorrigiert=toInteger(288.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1007 SET g.WohnenRankIAZIKorrigiert=toInteger(491.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1039 SET g.WohnenRankIAZIKorrigiert=toInteger(460.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1100 SET g.WohnenRankIAZIKorrigiert=toInteger(616.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1041 SET g.WohnenRankIAZIKorrigiert=toInteger(503.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1066 SET g.WohnenRankIAZIKorrigiert=toInteger(542.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1145 SET g.WohnenRankIAZIKorrigiert=toInteger(510.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1068 SET g.WohnenRankIAZIKorrigiert=toInteger(41.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1147 SET g.WohnenRankIAZIKorrigiert=toInteger(506.0);

MATCH (g:Gemeinde)-[r:istNachbarVon]-(a:Gemeinde)
WHERE NOT EXISTS(g.WohnenRankIAZIOriginal) AND
      NOT EXISTS(g.WohnenRankIAZIKorrigiert) AND
      EXISTS(a.WohnenRankIAZIKorrigiert)
RETURN "MATCH (g:Gemeinde) WHERE g.BFSNr=" 
       + g.BFSNr 
       + " SET g.WohnenRankIAZIKorrigiert=toInteger(" 
       + ROUND(AVG(a.WohnenRankIAZIKorrigiert))+");"

MATCH (g:Gemeinde) WHERE g.BFSNr=1131 SET g.WohnenRankIAZIKorrigiert=toInteger(514.0);