defmodule Recursion do

    def sum([], total) do
        total
    end
    def sum(list, total) do
        [ first_number | remaining_list ] = list
        new_total = total + first_number
        sum(remaining_list, new_total)
    end
end
