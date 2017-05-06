# https://hub.docker.com/_/ruby/
FROM ruby:2.4.1

# 必要なライブラリをインストール
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs

# ワーキングディレクトリの設定
# ここが下のADD / RUNなどのベースディレクトリとなる
RUN mkdir -p /app
WORKDIR /app

# GemfileとGemfile.lockをDockerにコピーする
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock

# gemをインストール
# bundler自体はRubyイメージに含まれている
RUN bundle install

# カレントディレクトリをコピー
Add . /app
