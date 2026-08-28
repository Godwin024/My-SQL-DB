-- Question One
SELECT trip_id, rider_name, fare, city FROM quickride.trips WHERE city = 'Lagos';

-- Question Two
SELECT rider_name, city, fare FROM trips ORDER BY fare DESC LIMIT 5;

-- Question Three
SELECT DISTINCT city FROM trips;

-- Question Four
SELECT * FROM quickride.trips WHERE payment_method = 'Card' and fare > 5000; 

-- Question Five
SELECT * FROM trips WHERE distance_km BETWEEN 5 AND 10;


-- Question Six
SELECT * FROM quickride.trips WHERE rider_name LIKE 'A%';

-- Question seven
SELECT * FROM quickride.trips WHERE payment_method IN ('Card', 'Wallet');

-- Question Eight
SELECT * FROM quickride.trips WHERE rating IS NULL;

-- Question Nine
SELECT city, max(fare) as highest_fare FROM quickride.trips 
WHERE status = 'Completed' GROUP BY city ORDER BY highest_fare DESC;

-- Question Ten

SELECT * FROM quickride.trips WHERE status = 'Completed' ORDER BY city ASC, fare DESC;