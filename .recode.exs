[
  version: "0.7.3",
  # Can also be set/reset with `--autocorrect`/`--no-autocorrect`.
  autocorrect: true,
  # With "--dry" no changes will be written to the files.
  # Can also be set/reset with `--dry`/`--no-dry`.
  # If dry is true then verbose is also active.
  dry: false,
  # Enables or disables color in the output.
  color: true,
  # Can also be set/reset with `--verbose`/`--no-verbose`.
  verbose: false,
  # Can be overwritten by calling `mix recode "lib/**/*.ex"`.
  inputs: [
    "{mix,.formatter}.exs",
    "{apps,config,test}/**/*.{ex,exs}",
    "lib/nebot/**/*.ex",
    "lib/nebot_web/**/*.ex"
  ],
  formatters: [Recode.CLIFormatter],
  tasks: [
    # Tasks could be added by a tuple of the tasks module name and an options
    # keyword list. A task can be deactivated by `active: false`. The execution of
    # a deactivated task can be forced by calling `mix recode --task ModuleName`.
    {Recode.Task.AliasExpansion, []},
    {Recode.Task.AliasOrder, []},
    {Recode.Task.Dbg, [autocorrect: false]},
    {Recode.Task.EnforceLineLength, [active: false]},
    {Recode.Task.FilterCount, [active: false]},
    {Recode.Task.IOInspect, [autocorrect: false]},
    {Recode.Task.LocalsWithoutParens, [active: false]},
    {Recode.Task.Moduledoc, [active: false]},
    {Recode.Task.Nesting, [active: false]},
    {Recode.Task.PipeFunOne, [active: false]},
    {Recode.Task.SinglePipe, []},
    {Recode.Task.Specs, [active: false]},
    {Recode.Task.TagFIXME, [active: false]},
    {Recode.Task.TagTODO, [active: false]},
    {Recode.Task.TestFileExt, [active: false]},
    {Recode.Task.UnnecessaryIfUnless, [active: false]},
    {Recode.Task.UnusedVariable, [active: false]}
  ]
]
