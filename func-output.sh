#!/bin/bash
# Teste função de saida ( Func output )

function quadrado {
     read -p "Digite um número entre 20 e 30: " numero
     echo $[ $numero * $numero ]

if [ $numero -gt 20 && -le 30 ]
then
# Atribuindo o valor da função á variável da shell valor

valor=`quadrado`

# mostrando o valor:
     echo "O quadrado do número é $valor"
else

     echo "O número digitado não está dentro dos padrões pedidos"
fi
}
~# Atribuindo o valor da função á variável da shell valor
