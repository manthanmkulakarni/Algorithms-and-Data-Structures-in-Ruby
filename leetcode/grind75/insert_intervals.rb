=begin
You are given an array of non-overlapping intervals intervals where intervals[i] = [starti, endi] represent the start and the end of the ith interval
and intervals is sorted in ascending order by starti. You are also given an interval newInterval = [start, end] that represents the start and end of another interval.
Insert newInterval into intervals such that intervals is still sorted in ascending order by starti and intervals still does not have any overlapping intervals
(merge overlapping intervals if necessary).

Return intervals after the insertion.

Note that you don't need to modify intervals in-place. You can make a new array and return it.

=end

# Solution
def insert(intervals, new_interval)
    #intervals = intervals.sort{ |a,b| a[0]<=>b[0]} (if intervals are not in sorted order then sort first)
    curr_interval=new_interval
    merged_intervals = []
    for i in 0...intervals.length
        if new_interval[0]>intervals[i][1]
            merged_intervals.push(intervals[i])
            next
        end
        if is_overlapping(intervals[i],curr_interval)
            curr_interval[0] = [intervals[i][0],curr_interval[0]].min
            curr_interval[1] = [intervals[i][1],curr_interval[1]].max
            next
        end
        merged_intervals.push(curr_interval)
        curr_interval = intervals[i]
    end 
    merged_intervals.push(curr_interval)
    merged_intervals
end

def is_overlapping(given_intv,curr_intv)
    # either interval 1's end time lies between interval 2 or vice-versa
    (given_intv[1]>=curr_intv[0] and given_intv[1]<=curr_intv[1]) or \
    (given_intv[0]<=curr_intv[1] and given_intv[1]>=curr_intv[1])
end

