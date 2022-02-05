defmodule LiveSup.Test.Core.Widgets.Blameless.IncidentsByDate.HandlerTest do
  use LiveSup.DataCase, async: false
  import Mock

  alias LiveSup.Core.Widgets.Blameless.IncidentsByDate.Handler
  alias LiveSup.Core.Datasources.BlamelessDatasource

  describe "Managing blameless incidents by date" do
    @describetag :widget
    @describetag :blameless_incidents_by_date_widget
    @describetag :blameless_incidents_by_date_widget_handler

    @response [
      %{
        commander: %{
          avatar_url: "https://avatars.slack-edge.com/2020-02-05/312300803504_32.jpg",
          email: "random@livesup.com",
          full_name: "Julius Random",
          title: "Network Engineer"
        },
        communication_lead: %{
          avatar_url: "https://avatars.slack-edge.com/2011-11-20/12323211510272_32.jpg",
          email: "hello@livesup.com",
          full_name: "Hello LiveSup",
          title: "Cloud Support Engineer"
        },
        created_at: ~U[2021-07-12 08:22:12.985Z],
        created_at_ago: "3 months ago",
        description: "Blameless current incidents plugin is broken!",
        severity: "SEV2: Urgent Problem",
        slack: %{
          channel: "_incident-843",
          url: "https://livesup.slack.com/archives/C027R80T42E"
        },
        status: "RESOLVED",
        type: "Widgets",
        updated_at: ~U[2021-07-12 09:54:14.281Z],
        url: "https://livesup.blameless.io/incidents/843/events"
      },
      %{
        commander: %{
          avatar_url: "https://avatars.slack-edge.com/2020-02-05/312300803504_32.jpg",
          email: "random@livesup.com",
          full_name: "Julius Random",
          title: "Network Engineer"
        },
        communication_lead: %{
          avatar_url: "https://avatars.slack-edge.com/2011-11-20/12323211510272_32.jpg",
          email: "hello@livesup.com",
          full_name: "Hello LiveSup",
          title: "Cloud Support Engineer"
        },
        created_at: ~U[2021-07-12 08:22:12.985Z],
        created_at_ago: "3 months ago",
        description: "Blameless current incidents plugin is broken!",
        severity: "SEV2: Urgent Problem",
        slack: %{
          channel: "_incident-843",
          url: "https://livesup.slack.com/archives/C027R80T42E"
        },
        status: "RESOLVED",
        type: "Widgets",
        updated_at: ~U[2021-07-12 09:54:14.281Z],
        url: "https://livesup.blameless.io/incidents/843/events"
      },
      %{
        commander: %{
          avatar_url: "https://avatars.slack-edge.com/2020-02-05/312300803504_32.jpg",
          email: "random@livesup.com",
          full_name: "Julius Random",
          title: "Network Engineer"
        },
        communication_lead: %{
          avatar_url: "https://avatars.slack-edge.com/2011-11-20/12323211510272_32.jpg",
          email: "hello@livesup.com",
          full_name: "Hello LiveSup",
          title: "Cloud Support Engineer"
        },
        created_at: ~U[2021-06-12 08:22:12.985Z],
        created_at_ago: "3 months ago",
        description: "Blameless current incidents plugin is broken!",
        severity: "SEV2: Urgent Problem",
        slack: %{
          channel: "_incident-843",
          url: "https://livesup.slack.com/archives/C027R80T42E"
        },
        status: "RESOLVED",
        type: "Datasources",
        updated_at: ~U[2021-07-12 09:54:14.281Z],
        url: "https://livesup.blameless.io/incidents/843/events"
      },
      %{
        created_at: ~U[2021-04-12 08:22:12.985Z],
        created_at_ago: "3 months ago",
        description: "Blameless current incidents plugin is broken!",
        severity: "SEV2: Urgent Problem",
        slack: %{
          channel: "_incident-843",
          url: "https://livesup.slack.com/archives/C027R80T42E"
        },
        status: "RESOLVED",
        type: "Widget",
        updated_at: ~U[2021-07-12 09:54:14.281Z],
        url: "https://livesup.blameless.io/incidents/843/events"
      },
      %{
        created_at: ~U[2021-04-12 08:22:12.985Z],
        created_at_ago: "3 months ago",
        description: "Blameless current incidents plugin is broken!",
        severity: "SEV2: Urgent Problem",
        slack: %{
          channel: "_incident-843",
          url: "https://livesup.slack.com/archives/C027R80T42E"
        },
        status: "RESOLVED",
        type: "Datasources",
        updated_at: ~U[2021-07-12 09:54:14.281Z],
        url: "https://livesup.blameless.io/incidents/843/events"
      },
      %{
        created_at: ~U[2021-04-12 08:22:12.985Z],
        created_at_ago: "3 months ago",
        description: "Blameless current incidents plugin is broken!",
        severity: "SEV2: Urgent Problem",
        slack: %{
          channel: "_incident-843",
          url: "https://livesup.slack.com/archives/C027R80T42E"
        },
        status: "RESOLVED",
        type: "Datasources",
        updated_at: ~U[2021-07-12 09:54:14.281Z],
        url: "https://livesup.blameless.io/incidents/843/events"
      }
    ]

    test "getting incidents by type" do
      with_mock BlamelessDatasource,
        get_incidents: fn _args -> {:ok, @response} end do
        incidents =
          %{
            "client_id" => "xxx",
            "client_secret" => "xxx",
            "audience" => "xxx",
            "endpoint" => "https://dummy.com",
            "limit" => 3
          }
          |> Handler.get_data()

        assert {
                 :ok,
                 [
                   %{created_at: "2021/7/12", type: "Widgets", value: 1},
                   %{created_at: "2021/7/12", type: "Widgets", value: 1},
                   %{created_at: "2021/6/12", type: "Datasources", value: 1},
                   %{created_at: "2021/4/12", type: "Widget", value: 1},
                   %{created_at: "2021/4/12", type: "Datasources", value: 1},
                   %{created_at: "2021/4/12", type: "Datasources", value: 1}
                 ]
               } = incidents
      end
    end
  end
end
