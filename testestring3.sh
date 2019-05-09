#!/bin/bash
# Testar se a variável possui conteúdo

var1=abacate
var2=''

if [ -n $var1 ]
then
  echo "Variável não está vazia, contem o valor $var1"
else
  echo "Variável está vazia"
fi

if [ -z $var2 ]
then
  echo "Variável está vazia"
else 
  echo "String não está vazia"
fi

