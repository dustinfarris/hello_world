FROM elixir:1.6
ENV DEBIAN_FRONTEND=noninteractive

RUN mix local.hex --force
RUN mix local.rebar --force

WORKDIR /app
COPY . /app
RUN mix deps.get
RUN mix do deps.compile, phx.digest
EXPOSE 80

CMD ["mix", "phx.server"]
