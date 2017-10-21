
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

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?index)
      moveindex, current_player
      display_board
    else
      turn
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
       puts "Congratulations #{winner(@board)}!"
     else draw?
       puts "Cat's Game!"
     end
  end


  def turn_count
    counter = 0
    board.each do |space|
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

  def position_taken?(index)
     !(@board[index].nil? || @board[index] == " ")
  end

  # Define your WIN_COMBINATIONS constant

  def won?(board)
    WIN_COMBINATIONS.find do |win_combo|
      @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[0]] == @board[win_combo[2]] && position_taken?(win_combo[1])
    end
  end

  def full?
   if @board.include?(' ')
     return false
   else
     return true
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
    if won?
      return @board[won?[0]]
    end
  end

end
