LOAD CSV WITH HEADERS FROM "data/GemeindeShape.csv" AS line WITH line
RETURN line
LIMIT 5;