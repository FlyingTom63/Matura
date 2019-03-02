﻿MATCH (g:Gemeinde)<-[r:istEingemeindetVon]-(alt:Gemeinde),
      (g)-[l:gehoertZu]->(o:Region),
      (g)<-[v:verwaltet]-(a:Amt)
RETURN g.name AS GemeindeName,
       'LU' AS KantonKurzname,
       alt.AbweichenderNameKSLU AS GemeindeNameSchule,
       toInteger(0) AS GemeindeVerzeichnisFlag,
       g.BFSNr AS GemeindeNummer,
       g.AnzahlEinwohner as AnzahlEinwohner,
       o.RegionCode AS RegionCode,
       o.name AS RegionName,
       o.RegionKuerzel AS RegionKuerzel,
       a.name AS AmtName,
       a.AmtKuerzel AS AmtKuerzel,
       g.GesamtRankIAZIKorrigiert AS BRank_Gesamt,
       g.ArbeitsmarktRankIAZIKorrigiert AS BRank_Arbeitsmarkt,
       g.BevoelkerungRankIAZIKorrigiert AS BRank_Bevoelkerung,
       g.ErreichbarkeitRankIAZIKorrigiert AS BRank_Erreichbarkeit,
       g.SicherheitRankIAZIKorrigiert AS BRank_Sicherheit,
       g.SteuerRankIAZIKorrigiert AS BRank_Steuerbelastung,
       g.VersorgungRankIAZIKorrigiert AS BRank_Versorgung,
       g.WohnenRankIAZIKorrigiert AS BRank_Wohnen,
       g.SteuerFuss AS SteuerFuss
UNION ALL
MATCH (g:Gemeinde)-[l:gehoertZu]->(o:Region),
      (g)<-[v:verwaltet]-(a:Amt)
WHERE g.AbweichenderNameKSLU IS NULL
RETURN g.name AS GemeindeName,
       'LU' AS KantonKurzname,
       g.name AS GemeindeNameSchule,
       toInteger(1) AS GemeindeVerzeichnisFlag,
       g.BFSNr AS GemeindeNummer,
       g.AnzahlEinwohner as AnzahlEinwohner,
       o.RegionCode AS RegionCode,
       o.name AS RegionName,
       o.RegionKuerzel AS RegionKuerzel,
       a.name AS AmtName,
       a.AmtKuerzel AS AmtKuerzel,
       g.GesamtRankIAZIKorrigiert AS BRank_Gesamt,
       g.ArbeitsmarktRankIAZIKorrigiert AS BRank_Arbeitsmarkt,
       g.BevoelkerungRankIAZIKorrigiert AS BRank_Bevoelkerung,
       g.ErreichbarkeitRankIAZIKorrigiert AS BRank_Erreichbarkeit,
       g.SicherheitRankIAZIKorrigiert AS BRank_Sicherheit,
       g.SteuerRankIAZIKorrigiert AS BRank_Steuerbelastung,
       g.VersorgungRankIAZIKorrigiert AS BRank_Versorgung,
       g.WohnenRankIAZIKorrigiert AS BRank_Wohnen,
       g.SteuerFuss AS SteuerFuss