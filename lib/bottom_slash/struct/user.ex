defmodule BottomSlash.Struct.User do
  use TypedStruct
  alias BottomSlash.Snowflake

  typedstruct do
    field :id, Snowflake.t()
    field :username, String.t()
    field :discriminator, String.t()
    field :avatar, String.t() | nil
    field :bot, boolean
    field :system, boolean
    field :mfa_enabled, boolean
    field :locale, String.t()
    field :verified, boolean
    field :email, String.t() | nil
    field :flags, non_neg_integer
    field :premium_type, non_neg_integer
    field :public_flags, non_neg_integer
  end
end
