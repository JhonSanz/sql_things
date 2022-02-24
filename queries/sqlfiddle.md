#### Visit http://sqlfiddle.com/#!9/819e8a/1

```sql
CREATE TABLE IF NOT EXISTS `Animals` (
`id` int(6) unsigned NOT NULL,
`Name` varchar(200) NOT NULL,
`Animal` varchar(200) NOT NULL,
PRIMARY KEY (`id`)
) DEFAULT CHARSET=utf8;
INSERT INTO `Animals` (`id`, `Name`, `Animal`) VALUES
('1', 'Dr. Harris Bonkers', 'Rabbit'),
('2', 'Moon', 'Dog'),
('3', 'Ripley', 'Cat'),
('4', 'Tom', 'Cat');
```
---
```sql
SELECT Animal
FROM `Animals`
GROUP BY Animal
```
> | Animal |
> | :----: |
> | Rabbit |
> |  Dog   |
> |  Cat   |
---
```sql
SELECT Animal, COUNT(id)
FROM `Animals`
GROUP BY Animal
```
> | Animal | COUNT(id) |
> | :----: | :-------: |
> | Rabbit |     1     |
> |  Dog   |     1     |
> |  Cat   |     2     |
---
```sql
SELECT Name, Animal
FROM `Animals`
WHERE Name LIKE '%m%'
```
> | Name  | Animal |
> | :---: | :----: |
> | Moon  |  Dog   |
> |  Tom  |  Cat   |
---
```sql
CREATE TABLE IF NOT EXISTS `Animals` (
  `id` int(6) unsigned NOT NULL,
  `Name` varchar(200) NOT NULL,
  `Animal` varchar(200) NOT NULL,
  `Price` int(6) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) DEFAULT CHARSET=utf8;
INSERT INTO `Animals` (`id`, `Name`, `Animal`, `Price`) VALUES
  ('1', 'Dr. Harris Bonkers', 'Rabbit', 5),
  ('2', 'Moon', 'Dog', 6),
  ('3', 'Ripley', 'Cat', 3),
  ('4', 'Tom', 'Cat', 12),
  ('5', 'Boris', 'Cat', 3);

SELECT Animal, SUM(price) AS test
FROM `Animals`
GROUP BY Animal, Price
```
| Aminal | test  |
| :----: | :---: |
|  Cat   |   6   |
|  Cat   |  12   |
|  Dog   |   6   |
| Rabbit |   5   |

---
```sql
CREATE TABLE IF NOT EXISTS `Animals` (
  `id` int(6) unsigned NOT NULL,
  `Name` varchar(200) NOT NULL,
  `Animal` varchar(200) NOT NULL,
  `Birth` date NOT NULL,
  PRIMARY KEY (`id`)
) DEFAULT CHARSET=utf8;
INSERT INTO `Animals` (`id`, `Name`, `Animal`, `Birth`) VALUES
  ('1', 'Dr. Harris Bonkers', 'Rabbit', '2019-12-22'),
  ('2', 'Moon', 'Dog', '2020-02-21'),
  ('3', 'Ripley', 'Cat', '2022-01-20'),
  ('4', 'Tom', 'Cat', '2020-02-19'),
  ('5', 'Boris', 'Cat', '2022-02-18'),
  ('6', 'Poytr', 'Rabbit', '2022-01-13');

SELECT EXTRACT(MONTH FROM Birth) as month, COUNT(1) AS num_pets
FROM `Animals`
WHERE EXTRACT(YEAR FROM Birth) = 2022
GROUP BY month
ORDER BY num_pets
```
| month | num_pets |
| :---: | :------: |
|   2   |    1     |
|   1   |    2     |

---