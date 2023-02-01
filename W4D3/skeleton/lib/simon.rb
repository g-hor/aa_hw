class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end

  def play
    until self.game_over
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    round_success_message unless game_over
    self.sequence_length += 1
  end

  def show_sequence
    add_random_color
    puts "#{self.seq}"
    sleep(1)
    system("clear")
  end

  def require_sequence
    p 'Please enter the colors'
    input = gets.chomp.split(" ")

    self.game_over = true if input != self.seq
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    p 'Good job!'
  end

  def game_over_message
    p 'You lost, womp womp'
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end
