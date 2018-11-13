#!/bin/bash
# Ler dados de um arquivode texto:

contador=1
cat teste_read.txt | while read linha 
do
    echo Linha $contador : $linha
    contador=$[ $contador + 1 ]
done
