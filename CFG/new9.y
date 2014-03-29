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
%token <ival> INTEGER
%token <sval> BLOCK
%token <sval> GOTO
%token PRINT IF ELSE EQUALTO LESSTHANEQUALTO PLUS
%token <sval> IDENTIFIER

%%
//grammar which bison will parse

start:
	block statements { ; }
	;

block:
	BLOCK { cout<<"Block : "<<$1<<endl; }

initialization:
	IDENTIFIER EQUALTO INTEGER { cout<<$1<<" = "<<$3<<endl; }
	;

increment:
	IDENTIFIER EQUALTO IDENTIFIER PLUS INTEGER { cout <<$1<<" = "<<$3<<" + "<<$5<<endl; }
	;

goto:
	GOTO { cout<<"GOTO : "<<$1<<endl; }
	;

printing:
	PRINT { cout<<"printf(...)"<<endl; }
	;

ifelse:
	IF IDENTIFIER LESSTHANEQUALTO INTEGER GOTO ELSE GOTO
	{ cout <<"if "<<$2<<"<="<<$4<<", "<<$5<<",else, "<<$7<<endl; }
	;

statement:
	initialization
	| printing
	| goto
	| increment
	| ifelse
	;

statements:
	statements statement 
	| statement
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
