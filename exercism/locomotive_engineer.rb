# Problem: https://exercism.org/tracks/ruby/exercises/locomotive-engineer

# Solution
class LocomotiveEngineer
    def self.generate_list_of_wagons(*wagons)
      wagons
    end
    def self.fix_list_of_wagons(each_wagons_id, missing_wagons)
      first,second, id1,*rest = each_wagons_id
      [id1,*missing_wagons,*rest,first,second]
    end
    def self.add_missing_stops(route,**stoppage_hash)
      {**route,stops:stoppage_hash.values}
      
    end
    def self.extend_route_information(route, more_route_information)
      {**route,**more_route_information}
    end
  end