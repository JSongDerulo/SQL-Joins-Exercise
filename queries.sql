-- write your queries here

-- Join the two tables so that every column and record appears, regardless of if there is not an owner_id 
SELECT * FROM owners 
    FULL JOIN vehicles ON owners.id = vehicles.owner_id;

-- Count the number of cars for each owner. Display the owners first_name , last_name and count of vehicles. The first_name should be ordered in ascending order.
SELECT first_name, last_name, COUNT(owners.id) FROM owners 
    JOIN vehicles ON owners.id = vehicles.owner_id 
    GROUP BY owners.id 
    ORDER BY first_name ASC;

-- Count the number of cars for each owner and display the average price for each of the cars as integers. Display the owners first_name , last_name, average price and count of vehicles. The first_name should be ordered in descending order. Only display results with more than one vehicle and an average price greater than 10000.
SELECT first_name, last_name, CAST(AVG(price) AS int) AS average_price, COUNT(owners.id) FROM owners 
    JOIN vehicles ON owners.id = vehicles.owner_id 
    GROUP BY owners.id 
    HAVING COUNT(owners.id) > 1 AND CAST(AVG(price) AS int) > 10000 
    ORDER BY first_name DESC;