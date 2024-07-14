-- Count total number of Distinct types of employee along with their city working in pharmacy store and arrange them in descending order of Position?

SELECT COUNT(Position),Position,city
FROM employee
GROUP BY Position,city WITH ROLLUP
ORDER BY Position DESC;