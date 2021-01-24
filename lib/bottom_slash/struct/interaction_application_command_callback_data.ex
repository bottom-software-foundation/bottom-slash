defmodule BottomSlash.Struct.InteractionApplicationCommandCallbackData do
  use TypedStruct

  typedstruct do
    field :tts, boolean
    field :content, String.t(), enforce: true
    field :embeds, list(map)
    field :allowed_mentions, map
  end
end
