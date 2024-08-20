#Problem: https://exercism.org/tracks/ruby/exercises/twelve-days

#Solution
class TwelveDays
    DAYS = {
            1=>["first","a Partridge in a Pear Tree"],
            2=>["second","two Turtle Doves"],
            3=>["third","three French Hens"],
            4=>["fourth","four Calling Birds"],
            5=>["fifth","five Gold Rings"],
            6=>["sixth","six Geese-a-Laying"],
            7=>["seventh","seven Swans-a-Swimming"],
            8=>["eighth","eight Maids-a-Milking"],
            9=>["ninth","nine Ladies Dancing"],
            10=>["tenth","ten Lords-a-Leaping"],
            11=>["eleventh","eleven Pipers Piping"],
            12=>["twelfth","twelve Drummers Drumming"]
    }
    def self.song
      song = ""
      base_line = "On the %{ith} day of Christmas my true love gave to me: %{phrase}.\n"
      for i in 1..12
        phrase = ""
        j =i
        while j>0
          phrase+="and " if j==1 and i!=1
          phrase+=DAYS[j][1]
          phrase+=", " unless j==1
          j-=1
        end
        song+="\n" unless song==""
        song+= base_line % {ith:DAYS[i][0],phrase:phrase}
      end
      song
    end
end