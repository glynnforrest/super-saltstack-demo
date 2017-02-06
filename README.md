# Super Saltstack Demo

Vagrant boxes to demo during my talk 'Super Saltstack'.

## Getting started

Install vagrant, then run `vagrant up`.

Two VMs will start - a salt-master, and a minion running nginx to serve a basic web page.

For the purposes of this demo, they will NOT be communicating yet.
The minion will not be provisioned.

Additionally, the host machine running vagrant should have a
salt-minion and a webcam reachable with the `imagesnap` command.
A suitable minion config for the machine is at `minion/host`.
This minion should have a grain of `vagrant-host` set.

For the purposes of the demo, the minions should be added manually to
the master with `salt-key`.
They should try to connect to the master automatically.

## What the demo does

Visit `192.168.4.3` in a browser (the web minion). Connection denied.

Once the master, web minion, and host minion are running, edit
`/home/vagrant/motd.txt` to set off the following sequence:

* Editing `/home/vagrant/motd.txt` on the master will cause a beacon event will fire.
* This will trigger a reactor state to run highstate on the web minion, creating a static html file served by nginx. The contents of `motd.txt` will be added to this file.
* When the highstate on the web minion has completed, another reactor state will begin, taking a picture using `imagesnap` on the vagrant host minion.
* This picture will be grabbed by salt and placed in the nginx web root on the web minion.

Visit `192.168.4.3` again. A page should be returned with the message
from `motd.txt` and the recently taken picture!

## Misc

The demo can work without internet if you do some provisioning before hand.

Add the minions to the master and run highstate with `sudo salt \* state.highstate`.
Then run `reset.sh` to deprovision the minions and remove them with
`salt-key`, but without uninstalling any packages.
This will make it possible to run the demo without internet.
