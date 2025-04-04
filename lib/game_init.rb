# Put the one-time game setup code that comes before `loop do` here.

depth = gets.to_i
debug depth

start = []
3.times do
  inputs = gets
  debug inputs
  start << inputs.split
end
puts Solver.new(depth, start.flatten).call
