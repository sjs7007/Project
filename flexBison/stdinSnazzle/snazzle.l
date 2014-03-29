

%{ // << block of C code to be copied directly to generated lexeri | Control Section
#include <iostream> //for cout
using namespace std; //for cout
#define YY_DECL extern "C" int yylex() // to force g++ compiler to not apply name-magling. C1
%} 


%%
[0-9]+\.[0-9]+ { cout<<"Found a floating-point number: "<<yytext<<endl; /*action in curly braces. action seperated from*/}  
[0-9]+	{ cout<<"Found an inetger : "<<yytext<<endl; /*action seperated from pattern by >=1 space*/} 
[a-zA-Z0-9]+	{ cout<<"Found a string : "<<yytext<<endl; }
. {cout<<"Mystery character detected : "<<yytext<<endl;}
[ \t]+ ; //ignore all white space
\n { ++linenum; } //increment line count
%% //token section done

main() 
{
	// lex through the input:
	yylex();
}

/*
	http://aquamentus.com/flex_bison.html

   C1.If we don't do this g++ generates the function's name as something like "_Z5yylexv", where no
   one will be able tofind it or link it
*/
