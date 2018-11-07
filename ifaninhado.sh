#!/bin/bash
# Teste de if-then aninhado
var1="teste.sh"
var2="home"

if ls /$var1
then
  echo "Diretório do usuário $var1 encontrado !"
elif ls /$var2
then
  echo "Diretório do usuário $var2 é que foi encontrado !"
else
  echo "Nenhum dos dois diretórios foi encontrado !"
fi
