defmodule KusuriMiruMobileWeb.TopLiveTest do
  use KusuriMiruMobileWeb.ConnCase

  import Phoenix.LiveViewTest
  import KusuriMiruMobile.TopsFixtures

  @create_attrs %{icon: "some icon", id: "some id", name: "some name", tags: ["option1", "option2"]}
  @update_attrs %{icon: "some updated icon", id: "some updated id", name: "some updated name", tags: ["option1"]}
  @invalid_attrs %{icon: nil, id: nil, name: nil, tags: []}

  defp create_top(_) do
    top = top_fixture()
    %{top: top}
  end

  describe "Index" do
    setup [:create_top]

    test "lists all tops", %{conn: conn, top: top} do
      {:ok, _index_live, html} = live(conn, ~p"/tops")

      assert html =~ "Listing Tops"
      assert html =~ top.icon
    end

    test "saves new top", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/tops")

      assert index_live |> element("a", "New Top") |> render_click() =~
               "New Top"

      assert_patch(index_live, ~p"/tops/new")

      assert index_live
             |> form("#top-form", top: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#top-form", top: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/tops")

      html = render(index_live)
      assert html =~ "Top created successfully"
      assert html =~ "some icon"
    end

    test "updates top in listing", %{conn: conn, top: top} do
      {:ok, index_live, _html} = live(conn, ~p"/tops")

      assert index_live |> element("#tops-#{top.id} a", "Edit") |> render_click() =~
               "Edit Top"

      assert_patch(index_live, ~p"/tops/#{top}/edit")

      assert index_live
             |> form("#top-form", top: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#top-form", top: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/tops")

      html = render(index_live)
      assert html =~ "Top updated successfully"
      assert html =~ "some updated icon"
    end

    test "deletes top in listing", %{conn: conn, top: top} do
      {:ok, index_live, _html} = live(conn, ~p"/tops")

      assert index_live |> element("#tops-#{top.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#tops-#{top.id}")
    end
  end

  describe "Show" do
    setup [:create_top]

    test "displays top", %{conn: conn, top: top} do
      {:ok, _show_live, html} = live(conn, ~p"/tops/#{top}")

      assert html =~ "Show Top"
      assert html =~ top.icon
    end

    test "updates top within modal", %{conn: conn, top: top} do
      {:ok, show_live, _html} = live(conn, ~p"/tops/#{top}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Top"

      assert_patch(show_live, ~p"/tops/#{top}/show/edit")

      assert show_live
             |> form("#top-form", top: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#top-form", top: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/tops/#{top}")

      html = render(show_live)
      assert html =~ "Top updated successfully"
      assert html =~ "some updated icon"
    end
  end
end
