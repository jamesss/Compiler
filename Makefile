default: lexer parser
	ghc lexer.hs parser.hs codegen.hs typecheck.hs main.hs -o compiler

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

report: report.tex
	latex report.tex
	dvipdf report.dvi
	rm report.dvi
	rm report.aux
	rm report.log
