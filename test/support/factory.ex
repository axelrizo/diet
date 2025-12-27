defmodule Diet.Factory do
  use ExMachina.Ecto, repo: Diet.Repo

  use Diet.DietsFactory
end
