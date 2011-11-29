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

program : stat { $1 }
        | program { $1 }

stat    : strings { $1 }
        | declare { $1 }

strings :: { String }
        : string { $1 }

declare :: { Statement }
        : id wasa mtype sep { Declare $3 $1 }
        | id became exp sep { Assign $3 $1 }


mtype   :: { MType }
        : tletter { MLett }
        | tnumber { MNum }
        | tsentence { MSent }

incdec :: { Statement }
       : id ate sep { Decr $1 }
       | id drank sep { Incr $1 } 

exp :: { Exp }
    : integer { $1 }

{

data MType
    = MSent | MLett | MNum
    deriving (Eq,Show)

data AST
    = Program [Statement]
    deriving (Show, Eq)

data Statement
    = Assign String Exp
    | Declare MType String
    | Decr String
    | Incr String
    | Return Exp
    deriving (Show, Eq) 

data Exp
    = UnOp Char Exp
    | BinOpr Char Exp Exp
    | Int Int
    | Char Char
    | Var String
    deriving (Show, Eq)

parseError :: [Token] -> a
parseError _ = error "Parser Error!"

}
