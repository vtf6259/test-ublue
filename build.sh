#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y vim
dnf5 install -y fastfetch
dnf5 install -y sway
dnf5 install -y tmux
dnf5 install -y NetworkManager
dnf5 install -y dhclient
dnf5 install -y flatpak
dnf5 install -y alacritty
curl -fsSL https://raw.githubusercontent.com/vtf6259/test-ublue/refs/heads/main/downloadfiles/boot.mount > /etc/systemd/system/boot.mount
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub app.zen_browser.zen -y
# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable boot.mount
systemctl enable NetworkManager
