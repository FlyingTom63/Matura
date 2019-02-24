CREATE (:Amt {name:'Amt Luzern'});
CREATE (:Amt {name:'Amt Hochdorf'});
CREATE (:Amt {name:'Amt Sursee'});
CREATE (:Amt {name:'Amt Entlebuch'});
CREATE (:Amt {name:'Amt Willisau'});

MATCH  (a:Amt), (g:Gemeinde)
WHERE  a.name='Amt Luzern'
  AND  (   g.name='Adligenswil'
        OR g.name='Buchrain'
        OR g.name='Dierikon'
        OR g.name='Ebikon'
        OR g.name='Gisikon'
        OR g.name='Greppen'
        OR g.name='Honau'
        OR g.name='Horw'
        OR g.name='Kriens'
        OR g.name='Luzern'
        OR g.name='Malters'
        OR g.name='Meggen'
        OR g.name='Meierskappel'
        OR g.name='Root'
        OR g.name='Schwarzenberg'
        OR g.name='Udligenswil'
        OR g.name='Vitznau'
        OR g.name='Weggis')
CREATE (a)-[r:verwaltet]->(g);

MATCH  (a:Amt), (g:Gemeinde)
WHERE  a.name='Amt Hochdorf'
  AND  (   g.GemeindeNameLU='Aesch'
        OR g.GemeindeNameLU='Altwis'
        OR g.GemeindeNameLU='Ballwil'
        OR g.GemeindeNameLU='Emmen'	
        OR g.GemeindeNameLU='Ermensee'
        OR g.GemeindeNameLU='Eschenbach'
        OR g.GemeindeNameLU='Hitzkirch'
        OR g.GemeindeNameLU='Hochdorf'
        OR g.GemeindeNameLU='Hohenrain'
        OR g.GemeindeNameLU='Inwil'
        OR g.GemeindeNameLU='Rain'
        OR g.GemeindeNameLU='Römerswil'
        OR g.GemeindeNameLU='Rothenburg'
        OR g.GemeindeNameLU='Schongau')
CREATE (a)-[r:verwaltet]->(g);

MATCH  (a:Amt), (g:Gemeinde)
WHERE  a.name='Amt Sursee'
  AND  (   g.GemeindeNameLU='Beromünster'
        OR g.GemeindeNameLU='Büron'
        OR g.GemeindeNameLU='Buttisholz'
        OR g.GemeindeNameLU='Eich'
        OR g.GemeindeNameLU='Geuensee'
        OR g.GemeindeNameLU='Grosswangen'
        OR g.GemeindeNameLU='Hildisrieden'
        OR g.GemeindeNameLU='Knutwil'
        OR g.GemeindeNameLU='Mauensee'
        OR g.GemeindeNameLU='Neudorf'
        OR g.GemeindeNameLU='Neuenkirch'
        OR g.GemeindeNameLU='Nottwil'
        OR g.GemeindeNameLU='Oberkirch'
        OR g.GemeindeNameLU='Pfeffikon'
        OR g.GemeindeNameLU='Rickenbach'
        OR g.GemeindeNameLU='Ruswil'
        OR g.GemeindeNameLU='Schenkon'
        OR g.GemeindeNameLU='Schlierbach'
        OR g.GemeindeNameLU='Sempach'
        OR g.GemeindeNameLU='Sursee'
        OR g.GemeindeNameLU='Triengen'
        OR g.GemeindeNameLU='Wolhusen')
CREATE (a)-[r:verwaltet]->(g);

MATCH  (a:Amt), (g:Gemeinde)
WHERE  a.name='Amt Willisau'
  AND  (   g.GemeindeNameLU='Alberswil'
        OR g.GemeindeNameLU='Altbüron'
        OR g.GemeindeNameLU='Altishofen'
        OR g.GemeindeNameLU='Dagmersellen'
        OR g.GemeindeNameLU='Ebersecken'
        OR g.GemeindeNameLU='Egolzwil'
        OR g.GemeindeNameLU='Ettiswil'
        OR g.GemeindeNameLU='Fischbach'
        OR g.GemeindeNameLU='Gettnau'
        OR g.GemeindeNameLU='Grossdietwil'
        OR g.GemeindeNameLU='Hergiswil bei Willisau'
        OR g.GemeindeNameLU='Luthern'
        OR g.GemeindeNameLU='Menznau'
        OR g.GemeindeNameLU='Nebikon'
        OR g.GemeindeNameLU='Ohmstal'
        OR g.GemeindeNameLU='Pfaffnau'
        OR g.GemeindeNameLU='Reiden'
        OR g.GemeindeNameLU='Roggliswil'
        OR g.GemeindeNameLU='Schötz'
        OR g.GemeindeNameLU='Ufhusen'
        OR g.GemeindeNameLU='Wauwil'
        OR g.GemeindeNameLU='Wikon'
        OR g.GemeindeNameLU='Willisau'
        OR g.GemeindeNameLU='Zell')
CREATE (a)-[r:verwaltet]->(g);

MATCH  (a:Amt), (g:Gemeinde)
WHERE  a.name='Amt Entlebuch'
  AND  (   g.GemeindeNameLU='Doppleschwand'
        OR g.GemeindeNameLU='Entlebuch'
        OR g.GemeindeNameLU='Escholzmatt-Marbach'
        OR g.GemeindeNameLU='Flühli'
        OR g.GemeindeNameLU='Hasle'
        OR g.GemeindeNameLU='Romoos'
        OR g.GemeindeNameLU='Schüpfheim'
        OR g.GemeindeNameLU='Werthenstein')
CREATE (a)-[r:verwaltet]->(g);
