-- Exercise 12

-- 1.Users

CREATE TABLE users (
	id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
    );
    
    -- 2. Content
    
    CREATE TABLE photos (
		id INT PRIMARY KEY AUTO_INCREMENT,
        image_url VARCHAR(255) NOT NULL,
        user_id INT NOT NULL,
		created_at TIMESTAMP DEFAULT NOW(),
        FOREIGN KEY (user_id) REFERENCES users(id)
		);
        
-- 3. Comments

CREATE TABLE comments (
	id INT PRIMARY KEY AUTO_INCREMENT,
    comment_text VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (photo_id) REFERENCES photos(id)
	);
  
  -- 4. Likes
  
  CREATE TABLE likes (
	user_id INT NOT NULL,
	photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (photo_id) REFERENCES photos(id),
    PRIMARY KEY (user_id, photo_id) 	-- ensures that no photo can be liked multiple times by the same user
    );
    
    
-- 5. Followers

CREATE TABLE follows (
    follower_id INT NOT NULL, 	-- user1 (follows)
    followee_id INT NOT NULL, 	-- user2 (is being followed)
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (follower_id) REFERENCES users(id),
    FOREIGN KEY (followee_id) REFERENCES users(id),
    PRIMARY KEY (follower_id, followee_id)
    );

-- 6. Hashtags (we split it up into tags and photo_tags)
    
    CREATE TABLE tags (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tag_name VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
    );
    
   CREATE TABLE photo_tags (
    photo_id INT NOT NULL,
    tag_id INT NOT NULL,
    FOREIGN KEY (photo_id) REFERENCES photos(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)
    );    

    -- Inserting the Data
    -- Left the code out for spacing purposes
    
   /*---------------------------------------------*/
   -- Challenges (working with our database)
   -- Task #1
   -- we want to reward the users who have been around the longest (find top 5) 
    
    SELECT *
    FROM users
    ORDER BY created_at
    LIMIT 5;
    
/*---------------------------------------------*/ 
   -- Task #2 
    -- We want to schedule an ad campaign for new users!
    -- On which day of the week do most users register onto our site?
    
    SELECT DAYNAME(created_at) AS created_day,
					COUNT(*) AS number_of_users
    FROM users
    GROUP BY DAYNAME(created_at)
    ORDER BY COUNT(*) DESC;
 
/*---------------------------------------------*/
    -- Task #3
   -- We want to target our inactive users with an email campaign
   -- Find the users who haven't posted yet
   
   SELECT u.username
   FROM users u 
   LEFT JOIN photos p ON p.user_id = u.id
   WHERE p.created_at IS NULL;
   
    
/*---------------------------------------------*/
    -- Task #4 
    -- We're running a photo contest!
    -- what is the most-liked photo and whom does it belong to?
    
 SELECT username, p.id, p.image_url, COUNT(*) AS likes
 FROM photos p
 INNER JOIN likes l ON l.photo_id = p.id
 INNER JOIN users u ON u.id = p.user_id
 GROUP BY p.id
 ORDER BY likes DESC
 LIMIT 1;
    
/*---------------------------------------------*/
   -- Task #5  
    -- The investors want to know: How much does the average user post?
    -- we divide # of photos by #  of users
    
 SELECT
	ROUND((SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users), 2) AS avg_photos_per_user;
    
/*---------------------------------------------*/
    -- Task #6 
    -- Brand collab: A brand wants to know which hastags to use
    -- What are the top 5 most commonly used hastags?
    
    SELECT * FROM tags;
    SELECT * FROM photo_tags;
    
    SELECT tag_name, COUNT(*) AS number_of_uses
    FROM tags t
    JOIN photo_tags pt ON t.id = pt.tag_id
    GROUP BY tag_name
    ORDER BY number_of_uses DESC 
    LIMIT 7;
    
/*---------------------------------------------*/
-- Task #7  
-- we have a bot problem on our site
-- find users who have liked every single photo (typical bot behaviour)

SET SESSION sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));  

 
SELECT username, COUNT(*) AS count
FROM users u INNER JOIN likes l ON u.id = l.user_id
GROUP BY l.user_id
HAVING count = (
	SELECT COUNT(*) 		-- 257 is the number of uploaded photos
    FROM photos
);
    
/*---------------------------------------------*/