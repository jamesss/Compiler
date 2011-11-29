{

module Parser where
import Lexer

}


%name maliceParser
%tokentype { Token }
%error { parseError }

%token
    sep       { Separator }
    sentence  { Sentence }
    afound    { AliceFound }
    spoke     { Spoke }
    string    { LString $$ }

%%

strings :: { String }
        : string { $1 }

madeup :: { Exp }
       : afound sep        { Lint 2 }
       | sentence          { Lint 3 }
       | afound            { Lint 2 }

{

data BinOp
    = Op Exp Exp
    deriving (Eq,Show)

data Exp
    = Lint Int | BinOp
    deriving (Eq,Show)

parseError :: [Token] -> a
parseError _ = error "Parser Error!"

}
