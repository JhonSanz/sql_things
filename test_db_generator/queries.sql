/* Get all products

| "product_id" | "product_name"           | "description"                | "store_id" |
| ------------ | ------------------------ | ---------------------------- | ---------- |
| 1            | "Gusanos espaciales"     | "4 unidades"                 | 9          |
| 2            | "Brownies"               | "500g"                       | 9          |
| 3            | "Grinder"                | "Tamaño personal"            | 9          |
| 4            | "Pipas"                  | "Monoplonicas"               | 9          |
| 5            | "Cerveza"                | "Poker, Costeña, Aguila"     | 10         |
| 6            | "Aguardiente Antioqueño" |                              | 10         |
| 7            | "Ron viejo de Caldas"    | "Mejor que el Medellin"      | 10         |
| 8            | "Aguardiente Amarillo"   | "De manzana"                 | 10         |
| 9            | "Chapinero"              | "Porter"                     | 11         |
| 10           | "Monserrate"             | "Biter"                      | 11         |
| 11           | "Cajica"                 | "Honey Ale"                  | 11         |
| 12           | "Macondo"                | "Stout"                      | 11         |
| 13           | "Chorizo"                | "De procedencia desconocida" | 12         |
| 14           | "Chuzo"                  | "De animal desconocido"      | 12         |
| 15           | "Pizza"                  | "Rica"                       | 12         |

SELECT * FROM public.products;

*/


/* Get all cities from Colombia

| "city_id" | "city_name" | "country_id" |
| --------- | ----------- | ------------ |
| 31        | "Pereira"   | 41           |
| 32        | "Cartago"   | 41           |
| 33        | "Manizales" | 41           |

SELECT * FROM public.cities WHERE country_id = (
	SELECT country_id FROM public.countries WHERE country_name = 'Colombia'
)

SELECT Cities.city_id, Cities.city_name, Cities.country_id
FROM public.cities Cities
INNER JOIN public.countries Countries
ON Cities.country_id = Countries.country_id
WHERE Countries.country_name = 'Colombia'

*/


/* Get all products sold by "El pavo"

| "product_id" | "product_name"           | "description"            | "store_id" | "store_name" |
| ------------ | ------------------------ | ------------------------ | ---------- | ------------ |
| 5            | "Cerveza"                | "Poker, Costeña, Aguila" | 10         | "El pavo"    |
| 6            | "Aguardiente Antioqueño" |                          | 10         | "El pavo"    |
| 7            | "Ron viejo de Caldas"    | "Mejor que el Medellin"  | 10         | "El pavo"    |
| 8            | "Aguardiente Amarillo"   | "De manzana"             | 10         | "El pavo"    |

select Product.product_id, Product.product_name, Product.description, Product.store_id, Store.store_name
from public.products Product
inner join public.stores Store
on Product.store_id = Store.store_id
where Store.store_name = 'El pavo'

*/


/* Get all products sold in Pereira

| "product_name"       | "description"     | "store_name" | "city_name" |
| -------------------- | ----------------- | ------------ | ----------- |
| "Pipas"              | "Monoplonicas"    | "Parkmotos"  | "Pereira"   |
| "Grinder"            | "Tamaño personal" | "Parkmotos"  | "Pereira"   |
| "Brownies"           | "500g"            | "Parkmotos"  | "Pereira"   |
| "Gusanos espaciales" | "4 unidades"      | "Parkmotos"  | "Pereira"   |
| "Macondo"            | "Stout"           | "BBC"        | "Pereira"   |
| "Cajica"             | "Honey Ale"       | "BBC"        | "Pereira"   |
| "Monserrate"         | "Biter"           | "BBC"        | "Pereira"   |
| "Chapinero"          | "Porter"          | "BBC"        | "Pereira"   |

-> Esta implementacion es inferior ya que no puedo obtener columnas de la tabla ciudad 

select Product.product_name, Product.description, Store.store_name
from public.products Product
inner join public.stores Store on Product.store_id = Store.store_id
where Store.store_id in (
	select StoreCity.store_id
	from public.store_city StoreCity
	inner join public.cities City
	on StoreCity.city_id = City.city_id
	where City.city_name = 'Pereira'
)

SELECT Product.product_name, Product.description, Store.store_name, City.city_name
FROM public.products Product
INNER JOIN public.stores Store ON Product.store_id = Store.store_id
INNER JOIN public.store_city StoreCity ON Store.store_id = StoreCity.store_id
INNER JOIN public.cities City ON StoreCity.city_id = City.city_id
WHERE City.city_name = 'Pereira';

*/


/* Get all products sold in Argentina

| "product_name" | "description"                | "city_name"    |
| -------------- | ---------------------------- | -------------- |
| "Macondo"      | "Stout"                      | "Buenos Aires" |
| "Cajica"       | "Honey Ale"                  | "Buenos Aires" |
| "Monserrate"   | "Biter"                      | "Buenos Aires" |
| "Chapinero"    | "Porter"                     | "Buenos Aires" |
| "Pizza"        | "Rica"                       | "Bernal"       |
| "Chuzo"        | "De animal desconocido"      | "Bernal"       |
| "Chorizo"      | "De procedencia desconocida" | "Bernal"       |

select Product.product_name, Product.description, City.city_name
from public.products Product
inner join public.store_city StoreCity on Product.store_id = StoreCity.store_id
inner join public.cities City on City.city_id = StoreCity.city_id
inner join public.countries Country on Country.country_id = City.country_id
where Country.country_name = 'Argentina'

*/


/* Count all different products sold in "Valparaiso" and "Durango"

*/













