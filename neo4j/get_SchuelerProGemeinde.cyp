// Anzahl Schueler pro Gemeinde

MATCH (a:Schueler)-[r:wohntIn]->(b:Gemeinde)
RETURN b.name  AS GemeindeAlt,
       COUNT(*) AS AnzahlSchueler
ORDER BY b.name;
