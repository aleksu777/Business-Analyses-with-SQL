
-- Pulling the number of time an employee chnaged positions in the company
-- in descening order 

SELECT 
      
      COUNT(t.title) AS number_of_positions,
      e.emp_no,
      e.last_name,
      e.first_name
 
FROM "public"."employees" AS e
    LEFT JOIN titles AS t
        ON e.emp_no = t.emp_no
WHERE e.hire_date > '1991-01-01'
GROUP BY 2,3
ORDER BY 1 DESC