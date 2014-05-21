%{
	#include <iostream>
	#include <math.h> //for pow function
	#include <sstream>
    using namespace std;

	#define YY_DECL extern "C" int yylex()

	#include "CFGParser.tab.h" // to get token types that we return

	float getFloat(string s);
%}

%%
"const" ;
"char" ;
"Function" ;
"main" ;
"unsigned" ;
^.*restrict.*$ ;
^.*Merging.*$ ; 

"int "[*]? { return intDECL; } 
"int "[a-zA-Z_][a-zA-Z_0-9]*"["[0-9]+"]" { yylval.sval = strdup(yytext); return intArrayDECL; }; //int array declaration
"float" { return floatDECL; };
"double" { return doubleDECL; };
"(unsigned int)" {;}
"(int)" {;}
"(float)" {;}
"(double)" {;}

"%d" ;

[-]?[0-9]+ { yylval.nval.type=yylval.nval.INTEGER; yylval.nval.ival = atoi(yytext); return INTEGER; }
[-]?[1-9]"."[0-9]+"e"[+/-][0-9]+ { yylval.nval.type=yylval.nval.FLOAT; yylval.nval.fval = getFloat(yytext); return FLOAT; }
"<bb "[0-9]+">" { yylval.sval = strdup(yytext); return BLOCK; }
"<L"[0-9]+">:" { /*cout<<"Switch Case Block : "<<yytext<<endl;*/ yylval.sval=strdup(yytext); return switchBLOCK; }
"goto <bb "[0-9]+">" { yylval.sval = strdup(yytext); return GOTO; }
"if" { return IF; }
"else" { return ELSE; }
"return D."[0-9]+ { return RETURN; }
"printf (".*")"   { /*cout<<"Print : "<<yytext<<endl;*/ return PRINT; }
"scanf (".*")"   { /*cout<<"Print : "<<yytext<<endl;*/ return PRINT; }
"__builtin_puts (".*"[0])" { /*cout<<"Puts : "<<yytext<<endl;*/ return PRINT; }
"__builtin_putchar (".*")" { return PRINT; }
"switch (".*">>" { /*cout<<"Switch Case : "<<yytext<<endl;*/ yylval.sval = strdup(yytext); return SWITCH; }
"=" { return EQUALTO; }
"+" { return ADD; }
"-" { return SUB; }
"/" { return DIV; }
"*" { return MUL; }
"<" { return LESSTHAN; }
"<=" { return LESSTHANEQUALTO; }
">" { return GREATERTHAN; }
">=" { return GREATERTHANEQUALTO;}
";" { return yytext[0]; }
";;" {}


[a-zA-Z_][a-zA-Z_0-9]* { yylval.sval = strdup(yytext); return IDENTIFIER; }
"D."[0-9]+ { yylval.sval = strdup(yytext); return IDENTIFIER; }
[a-zA-Z_][a-zA-Z_0-9]*"."[0-9]+ { yylval.sval = strdup(yytext); return IDENTIFIER; } //of type a[j.5]
[a-zA-Z_][a-zA-Z_0-9]*"["[0-9]+"]" { yylval.sval = strdup(yytext); return IDENTIFIER; } //of type a[2]
[a-zA-Z_][a-zA-Z_0-9]*"["[a-zA-Z_][a-zA-Z_0-9]*"."[0-9]+"]" { yylval.sval = strdup(yytext); return IDENTIFIER; }

[ \t \n] ;
.        ;
%%

float getFloat(string s)
{
    int pos = s.find("e");
    //cout<<pos<<endl;
    string number = s.substr(0,pos);
    //cout<<number<<endl;
    string power = s.substr(pos+1,s.length()-(pos+1));
    //cout<<power<<endl;
    float floatVal = atof(number.c_str()) * pow(10,atoi(power.c_str()));
    //cout<<floatVal<<endl;
    return floatVal;
}
