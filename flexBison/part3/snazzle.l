%{
#include <cstdio>
#include <iostream>
using namespace std;
#define YY_DECL extern "C" int yylex()

#include "snazzle.tab.h" //to get token types that we return

%}

%%
[ \t\n] ; //do nothing for white space
[0-9]+\.[0-9]+ {yylval.fval = atof(yytext); return FLOAT; }
[0-9]+ {yylval.ival = atoi(yytext); return INT; }
[a-zA-Z0-9]+ {
	yylval.sval = strdup(yytext); //strdup : returns pointer to a new string, which is duplicate of string pointed to by ()
	return STRING;
	}
. ;
%%
