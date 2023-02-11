defmodule TodoWeb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    topologies = Application.get_env(:libcluster, :topologies)

    children = [
      {Cluster.Supervisor, [topologies, [name: TodoWeb.ClusterSupervisor]]},
      # Start the Telemetry supervisor
      TodoWeb.Telemetry,
      # Start the Endpoint (http/https)
      {Phoenix.PubSub, name: TodoWeb.PubSub},
      TodoWeb.Endpoint
      # Start a worker by calling: TodoWeb.Worker.start_link(arg)
      # {TodoWeb.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TodoWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TodoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
