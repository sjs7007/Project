Test Case | Description | C Code | CFG File | Parsing Output | Result 
----------|-------------|--------|----------|----------------|--------
Integers Level 1 
| Identifiers are of only type int. No internal identifiers generated.
| [Integers1.c] (test/Integers1.c) 
| [Integers1.cfg] (testCFG/Integers1.cfg)
| Everything is proper except loop values don't change in symbol table.

------------------------------
Integer Level 2

Description: Identifiers are of only type int. Internal identifiers are generated.
C Code : https://github.com/sjs7007/Project/blob/master/CFG/test/Integers2.c
CFG File : https://github.com/sjs7007/Project/blob/master/CFG/testCFG/Integers2.cfg
Output :  https://github.com/sjs7007/Project/blob/master/CFG/testOutput/Integers2.txt
Result : Everything is proper except loop values don't change in symbol table.
------------------------------
Float level 1 

Description : Identifiers are of only type float. No internal identifiers generated.

C Code : https://github.com/sjs7007/Project/blob/master/CFG/test/Float1.c
CFG File : https://github.com/sjs7007/Project/blob/master/CFG/testCFG/Float1.cfg
Output :  https://github.com/sjs7007/Project/blob/master/CFG/testOutput/Float1.txt
Result : Everything is proper except loop values don't change in symbol table.
-------------------------------
Float level 2

Description : Identifiers are of only type float. Internal identifiers generated which are of type Double.
C Code : https://github.com/sjs7007/Project/blob/master/CFG/test/Float2.c
CFG File : https://github.com/sjs7007/Project/blob/master/CFG/testCFG/Float2.cfg
Output :  https://github.com/sjs7007/Project/blob/master/CFG/testOutput/Float2.txt
Result : Because of type mixing symbol table is not proper for double values. 
--------------------------------