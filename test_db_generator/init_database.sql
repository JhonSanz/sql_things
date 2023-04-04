CREATE TABLE countries (
	country_id serial PRIMARY KEY,
	country_name VARCHAR (255) UNIQUE NOT NULL
);

CREATE TABLE cities (
	city_id serial PRIMARY KEY,
	city_name VARCHAR (255) UNIQUE NOT NULL,
	country_id INT NOT NULL,
	FOREIGN KEY (country_id)
		REFERENCES countries (country_id)
);

CREATE TABLE stores (
	store_id serial PRIMARY KEY,
	store_name VARCHAR (50) UNIQUE NOT NULL,
	website VARCHAR (255) UNIQUE NOT NULL
);

CREATE TABLE products (
	product_id serial PRIMARY KEY,
	product_name VARCHAR (255) NOT NULL,
	description VARCHAR (255) NOT NULL,
	store_id INT NOT NULL,
  	FOREIGN KEY (store_id)
		REFERENCES stores (store_id)
);

CREATE TABLE store_city (
	store_city_id serial PRIMARY KEY,
	store_id INT NOT NULL,
	city_id INT NOT NULL,
	FOREIGN KEY (store_id)
		REFERENCES stores (store_id),
	FOREIGN KEY (city_id)
		REFERENCES cities (city_id)
);

CREATE TABLE sales (
	sale_id serial PRIMARY KEY,
	price FLOAT NOT NULL,
	store_city_id INT NOT NULL,
	product_id INT NOT NULL,
	FOREIGN KEY (store_city_id)
		REFERENCES store_city (store_city_id),
	FOREIGN KEY (product_id)
		REFERENCES products (product_id)
);


