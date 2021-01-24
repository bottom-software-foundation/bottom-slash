defmodule BottomSlash.Endpoint do
  use Plug.Router

  plug Plug.Logger
  plug :match
  plug :dispatch

  post "/", to: BottomSlash.Slash

  get "/ping", do: conn |> send_resp(200, "Pong!")

  match _ do
    conn
    |> send_resp(404, "Page Not Found")
    |> halt()
  end
end
