#!/bin/bash

if [ "$MIX_ENV" == "prod" ]; then
  mix deps.create
  mix ecto.migrate
  mix phx.server
else
  mix deps.get
  mix ecto.migrate
  mix phx.server
fi
