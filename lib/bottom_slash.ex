defmodule BottomSlash do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: BottomSlash.Endpoint, options: [port: 4000]}
    ]

    opts = [strategy: :one_for_one, name: BottomSlash.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
