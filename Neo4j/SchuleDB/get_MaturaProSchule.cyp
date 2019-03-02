// Anzahl Maturapruefungen mit Noten pro Kantonsschule

MATCH (a:Kantonsschule)<-[r:hatPruefungAbgelegt]-(b:Schueler)
RETURN a.name  AS Schule,
       COUNT(r) AS AnzahlMaturaPruefungen,
       ROUND(AVG(r.Note)*100)/100 AS NotenDurchschnitt,
       ROUND(MIN(r.Note)*100)/100 AS NotenMinimum,
       ROUND(MAX(r.Note)*100)/100 AS NotenMaximum
ORDER BY ROUND(AVG(r.Note)*100)/100 DESC