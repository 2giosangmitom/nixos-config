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

## Introduction

Welcome to my haven of personalized NixOS bliss, featuring the sleek Hyprland window manager and meticulously configured CLI tools! This repository crafts a delightful system experience using the power of flakes and home-manager. With this configuration, you can easily replicate my personalized development environment on any NixOS machine.

## What Awaits You?

- **Flake Repository:** Leverage flakes for a future-proof, modular, and collaborative configuration.
- **Modular Design:** Configuration is organized into modules for easier management and customization.
- **CLI Command Central:** Enjoy a meticulously configured suite of command-line tools for a productive workflow.
  - Pre-configured development tools like Git, tmux, and neovim
- **Home-Manager Integration:** Manage user-specific packages and configurations with ease.
- **Hyprland WM:** Embrace the efficient and aesthetically pleasing Hyprland window manager.

## Getting Started

1. **Take ownership of `/etc/nixos`**

<pre>
chown <b>username</b>:users /etc/nixos
</pre>

> [!NOTE]
> Replace **username** with your username

3. **Clone the repository**

   ```
   git clone https://github.com/2giosangmitom/dotfiles.git /etc/nixos
   ```

## Screenshots

<details>
  <summary>Hyprland</summary>
  <img src="./screenshots/hyprland.png" />
</details>

## Contributing

Contributions are welcome! If you have any suggestions, improvements, or new features to add, feel free to open an issue or pull request.

## Acknowledgements

Special thanks to the NixOS community for their excellent tools and resources, without which this configuration wouldn't be possible.

---

Happy hacking! 🚀
