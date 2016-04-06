# ConcurrentElixirExamples

This spawns 1.000.000 elixir processes sends and receives data back with very little computation. It takes about 14 secs on my computer.

``` elixir --erl "+P 1000000" -r lib/chain.ex -e "Chain.run(1_000_000)" ```

Agents - recursive function caching example on fibonacci function:

``` elixir lib/spawn/fib_agent.exs ```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add concurrent_elixir_examples to your list of dependencies in `mix.exs`:

        def deps do
          [{:concurrent_elixir_examples, "~> 0.0.1"}]
        end

  2. Ensure concurrent_elixir_examples is started before your application:

        def application do
          [applications: [:concurrent_elixir_examples]]
        end
