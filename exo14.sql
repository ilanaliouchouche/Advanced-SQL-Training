BEGIN;

WITH RECURSIVE 
    compte_choix(x, y, n_choix) AS (
        SELECT x, y, COUNT(*)
        FROM depl
        GROUP BY x, y
    ), 
    proba(x, y, n_mov, prob) AS (
        SELECT 2, 2, 0, 1.0

        UNION ALL

        SELECT d.new_x, d.new_y, p.n_mov + 1, (p.prob / cc.n_choix)
        FROM depl d
        JOIN proba p ON d.x = p.x AND d.y = p.y
        JOIN compte_choix cc ON d.x = cc.x AND d.y = cc.y
        WHERE p.n_mov < 4
    )
    
SELECT x, y, ROUND(sum(prob), 3) 
FROM proba 
WHERE n_mov = 4 
GROUP BY x, y;

END;

