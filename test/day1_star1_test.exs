defmodule Day1Star1Test do
  use ExUnit.Case
  doctest AdventOfCode2022
  import Day1Star1

  test "return error on empty " do
    assert "File does not exist" == find_elf_with_most_calories("/invalid_file_path")
  end

  test "valid input returns a number" do
    assert is_integer(find_elf_with_most_calories("input/dummy"))
  end

  test "valid input returns the sum of an elf's calories" do
    assert 15 == find_elf_with_most_calories("input/dummy")
  end

  test "valid input returns the max sum of the elves' calories" do
    assert 42 == find_elf_with_most_calories("input/dummy2")
  end
end
