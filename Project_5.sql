SELECT * FROM order_dataset;
#Total Orders and Returns
SELECT 
  COUNT(*) AS total_orders,
  SUM(CASE WHEN `Final Quantity` < 0 THEN 1 ELSE 0 END) AS total_returns,
  ROUND(SUM(CASE WHEN `Final Quantity` < 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS return_rate_percentage
FROM order_dataset;

#Return Rate by Category
SELECT 
  Category,
  COUNT(*) AS total_orders,
  SUM(CASE WHEN `Final Quantity` < 0 THEN 1 ELSE 0 END) AS total_returns,
  ROUND(SUM(CASE WHEN `Final Quantity` < 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS return_rate_percentage
FROM order_dataset
GROUP BY Category
ORDER BY return_rate_percentage DESC;

#Return Rate by Product (Item Code)
SELECT 
  `Item Code`,
  `Item Name`,
  COUNT(*) AS total_orders,
  SUM(CASE WHEN `Final Quantity` < 0 THEN 1 ELSE 0 END) AS total_returns,
  ROUND(SUM(CASE WHEN `Final Quantity` < 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS return_rate_percentage
FROM order_dataset
GROUP BY `Item Code`, `Item Name`
ORDER BY return_rate_percentage DESC
LIMIT 20;

#Monthly Return Trend
SELECT 
  TO_CHAR(TO_DATE(date, 'DD/MM/YYYY'), 'YYYY-MM') AS month,
  COUNT(*) AS total_orders,
  SUM(CASE WHEN `Final Quantity` < 0 THEN 1 ELSE 0 END) AS total_returns
FROM order_dataset
GROUP BY TO_CHAR(TO_DATE(date, 'DD/MM/YYYY'), 'YYYY-MM')
ORDER BY month;

#Return Rate by Buyer (to flag high-risk customers)
SELECT 
  `Buyer ID`,
  COUNT(*) AS total_orders,
  SUM(CASE WHEN `Final Quantity` < 0 THEN 1 ELSE 0 END) AS total_returns,
  ROUND(SUM(CASE WHEN `Final Quantity` < 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS return_rate_percentage
FROM order_dataset
GROUP BY `Buyer ID`
HAVING COUNT(*) > 5
ORDER BY return_rate_percentage DESC
LIMIT 20;

#Revenue Impact of Returns
SELECT 
  SUM(Refunds) AS total_refunded_amount,
  SUM(`Final Revenue`) AS net_revenue_after_returns,
  SUM(`Total Revenue`) AS gross_revenue
FROM order_dataset;

#High-Risk Product CSV (exportable list)
SELECT 
  `Item Code`,
  `Item Name`,
  Category,
  COUNT(*) AS total_orders,
  SUM(CASE WHEN `Final Quantity` < 0 THEN 1 ELSE 0 END) AS total_returns,
  ROUND(SUM(CASE WHEN `Final Quantity` < 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS return_rate_percentage
FROM order_dataset
GROUP BY `Item Code`, `Item Name`, Category
HAVING SUM(CASE WHEN `Final Quantity` < 0 THEN 1 ELSE 0 END) > 5
ORDER BY return_rate_percentage DESC;

#Behavioral Analysis Queries
##Most Frequently Returned Items
SELECT 
  `Item Name`, 
  `Item Code`,
  COUNT(*) AS return_orders
FROM order_dataset
WHERE `Final Quantity` < 0
GROUP BY `Item Name`,`Item Code`
ORDER BY return_orders DESC
LIMIT 10;

##Customers with Most Returns
SELECT 
 `Buyer ID`,
  COUNT(*) AS return_count
FROM order_dataset
WHERE `Final Quantity` < 0
GROUP BY `Buyer ID`
ORDER BY return_count DESC
LIMIT 10;

#Revenue Impact Analysis
##Revenue Lost Due to Returns (by Category)
SELECT 
  Category,
  SUM(Refunds) AS total_refunds,
  SUM(`Final Revenue`) AS revenue_after_returns
FROM order_dataset
WHERE `Final Quantity` < 0
GROUP BY Category
ORDER BY total_refunds DESC;

##Return Refund vs Sales Tax Analysis
SELECT 
  ROUND(SUM(Refunds), 2) AS total_refunded,
  ROUND(SUM(`Sales Tax`), 2) AS total_tax_collected,
  ROUND(SUM(`Overall Revenue`), 2) AS net_overall_revenue
FROM order_dataset;

#Product Quality or Risk Score Metrics
## Return Rate vs Revenue (High-Risk Products)
SELECT 
 `Item Code`,
 `Item Name`,
  COUNT(*) AS total_orders,
  SUM(CASE WHEN `Final Quantity` < 0 THEN 1 ELSE 0 END) AS returns,
  ROUND(SUM(CASE WHEN `Final Quantity` < 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS return_rate,
  ROUND(SUM(Refunds), 2) AS total_refunded
FROM order_dataset
GROUP BY `Item Code`, `Item Name`
HAVING COUNT(*) > 5 AND SUM(Refunds) < 0
ORDER BY return_rate DESC, total_refunded DESC;

#Performance by Price / Discount
## Return Rate by Discount Band
SELECT 
  CASE 
    WHEN `Price Reductions` <= -50 THEN 'High Discount'
    WHEN `Price Reductions` BETWEEN -49 AND -10 THEN 'Moderate Discount'
    WHEN `Price Reductions` BETWEEN -9 AND 0 THEN 'Low or No Discount'
  END AS discount_band,
  COUNT(*) AS total_orders,
  SUM(CASE WHEN `Final Quantity` < 0 THEN 1 ELSE 0 END) AS returns,
  ROUND(SUM(CASE WHEN `Final Quantity` < 0 THEN 1 ELSE 0 END)*100.0/COUNT(*), 2) AS return_rate
FROM order_dataset
GROUP BY discount_band;

#Anomaly Detection / Outliers
##Orders with Unusual Return Amounts
SELECT 
  `Item Code`,
  `Buyer ID`,
  Refunds,
  `Final Quantity`,
  `Final Revenue`,
  date
FROM order_dataset
WHERE Refunds < -100 OR `Final Quantity` < -2
ORDER BY Refunds ASC;








