%{
	#include <iostream>
	using namespace std;
	#define YY_DECL extern "C" int yylex()

	#include "new10.tab.h" // to get token types that we return
%}

%%
"const" ;
"char" ;
"Function" ;
"main" ;
"restrict" ;
"int ". ;
"%d" ;

[0-9]+ { yylval.ival = atoi(yytext); return INTEGER; }
"<bb "[0-9]+">" { yylval.sval = strdup(yytext); return BLOCK; }
"goto <bb "[0-9]+">" { yylval.sval = strdup(yytext); return GOTO; }
"if" { return IF; }
"else" { return ELSE; }
"return" { return RETURN; }
^.*printf.*$ { return PRINT; }
"=" { return EQUALTO; }
"+" { return PLUS; }
"<=" { return LESSTHANEQUALTO; }
[a-zA-Z] {  yylval.sval = strdup(yytext); return IDENTIFIER; }
^.*D.1709.*$  ;
[ \t \n] ;
.                ;
%%
