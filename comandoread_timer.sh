#!/bin/bash
# Usando timer

echo Digite seu nome: 
  if read -t 3 nome
  then
     echo "Olá $nome, tudo bem com você?"
  else
     echo "Programa encerrado, tempo de resposta expirado!!"
fi
