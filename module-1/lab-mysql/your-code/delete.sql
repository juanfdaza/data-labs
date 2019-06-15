###### BONUS CHALLENGE -- UPDATE COMMAND #######
################################################

# First of all its a good practice to check the fields you want to delete

SELECT * FROM lab_mysql.cars WHERE VIN = 'DAM41UDN3CHU2WVF6';

# Now we've detected the field, and that we can correct it, lets delete it

DELETE FROM cars WHERE car_id = 4;

