defmodule IntCode do
  def run(codelist, index1 \\ 1, index2 \\ 2, val1 \\ 12, val2 \\ 2, start \\ 0) do
    codelist
    |> List.replace_at(index1, val1)
    |> List.replace_at(index2, val2)
    |> opcode_processor(start)
  end

  def run2(codelist) do
  noun = 1..99
  verb = 1..99

    for x <- noun, y <- verb do
      run(codelist, 1, 2, x, y, 0)
    end
  end


  def opcode_processor(codelist, index \\ 0) do
    opcode = Enum.fetch!(codelist, index)

    first = Enum.fetch!(codelist, 0)
    case opcode do
      99 ->
        if first === 19690720 do
          100 * Enum.fetch!(codelist, 1) + Enum.fetch!(codelist, 2)
        else
          :ok
        end

      opcode ->
        argument_processor(codelist, index, opcode)
    end
  end

  def argument_processor(codelist, index, 1) do
    input_addr1 = Enum.fetch!(codelist, index + 1)
    input_addr2 = Enum.fetch!(codelist, index + 2)
    output_addr = Enum.fetch!(codelist, index + 3)

    value = Enum.fetch!(codelist, input_addr1) + Enum.fetch!(codelist, input_addr2)

    List.replace_at(codelist, output_addr, value)
    |> opcode_processor(index + 4)
  end

  def argument_processor(codelist, index, 2) do
    input_addr1 = Enum.fetch!(codelist, index + 1)
    input_addr2 = Enum.fetch!(codelist, index + 2)
    output_addr = Enum.fetch!(codelist, index + 3)

    value = Enum.fetch!(codelist, input_addr1) * Enum.fetch!(codelist, input_addr2)

    List.replace_at(codelist, output_addr, value)
    |> opcode_processor(index + 4)
  end
end
