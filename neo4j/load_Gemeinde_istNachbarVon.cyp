MATCH (a:Gemeinde),(b:Gemeinde)
WHERE a.name = 'Escholzmatt-Marbach'
AND (b.name = 'Flühli' OR b.name='Schüpfheim')
CREATE (a)-[r:istNachbarVon]->(b);

MATCH (a:Gemeinde),(b:Gemeinde)
WHERE a.name = 'Flühli'
AND (b.name = 'Hasle (LU)' OR b.name='Schüpfheim')
CREATE (a)-[r:istNachbarVon]->(b);

MATCH (a:Gemeinde),(b:Gemeinde)
WHERE a.name = 'Schüpfheim'
AND (b.name = 'Hasle (LU)' OR b.name='Romoos' OR b.name='Entlebuch')
CREATE (a)-[r:istNachbarVon]->(b);

MATCH (a:Gemeinde),(b:Gemeinde)
WHERE a.name = 'Hasle (LU)'
AND (b.name = 'Doppleschwand' OR b.name='Romoos' OR b.name='Entlebuch')
CREATE (a)-[r:istNachbarVon]->(b);

MATCH (a:Gemeinde),(b:Gemeinde)
WHERE a.name = 'Entlebuch'
AND (b.name = 'Doppleschwand' OR b.name='Werthenstein' OR b.name='Schwarzenberg')
CREATE (a)-[r:istNachbarVon]->(b);

MATCH (a:Gemeinde),(b:Gemeinde)
WHERE a.name = 'Doppleschwand'
AND (b.name = 'Romoos' OR b.name='Wolhusen')
CREATE (a)-[r:istNachbarVon]->(b);

MATCH (a:Gemeinde),(b:Gemeinde)
WHERE a.name = 'Schwarzenberg'
AND (b.name = 'Malters' OR b.name='Kriens')
CREATE (a)-[r:istNachbarVon]->(b);

MATCH (a:Gemeinde),(b:Gemeinde)
WHERE a.name = 'Malters'
AND (b.name = 'Luzern' OR b.name='Kriens' OR b.name='Werthenstein' OR b.name='Ruswil' OR b.name='Neuenkirch')
CREATE (a)-[r:istNachbarVon]->(b);

MATCH (a:Gemeinde),(b:Gemeinde)
WHERE a.name = 'Kriens'
AND (b.name = 'Luzern' OR b.name='Honau')
CREATE (a)-[r:istNachbarVon]->(b);

MATCH (a:Gemeinde),(b:Gemeinde)
WHERE a.name = 'Honau'
AND (b.name = 'Luzern')
CREATE (a)-[r:istNachbarVon]->(b);

MATCH (a:Gemeinde),(b:Gemeinde)
WHERE a.name = 'Luzern'
AND (b.name = 'Emmen' OR b.name='Ebikon' OR b.name='Adligenswil' OR b.name='Meggen' OR b.name='Neuenkirch')
CREATE (a)-[r:istNachbarVon]->(b);

MATCH (a:Gemeinde),(b:Gemeinde)
WHERE a.name = 'Vitznau'
AND (b.name = 'Weggis')
CREATE (a)-[r:istNachbarVon]->(b);

MATCH (a:Gemeinde),(b:Gemeinde)
WHERE a.name = 'Weggis'
AND (b.name = 'Greppen')
CREATE (a)-[r:istNachbarVon]->(b);

MATCH (a:Gemeinde),(b:Gemeinde)
WHERE a.name = 'Meggen'
AND (b.name = 'Adligenswil')
CREATE (a)-[r:istNachbarVon]->(b);

MATCH (a:Gemeinde),(b:Gemeinde)
WHERE a.name = 'Adligenswil'
AND (b.name = 'Ebikon' OR b.name='Dierikon' OR b.name='Udligenswil')
CREATE (a)-[r:istNachbarVon]->(b);

MATCH (a:Gemeinde),(b:Gemeinde)
WHERE a.name = 'Ebikon'
AND (b.name = 'Emmen' OR b.name='Dierikon' OR b.name='Buchrain')
CREATE (a)-[r:istNachbarVon]->(b);




