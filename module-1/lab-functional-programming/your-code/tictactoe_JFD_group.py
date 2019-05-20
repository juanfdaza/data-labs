
# The code consists on defining the perimeter of the game -- this is columns and rows
# Then once that's defined the matrix is constructed initializing everything in 0
# Afterwards each user starts typing their name and variable to be used
# The user gives the position on the matrix
# The code checks if somebody is the winner and displays a message.


# PART 1: Defining the perimeter of the game + the matrix

## Function to check if  we have entered correctly the minimum of column/rows

def check_value(column_row):
    if column_row < 3:
        column_row = int(input("Mal, minimo 3,Define columnas/filas:"))
    return column_row

def check_input(x,row_or_column):
    if x > row_or_column:
        x = int(input("Mal, fuera del tablero elige un valor menor:"))
    return x

def define_matrix():
    column_row = int(input("Define columnas: "))
    column_row = check_value(column_row)
    print("valor = ",column_row)
    return(column_row)

columns = define_matrix()
rows = define_matrix()

def matrix_game():
    matrix = [[0 for column in range(columns)] for row in range(rows)]
    return matrix

### PART 2: Let the game begin allowing each player to choose their option

