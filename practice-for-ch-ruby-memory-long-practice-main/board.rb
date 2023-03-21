require_relative "card"

class Board
    def initialize
        @grid = Array.new(4) { Array.new(4) }
    end

    def scan?(face_value)
        @grid.any? do |row|
            row.any? {|card| card.cheat == face_value}
        end
    end

    # def count(face_value)
    #     count = 0
    #     @grid.each do |row|
    #         @row.each do |card|
    #             count += 1 if card.cheat == face_value
    #         end
    #     end

    #     count
    # end

    def full?
        @grid.any? do |row|
            row.any? {|ele| ele == nil }
        end
    end

    def add(pos, face_value)
        a,b = pos
        if @grid[a][b] == []
            @grid[a][b] = Card.new(face_value)
            true
        else
            false
        end
    end

    def gen_pos
        a = rand(0..3)
        b = rand(0..3)
        [a,b]
    end


    def populate
        alpha = ('a'..'z').map { |ele| ele }
        p alpha

        until self.full?
            letter = alpha.sample
            if !self.scan?(letter)
                pos = gen_pos
                until self.add(pos, letter)
                    pos = gen_pos
                end
                until self.add(pos, letter)
                    pos = gen_pos
                end
            end
        end

        p @grid
    end

end

