defmodule RocPass.Schedule do
  @moduledoc """
  The Schedule context.
  """

  import Ecto.Query, warn: false
  alias RocPass.Repo

  alias RocPass.Schedule.Sport

  @doc """
  Returns the list of sports.

  ## Examples

      iex> list_sports()
      [%Sport{}, ...]

  """
  def list_sports do
    Repo.all(Sport)
  end

  @doc """
  Gets a single sport.

  Raises `Ecto.NoResultsError` if the Sport does not exist.

  ## Examples

      iex> get_sport!(123)
      %Sport{}

      iex> get_sport!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sport!(id), do: Repo.get!(Sport, id)

  @doc """
  Creates a sport.

  ## Examples

      iex> create_sport(%{field: value})
      {:ok, %Sport{}}

      iex> create_sport(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sport(attrs \\ %{}) do
    %Sport{}
    |> Sport.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sport.

  ## Examples

      iex> update_sport(sport, %{field: new_value})
      {:ok, %Sport{}}

      iex> update_sport(sport, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sport(%Sport{} = sport, attrs) do
    sport
    |> Sport.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Sport.

  ## Examples

      iex> delete_sport(sport)
      {:ok, %Sport{}}

      iex> delete_sport(sport)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sport(%Sport{} = sport) do
    Repo.delete(sport)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sport changes.

  ## Examples

      iex> change_sport(sport)
      %Ecto.Changeset{source: %Sport{}}

  """
  def change_sport(%Sport{} = sport) do
    Sport.changeset(sport, %{})
  end

  alias RocPass.Schedule.Venue

  @doc """
  Returns the list of venues.

  ## Examples

      iex> list_venues()
      [%Venue{}, ...]

  """
  def list_venues do
    Repo.all(Venue)
  end

  @doc """
  Gets a single venue.

  Raises `Ecto.NoResultsError` if the Venue does not exist.

  ## Examples

      iex> get_venue!(123)
      %Venue{}

      iex> get_venue!(456)
      ** (Ecto.NoResultsError)

  """
  def get_venue!(id), do: Repo.get!(Venue, id)

  @doc """
  Creates a venue.

  ## Examples

      iex> create_venue(%{field: value})
      {:ok, %Venue{}}

      iex> create_venue(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_venue(attrs \\ %{}) do
    %Venue{}
    |> Venue.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a venue.

  ## Examples

      iex> update_venue(venue, %{field: new_value})
      {:ok, %Venue{}}

      iex> update_venue(venue, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_venue(%Venue{} = venue, attrs) do
    venue
    |> Venue.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Venue.

  ## Examples

      iex> delete_venue(venue)
      {:ok, %Venue{}}

      iex> delete_venue(venue)
      {:error, %Ecto.Changeset{}}

  """
  def delete_venue(%Venue{} = venue) do
    Repo.delete(venue)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking venue changes.

  ## Examples

      iex> change_venue(venue)
      %Ecto.Changeset{source: %Venue{}}

  """
  def change_venue(%Venue{} = venue) do
    Venue.changeset(venue, %{})
  end

  alias RocPass.Schedule.Opponent

  @doc """
  Returns the list of opponents.

  ## Examples

      iex> list_opponents()
      [%Opponent{}, ...]

  """
  def list_opponents do
    Repo.all(Opponent)
  end

  @doc """
  Gets a single opponent.

  Raises `Ecto.NoResultsError` if the Opponent does not exist.

  ## Examples

      iex> get_opponent!(123)
      %Opponent{}

      iex> get_opponent!(456)
      ** (Ecto.NoResultsError)

  """
  def get_opponent!(id), do: Repo.get!(Opponent, id)

  @doc """
  Creates a opponent.

  ## Examples

      iex> create_opponent(%{field: value})
      {:ok, %Opponent{}}

      iex> create_opponent(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_opponent(attrs \\ %{}) do
    %Opponent{}
    |> Opponent.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a opponent.

  ## Examples

      iex> update_opponent(opponent, %{field: new_value})
      {:ok, %Opponent{}}

      iex> update_opponent(opponent, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_opponent(%Opponent{} = opponent, attrs) do
    opponent
    |> Opponent.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Opponent.

  ## Examples

      iex> delete_opponent(opponent)
      {:ok, %Opponent{}}

      iex> delete_opponent(opponent)
      {:error, %Ecto.Changeset{}}

  """
  def delete_opponent(%Opponent{} = opponent) do
    Repo.delete(opponent)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking opponent changes.

  ## Examples

      iex> change_opponent(opponent)
      %Ecto.Changeset{source: %Opponent{}}

  """
  def change_opponent(%Opponent{} = opponent) do
    Opponent.changeset(opponent, %{})
  end
end
