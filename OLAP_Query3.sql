--  Identify number of times( count) of sale of those medicines 
-- which have sale value>200 in the year 2021 along with medicine name and arrange them in descending order of their medicinal name? 

SELECT  COUNT(Medicine_Name),Medicine_Name,date
from sales_details 
where (Total_sales>200) 
AND (date between '2021-01-01' and '2023-02-02') 
group by Medicine_Name,date WITH ROLLUP
 ORDER BY Medicine_Name ;