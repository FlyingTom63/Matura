// Gemeindefusionen: Gemeinden alt/neu

MATCH (alt:Gemeinde)-[r:istEingemeindetVon]->(neu:Gemeinde)
RETURN alt.name AS GemeindeAlt, 
       alt.AbweichenderNameKSLU AS AbweichenderName,
       r.seit AS Seit,
       neu.name AS GemeindeNeu;
