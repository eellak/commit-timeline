#!/bin/bash
#
# Update recent GitHub activity for committers listed in users.txt
# and their repositories listed in user-repos/user.
# The updated results are stored in the file current.html.
#
# Diomidis Spinellis, December 2014

# Adjust the recency here.
FROM=$(date +'%FT%TZ' --date='TZ="UTC" -2 days')

while : ; do
    while read user ; do
        test -r user-repos/$user || continue
        sed -n 's/^ *"name": "\([^"]*\)".*/\1/p' user-repos/$user |
        while read repo ; do
            curl --silent --get "https://api.github.com/repos/$user/$repo/commits" \
                --data-urlencode "author=$user" \
                --data-urlencode "since=$FROM" |
            tee -a curl.out |
            jq --raw-output -f filter.jq
            # Don't decrease unless you query using an API
            # authentication token.
            sleep 120
        done
    done <users.txt |
    sort -r >new.html
    mv new.html current.html
done
