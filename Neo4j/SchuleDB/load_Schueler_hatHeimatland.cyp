MATCH (a:Schueler),(b:SchuelerTmp),(c:Land)
WHERE a.SchuelerID=b.SchuelerID 
  AND b.Heimatland=c.name
CREATE (a)-[:hatHeimatland]->(c);