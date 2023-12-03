defmodule KusuriMiruMobileWeb.DrugLiveTest do
  use KusuriMiruMobileWeb.ConnCase

  import Phoenix.LiveViewTest
  import KusuriMiruMobile.DrugsFixtures

  @create_attrs %{comments: "some comments"}
  @update_attrs %{comments: "some updated comments"}
  @invalid_attrs %{comments: nil}

  defp create_drug(_) do
    drug = drug_fixture()
    %{drug: drug}
  end

  describe "Index" do
    setup [:create_drug]

    test "lists all drugs", %{conn: conn, drug: drug} do
      {:ok, _index_live, html} = live(conn, ~p"/drugs")

      assert html =~ "Listing Drugs"
      assert html =~ drug.comments
    end

    test "saves new drug", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/drugs")

      assert index_live |> element("a", "New Drug") |> render_click() =~
               "New Drug"

      assert_patch(index_live, ~p"/drugs/new")

      assert index_live
             |> form("#drug-form", drug: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#drug-form", drug: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/drugs")

      html = render(index_live)
      assert html =~ "Drug created successfully"
      assert html =~ "some comments"
    end

    test "updates drug in listing", %{conn: conn, drug: drug} do
      {:ok, index_live, _html} = live(conn, ~p"/drugs")

      assert index_live |> element("#drugs-#{drug.id} a", "Edit") |> render_click() =~
               "Edit Drug"

      assert_patch(index_live, ~p"/drugs/#{drug}/edit")

      assert index_live
             |> form("#drug-form", drug: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#drug-form", drug: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/drugs")

      html = render(index_live)
      assert html =~ "Drug updated successfully"
      assert html =~ "some updated comments"
    end

    test "deletes drug in listing", %{conn: conn, drug: drug} do
      {:ok, index_live, _html} = live(conn, ~p"/drugs")

      assert index_live |> element("#drugs-#{drug.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#drugs-#{drug.id}")
    end
  end

  describe "Show" do
    setup [:create_drug]

    test "displays drug", %{conn: conn, drug: drug} do
      {:ok, _show_live, html} = live(conn, ~p"/drugs/#{drug}")

      assert html =~ "Show Drug"
      assert html =~ drug.comments
    end

    test "updates drug within modal", %{conn: conn, drug: drug} do
      {:ok, show_live, _html} = live(conn, ~p"/drugs/#{drug}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Drug"

      assert_patch(show_live, ~p"/drugs/#{drug}/show/edit")

      assert show_live
             |> form("#drug-form", drug: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#drug-form", drug: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/drugs/#{drug}")

      html = render(show_live)
      assert html =~ "Drug updated successfully"
      assert html =~ "some updated comments"
    end
  end
end
