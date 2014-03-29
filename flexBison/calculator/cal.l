/* recognize tokens for calculator and print them */

%{
#include <iostream>
using namespace std;
#define YY_DECL extern "C" int yylex()
%}

%%
"+" { cout<<"plus"<<endl; }
"-" { cout<<"minus"<<endl; }
"*" { cout<<"times"<<endl; }
"/" { cout<<"divide"<<endl; }
"|" { cout<<"abs"<<endl; }
[0-9]+ { cout<<"integer : "<<yytext<<endl; }
[0-9]+\.[0-9]+ { cout<<"floating point : "<<yytext<<endl; } 
\n { cout<<"new line"<<endl; }
[ \t] ;
. { cout<<"Mystery Char : "<<yytext<<endl; }
%%

/*
   how does "\" work in regex?
*/
