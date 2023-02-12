defmodule TodoWeb.TaskController do
  use TodoWeb, :controller

  import RemoteCallMacro
  @node Application.compile_env!(:todo_web, [:nodes, :todo, :short_name])

  def index(conn, _params) do
    tasks =
      remote(@node) do
        Todo.TodoLists.list_tasks()
      end

    render(conn, "index.html", tasks: tasks)
  end

  def create(conn, params) do
    result =
      remote(@node) do
        Todo.TodoLists.create_task(params)
      end

    case result do
      {:ok, _task} ->
        conn
        |> redirect(to: Routes.task_path(conn, :index))

      {:error, _changeset} ->
        conn
        |> put_flash(:error, "Invalid data for task.")
        |> redirect(to: Routes.task_path(conn, :index))
    end
  end

  def delete(conn, %{"id" => id}) do
    {:ok, _task} =
      remote(@node) do
        Todo.TodoLists.delete_task(id)
      end

    conn
    |> put_flash(:info, "Task deleted successfully.")
    |> redirect(to: Routes.task_path(conn, :index))
  end
end
