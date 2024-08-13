#Problem : https://exercism.org/tracks/ruby/exercises/port-palermo

#Solution
module Port
    IDENTIFIER = :PALE
    
    def self.get_identifier(city)
      city[..3].upcase.to_sym
    end

    def self.get_terminal(ship_identifier)
      goods = ship_identifier.to_s.downcase[...3]
      if goods == "oil" or goods=="gas"
        :A
      else
        :B
      end
    end
end