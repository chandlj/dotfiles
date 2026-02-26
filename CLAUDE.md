# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles repository using [Dotbot](https://github.com/anishathalye/dotbot) for automated symlink management and machine bootstrapping. Supports macOS (zsh/oh-my-zsh) and remote Linux machines (bash/starship).

## Install Command

```sh
./install
```

This runs Dotbot which reads `install.conf.yaml` to: install oh-my-zsh, run `brew bundle`, update git submodules, install Rust, then create symlinks.

## Repository Structure

- `install.conf.yaml` — Dotbot config: defines shell commands to run, symlinks to create, and directories to clean. **This is the central config file.**
- `install` — Thin wrapper that bootstraps Dotbot and runs the config.
- `zsh/zshrc` — Main zsh configuration, symlinked to `~/.zshrc`. Uses powerlevel10k theme with oh-my-zsh.
- `zsh/p10k.zsh` — Powerlevel10k prompt config, symlinked to `~/.p10k.zsh`.
- `bash/bashrc` — Bash configuration for remote Linux machines, symlinked to `~/.bashrc`. Uses starship prompt.
- `bash/bash_profile` — Login shell config that sources bashrc.
- `starship.toml` — Starship prompt config, symlinked to `~/.config/starship.toml`.
- `tmux.conf` — Tmux configuration, symlinked to `~/.tmux.conf`.
- `brew/Brewfile` — Homebrew packages and casks.
- `gitconfig` — Git configuration (not currently symlinked via Dotbot).
- `oh-my-zsh/` — Custom oh-my-zsh plugins and themes, included as git submodules and symlinked into `~/.oh-my-zsh/custom/`.
- `iterm/` — iTerm2 preferences plist.
- `Dockerfile` — Ubuntu-based container for testing the install process.

## Key Conventions

- **Zsh plugins as git submodules**: zsh-autosuggestions, zsh-completions, zsh-syntax-highlighting, and powerlevel10k are tracked in `.gitmodules` under `oh-my-zsh/custom/`. Add new custom plugins the same way.
- **Symlinks go in `install.conf.yaml`**: When adding a new dotfile, add both the file and its symlink entry in the `link:` section of `install.conf.yaml`.
- **Brew packages go in `brew/Brewfile`**: Use `brew` for CLI tools and `cask` for GUI apps.
- **Aliases belong in the shell rc files**: Zsh aliases in `zsh/zshrc`, bash aliases in `bash/bashrc`. The `oh-my-zsh/aliases.sh` file is unused.
- **Bash and zsh configs are standalone**: Each has its own copies of shared settings (PATH, EDITOR, etc.) rather than sourcing a common file.

## Sensitive Values

Secrets and machine-specific environment variables go in `~/.env.local`, which is sourced by `zsh/zshrc` but lives outside this repo. Never add tokens, passwords, or API keys directly to tracked files.
