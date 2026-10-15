create table latentview(col1 INTEGER);
insert INTO latentview VALUES
(1),
(2),
(4),
(5),
(6),
(8),
(10)


SELECT n.n AS missing_number
FROM latentview AS n
WHERE n.n BETWEEN
      (SELECT MIN(col1) + 1 FROM latentview)
  AND (SELECT MAX(col1) - 1 FROM latentview)
  AND NOT EXISTS (
    SELECT 1
    FROM latentview AS t
    WHERE t.col1 = n.n
  )
ORDER BY n.n;