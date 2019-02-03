MATCH (s:SchuelerTmp)
CREATE (:Schueler {SchuelerID:s.SchuelerID, name:s.SchuelerID});
