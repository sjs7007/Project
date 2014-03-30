%{
	#include <iostream>
	using namespace std;
	#define YY_DECL extern "C" int yylex()
%}



%%
[ \t \n] ;
"<bb "[0-9]+">" { cout<<"Found a Block : "<<yytext<<endl; }
"goto <bb "[0-9]+">" { cout<<"Found a GOTO : "<<yytext<<endl;  }
%%

main()
{
	yylex();
}
