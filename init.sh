#!/bin/bash -eu

echo 'init process'

cat init.sql | mysql -uisucon -pisucon

redis-cli set count 20540