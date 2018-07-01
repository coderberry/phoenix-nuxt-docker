FROM elixir:latest

# install hex package manager
RUN mix local.hex --force

RUN apt-get update && apt-get install --yes build-essential gcc make libc6-dev inotify-tools

# install the latest phoenix 
RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez --force

# create app folder
RUN mkdir /app
COPY . /app
WORKDIR /app

# setting the port and the environment (prod = PRODUCTION!)
ENV MIX_ENV=dev
ENV PORT=4000

# run phoenix in production on PORT 4000
CMD docker/run.sh