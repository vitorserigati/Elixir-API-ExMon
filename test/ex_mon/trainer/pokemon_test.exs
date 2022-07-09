defmodule ExMon.Trainer.PokemonTest do
  use ExMon.DataCase

  alias ExMon.Trainer.Pokemon
  alias ExMon.Trainer

  describe "changeset/1" do
    test "when given valid params, returns a valid changeset" do
      trainer = Ecto.UUID.generate()

      params = %{
        name: "pikachu",
        nickname: "pika",
        weight: 50,
        types: ["eletric"],
        trainer_id: trainer
      }

      response = Pokemon.changeset(params)

      assert %Ecto.Changeset{
               changes: %{
                 name: "pikachu",
                 nickname: "pika",
                 types: ["eletric"],
                 weight: 50
               },
               valid?: true
             } = response
    end

    test "when given invalid params, returns a invalid changeset" do
      trainer = Ecto.UUID.generate()

      params = %{
        nickname: "pika",
        weight: 50,
        types: ["eletric"],
        trainer_id: trainer
      }

      response = Pokemon.changeset(params)

      assert %Ecto.Changeset{valid?: false} = response
      assert errors_on(response) == %{name: ["can't be blank"]}
    end
  end

  describe "build/1" do
    test "when given valid params, returns a valid pokemon struct" do
      trainer = Ecto.UUID.generate()

      params = %{
        name: "pikachu",
        nickname: "pika",
        weight: 50,
        types: ["eletric"],
        trainer_id: trainer
      }

      {:ok, response} = Pokemon.build(params)

      assert %Pokemon{
               name: "pikachu",
               nickname: "pika",
               types: ["eletric"],
               weight: 50
             } = response
    end

    test "when given invalid params, returns a invalid pokemon changeset" do
      trainer = Ecto.UUID.generate()

      params = %{
        name: "pikachu",
        weight: 50,
        types: ["eletric"],
        trainer_id: trainer
      }

      {:error, response} = Pokemon.build(params)

      assert %Ecto.Changeset{valid?: false} = response
      assert errors_on(response) == %{nickname: ["can't be blank"]}
    end
  end

  describe "update_changeset/2" do
    test "when given valid params, updates an existing pokemon" do
      pokemon = %{
        name: "pikachu",
        nickname: "pika",
        weight: 50,
        types: ["eletric"],
        trainer_id: Ecto.UUID.generate()
      }

      {:ok, trainer_pokemon} = Pokemon.build(pokemon)

      params = %{nickname: "raio"}
      response = Pokemon.update_changeset(trainer_pokemon, params)

      assert %Ecto.Changeset{
               changes: %{nickname: "raio"},
               valid?: true
             } = response
    end

    test "when given invalid params, returns an invalid changeset" do
      pokemon = %{
        name: "pikachu",
        nickname: "pika",
        weight: 50,
        types: ["eletric"],
        trainer_id: Ecto.UUID.generate()
      }

      {:ok, trainer_pokemon} = Pokemon.build(pokemon)

      params = %{nickname: "r"}
      response = Pokemon.update_changeset(trainer_pokemon, params)

      assert %Ecto.Changeset{valid?: false} = response
      assert errors_on(response) == %{nickname: ["should be at least 2 character(s)"]}
    end
  end
end
