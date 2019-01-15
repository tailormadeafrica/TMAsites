FROM ubuntu

SHELL ["/bin/bash", "-l", "-c"]

RUN apt-get update && apt-get -y install curl git

RUN curl -sSL https://get.rvm.io | bash -s stable

RUN . /etc/profile.d/rvm.sh

RUN rvm requirements
RUN rvm install 2.2.5
RUN rvm use 2.2.5 --default

RUN gem install bundler -v 1.17.2

RUN apt-get -y install gnupg gnupg2 gnupg1
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash

RUN apt-get install -y nodejs libpq-dev

WORKDIR /app

COPY . /app

RUN bundle install --jobs=4

RUN gem install rails -v 3.2.22

RUN rails s



