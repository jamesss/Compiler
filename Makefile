default: lexer parser
	ghc lexer.hs parser.hs codegen.hs typecheck.hs main.hs -o compiler

lexer: lexer.x
	alex -g lexer.x -o lexer.hs

parser: parser.y
	happy -g -a -c -i parser.y

justthelexer: lexer
	ghc -v0 lexer.hs lexmain.hs -o lexer

clean:
	rm -f compiler
	rm -f *.o
	rm -f lexer.hs
	rm -f parser.hs
	rm -f *.hi
	rm -f lexer

parsertests: default
	./testparser > parsertests.txt 2> /dev/null
	less parsertests.txt

report: report.tex
	latex report.tex
	dvipdf report.dvi
	rm -f report.dvi
	rm -f report.aux
	rm -f report.log
