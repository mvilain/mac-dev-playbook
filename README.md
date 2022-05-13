# Mac Development Ansible Playbook

cloned from [guy geerling's playbook](https://github.com/geerlingguy/mac-dev-playbook)

This playbook installs and configures most of the software I use on my Mac for web and software development. Some things in macOS are slightly difficult to automate, so I still have a few manual installation steps, but at least it's all documented here.

## Installation

  1. Ensure Apple's command line tools are installed (`xcode-select --install` to launch the installer).
  2. [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/index.html):

     1. Run the following command to add Python 3 to your $PATH: `export PATH="$HOME/Library/Python/3.8/bin:/opt/homebrew/bin:$PATH"`
     2. Upgrade Pip: `sudo pip3 install --upgrade pip`
     3. Install Ansible: `pip3 install ansible`

  3. Clone or download this repository to your local drive.
  4. Run `ansible-galaxy install -r requirements.yml` inside this directory to install required Ansible roles.
  5. Run `ansible-playbook main.yml --ask-become-pass` inside this directory. Enter your macOS account password when prompted for the 'BECOME' password.

> Note: If some Homebrew commands fail, you might need to agree to Xcode's license or fix some other Brew issue. Run `brew doctor` to see if this is the case.

### Use with a remote Mac

You can use this playbook to manage other Macs as well; the playbook doesn't even need to be run from a Mac at all! If you want to manage a remote Mac, either another Mac on your network, or a hosted Mac like the ones from [MacStadium](https://www.macstadium.com), you just need to make sure you can connect to it with SSH:

  1. (On the Mac you want to connect to:) Go to System Preferences > Sharing.
  2. Enable 'Remote Login'.

> You can also enable remote login on the command line:
>
>     sudo systemsetup -setremotelogin on

Then edit the `inventory` file in this repository and change the line that starts with `127.0.0.1` to:

```
[ip address or hostname of mac]  ansible_user=[mac ssh username]
```

If you need to supply an SSH password (if you don't use SSH keys), make sure to pass the `--ask-pass` parameter to the `ansible-playbook` command.

### Running a specific set of tagged tasks

You can filter which part of the provisioning process to run by specifying a set of tags using `ansible-playbook`'s `--tags` flag. The tags available are `dotfiles`, `homebrew`, `mas`, `extra-packages` and `osx`.

    ansible-playbook main.yml -K --tags "dotfiles,homebrew"

## Overriding Defaults

Not everyone's development environment and preferred software configuration is the same.

You can override any of the defaults configured in `default.config.yml` by creating a `config.yml` file and setting the overrides in that file. For example, you can customize the installed packages and apps with something like:

```yaml
homebrew_installed_packages:
  - cowsay
  - git
  - go

mas_installed_apps:
  - { id: 443987910, name: "1Password" }
  - { id: 498486288, name: "Quick Resizer" }
  - { id: 557168941, name: "Tweetbot" }
  - { id: 497799835, name: "Xcode" }

composer_packages:
  - name: hirak/prestissimo
  - name: drush/drush
    version: '^8.1'

gem_packages:
  - name: bundler
    state: latest

npm_packages:
  - name: webpack

pip_packages:
  - name: mkdocs

configure_dock: true
dockitems_remove:
  - Launchpad
  - TV
dockitems_persist:
  - name: "Sublime Text"
    path: "/Applications/Sublime Text.app/"
    pos: 5
```

Any variable can be overridden in `config.yml`; see the supporting roles' documentation for a complete list of available variables.

## Included Applications / Configuration (Default)

Applications (installed with Homebrew Cask):

  - [1password-cli](https://developer.1password.com/docs/cli/)
  - [A Better Finder Attributes](https://www.publicspace.net/ABetterFinderAttributes/)
  - [a better finder rename](https://www.publicspace.net/ABetterFinderRename/)
  - [Alfred](https://www.alfredapp.com/)
  - [Anki](https://apps.ankiweb.net/)
  - [Another Redis Desktop Manager](https://github.com/qishibo/AnotherRedisDesktopManager/)
  - [Audacity](https://www.audacityteam.org/)
  - [Audiobook Builder](https://www.splasm.com/audiobookbuilder/)
  - [Authy](https://authy.com/)
  - [Balenaetcher](https://balena.io/etcher)
  - [Brave Browser](https://brave.com/)
  - [Busycal](https://busymac.com/busycal)
  - [Busycontacts](https://www.busymac.com/busycontacts)
  - [Cmake](https://www.cmake.org/)
  - [Cyberduck](https://cyberduck.io/)
  - [Dbeaver Community](https://dbeaver.io/)
  - [Default Folder X](https://www.stclairsoft.com/DefaultFolderX/)
  - [Dropbox](https://www.dropbox.com/)
  - [EtreCheckPro](https://etrecheck.com/)
  - [Firefox](https://www.mozilla.org/en-US/firefox/new/)
  - [Fliqlo](https://fliqlo.com/)
  - [Github Desktop](https://desktop.github.com/)
  - [Google Chrome](https://www.google.com/chrome/)
  - [Google Drive](https://www.google.com/drive/)
  - [Google Web Designer](https://www.google.com/webdesigner/)
  - [Gotomeeting](https://www.goto.com/meeting)
  - [Grandperspective](https://grandperspectiv.sourceforge.io/)
  - [Graphicconverter](https://www.lemkesoft.de/en/products/graphicconverter/)
  <!-- - [Handbrake](https://handbrake.fr/) # req Xcode 10.3 -->
  - [Imazing](https://imazing.com/)
  - [Intellij IDEA](https://www.jetbrains.com/idea/)
  - [Jitsi Meet](https://github.com/jitsi/jitsi-meet-electron/)
  - [Joplin](https://joplinapp.org/)
  - [Kdiff3](https://invent.kde.org/sdk/kdiff3)
  - [Keka](https://www.keka.io/)
  - [Keyboard Maestro](https://www.keyboardmaestro.com/main/)
  - [Launchcontrol](https://www.soma-zone.com/LaunchControl/)
  - [Macfuse](https://osxfuse.github.io/)
  <!-- - [MacVim](http://macvim-dev.github.io/macvim/) # installs to many dependencies on 10.13 -->
  - [mdimagesizemdimporter](https://github.com/Nyx0uf/qlImageSize)
  - [Mediahuman Youtube Downloader](https://www.mediahuman.net/youtube-video-downloader/)
  - [Meteorologist](https://heat-meteo.sourceforge.io/)
  - [Microsoft Teams](https://teams.microsoft.com/downloads)
  - [mullvadvpn](https://mullvad.net/)
  - [Neofinder](https://www.cdfinder.de/)
  - [Ngrok](https://ngrok.com/)
  - [nvALT](http://brettterpstra.com/projects/nvalt/)
  - [Opera](https://www.opera.com/)
  - [Pacifist](https://www.charlessoft.com/)
  - [qlimagesize](https://github.com/Nyx0uf/qlImageSize)
  - [rar](https://www.rarlab.com/)
  - [Scrivener](https://www.literatureandlatte.com/scrivener/overview)
  - [Signal](https://signal.org/)
  - [Skype](https://www.skype.com/)
  - [Steermouse](https://plentycom.jp/en/steermouse/)
  - [Sublime Merge](https://www.sublimemerge.com/)
  - [Sublime Text](https://www.sublimetext.com/)
  - [Superduper!](https://www.shirt-pocket.com/SuperDuper/SuperDuperDescription.html)
  - [TG Pro](https://www.tunabellysoftware.com/tgpro/)
  - [The Unarchiver](https://theunarchiver.com/)
  - [Tor Browser](https://www.torproject.org/)
  - [Torguard](https://torguard.net/)
  - [Typora](https://typora.io/)
  - [Usenapp](https://www.usenapp.com/)
  - [Vagrant](https://www.vagrantup.com/)
  - [Veracrypt](https://www.veracrypt.fr/)
  - [VLC](https://www.videolan.org/vlc/)
  - [Vuescan](https://www.hamrick.com/)
  - [Webex](https://www.webex.com/)
  - [WhatRoute](https://www.whatroute.net/)
  - [xquartz](https://www.xquartz.org/)
  - [XRG](https://gauchosoft.com/Products/XRG)
  - [Youtube To MP3](https://www.mediahuman.net/youtube-to-mp3/)
  - [Zenmap](https://nmap.org/zenmap/)
  - [Zoom](https://www.zoom.us/)

Packages (installed with Homebrew):

- autoconf
- autoconf-archive
- automake
- bash
- bison
- boundary
- brotli
- ca-certificates
- cfssl
- cmake-docs
- consul
- coreutils
- curl
- dateutils
- dc3dd
- docker-machine
- docutils
- envconsul
- findutils
- fping
- gawk
- gdbm
- gettext
- gh
- git
- gmp
- go
- go-bindata
- helm
- htop
- intltool
- jq
- kops
- kubernetes-cli
- libevent
- libidn2
- libnghttp2
- libpng
- libssh2
- libtool
- libunistring
- libusb
- libyaml
- logrotate
- lzip
- m4
- mcrypt
- mhash
- minikube
- mosh
- mpdecimal
- mpfr
- ncurses
- nginx
- nmap
- nomad
- oniguruma
- openldap
- openssl@1.1
- openssl@3
- p7zip
- packer
- pcre
- pcre2
- pkg-config
- popt
- protobuf
- python@3.10
- rbenv
- rclone
- readline
- rtmpdump
- ruby-build
- ruby@2.7
- six
- sphinx-doc
- sqlite
- ssh-copy-id
- telnet
- telnetd
- terraform
- terraform-docs
- terragrunt
- tmux
- tnftp
- tnftpd
- tree
- utf8proc
- vagrant-completion
- vault
- watch
- waypoint
- wget
- xz
- yamllint
- youtube-dl
- zsh
- zstd


Finally, there are a few other preferences and settings added on for various apps and services.

## Future additions

### Things that still need to be done manually

It's my hope that I can get the rest of these things wrapped up into Ansible playbooks soon, but for now, these steps need to be completed manually (assuming you already have Xcode and Ansible installed, and have run this playbook).

  1. Install all the apps that aren't yet in this setup (see below).
  2. Remap Caps Lock to Escape (requires macOS Sierra 10.12.1+).
  3. Set trackpad tracking rate.
  4. Set mouse tracking rate.
  5. Configure extra Mail and/or Calendar accounts (e.g. Google, etc.).

### Configuration to be added:

## Testing the Playbook

Many people have asked me if I often wipe my entire workstation and start from scratch just to test changes to the playbook. Nope! Instead, I posted instructions for how I build a [Mac OS X VirtualBox VM](https://github.com/geerlingguy/mac-osx-virtualbox-vm), on which I can continually run and re-run this playbook to test changes and make sure things work correctly.

## Ansible for DevOps

Check out [Ansible for DevOps](https://www.ansiblefordevops.com/), which teaches you how to automate almost anything with Ansible.

## Author

This project was created by [Jeff Geerling](https://www.jeffgeerling.com/) (originally inspired by [MWGriffin/ansible-playbooks](https://github.com/MWGriffin/ansible-playbooks)).

Modified by Michael Vilain for his environment
