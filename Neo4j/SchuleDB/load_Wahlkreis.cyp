CREATE (:Wahlkreis {name:'Wahlkreis Luzern-Stadt'});
CREATE (:Wahlkreis {name:'Wahlkreis Luzern-Land'});
CREATE (:Wahlkreis {name:'Wahlkreis Entlebuch'});
CREATE (:Wahlkreis {name:'Wahlkreis Hochdorf'});
CREATE (:Wahlkreis {name:'Wahlkreis Sursee'});
CREATE (:Wahlkreis {name:'Wahlkreis Willisau'});

MATCH (w:Wahlkreis)
SET   w.WahlkreisKuerzel =
         CASE w.name
            WHEN 'Wahlkreis Luzern-Stadt'
            THEN
              'LS'
            WHEN 'Wahlkreis Luzern-Land'
            THEN
              'LL'
            WHEN 'Wahlkreis Entlebuch'
            THEN
              'EN'
            WHEN 'Wahlkreis Hochdorf'
            THEN
              'HO'
            WHEN 'Wahlkreis Sursee'
            THEN
              'SU'
            WHEN 'Wahlkreis Willisau'
            THEN
              'WI'
         END;

MATCH  (w:Wahlkreis), (g:Gemeinde)
WHERE  w.name='Wahlkreis Luzern-Stadt'
  AND  (   g.name='Luzern')
CREATE (w)-[r:verwaltet]->(g);

MATCH  (w:Wahlkreis), (g:Gemeinde)
WHERE  w.name='Wahlkreis Luzern-Land'
  AND  (   g.name='Adligenswil'
        OR g.name='Buchrain'
        OR g.name='Dierikon'
        OR g.name='Ebikon'
        OR g.name='Gisikon'
        OR g.name='Greppen'
        OR g.name='Honau'
        OR g.name='Horw'
        OR g.name='Kriens'
        OR g.name='Malters'
        OR g.name='Meggen'
        OR g.name='Meierskappel'
        OR g.name='Root'
        OR g.name='Schwarzenberg'
        OR g.name='Udligenswil'
        OR g.name='Vitznau'
        OR g.name='Weggis')
CREATE (w)-[r:verwaltet]->(g);

MATCH  (w:Wahlkreis), (g:Gemeinde)
WHERE  w.name='Wahlkreis Entlebuch'
  AND  (   g.name='Doppleschwand'
        OR g.name='Entlebuch'
        OR g.name='Escholzmatt-Marbach'
        OR g.name='Flühli'
        OR g.name='Hasle (LU)'
        OR g.name='Romoos'
        OR g.name='Schüpfheim'
        OR g.name='Werthenstein'
        OR g.name='Wolhusen')
CREATE (w)-[r:verwaltet]->(g);

MATCH  (w:Wahlkreis), (g:Gemeinde)
WHERE  w.name='Wahlkreis Hochdorf'
  AND  (   g.name='Aesch (LU)'
        OR g.name='Altwis'
        OR g.name='Ballwil'
        OR g.name='Emmen'
        OR g.name='Ermensee'
        OR g.name='Eschenbach (LU)'
        OR g.name='Hitzkirch'
        OR g.name='Hochdorf'
        OR g.name='Hohenrain'
        OR g.name='Inwil'
        OR g.name='Rain'
        OR g.name='Römerswil'
        OR g.name='Rothenburg'
        OR g.name='Schongau')
CREATE (w)-[r:verwaltet]->(g);

MATCH  (w:Wahlkreis), (g:Gemeinde)
WHERE  w.name='Wahlkreis Sursee'
  AND  (   g.name='Beromünster'
        OR g.name='Büron'
        OR g.name='Buttisholz'
        OR g.name='Eich'
        OR g.name='Geuensee'
        OR g.name='Grosswangen'
        OR g.name='Hildisrieden'
        OR g.name='Knutwil'
        OR g.name='Mauensee'
        OR g.name='Neuenkirch'
        OR g.name='Nottwil'
        OR g.name='Oberkirch'
        OR g.name='Rickenbach (LU)'
        OR g.name='Ruswil'
        OR g.name='Schenkon'
        OR g.name='Schlierbach'
        OR g.name='Sempach'
        OR g.name='Sursee'
        OR g.name='Triengen')
CREATE (w)-[r:verwaltet]->(g);

MATCH  (w:Wahlkreis), (g:Gemeinde)
WHERE  w.name='Wahlkreis Willisau'
  AND  (   g.name='Alberswil'
        OR g.name='Altbüron'
        OR g.name='Altishofen'
        OR g.name='Dagmersellen'
        OR g.name='Ebersecken'
        OR g.name='Egolzwil'
        OR g.name='Ettiswil'
        OR g.name='Fischbach'
        OR g.name='Gettnau'
        OR g.name='Grossdietwil'
        OR g.name='Hergiswil bei Willisau'
        OR g.name='Luthern'
        OR g.name='Menznau'
        OR g.name='Nebikon'
        OR g.name='Pfaffnau'
        OR g.name='Reiden'
        OR g.name='Roggliswil'
        OR g.name='Schötz'
        OR g.name='Ufhusen'
        OR g.name='Wauwil'
        OR g.name='Wikon'
        OR g.name='Willisau'
        OR g.name='Zell (LU)')
CREATE (w)-[r:verwaltet]->(g);

MATCH    (w:Wahlkreis)-[r:verwaltet]->(g:Gemeinde)
WITH     w, g ORDER BY g.name
RETURN   w.name AS Name, 
         w.WahlkreisKuerzel AS Kürzel,
         COLLECT(g.name) AS Gemeinden
ORDER BY w.name;
