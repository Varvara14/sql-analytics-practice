DROP TABLE IF EXISTS troute;

CREATE TABLE troute (
    point1 VARCHAR(1) NOT NULL,
    point2 VARCHAR(1) NOT NULL,
    cost   INTEGER    NOT NULL,
    CONSTRAINT pk_troute PRIMARY KEY (point1, point2),
    CONSTRAINT ch_cost CHECK (cost >= 0) -- na vsyakij sluchay(ubrat esli chto)
);

INSERT INTO troute (point1, point2, cost) VALUES
('a','b',10), ('b','a',10),
('a','c',15), ('c','a',15),
('a','d',20), ('d','a',20),
('b','d',25), ('d','b',25),
('c','d',30), ('d','c',30),
('b','c',35), ('c','b',35);