# git-password-store-remote
A shell script for setting up Password Store and a git repo on a VPS server.

# pass-git-server-setup

A shell script to turn a Linux VPS (or home server) into a secure Git remote for syncing your [`pass`](https://www.passwordstore.org/) password store across devices using SSH and GPG.

## Why use this?

If you're using `pass` as a minimal, terminal-friendly password manager, this script helps you:
- Securely sync your password store between your PC and phone
- Use your own server instead of relying on third-party services
- Follow security best practices: SSH keys, restricted shell access, and least privilege

Perfect for self-hosters, Linux tinkerers, and privacy-focused users.

---

## What the Script Does

- Creates a dedicated `passgit` user with **no shell access**
- Installs your **SSH public key** to allow secure login
- Restricts the user to `git-shell` (only Git commands allowed, no terminal access)
- Sets up a **bare Git repository** in `/home/passgit/password-store.git`

You can then use this VPS (or home server) as a Git remote for syncing your `~/.password-store`.

---

## How to Use

### 1. Clone the repo and run the script

```bash
git clone https://github.com/yourusername/pass-git-server-setup.git
cd pass-git-server-setup
chmod +x setup-passgit-vps.sh
./setup-passgit-vps.sh
