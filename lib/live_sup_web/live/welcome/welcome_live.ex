defmodule LiveSupWeb.WelcomeLive do
  use LiveSupWeb, :live_view

  import LiveSupWeb.Live.AuthHelper
  alias LiveSup.Core.{Teams, Users}
  alias LiveSup.Schemas.{Team, User}

  @impl true
  def mount(_params, session, socket) do
    current_user = get_current_user(session, socket)

    {:ok,
     assign(socket,
       current_user: current_user
     )}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :teams, _) do
    %{id: user_id} = socket.assigns.current_user

    user = user_id |> Users.get!()

    changeset = User.update_changeset(user, %{})

    socket
    |> assign(:teams, Teams.all())
    |> assign(:changeset, changeset)
  end

  defp apply_action(socket, :location, _) do
    socket
  end

  @impl true
  def handle_event("save", %{"user" => user_params}, socket) do
    associate_teams(socket, user_params)
  end

  defp associate_teams(socket, %{"id" => user_id, "teams" => teams}) do
    teams
    |> Enum.each(fn team_id ->
      Teams.add_member(%Team{id: team_id}, %User{id: user_id})
    end)

    {:noreply,
     socket
     |> put_flash(:info, "Teams added successfully")
     |> push_redirect(to: Routes.welcome_path(socket, :location))}
  end
end
