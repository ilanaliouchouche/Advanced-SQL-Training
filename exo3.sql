BEGIN;
SELECT order_id, order_date, ship_city, ship_country,
       COUNT(*) OVER(PARTITION BY ship_city ORDER BY order_date) as nc_v,
       COUNT(*) OVER(PARTITION BY ship_country ORDER BY order_date) as nc_p,
       COUNT(*) OVER(ORDER BY order_date) as nc,
       COUNT(*) OVER(PARTITION BY ship_country, order_date) as n_pj,
       COUNT(*) OVER(PARTITION BY ship_country ORDER BY order_date ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING) as n_pj
FROM orders;
END;
