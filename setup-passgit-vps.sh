#!/bin/bash

# Exit on error
set -e

GIT_USER="passgit"
REPO_NAME="password-store.git"
SSH_PUBKEY_PATH="$HOME/.ssh/id_ed25519.pub"  # Adjust if needed

# 1. Create a dedicated git user
sudo adduser --disabled-password --gecos "" $GIT_USER

# 2. Create .ssh directory and authorized_keys
sudo -u $GIT_USER mkdir -p /home/$GIT_USER/.ssh
sudo cp $SSH_PUBKEY_PATH /home/$GIT_USER/.ssh/authorized_keys
sudo chown -R $GIT_USER:$GIT_USER /home/$GIT_USER/.ssh
sudo chmod 700 /home/$GIT_USER/.ssh
sudo chmod 600 /home/$GIT_USER/.ssh/authorized_keys

# 3. Limit user to git-shell
echo "$GIT_USER:$(which git-shell)" | sudo tee -a /etc/shells > /dev/null
sudo chsh -s $(which git-shell) $GIT_USER

# 4. Create a bare git repo
sudo -u $GIT_USER mkdir -p /home/$GIT_USER/$REPO_NAME
sudo -u $GIT_USER git init --bare /home/$GIT_USER/$REPO_NAME

echo
echo "=== Git remote setup complete! ==="
echo "To use it from your PC:"
echo "1. Add remote to your password-store:"
echo "   git remote add origin $GIT_USER@your-vps:/home/$GIT_USER/$REPO_NAME"
echo "2. Then run:"
echo "   git push -u origin master"
