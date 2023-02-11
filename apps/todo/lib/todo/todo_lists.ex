defmodule Todo.TodoLists do
  @moduledoc """
  The TodoLists context.
  """

  import Ecto.Query, warn: false
  alias Todo.Repo
  alias Todo.TodoLists.Task

  def list_tasks do
    Repo.all(Task)
  end

  def create_task(attrs \\ %{}) do
    %Task{}
    |> Task.changeset(attrs)
    |> Repo.insert()
  end

  def delete_task(id) do
    task = Repo.get!(Task, id)
    Repo.delete(task)
  end
end
