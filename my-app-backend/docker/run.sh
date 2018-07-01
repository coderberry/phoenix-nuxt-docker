#!/bin/bash

mix local.rebar --force

if [ "$MIX_ENV" == "prod" ]; then
  mix deps.create
  mix ecto.migrate
  
  # See https://github.com/riverrun/comeonin/wiki#problems--build-issues
  (cd deps/bcrypt_elixir && make clean && make)

  mix phx.server
else
  mix deps.get
  mix ecto.migrate
  
  # See https://github.com/riverrun/comeonin/wiki#problems--build-issues
  (cd deps/bcrypt_elixir && make clean && make)

  mix deps.compile
  mix phx.server
fi
