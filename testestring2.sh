#!/bin/bash
# Testar a não igualdade entre strings
fruta=morango

if [ $fruta != laranja ]
then
  echo "A fruta não é laranja, é $fruta"
else
  echo "A fruta é $fruta"
fi
