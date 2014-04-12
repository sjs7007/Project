%{
	#include <cstdio>
	#include <iostream>
	#include <stdlib.h> //itoa
	using namespace std;
   


	//stuff from flex that bison needs to know about
	extern "C" int yylex();
	extern "C" int yyparse();
	extern "C" FILE *yyin;

	void yyerror(const char *s);
    
    struct Symbol
    {
        enum { INTEGER, FLOAT,DOUBLE } type;
        string name;

        union
        {
            float fval;
			double dval;
            int   ival;
        };

        string displayNumber()
        {
            string temp="CONVERSION REMAINING.";
            
            if(type==INTEGER)
            {
                //cout<<ival;
               // itoa(ival,string,10);
             
            }
            else if(type==FLOAT)
            {
                //cout<<fval; 
            }
            else if(type==DOUBLE)
            {
                //cout<<dval;
                
            }
            return temp;
        }
    };

	Symbol symbolTable[100];
	int nSymbols=0;
	int getSymbolTableId(string input);
%}

//Bison asks flex to get next token which is returned as an object of yystype.
//It could be of any arbitrary data type so we define a C union which holds
//each of the types of tokens that flex could return


%union
{
    struct Number
    {
        enum { INTEGER, FLOAT, DOUBLE } type;
        union
        {
            float fval;
			double dval;
            int   ival;
        };

		string displayNumber()
		{
			string temp="CONVERSION REMAINING.";
            
            if(type==INTEGER)
			{
				//cout<<ival;
               // itoa(ival,string,10);
			 
            }
			else if(type==FLOAT)
			{
				//cout<<fval; 
			}
			else if(type==DOUBLE)
			{
				//cout<<dval;
                
			}
            return temp;
		}
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
%token intDECL floatDECL doubleDECL // for int declaration like, int a;
%type <nval> expression

%%
//grammar which bison will parse

start:
    statements block statements { ; }
    | start statements block statements { ; }
    ;

block:
    BLOCK { cout<<"Block : "<<$1<<endl; }
    ;

number:
    INTEGER { $$=$1 }
    | FLOAT { $$=$1 }
    | IDENTIFIER 
    {
        if(symbolTable[getSymbolTableId($1)].type==symbolTable[getSymbolTableId($1)].INTEGER)
        {
            //cout<<"finding : "<<$1<<endl;
            $<nval.type>$=$<nval.INTEGER>$;
            $<nval.ival>$=symbolTable[getSymbolTableId($1)].ival;
        }
		else if(symbolTable[getSymbolTableId($1)].type==symbolTable[getSymbolTableId($1)].FLOAT)
        {
            //cout<<"finding : "<<$1<<endl;
            $<nval.type>$=$<nval.FLOAT>$;
            $<nval.fval>$=symbolTable[getSymbolTableId($1)].fval;
        }
		else if(symbolTable[getSymbolTableId($1)].type==symbolTable[getSymbolTableId($1)].DOUBLE)
        {
            //cout<<"finding : "<<$1<<endl;
            $<nval.type>$=$<nval.DOUBLE>$;
            $<nval.dval>$=symbolTable[getSymbolTableId($1)].dval;
        }
    };

declaration:
	intDECL IDENTIFIER 
	{
		//cout<<"Idenitifier of type integer found : "<<$2<<endl ;
		symbolTable[nSymbols].type = symbolTable[nSymbols].INTEGER;
		symbolTable[nSymbols].name = $2;
		nSymbols++;
	};

    |floatDECL IDENTIFIER
    {
        //cout<<"Idenitifier of type float found : "<<$2<<endl ;
        symbolTable[nSymbols].type = symbolTable[nSymbols].FLOAT;
        symbolTable[nSymbols].name = $2;
        nSymbols++;
    };
	|doubleDECL IDENTIFIER
    {
        //cout<<"Idenitifier of type float found : "<<$2<<endl ;
        symbolTable[nSymbols].type = symbolTable[nSymbols].DOUBLE;
        symbolTable[nSymbols].name = $2;
        nSymbols++;
    };


initialization:
    IDENTIFIER EQUALTO expression 
	{ 
		cout<<$1<<" = "<<$<nval.displayNumber()>3<<endl;
		int loc = getSymbolTableId($1); 
		//cout<<"Initialization found for "<<symbolTable[loc].name<<endl;
		if($<nval.type>3 == $<nval.INTEGER>3)
		{
			symbolTable[loc].ival = $<nval.ival>3;
		}
		else if($<nval.type>3 == $<nval.FLOAT>3)
		{
			symbolTable[loc].fval = $<nval.fval>3;
		}

	};

expression:
	number 
	| IDENTIFIER MUL number 
	{
        if(symbolTable[getSymbolTableId($1)].type == symbolTable[getSymbolTableId($1)].INTEGER )
		{
			$<nval.type>$ = $<nval.INTEGER>$;
			$<nval.ival>$ = symbolTable[getSymbolTableId($1)].ival * $<nval.ival>3 ;
			//cout<<"Yo : "<<$1<<" "<<symbolTable[getSymbolTableId($1)].displayNumber()<<endl;
		}
	}; 
    | IDENTIFIER ADD number 
    {
        if(symbolTable[getSymbolTableId($1)].type == symbolTable[getSymbolTableId($1)].INTEGER )
        {
            $<nval.type>$ = $<nval.INTEGER>$;
            $<nval.ival>$ = symbolTable[getSymbolTableId($1)].ival + $<nval.ival>3 ;
            //cout<<"Yo : "<<$1<<" "<<symbolTable[getSymbolTableId($1)].displayNumber()<<endl;
        }
    }; 
	| IDENTIFIER SUB number 
    {
        if(symbolTable[getSymbolTableId($1)].type == symbolTable[getSymbolTableId($1)].INTEGER )
        {
            $<nval.type>$ = $<nval.INTEGER>$;
            $<nval.ival>$ = symbolTable[getSymbolTableId($1)].ival - $<nval.ival>3 ;
            //cout<<"Yo : "<<$1<<" "<<symbolTable[getSymbolTableId($1)].displayNumber()<<endl;
        }
    }; 

printing:
    PRINT { cout<<"printf(...)"<<endl; }
    ;

ifelse:
    IF IDENTIFIER comparison number GOTO ';' ELSE GOTO 
    { cout <<"if "<<$2<<$3<<$<nval.displayNumber()>4<<", "<<$5<<",else, "<<$8<<endl; }
    ;

comparison:
    LESSTHAN { $$="<"; }
    | LESSTHANEQUALTO { $$="<=" }
    | GREATERTHAN { $$=">" }
    | GREATERTHANEQUALTO { $$=">=" }
    ;

statement:
	 declaration  
    |initialization 
    | printing 
    | GOTO  
    | ifelse 
    | RETURN 
    ;

statements:
    | statements statement ';'
    | statement ';'
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

	cout<<"Symbol table : -"<<endl; 

	for(int i=0;i<nSymbols;i++)
	{
        cout<<"Symbol "<<i<<" : "<<symbolTable[i].name;
        /*if(symbolTable[i].type==symbolTable[i].INTEGER)
        {
            cout<<", Value : "<<symbolTable[i].ival<<endl;
        }
        else if(symbolTable[i].type==symbolTable[i].FLOAT)
        {
            cout<<", Value : "<<symbolTable[i].fval<<endl;
        }*/
        cout<<", Value : "<<symbolTable[i].displayNumber()<<endl;
	}
}

void yyerror(const char *s) {
    cout << "EEK, parse error!  Message: " << s << endl;
    // might as well halt now:
    exit(-1);
}

int getSymbolTableId(string input)
{
	int loc=-1;
	for(int i=0;i<100;i++)
	{
		if(input==symbolTable[i].name)
		{
			loc=i;
			break;
		}
	}
	return loc;
}
