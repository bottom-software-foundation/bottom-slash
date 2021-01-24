defmodule BottomSlash.Struct.Interaction do
  use TypedStruct
  alias BottomSlash.Snowflake
  alias BottomSlash.Struct.{ApplicationCommandInteractionData, Member, Snowflake}

  typedstruct do
    field :id, Snowflake.t()
    field :type, pos_integer
    field :data, ApplicationCommandInteractionData.t()
    field :guild_id, Snowflake.t()
    field :channel_id, Snowflake.t()
    field :member, Member.t()
    field :token, String.t()
    field :version, pos_integer
  end
end
