#!/bin/sh

. `dirname "$0"`/init.sh

test "$USER" == root || {
  die 'The script is intended to run by root'
}

yum install epel-release
yum install ansible

