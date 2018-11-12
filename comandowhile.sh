#!/bin/bash
# Testando o comando while

var=30

while [ $var -gt 0 ]
do
    echo  $var
    var=$[ $var - 1]
done
