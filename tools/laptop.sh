#!/bin/bash

# Laptop https://github.com/thoughtbot/laptop
bash <(curl -s https://raw.githubusercontent.com/thoughtbot/laptop/master/mac) 2>&1 | tee ~/laptop.log
