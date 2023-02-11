defmodule Todo.TodoListsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Todo.TodoLists` context.
  """

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        description: "some description"
      })
      |> Todo.TodoLists.create_task()

    task
  end
end
