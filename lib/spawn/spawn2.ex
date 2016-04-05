defmodule Spawn2 do
    def greet do
        receive do
            {sender, msg} ->
                send sender, { :ok, "Hello, #{msg}" }
        end
    end
end

# here's a client
pid = spawn(Spawn2, :greet, [])

send pid, {self, "World!"}

receive do
    {:ok, message} ->
        IO.puts message
end

send pid, {self, "kermit!"}
receive do
    {:ok, message} ->
        IO.puts message # This will never execute
    after 500 ->
        IO.puts "The greeter has gone away"
end
