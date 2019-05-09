#!/bin/bash

#O programa vai verificar quantos PCS estão em uso e listar a qunatidade,
# de memoria sendo usada no momento

echo "======================================"
echo "Controle de uso de memoria disponivel "
echo "======================================"
echo
echo "Há 2 Computadores registrado na sua rede PC1 e PC2"
echo
echo "O PC1 está ligado no momento sim / não ?"
read PC1
echo
echo "O PC2 está ligado no momento sim / não ?"
read PC2
echo

if [ "$PC1" != "sim" -a "$PC1" != "não" ];then
    echo "Estado inválido para PC1, tente novamente"
    echo "Fechando programa....."
fi

if [ "$PC2" != "sim" -a "$PC2" != "não" ];then
    echo "Estado inválido para PC2, tente novamente"
    echo "Fechando programa....."
fi 
echo "Fechando programa....."

if [ "$PC1" = "sim" -a "$PC2" = "sim" ];then
    echo "No momento você está usando 80% de sua memoria RAM"
elif [ "$PC1" = "sim" -a "$PC2" = "não" ];then
    echo "No momento você está usando apenas 50% de sua memoria RAM"
elif [ "$PC1" = "não" -a "$PC2" = "sim" ];then
    echo "No momento você está usando 35% de sua memoria RAM "
elif [ "$PC1" = "não" -a "$PC2" = "não" ];then
    echo "Não a gasto de RAM pois os PCS estão desligado"
fi
echo
sleep 3
echo "Programa finalizado......"
