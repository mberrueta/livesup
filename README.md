<p align="center">
  <img src="docs/images/flow.png" width="500">
  
  <h1 align="center">LiveSup (Summing UP)</h1>
  
  <p align="center">
    We live in the Cloud era, today's applications are about connecting APIs. To manage, monitor, control your app, teams, business you probably need to log in into 10 different services (or more!). It's even harder if you are new to the team or organization you work with. LiveSup tries to add transparency to the services you use and it creates a layer that organizes and simplifies the information you need when you need it.
  </p>
</p>

<p align="center">
  <a href="#">
    <img alt="Build Status" src="https://github.com/livesup-dev/livesup/actions/workflows/test.yml/badge.svg">
  </a>
</p>

---

Disclaimer: it’s our first experience with Elixir/Phoenix so we are open to scrutiny/suggestions! Take this with a grain of salt :wink:

---

Join our community on [Slack](https://join.slack.com/t/livesup-community/shared_invite/zt-17j1hujw7-iBfqKPDd7yYw6jczyFr0Kg) if you have questions, or just to say hi 🎉.
## Business Goals

* Have fun!
* Add transparency to the existing services in your organization/team
* Remove the need to access several services to have a sense of what's going on with your business/app/teams.
* Help onboarding people to the team/organization.
* Drive meetings exposing data that was not available before (easily). 

## Technical Goals

Besides the "business goal" mentioned above there are also a few technical goals behind this development. 

* Have fun!
* Learn Elixir
* Build a rich and dynamic application without javascript (or as little as possible)
* Build a more "complex" and "real" application that helps others understand that you can do much more than just a chat or a ToDo app with a Elixir/phoenix :)

## What is Livesup?

Livesup is an application that lets you concentrate information from different services or datastores in a dashboard. The information is displayed with predefined widgets. Each widget is responsible for reading and displaying the data correctly. For instance the `Github Pull Requests` widget will fetch the last n open/close pull requests from a repository and will display accordingly.

## What is it not?

Livesup is NOT meant to replace any of the datasources it consumes. It is not meant to be used as a debugging tool or an advanced troubleshooting service.

## How data is structure

Livesup has a very flexible data structure that lets you organize the data in the way you want. The top level component is a "Project". A Project can be part of more projects (not supported in the UI yet), and it can have several dashboards, each dashboard has widgets. 

![](/docs/images/projects-data-structure.png)

The relationship between users and projects, is controlled by `Groups`. A Group can have many projects and users. So you can control who can see what. Any new signup will be associated to an default group called `All Users`. And any new project will be associated to that group by default, meaning that when you create a project it will become available to all existing users. 

![](/docs/images/users-projects.png)

## Building and running Livesup localy

If you already have a Postgres server running you can just use the following, replacing the envs with your values

```
docker run --rm \
    -e DATABASE_URL=postgres://postgres:postgres@docker.for.mac.localhost:5432/livesup \
    -e PGHOST=docker.for.mac.localhost \
    -e PGPORT=5432 \
    -e PGUSER=postgres \
    -e PGPASSWORD=postgres \
    -e PGDATABASE=livesup \
    -p 8080:8080 \
    --pull always \
    livesup:edge
```

Or you could just do `docker-compose up` using the existing [docker-compose.yml](docker-compose.yml) file.


## Copyright and License

Copyright (c) 2021, Emiliano Jankowski.

LiveSup source code is licensed under the [MIT License](LICENSE.md).
