defmodule LiveSupWeb.Live.Todo.Components.TaskDetails.GithubPullRequestTaskComponent do
  use LiveSupWeb, :component

  def render(assigns) do
    ~H"""
    <.card title={@task.title}>
      <.card_field label="State">
        <.badge description={@task.external_metadata["state"]} color={:success} />
      </.card_field>

      <div class="rounded-md rounded-t-none border border-gray-400 text-gray-700 divide-y divide-gray-400">
        <div class="prose max-w-none px-4">
          <section class="mt-4 space-y-2">
            <%= raw(body_to_html(@task)) %>
          </section>
        </div>
      </div>
      <div class="flex justify-end space-x-2 mt-2">
        <a
          href={@task.external_metadata["html_url"]}
          target="_blank"
          class="btn space-x-2 bg-slate-150 font-medium text-slate-800 hover:bg-slate-200 focus:bg-slate-200 active:bg-slate-200/80 dark:bg-navy-500 dark:text-navy-50 dark:hover:bg-navy-450 dark:focus:bg-navy-450 dark:active:bg-navy-450/90"
        >
          <span>Open Pull Request</span>
          <i class="fa-solid fa-arrow-up-right-from-square text-lg"></i>
        </a>
      </div>
    </.card>
    """
  end

  def body_to_html(%{external_metadata: %{"body" => body}}) do
    {:ok, html_content, []} = Earmark.as_html(body, compact_output: true)
    html_content
  end
end
