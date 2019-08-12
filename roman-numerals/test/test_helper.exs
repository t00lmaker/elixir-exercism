ExUnit.configure formatters: [ExUnit.CLIFormatter, ExUnitNotifier]
ExUnit.configure(exclude: :pending, trace: true)
ExUnit.start
