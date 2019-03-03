MATCH  (s:Shape)-[rs:hatStartpunkt]-(ns:ShapeNode),
       (s)-[re:hatEndpunkt]->(ne:ShapeNode)
CREATE (:ShapeNode {name:ns.name + ' (2)', 
                    ShapeNodeID:ne.ShapeNodeID+1,
                    KoordinateName:ns.KoordinateName,
                    ShapeID:ns.ShapeID});

MATCH (k:Koordinate), (n:ShapeNode)
WHERE RIGHT(n.name,4) = ' (2)'
 AND  k.name=n.KoordinateName
CREATE (k)<-[:liegtAuf]-(n);

MATCH (s:Shape), (n:ShapeNode)
WHERE RIGHT(n.name,4) = ' (2)'
 AND  s.ShapeID=n.ShapeID
CREATE (s)-[:hatEckpunkt]->(n);

MATCH ()-[r:hatEndpunkt]->()
DELETE r;

MATCH  (s:Shape)-[r:hatEckpunkt]->(n:ShapeNode)
RETURN "MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID="
       + s.ShapeID
       + " AND n.ShapeNodeID="
       + MAX(n.ShapeNodeID)
       + " CREATE (s)-[r:hatEndpunkt]->(n);";

MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=1 AND n.ShapeNodeID=316 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=2 AND n.ShapeNodeID=3688 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=3 AND n.ShapeNodeID=6952 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=4 AND n.ShapeNodeID=9735 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=5 AND n.ShapeNodeID=12876 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=6 AND n.ShapeNodeID=17039 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=7 AND n.ShapeNodeID=19842 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=8 AND n.ShapeNodeID=22798 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=9 AND n.ShapeNodeID=26981 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=10 AND n.ShapeNodeID=29140 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=11 AND n.ShapeNodeID=32550 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=12 AND n.ShapeNodeID=36679 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=13 AND n.ShapeNodeID=38575 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=14 AND n.ShapeNodeID=41895 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=15 AND n.ShapeNodeID=45719 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=16 AND n.ShapeNodeID=48205 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=17 AND n.ShapeNodeID=51767 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=18 AND n.ShapeNodeID=54628 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=19 AND n.ShapeNodeID=58657 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=20 AND n.ShapeNodeID=60725 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=21 AND n.ShapeNodeID=64430 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=22 AND n.ShapeNodeID=67137 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=23 AND n.ShapeNodeID=72174 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=24 AND n.ShapeNodeID=73729 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=25 AND n.ShapeNodeID=76528 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=26 AND n.ShapeNodeID=79884 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=27 AND n.ShapeNodeID=83903 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=28 AND n.ShapeNodeID=86078 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=29 AND n.ShapeNodeID=89889 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=30 AND n.ShapeNodeID=93361 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=31 AND n.ShapeNodeID=96694 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=32 AND n.ShapeNodeID=98924 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=33 AND n.ShapeNodeID=101976 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=34 AND n.ShapeNodeID=105560 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=35 AND n.ShapeNodeID=108190 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=36 AND n.ShapeNodeID=113047 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=37 AND n.ShapeNodeID=114807 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=38 AND n.ShapeNodeID=118332 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=39 AND n.ShapeNodeID=120203 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=40 AND n.ShapeNodeID=123470 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=41 AND n.ShapeNodeID=126577 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=42 AND n.ShapeNodeID=129782 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=43 AND n.ShapeNodeID=133530 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=44 AND n.ShapeNodeID=136926 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=45 AND n.ShapeNodeID=139791 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=46 AND n.ShapeNodeID=143592 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=47 AND n.ShapeNodeID=146138 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=48 AND n.ShapeNodeID=149674 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=49 AND n.ShapeNodeID=153031 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=50 AND n.ShapeNodeID=156152 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=51 AND n.ShapeNodeID=158401 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=52 AND n.ShapeNodeID=161428 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=53 AND n.ShapeNodeID=164544 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=54 AND n.ShapeNodeID=167618 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=55 AND n.ShapeNodeID=171732 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=56 AND n.ShapeNodeID=174471 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=57 AND n.ShapeNodeID=177832 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=58 AND n.ShapeNodeID=180655 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=59 AND n.ShapeNodeID=183633 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=60 AND n.ShapeNodeID=186845 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=61 AND n.ShapeNodeID=190090 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=62 AND n.ShapeNodeID=193320 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=63 AND n.ShapeNodeID=196309 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=64 AND n.ShapeNodeID=199465 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=65 AND n.ShapeNodeID=202607 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=66 AND n.ShapeNodeID=205807 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=67 AND n.ShapeNodeID=208908 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=68 AND n.ShapeNodeID=212348 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=69 AND n.ShapeNodeID=215268 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=70 AND n.ShapeNodeID=218517 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=71 AND n.ShapeNodeID=221310 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=72 AND n.ShapeNodeID=224767 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=73 AND n.ShapeNodeID=227926 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=74 AND n.ShapeNodeID=230910 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=75 AND n.ShapeNodeID=234367 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=76 AND n.ShapeNodeID=237481 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=77 AND n.ShapeNodeID=240548 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=78 AND n.ShapeNodeID=243686 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=79 AND n.ShapeNodeID=247119 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=80 AND n.ShapeNodeID=250227 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=81 AND n.ShapeNodeID=253266 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=82 AND n.ShapeNodeID=256557 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=83 AND n.ShapeNodeID=259516 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=84 AND n.ShapeNodeID=262557 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=85 AND n.ShapeNodeID=265776 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=86 AND n.ShapeNodeID=271759 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=87 AND n.ShapeNodeID=272267 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=88 AND n.ShapeNodeID=275384 CREATE (s)-[r:hatEndpunkt]->(n);
MATCH (s:Shape), (n:ShapeNode) WHERE s.ShapeID=89 AND n.ShapeNodeID=278646 CREATE (s)-[r:hatEndpunkt]->(n);

MATCH (a:ShapeNode)-[r:bildetShapeMit]->(b:ShapeNode)<-[e:hatStartpunkt]-(s:Shape)-[z:hatEndpunkt]->(x:ShapeNode)
CREATE (a)-[:bildetShapeMit]->(x);

MATCH (a:ShapeNode)-[r:bildetShapeMit]->(b:ShapeNode)<-[e:hatStartpunkt]-(s:Shape)
DELETE r;

