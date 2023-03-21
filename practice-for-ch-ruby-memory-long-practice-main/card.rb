class Card #AKQJ
    
    def initialize(face_value, face_up=false)
        @face_up = face_up
        @face_value = face_value
    end

    def hide
        @face_up = true
    end


    def reveal
        @face_up = false
    end

    def to_s
        if @face_up == true
            @face_value
        else
            puts 'card not revealed' ##not printing with ==
        end
    end

    def ==(card_2)
        @face_value == card_2.to_s
    end

    def cheat
        @face_value
    end

end 

c1 = Card.new(true, 'A')
c2 = Card.new(true, 'B')
p c1 == c2