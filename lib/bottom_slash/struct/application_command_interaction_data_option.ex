defmodule BottomSlash.Struct.ApplicationCommandInteractionDataOption do
  use TypedStruct
  alias BottomSlash.Struct.ApplicationCommandInteractionDataOption

  typedstruct do
    field :name, String.t()
    field :value, String.t() | nil
    field :options, list(ApplicationCommandInteractionDataOption.t()) | nil
  end
end
