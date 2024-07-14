-- find total quantity of Medicines with Subtotals of each drug from different suppliers using Rollup operation ?

SELECT medicine_details.SUPPLIER,Name_of_drug, SUM(medicine_details.QUANTITY)
FROM medicine_details
group by SUPPLIER,NAME_OF_DRUG WITH ROLLUP
ORDER BY SUPPLIER  DESC;