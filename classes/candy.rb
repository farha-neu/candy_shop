def Candy

    attr_reader :name
    attr_accessor :is_shelved

    def initialize(name, is_shelved)
        @name = name
        @is_shelved = is_shelved
    end
    
end