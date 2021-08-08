# Pewlett-Hackard-Analysis

## Overoview of the analysis
Use Postgres database and pgadmin interface where Structured Query Language (SQL) can be used to ask questions of data and discover relationships between different data tables.

This particular project is to help a large company Pewlett Hackard determine the number of retiring employees per title and identify employees who are eligible to participate in a mentorship program. 

## Results
- Retiring employees who have multiple titles usually started as an assistant engineer, engineer or staff and climb the ladder to have their senior titles. 

![assist_eng](https://user-images.githubusercontent.com/84931545/128621844-cefbd899-b373-468a-892f-5c21a9fc9ad0.PNG)

![senior eng](https://user-images.githubusercontent.com/84931545/128621847-d5f0b2a4-596e-412f-9a6f-48c51a87ea87.PNG)

![staff](https://user-images.githubusercontent.com/84931545/128621848-dcdc2562-5292-4f3c-abdb-76811be55e5a.PNG)



- Observing the retiring_titles table, one can see that retiring employees holding Senior titles such as Senior Engineer and Senior Staff occupy 63.7% of the retiring employees.

- For those who are eligible for mentorship programs, more than half are from engineer and senior staff positions. 

- There are no managers eligible for mentorship programs; Manager title also has the least amount of retiring employees.

![retiring_titles](https://user-images.githubusercontent.com/84931545/128621855-631ed922-cef8-4dba-b9b1-dbc48592d604.PNG)


## Summary
- There will be a total of 90398 roles to fill as the "silver tsunami" begins to make an impact! Additional queries on retiring_titles provided insight into how many roles will need to be filled.

![Silver](https://user-images.githubusercontent.com/84931545/128621883-d0c1dcf8-63ec-4dd1-b236-75d717191348.PNG)


- The question of whether there will be enough qualified, retirement-ready employees in each department to mentor the next generation is answered by queries on the mentorship_eligibilty table! There are enough retirement-ready employees for every single department to mentor the next generation of Pewlett Hackard employees.

![Mentor_titles](https://user-images.githubusercontent.com/84931545/128621885-f2daa265-3782-4f39-a5bc-3b591db8c6ce.PNG)
![retiring_titles](https://user-images.githubusercontent.com/84931545/128621895-3ff7a8be-a655-4df6-8bfa-750bc8b50243.PNG)
