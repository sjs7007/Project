%{
	#include <iostream>
	#include <math.h> //for pow function
	using namespace std;
	#define YY_DECL extern "C" int yylex()

	#include "new11.tab.h" // to get token types that we return

	float getFloat(string s);
%}

%%
"const" ;
"char" ;
"Function" ;
"main" ;
^.*restrict.*$ ;

"int" { return intDECL; } 
"float" { return floatDECL; };
"%d" ;

[-]?[0-9]+ { yylval.nval.type=yylval.nval.INTEGER; yylval.nval.ival = atoi(yytext); return INTEGER; }
[-]?[1-9]"."[0-9]+"e"[+/-][0-9]+ { yylval.nval.type=yylval.nval.FLOAT; yylval.nval.fval = getFloat(yytext); return FLOAT; }
"<bb "[0-9]+">" { yylval.sval = strdup(yytext); return BLOCK; }
"goto <bb "[0-9]+">" { yylval.sval = strdup(yytext); return GOTO; }
"if" { return IF; }
"else" { return ELSE; }
"return" { return RETURN; }
"printf (".*")"   { /*cout<<"Print : "<<yytext<<endl;*/ return PRINT; }
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
