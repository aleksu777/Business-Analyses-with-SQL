
-- Pulling the number of time an employee chnaged positions in the company
-- in descening order 

/*

SELECT 
      
      COUNT(t.title) AS number_of_positions,
      e.emp_no,
      e.last_name,
      e.first_name
 
FROM "public"."employees" as e
    LEFT JOIN titles as t
        ON e.emp_no = t.emp_no
WHERE e.hire_date > '1991-01-01'
GROUP BY 2,3
ORDER BY 1 DESC; 


-- Show all employees in  department development and the from and to date


SELECT 
      e.emp_no, 
      de.from_date, 
      de.to_date
      
FROM employees as e
     JOIN dept_emp AS de USING(emp_no)
     
WHERE de.dept_no = 'd005'

GROUP BY e.emp_no, de.from_date, de.to_date
ORDER BY e.emp_no, de.to_date;



-- Pulling how many female employees work in a particular department 

SELECT 
      d.dept_name,
      count(e.emp_no) AS number_of_female_employees

FROM employees as e 
INNER JOIN dept_emp as de 
      ON e.emp_no = de.emp_no
INNER JOIN departments as d 
      ON de.dept_no = d.dept_no
      
WHERE e.gender = 'F'

GROUP BY 1

HAVING count(e.emp_no) > 25000;



-- Pull all employees hired after 1991 that have had 2 or more postions within company

SELECT 
      e.emp_no,
      concat( e.first_name, ' ', e.last_name ) AS names_of_empl,
      -- e.first_name,
      -- e.last_name,
      COUNT(t.title) AS number_of_titles
      
FROM employees as e 
INNER JOIN titles as t USING(emp_no)
      
WHERE EXTRACT (YEAR FROM e.hire_date ) > 1991

GROUP BY e.emp_no, names_of_empl

HAVING COUNT(t.title) > 2

ORDER BY 3 DESC;
      



SELECT 
      e.emp_no,
      concat( e.first_name, ' ', e.last_name ) AS names_of_empl,
      
      COUNT(de.dept_no) AS number_of_departments
      
FROM employees as e 
INNER JOIN dept_emp as de USING(emp_no)

GROUP BY e.emp_no, names_of_empl

HAVING COUNT(de.dept_no)  > 1

ORDER BY 3 DESC;



-- Pulling average salary by department to compare to each individual's salary 
-- in that department

SELECT 
      s.emp_no,
      s.salary,
      AVG(salary)  OVER(
      PARTITION BY d.dept_name) as avg_salary_for_dept,
      d.dept_name
      
FROM salaries AS s
JOIN dept_emp as de using(emp_no)
JOIN departments as d using( dept_no)

ORDER BY avg_salary_for_dept DESC;

-- Sales department has the highest AVG annual pay
-- and how each employee in that department compares their pay to that AVG




-- I do population analysis for potential new business markets

-- In this particular table I show population per contient as percentage of total world population

SELECT 
      DISTINCT continent,
      
      SUM(population) OVER (
      PARtition BY continent),
      
      
      
      CONCAT(
            ROUND(
                  (SUM(population::float4) OVER (
                   PARtition BY continent))/(SUM(population::float4) OVER ())*100), '%') AS percentage_of_total_population
     

 
FROM country 
ORDER BY 2 DESC

-- No surprise Asia is on top





-- Simple CASE example to partition products by price 
SELECT 
    
    prod_id,
    title,
    price,
    CASE 
        WHEN price > 20 THEN 'expensive'
        WHEN price BETWEEN 10 AND 20 THEN 'average'
        WHEN price <=10 THEN 'cheap'
    END AS price_average
       
    FROM products
    ORDER BY price DESC
    
      
    */
    










