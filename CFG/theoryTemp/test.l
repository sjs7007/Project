%option yylineno

%{
    #include <iostream>
    #include <fstream>
    #include <string>
    using namespace std;
    #define YY_DECL extern "C" int yylex()

    int endPosList[1000]; //contain ending line number of blocks to be commented out
    int expandedList[3000]; //actual line numbers to be commented out
    void addLineNo(int n,int endPosList[]);
    void calcExpandedList(int endPosList[], int expandedList[]); //for now exp list = line number in epl - 3 to line number in epl
    void commentOut(int expandedList[]); //will produce the preprocessed file
%}

%%

\t ;
\n ;
. ; //ignore any other char




"\tfor(".*")""\n\t{\n\t\tprintf(".*"\n\t}" { cout<<"Found for block on line :"<<yylineno<<endl<<yytext<<endl; addLineNo(yylineno,endPosList); }
"\tfor(".*")""\n\t{\n\t\tscanf(".*"\n\t}" { cout<<"Found for block on line :"<<yylineno<<endl<<yytext<<endl; addLineNo(yylineno,endPosList); }
%%


main() {
    
    // open a file handle to a particular file:
    FILE *myfile = fopen("testInput.c", "r");
    // make sure it's valid:
    if (!myfile) {
        cout << "Can't open c." << "";
        return -1;
    }
    // set lex to read from it instead of defaulting to STDIN:
    yyin = myfile;
    
    //init array
    for(int i=0;i<1000;i++)
    {
        endPosList[i]=-1;
    }

    for(int i=0;i<3000;i++)
    {
        expandedList[i]=-1;
    }

    // lex through the input:
    yylex();

    cout<<"End Pos List : ";
    for(int i=0;endPosList[i]!=-1;i++)
    {
        cout<<endPosList[i]<<" ";
    }

    calcExpandedList(endPosList,expandedList);
    cout<<"Expanded List : ";
    for(int i=0;expandedList[i]!=-1;i++)
    {
        cout<<expandedList[i]<<" ";
    }
    cout<<endl;

    commentOut(expandedList);
 
}

void addLineNo(int n,int endPosList[])
{
    int i=0;
    while(endPosList[i]!=-1)
    {
        i++;
    }
    endPosList[i]=n;
}

void calcExpandedList(int endPosList[],int expandedList[])
{
    int expPointer=0;;
    for(int i=0;endPosList[i]!=-1;i++)
    {
        for(int j=3;j>=0;j--)
        {
            expandedList[expPointer]=endPosList[i]-j;
            expPointer++;
        }
    }
}

void commentOut(int expandedList[])
{
    string line;
    int expPointer=0;
    ifstream myfile("testInput.c");

    ofstream preProcessedFile;
    preProcessedFile.open("testResult.c");

    if (myfile.is_open())
    {
        int n=0;
        while (getline(myfile,line))
        {
            n++;
            cout <<"Line no " <<n <<" : " <<line << '\n';
            if(n==expandedList[expPointer])
            {
                preProcessedFile <<"//";
                expPointer++;
            }
            preProcessedFile << line<<'\n';
        }
        myfile.close();
        preProcessedFile.close();
    }

    else cout << "Unable to open file"; 
}


 