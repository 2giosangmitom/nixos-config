# Arch dotfiles managed with Chezmoi

![Stars](https://img.shields.io/github/stars/2giosangmitom/dotfiles?style=for-the-badge&logo=starship&color=C9CBFF&logoColor=D9E0EE&labelColor=302D41)
![Last commit](https://img.shields.io/github/last-commit/2giosangmitom/dotfiles?style=for-the-badge&logo=github&color=7dc4e4&logoColor=D9E0EE&labelColor=302D41)
![Forks](https://img.shields.io/github/forks/2giosangmitom/dotfiles.svg?style=for-the-badge&logo=starship&color=8bd5ca&logoColor=D9E0EE&labelColor=302D41)
![Repo size](https://img.shields.io/github/repo-size/2giosangmitom/dotfiles?color=%23DDB6F2&label=SIZE&logo=codesandbox&style=for-the-badge&logoColor=D9E0EE&labelColor=302D41)
![LICENSE](https://img.shields.io/github/license/2giosangmitom/dotfiles?style=for-the-badge&logo=starship&color=ee999f&logoColor=D9E0EE&labelColor=302D41)

Welcome to my dotfiles repository managed with Chezmoi, customized for my main workspace environment, which combines both Hyprland and Sway! Here, you'll find configurations and scripts to enhance productivity and streamline workflows in this unique setup.

Explore to learn about Chezmoi, get inspired for your Hyprland and Sway workspace, or simply see how these configurations can optimize your Linux experience!

## Table of Contents

- [About Hyprland](#about-hyprland)
- [About Chezmoi](#about-chezmoi)
- [Features](#features)
- [Neovim Configuration](#neovim-configuration)
- [Installation](#installation)
- [Usage](#usage)
- [Customization](#customization)
- [Contributing](#contributing)
- [License](#license)

## About Hyprland

[Hyprland](https://github.com/hyprwm/Hyprland) is a dynamic workspace environment designed for productivity and collaboration. It provides a seamless experience for developers, designers, and other professionals to work efficiently and creatively. With customizable layouts, powerful integrations, and intuitive workflows, Hyprland empowers individuals and teams to achieve their goals effectively.

## About Sway

[Sway](https://github.com/swaywm/sway) is a highly customizable, tiling Wayland compositor inspired by the popular X11 window manager, i3. It allows users to arrange application windows in a non-overlapping layout, maximizing screen real estate and efficiency. Unlike traditional desktop environments, Sway is designed to be lightweight, fast, and entirely configurable using simple text-based configuration files.

## About Chezmoi

[Chezmoi](https://github.com/twpayne/chezmoi) is a versatile dotfiles manager that simplifies the management and synchronization of configuration files across multiple machines. It offers a flexible and secure solution for maintaining consistent setups and workflows, ensuring a smooth experience whether you're working on your local machine or in a shared workspace like Hyprland.

## Features

Here's what you can expect from my dotfiles managed with Chezmoi within the Hyprland workspace:

- **Optimized Workspace Layouts**: Customized configurations for window managers and terminal emulators to maximize screen real estate and facilitate multitasking.
- **Integrated Development Environment**: Configurations for IDEs, text editors, and version control systems tailored for seamless development workflows.
- **Streamlined Automation**: Scripts and aliases to automate common tasks, boost productivity, and streamline repetitive actions within the Hyprland environment.
- **Unified Theming**: Consistent theming across applications for a visually cohesive and aesthetically pleasing workspace experience.

## Neovim Configuration

My Neovim configuration is finely tuned to enhance productivity and streamline coding workflows within the Hyprland workspace. Here are some highlights of my Neovim setup:

- **Plugin Management with lazy.nvim**: I utilize lazy.nvim for efficient plugin management, allowing for on-demand loading of plugins to minimize startup times and optimize performance.
- **Syntax Highlighting with nvim-treesitter**: Leveraging nvim-treesitter for advanced syntax highlighting, providing accurate and context-aware highlighting for various programming languages and file types.
- **Autocompletion with nvim-cmp**: Employing nvim-cmp for intelligent autocompletion, offering fast and accurate suggestions as you type based on context and language semantics.
- **Custom Themes**: Utilizing tokyonight.nvim and lienchi.nvim themes to personalize the appearance of Neovim. These themes provide visually pleasing color schemes and aesthetics, enhancing the editing experience within the Hyprland workspace.
- **Keybindings**: Thoughtfully designed keybindings to expedite common tasks, navigate codebases efficiently, and access Neovim features seamlessly.

Feel free to explore my Neovim configuration files within this repository to gain insights into how I optimize Neovim for my workflow in the Hyprland workspace.

## Installation

To use my dotfiles managed with Chezmoi in the Hyprland workspace, follow these steps:

1. **Install Chezmoi**: If you haven't already, install Chezmoi by following the instructions in the [official documentation](https://www.chezmoi.io/docs/install/).

2. **Clone the Repository**: Clone my dotfiles repository to your local machine.

   ```bash
   git clone https://github.com/2giosangmitom/dotfiles.git ~/.local/share/chezmoi
   ```

3. **Apply configuration**: Apply my dotfiles configuration.

   ```bash
   chezmoi apply
   ```

4. **Customize Configuration**: Customize the configurations to suit your preferences and workflows within the Hyprland workspace.

## Usage

Once installed, you can manage your Hyprland workspace dotfiles with Chezmoi using simple commands. Here are some common tasks:

- **Updating Dotfiles**: Make changes to your dotfiles as needed, and then commit and push them to your repository. Chezmoi will handle syncing the changes across your Hyprland workspace and other machines.
- **Adding New Configurations**: Extend your Hyprland workspace setup by adding new configuration files or directories as needed.
- **Managing Secrets**: Safely manage sensitive information using Chezmoi's encrypted secrets feature within the Hyprland workspace.

For a comprehensive guide on using Chezmoi, refer to the [official documentation](https://www.chezmoi.io/docs/).

## Customization

While my dotfiles are tailored for the Hyprland workspace, they are highly customizable to accommodate different preferences and workflows. Here's how you can tailor them to your needs:

- **Modify Templates**: Customize template files to adjust settings and configurations according to your preferences within the Hyprland environment.
- **Add New Configurations**: Extend your Hyprland workspace setup by adding new configuration files or directories specific to your projects and tools.
- **Share Enhancements**: If you make improvements or additions to my dotfiles configuration for the Hyprland workspace, consider sharing them back with the community by opening a pull request.

## Contributing

Contributions to my dotfiles repository for the Hyprland workspace are welcome! If you have suggestions, enhancements, or bug fixes, feel free to open an issue or submit a pull request. Let's collaborate to make these dotfiles even more effective and versatile for the Hyprland community.

## Hyprland Customization Video

For a visual demonstration of my Hyprland customization, check out my YouTube video: [https://youtu.be/69IiCUjgd04](https://youtu.be/69IiCUjgd04)

## License

This project is licensed under the [MIT License](LICENSE). Feel free to use and modify my dotfiles configuration for the Hyprland workspace to suit your needs.
