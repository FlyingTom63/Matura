//  load data

MATCH (von:Koordinate)<-[rv:wirdVerwendet]-(a:ShapeNode)-[r:bildetShape]->(b:ShapeNode)-[rn:wirdVerwendet]->(nach:Koordinate)
SET r.Length=sqrt(((nach.X-von.X)*(nach.X-von.X))+((nach.Y-von.Y)*(nach.Y-von.Y)))