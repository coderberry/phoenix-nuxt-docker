FROM node:latest

RUN apt-get update && apt-get -y install apt-utils
RUN curl -o- -L https://yarnpkg.com/install.sh | bash

# create app folder
RUN mkdir /app
COPY . /app
WORKDIR /app

RUN yarn

CMD ["yarn", "run", "dev"]
