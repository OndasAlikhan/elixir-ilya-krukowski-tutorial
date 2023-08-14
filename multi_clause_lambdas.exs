creation_date = fn
  "elixir" -> 2011
  "ruby" -> 1995
  "cpp" -> 1985
  lang when is_bitstring(lang) -> "Not sure"
  _ -> nil
end

handler = fn
  x when is_number(x) -> x * 2
  x -> x
end
[1,2,3,"cat","dog"] |> Enum.map(handler) |> IO.inspect()
