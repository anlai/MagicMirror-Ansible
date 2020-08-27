# MagicMirror-Ansible
Ansible playbook to setup a [Magic Mirror](https://magicmirror.builders/) installation

This is probably a wholly unnecessary project, but it sets up an instance of Magic Mirror using Ansible.  Goal was to have the entire configuration including setting up modules automated and source controlled.

Automates the manual steps outlined in the [Magic Mirror Manual Installation](https://docs.magicmirror.builders/getting-started/installation.html#alternative-installation-methods) steps.

This automation has been tested on a Raspberry Pi running the latest [Raspberry Pi OS](https://www.raspberrypi.org/downloads/raspberry-pi-os/).  This guide assumes you've already got one and setup the basic desktop installation.

## Setup

There are a couple of prerequisites and customizations that you'll probably want to do in order to get this working for you.

### Clone (and/or fork) This Repository

At a minimum you'll want to clone this repository to your machine (forking will allow you to commit changes for the modules you want).  This guide assumes you'll install it into the default user home directory.

| Path | Purpose |
| --- | --- |
| ~/mm-ansible | The path to clone this Ansible playbook repo |
| ~/magicmirror | The installation path for the Magic Mirror installation |

```
cd ~
git clone git@github.com:anlai/MagicMirror-Ansible.git mm-ansible
```

### Prerequisites

First step is to install the prerequisites for this installation to work, includes Ansible, Python, Pip, and Node.  A script is provided for you, just need to make it executable and install.  (Yes technically Node should be installed by the playbook, but I didn't want to wait for the install to run every time I ran the playbook)

```
cd ~/mm-ansible
chmod +x setup.sh
./setup.sh
```

### Customizations

There are two files you'll want to customize modules.yml and secrets.yml (optional).

**modules.yml** - Module configuration file.  Default in this repo is the default sample (with one added custom module).  You'll want to customize per the specific modules that you want to use.  This file needs to contain an array called modules, using the below table as a guide:

| Property | Required | Purpose |
| --- | --- | ---|
| name | yes | Name of the module |
| position | yes | Location of the module (Options: top_bar, bottom_bar, top_left, bottom_left, top_center, bottom_center, top_right, bottom_right, upper_third, middle_center, lower_third) [Reference Here](https://forum.magicmirror.builders/topic/286/regions) |
| header | no | Display header for module |
| config | no | Additional configuration settings |
| github | no | For custom modules, the Github url to clone for the module source |

**secrets.yml** - Secrets file (for items like API keys and secrets).  Note that this file is in the .gitignore and should not be committed.  You should reference secrets in this file from your modules.yml.

## Install

Once all the customizations are setup, you'll just need to execute the playbook and you should be up and running.  Commands below:

```
cd ~/mm-ansible
ansible-playbook ./main.yml
```

## Startup - Manually

Right now startup is done manually.

```
cd ~/magicmirror
npm start
```