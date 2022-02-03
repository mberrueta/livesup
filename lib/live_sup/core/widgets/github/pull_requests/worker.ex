defmodule LiveSup.Core.Widgets.Github.PullRequests.Worker do
  use LiveSup.Core.Widgets.WidgetServer

  alias LiveSup.Core.Widgets.Github.PullRequests.Handler

  @default_title "{owner}/{repository}"

  def settings_keys, do: ["owner", "repository", "token", "state"]

  @impl true
  def build_data(settings) do
    settings
    |> Handler.get_data()
  end

  @impl true
  def default_title() do
    @default_title
  end
end
