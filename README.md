# NixVim config

**PERSONAL** configuration for [Neovim](https://neovim.io/) using [Nixvim](https://nix-community.github.io/nixvim/).

This repository is based on [nicolas-goudry's nixvim config](https://github.com/nicolas-goudry/nixvim-config)
I did not use the core functionalities of AstroVim inspired and also stripped out some of the plugins and settings completely.
Also added the plugins from many resources. Also edited the descriptions as following.

> [!NOTE]
> This project uses the [flake system](https://nixos.wiki/wiki/Flakes) and is not intended to be used without Flakes.

The [flake](./flake.nix) exports two packages:

- `default`: Nixvim package built from the configuration files
- `lite`: Same as above, without the LSP stuff

> [!WARNING]
> 🚧 **This is a work in progress** 🚧

## 📥 Installation

```nix
{
  inputs.nixvim-config.url = "github:alkimake/nixvim-config";

  outputs = { nixvim-config, ... }: {
    overlays.additions = final: _prev: {
      nixvim = nixvim-config.packages.${_prev.system}.default;

      # Or use the lite version
      # nixvim = nixvim-config.packages.${_prev.system}.lite;
    }
  }
}
```

## 🍱 Structure

The config is mainly split in two directories:

- [plugins](./plugins): Nixvim plugins configuration, using a custom load mechanism
- [config](./config): nvim configuration (like options, global keymaps, etc)

Other configuration attributes may be found in [`default.nix`](./default.nix) if they don’t justify being in a separate file.

### 🥣 Configuration

The configuration is split in multiple files organized by “topic” in the [config](./config) directory. These are auto-`import`ed in the main [`default.nix`](./default.nix) file.

### 🥢 Plugins

The plugins are not explicitly declared as Nixvim `plugins.<plugin>` attributes. Instead, they are looked up in and loaded from the [plugins](./plugins) directory.

In short, a lambda will read the files in the directory and use the filename to assign a plugin to the right attribute. Example: `telescope.nix` will be loaded in `config.plugins.telescope`. Custom plugins are also supported, read further.

Each plugin file must export a lambda, which is called with an attribute set containing the `nixpkgs`'s library as `lib`. Plugins may or may not use it. It must return an attribute set which can contain the following attributes:

- `opts`: plugin options as expected by Nixvim
- `rootOpts`: extra options for the root Nixvim `config` attribute
  - this allows to further configure the plugin if it doesn’t expose a given option
- `extra`: custom plugin not supported by Nixvim
  - `extra.packages`: list of packages to be added as `extraPlugins` (ie. `vimPlugins.<plugin>`)
  - `extra.config`: plugin configuration in lua

## Defining the Vault Address

You can define the vault address from outside the `nixvim` configuration by using a parameter or overlay. This allows you to customize the vault address without modifying the core configuration files.

### Using a Parameter

To define the vault address using a parameter, you can pass the `vaultAddress` parameter when importing the `nixvim` module. Here's an example:

```nix
{
  inputs.nixvim-config.url = "github:alkimake/nixvim-config";

  outputs = { nixvim-config, ... }: {
    overlays.additions = final: _prev: {
      nixvim = nixvim-config.packages.${_prev.system}.default {
        vaultAddress = "/path/to/your/vault";
      };

      # Or use the lite version
      # nixvim = nixvim-config.packages.${_prev.system}.lite {
      #   vaultAddress = "/path/to/your/vault";
      # };
    }
  }
}
```

### Using an Overlay

You can also define the vault address using an overlay. This approach allows you to override the default vault address without modifying the core configuration files. Here's an example:

```nix
{
  inputs.nixvim-config.url = "github:alkimake/nixvim-config";

  outputs = { nixvim-config, ... }: {
    overlays.additions = final: _prev: {
      nixvim = final.lib.mkMerge [
        nixvim-config.packages.${_prev.system}.default
        {
          config = {
            vaultAddress = "/path/to/your/vault";
          };
        }
      ];

      # Or use the lite version
      # nixvim = final.lib.mkMerge [
      #   nixvim-config.packages.${_prev.system}.lite
      #   {
      #     config = {
      #       vaultAddress = "/path/to/your/vault";
      #     };
      #   }
      # ];
    }
  }
}
```

### Defining Workspaces

You can define workspaces in the `nixvim` configuration by specifying the `workspaces` setting within the Obsidian plugin configuration. Here's an example:

```nix
{
  inputs.nixvim-config.url = "github:alkimake/nixvim-config";

  outputs = { nixvim-config, ... }: {
    overlays.additions = final: _prev: {
      nixvim = nixvim-config.packages.${_prev.system}.default {
        vaultAddress = "/path/to/your/vault";
        workspaces = [
          {
            name = "work";
            path = "/path/to/your/vault/work";
          }
        ];
      };

      # Or use the lite version
      # nixvim = nixvim-config.packages.${_prev.system}.lite {
      #   vaultAddress = "/path/to/your/vault";
      #   workspaces = [
      #     {
      #       name = "work";
      #       path = "/path/to/your/vault/work";
      #     }
      #   ];
      # };
    }
  }
}
```
