defmodule Day1Star1 do
  def find_elf_with_most_calories(filepath) do 
    case File.read(filepath) do
      {:error, :enoent} -> "File does not exist"
      {:ok, body} -> 
        String.split(body, "\n")
        |> to_elf_groups()
        |> to_total_calories_per_elf()
        |> Enum.max()
    end
  end

  defp to_elf_groups(calories_list, current_elf_group \\ [], elf_groups \\ [])

  defp to_elf_groups([], _current_elf_group, elf_groups) do
    elf_groups
  end

  defp to_elf_groups(["" | calories_list], current_elf_group, elf_groups) do
    elf_groups = [current_elf_group | elf_groups]
    current_elf_group = []

    to_elf_groups(calories_list, current_elf_group, elf_groups)
  end
  
  defp to_elf_groups([current_entry | calories_list], current_elf_group, elf_groups) do
    current_elf_group = [current_entry | current_elf_group]

    to_elf_groups(calories_list, current_elf_group, elf_groups)
  end

  defp to_total_calories_per_elf(elf_group_calories_list) do
    elf_group_calories_list
    |> Enum.map(
      fn elf_group ->
        Enum.map(elf_group, &(String.to_integer(&1)))
        |> Enum.sum()
      end
    )
  end
end
