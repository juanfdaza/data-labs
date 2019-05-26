##### Challenge 2: lab-mysql #######
####################################

# First of all we need to create the database
# In first place we log in:

$ mysql -u your_username -p

# Now we create the database:
mysql> CREATE DATABASE lab_mysql;
Query OK, 1 row affected (0.02 sec)

# We switch the database in use to start working with the one created just now
mysql> USE lab_mysql;
Database changed

-- ------------------------------

# Step #2: creating the tables with its columns indicating the primary key and the nullable values

# Car table
CREATE TABLE cars (
    car_id VARCHAR(5)     NOT NULL,
    VIN  VARCHAR(30)      NOT NULL,
    manufacturer  VARCHAR(30)      NOT NULL,
    model  VARCHAR(30)      NOT NULL,
    year  VARCHAR(4)      NOT NULL,
    color  VARCHAR(15)      NOT NULL,
    PRIMARY KEY(car_id));
