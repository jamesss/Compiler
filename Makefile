default: lexer parser
	ghc lexer.hs parser.hs main.hs -o compiler

lexer: lexer.x
	alex -g lexer.x -o lexer.hs

parser: parser.y
	happy -g -a -c parser.y

clean:
	rm compiler
	rm *.o
	rm lexer.hs
	rm parser.hs
	rm *.hi
