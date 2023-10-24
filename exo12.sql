BEGIN;
WITH RECURSIVE exo12(n, res) AS (

SELECT 0,
       127

UNION ALL

SELECT n + 1,
       CASE 
            WHEN MOD(res, 2) = 0 THEN res/2
            ELSE 3*(res/2)+1 
       END 
FROM exo12
WHERE n <= 49

)

SELECT * FROM exo12 WHERE n<=50;

END;
