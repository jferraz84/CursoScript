#!/bin/bash
# Verificar se o diretório HOMOE  do usuário existe
# e mostrar seu conteúdo

if  [ -d $HOME ]
then 
   echo "Seu diretório home existe e o conteúdo é: "
   cd $HOME
   ls -l 
else
   echo "Diretório não encontrado"
fi
