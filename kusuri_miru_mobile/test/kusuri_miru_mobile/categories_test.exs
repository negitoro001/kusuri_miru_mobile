defmodule KusuriMiruMobile.CategoriesTest do
  use KusuriMiruMobile.DataCase

  alias KusuriMiruMobile.Categories

  describe "categories" do
    alias KusuriMiruMobile.Categories.Category

    import KusuriMiruMobile.CategoriesFixtures

    @invalid_attrs %{category_name: nil, name: nil}

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Categories.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Categories.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      valid_attrs = %{category_name: "some category_name", name: "some name"}

      assert {:ok, %Category{} = category} = Categories.create_category(valid_attrs)
      assert category.category_name == "some category_name"
      assert category.name == "some name"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Categories.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      update_attrs = %{category_name: "some updated category_name", name: "some updated name"}

      assert {:ok, %Category{} = category} = Categories.update_category(category, update_attrs)
      assert category.category_name == "some updated category_name"
      assert category.name == "some updated name"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Categories.update_category(category, @invalid_attrs)
      assert category == Categories.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Categories.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Categories.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Categories.change_category(category)
    end
  end
end
