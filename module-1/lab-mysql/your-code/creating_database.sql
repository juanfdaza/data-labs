###### BONUS CHALLENGE -- UPDATE COMMAND #######
################################################

# First of all its a good practice to check the fields you want to change

SELECT * FROM salespersons WHERE 'city' = 'Mimia';

# Now we've detected the field, and that we can correct it, lets delete it

UPDATE salespersons SET store = 'Miami' WHERE salespersons_id = 4