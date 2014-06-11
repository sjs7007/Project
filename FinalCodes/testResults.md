1.Results for very simple programs.
-------

Program1  | Program2    | CFG1 		 | CFG2 	  | No. of lines in file1 | No. of lines in file2 | Diff. Count |
----------|-------------|------------|------------|-----------------------|-----------------------|-------------|
[InsertionSort1.c](test/InsertionSort1.c) | [InsertionSort2.c](test/InsertionSort2.c) | [InsertionSort1.txt](testStructure/InsertionSort1.txt) |[InsertionSort2.txt](testStructure/InsertionSort2.txt) | 42 | 42 | 0 |
[InsertionSort1.c](test/InsertionSort1.c) | [InsertionSort3.c](test/InsertionSort3.c) | [InsertionSort1.txt](testStructure/InsertionSort1.txt) |[InsertionSort3.txt](testStructure/InsertionSort3.txt) | 42 | 42 | 0 |
[InsertionSort1.c](test/InsertionSort1.c) | [InsertionSort4.c](test/InsertionSort4.c) | [InsertionSort1.txt](testStructure/InsertionSort1.txt) |[InsertionSort4.txt](testStructure/InsertionSort4.txt) | 42 | 42 | 0 | 
[SelectionSort1.c](test/SelectionSort1.c) | [SelectionSort2.c](test/SelectionSort2.c) | [SelectionSort1.txt](testStructure/SelectionSort1.txt) |[SelectionSort2.txt](testStructure/SelectionSort2.txt) | 50 | 44 | 18 |
[SelectionSort1.c](test/SelectionSort1.c) | [SelectionSort3.c](test/SelectionSort3.c) | [SelectionSort1.txt](testStructure/SelectionSort1.txt) |[SelectionSort3.txt](testStructure/SelectionSort3.txt) | 50 | 44 | 18 | 
[SelectionSort2.c](test/SelectionSort2.c) | [SelectionSort3.c](test/SelectionSort3.c) | [SelectionSort2.txt](testStructure/SelectionSort2.txt) |[SelectionSort3.txt](testStructure/SelectionSort3.txt) | 44 | 44 | 0 |

2.Results for Matrix Multiplication.
---------

**1.Without any Modification of Code.**  

Program1  | Program2    | CFG1 		 | CFG2 	  | No. of lines in file1 | No. of lines in file2 | Diff. Count |
----------|-------------|------------|------------|-----------------------|-----------------------|-------------|
[MatrixMul1.c](test/MatrixMul1.c) | [MatrixMul2.c](test/MatrixMul2.c) | [MatrixMul1.txt](testStructure/MatrixMul1.txt) |[MatrixMul2.txt](testStructure/MatrixMul2.txt) | 90 | 144 | 100 |
[MatrixMul1.c](test/MatrixMul1.c) | [MatrixMul3.c](test/MatrixMul3.c) | [MatrixMul1.txt](testStructure/MatrixMul1.txt) |[MatrixMul3.txt](testStructure/MatrixMul3.txt) | 90 | 116 | 72 |
[MatrixMul2.c](test/MatrixMul2.c) | [MatrixMul3.c](test/MatrixMul3.c) | [MatrixMul2.txt](testStructure/MatrixMul2.txt) |[MatrixMul3.txt](testStructure/MatrixMul3.txt) | 114 | 116 | 98 |

**2.After Manually Commenting out control blocks with only input/print statement in it.**   

Program1  | Program2    | CFG1 		 | CFG2 	  | No. of lines in file1 | No. of lines in file2 | Diff. Count |
----------|-------------|------------|------------|-----------------------|-----------------------|-------------|
[MatrixMul1Mod.c](test/MatrixMul1Mod.c) | [MatrixMul2Mod.c](test/MatrixMul2Mod.c) | [MatrixMul1Mod.txt](testStructure/MatrixMul1Mod.txt) |[MatrixMul2Mod.txt](testStructure/MatrixMul2Mod.txt) | 38 | 54 | 36 |
[MatrixMul1Mod.c](test/MatrixMul1Mod.c) | [MatrixMul3Mod.c](test/MatrixMul3Mod.c) | [MatrixMul1Mod.txt](testStructure/MatrixMul1Mod.txt) |[MatrixMul3Mod.txt](testStructure/MatrixMul3Mod.txt) | 38 | 47 | 31 |
[MatrixMul2Mod.c](test/MatrixMul2Mod.c) | [MatrixMul3Mod.c](test/MatrixMul3Mod.c) | [MatrixMul1Mod.txt](testStructure/MatrixMul1Mod.txt) |[MatrixMul3Mod.txt](testStructure/MatrixMul3Mod.txt) | 54 | 47 | 31 |

3.Results for Arbitrarily Different Programs

Program1  | Program2    | CFG1 		 | CFG2 	  | No. of lines in file1 | No. of lines in file2 | Diff. Count |
----------|-------------|------------|------------|-----------------------|-----------------------|-------------|
[Linear Search in Array](test/Arbit2A.c) | [Sum of all elements in Array](test/Arbit2B) | [Search](testStructure/Arbit2B.txt) |[Sum](testStructure/Arbit2B.txt) | 26 | 11 | 21 |
[Matrix Multiplication](test/Arbit3A.c) | [Matrix Addition](test/Arbit3B.c) | [Mul](testStructure/Arbit3A.txt) |[Add](testStructure/Arbit3B.txt) | 74 | 90 | 50 |
[String Concatenation](test/Arbit4A.c) | [Linear search](test/Arbit4B.c) | [Concatenation](testStructure/Arbit4A.txt) |[Search](testStructure/Arbit4B.txt) | 54 | 47 | 31 |






