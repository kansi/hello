defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  def index(conn, _params) do
    {:ok, vsn} = :application.get_key(:hello, :vsn)
    render(conn, "index.html", %{pid: :os.getpid(), vsn: vsn})
  end
end
