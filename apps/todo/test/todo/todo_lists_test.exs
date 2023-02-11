defmodule Todo.TodoListsTest do
  use Todo.DataCase

  alias Todo.TodoLists

  describe "tasks" do
    alias Todo.TodoLists.Task

    import Todo.TodoListsFixtures

    @invalid_attrs %{description: nil}

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert TodoLists.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert TodoLists.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      valid_attrs = %{description: "some description"}

      assert {:ok, %Task{} = task} = TodoLists.create_task(valid_attrs)
      assert task.description == "some description"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TodoLists.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      update_attrs = %{description: "some updated description"}

      assert {:ok, %Task{} = task} = TodoLists.update_task(task, update_attrs)
      assert task.description == "some updated description"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = TodoLists.update_task(task, @invalid_attrs)
      assert task == TodoLists.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = TodoLists.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> TodoLists.get_task!(task.id) end
    end
  end
end
