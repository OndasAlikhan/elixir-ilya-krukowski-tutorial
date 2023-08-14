defmodule Clauses do
  # def divide(a, 0), do: 0
  # def divide(a, b) when is_number(b) and is_number(a), do: a / b
  # def divide(_, _), do: nil

  def factorial(num) when is_integer(num), do: factorial_tail(num)

  def factorial_tail(num, acc \\ 1)
  def factorial_tail(0, acc), do: acc
  def factorial_tail(num, acc), do: factorial_tail(num - 1, acc * num)
end

Clauses.factorial(5) |> IO.inspect()
