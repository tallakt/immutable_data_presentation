
defmodule Test do
  def prosess_1(data) do
    IO.puts "tråd #1: #{Enum.join data, ", "}"
    :timer.sleep(1000)
    prosess_1(data)
  end

  def prosess_2(data) do
    data =
      data
      |> Enum.drop(1)
      |> Enum.concat(["?"])

    IO.puts "tråd #2: #{Enum.join data, ", "}"
    :timer.sleep(1000)
    prosess_2(data)
  end
end

data = ~w(Tallak er kul)
spawn(fn -> Test.prosess_1(data) end)
spawn(fn -> Test.prosess_2(data) end)

receive do # blocks forever
  _ -> true
end
