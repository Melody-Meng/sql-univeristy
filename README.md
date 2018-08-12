## T-SQL

Notes from T-SQL Querying

## Logical query-processing phases
**Example**
```sql
SELECT C.custid, COUNT(O.orderid) AS numorders
FROM dbo.Customers AS C
  LEFT OUTER JOIN dbo.Orders AS O
    ON C.custid = O.custid
WHERE C.city = 'Madrid'
GROUP BY C.custid
HAVING COUNT(O.orderid) < 3
ORDER BY numorders;
```
* **Sequence**:
![CHART](https://vinaykumarchella.files.wordpress.com/2012/03/4.png)
  
* **ON** and **WHERE**: 
  * The logical difference between the ON and WHERE clauses exists only when using an **outer join**.

* HAVING COUNT(O.orderid) <3:
  * You must speficy COUNT(O.orderid) here instead of COUNT(*) which would have added outer rows to the count in **OUTER JOIN**

* **Aliases** 
  * Aliases created by the SELECT list cannot be used by earlier steps - for example, in the WHERE phase. 
  * Expression aliases cannot even be used by other expressions within the same SELECT list:
      * This is supported
      ```sql
      SELECT c1+1 AS e1, c2 +1 AS e2.
      ```
      * This is not supported
      ```sql
      SELECT c1+1 AS e1, e1 +1 AS e2
      ```
   * If you define a column alias in the SELECT phase, you can refer to that alias in the ORDER BY 
     ``` sql
     SELECT YEAR(orderdate) AS orderyear 
     ...
     ORDER BY orderyear
     ```



