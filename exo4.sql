BEGIN;
SELECT order_id,
       LAG(order_id) OVER(ORDER BY order_date) as num_p,
       LAG(order_id) OVER(PARTITION BY ship_city ORDER BY order_date)as num_p_v
FROM orders;
END;
