#Problem: https://exercism.org/tracks/ruby/exercises/space-age

#Solution
class SpaceAge
    PLANET_YEARS= {
        mercury:  7.60054e6,
        venus:    1.94141e7,
        earth:    3.15576e7,
        mars:     5.93540e7,
        jupiter:  3.74356e8,
        saturn:   9.29292e8,
        uranus:   2.65137e9,
        neptune:  5.20042e9,
    }
    
    def initialize(seconds)
      @seconds = seconds
    end
    
    # Lets taste some metaprogramming
    PLANET_YEARS.each do |planet, period|
      define_method("on_#{planet}") { @seconds / period }
    end
end

#Solution 2
class SpaceAge
  def initialize(age_in_sec)
    @age_in_sec = age_in_sec
  end

  def on_earth
    (@age_in_sec/31557600.0)
  end

  def on_mercury
    on_earth/0.2408467
  end

  def on_venus
    on_earth/0.61519726
  end

  def on_mars
    on_earth/ 1.8808158
  end

  def on_jupiter
    on_earth/ 11.862615
  end

  def on_saturn
    on_earth/ 29.447498
  end

  def on_neptune
    on_earth/ 164.79132
  end
  
  def on_uranus
    on_earth/ 84.016846
  end
end