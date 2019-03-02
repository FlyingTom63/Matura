MATCH (a:Schueler),(b:SchuelerTmp),(c:Sprache)
WHERE a.SchuelerID=b.SchuelerID 
  AND b.Muttersprache=c.name
CREATE (a)-[:hatMuttersprache]->(c);