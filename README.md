# 👟 Nike Product Pricing & Inventory Analysis (MySQL Project)

## 📌 Project Overview

This project analyses a Nike product dataset using MySQL to evaluate pricing strategy, discount effectiveness, inventory allocation, and revenue concentration.

The objective was to transform product-level transactional data into actionable business insights around revenue generation, stock risk, and product performance.

---

## 🗂 Dataset Summary

**Rows:** 100
**Columns:** 14

### Key Columns:

* `product_id`
* `product_name`
* `category`
* `MRP`
* `discount`
* `selling_price`
* `release`
* `size`
* `colour`
* `material`
* `gender`
* `rating`
* `stock`
* `quantity`

Revenue was calculated as:

```
selling_price × quantity
```

---

## 🎯 Business Objectives

This analysis focuses on:

* Evaluating discount dependency
* Identifying revenue concentration risk
* Detecting inventory inefficiencies
* Understanding the rating vs demand relationship
* Segmenting performance by gender and pricing tier

---

## 📊 Key Areas of Analysis

### 1️⃣ Revenue & Pricing Strategy

* Total revenue calculation
* Revenue by category & gender
* Premium vs budget performance
* Pareto analysis (Top 20% revenue contribution)
* Discount vs sales relationship
* Inefficient discount detection

---

### 2️⃣ Inventory & Risk Management

* Stockout risk detection
* Overstocked & dead inventory identification
* Inventory value locked in stock
* Category-wise unsold inventory value
* Stock turnover ratio analysis

---

### 3️⃣ Rating & Demand Analysis

* Rating impact on sales
* Category-level rating comparison
* Discount vs rating relationship
* High-rated but low-selling products

---

### 4️⃣ Variant & Segmentation Insights

* Revenue by size
* Discount dependency by gender
* Revenue concentration by pricing tier
* Gender-based performance split

---

## 🔎 Sample Strategic Findings

* Revenue shows concentration among a small percentage of products (Pareto effect).
* Some heavily discounted products underperform in sales.
* Inventory value is unevenly distributed across categories.
* Higher ratings do not always guarantee higher demand.
* Certain pricing tiers outperform others in revenue contribution.

(Note: Insights reflect patterns within this sample dataset and are intended for analytical demonstration purposes.)

---

## 🛠 SQL Techniques Used

* Aggregations (SUM, AVG, COUNT)
* CASE statements for segmentation
* CTEs (Common Table Expressions)
* Window Functions (NTILE for Pareto analysis)
* Revenue modelling
* Stock turnover calculations

---

## ⚠️ Dataset Scope Note

This dataset contains 100 products and represents a product-level analytical snapshot. Insights derived are scoped to this sample and are intended to demonstrate structured analytical reasoning rather than enterprise-scale conclusions.

---

## 🚀 Project Outcome

This project demonstrates the ability to:

* Translate raw product data into business decisions
* Evaluate pricing efficiency
* Detect inventory risk exposure
* Apply structured SQL problem-solving
* Present analytical insights clearly and professionally

---

## ⭐ Connect

If you found this project insightful, feel free to connect and discuss data analytics, pricing strategy, or retail optimisation.
