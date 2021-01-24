defmodule BottomSlash.CommandHandler do
  alias BottomSlash.Struct.ApplicationCommandInteractionData, as: Data
  alias BottomSlash.Struct.ApplicationCommandInteractionDataOption, as: Option
  alias BottomSlash.Struct.{Interaction, InteractionResponse}

  defmacro __using__(_opts) do
    quote do
      use Plug.Builder
      import BottomSlash.CommandHandler

      plug BottomSlash.Auth
      plug :parse
      plug :dispatch

      def parse(conn, _opts) do
        put_in(
          conn.assigns[:interaction],
          Poison.decode!(conn.assigns[:raw_body],
            as: %Interaction{data: %Data{options: [%Option{}]}}
          )
        )
      end

      def dispatch(conn, _opts) do
        case handle(conn.assigns[:interaction]) do
          %InteractionResponse{} = msg ->
            conn
            |> put_resp_content_type("application/json")
            |> send_resp(200, Poison.encode!(msg))
            |> halt()

          _ ->
            conn
        end
      end

      def handle(%Interaction{type: 1}) do
        %InteractionResponse{type: 1}
      end
    end
  end

  defmacro command(name, do: expression) do
    quote do
      def handle(%Interaction{type: 2, data: %Data{name: unquote(name)}} = var!(interaction)) do
        _ = var!(interaction)
        unquote(expression)
      end
    end
  end
end
