#!/bin/bash -e
export TERM=xterm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
# Use the correct ruby
#rvm use 1.9.3@gemset --create
# Do any setup
# e.g. possibly do 'rake db:migrate db:test:prepare' here
#bundle install
# Finally, run your tests
# rake Test
# and build the gem
# rake Build
# and install the gem locally
# rake Deploy
ipa build