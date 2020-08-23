andrewrothstein.k9s
=========
[![Build Status](https://travis-ci.org/andrewrothstein/ansible-k9s.svg?branch=master)](https://travis-ci.org/andrewrothstein/ansible-k9s)

Installs [k9s](https://k9scli.io/).

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
    - andrewrothstein.k9s
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
