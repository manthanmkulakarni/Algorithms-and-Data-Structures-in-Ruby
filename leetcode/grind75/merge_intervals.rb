=begin
Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals,
and return an array of the non-overlapping intervals that cover all the intervals in the input.
=end

#Solution 1 (use last pushed intervals to check overlap)
def merge(intervals)
    intervals = intervals.sort{ |a,b| a[0]<=>b[0]}
    merged_intervals = [intervals[0]]
    for i in 1...intervals.length
        if is_overlapping(merged_intervals[-1],intervals[i])
            merged_intervals[-1][1] = [merged_intervals[-1][1],intervals[i][1]].max
            next
        end
        merged_intervals.push(intervals[i])
    end
    merged_intervals
end

def is_overlapping(intv1,intv2)
    intv1[1]>=intv2[0]
end

#Solution 2
def merge(intervals)
    intervals = intervals.sort{ |a,b| a[0]<=>b[0]}
    merged_intervals = []
    curr_interval = intervals[0]
    for i in 1...intervals.length
        if is_overlapping(curr_interval,intervals[i])
            curr_interval[1] = [curr_interval[1],intervals[i][1]].max
            next
        end
        merged_intervals.push(curr_interval)
        curr_interval = intervals[i]
    end
    merged_intervals.push(curr_interval)
    merged_intervals
end

def is_overlapping(intv1,intv2)
    intv1[1]>=intv2[0]
end