class Card
    
    def initialize(face, face_value)
        @face = face
        @face_value = face_value
    end

    def hide
        @face = 'face_down'
    end


    def reveal
        @face = 'face_up'
    end

    def to_s
        if @face == 'face_up'
            @face_value
        else
            puts 'card not revealed'
        end
    end

    def ==(card_2)
        @face_value == card_2.to_s
    end

end 

c1 = Card.new('face_up', '3D')
c2 = Card.new('face_up', '4D')
p c1 == c2