%{
	#include <iostream>
	using namespace std;
	#define YY_DECL extern "C" int yylex()

	#include "new5.tab.h" // to get token types that we return
%}

%%
[ \t \n] ;
.                ;
"<bb "[0-9]+">" { yylval.sval = strdup(yytext); return BLOCK; }
"goto <bb "[0-9]+">" { yylval.sval = strdup(yytext); return GOTO;  }
%%

