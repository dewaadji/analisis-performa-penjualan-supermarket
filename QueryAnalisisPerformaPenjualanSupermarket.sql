/*
ANALISIS PERFORMA PENJUALAN SUPERMARKET
*/

-- view data
select *
from supermarket_sales limit 5;

select *
from supermarket_sales;

-- drop kolom yang tidak diguunakan
alter table supermarket_sales drop Branch;
alter table supermarket_sales drop Tax;
alter table supermarket_sales drop Date_of_time;
alter table supermarket_sales drop gross_margin_percentage;
alter table supermarket_sales drop cogs;

-- IDENTIFIKASI DATA
-- Melihat cabang tiap kota
select distinct(city)
from supermarket_sales;

-- mengetahui product_line yang ada
select distinct Product_line
from supermarket_sales;


-- ANALISIS PENJUALAN DAN PERFORMA CABANG
-- jumlah total pendapatan kotor dari tiap cabang
select City, round(sum(gross_income), 2) as GrossIncome
from supermarket_sales
group by City
order by GrossIncome desc;

-- kota cabang dengan jumlah aktivitas penjualan tertinggi
select City, count(city) as Transaksi
from supermarket_sales
group by city
order by count(city) desc;


-- ANALISIS CUSTOMER DAN PRODUK
-- metode pembayaran yang sering digunakan customer berdasarkan gender
select City, Gender, Payment, count(Payment) as Count
from supermarket_sales
group by City, Gender
order by City desc;

-- kategori prodk yang sering dibeli
select City, Product_line, Count(Product_line)
from supermarket_sales
group by city, Product_line
order by count(Product_line) desc;

-- kategory produk yang sering dibeli berdasarkan total jumlahnya
select City, Product_line, Sum(Quantity)
from supermarket_sales
group by city, Product_line
order by city desc, sum(Quantity) desc;

-- produk yang mendapatkan rating paling tinggi berdasarkan tiap cabang
select City, Product_line, max(Rating) as Rating, count(rating) as Count
from supermarket_sales
where rating = 10
group by city, Product_line
order by city desc;

