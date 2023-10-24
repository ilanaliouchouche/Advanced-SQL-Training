CREATE TABLE deplacements (x INTEGER,   
                           y INTEGER, 
                           new_x INTEGER,
                           new_y INTEGER);

COPY deplacements (x, y, new_x, new_y) 
FROM '/depl.csv'
WITH CSV;
