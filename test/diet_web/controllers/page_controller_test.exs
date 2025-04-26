defmodule DietWeb.PageControllerTest do
  use DietWeb.ConnCase

  test "GET /", %{conn: conn} do
    visit(conn, ~p"/")
  end
end
