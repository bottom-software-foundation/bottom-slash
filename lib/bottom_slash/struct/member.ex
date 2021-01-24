defmodule BottomSlash.Struct.Member do
  use TypedStruct
  alias BottomSlash.Snowflake
  alias BottomSlash.Struct.User

  typedstruct do
    field :user, User.t()
    field :nick, String.t() | nil
    field :roles, list(Snowflake.t())
    field :joined_at, DateTime.t()
    field :premium_since, DateTime.t()
    field :deaf, boolean
    field :mute, boolean
    field :pending, boolean | nil
  end
end
