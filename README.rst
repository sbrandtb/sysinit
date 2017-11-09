=======
Sysinit
=======

Saltstack for setting up my machines, rudimentary.


Grains
======

Add to ``grains:`` in `/etc/salt/minion

* ``roles:ui`` add this if the machine provides UI/desktop
* ``roles:dev`` add this if the machine is used for development
