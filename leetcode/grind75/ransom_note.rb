=begin
Given two strings ransomNote and magazine, return true if ransomNote can be constructed by using the letters from magazine and false otherwise.
Each letter in magazine can only be used once in ransomNote.
=end

# Solution (instead of tally we can create the count hashmap ourselves)
def can_construct(ransom_note, magazine)
    magazine_chars_count = magazine.chars.tally
    ransom_note_chars_count = ransom_note.chars.tally
    ransom_note_chars_count.each do |char,count|
        return false if magazine_chars_count[char].nil? or magazine_chars_count[char]<count
    end
    true
end