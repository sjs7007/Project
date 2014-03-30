%{
	#include <iostream>
	using namespace std;
	#define YY_DECL extern "C" int yylex()
%}

%%
"const" ;
"char" ;
"return" ;
"Function" ;
"main" ;
"restrict" ;
"int ". ;
"%d" ;

[0-9]+ {cout<<"Found Number : "<<yytext<<endl; }
"<bb "[0-9]+">" { cout<<"Found Block : "<<yytext<<endl; }
"goto <bb "[0-9]+">" { cout<<"Found goto : "<<yytext<<endl;  }
"if" { cout<<"if statement"<<endl; }
"else" { cout<<"else "<<endl; }
^.*printf.*$ { cout<<"printf(..)"<<endl; }
"=" { cout<<"equalto"<<endl; }
"+" { cout<<"plus"<<endl; }
"<=" { cout<<"lessThanEqualTo"<<endl; }
[a-zA-Z] { cout<<"Identifier found : "<<yytext<<endl; }
^.*D.1709.*$  ;
[ \t \n] ;
.                ;
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


/*
"printf" { cout<<"print" <<endl; }
"D.1709" ;
"D.1709 =";
*/