defmodule KusuriMiruMobileWeb.CategoryLiveTest do
  use KusuriMiruMobileWeb.ConnCase

  import Phoenix.LiveViewTest
  import KusuriMiruMobile.CategoriesFixtures

  defp create_category(_) do
    category = category_fixture("fedb0")
    %{category: category}
  end


  describe "Show" do
    setup [:create_category]

    test "displays category", %{conn: conn, category: category} do
      {:ok, _show_live, html} = live(conn, ~p"/categories/fedb0")

      assert html =~ "Show Category"
      category
      |> Enum.map(fn category ->
        assert html =~ category.id
        assert html =~ category.name
      end)
    end
  end
end
