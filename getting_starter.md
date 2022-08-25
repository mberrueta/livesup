# Getting Starter

## Dependencies

- elixir -v > 1.13
- docker (or postgres)

## Install & Dependencies

```shell
git clone git@github.com:livesup-dev/livesup.git
cd livesup
docker-compose up -d
mix setup   
mix phx.server   

open http://localhost:4000        
```

## Errors

- Lack of `cmd` in `mix setup` for `npm install`
- Add template to issues creation
- Create default team with sample dashboard in seeds
- ERD / Development relations

## Schema

[mermaid schema](docs/development/simplified_schema.mmd)