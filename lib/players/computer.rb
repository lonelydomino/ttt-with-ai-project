module Players

    class Computer < Player
        def move(board)
            valid = false
            valid_input = 0
            until valid == true 
                num = rand(1..9)
                if !board.taken?(num)
                    valid_input = num
                    valid = true
                end
            end
            valid_input.to_s
        end
    end
end