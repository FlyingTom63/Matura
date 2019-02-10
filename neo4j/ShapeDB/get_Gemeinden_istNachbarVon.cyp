//  Benachbarte Gemeinden

MATCH    (g1:Gemeinde)<-[]-(s1:Shape)<-[]-(n1:ShapeNode)-[rn1:wirdVerwendet]->
         (k:Koordinate)
         <-[rn2:wirdVerwendet]-(n2:ShapeNode)-[]->(s2:Shape)-[]->(g2:Gemeinde)
WHERE    g1.name< g2.name
RETURN   g1.BFSNr AS BFS_NR_1, 
         g1.name  AS GemeindeName_1, 
         g2.BFSNr AS BFS_NR_2, 
         g2.name  AS GemeindeName_2,
         COUNT(*) AS GemeinsameNodes
ORDER BY g1.name,
         g2.name;