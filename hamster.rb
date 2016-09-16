require 'benchmark'
require 'hamster'

LIST = (1..100000).to_a
H = Hash[LIST.zip(LIST)]
HAMSTER_H = Hamster::Hash.new(H)


Benchmark.bm do |x|

  x.report do
    sum = 0
    100.times do
      H.keys.each do |k|
        sum += H[k]
      end
    end
  end

  x.report do
    sum = 0
    100.times do
      HAMSTER_H.keys.each do |k|
        sum += HAMSTER_H[k]
      end
    end
  end

  x.report do
    h = {};
    10.times do
      LIST.each do |i|
        h[i] = i;
      end
    end
  end

  x.report do
    h = Hamster::Hash.new
    10.times do
      LIST.each do |i|
        h = h.put(i, i);
      end
    end
  end

end
