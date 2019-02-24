MATCH (g:Gemeinde)<-[f:istEingemeindetVon]-(a:Gemeinde)
RETURN g.BFSNr AS BFSNr, 
       g.name AS GemeindeName,
       a.BFSNr AS BFSNrAlt,
       a.name AS GemeindeNameAlt,
       a.AbweichenderNameKSLU AS AbweichendeNameKSLU
UNION ALL
MATCH (g:Gemeinde)
WHERE     g.BFSNr=1010
       OR g.BFSNr=1081
       OR g.BFSNr=1143
       OR g.BFSNr=1097
RETURN g.BFSNr AS BFSNr, 
       g.name AS GemeindeName,
       g.BFSNr AS BFSNrAlt,
       g.name AS GemeindeNameAlt,
       g.name AS AbweichendeNameKSLU