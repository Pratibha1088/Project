# 📊 Sales and Order Data Analytics Project

## 📁 Project Overview

This project aims to analyze transactional sales and return data to uncover valuable business insights using a combination of **Python (Pandas, Seaborn, Matplotlib)**, **SQL**, and **Power BI**. The data contains order-level information including product categories, revenue, discounts, taxes, and return quantities. The final outcome includes a detailed **Power BI dashboard**, SQL-driven KPIs, and Python-based preprocessing and feature engineering.

---

## 🎯 Objectives

- Analyze customer purchasing and return behavior.
- Measure the impact of returns on revenue.
- Identify frequently returned products and high-risk customers.
- Detect anomalies in return/refund patterns.
- Build an interactive Power BI dashboard for visual insights.

---

## 🧩 Project Structure

| File | Description |
|------|-------------|
| `Project_5.ipynb` | Python notebook for data preprocessing and return flagging. |
| `Project_5.sql` | SQL queries to analyze sales metrics, return trends, and anomalies. |
| `order_dataset.csv` | Raw dataset containing transactional order data. |
| `Project_5.pbix` | Power BI file containing the interactive visual dashboard. |
| `Project Report.pdf` | Final report explaining methodology, tools, and insights. |

---

## 🛠️ Tools & Technologies

- **Python**
  - `pandas` for data manipulation
  - `matplotlib` and `seaborn` for optional visualization
- **SQL**
  - Aggregate queries for sales and return metrics
  - Behavior analysis by customer, category, and item
- **Power BI**
  - Interactive dashboard showing KPIs and trends

---

## 🧪 Features & Insights

- `Is Return` flag created for return analysis.
- Monthly return trends visualized in Power BI.
- High-return rate categories and products identified.
- Customer segmentation based on return frequency.
- Revenue loss computed due to refunds.
- Anomalous returns flagged based on refund amount and quantity.

---

## 📈 Power BI Dashboard Views

- Revenue trends (monthly/weekly/daily)
- Return rate by category and product
- Top-selling vs most-returned items
- Net revenue vs gross revenue comparison
- Return pattern by discount band

---

## 🧰 How to Use

### 1. Python Notebook
- Open `Project_5.ipynb` in Jupyter.
- Ensure `order_dataset.csv` is in the same folder.
- Run all cells to clean data and generate new features.

### 2. SQL
- Import `order_dataset.csv` into your SQL database (e.g., MySQL, PostgreSQL).
- Run queries from `Project_5.sql` to extract insights.

### 3. Power BI
- Open `Project_5.pbix` using Power BI Desktop.
- Refresh dataset and explore dashboard insights using slicers and filters.

---

## 📌 Key Metrics Analyzed

- Total Orders vs Returns
- Return Rate by:
  - Product
  - Category
  - Buyer
  - Discount Band
- Revenue Impact of Returns
- Outlier Detection (based on Refunds/Quantity)
- Risk Scoring for Products & Buyers

---

## 📜 License

This project was developed for academic and internship purposes and is intended for educational use.

---

## 🙌 Acknowledgments

Thanks to the project mentors and data support team for their guidance throughout this internship project. This project was instrumental in gaining hands-on experience with real-world data analysis and business intelligence tools.

