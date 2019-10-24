#!/usr/bin/awk -f
# Escreva um script que irá ler a expressão e resolvê-la imprimindo
# na tela o resultado de cada expressão encontrada no arquivo.

BEGIN {print "-- Iniciando Análise Léxica"}

{    
    while(match($0,/[0-9]+/)) {
              #print "<inteiro, "substr($0,RSTART,RLENGTH)" >";
              sum += substr($0,RSTART,RLENGTH);
              $0=substr($0,RSTART+RLENGTH);
          }
}

END {print "<"sum">";print "-- Fim da análise Léxica";}
