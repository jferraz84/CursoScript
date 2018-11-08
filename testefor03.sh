#!/bin/bash
# Iterando por todos os itens de um diretório 

for item in /home/ipscate/*
do
  if [ -d "$item" ]
  then
     echo O item $item é um Diretório
  elif [ -f "$item" ]
  then
     echo O item $item é um arquivo
  fi
done
