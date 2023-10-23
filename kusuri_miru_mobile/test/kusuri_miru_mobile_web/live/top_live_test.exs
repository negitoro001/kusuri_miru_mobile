defmodule KusuriMiruMobileWeb.TopLiveTest do
  use KusuriMiruMobileWeb.ConnCase

  import Phoenix.LiveViewTest
  import KusuriMiruMobile.TopsFixtures

  defp create_top(_) do
    top = top_fixture()
    %{top: top}
  end

  describe "Index" do
    setup [:create_top]

    test "lists all tops", %{conn: conn, top: top} do
      {:ok, _index_live, html} = live(conn, ~p"/tops")

      assert html =~ "Listing Tops"

      top
      |> Enum.map(fn current_top ->
        assert html =~ current_top.name
      end)
    end
  end
end
