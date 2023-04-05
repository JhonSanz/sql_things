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


/* Get all unsold products

| "product_id" | "product_name"           | "description"                |
| ------------ | ------------------------ | ---------------------------- |
| 11           | "Cajica"                 | "Honey Ale"                  |
| 12           | "Macondo"                | "Stout"                      |
| 10           | "Monserrate"             | "Biter"                      |
| 2            | "Brownies"               | "500g"                       |
| 15           | "Pizza"                  | "Rica"                       |
| 13           | "Chorizo"                | "De procedencia desconocida" |
| 5            | "Cerveza"                | "Poker, Costeña, Aguila"     |
| 6            | "Aguardiente Antioqueño" |                              |
| 4            | "Pipas"                  | "Monoplonicas"               |
| 14           | "Chuzo"                  | "De animal desconocido"      |
| 7            | "Ron viejo de Caldas"    | "Mejor que el Medellin"      |

select Product.product_id, Product.product_name, Product.description
from public.sales Sale
right join public.products Product on Sale.product_id = Product.product_id
where Sale.sale_id is null;

select Product.product_id, Product.product_name, Product.description
from public.products Product
left join public.sales Sale on Sale.product_id = Product.product_id
where Sale.sale_id is null

*/


/* Count all cities in each country

| "country_name" | "ciudades" |
| -------------- | ---------- |
| "Venezuela"    | 2          |
| "Colombia"     | 3          |
| "Argentina"    | 2          |
| "Chile"        | 2          |
| "Peru"         | 2          |
| "Mexico"       | 2          |

select Country.country_name, count(1) as Ciudades
from public.cities City
inner join public.countries Country on City.country_id = Country.country_id
group by Country.country_name

*/


/* Count all "Aguardiente Amarillo" sold

Intenté esta consulta pero hubo algo importante, con la sentencia group by el programa
evalúa la condición del product_name = 'Aguardiente Amarillo', esto provoca que se creen
dos categorías, la primera donde se agrupan todos los registros que corresponden a la condición
del nombre del producto, y la segunda categoría donde quedan los demás productos con otro nombre.

Por lo tanto, a pesar de que si quedan bien contados los productos 'Aguardiente Amarillo', no es tan
preciso hacerlo de esta manera ya que el resultado obtenido contiene dos filas:

| "Aguardiente Amarillo vendido" |
| ------------------------------ |
| 5                              | <- productos con otro nombre
| 3                              | <- Aguardiente amarillo

select count(1) as "Aguardiente Amarillo vendido"
from public.sales Sale
left join public.products Product on Product.product_id = Sale.product_id
group by Product.product_name = 'Aguardiente Amarillo';

Para realizar esta tarea podemos hacer varias cosas, la mas rápida es cambiar el group by
por un where:

| "Aguardiente Amarillo vendido" |
| ------------------------------ |
| 3                              |

select count(1) as "Aguardiente Amarillo vendido"
from public.sales Sale
left join public.products Product on Product.product_id = Sale.product_id
where Product.product_name = 'Aguardiente Amarillo';

Solución alternativa:

SELECT SUM(CASE WHEN Product.product_name = 'Aguardiente Amarillo' THEN 1 ELSE 0 END) AS "Aguardiente Amarillo vendido"
FROM public.sales Sale
LEFT JOIN public.products Product ON Product.product_id = Sale.product_id;

*/
