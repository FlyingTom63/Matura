MATCH (a:Kantonsschule),(b:Gemeinde)
WHERE a.name = 'KS Alpenquai' AND b.name = 'Luzern'
CREATE (a)-[r:liegtIn]->(b);

MATCH (a:Kantonsschule),(b:Gemeinde)
WHERE a.name = 'KS Berom�nster' AND b.name = 'Berom�nster'
CREATE (a)-[r:liegtIn]->(b);

MATCH (a:Kantonsschule),(b:Gemeinde)
WHERE a.name = 'KS Musegg' AND b.name = 'Luzern'
CREATE (a)-[r:liegtIn]->(b);

MATCH (a:Kantonsschule),(b:Gemeinde)
WHERE a.name = 'KS Reussb�hl' AND b.name = 'Luzern'
CREATE (a)-[r:liegtIn]->(b);

MATCH (a:Kantonsschule),(b:Gemeinde)
WHERE a.name = 'KS Sch�pfheim' AND b.name = 'Sch�pfheim'
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


