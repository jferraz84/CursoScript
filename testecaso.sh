#!/bin/bash
# Usando o comando caso

local=banheiro

case $local in
  quarto)
      echo "Você está no quarto";;
  cozinha)
      echo "Aqui é a cozinha";;
  sala)
      echo "Está na sala agora";;
  banheiro | lavanderia)
      echo "Foi ao banheiro ou a lavanderia";;
  *)
      echo "Você não está dentro de casa";;
esac
