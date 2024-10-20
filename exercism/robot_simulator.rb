# Problem: https://exercism.org/tracks/ruby/exercises/robot-simulator

# Solution
class Robot
    attr_accessor :bearing
    DIRECTIONS = [:north,:east,:south,:west]

    def orient(direction)
      raise ArgumentError unless %i[east west north south].include?(direction)
      @bearing = direction
    end

    def turn_right
      @bearing = DIRECTIONS[(DIRECTIONS.index(@bearing)+1)%4]
    end

    def turn_left
      @bearing = DIRECTIONS[(DIRECTIONS.index(@bearing)-1)%4]
    end

    def at(x,y)
      @x = x
      @y = y
    end

    def coordinates
      [@x,@y]
    end

    def advance
      case @bearing
      when :north
        @y+=1
      when :south
        @y-=1
      when :east
        @x+=1
      when :west
        @x-=1
      else
        raise ArgumentError
      end
    end
  end

  class Simulator
    def instructions(instruction_str)
      commands = []
      instruction_str.chars.each do |instruction|
        case instruction
        when "R"
          commands.push(:turn_right)
        when "L"
          commands.push(:turn_left)
        when "A"
          commands.push(:advance)
        else
          raise ArgumentError
        end
      end
      commands
    end 

    def place(robot,**kwargs)
      robot.at(kwargs[:x],kwargs[:y])
      robot.orient(kwargs[:direction])
    end
    
    def evaluate(robot,instruction_str)
      commands = instructions(instruction_str)
      commands.each do |command|
        robot.send(command)
      end
    end
end

# Solution 2
class Robot
    INCREMENTS = {north: [0,1], east: [1,0], south: [0,-1], west: [-1,0]}
    VALID_BEARINGS = INCREMENTS.keys
  
    attr_reader :bearing, :coordinates
  
    def orient(direction)
      raise ArgumentError unless VALID_BEARINGS.include? direction
      @bearing = direction
    end
  
    def turn_right
      @bearing = VALID_BEARINGS[VALID_BEARINGS.index(@bearing) + 1] || :north
    end
  
    def turn_left
      @bearing = VALID_BEARINGS[VALID_BEARINGS.index(@bearing) - 1]
    end
  
    def at(*coordinates)
      @coordinates = coordinates
    end
  
    def advance
      @coordinates = @coordinates.zip(INCREMENTS[@bearing]).map { |a, b| a + b }
    end
  end
  
  class Simulator
    COMMANDS = { 'L' => :turn_left, 'R' => :turn_right, 'A' => :advance }
  
    def instructions(command_str)
      command_str.chars.map { |cmd| COMMANDS[cmd] }
    end
  
    def place(robot, x: 0, y: 0, direction: :north)
      robot.at(x, y)
      robot.orient(direction)
    end
  
    def evaluate(robot, command_str)
      instructions(command_str).each { |cmd| robot.send(cmd) }
    end
end