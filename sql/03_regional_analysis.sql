SELECT region,COUNT(DISTINCT order_id) AS orders,SUM(sales) AS sales,SUM(profit) AS profit,
ROUND(100.0*SUM(profit)/NULLIF(SUM(sales),0),2) AS margin_pct
FROM sales GROUP BY region ORDER BY sales DESC;
