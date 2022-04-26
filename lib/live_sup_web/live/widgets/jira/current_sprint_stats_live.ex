defmodule LiveSupWeb.Live.Widgets.Jira.CurrentSprintStatsLive do
  use LiveSupWeb.Live.Widgets.WidgetLive

  @impl true
  @spec render_widget(any) :: Phoenix.LiveView.Rendered.t()
  def render_widget(assigns) do
    ~H"""
    <.live_component module={SmartRenderComponent} id={@widget_data.id}  let={widget_data} widget_data={@widget_data}>
      <!-- Incidents by Type -->
      <.live_component module={WidgetHeaderComponent} id={"#{widget_data.id}-header"} widget_data={widget_data} />
      <!-- Widget Content -->
      <div class="p-2 grid justify-items-center  min-h-[132px]">
        <%= live_component(LiveSupWeb.Output.VegaLiteStaticComponent, id: "blameless-incidents-by-type-chart", spec: build_spec(widget_data)) %>
      </div>
      <!-- /Widget Content -->
      <!-- /Incidents by Type -->
        <.live_component module={WidgetFooterComponent} id={"#{widget_data.id}-footer"} widget_data={widget_data} />
    </.live_component>
    """
  end

  def build_spec(widget_data) do
    # data =
    #   widget_data.data
    #   |> Enum.map(fn {key, value} ->
    #     %{"status" => key, "count" => value}
    #   end)

    # Initialize the specification, optionally with some top-level properties
    %{
      "$schema" => "https://vega.github.io/schema/vega-lite/v5.json",
      "description" => "",
      "data" => %{
        "values" => widget_data.data
      },
      "background" => nil,
      "mark" => "arc",
      "encoding" => %{
        "theta" => %{"field" => "count", "type" => "quantitative", "stack" => true},
        "color" => %{
          "field" => "status",
          "type" => "nominal",
          "legend" => %{"title" => "Type", "labelColor" => "white", "titleColor" => "white"}
        },
        "radius" => %{
          "field" => "count",
          "scale" => %{"type" => "sqrt", "zero" => true, "rangeMin" => 20}
        }
      },
      "layer" => [
        %{
          "mark" => %{"type" => "arc", "innerRadius" => 20, "stroke" => "#fff"}
        },
        %{
          "mark" => %{"type" => "text", "radiusOffset" => 10},
          "encoding" => %{
            "text" => %{"field" => "count", "type" => "quantitative"}
          }
        }
      ]
    }
  end
end