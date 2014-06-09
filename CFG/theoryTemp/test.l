%option yylineno

%{
    #include <iostream>
    using namespace std;
    #define YY_DECL extern "C" int yylex()
%}

%%

\t ;
\n ;
. ; //ignore any other char




"\tfor(".*")""\n\t{\n\t\tprintf(".*"\n\t}" { cout<<"Found for block on line :"<<yylineno<<endl<<yytext<<endl; }
%%


main() {
    
    // open a file handle to a particular file:
    FILE *myfile = fopen("theoryTest1.c", "r");
    // make sure it's valid:
    if (!myfile) {
        cout << "Can't open c." << "";
        return -1;
    }
    // set lex to read from it instead of defaulting to STDIN:
    yyin = myfile;
    
    // lex through the input:
    yylex();

    /*
    "+" { cout<<yytext<<""; }
"-" { cout<<yytext<<""; }
"*" { cout<<yytext<<""; }
"/" { cout<<yytext<<""; }
"^" { cout<<yytext<<""; }
[0-9]+ { cout<<yytext<<""; }
"print" { }
[a-zA-Z] {}
"=" { cout<<yytext<<""; }


"for" {cout<<"For loop found!"<<endl; }

"{\n".*"\n}" { cout<<yytext<<endl; }
"\t{\n".*"\n\t}" { cout<<yytext<<endl; }

"for(".*")"   { cout<<"For loop : "<<yytext<<endl; }
"printf(".*")" { cout <<yytext<<endl;}
"\t{\n".*"\n\t}" { cout<<yytext<<endl; }


"\t{\n\t\tprintf(".*"\n\t}" { cout<<yytext<<endl; }

"\tfor(".*")""\n\t{\n\t\tprintf(".*"\n\t}" { cout<<yytext<<endl; }
*/
}



