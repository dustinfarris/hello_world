FROM node:latest AS assets

COPY ./assets /build
WORKDIR /build
RUN npm install
RUN npm run deploy


FROM elixir:1.6
ENV DEBIAN_FRONTEND=noninteractive

RUN mix local.hex --force
RUN mix local.rebar --force

WORKDIR /app
COPY . /app
COPY --from=assets /build/output /app/priv/static
RUN mix deps.get
RUN mix do deps.compile, phx.digest
EXPOSE 80

CMD ["mix", "phx.server"]
