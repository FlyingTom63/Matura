// Gemeindefusionen: Anzahl betroffener Schueler

MATCH (a:Schueler)-[r:wohnteVorFusionIn]->(b:Gemeinde)-[v:istEingemeindetVon]->(c:Gemeinde)
RETURN b.name  AS GemeindeAlt,
       b.AbweichenderNameKSLU AS AbweichenderName,
       c.name AS GemeindeNeu,
       COUNT(*) AS AnzahlSchueler
ORDER BY b.name;