CREATE TABLE Ingredients (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    price_per_unit INT NOT NULL
);

CREATE TABLE Donuts (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    price INT NOT NULL,
    gluten_free INT NOT NULL
);

CREATE TABLE donut_ingredients (
    donut_id INTEGER,
    ingredient_id INTEGER,
    PRIMARY KEY(donut_id, ingredient_id),
    FOREIGN KEY(donut_id) REFERENCES Donuts(id),
    FOREIGN KEY(ingredient_id) REFERENCES Ingredients(id)
);

CREATE TABLE Customers (
    id SERIAL PRIMARY KEY,
    firstName TEXT NOT NULL,
    lastName TEXT
);

CREATE TABLE Orders (
    id SERIAL PRIMARY KEY,
    OrderNumber INT NOT NULL,
    customer_id INT REFERENCES Customers(id)
);

CREATE TABLE order_details (
    order_id INTEGER,
    donut_id INTEGER,
    quantity INTEGER NOT NULL,
    PRIMARY KEY (order_id, donut_id),
    FOREIGN KEY(order_id) REFERENCES Orders(id),
    FOREIGN KEY(donut_id) REFERENCES Donuts(id)
);
