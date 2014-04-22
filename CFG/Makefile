.PHONY: CFGParser testAll all

genCFG:
	gcc -fdump-tree-cfg test/$(f).c 
	mv $(f).c.013t.cfg test.cfg
	cp test.cfg testCFG/$(f).cfg

runCFG:
	bison -d CFGParser.y
	flex CFGParser.l
	g++ CFGParser.tab.c lex.yy.c -lfl -o CFGParser

testCFG: genCFG runCFG
	 ./CFGParser | tee testOutput/$(f).txt
	 sh combineAll.sh $(f)

runTest: runCFG
	./CFGParser | tee testOutput/$(f).txt
	sh combineAll.sh $(f)
	
testAll: createDirectory testCFG clean

cleanCFG:
	rm -rf testCFG/*

cleanOutput:
	rm -rf testOutput/*

clean: 
	rm -rf CFGParser.tab.c CFGParser.tab.h somename a.out lex.yy.c CFGParser test/a.out 

createDirectory:
	mkdir -p testCFG testOutput testCombined #create directory if not present



