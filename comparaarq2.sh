#!/bin/bash
# Verificar se um objeto é um arquivo

if [ -e $HOME ]
then 
   echo "O objeto existe. Vamos ver se é arquivo ou diretório"
   
   if [ -f $HOME ]
   then
      echo "É um arquivo"
   else
      echo "É um diretório"
   fi
else
   echo "Objeto não encontrado"
fi
