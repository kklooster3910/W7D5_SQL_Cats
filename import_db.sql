DROP TABLE if EXISTS cattoys;
DROP TABLE if EXISTS cats;
DROP TABLE if EXISTS toys;

CREATE TABLE cats (
    id SERIAL PRIMARY KEY,
    name varchar(255) NOT NULL,
    color varchar(255) NOT NULL,
    breed varchar(255) NOT NULL
);

CREATE TABLE toys (
    id SERIAL PRIMARY KEY,
    name varchar(255) NOT NULL,
    price int NOT NULL,
    color varchar(255) NOT NULL
);

CREATE TABLE cattoys (
    id SERIAL PRIMARY KEY,
    cat_id int NOT NULL,
    toy_id int NOT NULL,
    FOREIGN KEY (cat_id) REFERENCES cats(id),
    FOREIGN KEY (toy_id) REFERENCES toys(id)
);

INSERT INTO cats
    (name, color, breed)
VALUES
    ('Oscar', 'Orange', 'Tabby'),
    ('James', 'Brown', 'British Shorthair'),
    ('Tyga', 'Spotted', 'Bengal Cat'),
    ('Woody', 'Black', 'Persian'),
    ('Tigger', 'Orange and black', 'Norwegian Forest Cat');


INSERT INTO toys
    (name, price, color)
VALUES
    ('feather string toy', 3, 'pink'),
    ('catnip', 25, 'green'),
    ('scratch pole', 50, 'white'),
    ('stuffed mouse', 10, 'grey'),
    ('cat tree', 80, 'purple');

INSERT INTO cattoys
    (cat_id, toy_id)
VALUES
    ((SELECT id FROM cats WHERE name = 'Oscar'), (SELECT id FROM toys WHERE name = 'feather string toy')),
    ((SELECT id FROM cats WHERE name = 'James'), (SELECT id FROM toys WHERE name = 'catnip')),
    ((SELECT id FROM cats WHERE name = 'Tyga'), (SELECT id FROM toys WHERE name = 'scratch pole')),
    ((SELECT id FROM cats WHERE name = 'Woody'), (SELECT id FROM toys WHERE name = 'stuffed mouse')),
    ((SELECT id FROM cats WHERE name = 'Tigger'), (SELECT id FROM toys WHERE name = 'cat tree'));
