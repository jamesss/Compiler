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
    so        { So }
    ormaybe   { OrMaybe }

    bin       { BinOp $$ }

    sep       { Separator }
    
    id        { Id $$ }
    

%%

program :: { AST }
        : stat { $1 }
        | stat program { $1 }

literal :: { Exp }
        : string { $1 }
        | integer { $1 }
        | character { $1 }

declare :: { Statement }
        : id wasa mtype sep { Declare $3 $1 } 
        
assign :: { Statement }
       : id became exp sep { Assign $3 $1 }
        
mtype   :: { MType }
        : tletter { MLett }
        | tnumber { MNum }
        | tsentence { MSent }

incdec :: { Statement }
       : id ate sep { Decr $1 }
       | id drank sep { Incr $1 } 

exp :: { Exp }
    : binoperation { $1 }
    | unoperation { $1 }
    | literal { $1 }
    | id { $1 }

function :: { XXXXX }
         : theroom obracket cond cbracket containeda mtype fstat afound exp { $1 }

fstat :: { Statement }
      : stat fstat { $1 }
      | stat { $1 }

print :: { Statement }
      : id saida sep { $1 }
      | literal saida sep { $1 }
      | id spoke sep { $1 }

readin :: { Statement }
       : whatwas id qmark { $1 }

wnot :: { WhileNot }
     : eventually obracket cond cbracket because fsat enought sep { $1 }

ifcond :: { Conditional }
       : perhaps obracket cond cbracket so fstat aliceunsure { $1 }
       : perhaps obracket cond cbracket so fstat { $1 }

elses :: { AST }
      : ormaybe obr cond cbr so fstat aliceunsurew { $1 }
      | ormaybe obr cond cbr so fstat elses { $1 }



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
    | Print Exp
    | ReadIn String
    | Conditional
    | WhileNot
    deriving (Show, Eq) 

data Conditional
    = If BoolExp Then [Statement]
    deriving (Show, Eq)

data WhileNot
    = While BoolExpr [Statement]
    deriving (Show, Eq)

data FunctionDecl
    = MType Function String 

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
