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

/* Terminal symbol token taps. Use capitals by convention */
%token <ival> INT
%token <fval> FLOAT
%token <sval> STRING



/*actual grammar*/
%%
snazzle:
		snazzle INT {cout<<"Bison found an int : "<< $2 <<endl; }
		| snazzle FLOAT {cout<<"Bison found a float : "<< $2 <<endl; }
		| snazzle STRING {cout<<"Bison found a string : "<< $2 <<endl; }
		| INT {cout<<"Bison found an int : "<< $1 <<endl; }
		| FLOAT {cout<<"Bison found a float : "<< $1 <<endl; }
		| STRING {cout<<"Bison found a string : "<< $1 <<endl; }
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
