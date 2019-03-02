MATCH    (g1:Gemeinde)<-[t1:istTeilVon]-
            (s1:Shape)-[e1:hatEckpunkt]->(n1:ShapeNode)-[rn1:liegtAuf]
               ->(k:Koordinate)<-
            [rn2:liegtAuf]-(n2:ShapeNode)<-[e2:hatEckpunkt]-(s2:Shape)-
         [t2:istTeilVon]->(g2:Gemeinde)
WHERE    g1.name< g2.name
RETURN   g1.BFSNr AS BFSNr1, 
         g1.name  AS GemeindeName1, 
         g2.BFSNr AS BFSNr2, 
         g2.name  AS GemeindeName2,
         COUNT(*) AS GemeinsameNodes
ORDER BY g1.name,
         g2.name