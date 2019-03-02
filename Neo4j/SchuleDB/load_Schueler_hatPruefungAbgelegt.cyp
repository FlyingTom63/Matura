MATCH (a:Schueler),(b:Kantonsschule),(c:SchuelerTmp)
WHERE a.SchuelerID=c.SchuelerID 
  AND b.Abkuerzung=c.Schule
CREATE (a)-[r:besucht]->(b);
