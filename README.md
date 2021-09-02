# salter

A Salt Demo using Vagrant.


## Instructions

Run the following commands in a terminal. Git, VirtualBox and Vagrant must already be installed.

```bash
git clone git@github.com:jtprogru/salter.git
cd salter
vagrant plugin install vagrant-vbguest
vagrant vbguest
vagrant up
```

This will download an Ubuntu  VirtualBox image and create three virtual machines for you. One will be a Salt Master named `master` and two will be Salt Minions named `minion1` and `minion2`. The Salt Minions will point to the Salt Master and the Minion's keys will already be accepted. Because the keys are pre-generated and reside in the repo, please be sure to regenerate new keys if you use this for production purposes.

You can then run the following commands to log into the Salt Master and begin using Salt.

```bash
vagrant ssh master
sudo salt '*' test.ping
```

