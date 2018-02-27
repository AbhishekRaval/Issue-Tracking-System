defmodule Tasks1.TimeBlocks.Block do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasks1.TimeBlocks.Block


  schema "blocks" do
    field :ends, :naive_datetime
    field :starts, :naive_datetime
    field :task_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Block{} = block, attrs) do
    block
    |> cast(attrs, [:starts, :ends])
    |> validate_required([:starts, :ends])
  end
end
