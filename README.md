# 🛒 Zepto Inventory & Product Analytics Using SQL

## 📌 Project Overview  
This project analyzes a Zepto-style grocery dataset using SQL Server to extract actionable business insights related to inventory management, pricing strategy, discount behavior, stock availability, and category performance.

The goal is to simulate real-world retail analytics and support data-driven decision-making for inventory and revenue optimization.

---

## 🎯 Business Objectives  
- Understand category-wise inventory distribution  
- Analyze revenue contribution across product categories  
- Identify stock-out risks in high-value products  
- Evaluate discount strategies across categories  
- Study pricing behavior of premium products  
- Optimize inventory allocation and warehouse planning  

---

## 🧹 Data Cleaning & Preparation  
- Removed invalid records where **MRP or Selling Price was 0**  
- Converted price fields from **paise to rupees for accurate analysis**  
- Standardized key numeric columns (MRP, selling price, discount, weight)  
- Handled duplicate product entries to ensure clean category-level analysis  
- Validated stock status for correct classification (in-stock vs out-of-stock)  
- Ensured proper data types for all numeric operations in SQL  

---

## 📊 Key Insights  

- Dataset contains **3731 products across 14 categories**  
- Stock breakdown:
  - **3279 products in stock**
  - **453 products out of stock**

- Revenue insights:
  - **Munchies and Cooking Essentials** generate the highest revenue  
  - **Fruits & Vegetables** contribute the lowest revenue  

- Discount patterns:
  - Highest discounts in **Fruits & Vegetables (15%)** and **Meats, Fish & Eggs (11%)**  
  - FMCG categories maintain **stable moderate discounts (~8%)**  
  - Premium products mostly have **low or zero discounts**

- Pricing behavior:
  - High-MRP items include **ghee, oils, baby care, and personal care products**  
  - Essential branded products show **stable pricing with minimal promotional changes**

- Inventory distribution:
  - Highest inventory weight in **Munchies and Cooking Essentials**  
  - Fresh categories maintain **lower stock due to perishability**  
  - FMCG products dominate overall warehouse allocation  

---

## 📊 SQL Analysis Performed  
- Category-wise revenue estimation  
- Stock availability analysis  
- Discount percentage analysis  
- High-MRP vs out-of-stock analysis  
- Inventory weight calculation per category  
- Product duplication and data consistency checks  

---

## 🛠 Tools & Technologies  
- SQL Server  
- SQL (SELECT, GROUP BY, JOIN, CASE WHEN, Aggregations)  
- Data Cleaning (UPDATE, DELETE)  
- Data Aggregation & Business Reporting  

---

## 🚀 Business Impact  
This analysis helps in:
- Improving inventory planning and warehouse utilization  
- Identifying high-revenue categories for business focus  
- Understanding discount strategies across product types  
- Detecting stock shortage risks in premium products  
- Supporting data-driven retail decision-making  

---

## 📌 Outcome  
This project demonstrates how SQL can be used to transform raw retail data into meaningful business insights for inventory optimization, pricing strategy, and category performance analysis.
