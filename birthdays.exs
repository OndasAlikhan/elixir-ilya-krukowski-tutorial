defmodule Birthdays.Server do
  def run do
    spawn fn -> loop() end
  end

  defp loop do
    receive do

    end

    loop()
  end

end
