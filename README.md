# Project Info

This API was created following the mentoring from Rafael Camarda. Where we built it from scratch.
It's a complete functional Jason API, with some tests included.

Here you can create an account. Login to the App. Get a new pokemon and create a nickname to each of your pokemons.

# ExMon

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Create your db with `mix ecto.create`
- Migrate with `mix ecto.migrate`

Then you must create a new trainer. By sending a post request to the route [`localhost:4000/api/trainer`](http://localhost:4000/api/trainer) , with name and password on the body of the requisition.

You will receive an UUID to be abble to login. Remember that the UUID provided is unique and must be saved somewhere.

Next, login to the app, using your Id provided and the password you registered as a body to the `Post` route [`localhost:4000/api/trainer/signin`](http://localhost:4000/api/trainer/signin).

Available non-authenticated routes:

- `Post` [`localhost:4000/api/trainer`](http://localhost:4000/api/trainer)

- `Post` [`localhost:4000/api/trainer/signin`](http://localhost:4000/api/trainer/login)

- `Get` [`localhost:4000/api/pokemon/:name`](http://localhost:4000/api/pokemon/:name) <- Here you must replace ":name" with the name of an exisisting pokemon.

Available Authenticated routes:
These routes requires the Authetication Token Bearer to be accessed;

- `Get` [`localhost:4000/api/trainer/:id`](http://localhost:4000/api/trainer/:id) <- Returns base information about the trainer
- `Put` [`localhost:4000/api/trainer/:id`](http://localhost:4000/api/trainer/:id) <- Update information about trainer (ex: password)

- `Delete` [`localhost:4000/api/trainer/:id`](http://localhost:4000/api/trainer/:id) <- Deletes the trainer from our db

- `Post` [`localhost: 4000/api/trainer_pokemons`](http://localhost:4000/api/trainer_pokemons) - body example:

```Json
{
 "name": "pikachu",
 "nickname": "yellow",
 "trainer_id": "a1b838f7-6383-4cc1-b21e-76e04d35ec7b"
}
```

This will return the pokemon Id, name, nickname given and it's types (electric in this example)

- `Put` [`localhost: 4000/api/trainer_pokemons/:id`](http://localhost:4000/api/trainer_pokemons/:id) <- Updates the nickname of your own pokemon body example

```Json
{
  "nickname": "yellowish"
}
```

- `Get` [`localhost: 4000/api/trainer_pokemons/:id`](http://localhost:4000/api/trainer_pokemons/:id) <- Returns the information about specified pokemon using its ID

- `Delete` [`localhost: 4000/api/trainer_pokemons/:id`](http://localhost:4000/api/trainer_pokemons) <- Deletes the specified pokemon using its ID

# Stack Used:

|     Software     |  Version   |
| :--------------: | :--------: |
|      Elixir      |  v1.13.3   |
|     Phoenix      |  v1.6.10   |
|      Tesla       |    v1.4    |
|     Guardian     |    v2.0    |
|     Postgres     |    v14     |
| ---------------- | ---------- |
