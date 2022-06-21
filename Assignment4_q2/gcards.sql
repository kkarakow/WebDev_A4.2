
# Create and populate holiday table 
DROP TABLE IF EXISTS holiday;
CREATE TABLE holiday(
	id VARCHAR(1) PRIMARY KEY,
    name VARCHAR(50)
);
INSERT INTO holiday VALUES
	('p', 'St. Patrick\'s Day'),
    ('v', 'Valentine\'s Day'),
    ('h', 'Halloween');


# Create and populate image table 
DROP TABLE IF EXISTS image;
CREATE TABLE image(
	id INT AUTO_INCREMENT PRIMARY KEY,
	holidayId VARCHAR(1),
    fileName VARCHAR(10),
    CONSTRAINT fk1 FOREIGN KEY (holidayid) REFERENCES holiday(id)
);
INSERT INTO image(holidayId, fileName) VALUES
	('p', 'p1.jpg'),
    ('p', 'p2.jpg'),
    ('p', 'p3.jpg'),
    ('v', 'v1.jpg'),
    ('v', 'v2.jpg'),
    ('v', 'v3.jpg'),
    ('h', 'h1.jpg'),
    ('h', 'h2.jpg'),
    ('h', 'h3.jpg');
	

# Create and populate card table 
DROP TABLE IF EXISTS card;
CREATE TABLE card(
	id INT AUTO_INCREMENT PRIMARY KEY,
    holidayId VARCHAR(1),
    imageId INT,
    toPerson VARCHAR(30),
    fromPerson VARCHAR(30),
    message TEXT,
    CONSTRAINT fk2 FOREIGN KEY (imageId) REFERENCES image(id),
    CONSTRAINT fk3 FOREIGN KEY (holidayId) REFERENCES holiday(id)
);


#Sample insert query to card table
INSERT INTO card(holidayId, imageId, toPerson, fromPerson, message) VALUES 
('p', 2, 'Harsh', 'Simon', 'The luck of the Irish to you!  Have a safe and happy day!');

