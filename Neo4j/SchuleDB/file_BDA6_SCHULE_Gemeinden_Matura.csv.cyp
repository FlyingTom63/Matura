//  BDA6_SCHULE_Gemeinden_Matura.csv

MATCH (g:Gemeinde)<-[r:wohntIn]-(s:Schueler)-[m:hatPruefungAbgelegt]-(k:Kantonsschule)
RETURN g.BFSNr AS GemeindeNummer, 
       g.name AS GemeindeName, 
       g.AnzahlEinwohner AS AnzahlEinwohner, 
       COUNT(m) AS AnzahlMatura, 
       ROUND(AVG(m.Note)*100)/100 AS NoteDurchschnitt, 
       ROUND(COUNT(m)/toFloat(g.AnzahlEinwohner)*10000)/100 AS MaturaQuote
ORDER BY g.name;