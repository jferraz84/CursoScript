#!/bin/bash
# Testar igualdade de strings 

nome=ipscate

if [ $USER = $nome ]
then
 echo "Olá $nome"
else
  echo "Usuário não encontrado"
fi 
