#!/bin/bash

# curl --remote-name https://raw.githubusercontent.com/thoughtbot/laptop/master/mac
# sh mac 2>&1 | tee ~/laptop.log

bash <(curl -s https://raw.githubusercontent.com/thoughtbot/laptop/master/mac) 2>&1 | tee ~/laptop.log
