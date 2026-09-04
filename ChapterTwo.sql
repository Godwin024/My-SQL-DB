USE cape_codd;
-- Question 2.17--
SELECT SKU, SKU_description
FROM INVENTORY;

-- Question 2.18--

SELECT SKU_Description
FROM INVENTORY;

-- QUuestion 2.19 --

SELECT  WarehouseID
FROM INVENTORY;

-- Question 2.20--

SELECT DISTINCT WarehouseID
FROM INVENTORY;

-- Question 2.21--

SELECT SKU,SKU_Description, WarehouseID
FROM INVENTORY;

-- Question 2.22--

SELECT * FROM INVENTORY;

-- Question 2.23--

SELECT *
FROM INVENTORY
WHERE QuantityOnHand > 0;

-- Question 2.24--
SELECT SKU, SKU_Description
FROM INVENTORY
WHERE QuantityOnHand = 0;

-- Question 2.25--
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE QuantityOnHand = 0
ORDER BY WarehouseID ASC;

-- Question 2.26--
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE QuantityOnHand > 0
ORDER BY WarehouseID DESC, SKU ASC;

-- Question 2.27--
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE QuantityOnHand > 0 AND QuantityOnHand = 0
ORDER BY WarehouseID DESC, SKU ASC;

-- Question 2.28--
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE QuantityOnHand > 0 or QuantityOnOrder = 0
ORDER BY WarehouseID DESC, SKU ASC;

-- Question 2.29--
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE QuantityOnHand > 0 or QuantityOnOrder = 0
ORDER BY WarehouseID DESC, SKU ASC;


-- 2.30--
SELECT SKU, SKU_Description, WarehouseID, QuantityOnHand
FROM INVENTORY
WHERE QuantityOnHand BETWEEN 2 AND 9;

-- 2.31--
SELECT DISTINCT SKU, SKU_Description
FROM INVENTORY
WHERE SKU_Description LIKE 'Half-Dome%';

-- 2.32--
SELECT DISTINCT SKU, SKU_Description
FROM INVENTORY
WHERE SKU_Description LIKE '%Climb%';

-- 2.33--
SELECT DISTINCT SKU, SKU_Description
FROM SKU_DATA
WHERE SKU_Description LIKE '__d%';

-- 2.34--
SELECT COUNT(QuantityOnHand) AS CountQuantityOnHand,
       SUM(QuantityOnHand) AS TotalQuantityOnHand,
       AVG(QuantityOnHand) AS AverageQuantityOnHand,
       MIN(QuantityOnHand) AS MinimumQuantityOnHand,
       MAX(QuantityOnHand) AS MaximumQuantityOnHand
FROM INVENTORY;

-- 2.35--
SELECT COUNT(QuantityOnHand)
FROM INVENTORY;

-- 2.36--
SELECT WarehouseID,
       SUM(QuantityOnHand) AS TotalItemsOnHand
FROM INVENTORY
GROUP BY WarehouseID
ORDER BY TotalItemsOnHand DESC;

-- 2.37--
SELECT WarehouseID,
       SUM(QuantityOnHand) AS TotalItemsOnHandLT3
FROM INVENTORY
WHERE QuantityOnHand < 3
GROUP BY WarehouseID
ORDER BY TotalItemsOnHandLT3 DESC;

-- 2.38--
SELECT WarehouseID,
       SUM(QuantityOnHand) AS TotalItemsOnHandLT3
FROM INVENTORY
WHERE QuantityOnHand < 3
GROUP BY WarehouseID
HAVING COUNT(SKU) < 2
ORDER BY TotalItemsOnHandLT3 DESC;

SHOW TABLES;
SHOW DATABASES;
USE cape_codd;

SELECT SKU, SKU_Description FROM INVENTORY;
SELECT INVENTORY.SKU, INVENTORY.SKU_Description, WAREHOUSE.WarehouseID, WAREHOUSE.WarehouseCity, WAREHOUSE.WarehouseState FROM INVENTORY
JOIN WAREHOUSE ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID WHERE WAREHOUSE.WarehouseCity = 'Atlanta' OR WAREHOUSE.WarehouseCity = 'Bangor' OR WAREHOUSE.WarehouseCity = 'Chicago';

SELECT INVENTORY.SKU, INVENTORY.SKU_Description, WAREHOUSE.WarehouseID, WAREHOUSE.WarehouseCity, WAREHOUSE.WarehouseState FROM INVENTORY
JOIN WAREHOUSE ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID WHERE WAREHOUSE.WarehouseCity IN ('Atlanta', 'Bangor', 'Chicago');

SELECT INVENTORY.SKU, INVENTORY.SKU_Description, WAREHOUSE.WarehouseID, WAREHOUSE.WarehouseCity, WAREHOUSE.WarehouseState FROM INVENTORY
JOIN WAREHOUSE ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID WHERE WAREHOUSE.WarehouseCity <> 'Atlanta' AND WAREHOUSE.WarehouseCity <> 'Bangor' AND WAREHOUSE.WarehouseCity <> 'Chicago';

SELECT INVENTORY.SKU, INVENTORY.SKU_Description, WAREHOUSE.WarehouseID, WAREHOUSE.WarehouseCity, WAREHOUSE.WarehouseState FROM INVENTORY
JOIN WAREHOUSE ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID WHERE WAREHOUSE.WarehouseCity NOT IN ('Atlanta', 'Bangor', 'Chicago');

SELECT CONCAT(SKU_Description, ' is located in ', WarehouseCity) AS ItemLocation FROM INVENTORY JOIN WAREHOUSE ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID;

SELECT SKU, SKU_Description, WarehouseID FROM INVENTORY WHERE WarehouseID IN (SELECT WarehouseID FROM WAREHOUSE WHERE Manager = 'Lucille Smith');

SELECT INVENTORY.SKU, INVENTORY.SKU_Description, INVENTORY.WarehouseID FROM INVENTORY, WAREHOUSE WHERE INVENTORY.WarehouseID = WAREHOUSE.WarehouseID AND WAREHOUSE.Manager = 'Lucille Smith';

SELECT INVENTORY.SKU, INVENTORY.SKU_Description, INVENTORY.WarehouseID FROM INVENTORY JOIN WAREHOUSE ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID WHERE WAREHOUSE.Manager = 'Lucille Smith';

SELECT WarehouseID, AVG(QuantityOnHand) AS AverageQuantityOnHand FROM INVENTORY WHERE WarehouseID IN (SELECT WarehouseID FROM WAREHOUSE
WHERE Manager = 'Lucille Smith') GROUP BY WarehouseID;

SELECT INVENTORY.WarehouseID, AVG(INVENTORY.QuantityOnHand) AS AverageQuantityOnHand FROM INVENTORY, WAREHOUSE
WHERE INVENTORY.WarehouseID = WAREHOUSE.WarehouseID AND WAREHOUSE.Manager = 'Lucille Smith' GROUP BY INVENTORY.WarehouseID;

SELECT INVENTORY.WarehouseID, AVG(INVENTORY.QuantityOnHand) AS AverageQuantityOnHand FROM INVENTORY
JOIN WAREHOUSE ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID WHERE WAREHOUSE.Manager = 'Lucille Smith' GROUP BY INVENTORY.WarehouseID;

