# NixOS Dotfiles ❄️

This repository contains my personal NixOS configuration, optimized for daily use with the Sway window manager. It uses Home Manager for managing user-specific configurations and dotfiles, and leverages Nix flakes for improved reproducibility.

## Overview 🪲

- **Window Manager:** Sway
- **Configuration Management:** Home Manager
- **Reproducibility:** Nix flakes

## Prerequisites 🦖

- Basic understanding of NixOS.
- A machine ready to install NixOS.
- Nix with flakes enabled (`experimental-features = nix-command flakes` in `~/.config/nix/nix.conf`).

## Deployment Steps 🚀

1. **Take Ownership:** Ensure your user has ownership of `/etc/nixos`.
   ```bash
   sudo chown <username>:users /etc/nixos/**
   ```

2. **Clone the Repository:**
   ```bash
   git clone https://github.com/2giosangmitom/dotfiles.git /etc/nixos
   ```

3. **Customize & Rebuild:** Tailor the configuration and apply changes.
   ```bash
   sudo nixos-rebuild switch --flake .#yourhostname
   ```

## Layout 🌳

- **backgrounds/**: Wallpaper files.
- **home/**: User-specific configurations (Sway, scripts, programs).
- **hosts/**: Machine-specific configurations.
- **nixos/**: System-wide configurations.

## Resources 📚

- [NixOS & Flakes Book](https://nixos-and-flakes.thiscute.world/)
- [Flakes Docs](https://nixos.wiki/wiki/Flakes)
- [Zero to Nix](https://zero-to-nix.com/)

---

If you have any questions or issues, please open an issue in this repository.

Happy hacking! 🎉
