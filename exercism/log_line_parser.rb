#problem: https://exercism.org/tracks/ruby/exercises/log-line-parser

#Solution
class LogLineParser
    def initialize(line)
      @line = line
    end
    def message
      start_of_msg = @line.index(":")
      end_of_msg = @line.size-1
      msg=@line.slice(start_of_msg+1,end_of_msg)
      return msg.strip
      
    end
    def log_level
      start = @line.index("[")+1
    end_of_log= @line.index("]")-1
      @line.slice(start,end_of_log).downcase
    end
    def reformat
      start_of_msg = @line.index(":")
      end_of_msg = @line.size-1
      msg =@line.slice(start_of_msg+1,end_of_msg).strip
      start = @line.index("[")+1
      end_of_log= @line.index("]")-1
      tag = @line.slice(start,end_of_log).downcase
      return msg+" ("+tag+")"
    end
end