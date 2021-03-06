#!/bin/bash

#----------------------------------------------------------
# Verificar se as variaveis estao configuradas corretamente
#export JAVA_HOME=/home/ipadmin/tools/java/jdk1.7.0_67
#export PATH=$JAVA_HOME/bin:$PATH

if [[ $# < 2 ]]; then
    echo ""
    echo "Uso: "
    echo "     $0 <versao atual> <versao nova>"
    echo "Onde:"
    echo "     <versao atual> - versao atual pom.xml"
    echo "     <versao nova>  - proxima versao pom.xml"
    echo ""
    echo "Exemplo:"
    echo "     $0 2.0.30 2.0.31"
    exit 1
fi

OLDVERSION=${1}
NEWVERSION=${2}
mod="domain eng geoanalyticsetl geoanalyticsgeo geoappl landbase serv"
for m in $mod; do
        cp -r ${m}/patch/to-xx.yy.zz ${m}/patch/to-${NEWVERSION}
        echo "$OLDVERSION $NEWVERSION" >> ${m}/patch/patch_sequence
        cd ${m}/patch/to-${NEWVERSION}
        arq=`ls | grep -v main.xml | grep -v patch.sql`
        for a in $arq; do
                a2=`echo $a | sed "s/xxx/${NEWVERSION}/g"`
                mv $a $a2
        done
        sed -i "s/xxx/${NEWVERSION}/g" `grep -rl "xxx" *`
        cd ../../../
done
