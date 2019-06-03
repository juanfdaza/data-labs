import pandas as pd

# First of all we need to discover the encoding of the file -- pandas read csv

sharks = pd.read_csv('./input/GSAF5.csv',encoding='iso8859_15')

print(sharks.head(50))