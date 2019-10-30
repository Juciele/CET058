/*
JUCIELE SACRAMENTO FREITAS BASTOS - 201511477 

- Para gerar o fonte digite
$ lex ex01.l

- Para compilar o fonte me C gerado digite
$ gcc ex01.yy.c

- Para executar
$ ./a.out

*/   


/* SEÇÃO DE DEFINIÇÕES */

%{
    /*
        Definições que estarão disponíveis 
            - variáveis
            - constantes
        O que for aqui será copiado para o arquivo *.yy.c
    
        Variáveis declaradas aqui estarão acessível nas funções yylex() e 
        main().
    */
    int contador = 0;
%}

/* Definições de Nomes */
STRING {"][_a-zA-Z0-9/-]+["]
NUMEROS [0-9]+
IDENTIFICADOR   [_a-zA-Z][_a-zA-Z0-9]* 
OPERADOR_MATEMATICO "+"|"-"|"*"|"/"|"%"
OPERADOR_RELACIONAL ">"|"<"|">="|"<="|"=="|"!=" 
OPERADOR_LOGICO  "&"|"|"|"!"|"..."
ATRIBUICAO "="|":="
DELIMITADOR ";"|","
CARACTER_ESPECIAL "("|")"|"["|"]"|"{"|"}"
PALAVRA_RESERVADA "int"|"float"|"double"|"boolean"|"true"|"false"|"if"|"do"|"while"|"for"|"else" 

/* FIM DA SEÇÃO DE DEFINIÇÕES */

%%
    /* SEÇAO DE REGRAS 
        Uma entrada por linha no formato:
        
        padrão  ação

    */
{STRING}                {printf("<string, %s>", yytext);}
{NUMEROS}               {printf("<number, %s>", yytext);}
{IDENTIFICADOR}         {printf("<identificador, %s>", yytext); contador++;}
{OPERADOR_MATEMATICO}   {printf("<op_mat, %s>", yytext); contador++;}
{OPERADOR_RELACIONAL}   {printf("<op_rel, %s>", yytext);}
{OPERADOR_LOGICO}       {printf("<op_log, %s>", yytext);}
{ATRIBUICAO}            {printf("<op_rel, %s>", yytext);}
{DELIMITADOR}           {printf("<delimi, %s>", yytext);}
{CARACTER_ESPECIAL}     {printf("<carac_esp, %s>", yytext);}
{PALAVRA_RESERVADA}     {printf("<tipos_dados, %s>", yytext);}
<<EOF>>                 return 0;
    
%%

/*
Seção de Código do Usuário
*/

int yywrap() {}
int main() {
    printf("Iniciando Análise Léxica...\n---\n");
    yylex();
    printf("Foram encontradas %d ocorrências de identificadores.\n", contador);
    printf("---\nÁnalise Finalizada!\n");
    
    return 0;
}
