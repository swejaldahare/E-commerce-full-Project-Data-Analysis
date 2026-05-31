import pandas  as pd
import matplotlib.pyplot as plt
import seaborn  as sns
from mpl_toolkits.axes_grid1 import host_axes

df = pd.read_csv('ecommerce_sales_dataset.csv')
print(df)


#%%
df.head()
print(df.info())
print(df.describe())
print(df.shape)
#%%
df.columns
#%%
df.dtypes
#%%
df.isnull().sum(
)
#%%
# Convert order_date to datetime.
df['order_date'] = pd.to_datetime(df['order_date'], dayfirst=True)
print(df['order_date'])
#%%
# Check duplicate rows.

df.duplicated().sum()
#%%
# Find total sales.

df['sales'].sum()
#%%
# Find average sales.
df['sales'].mean()
#%%
# Find total profit.

df['profit'].sum()
#%%
# Find highest sales.

df['sales'].max()
#%%
# Find lowest sales.

df['sales'].min()
#%%
# Total sales by category.

df.groupby('category')['sales'].sum()

#%%
df['category'].unique()
#%%
# Total profit by region.

df.groupby('region')['profit'].sum()
#%%
# Average rating by product.

df.groupby('product')['customer_rating'].mean()
#%%
# Top 5 cities with highest sales.

df.groupby('city')['sales'].sum().sort_values(ascending=False).head()
#%%
# Show orders where sales > 3000.

df[df['sales']>3000]
#%%
df[df['category']=='Electronics']
#%%
# Sort by profit descending.

df.sort_values(by='profit', ascending=False)
#%%
# Create Profit Percentage column.

df['profit_percentage']= (df['profit']/df['sales'])*100
#%%
print(df['profit_percentage'])
#%%
# visualization
# bar chart for a category sales
df.groupby('category')['sales'].sum().plot(kind='bar')
plt.show()
#%%
# line chart for monthly sales

df['order_date'] = pd.to_datetime(df['order_date'], dayfirst=True)

df['month'] = df['order_date'].dt.month


monthly_sales = df.groupby('month')['sales'].sum()
monthly_sales.plot(kind='line')
plt.show()
#%%
# pie chart for payment method
df['payment_method'].value_counts().plot(kind='pie',autopct='%1.1f%%')
plt.show()
#%%
# boxplot for sales
sns.boxplot(x=df['sales'])
plt.show()
#%%
# KPI
# total sales
# total profit
# total order
# avg orders value

total_sales = df['sales'].sum()
total_profit = df['profit'].sum()
total_orders = df['order_id'].count()
avg_order_values = df['sales'].mean()


print('total_sales:',total_sales)
print('total_profit:',total_profit)
print('total_orders:',total_orders)
print('avg_order_values:',avg_order_values)
#%%
# create a pivot table
pd.pivot_table (
    df,
    values='sales',
    index='region',
    columns='category',
    aggfunc='sum'
)
#%%
# find correlation
df[['sales','profit','quantity']].corr()
#%%
# create heatmap
sns.heatmap(df[['sales','profit','quantity']].corr(),annot=True)
plt.show()
#%%
import mysql.connector
from sqlalchemy import create_engine

username = 'root'
password = 'Swejal_dahare'
host = 'Localhost'
database = 'project'

engine = create_engine(
    f'mysql+pymysql://{username}:{password}@{host}/{database}'
)
print('connection to mysql successfully')

with engine.connect() as conn:
    print('connection to mysql successfully')

#%%
table_name = 'sales_data'
df.to_sql(table_name,engine, if_exists='replace', index=False)
print('Data upload successfully')
#%%


