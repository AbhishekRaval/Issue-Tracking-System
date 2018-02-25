defmodule Tasks1.Repo.Migrations.AddManagerIdToUser do
  use Ecto.Migration

  def change do
  	alter table(:users) do
	  add :manager_id, references(:users, on_delete: :nothing)
	end
	create index(:users, [:manager_id])
  end
end
