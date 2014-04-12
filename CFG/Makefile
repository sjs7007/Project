genCFGI1:
	gcc -fdump-tree-cfg test/Integers1.c 
	mv Integers1.c.013t.cfg test.cfg

genCFGF1:
	gcc -fdump-tree-cfg test/Float1.c 
	mv Float1.c.013t.cfg test.cfg

testIntegers1: genCFGI1 runCFG
	 ./CFGParser | tee testOutput/Integers1.txt

testFloat1: genCFGF1 runCFG
	./CFGParser | tee testOutput/Float1.txt

testAll: testIntegers1 testFloat1
	
runCFG:
	bison -d CFGParser.y
	flex CFGParser.l
	g++ CFGParser.tab.c lex.yy.c -lfl -o CFGParser

clean:	
	rm CFGParser.tab.c CFGParser.tab.h somename a.out lex.yy.c CFGParser test/a.out

