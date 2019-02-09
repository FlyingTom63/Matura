MATCH (von:Koordinate)<-[rv:wirdVerwendet]-(a:ShapeNode)-[r:bildetShape]->(b:ShapeNode)-[rn:wirdVerwendet]->(nach:Koordinate)
SET r.Slope=(nach.Y-von.Y)/(nach.X-von.X);