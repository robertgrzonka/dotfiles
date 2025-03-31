
<img src='./dotfiles.svg' width='150px'>

![Test dotfiles install](https://github.com/robertgrzonka/dotfiles/actions/workflows/test-dotfiles.yml/badge.svg)

> Just dotfiles.

Setup script for Warp + ZSH + Starship + VSCode + Git configs.

## Install

```bash
git clone https://github.com/robertgrzonka/dotfiles ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

## Features

- Warp theme styled like Hyper
- Starship prompt with λ and AI-friendly layout
- Dev aliases for Git, Node, React, Next
- Plugins: autosuggestions, syntax highlighting, completions
- Brewfile included with optional AI tools
- VSCode settings and extensions
- ZSH config with custom theme
  
## 🔐 Security Note

This repository **does not** contain any sensitive data such as:
- SSH private keys
- API tokens or secrets
- Personal credentials

Make sure you **do not commit** such information by accident.  
Use `.gitignore` or Git hooks to prevent this from happening.

If you plan to clone and customize this repo, review all files before pushing them public.


## Why?

[Check here](https://dotfiles.github.io).

## License

MIT © [robertgrzonka](robert@theguys.dev)
