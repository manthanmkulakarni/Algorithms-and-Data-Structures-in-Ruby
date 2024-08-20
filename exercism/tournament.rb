#Problem: https://exercism.org/tracks/ruby/exercises/tournament

#Solution
class Tournament
    def self.tally(input)
      matches = input.split("\n")
      point_table = {}
      matches.each do |match_str|
        team1,team2,result = match_str.split(";")
        self.set_team_data(team1,point_table) unless point_table.has_key?(team1)
        self.set_team_data(team2,point_table) unless point_table.has_key?(team2)
        point_table[team1][:MP]+=1
        point_table[team2][:MP]+=1
        if result == "win"
          point_table[team1][:W]+=1
          point_table[team1][:P]+=3
          point_table[team2][:L]+=1
        elsif result=="loss"
          point_table[team2][:W]+=1
          point_table[team2][:P]+=3
          point_table[team1][:L]+=1
        elsif result=="draw"
          point_table[team1][:D]+=1
          point_table[team2][:D]+=1
          point_table[team1][:P]+=1
          point_table[team2][:P]+=1
        else
          raise InputError
        end
      end
      self.format_scorebaord(point_table)
    end

    private
    def self.set_team_data(team,point_table)
      point_table[team] = { "MP":0, "W":0, "L":0 , "D":0, "P":0 }
    end
    
    def self.format_scorebaord(point_table)
        point_table = point_table.sort_by{|team,score| [-score[:P],team]}
        formatted = point_table.map do |team, result|
          played = result[:MP].to_s.rjust(2)
          points = result[:P ].to_s.rjust(2)
          wins   = result[:W ].to_s.rjust(2)
          draws  = result[:D ].to_s.rjust(2)
          losses = result[:L ].to_s.rjust(2)
        "#{team.ljust(30)} | #{played} | #{wins} | #{draws} | #{losses} | #{points}\n"
        end
        header = "Team                           | MP |  W |  D |  L |  P\n"
        header + formatted.join
    end
end
