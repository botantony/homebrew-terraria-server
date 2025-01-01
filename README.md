Vanilla Terraria server package for [Homebrew](https://brew.sh) package manager (Linux and macOS)

# Installation

`<formula>` can be replaced with `terraria-server` if you want to download the latest version or with `terraria-server@<version>` for the specific version. Full list of available formulae can be found [in this directory](./Formula/).

`brew install botantony/terraria-server/<formula>`

Or `brew tap botantony/terraria-server` and then `brew install <formula>`.

Or, in a [`brew bundle`](https://github.com/Homebrew/homebrew-bundle) `Brewfile`:

```ruby
tap "botantony/terraria-server"
brew "<formula>"
```

# Usage
Run `TerrariaServer` or `terraria-server`. To launch the server with config run `TerrariaServer -config <config file>`. Default server config with comments can be found here: https://github.com/GameServerManagers/Game-Server-Configs/blob/master/Terraria/serverconfig.txt

> [!NOTE]
> If you installed specific version of the server (f.e. `terraria-server@1.4.4`), use `TerrariaServer144` or `terraria-server-144` commands to call it.

> [!WARNING]
> `world` and `worldpath` fields in config do not accept environment variables (`~`, `$HOME`, etc.)
