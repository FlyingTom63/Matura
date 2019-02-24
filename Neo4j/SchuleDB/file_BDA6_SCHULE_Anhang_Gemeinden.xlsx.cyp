MATCH    (g:Gemeinde)-[l:gehoertZu]->(o:Region),
         (g)<-[v:verwaltet]-(a:Amt)
WHERE    g.AbweichenderNameKSLU IS NULL 
RETURN   g.BFSNr AS GemeindeNummer,
         g.name AS GemeindeNameBFS,
         g.GemeindeNameLU AS GemeindeNameLU,
         o.name AS RegionName,
         a.name AS AmtName
ORDER BY g.BFSNr