SELECT sp.salesperson_name,sp.team,sp.region,COUNT(DISTINCT s.order_id) AS orders,
SUM(s.sales) AS sales,SUM(s.profit) AS profit,
ROUND(100.0*SUM(s.profit)/NULLIF(SUM(s.sales),0),2) AS margin_pct
FROM sales s JOIN salespersons sp ON s.salesperson_id=sp.salesperson_id
GROUP BY sp.salesperson_name,sp.team,sp.region ORDER BY sales DESC;
