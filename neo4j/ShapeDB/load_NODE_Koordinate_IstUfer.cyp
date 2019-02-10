MATCH (k:Koordinate)<-[r1:liegtAuf]-(n:ShapeNode)<-[r2:hatEckpunkt]-(s:Shape)-[]-(g:Gemeinde)
//  668037, 209755
WHERE k.X>=668027 AND k.X<=668047
  AND k.Y>=209745 AND k.Y<=209765
RETURN k.name, k.X, k.Y, n.ShapeNodeID, g.name;

MATCH (k:Koordinate)
WHERE k.name='668028.162050001 209764.355'
SET   k.IstSeeufer=TRUE,
      k.SeeuferSteigung=toFloat(-1.5),
      k.SeeSeite='+';

MATCH (k:Koordinate)
WHERE k.name='669524.109049998 210116.609'
SET   k.IstSeeufer=TRUE,
      k.SeeuferSteigung=toFloat(-5),
      k.SeeSeite='-'

MATCH (k:Koordinate)
WHERE k.name='673070.965050001 212520.374'
SET   k.IstSeeufer=TRUE,
      k.SeeuferSteigung=toFloat(1),
      k.SeeSeite='-';





MATCH (k:Koordinate)<-[r1:liegtAuf]-(n:ShapeNode)-[r2:bildetShapeMit]->(m:ShapeNode)
WHERE k.IstSeeufer
RETURN n.name,
       r2.Slope, 
       k.SeeuferSteigung, 
       k.SeeSeite,
       (r2.Slope > k.SeeuferSteigung AND k.SeeSeite='+') AS imSee