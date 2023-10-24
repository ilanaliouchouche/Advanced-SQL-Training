BEGIN;
WITH tmp AS (

    SELECT order_id,
       SUM(quantity * (unit_price - (unit_price * discount))) AS price,
       LAG(SUM(quantity * (unit_price - (unit_price * discount)))) OVER(ORDER BY order_id) AS prev_price
    FROM order_details
    GROUP BY order_id
)

SELECT order_id, ROUND(price, 2) 
FROM tmp
WHERE price <= prev_price*1.1;
END;
