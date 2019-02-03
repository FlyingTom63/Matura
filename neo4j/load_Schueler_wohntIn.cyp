MATCH (a:Schueler),(b:Kantonsschule),(c:SchuelerTmp)
WHERE a.SchuelerID=c.SchuelerID 
  AND b.Abkuerzung=c.Schule
CREATE (a)-[r:besucht]->(b);

//  Schueler aus fusionierten Gemeinden
MATCH (a:Schueler),(b:SchuelerTmp),(c:Gemeinde)-[r:istEingemeindetVon]->(d:Gemeinde)
WHERE a.name=b.SchuelerID
  AND b.GemeindeName=c.AbweichenderNameKSLU
CREATE (a)-[v:wohntIn]->(d);

MATCH (a:Schueler),(b:SchuelerTmp),(c:Gemeinde)
WHERE a.name=b.SchuelerID
  AND b.GemeindeName=c.AbweichenderNameKSLU
CREATE (a)-[v:wohnteVorFusionIn]->(c);