defmodule Demo do
  require Integer
  def run do
    [1,2] ++ [3,4]

    [1,2] |> Enum.concat([3,4])
    [1,2,3,4] |> Enum.join(",")

    (1..10) |> Enum.at(5, :unknown)

    Enum.each([1,2,3], fn(x) ->
      x |> IO.inspect()
    end)

    Enum.all?([1,2,3,4,1,3,-1], &(&1 > 0))
  end

  def run_lazy do
    (1..1_000_000)
    |> Stream.map(&(&1 + 1))
    |> Stream.filter(&(rem(&1,2) == 0))
    |> Stream.with_index()
    |> Enum.take(10)
  end

  def run_file do
    File.stream!("alice.txt")
    |> Enum.with_index(1)
    |> Enum.filter(fn {str, _n} ->
      String.contains?(str, "Queen")
    end)
    |> Enum.take(3)
  end

  def run_repeatedly do
    Stream.repeatedly(fn -> :rand.uniform * 100 end)
    |> Stream.filter(&(&1 < 50 && &1 > 20))
    |> Enum.take(5)

    Stream.unfold(10, fn(x) ->
      case rem(x,2) == 0 do
        true -> {x, x + 1}
        false -> {x, x + 2}
      end
    end)
    |> Enum.take(10)
  end

  def run_list(list1, list2) do
    for el when el > 10 <- list1, Integer.is_even(el), do: el * 2

    for a when a > 10 <- list1, b <- list2, Integer.is_even(b),
    into: %{},
    do: {a, b}

  end

  def iterate_string(str) do
    for << char <- str >>, do: char - 1

  end
end

defmodule Salary do
  @tax 0.1

  def format_salary(employees) do
    for {name, salary} <- employees, into: %{},
    do: {format_name(name), salary - salary * @tax}
  end

  def format_name(name) do
    name
    |> to_string()
    |> String.downcase()
    |> String.to_atom()
  end

end

# Demo.run_lazy() |> IO.inspect()
Salary.format_salary(%{Bob: 30, Mary: 20, Alih: 10}) |> IO.inspect()
