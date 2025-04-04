class Solver
  attr_reader :depth, :start

  NEIGHBOR_MAP = {
    0 => [1, 3],
    1 => [0, 2, 4],
    2 => [1, 5],
    3 => [0, 4, 6],
    4 => [1, 3, 5, 7],
    5 => [2, 4, 8],
    6 => [3, 7],
    7 => [4, 6, 8],
    8 => [5, 7]
  }

  MAX_CAPTURE_SUM = 6

  # Returns all possible legal resulting boards for a given board
  # @return Array<Integer>
  def self.next_states_for(board)
    digits = board.split

    states = []
    digits.each.with_index do |d, i|
      next unless d.zero?

      neighbors = NEIGHBOR_MAP[i].map { [_1, digits[_1]] }.sort_by { |ci, v| v }

      if neighbors.first[1] > 3 || neighbors.last[1].zero? # no captures possible
        states << board.set_digit(i, 1)
      else # possible captures
        (2..4).each do |r|
          combs = neighbors.combination(r) do |combo|
            sum = 0
            combo.each do |_ci, val|
              sum += val
              break if sum > MAX_CAPTURE_SUM
            end

            resulting_state = board.set_digit(i, sum)
            combo.each do |ci, val|
              resulting_state = resulting_state.set_digit(ci, 0)
            end

            states << resulting_state
          end

          break if combs.none?
        end
      end
    end
    states
  end

  def initialize(depth, start)
    @depth = depth
    @start = start
  end

  # @return Integer # sum of board hashes
  def call
    1
  end
end
