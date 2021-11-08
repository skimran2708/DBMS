SELECT year_no, month_no, tot_sales,
  rank() over (partition by year_no
               order by tot_sales desc) sales_rank
FROM sales_fact;