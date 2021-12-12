defmodule WsClient.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, args) do
    children = [
      # Starts a worker by calling: WsClient.Worker.start_link(arg)
      {WsClient.Worker, "ws://localhost:4001/ws"}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: WsClient.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
