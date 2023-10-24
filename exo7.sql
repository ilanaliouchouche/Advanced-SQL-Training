BEGIN;
SELECT ship_country, ship_city,
       COUNT(*) as NBORDERS,
       DENSE_RANK() OVER(PARTITION BY ship_country ORDER BY COUNT(*)) as RANK,
       ROUND((SUM(COUNT(*)) OVER(PARTITION BY ship_city)) / (SUM(COUNT(*)) OVER(PARTITION BY ship_country)), 2) as PERCENTG
FROM orders
GROUP BY ship_country, ship_city
ORDER BY ship_country, RANK;
END;
