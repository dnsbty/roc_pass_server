defmodule RocPassWeb.EventControllerTest do
  use RocPassWeb.ConnCase

  alias RocPass.Schedule
  alias RocPass.Schedule.Event

  @create_attrs %{start: ~N[2008-11-12 09:00:00.000000]}
  @update_attrs %{start: ~N[2012-04-23 15:00:00.000000]}
  @invalid_attrs %{start: nil}

  @opponent_attrs %{logo_key: "some logo_key", mascot: "some mascot", name: "some name"}
  @sport_attrs %{name: "some name"}
  @venue_attrs %{address: "some address", city: "some city", latitude: "some lat", longitude: "some long", name: "some name", photo_key: "some photo_key", state: "st", zip_code: "some zip"}

  def fixture(:event) do
    {:ok, event} =
      %{
        sport_id: fixture(:sport).id,
        opponent_id: fixture(:opponent).id,
        venue_id: fixture(:venue).id
      }
      |> Enum.into(@create_attrs)
      |> Schedule.create_event
    event
  end

  def fixture(:opponent) do
    {:ok, opponent} = Schedule.create_opponent(@opponent_attrs)
    opponent
  end

  def fixture(:sport) do
    {:ok, sport} = Schedule.create_sport(@sport_attrs)
    sport
  end

  def fixture(:venue) do
    {:ok, venue} = Schedule.create_venue(@venue_attrs)
    venue
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all events", %{conn: conn} do
      conn = get conn, event_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create event" do
    test "renders event when data is valid", %{conn: conn} do
      create_params = Enum.into(%{
        sport_id: fixture(:sport).id,
        opponent_id: fixture(:opponent).id,
        venue_id: fixture(:venue).id
      }, @create_attrs)
      conn = post conn, event_path(conn, :create), event: create_params
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, event_path(conn, :show, id)
      response = json_response(conn, 200)["data"]
      assert response["id"] == id
      assert response["start"] == "2008-11-12T09:00:00.000000"
      assert response["sport"]["id"] == create_params.sport_id
      assert response["opponent"]["id"] == create_params.opponent_id
      assert response["venue"]["id"] == create_params.venue_id
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, event_path(conn, :create), event: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update event" do
    setup [:create_event]

    test "renders event when data is valid", %{conn: conn, event: %Event{id: id} = event} do
      conn = put conn, event_path(conn, :update, event), event: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, event_path(conn, :show, id)
      response = json_response(conn, 200)["data"]
      assert response["id"] == event.id
      assert response["start"] == "2012-04-23T15:00:00.000000"
      assert response["sport"]["id"] == event.sport_id
      assert response["opponent"]["id"] == event.opponent_id
      assert response["venue"]["id"] == event.venue_id
    end

    test "renders errors when data is invalid", %{conn: conn, event: event} do
      conn = put conn, event_path(conn, :update, event), event: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete event" do
    setup [:create_event]

    test "deletes chosen event", %{conn: conn, event: event} do
      conn = delete conn, event_path(conn, :delete, event)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, event_path(conn, :show, event)
      end
    end
  end

  describe "get last update" do
    setup [:create_event]

    test "gets the update time of the last updated item", %{conn: conn} do
      [event] = Schedule.list_events
      
      conn = get conn, event_path(conn, :last_updated)
      updated_at = json_response(conn, 200)["data"]["last_updated"]

      assert updated_at == NaiveDateTime.to_iso8601(event.updated_at)
    end
  end

  defp create_event(_) do
    event = fixture(:event)
    {:ok, event: event}
  end
end
