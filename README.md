Shell scripts for maintaining a timeline of commits to public
repositories made by a set of (Greek) GitHub users.

## Contents
* recent-commits.sh: create a timeline of recent commits in `current.html`. Should be run continuously in the background.
* refresh-repos.sh: update developers' public repositories. Should be run continuously in the background.
* greek-committers.sh: create a list of developers located in Greece.  Should be run every few months.
* filter.jq: Tailor this for the required HTML output

## Requirements
* curl
* [jq](http://stedolan.github.io/jq/)
