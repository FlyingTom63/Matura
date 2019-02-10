MATCH (von:Koordinate)<-[rv:liegtAuf]-(a:ShapeNode)-[r:bildetShapeMit]->(b:ShapeNode)-[rn:liegtAuf]->(nach:Koordinate)
SET r.Slope=(nach.Y-von.Y)/(nach.X-von.X);