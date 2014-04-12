cfg:
	gcc -fdump-tree-cfg test.c 
	cp test.c.013t.cfg test.cfg

all: cfg
	bison -d CFGParser.y
	flex CFGParser.l
	g++ CFGParser.tab.c lex.yy.c -lfl -o CFGParser
	./CFGParser

clean:	
	rm CFGParser.tab.c CFGParser.tab.h somename a.out lex.yy.c test.c.013t.cfg 

