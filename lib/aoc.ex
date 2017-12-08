defmodule Aoc do
  @moduledoc """
  Documentation for Aoc.
  """

  def day1 do
    Aoc.Day1.solve_p1("priv/day1_input.txt")
    |> IO.inspect

    Aoc.Day1.solve_p2("priv/day1_input.txt")
    |> IO.inspect
  end
end
