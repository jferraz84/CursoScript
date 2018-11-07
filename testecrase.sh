#!/bin/bash
# Copiar a listagem de um diretório para arquivos unicos de acordo com data e hora.
arq=`date +%d%m%y%H%M`
ls -la /home/ipscate > log.$arq
echo "Tarefas OK"