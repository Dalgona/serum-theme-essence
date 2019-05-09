# Essence

**Essence** is a Serum theme which presents a minimal and clean look.

This theme was extracted from [the official Serum
website](https://dalgona.github.io/Serum), and extended for general use.

## Installation

Add the theme package to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:serum, "~> 1.1"},
    {:serum_theme_essence, "~> 1.0"},
    # ...
  ]
end
```

Run `mix` to fetch and build the theme package:

```shell
$ mix do deps.get, deps.compile
```

Configure your `serum.exs` to use `Serum.Themes.Essence` theme module:

```elixir
%{
  theme: Serum.Themes.Essence,
  # ...
}
```

## License

MIT. See `LICENSE` for the full text.
