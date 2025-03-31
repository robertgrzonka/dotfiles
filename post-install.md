# 🛠️ Post Install Steps – dotfiles

After `install.sh`, do these steps (if they're not automated yet):

---

## 1. 🔑 SSH Keys

If its new machine, you need to generate SSH keys. If you already have them, skip this step.:

```bash
ssh-keygen -t ed25519 -C "your-email@domain.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
pbcopy < ~/.ssh/id_ed25519.pub
```

Then, add the SSH key to your GitHub account:
- Go to GitHub > Settings > SSH and GPG keys
- Click on "New SSH key"
- Paste the key you copied from the terminal
- Give it a title (e.g., "My MacBook Pro")
- Click "Add SSH key"
  
---

## 2. 🔑 GH Auth Login

```bash
gh auth login
```

- Select `GitHub.com`
- Select `SSH` as the protocol
- Select `GitHub CLI` as the authentication method
- Follow the prompts to authenticate with your GitHub account
