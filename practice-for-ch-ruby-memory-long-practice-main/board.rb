require_relative "card"

class Board
    def initialize
        @grid = Array.new(4) { Array.new(4) }
        self.populate
    end

    def scan?(face_value)
        @grid.any? do |row|
            row.any? {|card| card != nil && card.cheat == face_value}
        end
    end

    def full?
        @grid.none? do |row|
            row.any? {|ele| ele == nil }
        end
    end

    def add(pos, face_value)
        a,b = pos
        if @grid[a][b] == nil
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

    def cheat_print
        print "  0 1 2 3\n"

        row_count = 0
        @grid.each do |row|
            print "#{row_count} "
            row.each do |card|
                print "#{card.cheat} "
            end
            row_count += 1
            print "\n"
        end

    end

    def normal_print
        print "  0 1 2 3\n"

        row_count = 0
        @grid.each do |row|
            print "#{row_count} "
            row.each do |card|
                if card.face_up == true
                    print "#{card.cheat} "
                else 
                    print "  "
                end
            end
            row_count += 1
            print "\n"
        end
    end
        


    def populate
        alpha = ('a'..'z').map { |ele| ele }

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

        self.normal_print
    end

    def won?
        @grid.all? do |row|
            row.all? {|card| card.face_up }
        end
    end

    def reveal(pos) ###(pos1 is row, pos2 is col)
        a,b = pos
        card = @grid[a][b]
        if card.face_up == false
            card.reveal
            card.cheat
        end
    end

     def hide(pos)
        a,b = pos
        card = @grid[a][b]
        if card.face_up == true
            card.hide
            card.cheat
        end
    end


end

