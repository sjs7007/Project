%{
	#include <cstdio>
	#include <iostream>
	#include <sstream>
	#include <fstream> //for file writing
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
            
            //conversion code from references2.cpp
            /*ostringstream ss;
            string temp="CONVERSION REMAINING.";
            
            if(type==INTEGER)
            {
                ss<<ival;
            }
            else if(type==FLOAT)
            {
               ss<<fval;
            }
            else if(type==DOUBLE)
            {
                ss<<dval;
            }
            temp = ss.str();*/
			//just display <integerValue> for now

			string temp="CONVERSION REMAINING.";
			if(type==INTEGER)
            {
            	temp="<integerValue>"; 
            }
            else if(type==FLOAT)
            {
              	temp="<floatValue>"; 
            }
            else if(type==DOUBLE)
            {
                temp="<doubleValue>";
            }
            return temp;
        }
    };

	Symbol symbolTable[100];
	int nSymbols=0;
	int getSymbolTableId(string input);
	void writeOut(string x);
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
            
            //conversion code from references2.cpp
            /*ostringstream ss;
            string temp="CONVERSION REMAINING.";
            
            if(type==INTEGER)
            {
                ss<<ival;
            }
            else if(type==FLOAT)
            {
               ss<<fval;
            }
            else if(type==DOUBLE)
            {
                ss<<dval;
            }
            temp = ss.str();*/
			//just display <integerValue> for now

			string temp="CONVERSION REMAINING.";
			if(type==INTEGER)
            {
            	temp="<integerValue>"; 
            }
            else if(type==FLOAT)
            {
              	temp="<floatValue>"; 
            }
            else if(type==DOUBLE)
            {
                temp="<doubleValue>";
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
%token LESSTHAN LESSTHANEQUALTO GREATERTHAN GREATERTHANEQUALTO EQUALTO NOTEQUALTO EQUALTO
%token ADD SUB MUL DIV
%token <sval> IDENTIFIER 
%type <sval> comparison
%type <nval> number
%token intDECL floatDECL doubleDECL // for int declaration like, int a;
%type <nval> expression
%type <sval> operator
%type <sval> goto

//for switch case
%token <sval> SWITCH 
%token <sval> switchBLOCK 

//for array
%token <sval> intArrayDECL

%%
//grammar which bison will parse

start:
    statements block statements { ; }
    | start statements block statements { ; }
    ;

block:
    BLOCK 
	{ 
		cout<<endl<<"Block : "<<$1<<endl; 
		string temp="\n";
		temp.append($1);
		temp.append(":");
		writeOut(temp);
	};

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
		cout<<"Identifier of type integer found : "<<$2<<endl ;
		symbolTable[nSymbols].type = symbolTable[nSymbols].INTEGER;
		symbolTable[nSymbols].name = $2;
		nSymbols++;
	};

    |floatDECL IDENTIFIER
    {
        cout<<"Identifier of type float found : "<<$2<<endl ;
        symbolTable[nSymbols].type = symbolTable[nSymbols].FLOAT;
        symbolTable[nSymbols].name = $2;
        nSymbols++;
    };
	|doubleDECL IDENTIFIER
    {
        cout<<"Identifier of type double found : "<<$2<<endl ;
        symbolTable[nSymbols].type = symbolTable[nSymbols].DOUBLE;
        symbolTable[nSymbols].name = $2;
        nSymbols++;
    };
	| intArrayDECL
	{
		cout<<"Integer Array Declaration : "<<$1<<endl;
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
        else
        {
            symbolTable[loc].dval = $<nval.dval>3;
        }

	};

operator:
    ADD { $$="+" }
    | SUB { $$="-" }
    | MUL { $$="*" }
    | DIV { $$="/" }
    ;

expression:
	number 
	| IDENTIFIER operator number 
	{
        if(symbolTable[getSymbolTableId($1)].type == symbolTable[getSymbolTableId($1)].INTEGER )
		{
			$<nval.type>$ = $<nval.INTEGER>$;
            if($2=="*")
            {
                $<nval.ival>$ = symbolTable[getSymbolTableId($1)].ival * $<nval.ival>3;
            }
            else if($2=="+")
            {
                $<nval.ival>$ = symbolTable[getSymbolTableId($1)].ival + $<nval.ival>3;
            }
            else if($2=="-")
            {
                $<nval.ival>$ = symbolTable[getSymbolTableId($1)].ival - $<nval.ival>3;
            }
            else if($2=="/")
            {
                $<nval.ival>$ = symbolTable[getSymbolTableId($1)].ival / $<nval.ival>3;
            }
            else
            {
                cout<<"ADD MORE CASES!"<<endl;
            }
			//$<nval.ival>$ = symbolTable[getSymbolTableId($1)].ival * $<nval.ival>3 ;
		}
        else if(symbolTable[getSymbolTableId($1)].type == symbolTable[getSymbolTableId($1)].FLOAT )
        {
            $<nval.type>$ = $<nval.FLOAT>$;
            if($2=="*")
            {
                $<nval.fval>$ = symbolTable[getSymbolTableId($1)].fval * $<nval.fval>3;
            }
            else if($2=="+")
            {
                $<nval.fval>$ = symbolTable[getSymbolTableId($1)].fval + $<nval.fval>3;
            }
            else if($2=="-")
            {
                $<nval.fval>$ = symbolTable[getSymbolTableId($1)].fval - $<nval.fval>3;
            }
            else if($2=="/")
            {
                $<nval.fval>$ = symbolTable[getSymbolTableId($1)].fval / $<nval.fval>3;
            }
            else
            {
                cout<<"ADD MORE CASES!"<<endl;
            }
            //$<nval.ival>$ = symbolTable[getSymbolTableId($1)].ival * $<nval.ival>3 ;
        }
        else if(symbolTable[getSymbolTableId($1)].type == symbolTable[getSymbolTableId($1)].DOUBLE )
        {
            $<nval.type>$ = $<nval.DOUBLE>$;
            if($2=="*")
            {
                $<nval.dval>$ = symbolTable[getSymbolTableId($1)].dval * $<nval.dval>3;
            }
            else if($2=="+")
            {
                $<nval.dval>$ = symbolTable[getSymbolTableId($1)].dval + $<nval.dval>3;
            }
            else if($2=="-")
            {
                $<nval.dval>$ = symbolTable[getSymbolTableId($1)].dval - $<nval.dval>3;
            }
            else if($2=="/")
            {
                $<nval.dval>$ = symbolTable[getSymbolTableId($1)].dval / $<nval.dval>3;
            }
            else
            {
                cout<<"ADD MORE CASES!"<<endl;
            }
            //$<nval.ival>$ = symbolTable[getSymbolTableId($1)].ival * $<nval.ival>3 ;
        }

	}; 

printing:
    PRINT { cout<<"printf(...)"<<endl; }
    ;

goto:
    GOTO
    {
        //cout<<$1<<endl; 
        $$=$1;
        writeOut($1); 
    };

ifelse:
    IF IDENTIFIER comparison number goto ';' ELSE goto 
    { cout <<"if "<<$2<<$3<<" "<<$<nval.displayNumber()>4<<", "<<$5<<",else, "<<$8<<endl; }
    ;

comparison:
    LESSTHAN { $$="<"; }
    | LESSTHANEQUALTO { $$="<=" }
    | GREATERTHAN { $$=">" }
    | GREATERTHANEQUALTO { $$=">=" }
    | NOTEQUALTO { $$="!=" }
    | EQUALTO { $$="=="}
    ;

//Switch case addition starts

switchBlocks:
    switchblock statements 
    | switchBlocks switchblock statements 
    ;

switchblock:
    switchBLOCK 
    {
        cout<<endl<<"Switch Case Block : "<<$1<<endl; 
    	string temp="\n";
		temp.append($1);
		//temp.append(":");
		writeOut(temp);
	};

switchCase:
    switch switchBlocks

switch:
    SWITCH { cout<<"Switch Case : "<<$1<<endl; }
//Part of switch case addition ends, next added "switchCase" ins statements

statement:
	 declaration  
    |initialization 
    | printing 
    | goto
    | ifelse 
    | RETURN 
    ;

statements:
    | statements statement ';'
    | statement ';'
    | switchCase
    ;



%%

int main() 
{
    // open a file handle to a particular file:
    FILE *myfile = fopen("test.cfg", "r");
    // make sure it is valid:
    if(!myfile) 
    {
        cout << "I can't open a .cfg file!" << endl;
        return -1;
    }
    // set flex to read from it instead of defaulting to STDIN:
    yyin = myfile;
    // parse through the input until there is no more:
    do 
    {
        yyparse();
    } while (!feof(yyin));

	cout<<endl<<"Symbol table : -"<<endl; 

	for(int i=0;i<nSymbols;i++)
	{
        cout<<"Symbol "<<i<<" : "<<symbolTable[i].name;
        cout<<", Value : "<<symbolTable[i].displayNumber()<<endl;
	}

	//writeOut("greef\n");
}

void yyerror(const char *s) 
{
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

void writeOut(string x)
{
	ofstream myfile;
	myfile.open("CFGStructure.txt", std::ios_base::app);
	x = x.append("\n");
	myfile << x;
	myfile.close();
}

