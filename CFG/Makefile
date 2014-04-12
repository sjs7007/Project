genCFGI1:
	gcc -fdump-tree-cfg test/testIntegers1.c 
	mv testIntegers1.c.013t.cfg test.cfg

genCFGF1:
	gcc -fdump-tree-cfg test/testFloat1.c 
	mv testFloat1.c.013t.cfg test.cfg

testIntegers1: genCFGI1 runCFG

testFloat1: genCFGF1 runCFG

	
runCFG:
	bison -d CFGParser.y
	flex CFGParser.l
	g++ CFGParser.tab.c lex.yy.c -lfl -o CFGParser
	./CFGParser

clean:	
	rm CFGParser.tab.c CFGParser.tab.h somename a.out lex.yy.c CFGParser test/a.out

