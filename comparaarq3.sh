#!/bin/bash
# Verificar permissão de leitura em um arquivo

arquivo=/etc/passwd

# Testar se o arquivo existe:

if [ -f $arquivo ]
then
   echo "Existe; testar se usuário tem permissão de leitura"
     if [ -r $arquivo ]
   then
      echo "Possui permissão de leitura; mostrando as 5 últimas linhas:"
      tail -5 $arquivo
   else
      echo "Sem permissão de leitura"
    fi
else
   echo "Arquivo não encontrado"
fi
