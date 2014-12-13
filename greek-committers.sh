#!/bin/sh
#
# Create a list of Greek committers.
#
# Diomidis Spinellis, December 2014

for i in Greece Athens Thessaloniki Patra Irakleio Larissa Patras Volos Heraklion Rhodes Rodos Ioannina Chania Chalkis Chalkida Agrinio Katerini Trikala Serres Lamia Alexandroupoli Kozani Kavala Veria Athina Hellas Ellada
do
    curl -s 'https://api.github.com/search/users?q=followers:%3E5+location:'$i
    curl -s 'https://api.github.com/search/users?q=repos:%3E5+location:'$i
done |
sed -n 's/.*"login": "\(.*\)",/\1/p' |
sort -u >users.txt
