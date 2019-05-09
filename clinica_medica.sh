#!/bin/bash 

# Este é meu primeiro script teste
echo "==============================================="
echo "Olá seja bem vindo a nossa Clinica Saúde e VIda"
echo "==============================================="
echo 
echo ""
echo "Em qual periodo gostaria de ser atendido pelo nossos profissionais ?"
echo
echo "------------"
echo "|1 - Manhã |"
echo "|2 - Tarde |"
echo "|3 - Noite |"
echo "------------"
echo
read TURNO

if [ "$TURNO" = "1" ];then
 echo "Somente o Dr° Jorge atende no turno da Manhã" 
fi

if [ "$TURNO" = "2" ];then
 echo "Somente Dr° Pedro atende no perido da Tarde"
fi

if [ "$TURNO" = "3" ];then
 echo ""
 echo "Somente Dr° João atende no perido da noite, e somente até as 20 hrs"
fi

sleep 2
echo "========================================="
echo " Sua consulta foi agendada com sucesso !!"
echo
sleep 2
exit


 
