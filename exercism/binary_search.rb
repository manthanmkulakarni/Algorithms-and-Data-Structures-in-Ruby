# Problem: https://exercism.org/tracks/ruby/exercises/binary-search

# Solution
class BinarySearch
    def initialize(playlist)
      @playlist = playlist
    end
    
    def search_for(song,left=0,right=@playlist.length-1)
      return nil if left>right
      mid = left+((right-left)/2)
      return mid if @playlist[mid]==song
      if @playlist[mid]>song
        return search_for(song,left,mid-1)
      else
        return search_for(song,mid+1,right)
      end
    end
end