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
    or        { Or }
    maybe     { Maybe }
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
     | print { $1 }
     | readin { $1 }
     | wnot { WhileNot $1 }
     | function { FunctionDecl $1 } 
     | ifcond { Conditional $1 }
     | readin { $1 }
     | ignore { $1 }


literal :: { Exp }
        : string { String $1 }
        | integer { Int $1 }
        | character { Char $1 }

declare :: { Statement }
        : id wasa mtype sep { Declare $3 $1 }
        | id had exp mtype sep { DeclareArray $3 $4 $1 }
        | id had id mtype sep { DeclareArray (SizeOfArray $3) $4 $1 }
        
assign :: { Statement }
       : id became exp sep { Assign $1 $3 }
       | id cs exp piece became exp sep { ArraySetElem $1 $3 $6 }
        
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
    | id { Var $1 }
    | id cs exp piece { ArrayGetElem $1 $3 }
    | fcall { FunctionCall $1 }

function :: { FunctionDecl }
         : theroom id obr params cbr contained mtype stats { Function $7 $2 $4 $8 }
         | theroom id obr params cbr contained mtype stats return { Function $7 $2 $4 ($8++[$9]) } 

return :: { Statement }
       : afound exp sep { Return $2 }

fcall :: { FunctionCall }
      : id obr callparams cbr { Call $1 $3 }

callparams :: { [Exp] }
           : exp sep callparams { [$1] ++ $3 }
           | exp { [$1] }

params :: { [(String,MType)] } 
       : mtype id sep params { [($2,$1)] ++ $4 }
       | mtype id { [($2,$1)] }

print :: { Statement }
      : id saida sep { Print (Var $1) }
      | literal saida sep { Print $1 }
      | id spoke sep { Print (Var $1) }
      | literal spoke sep { Print $1 }
      | exp spoke sep { Print $1 }
      | exp saida sep { Print $1 }
      | afound exp sep { Print $2 }

readin :: { Statement }
       : what was id qm { ReadIn $3 }

wnot :: { WhileNot }
     : eventual obr cond cbr because stats enought { While $3 $6 }

ifcond :: { Conditional }
       : perhaps obr cond cbr so stats aunsure { If $3 $6 }
       | perhaps obr cond cbr so stats elses aunsurew { IfE $3 $6 $7 }

elses :: { Conditional }
      : or stats { Else $2 }
      | or maybe obr cond cbr so stats { ElseIf $4 $7 }
      | or maybe obr cond cbr so stats elses { ElseIfE $4 $7 $8 }

cond :: { BoolExpr }
     : exp { Bool False }
     | exp bin exp { Bool False }

binoperation :: { Exp }
              : exp bin exp { BinOpr $2 $1 $3 } 

unoperation :: { Exp }
            : un exp { UnOpr $1 $2 }

ignore :: { Statement }
       : exp thoughta { Skip }

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
    | Conditional Conditional
    | WhileNot WhileNot
    | FunctionDecl FunctionDecl 
    | DeclareArray Exp MType String
    | ArraySetElem String Exp Exp
    | Skip
    deriving (Show, Eq) 

data Conditional
    = If BoolExpr [Statement]
    | IfE BoolExpr [Statement] Conditional
    | ElseIf BoolExpr [Statement]
    | ElseIfE BoolExpr [Statement] Conditional
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
    | String String
    | Var String
    | ArrayGetElem String Exp
    | FunctionCall FunctionCall
    | SizeOfArray String
    deriving (Show, Eq)

data BoolExpr
    = Bool Bool
    | Exp String Exp
    deriving (Eq, Show)

parseError :: [Token] -> a
parseError t = error (show t)

tokensToString :: [Token] -> String -> String
tokensToString [] s     = s
tokensToString (x:xs) s = (tokensToString xs s) ++ (show x) ++ " " ++ s


}
