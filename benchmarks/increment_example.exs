list = Enum.to_list(1..100_000)

Benchee.run(%{
  "tail_call_opt" => fn -> Teacher.incrementer(list) end,
  "Enum.map" => fn -> Enum.map(list, &(&1 + 1)) end
},
  formatters: [
    &Benchee.Formatters.HTML.output/1,
    &Benchee.Formatters.Console.output/1
  ],
  formatter_options: [html: [file: "benchmarks/results.html"]]
)
