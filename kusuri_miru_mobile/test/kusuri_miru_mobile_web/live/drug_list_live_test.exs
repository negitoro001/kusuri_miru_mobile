defmodule KusuriMiruMobileWeb.DrugListLiveTest do
  use KusuriMiruMobileWeb.ConnCase

  import Phoenix.LiveViewTest
  import KusuriMiruMobile.DrugListsFixtures

  @create_attrs %{name: "some name", reviews: ["option1", "option2"]}
  @update_attrs %{name: "some updated name", reviews: ["option1"]}
  @invalid_attrs %{name: nil, reviews: []}

  defp create_drug_list(_) do
    drug_list = drug_list_fixture()
    %{drug_list: drug_list}
  end

  describe "Index" do
    setup [:create_drug_list]

    test "lists all druglists", %{conn: conn, drug_list: drug_list} do
      {:ok, _index_live, html} = live(conn, ~p"/druglists")

      assert html =~ "Listing Druglists"
      assert html =~ drug_list.name
    end

    test "saves new drug_list", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/druglists")

      assert index_live |> element("a", "New Drug list") |> render_click() =~
               "New Drug list"

      assert_patch(index_live, ~p"/druglists/new")

      assert index_live
             |> form("#drug_list-form", drug_list: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#drug_list-form", drug_list: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/druglists")

      html = render(index_live)
      assert html =~ "Drug list created successfully"
      assert html =~ "some name"
    end

    test "updates drug_list in listing", %{conn: conn, drug_list: drug_list} do
      {:ok, index_live, _html} = live(conn, ~p"/druglists")

      assert index_live |> element("#druglists-#{drug_list.id} a", "Edit") |> render_click() =~
               "Edit Drug list"

      assert_patch(index_live, ~p"/druglists/#{drug_list}/edit")

      assert index_live
             |> form("#drug_list-form", drug_list: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#drug_list-form", drug_list: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/druglists")

      html = render(index_live)
      assert html =~ "Drug list updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes drug_list in listing", %{conn: conn, drug_list: drug_list} do
      {:ok, index_live, _html} = live(conn, ~p"/druglists")

      assert index_live |> element("#druglists-#{drug_list.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#druglists-#{drug_list.id}")
    end
  end

  describe "Show" do
    setup [:create_drug_list]

    test "displays drug_list", %{conn: conn, drug_list: drug_list} do
      {:ok, _show_live, html} = live(conn, ~p"/druglists/#{drug_list}")

      assert html =~ "Show Drug list"
      assert html =~ drug_list.name
    end

    test "updates drug_list within modal", %{conn: conn, drug_list: drug_list} do
      {:ok, show_live, _html} = live(conn, ~p"/druglists/#{drug_list}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Drug list"

      assert_patch(show_live, ~p"/druglists/#{drug_list}/show/edit")

      assert show_live
             |> form("#drug_list-form", drug_list: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#drug_list-form", drug_list: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/druglists/#{drug_list}")

      html = render(show_live)
      assert html =~ "Drug list updated successfully"
      assert html =~ "some updated name"
    end
  end
end
