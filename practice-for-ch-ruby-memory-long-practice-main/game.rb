require_relative "board"

class Game
    def initialize
        @board = Board.new
        @previous_value = nil
        @current_value = nil
        @previous_pos = nil
        @current_pos = nil
    end

    def play
        until @board.won?
            @board.normal_print
            @previous_value, @previous_pos = self.make_guess
            @board.normal_print
            @current_value, @current_pos = self.make_guess 
            @board.normal_print
            if @previous_value != @current_value
                @board.hide(@previous_pos)
                @board.hide(@current_pos)
            end
        end
        @board.normal_print
        print "YOU WIN"
    end

    def make_guess
        puts "enter two numbers seperate by space, eg 2 1"
        user_pos = gets.chomp.split
        a,b = user_pos
        a,b = a.to_i, b.to_i
        raise RuntimeError.new "Invalid Input" if a>3 || b>3 || a<0 || b<0 || @board[[a, b]] == true
        [@board.reveal([a, b]), [a, b]]
    end

end