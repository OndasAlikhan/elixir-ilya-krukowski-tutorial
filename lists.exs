defmodule Lists do
  def len(_, acc \\ 0)
  def len([], acc), do: acc
  def len([h | tail], acc), do: len(tail, acc + h)

  def max(list), do: do_max(list, 0)
  def do_max([], acc), do: acc
  def do_max([h | l], acc) when h > acc, do: do_max(l, h)
  def do_max([h | l], acc) when h <= acc, do: do_max(l, acc)
end

# Lists.len([1,2,3,4,4,4]) |> IO.puts()
[4,67,23,56,7,3] |> Lists.max() |> IO.puts()
