.PHONY: CFGParser testAll

genCFGI1:
	gcc -fdump-tree-cfg test/Integers1.c 
	mv Integers1.c.013t.cfg test.cfg
	cp test.cfg testCFG/Integers1.cfg

genCFGI2:
	gcc -fdump-tree-cfg test/Integers2.c 
	mv Integers2.c.013t.cfg test.cfg
	cp test.cfg testCFG/Integers2.cfg

genCFGI3:
	gcc -fdump-tree-cfg test/Integers3.c 
	mv Integers3.c.013t.cfg test.cfg
	cp test.cfg testCFG/Integers3.cfg

genCFGI4:
	gcc -fdump-tree-cfg test/Integers4.c 
	mv Integers4.c.013t.cfg test.cfg
	cp test.cfg testCFG/Integers4.cfg

genCFGF1:
	gcc -fdump-tree-cfg test/Float1.c 
	mv Float1.c.013t.cfg test.cfg
	cp test.cfg testCFG/Float1.cfg

genCFGF2:
	gcc -fdump-tree-cfg test/Float2.c 
	mv Float2.c.013t.cfg test.cfg
	cp test.cfg testCFG/Float2.cfg

genTest:
	gcc -fdump-tree-cfg test/test.c 
	mv test.c.013t.cfg test.cfg
	cp test.cfg testCFG/test.cfg

testIntegers1: genCFGI1 runCFG
	 ./CFGParser | tee testOutput/Integers1.txt
	 sh combineAll.sh Integers1

testIntegers2: genCFGI2 runCFG
	 ./CFGParser | tee testOutput/Integers2.txt
	 sh combineAll.sh Integers2

testIntegers3: genCFGI3 runCFG
	 ./CFGParser | tee testOutput/Integers3.txt
	 sh combineAll.sh Integers3

testIntegers4: genCFGI4 runCFG
	 ./CFGParser | tee testOutput/Integers4.txt
	 sh combineAll.sh Integers4


testFloat1: genCFGF1 runCFG
	./CFGParser | tee testOutput/Float1.txt
	sh combineAll.sh Float1

testFloat2: genCFGF2 runCFG
	./CFGParser | tee testOutput/Float2.txt
	sh combineAll.sh Float2

test: genTest runCFG
	./CFGParser | tee testOutput/test.txt
	sh combineAll.sh test
	
testAll: cleanCFG cleanOutput testIntegers1 testFloat1 testFloat2 testIntegers2 testIntegers3 testIntegers4 test
	
runCFG:
	bison -d CFGParser.y
	flex CFGParser.l
	g++ CFGParser.tab.c lex.yy.c -lfl -o CFGParser

cleanCFG:
	rm -rf testCFG/*

cleanOutput:
	rm -rf testOutput/*

clean: 
	rm -rf CFGParser.tab.c CFGParser.tab.h somename a.out lex.yy.c CFGParser test/a.out test.cfg


