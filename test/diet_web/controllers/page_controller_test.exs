defmodule DietWeb.PageControllerTest do
  use DietWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn
    |> visit(~p"/")
    |> assert_has(test_id("header"))
  end
end
