defmodule DietWeb.PageControllerTest do
  use DietWeb.ConnCase, async: true

  test "GET /", %{conn: conn} do
    conn
    |> visit(~p"/")
    |> assert_has(test_id("header"))
  end
end
