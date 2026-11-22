import pandas as pd
from pathlib import Path
BASE=Path(__file__).resolve().parents[1]
sales=pd.read_csv(BASE/'data/sales.csv')
products=pd.read_csv(BASE/'data/products.csv')
salespersons=pd.read_csv(BASE/'data/salespersons.csv')
total=sales.sales.sum(); profit=sales.profit.sum()
print('Orders:',sales.order_id.nunique())
print('Customers:',sales.customer_id.nunique())
print('Sales:',round(total,2))
print('Profit:',round(profit,2))
print('Profit margin:',round(100*profit/total,2),'%')
r=sales.groupby('region').agg(sales=('sales','sum'),profit=('profit','sum'),orders=('order_id','nunique'))
r['margin_pct']=100*r.profit/r.sales
print('\nRegional performance:\n',r.sort_values('sales',ascending=False))
p=sales.merge(products,on='product_id').groupby(['product_id','product_name','category']).agg(sales=('sales','sum'),profit=('profit','sum'),units=('quantity','sum'))
p['margin_pct']=100*p.profit/p.sales
print('\nTop products by profit:\n',p.sort_values('profit',ascending=False).head(10))
rep=sales.merge(salespersons,on='salesperson_id').groupby(['salesperson_id','salesperson_name','team','region']).agg(sales=('sales','sum'),profit=('profit','sum'),orders=('order_id','nunique'))
rep['margin_pct']=100*rep.profit/rep.sales
print('\nTop salespeople:\n',rep.sort_values('sales',ascending=False).head(10))
