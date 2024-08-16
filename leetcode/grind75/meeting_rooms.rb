=begin
Given an array of meeting time intervals consisting of start and end times [(s1,e1),(s2,e2),...] (si < ei),
determine if a person could attend all meetings.
[(0,8), (8,10)] is not conflict at 8

#This is paid problem on Leetcode but can attempt freely on chinese lintcode: https://www.lintcode.com/problem/920/
=end

#Solution
def can_attend_meetings(intervals)
    intervals = intervals.sort {|a,b| a[0]<=>b[0]}
    last_meeting_ends_at = intervals[0][1]
    for i in 1...intervals.length
        return false if last_meeting_ends_at>interval[i][0]
        last_meeting_ends_at = interval[i][1]
    end
    true
end