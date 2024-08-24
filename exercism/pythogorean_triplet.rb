#Problem: https://exercism.org/tracks/ruby/exercises/pythagorean-triplet

#Solution
class PythagoreanTriplet
    def self.triplets_with_sum(n)
      triplets = []
      for b in 4..(n-1)
        deno = 2*(n-b)
        n_sq = n**2
        a = (n_sq-(2*n*b))/deno
        c = (n_sq/deno)-b
        triplets.push([a,b,c]) if a>0 and a<b and c>b and a+b+c==n
      end
      triplets = triplets.sort_by{|val| val[0]}   
    end
end
  
#Solution 2
class PythagoreanTriplet
    def self.triplets_with_sum(sum)
      (1..sum / 3).each_with_object([]) do |side_a, triplets|
        side_b = (sum * (sum - 2 * side_a)) / (2 * (sum - side_a))
        side_c = sum - side_a - side_b
        next if side_b < side_a || side_c < side_b
        triplets << [side_a, side_b, side_c] if (side_a**2 + side_b**2 == side_c**2)
      end
    end
end