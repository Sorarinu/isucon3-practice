#!/bin/bash -eu

echo 'init process'

cat init.sql | mysql -uisucon -pisucon

sh ./redis-init.sh