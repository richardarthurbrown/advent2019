defmodule PwFinder do
  def run(low, high) do
    for n <- low..high do
      pw_parser(n)
    end
    |> Enum.filter(& &1)
    |> length()
  end

  def run2(low, high) do
    for n <- low..high do
      pw_parser2(n)
    end
    |> Enum.filter(& &1)
    |> length()
  end

  def pw_parser(input) do
    Integer.digits(input)
    |> pair_finder()
    |> ascender()
  end

  def pw_parser2(input) do
    Integer.digits(input)
    |> pair_finder()
    |> group_finder()
    |> ascender()
  end

  def pair_finder(input) do
    if input !== Enum.dedup(input) do
      input
    else
      nil
    end
  end

  def group_finder(nil) do

  end

  def group_finder(input) do
    list = Enum.chunk_every(input, 2, 1, :discard)
    if list !== Enum.dedup(list) do
      input
    else
      nil
    end
  end

  def ascender(nil) do

  end

  def ascender(input) do
    if input === Enum.sort(input) do
      1
    else

    end
  end


end
