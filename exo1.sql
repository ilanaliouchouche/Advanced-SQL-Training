BEGIN;
SELECT order_id, order_date, ship_city, ship_country, freight,
       COUNT(*) OVER(PARTITION BY ship_city) as n_v,
       COUNT(*) OVER(PARTITION BY ship_country) as n_p,
       SUM(freight) OVER(PARTITION BY ship_country) as poids_p,
       SUM(freight) OVER(PARTITION BY order_date, ship_country) as poids_p_j
FROM orders;
END;
