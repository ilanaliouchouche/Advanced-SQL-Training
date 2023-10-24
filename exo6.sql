BEGIN;
SELECT ship_country, ship_city,
       COUNT(*) as NBORDERS,
       DENSE_RANK() OVER(PARTITION BY ship_country ORDER BY COUNT(*)) as RANK
FROM orders
GROUP BY ship_country, ship_city
ORDER BY ship_country, RANK;
END;
