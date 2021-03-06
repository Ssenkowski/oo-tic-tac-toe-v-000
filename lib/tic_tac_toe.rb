
class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],#Top_row_win
    [3,4,5],#Middle_row_win
    [6,7,8],#Bottom_row_win
    [0,3,6],#Left_column_win
    [1,4,7],#Middle_column_win
    [2,5,8],#Right_column_win
    [0,4,8],#Top_left_to_bottom_right_win
    [2,4,6],#Top_right_to_bottom_left_win
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player = "X")
    @board[index] = current_player
  end

  def position_taken?(index)
     !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |space|
      if space != " "
         counter += 1
      end
    end
    counter
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      position_taken?(win_combo[0]) && (@board[win_combo[0]] == @board[win_combo[1]]) && (@board[win_combo[1]] == @board[win_combo[2]])
    end
  end

  def full?
    WIN_COMBINATIONS.all? do |tokens|
      position_taken?(tokens[0])
    end
  end

   def draw?
     if !won? && full?
       return true
     end
   end

   def over?
     draw? == true || won? != nil
   end

   def winner
     WIN_COMBINATIONS.detect do |winner|
       if position_taken?(winner[0]) && (@board[winner[0]] == "X") && (@board[winner[1]] == "X") && (@board[winner[2]] == "X")
         return "X"
       elsif position_taken?(winner[0]) && (@board[winner[0]] == "O") && (@board[winner[1]] == "O") && (@board[winner[2]] == "O")
         return "O"
       end
     end
   end


    def play
      counter = 0
      until over?
        turn
        counter += 1
      end

       if won?
         winner == "X" || winner == "O"
         puts "Congratulations #{winner}!"
       else draw?
         puts "Cat's Game!"
       end
    end

end
