BEGIN; 
SELECT ship_country, ship_city,
       COUNT(*) as NBORDERS,
       SUM(COUNT(*)) OVER(PARTITION BY ship_country) as NBORDCTY,
       MAX(COUNT(*)) OVER(PARTITION BY ship_country) as NBORMAXCTY
FROM orders
GROUP BY ship_country, ship_city;
END;
