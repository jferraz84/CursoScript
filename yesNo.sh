#!/bin/bash
# Teste de caixa de dialogo YES e NO

if whiptail --title "Testando a caixa Sim/Não" --yesno "Escolha entre as alternativas Sim/Não." -- 10 50
then
   echo "Você escolheu Sim. O status de saída é $?."
else
   echo "Você escolheu Não. O status de saída é $?."
fi
