MATCH (a:Gemeinde)-[r:istEingemeindetVon]->(b:Gemeinde)
RETURN a.BFSNr AS BFSNrAlt,
       a.name AS NameAlt, 
       b.BFSNr AS BFSNrNeu,
       b.name AS NameNeu,
       r.seit AS Seit
ORDER BY a.BFSNr, b.BFSNr