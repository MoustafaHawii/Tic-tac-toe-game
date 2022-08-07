
    PLAYER_ONE = 'X'
    PLAYER_TWO = 'O'

    def initialize_board
      @count = 9
      @player = PLAYER_ONE
      @board = Array.new(3){ Array.new(3, " ") }
    end

    def print_board
      puts "---------"
      @board.each do |row|
        puts row.join(" | ")
        puts "---------"
      end
    end

    def get_inputs
      begin
        print "#{@player}, please enter the row: "
        input_row = gets
        return false if(input_row.to_i == 999)

        print "#{@player}, please enter the column: "
        input_column = gets
        return false if(input_column.to_i == 999)

        if(!valid = valid_move?(input_row.to_i, input_column.to_i))
          puts "That one is taken \"#{@player}\", try again: "
        end
      end while(!valid)

      [input_row.to_i, input_column.to_i]
    end

    def valid_move?(input_row, input_column)
      @board[input_row.-1][input_column.-1].strip.empty?
    end

    def update_board(inputs)
      @board[inputs[0]-1][inputs[1].-1] = @player
    end

    def play
      inputs = get_inputs
      return false if !inputs
      update_board(inputs)
      print_board
    end

    def switch_player
      if(@player == PLAYER_ONE)
        @player = PLAYER_TWO
      else
        @player = PLAYER_ONE
      end
    end

    def game_over?
      @count = @count - 1
      @count <= 0
    end

    initialize_board
    print_board
    begin
      break if !play
      switch_player
    end while !game_over?
    puts "GAME OVER"