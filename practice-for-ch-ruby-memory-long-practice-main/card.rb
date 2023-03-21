class Card
    attr_reader :face_up

    def initialize(face_value, face_up=false)
        @face_up = face_up
        @face_value = face_value
    end

    def hide
        @face_up = false
    end


    def reveal
        @face_up = true
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
