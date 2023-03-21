class Game
    def initialize
        @board = Board.new
        @previous_value = nil
        @current_value = nil
    end

    def play
        until @board.won?
            @board.normal_print
            @previous_value = self.make_guess
            @board.normal_print
            @current_value = self.make_guess 
            @board.normal_print
            if @previous_value == @current_value
                

        end
    end

    def make_guess
        puts "enter two numbers seperate by space, eg 2 1"
        user_pos = gets.chomp.split
        a,b = user_pos
        raise RuntimeError.new "Invalid Input" if a>3 || b>3 || a<0 || b<0 || @board[user_pos] == true
        @board.reveal(user_pos)
          

    end

