# NixOS Dotfiles ❄️

Welcome to my personal NixOS configuration! This setup is tailored for my daily use with the Sway and Hyprland window managers and includes the management of home configurations using Home Manager. Additionally, this configuration leverages Nix flakes for improved reproducibility and ease of use. This README will guide you through the structure, components, and instructions to deploy this configuration.

## Overview 🪲

This repository contains my customized NixOS configuration files aimed at providing a robust and efficient environment for daily tasks. The configuration utilizes the Sway and Hyprland window managers, offering a seamless and dynamic tiling experience. Additionally, Home Manager is used to manage user-specific configurations and dotfiles, and Nix flakes are used for better reproducibility.

![demo](https://i.imgur.com/zh2HeVg.png)

## Prerequisites 🦖

Before you begin, ensure you have met the following requirements:
- A basic understanding of NixOS and its configuration system.
- A machine ready to install NixOS.
- Nix with flakes enabled. If flakes are not enabled, you can do so by adding `experimental-features = nix-command flakes` to your `~/.config/nix/nix.conf`.

## Deployment Steps 🚀

### 1. Taking Ownership 🐊

Before cloning the repository, ensure your user has ownership of the `/etc/nixos` directory. Run the following command, replacing `username` with your actual username:

```bash
sudo chown <username>:users /etc/nixos/**
```

### 2. Clone the Repository 📥

Get started by cloning this repository into the `/etc/nixos` directory. This command pulls down the configuration files:

```bash
git clone https://github.com/2giosangmitom/dotfiles.git /etc/nixos
```

### 3. Customize Your Configuration 🎨

This configuration lays a robust groundwork for your customized NixOS environment. Dive in and tailor it to suit your unique requirements! With an array of customization options at your disposal, you have the power to shape this configuration into a dynamic and personalized NixOS environment that aligns perfectly with your workflow and preferences. Embrace experimentation and unleash your creativity to make it truly your own!

### 4. Rebuild (Applying Changes) 🔧

After making customizations to your configuration, run the following command to rebuild your NixOS system and apply the changes:

```bash
sudo nixos-rebuild switch --flake .#yourhostname
```

## Layout 🌳

The repository is organized as follows:

```
.
├── backgrounds                       # Directory containing background images
│   └── ...
├── home                              # Home Manager configurations and scripts
│   ├── programs                      # Configurations for various programs
│   │   └── ...
│   ├── window-manager                # Window manager configurations and scripts
│   │   ├── scripts                   # Scripts for window manager
│   │   │   └── ...
│   │   └── ...
│   ├── default.nix                   # Default home configuration
│   ├── lib.nix                       # Library functions for home configuration
│   └── ...
├── hosts                             # Host-specific configurations
│   ├── lib.nix                       # Library functions for host configuration
│   └── ...
├── nixos                             # System-wide NixOS configurations
│   ├── common                        # Common configurations shared across systems
│   │   └── ...
│   ├── window-manager                # System-wide window manager configurations
│   │   └── ...
│   ├── default.nix                   # System-wide configuration
│   └── ...
├── pkgs                              # Custom package definitions
│   ├── overlays.nix                  # Nixpkgs overlay definitions
│   └── ...
├── templates                         # Simple `flake.nix` templates for various projects
│   ├── golang                        # Go language project template
│   │   └── flake.nix
│   ├── nodejs                        # Node.js project template
│   │   └── flake.nix
│   ├── rust                          # Rust language project template
│   │   └── flake.nix
│   └── default.nix
├── flake.nix                         # Entry point for NixOS configuration
├── Makefile                          # Simplified commands for NixOS
└── ...
```

## Community Resources 📚

- **NixOS & Flakes Book**: [https://nixos-and-flakes.thiscute.world/](https://nixos-and-flakes.thiscute.world/)
- **Flakes Docs**: [https://nixos.wiki/wiki/Flakes](https://nixos.wiki/wiki/Flakes)
- **Nix Reference Manual**: [https://nix.dev/manual/nix/2.22/](https://nix.dev/manual/nix/2.22/)
- **Zero to Nix**: [https://zero-to-nix.com/](https://zero-to-nix.com/)
- **MyNixOS**: [https://mynixos.com/](https://mynixos.com/)
- **Nix Pills**: [https://nixos.org/guides/nix-pills/](https://nixos.org/guides/nix-pills/)

---

Thank you for checking out my NixOS configuration! If you encounter any issues or have any questions, please open an issue in this repository.

Happy hacking! 🎉
