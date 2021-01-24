defmodule BottomSlash.Auth do
  import Plug.Conn

  def init(opts) do
    opts
  end

  def call(conn, _opts) do
    {:ok, body, conn} = read_body(conn)
    conn = put_in(conn.assigns[:raw_body], body)

    public_key =
      Application.fetch_env!(:bottom_slash, :public_key) |> Base.decode16!(case: :lower)

    signature = get_header(conn, "x-signature-ed25519") |> Base.decode16!(case: :lower)
    timestamp = get_header(conn, "x-signature-timestamp")
    msg = timestamp <> body

    if :crypto.verify(:eddsa, :none, msg, signature, [public_key, :ed25519]) do
      conn
    else
      send_401(conn)
    end
  end

  defp send_401(conn) do
    conn
    |> send_resp(401, "Not Authorized")
    |> halt()
  end

  defp get_header(conn, header) do
    case List.keyfind(conn.req_headers, header, 0) do
      {^header, val} -> val
      _ -> nil
    end
  end
end
