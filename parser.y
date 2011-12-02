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
    because   { Because }

    bin       { BinOp $$ }
    un        { UnOp $$ }

    sep       { Separator }
    
    id        { Id $$ }
    
%%

program :: { AST }
        : stats { Program $1 }

stats :: { [Statement] }
      :  { [] }
      | stat stats { [$1] ++ $2 }

stat :: { Statement }
     : declare { $1 }
     | assign { $1 }
     | incdec { $1 }
     | fstat { $1 } 
     | print { $1 }
     | readin { $1 }

literal :: { Exp }
        : string { String $1 }
        | integer { Int $1 }
        | character { Char $1 }

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

function :: { FunctionDecl }
         : theroom id obr  cbr contained mtype fstat afound exp { Function $6 $2 [] $7 }

fstat :: { [Statement] }
      : { [] }
      | stat fstat { [$1] ++ $2 }

print :: { Statement }
      : id saida sep { Print $1 }
      | literal saida sep { Print $1 }
      | id spoke sep { Print $1 }
      | literal spoke { Print $1 }

readin :: { Statement }
       : what was id qm { ReadIn $3 }

wnot :: { WhileNot }
     : eventual obr cond cbr because fstat enought sep { $1 }

ifcond :: { Conditional }
       : perhaps obr cond cbr so fstat aunsure { If $3 $6 }
       | perhaps obr cond cbr so fstat { If $3 $6 }

elses :: { Conditional }
      : ormaybe fstat aunsurew { Else $3 $3 }
      | ormaybe obr cond cbr so fstat elses { ElseIf $3 $3 }

cond :: { BoolExpr }
     : so { Bool False }

binoperation :: { Exp }
              : exp bin exp { BinOpr $2 $1 $3 } 

unoperation :: { Exp }
            : un exp { UnOpr $1 $2 }

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
    | FunctionDecl
    | FunctionCall
    deriving (Show, Eq) 

data Conditional
    = If BoolExpr [Statement]
    | ElseIf BoolExpr [Statement]
    | Else [Statement]
    deriving (Show, Eq)

data WhileNot
    = While BoolExpr [Statement]
    deriving (Show, Eq)

data FunctionDecl
    = Function MType String [(String,MType)] [Statement]
    deriving (Show, Eq)

data FunctionCall
    = Call String [Exp]
    deriving (Show,Eq)

data Exp
    = UnOpr Char Exp
    | BinOpr Char Exp Exp
    | Int Int
    | Char Char
    | Var String
    deriving (Show, Eq)

data BoolExpr
    = Bool Bool
    | Exp String Exp
    deriving (Eq, Show)

parseError :: [Token] -> a
parseError _ = error "Parser Error!"

}
