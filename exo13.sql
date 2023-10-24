BEGIN;
WITH RECURSIVE exo13(x, y, n_mov) AS (

SELECT 2,2,0

UNION ALL

SELECT D.new_x, D.new_y, n_mov + 1
FROM depl D 
JOIN exo13 ex ON ex.x=D.x AND ex.y = D.y
WHERE n_mov <= 5  
)

SELECT DISTINCT * FROM exo13 WHERE x = 0 AND y = 9;
END;

