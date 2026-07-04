import pandas as pd

# Load data
df = pd.read_csv(
    "data/Sample - Superstore.csv",
    encoding="latin1"
)

# Convert dates
df["Order Date"] = pd.to_datetime(df["Order Date"])
df["Ship Date"] = pd.to_datetime(df["Ship Date"])

# Remove duplicates
df.drop_duplicates(inplace=True)

# Calculate KPIs
total_sales = df["Sales"].sum()
total_profit = df["Profit"].sum()
total_orders = df["Order ID"].nunique()

print("Total Sales:", total_sales)
print("Total Profit:", total_profit)
print("Total Orders:", total_orders)

# Save cleaned data to Excel
df.to_excel(
    "output/processed_superstore.xlsx",
    index=False
)

print("Pipeline executed successfully!")