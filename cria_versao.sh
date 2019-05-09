#!/bin/bash

echo $#

if [[ $# < 3 ]]; then
    echo ""
    echo "Uso: "
    echo "     $0 <repositorio git> <branch> <versao> <feature>"
    echo "Onde:"
    echo "     <cliente>      - cliente"
    echo ""
    echo "Exemplo:"
    echo "    $0 ~/GIT/mh/gp master 8.72.0"
    exit 1
fi

# ===============================================================
# PARAMETROS

WORK=`pwd`

clear
REPO=${1}
BRANCH=${2}
VERSAO=${3}
FEATURE=${4}

#REPO=/home/ipscate/GIT/mh/gp
HOME_TOOLS=/home/ipscate/tools

###############################################################################

echoLog(){

echo -e "\n${GREEN}[`date +%d/%m/%Y` `date +%H:%M:%S`] $1${NC}"

} # echoLog

###############################################################################
###############################################################################

##DESCOMENTAR##Menu_Texto(){
##DESCOMENTAR##echo -e "\t${BLUE_LIGHT}Cria versao GP${NC}"
##DESCOMENTAR##echo -e "\tUsuario: ${RED_LIGHT}$USUARIO${NC}\n\n"
##DESCOMENTAR##
##DESCOMENTAR##echo -e "\n\t${BLUE_LIGHT}Informacoes:${NC}"
##DESCOMENTAR##echo -e "\t Caminho git \t\t\t\t ${REPO}/"
##DESCOMENTAR##echo -e "\t\n\t(0) Branch a ser alterado \t\t $BRANCH${NC}"
##DESCOMENTAR##echo -e "\t(1) Versao a ser criada \t\t $VERSAO${NC}"
##DESCOMENTAR##echo -e "\t(2) Feature \t\t\t\t $FEATURE${NC}"
##DESCOMENTAR### echo -e "\t(3) Repositorio (gp/gp-vivo) \t\t $REPO${NC}"
##DESCOMENTAR##echo -e "\t\n\t(v) Cria as pastas da versao"
##DESCOMENTAR##echo -e "\t(f) Cria as pastas da feature"
##DESCOMENTAR###echo -e "\t\n\n\t ---------------- Utilizar as opcoes abaixo apenas para pastas criadas incorretamente ------------------------------"
##DESCOMENTAR###echo -e "\t\n\t(rv) Remover as pastas da versao"
##DESCOMENTAR###echo -e "\t(rb) Remover as pastas da feature"
##DESCOMENTAR##echo -e "\n\t(s) Sair"
##DESCOMENTAR##
##DESCOMENTAR##echo -e "\n\n\tEscolha uma opcao:"
##DESCOMENTAR##
##DESCOMENTAR##echo -en "\tOpcao: "
##DESCOMENTAR##read OPCAO
##DESCOMENTAR##
##DESCOMENTAR##} #Menu_Texto
##DESCOMENTAR#################################################################################
##DESCOMENTAR#################################################################################
##DESCOMENTAR##Menu(){
##DESCOMENTAR##
##DESCOMENTAR##Menu_Texto
##DESCOMENTAR##
##DESCOMENTAR##while [ "$OPCAO" != "" ]; do
##DESCOMENTAR##
##DESCOMENTAR##if [ "$OPCAO" != "0" ] && [ "$OPCAO" != "1" ] && [ "$OPCAO" != "2" ]  &&[ "$OPCAO" != "3" ]  && [ "$OPCAO" != "v" ] && [ "$OPCAO" != "f" ] && [ "$OPCAO" != "s" ] && [ "$OPCAO" != "rv" ] && [ "$OPCAO" != "rb" ]; then
##DESCOMENTAR##
##DESCOMENTAR##echo "+----------------+"
##DESCOMENTAR##echo "| Opcao invalida |"
##DESCOMENTAR##echo "+----------------+"
##DESCOMENTAR##
##DESCOMENTAR##exit 0
##DESCOMENTAR##fi
##DESCOMENTAR##
##DESCOMENTAR##if [ "$OPCAO" == "0" ]; then
##DESCOMENTAR##echo -en "\tBranch: "
##DESCOMENTAR##read BRANCH
##DESCOMENTAR##clear
##DESCOMENTAR##Menu_Texto
##DESCOMENTAR##fi
##DESCOMENTAR##
##DESCOMENTAR##if [ "$OPCAO" == "1" ]; then
##DESCOMENTAR##echo -en "\tVersao: "
##DESCOMENTAR##read VERSAO
##DESCOMENTAR##clear
##DESCOMENTAR##Menu_Texto
##DESCOMENTAR##fi
##DESCOMENTAR##
##DESCOMENTAR##if [ "$OPCAO" == "2" ]; then
##DESCOMENTAR##echo -en "\tFeature: "
##DESCOMENTAR##read FEATURE
##DESCOMENTAR##clear
##DESCOMENTAR##Menu_Texto
##DESCOMENTAR##fi
##DESCOMENTAR##
##DESCOMENTAR##if [ "$OPCAO" == "3" ]; then
##DESCOMENTAR##echo -en "\tRepositorio: "
##DESCOMENTAR##read REPO
##DESCOMENTAR##clear
##DESCOMENTAR##Menu_Texto
##DESCOMENTAR##fi
##DESCOMENTAR##
##DESCOMENTAR##if [ "$OPCAO" == "v" ]; then
##DESCOMENTAR##Cria_Versao
##DESCOMENTAR##exit;
##DESCOMENTAR##fi
##DESCOMENTAR##
##DESCOMENTAR##if [ "$OPCAO" == "f" ]; then
##DESCOMENTAR##Cria_Pasta_Feature
##DESCOMENTAR##exit;
##DESCOMENTAR##fi
##DESCOMENTAR##
##DESCOMENTAR##if [ "$OPCAO" == "rv" ]; then
##DESCOMENTAR##Remove_Versao
##DESCOMENTAR##exit;
##DESCOMENTAR##fi
##DESCOMENTAR##
##DESCOMENTAR##if [ "$OPCAO" == "rb" ]; then
##DESCOMENTAR##Remove_Pasta_Feature
##DESCOMENTAR##exit;
##DESCOMENTAR##fi
##DESCOMENTAR##
##DESCOMENTAR##if [ "$OPCAO" == "s" ]; then
##DESCOMENTAR##exit 0
##DESCOMENTAR##fi
##DESCOMENTAR##
##DESCOMENTAR##done
##DESCOMENTAR##
##DESCOMENTAR##} #Menu


###############################################################################
###############################################################################
Cria_Versao(){

set -x
cd ${REPO}

echoLog "Fazendo checkout de $BRANCH em $REPO ..."
time git checkout $BRANCH

echoLog "Atualizado repositorio (git pull --rebase)"
time git pull --rebase

#Verifica se o diretorio ja existe
if [ ! -d "${REPO}/dbmanager/fontes/components/eng/src/main/xml/eng/patch/to-$VERSAO" ]; then
#Criando pasta eng
mkdir ${REPO}/dbmanager/fontes/components/eng/src/main/xml/eng/patch/to-$VERSAO
cd ${HOME_TOOLS}/tools/bin/cria_versao/templates/versao/eng/to-XX
cp main.xml ${REPO}/dbmanager/fontes/components/eng/src/main/xml/eng/patch/to-$VERSAO
#Alterando arquivo main
cd ${REPO}/dbmanager/fontes/components/eng/src/main/xml/eng/patch/to-$VERSAO
sed "s,XX,$VERSAO,g" * > aux.xml
cp aux.xml main.xml
rm aux.xml
echoLog "Estrutura ENG criada"
else
echoLog "Estrutura ENG ja existente"
fi

#Verifica se o diretorio ja existe
if [ ! -d "${REPO}/dbmanager/fontes/components/etics/dbmanager/core/src/main/db/xml/domain/patch/to-$VERSAO" ];then
#Criando pasta domain
mkdir ${REPO}/dbmanager/fontes/components/etics/dbmanager/core/src/main/db/xml/domain/patch/to-$VERSAO
cd ${HOME_TOOLS}/tools/bin/cria_versao/templates/versao/domain/to-XX
cp * ${REPO}/dbmanager/fontes/components/etics/dbmanager/core/src/main/db/xml/domain/patch/to-$VERSAO
echoLog "Estrutura DOMAIN criada"
else
echoLog "Estrutura DOMAIN ja existente"
fi

#Verifica se o diretorio ja existe
if [ ! -d "${REPO}/dbmanager/fontes/components/etics/dbmanager/core/src/main/db/xml/etics/patch/to-$VERSAO" ];then
#Criando pasta etics
mkdir ${REPO}/dbmanager/fontes/components/etics/dbmanager/core/src/main/db/xml/etics/patch/to-$VERSAO
cd ${HOME_TOOLS}/tools/bin/cria_versao/templates/versao/etics/to-XX
cp main.xml ${REPO}/dbmanager/fontes/components/etics/dbmanager/core/src/main/db/xml/etics/patch/to-$VERSAO
#Alterando arquivo etics
cd ${REPO}/dbmanager/fontes/components/etics/dbmanager/core/src/main/db/xml/etics/patch/to-$VERSAO
sed "s,XX,$VERSAO,g" * > aux.xml
cp aux.xml main.xml
rm aux.xml
echoLog "Estrutura ETICS criada"
else
echoLog "Estrutura ETICS ja existente"
fi

#Verifica se o diretorio ja existe
if [ ! -d "${REPO}/dbmanager/fontes/components/etics/dbmanager/core/src/main/db/xml/geoanalyticsetl/patch/to-$VERSAO" ];then
#Criando pasta geoanalyticsetl
mkdir ${REPO}/dbmanager/fontes/components/etics/dbmanager/core/src/main/db/xml/geoanalyticsetl/patch/to-$VERSAO
cd ${HOME_TOOLS}/tools/bin/cria_versao/templates/versao/geoanalyticsetl/to-XX
cp * ${REPO}/dbmanager/fontes/components/etics/dbmanager/core/src/main/db/xml/geoanalyticsetl/patch/to-$VERSAO
echoLog "Estrutura GEOANALYTICSETL criada"
else
echoLog "Estrutura GEOANALYTICSETL ja existente"
fi

#Verifica se o diretorio ja existe
if [ ! -d "${REPO}/dbmanager/fontes/components/etics/dbmanager/core/src/main/db/xml/geoanalyticsgeo/patch/to-$VERSAO" ];then
#Criando pasta geoanalyticsgeo
mkdir ${REPO}/dbmanager/fontes/components/etics/dbmanager/core/src/main/db/xml/geoanalyticsgeo/patch/to-$VERSAO
cd ${HOME_TOOLS}/tools/bin/cria_versao/templates/versao/geoanalyticsgeo/to-XX
cp * ${REPO}/dbmanager/fontes/components/etics/dbmanager/core/src/main/db/xml/geoanalyticsgeo/patch/to-$VERSAO
echoLog "Estrutura GEOANALYTICSGEO criada"
else
echoLog "Estrutura GEOANALYTICSGEO ja existente"
fi
#alterando patch_sequence
cd ${REPO}/dbmanager/fontes/components/etics/dbmanager/core/src/main/db/xml/etics/patch/
LAST_VERSION=`cat patch_sequence  | tail -1 | awk '{print $2}'`
if [ ! $LAST_VERSION == $VERSAO ];then
cd ${REPO}/dbmanager/fontes/components/etics/dbmanager/core/src/main/db/xml/etics/patch/
echo -e "$(cat patch_sequence)\n" > patch_sequence
echo "$LAST_VERSION $VERSAO" >> patch_sequence
sed  '/^$/d' patch_sequence > patch_aux
cp patch_aux patch_sequence
rm patch_aux
echoLog "Patch sequence alterado"
else
echoLog "Patch sequence ja alterado"
fi
} #Cria_Versao


###############################################################################
###############################################################################
Cria_Pasta_Feature(){
echo "Criando a versao..."
Cria_Versao
set -x
#Criando pasta ENG
#Verifica se o diretorio ja existe
if [ ! -d "${REPO}/dbmanager/fontes/components/eng/src/main/xml/eng/patch/to-$VERSAO/$FEATURE" ]; then
#Criando pasta eng
mkdir ${REPO}/dbmanager/fontes/components/eng/src/main/xml/eng/patch/to-$VERSAO/$FEATURE
cd ${HOME_TOOLS}/tools/bin/cria_versao/templates/branch/eng/branch-XX
cp * ${REPO}/dbmanager/fontes/components/eng/src/main/xml/eng/patch/to-$VERSAO/$FEATURE
#Alterando arquivo main
cd ${REPO}/dbmanager/fontes/components/eng/src/main/xml/eng/patch/to-$VERSAO
sed -i '60i\<load>$#ARG1/branch-XX/main_branch-XX.xml $#ARG1/branch-XX $XML_DIR</load>\' main.xml
sed "s,branch-XX,$FEATURE,g"  main.xml > aux.xml
cp aux.xml main.xml
rm aux.xml
#Alterando arquivo main
cd ${REPO}/dbmanager/fontes/components/eng/src/main/xml/eng/patch/to-$VERSAO/$FEATURE
echo eng****
echo "${REPO}/dbmanager/fontes/components/eng/src/main/xml/eng/patch/to-$VERSAO/$FEATURE"
mv main_branch-XX.xml main_$FEATURE.xml
echoLog "Estrutura do branch criada no ENG"
else
echoLog "Estrutura do branch ja existente no ENG"
fi

#Criando pasta DOMAIN
#Verifica se o diretorio ja existe
if [ ! -d "${REPO}/dbmanager/fontes/components/etics/dbmanager/core/src/main/db/xml/domain/patch/to-$VERSAO/$FEATURE" ]; then
#Criando pasta eng
mkdir ${REPO}/dbmanager/fontes/components/etics/dbmanager/core/src/main/db/xml/domain/patch/to-$VERSAO/$FEATURE
cd ${HOME_TOOLS}/tools/bin/cria_versao/templates/branch/eng/branch-XX
cp * ${REPO}/dbmanager/fontes/components/etics/dbmanager/core/src/main/db/xml/domain/patch/to-$VERSAO/$FEATURE
#Alterando arquivo main
cd ${REPO}/dbmanager/fontes/components/etics/dbmanager/core/src/main/db/xml/domain/patch/to-$VERSAO
sed -i '19i\<load>$#ARG1/branch-XX/main_branch-XX.xml $#ARG1/branch-XX $XML_DIR</load>\' patch_domain.xml
sed "s,branch-XX,$FEATURE,g"  patch_domain.xml > aux.xml
cp aux.xml patch_domain.xml
rm aux.xml
#Alterando arquivo main
cd ${REPO}/dbmanager/fontes/components/etics/dbmanager/core/src/main/db/xml/domain/patch/to-$VERSAO/$FEATURE
echo domain***
echo "${REPO}/dbmanager/fontes/components/etics/dbmanager/core/src/main/db/xml/domain/patch/to-$VERSAO/$FEATURE"
mv main_branch-XX.xml main_$FEATURE.xml
echoLog "Estrutura do branch criada no DOMAIN"
else
echoLog "Estrutura do branch ja existente no DOMAIN"
fi


} #Cria_Pasta_Feature
###############################################################################
###############################################################################
Remove_Versao(){

#Verifica se o diretorio existe
if [ -d "${REPO}/dbmanager/fontes/components/eng/src/main/xml/eng/patch/to-$VERSAO" ]; then
#Removendo pasta eng 
rm -R ${REPO}/dbmanager/fontes/components/eng/src/main/xml/eng/patch/to-$VERSAO
echoLog "Estrutura ENG removida"
else
echoLog "Estrutura ENG nao encontrada"
fi

#Verifica se o diretorio ja existe
if [ -d "${REPO}/dbmanager/fontes/components/etics/dbmanager/core/src/main/db/xml/domain/patch/to-$VERSAO" ];then
rm -R ${REPO}/dbmanager/fontes/components/etics/dbmanager/core/src/main/db/xml/domain/patch/to-$VERSAO
echoLog "Estrutura DOMAIN removida"
else
echoLog "Estrutura DOMAIN nao encontrada"
fi

#Verifica se o diretorio ja existe
if [ -d "${REPO}/dbmanager/fontes/components/etics/dbmanager/core/src/main/db/xml/etics/patch/to-$VERSAO" ];then
#Criando pasta etics
rm -R ${REPO}/dbmanager/fontes/components/etics/dbmanager/core/src/main/db/xml/etics/patch/to-$VERSAO
echoLog "Estrutura ETICS removida"
else
echoLog "Estrutura ETICS nao encontrada"
fi

#Verifica se o diretorio ja existe
if [ -d "${REPO}/dbmanager/fontes/components/etics/dbmanager/core/src/main/db/xml/geoanalyticsetl/patch/to-$VERSAO" ];then
#Criando pasta geoanalyticsetl
rm -R ${REPO}/dbmanager/fontes/components/etics/dbmanager/core/src/main/db/xml/geoanalyticsetl/patch/to-$VERSAO
echoLog "Estrutura GEOANALYTICSETL removida"
else
echoLog "Estrutura GEOANALYTICSETL nao encontrada"
fi

#Verifica se o diretorio ja existe
if [ -d "${REPO}/dbmanager/fontes/components/etics/dbmanager/core/src/main/db/xml/geoanalyticsgeo/patch/to-$VERSAO" ];then
#Criando pasta geoanalyticsgeo
rm -R ${REPO}/dbmanager/fontes/components/etics/dbmanager/core/src/main/db/xml/geoanalyticsgeo/patch/to-$VERSAO
echoLog "Estrutura GEOANALYTICSGEO removida"
else
echoLog "Estrutura GEOANALYTICSGEO nao encontrada"
fi
#alterando patch_sequence
cd ${REPO}/dbmanager/fontes/components/etics/dbmanager/core/src/main/db/xml/etics/patch/
LAST_VERSION=`cat patch_sequence  | tail -1 | awk '{print $2}'`
if [ $LAST_VERSION == $VERSAO ];then
cd ${REPO}/dbmanager/fontes/components/etics/dbmanager/core/src/main/db/xml/etics/patch/
sed -i '$d' patch_sequence
echoLog "Patch sequence alterado"
fi

} #Remove_Versao

###############################################################################
###############################################################################
Remove_Pasta_Feature(){

#Verifica se o diretorio existe
if [ -d "${REPO}/dbmanager/fontes/components/eng/src/main/xml/eng/patch/to-$VERSAO/$FEATURE" ]; then
#Removendo pasta eng 
rm -R ${REPO}/dbmanager/fontes/components/eng/src/main/xml/eng/patch/to-$VERSAO/$FEATURE
cd ${REPO}/dbmanager/fontes/components/eng/src/main/xml/eng/patch/to-$VERSAO
sed -i '53i\\' main.xml
echoLog "Estrutura ENG removida"
else
echoLog "Estrutura ENG nao encontrada"
fi

#Verifica se o diretorio ja existe
if [ -d "${REPO}/dbmanager/fontes/components/etics/dbmanager/core/src/main/db/xml/domain/patch/to-$VERSAO/$FEATURE" ];then
rm -R ${REPO}/dbmanager/fontes/components/etics/dbmanager/core/src/main/db/xml/domain/patch/to-$VERSAO/$FEATURE
cd ${REPO}/dbmanager/fontes/components/etics/dbmanager/core/src/main/db/xml/domain/patch/to-$VERSAO
sed -i '5i\\' patch_domain.xml
echoLog "Estrutura DOMAIN removida"
else
echoLog "Estrutura DOMAIN nao encontrada"
fi


} #Remove_Pasta_Feature

##DESCOMENTAR##Menu

# Chamada para teste
Cria_Versao

echo "ATENCAO: Verificar alteracoes em $REPO, fazer o commit e o push!! NAO ESQUECA!!
echoLog "FIM"
