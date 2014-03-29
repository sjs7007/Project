%{ //control section, this block of code will be directly copied to generated lexer
#include <cstdio>
#include <iostream> //for cout
using namespace std; //for cout

// stuff from flex that bison needs to known about:
extern "C" int yylex();
extern "C" int yyparse();
extern "C" FILE *yyin;

void yyerror(const char *s);
%}

/* 
Bison works by asking flex to get the next token, which flex returns as an object 
of the type "yystype". But the tokens themselves could be of any arbitrary data type, 
so to deal with that in Bison we define a C union holding each of the types of tokens 
that flex could return, and have Bison use that union instead of "int" for the definition of "yystype"
*/

%union
{
	int ival;
	float fval;
	char *sval;
}
/* define constant string tokens*/
%token SNAZZLE TYPE END ENDL

/* Terminal symbol token taps. Use capitals by convention */
%token <ival> INT
%token <fval> FLOAT
%token <sval> STRING



/*actual grammar*/
%%
snazzles: 
	snazzles snazzle 
	| snazzle

snazzle:
	header randomStrings footer { cout << "done with a snazzle file!" << endl; }	
	;

header:
	SNAZZLE FLOAT { cout << "reading a snazzle file version " << $2 << endl; }
	;

randomStrings : 
	randomStrings STRING { cout << $2 <<endl;}
	| STRING { cout << $1 <<endl;}
	;

footer:
	ENDL
	;

%%

main()
{
	//file input
	FILE *myFile = fopen("test.snazzle","r");
	//make sure it is valid
	if (!myFile)
	{
		cout<<"Can't open file."<<endl;
		return -1;
	}
	//set flex to read from file instead of stdin
	yyin = myFile;

	// parse through input till there is no more:
	do
	{
		yyparse();
	}
	while(!feof(yyin));
}

void yyerror(const char *s)
{
	cout<<"Parse error. Msg : "<<s<<endl;
	//halt now
	exit(-1);
}
