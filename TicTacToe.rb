##
# This program is the Tic Tac Toe board game.
#
# @author  Marlon Poddalgoda
# @version 1.0
# @since   2021-05-16
# frozen_string_literal: true

def win_check(board, player_check)
    # checks to see if inputted board has a winner
    if (board[0] == player_check && board[1] == player_check && board[2] == player_check) ||
        (board[3] == player_check && board[4] == player_check && board[5] == player_check) ||
        (board[6] == player_check && board[7] == player_check && board[8] == player_check) ||
        (board[0] == player_check && board[3] == player_check && board[6] == player_check) ||
        (board[1] == player_check && board[4] == player_check && board[7] == player_check) ||
        (board[2] == player_check && board[5] == player_check && board[8] == player_check) ||
        (board[0] == player_check && board[4] == player_check && board[8] == player_check) ||
        (board[2] == player_check && board[4] == player_check && board[6] == player_check)
        return true
    else
        return false
    end
end

def mini_max(game_board, counter)
    # Uses minimax algorithm and recursion to determine best moveset

    # counter if statement
    if counter > 9
        if is_numeric(game_board[counter])
            # temp variable
            val_hold = game_board[counter]
            # set current counter in array to "O"
            game_board[counter] = 'O'

            # check for winner
            if win_check(game_board, 'O')
                # set current value to "O"
                game_board[counter] = 'O'
                # increase countplace to induce a outofbounds error
                counter += 50
            else
                # reset back to temp value
                game_board[counter] = val_hold
            end

            # set current counter to "X"
            game_board[counter] = 'X'

            # check for winner
            if win_check(game_board, 'X')
                # replace current value with "O"
                game_board[counter] = 'O'
                counter += 50
            else
                # reset the value of a location in the array
                game_board[counter] = val_hold
            end
        end

        #  call function
        mini_max(game_board, counter + 1)
    # checks that counter is winthin parameters
    elsif counter > 8 && counter < 20
        # call for selective cases
        selective_cases(game_board, counter)
    else
        return game_board
    end
    # return statement
    return game_board
rescue StandardError
    # error for counter
    return game_board
end


def selective_cases(game_board)
    # generate random num
    random_num = rand(0..3)
    if is_numeric(game_board[4])
        game_board[4] = 'O'
    # selective cases for computer to use
    # special case 1
    elsif game_board[4] == 'O' && game_board[0] == 'X' &&
            game_board[8] == 'X' && is_numeric(game_board[1]) &&
            is_numeric(game_board[3]) && is_numeric(game_board[5]) &&
            is_numeric(game_board[7])
        if random_num.zero? && is_numeric(game_board[1])
            game_board[1] = 'O'
        elsif random_num == 1 && is_numeric(game_board[3])
            game_board[3] = 'O'
        elsif random_num == 2 && is_numeric(game_board[5])
            game_board[5] = 'O'
        elsif random_num == 3 && is_numeric(game_board[7])
            game_board[7] = 'O'
        end
    # special case 2
    elsif game_board[4] == 'O' && game_board[2] == 'X' &&
            game_board[6] == 'X' && is_numeric(game_board[1]) &&
            is_numeric(game_board[3]) && is_numeric(game_board[5]) &&
            is_numeric(game_board[7])
        if random_num.zero? && is_numeric(game_board[1])
            game_board[1] = 'O'
        elsif random_num == 1 && is_numeric(game_board[3])
            game_board[3] = 'O'
        elsif random_num == 2 && is_numeric(game_board[5])
            game_board[5] = 'O'
        elsif random_num == 3 && is_numeric(game_board[7])
            game_board[7] = 'O'
        end
    # special case 3
    elsif game_board[4] == 'O' && game_board[1] == 'X' &&
            game_board[3] == 'X' && is_numeric(game_board[0]) &&
            is_numeric(game_board[2]) && is_numeric(game_board[5]) &&
            is_numeric(game_board[6]) && is_numeric(game_board[7]) &&
            is_numeric(game_board[8])
        game_board[0] = 'O'
    # special case 4
    elsif game_board[4] == 'O' && game_board[1] == 'X' &&
            game_board[5] == 'X' && is_numeric(game_board[0]) &&
            is_numeric(game_board[2]) && is_numeric(game_board[3]) &&
            is_numeric(game_board[6]) && is_numeric(game_board[7]) &&
            is_numeric(game_board[8])
        game_board[2] = 'O'
    # special case 5
    elsif game_board[4] == 'O' && game_board[3] == 'X' &&
            game_board[7] == 'X' && is_numeric(game_board[0]) &&
            is_numeric(game_board[1]) && is_numeric(game_board[2]) &&
            is_numeric(game_board[5]) && is_numeric(game_board[6]) &&
            is_numeric(game_board[8])
        game_board[6] = 'O'
    # special case 6
    elsif game_board[4] == 'O' && game_board[5] == 'X' &&
            game_board[7] == 'X' && is_numeric(game_board[0]) &&
            is_numeric(game_board[1]) && is_numeric(game_board[2]) &&
            is_numeric(game_board[3]) && is_numeric(game_board[6]) &&
            is_numeric(game_board[8])
        game_board[8] = 'O'
    # many more special cases
    elsif random_num == 1 && is_numeric(game_board[2])
        game_board[2] = 'O'
    elsif random_num == 2 && is_numeric(game_board[6])
        game_board[6] = 'O'
    elsif random_num == 3 && is_numeric(game_board[8])
        game_board[8] = 'O'
    elsif random_num.zero? && is_numeric(game_board[1])
        game_board[1] = 'O'
    elsif random_num == 1 && is_numeric(game_board[3])
        game_board[3] = 'O'
    elsif random_num == 2 && is_numeric(game_board[5])
        game_board[5] = 'O'
    elsif random_num == 3 && is_numeric(game_board[7])
        game_board[7] = 'O'
    end
    return game_board
end

def is_full(board)
    # Returns whether the board if full or not
    counter = 0
    full = true
    while counter != board.length.to_i
        if is_numeric(board[counter])
            full = false
            break
        end
        counter += 1
    end
    return full
end

def print_board(the_board)
    # Prints out the current game board
    new_string = ''
    counter = 0
    puts '----+----+----'
    while counter < 9
        new_string = "#{new_string} | #{the_board[counter]}"
        if ((counter + 1) % 3).zero?
            puts new_string
            new_string = ''
            puts '----+----+----'
        end
        counter += 1
    end
end

def is_numeric(string_num)
    # Checks each box for input
    if %w[X O].include?(string_num)
        return false
    else
        return true
    end
end

# This is the main function for Tic Tac Toe
full_board = false
check_win_x = false
check_win_o = false
# creates the string of intigers for the square
tic_tac_board = %w[1 2 3 4 5 6 7 8 9]

puts "Welcome to tic tac toe!\n"

# prints out the board
print_board(tic_tac_board)

# Starts loop
loop do
    # Asks for user input
    puts 'Which space would you like to put the X?'
    space = gets.chomp.to_i

    # check space
    if space >= 1 && space <= 9 && is_numeric(tic_tac_board[space - 1])
        # replace value with x
        tic_tac_board[space - 1] = 'X'
        counter = 0
        # call function
        mini_max(tic_tac_board, counter)
        # print function
        print_board(tic_tac_board)
    elsif tic_tac_board[space - 1] == 'X' || tic_tac_board[space - 1] == 'O'
        # Finds if the spot is taken
        puts "\nThat spots taken!"
        print_board(tic_tac_board)
    else
        puts "\nError, Try again"
        break
    end
    # Determines who ones the game
    check_win_x = win_check(tic_tac_board, 'X')
    check_win_o = win_check(tic_tac_board, 'O')
    if check_win_x == true
        puts "\nX has won."
    elsif check_win_o == true
        puts "\nO has won."
    end
    # Finds if the board if full
    full_board = is_full(tic_tac_board)
    # Determines if it is a tie
    if full_board == true && check_win_x == false && check_win_o == false
        puts "\nIt's a Tie."
        puts "\nGame Over."
        puts "\nDone"
        break
    # Determiens if game is over
    elsif full_board == true || full_board == false && (check_win_x == true || check_win_o == true)
        puts "\nGame Over."
        puts "\nDone"
        break
    end
end