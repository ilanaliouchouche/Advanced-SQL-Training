from pandas import DataFrame, read_csv
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import seaborn as sns; 
sns.set()
import pandas as pd


headers = {'x' : 'i','y' : 'i','round' : 'f'}
data = pd.read_csv("heatmap-cte.csv", dtype=headers)
print(data[:3])
carte=data.pivot(index='y',columns='x')
carte.columns = carte.columns.droplevel(0)
ax = sns.heatmap(carte,cmap='RdYlGn_r', linewidths=0.5)
plt.savefig('heatmap-cte.png')
