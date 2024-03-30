<h1 align="center">❄️ NixOS Configuration ❄️</h1>
<p align="center">A Flake-powered NixOS setup for Developers with Hyprland</p>

<div align="center">
  <a href="https://github.com/2giosangmitom/dotfiles/stargazers">
    <img src="https://img.shields.io/github/stars/2giosangmitom/dotfiles?style=for-the-badge&logo=starship&color=C9CBFF&logoColor=D9E0EE&labelColor=302D41" />
  </a>
  <a href="https://github.com/2giosangmitom/dotfiles/pulse">
    <img src="https://img.shields.io/github/last-commit/2giosangmitom/dotfiles?style=for-the-badge&logo=github&color=7dc4e4&logoColor=D9E0EE&labelColor=302D41" />
  </a>
  <a href="https://github.com/2giosangmitom/dotfiles/forks">
    <img src="https://img.shields.io/github/forks/2giosangmitom/dotfiles.svg?style=for-the-badge&logo=starship&color=8bd5ca&logoColor=D9E0EE&labelColor=302D41" />
  </a>
  <a>
    <img src="https://img.shields.io/github/repo-size/2giosangmitom/dotfiles?color=%23DDB6F2&label=SIZE&logo=codesandbox&style=for-the-badge&logoColor=D9E0EE&labelColor=302D41" />
  </a>
  <a href="https://github.com/2giosangmitom/dotfiles/blob/master/LICENSE">
    <img src="https://img.shields.io/github/license/2giosangmitom/dotfiles?style=for-the-badge&logo=starship&color=ee999f&logoColor=D9E0EE&labelColor=302D41" />
  </a>
</div>

## Table of Contents

- [Introduction](#introduction)
- [What Awaits You?](#what-awaits-you)
- [Getting Started](#getting-started)
- [Essential NixOS Commands](#essential-nixos-commands)
- [Screenshots](#screenshots)
- [Nix Community Resources](#nix-community-resources)
- [Contributing](#contributing)
- [Acknowledgements](#acknowledgements)

## Introduction

Welcome to my haven of personalized NixOS bliss, featuring the sleek Hyprland window manager and meticulously configured CLI tools! This repository crafts a delightful system experience using the power of flakes and home-manager. With this configuration, you can easily replicate my personalized development environment on any NixOS machine.

## What Awaits You?

- **Flake Repository:** Leverage flakes for a future-proof, modular, and collaborative configuration.
- **Modular Design:** Configuration is organized into modules for easier management and customization.
- **CLI Command Central:** Enjoy a meticulously configured suite of command-line tools for a productive workflow.
  - Pre-configured development tools like alacritty, tmux, and neovim
- **Home-Manager Integration:** Manage user-specific packages and configurations with ease.
- **Hyprland WM:** Embrace the efficient and aesthetically pleasing Hyprland window manager.

## Getting Started

This guide outlines the steps to set up your personalized NixOS environment using this dotfiles repository.

**Prerequisites:**

- **Nix Installed**: Ensure you have Nix installed on your system. Refer to the official documentation for installation instructions: [https://nixos.org/download/](https://nixos.org/download/)
- **Git Installed**: You'll need Git to clone the repository.
- **Flakes Enabled**: NixOS uses flakes as an experimental feature, you should enable it manually.
  - For a more in-depth explanation of enabling flakes in NixOS, refer to this excellent resource: [https://thiscute.world/en/posts/nixos-and-flake-basics/](https://thiscute.world/en/posts/nixos-and-flake-basics/)

**Deployment steps:**

1. **Taking ownership**

Before cloning the repository, ensure your user has ownership of the /etc/nixos directory. Run the following command, replacing `username` with your actual username:

<pre>
sudo chown <i>username</i>:users /etc/nixos
</pre>

2. **Clone the repository**

Get started by cloning this repository into the `/etc/nixos` directory. This command pulls down the configuration files:

```
git clone https://github.com/2giosangmitom/dotfiles.git /etc/nixos
```

3. **Unleash Your Customization Power!**

This configuration lays a robust groundwork for your customized NixOS environment. Dive in and tailor it to suit your unique requirements! With an array of customization options at your disposal, you have the power to shape this configuration into a dynamic and personalized NixOS environment that aligns perfectly with your workflow and preferences. Embrace experimentation and unleash your creativity to make it truly your own!

**Configuration Breakdown:**

- **Home Manager**:

  - User-specific packages and configurations reside within the `./home` directory. This includes Hyprland, CLI tools configuration files for a seamless setup.
  - `./home/default.nix`: This file acts as the entry point for your home manager configuration.

- **Modules**:

  - Shared NixOS configurations that multiple configurations rely on are organized within the `./modules` directory. This promotes reusability and reduces redundancy.

- **Multi-Machine Management**:

  - Manage configurations across different hardware setups using the `./hosts` directory.
  - To generate the `hardware-configuration.nix` file for a specific machine, simply run the following command in your terminal:
    ```bash
    nixos-generate-config
    ```

4. **Rebuild (Applying Changes)**

After making customizations to your configuration, run the following command to rebuild your NixOS system and apply the changes:

```
sudo nixos-rebuild switch
```

## Essential NixOS Commands

This table summarizes some helpful NixOS commands you can run from the root directory of your terminal:

| Command        | Description                                                                                                                                |
| -------------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| `make up`      | Updates the system by installing new packages and configurations.                                                                          |
| `make gc`      | Collects Nix garbage, which removes unused Nix expressions and old generations of your NixOS system. This helps to free up disk space.     |
| `make history` | Displays a history of your NixOS generations, allowing you to view and potentially roll back to previous configurations.                   |
| `make rebuild` | Rebuilds your entire NixOS system based on your current configuration. This is necessary after making changes to your configuration files. |

## Screenshots

<details>
  <summary>Hyprland</summary>
  <div align="center">
    <img src="./screenshots/hyprland.png" />
  </div>
</details>

<details>
  <summary>Rofi</summary>
  <div align="center">
    <img src="./screenshots/rofi_launcher.png" />
    <img src="./screenshots/rofi_powermenu.png" />
  </div>
</details>

## Nix Community Resources

The Nix community is fantastic and offers a wealth of resources to help you on your journey:

- NixOS Discourse: [https://discourse.nixos.org/](https://discourse.nixos.org/)
- NixOS & Flakes Book: [https://nixos-and-flakes.thiscute.world/](https://nixos-and-flakes.thiscute.world/)
- Hyprland Docs: [https://wiki.hyprland.org/](https://wiki.hyprland.org/)
- Flakes Docs: [https://nixos.wiki/wiki/Flakes](https://nixos.wiki/wiki/Flakes)
- Nix Reference Manual: [https://nix.dev/manual/nix/2.18/introduction](https://nix.dev/manual/nix/2.18/introduction)

## Contributing

Contributions are welcome! If you have any suggestions, improvements, or new features to add, feel free to open an issue or pull request.

## Acknowledgements

Special thanks to the NixOS community for their excellent tools and resources, without which this configuration wouldn't be possible.

---

Happy hacking! 🚀
