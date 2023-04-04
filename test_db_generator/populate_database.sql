DELETE FROM public.products;
DELETE FROM public.store_city;
DELETE FROM public.stores;
DELETE FROM public.cities;
DELETE FROM public.countries;


/* countries  */
INSERT INTO public.countries(country_name) VALUES ('Colombia');
INSERT INTO public.countries(country_name) VALUES ('Venezuela');
INSERT INTO public.countries(country_name) VALUES ('Chile');
INSERT INTO public.countries(country_name) VALUES ('Mexico');
INSERT INTO public.countries(country_name) VALUES ('Peru');
INSERT INTO public.countries(country_name) VALUES ('Argentina');


/* cities  */
INSERT INTO public.cities(city_name, country_id) VALUES (
	'Pereira', 
	(SELECT country_id FROM public.countries WHERE country_name = 'Colombia')
);
INSERT INTO public.cities(city_name, country_id) VALUES (
	'Cartago', 
	(SELECT country_id FROM public.countries WHERE country_name = 'Colombia')
);
INSERT INTO public.cities(city_name, country_id) VALUES (
	'Manizales', 
	(SELECT country_id FROM public.countries WHERE country_name = 'Colombia')
);

INSERT INTO public.cities(city_name, country_id) VALUES (
	'Caracas', 
	(SELECT country_id FROM public.countries WHERE country_name = 'Venezuela')
);
INSERT INTO public.cities(city_name, country_id) VALUES (
	'Maracaibo', 
	(SELECT country_id FROM public.countries WHERE country_name = 'Venezuela')
);

INSERT INTO public.cities(city_name, country_id) VALUES (
	'Santiago', 
	(SELECT country_id FROM public.countries WHERE country_name = 'Chile')
);
INSERT INTO public.cities(city_name, country_id) VALUES (
	'Valparaiso', 
	(SELECT country_id FROM public.countries WHERE country_name = 'Chile')
);

INSERT INTO public.cities(city_name, country_id) VALUES (
	'Durango', 
	(SELECT country_id FROM public.countries WHERE country_name = 'Mexico')
);
INSERT INTO public.cities(city_name, country_id) VALUES (
	'DF', 
	(SELECT country_id FROM public.countries WHERE country_name = 'Mexico')
);

INSERT INTO public.cities(city_name, country_id) VALUES (
	'Lima', 
	(SELECT country_id FROM public.countries WHERE country_name = 'Peru')
);
INSERT INTO public.cities(city_name, country_id) VALUES (
	'Kuzco', 
	(SELECT country_id FROM public.countries WHERE country_name = 'Peru')
);

INSERT INTO public.cities(city_name, country_id) VALUES (
	'Buenos Aires', 
	(SELECT country_id FROM public.countries WHERE country_name = 'Argentina')
);
INSERT INTO public.cities(city_name, country_id) VALUES (
	'Bernal', 
	(SELECT country_id FROM public.countries WHERE country_name = 'Argentina')
);


/* stores  */
INSERT INTO public.stores(store_name, website) VALUES ('Parkmotos', 'www.parkmotos.com');
INSERT INTO public.stores(store_name, website) VALUES ('El pavo', 'www.elpavo.com');
INSERT INTO public.stores(store_name, website) VALUES ('BBC', 'www.bbc.com');
INSERT INTO public.stores(store_name, website) VALUES ('Chorilago', 'www.chorilago.com');


/* store_city  */
INSERT INTO public.store_city(store_id, city_id) VALUES (
	(SELECT store_id FROM public.stores WHERE store_name = 'Parkmotos'), 
	(SELECT city_id FROM public.cities WHERE city_name = 'Pereira')
);
INSERT INTO public.store_city(store_id, city_id) VALUES (
	(SELECT store_id FROM public.stores WHERE store_name = 'Parkmotos'), 
	(SELECT city_id FROM public.cities WHERE city_name = 'Santiago')
);
INSERT INTO public.store_city(store_id, city_id) VALUES (
	(SELECT store_id FROM public.stores WHERE store_name = 'Parkmotos'), 
	(SELECT city_id FROM public.cities WHERE city_name = 'Kuzco')
);
INSERT INTO public.store_city(store_id, city_id) VALUES (
	(SELECT store_id FROM public.stores WHERE store_name = 'Parkmotos'), 
	(SELECT city_id FROM public.cities WHERE city_name = 'DF')
);
INSERT INTO public.store_city(store_id, city_id) VALUES (
	(SELECT store_id FROM public.stores WHERE store_name = 'Parkmotos'), 
	(SELECT city_id FROM public.cities WHERE city_name = 'Maracaibo')
);

INSERT INTO public.store_city(store_id, city_id) VALUES (
	(SELECT store_id FROM public.stores WHERE store_name = 'El pavo'), 
	(SELECT city_id FROM public.cities WHERE city_name = 'Manizales')
);
INSERT INTO public.store_city(store_id, city_id) VALUES (
	(SELECT store_id FROM public.stores WHERE store_name = 'El pavo'), 
	(SELECT city_id FROM public.cities WHERE city_name = 'Cartago')
);
INSERT INTO public.store_city(store_id, city_id) VALUES (
	(SELECT store_id FROM public.stores WHERE store_name = 'El pavo'), 
	(SELECT city_id FROM public.cities WHERE city_name = 'Durango')
);
INSERT INTO public.store_city(store_id, city_id) VALUES (
	(SELECT store_id FROM public.stores WHERE store_name = 'El pavo'), 
	(SELECT city_id FROM public.cities WHERE city_name = 'Lima')
);
INSERT INTO public.store_city(store_id, city_id) VALUES (
	(SELECT store_id FROM public.stores WHERE store_name = 'El pavo'), 
	(SELECT city_id FROM public.cities WHERE city_name = 'Valparaiso')
);
INSERT INTO public.store_city(store_id, city_id) VALUES (
	(SELECT store_id FROM public.stores WHERE store_name = 'El pavo'), 
	(SELECT city_id FROM public.cities WHERE city_name = 'Caracas')
);

INSERT INTO public.store_city(store_id, city_id) VALUES (
	(SELECT store_id FROM public.stores WHERE store_name = 'BBC'), 
	(SELECT city_id FROM public.cities WHERE city_name = 'DF')
);
INSERT INTO public.store_city(store_id, city_id) VALUES (
	(SELECT store_id FROM public.stores WHERE store_name = 'BBC'), 
	(SELECT city_id FROM public.cities WHERE city_name = 'Buenos Aires')
);
INSERT INTO public.store_city(store_id, city_id) VALUES (
	(SELECT store_id FROM public.stores WHERE store_name = 'BBC'), 
	(SELECT city_id FROM public.cities WHERE city_name = 'Pereira')
);
INSERT INTO public.store_city(store_id, city_id) VALUES (
	(SELECT store_id FROM public.stores WHERE store_name = 'BBC'), 
	(SELECT city_id FROM public.cities WHERE city_name = 'Lima')
);
INSERT INTO public.store_city(store_id, city_id) VALUES (
	(SELECT store_id FROM public.stores WHERE store_name = 'BBC'), 
	(SELECT city_id FROM public.cities WHERE city_name = 'Santiago')
);

INSERT INTO public.store_city(store_id, city_id) VALUES (
	(SELECT store_id FROM public.stores WHERE store_name = 'Chorilago'), 
	(SELECT city_id FROM public.cities WHERE city_name = 'Bernal')
);
INSERT INTO public.store_city(store_id, city_id) VALUES (
	(SELECT store_id FROM public.stores WHERE store_name = 'Chorilago'), 
	(SELECT city_id FROM public.cities WHERE city_name = 'Caracas')
);
INSERT INTO public.store_city(store_id, city_id) VALUES (
	(SELECT store_id FROM public.stores WHERE store_name = 'Chorilago'), 
	(SELECT city_id FROM public.cities WHERE city_name = 'Kuzco')
);
INSERT INTO public.store_city(store_id, city_id) VALUES (
	(SELECT store_id FROM public.stores WHERE store_name = 'Chorilago'), 
	(SELECT city_id FROM public.cities WHERE city_name = 'DF')
);
INSERT INTO public.store_city(store_id, city_id) VALUES (
	(SELECT store_id FROM public.stores WHERE store_name = 'Chorilago'), 
	(SELECT city_id FROM public.cities WHERE city_name = 'Santiago')
);

/* products  */
INSERT INTO public.products(product_name, description, store_id) VALUES (
	'Gusanos espaciales', '4 unidades',
	(SELECT store_id FROM public.stores WHERE store_name = 'Parkmotos')
);
INSERT INTO public.products(product_name, description, store_id) VALUES (
	'Brownies', '500g',
	(SELECT store_id FROM public.stores WHERE store_name = 'Parkmotos')
);
INSERT INTO public.products(product_name, description, store_id) VALUES (
	'Grinder', 'Tamaño personal',
	(SELECT store_id FROM public.stores WHERE store_name = 'Parkmotos')
);
INSERT INTO public.products(product_name, description, store_id) VALUES (
	'Pipas', 'Monoplonicas',
	(SELECT store_id FROM public.stores WHERE store_name = 'Parkmotos')
);

INSERT INTO public.products(product_name, description, store_id) VALUES (
	'Cerveza', 'Poker, Costeña, Aguila',
	(SELECT store_id FROM public.stores WHERE store_name = 'El pavo')
);
INSERT INTO public.products(product_name, description, store_id) VALUES (
	'Aguardiente Antioqueño', '',
	(SELECT store_id FROM public.stores WHERE store_name = 'El pavo')
);
INSERT INTO public.products(product_name, description, store_id) VALUES (
	'Ron viejo de Caldas', 'Mejor que el Medellin',
	(SELECT store_id FROM public.stores WHERE store_name = 'El pavo')
);
INSERT INTO public.products(product_name, description, store_id) VALUES (
	'Aguardiente Amarillo', 'De manzana',
	(SELECT store_id FROM public.stores WHERE store_name = 'El pavo')
);

INSERT INTO public.products(product_name, description, store_id) VALUES (
	'Chapinero', 'Porter',
	(SELECT store_id FROM public.stores WHERE store_name = 'BBC')
);
INSERT INTO public.products(product_name, description, store_id) VALUES (
	'Monserrate', 'Biter',
	(SELECT store_id FROM public.stores WHERE store_name = 'BBC')
);
INSERT INTO public.products(product_name, description, store_id) VALUES (
	'Cajica', 'Honey Ale',
	(SELECT store_id FROM public.stores WHERE store_name = 'BBC')
);
INSERT INTO public.products(product_name, description, store_id) VALUES (
	'Macondo', 'Stout',
	(SELECT store_id FROM public.stores WHERE store_name = 'BBC')
);

INSERT INTO public.products(product_name, description, store_id) VALUES (
	'Chorizo', 'De procedencia desconocida',
	(SELECT store_id FROM public.stores WHERE store_name = 'Chorilago')
);
INSERT INTO public.products(product_name, description, store_id) VALUES (
	'Chuzo', 'De animal desconocido',
	(SELECT store_id FROM public.stores WHERE store_name = 'Chorilago')
);
INSERT INTO public.products(product_name, description, store_id) VALUES (
	'Pizza', 'Rica',
	(SELECT store_id FROM public.stores WHERE store_name = 'Chorilago')
);

INSERT INTO public.sales(price, store_city_id, product_id) VALUES (
	5, 1, (SELECT product_id FROM public.products WHERE product_name = 'Grinder')
);
INSERT INTO public.sales(price, store_city_id, product_id) VALUES (
	18, 4, (SELECT product_id FROM public.products WHERE product_name = 'Gusanos espaciales')
);
INSERT INTO public.sales(price, store_city_id, product_id) VALUES (
	20, 6, (SELECT product_id FROM public.products WHERE product_name = 'Aguardiente Amarillo')
);
INSERT INTO public.sales(price, store_city_id, product_id) VALUES (
	23, 8, (SELECT product_id FROM public.products WHERE product_name = 'Aguardiente Amarillo')
);
INSERT INTO public.sales(price, store_city_id, product_id) VALUES (
	23, 8, (SELECT product_id FROM public.products WHERE product_name = 'Aguardiente Amarillo')
);
INSERT INTO public.sales(price, store_city_id, product_id) VALUES (
	13, 13, (SELECT product_id FROM public.products WHERE product_name = 'Chapinero')
);



