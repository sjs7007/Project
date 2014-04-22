%{
	#include <iostream>
	using namespace std;
	#define YY_DECL extern "C" int yylex()
%}


%%
[ \t \n] ;
.                ;
"<bb "[0-9]+">" { cout<<"Found a Block : "<<yytext<<endl; }
"goto <bb "[0-9]+">" { cout<<"Found a GOTO : "<<yytext<<endl;  }
%%

main() {
	
	// open a file handle to a particular file:
	FILE *myfile = fopen("test.cfg", "r");
	// make sure it's valid:
	if (!myfile) {
		cout << "Can't open CFG." << endl;
		return -1;
	}
	// set lex to read from it instead of defaulting to STDIN:
	yyin = myfile;
	
	// lex through the input:
	yylex();
}