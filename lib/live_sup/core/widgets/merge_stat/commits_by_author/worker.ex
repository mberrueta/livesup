defmodule LiveSup.Core.Widgets.MergeStat.CommitsByAuthor.Worker do
  use LiveSup.Core.Widgets.WidgetServer

  alias LiveSup.Core.Widgets.MergeStat.CommitsByAuthor.Handler
  alias LiveSup.Schemas.WidgetInstance

  @default_title "Commits by Author"

  def settings_keys, do: ["repo", "limit"]

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
