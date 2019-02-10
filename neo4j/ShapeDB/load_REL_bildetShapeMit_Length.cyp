//  load data

MATCH (von:Koordinate)<-[rv:liegtAuf]-(a:ShapeNode)-[r:bildetShapeMit]->(b:ShapeNode)-[rn:liegtAuf]->(nach:Koordinate)
SET r.Length=sqrt(((nach.X-von.X)*(nach.X-von.X))+((nach.Y-von.Y)*(nach.Y-von.Y)));
