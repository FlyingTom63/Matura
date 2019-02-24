MATCH (g:Gemeinde)
SET g.GemeindeNameLU = REPLACE(g.name, ' (LU)', '');