MATCH (k:Koordinate)<-[r1:liegtAuf]-(n:ShapeNode)<-[r2:hatEckpunkt]-(s:Shape)-[r3:istTeilVon]->(g:Gemeinde),
      (u:UferpunktTemp)
WHERE k.X < u.X + 20 AND k.X > u.X - 20
  AND k.Y < u.Y + 20 AND k.Y > u.Y - 25
RETURN "MATCH (k:Koordinate) WHERE k.name='"
       + MAX(k.name)
       + "' SET k.UferpunktID="
       + u.UferpunktID
       + ", k.SeeuferSteigung="
       + u.SeeuferSteigung
       + ", k.SeeSeite='"
       + u.SeeSeite
       +"';";