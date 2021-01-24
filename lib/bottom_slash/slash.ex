defmodule BottomSlash.Slash do
  use BottomSlash.CommandHandler
  alias BottomSlash.Struct.InteractionResponse
  alias BottomSlash.Struct.InteractionApplicationCommandCallbackData, as: ResponseData

  command "ping" do
    %InteractionResponse{
      type: 4,
      data: %ResponseData{
        content: "Pong!"
      }
    }
  end
end
