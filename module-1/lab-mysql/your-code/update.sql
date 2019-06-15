###### BONUS CHALLENGE -- UPDATE COMMAND #######
################################################

# First of all its a good practice to check the fields you want to change

SELECT * FROM salespersons WHERE 'city' = 'Mimia';

# Now we've detected the field, and that we can correct it, lets delete it

UPDATE salespersons SET store = 'Miami' WHERE salespersons_id = 4


# Updating the emails

UPDATE customers SET email = CASE
WHEN name = 'Pablo Picasso' THEN  'ppicasso@gmail.com'
WHEN name = 'Abraham Lincoln' THEN 'incoln@us.gov'
WHEN name = 'Napoléon Bonaparte' THEN 'hello@napoleon.me'
ELSE email END
WHERE name in ('Pablo Picasso','Abraham Lincoln','Napoléon Bonaparte');