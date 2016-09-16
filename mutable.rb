data = %w(Tallak Tveide er kul)

Thread.new do
  loop do
    puts "tråd #1: #{data.join(", ")}"
    sleep 1.0
  end
end

Thread.new do
  loop do
    data = data[1..-1] + ["?"]
    puts "tråd #2: #{data.join(", ")}"
    sleep 1.0
  end
end

sleep
