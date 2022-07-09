defmodule ExMon.Trainer.Pokemon.Get do
  alias ExMon.{Trainer.Pokemon, Repo}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Incorrect UUID"}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(uuid) do
    case Repo.get(Pokemon, uuid) do
      nil -> {:error, "Pokemon not Found"}
      pokemon -> {:ok, Repo.preload(pokemon, :trainer)}
    end
  end
end
