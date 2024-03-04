create database insurance;
use insurance;
CREATE TABLE example_table (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    email VARCHAR(100),
    columnn varchar(55),
    details char(50),
    peerson_name varchar(50)
);
INSERT INTO example_table (id, name, age, email,new_column,details,person_name)
VALUES (6, 'Chris Johnson', 35, 'chris@example.com','v','shankar','venu'),
	   (2,'Chris Johnson', 35, 'chris@example.com','v','shankar','venu');
select * from example_table ;
ALTER TABLE example_table
RENAME COLUMN first_name TO person_name;
SELECT 
    name, age, details
FROM
    example_table
WHERE
    details = 'shankar'
GROUP BY details;
 use ig_clone ;
SELECT 
    photo_id as photo_id
FROM
    photo_tags
WHERE
    photo_id = 7  IN (SELECT 
            tag_id
        FROM
            photo_tags
        );
select tag_id from photo_tags;
SELECT 
photo_tags,    CASE
        WHEN photo_tags > 1 THEN 'yes'
        WHEN photo_tags = 1 THEN 'equal'
        ELSE 'no'
    END AS pr
FROM 
    photo_tags;
SELECT 
    photo_id,
    CASE
        WHEN photo_id > 75 THEN 'yes'
        WHEN photo_id = 1 THEN 'equal'
        ELSE 'no'
    END AS pr
FROM 
    photo_tags group by photo_id;
    select  id from comments;
 select  followee_id from follows;
SELECT 
    comment_text
FROM
    comments
WHERE
    id IN (SELECT 
            username
        FROM
            users);
 SELECT 
    photo_id,
    MAX(comments_) AS max_comment,
    MIN(comments_) AS min_comment
FROM (
    SELECT 
        photo_id,
        AVG(comment_text) AS comments_
    FROM 
        comments
     group by photo_id
) AS cd
GROUP BY 
    photo_id;
select tag_id from photo_tags ;
with total as(select  user_id ,sum(user_id) as photo
from photos
group by user_id)

select photo_id
from photo_tags
inner join total  on photo_tags.tag_id = total.user_id and photo_id > 35;
WITH total AS (
    SELECT 
        user_id,
        SUM(id) AS photo
    FROM 
        photos
    GROUP BY 
        user_id
)

SELECT 
    photo_tags.photo_id
FROM 
    photo_tags
INNER JOIN 
    total ON photo_tags.photo_id = total.photo;
WITH total AS (
    SELECT 
        user_id,
        SUM(id) AS photo
    FROM 
        photos
    GROUP BY 
        user_id
)

SELECT 
    photo_tags.photo_id
FROM 
    photo_tags
INNER JOIN 
    total ON photo_tags.photo_id = total.photo;


 