#!/bin/bash

# Testar comparações compostas. Vamos verificar se o usuário logado
# atualmente é o usuário ipscate e se ele tem pemrissão de escrita 
# no seu arquivo .bashrc:

if [ $USER = Jorge ] && [ -w $HOME/.bashrc ]
then
   echo "O usuário $USER tem permisdsão para alterar o arquivo"
else
   echo "O usuário Jorge não pode alterar o arquivo agora"
fi
   echo "   E os arquivos são:"
./teste.sh
