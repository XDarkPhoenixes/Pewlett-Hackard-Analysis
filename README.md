# Pewlett-Hackard-Analysis

## Overoview of the analysis
Use Postgres database and pgadmin interface where Structured Query Language (SQL) can be used to ask questions of data and discover relationships between different data tables.

This particular project is to help a large company Pewlett Hackard determine the number of retiring employees per title and identify employees who are eligible to participate in a mentorship program. 

## Results
- Retiring employees who have multiple titles usually started as an assistant engineer, engineer or staff and climb the ladder to have their senior titles. 

- Observing the retiring_titles table, one can see that retiring employees holding Senior titles such as Senior Engineer and Senior Staff occupy 63.7% of the retiring employees.

- For those who are eligible for mentorship programs, more than half are from engineer and senior staff positions. 

- There are no managers eligible for mentorship programs; Manager title also has the least amount of retiring employees.

## Summary

- There will be a total of 90398 roles to fill as the "silver tsunami" begins to make an impact! Additional queries on retiring_titles provided insight into how many roles will need to be filled.

- The question of whether there will be enough qualified, retirement-ready employees in each department to mentor the next generation is answered by queries on the mentorship_eligibilty table!

There are enough retirement-ready employees for every single department to mentor the next generation of Pewlett Hackard employees.