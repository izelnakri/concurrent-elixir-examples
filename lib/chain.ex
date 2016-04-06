defmodule Chain do
    def counter(pid) do
        receive do
            n ->
                IO.puts("n is #{n}")
                send pid, n + 1
        end
    end

    def create_processes(n) do
        last = Enum.reduce 1..n, self,
                fn (_, pid) ->
                    spawn(Chain, :counter, [pid])
                end
        send last, 0

        receive do
            final_answer ->
                "Result is #{inspect(final_answer)}"
        end
    end

    def run(n) do
        IO.puts inspect :timer.tc(Chain, :create_processes, [n])
    end
end
