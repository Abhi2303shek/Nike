create database nike_sale;
use nike_sale;

-- / -- 💰 1️⃣ Revenue & Pricing (Core Business) -- /
## 1. What is the total revenue? (selling_price × quantity)
select sum(selling_price*quantity) as revenue from nike;

## 2. Revenue by category?
select sum(selling_price*quantity) as revenue, category from nike group by category;

## 3. Revenue by gender?
select sum(selling_price*quantity) as revenue, gender from nike group by gender;

## 4. What % of revenue comes from top 20% products? (Pareto)
with product_revenue as (select product_id, sum(selling_price*quantity) as revenue from nike group by product_id),
ranked_products as (select *, ntile(5) over(order by revenue desc) as revenue_bucket from product_revenue)
select(sum(case when revenue_bucket=1 then revenue end) / (select sum(selling_price*quantity) from nike))*100 as top20_revenue_pct from ranked_products;

## 5. Average discount % by category?
select avg(discount) as disc, category from nike group by category;

## 6. Do higher discounts increase quantity sold?
select discount, avg(quantity) as avg_qty from nike group by discount order by discount;

## 7. Which products have high discount but low sales?
select product_id, product_name, discount, quantity from nike where discount > (select avg(discount) from nike) and quantity < (select avg(quantity) from nike);

## 8. Premium vs Budget revenue comparison (based on MRP tiers)?
select case when MRP>700 then 'Premium' else 'Budget' end as MRP_tier, round(sum(selling_price*quantity),2) from nike group by MRP_tier;


-- / --  📦 2️⃣ Inventory & Risk --/
## 9. Which products are at risk of stockout?
select product_id, product_name, stock, quantity from nike where quantity > (select avg(quantity) from nike) and stock < (select avg(stock) from nike);

## 10. Which products are overstocked but not selling?
select product_id, product_name, stock, quantity from nike where quantity < (select avg(quantity) from nike) and stock > (select avg(stock) from nike);

## 11. Total inventory value locked (stock × selling_price)?
select round(sum(selling_price*stock),2) as inventory from nike;

## 12. Category with highest unsold inventory value?
select category, round(sum(selling_price*stock),2) as inventory from nike group by category order by inventory desc limit 1;

## 13. Stock turnover ratio per product (quantity / stock)?
select product_id, round(quantity/stock, 2) as turnover_ratio from nike where stock>0 order by turnover_ratio desc;


-- /-- ⭐ 3️⃣ Rating & Demand -- /
## 14. Do higher-rated products sell more?
select product_id, product_name, quantity, rating from nike where rating > (Select avg(rating) from nike) and quantity > (select avg(quantity) from nike);

## 15. Category with highest average rating?
select category, avg(rating) as avg_rate from nike group by category order by avg_rate desc limit 1;

## 16. Are discounted products rated lower?
select case when discount>0 then 'Discounted' else 'Not' end as discount_state, avg(rating) as avg_rate from nike group by discount_state;

## 17. Which highly rated products are underperforming?
select product_id, product_name, quantity, rating from nike where rating > (Select avg(rating) from nike) and quantity < (select avg(quantity) from nike);



-- /--  👟 4️⃣ Variant & Segmentation -- /
## 18. Which size generates highest revenue?
select size, round(sum(selling_price*quantity),2) as revenue from nike group by size order by revenue desc limit 1;

## 19. Which gender segment is most discount dependent?
select gender, avg(discount) as avg_disc from nike group by gender order by avg_disc desc;

## 20. Revenue concentration by pricing tier (budget/mid/premium)?
select case when MRP>700 then 'Premium' when MRP>400 then 'Mid' else 'Budget' end as MRP_tier, round(sum(selling_price*quantity),2) from nike group by MRP_tier;
