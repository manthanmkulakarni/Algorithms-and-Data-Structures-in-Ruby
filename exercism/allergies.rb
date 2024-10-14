# Problem: https://exercism.org/tracks/ruby/exercises/allergies

# Solution 1
class Allergies
    ALLERGY_VAL_FOOD_MAP = {
              1  => 'eggs',
              2  => 'peanuts',
              4  => 'shellfish',
              8  => 'strawberries',
              16 => 'tomatoes',
              32 => 'chocolate',
              64 => 'pollen',
              128 => 'cats'
            }
    
    def initialize(score)
      @score = score.to_s(2).reverse
      @allergies = []
    end

    def allergic_to?(item)
      self.list if @allergies.empty?
      @allergies.include?(item)
    end

    def list
      debug "score#{@score}"
      ALLERGY_VAL_FOOD_MAP.each do |key,val|
        @allergies.push(val) if @score[Math.log(key,2)] == '1'
      end
      @allergies
    end
end

# Solution 2
class Allergies
    ALLERGY_VAL_FOOD_MAP = {
                               1  => 'eggs',
                               2  => 'peanuts',
                               4  => 'shellfish',
                               8  => 'strawberries',
                               16 => 'tomatoes',
                               32 => 'chocolate',
                               64 => 'pollen',
                               128 => 'cats'
                          }
    
    def initialize(score)
      @score = score%256
      @list = []
    end
    
    def allergic_to?(item)
      self.list if @list.empty?
      @list.include?(item)
    end

    def list
      num = 2**7
      while num > 0
        if @score >= num
          @list.push(ALLERGY_VAL_FOOD_MAP[num])
          @score-=num
        end
        num/=2
      end
      @list.reverse!
    end
end