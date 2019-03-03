MATCH  (a:ShapeNode {ShapeNodeID:13})-[r:bildetShapeMit]->(b:ShapeNode)-[s:bildetShapeMit]->(c:ShapeNode {ShapeNodeID:15})
RETURN a.ShapeNodeID,
       b.ShapeNodeID,
       c.ShapeNodeID
LIMIT  25;

MATCH  (a:ShapeNode {ShapeNodeID:13})-[r:bildetShapeMit]->(b:ShapeNode)-[s:bildetShapeMit]->(c:ShapeNode {ShapeNodeID:15})
RETURN a.ShapeNodeID,
       c.ShapeNodeID;

MATCH  (a:ShapeNode {ShapeNodeID:13})-[r:bildetShapeMit]->(b:ShapeNode)-[s:bildetShapeMit]->(c:ShapeNode {ShapeNodeID:15})
RETURN a.ShapeNodeID,
       c.ShapeNodeID;

MATCH  path=shortestPath((a:ShapeNode {ShapeNodeID:13})-[*]->(c:ShapeNode {ShapeNodeID:15}))
RETURN path;

MATCH  path=shortestPath((a:ShapeNode {ShapeNodeID:13})-[*]->(c:ShapeNode {ShapeNodeID:15}))
RETURN length(path);

MATCH  path=shortestPath((a:ShapeNode)-[*]->(b:ShapeNode))
WHERE  a.ShapeNodeID=13
  AND  b.ShapeNodeID=16
RETURN length(path);

MATCH  (s:Shape)-[:hatStartpunkt]->(sn:ShapeNode),
       path=shortestPath((a:ShapeNode)-[*]->(b:ShapeNode))
WHERE  a.ShapeNodeID=sn.ShapeNodeID
  AND  b.ShapeNodeID=a.ShapeNodeID+10
RETURN s.ShapeID AS ShapeID,
       a.ShapeNodeID AS FromNode,
       b.ShapeNodeID AS ToNode,
       length(path) AS NumberOfSegments;

MATCH  (s:Shape)-[:hatStartpunkt]->(sn:ShapeNode),
       (s)-[:hatEndpunkt]->(en:ShapeNode),
       path=shortestPath((a:ShapeNode)-[*]->(b:ShapeNode))
WHERE  a.ShapeNodeID=sn.ShapeNodeID
  AND  b.ShapeNodeID=en.ShapeNodeID
RETURN s.ShapeID AS ShapeID,
       a.ShapeNodeID AS FromNode,
       b.ShapeNodeID AS ToNode,
       length(path) AS NumberOfSegments;

MATCH  (s:Shape)-[:hatStartpunkt]->(sn:ShapeNode),
       (s)-[:hatEndpunkt]->(en:ShapeNode),
       path=shortestPath((a:ShapeNode)-[r:bildetShapeMit*]->(b:ShapeNode))
WHERE  a.ShapeNodeID=sn.ShapeNodeID
  AND  b.ShapeNodeID=en.ShapeNodeID
RETURN s.ShapeID AS ShapeID,
       a.ShapeNodeID AS FromNode,
       b.ShapeNodeID AS ToNode,
       length(path) AS NumberOfSegments;

MATCH  (s:Shape)-[:hatStartpunkt]->(sn:ShapeNode),
       (s)-[:hatEndpunkt]->(en:ShapeNode),
       path=allShortestPaths((a:ShapeNode)-[r:bildetShapeMit*]->(b:ShapeNode))
WHERE  a.ShapeNodeID=sn.ShapeNodeID
  AND  b.ShapeNodeID=en.ShapeNodeID
RETURN s.ShapeID AS ShapeID,
       a.ShapeNodeID AS FromNode,
       b.ShapeNodeID AS ToNode,
       REDUCE(acc1 = 0, v1 IN r | acc1 + v1.Length) AS Laenge,
       length(path) AS NumberOfSegments;

MATCH  (s:Shape)-[:hatStartpunkt]->(sn:ShapeNode),
       (s)-[:hatEndpunkt]->(en:ShapeNode),
       path=allShortestPaths((a:ShapeNode)-[r:bildetShapeMit*]->(b:ShapeNode))
WHERE  a.ShapeNodeID=sn.ShapeNodeID
  AND  b.ShapeNodeID=en.ShapeNodeID
RETURN s.ShapeID AS ShapeID,
       a.ShapeNodeID AS FromNode,
       b.ShapeNodeID AS ToNode,
       s.Length AS ShapeLength,
       REDUCE(sum1 = 0, var1 IN r | sum1 + var1.Length) AS UmfangLaenge,
       length(path) AS UmfangStrecken;

MATCH  (s:Shape)-[:hatStartpunkt]->(sn:ShapeNode)-[l:liegtAuf]->(k:Koordinate),
       (s)-[:hatEndpunkt]->(en:ShapeNode),
       path=allShortestPaths((a:ShapeNode)-[r:bildetShapeMit*]->(b:ShapeNode))
WHERE  a.ShapeNodeID=sn.ShapeNodeID
  AND  b.ShapeNodeID=en.ShapeNodeID
RETURN s.ShapeID AS ShapeID,
       k.X AS StartEndX,
       k.Y AS StartEndY,
       a.ShapeNodeID AS NodeIDFrom,
       b.ShapeNodeID AS NodeIDTo,
       s.Length AS ShapeLaenge,
       REDUCE(sum1 = 0, var1 IN r | sum1 + var1.Length) AS KantenLaengen,
       length(path) AS AnzahlKanten;

MATCH  (g:Gemeinde)<-[q:istTeilVon]-(s:Shape)-[:hatStartpunkt]->(sn:ShapeNode)-[l:liegtAuf]->(k:Koordinate),
       (s)-[:hatEndpunkt]->(en:ShapeNode),
       path=allShortestPaths((a:ShapeNode)-[r:bildetShapeMit*]->(b:ShapeNode))
WHERE  a.ShapeNodeID=sn.ShapeNodeID
  AND  b.ShapeNodeID=en.ShapeNodeID
RETURN g.name AS Gemeinde,
       s.ShapeID AS ShapeID,
       k.X AS StartEndX,
       k.Y AS StartEndY,
       a.ShapeNodeID AS NodeIDFrom,
       b.ShapeNodeID AS NodeIDTo,
       s.Length AS ShapeLaenge,
       REDUCE(sum1 = 0, var1 IN r | sum1 + var1.Length) AS KantenLaengen,
       length(path) AS AnzahlKanten
ORDER BY g.name, s.ShapeID;