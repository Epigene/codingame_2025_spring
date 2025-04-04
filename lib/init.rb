require "set"
require "benchmark"

STDOUT.sync = true # DO NOT REMOVE

# @param relevance [Integer] the lower, the more priority. [0=off, 1=everything, 2=core, 3=timing]
def debug(message)
  STDERR.puts(message)
end

# @param time [Float] seconds strsight from Benchmark.relatime
def report_time(time, message)
  return if time < 0.01 # as in 10ms

  debug("Took #{(time * 1000).round}ms to #{message}", 3)
end

class Integer
  def split
    digits = []
    n = self
    9.times do
      digits.unshift(n % 10)
      n /= 10
    end
    digits
  end

  def set_digit(index, new_digit)
    digits = self.split
    digits[index] = new_digit
    digits.inject(0) { |sum, d| sum * 10 + d }
  end
end
