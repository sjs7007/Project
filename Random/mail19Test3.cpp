//working

#include <iomanip>
#include <iostream>

#include <stdio.h>
#include <stdlib.h>


using namespace std;

const int MAX_BUFFER = 255;

int main()
{
        string cmd;
        cout << "enter cmd: ";
        cin >> cmd;
        cout << endl << "running " << cmd << "…" << endl;


        string stdout;
        char buffer[MAX_BUFFER];
        FILE *stream = popen(cmd.c_str(), "r");
        while ( fgets(buffer, MAX_BUFFER, stream) != NULL )
        stdout.append(buffer);
        pclose(stream);


        cout << endl << "output: " << endl << stdout << endl;
}