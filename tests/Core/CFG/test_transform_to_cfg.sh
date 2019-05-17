#!/bin/bash

echo $PWD
for i in $(ls ../../tests/ll/*.ll); do ../abstract_vuln $i; done
rm ./*.dot
