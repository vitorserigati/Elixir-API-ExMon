defmodule ExMon.Trainer.Pokemon.CreateTest do
  use ExMon.DataCase
  alias ExMon.{Trainer, Repo}
  alias ExMon.Trainer.Pokemon
  alias ExMon.Trainer.Pokemon.Create

  describe "call/1" do
    test "when given valid params, returns a new trainer pokemon" do
      trainer_params = %{name: "Vitor", password: "123456"}
      {:ok, %Trainer{id: id}} = ExMon.create_trainer(trainer_params)
      count_before = Repo.aggregate(Pokemon, :count)
      pokemon_params = %{"name" => "pikachu", "nickname" => "pika", "trainer_id" => id}
      response = Create.call(pokemon_params)
      count_after = Repo.aggregate(Pokemon, :count)

      assert {:ok,
              %Pokemon{
                name: "pikachu",
                nickname: "pika",
                types: ["electric"],
                weight: 60
              }} = response

      assert count_after > count_before
    end
  end
end
