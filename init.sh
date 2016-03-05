#!/bin/sh

die() {
  echo $1
  exit 1
}

set_parameters() {
  set -e
  dir=`dirname "$0"`
  dir=`cd "$dir"; pwd -P`
  pdir=`cd "$dir/.."; pwd -P`

  name=`basename "$0" .sh`
  stamp=`date +"%m%d-%H%M"`
  data_dir="/tmp/$name-$stamp"
}

update_git_repo() (
  repo_url="$1"
  repo_name=`basename "$repo_url" .git`
 
  if cd "$pdir/$repo_name"
  then
    git pull
  else
    cd "$pdir"
    git clone "$repo_url"
  fi
)

update_this() (
  cd "$dir"
  git pull
)

modify_if_unchanged() (
  cd "$dir"/../$1
  if git diff --quiet "$2"
  then
    vim "$2"
  fi
)


set_parameters
update_this

