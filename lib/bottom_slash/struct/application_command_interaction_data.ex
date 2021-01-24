defmodule BottomSlash.Struct.ApplicationCommandInteractionData do
  use TypedStruct
  alias BottomSlash.Snowflake
  alias BottomSlash.Struct.ApplicationCommandInteractionDataOption

  typedstruct do
    field :id, Snowflake.t()
    field :name, String.t()
    field :options, list(ApplicationCommandInteractionDataOption.t()) | nil
  end
end
