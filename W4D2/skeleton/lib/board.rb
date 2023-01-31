class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    self.cups = Array.new(14) {[]}
    self.place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    4.times do 
      self.cups.each_with_index { |cup, i| cup << :stone unless i == 6 || i == 13}
    end
  end

  def valid_move?(start_pos)
    if start_pos == 6
      raise 'Starting cup is empty'
    elsif start_pos == 13
      raise 'Starting cup is empty'
    elsif start_pos < 0 || start_pos > 14
      raise 'Invalid starting cup'
    elsif cups[start_pos] == []
      raise 'Starting cup is empty'
    end
    # raise 'Starting cup is empty' if self.cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    i = 0
    cups[start_pos].length.times do
      i += 1

      if (start_pos.between?(1,6) && @side != 1 ||
        start_pos.between?(7,12) && @side != 2)
        i += 1
      end

      cups[(start_pos + i) % 13] << :stone
    end

    cups[start_pos] = []
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if current_player = @player1 && ending_cup_idx.between?(1,6)
      return 'no'


    end
    render
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
