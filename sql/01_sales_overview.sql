SELECT COUNT(DISTINCT order_id) AS orders, COUNT(DISTINCT customer_id) AS customers,
ROUND(SUM(sales),2) AS total_sales, ROUND(SUM(profit),2) AS total_profit,
ROUND(100.0*SUM(profit)/NULLIF(SUM(sales),0),2) AS profit_margin_pct
FROM sales;
