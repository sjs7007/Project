%{
	#include <cstdio>
	#include <iostream>
	using namespace std;

	//stuff from flex that bison needs to know about
	extern "C" int yylex();
	extern "C" int yyparse();
	extern "C" FILE *yyin;

	void yyerror(const char *s);
%}

//Bison asks flex to get next token which is returned as an object of yystype.
//It could be of any arbitrary data type so we define a C union which holds
//each of the types of tokens that flex could return

%union{
	int ival;
	char *sval;
}

// define the terminal symbol token types
%token <ival> INT
%token <sval> BLOCK
%token <sval> GOTO

%%
//grammar which bison will parse
temp:
	 BLOCK { cout <<"bison found a block : "<<$1 <<endl; }
	| GOTO { cout<<"bison found a goto : "<<$1 <<endl; }
	;
%%

main() {
	// open a file handle to a particular file:
	FILE *myfile = fopen("test.cfg", "r");
	// make sure it is valid:
	if (!myfile) {
		cout << "I can't open a.snazzle.file!" << endl;
		return -1;
	}
	// set flex to read from it instead of defaulting to STDIN:
	yyin = myfile;
	// parse through the input until there is no more:
	do {
		yyparse();
	} while (!feof(yyin));
}

void yyerror(const char *s) {
	cout << "EEK, parse error!  Message: " << s << endl;
	// might as well halt now:
	exit(-1);
}
