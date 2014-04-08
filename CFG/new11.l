%{
	#include <iostream>
	using namespace std;
	#define YY_DECL extern "C" int yylex()

	#include "new11.tab.h" // to get token types that we return
%}

%%
"const" ;
"char" ;
"Function" ;
"main" ;
"restrict" ;
"int ". ;
"%d" ;

[0-9]+ { yylval.nval.type=INTEGER; yylval.nval.ival = atoi(yytext); return INTEGER; }
[0-9]+"."[0-9]+ { yylval.nval.type=FLOAT; yylval.nval.fval = atof(yytext); return FLOAT; }
"<bb "[0-9]+">" { yylval.sval = strdup(yytext); return BLOCK; }
"goto <bb "[0-9]+">" { yylval.sval = strdup(yytext); return GOTO; }
"if" { return IF; }
"else" { return ELSE; }
"return" { return RETURN; }
^.*printf.*$ { return PRINT; }
"=" { return EQUALTO; }
"+" { return ADD; }
"-" { return SUB; }
"/" { return DIV; }
"*" { return MUL; }
"<" { return LESSTHAN; }
"<=" { return LESSTHANEQUALTO; }
">" { return GREATERTHAN; }
">=" { return GREATERTHANEQUALTO;}

[a-zA-Z] {  yylval.sval = strdup(yytext); return IDENTIFIER; }
^.*D.[0-9]+.*$  ;
[ \t \n] ;
.                ;
%%
