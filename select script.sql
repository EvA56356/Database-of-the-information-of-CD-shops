-- select for Kenan Duan 1929926
-- 1
select store_name from retail_store where region = "north" 
order by store_name ASC;

-- 2
select name as shopkeeper_name 
from employee where job = "shopkeeper";

-- 3
select name as staff_name
from employee where job in( "sales staff", "shop cleaner");

-- 4
select game_title from game
where age_rating < 15
order by game_title ASC;

-- 5
select game_title as `the oldest game` from game
where release_date<= ALL (select release_date from game  );

-- 6
select count(game_title) as `number of game` from game;

-- 7
select count(game_title) as `number of game` from game where age_rating <18;

-- 8
select max(year (release_date))- min(year (release_date)) as `year difference`
from game;

-- 9
select CD_title from cd right outer join cd_management 
on cd.serial_num=cd_management.serial_num
where game_title= "Counter-Strike: Global Offensive";

-- 10
select game_title from cd right outer join cd_management 
on cd.serial_num=cd_management.serial_num
where cd_title ="VintageFun 5 in 1 2020";

-- 11
select avg(age_rating) as `average age rating` 
from cd right outer join cd_management 
on cd.serial_num=cd_management.serial_num
where cd_title ="VintageFun 5 in 1 2020";

-- 12
select name from employee right outer join work_record 
on employee.ID =work_record.employee_ID 
where date ="2021-5-3" and arrive = 1 and gone = 0;

-- 13
select weekday from date_weekday 
where date ="2021-5-3";

-- 14
select name from employee right outer join retail_store
on employee.store_name = retail_store.store_name 
where region = "central";

-- 15
select count(name) as `number of employee` from employee right outer join work_record 
on employee.ID =work_record.employee_ID 
where date ="2021-5-5" and arrive = 1 and gone = 1;



-- select for Fangtao Zhao 1929009
-- 1
-- Method 1
SELECT store_name, tel_number, address FROM retail_store
WHERE (region = "north");

-- Method 2
SELECT store_name, tel_number, address FROM retail_store
WHERE postcode LIKE "LN%";


-- 2
SELECT ID, name, description FROM employee, job
WHERE (employee.job = "shopkeeper")
AND (job.job_name = "shopkeeper");

-- 3
SELECT game_title, comments FROM game
	WHERE (age_rating >= 10)
	AND (age_rating <= 16);

-- 4
SELECT 
    ID AS cleaner_ID,
	name
FROM
    employee E
WHERE
	E.job = "shop cleaner";

-- 5
SELECT game_title, release_date FROM game
	WHERE release_date < "2018-01-01"
	AND company_name = "Valve";

-- 6
SELECT genre, MIN(age_rating) AS average_age 
FROM game 
Group BY genre

-- 7
SELECT name FROM employee E
    WHERE E.store_name IN
	(SELECT store_name
	 FROM retail_store
	 WHERE region = "north")

-- 8
SELECT * FROM employee E
    WHERE 
	E.job = "shopkeeper"
	AND E.store_name =
	(SELECT store_name
	 FROM retail_store
	 WHERE region = "central");

-- 9
SELECT ID, name FROM employee E
    WHERE E.job = "shop cleaner"
    AND E.name NOT IN ("Oli", "Peter");

-- 10
SELECT * FROM game
   	WHERE age_rating >=
	ALL (
	    SELECT age_rating
	    FROM game);
-- 11
SELECT game_title, age_rating FROM game
	WHERE age_rating >
	ANY (
	SELECT age_rating
	FROM game);

-- 12
SELECT * FROM 
	retail_store INNER JOIN store_management
	USING (store_name);

-- 13
SELECT 
	MAX(age_rating) - MIN(age_rating)
	AS Range_of_age_rating
	FROM game;

-- 14
SELECT * FROM work_record W
RIGHT OUTER JOIN date_weekday D
	ON W.date = D.date
WHERE employee_ID = 
	(SELECT ID FROM employee
	WHERE name = "Eurus");

-- 15
SELECT game_title, age_rating FROM game
	GROUP BY genre
UNION
SELECT 
	"Total" AS game_title,
     AVG(age_rating) AS age_rating
FROM game;




-- select for Juerui Li 1929654

-- not the same order as in the report.

-- 1
Select CD_title from cd natural join game where game.game_title = cd.CD_title

-- 2
Select *, count(*) from cd_management natural join game group by game_title having count(*)>1

-- 3
Select * from employee natural join retail_store where retail_store.region = 'north' and job like '%cleaner%'

-- 4
Select employee_ID, date, arrive, `leave` from work_record where employee_id in (select shopkeeper_ID from retail_store natural join store_management where retail_store.region = 'south') and work_record.date = '2021-05-05'

-- 5
select * from cd_management natural join game where age_rating = '18'

-- 6
select ID, name, job, store_name from employee, work_record where work_record.arrive = '0' and work_record.`leave` = '0' and date = '2021-05-07'

-- 7
select * from work_record where employee_ID in (select shopkeeper_ID from store_management inner join retail_store where region = 'north')

-- 8
select * from employee left outer join work_record on employee.ID = work_record.employee_ID where job in ('shopkeeper', 'shop cleaner')

-- 9
select distinct id, name, job, employee.store_name from employee, retail_store where retail_store.region = 'north' order by employee.store_name

-- 10
select * from game where game.release_date > '2018-01-01'

-- 11
select serial_num, CD_title from cd where serial_num in (select serial_num from cd_management group by serial_num having count(*) > 2)

-- 12
select * from employee left outer join work_record on(employee.ID = work_record.employee_ID) natural join date_weekday where weekday = 'Friday' order by work_record.date

-- 13
select distinct id, name, job, store_name from employee natural join job where job = 'shopkeeper' order by store_name

-- 14 
select store_name from store_management group by store_name order by count(*) desc limit 1;

-- 15
select distinct name, ID from employee, work_record where employee.ID = (select employee_ID from work_record group by employee_ID order by count(employee_ID) desc limit 1);





