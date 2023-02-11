defmodule TodoWeb.TaskController do
  use TodoWeb, :controller

  @node :"todo@MacBook-Pro-3"

  def index(conn, _params) do
    tasks = :rpc.call(@node, Todo.TodoLists, :list_tasks, [])

    render(conn, "index.html", tasks: tasks)
  end

  def create(conn, params) do
    result = :rpc.call(@node, Todo.TodoLists, :create_task, [params])

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
    {:ok, _task} = :rpc.call(@node, Todo.TodoLists, :delete_task, [id])

    conn
    |> put_flash(:info, "Task deleted successfully.")
    |> redirect(to: Routes.task_path(conn, :index))
  end
end
