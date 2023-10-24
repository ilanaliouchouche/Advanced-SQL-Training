BEGIN;
WITH RECURSIVE exo11(id, niveau, affichage, chemin) as(
        
SELECT employee_id as id,
       0 as niveau, 
       CAST(lastname AS VARCHAR) as affichage,
       CAST(lastname AS VARCHAR) as chemin
FROM employees
WHERE reports_to is NULL

UNION ALL

SELECT e.employee_id as id,
       (ex.niveau + 1) as niveau,
       REPEAT(' ', 2*(ex.niveau + 1)) || CAST(e.lastname AS VARCHAR) as affichage,
       chemin || '/' || CAST(e.lastname AS VARCHAR) as chemin
       FROM employees e
       JOIN exo11 ex ON ex.id = e.reports_to
 
 )

SELECT affichage, chemin 
       FROM exo11;

END;
