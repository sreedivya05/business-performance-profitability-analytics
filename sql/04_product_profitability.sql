SELECT p.product_name,p.category,SUM(s.sales) AS sales,SUM(s.profit) AS profit,
ROUND(100.0*SUM(s.profit)/NULLIF(SUM(s.sales),0),2) AS margin_pct,SUM(s.quantity) AS units
FROM sales s JOIN products p ON s.product_id=p.product_id
GROUP BY p.product_name,p.category ORDER BY profit DESC;
