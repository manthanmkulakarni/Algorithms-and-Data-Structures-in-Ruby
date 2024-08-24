#Problem: https://exercism.org/tracks/ruby/exercises/etl

#Solution
class ETL
    def self.transform(old_mapping)
      new_mapping = {}
      old_mapping.each do |point,letters|
        letters.each do |letter|
          new_mapping[letter.downcase]=point
        end
      end
      new_mapping
    end
end