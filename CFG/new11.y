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


%union
{
    struct Number
    {
        enum { INTEGER, FLOAT } type;
        union
        {
            float fval;
            int   ival;
        };
    };

    Number nval;
    char  *sval;
}

// define the terminal symbol token types
%token <nval> INTEGER
%token <nval> FLOAT
%token <sval> BLOCK
%token <sval> GOTO
%token PRINT IF ELSE RETURN
%token LESSTHAN LESSTHANEQUALTO GREATERTHAN GREATERTHANEQUALTO EQUALTO
%token ADD SUB MUL DIV
%token <sval> IDENTIFIER 
%type <sval> comparison
%type <nval> number

%%
//grammar which bison will parse

start:
    block statements { ; }
    | start block statements { ; }
    ;

block:
    BLOCK { cout<<"Block : "<<$1<<endl; }
    ;

number:
    INTEGER { $$=$1 }
    | FLOAT { $$=$1 }
    ;

initialization:
    IDENTIFIER EQUALTO number { cout<<$1<<" = "<<(($<nval.type>3 == $<nval.INTEGER>3) ? $<nval.ival>3 : $<nval.fval>3)<<endl; }
    ;

increment:
    IDENTIFIER EQUALTO IDENTIFIER ADD number { cout <<$1<<" = "<<$3<<" + "<< (($<nval.type>5 == $<nval.INTEGER>5) ? $<nval.ival>5 : $<nval.fval>5) <<endl; }
    ;

goto:
    GOTO { cout<<"GOTO : "<<$1<<endl; }
    ;

printing:
    PRINT { cout<<"printf(...)"<<endl; }
    ;

ifelse:
    IF IDENTIFIER comparison number GOTO ELSE GOTO
    { cout <<"if "<<$2<<$3<<(($<nval.type>4 == $<nval.INTEGER>4) ? $<nval.ival>4 : $<nval.fval>4)<<", "<<$5<<",else, "<<$7<<endl; }
    ;

comparison:
    LESSTHAN { $$="<"; }
    | LESSTHANEQUALTO { $$="<=" }
    | GREATERTHAN { $$=">" }
    | GREATERTHANEQUALTO { $$=">=" }
    ;

statement:
    initialization
    | printing
    | goto
    | increment
    | ifelse
    | RETURN
    ;

statements:
    statements statement 
    | statement
    ;

%%

int main() {
    // open a file handle to a particular file:
    FILE *myfile = fopen("test.cfg", "r");
    // make sure it is valid:
    if (!myfile) {
        cout << "I can't open a .cfg file!" << endl;
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