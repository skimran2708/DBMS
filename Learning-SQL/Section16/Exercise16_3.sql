SELECT year_no, month_no, tot_sales,
  lag(tot_sales) over (order by month_no) prev_month_sales
FROM sales_fact
WHERE year_no = 2020;