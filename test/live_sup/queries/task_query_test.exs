defmodule LiveSup.Tests.Queries.TaskQueryTest do
  use ExUnit.Case, async: true
  use LiveSup.DataCase

  alias LiveSup.Queries.TaskQuery
  alias LiveSup.Core.Todos
  alias LiveSup.Test.TasksFixtures

  import LiveSup.Test.Setups

  setup [
    :setup_user_and_default_project,
    :setup_todo
  ]

  describe "getting tasks" do
    @describetag :tasks_query

    setup [
      :setup_task
    ]

    test "return all" do
      tasks = TaskQuery.all()

      assert length(tasks) == 1
    end
  end

  describe "creating a task" do
    @tag :task_query_create
    test "create/1", %{todo: %{id: todo_id}} do
      attrs = %{
        "description" => "alo?",
        "due_on" => "2022-09-06",
        "notes" => "some cool notes",
        "todo_id" => todo_id
      }

      {:ok, task} = TaskQuery.create(attrs)
      assert task.description == "alo?"
      assert task.due_on == ~U[2022-09-06 00:00:00Z]
    end
  end

  describe "managing tasks queries" do
    @describetag :tasks_query

    setup %{todo: todo} do
      task = TasksFixtures.task_fixture(todo)
      TasksFixtures.task_fixture(todo)

      {:ok, task: task}
    end

    test "delete todo's tasks", %{todo: %{id: todo_id}} do
      tasks = Todos.get_tasks(todo_id)

      assert length(tasks) == 2

      {_result, nil} =
        todo_id
        |> TaskQuery.delete_all()

      tasks = Todos.get_tasks(todo_id)
      assert length(tasks) == 0
    end

    test "complete!/1", %{task: task} do
      TaskQuery.complete!(task.id)
      task = TaskQuery.get!(task.id)
      assert task.completed == true
    end

    test "incomplete!/1", %{task: task} do
      TaskQuery.incomplete!(task.id)
      task = TaskQuery.get!(task.id)
      assert task.completed == false
    end

    test "get/1", %{task: task} do
      found_task = TaskQuery.get(task)
      assert found_task.description == task.description
    end

    test "get!/1", %{task: task} do
      found_task = TaskQuery.get!(task.id)
      assert found_task.description == task.description
    end

    test "update/2", %{task: task} do
      found_task = TaskQuery.get!(task.id)

      {:ok, _saved_task} = TaskQuery.update(found_task, %{description: "new description"})

      found_task = TaskQuery.get!(task.id)
      assert found_task.description == "new description"
    end
  end
end
