MATCH (a:Kantonsschule),(b:Gemeinde)
WHERE a.name = 'KS Alpenquai' AND b.name = 'Luzern'
CREATE (a)-[r:liegtIn]->(b);

MATCH (a:Kantonsschule),(b:Gemeinde)
WHERE a.name = 'KS Beromünster' AND b.name = 'Beromünster'
CREATE (a)-[r:liegtIn]->(b);

MATCH (a:Kantonsschule),(b:Gemeinde)
WHERE a.name = 'KS Musegg' AND b.name = 'Luzern'
CREATE (a)-[r:liegtIn]->(b);

MATCH (a:Kantonsschule),(b:Gemeinde)
WHERE a.name = 'KS Reussbühl' AND b.name = 'Luzern'
CREATE (a)-[r:liegtIn]->(b);

MATCH (a:Kantonsschule),(b:Gemeinde)
WHERE a.name = 'KS Schüpfheim' AND b.name = 'Schüpfheim'
CREATE (a)-[r:liegtIn]->(b);

MATCH (a:Kantonsschule),(b:Gemeinde)
WHERE a.name = 'KS Seetal' AND b.name = 'Hochdorf'
CREATE (a)-[r:liegtIn]->(b);

MATCH (a:Kantonsschule),(b:Gemeinde)
WHERE a.name = 'KS Sursee' AND b.name = 'Sursee'
CREATE (a)-[r:liegtIn]->(b);

MATCH (a:Kantonsschule),(b:Gemeinde)
WHERE a.name = 'KS Willisau' AND b.name = 'Willisau'
CREATE (a)-[r:liegtIn]->(b);


