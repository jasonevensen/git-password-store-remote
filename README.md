# pass-git-server-setup

A simple shell script to set up a secure, self-hosted Git remote for syncing your [`pass`](https://www.passwordstore.org/) password manager across devices using SSH and GPG.

---

## Why Use This?

If you're using `pass` to manage your passwords, this script lets you:

- Securely sync your `~/.password-store` with your own Git server
- Avoid cloud-based providers like GitHub or GitLab
- Restrict access to Git only — no shell access for the sync user
- Use strong authentication via SSH keys and GPG encryption

Perfect for privacy-conscious users, Linux tinkerers, and self-hosters who want total control over their password syncing setup.

---

## What This Script Does

This script automates:

1. Creating a **dedicated Git-only user** (default: `passgit`)
2. Installing your **SSH public key** for secure access
3. Restricting the user to **`git-shell`** (no regular shell access)
4. Creating a **bare Git repository** at `/home/passgit/password-store.git`

Once set up, you can use this Git repo to sync your password store between your PC and mobile device (e.g., using the [Password Store app](https://github.com/android-password-store/)).

---

## Usage

### 1. Clone This Repo & Run the Script

```bash
git clone https://github.com/yourusername/pass-git-server-setup.git
cd pass-git-server-setup
chmod +x setup-passgit-vps.sh
./setup-passgit-vps.sh
```

By default, the script:
- Uses your existing `~/.ssh/id_ed25519.pub`
- Creates a `passgit` user
- Sets up the Git remote at `/home/passgit/password-store.git`

You can edit the script to customize usernames or key paths.

---

### 2. On Your Local Machine

Initialize `pass` with your GPG key and set up Git:

```bash
pass init YOUR_GPG_KEY_ID
cd ~/.password-store
git init
git remote add origin passgit@your-vps:/home/passgit/password-store.git
git add .
git commit -m "Initial commit"
git push -u origin master
```

---

### 3. On Your Android Device (Optional)

Using the [Password Store](https://play.google.com/store/apps/details?id=dev.msfjarvis.aps) app:

- Import your GPG key
- Add your SSH key to the VPS
- Sync with the Git remote you set up (`ssh://passgit@your-vps:/home/passgit/password-store.git`)

TODO: flesh this out a bit more and make sure it works.

---

## Security Recommendations

- Use **SSH key authentication only**
- Disable root SSH access on your VPS
- Set up a firewall (UFW, nftables, etc.)
- Monitor access logs
- Consider backups of both the Git repo and your GPG keys

---

## License

Apache 2 — feel free to use, modify, and share.

---

## Author

Script by [Jason](https://github.com/jasonevensen).

Blog post and walkthrough: - coming soon on [packetsandcode.com](https://packetsandcode.com)
