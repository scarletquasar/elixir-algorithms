defmodule Quicksort do
  def execute(vector, length) do
    cond do
      length < 2 -> vector
      true -> execute(vector)
    end
  end

  def execute(vector) do
    vector_length = length(vector)
    pivot_index = :rand.uniform(vector_length)
    pivot = Enum.at(vector, pivot_index)

    mid_elements = Enum.filter(vector, fn (n) -> n === pivot end)
    before_elements = Enum.filter(vector, fn (n) -> n < pivot end)
    after_elements = Enum.filter(vector, fn (n) -> n > pivot end)

    before_length = length(before_elements)
    after_length = length(after_elements)

    execute(before_elements, before_length) ++ mid_elements  ++ execute(after_elements, after_length);
  end
end

defmodule Program do
  def main() do
    values = IO.gets("Numbers: ")
    numbers = values
    |> String.split
    |> Enum.map(fn (n) -> Float.parse(n) end)
    |> Enum.map(fn (n) -> elem(n, 0) end)

    sorted = Quicksort.execute(numbers, length(numbers))

    string = sorted
    |> Enum.map(fn (x) -> Float.to_string(x) end)
    |> Enum.join(" ")

    IO.puts(string)
  end
end

Program.main()
