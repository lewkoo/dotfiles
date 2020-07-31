Levko's dotfiles
========

![Unit Tests](https://github.com/lewkoo/dotfiles/workflows/Unit%20Tests/badge.svg)
![Integration Tests](https://github.com/lewkoo/dotfiles/workflows/Integration%20Tests/badge.svg)
![Verify Install](https://github.com/lewkoo/dotfiles/workflows/Verify%20Install/badge.svg)

Sets up a full local development environment with a **single command.**

Support for OS X and Debian.

Tested on:

<!-- ![https://en.wikipedia.org/wiki/MacOS][osx_logo] -->

![https://en.wikipedia.org/wiki/Ubuntu_version_history#Ubuntu_16.04_LTS_(Xenial_Xerus)][ubuntu_xenial_logo]

![https://en.wikipedia.org/wiki/Ubuntu_version_history#Ubuntu_18.04_LTS_(Bionic_Beaver)][ubuntu_bionic_logo]

![https://en.wikipedia.org/wiki/Ubuntu_version_history#Ubuntu_20.04_LTS_(Focal_Fossa)][ubuntu_focal_fossa_logo]

Installs and configures
-------------------

- fish shell with ohmyfish and bobthefish theme
- nice fonts for the terminal and coding
- python2, python3, pipx (for managing python CLIs), pyenv (for managing Python versions), and pyenv-virtualenv (for managing virtualenvs)
- a tmux.conf that's pretty neat.
- bat as a more modern replacement for cat
- exa as a more modern replacement for ls
- docker
- go-lang
- github hub tool
- node-js
- jetbrains-toolbox and pycharm
- Mac packages installed with [homebrew][]. Mac apps installed with [homebrew-cask][] and [mas][].
- Basic Ubuntu packages from both APT and Snap and [ROS](http://wiki.ros.org) setup. 
- Useful git aliases.
- Optional git commit signing with GPG
- Roles are unit tested and integration tested by [molecule](https://molecule.readthedocs.io/en/latest/).
- pluggable. Everything is optional. Fork this. Remove what you don't use. Configure what you do use.

prerequisites
-------------

Ansible version >= 2.8 is *required*.

OS X:

- homebrew (If on macOS) - **Install this first**
- git: `brew install git`
- ansible >= 1.6: `brew install ansible`

Ubuntu:

- Updated apt cache: `apt update`
- git: `apt install git`
- ansible: `apt install ansible`
  
> Note: On Ubuntu systems, Ansible can be updated as follows: 
>

> ```bash
> sudo apt-add-repository -yu ppa:ansible/ansible
> sudo apt-get install ansible
> ```

install
-------

- [Fork](https://github.com/sloria/dotfiles/fork) this repo.
- Clone your fork.

```bash
# Replace git url with your fork
# NOTE: It is important that you clone to ~/dotfiles
git clone https://github.com/YOU/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

- Update the following variables in `group_vars/local` (at a minimum)
  - `full_name`: Your name, which will be attached to commit messages, e.g. "Steven Loria"
  - `git_user`: Your Github username.
  - `git_email`: Your git email address.
- Optional, but recommended: Update `group_vars/local` with the programs you want installed by [homebrew][], [homebrew-cask][], and npm.
  - `mac_homebrew_packages`:  Utilities that don't get installed by the roles.
  - `mac_cask_packages`: Mac Apps you want installed with [homebrew-cask][].
- Optional, but recommended: Update `group_vars/local` with the programs you want installed by APT and Snap (when running on Ubuntu).
  - `ubuntu_apt_packages`:  Utilities that don't get installed by the roles.
  - `ubuntu_snap_packages`: Ubuntu apps you want installed with snap.
- Edit `local_env.yml` as you see fit. Remove any roles you don't use. Edit roles that you do use.

GPG Signature setup
-------------------

On source machine with your private key, do the following:  

```bash
# Bash syntax here
ID=FF7E2F5B2137632F # Replace this with your key ID
gpg --export ${ID} > public.asc
gpg --export-secret-key ${ID} > private.asc
```

Transfer those two two files to your target machine and run: 

```bash
# Bash syntax here
gpg --import public.asc
gpg --import private.asc
export GIT_SIGNING_KEY_ID=FF7E2F5B2137632F # Same key ID as on source machine
```

Note: After running the dot-bootstrap script, you should put
```bash
export GIT_SIGNING_KEY_ID=FF7E2F5B2137632F
```
line in `~/.localrc` or `~/.config/fish/config.fish`.

Run the installation script
-------------------

```bash
./bin/dot-bootstrap
```

Updating your local environment
-------------------------------

Once you have the dotfiles installed you can run the following command to rerun the ansible playbook:

```bash
dot-update
```

You can optionally pass role names

```bash
dot-update git python
```

Updating your dotfiles repo
---------------------------

To keep your fork up to date with the `lewkoo` fork:

```
git remote add lewkoo https://github.com/lewkoo/dotfiles.git
git pull lewkoo master
```

Test
-------

All tests must be run under a new virtual environment with these installed:

```bash
pip install "molecule[lint]"
pip install "molecule[docker]"
```

Run Unit tests:

```bash
./bin/test
```

Run Integration tests:

```bash
./bin/test
```

Commands
--------

There are three main commands in the `bin` directory for setting up and updating development environments:

- `dot-bootstrap`: sets up local environment by executing all roles in `local_env.yml`.
- `dot-update`: updates local environment by executing all roles in `local_env.yml` except for the ones tagged with "bootstrap".

special files
-------------

All configuration is done in `~/dotfiles`. Each role may contain (in addition to the typical ansible directories and files) a number of special files

- **role/\*.zsh**: Any files ending in `.zsh` get loaded into your environment.
- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made available everywhere.

<!-- notes
----- -->

<!-- **vscode**

I use the [Settings Sync](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync) extension to sync my VSCode setup.
My settings are uploaded here: https://gist.github.com/sloria/1256526bc7e1a52d3c14954d1d26740b -->

<!-- **iterm2**

To import the iterm2 profile, go to your iterm2 preferences, and enable "Load preferences from custom folder" and select the iterm2 folder in the `misc/` directory.

![iterm2 profile](https://user-images.githubusercontent.com/2379650/34223487-859f2752-e58d-11e7-8024-9e6af5c1ec4e.png) -->

<!-- **macOS keyboard settings**

There are a few keyboard customizations that must be done manually:

- Turning repeat speed up to 11.

![Keyboard settings](https://user-images.githubusercontent.com/2379650/34223505-91f95072-e58d-11e7-9b36-78aec4203b0d.png "Key repeat settings") -->

<!-- 
- Mapping Caps Lock to Ctrl.

![Modifier keys](https://user-images.githubusercontent.com/2379650/34223523-a2c8e4e4-e58d-11e7-9532-d74b95d8408a.png) -->

<!-- **login message**

You can add a message to the login screen using the following command:

```
sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "This laptop is connected to an iCloud account and is valueless if lost. Contact (123) 456-7890 if found. Reward included."
``` -->

<!-- troubleshooting
--------------- -->

<!-- If you get an error about Xcode command-line tools, you may need to run -->

<!-- ``` -->
<!-- sudo xcode-select -s /Applications/Xcode.app/Contents/Developer -->
<!-- ``` -->

<!-- If pyenv versions fail to install, try the steps here: -->

<!-- https://github.com/pyenv/pyenv/issues/1219#issuecomment-459333831 -->

<!-- If python environments break after upgrading brew-installed python, rehash pyenv and re-install pipx environments -->

<!-- ``` -->
<!-- pyenv rehash


mv ~/.local/bin ~/.local/bin.bak
mv ~/.local/pipx ~/.local/pipx.bak

dot-update pipx -->
<!-- ``` -->

TODO
----

- Full testing on Mac OS X

[homebrew]: http://brew.sh/
[homebrew-cask]: https://github.com/caskroom/homebrew-cask
[mas]: https://github.com/mas-cli/mas

license
-------

[MIT Licensed](https://levko-ivanchuk.mit-license.org).

[osx_logo]: https://img.shields.io/badge/OSX-alpha-critical?style=for-the-badge&logo=apple "OS X badge"
[ubuntu_xenial_logo]: https://img.shields.io/badge/Ubuntu16.04LTS-alpha-critical?style=for-the-badge&logo=ubuntu "Ubuntu 16.04 LTS badge"
[ubuntu_bionic_logo]: https://img.shields.io/badge/Ubuntu18.04LTS-alpha-critical?style=for-the-badge&logo=ubuntu "Ubuntu 18.04 LTS badge"
[ubuntu_focal_fossa_logo]: https://img.shields.io/badge/Ubuntu20.04LTS-alpha-critical?style=for-the-badge&logo=ubuntu "Ubuntu 20.04 LTS badge"