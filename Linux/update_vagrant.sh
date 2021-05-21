#!/usr/bin/env bash

#Update Vagrant file and destroy older versions and start up the Vagrant box

vagrant box update && vagrant destroy --force && vagrant up && vagrant box prune