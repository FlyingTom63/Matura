// Anzahl Maturapruefungen mit Noten pro Gemeinde

MATCH (a:Gemeinde)<-[r:wohntIn]-(b:Schueler)-[m:hatPruefungAbgelegt]->()
RETURN a.name  AS Gemeinde,
       COUNT(m) AS AnzahlMaturaPruefungen,
       ROUND(AVG(m.Note)*100)/100 AS NotenDurchschnitt,
       ROUND(MIN(m.Note)*100)/100 AS NotenMinimum,
       ROUND(MAX(m.Note)*100)/100 AS NotenMaximum
ORDER BY ROUND(AVG(m.Note)*100)/100 DESC