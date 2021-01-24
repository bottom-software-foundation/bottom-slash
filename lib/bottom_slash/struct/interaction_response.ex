defmodule BottomSlash.Struct.InteractionResponse do
  use TypedStruct
  alias BottomSlash.Struct.InteractionApplicationCommandCallbackData

  typedstruct do
    field :type, pos_integer
    field :data, InteractionApplicationCommandCallbackData.t()
  end
end
