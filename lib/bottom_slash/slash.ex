defmodule BottomSlash.Slash do
  use BottomSlash.CommandHandler
  alias BottomSlash.Struct.InteractionResponse
  alias BottomSlash.Struct.InteractionApplicationCommandCallbackData, as: ResponseData

  command "ping" do
    %InteractionResponse{type: 4, data: %ResponseData{content: "Pong!"}}
  end

  command "bottomify" do
    {:ok, encoded} = Bottom.encode(List.first(interaction.data.options).value)
    name = "#{interaction.member.user.username}#{interaction.member.user.discriminator}"
    %InteractionResponse{type: 3, data: %ResponseData{content: "**#{name}:** #{encoded}"}}
  end

  command "regress" do
    text =
      case Bottom.decode(List.first(interaction.data.options).value) do
        {:ok, decoded} -> decoded
        _ -> "Failed to decode bottom."
      end

    %InteractionResponse{type: 4, data: %ResponseData{content: text}}
  end
end
