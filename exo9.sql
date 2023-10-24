-- products (product name) order_details (quantité) orders (pour la date)

-- date product_name quantity 

-- on recupere de la table precedente, l'ANNEE puis pour chaque année on order by
-- la quantité et on prend la premièere valeur.

/*BEGIN;

SELECT DISTINCT 
       EXTRACT(YEAR FROM order_date) AS YEAR,
       FIRST_VALUE(product_name) OVER(PARTITION BY EXTRACT(YEAR FROM order_date) ORDER BY SUM(quantity) DESC) PRODUCT_NAME,
       FIRST_VALUE(SUM(quantity)) OVER(PARTITION BY EXTRACT(YEAR FROM order_date) ORDER BY SUM(quantity) DESC) QTITY
        
FROM products p, order_details od, orders o
WHERE p.product_id = od.product_id AND od.order_id = o.order_id
GROUP BY EXTRACT(YEAR FROM order_date), product_name, od.product_id;

END;*/

BEGIN;

WITH tmp1 AS (
SELECT EXTRACT(YEAR FROM order_date) as YEAR, product_name, SUM(quantity) as qtity
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON p.product_id = od.product_id
GROUP BY EXTRACT(YEAR FROM order_date), product_name 
),
tmp2 AS (
SELECT YEAR, MAX(qtity) as max_qtity
FROM tmp1
GROUP BY YEAR
)


SELECT tmp1.YEAR, product_name, qtity
FROM tmp1, tmp2
WHERE tmp1.YEAR = tmp2.YEAR AND tmp1.qtity = tmp2.max_qtity;

END;



