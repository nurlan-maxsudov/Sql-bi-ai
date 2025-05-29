
--1. 
Create table stepNumbers
(step_number int, status VARCHAR(50))

INSERT INTO stepNumbers([Step_Number], [Status]) VALUES
(1, 'Passed'),
(2, 'Passed'),
(3, 'Passed'),
(4, 'Passed'),
(5, 'Failed'),
(6, 'Failed'),
(7, 'Failed'),
(8, 'Failed'),
(9, 'Failed'),
(10, 'Passed'),
(11, 'Passed'),
(12, 'Passed');


select min(step_number) as MinStepNumber, max(step_number) as MaxStepNumber, status, count(*) as Consecutive_Count
from 
    (select step_number, Status, 
        sum(pref_gr) over(order by step_number) as group_id
    from 
        (select step_number, Status, 
            iif(lag(status, 1, '-') over(order by step_number) != Status, 1, 0) as pref_gr
        from stepNumbers) 
        as t1) 
    as t2
group by group_id, status
order by group_id


--2.
CREATE TABLE [dbo].[EMPLOYEES_N]
(
    [EMPLOYEE_ID] [int] NOT NULL,
    [FIRST_NAME] [varchar](20) NULL,
    [HIRE_DATE] [date] NOT NULL
);

INSERT INTO EMPLOYEES_N (EMPLOYEE_ID, FIRST_NAME, HIRE_DATE) VALUES
(1, 'Alice', '1975-06-10'),
(2, 'Bob', '1976-08-12'),
(3, 'Carol', '1977-09-20'),
(4, 'David', '1979-03-15'),
(5, 'Ella', '1980-11-01'),
(6, 'Frank', '1982-01-02'),
(7, 'Grace', '1983-05-18'),
(8, 'Helen', '1984-09-10'),
(9, 'Ian', '1985-12-21'),
(10, 'Jack', '1990-07-30'),
(11, 'Karen', '1997-03-12');


select concat(lag(max_year, 1) over(order by min_year), '-',min_year) as years
from(
    select group_id, min(hire_year) - 1 as min_year, max(hire_year) + 1 as max_year
    from (
        select *, hire_year - ROW_NUMBER() over(order by hire_year) as group_id
        from (
            select 1974 as hire_year
            union all
            select distinct year(hire_date)
            from [dbo].[EMPLOYEES_N]
            where year(hire_date) >= 1975
            union all
            select year(getdate()) + 1
            ) as by_year
        ) as t1
    group by group_id
) as t2
order by min_year 
offset 1 row

SELECT CONVERT(ROUND(19.1232, 2) 

