defmodule PwFinder do
  def run(low, high) do
    for n <- low..high do
      pw_parser(n)
    end
    |> Enum.count(fn x -> x end)
  end

  def run2(low, high) do
    for n <- low..high do
      pw_parser2(n)
    end
    |> Enum.count(fn x -> x end)
  end

  def pw_parser(input) do
    Integer.digits(input)
    |> pair_finder()
    |> ascender()
  end

  def pw_parser2(input) do
    Integer.digits(input)
    |> pair_finder()
    |> ascender()
    |> group_finder()
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
    counts =
      input
      |> Enum.chunk_by(& &1)
      |> Enum.map(&length/1)

    if 2 in counts do
      input
    else

    end

  end

  def ascender(nil) do

  end

  def ascender(input) do
    if input === Enum.sort(input) do
      input
    else

    end
  end

  # def counter(input) do
  #   for x <- input do
  #     Enum.count(input, )
  #   end
  # end

end



