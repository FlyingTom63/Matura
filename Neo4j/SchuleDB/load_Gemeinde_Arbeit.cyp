LOAD CSV WITH HEADERS 
FROM 'file:///Beobachter_Gemeinderating_2018.csv' AS line
FIELDTERMINATOR ';'
WITH line 
WHERE line.Label = 'ARBEITSMARKT'
  AND line.Kanton = 'LU'
RETURN line;

LOAD CSV WITH HEADERS 
FROM 'file:///Beobachter_Gemeinderating_2018.csv' AS line
FIELDTERMINATOR ';'
WITH line 
WHERE line.Label = 'ARBEITSMARKT' AND line.Kanton = 'LU'
MATCH (g:Gemeinde)
WHERE g.name = line.Gemeinde
RETURN g.name;

LOAD CSV WITH HEADERS 
FROM 'file:///Beobachter_Gemeinderating_2018.csv' AS line
FIELDTERMINATOR ';'
WITH line 
WHERE line.Label = 'ARBEITSMARKT' AND line.Kanton = 'LU'
MATCH (g:Gemeinde)
WHERE g.name = line.Gemeinde
SET g.ArbeitsmarktRankIAZIOriginal = toInteger(line.Wert);

MATCH (g:Gemeinde)
WHERE EXISTS(g.ArbeitsmarktRankIAZIOriginal)
SET g.ArbeitsmarktRankIAZIKorrigiert=g.ArbeitsmarktRankIAZIOriginal;

MATCH (g:Gemeinde)-[r:istNachbarVon]-(a:Gemeinde)
WHERE NOT EXISTS(g.ArbeitsmarktRankIAZIOriginal) AND
      NOT EXISTS(g.ArbeitsmarktRankIAZIKorrigiert) AND
      EXISTS(a.ArbeitsmarktRankIAZIKorrigiert)
RETURN "MATCH (g:Gemeinde) WHERE g.BFSNr=" 
       + g.BFSNr 
       + " SET g.ArbeitsmarktRankIAZIKorrigiert=toInteger(" 
       + ROUND(AVG(a.ArbeitsmarktRankIAZIKorrigiert))+");"

MATCH (g:Gemeinde) WHERE g.BFSNr=1021 SET g.ArbeitsmarktRankIAZIKorrigiert=toInteger(78.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1121 SET g.ArbeitsmarktRankIAZIKorrigiert=toInteger(597.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1122 SET g.ArbeitsmarktRankIAZIKorrigiert=toInteger(607.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1123 SET g.ArbeitsmarktRankIAZIKorrigiert=toInteger(570.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1022 SET g.ArbeitsmarktRankIAZIKorrigiert=toInteger(78.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1053 SET g.ArbeitsmarktRankIAZIKorrigiert=toInteger(310.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1001 SET g.ArbeitsmarktRankIAZIKorrigiert=toInteger(676.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1126 SET g.ArbeitsmarktRankIAZIKorrigiert=toInteger(685.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1127 SET g.ArbeitsmarktRankIAZIKorrigiert=toInteger(503.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1084 SET g.ArbeitsmarktRankIAZIKorrigiert=toInteger(264.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1025 SET g.ArbeitsmarktRankIAZIKorrigiert=toInteger(345.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1129 SET g.ArbeitsmarktRankIAZIKorrigiert=toInteger(665.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1004 SET g.ArbeitsmarktRankIAZIKorrigiert=toInteger(589.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1130 SET g.ArbeitsmarktRankIAZIKorrigiert=toInteger(651.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1055 SET g.ArbeitsmarktRankIAZIKorrigiert=toInteger(463.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1056 SET g.ArbeitsmarktRankIAZIKorrigiert=toInteger(416.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1005 SET g.ArbeitsmarktRankIAZIKorrigiert=toInteger(524.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1132 SET g.ArbeitsmarktRankIAZIKorrigiert=toInteger(728.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1057 SET g.ArbeitsmarktRankIAZIKorrigiert=toInteger(422.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1135 SET g.ArbeitsmarktRankIAZIKorrigiert=toInteger(623.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1091 SET g.ArbeitsmarktRankIAZIKorrigiert=toInteger(388.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1064 SET g.ArbeitsmarktRankIAZIKorrigiert=toInteger(304.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1142 SET g.ArbeitsmarktRankIAZIKorrigiert=toInteger(607.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1007 SET g.ArbeitsmarktRankIAZIKorrigiert=toInteger(594.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1039 SET g.ArbeitsmarktRankIAZIKorrigiert=toInteger(206.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1100 SET g.ArbeitsmarktRankIAZIKorrigiert=toInteger(665.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1041 SET g.ArbeitsmarktRankIAZIKorrigiert=toInteger(78.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1066 SET g.ArbeitsmarktRankIAZIKorrigiert=toInteger(474.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1145 SET g.ArbeitsmarktRankIAZIKorrigiert=toInteger(681.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1068 SET g.ArbeitsmarktRankIAZIKorrigiert=toInteger(416.0);
MATCH (g:Gemeinde) WHERE g.BFSNr=1147 SET g.ArbeitsmarktRankIAZIKorrigiert=toInteger(780.0);

MATCH (g:Gemeinde)-[r:istNachbarVon]-(a:Gemeinde)
WHERE NOT EXISTS(g.ArbeitsmarktRankIAZIOriginal) AND
      NOT EXISTS(g.ArbeitsmarktRankIAZIKorrigiert) AND
      EXISTS(a.ArbeitsmarktRankIAZIKorrigiert)
RETURN "MATCH (g:Gemeinde) WHERE g.BFSNr=" 
       + g.BFSNr 
       + " SET g.ArbeitsmarktRankIAZIKorrigiert=toInteger(" 
       + ROUND(AVG(a.ArbeitsmarktRankIAZIKorrigiert))+");"

MATCH (g:Gemeinde) WHERE g.BFSNr=1131 SET g.ArbeitsmarktRankIAZIKorrigiert=toInteger(652.0);
