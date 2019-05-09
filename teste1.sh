#!/bin/bash

#Informar os carros para o cliente

echo "====================================="
echo "|  Olá seja bem vindo a nossa Loja  |"
echo "====================================="
echo
echo "Escolha um dos modelos de carro que temos em nossa loja"
echo
echo "------------------------"
echo "| Ferrari - Lamborghini|"
echo "| Civic   - Cruze      |"
echo "| Celta - Palio - Gol  |"
echo "------------------------"
echo
read RESPOSTA
echo
if [ "$RESPOSTA" = "Ferrari" -o  "$RESPOSTA" = "Lamborghini" ];then
echo "O carro $RESPOSTA que vc escolheu é de CLASSE A"
echo "Com um motor 4.8 e potencia de 580 cavalos"
fi

if [ "$RESPOSTA" = "Civic" -o  "$RESPOSTA" = "Cruze" ];then
echo "O carro $RESPOSTA que vc escolheu é de CLASSE B"
echo "Com um motor 2.0 e potencia de 250 cavalos"
fi

if [ "$RESPOSTA" = "Celta" -o  "$RESPOSTA" = "Palio" -o  "$RESPOSTA" = "Gol" ];then
echo "O carro $RESPOSTA que vc escolheu é de CLASSE C"
echo "Com um motor 1.0 e potencia de 100 cavalos"
fi
echo
sleep 3
echo "------------------------"
echo "Parabens pela escolha !!"
echo "------------------------"
echo

sleep 2
exit
