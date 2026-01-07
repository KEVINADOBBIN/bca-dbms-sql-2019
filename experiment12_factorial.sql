-- SQLite: Factorial using Recursive CTE
WITH RECURSIVE factorial(n, fact) AS (
    SELECT 1 AS n, 1 AS fact          -- Base case: 1! = 1
    UNION ALL
    SELECT n + 1, (n + 1) * fact
    FROM factorial
    WHERE n < 5                       -- Change 5 to any number
)
SELECT fact AS factorial_of_5
FROM factorial
WHERE n = 5;
