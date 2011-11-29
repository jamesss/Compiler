{

module Parser where
import Lexer

}


%name maliceParser
%tokentype { Token }
%error { parseError }

%token
    integer   { LInt $$ }
    character { LChar $$ }
    string    { LString $$ }
    
    afound    { AliceFound }
    aunsurew  { AliceUnsureW }
    aunsure   { AliceUnsure }
    thoughta  { ThoughtAlice }
    spoke     { Spoke }

    tnumber   { Number }
    tletter   { Letter }
    tsentence { Sentence }

    wasa      { WasA }
    became    { Became }
    drank     { Drank }
    ate       { Ate }
    theroom   { TheRoom }
    contained { ContainedA }
    saida     { SaidAlice }
    perhaps   { Perhaps }
    had       { Had }
    enought   { EnoughTimes }
    eventual  { Eventually }
    obr       { OBracket }
    cbr       { CBracket }
    what      { What }
    was       { Was }
    piece     { Piece }
    qm        { QMark }
    cs        { ICommaS }

    bin       { BinOp $$ }

    sep       { Separator }
    
    id        { Id $$ }
    

%%

strings :: { String }
        : string { $1 }

madeup :: { Exp }
       : afound sep        { Lint 2 }
       | tsentence          { Lint 3 }
       | afound            { Lint 2 }

declare :: { Decl }
        : id wasa mtype sep { $1 $3 }

mtype    :: { MType }
        : tletter   { MLett }
        | tnumber   { MNum }
        | tsentence { MSent }

{

data MType
    = MSent | MLett | MNum
    deriving (Eq,Show)

data Exp
    = Lint Int
    deriving (Eq,Show)

data Decl
    = Token MType
    deriving (Eq,Show)

parseError :: [Token] -> a
parseError _ = error "Parser Error!"

}
