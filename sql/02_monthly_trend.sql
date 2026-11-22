SELECT DATE_TRUNC('month',order_date) AS month,SUM(sales) AS sales,SUM(profit) AS profit
FROM sales GROUP BY DATE_TRUNC('month',order_date) ORDER BY month;
