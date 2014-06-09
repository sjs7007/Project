// reading a text file
#include <iostream>
#include <fstream>
#include <string>
using namespace std;

int main() 
{
  string line;
  ifstream myfile("theoryTest1.c");

  ofstream preProcessedFile;
  preProcessedFile.open("preProcessed.c");

  if (myfile.is_open())
  {
    int n=0;
    while (getline(myfile,line))
    {
      n++;
      cout <<"Line no " <<n <<" : " <<line << '\n';
      if(n==11)
      {
        preProcessedFile <<"//";
      }
      preProcessedFile << line<<'\n';
    }
    myfile.close();
    preProcessedFile.close();
  }

  else cout << "Unable to open file"; 
  return 0;
}


/*ofstream testFile;
  testFile.open("test.txt");
  testFile <<"this is from a c++ program.\n";
  testFile.close();*/