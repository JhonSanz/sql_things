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