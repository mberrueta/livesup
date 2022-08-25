# Script for populating the versapay database
#
#     mix run priv/repo/versapay/seeds.ex

alias LiveSup.Repo
alias LiveSup.Schemas.{
  Project,
  User,
  Team,
  TeamMember,
  Dashboard,
  DashboardWidget,
  WidgetInstance,
  Datasource,
  DatasourceInstance
}
alias LiveSup.Core.{Datasources, Widgets}

IO.puts("Cleaning ")

Repo.delete_all DashboardWidget
Repo.delete_all WidgetInstance
Repo.delete_all Dashboard
Repo.delete_all TeamMember
Repo.delete_all User
Repo.delete_all Team
Repo.delete_all Project

# ====================================================================================
# Projects
# ====================================================================================
IO.puts("Seeding projects ")

project = Repo.insert! %Project{
  name: "Development",
  slug: "dev"
}
IO.puts("  Project id: #{project.id}}")

Repo.insert! %Project{
  name: "Squad 1",
  slug: "squad-1",
  parent_id: project.id
}

Repo.insert! %Project{
  name: "Squad 7",
  slug: "squad-7",
  parent_id: project.id
}

# ====================================================================================
# Teams
# ====================================================================================
IO.puts("Seeding teams ")

dev_team = Repo.insert! %Team{
  name: "Developers",
  slug: "developers",
  project: project
}

managers_team = Repo.insert! %Team{
  name: "Managers",
  slug: "managers",
  project: project
}

# ====================================================================================
# Users
# ====================================================================================
IO.puts("Seeding users ")

one_pass_to_rule_them_all = "a.secret.password"
hashed = Bcrypt.hash_pwd_salt(one_pass_to_rule_them_all)

user = Repo.insert! %User{
  first_name: "Matias",
  last_name: "Berrueta",
  email: "matias.berrueta@versapay.com",
  password: one_pass_to_rule_them_all,
  hashed_password: hashed,
  location: %{
    "timezone" => "America/Brazil",
    "state" => "Salvador",
    "country" => "Brazil"
  }
}

Repo.insert! %TeamMember{
  team: dev_team,
  user: user
}

user = Repo.insert! %User{
  first_name: "Kirby",
  last_name: "Kuindersma",
  email: "kirby_kuindersma@versapay.com",
  password: one_pass_to_rule_them_all,
  hashed_password: hashed,
  location: %{
    "timezone" => "America/Canada",
    "state" => "Ontario",
    "country" => "Canada"
  }
}

Repo.insert! %TeamMember{
  team: managers_team,
  user: user
}

user = Repo.insert! %User{
  first_name: "Michael",
  last_name: "Swope",
  email: "michael.swope@versapay.com",
  password: one_pass_to_rule_them_all,
  hashed_password: hashed,
  location: %{
    "timezone" => "America/California",
    "state" => "California",
    "country" => "United States"
  }
}

Repo.insert! %TeamMember{
  team: managers_team,
  user: user
}

# ====================================================================================
# Dashboard
# ====================================================================================
IO.puts("Seeding dashboard ")

jira_datasource = Datasources.get_by_slug!("jira-datasource")
{:ok, jira_datasource_instance} = Datasources.create_instance(jira_datasource)

jira_current_sprint = Widgets.get_by_slug("jira-current-sprint")
jira_current_sprint_stats = Widgets.get_by_slug("jira-current-sprint-stats")
jira_list_of_issues = Widgets.get_by_slug("jira-list-of-issues")

dashboard = Repo.insert! %Dashboard{
  name: "Default dashboard",
  project: project
}

jira_current_sprint_instance = Widgets.create_instance(jira_current_sprint, jira_datasource_instance)

Repo.insert! %DashboardWidget{
  widget_instance_id: jira_current_sprint_instance,
  dashboard: dashboard
}
