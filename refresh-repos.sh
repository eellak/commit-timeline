#!/bin/sh
#
# Keep a fresh copy of all the users' repos.
#
# Diomidis Spinellis, December 2014

mkdir -p user-repos
while : ; do
    while read user ; do
        curl -s "https://api.github.com/users/$user/repos" >user-repos/$user
        # Don't decrease unless you query using an API
        # authentication token.
        sleep 600
    done <users.txt
done
