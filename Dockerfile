FROM madetech/rails-deps:ruby2.4.0

RUN mkdir -p /app
WORKDIR /app
COPY Gemfile Gemfile.lock ./
ENV BUNDLE_PATH /bundle
