defmodule LiveSupWeb.Dashboard.Components.DashboardWidgetHeaderComponent do
  use LiveSupWeb, :component

  def render(assigns) do
    ~H"""
    <div class="justify-between flex flex-row space-x-4 border-b dark:border-primary-darker px-4 py-2">
      <div class="flex items-center basis-6/12">
        <%= link "Home", class: "text-blue-500 after:mx-4  after:content-['>'] after:text-white", to: Routes.home_path(LiveSupWeb.Endpoint, :index) %>
        <%= link "Projects", class: "text-blue-500 after:mx-4  after:content-['>'] after:text-white", to: Routes.project_path(LiveSupWeb.Endpoint, :index) %>
        <%= link @project.name, class: "text-blue-500 after:mx-4 after:content-['>'] after:text-white", to: Routes.dashboard_path(LiveSupWeb.Endpoint, :index, @project.id) %>
        <%= link "Dashboards", class: "text-blue-500 after:mx-4 after:content-['>'] after:text-white", to: Routes.dashboard_path(LiveSupWeb.Endpoint, :index, @project.id) %>
        <%= link @dashboard.name, class: "text-blue-500 after:mx-4 after:content-['>'] after:text-white", to: Routes.dashboard_path(LiveSupWeb.Endpoint, :show, @dashboard.id) %>
        <span>Widgets</span>
      </div>
    </div>
    """
  end
end
