defmodule Demo do
  def pmap(n) do
    (1..n) |> Enum.map(&Demo.do_spawn/1) |> Enum.map(&Demo.do_receive/1)
  end

  def do_spawn(elem) do
    f = &(&1 * &1)
    spawn_link(Demo, :calc, [self(), f, elem])
  end
  def calc(parent_process, func, elem) do
    send(parent_process, { self(), func.(elem) })
  end
  def do_receive(pid) do
    receive do
      { ^pid, value} -> value
        # code
    end

  end

  def run(n) do
    {ms, res} = :timer.tc(Demo, :pmap, [n])
    IO.puts("TIME: #{ms/1000}")
    IO.puts("RES: #{inspect(res)}")
    # { ms / 1000, res }

  end

end
