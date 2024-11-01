# Problem: https://exercism.org/tracks/ruby/exercises/list-ops

# Solution
class ListOps
    def self.arrays(arr)
      len=0
      arr.each do |x|
        len+=1
      end
      len
    end

    def self.reverser(arr)
       return [] if arr==[]
      len = self.arrays(arr)
      i=0
      j=len-1
      while i<j
        arr[i],arr[j] = arr[j],arr[i]
        i+=1
        j-=1
      end
      arr
    end

    def self.concatter(arr1,arr2)
      return arr1||arr2 if arr1==[] || arr2==[]
      arr2.each do |num|
        arr1.append(num)
      end
      arr1
    end

    def self.mapper(arr,&block)
      return [] if arr==[]
      new_arr=[]
      arr.each do |x|
        val=block.call(x)
        new_arr.append(val)
      end
    new_arr
    end

    def self.filterer(arr,&block)
      return [] if arr==[]
      new_arr=[]
      arr.each do |x|
          new_arr.append(x) if block.call(x)
      end
    new_arr
    end

    def self.sum_reducer(arr)
      return 0 if arr==[]
      sum=0
      arr.each do |x|
          sum+=x
      end
    sum
    end

    def self.factorial_reducer(arr)
      return 1 if arr==[]
      factorial=1
      arr.each do |x|
          factorial*=x
      end
    factorial
    end    
  end