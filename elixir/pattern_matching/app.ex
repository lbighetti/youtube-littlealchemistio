defmodule App do

    def foo("boom") do

    end

    def foo(["foo", "bar"]) do

    end

    def foo(%{hello: "world"}) do

    end
    
    def foo(42) do
        
    end

    def foo(arg) do
        #arity 1, head 2
    end


    def foo(first, second) do
        #arity 2
    end
end