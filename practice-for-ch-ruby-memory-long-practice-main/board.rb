class Board
    def initialize
        @grid = Array.new(4) { Array.new(4) }
    end

    def populate
        alpha = ('a'..'z').map {|ele| ele }
        p alpha.sample

        
    end

    def scan?(face_value)
        @grid.any? do |row|
            row.any?  {|card| card.cheat == face_value}
        end
    end

    def full?
        @grid.any? do |row|
            row.any? {|ele| ele.length == 0}
        end
    end

end

