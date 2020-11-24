class Board
    attr_accessor :cells

    def initialize
        reset!
    end

    def reset!
        @cells = Array.new(9, " ")
    end

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end
    
    def position(n)
        n = fixindex(n)
        @cells[n] 
    end

    def full?
        @cells.each do |cell|
          if cell == " "
            return false
          end
        end
        return true
    end

    def turn_count
        turn_count = 0
        @cells.each do |cell|
            if cell == 'X' || cell == 'O'
                turn_count += 1
            end
        end
        turn_count
    end

    def taken?(n)#test has given 1, expects one argument
        if position(n) == "X" || position(n) == "O"
            return true
        else 
            return false
        end
    end

    def fixindex(n)
        n = n.to_i
        n = n - 1
        return n.to_i
    end

    def valid_move?(n)
        n1 = fixindex(n)
        return n1.between?(0,8) && !taken?(n)
    end

    def update(n, player)
        n = fixindex(n)
        @cells[n] = player.token
    end


end