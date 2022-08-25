# Script for populating the versapay database
#
#     mix run priv/repo/versapay/seeds.ex

alias LiveSup.Repo
alias LiveSup.Schemas.{Project}

IO.write("Seeding projects ")
Repo.delete_all(Project)

project = Repo.insert! %Project{
  name: "Development",
  slug: "dev"
}
IO.write("  Project id: #{project.id}}")

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
