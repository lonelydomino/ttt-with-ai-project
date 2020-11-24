class Game
    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
    attr_accessor :board, :player_1, :player_2
    
    def initialize(p1 = Players::Human.new("X"), p2 = Players::Human.new("O"), board = Board.new)
       @board = board
       @player_1 = p1
       @player_2 = p2
    end
    
    def current_player
       if @board.turn_count % 2 == 0
           return @player_1
       else
           return @player_2
       end
    end


    def won?
        WIN_COMBINATIONS.each do |win_combination|
          win_index_1 = win_combination[0]
          win_index_2 = win_combination[1]
          win_index_3 = win_combination[2]
          position_1 = @board.cells[win_index_1]
          position_2 = @board.cells[win_index_2]
          position_3 = @board.cells[win_index_3]
          
          if position_1 == "X" && position_2 == "X" && position_3 == "X"
            win_combination = win_combination.to_a
            return win_combination
          end
          if position_1 == "O" && position_2 == "O" && position_3 == "O"
            win_combination = win_combination.to_a
            return win_combination
          end
        end
        return nil
    end

    def draw?
        status = @board.full?
        if status && !won?
          return true
        elsif status == false && won? == false
          return false
        elsif won? == true
          return false
        end
    end

    def over?
        if @board.full? || draw? || won?
          return true
        else
          return false
        end
    end

    def winner
        winCombo = won?
        if winCombo == nil
          return nil
        end
        
        index1 = winCombo[0]
        index2 = winCombo[1]
        index3 = winCombo[2]
        if @board.cells[index1] == "X" && @board.cells[index2] == "X" && @board.cells[index3]  == "X"
            return "X"
          end
        if @board.cells[index1]  == "O" && @board.cells[index2]  == "O" && @board.cells[index3]  == "O"
            return "O"
        end
    end

    def turn
        player = current_player #sets player to current player object
        move = player.move(@board)
        if @board.valid_move?(move)
            puts "Turn: #{@board.turn_count+1}\n"
            @board.update(move, player)
            @board.display
        else
            turn
        end
    end

    def play
        until over? == true
          turn
        end
        if winner == "X"
          puts "Congratulations X!"
        elsif winner == "O"
          puts "Congratulations O!"
        elsif winner == nil
          puts "Cat's Game!"
        end
      end


end