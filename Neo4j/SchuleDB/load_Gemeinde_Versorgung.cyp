LOAD CSV WITH HEADERS 
FROM 'file:///Beobachter_Gemeinderating_2018.csv' AS line
FIELDTERMINATOR ';'
WITH line 
WHERE line.Label = 'VERSORGUNG' AND line.Kanton = 'LU'
RETURN line;

LOAD CSV WITH HEADERS 
FROM 'file:///Beobachter_Gemeinderating_2018.csv' AS line
FIELDTERMINATOR ';'
WITH line 
WHERE line.Label = 'VERSORGUNG' AND line.Kanton = 'LU'
MATCH (g:Gemeinde)
WHERE g.name = line.Gemeinde
RETURN g.name;

LOAD CSV WITH HEADERS 
FROM 'file:///Beobachter_Gemeinderating_2018.csv' AS line
FIELDTERMINATOR ';'
WITH line 
WHERE line.Label = 'VERSORGUNG' AND line.Kanton = 'LU'
MATCH (g:Gemeinde)
WHERE g.name = line.Gemeinde
SET g.VersorgungRankIAZIOriginal = toInteger(line.Wert);

MATCH (g:Gemeinde)
WHERE EXISTS(g.VersorgungRankIAZIOriginal)
SET g.VersorgungRankIAZIKorrigiert=g.VersorgungRankIAZIOriginal;

MATCH (g:Gemeinde)-[r:istNachbarVon]-(a:Gemeinde)
WHERE NOT EXISTS(g.VersorgungRankIAZIOriginal) AND
      NOT EXISTS(g.VersorgungRankIAZIKorrigiert) AND
      EXISTS(a.VersorgungRankIAZIKorrigiert)
RETURN "MATCH (g:Gemeinde) WHERE g.BFSNr=" 
       + g.BFSNr 
       + " SET g.VersorgungRankIAZIKorrigiert=toInteger(" 
       + ROUND(AVG(a.VersorgungRankIAZIKorrigiert))+");"

MATCH (g:Gemeinde) WHERE g.BFSNr=1021 SET g.VersorgungRankIAZIKorrigiert=toInteger(116.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1121 SET g.VersorgungRankIAZIKorrigiert=toInteger(606.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1122 SET g.VersorgungRankIAZIKorrigiert=toInteger(409.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1123 SET g.VersorgungRankIAZIKorrigiert=toInteger(712.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1022 SET g.VersorgungRankIAZIKorrigiert=toInteger(116.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1053 SET g.VersorgungRankIAZIKorrigiert=toInteger(701.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1001 SET g.VersorgungRankIAZIKorrigiert=toInteger(818.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1126 SET g.VersorgungRankIAZIKorrigiert=toInteger(689.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1127 SET g.VersorgungRankIAZIKorrigiert=toInteger(858.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1084 SET g.VersorgungRankIAZIKorrigiert=toInteger(490.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1025 SET g.VersorgungRankIAZIKorrigiert=toInteger(346.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1129 SET g.VersorgungRankIAZIKorrigiert=toInteger(675.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1004 SET g.VersorgungRankIAZIKorrigiert=toInteger(488.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1130 SET g.VersorgungRankIAZIKorrigiert=toInteger(524.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1055 SET g.VersorgungRankIAZIKorrigiert=toInteger(568.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1056 SET g.VersorgungRankIAZIKorrigiert=toInteger(50.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1005 SET g.VersorgungRankIAZIKorrigiert=toInteger(821.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1132 SET g.VersorgungRankIAZIKorrigiert=toInteger(493.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1057 SET g.VersorgungRankIAZIKorrigiert=toInteger(663.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1135 SET g.VersorgungRankIAZIKorrigiert=toInteger(223.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1091 SET g.VersorgungRankIAZIKorrigiert=toInteger(633.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1064 SET g.VersorgungRankIAZIKorrigiert=toInteger(576.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1142 SET g.VersorgungRankIAZIKorrigiert=toInteger(409.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1007 SET g.VersorgungRankIAZIKorrigiert=toInteger(769.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1039 SET g.VersorgungRankIAZIKorrigiert=toInteger(492.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1100 SET g.VersorgungRankIAZIKorrigiert=toInteger(770.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1041 SET g.VersorgungRankIAZIKorrigiert=toInteger(116.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1066 SET g.VersorgungRankIAZIKorrigiert=toInteger(591.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1145 SET g.VersorgungRankIAZIKorrigiert=toInteger(368.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1068 SET g.VersorgungRankIAZIKorrigiert=toInteger(50.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1147 SET g.VersorgungRankIAZIKorrigiert=toInteger(377.0);

MATCH (g:Gemeinde)-[r:istNachbarVon]-(a:Gemeinde)
WHERE NOT EXISTS(g.VersorgungRankIAZIOriginal) AND
      NOT EXISTS(g.VersorgungRankIAZIKorrigiert) AND
      EXISTS(a.VersorgungRankIAZIKorrigiert)
RETURN "MATCH (g:Gemeinde) WHERE g.BFSNr=" 
       + g.BFSNr 
       + " SET g.VersorgungRankIAZIKorrigiert=toInteger(" 
       + ROUND(AVG(a.VersorgungRankIAZIKorrigiert))+");"

MATCH (g:Gemeinde) WHERE g.BFSNr=1131 SET g.VersorgungRankIAZIKorrigiert=toInteger(591.0);