defmodule Todo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    topologies = Application.get_env(:libcluster, :topologies, [])

    children = [
      {Cluster.Supervisor, [topologies, [name: Todo.ClusterSupervisor]]},
      # Start the Ecto repository
      Todo.Repo
      # Start the PubSub system
      # Start a worker by calling: Todo.Worker.start_link(arg)
      # {Todo.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Todo.Supervisor)
  end
end
