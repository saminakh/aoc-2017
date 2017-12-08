defmodule Aoc.Day1 do
  def solve_p1(input) do
    input
    |> read_input
    |> calc_sum
  end

  def read_input(input) do
    File.read!(input)
    |> String.trim
    |> String.codepoints
    |> Enum.map(& String.to_integer(&1))
  end

  def check_next_pair([] = input, sum), do: sum
  def check_next_pair([_a] = _input, sum), do: sum
  def check_next_pair(input, sum) do
    num = Enum.at(input, 0)
    if num  == Enum.at(input, 1) do
      input
      |> Enum.slice(1, Enum.count(input) - 1)
      |> check_next_pair(sum + num)
    else
      input
      |> Enum.slice(1, Enum.count(input) - 1)
      |> check_next_pair(sum)
    end
  end

  def calc_sum([_a] = _input), do: 0
  def calc_sum(input) do
    if Enum.at(input, 0) == Enum.at(input, Enum.count(input) - 1) do
      check_next_pair(input, Enum.at(input, 0))
    else
      check_next_pair(input, 0)
    end
  end

  def solve_p2(input) do
    input
    |> read_input
    |> format_p2_input
    |> calc_sum_circ(0, 0)
  end

  def format_p2_input(input), do: Enum.concat(input, input)

  def calc_sum_circ(input, index, sum) do
    num = Enum.at(input, index)
    if num == Enum.at(input, next_index(input, index)) do
      if index < div(Enum.count(input), 2) do
        calc_sum_circ(input, index + 1, sum + num)
      else
        sum + num
      end
    else
      if index < div(Enum.count(input), 2) do
        calc_sum_circ(input, index + 1, sum)
      else
        sum
      end
    end
  end

  def next_index(input, index), do: div(Enum.count(input), 4) + index
end
