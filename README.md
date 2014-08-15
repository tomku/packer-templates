# Packer Templates

## Introduction

These are my [Packer](http://www.packer.io/) templates for building [Vagrant](http://www.vagrantup.com/) boxes.  The boxes are provisioned in a two-step process where a basic box containing common parts is built, then reused to build several more specialized boxes.  The initial provisioning is currently performed using shell scripts, and the specialized provisioning is done using [Ansible](http://www.ansibleworks.com/docs/).

Please note that this repository uses a Git submodule to point to my collection of Ansible roles.  This means two things:

1. You need to clone this repository with --recursive, or do the 'submodule init'/'submodule update' dance for older versions of Git.
2. The boxes that result from building these templates will include things like my Vim and zsh configs, which is almost certainly not what you want unless you happen to be me.

## Future Plans

- Maybe Debian/CentOS boxes?
- More software (including but not limited to Coq, Idris, Elm, Neo4j, MySQL).
- Ansible modules for OPAM, Cabal, Conda, Julia, Racket, R packaging.

## Special Thanks

These templates started life as modifications to one of the templates from jedi4ever's [veewee](https://github.com/jedi4ever/veewee) project.  The unattended installation files in particular are the work of the veewee contributors, and I'm very grateful to them for that.  The basic provisioning shell scripts that I'm using are also adapted from veewee's, with some modifications.
