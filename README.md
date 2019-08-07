andrewrothstein.octant
=========
[![Build Status](https://travis-ci.org/andrewrothstein/ansible-octant.svg?branch=master)](https://travis-ci.org/andrewrothstein/ansible-octant)

Installs VMWare's [octant](https://github.com/vmware/octant)

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.octant
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
