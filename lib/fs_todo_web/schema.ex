defmodule FsTodoWeb.Schema do
  use Absinthe.Schema

  @desc "a todo"
  object :todo do
    field(:id, :id)
    field(:description, :string)
  end

  @todos %{
    "1" => %{id: 1, description: "write tests"},
    "2" => %{id: 2, description: "write code"}
  }

  query do
    field :todo, :todo do
      arg(:id, non_null(:id))

      resolve(fn %{id: todo_id}, _ ->
        {:ok, @todos[todo_id]}
      end)
    end
  end
end
