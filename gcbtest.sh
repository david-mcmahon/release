#!/bin/bash

#touch /tmp/empty-file.1

#/usr/bin/gsutil -q cp /tmp/empty-file.1 gs://artifacts.kubernetes-release-test.appspot.com/containers
#echo $?
#gsutil -q rm gs://artifacts.kubernetes-release-test.appspot.com/containers/empty-file.1
#echo $?

echo "config list:"
gcloud config list
echo other
gcloud auth list

echo next
gsutil ls gs://kubernetes-release-gcb/release/v1.10.0-alpha.1
#
#echo
#echo "auth list:"
#gcloud auth list
#
echo ENV:
set

exit
cat <<EOF+ > $HOME/.netrc
machine api.github.com
login myself
password $GITHUB_TOKEN

machine github.com
login myself
password $GITHUB_TOKEN
EOF+

git config --global credential.helper "netrc -f $HOME/.netrc"

curl -n https://api.github.com/david-mcmahon -I

git remote -v

git config --list --global

git push --dry-run origin master

ssh -T git@github.com
