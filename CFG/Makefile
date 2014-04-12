.PHONY: CFGParser testAll

genCFGI1:
	gcc -fdump-tree-cfg test/Integers1.c 
	mv Integers1.c.013t.cfg test.cfg
	cp test.cfg testCFG/Integers1.cfg

genCFGI2:
	gcc -fdump-tree-cfg test/Integers2.c 
	mv Integers2.c.013t.cfg test.cfg
	cp test.cfg testCFG/Integers2.cfg

genCFGF1:
	gcc -fdump-tree-cfg test/Float1.c 
	mv Float1.c.013t.cfg test.cfg
	cp test.cfg testCFG/Float1.cfg

genCFGF2:
	gcc -fdump-tree-cfg test/Float2.c 
	mv Float2.c.013t.cfg test.cfg
	cp test.cfg testCFG/Float2.cfg

testIntegers1: genCFGI1 runCFG
	 ./CFGParser | tee testOutput/Integers1.txt

testIntegers2: genCFGI2 runCFG
	 ./CFGParser | tee testOutput/Integers2.txt

testFloat1: genCFGF1 runCFG
	./CFGParser | tee testOutput/Float1.txt

testFloat2: genCFGF2 runCFG
	./CFGParser | tee testOutput/Float2.txt

testAll: cleanCFG cleanOutput testIntegers1 testFloat1 testFloat2 testIntegers2
	
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


