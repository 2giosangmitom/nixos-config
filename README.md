# NixOS Dotfiles ❄️

Welcome to my personal NixOS configuration! This setup is tailored for my daily use with the Sway window manager and includes the management of home configurations using Home-Manager. Additionally, this configuration leverages Nix flakes for improved reproducibility and ease of use. This README will guide you through the structure, components, and instructions to deploy this configuration.

## Table of Contents

1. [Overview](#overview)
2. [Prerequisites](#prerequisites)
3. [Deployment Steps](#deployment-steps)
4. [Configuration Structure](#configuration-structure)
5. [Key Components](#key-components)
6. [Community Resources](#community-resources)
7. [Contributing](#contributing)

## Overview

This repository contains my customized NixOS configuration files aimed at providing a robust and efficient environment for daily tasks. The configuration utilizes the Sway window manager, offering a seamless and dynamic tiling experience. Additionally, Home-Manager is used to manage user-specific configurations and dotfiles, and Nix flakes are used for better reproducibility.

## Prerequisites

Before you begin, ensure you have met the following requirements:
- A basic understanding of NixOS and its configuration system.
- A machine ready to install NixOS.
- Nix with flakes enabled. If flakes are not enabled, you can do so by adding `experimental-features = nix-command flakes` to your `~/.config/nix/nix.conf`.

## Deployment Steps

1. **Taking Ownership 🛠️**

    Before cloning the repository, ensure your user has ownership of the `/etc/nixos` directory. Run the following command, replacing `username` with your actual username:

    ```bash
    sudo chown <username>:users /etc/nixos/**
    ```

2. **Clone the Repository 📥**

    Get started by cloning this repository into the `/etc/nixos` directory. This command pulls down the configuration files:

    ```bash
    git clone https://github.com/2giosangmitom/dotfiles.git /etc/nixos
    ```

3. **Unleash Your Customization Power! 🎨**

    This configuration lays a robust groundwork for your customized NixOS environment. Dive in and tailor it to suit your unique requirements! With an array of customization options at your disposal, you have the power to shape this configuration into a dynamic and personalized NixOS environment that aligns perfectly with your workflow and preferences. Embrace experimentation and unleash your creativity to make it truly your own!

4. **Rebuild (Applying Changes) 🔧**

    After making customizations to your configuration, run the following command to rebuild your NixOS system and apply the changes:

    ```bash
    sudo nixos-rebuild switch --flake .#yourhostname
    ```

## Configuration Structure 🗂️

The repository is organized as follows:
```
dotfiles/
├── backgrounds              # Directory containing background images
│   ├── uwp4227671.jpeg
│   ├── uwp4227673.jpeg
│   └── ...
├── flake.lock               # Nix flake lock file
├── flake.nix                # Starting point for NixOS configuration
├── hosts                    # Directory for host-specific configurations
│   └── nixos
│       └── default.nix      # Host-specific configuration for NixOS
├── Makefile                 # Simplify some command
├── modules                  # Directory containing Nix modules
│   ├── home-manager         # Home-Manager configurations
│   │   ├── alacritty.nix
│   │   ├── default.nix
│   │   ├── dunst.nix
│   │   ├── fastfetch.nix
│   │   ├── git.nix
│   │   ├── lazygit.nix
│   │   ├── rofi             # Rofi configurations
│   │   │   ├── confirm.rasi
│   │   │   ├── launcher.rasi
│   │   │   ├── launch.sh
│   │   │   └── powermenu.rasi
│   │   ├── scripts          # Useful scripts
│   │   │   ├── input_method.sh
│   │   │   ├── random_bg.sh
│   │   │   └── uptime.sh
│   │   ├── shell.nix        # Shell configuration (includes fish, starship)
│   │   ├── sway.nix         # Sway configuration
│   │   └── yazi.nix
│   └── nixos
│       └── default.nix      # Shared NixOS configuration
├── overlays                 # Directory for package overlays
│   └── bob-nvim.nix
└── pkgs                     # Custom packages
    └── bob-nvim.nix
```

## Key Components 🔑

- **Sway Window Manager**: A tiling window manager inspired by i3, but built for Wayland.
- **Waybar**: A customizable status bar for Sway.
- **Nixpkgs**: Custom packages and overlays.
- **Home-Manager**: Manages user-specific configurations and dotfiles.
- **Alacritty**: A fast, cross-platform, OpenGL terminal emulator.
- **fish**: A friendly interactive shell, managed through Home-Manager.
- **Nix Flakes**: For reproducible and manageable configurations.

## Community Resources 📚

- **NixOS & Flakes Book**: [https://nixos-and-flakes.thiscute.world/](https://nixos-and-flakes.thiscute.world/)
- **Flakes Docs**: [https://nixos.wiki/wiki/Flakes](https://nixos.wiki/wiki/Flakes)
- **Nix Reference Manual**: [https://nix.dev/manual/nix/2.18/introduction](https://nix.dev/manual/nix/2.18/introduction)
- **Zero to Nix**: [https://zero-to-nix.com/](https://zero-to-nix.com/)

## Contributing 🤝

Contributions are welcome! If you have any suggestions, feel free to fork the repository and create a pull request. For major changes, please open an issue first to discuss what you would like to change.

---

Thank you for checking out my NixOS configuration! If you encounter any issues or have any questions, please open an issue in this repository.

Happy hacking! 🎉
