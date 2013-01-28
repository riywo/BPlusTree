require 'gruff'
require 'benchmark'
require 'parallel'
require 'b_plus_tree'
MAX  = 100000
STEP = MAX / 5
RANDOM_LIST = (0..MAX).to_a.sample(MAX)

g = Gruff::Line.new

def bench(size)
  benchmarks = []
  0.step(MAX, STEP) do |num|
    tree = BPlusTree::Tree.new(size)
    benchmarks << Benchmark.measure {
      yield(tree, num)
    }
  end
  benchmarks.collect{|b| b.real}
end

g.theme_37signals
tests = []
tests << { :page_size => 10, :type => 'seq_insert' }
tests << { :page_size => 10, :type => 'random_insert' }
tests << { :page_size => 100, :type => 'seq_insert' }
tests << { :page_size => 100, :type => 'random_insert' }
results = Parallel.map(tests, :in_processes => 1) do |conf|
  {
    :conf  => conf,
    :bench => bench(conf[:page_size]) do |tree, num|
      num.times do |i|
        key = conf[:type] == 'random_insert' ? RANDOM_LIST[i] : i
        tree.insert(key, 1)
      end
    end,
  }
end
results.each do |result|
  g.data("#{result[:conf][:type]}(size #{result[:conf][:page_size]})", result[:bench])
end
0.step(MAX, MAX / 4) do |i|
  g.labels.merge!({i/STEP => i.to_s})
end
g.x_axis_label = 'Times'
g.y_axis_label = 'seconds'

file = "/tmp/b_plus_tree_bench.#{Time.now.to_i}.png"
g.write(file)
system("open #{file}")

