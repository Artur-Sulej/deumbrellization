defmodule TodoWeb.TaskControllerTest do
  use TodoWeb.ConnCase

  describe "index" do
    test "lists all tasks", %{conn: conn} do
      Process.put(
        {Todo.TodoLists, :list_tasks, []},
        [
          %{
            __struct__: Todo.TodoLists.Task,
            id: 5,
            description: "Do some stuff"
          }
        ]
      )

      conn = get(conn, Routes.task_path(conn, :index))
      assert html_response(conn, 200) =~ "Do some stuff"
    end
  end
end
