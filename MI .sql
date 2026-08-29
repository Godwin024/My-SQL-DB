CREATE DATABASE mi_ch02;

-- QUESTION 1--
SELECT *
FROM 	ITEM, SHIPMENT, SHIPMENT_ITEM;
 
 -- QUESTION 3--
SELECT ShipmentID, ShipperName, ShipperInvoiceNumber
FROM  SHIPMENT;

-- QUESTION 4 --
SELECT ShipmentID, ShipperName, ShipperInvoiceNumber
FROM SHIPMENT
WHERE insuredValue  > 10000;

-- QUESTION 5 --
SELECT ShipmentID, ShipperName, ShipperInvoiceNumber
FROM SHIPMENT
WHERE  ShipperName like 'AB%';

-- QUESTION 6--
SELECT ShipmentID, ShipperName, ShipperInvoiceNumber, ArrivalDate
FROM SHIPMENT
WHERE MONTH (DEPARTUREDATE) = 12;

-- QUESTION 7 --
SELECT ShipmentID, ShipperName, ShipperInvoiceNumber,ArrivalDate
FROM SHIPMENT 
WHERE  DAY (DEPARTUREDATE) = 10;

-- question 8 --
SELECT AVG(InsuredValue)
FROM SHIPMENT;

-- question 9 --
SELECT count(*)
FROM SHIPMENT;

-- question 10 --
 SELECT ItemID, Description, Store, USCurrencyAmount
FROM ITEM
WHERE USCurrencyAmount=LocalCurrencyAmount*ExchangeRate;

-- question 11 --
SELECT City, Store
FROM ITEM;

-- question  12 --
SELECT COUNT(*)
FROM ITEM
WHERE City = Store;
