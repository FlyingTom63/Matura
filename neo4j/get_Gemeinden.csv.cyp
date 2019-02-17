MATCH (g:Gemeinde)<-[r:istEingemeindetVon]-(alt:Gemeinde),
      (g)-[l:gehoertZu]->(o:Region)
RETURN g.name AS GemeindeName,
       'LU' AS KantonKurzname,
       alt.AbweichenderNameKSLU AS GemeindeNameSchule,
       toInteger(0) AS GemeindeVerzeichnisFlag,
       g.BFSNr AS GemeindeNummer,
       o.RegionCode AS RegionCode,
       o.name AS RegionName
UNION ALL
MATCH (g:Gemeinde)-[l:gehoertZu]->(o:Region)
WHERE g.AbweichenderNameKSLU IS NULL
RETURN g.name AS GemeindeName,
       'LU' AS KantonKurzname,
       g.name AS GemeindeNameSchule,
       toInteger(1) AS GemeindeVerzeichnisFlag,
       g.BFSNr AS GemeindeNummer,
       o.RegionCode AS RegionCode,
       o.name AS RegionName