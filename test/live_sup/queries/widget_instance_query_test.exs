defmodule LiveSup.Tests.Queries.WidgetInstanceQueryTest do
  use ExUnit.Case, async: true
  use LiveSup.DataCase

  alias LiveSup.Queries.WidgetInstanceQuery

  import LiveSup.Test.Setups

  setup [:setup_dashboard_with_widgets]

  describe "managing internal queries for groups" do
    @describetag :widget_instance_query

    test "return a single widget instance", %{widgets_instances: [widget_instance, _]} do
      widget_instance_found = %{id: id} = WidgetInstanceQuery.get!(widget_instance.id)

      assert widget_instance_found = widget_instance
    end

    test "return widgets by dashboard", %{
      dashboard: dashboard
    } do
      existing_widgets_instances =
        dashboard
        |> WidgetInstanceQuery.by_dashboard()

      assert [
               %{
                 widget: %{
                   worker_handler: "LiveSup.Core.Widgets.LordOfTheRingQuote.Worker"
                 },
                 datasource_instance: %{
                   settings: %{}
                 }
               },
               %{
                 widget: %{
                   worker_handler: "LiveSup.Core.Widgets.LordOfTheRingQuote.Worker"
                 },
                 datasource_instance: %{
                   settings: %{}
                 }
               }
             ] = existing_widgets_instances

      first_widget_instance = existing_widgets_instances |> Enum.at(0)

      assert first_widget_instance.widget.worker_handler ==
               "LiveSup.Core.Widgets.LordOfTheRingQuote.Worker"
    end
  end
end
