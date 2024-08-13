#Problem: https://exercism.org/tracks/ruby/exercises/blackjack

#Solution
module Blackjack
    def self.parse_card(card)
      case card
      when "ace"
        11
      when "two"
        2
      when "three"
        3
      when "four"
        4
      when "five"
        5
      when "six"
        6
      when "seven"
        7
      when "eight"
        8
      when "nine"
        9
      when "ten","jack","queen","king"
        10
      else
        0
      end
    end
  
    def self.card_range(card1, card2)
      case parse_card(card1)+parse_card(card2)
      when 4..11
        "low"
      when 12..16
        "mid"
      when 17..20
        "high"
      when 21
        "blackjack"
      else
        "two aces"
      end 
    end
  
    def self.first_turn(card1, card2, dealer_card)
      case card_range(card1, card2)
      when "two aces"
        "P"
      when "blackjack"
        [10,11].include?(parse_card(dealer_card)) ? "S" : "W"
      when "high"
        "S"
      when "mid"
        parse_card(dealer_card) >=7 ?  "H" :  "S"
      when "low"
        "H"
      end      
    end
end
  