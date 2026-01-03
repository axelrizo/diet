defmodule Diet.Factory do
  @moduledoc false

  use ExMachina.Ecto, repo: Diet.Repo

  use Diet.DietsFactory
end
