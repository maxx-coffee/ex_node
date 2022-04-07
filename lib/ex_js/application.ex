defmodule ExJs.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      %{
        id: NodeJS,
        start: {NodeJS, :start_link, [[path: "./node_scripts", pool_size: 4]]}
      }
      # Starts a worker by calling: ExJs.Worker.start_link(arg)
      # {ExJs.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ExJs.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
