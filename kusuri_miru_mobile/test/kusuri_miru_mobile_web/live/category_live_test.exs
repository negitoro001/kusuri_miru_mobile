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
      {:ok, _show_live, html} = live(conn, ~p"/categories/#{category.id}")

      assert html =~ "Show Category"
      assert html =~ category.category_name
    end
  end
end
