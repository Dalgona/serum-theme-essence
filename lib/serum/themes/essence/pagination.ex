defmodule Serum.Themes.Essence.Pagination do
  @moduledoc false

  @spec page_link(binary(), integer()) :: binary()
  def page_link(list_dir, page), do: Path.join(list_dir, "page-#{page}.html")

  @spec get_page_nums(integer(), integer(), pos_integer()) :: {[integer()], [integer()]}
  def get_page_nums(page, max_page, size_factor) do
    list = Enum.to_list(1..max_page)
    {prev, next} = split(list, [], page)
    {prev, prev_rest} = Enum.split(prev, size_factor)
    {next, next_rest} = Enum.split(next, size_factor)
    more_next = size_factor - length(prev)
    more_prev = size_factor - length(next)

    {prev, next} =
      cond do
        more_next > 0 -> {prev, next ++ Enum.take(next_rest, more_next)}
        more_prev > 0 -> {prev ++ Enum.take(prev_rest, more_prev), next}
        true -> {prev, next}
      end

    {Enum.reverse(prev), next}
  end

  @spec split([integer()], [integer()], integer()) :: {[integer()], [integer()]}
  defp split(list, prev, page_num)
  defp split([n | next], prev, n), do: {prev, next}
  defp split([x | next], prev, n), do: split(next, [x | prev], n)
end
