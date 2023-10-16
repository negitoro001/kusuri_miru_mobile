defmodule KusuriMiruMobile.TopsTest do
  use KusuriMiruMobile.DataCase

  alias KusuriMiruMobile.Tops

  describe "tops" do
    alias KusuriMiruMobile.Tops.Top

    import KusuriMiruMobile.TopsFixtures

    @invalid_attrs %{icon: nil, id: nil, name: nil, tags: nil}

    test "list_tops/0 returns all tops" do
      top = top_fixture()
      assert Tops.list_tops() == [top]
    end

    test "get_top!/1 returns the top with given id" do
      top = top_fixture()
      assert Tops.get_top!(top.id) == top
    end

    test "create_top/1 with valid data creates a top" do
      valid_attrs = %{icon: "some icon", id: "some id", name: "some name", tags: ["option1", "option2"]}

      assert {:ok, %Top{} = top} = Tops.create_top(valid_attrs)
      assert top.icon == "some icon"
      assert top.id == "some id"
      assert top.name == "some name"
      assert top.tags == ["option1", "option2"]
    end

    test "create_top/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tops.create_top(@invalid_attrs)
    end

    test "update_top/2 with valid data updates the top" do
      top = top_fixture()
      update_attrs = %{icon: "some updated icon", id: "some updated id", name: "some updated name", tags: ["option1"]}

      assert {:ok, %Top{} = top} = Tops.update_top(top, update_attrs)
      assert top.icon == "some updated icon"
      assert top.id == "some updated id"
      assert top.name == "some updated name"
      assert top.tags == ["option1"]
    end

    test "update_top/2 with invalid data returns error changeset" do
      top = top_fixture()
      assert {:error, %Ecto.Changeset{}} = Tops.update_top(top, @invalid_attrs)
      assert top == Tops.get_top!(top.id)
    end

    test "delete_top/1 deletes the top" do
      top = top_fixture()
      assert {:ok, %Top{}} = Tops.delete_top(top)
      assert_raise Ecto.NoResultsError, fn -> Tops.get_top!(top.id) end
    end

    test "change_top/1 returns a top changeset" do
      top = top_fixture()
      assert %Ecto.Changeset{} = Tops.change_top(top)
    end
  end
end
