defmodule Diet.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      DietWeb.Telemetry,
      Diet.Repo,
      {DNSCluster, query: Application.get_env(:diet, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Diet.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Diet.Finch},
      # Start a worker by calling: Diet.Worker.start_link(arg)
      # {Diet.Worker, arg},
      # Start to serve requests, typically the last entry
      DietWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Diet.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DietWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
