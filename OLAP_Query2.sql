-- Find Medicine names along with Sum of Sales(Total sales) of those drugs sold between '2021-11-23' & '2022-09-02' and Analyse it using OLAP Opeation?

SELECT s.Medicine_Name, SUM(Total_sales) AS sales
FROM sales_details s
JOIN medicine_details M ON s.DRUG_ID = M.DRUG_ID
WHERE (date BETWEEN '2021-11-23' AND '2022-09-02')
GROUP BY s.Medicine_Name WITH ROLLUP
ORDER BY s.Medicine_Name;