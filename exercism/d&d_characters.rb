#Problem: https://exercism.org/tracks/ruby/exercises/dnd-character

#Solution
class DndCharacter
    ATTRS = %i[strength dexterity constitution intelligence wisdom charisma].freeze
    ROLLS = (1..6).to_a.freeze
    attr_reader *ATTRS
    def self.modifier value
      case value
      when 3 then -4
      when 4..5 then -3
      when 6..7 then -2
      when 8..9 then -1
      when 10..11 then 0
      when 12..13 then 1
      when 14..15 then 2
      when 16..17 then 3
      else 4
      end
    end
    def initialize
      ATTRS.each { |attr| instance_variable_set("@#{attr}", roll_attr) }
    end
    def hitpoints
      10 + self.class.modifier(constitution)
    end
    private
    def roll_attr
      4.times.map { ROLLS.shuffle.sample }
       .sort.reverse
       .take(3).sum
    end
end