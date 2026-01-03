defmodule DietWeb.PageControllerTest do
  use DietWeb.ConnCase, async: true

  test "GET /", %{conn: conn} do
    conn
    |> visit(~p"/")
    |> open_browser()
    |> assert_has("h1", text: "Welcome to Diet")
  end
end
