#!/bin/bash
# Calculo simples no bash

var1=100
var2=30
var3=`echo "scale=4; $var1 / $var2" | bc`
echo "O resultado do calculo é: $var3"
exit 6
