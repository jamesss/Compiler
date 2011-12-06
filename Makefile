default: lexer parser
	ghc lexer.hs parser.hs main.hs -o compiler

lexer: lexer.x
	alex -g lexer.x -o lexer.hs

parser: parser.y
	happy -g -a -c -i parser.y

justthelexer: lexer
	ghc -v0 lexer.hs lexmain.hs -o lexer

clean:
	rm compiler
	rm *.o
	rm lexer.hs
	rm parser.hs
	rm *.hi
	rm lexer

parsertests: default
	./testparser > parsertests.txt 2> /dev/null
	less parsertests.txt
