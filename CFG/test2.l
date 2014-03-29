%{
#include <iostream>
using namespace std;
#define YY_DECL extern "C" int yylex()
%}

%%
"<bb "[0-9]+">:" cout<<"Block "<<yytext<<" detected."<<endl;
. ; //ignore mystery chars
[ \t\n] ; //ignore white space
%%

main()
{
	FILE *myFile = fopen("test.cfg","r");
	yyin = myFile;
	yylex();
}
