FROM elixir:latest

# install hex package manager
RUN mix local.hex --force

# install the latest phoenix 
RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez --force

# create app folder
RUN mkdir /app
COPY . /app
WORKDIR /app

# setting the port and the environment (prod = PRODUCTION!)
ENV MIX_ENV=dev
ENV PORT=4000

# install dependencies (production only)
RUN mix local.rebar --force && \
  mix deps.get \
  mix compile

# run phoenix in production on PORT 4000
CMD docker/run.sh