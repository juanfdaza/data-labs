##################################################################################
##################################################################################
# The code consists on defining the perimeter of the game -- this is columns and rows
# Then once that's defined the matrix is constructed initializing everything in 0
# Afterwards each user starts typing their name and variable to be used
# The user gives the position on the matrix
# The code checks if somebody is the winner and displays a message.
##################################################################################
##################################################################################

##################################################################################
# PART 1: Defining the perimeter of the game + the matrix
##################################################################################
## Function to check if  we have entered correctly the minimum of column/rows

def check_value(row_column_definition):
    while row_column_definition < 3:
        row_column_definition = int(input("Mal, minimo 3,Define columnas/filas: "))
    return row_column_definition

def check_input(x,row_or_column):
    if x > row_or_column:
        x = int(input("Mal, fuera del tablero elige un valor menor: "))
    return x

def define_matrix():
    row_column_definition = int(input("Define columnas: "))
    row_column_definition = check_value(row_column_definition)
    return(row_column_definition)


# Function to define the board to play once we know the number of rows/columns

def matrix_game(columns,rows):
    matrix_to_play = [[0 for column in range(columns)] for row in range(rows)]
    return matrix_to_play

##################################################################################
### PART 2: Let the game begin allowing each player to choose their option #######
##################################################################################

# Subfunctions that will be used in the main one which is player choice
#######################################################################

# 1st -- Function to ask the player their play

def name_player():
    player = input("Que jugador eres? ")
    return player

def player_choice(columns):
    # Lets ask the player which coordinates is he choosing

    coord = int(input("Ingresa la coordenada (del 1 al 3):"))

    # Lets check that the coordinates are in the range of the board
    check_input(coord, columns)

    return (coord)


# 2nd -- Function to Check that a value has not been introduced on an already filled position
def already_selected(value_to_check):
    repeat = 1
    while value_to_check != 0:
        print("Mal, esa celda esta cogida, repita valores por favor: ")
        repeat = 0
    return(repeat)



# 3rd -- Function to check if somebody has won and the game is over -->
# with the explanation of how a player can win on the proper function

def game_on(columns,rows,player,matrix_to_play):
    column_counter = 0
    row_counter = 0
    cross_counter = 0
    inverse_cross_counter = 0
    result = 0


# There are basically 4 ways in which a player can win:
# 1st - the player completes a column
# 2nd - the player completes a row
# 3rd - the player completes a diagonal X normal
# 4th - the player completes a diagonal X normal or inverse)

# Case 1 check

    for col in range(columns):
        for row in range(rows):
            if matrix_to_play[col][row] != 0:
                column_counter += 1
            if column_counter == columns:
                print('Player', player, ' wins a column has been completed')
                result = 1
        column_counter = 0

# Case 2 check

    for row in range(rows):
        for col in range(columns):
            if matrix_to_play[col][row] != 0:
                row_counter += 1
            if row_counter == rows:
                print('Player', player, ' has completed a row')
                result = 1
        row_counter = 0

# Case 3 check

    for row in range(rows):
        for col in range(columns):
            if row == col:
                if matrix_to_play[col][row] != 0:
                    cross_counter += 1
            if cross_counter == rows:
                print('Player', player, ' has completed a cross')
                result = 1

# Case 4 check

    for row in range(rows):
        for col in range(columns):
            if row == -col:
                if matrix_to_play[-col][row] != 0:
                    inverse_cross_counter += 1
            if inverse_cross_counter == rows:
                print('Player', player, ' has completed an inverse cross')
                result = 1
    return result



##################################################################################
### PART 3: The function to gather everything to play
##################################################################################

def whole_game():
    result = 0
    # Lets define the size of the board

    columns = define_matrix()
    rows = define_matrix()

    # Matrix construction
    matrix_to_play = matrix_game(columns,rows)
    print(matrix_to_play)


    # The proper game

    while result != 1:
        # Define the player
        player = name_player()

        # Get players values
        coord_x = player_choice(columns)
        coord_y = player_choice(rows)

        #Checking the coordinates are inbounds
        repeat_value = already_selected(matrix_to_play[coord_x][coord_y])
        while repeat_value == 0:
            coord_x = player_choice(columns)
            coord_y = player_choice(rows)
            repeat_value = already_selected(matrix_to_play[coord_x][coord_y])

        # Changing the values in the matrix
        matrix_to_play[coord_x][coord_y] = player

        # Check if the game is over
        result = game_on(columns,rows,player,matrix_to_play)
        print(matrix_to_play)

    print('Player', player, 'has won, these are the results \n', matrix_to_play)


whole_game()